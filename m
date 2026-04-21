Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD6C5F94CB5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 22:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QlAXlWqTsW3fgIvkU8PZeZW4U+04MQJ/BDjSrIArpPc=; b=N0l+TRD88nNA3m2ff8ILrQ0MfX
	8P2aJ3zIB/gFsnmzMl5lUyTOvS2j2GUJS4FJ4fHPoi9j9mrXbu/36Kw5SVttsakgOsk9Xmntwm9kP
	0QUPDqgZ8TGtC08Th+snEG2grTGpUyH1zMgHStCFhdFoF/gl4DoSUiZZU65PSie1jL+kKL/XNAeg6
	3lVJiCsWPSSq1ubGdfc5UCuh0tbh9KIGJSIMNpjySVK/ZUXr/3SrcN0JgQe2opTZneXoOiC40aUXT
	bSSbyIUn1FeEa4kxVB6K4ZQ4IvQU7e3y8VCW6Z1ZvDSwr+8dpjXwkba5S1DO9U6t5KOsTVh+bT3lT
	C9buNX9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFJrN-00000009M3Z-3H2B;
	Tue, 21 Apr 2026 22:46:25 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFJrH-00000009M06-3kZ7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 22:46:21 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LImDtH679535;
	Tue, 21 Apr 2026 22:46:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=QlAXlWqTsW3fgIvkU
	8PZeZW4U+04MQJ/BDjSrIArpPc=; b=JkgBwcLMFYnoow9i92Zsd+BmAAETpoVbf
	6dPwodb6qL4LPwZ3X27Sv6SDZMz0PQmYZpGE5FuAF3Ejw9Q3eUgKP9FbLrjvCUUn
	WqzFdRa0vpVrdf5Bsrs49AbVlxDTBNEX+eFFHePZMw4Edy01djNkcfg311AJQkgE
	7rMyr1z9E4tr97qzKS4CoghunJtqdCfFcxFYM++pOLJ/3ByWb5TRwCuS3t2ufgA0
	7yC6MOuw0GIiu6rHZTEmQk0Re7Ux+vywgOXnY2rzSGX9QXWsC3TvPSUXniLR4oiN
	Fls7wo23FfWFIjN+hi5Sbjgulf6cOthYhXkpRWAFbroWppLjHtSjA==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4dpeu7gp6e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Apr 2026 22:46:04 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 63LMZKJK000635;
	Tue, 21 Apr 2026 22:46:03 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4dmmnvtr8r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Apr 2026 22:46:03 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 63LMk2k240829492
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Apr 2026 22:46:02 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F1AC358059;
	Tue, 21 Apr 2026 22:46:01 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5F2AB58043;
	Tue, 21 Apr 2026 22:46:01 +0000 (GMT)
Received: from pfw153.pfw.tadn.ibm.com (unknown [9.5.7.52])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 21 Apr 2026 22:46:01 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: eajames@linux.ibm.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: Andrew Geissler <geissonator@yahoo.com>, ninad@linux.ibm.com
Subject: [PATCH v1 5/7] ARM: dts: aspeed: system1: disable NCSI net port
Date: Tue, 21 Apr 2026 17:45:42 -0500
Message-ID: <20260421224551.1611818-6-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260421224551.1611818-1-ninad@linux.ibm.com>
References: <20260421224551.1611818-1-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: 3wuiv0BTP6bxQQCHKaorDkJ5P_7T4ICw
X-Authority-Analysis: v=2.4 cv=Ksp9H2WN c=1 sm=1 tr=0 ts=69e7fe2c cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=CjxXgO3LAAAA:8 a=VnNF1IyMAAAA:8
 a=q50bWYc_djlZ50k8_NIA:9
X-Proofpoint-GUID: kHVQpezY5AI0k2lTZtkrV9cMwTGio6Vf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDIyMiBTYWx0ZWRfX6ZEgGgqXm8pk
 qYbO6urJeW0IwleQv0z0qfL9zR/bUk/awtiP165fm6aVlpr3N9h1m2ny2rmCzwuLeIcT2rqvC1W
 WVZuwcsJPcL4L5x5ZwuxS/Qsg58dpU6Yjm8IwhVqdAgB0UGLfcOx9+nyfaRYQ7gxpJY0agVGv6D
 oVtRULhNzM0tkEyA4hfMcqZ/3Tro4POGltnB5DR/Cpfqpds41tt6cwFWn111+yhJN8LTQhaP2lx
 tAeSOF/q1HV3LL5rIFQy29JiDj06ERk5MtZQ7s/cTdtWk8n0x5Tpuzpb1sT5UmER+TYNpST8AXP
 tEF/92Yxd+dUJnBdFIwJefsHcj2RG6WRsYHnCvtssDast/RC6K3ZVqJm1q9R4/jbqzkfKmfKgbH
 HanZlq9imsJnmwylbMoDBKqhtwnoDbEIxwn7cWCWRu0kA7pXc4XPn34lOdw2+PzcEu/Q6y9NIBX
 7UPzNFz6P54jEgRl81g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604210222
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_154620_056276_9230B66C 
X-CRM114-Status: GOOD (  14.01  )
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

From: Andrew Geissler <geissonator@yahoo.com>

There appears to be a hardware issue on system1 with the shared NCSI
network port, eth2. Our use cases don't require the use of this shared
network port by the BMC so just remove it from our device tree.

The symptom is that intermittently the entire BMC network stack will
stop working during a chassis power on or off. Any active ssh sessions
to the BMC will completely hang, and then come back after 5-60 seconds.

Signed-off-by: Andrew Geissler <geissonator@yahoo.com>
Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
index a5252cec9903..3ccf932832f1 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
@@ -519,16 +519,6 @@ &mac2 {
 	use-ncsi;
 };
 
-&mac3 {
-	status = "okay";
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_rmii4_default>;
-	clocks = <&syscon ASPEED_CLK_GATE_MAC4CLK>,
-		 <&syscon ASPEED_CLK_MAC4RCLK>;
-	clock-names = "MACCLK", "RCLK";
-	use-ncsi;
-};
-
 &wdt1 {
 	aspeed,reset-type = "none";
 	aspeed,external-signal;
-- 
2.51.0


