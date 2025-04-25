Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 350D2C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 21:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J7Jea/NPwNCfUkt14yxUySOLJ2V2rzjzSUiEsd0fgVY=; b=tA6QFAx6JwBAXUrmx7m8KmJaKH
	4ED3TaXXfaplehKTqeGrQGO3Xk+O9AKC0wCuc6DX3Hnxnz/pOJTbcJReqWPVWzpsmHWsU++9lzT9b
	Tp8JONnDHIaFBUpp2eOpynmOTmI8rHhsOTeCTh10lWPYibZe8haodvDFbWmKEjnLEduL7rif/TqAp
	P/0e3eNRdJ89WZmLivrXD+Cl+VcwNKgALsPHIk2wPn4nw+cv5OKeyipTBe4LqEsOt+F/fVbkHVb70
	Hso/FUGcJA5H89gUOHnp+8goO7VTD4AG+Y/GrGbXqIHYJ1QDAkWmA4dI644o9kczhPmarUR9iOZGD
	0xcSaYfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8QhM-00000000w9g-40gV;
	Fri, 25 Apr 2025 21:35:04 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8QOE-00000000u84-3kQZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 21:15:20 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53PLFEjA3027724
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 16:15:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745615714;
	bh=J7Jea/NPwNCfUkt14yxUySOLJ2V2rzjzSUiEsd0fgVY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=OCcO73QgmP1zHLdyuIrwqoojpigohgd7C3otpc1c2KubgMyCDVkY2/H4j5045z3Mx
	 I0V1MNW4Iqemc62PM1WkF2jEq8GgQW2gnVoVczxPKbf/wLey3oetCNqX6S4H7RsnG6
	 s4WrraITkmQ0WXsZIbXeDtmLjRqB6FfQwPsq44Y0=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53PLFENK081533
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Apr 2025 16:15:14 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Apr 2025 16:15:14 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Apr 2025 16:15:14 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53PLFDFY099231;
	Fri, 25 Apr 2025 16:15:13 -0500
From: Nishanth Menon <nm@ti.com>
To: <robh@kernel.org>, <kristo@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vigneshr@ti.com>, <m-chawdhry@ti.com>,
        <w.egorov@phytec.de>, <u-kumar1@ti.com>,
        Dominik Haller <d.haller@phytec.de>
CC: Nishanth Menon <nm@ti.com>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <upstream@lists.phytec.de>
Subject: Re: [PATCH v4 1/3] dt-bindings: arm: ti: Add bindings for PHYTEC AM68x based hardware
Date: Fri, 25 Apr 2025 16:15:12 -0500
Message-ID: <174561565253.212307.7484148175271541122.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250423133635.29897-1-d.haller@phytec.de>
References: <20250423133635.29897-1-d.haller@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_141519_020615_75D6ED1E 
X-CRM114-Status: GOOD (  13.70  )
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

Hi Dominik Haller,

On Wed, 23 Apr 2025 15:36:33 +0200, Dominik Haller wrote:
> Add devicetree bindings for the AM68x based phyCORE-AM68x/TDA4x SoM
> and the phyBOARD-Izar carrier board.
> 
> 

I have applied the following to branch ti-k3-dts-next on [1].

[1/3] dt-bindings: arm: ti: Add bindings for PHYTEC AM68x based hardware
      commit: 5d15c4395fd360ab894a28c6a7c8ca44593cdc61
[2/3] arm64: dts: ti: Add basic support for phyBOARD-Izar-AM68x
      commit: 8bc3b1c8645213ffc22f48238e2f325cc4fa29d0

I have applied the following to branch ti-k3-config-next on [1].

[3/3] arm64: defconfig: Enable TMP102 as module
      commit: 8d8f28da8f9055acf3bd8fa4c6cb05140c505baf

Thank you!

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


