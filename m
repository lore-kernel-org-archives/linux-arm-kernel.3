Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4BC6CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 09:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k2+RB6MUOQtyzxNDapW6pVtIpKR/wAmc57WmHmeFGhs=; b=TypRn8LKmsYVQzM2Du1exxdAWg
	gaDdO/SEFLGU5v6KXsaCRGVIRhC+5pTESqjAV5KmKuO/pKXFu0UXyfm4XpEY/0Vgfn/CcdIvu4bjo
	4hrPTDGQQ75yGHJ/oqEl+S/qioAigWrpjkAmebnAnQmP82ka9hISd4T/6VpTAtYoqanhfV4HZhxAY
	Xdsu9y8r2+6ENZKVt629pIxXoQOIcQ3Vfd7v1hVJvnpMHdZh2VdiKgiuLcp6mw4mb3nODXD6xvwNd
	ZFk/dMMIbbKKnYNTALwFSb+OAGhrxinRwu+G4tacKUzgcPa6f0Qkq0atjhiwYgasdIq+8/EUSmyGw
	RILP3EFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux0Ox-00000008Nfu-0bw7;
	Fri, 12 Sep 2025 09:49:07 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux0Ou-00000008Nek-3qVw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 09:49:06 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58C9n2E1580003;
	Fri, 12 Sep 2025 04:49:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757670542;
	bh=k2+RB6MUOQtyzxNDapW6pVtIpKR/wAmc57WmHmeFGhs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=h4JuWNDQkmKTC5rEsIYfu5pCqofF1pvE5x7WTBswvkhhc/CH7ko9MFLI9OVrCIv3+
	 x48ALvy2WrpCmlauo7u/JqPOktTHfPiv6DQefxscbVkuYwxABJFUohcl//pOo2wnO+
	 TS3fkQaXj+n257fq8HExvwE3VlT+tgSgTYSwa1vc=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58C9n2F81218723
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 12 Sep 2025 04:49:02 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 12
 Sep 2025 04:49:01 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 12 Sep 2025 04:49:01 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58C9n1An3715971;
	Fri, 12 Sep 2025 04:49:01 -0500
From: Nishanth Menon <nm@ti.com>
To: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        Beleswar Padhi <b-padhi@ti.com>
CC: Nishanth Menon <nm@ti.com>, <afd@ti.com>, <u-kumar1@ti.com>,
        <hnagalla@ti.com>, <jm@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2] arm64: dts: ti: k3-j742s2-mcu-wakeup: Override firmware-name for MCU R5F cores
Date: Fri, 12 Sep 2025 04:48:57 -0500
Message-ID: <175766786719.25561.15602931252398544025.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250823163111.2237199-1-b-padhi@ti.com>
References: <20250823163111.2237199-1-b-padhi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_024905_048181_D129966A 
X-CRM114-Status: GOOD (  14.97  )
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

Hi Beleswar Padhi,

On Sat, 23 Aug 2025 22:01:11 +0530, Beleswar Padhi wrote:
> The J742S2 SoC reuses the common k3-j784s4-j742s2-mcu-wakeup-common.dtsi
> for its MCU domain, but it does not override the firmware-name property
> for its R5F cores. This causes the wrong firmware binaries to be
> referenced.
> 
> Introduce a new k3-j742s2-mcu-wakeup.dtsi file to override the
> firmware-name property with correct names for J742s2.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-j742s2-mcu-wakeup: Override firmware-name for MCU R5F cores
      commit: 00c8fdc2809f05422d919809106f54c23de3cba3

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


