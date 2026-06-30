Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42A67C43327
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 16:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7935vxdEENre2njdS5MHhz9n4M3JQ0ueZvpzmZx0Dn8=; b=pgoRTYarordwoZpvsRmfH2qlxs
	uMwlBfyk89Xzym/xAeEAgajBlMrTAhjnuYMJJVXa5e1QXdteMHdLzmIUkWOB3iIQiA2z0i+Zsm3/6
	KWAcI2ZUx2Bhe6l0dn1e6MNM85S9AgV7xzxwV889q+OnkS3t5aTibueg9S0XDZBHSJe2oL24GtiVN
	i6ochN0GGKFrxLFJK4kLwCvsg57YGjNkPO2klMdrBxbn9mvYXrh8p+OLCTpqCgJInB6roWxJocyWH
	SlY4fvI9jKuJvYGHaDBm1giBp0XeJSsYfNiF5wqfqQ9UVA686MY6YByOdMm39IIHYz6OZG4y7w0CU
	K8+i5QwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1webXX-0000000HV9t-0gN1;
	Tue, 30 Jun 2026 16:42:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1webXU-0000000HV9K-3hxj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 16:42:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A0E25411D2;
	Tue, 30 Jun 2026 16:42:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B151C1F000E9;
	Tue, 30 Jun 2026 16:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782837744;
	bh=7935vxdEENre2njdS5MHhz9n4M3JQ0ueZvpzmZx0Dn8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Wb7kkpU882iEL8yZLdT7N2A0Yt8Z6dYqACWKj6KNrWC2UseK1Vb0Y6rpfwN27xlqX
	 Fyejpb1vH7RmqTgWliAMLZ+srJPSy0yF76QCUpkGA8m0VwDXRehuTBrPgXee1usYyn
	 BCuECVd5mpkK0f4tlLzGM7pvZGefMhU/PxXSDTw+dw8/jGK84PT2LcLfzT06UIq7wK
	 YD0LLpJj7TD66UbpjBM+LpFThrOIf1TqJjUCCtmFrjswpcs4ao9NZqnLBXd2YQU3mX
	 zUP/3TWSGGCL/zxmWWp80NOV5PnLM0MwVi023nDQuvig3iV6VvM2bqMete6ZYHrJ0M
	 IDXhJVufVeZDg==
From: Thomas Gleixner <tglx@kernel.org>
To: Kemeng Shi <shikemeng@huaweicloud.com>, maz@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 shikemeng@huaweicloud.com
Subject: Re: [PATCH v3 3/6] irqchip/gic-v3-its: Fix leak in
 its_vpe_irq_domain_alloc()
In-Reply-To: <20260623020135.3584-4-shikemeng@huaweicloud.com>
References: <20260623020135.3584-1-shikemeng@huaweicloud.com>
 <20260623020135.3584-4-shikemeng@huaweicloud.com>
Date: Tue, 30 Jun 2026 18:42:21 +0200
Message-ID: <8733y4q8sy.ffs@fw13>
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
> We miss to teardown the vpe when its_irq_gic_domain_alloc() is failed.

We miss nothing. Change logs want to be written in passive voice. It's documented.

> Just fix this.

'Just fix this' tells nothing and is just a sloppy pointless phrase.

Lacks a Fixes: tag as well

