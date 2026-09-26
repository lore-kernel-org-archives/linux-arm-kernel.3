Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA028C9831E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 05:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=frP9cwfXZdz8eO3e4ZwyLEzkE+nCZQAWARGxvCfxCYE=; b=GrdmUym4BCvykQX+pvEAjpGy9Y
	HrWbu7pfev3zzYB+qGEiOSF/NVNFcU5ohedNr24omqabSaLRNFJ5/R7Hb4zSeY9Nyamre+PwEQkki
	GhKqx36Se3+jjJverj3PxAVr81RKpGIVvkr+OgxxfIwRK7DVVTZXgRGNgLIYIbPEyWa99uklBhtT8
	REHuQ79FY4iOWjzEBMJ5XckE4seOUOFGGK/j05D6OmrvpTOIMb7k2tplb/Xq7r9K6dM9Zmk38OfoD
	DdvNUjpEL3NUBZDzyqGn1ps8uv7ILQLyoWEDYqgOs6LKVE0RnIB5vHI2NxQ2k+Y+OGjgA4lrodJAa
	hMI9hhJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAKuo-0000000F1U0-01bU;
	Sat, 26 Sep 2026 05:25:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAKum-0000000F1Tc-06ii;
	Sat, 26 Sep 2026 05:25:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A24984365F;
	Sat, 26 Sep 2026 05:25:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4C761F000FF;
	Sat, 26 Sep 2026 05:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790400335;
	bh=frP9cwfXZdz8eO3e4ZwyLEzkE+nCZQAWARGxvCfxCYE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AEnjdFuF1jOT+nx6DQR7j+yh9ZBD9x33dJhOUVZ+2Vv7b2hN3K9x2Rc60hWHNAId3
	 MOHJFl4LjpzhffKJFtq2pGWEqcLwkFdknomuAU+EPhsMmnDOtvC2k93Saw/EzaOHV1
	 OpeDv30tnY2kdM+AxbBDUbmhr8DM2zfzHWMhGoQbtPOCJ4crHB9QsDk4St7TLv8Pi1
	 JTofkmFzpsaxdrjDBEcscjGJEdqKwa4SztC27jXr/q5X9TcDl9ESPciXJPVSGCm6hu
	 Rn9y/ork87F0LuB9KsdAA7slFpm7rqaDbcyy1VFkKHm1WHr0c1DWGAJddBgIaleQbm
	 2BPQnt5eZipAA==
Date: Sat, 26 Sep 2026 07:25:16 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Zhang Yubing <yubing.zhang@rock-chips.com>, Frank Wang <frank.wang@rock-chips.com>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com, 
	Sashiko <sashiko-bot@kernel.org>, Igor Paunovic <royalnet026@gmail.com>
Subject: Re: [PATCH v15 11/11] phy: rockchip: usbdp: Only enable USB3 when
 not in high-speed mode
Message-ID: <h7rddelztl3m3abqplfeir6irsctem2gqq4tl67gobpwa3upxg@uutr75zkg73h>
References: <20260915-rockchip-usbdp-cleanup-part2-v15-0-8d507cb1174f@collabora.com>
 <20260915-rockchip-usbdp-cleanup-part2-v15-11-8d507cb1174f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915-rockchip-usbdp-cleanup-part2-v15-11-8d507cb1174f@collabora.com>
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

On Tue, Sep 15, 2026 at 05:06:14PM +0200, Sebastian Reichel wrote:
> Ensure that USB3 mode is not accidently enabled during PHY re-init
> for systems that are configured as high-speed only via DT.
> 
> Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/message/20260626212424.C215E1F000E9%40smtp.kernel.org
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

