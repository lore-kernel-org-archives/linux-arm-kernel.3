Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87CF1CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 09:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=00JJC95eGA+9HiqS1iD9cIi+d8wa3H1eHI7M7UBEhDw=; b=vF6FN/ZiPdZfAT/v1avn02J69G
	//4qpMlgwskU88A8HaMY3yVZSmuZrJ9nfEBrNtNnEa7T+vI5i2FxLYyJdBmw7KMFFOfFGcldyZbTs
	yN4OqsO2KDHBF7YeIKsYfrMd9bfLUKNn7FLvFb2bqCLqHYcjqF6VP3Ag88tz6bTRiEl9AWAMtPxAH
	iqX7RnIK6YHXjmhZCRkBd06Ys2g+/AFqBz8OOm4u5R90dTDX8D7KoT9+hzZ01wEGe1Xx63ufFpKf6
	rBl3dTl9/bocrGAUDV5XvEviZpQSstJ0BgDFRv0+8FBD0kZDY1j4K0j1j3SbSoHcodu/pE2QMFqor
	v9zl1vuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux0Qg-00000008OTT-07TP;
	Fri, 12 Sep 2025 09:50:54 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux0Qa-00000008ORM-2lzj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 09:50:52 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58C9okDc1008505;
	Fri, 12 Sep 2025 04:50:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757670646;
	bh=00JJC95eGA+9HiqS1iD9cIi+d8wa3H1eHI7M7UBEhDw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=k7dEIi2oy/7V+x016xrssKCDh0D/Qq8H6awn2f4qhmk8DWiJ2/TtAM+AK3fRUBZ0q
	 Gm0zT6uPrCMkJRalRJShu56NVfGuOG6znYSRb1e09f6hLeW5oLklFw/Km7Fm+dZLpW
	 DB0mtbIJ/gl3onBiaZl6c7FxWpz57CF3RNaJShw4=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58C9ojBn1895129
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 12 Sep 2025 04:50:45 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 12
 Sep 2025 04:50:45 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 12 Sep 2025 04:50:45 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58C9ojIl3414296;
	Fri, 12 Sep 2025 04:50:45 -0500
From: Nishanth Menon <nm@ti.com>
To: Judith Mendez <jm@ti.com>
CC: Nishanth Menon <nm@ti.com>, Moteen Shah <m-shah@ti.com>,
        Vignesh
 Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        Andrew Davis <afd@ti.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 0/2] Remove HS400 support from common
Date: Fri, 12 Sep 2025 04:50:41 -0500
Message-ID: <175766786999.26286.12984291959565660129.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250908235207.473628-1-jm@ti.com>
References: <20250908235207.473628-1-jm@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_025048_794442_081C42F4 
X-CRM114-Status: GOOD (  15.03  )
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

Hi Judith Mendez,

On Mon, 08 Sep 2025 18:52:05 -0500, Judith Mendez wrote:
> Since eMMC HS400 has been descoped for j722s due to errata i2478 [0]
> and is supported by default for AM62Px device, remove sdhci0 node from
> common-main.dtsi and include instead only for AM62Px in am62p-main.dtsi.
> 
> Also, update the STRB value for am62p eMMC sdhci0 node.
> 
> Tested on am62p SK board.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/2] arm64: dts: ti: k3-am62p/j722s: Remove HS400 support from common
      commit: 7efc354b7fe1ac5e874d0188b3d6be88a3fa0fe4
[2/2] arm64: dts: ti: k3-am62p: Update eMMC HS400 STRB value
      commit: 9fdcc5f98141cf2f77e8778bee830190d7b71ced

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource


