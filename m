Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C307BC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 07:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hMLO/iCmOTSngQQNsGrK0MQ2i9rDTojv8dggzu/KvcQ=; b=N5LrENgK4/iayTKccKpcPkWGNb
	l9h4FwRelfz9MZ+k8s+UFQ7XhHP8zFVhkRYyP/UubJdlFIFtxRx1LbUgCpJlKgEDk+oShj8NHeW7o
	jQzJQ8woSqT8sTbiAOCwAIqiecykLcT0SHfonboBagFlG6oIxZgacZ7aDLXMf1Bb3t0Mrl2tHy3mQ
	RxMdyWbP7V95hcfl3z39ue3r+5KTU0nF5WlzuOEU43v5zskEamorDnrJOWwhEVKgFo+F2u5HQScYt
	9t+ApspEj+DCqT0RIMHwV/emUyETl6icwEH0SL7XEQTAp/WoS2DB2I/uwk8qWw+/wOBioqGOJho5E
	4hik+vhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tipjN-0000000Dtrd-0Rrp;
	Fri, 14 Feb 2025 07:03:21 +0000
Received: from mx0a-0016f401.pphosted.com ([67.231.148.174] helo=mx0b-0016f401.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tipfe-0000000DtC5-0t4S
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 06:59:31 +0000
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51E5nqka012347;
	Thu, 13 Feb 2025 22:59:26 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfpt0220; bh=h
	MLO/iCmOTSngQQNsGrK0MQ2i9rDTojv8dggzu/KvcQ=; b=iVoZvPyOX4Mc48EsP
	y5jXce9IbS1KNO4Kbpjzjpw/u9ZhFTXNvU8xB+JwPQOsM30s3vytvzbXjBgbyutb
	Gp+n8+5rIpHNVPhq2PWvIB0TIRNa8UAwQwvSDxpfT63BoXJ2RLz2EyC2qvwDY3UU
	6mknYtRZNpCHQz5b9MBsCL8pgry+zcsWkRuuEJgcs/EWaaJPMnXLEptHenbkxaE7
	ViGEKYs5TyAQRQzcxtASiu3dcKqIAfS/astCSAxAifrPrjrE9tN7+byx070raF2I
	HxY/o3iA61AKsl6EYpmk+pplp7uhvu/WzPFtpsj65PHHDFLG0flxEVBVhpjVhXmB
	eLpQw==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 44t01f03fa-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 22:59:25 -0800 (PST)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 13 Feb 2025 22:58:51 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Thu, 13 Feb 2025 22:58:51 -0800
Received: from wd-ubuntu-24-04.marvell.com (wd-ubuntu-24-04.marvell.com [10.111.132.113])
	by maili.marvell.com (Postfix) with ESMTP id 206103F7090;
	Thu, 13 Feb 2025 22:58:51 -0800 (PST)
From: Wilson Ding <dingwei@marvell.com>
To: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC: <andrew@lunn.ch>, <gregory.clement@bootlin.com>,
        <sebastian.hesselbarth@gmail.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
        <salee@marvell.com>, <gakula@marvell.com>,
        Wilson Ding <dingwei@marvell.com>
Subject: [PATCH 4/4] [PATCH 4/4] arm64: dts: marvell: cp11x: Add reset controller node
Date: Thu, 13 Feb 2025 22:58:33 -0800
Message-ID: <20250214065833.530276-6-dingwei@marvell.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250214065833.530276-1-dingwei@marvell.com>
References: <20250214065833.530276-1-dingwei@marvell.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: UucUwbdaaezb49L7FSoaz7o8m4tbpU_3
X-Proofpoint-GUID: UucUwbdaaezb49L7FSoaz7o8m4tbpU_3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-14_02,2025-02-13_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_225930_254667_6E16B92E 
X-CRM114-Status: UNSURE (   8.47  )
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

The unit soft-reset configuration register is part of the system
controller register.

Signed-off-by: Wilson Ding <dingwei@marvell.com>
---
 arch/arm64/boot/dts/marvell/armada-cp11x.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi b/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
index 161beec0b6b0..b82003df15e0 100644
--- a/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
@@ -273,6 +273,12 @@ CP11X_LABEL(gpio2): gpio@140 {
 					 <&CP11X_LABEL(clk) 1 17>;
 				status = "disabled";
 			};
+
+			CP11X_LABEL(soft_reset): soft-reset@268 {
+				compatible = "marvell,armada8k-reset";
+				offset = <0x268>;
+				#reset-cells = <1>;
+			};
 		};
 
 		CP11X_LABEL(syscon1): system-controller@400000 {
-- 
2.43.0


