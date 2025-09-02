Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 531E2CA100B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 07:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KT7JicJZRiu8apATeQx77YRG8k9V3czfM8WH2/QK/0A=; b=W+siE+pejyDN5IY5TgntZc74sQ
	Dd3oMwCA1qWFCqDRojk7WIXBKmWng44a6eIS57t46RKcPeR440EdfSEfcaBYzPanoG08WmDrUaMqO
	Vrp6Ep3jUR0tz/d1FVF5UEIArHiIC/KH2jRpM/Xv2kcV4cyzSwh8hJTVUaBQS30wGEiajOUTjAoy4
	Edc26BELk7p5fZzpMnSYZAVe18CErY5mYTr/prU6zi3tTLCtHIfPP0SeiwMsmngMNRnLLFBnD0bC7
	umkJwQAOAtXHO6kF6zY58REvtOpdxhQCmOg3am3TPQNoccip56K6HUINJGSHaxwFRzNGu3r5IB/PD
	YUIu/6eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utLTV-0000000Fl51-2seI;
	Tue, 02 Sep 2025 07:30:41 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utLIf-0000000FiEl-1EGM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 07:19:30 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5827JP5I2532518;
	Tue, 2 Sep 2025 02:19:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756797565;
	bh=KT7JicJZRiu8apATeQx77YRG8k9V3czfM8WH2/QK/0A=;
	h=From:To:CC:Subject:Date;
	b=SFsIIt1EbUA0jhoMOpNFn+41Tp6+HMai7gXZRAKPtYyO7j2wjKQzhQk2Z+3wmObKz
	 Jy8BvVqxIJ7HzLoGeqVk7qB/kgrT9ceHnTGB/aYWVapMA6V9kNp0kQtYpR527hbs+g
	 I321BG3PPSv4L1dEznqDuBnc6W8wTG93VdrNZy6k=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5827JP7G2558467
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 2 Sep 2025 02:19:25 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 2
 Sep 2025 02:19:24 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 2 Sep 2025 02:19:24 -0500
Received: from akashdeep-HP-Z2-Tower-G5-Workstation.dhcp.ti.com (akashdeep-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.68.177])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5827JJgZ3689199;
	Tue, 2 Sep 2025 02:19:20 -0500
From: Akashdeep Kaur <a-kaur@ti.com>
To: <praneeth@ti.com>, <nm@ti.com>, <afd@ti.com>, <vigneshr@ti.com>,
        <d-gole@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <vishalm@ti.com>, <sebin.francis@ti.com>
Subject: [PATCH v3 0/3] Remove unused bits from dts and add support for remaining pinctrl macros 
Date: Tue, 2 Sep 2025 12:49:14 +0530
Message-ID: <20250902071917.1616729-1-a-kaur@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_001929_382411_B153A642 
X-CRM114-Status: GOOD (  11.15  )
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

This patch series cleans up the dts files to remove the pin control 
DeepSleep configuration that does not take effect in hardware.
This series also adds the remaining macros in the pin control file 
supported by SoC so that any configuration can be used as per requirement 
in dts files.

Change Log:
V1-> V2:
  -Added the macros that were removed earlier for backward compatibility
  -Fixed the indentation 
  -Added documentation references in commit message

V2-> V3:
  -Updated the commit message to be more descriptive and Clear
  -Fixed errors introduced in previous version

Akashdeep Kaur (3):
  arm64: dts: ti: k3-am62p5-sk: Remove the unused cfg in USB1_DRVVBUS
  arm64: dts: ti: k3-am62x-sk-common: Remove the unused cfg in
    USB1_DRVVBUS
  arm64: dts: ti: k3-pinctrl: Add the remaining macros

 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts       |  2 +-
 .../arm64/boot/dts/ti/k3-am62x-sk-common.dtsi |  2 +-
 arch/arm64/boot/dts/ti/k3-pinctrl.h           | 55 ++++++++++++++++++-
 3 files changed, 54 insertions(+), 5 deletions(-)

-- 
2.34.1


