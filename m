Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA98AD33990
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 15:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XXoTPcPAuC4Or5OIrxCOXJyNM4EicI650U4SepBZM7c=; b=S7S8VDS/W8OmA1Zi7RevWxbkZQ
	nIavBFRg74JjGEBkGVLJIhZEaMZXhkXC1slVoOllRRa7x2XgeoZNsyxwbSOUhoW2r5sx3xNLCktpt
	4ks/h+xM69jkGzbCRaD65dsJJI9PJjx4nZ0Sh2acuAzK+xGD5NG6MCDiaC4ON/FgvoXy3V8Eg3pbr
	ps2J+kWk4eoZ8Q/gaDMzxM2f75lrGXhbi/hHqn753eXgaG0K+5OCy4PO7+caxP4q4NXCpIMtTJeP5
	O0aaIPLDFpBHzA4b54iwAhgLybAyP/mTi+1d7AQsyYySyQqWsVfWptVwGLDSUMhoca5YQC6fNpi12
	CXXdpVKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5RtP-0000000BLhe-1kXZ;
	Mon, 28 Oct 2024 15:42:55 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5RKm-0000000BFU9-07Yi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 15:07:11 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49SF73H2024330;
	Mon, 28 Oct 2024 10:07:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730128023;
	bh=XXoTPcPAuC4Or5OIrxCOXJyNM4EicI650U4SepBZM7c=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=zTWgVyui9g0HfxoMLjVcXI/XyGYTr1TGL32EDlT+Rmihq90/3QP0//Cf+PFPsp1Ap
	 EEcfWzbpdbUVTzhONbfMXJvGttLpKc4Wq0ymy+eqMzqkki9M39lpZ7eL1z16oFETUn
	 KMHLUNAvZo4Hqg37XpvZt7AECAk//mqoPrEhNd4k=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49SF73H3051581
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Oct 2024 10:07:03 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 28
 Oct 2024 10:07:02 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 28 Oct 2024 10:07:02 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.227.94])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49SF5tcp129665;
	Mon, 28 Oct 2024 10:06:59 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "Siddharth
 Vadapalli" <s-vadapalli@ti.com>, <mranostay@ti.com>,
        Andrew Halaney
	<ahalaney@redhat.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/2] arm64: dts: ti: k3-j784s4-evm: SERDES0 lane cleanup
Date: Mon, 28 Oct 2024 20:35:21 +0530
Message-ID: <173012710985.558239.2190537617884915440.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20240710-k3-j784s4-evm-serdes0-cleanup-v1-0-03850fe33922@redhat.com>
References: <20240710-k3-j784s4-evm-serdes0-cleanup-v1-0-03850fe33922@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_080708_200669_3D221AC1 
X-CRM114-Status: GOOD (  13.03  )
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

Hi Andrew Halaney,

On Wed, 10 Jul 2024 10:36:12 -0500, Andrew Halaney wrote:
> This fixes a splat caused due to overlapping lane usage of SERDES0 by
> PCIe1 and USB0. It also cleans up the dts a hair to be more readable.
> 
> 

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/2] arm64: dts: ti: k3-j784s4-evm: Assign only lanes 0 and 1 to PCIe1
      commit: 84f78178b6fe37b5eb8b90b5bb1239abce0b64d8
[2/2] arm64: dts: ti: k3-j784s4-evm: Consolidate serdes0 references
      commit: cc5049007d722364bca4a4eeb619d5629733a004

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
Vignesh


