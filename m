Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A052CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 15:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eNMVupg197IOFiA3FKpm30vSm1X1n06imKSWoKuQpJU=; b=TUCvdRuoL9xYaJ
	b076/hARCtAv6l6vIiP4pei+jQ/n737gx1a2zCweYxPdkbaRtcEOa2wQUrrUyYwRhlOwxh0UYt78n
	uR5SMjUbBjL5D5Veb4ZPh9nMAL9NNyhCqIxSVY8Qx2LIK7s+DRzQ8KZTnZfEZRaJc4DFk65kQrnxY
	hn55W32ArRnO2pzxBz1UCuJsFnTLQf7BjAy/XtIxO8fHkH622KFZZI+omkviQ/V7RKJC2D1SgKdK+
	8U8TQA4XDS9ZjiQmJPu/3bFozDeYiTE89XSTr3lea2tm8UaCUG0OQMNuedtKd+7p3QDFXSf4ZayLz
	3o7YzrulAxzkf7ldp5jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umwdn-00000002sNf-2dgi;
	Fri, 15 Aug 2025 15:46:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umuKF-00000002ZOX-0ZiK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 13:18:32 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57F9ltY0004718
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Aug 2025 13:18:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=eNMVupg197IOFiA3FKpm30
	vSm1X1n06imKSWoKuQpJU=; b=SL9kp3a51fm7wWCTEQthkKp2/aXb26FG/BZe2F
	HdxN/+pP0tdBoaybs7VsHgRkw3gBHQ+XhBvfusKIOLZ2Wdoa5w1p6qm3c0NPsz20
	fxySd2+9Bip5XSrWDuRBQVcorIuyU8VO7bC0OhVTSnxlACsEMAlsPbmPTRM7cekx
	1JEvZ/EbFKuTFIRwg9WL5poDajADRS7tNJfaYEvo8WOOp18aGssGYUFXaKl81mBh
	qwMDbENqEBjAgO8EDCnH1qoX/6HdrJ/LRUrAoQK/PbTvhmgfPazPesc5ezKpCyM3
	q5UujaSq9i5rTkSFu08bdCwlVBD3UWYIfk8M17in/OR31saw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48eqhxhb50-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Aug 2025 13:18:29 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b47174b2582so2960992a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Aug 2025 06:18:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755263908; x=1755868708;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eNMVupg197IOFiA3FKpm30vSm1X1n06imKSWoKuQpJU=;
        b=nll4Qbyq6CkCyv5k639Wi16d/bE1ahrfX2X9ijsHttW/s7HWwU/FXtTKumt8wIqCY9
         boJdPchrC/oyhcwuPxNZTqTvwMrvcp0xtS+VKJ2DJSaoqc37sJZBhY2QiJQlDh8WyaIH
         9zP+dAP6gtY2nKm3umobPnM2SY0YSUAJVfmdryeu+TbVmN6pP3UlQZfIPTgE+bKJj4fF
         XIZa2yHZwyw15THiEI1qnknvBF056gN7H8Wn2G4qR7nWkxxtRHl+gFjaT5oEuj+ZEUhq
         IbmPMyeZBKMxQ64JOdjEHgSrlzh+K1DWrQyOZfsZ9n/+BalEdUTRRL7OOyblm6mNcLwy
         yx7A==
X-Forwarded-Encrypted: i=1; AJvYcCVxOWeu8ftc15bW7hVOkxoqXwYL0F3bRi3tpnnRX5OGX3pPa4RnGjk+PEBqnOysd2HoGJuRwQDiFUJRUwRpv6K7@lists.infradead.org
X-Gm-Message-State: AOJu0YyOdVZyf4JrDfjxcLuOfYikaVgzxEgBok5TgCdYyJHLHgx3V3SB
	HiQ8zxsmgW8ar39kXhVGaEo5mnVG20eYWeeO9+YK3eTCe4WnnFwSqXOUFSCdgUqL/7XwaY5mPZr
	BHSMep5UCyePGD3QyncT5+cYrJdk53OpUvg73icumIrBTwzZ81LivTmUo+cTnbc3mvfjm4B2azj
	o5rg==
X-Gm-Gg: ASbGncttRrrP+m3+SuEZ90guQSYXYT8osGdRtfgYeg7JVorRw4AQHpPQ8BHV2TVdvPA
	Z+2Xr9CL0tURF3oFjB923GMODmptVlDNsbAZxZsm1g4XvuMb7Ghmw+2qH/a1/JahRe2mF4ke/hR
	dCneCs2e6qPPnRaO5Q0HgGsq8DWavhTzrmWHIt47RT6I1hRf/MzIH9qAWXcqGpixlhriv2oUhS2
	5Rstd8R/rABjYnlWxnzPgsSEpnphcdg4uIOstBeKZCfEQyc0vd9DnX/EKDTnelqE0baE/TeWXoN
	Bf15JqBxvvwtGjpvMss8v22J04t6NxtT+RLSZxbL3wr/RhX6jHrwGxek3Xz6x3d+wxdeZITHJo0
	LdDuJq2TAmXFHSbk578aQUw==
X-Received: by 2002:a05:6a20:1109:b0:1f5:72eb:8b62 with SMTP id adf61e73a8af0-240d2db2d15mr2527920637.20.1755263908406;
        Fri, 15 Aug 2025 06:18:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtqLEwY3YCUoJbxvU9hUE86eQRwJCftdQkbRQCmCifI7oOfV2iGog3bybplfqEg7vBotQR8Q==
X-Received: by 2002:a05:6a20:1109:b0:1f5:72eb:8b62 with SMTP id adf61e73a8af0-240d2db2d15mr2527895637.20.1755263908005;
        Fri, 15 Aug 2025 06:18:28 -0700 (PDT)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d7944e6sm1256386a12.54.2025.08.15.06.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 06:18:27 -0700 (PDT)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Subject: [PATCH 0/3] coresight-tnoc: Add support for Interconnect TNOC
Date: Fri, 15 Aug 2025 06:18:11 -0700
Message-Id: <20250815-itnoc-v1-0-62c8e4f7ad32@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJMzn2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDC0NT3cySvPxkXRMzAyNz4xTDJAuDZCWg2oKi1LTMCrA50bG1tQD4+X3
 aVwAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755263906; l=976;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=tZvCUIV6qFGLGvVtuK5LH9xKC+z1XirS0OHevyW3A0I=;
 b=/y7yCqYrQE6UiowbeO+3Y1+8kdR4PxSbc5lm7I+OXET3NFKx6udfiCilwy3Xjff35ud/O/7Zu
 0677fDQMCsXATGlVNEG6PABModwamaG4PE2RYi5Fya+6LMEzXMH3Oct
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEwMDA1NyBTYWx0ZWRfX4ailyMZQAY43
 shDUEL5Fob3ZRlMkVr49wzGgbVq3X/2ac9SMCrHC8TUfBqteMNex+wMAqccuHUfMuXhpRmxqKV/
 KnMmVy3JyV4QqFEzhsEqzxjo/m2K3AsbWEwMVDCA0NKwaFE9ZL6bYvgSZ4XYnpM9AsYttUEoj/O
 6jl0Dz940ym5ruRXzg/nU0cdmUdoJ5cgZpaJm8KwkyDapXhty5cNThQkRi3vpypLlDao9cw3Ufc
 rJMqt8nN2raxZDL92he65plKL1qCq6m/Of003b+2E0b2kaYBEXKyQUOXPAqdG8r4d+9m8YgYzu2
 Js0qrHdecx2xEO6OiGCnySaHgW8Y2J12fW4NCXWDygM0OffSYchrf2gcZ+3m1I/tZJxGMtb8t81
 bBo7AmcG
X-Proofpoint-GUID: nN4Eli1-LtwdxD_VLiWhIa3uCq7YtgZd
X-Authority-Analysis: v=2.4 cv=aYNhnQot c=1 sm=1 tr=0 ts=689f33a5 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=f40Fa9qqsm2vFiWgvDIA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: nN4Eli1-LtwdxD_VLiWhIa3uCq7YtgZd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508100057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_061831_321990_B4250F5B 
X-CRM114-Status: GOOD (  13.40  )
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
Yuanfang Zhang (3):
      dt-bindings: arm: qcom: Add Coresight Interconnect TNOC
      coresight-tnoc: add platform driver to support Interconnect TNOC
      coresight-tnoc: Add runtime PM support for Interconnect TNOC

 .../bindings/arm/qcom,coresight-itnoc.yaml         | 108 +++++++++++++
 drivers/hwtracing/coresight/coresight-tnoc.c       | 179 +++++++++++++++------
 2 files changed, 240 insertions(+), 47 deletions(-)
---
base-commit: 2b52cf338d39d684a1c6af298e8204902c026aca
change-id: 20250815-itnoc-460273d1b80c

Best regards,
-- 
Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>


