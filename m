Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9667AC83F22
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 05:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9RSokxMgEP4SOqdc2oKnXwxbmD35sLZH2NssOeX5TYA=; b=layVobDVwnps+wZLrjV03HzNl6
	atyO48nRiX7reHhkGEFw/l4C0tSrbmlbaosi29IW1ApZhgAr+u+OdX2CiOHIjjnb6QzHM9wxMapa6
	e1oBXyFb6MlOIgEmB/I+Zcejtw/s4dVO9VWDo5PUQIpnKaMcFIIhPcuf0O62dbzKazVsBjeq0qgbb
	1G73QwNDLQmSyXvOvZ/m6Zyic9ezBYBmNHAJoTjc+U1/F8AO85mecxnV548FNEejZM5cvzjrGESx1
	G01JPjLIyLufhLMWISY9ot8e4qmpZLzwUpuwNzbT0j+20nKKPBxNIkGTK3prkKG0ss5Qgstug8VhG
	/t3R/foA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubYQC-0000000481T-0Ih5;
	Tue, 15 Jul 2025 05:41:44 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubYEQ-000000046kC-0Tfa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 05:29:35 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56F5TVxC2538631;
	Tue, 15 Jul 2025 00:29:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752557371;
	bh=9RSokxMgEP4SOqdc2oKnXwxbmD35sLZH2NssOeX5TYA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Kyma2SYpcsdwOfmX47sjUk/4Ey5nnBccs37/vQatgGiH7u8eViLNdSL9lViAjf8+m
	 JUJREQGA7Rj7yrcL9FsPMgU89WvmaozrAt9TRcjdp6dHmCPTtM6Fr1h+i9wRR+zOTb
	 P+S5sjn2Gbu0RaT0SCk6hZ51UZZm62G4va8mk+KA=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56F5TVhM361777
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 15 Jul 2025 00:29:31 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 15
 Jul 2025 00:29:30 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 15 Jul 2025 00:29:30 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.227.245])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56F5TIFe2337840;
	Tue, 15 Jul 2025 00:29:27 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Tero Kristo
	<kristo@kernel.org>,
        Nishanth Menon <nm@ti.com>, Chintan Vankar
	<c-vankar@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, <s-vadapalli@ti.com>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v6 0/4] Add bootph-all property to enable Ethernet boot
Date: Tue, 15 Jul 2025 10:59:01 +0530
Message-ID: <175240652598.4073742.14558391406301903223.b4-ty@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250709105326.232608-1-c-vankar@ti.com>
References: <20250709105326.232608-1-c-vankar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_222934_251340_8ED6779A 
X-CRM114-Status: GOOD (  13.58  )
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

Hi Chintan Vankar,

On Wed, 09 Jul 2025 16:23:22 +0530, Chintan Vankar wrote:
> This series adds bootph-all property to necessary nodes to enable
> ethernet boot support for SK-AM68, AM62P5-SK, J722S, and SK-AM69.
> 
> This series is based on commit '58ba80c47402' of linux-next tagged
> next-20250708.
> 
> Link to v5:
> https://lore.kernel.org/r/20250708084252.1028191-1-c-vankar@ti.com/
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/4] arm64: dts: ti: k3-am68-sk-base-board: Add bootph-all property to enable Ethernet boot
      commit: 7cc984fb30d5c2a780fee0f4b2d4ad2001961c6b
[2/4] arm64: dts: ti: k3-am62p5-sk: Add bootph-all property to enable Ethernet boot
      commit: d6ad164e05844be63210900536108812aa00d2fe
[3/4] arm64: dts: ti: k3-j722s-evm: Add bootph-all property to enable Ethernet boot
      commit: ab9ec669cf74b6499c0de4f42a6dd756a4e4e2a1
[4/4] arm64: dts: ti: k3-am69-sk: Add bootph-all property to enable Ethernet boot
      commit: 89a0284bf92e498c8d24a4ce37949eaf4a5101a9

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


