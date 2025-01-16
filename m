Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 277B5C02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 20:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9zTxOB2MAJNkzowxXlrVMP/gAelSWngDs+u8PocDb6s=; b=T+Nyvd/xGJsuxkoo+Y0aUTTRA8
	6d/MasHTWhBjCkylxzF3tGvuYQyKLUNsusU22L7gnDT6cvucDtAJhc4masWVxjF/uWTN2KdxZ78Ls
	ElGGQAXll4xICrIKQ7SedFix7SjD8ddC20GlH8uUFr25YMiKn0hmCSZcVQzEbCuxcNFzXTlTbym7e
	5nyELaP9ysJIv5TuAkW/eb/mPiBQ7LxSEOm5jTwyay4RIdTQr+pPFE1ppQE4NJTHRkSlY8huy6022
	fHzk1nGi6SQ/6spqdfTSJLUpP0RgolY2Xv4ADkRS8tNu8EM1ADlScw01REn7VypEUJhjmz/dTnA6L
	lZ2iddfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYWjX-0000000G4FR-1PE5;
	Thu, 16 Jan 2025 20:44:55 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYWb4-0000000G2kB-0EC5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 20:36:11 +0000
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50GBRdiF028583;
	Thu, 16 Jan 2025 20:35:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=9zTxOB2MAJNkzowxX
	lrVMP/gAelSWngDs+u8PocDb6s=; b=YJHycnCgID42rxZGaojXlVU7jyyVLC0qR
	9/kgkTNXtzrhOOYNLMD30IHsOLu+K6LL4fEA7BEjVK2bhHZ0Jd8pQMPq/GsAQvb0
	HsKfLV3eKBdVenDz1sxSa13FPPdOKB3cbnzG0YGvIFtTaFKUXCfYWquiqumblf1a
	vuyTlnfmWMwky03Rmas8o55wM1dDZQuT85W7hlzgZM056OJGsVuVWsnGDvpk5z5q
	HomFt2IWTb/sEt3tmBWSEhoLjzxtUQPJ7DVHYZOV5hwrsagEl8mwQTbrvOVtbzr3
	mBLf00mGwUjB5rd2+nx+lminYpcruM94FUEeSrZZ/0VqfCYR6qHdw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 446q5hwe7r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 20:35:45 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50GKZjHL026947;
	Thu, 16 Jan 2025 20:35:45 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 446q5hwe7m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 20:35:45 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50GJ0GkB000881;
	Thu, 16 Jan 2025 20:35:44 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 44456k7cj4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 20:35:44 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50GKZgsx33161928
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Jan 2025 20:35:43 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D29F958058;
	Thu, 16 Jan 2025 20:35:42 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C7B895805B;
	Thu, 16 Jan 2025 20:35:41 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 16 Jan 2025 20:35:41 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: minyard@acm.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com,
        openipmi-developer@lists.sourceforge.net, netdev@vger.kernel.org,
        joel@jms.id.au, andrew@codeconstruct.com.au,
        devicetree@vger.kernel.org, eajames@linux.ibm.com,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Cc: Ninad Palsule <ninad@linux.ibm.com>
Subject: [PATCH v6 09/10] ARM: dts: aspeed: system1: Mark GPIO line high/low
Date: Thu, 16 Jan 2025 14:35:24 -0600
Message-ID: <20250116203527.2102742-10-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250116203527.2102742-1-ninad@linux.ibm.com>
References: <20250116203527.2102742-1-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: OPbU6fMC8TcgB7dygnZaEWV-oH27tbpH
X-Proofpoint-GUID: 86oQ1yKPOQYQD1PJoB-DFmhtBBDKuUfQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_09,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=905 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501160151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_123610_097994_E08994DA 
X-CRM114-Status: GOOD (  11.31  )
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

- Mark following GPIO lines as input high:
  - GPIOL4 (reset PCH registers)
  - GPIOL5 (reset portition of intel ME)
- Mark isolate errors from cpu1 gpio (GPIOO6) as active low output.
- The fan controller reset line should be active high.

Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
---
 .../dts/aspeed/aspeed-bmc-ibm-system1.dts     | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
index 089a8315753a..9abbad07c751 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
@@ -383,6 +383,34 @@ &gpio0 {
 	/*X0-X7*/	"fpga-pgood","power-chassis-good","pch-pgood","","","","","",
 	/*Y0-Y7*/	"","","","","","","","",
 	/*Z0-Z7*/	"","","","","","","","";
+
+	pin-gpio-hog-0 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(L, 4) GPIO_ACTIVE_HIGH>;
+		input;
+		line-name = "RST_RTCRST_N";
+	};
+
+	pin-gpio-hog-1 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(L, 5) GPIO_ACTIVE_HIGH>;
+		input;
+		line-name = "RST_SRTCRST_N";
+	};
+
+	pin-gpio-hog-2 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(L, 6) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "BMC_FAN_E3_SVC_PEX_INT_N";
+	};
+
+	pin-gpio-hog-3 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(O, 6) GPIO_ACTIVE_LOW>;
+		output-low;
+		line-name = "isolate_errs_cpu1";
+	};
 };
 
 &emmc_controller {
-- 
2.43.0


