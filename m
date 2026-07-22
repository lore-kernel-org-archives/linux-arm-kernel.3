Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63188C4453A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 22:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uALfsnVQg8EwLlwruYdnt6VT1Gr/pSMJms8jCK3upC8=; b=RppryV8mlq2Q4fwzssk62DLtCZ
	HiD3T0YfnL5r/1Qj4AQQvjwpgZ5stS8ErwZdSv21/mCLQxEHKy6dNMcWJ/k5rgK9dMB/SPLIVxf/R
	Gt7nKCn14ki9GtQkFrl0n1DY/tGGgKpW5+3cFs10wz5UqUzZSHuC8M9MaexASby0KQP2cgNGuUYGK
	iGEn02Igtl6k6eMA1D9rzBsKjWUChw3PWjgV253NVpFdqTW+5vkaDHkULnWXFRZfaDVtOqWA54NKx
	16BuKmvD6JZ5CkD7Q3guDYdRlOhl7VErs3OcisQJko2srZHVIjI/oMdGk3+UAPdOWHbjnEWoQwm1v
	JczvBkKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmfo2-0000000CvOj-47ME;
	Wed, 22 Jul 2026 22:52:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmfnz-0000000CvOD-2OXW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 22:52:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D4A65168F;
	Wed, 22 Jul 2026 15:52:41 -0700 (PDT)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D99153F86F;
	Wed, 22 Jul 2026 15:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784760766; bh=QmneknWzS97mS/IfrDJ7YAopaBp1cn95q6dBpkiUOPg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mdDaGaZnFAiUJx7LKS6ZbGO+gz2G39fzwP9q3Nn7FL/LDfb1CUZhHBFkMShVoiF9w
	 g4Q9Gb7KhcQHtWSNXhd8ZW3o1kNZS04ExsaZf4+KcBZAjgmjkNjKGIltPhxaS3Te6A
	 bH+JBHF+6gP6rt+RNW9cOu4TJmoAqkV6cTfWXOFU=
Date: Thu, 23 Jul 2026 00:48:56 +0200
From: Andre Przywara <andre.przywara@arm.com>
To: Enzo Adriano <enzo.adriano.code@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Brian Masney
 <bmasney@redhat.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Junhui Liu <junhui.liu@pigmoral.tech>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: sunxi-ng: ccu_mp: fix clocks without P dividers
Message-ID: <20260723004856.55158e84@ryzen.lan>
In-Reply-To: <20260722173714.2394348-1-enzo.adriano.code@gmail.com>
References: <20260722005643.1208942-1-enzo.adriano.code@gmail.com>
	<CAGb2v67GDBTq8vdxNxBfNVSe=oStcgaJzm0ig2WAEXNQSkVa1g@mail.gmail.com>
	<20260722173714.2394348-1-enzo.adriano.code@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_155247_662143_39979793 
X-CRM114-Status: GOOD (  13.33  )
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

On Wed, 22 Jul 2026 13:37:14 -0400
Enzo Adriano <enzo.adriano.code@gmail.com> wrote:

> Hi Andre, Chen-Yu,
> 
> Correct, this was not tested on hardware; it was build-tested only.
> 
> Thanks for the review. Chen-Yu's point is right: these one-divider clocks
> should use the single-divider clock class, which already supports
> CCU_FEATURE_UPDATE_BIT. I'll drop this generic ccu_mp patch; there will be
> no v2.

But there clocks that use a _MP_ initialiser with width = 0, both for M
and P. Which leads to GENMASK(-1, 0), as you mentioned. So we need
patches to fix: to convert the HSTIMER clocks to use
SUNXI_CCU_P_DATA_WITH_MUX_GATE, which is a pure div clock that doesn't
have that problem. Same with the r-timer clocks in ccu-sun55i-a523-r.c.
And there is mbus, iommu and dram that have no P.

Are you going to make and post patches for these?

Cheers,
Andre

> 
> This analysis was done with AI assistance and each finding was checked
> against the cited sources.
> 
> Regards,
> Enzo
> 


