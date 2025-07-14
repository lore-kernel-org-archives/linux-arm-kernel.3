Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA082C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 09:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qdPkp927EPjHpR8CdKSeHXDZaCUOcmMQXfmTrJemwIg=; b=HVePe2HPY7YOv3HPBhIXm91vRt
	DECCZ9IlQIHJcRVD0pIr7JmpWBTeiSzqeCD5cpzOL4VlD7t6aDnmFYkIjseILonaTIaASRLaKGQI6
	UDNf/Fw8tM8dQG/OIyWJVwltt0a7gxan67I/j3wJFZYIUqWXMlw16UTBRk9hVc7mStA2W/7T4SWy8
	+DrVo28GhBknXkUjLShi3oneJNjDnk/C0iJbdv9rYDIV8oQlkbzMi/KN7B44BUVWkM3Vol9oEbRHI
	cAB9PfU3hQg3XSPAxC+Hpd6xzR0QCEGUdhaUiUumLRMa0tUZsl/P8HDB4e8nyMn96og2qPTAV3Zng
	DWliK14Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubFXi-00000001nDJ-1Y9m;
	Mon, 14 Jul 2025 09:32:14 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubFTK-00000001mYv-3F8S
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 09:27:44 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56E9RUuJ2347226;
	Mon, 14 Jul 2025 04:27:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752485251;
	bh=qdPkp927EPjHpR8CdKSeHXDZaCUOcmMQXfmTrJemwIg=;
	h=From:To:CC:Subject:Date;
	b=eWu1a5MWRtt3TkJXNSUFqfYB+klz8bWTbeY5rO2y2J+XEdjG9xpPX+anug5ujash7
	 hIgNbve/TZpU4MpJFWSesXzs+cW1wblnSpEEh+Vtl/7eOYDAYk+SqnNvgp/3o7mrCz
	 qzrMTH0JuUw94L3yI+TcEMyaigQEK27hn0DZoVzc=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56E9RU55197401
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 14 Jul 2025 04:27:30 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 14
 Jul 2025 04:27:30 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 14 Jul 2025 04:27:30 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56E9RPVg279945;
	Mon, 14 Jul 2025 04:27:26 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vaishnav.a@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <imx@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
        <u-kumar1@ti.com>, <y-abhilashchandra@ti.com>
Subject: [PATCH 0/7] Add Interrupts property for CDNS CSI2RX
Date: Mon, 14 Jul 2025 14:57:01 +0530
Message-ID: <20250714092708.3944641-1-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_022742_903775_81CE8B69 
X-CRM114-Status: UNSURE (   8.23  )
X-CRM114-Notice: Please train this message.
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

The driver patch that adds support for error detection on the
Cadence CSI2RX by enabling its interrupt lines was recently
picked up [0].

Accordingly, this patch adds the required interrupts property
to the Cadence CSI2RX device tree nodes.

Test logs:
(To validate the complete functionality, CRC errors were
intentionally generated by modifying the sensor overlay)

AM68: https://gist.github.com/Yemike-Abhilash-Chandra/123fed82e798a76944ec23f8e46d1114
AM69: https://gist.github.com/Yemike-Abhilash-Chandra/1820e39888cb50e250a83e2d059365f6
J721E: https://gist.github.com/Yemike-Abhilash-Chandra/63f993a995fd6a12cb113454952c063f
J722S: https://gist.github.com/Yemike-Abhilash-Chandra/2144fc8ab2f7bcdb3ef868e85424467d 
J721S2: https://gist.github.com/Yemike-Abhilash-Chandra/f46587ec1ef72671ee31803dd93434b4
J784S4: https://gist.github.com/Yemike-Abhilash-Chandra/0c594683772f11c70bccb508757e9799

Driver and Binding patch series: https://lore.kernel.org/all/20250416121938.346435-1-y-abhilashchandra@ti.com/

[0]: https://lore.kernel.org/all/aG9tuMFOnvwXkcE-@valkosipuli.retiisi.eu/

Yemike Abhilash Chandra (7):
  arm64: dts: ti: k3-j721s2-main: Add interrupts property
  arm64: dts: ti: k3-j721e-main: Add interrupts property
  arm64: dts: ti: k3-j784s4-j742s2-main-common: Add interrupts property
  arm64: dts: ti: k3-am62p-j722s-common-main: Add interrupts property
  arm64: dts: ti: k3-j722s-main: Add interrupts property
  arm64: dts: ti: k3-am62-main: Add interrupts property
  arm64: dts: ti: k3-am62a-main: Add interrupts property

 arch/arm64/boot/dts/ti/k3-am62-main.dtsi                 | 3 +++
 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi                | 3 +++
 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi   | 3 +++
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi                | 6 ++++++
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi               | 6 ++++++
 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi                | 9 +++++++++
 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi | 9 +++++++++
 7 files changed, 39 insertions(+)

-- 
2.34.1


