Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC4BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 16:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x0PwWqtcyn2/6E4eEseLcM333EoFnqx6s644DAGx7LE=; b=kT8Ltx7XaUFRGYV5Sjvk+/gv41
	6VzEUhpCO/wBDkxnZtEQ/mi5ozYc6BkFs3t2NBD9/1vMDk7aYt3IaN5Cgxx7c8B2RIHb5gz5F9pqk
	XVjvC3kHtmaakFrGJQjTYxm9gqvX6yhnrYBEnVeXXWBhN6Yjy4UE+LDSIEhKL0BWiF8ybr3A5uy1w
	l8loOF35Ph6d0J7zDffdWCTsD0u5/wc0EftIROoLUEnb5z69xYucXW+SIHkn1KkANCLB0lINsqvxi
	V1I92KwTEBsX42SDP2qXMske2qPo74dlBwK2n4ESloC0ADLuACKYAa6iTv3OV5SShtXtWx9N50hqC
	xOaLLd0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1webVv-0000000HUqm-42c6;
	Tue, 30 Jun 2026 16:40:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1webVu-0000000HUqG-2IBX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 16:40:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1CBDA600FC;
	Tue, 30 Jun 2026 16:40:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 025451F000E9;
	Tue, 30 Jun 2026 16:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782837644;
	bh=x0PwWqtcyn2/6E4eEseLcM333EoFnqx6s644DAGx7LE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=n7K7bTofzOYBPmwN7oy/xRHqgYXW6lxFGNVlIlmKhfwEkfLcCvSEARhIpD+zRq0th
	 UO+8AF1Ms1ja3JAvJG3vK6ifAu7ZY4LaCK+0hHwfTZwMx0035w71+uQh0l3T0A4VvI
	 z0tHptz80kjlwsz96JBJFDZeXTar1SfQwsZT5+35JmVCcN6ep47VXxTsCAZL10NUOj
	 7p/Ea04gOutRAaZT5LvK3DYgRrjDf7YZXDQD89gBlZ6LFRTybpjUqHh+ull1xQ2C57
	 wnKTWP0so2nETmRx24dwFNqFb6gvu509OhiH//Wel2zEdp9j6pMJ1w/7ZWM3AjgJG6
	 9nGh/mrDB+lLA==
From: Thomas Gleixner <tglx@kernel.org>
To: Kemeng Shi <shikemeng@huaweicloud.com>, maz@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 shikemeng@huaweicloud.com
Subject: Re: [PATCH v3 2/6] irqchip/gic-v3-its: Fix its node leak in
 gic_acpi_parse_madt_its()
In-Reply-To: <20260623020135.3584-3-shikemeng@huaweicloud.com>
References: <20260623020135.3584-1-shikemeng@huaweicloud.com>
 <20260623020135.3584-3-shikemeng@huaweicloud.com>
Date: Tue, 30 Jun 2026 18:40:41 +0200
Message-ID: <875x30q8vq.ffs@fw13>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Jun 23 2026 at 10:01, Kemeng Shi wrote:

> Fix its node leak when its_probe_one() failed in
> gic_acpi_parse_madt_its().

Lacks a Fixes: tag as well

