Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A5CD29DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 06:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3wLl5N/aW4pxrAPVKZWOn2uWWkHkuchBlMXjCsADP6A=; b=Xi1Rr1yx+z8+TowchIGQAWOVGX
	hOmpUhxvQfAC9nztbtou9OvVz5BdcsnGLHlT909Ph1kVCecbMH9vGShNRXy4sEJtpYWVElyBciS3F
	Af30x+XFdlwJFb+Z9oqGAXGCkCFFtlZ2lFjxx8MesRhAGDQGadl0EeulY1Uy8oUSY5tGQlsWMgrdJ
	Wcq58rArumP2DyHAR3KHOy6eEj2/o1EdTTojEfJhjLFZns0RVFBDJJJe0DIg/ahK9iJ/6Vf6HTjBj
	TMKyEDabbu6mPzbLx6oFx6KhOHuUqwNhbxMxJ+kqq+T/wrO+RUhj8Iiv0AertfikeNuRByVfqdsB0
	VNFp03Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfXpT-00000006atc-3uA1;
	Tue, 13 Jan 2026 06:24:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfXpR-00000006atD-3pcC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 06:24:35 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60CN5BnN2513732
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 06:24:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3wLl5N/aW4pxrAPVKZWOn2
	uWWkHkuchBlMXjCsADP6A=; b=TXCQjw9RaOHqz2dB4MHiESOvW2xzkwuuOAfGOp
	MDSrPxCaKdnvd1wQupyKUcVcdD/gEe5RQTto8c0vVdgyXJqIkWidBsJf53LHOqEY
	9Fjy9ofTSt2w21FOEFOF8YhKMoJ/TmlJHqO2uAjPlN87l9V7kiUV7c6W0cDtmx99
	V7FBUWJ9MsEyJTpk1MCmdRB4dnlULk8/6/1UdiQvezxXeO8tHnwZeDAJJU5HzUXj
	08F9HxCTWB1qV6ad4Nzy9pYTMPKLMYGFlP1c8b3+CBl0TYBpg5ryuq2wGqBOxS6A
	fC7FVMZ5oU/oRwhBLCZV4S2zyZPCwAs94feIpMWL8BVcsakw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn6y8smnh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 06:24:32 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1232dd9a256so232270c88.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 22:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768285472; x=1768890272; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3wLl5N/aW4pxrAPVKZWOn2uWWkHkuchBlMXjCsADP6A=;
        b=cabtTvHzQufYr3VYxLEgFSq85qdlHdSuFihrr5rJ+0opulZdXKa1MfUT8EKe1QZ27n
         MPcvpwsxFoNskRq8AQx81kGu6d3RjDvA6Adryr6/FY1tZrpf8C+orab+lWBveoSK8i9o
         dDerCApZDo7gxuAnxfNBkJ5J0rsFww2Yo8NyqWJQDMonQtuDh0SS/UxG6HdeAZiacmKN
         XE18YTXGLXNrewFeBxaJCNubvuxuUG1rO8i/UmHYTZ4evsqOWARY/B2tM8EyffFBMhLW
         NGNHAqHpKf7fON6aswpT1KxQkCfLlSUoE85oDt5dp6bzARd/2/387m/UanDD6NaBialO
         sgxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768285472; x=1768890272;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3wLl5N/aW4pxrAPVKZWOn2uWWkHkuchBlMXjCsADP6A=;
        b=WFERkOC66pzPZPmtDTJiRUqaO/8bsIsP1cEvxZ7AWoDp/6AGFECtwgpdpHdMZ0gClm
         QjvX5FwU2GWwCBzIbMCnOrjI2o0IT52MBdRAHyFuln7KZ69sRYBTGt7Dl1dRsnRf1KPE
         QfBBUGs5tAQX8iuT01RzZlEJWMjh9a70bkZe8LvorJ3/PFgiNODn8BNtyxeAHmRsbmVK
         /JW7knsykf2GFkRvjzMqM0HmZyDw3ixzk+Fv4w+Sm5erkpsAXMYhvy73CVkVI4bkTWyy
         IXGiSms969dfCU/jOakH+hlJHIUUuBcWbJ5dfHBJAzvlqQXGwNtJPQiNE7mBkhKmjuhf
         JPlg==
X-Forwarded-Encrypted: i=1; AJvYcCX8o03Pz+vsISS4kCns//V4QooGKgypLaWRC3pjDAKzbuXpepGAatCAnrzBWXvQpVaRc2GNWoaHJoZmuhO9S/9Y@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8/F0f05KQGJItvxNpNeJy+xV9CcoWA+1bVtWI0pKjsKL5niNS
	WimMFOPvWE7llfPYrpCaFJuswqD8QhG++hMw8xd81vl4lDCJQzQv7NzmgWKFPi7/qTCZtEYiqia
	ZEc+uCtmnjZewLm+IMXvIBQN95uHiFNpSkKA5eGx0uTSnR1tnLQ/ic8gAhETdD5AtJU4gpRjWjX
	HIBQ==
X-Gm-Gg: AY/fxX6kSNabypl3fX04q6SKiDwwI+J9h9SPOk5AVgFzuuOoeBNZ+ukEdtKLwfr7pAb
	SMdhmHQBYjagINv2zNR6LHktSqP+IgYcgvvxN+MBFNXpKKz/JLGBPvTV4XaQWDFD4Q1/qoWb7yl
	L2uDrIoZRZD0osfADlXsFkeerTX5jUvoDkDp+J4JP9M/TfeotKkcDOhAlUraO3lN3FG88ogHuJI
	yaBlWkDYhzrCi4rYIOY51Bs6Deab3HiccXQwc9ybJp5crE81VExSdFFo3AJdRIfd3fIoISlSrLs
	ZOtlSHD84phENKHyYAX2YZe1UshWA9T1GPjnpY6sE72+pCXiEPQf0J+cjDdjniUjbVYfwv0F4Dw
	IhWu0zWQ3saCLWgpGY35XmuxMPYYBurZ4HW3U9agChfi/FX/2tewfrtK+RcaGP5Dr
X-Received: by 2002:a05:7022:307:b0:11d:fc25:af63 with SMTP id a92af1059eb24-1232b5b936bmr2039280c88.11.1768285471885;
        Mon, 12 Jan 2026 22:24:31 -0800 (PST)
X-Received: by 2002:a05:7022:307:b0:11d:fc25:af63 with SMTP id a92af1059eb24-1232b5b936bmr2039248c88.11.1768285471259;
        Mon, 12 Jan 2026 22:24:31 -0800 (PST)
Received: from hu-satyap-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f24346b5sm27572556c88.3.2026.01.12.22.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 22:24:30 -0800 (PST)
From: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 22:24:06 -0800
Subject: [PATCH] firmware: smccc: default ARM_SMCCC_SOC_ID to disabled
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-disable_smccc_soc_id-v1-1-a5bee24befb4@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAXlZWkC/x3MQQqEMAxA0atI1hbaIhbnKiJFk1QDjkoDIoh3t
 7h8i/9vUM7CCr/qhsynqOxbgasrwGXcZjZCxeCtb61z3pDoOK0c9Y+IUXeMQobJdpwaCiEkKOm
 ROcn1bfvheV4mS2f7ZgAAAA==
X-Change-ID: 20260112-disable_smccc_soc_id-ed09ef4d777f
To: Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, satya.prabhala@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768285470; l=1982;
 i=satya.prabhala@oss.qualcomm.com; h=from:subject:message-id;
 bh=9R9d5MZ+Rg409Z594WhcPXh/1yixAU8E+fucp+ksQJc=;
 b=6IhJXSGy4B29tw7x441sQgxggIBB0UmATvgPjlBoFmm9x5/q14EwKP0EqoQvm//CLDHrkfGXK
 mW7QTeFcS+GDyc8ojDOMuyVe5ah5TjvMz8NMpxnkLiFCkQe2qgw7xo0
X-Developer-Key: i=satya.prabhala@oss.qualcomm.com; a=ed25519;
 pk=N96J7WMj6/IKz17G+h6uiK/39yry7OdLwoUtHgPtafw=
X-Proofpoint-GUID: N3VLsdLSSleBqg146jqJq7EHbh5RyoYw
X-Authority-Analysis: v=2.4 cv=dK6rWeZb c=1 sm=1 tr=0 ts=6965e520 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=5JjZXzRyNiR89YENP3AA:9 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: N3VLsdLSSleBqg146jqJq7EHbh5RyoYw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA1MCBTYWx0ZWRfX2YhZo5jNaiVh
 qvdD8mzRTF6bDDdpfk0aB4jMgGUYKJ1xOZn4JU7JvXhZ4FYFg2kaTPHudKV3dpNPBuoKCMX0tHv
 IiGHy27Q6pUzRWD1N0zV+cDErbpQJhgElU+ZE/CXSlLJbBS7qSbkwlvJPcpA3n5kBdRZH9rG/XQ
 RxLBqJafiANFnECSc7rs50IVEys4mLFtAei48uovdRo8WHhFFfxiukKBrWNBjqXcXzXiSF0mk47
 Es8GeYu7CS0buMR2FZUD1Fw4Kr9dnhqMicsr1/ifq6zq/R/ct+Y1sjq21lEoBEZ7+DdhXyNbTFH
 8F0LpnOiwUW/z+CchWftG8NYl8W3/WFOm+yAavW9v8TtFju6dCaUi0GPc/oAalOdAzlduaG5Gy2
 oBSzYs/rcI/2mEKkdCKN4WI/SKiINoLlC+MtcgqU2YdcH9DUkkOcO6KN3RCyVOfo/aEef0namkj
 TYVX/xYZWHrw24MwKHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1011 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_222433_962249_12C6395E 
X-CRM114-Status: GOOD (  15.73  )
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

The ARM SMCCC SoC ID driver is currently enabled by default and publishes
SMCCC-provided SoC identification into /sys/bus/soc/devices/socX/*.

On platforms where a vendor SoC driver already exposes widely-consumed
attributes (e.g. Qualcomm socinfo [1]), enabling the SMCCC driver changes
the format of /sys/devices/soc0/soc_id (e.g. "jep106:XXYY:ZZZZ" instead
of a vendor logical ID like "519") and breaks existing userspace consumers.

Flip the default of CONFIG_ARM_SMCCC_SOC_ID from y to n. Platforms that
prefer SMCCC over a vendor driver can explicitly enable it.

This avoids unexpected format changes and keeps the generic SoC sysfs
stable on systems that rely on vendor-specific identification.

[1]
Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/soc/qcom/socinfo.c

Signed-off-by: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>
---
 drivers/firmware/smccc/Kconfig | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/smccc/Kconfig b/drivers/firmware/smccc/Kconfig
index 15e7466179a6..f830d11ebdca 100644
--- a/drivers/firmware/smccc/Kconfig
+++ b/drivers/firmware/smccc/Kconfig
@@ -18,8 +18,11 @@ config HAVE_ARM_SMCCC_DISCOVERY
 config ARM_SMCCC_SOC_ID
 	bool "SoC bus device for the ARM SMCCC SOC_ID"
 	depends on HAVE_ARM_SMCCC_DISCOVERY
-	default y
+	default n
 	select SOC_BUS
 	help
 	  Include support for the SoC bus on the ARM SMCCC firmware based
 	  platforms providing some sysfs information about the SoC variant.
+	  Note: Several vendor platforms provide their own SoC information
+	  drivers under drivers/soc/*. To avoid conflicting sysfs attribute
+	  formats in /sys/devices/socX/*, this driver defaults to disabled.

---
base-commit: b71e635feefc852405b14620a7fc58c4c80c0f73
change-id: 20260112-disable_smccc_soc_id-ed09ef4d777f

Best regards,
-- 
Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>


