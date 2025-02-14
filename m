Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F36C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 07:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JqcigeTLdMurTiiZX6EZ+y04SiHPGF2hirIhUkxRgI8=; b=36zli/MiLBGrDpYwUOYX03g73o
	kXZi7spg0rgkmLOKJDopl0fc9gwwrZyQshZsdDQMaA4u6ihIPFaWAksnM6r2uN+lz+/8ButF71I08
	d9BrYdg6OPPTapTesTOHmujmc2Yd9GO+Qx2vcqaVItCupsLsvjf1ORFQ0CzecVVotAocYvFZgtmfZ
	0fQ9brn9MtDiKN7Gi34JYlo1Mb03dW9Rfb7LD8ygQk/20wGAahu9CuhINNNNgjaJsA8sGXqUyLn67
	b+r+30CWQw+B//tSmwr4A7aqiKhJvEz2UyEBO7wHg2iSt/hwZiRrmwelegGh3MC9nFY6t3iVzf80w
	IakO92nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tipgZ-0000000DtO5-3Rxd;
	Fri, 14 Feb 2025 07:00:27 +0000
Received: from mx0a-0016f401.pphosted.com ([67.231.148.174] helo=mx0b-0016f401.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tipf7-0000000Dt7O-3RxG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 06:58:58 +0000
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51E5nq5x012357;
	Thu, 13 Feb 2025 22:58:52 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfpt0220; bh=J
	qcigeTLdMurTiiZX6EZ+y04SiHPGF2hirIhUkxRgI8=; b=VCz234UitLNAJTQ8g
	oiUTz0+evuakApf6h06uGUhkqa2y57GJcq1amKIAWn7Hs/11G/bqnmyJFVgMDWVr
	Lfc2t5SQRser9qhvcyo/1pVI2RqIzOQHvgu4qoTSxaC0eRRFk1L59DgS7QfWA9zl
	fflbI4jaPttbsmgEz4mF1CvyJDgVcwxeJRwdBStb7plNeS+oeea7bA9SpYTwLmvD
	ZkWWU96qZX37S8rMkKEeMttcTuqKX4J7rgymkX90v7bpuzJncuj3sZBckCzoPv0V
	uhP+faFjB15V+iqheMwYZxM5T9DJT9q6l/QOOxItR29vP75VH1F2E/wgxm1Kc2O0
	jsp3Q==
Received: from dc6wp-exch02.marvell.com ([4.21.29.225])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 44t01f03e2-7
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 22:58:52 -0800 (PST)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 13 Feb 2025 22:58:50 -0800
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Thu, 13 Feb 2025 22:58:50 -0800
Received: from wd-ubuntu-24-04.marvell.com (wd-ubuntu-24-04.marvell.com [10.111.132.113])
	by maili.marvell.com (Postfix) with ESMTP id 06CF73F7090;
	Thu, 13 Feb 2025 22:58:50 -0800 (PST)
From: Wilson Ding <dingwei@marvell.com>
To: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC: <andrew@lunn.ch>, <gregory.clement@bootlin.com>,
        <sebastian.hesselbarth@gmail.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
        <salee@marvell.com>, <gakula@marvell.com>,
        Wilson Ding <dingwei@marvell.com>
Subject: [PATCH 3/4] [PATCH 3/4] dt-bindings: cp110: Document the reset controller
Date: Thu, 13 Feb 2025 22:58:32 -0800
Message-ID: <20250214065833.530276-5-dingwei@marvell.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250214065833.530276-1-dingwei@marvell.com>
References: <20250214065833.530276-1-dingwei@marvell.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Q_8QgP-V-canHPGPNXCrgp8Oi7CdQaaD
X-Proofpoint-GUID: Q_8QgP-V-canHPGPNXCrgp8Oi7CdQaaD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-14_02,2025-02-13_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_225857_864433_8AB1AD9D 
X-CRM114-Status: UNSURE (   9.37  )
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

Add new compatible to be used for CP110's reset controller, and document
the supported reset lines.

Signed-off-by: Wilson Ding <dingwei@marvell.com>
---
 .../arm/marvell/cp110-system-controller.txt   | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/marvell/cp110-system-controller.txt b/Documentation/devicetree/bindings/arm/marvell/cp110-system-controller.txt
index 9d5d70c98058..a5cc1360969c 100644
--- a/Documentation/devicetree/bindings/arm/marvell/cp110-system-controller.txt
+++ b/Documentation/devicetree/bindings/arm/marvell/cp110-system-controller.txt
@@ -190,6 +190,38 @@ CP110_LABEL(syscon0): system-controller@440000 {
 
 };
 
+Reset:
+------
+
+The Device Tree node representing this System Controller 0 provides a
+number of reset lines:
+
+The following reset lines are available:
+
+-  0: Audio Software RESETn
+-  1: TDM Software RESETn
+-  2: Interrupt controller unit Software RESETn
+-  3: Packet processor Software RESETn
+-  4: SDIO Software RESETn
+-  7: XOR-1 engine Software RESETn
+-  8: XOR-0 engine Software RESETn
+- 11: PCIe-0 Gen.3 x1 Software RESETn
+- 12: PCIe-1 Gen.3 x1 Software RESETn
+- 13: PCIe Gen.3 x4 Software RESETn
+- 15: SATA port 0 and port 1 Software RESETn
+- 22: USB3 Host 0 Software RESETn
+- 23: USB3 Host 1 Software RESETn
+- 24: USB3 Device Software RESETn
+- 25: EIP150F Software RESETn
+- 26: EIP197 Software RESETn
+- 29: MSS Software RESETn
+
+Required properties:
+
+ - compatible: must be:
+     "marvell,armada8k-reset"
+ - #reset-cells: must be set to 1
+
 SYSTEM CONTROLLER 1
 ===================
 
-- 
2.43.0


