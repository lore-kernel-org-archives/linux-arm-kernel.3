Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11EF4C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 08:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pO7tTO1rV95NIoQMWhWLdGMcS+ijoaLqtx251avqfLs=; b=iaOc36nmnZTnt+exFlx1S9r5Sh
	voCCHhkymDuBj2vNOpJbQdC56qa27z6bcS5c7hCml3mgB+IJpq/mRV9DGhHuWDzjTAwvHfX9FPGh2
	L5M2L1+Z3vkY79UsE0fmpClScw9KwZD39t6ThTXGt/IOFQc36VaHhX4v37aU8LwfQmXi6OoPIwYcx
	hHo8bvPR7KTWZg/QMqWUgvib8vFsuyM/pu/nB6KCJIhPGBojDxBwm9nf9F75vNmwrDOHbbghT0PMP
	oJJDj6xp2iGMFHclePljoLW55dh+cyEAHb3fp+cdibjfVupO8c1/v41vH4X2J2NZNIgr+0secZjAI
	A4WdR9Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt0Cd-0000000DQCz-42wm;
	Fri, 14 Mar 2025 08:15:35 +0000
Received: from out-171.mta0.migadu.com ([2001:41d0:1004:224b::ab])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt08E-0000000DPD5-3o8O
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 08:11:08 +0000
Date: Fri, 14 Mar 2025 01:10:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1741939858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pO7tTO1rV95NIoQMWhWLdGMcS+ijoaLqtx251avqfLs=;
	b=kFiYHKvFgG2Jjgo9l3Rdp1qidd2k9Mv7b/wF/TKi73ClvF+zfwzJn3EIbeGIuVKkuoOjHJ
	uZhkeU9N0XONZQDPvyXiJxn1Ce4rR6QlheSzBz/g1OXa9P6wgVN2ciaZ70+MYt2q+o5Zxh
	zvp3pp+6WtTaaAP4I8APYTnMXLq3I5A=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Andrew Jones <andrew.jones@linux.dev>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, devel@daynix.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v4 0/7] KVM: arm64: PMU: Fix SET_ONE_REG for vPMC regs
Message-ID: <Z9PkchMNGN1cdLgJ@linux.dev>
References: <20250313-pmc-v4-0-2c976827118c@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250313-pmc-v4-0-2c976827118c@daynix.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_011103_720410_46E8D019 
X-CRM114-Status: UNSURE (   7.18  )
X-CRM114-Notice: Please train this message.
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

Hi Akihiko,

On Thu, Mar 13, 2025 at 03:57:41PM +0900, Akihiko Odaki wrote:
> base-commit: da2f480cb24d39d480b1e235eda0dd2d01f8765b

I don't have this commit, what did you base this series on?

FWIW, the patches do not apply to a 6.14-rc* and seem to use something
older.

Thanks,
Oliver

