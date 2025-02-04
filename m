Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 453F7C02193
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 19:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t4q1OOLHrJ3AMW0GT4Vo3vA65FTygVFlcuJU8UFfBjY=; b=YoCtjKaoXVerlc9B+jHUQaYOJV
	eER46Nq+0MgjQJ822yF/U0u2j5c/54ot0sRkhnwzpaQGzKsvP1ZQxuv+6y0RcCZpZmWsKiwsnor4p
	GAUApgeZPkfnjQkDeKrIJ5ud+2eWggNR9GkvRjfpnh8v+Sm+EVHfKN0s4ieDleXL9y2kA2SRAHsyh
	f3nDvBaVdM46Z1vyz1cNMySOoNpftCmDZ8tHaKt9N3AN7ab/nIZ+wJdDx7d+mgmKGqB0Lioj/LZFv
	6IIA+KSm4PEXmhSpZ3xcvcGjs6+cOxEarVBWe7z5h/9jBTToqcfh57sbi4h4dXBLG4Gaqs60PPPxb
	DS0+4+/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfOIC-00000001K1B-35Js;
	Tue, 04 Feb 2025 19:09:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfNu4-00000001GVS-2rec
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 04 Feb 2025 18:44:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=t4q1OOLHrJ3AMW0GT4Vo3vA65FTygVFlcuJU8UFfBjY=; b=fHKLFyKnUsgRDZHqCTxPobQR/3
	2ZDF1+kAjM01sNYk6DhUZFM1yHY/B3tzZfxydL0Hj7QEQeK+4oWUkRsYZnctNe/prS9lpgkOVADwq
	wEA5vMoQgoY1B0Mqlops8+SK0SojBPSaccinS3OCVXmRXD2rUETASaPwZ8DBYRCx02isAN1IV4HNY
	ucGJHXK3N9etVkz/LxhBnfBrkc5ZOndQz5rG81Mbc5zubAnyVxBb08QSxYidel/0trPYsXAHSi1t1
	a4kl8t1OO5JRmsdclOqk3HSSx2dXfrFAAtfqaRcB4pDLwd74+QL5SHQbWkkH/NMfaBW+0dyq4BeJ4
	MNWFzR4A==;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfNu1-0000000GNeq-2yd3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 18:44:07 +0000
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 514GF5I2011384;
	Tue, 4 Feb 2025 18:43:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=t4q1OOLHrJ3AMW0GT
	4Vo3vA65FTygVFlcuJU8UFfBjY=; b=AglfIT7NZtt/PaHFrYxeVM5RwFaa2nvIi
	qCpilql3gthOC9dogSbD0fKeKgTmeqJg0sSh2x2hIP6+8UlzdNBJJrknAzEeFrop
	J1EgxjG1kZFAW2HX3IvEm69Azm7yAodL8OVggJK5JhZlmN1MXiwqQcW/Ab+tGrfa
	BUGOy5jlYwiyZO/O6sWF7EKvq2JjMlgCR4r4PsLNHIp92NrbRIr2ChQ1PswTY7uy
	iq4BpN3hFDIn7yG8HbJrWK1H/ipQUyI3dmU1+aWwbuSbtBQjqCMPFsMFfjdQXu55
	MGtpR4dAFQDP6eH9w/3OXi9hOUH2np9UrmSG3PK9qBYfn72KH9G5w==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44k9r0vbkb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Feb 2025 18:43:48 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 514Frs1w024635;
	Tue, 4 Feb 2025 18:43:47 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44hxxn4y14-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Feb 2025 18:43:47 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 514IhkJv524952
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 4 Feb 2025 18:43:46 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 34B6358058;
	Tue,  4 Feb 2025 18:43:46 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4E3E75805B;
	Tue,  4 Feb 2025 18:43:45 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  4 Feb 2025 18:43:45 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: brgl@bgdev.pl, linus.walleij@linaro.org, minyard@acm.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        openipmi-developer@lists.sourceforge.net, joel@jms.id.au,
        andrew@codeconstruct.com.au, devicetree@vger.kernel.org,
        eajames@linux.ibm.com, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Cc: Ninad Palsule <ninad@linux.ibm.com>, andrew@lunn.ch
Subject: [PATCH v8 5/9] ARM: dts: aspeed: system1: Reduce sgpio speed
Date: Tue,  4 Feb 2025 12:43:31 -0600
Message-ID: <20250204184337.3896834-6-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250204184337.3896834-1-ninad@linux.ibm.com>
References: <20250204184337.3896834-1-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: BJiiZd-PV_fb4Q3cRxik6spibQoCGSCm
X-Proofpoint-GUID: BJiiZd-PV_fb4Q3cRxik6spibQoCGSCm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_08,2025-02-04_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 suspectscore=0 lowpriorityscore=0 mlxlogscore=497 phishscore=0
 clxscore=1015 adultscore=0 spamscore=0 mlxscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_184405_956420_3B70B69B 
X-CRM114-Status: GOOD (  13.41  )
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

Reduce sgpio speed to improve stability with the current PCB layout.

Reviewed-by: Eddie James <eajames@linux.ibm.com>
Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
index 5567e24ff99b..e02ff50fb48e 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
@@ -401,7 +401,7 @@ &emmc {
 &sgpiom0 {
 	status = "okay";
 	ngpios = <128>;
-	bus-frequency = <1000000>;
+	bus-frequency = <500000>;
 };
 
 &ibt {
-- 
2.43.0


