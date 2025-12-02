Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60177CFD376
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 06:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+IspkF7gTDoWesqXAkpx7IlgCLV6iSsek/5vNIm3b+g=; b=UQXLYeE9geyPbcg/djonCqSIp9
	ewBYV+GKzc3twG73BV4zpcYLjpqKUzKwi4VFzTNOxa1t50t6yse1MQMdigfWgu2EE2+j8y7z0MX5O
	ncjwMeUNEf9XVrR5Z9+tRhjyF5y4GJxpANLeExDmyqzbtHzvsk8qNvxj5cy8bTKIOLmJaP1LWsaho
	QRi/WJzegLlTaRiDwkpOmjCMnBwap/qoEKDlMtaeAdvwVbduRJpJBxpC0zwxpEsUIhVqBsme2Abnd
	hXLEWvXDrWjueI4vAk7yUlPxpPDi0xl3/6KbrnKLraaE2tkKxRZP47SrSVyVpSsTmHZm2wDorCff2
	/fT+A2Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQK6u-00000004uy2-3Kbs;
	Tue, 02 Dec 2025 06:43:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQK6g-00000004uu0-0OFB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 06:43:31 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B25o47S1688811
	for <linux-arm-kernel@lists.infradead.org>; Tue, 2 Dec 2025 06:43:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+IspkF7gTDoWesqXAkpx7IlgCLV6iSsek/5vNIm3b+g=; b=beALRJ+CIEbo3zYy
	5KYtQwAAbedqgzTiIcPYIJA02/DW5gWA680Z9K1BlJhZ7MrYNqysNDnzZ+oawHN4
	kRrR1aQ2kJoluUo+PWciLjY4NLfeEHjHiSHAJuIqCT89NeEsC6nqESbtWTTLMYvT
	SahgBLEY7oGUHPGB9dua9RfNby0Md/zIvtzrhxSgQYVW26s8zla10afloMnT2WFg
	cjWijjm9aQvldAnGCOF0lwc/5POsEVieGQYvMyQ+tlmHbBvbtOyd/b3dngK8GmRG
	BMFzd2G2Dg0hnvHLDOV5oaWfdigvWEX4rwqO/rlYsJTlQ/JVL1OaW6PHjA1ZbqDt
	9/nhMA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asgxesx3k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 06:43:24 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-295592eb5dbso88210555ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Dec 2025 22:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764657804; x=1765262604; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+IspkF7gTDoWesqXAkpx7IlgCLV6iSsek/5vNIm3b+g=;
        b=JMqNqD3s4LdcpJIQetNUqxCiIN4nLwuulhO7s6vhCkoUzrcCucQ6LjqDF8grTiuMXQ
         h+So4rrvpTUt9Y5ctzO1fugG+Bs9SYGlghQJCrAMlR0pzN7z1hepYDbJKKdVOdd2ciWO
         v2d0ANxDt3CEQeIPnQ80mYTPAnHvD+acBupMFXKwJMjgrvgKCA52mRu9944tpbPOAbe7
         D/XJhUbSaBNf8Xx+ayaqAQUYNRIQ/TQBZaC+Zpy2BpxHT63rOIyNSsbV8duJXtk1SL6m
         Qn0cwxrwXltWQVenzzTScTniKjZhzEJ7bYi0D+D7q/vu7ilXJGDDMFFv6+98x8aFuUYE
         xzZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764657804; x=1765262604;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+IspkF7gTDoWesqXAkpx7IlgCLV6iSsek/5vNIm3b+g=;
        b=rmz4JcJBuVD/hoXc4CKaD8jNeTFBrMbcBA/vjy3+kgW6V92iHj8P3ONCxzveBc+oGf
         dF3DdPSVFr+f9Ze3dZVSxGBlGwHpTbgytjui3wBf26BxXQ5Zsy6trN9zM7JYLiztfdUE
         vtYNsU0x5ODx/n31F69QpgctcAqljfY8evrIBsOz5kQDPVg7FfJHHaFM1ZCTQYPiGFeB
         nj6VH2abMc6/LCyFCsDEtgkxaHcK+GSa0jYBogxXSjFMh8A8DyKEcCMEUsW6flFh4vnM
         aMK/dHYVgLtq8ef3aytx03Anvpi4G8Z9L7ekCzuwtlsNJGuopbtrp91CA15CbZSn2NiL
         QxFA==
X-Forwarded-Encrypted: i=1; AJvYcCXo7cW/bgOGSqFiX3j/69k2qZmEVlEFplGiLwDl1wp1VZIyu4gef1Uub03PX52rSiRR5AITavk9dc2NBs/q/slj@lists.infradead.org
X-Gm-Message-State: AOJu0Yw56X38cFDB5L6h8Gm8HwRwIFvbae2g5Tej68jPYZzc4IJU9RQk
	RN8kWZhYibcthI6gMQtSe/ir4GfYqTsNrsA9BM7hYCFkPJOuQBw0Q7WYb+akvSTXh04WwYVDJpJ
	c/SSGVe7W3CMFl3LQzSPc8Y1uyBR6N3sSjO57R3BJqa/EFpKWHrfcAsVV6h7WCfe34ERRo9zqth
	u1xQ==
X-Gm-Gg: ASbGncs3G6tXAHJ4p4D5cvQtKeCRUVEEffkmkTPXrmnxvFY5zAGfTAOWxHO+OQIborV
	KroV2pxu2M90/0sed8o9D6LWxqCoMINfbGICIBr1bE4nUfJTeSpABoy4z+qhXOmQhFsICY1qZVy
	Zt9XoNBakt+cUxtNdLUK5PuKZqGdXL0WAAPnd7jsAk+wFCbWDBIwdTfiiLeeSLDMt9sFnUXZjlc
	hyx4GspxezXVYajrpI///CPQ6AQWx3EfWraBmn7u7VvnFSwHbIqFWhXvfT9xU/qSvT12+BZn3u1
	Sbd7syCWaP4FenE/gH16v/JztBFH8rnvYUWz3GOF7Beq3ykYAblt5wzGayWq8tEkd8SIQpq7kuJ
	ZBJJltVF2niBAJ7uJ1GJcVWNWCrOalIL6lqzDuJGyTK2nMShDIGsccFNFSOROGYZ3OAXU2RGxhK
	AFUg==
X-Received: by 2002:a17:903:198c:b0:297:ddb6:ef81 with SMTP id d9443c01a7336-29b6c3e83d7mr430776575ad.16.1764657803687;
        Mon, 01 Dec 2025 22:43:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFHb5ciFmPEoqBg+z5rwGbm61VuIgxrFXhOrfGSvp5tLruUPs03mWmDRDKKG7XFtL7HoMHtIg==
X-Received: by 2002:a17:903:198c:b0:297:ddb6:ef81 with SMTP id d9443c01a7336-29b6c3e83d7mr430776235ad.16.1764657802933;
        Mon, 01 Dec 2025 22:43:22 -0800 (PST)
Received: from jinlmao-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb450cfsm141821675ad.74.2025.12.01.22.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 22:43:22 -0800 (PST)
From: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Date: Tue, 02 Dec 2025 14:42:21 +0800
Subject: [PATCH v6 2/2] coresight: cti: Add Qualcomm extended CTI support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251202-extended_cti-v6-2-ab68bb15c4f5@oss.qualcomm.com>
References: <20251202-extended_cti-v6-0-ab68bb15c4f5@oss.qualcomm.com>
In-Reply-To: <20251202-extended_cti-v6-0-ab68bb15c4f5@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, quic_yingdeng@quicinc.com,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
        Yingchao Deng <yingchao.deng@oss.qualcomm.com>,
        Mao Jinlong <quic_jinlmao@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764657791; l=23700;
 i=yingchao.deng@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=PtB0BtXlP5YVfymzMpYmNBA2P6kWUJMFu7WMeMPHIHQ=;
 b=UVyOeBFEV08wvIIQRSnaoExP1F6ybAw2v+2hTVK+BHAOn/LIXHWnMoIrIpa9/zxCjQCJ85Fvp
 JL8QPKnoRyvDWryfvohnbAvxuKgQBozIDdUgouAQKn9zQVOfZW/JZiA
X-Developer-Key: i=yingchao.deng@oss.qualcomm.com; a=ed25519;
 pk=QWvd9DuX5YKvc7/VfWGCElGNr3HbCyig5bEb+lUUohg=
X-Proofpoint-GUID: z439WoMyIY9C0--hecWBZ3AOsCVkuFRc
X-Proofpoint-ORIG-GUID: z439WoMyIY9C0--hecWBZ3AOsCVkuFRc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDA1MSBTYWx0ZWRfX5dahhudGsuze
 VF6sIDbV5q6gkcTbx5y7MM/2B077i5xrCtxOdrawnq7/x5nBEltiXx9RYVFBArqzfecE4z9bb10
 5ipvnOBkUEoK3w24evCXF5ZIA8+Tpop+zAZJBSaVIKKoUOMs9Sl9Ct0tL9yhYJkMbHmGVBAtxqi
 bYn/MZVjSYIc0AMm8Ly57FJ8Wk49RUOZLpsmmelEDzv+AOnDyc+wpGJ0CbPlMFYBOyX+Np1lvCg
 YLu7X++oLKeyYgRedUb54FBqZaJ8YSGkjq7O5rmUIlTsQY80zBBGK5dcMafusBAwpiyWFi3up0L
 yRvnXjVtOFR3GaKu3lvgI7CRx1e/pqxXvrWOzjhexXiF0xDf7evc3aTex5BuOQbX9V3UfLx68HD
 EPcdc/Fil4PbBGcOUeJJtE85fHKH6w==
X-Authority-Analysis: v=2.4 cv=A8Zh/qWG c=1 sm=1 tr=0 ts=692e8a8d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=MyaKAwSpj8bC-vdJwaUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512020051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_224328_131317_C6F2FE88 
X-CRM114-Status: GOOD (  21.74  )
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

The QCOM extended CTI is a heavily parameterized version of ARM’s CSCTI.
It allows a debugger to send to trigger events to a processor or to send
a trigger event to one or more processors when a trigger event occurs
on another processor on the same SoC, or even between SoCs. Qualcomm CTI
implementation differs from the standard CTI in the following aspects:

1. The number of supported triggers is extended to 128.
2. Several register offsets differ from the CoreSight specification.

Co-developed-by: Jinlong Mao <jinlong.mao@oss.qualcomm.com>
Signed-off-by: Jinlong Mao <jinlong.mao@oss.qualcomm.com>
Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-coresight-devices-cti    |  11 ++
 drivers/hwtracing/coresight/coresight-cti-core.c   |  95 +++++++++--
 drivers/hwtracing/coresight/coresight-cti-sysfs.c  | 177 ++++++++++++++++-----
 drivers/hwtracing/coresight/coresight-cti.h        |  43 ++++-
 drivers/hwtracing/coresight/qcom-cti.h             |  29 ++++
 5 files changed, 304 insertions(+), 51 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti b/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
index a2aef7f5a6d7..9478dfcee03b 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
@@ -245,3 +245,14 @@ Date:           Aug 2025
 KernelVersion   6.18
 Contact:        Mao Jinlong <quic_jinlmao@quicinc.com>
 Description:    (Read) Show hardware context information of device.
+
+What:           /sys/bus/coresight/devices/<cti-name>/regs/ext_reg_sel
+Date:           Dec 2025
+KernelVersion:  6.19
+Contact:        Mao Jinlong <jinlong.mao@oss.qualcomm.com>
+Description:    (RW) Select the index for extended registers.
+		QCOM CTI supports up to 128 triggers, there are 6 registers
+		need to be expanded to up to 4 instances:
+		CTITRIGINSTATUS, CTITRIGOUTSTATUS,
+		ITTRIGIN, ITTRIGOUT,
+		ITTRIGINACK, ITTRIGOUTACK.
diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
index f9970e40dd59..51b3644e97c4 100644
--- a/drivers/hwtracing/coresight/coresight-cti-core.c
+++ b/drivers/hwtracing/coresight/coresight-cti-core.c
@@ -21,6 +21,55 @@
 
 #include "coresight-priv.h"
 #include "coresight-cti.h"
+#include "qcom-cti.h"
+
+static const u32 cti_normal_offset[] = {
+	[INDEX_CTIINTACK]		= CTIINTACK,
+	[INDEX_CTIAPPSET]		= CTIAPPSET,
+	[INDEX_CTIAPPCLEAR]		= CTIAPPCLEAR,
+	[INDEX_CTIAPPPULSE]		= CTIAPPPULSE,
+	[INDEX_CTIINEN]			= CTIINEN(0),
+	[INDEX_CTIOUTEN]		= CTIOUTEN(0),
+	[INDEX_CTITRIGINSTATUS]		= CTITRIGINSTATUS,
+	[INDEX_CTITRIGOUTSTATUS]	= CTITRIGOUTSTATUS,
+	[INDEX_CTICHINSTATUS]		= CTICHINSTATUS,
+	[INDEX_CTICHOUTSTATUS]		= CTICHOUTSTATUS,
+	[INDEX_CTIGATE]			= CTIGATE,
+	[INDEX_ASICCTL]			= ASICCTL,
+	[INDEX_ITCHINACK]		= ITCHINACK,
+	[INDEX_ITTRIGINACK]		= ITTRIGINACK,
+	[INDEX_ITCHOUT]			= ITCHOUT,
+	[INDEX_ITTRIGOUT]		= ITTRIGOUT,
+	[INDEX_ITCHOUTACK]		= ITCHOUTACK,
+	[INDEX_ITTRIGOUTACK]		= ITTRIGOUTACK,
+	[INDEX_ITCHIN]			= ITCHIN,
+	[INDEX_ITTRIGIN]		= ITTRIGIN,
+	[INDEX_ITCTRL]			= CORESIGHT_ITCTRL,
+};
+
+static const u32 cti_extended_offset[] = {
+	[INDEX_CTIINTACK]		= QCOM_CTIINTACK,
+	[INDEX_CTIAPPSET]		= QCOM_CTIAPPSET,
+	[INDEX_CTIAPPCLEAR]		= QCOM_CTIAPPCLEAR,
+	[INDEX_CTIAPPPULSE]		= QCOM_CTIAPPPULSE,
+	[INDEX_CTIINEN]			= QCOM_CTIINEN,
+	[INDEX_CTIOUTEN]		= QCOM_CTIOUTEN,
+	[INDEX_CTITRIGINSTATUS]		= QCOM_CTITRIGINSTATUS,
+	[INDEX_CTITRIGOUTSTATUS]	= QCOM_CTITRIGOUTSTATUS,
+	[INDEX_CTICHINSTATUS]		= QCOM_CTICHINSTATUS,
+	[INDEX_CTICHOUTSTATUS]		= QCOM_CTICHOUTSTATUS,
+	[INDEX_CTIGATE]			= QCOM_CTIGATE,
+	[INDEX_ASICCTL]			= QCOM_ASICCTL,
+	[INDEX_ITCHINACK]		= QCOM_ITCHINACK,
+	[INDEX_ITTRIGINACK]		= QCOM_ITTRIGINACK,
+	[INDEX_ITCHOUT]			= QCOM_ITCHOUT,
+	[INDEX_ITTRIGOUT]		= QCOM_ITTRIGOUT,
+	[INDEX_ITCHOUTACK]		= QCOM_ITCHOUTACK,
+	[INDEX_ITTRIGOUTACK]		= QCOM_ITTRIGOUTACK,
+	[INDEX_ITCHIN]			= QCOM_ITCHIN,
+	[INDEX_ITTRIGIN]		= QCOM_ITTRIGIN,
+	[INDEX_ITCTRL]			= CORESIGHT_ITCTRL,
+};
 
 /*
  * CTI devices can be associated with a PE, or be connected to CoreSight
@@ -70,15 +119,16 @@ void cti_write_all_hw_regs(struct cti_drvdata *drvdata)
 
 	/* write the CTI trigger registers */
 	for (i = 0; i < config->nr_trig_max; i++) {
-		writel_relaxed(config->ctiinen[i], drvdata->base + CTIINEN(i));
+		writel_relaxed(config->ctiinen[i],
+			       drvdata->base + cti_offset(drvdata, INDEX_CTIINEN, i));
 		writel_relaxed(config->ctiouten[i],
-			       drvdata->base + CTIOUTEN(i));
+			       drvdata->base + cti_offset(drvdata, INDEX_CTIOUTEN, i));
 	}
 
 	/* other regs */
-	writel_relaxed(config->ctigate, drvdata->base + CTIGATE);
-	writel_relaxed(config->asicctl, drvdata->base + ASICCTL);
-	writel_relaxed(config->ctiappset, drvdata->base + CTIAPPSET);
+	writel_relaxed(config->ctigate, drvdata->base + cti_offset(drvdata, INDEX_CTIGATE, 0));
+	writel_relaxed(config->asicctl, drvdata->base + cti_offset(drvdata, INDEX_ASICCTL, 0));
+	writel_relaxed(config->ctiappset, drvdata->base + cti_offset(drvdata, INDEX_CTIAPPSET, 0));
 
 	/* re-enable CTI */
 	writel_relaxed(1, drvdata->base + CTICONTROL);
@@ -214,6 +264,9 @@ void cti_write_intack(struct device *dev, u32 ackval)
 /* DEVID[19:16] - number of CTM channels */
 #define CTI_DEVID_CTMCHANNELS(devid_val) ((int) BMVAL(devid_val, 16, 19))
 
+/* DEVARCH[31:21] - ARCHITECT */
+#define CTI_DEVARCH_ARCHITECT(devarch_val) ((int)BMVAL(devarch_val, 21, 31))
+
 static int cti_set_default_config(struct device *dev,
 				  struct cti_drvdata *drvdata)
 {
@@ -394,8 +447,8 @@ int cti_channel_trig_op(struct device *dev, enum cti_chan_op op,
 
 	/* update the local register values */
 	chan_bitmask = BIT(channel_idx);
-	reg_offset = (direction == CTI_TRIG_IN ? CTIINEN(trigger_idx) :
-		      CTIOUTEN(trigger_idx));
+	reg_offset = (direction == CTI_TRIG_IN ? cti_offset(drvdata, INDEX_CTIINEN, trigger_idx) :
+			cti_offset(drvdata, INDEX_CTIOUTEN, trigger_idx));
 
 	raw_spin_lock(&drvdata->spinlock);
 
@@ -479,19 +532,19 @@ int cti_channel_setop(struct device *dev, enum cti_chan_set_op op,
 	case CTI_CHAN_SET:
 		config->ctiappset |= chan_bitmask;
 		reg_value  = config->ctiappset;
-		reg_offset = CTIAPPSET;
+		reg_offset = cti_offset(drvdata, INDEX_CTIAPPSET, 0);
 		break;
 
 	case CTI_CHAN_CLR:
 		config->ctiappset &= ~chan_bitmask;
 		reg_value = chan_bitmask;
-		reg_offset = CTIAPPCLEAR;
+		reg_offset = cti_offset(drvdata, INDEX_CTIAPPCLEAR, 0);
 		break;
 
 	case CTI_CHAN_PULSE:
 		config->ctiappset &= ~chan_bitmask;
 		reg_value = chan_bitmask;
-		reg_offset = CTIAPPPULSE;
+		reg_offset = cti_offset(drvdata, INDEX_CTIAPPPULSE, 0);
 		break;
 
 	default:
@@ -895,6 +948,7 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
 	struct coresight_desc cti_desc;
 	struct coresight_platform_data *pdata = NULL;
 	struct resource *res = &adev->res;
+	u32 devarch;
 
 	/* driver data*/
 	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
@@ -981,9 +1035,28 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
 	drvdata->csdev_release = drvdata->csdev->dev.release;
 	drvdata->csdev->dev.release = cti_device_release;
 
+	/* check architect value*/
+	devarch = readl_relaxed(drvdata->base + CORESIGHT_DEVARCH);
+	if (CTI_DEVARCH_ARCHITECT(devarch) == ARCHITECT_QCOM) {
+		drvdata->subtype = QCOM_CTI;
+		drvdata->offsets = cti_extended_offset;
+		/*
+		 * QCOM CTI does not implement Claimtag functionality as
+		 * per CoreSight specification, but its CLAIMSET register
+		 * is incorrectly initialized to 0xF. This can mislead
+		 * tools or drivers into thinking the component is claimed.
+		 *
+		 * Reset CLAIMSET to 0 to reflect that no claims are active.
+		 */
+		writel_relaxed(0, drvdata->base + CORESIGHT_CLAIMSET);
+	} else {
+		drvdata->subtype = ARM_STD_CTI;
+		drvdata->offsets = cti_normal_offset;
+	}
+
 	/* all done - dec pm refcount */
 	pm_runtime_put(&adev->dev);
-	dev_info(&drvdata->csdev->dev, "CTI initialized\n");
+	dev_info(&drvdata->csdev->dev, "CTI initialized; subtype=%d\n", drvdata->subtype);
 	return 0;
 
 pm_release:
diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
index a9df77215141..12a495382999 100644
--- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
@@ -172,9 +172,8 @@ static struct attribute *coresight_cti_attrs[] = {
 
 /* register based attributes */
 
-/* Read registers with power check only (no enable check). */
-static ssize_t coresight_cti_reg_show(struct device *dev,
-			   struct device_attribute *attr, char *buf)
+static ssize_t coresight_cti_mgmt_reg_show(struct device *dev,
+					   struct device_attribute *attr, char *buf)
 {
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct cs_off_attribute *cti_attr = container_of(attr, struct cs_off_attribute, attr);
@@ -189,6 +188,40 @@ static ssize_t coresight_cti_reg_show(struct device *dev,
 	return sysfs_emit(buf, "0x%x\n", val);
 }
 
+/* Read registers with power check only (no enable check). */
+static ssize_t coresight_cti_reg_show(struct device *dev,
+				      struct device_attribute *attr, char *buf)
+{
+	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	struct cs_off_attribute *cti_attr = container_of(attr, struct cs_off_attribute, attr);
+	u32 idx, val = 0;
+
+	pm_runtime_get_sync(dev->parent);
+	raw_spin_lock(&drvdata->spinlock);
+	idx = drvdata->config.ext_reg_sel;
+	if (drvdata->config.hw_powered) {
+		switch (cti_attr->off) {
+		case INDEX_CTITRIGINSTATUS:
+		case INDEX_CTITRIGOUTSTATUS:
+		case INDEX_ITTRIGINACK:
+		case INDEX_ITTRIGOUT:
+		case INDEX_ITTRIGOUTACK:
+		case INDEX_ITTRIGIN:
+			val = readl_relaxed(drvdata->base +
+					    cti_offset(drvdata, cti_attr->off, idx));
+			break;
+
+		default:
+			val = readl_relaxed(drvdata->base + cti_offset(drvdata, cti_attr->off, 0));
+			break;
+		}
+	}
+
+	raw_spin_unlock(&drvdata->spinlock);
+	pm_runtime_put_sync(dev->parent);
+	return sysfs_emit(buf, "0x%x\n", val);
+}
+
 /* Write registers with power check only (no enable check). */
 static __maybe_unused ssize_t coresight_cti_reg_store(struct device *dev,
 						      struct device_attribute *attr,
@@ -197,19 +230,39 @@ static __maybe_unused ssize_t coresight_cti_reg_store(struct device *dev,
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct cs_off_attribute *cti_attr = container_of(attr, struct cs_off_attribute, attr);
 	unsigned long val = 0;
+	u32 idx;
 
 	if (kstrtoul(buf, 0, &val))
 		return -EINVAL;
 
 	pm_runtime_get_sync(dev->parent);
 	raw_spin_lock(&drvdata->spinlock);
-	if (drvdata->config.hw_powered)
-		cti_write_single_reg(drvdata, cti_attr->off, val);
+	idx = drvdata->config.ext_reg_sel;
+	if (drvdata->config.hw_powered) {
+		switch (cti_attr->off) {
+		case INDEX_ITTRIGINACK:
+		case INDEX_ITTRIGOUT:
+			cti_write_single_reg(drvdata, cti_offset(drvdata, cti_attr->off, idx), val);
+			break;
+
+		default:
+			cti_write_single_reg(drvdata, cti_offset(drvdata, cti_attr->off, 0), val);
+			break;
+		}
+	}
 	raw_spin_unlock(&drvdata->spinlock);
 	pm_runtime_put_sync(dev->parent);
 	return size;
 }
 
+#define coresight_cti_mgmt_reg(name, offset)	                        \
+	(&((struct cs_off_attribute[]) {                                \
+	   {                                                            \
+		__ATTR(name, 0444, coresight_cti_mgmt_reg_show, NULL),  \
+		offset							\
+	   }								\
+	})[0].attr.attr)
+
 #define coresight_cti_reg(name, offset)					\
 	(&((struct cs_off_attribute[]) {				\
 	   {								\
@@ -237,17 +290,17 @@ static __maybe_unused ssize_t coresight_cti_reg_store(struct device *dev,
 
 /* coresight management registers */
 static struct attribute *coresight_cti_mgmt_attrs[] = {
-	coresight_cti_reg(devaff0, CTIDEVAFF0),
-	coresight_cti_reg(devaff1, CTIDEVAFF1),
-	coresight_cti_reg(authstatus, CORESIGHT_AUTHSTATUS),
-	coresight_cti_reg(devarch, CORESIGHT_DEVARCH),
-	coresight_cti_reg(devid, CORESIGHT_DEVID),
-	coresight_cti_reg(devtype, CORESIGHT_DEVTYPE),
-	coresight_cti_reg(pidr0, CORESIGHT_PERIPHIDR0),
-	coresight_cti_reg(pidr1, CORESIGHT_PERIPHIDR1),
-	coresight_cti_reg(pidr2, CORESIGHT_PERIPHIDR2),
-	coresight_cti_reg(pidr3, CORESIGHT_PERIPHIDR3),
-	coresight_cti_reg(pidr4, CORESIGHT_PERIPHIDR4),
+	coresight_cti_mgmt_reg(devaff0, CTIDEVAFF0),
+	coresight_cti_mgmt_reg(devaff1, CTIDEVAFF1),
+	coresight_cti_mgmt_reg(authstatus, CORESIGHT_AUTHSTATUS),
+	coresight_cti_mgmt_reg(devarch, CORESIGHT_DEVARCH),
+	coresight_cti_mgmt_reg(devid, CORESIGHT_DEVID),
+	coresight_cti_mgmt_reg(devtype, CORESIGHT_DEVTYPE),
+	coresight_cti_mgmt_reg(pidr0, CORESIGHT_PERIPHIDR0),
+	coresight_cti_mgmt_reg(pidr1, CORESIGHT_PERIPHIDR1),
+	coresight_cti_mgmt_reg(pidr2, CORESIGHT_PERIPHIDR2),
+	coresight_cti_mgmt_reg(pidr3, CORESIGHT_PERIPHIDR3),
+	coresight_cti_mgmt_reg(pidr4, CORESIGHT_PERIPHIDR4),
 	NULL,
 };
 
@@ -258,13 +311,15 @@ static struct attribute *coresight_cti_mgmt_attrs[] = {
  * If inaccessible & pcached_val not NULL then show cached value.
  */
 static ssize_t cti_reg32_show(struct device *dev, char *buf,
-			      u32 *pcached_val, int reg_offset)
+			      u32 *pcached_val, int index)
 {
 	u32 val = 0;
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct cti_config *config = &drvdata->config;
+	int reg_offset;
 
 	raw_spin_lock(&drvdata->spinlock);
+	reg_offset = cti_offset(drvdata, index, 0);
 	if ((reg_offset >= 0) && cti_active(config)) {
 		CS_UNLOCK(drvdata->base);
 		val = readl_relaxed(drvdata->base + reg_offset);
@@ -284,11 +339,12 @@ static ssize_t cti_reg32_show(struct device *dev, char *buf,
  * if reg_offset >= 0 then write through if enabled.
  */
 static ssize_t cti_reg32_store(struct device *dev, const char *buf,
-			       size_t size, u32 *pcached_val, int reg_offset)
+			       size_t size, u32 *pcached_val, int index)
 {
 	unsigned long val;
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct cti_config *config = &drvdata->config;
+	int reg_offset;
 
 	if (kstrtoul(buf, 0, &val))
 		return -EINVAL;
@@ -298,6 +354,7 @@ static ssize_t cti_reg32_store(struct device *dev, const char *buf,
 	if (pcached_val)
 		*pcached_val = (u32)val;
 
+	reg_offset = cti_offset(drvdata, index, 0);
 	/* write through if offset and enabled */
 	if ((reg_offset >= 0) && cti_active(config))
 		cti_write_single_reg(drvdata, reg_offset, val);
@@ -306,14 +363,14 @@ static ssize_t cti_reg32_store(struct device *dev, const char *buf,
 }
 
 /* Standard macro for simple rw cti config registers */
-#define cti_config_reg32_rw(name, cfgname, offset)			\
+#define cti_config_reg32_rw(name, cfgname, index)			\
 static ssize_t name##_show(struct device *dev,				\
 			   struct device_attribute *attr,		\
 			   char *buf)					\
 {									\
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);	\
 	return cti_reg32_show(dev, buf,					\
-			      &drvdata->config.cfgname, offset);	\
+			      &drvdata->config.cfgname, index);		\
 }									\
 									\
 static ssize_t name##_store(struct device *dev,				\
@@ -322,7 +379,7 @@ static ssize_t name##_store(struct device *dev,				\
 {									\
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);	\
 	return cti_reg32_store(dev, buf, size,				\
-			       &drvdata->config.cfgname, offset);	\
+			       &drvdata->config.cfgname, index);	\
 }									\
 static DEVICE_ATTR_RW(name)
 
@@ -356,6 +413,46 @@ static ssize_t inout_sel_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(inout_sel);
 
+/*
+ * QCOM CTI supports up to 128 triggers, there are 6 registers need to be
+ * expanded to up to 4 instances, and ext_reg_sel can be used to indicate
+ * which one is in use.
+ * CTITRIGINSTATUS, CTITRIGOUTSTATUS,
+ * ITTRIGIN, ITTRIGOUT,
+ * ITTRIGINACK, ITTRIGOUTACK.
+ */
+static ssize_t ext_reg_sel_show(struct device *dev,
+				struct device_attribute *attr,
+				char *buf)
+{
+	u32 val;
+	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	raw_spin_lock(&drvdata->spinlock);
+	val = drvdata->config.ext_reg_sel;
+	raw_spin_unlock(&drvdata->spinlock);
+	return sprintf(buf, "%d\n", val);
+}
+
+static ssize_t ext_reg_sel_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t size)
+{
+	unsigned long val;
+	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	if (kstrtoul(buf, 0, &val))
+		return -EINVAL;
+	if (val > ((drvdata->config.nr_trig_max + 31) / 32 - 1))
+		return -EINVAL;
+
+	raw_spin_lock(&drvdata->spinlock);
+	drvdata->config.ext_reg_sel = val;
+	raw_spin_unlock(&drvdata->spinlock);
+	return size;
+}
+static DEVICE_ATTR_RW(ext_reg_sel);
+
 static ssize_t inen_show(struct device *dev,
 			 struct device_attribute *attr,
 			 char *buf)
@@ -389,7 +486,7 @@ static ssize_t inen_store(struct device *dev,
 
 	/* write through if enabled */
 	if (cti_active(config))
-		cti_write_single_reg(drvdata, CTIINEN(index), val);
+		cti_write_single_reg(drvdata, cti_offset(drvdata, INDEX_CTIINEN, index), val);
 	raw_spin_unlock(&drvdata->spinlock);
 	return size;
 }
@@ -428,7 +525,7 @@ static ssize_t outen_store(struct device *dev,
 
 	/* write through if enabled */
 	if (cti_active(config))
-		cti_write_single_reg(drvdata, CTIOUTEN(index), val);
+		cti_write_single_reg(drvdata, cti_offset(drvdata, INDEX_CTIOUTEN, index), val);
 	raw_spin_unlock(&drvdata->spinlock);
 	return size;
 }
@@ -448,9 +545,9 @@ static ssize_t intack_store(struct device *dev,
 }
 static DEVICE_ATTR_WO(intack);
 
-cti_config_reg32_rw(gate, ctigate, CTIGATE);
-cti_config_reg32_rw(asicctl, asicctl, ASICCTL);
-cti_config_reg32_rw(appset, ctiappset, CTIAPPSET);
+cti_config_reg32_rw(gate, ctigate, INDEX_CTIGATE);
+cti_config_reg32_rw(asicctl, asicctl, INDEX_ASICCTL);
+cti_config_reg32_rw(appset, ctiappset, INDEX_CTIAPPSET);
 
 static ssize_t appclear_store(struct device *dev,
 			      struct device_attribute *attr,
@@ -504,6 +601,7 @@ static DEVICE_ATTR_WO(apppulse);
  */
 static struct attribute *coresight_cti_regs_attrs[] = {
 	&dev_attr_inout_sel.attr,
+	&dev_attr_ext_reg_sel.attr,
 	&dev_attr_inen.attr,
 	&dev_attr_outen.attr,
 	&dev_attr_gate.attr,
@@ -512,20 +610,20 @@ static struct attribute *coresight_cti_regs_attrs[] = {
 	&dev_attr_appset.attr,
 	&dev_attr_appclear.attr,
 	&dev_attr_apppulse.attr,
-	coresight_cti_reg(triginstatus, CTITRIGINSTATUS),
-	coresight_cti_reg(trigoutstatus, CTITRIGOUTSTATUS),
-	coresight_cti_reg(chinstatus, CTICHINSTATUS),
-	coresight_cti_reg(choutstatus, CTICHOUTSTATUS),
+	coresight_cti_reg(triginstatus, INDEX_CTITRIGINSTATUS),
+	coresight_cti_reg(trigoutstatus, INDEX_CTITRIGOUTSTATUS),
+	coresight_cti_reg(chinstatus, INDEX_CTICHINSTATUS),
+	coresight_cti_reg(choutstatus, INDEX_CTICHOUTSTATUS),
 #ifdef CONFIG_CORESIGHT_CTI_INTEGRATION_REGS
-	coresight_cti_reg_rw(itctrl, CORESIGHT_ITCTRL),
-	coresight_cti_reg(ittrigin, ITTRIGIN),
-	coresight_cti_reg(itchin, ITCHIN),
-	coresight_cti_reg_rw(ittrigout, ITTRIGOUT),
-	coresight_cti_reg_rw(itchout, ITCHOUT),
-	coresight_cti_reg(itchoutack, ITCHOUTACK),
-	coresight_cti_reg(ittrigoutack, ITTRIGOUTACK),
-	coresight_cti_reg_wo(ittriginack, ITTRIGINACK),
-	coresight_cti_reg_wo(itchinack, ITCHINACK),
+	coresight_cti_reg_rw(itctrl, INDEX_ITCTRL),
+	coresight_cti_reg(ittrigin, INDEX_ITTRIGIN),
+	coresight_cti_reg(itchin, INDEX_ITCHIN),
+	coresight_cti_reg_rw(ittrigout, INDEX_ITTRIGOUT),
+	coresight_cti_reg_rw(itchout, INDEX_ITCHOUT),
+	coresight_cti_reg(itchoutack, INDEX_ITCHOUTACK),
+	coresight_cti_reg(ittrigoutack, INDEX_ITTRIGOUTACK),
+	coresight_cti_reg_wo(ittriginack, INDEX_ITTRIGINACK),
+	coresight_cti_reg_wo(itchinack, INDEX_ITCHINACK),
 #endif
 	NULL,
 };
@@ -740,6 +838,7 @@ static ssize_t chan_xtrigs_reset_store(struct device *dev,
 	config->ctiappset = 0;
 	config->ctiinout_sel = 0;
 	config->xtrig_rchan_sel = 0;
+	config->ext_reg_sel = 0;
 
 	/* if enabled then write through */
 	if (cti_active(config))
diff --git a/drivers/hwtracing/coresight/coresight-cti.h b/drivers/hwtracing/coresight/coresight-cti.h
index e7b88b07cffe..fdd6d8892a95 100644
--- a/drivers/hwtracing/coresight/coresight-cti.h
+++ b/drivers/hwtracing/coresight/coresight-cti.h
@@ -57,7 +57,38 @@ struct fwnode_handle;
  * Max of in and out defined in the DEVID register.
  * - pick up actual number used from .dts parameters if present.
  */
-#define CTIINOUTEN_MAX		32
+#define CTIINOUTEN_MAX		128
+
+/* Qcom CTI supports up to 128 triggers*/
+enum cti_subtype {
+	ARM_STD_CTI,
+	QCOM_CTI,
+};
+
+/* These registers are remapped in Qcom CTI*/
+enum cti_offset_index {
+	INDEX_CTIINTACK,
+	INDEX_CTIAPPSET,
+	INDEX_CTIAPPCLEAR,
+	INDEX_CTIAPPPULSE,
+	INDEX_CTIINEN,
+	INDEX_CTIOUTEN,
+	INDEX_CTITRIGINSTATUS,
+	INDEX_CTITRIGOUTSTATUS,
+	INDEX_CTICHINSTATUS,
+	INDEX_CTICHOUTSTATUS,
+	INDEX_CTIGATE,
+	INDEX_ASICCTL,
+	INDEX_ITCHINACK,
+	INDEX_ITTRIGINACK,
+	INDEX_ITCHOUT,
+	INDEX_ITTRIGOUT,
+	INDEX_ITCHOUTACK,
+	INDEX_ITTRIGOUTACK,
+	INDEX_ITCHIN,
+	INDEX_ITTRIGIN,
+	INDEX_ITCTRL,
+};
 
 /**
  * Group of related trigger signals
@@ -149,6 +180,9 @@ struct cti_config {
 	bool trig_filter_enable;
 	u8 xtrig_rchan_sel;
 
+	/* qcom_cti regs' index */
+	u8 ext_reg_sel;
+
 	/* cti cross trig programmable regs */
 	u8 ctiinout_sel;
 	u32 ctiappset;
@@ -181,6 +215,8 @@ struct cti_drvdata {
 	struct cti_config config;
 	struct list_head node;
 	void (*csdev_release)(struct device *dev);
+	enum cti_subtype subtype;
+	const u32 *offsets;
 };
 
 /*
@@ -235,6 +271,11 @@ struct coresight_platform_data *
 coresight_cti_get_platform_data(struct device *dev);
 const char *cti_plat_get_node_name(struct fwnode_handle *fwnode);
 
+static inline u32 cti_offset(struct cti_drvdata *drvdata, int index, int num)
+{
+	return drvdata->offsets[index] + 4 * num;
+}
+
 /* cti powered and enabled */
 static inline bool cti_active(struct cti_config *cfg)
 {
diff --git a/drivers/hwtracing/coresight/qcom-cti.h b/drivers/hwtracing/coresight/qcom-cti.h
new file mode 100644
index 000000000000..3c46317dd81f
--- /dev/null
+++ b/drivers/hwtracing/coresight/qcom-cti.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#define ARCHITECT_QCOM 0x477
+
+/* CTI programming registers */
+#define	QCOM_CTIINTACK		0x020
+#define	QCOM_CTIAPPSET		0x004
+#define	QCOM_CTIAPPCLEAR	0x008
+#define	QCOM_CTIAPPPULSE	0x00C
+#define	QCOM_CTIINEN		0x400
+#define	QCOM_CTIOUTEN		0x800
+#define	QCOM_CTITRIGINSTATUS	0x040
+#define	QCOM_CTITRIGOUTSTATUS	0x060
+#define	QCOM_CTICHINSTATUS	0x080
+#define	QCOM_CTICHOUTSTATUS	0x084
+#define	QCOM_CTIGATE		0x088
+#define	QCOM_ASICCTL		0x08c
+/* Integration test registers */
+#define	QCOM_ITCHINACK		0xE70
+#define	QCOM_ITTRIGINACK	0xE80
+#define	QCOM_ITCHOUT		0xE74
+#define	QCOM_ITTRIGOUT		0xEA0
+#define	QCOM_ITCHOUTACK		0xE78
+#define	QCOM_ITTRIGOUTACK	0xEC0
+#define	QCOM_ITCHIN		0xE7C
+#define	QCOM_ITTRIGIN		0xEE0

-- 
2.43.0


