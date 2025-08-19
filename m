Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 674C7CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 12:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XUfhVRdQ6/3Ng5WhQWu0dh68glt2LJ/MwzF2hOh4lbU=; b=ZLqWd6lM+6Z/7H
	EKrf0L8tCZXIilRLQeisqgd4Jz7dtgYanIXwJFs+BOO/pvAlh9AbixjMfHFKSRwE6DZ9lRwI8vbnT
	NRHtwwdJQHZgl6Gq8ajPPkE3Al45Q1vX4sKUEtVDzto4L2T/NhjC3WJwOgGNxWdEdGxd1AKkFXlpJ
	AZZbgqorbi6z41iq4foQI2KjqtmBrODeJrkfA0V3Q3v1hQ7Ay8zh3NZXJiwzO0HdmFnLh2c9rUTL8
	MCBhNb4m99c/QvKBzX0dsmlevx1iI59u4yo2E8NenuESjBhWLAS5imFwBfmWMy79wb9dCiKghc7N/
	Fia/xFdoM/ekzoLT1/7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoLKu-0000000APlL-21vl;
	Tue, 19 Aug 2025 12:21:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoJZL-0000000A7ws-27BY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 10:27:57 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J90aDq008391
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 10:27:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XUfhVRdQ6/3Ng5WhQWu0dh
	68glt2LJ/MwzF2hOh4lbU=; b=kYlZo1TZzLAka7bMxeRXPCD/1OktA4mIUDGxFl
	SFzBAP/Kgdd3sFXZQmOBIRoS1UDHaOmGU+yfszUmj6qyADgNgrwZJCLkRVC7vpf7
	KomcTlIzyhYTvRQjHcV3tEVe6saagNAOYUD1ZHhH807Q845sbasSzNXUV+8jmpeg
	NQJgS7pgmATZqocaGUfnG1mHqgoR4S1VOHJccydPzUJQwMGOMOX2ef4t5Hnj+yfG
	wnlaUfMk6ceTzL4cIWBGCnNw7XM+FVLORoO0ynB4v1k7CU419bGk12Sc5lJSWsZN
	HowRMOpjDOlskybuFDXfgHBHoT24UTA5VPyX+MzINnzoB87g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jk99r448-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 10:27:53 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-24458194d82so53403315ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 03:27:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755599273; x=1756204073;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XUfhVRdQ6/3Ng5WhQWu0dh68glt2LJ/MwzF2hOh4lbU=;
        b=CKR1pJgCOP2BJ4m/OawHhNernYyVlXli/kvFo1xMXqzAbzUjBIm5EXfuRshXR5M081
         K5qzuUWAnvi6vHGFEQK7HGF7xdT+Lg5hHOFJ6QsX4f6ckZtxiluZJLittMVE+8JT2HC9
         wA9akEBI4xUOhg2q7NuYlt/QNtB55QH6FjXJQLNrS0nrfSR5AqBzFTxhyor5RwyM8ey7
         P+mzPg9gCJNvqU7zUHruQtz1XVao8BT2eupoA4IURxdPlqdoXOpy8qJoAcwj1/kn6xDq
         imBZeBS3ZO/sCybeebHv6NaIoX51nTdA0SlGVi+5f2AV7etcXq3Zm8I2cUVcrz34yBFZ
         HBYg==
X-Forwarded-Encrypted: i=1; AJvYcCXzAhn26R3LuEP14KhHjwaiQ1xVzxiuHnCEgqGLm4mzV0YXmyoT2lbZFc5FAW1scpWMGe3DoSPY0YNU4LH5JQLx@lists.infradead.org
X-Gm-Message-State: AOJu0Ywst2SqQI16jpfemCbg1Ze8kdY5lN1rKVDCQUjYoWVsR3WuFmp7
	cJQuTm0tc+nmFon2pZHRL90boSsnWSkwajBJuc9TtgbfJw7WgGKI4gXv0VuHTyw+cRpLoImj4Px
	fwH+CEJdjyT44hthAS14XndX/CXzo5z4Aov4ZD4mdkjPMd2J18CXx5GY23TwgSx9DOETZom0zMi
	4bdw==
X-Gm-Gg: ASbGnctPLtyy+SFjzDTiLRY3jL9m7Ii+am7q8yjCZCfVgjxX+5Vu02F7mV+2AvZg9go
	NHPlNX4dH7oj9Twy0sBkZHaABwkqu6UHIYPHZUaRCnILbYneKiozEKqXyl8sXL01YqmvGGQiYz0
	JgD7YNY1gA1oQbq9PdXjTZN9XHyt6fM/OF4k4RAqLknYFaPTuJ5lYCokxsRunXFajqsG2UGYn6Z
	8mISnCPYymWBFQI9LXT0UVYC/kxT2LZmbkcXpYT6ZSCor+GAysGMvmuLcpdrLMD3tPCJIPKY4Vg
	12Ls+mgNkU5GJ1BHMs6Je7f7Vi7CF7Z0EIaDzoHPMHYgCPc9RSc33+1uAYJ8T7+Xf9IiE7ocO35
	CJ8pqFIJ5voOs74OfzzRmvw==
X-Received: by 2002:a17:903:1b04:b0:240:84b:a11a with SMTP id d9443c01a7336-245e045d719mr27783385ad.17.1755599272904;
        Tue, 19 Aug 2025 03:27:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkkTrBxR/KyTC6Y/uomVmhYDGXtvfmzqkiXxTlXuSZLzj8nMvj3e+2tNVfCfiHbyyASg7A3w==
X-Received: by 2002:a17:903:1b04:b0:240:84b:a11a with SMTP id d9443c01a7336-245e045d719mr27783065ad.17.1755599272479;
        Tue, 19 Aug 2025 03:27:52 -0700 (PDT)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3237e3eef8fsm2499643a91.18.2025.08.19.03.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 03:27:52 -0700 (PDT)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Subject: [PATCH v2 0/3] coresight-tnoc: Add support for Interconnect TNOC
Date: Tue, 19 Aug 2025 03:27:42 -0700
Message-Id: <20250819-itnoc-v2-0-2d0e6be44e2f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ9RpGgC/12Myw7CIBBFf6WZtTRAX8SV/2G6QKB2EguVqUTT8
 O9il25ucm5Ozg7kIjqCc7VDdAkJgy8gTxWYWfu7Y2gLg+Sy40p0DDcfDGt7LofGipviBoq7Rjf
 h++hcx8Iz0hbi58gm8Xv/C0kwznpplGunQdtGXgJR/XzphwnLUpeBMef8Be4yqRWhAAAA
X-Change-ID: 20250815-itnoc-460273d1b80c
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755599271; l=1208;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=XHlIDamfozF0NB3BJsqHQ2b+McMZm5vEA+kk0C9b6SM=;
 b=7C6M4/UOPx5g23jPQPBAf62HvnTMhZrJOK1dyo2JQfFc3IumuNoX1xYONxfzKsr/SIhyPRB+Y
 uzpmlgMQzCrDHokCxhGOakwF+xq32r0XeI8ruflGjYU3OPvVakR8Mqz
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-ORIG-GUID: cHlBsbX3gOv5ik3sW6_E2FIc_R-FU1bG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDA0NSBTYWx0ZWRfX6Dmg2QVcaY+g
 3V4RB/ORi/3X0zQP1bgHT5s4Lv+mFDWhOnuho5AzHdtVCkharp0pqCrxZpcou0zNnEdv9kGybnP
 tkRAOgbAP994ChcS6yCwsS95zFItIyEHaLfrPNxNsWgTEGTc33S0KWB7U3PBIZ+rEA1dp+FAP4l
 xwT8AR2vUbQuyt+XGwxgMmkYBvCTSoJ9wlYXx2d0BFuZf5fDpcOM0Vx5Lk+PI/vPpGKY7+/88V0
 UQ/+RGGBcHnKznM8o/yhn/RUorFbvTmPkvIEEh9RrN5CelWu/umQGGnlJ7H8jw/RPUauJ49ojS5
 aQ5YB9Vl7bKoIkr8OnqK3sVSYbUcmJI6uQVsqNc4fSLJZXZEIsEHpfMpRg1K4Ge6V0H+RumxbMf
 RyTEdi6b
X-Authority-Analysis: v=2.4 cv=IIMCChvG c=1 sm=1 tr=0 ts=68a451a9 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=s8j_kBg_6ddNrZYoh_kA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: cHlBsbX3gOv5ik3sW6_E2FIc_R-FU1bG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_032755_588306_B3561ADA 
X-CRM114-Status: GOOD (  14.83  )
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

This patch series adds support for the Qualcomm CoreSight Interconnect TNOC
(Trace Network On Chip) block, which acts as a CoreSight graph link forwarding
trace data from subsystems to the Aggregator TNOC. Unlike the Aggregator TNOC,
this block does not support aggregation or ATID assignment.

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
---
Changes in v2:
- Refactor the dt-binding file.
- Change "atid" type from u32 to int, set it as "-EOPNOTSUPP" for non-AMBA device.
- Link to v1: https://lore.kernel.org/r/20250815-itnoc-v1-0-62c8e4f7ad32@oss.qualcomm.com

---
Yuanfang Zhang (3):
      dt-bindings: arm: qcom: Add Coresight Interconnect TNOC
      coresight-tnoc: add platform driver to support Interconnect TNOC
      coresight-tnoc: Add runtime PM support for Interconnect TNOC

 .../bindings/arm/qcom,coresight-itnoc.yaml         |  96 ++++++++++++++
 drivers/hwtracing/coresight/coresight-tnoc.c       | 147 ++++++++++++++++++---
 2 files changed, 226 insertions(+), 17 deletions(-)
---
base-commit: 2b52cf338d39d684a1c6af298e8204902c026aca
change-id: 20250815-itnoc-460273d1b80c

Best regards,
-- 
Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>


