Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2518CA100C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 06:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FLLuPDMDoXGdW5biy5c1UWsZe2pTqclSdI7bjGJ1gJE=; b=rYO2Py9ks2iDtbXJ2kP4LsTfLU
	tqU9EYJFbwRLzWRwdmy6e89d/xSnycB8PXrx3b+UToB8uz18u9yEbXVkG/6GlDMFNJNaw3hDFhnt6
	EUTE0WQJbT+tyQartAKUygmIPpQmC+3RSYmHqlPh7MP4I2jAYnSBpS0vF5FehmPFVboXSfQ5pHtE5
	MGcTG0WGMvQTM+Ink+XmWBVNR/ANXFtxovvV9CbjfNTNdZiuBMnvf2p2WnNLOpi4bFDz0iumH3WkI
	2UBD21cQHHWJDW9VsTPLT1S9D5jL4/jmw6xiU60YMO5+aA3Q2iGaGz1qj1XoeR10h+KUOZNhO7maE
	mzYO+XsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uth0n-00000004edc-39rJ;
	Wed, 03 Sep 2025 06:30:29 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utgvx-00000004caR-3fEP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 06:25:31 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5836PIXg2766070;
	Wed, 3 Sep 2025 01:25:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756880718;
	bh=FLLuPDMDoXGdW5biy5c1UWsZe2pTqclSdI7bjGJ1gJE=;
	h=From:To:CC:Subject:Date;
	b=E9G3saOgStPL2LW0i9/Yi8ddwJffVLrFjeBARLv4RpcEn9bo+JQ6JIF04rM90xAyy
	 00Uv83g6zMhyJ/cPc/mtHPYtR2yEBKEaRlJRg9nD2sTeev/Y5jpM+JCv3VmMlPHLMR
	 WPk4nRCtSpXVLsdUBg8l3huJJIACZFo+VCSQirhA=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5836PIJj4066360
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 3 Sep 2025 01:25:18 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 3
 Sep 2025 01:25:18 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 3 Sep 2025 01:25:18 -0500
Received: from localhost (ula0502350.dhcp.ti.com [172.24.233.249])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5836PH7d829213;
	Wed, 3 Sep 2025 01:25:17 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <khasim@ti.com>, <v-singh1@ti.com>, <afd@ti.com>, <bb@ti.com>,
        <devarsht@ti.com>, <s-vadapalli@ti.com>
Subject: [PATCH v3 0/2] Add USB support for AM62D2
Date: Wed, 3 Sep 2025 11:55:11 +0530
Message-ID: <20250903062513.813925-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_232530_027797_9FFACE18 
X-CRM114-Status: GOOD (  10.96  )
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

This patch series introduces following changes:

* Patch 1 fixes the main pad length in main_pmx/padconfig for AM62D
 and AM62A. This also fixes "i2c 0-003f: deferred probe pending".

* Patch 2 enables USB support for AM62D2-EVM by adding pinmux and device
 tree nodes.

Change Log:

	v2->v3:
		- Update commit description for first patch.

	v1->v2:
		- Added fixes and Cc tag for Patch 1.
		- Dropped two patches for OPP (applied).

v2-https://lore.kernel.org/all/20250823032304.1085775-1-p-bhagat@ti.com/
v1-https://lore.kernel.org/all/20250820083331.3412378-1-p-bhagat@ti.com/

Boot Logs-
https://gist.github.com/paresh-bhagat12/e29d33c3fd92ff17580edf1441ece9f9

Tech Ref Manual-https://www.ti.com/lit/pdf/sprujd4
Schematics Link-https://www.ti.com/lit/zip/sprcal5

Paresh Bhagat (1):
  arm64: dts: ti: k3-am62d2-evm: Enable USB support

Vibhore Vardhan (1):
  arm64: dts: ti: k3-am62a-main: Fix main padcfg length

 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi |  2 +-
 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts  | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+), 1 deletion(-)

-- 
2.34.1


