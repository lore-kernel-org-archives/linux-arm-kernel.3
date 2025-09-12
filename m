Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C70CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 09:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ntkc+eDfi34B22gjEgJT3aJJ9hSVrI8PWXJvH/RPrJw=; b=iorFbA5dpqYDTx3pWH17YIgxd1
	yl7OywSmYolw4TA/JiC1GYcqWDCWoQQiVikKIGn7NmH8A2pNOc7u9gQsng+34hes9Tzayfv5W/Jtz
	i3s3N/J+kBIXJYmkl/lN931rvh/FxYfhj/akzfggHugNt7OzcseRzg4P7qsJx/mZ1H87ennpNY/pL
	Ib2vZpJ6ae6mjb8gd9nKQ4uP2UIc8AWaiys5/lyCyL5UHChkrFEf1MKM+ZvgnMdUjuhdIif6BjvG7
	IE7t/41ag+/JD9DkcPiiLfE7XBTzivhAAz6DNuAl+D0rR19vgheeZZVd2nteiE5M6nt4ToLbP3sxJ
	ZkewLDtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux0QM-00000008OLe-1lhA;
	Fri, 12 Sep 2025 09:50:34 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux0QC-00000008OIN-2jeI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 09:50:28 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58C9oGUn495811;
	Fri, 12 Sep 2025 04:50:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757670616;
	bh=ntkc+eDfi34B22gjEgJT3aJJ9hSVrI8PWXJvH/RPrJw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=lgPA3CbTGiCTBuEhSmYlFtcsPb3+Ms14LbLxkKoCGHFaoo95NQrbpOFk/rW1sHhfw
	 AUWFfKZgHj4LlNyD0AjOouCLHtc6KlEjZMaVJ0/HDVpjZy6qukIQ4ttxPY2Ude3caG
	 JWx+VNNNV1316VTuug133KCppLDpOe3vqxSt4Poc=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58C9oG0K1219416
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 12 Sep 2025 04:50:16 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 12
 Sep 2025 04:50:15 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 12 Sep 2025 04:50:15 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58C9oF7L3413569;
	Fri, 12 Sep 2025 04:50:15 -0500
From: Nishanth Menon <nm@ti.com>
To: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        Hrushikesh Salunke
	<h-salunke@ti.com>
CC: Nishanth Menon <nm@ti.com>, <s-vadapalli@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <danishanwar@ti.com>
Subject: Re: [PATCH v2 0/4] arm64: dts: ti: Add bootph-all tag to USB PHY controller
Date: Fri, 12 Sep 2025 04:50:12 -0500
Message-ID: <175766787158.26706.7113494915316256606.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250902053009.1732607-1-h-salunke@ti.com>
References: <20250902053009.1732607-1-h-salunke@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_025024_775668_09D2063D 
X-CRM114-Status: GOOD (  14.07  )
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

Hi Hrushikesh Salunke,

On Tue, 02 Sep 2025 11:00:05 +0530, Hrushikesh Salunke wrote:
> This patch series adds the bootph-all property to USB0 PHY controller
> nodes across multiple TI SoCs (AM62, AM62A, AM62P, J722S).
> 
> The bootph-all tag ensures that these USB PHY controller nodes are
> available during all boot phases, which is required for USB DFU
> (Device Firmware Upgrade) boot functionality.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/4] arm64: dts: ti: k3-am62a7-sk: Add bootph-all tag to usb0_phy_ctrl node
      commit: 47315d395a98a56f8854a2085f887fb18a8217d9
[2/4] arm64: dts: ti: k3-am62p5-sk: Add bootph-all tag to usb0_phy_ctrl node
      commit: 398af33bedc1a64f7045be065e1e17e292cc1c60
[3/4] arm64: dts: ti: k3-am62x-sk-common: Add bootph-all tag to usb0_phy_ctrl node
      commit: 69cd3e0eef26edbc39dca06522f6ae289448d172
[4/4] arm64: dts: ti: k3-j722s-evm: Add bootph-all tag to usb0_phy_ctrl node
      commit: 5cad4ce9a7b82118cfeeb764e1a555a5789c22e3

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


