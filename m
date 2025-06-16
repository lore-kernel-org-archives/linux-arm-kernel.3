Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C914DC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 18:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1rJNgqaMLZojufdkLLC2TSDiKnw6++x1dh3rgQu+A1Y=; b=NE2UgGOZafMbksRNlsy908jiZy
	wBQpJa5TzrX+J/mys+6uxMvQzrmf7ISxqyJb2NX/iDQDVDkRv9c8eU/jP+i3Xld4diXBs99zBsuUz
	0df5o5PEGTBu7thL1ee2hAWeeSJyL1+dsI/muNBBFtEUtTKlfPobsii1e2ELAVnyMhmNgVpfaG//7
	S7BAvgyDMWZrtGSiFKNZVdJvT6Clga8YRgyAg3kWkki+vJpVNgeZsZNc7BOoYgRDpndRUn7jJQ8IG
	UDQBeDXXb6Zt3PSgOZek3FxBHtk0iPIRTDrJcq3V+gUKsZCCam3L6yhvL/WBHf48j/w9NTcAoF2Y8
	7ivsoyWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uREae-00000005Eo2-2D4R;
	Mon, 16 Jun 2025 18:29:52 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRDgl-00000005843-01SY;
	Mon, 16 Jun 2025 17:32:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F3E69A519ED;
	Mon, 16 Jun 2025 17:32:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB8C4C4CEEA;
	Mon, 16 Jun 2025 17:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750095124;
	bh=JhhJGBA0/EyCx0gmSsYbnWwP9wMBDp+1SBs2G2GCX+U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NQeYAeim1RStu+++zDlxFdavXDpAzRYyIHZA3H2A8SwtUkb4btg9tx4jMeY5Xvxtu
	 gF2+49nlI76HJThhBlPtfVEhv0rBOR/1Yq1BwcQBvH2NoqCXQNF90FrgM2wtdXcq+b
	 aZm9tV4+T2pIuuwPHtWDHuQEmWbPusm0dVd6Us5EkDTS4b7h+XSCGxG10rD6jQjaN9
	 coIZ5Lku6YoLQcbYLgOECKtzzjN3AQtfzLPrMr0ECe5T/2wBd4Wv7HkE2Xn8FgBUfa
	 ZEobo8pBe3PgdZ1bfh3EfHIDVTmvRxNttZTgUGGy4sZI8BleNfYSTt2bQXj4sULJeP
	 L+9OKspNU4YCA==
From: Vinod Koul <vkoul@kernel.org>
To: kishon@kernel.org, sjakhade@cadence.com, rogerq@kernel.org, 
 thomas.richard@bootlin.com, robh@kernel.org, 
 Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, srk@ti.com
In-Reply-To: <20240615093433.3659829-1-s-vadapalli@ti.com>
References: <20240615093433.3659829-1-s-vadapalli@ti.com>
Subject: Re: [PATCH 0/2] Enable PCIe Multilink and USB support in Cadence
 Torrent SERDES driver
Message-Id: <175009512158.77433.13273380062207072518.b4-ty@kernel.org>
Date: Mon, 16 Jun 2025 23:02:01 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_103207_119834_3C424FF3 
X-CRM114-Status: UNSURE (   6.73  )
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


On Sat, 15 Jun 2024 15:04:31 +0530, Siddharth Vadapalli wrote:
> This series adds support for standalone PCIe Multilink configuration
> along with the support for PCIe Multilink + USB configuration in the
> Torrent SERDES driver.
> 
> Series is based on linux-next tagged next-20240613.
> 
> Regards,
> Siddharth.
> 
> [...]

Applied, thanks!

[1/2] phy: cadence-torrent: Add PCIe multilink configuration for 100MHz refclk
      (no commit info)
[2/2] phy: cadence-torrent: Add PCIe multilink + USB with same SSC register config for 100 MHz refclk
      commit: 351e07e6b2ecc16ef8669713b14b6f67518c945d

Best regards,
-- 
~Vinod



