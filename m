Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF23C02193
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 19:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ie7LVMiiN9q1A/hR6f6ec05OMSexXDYBf5NlYOQwKbQ=; b=fL6RheQSS2N4EvUFf7d4UuXNNy
	tXSpCa5io2hr5zhgj+ezd4LlGykKFg8ShsLFit4ruw63mOUf+LJYzbjv83+hBjsJSQaGwZXNI3t7R
	Swyi+/10EImMFKDK4ELW2WEhC0J5NSA7uCcjT5a/HwR9Yja4r9x1VeddIRhjTs+8Tf+wj1S4AmeDR
	mBv/UxfP0vE/AvkSKLPDSRalqmRHssserWsTkwjbYC1A3fzOySHWtM/KrW4CTTFPq3ZzejeusXgnq
	QF/OaV8/vFb4V9YGRi2vmdIf/36DYLGhlon60yQPjOsyqzdlCJ3ApnyP7mZLOc/M05xzNCx/zFe74
	r0LAysIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfOQD-00000001L1W-43VE;
	Tue, 04 Feb 2025 19:17:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfNu6-00000001GVm-1mZJ
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 04 Feb 2025 18:44:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Ie7LVMiiN9q1A/hR6f6ec05OMSexXDYBf5NlYOQwKbQ=; b=HclFhyF95VT+o8oXPbDfOBSEyt
	ccw64ECLUUBUb/4oLx7ApsvCv2p21HrCb2/Ua3lN9vKU6EdOHlHWCiPxkhLH6oJxGxYpKTwaxvPUw
	BeyDpWxWokXsAfn0O5sCC2IAj83FC8vUIvbaR1Td/4fA0sXBKS6eeWuRez+ZR1NEemCminc4Pn7zz
	wcM2ICAIH44rKn/Cbp6bAPdXi4H2hyhxxuWO+1CWJb3o7n4saW/r15ss+2aAjEHVted/gu3albbgr
	vxF07L5u82Ocbp/tvvLg+X1NGXfUM28iOwXQDxotsixWt68voxhF3GghHF+yPtgdsT/KchOGWQkfO
	YF5B/q+w==;
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfNu3-0000000GNem-1BOL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 18:44:09 +0000
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 514GEpiw029342;
	Tue, 4 Feb 2025 18:43:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=Ie7LVMiiN9q1A/hR6
	f6ec05OMSexXDYBf5NlYOQwKbQ=; b=N/14PuXdbYOBdexjPXJ4Gp597RH+BKqKk
	5ueMBTrr7ALD874QsxPLpYfxG3jecZ/NeU61mTUq71I2UwfLxbV5Ko7efJL8hdxC
	krEMFAwNGPwVeHyvDgVBkbU6yV6nTxEuobWobaBMZZtlmte5N9C1wIZAEfUZisUn
	yRf4MzN+8PwOyMAt8DVTMpcJsxeua4Pnq1gHaeY6P0Vjz7Ebib6IcOATC84UNkH0
	3sxicRNl+HIhqKZPfkyCn1vbr7zAAbW5BnOD1jWGjkSzTtdcBF6Kr1UnUrTb+KC8
	WcwHYELrrf9312zs6HO/1I/FjP9tCTGqpMMCa2tbukGbNbYVBX86g==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44k8y9mt49-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Feb 2025 18:43:47 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 514FZ0jb016416;
	Tue, 4 Feb 2025 18:43:46 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 44hwxsd4h5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Feb 2025 18:43:46 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 514Ihjr524510836
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 4 Feb 2025 18:43:45 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 352D558059;
	Tue,  4 Feb 2025 18:43:45 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4CC4A5805D;
	Tue,  4 Feb 2025 18:43:44 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  4 Feb 2025 18:43:44 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: brgl@bgdev.pl, linus.walleij@linaro.org, minyard@acm.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        openipmi-developer@lists.sourceforge.net, joel@jms.id.au,
        andrew@codeconstruct.com.au, devicetree@vger.kernel.org,
        eajames@linux.ibm.com, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Cc: Ninad Palsule <ninad@linux.ibm.com>, andrew@lunn.ch
Subject: [PATCH v8 4/9] ARM: dts: aspeed: system1: Add GPIO line name
Date: Tue,  4 Feb 2025 12:43:30 -0600
Message-ID: <20250204184337.3896834-5-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250204184337.3896834-1-ninad@linux.ibm.com>
References: <20250204184337.3896834-1-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: xW_WrjvrHFfTDxHpqqoi6IROJWnJnvhU
X-Proofpoint-ORIG-GUID: xW_WrjvrHFfTDxHpqqoi6IROJWnJnvhU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_08,2025-02-04_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 mlxlogscore=715 suspectscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 mlxscore=0 adultscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_184407_797083_A81066D3 
X-CRM114-Status: GOOD (  12.40  )
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

Add following GPIO line name so that userspace can control them
    - Flash write override
    - pch-reset

Reviewed-by: Eddie James <eajames@linux.ibm.com>
Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
index 53d0abece02c..5567e24ff99b 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
@@ -370,7 +370,7 @@ &gpio0 {
 	/*K0-K7*/	"","","","","","","","",
 	/*L0-L7*/	"","","","","","","","bmc-ready",
 	/*M0-M7*/	"","","","","","","","",
-	/*N0-N7*/	"fpga-debug-enable","","","","","","","",
+	/*N0-N7*/	"pch-reset","","","","","flash-write-override","","",
 	/*O0-O7*/	"","","","","","","","",
 	/*P0-P7*/	"","","","","","","","bmc-hb",
 	/*Q0-Q7*/	"","","","","","","pch-ready","",
-- 
2.43.0


