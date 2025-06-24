Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C4D3C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 20:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jCehJ/03vgXo43v5fdkPlxCVgkwl4XEINgeHUUIjpIM=; b=uYF7i9jsq5gTvAxC5cA3DT75nu
	ARQwHt0m+KjPJGvBdxEhkg+28ax6h16SHs7SeJ+3Qr1HLKXtZAKIieKdIgN1kir+EIRj+yfG2yxS2
	jX2FB0DWQxzaLuGu0n50W5P5KidDug+g46a7niHP/qq325bYKYT9yF1jOonoQgLmZC8AaxTxuPNCk
	B66cMs73F4PK1XoEdFWp2Gd8clxDkjbZfy3DKeGDQns/NeWR/Cl3bDZlKpJlXmRuFeb1sdmF2NR3I
	+of5ouUBIP2XLp8K3pIu7AHco5xk3WpbKM57rxtcIU4q5QTLGvME12lMQIRzixc16kjssxY486dhJ
	o5Q1FpIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUADb-00000006l3g-3s7v;
	Tue, 24 Jun 2025 20:26:11 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU8eK-00000006Xp4-3T0g
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 18:45:42 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55OIjadm1238609;
	Tue, 24 Jun 2025 13:45:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750790736;
	bh=jCehJ/03vgXo43v5fdkPlxCVgkwl4XEINgeHUUIjpIM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=HH21uuRenlyBJrmpV8tV01ggfubYZdd8TpKLoLY4vv8nKQow7ioeLe/uR1A7OxrGW
	 BMwK7Vxb7qbdWjIW9/IOgMng+DZiWBd9y6KpFb73zyAg1uuKtCgImdTZ3sky1aaxHu
	 pCS33fARrH9UJeYIpbS+Dio8MKVy5f4JIc1HFnOI=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55OIjatH264462
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 24 Jun 2025 13:45:36 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 24
 Jun 2025 13:45:35 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 24 Jun 2025 13:45:35 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.227.245])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55OIjVbv1993190;
	Tue, 24 Jun 2025 13:45:32 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Emanuele Ghidoli <ghidoliemanuele@gmail.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>,
        Emanuele Ghidoli
	<emanuele.ghidoli@toradex.com>,
        Francesco Dolcini
	<francesco.dolcini@toradex.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
Subject: Re: [PATCH v1] arm64: dts: ti: k3-am62-verdin: Enable pull-ups on I2C buses
Date: Wed, 25 Jun 2025 00:15:30 +0530
Message-ID: <175079060330.1874839.7299512877628097063.b4-ty@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250528110741.262336-1-ghidoliemanuele@gmail.com>
References: <20250528110741.262336-1-ghidoliemanuele@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_114540_955123_6B6DF21C 
X-CRM114-Status: GOOD (  11.70  )
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

Hi Emanuele Ghidoli,

On Wed, 28 May 2025 13:07:37 +0200, Emanuele Ghidoli wrote:
> Enable internal bias pull-ups on the SoC-side I2C buses that do not have
> external pull resistors populated on the SoM. This ensures proper
> default line levels.
> 
> 

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-am62-verdin: Enable pull-ups on I2C buses
      commit: bdf4252f736cc1d2a8e3e633c70fe6c728f0756e

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


