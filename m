Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44B7CF94CB3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 22:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cS+yLtaHravYz+Y7YPFjvQMfMx9w5jkr37dgZcu2XRY=; b=n9o+SBQABP4F75Hoy9/I8h48uF
	2jQsc4M0/6OxruOIeLMC61Fm5O29uiv16RGLYbCpXlm4ninimYnq6K0FdXUXDKUmfD61Y/1pcWVE2
	9hgoWVVZGf1zfJ8aad4axkmsRgPh614GOhmC4lUkufDKKcpoMsXog5AFcMxueUxIU0BH6gx57cHZY
	vz5cO3Td2WiB0guWIwxaf2Ukbq72EwUtGck9IZqPFmMuYJG9TOObETwhkkZhDrZHw99n+4IDNaGfg
	DBYnu20TD+sn54iLj7ZDPB+7btDhnY1FfYllLuQEKdyR9IdkJ/C3lpj+a5xqvdZO+xrfBgkMbPl8H
	eqBOxzSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFJrN-00000009M2w-0hkz;
	Tue, 21 Apr 2026 22:46:25 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFJrF-00000009Lys-40HO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 22:46:19 +0000
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LImRGG878216;
	Tue, 21 Apr 2026 22:46:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=cS+yLtaHravYz+Y7Y
	PFjvQMfMx9w5jkr37dgZcu2XRY=; b=R9Wox7gNf8Sdhzwv/E3I8OcXwzTy5S2JD
	JRtusrJK/sBv1GyhrFK92ml7zB+0qBjTpRj2a7K2EGTbOc0wTloD1gy0B12lDViY
	gf+/PQa1ZaEVtdxtO/xb1flF2btegyd9SRfcoeviN5EYcpxotEYHjZdCaiMGe3eV
	ZP+xncZ/HshZlCryzm/L9xr39dDKAjsJfGw5WDAHVjWFjNmLK0fHupdyfAZ1jaXA
	hu16qZGRtmUCgMtRJISebYrxsztAQPlpjgDXemP8oncKneEhvyE+6mT7TF2sOmUC
	iUQp84j9a86JkVpIszIFbMTw7vf2wzgMMEcSN1a2hkCTaBs6Rcggw==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4dpeu20qj9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Apr 2026 22:46:05 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 63LMZPdB013594;
	Tue, 21 Apr 2026 22:46:04 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4dmnsh2js9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Apr 2026 22:46:04 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 63LMk3va27394736
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Apr 2026 22:46:03 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5321F5805F;
	Tue, 21 Apr 2026 22:46:03 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BDB7C58043;
	Tue, 21 Apr 2026 22:46:02 +0000 (GMT)
Received: from pfw153.pfw.tadn.ibm.com (unknown [9.5.7.52])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 21 Apr 2026 22:46:02 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: eajames@linux.ibm.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: Ninad Palsule <ninad@linux.ibm.com>
Subject: [PATCH v1 7/7] ARM: dts: aspeed: system1: DTS updates
Date: Tue, 21 Apr 2026 17:45:44 -0500
Message-ID: <20260421224551.1611818-8-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260421224551.1611818-1-ninad@linux.ibm.com>
References: <20260421224551.1611818-1-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDIyMiBTYWx0ZWRfXyCw/pT34eaWz
 NvK52xExibTzl9ixyuXpy4vYbc40L46feOmRq5aJzGxdvotyVOkTZAxNDT5zeHho1Mqer3pLOPC
 07myP+m0l/Mjg05xVbNkvoDkJylhAMMVXeIM5bjj0Dxx6NlCIqXkP4JnEkRwYWfGjA8Bd/x2Ppf
 yqCQBG+5fsL0oV/KmNoLuAzX2XrvsqMgucb11g8gAVkksRRhBhCp08RZI2n2NSXDheVxOUcITza
 aMS/D2NtaPK53aqFvCq3RI2ZZ+AD3sRQc/Rhc4R6MzTYeM7kgcVJrXhT80f/qTGBJ8tpvWykvH3
 hIc8sayRRiPlb0/gNu8EQZ8k5eVu95Hw3h1sbW/mBqJY8V1mEW2t3EmkOUPSEV5446L78Z0Kysk
 8WKHgFxAXpisCq6pMh7yL3YYq1KDnm2VaFlpDcB6dTlFoR1c02kYzEQxaxYMeyVHz5evFW7Dnid
 VNTk+y5fBUb1qE6XUqw==
X-Proofpoint-ORIG-GUID: sqXl7nSeLWUgo4IcCn7u4ZdF8NAXH1zE
X-Proofpoint-GUID: sqXl7nSeLWUgo4IcCn7u4ZdF8NAXH1zE
X-Authority-Analysis: v=2.4 cv=XMUAjwhE c=1 sm=1 tr=0 ts=69e7fe2e cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8 a=weSylXKMd7dZRB46iqoA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604210222
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_154618_009180_BB99C992 
X-CRM114-Status: GOOD (  12.81  )
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

- Removed SGPIO node as not in use anymore.
- Updated chassis power related pins as per the new hardware design

Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
index 91c317267d6b..d7a934fe5860 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
@@ -424,7 +424,7 @@ &pinctrl_gpiol6_unbiased
 	/*E0-E7*/	"","","","","","","","",
 	/*F0-F7*/	"","","","","","","","",
 	/*G0-G7*/	"","","","","","","","",
-	/*H0-H7*/	"","","","","","","","",
+	/*H0-H7*/	"power-chassis-good","power-chassis-reboot","","","","","","",
 	/*I0-I7*/	"","","","","","","","",
 	/*J0-J7*/	"","","","","","","","",
 	/*K0-K7*/	"","","","","","","","",
@@ -440,7 +440,7 @@ &pinctrl_gpiol6_unbiased
 	/*U0-U7*/	"","","","","","","","",
 	/*V0-V7*/	"","rtc-battery-voltage-read-enable","","power-chassis-control","","","","",
 	/*W0-W7*/	"","","","","","","","",
-	/*X0-X7*/	"fpga-pgood","power-chassis-good","pch-pgood","","","","","",
+	/*X0-X7*/	"fpga-pgood","","pch-pgood","","","","","",
 	/*Y0-Y7*/	"","","","","","","","",
 	/*Z0-Z7*/	"","","","","","","","";
 
@@ -486,12 +486,6 @@ &emmc {
 	clk-phase-mmc-hs200 = <180>, <180>;
 };
 
-&sgpiom0 {
-	status = "okay";
-	ngpios = <128>;
-	bus-frequency = <500000>;
-};
-
 &ibt {
 	status = "okay";
 };
-- 
2.51.0


