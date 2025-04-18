Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 880CBC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 19:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4B+kMbheGPM4KNTv8XPLuJ0eMWorUwyuLFrUknty9MY=; b=ElaySBUsWhRZ3DSfJajkVLOqPd
	AJAX0uj76Qm/HBx/nKJMb8vp5x8pleb2+n10dxCwUUcjIc8GAiDqivJeWAMX0IADurbEA0MnxN1LB
	GNLsXVUgws/PvuS8ACINgdBGby7VLaWHRhxL7M4CnPmMvZXyE6Keo+k4w0zUFndLWzlah46g1Irlt
	hLRbKexItheZpFDKhEn/whH/7Pvgfi9uhbyBuww16TVuYQDG40cPaZ1X3NR5CCG9bBYoXep1Yr8mc
	Z2Fa+foeoKwZXHKuWBuoweoKncBYtqwZkLGjUHOHo24j/1qUHyPshXvILWjtEZVf8+BLDiXjHAaGF
	H1TQmGfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5qzP-0000000HY2I-3T8P;
	Fri, 18 Apr 2025 19:03:03 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5quT-0000000HXA0-2iKL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 18:57:59 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53IIvqU01001118
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Apr 2025 13:57:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745002672;
	bh=4B+kMbheGPM4KNTv8XPLuJ0eMWorUwyuLFrUknty9MY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=MhInK9Amd8dP2fop1tuGqjlvD9gwnSo2mFwCJdxRduGAgTIoVX31Bee1H8iN8TeF+
	 17ySwd3L9fryHK8giOJneRk7kdpUFOdyJ+q8JYtusEmOlFDsYQNoxMsTVx3ZLxUTD+
	 iceTdip84mVSp6uc+V0vsuHYZ+VWo55JuzqczBNE=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53IIvqcl113576
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 18 Apr 2025 13:57:52 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 18
 Apr 2025 13:57:52 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 18 Apr 2025 13:57:52 -0500
Received: from localhost ([10.249.36.23])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53IIvq9j117628;
	Fri, 18 Apr 2025 13:57:52 -0500
From: Nishanth Menon <nm@ti.com>
To: <vigneshr@ti.com>, Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
CC: Nishanth Menon <nm@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <vaishnav.a@ti.com>,
        <jai.luthra@linux.dev>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>
Subject: Re: [PATCH v3 0/7] Fix dtbs_check warnings in CSI overlays
Date: Fri, 18 Apr 2025 13:57:50 -0500
Message-ID: <174500265898.95535.4453778649749724956.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250415111328.3847502-1-y-abhilashchandra@ti.com>
References: <20250415111328.3847502-1-y-abhilashchandra@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_115757_783118_DA7CA86D 
X-CRM114-Status: GOOD (  15.82  )
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

Hi Yemike Abhilash Chandra,

On Tue, 15 Apr 2025 16:43:21 +0530, Yemike Abhilash Chandra wrote:
> There are a bunch of new warnings generated using CONFIG_OF_ALL_DTBS.
> This configuration applies DTB and overlay together to generate test DTBs,
> which are then validated using dtbs_check.
> 
> This patch series fixes all warnings related to sensor overlays on
> jacinto platforms and a few minor warnings on sitara as well.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/7] arm64: dts: ti: j721e-sk: Add DT nodes for power regulators
      commit: 97b67cc102dc2cc8aa39a569c22a196e21af5a21
[2/7] arm64: dts: ti: am68-sk: Fix regulator hierarchy
      commit: 7edf0a4d3bb7f5cd84f172b76c380c4259bb4ef8
[3/7] arm64: dts: ti: k3-j721e-sk: Remove clock-names property from IMX219 overlay
      commit: 24ab76e55ef15450c6681a2b5db4d78f45200939
[4/7] arm64: dts: ti: k3-j721e-sk: Add requiried voltage supplies for IMX219
      commit: c6a20a250200da6fcaf80fe945b7b92cba8cfe0f
[5/7] arm64: dts: ti: k3-am62x: Remove clock-names property from IMX219 overlay
      commit: c68ab54a89a8c935732589a35ea2596e2329f167
[6/7] arm64: dts: ti: k3-am62x: Rename I2C switch to I2C mux in IMX219 overlay
      commit: 7b75dd2029ee01a8c11fcf4d97f3ccebbef9f8eb
[7/7] arm64: dts: ti: k3-am62x: Rename I2C switch to I2C mux in OV5640 overlay
      commit: b22cc402d38774ccc552d18e762c25dde02f7be0

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


