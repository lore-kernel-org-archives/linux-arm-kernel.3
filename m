Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29AABC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 19:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BoM7ULPRXxvEhaz8Qsa4lQ8+BS5GV8aAbL3gGtEsmHk=; b=b6Tfai1rD5mtdQvNvdWcse5Ja0
	yzdIGj+12GjS1jkSFW5LYErN+miy5zB9fbNDitsMaH2EIrREks6gBubDIyM/m3Zy3mEyL7iKND/Ii
	vQJ3NtnqeZJeVC1IKR/fkzoYHHTWB8lB8C2vpCsHaWhapuEZuJ0as7+oVAMrbjIvcJtX1yIDPQLq1
	tuJ2zctjpaNAqn205cyUSj39otiT+rLDxiFVfMlQJ/hjOW/oXP5CF8xNR1O0fWpQWdv7akg4dANy7
	eLl8xrZFqW0+J2qPjAHVtk4N24LZdJRBQq8sxQwywW+ZRpj1qYtfwG/7CcpBn/QjqPJpDGESRyimm
	nnibwZtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5r3D-0000000HYcN-1MLL;
	Fri, 18 Apr 2025 19:06:59 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5qvP-0000000HXOS-1QTV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 18:58:56 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53IIwqub1001453
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Apr 2025 13:58:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745002732;
	bh=BoM7ULPRXxvEhaz8Qsa4lQ8+BS5GV8aAbL3gGtEsmHk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=BdXu6Ip3IjSFxVGeg/FKqxxuOaRSiLQcVbRxZEB2V9aE8UHDLo7c+vQmYOey/fw3s
	 V0OySXk3pmCBsGuFumZl6Xta/LaBBQ9hu9ZZheZOx408z8BG0YZJe5jNWtGDnn/PZh
	 MGhqQ0qUaNkUDxDBYAb26dPI+RBW4Z9MLmHopLUw=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53IIwqkN113954
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 18 Apr 2025 13:58:52 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 18
 Apr 2025 13:58:51 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 18 Apr 2025 13:58:51 -0500
Received: from localhost ([10.249.36.23])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53IIwpfs118120;
	Fri, 18 Apr 2025 13:58:51 -0500
From: Nishanth Menon <nm@ti.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <vigneshr@ti.com>, <afd@ti.com>, <s-vadapalli@ti.com>,
        <linux-kernel@vger.kernel.org>, Jayesh Choudhary <j-choudhary@ti.com>
CC: Nishanth Menon <nm@ti.com>, <kristo@kernel.org>, <rogerq@kernel.org>,
        <kishon@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 0/5] Use ti,j784s4-pcie-ctrl for PCIe CTRL spaces
Date: Fri, 18 Apr 2025 13:58:50 -0500
Message-ID: <174500270525.95799.12263001003103973109.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250402113201.151195-1-j-choudhary@ti.com>
References: <20250402113201.151195-1-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_115855_471404_D767441D 
X-CRM114-Status: GOOD (  12.77  )
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

Hi Jayesh Choudhary,

On Wed, 02 Apr 2025 17:01:56 +0530, Jayesh Choudhary wrote:
> Now that we have ti,j784s4-pcie-ctrl[0] let's use it. This makes these
> K3 SoCs all match what is already done for J784s4.
> 
> No functional change, DT changes are fully backwards and forwards
> compatible.
> 
> [0]: commit cc1965b02d6c ("dt-bindings: mfd: syscon: Add ti,j784s4-pcie-ctrl compatible")
> <https://lore.kernel.org/all/20240204090336.3209063-1-s-vadapalli@ti.com/>
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/5] dt-bindings: soc: ti: ti,j721e-system-controller: Add PCIe ctrl property
      commit: c574db0b68a600f9548f0ef7bcba723562713587
[2/5] arm64: dts: ti: k3-j721e: Add PCIe ctrl node to scm_conf region
      commit: df2210b2da139e3a733bd7bd1406cd74d39d59a7
[3/5] arm64: dts: ti: k3-j7200: Add PCIe ctrl node to scm_conf region
      commit: 1f326fb84a6074772f01dc63ed4d3eb791682479
[4/5] arm64: dts: ti: k3-j721s2: Add PCIe ctrl node to scm_conf region
      commit: 755e47a71f9dbfbdb33fc18d20a74b7804a20acf
[5/5] arm64: dts: ti: k3-am64: Add PCIe ctrl node to main_conf region
      commit: 4e7ad3b4464571d7bec6869944151b27cce44435

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


