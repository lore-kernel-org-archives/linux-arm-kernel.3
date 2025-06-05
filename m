Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30EB0C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 07:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kbCOyIxCpnaE8Cfg+DoqPNyQm2IjwjvAEIhJ23+mq04=; b=ptc6S97AswegQB2NJHM2LoHOVJ
	y9GFBsv1Kx5FpGhUKrlspfp+b/uh7eOO2RKCzGMkhz5xaQ4Ipt8e3ZaW2P+O0EZxvJWvaf4EzZeCG
	tx3aQzen78/SVVSwGcwZdz+hYqmCSOMvRwibMeiJA/EBFxeI6OdPG3fr1A7deEDdBJtdX+keMNGHg
	ZMTKoAiC27LtFH55sWmciR3J6BJ4EMwEarZfH9w4x9QUsNbdbX/VljHelHAlloOfq666zzFaKo3sq
	nCqUgCgbeB+lWhQZX+328tOVyF4hwBixpnui3P/GcBcDRTa9WmYBmQ8Jxp5ZpKpzgYMxxGF6yuKwu
	779Udnsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN5GK-0000000EyAG-2mIe;
	Thu, 05 Jun 2025 07:43:44 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN4C3-0000000Erjs-3iio
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 06:35:21 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5556ZBIG1031472;
	Thu, 5 Jun 2025 01:35:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749105311;
	bh=kbCOyIxCpnaE8Cfg+DoqPNyQm2IjwjvAEIhJ23+mq04=;
	h=From:To:CC:Subject:Date;
	b=Y0GRIczJqm0Ss3af5D4K+1T2sfQyU99zS98KTwu3Bq1XFLrVhudTTAs20QstMOtQH
	 wjRKNu/MNN0BiP7letipH1mb5lkwXqbo0wKLFRCaKnLQ8/PNY4L+iYy4K0IWvYuuG4
	 mjmbVUQrdtzDIWwswqXHd0r4Q30i4/J1apRpzppk=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5556ZBFR948533
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 5 Jun 2025 01:35:11 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 5
 Jun 2025 01:35:11 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 5 Jun 2025 01:35:11 -0500
Received: from a0497641-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (a0497641-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.69.37] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5556Z7VY3168702;
	Thu, 5 Jun 2025 01:35:08 -0500
From: Neha Malcom Francis <n-francis@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>, <n-francis@ti.com>
Subject: [PATCH v4 0/2] Add support for K3 BIST
Date: Thu, 5 Jun 2025 12:05:04 +0530
Message-ID: <20250605063506.2005637-1-n-francis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_233515_971985_7E18976D 
X-CRM114-Status: GOOD (  11.44  )
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

BIST (Built-In Self Test) is an IP responsible for triggering hardware
circuitry tests on both logic as well as memory blocks. This driver is
currently being upstreamed in U-Boot [1] (on hold till the dt-binding
is approved here) and triggers these tests on cores. This patch series
adds the dt-binding as well as a node for BIST on J784S4 and J742S2.

Changes since v3:
https://lore.kernel.org/all/20250514072056.639346-1-n-francis@ti.com/
- Udit
	- add support for J742S2

Changes since v2:
https://lore.kernel.org/all/20250328111439.374748-1-n-francis@ti.com/
- Krzysztof
	- use existing common definition (ti,sci-dev-id) for grabbing
	  the device ID instead of redefining properties

Changes since v1:
https://lore.kernel.org/all/20241128140825.263216-1-n-francis@ti.com/
- Krzysztof
	- move from misc/ to soc/ti/
	- minor property changes
	- drop ti,bist-instance and instead opt for ti,bist-under-test
	- correct example dt

[1] https://lore.kernel.org/all/20250204123147.939917-1-n-francis@ti.com/

Neha Malcom Francis (2):
  dt-bindings: soc: ti: bist: Add BIST for K3 devices
  arm64: dts: ti: k3-j784s4-j742s2-main-common: Add PBIST_14 node

 .../bindings/soc/ti/ti,j784s4-bist.yaml       | 63 +++++++++++++++++++
 .../dts/ti/k3-j784s4-j742s2-main-common.dtsi  | 11 ++++
 2 files changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/ti/ti,j784s4-bist.yaml

-- 
2.34.1


