Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A382BE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 02:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R5+873Ef+Kkj4YNDKn1lh7cr/++D0FfitFuPzZwixKs=; b=hBPtX5K3ZkwwnQYG1y2IBFT8rz
	Yod9CxHOFlluiWDwOESbBXmIgCOkhV08C5oMmqBwWoKlz4t4fL10w6V0GSflFzESf7IfMUQ/hODGZ
	DxnOXzIj3neLg4AJ456shUW+ZyXFQI4pcvAq6/j5PX+txK947i8kaWwvcXKGZ13Y7IjsCeu/9vrYV
	Zvq/7Uf2YTTcc4Ohhb0TrJGFPqAsFF13p/TqB0R9JEb9mu75/x+JFPrlFfSoRg5z5RC0+ej7bHZnV
	dwb8hjTkMq8A8ffZCBAMqdW9W/BYpeB0cb8tb5ZWXHHovmjZGQIJH+pxfQSl8+/GDOUZa+WO+cbCS
	Vww87sSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNNII-0000000ByLj-0ykY;
	Tue, 17 Dec 2024 02:26:42 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNND3-0000000BxEo-45Yc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 02:21:19 +0000
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGNxsEi031039;
	Tue, 17 Dec 2024 02:21:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=R5+873Ef+Kkj4YNDK
	n1lh7cr/++D0FfitFuPzZwixKs=; b=coxSEJeBZW+rihxQCTg71FkvkltMawUyZ
	X8ndzBJQFETaZD5y5TRdxG/OAtIgXZKQZrpNdatP9o4I4vTfZ7f07AY041kQVOlh
	5dAPynb1ol/vSJVMaC2U7nNAN06XeUjL+gceofoeqZehoak93uo09vtAbRF+1Oq5
	eXJV7tfmf2cVtA1ybzBDSBKHbBiwP136EaWrvHqPzqNJ05w4H9Mav33PT2+8m1QE
	EOSgZFxKtsD/KD+EogknuLt+NFdLOINcnh+9h9fddxC0T2HP6b3nE2aQS+sG6RCo
	khVnibnn6mgfRLJlDFMAZ/I3qvHsUcOz1QZPh0aVvpKI7IgwtcHcg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43jxbh0e8h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 02:21:04 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BH2L324019106;
	Tue, 17 Dec 2024 02:21:03 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43jxbh0e8c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 02:21:03 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGNZEMa014451;
	Tue, 17 Dec 2024 02:21:02 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 43hq21geff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 02:21:02 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BH2L1LJ25100868
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Dec 2024 02:21:01 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0956A5804E;
	Tue, 17 Dec 2024 02:21:01 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BF5DE5803F;
	Tue, 17 Dec 2024 02:20:58 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 17 Dec 2024 02:20:58 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        eajames@linux.ibm.com, jdelvare@suse.com, linux@roeck-us.net,
        corbet@lwn.net, joel@jms.id.au, andrew@codeconstruct.com.au,
        Delphine_CC_Chiu@Wiwynn.com, broonie@kernel.org,
        peteryin.openbmc@gmail.com, noahwang.wang@outlook.com,
        naresh.solanki@9elements.com, lukas@wunner.de, jbrunet@baylibre.com,
        patrick.rudolph@9elements.com, gregkh@linuxfoundation.org,
        peterz@infradead.org, pbiel7@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-i2c@vger.kernel.org
Cc: Ninad Palsule <ninad@linux.ibm.com>
Subject: [PATCH v3 4/4] ARM: dts: aspeed: system1: Use crps PSU driver
Date: Mon, 16 Dec 2024 20:20:42 -0600
Message-ID: <20241217022046.113830-5-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241217022046.113830-1-ninad@linux.ibm.com>
References: <20241217022046.113830-1-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Hh6hmXv8fYBKd3e_O6u3orwmVtIhLBJp
X-Proofpoint-ORIG-GUID: n5cTMYJWosxJBRjSSeEGaPy4pf0XyB1Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 suspectscore=0 mlxscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxlogscore=854 spamscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_182118_010852_FFAAD833 
X-CRM114-Status: GOOD (  12.39  )
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

The system1 uses Intel common redundant (crps185) power supplies so move
to correct new crps driver.

Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
index 8f77bc9e860c..360b9ce3c850 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
@@ -681,22 +681,22 @@ &i2c2 {
 	status = "okay";
 
 	power-supply@58 {
-		compatible = "ibm,cffps";
+		compatible = "intel,crps185";
 		reg = <0x58>;
 	};
 
 	power-supply@59 {
-		compatible = "ibm,cffps";
+		compatible = "intel,crps185";
 		reg = <0x59>;
 	};
 
 	power-supply@5a {
-		compatible = "ibm,cffps";
+		compatible = "intel,crps185";
 		reg = <0x5a>;
 	};
 
 	power-supply@5b {
-		compatible = "ibm,cffps";
+		compatible = "intel,crps185";
 		reg = <0x5b>;
 	};
 };
-- 
2.43.0


