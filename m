Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E9ACC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 09:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iP74rJJgROBlr/WIZov21PSFdQFbjejuxUI2DRgPxFE=; b=KgVzxKPFI1FYOlY9Y1bCH2AfXK
	0cUMxaDN4vzm0gJuJD301pQqPcJLb960X10/MFsP77b6M1zqHqemZb+YC2Cywr5fEgtMJEu0Bbogi
	vR0zJ5k4GGi5RTAgTZzTOJjME5BvFD5LGcRmXzzRs6kIJUtFyEQ8niV3Hwju0nzGFY6d34ziM1cTO
	AOzE532D0jKF1XBtcEpCtkQ3qV+42SnR/sdC0mo+YKocTwoafrbWei/M846DwMe+u+rRr/E84PFip
	0ZgzEGH5tlFJkzqZmA3hx2Vy9RYds/FP6G5ppU2vt1Vb/zIS81pL+k/AFcLu35VQ6zB7SatGJQnkL
	v4LH/d6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmrMB-0000000Gbwi-0RBK;
	Tue, 25 Feb 2025 09:36:03 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmqsS-0000000GVWM-47Xm;
	Tue, 25 Feb 2025 09:05:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740474319;
	bh=fhAvNwf3S/C3P4S0nP2ZiO1M1JWrZ+3nKs2jQvYh0EQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=eyAPlUtCpHNl0RMIgAneO5Y+Jth+DkR1empGojPRixoK/bjWcItLCwv4Y7KT3XtYx
	 RvNIjzh79Gnfgyj8TwZCT6fBNcWin3+3aEIsq1Ea53aeomgA6t4Af61ApJdoWxsEha
	 VaOc0xpSIv6E0W1zbcV4/k+H4sjXwQgX92OEAns7O7L/OBOHkeX3Et7uaFrRKxGWTn
	 IOx8tXxxN+h/9hKHGewICb0I8c/W81ZwMfJiQYDJPdxHMitb9uiVFuvFmUUEggFGRn
	 mLl7P+p0skSOtQgW5EIYMKsTUOZazgS9P45heSwpi0v4n5+c5fgr5+Tin9YbNu5UzQ
	 zbyqHA65ZH9GA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E561517E0B63;
	Tue, 25 Feb 2025 10:05:18 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: shawn.sung@mediatek.com, fparent@baylibre.com, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, pablo.sun@mediatek.com, 
 kernel@collabora.com
In-Reply-To: <20250212100012.33001-1-angelogioacchino.delregno@collabora.com>
References: <20250212100012.33001-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v1 0/8] MediaTek mmsys/mutex fixes and improvements
Message-Id: <174047431886.20024.8850797193074768931.b4-ty@collabora.com>
Date: Tue, 25 Feb 2025 10:05:18 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_010521_195993_327BE874 
X-CRM114-Status: GOOD (  10.23  )
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

On Wed, 12 Feb 2025 11:00:04 +0100, AngeloGioacchino Del Regno wrote:
> This series adds the missing DPI1 SOF/EOF to the MT8188 mutex tables,
> required to support output through DPI1->HDMI Transmitter, and also
> adds a few fixes and improvements to the mtk-mmsys driver and tables
> for all SoCs.
> For MT8188, in MMSYS, this adds the DSC path for the display
> controller, and fixes the current DPI1 one to actually do something
> meaningful... and speaking of mmsys....
> 
> [...]

Applied to v6.14-next/soc, thanks!

[1/8] soc: mediatek: mtk-mutex: Add DPI1 SOF/EOF to MT8188 mutex tables
      commit: ecb051fd99dcda50a9b93fa6e9399094b37488f0
[2/8] soc: mediatek: mtk-mmsys: Fix MT8188 VDO1 DPI1 output selection
      commit: 643ec3e1e2d070fba8f94dedc702211f501889da
[3/8] soc: mediatek: mtk-mmsys: Add compile time check for mmsys routes
      commit: 650de00b6b9c5690c6c3e8474d431f59a6f89b0b
[4/8] soc: mediatek: mt8188-mmsys: Migrate to MMSYS_ROUTE() macro
      commit: ba7877ba5353f0a2e8f15151e8053647eed5ad5c
[5/8] soc: mediatek: mt8167-mmsys: Fix missing regval in all entries
      commit: d0202d007a27ecea8c609f55d8757d75b521ea5b
[6/8] soc: mediatek: mt8365-mmsys: Fix routing table masks and values
      commit: 773140aa314218ba92ee4d69956f2813f593216e
[7/8] soc: mediatek: mmsys: Migrate all tables to MMSYS_ROUTE() macro
      commit: f9435e9c1a0c579db4edeb32f8fb317fb721c659
[8/8] soc: mediatek: mt8188-mmsys: Add support for DSC on VDO0
      commit: 89ef9bb1ece1a70bb79715be48a5afece39cae44

Cheers,
Angelo



