Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C24C55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 13:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L8jsxfD1Sng44V4oHYHFMOll9m0IRlIZD/U2bbjbvA0=; b=HuM4z26UkUOX0xJGh5aelLdoC4
	LrqI76rsPpQVjKa16wPTVh2PoMq0fdU5HZKu5ZU3BRh/T8u63QW5Cj663tWW6Godb4s+rJB5khqUU
	6CZFxS67A/nzx2/u0xZUaadOSGv6EwJvAC9gXMjtYqyb5ElG+smUtKwHG4GNR05T4zwXwDNMzndpA
	2vCf6OTovVZsiSY9NogfKoPQzhJHB8qTSO3RVNJioZBTWHPJX2GUrqsKaouZW0t8HhHT1PapjH922
	J+B6dCLXeP5XpJLmNmlNZYg5o1wEn+HAikoCbJI/MJ+lf6bqwp+wkjg9Swct1T3dmdFA94UTNQxeB
	+Pi3Tpqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wry8Y-00000005uD9-2wIk;
	Thu, 06 Aug 2026 13:27:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wry8X-00000005uCt-2Z0P
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 13:27:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 93C6540A6C;
	Thu,  6 Aug 2026 13:27:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE1BB1F000E9;
	Thu,  6 Aug 2026 13:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786022872;
	bh=L8jsxfD1Sng44V4oHYHFMOll9m0IRlIZD/U2bbjbvA0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=J35RsWNO40WhRirfC4WcVvW5ghJyxSAX71JiGDqce+d+8AkrtuC6ZmPA6y+5FuIJL
	 /PDtJaOCbERk9CmXTpgn64dIN3MnmtiQzLrwRcF7wTYs1tygWTm1Es4mpj7+2zvgPL
	 C1qfkogW+m76wu764tELCSFgxscsodb00mLqki/5CcBWeGVaUIiA2oMAlooJ42WPJY
	 GR5585zJCh/8BAdxmpNTCW+/C0WeHxLXdBrgUzYvejZOUmymnGsy95dOl0NVT2uzRy
	 rjD7zRJr3on3sSikI4aNtenceu7Mm+sKJA/0L+CyAjR0PikxHRMOARhlcLmHnEj7u6
	 gVf7xyVFnnLSg==
From: Lee Jones <lee@kernel.org>
To: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
In-Reply-To: <20260719-b4-macsmc-be32-fix-v1-1-c7b1936307fa@kernel.org>
References: <20260719-b4-macsmc-be32-fix-v1-1-c7b1936307fa@kernel.org>
Subject: Re: (subset) [PATCH] mfd: macsmc: Fix key count endianness
 annotation
Message-Id: <178602287064.2920636.6724369399863023902.b4-ty@b4>
Date: Thu, 06 Aug 2026 14:27:50 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
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

On Sun, 19 Jul 2026 15:00:32 +0200, Sven Peter wrote:
> SMC firmware returns the value of the #KEY key in big-endian unlike most
> other keys. Reading it through apple_smc_read_u32() into a plain u32
> and then converting with be32_to_cpu() makes sparse complain:
> 
>   drivers/mfd/macsmc.c:462:26: sparse: cast to restricted __be32
> 
> Read the raw value into a __be32 using apple_smc_read() instead.
> 
> [...]

Applied, thanks!

[1/1] mfd: macsmc: Fix key count endianness annotation
      commit: 0a29aa605286bcd01632eb6b61f59b9053312347

--
Lee Jones [李琼斯]


