Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 517E2D69112
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 14:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pKkjyiFM8kQqUBx2zf57P1oCYH46iFzIJ7Um2K6g6p0=; b=L/m//aP6gnwRHNRhr47j4KAM8W
	kKgoZEqSu55a0KY/i2XbRzUyFmxc+J5kUQnzStw44cdU81BdzBpJ9/DzBiu3c4pFoLK0vdzOnebRq
	sAsMCDBLow56B6kj3/kMGH9cS3b/U3q7LIzjmVD90iYFWZUHEezZeevYZmG7pJfpCynXkSMRxeO8Z
	K/W3kH+ONX6GgYzC4DtCvWdAOPR9RVKmbKm/3C9Q4r+cdX4ltMMy4QUweEDj054yhtoRYNJAXQYwx
	9dlTVYhKnSn/2pwl9yVWUOK+gEcAIY8va3lqTva21i0dDb3twp0xzXv0x0E5V/oweDaP1SEOb3AR/
	k233equQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGfD7-0000000FihC-1oBL;
	Thu, 28 Nov 2024 14:09:37 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGfC8-0000000FiTN-1HjY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 14:08:37 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4ASE8UdD1171256
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 28 Nov 2024 08:08:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1732802910;
	bh=pKkjyiFM8kQqUBx2zf57P1oCYH46iFzIJ7Um2K6g6p0=;
	h=From:To:CC:Subject:Date;
	b=dcWV03/ilYOQqteGmDYMbQm4y2WXmQc+Pn18DYKqugc3le+jrZ9jZeDqjDgT/Vewk
	 EcltJWqGDfAjh6fDSOVoVEKpMFpmS1uRBcEnrXs6JfBMRUWVX4BJOFILSsop1Ot5EX
	 NagJQFO8gZPROnCzXQ4iG/3coY/EINc/WKfoevZo=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4ASE8Ua4013188
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 28 Nov 2024 08:08:30 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 28
 Nov 2024 08:08:30 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 28 Nov 2024 08:08:30 -0600
Received: from a0497641-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (a0497641-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.69.37])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4ASE8Qcd019782;
	Thu, 28 Nov 2024 08:08:27 -0600
From: Neha Malcom Francis <n-francis@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>, <n-francis@ti.com>
Subject: [PATCH 0/2] Add support for K3 BIST
Date: Thu, 28 Nov 2024 19:38:23 +0530
Message-ID: <20241128140825.263216-1-n-francis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_060836_558602_07BD6122 
X-CRM114-Status: GOOD (  10.08  )
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

[1] https://lore.kernel.org/all/613efa0b-f785-444c-8769-ea40ac94d6f9@ti.com/T/

Neha Malcom Francis (2):
  dt-bindings: misc: bist: Add BIST dt-binding for TI K3 devices
  arm64: dts: ti: k3-j784s4-main: Add PBIST_14 node

 .../bindings/misc/ti,j784s4-bist.yaml         | 66 +++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi    | 11 ++++
 2 files changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/ti,j784s4-bist.yaml

-- 
2.34.1


