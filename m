Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 910B5C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 11:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9ghP861EMT1qEkNnFXGo6eMHzjXYl6QYHOQmMTm96Dg=; b=crT0tfZNWnAucduuVZ7Dr1T4uB
	UFdeSk8xdOB1znXCWR5mDeoOC7H6OmY1GMWHm34e5pZPxv+G1olCRbsQPwGdKdfqusNPDGRynIG4P
	1FDmUjMPPPFOkvUUEuxEUTzscJSmzgRkArMyyUqhhodUSvOyBNGUFowWVS6udIYXeX3jl2c1NrPgb
	lB5HRSgjeu5MuF5MaEhUY89jJhYOaBBO2JqpmpH0ZXQBCRXipkq8DhXffhuqC9k62kl6u3bjwmWnL
	/cY3gwh3KSXzkep9e5yMxMZBiBw+ih6MyE28TO+QqXGIxKU4xaHWNauUEgV7LqzoAhKVTtfoSaz2u
	TpqYQ5mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty7hV-0000000DDec-2udK;
	Fri, 28 Mar 2025 11:16:37 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty7fl-0000000DDOm-2IXa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 11:14:51 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52SBEiXE2102971
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 Mar 2025 06:14:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743160484;
	bh=9ghP861EMT1qEkNnFXGo6eMHzjXYl6QYHOQmMTm96Dg=;
	h=From:To:CC:Subject:Date;
	b=wEIxN62MNZCLPjpLloMEWvliQYbyAcGhX2cFCh9s2MtM6NzhK7cdOxPftr0jFlDse
	 mAB4H/TCnpBEBX6aC2G804RPsPldhuEVQm1zfcX2kM53Jp/ipUPWhNppv50CVcFtRL
	 IJgYIwVPn5C0f3wl7tr/Ww0QzAi2mRC3ILM1DhNs=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52SBEicU013878
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 28 Mar 2025 06:14:44 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 28
 Mar 2025 06:14:43 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 28 Mar 2025 06:14:43 -0500
Received: from a0497641-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (a0497641-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.69.37] (may be forged))
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52SBEeIp029420;
	Fri, 28 Mar 2025 06:14:40 -0500
From: Neha Malcom Francis <n-francis@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>, <n-francis@ti.com>
Subject: [PATCH v2 0/2] Add support for K3 BIST
Date: Fri, 28 Mar 2025 16:44:37 +0530
Message-ID: <20250328111439.374748-1-n-francis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_041449_629132_D43D7038 
X-CRM114-Status: GOOD (  11.51  )
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
currently being upstreamed in U-Boot [1] and triggers these tests on
cores. This patch series adds the dt-binding as well as a node for BIST
on J784S4.

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
  arm64: dts: ti: k3-j784s4-main: Add PBIST_14 node

 .../bindings/soc/ti/ti,j784s4-bist.yaml       | 67 +++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi    | 11 +++
 2 files changed, 78 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/ti/ti,j784s4-bist.yaml

-- 
2.34.1


