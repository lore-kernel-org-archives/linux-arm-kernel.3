Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB38F94CB7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 22:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DDWz+P6GH5r8rHmoXevBBS4CqD5JryiS1r07nfz5lJY=; b=GH+Oar0U+clsdjtFOeCynF85B/
	s3BilJ89sCZRRnYan7nXqXfQGvEa2t5heDOyTgI1PXJhAz6MZkypuobStfddRkR1CFAtzw01SS/rK
	eHCDnmvKoA3DwcgBxLk6DPDDIj8bK1KWQCC+ikEMEhQexaeaisrVURArLhm358JFI6twjxmjkPk8h
	5h1qZhZF72hGO4a1LQ7+ASuevDCCwKuvzn532s3ZXDbcxPCKGvng/v229tigK6oP3rGseq6UyObA/
	v5PWaMuF+eLLTWizGt+nlegb4dz16hSKuJOyW+4dtK8Z74vyTQJOqcdOhcAF6sgT1Nf/QKC1FDOwS
	+VcO08GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFJrM-00000009M2f-3efx;
	Tue, 21 Apr 2026 22:46:24 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFJrE-00000009Lxh-3Bpj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 22:46:18 +0000
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LImN8L177198;
	Tue, 21 Apr 2026 22:46:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=DDWz+P6GH5r8rHmoX
	evBBS4CqD5JryiS1r07nfz5lJY=; b=qMDTQkwr03Jici3f50aRYn0V9hqXPJhNz
	mSzfWkSOQ6ucu4ljnGLmTnDRnesEslyL+a1cLoSefOSKUyrbVCmn8afe1BoPTAJN
	iBU+QHcWAQt1lSaG3TSSkrx26fDNWCJwOpcw6b38h5j2ub1rZjRvJ9hryrR1Lv0b
	ial/vywow7bJwdPvuiNA096v+iEeTw4RsCPtVOU/qDu6ZhmHcPC3lcVwaX6jKooA
	YZRbTsi3skhgsLf0lUDkHyC00Cuar5ipmjk8H+dG6SDvAsRLGpKrO9PyEGfqJtZX
	Zyuz8gIlV2mCCpwKZktbKTcuyJs0iWTPfL6NQ2cGaP1A6vxz/0URg==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4dpeu68pcb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Apr 2026 22:46:01 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 63LMZIdg026427;
	Tue, 21 Apr 2026 22:46:01 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4dmn9k2kvr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Apr 2026 22:46:01 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 63LMk0LA62456090
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Apr 2026 22:46:00 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DF5BC58055;
	Tue, 21 Apr 2026 22:45:59 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 417415805D;
	Tue, 21 Apr 2026 22:45:59 +0000 (GMT)
Received: from pfw153.pfw.tadn.ibm.com (unknown [9.5.7.52])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 21 Apr 2026 22:45:59 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: eajames@linux.ibm.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: Manojkiran Eda <manojkiran.eda@gmail.com>, ninad@linux.ibm.com
Subject: [PATCH v1 2/7] ARM: dts: aspeed: system1: Enable video engine
Date: Tue, 21 Apr 2026 17:45:39 -0500
Message-ID: <20260421224551.1611818-3-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260421224551.1611818-1-ninad@linux.ibm.com>
References: <20260421224551.1611818-1-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDIyMiBTYWx0ZWRfXz63q7SEIVUvu
 ZgpuXMz0ATcqY+Njhinywkwp/HQpWfE87cvF+CS7qo8RKHnScmPFvfztf6CovvxZUjanraazxxu
 fwn0R276go1dK9gytsbiaZ1O8jJtaPBd/kIduKj4vSxL+BAWMP/pMQp0KARvtMQrkY4Yoj1CUY/
 aJn1FIlFHkIDqmyeRlWN9wnj6tP9wChT9Qb4XzU7dZV99FQwwLp7kI+MfAn6baPMdc397FXH4YU
 Yq4LoPTaBboYUQm3nPiW3Aa2+OtliHrn+puw3iHhxJU8C4z+zl4ZbE8nQb+0ateOMzQhW8C5zOb
 8NUjkZ1CwFyz1h5qm6gcrzo7wiGto1V/gsDCBFkc8IQXg82lIU8+UxVI8bg1AtqT1z+xuFD/+kH
 O0RYFbx/6Tuup/uCOdMk1UDEE93+hKx11ueE87mYEDDrcwO4no8ouUoQdYBtx3B9i4rHjiL22a6
 +233rgq/j3XrH/SjWFw==
X-Proofpoint-ORIG-GUID: 7UHNpH-fZV6Ra7jx-Cs5cveJSOOnkz8H
X-Proofpoint-GUID: iFhVbWu8b3FQJfxzSl7thmXDwlSG4DVD
X-Authority-Analysis: v=2.4 cv=BYfoFLt2 c=1 sm=1 tr=0 ts=69e7fe2a cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=RzCfie-kr_QcCd8fBx8p:22 a=pGLkceISAAAA:8 a=VnNF1IyMAAAA:8
 a=fhILFVcUSx_aPX8XqTsA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604210222
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_154616_924567_81A8C532 
X-CRM114-Status: GOOD (  12.60  )
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

From: Manojkiran Eda <manojkiran.eda@gmail.com>

This patch enables the aspeed video engine support in ASPEED BMC for
IBM System1. It is crucial for facilitating the BMC's video capture
and redirection capabilities, which are integral to remote management
and KVM (Keyboard-Video-Mouse) over IP functionality.

Signed-off-by: Manojkiran Eda <manojkiran.eda@gmail.com>
Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
index 488d0b3916a1..0ca799893791 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
@@ -531,6 +531,10 @@ &lpc_snoop {
 	snoop-ports = <0x80>, <0x81>;
 };
 
+&video {
+	status = "okay";
+};
+
 &i2c0 {
 	status = "okay";
 
-- 
2.51.0


