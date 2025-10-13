Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 549E0CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 06:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GrDvM6oXP/TotZ8t4JES1PUvRpzDQj/VgtwmagjYzTo=; b=rNFJoH3711thvS
	GoFzBR2R6E28M02ogTo/bWAhq7wUhQBBNn0yWmmj/W9sLoRLHVFyRxCXhyGJhheKrkuwCp3qXxV6h
	71rBQ1LO5PRpa0SMDX2PL4jn0LXkIO28omgDSzJaQuPqgj1zPzcIFBsC7UkgtpH3Lm3QGrYudXX8S
	qykllq2inVhTjHjpEjSh567x4oh97pbETdkxNNKf3CGO76ggc7WoKQIYBcOd4y0OICBwO9vbZCbKl
	JC7ALhFBMXwVUMgczWv9yHG66/hhqIgNqd/kEm+1f717WpmFHCkpp38g2B1mgk/cLHad2f0CVV+OB
	Xvucjvod3JXz8cuvXwZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8BmY-0000000CLHt-3QYU;
	Mon, 13 Oct 2025 06:11:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8BmV-0000000CLGz-31ky
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 06:11:41 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59D2n7Ka022230
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 06:11:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GrDvM6oXP/TotZ8t4JES1P
	UvRpzDQj/VgtwmagjYzTo=; b=BX7bU1FpfzEFXW5zNUpNNdrG9L0/i3KXwm4O1T
	E0NGwU/L4O/BNOsBvMnoNRvvXChnRHi9po6gqLt5zQWDExhFd3Drqe4dRe+kEfG2
	zblTOoWZEqeRDbeLa4ErC4p1uXcg9oZzxOXKqT2xmPF8lJjgHzmkYHk1arqLebbY
	90eoRJU7JoXy+bs6W39I13EJ6YO0n0iydgFypAIhitUYPAD9uu6F69meBalRkLBP
	JrVO4yBD5Yio2jwQrtiiezdIMbHC5TDREIzYoOb3VNIJVg1dfva66TvlZxsWE1bb
	BwTKL1Z8Gw7+Nk3RJqGj86MuMLe5RwmKu/UIYO7DUrXt+cqw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qgdfubpn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 06:11:39 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-27eca7298d9so198068475ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 23:11:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760335898; x=1760940698;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GrDvM6oXP/TotZ8t4JES1PUvRpzDQj/VgtwmagjYzTo=;
        b=L3bk1i/AQgintYMWKgWXvtK1PdgRXqhqECIqSoL9A4tz6kSXkfWOm2kMzDXfihzRAm
         PPJ7OVXd27OeD5KukTjODhfzqE5euOnjdyCK4YKGkvt2jRHOYkUbnGhCM/5yFjUJ189d
         QMQVEFSQ9Jml281wEvumKT9z9kzEbWkkXeN6UMjYK8XFRbGLs8ZRzrytYd2OJJXJxe++
         dOGdQLaUP3MV86dCbTUvFmXwueqGpom7qQc/6+0PNT+MoD2nkKEfsGaTevRPR+uPHkja
         66v8xo4AfYm4jmLzfzbyugp+yK53oYFM9zQ48LKj+oH/IvZ9GNFzIuccTVmiuL1lABG3
         BBZg==
X-Forwarded-Encrypted: i=1; AJvYcCXswdYtyE2v5bxC+gjPzJmxiWWaYejJvyql7yj9WuBXNVfxccb5+zLtp9bvst/3orn/JV9ae0WbjBZEwKvvyy/f@lists.infradead.org
X-Gm-Message-State: AOJu0Yxdl+IuOy8Of1Sp10INJGaeM2+1AN2Jz19ujr7hy8HLEn6+VeCV
	VQsxuohIcRskjUd1TYs/YV/iNMiRVEzXYVVwnrIpMLp/EcnGHSqqDSjLkdcNzhSLq2PhJihj0ED
	NlwDcwUhNGsPHRV/Ur1ScbCcYYbk8sHpH2fvUko89jv8fuyIwsZtQoDPnWI21E3nLQSY2Ol670e
	+Xwg==
X-Gm-Gg: ASbGncv1fB2cvanVeAEWC/7H1NjXZQc0dLeFwgs9E4k6LxDnxb79kP444qQnhQSUEmF
	eXU7rhLhhiNnz3oRVpB90Y/76SLxIifZBMfmkTQpBAUAoYEYkSRAlQhZqljmuP6CKw9dxamibOA
	kE6Hjm6Hxbo/LU7n9hgvAvTC0dF5N30wS1h/KsI1d50fsFdO+VPzccNLSXRXzcWwwHyAAy5BBEY
	xsl/gWIjgjFeQgw1B88c0eY1bMXwNuFdafFsV+QSTF4p09X1/OwCCdluB5NowFWoPB8EHiLSgkj
	BcsIW8YenmQ1A/dTENfBH0Q7ZMZcO0xZ+Zaycs1ZiJJ/fMNUJjdq/XlcAL/48lvA9RRP4eRpSNa
	RJn18CGo+Khwln3ny8OjE9ul3vL8=
X-Received: by 2002:a17:903:2d1:b0:277:3488:787e with SMTP id d9443c01a7336-29027356933mr247429315ad.12.1760335898249;
        Sun, 12 Oct 2025 23:11:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVYUXzidkgUFrV2iPv99/ku+8bVfeLUvYnCfbn4pDK8/n2MNSkCO63ZBGJ6gT8lPzqENwpIQ==
X-Received: by 2002:a17:903:2d1:b0:277:3488:787e with SMTP id d9443c01a7336-29027356933mr247429035ad.12.1760335897783;
        Sun, 12 Oct 2025 23:11:37 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2904f61a1desm64388675ad.82.2025.10.12.23.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 23:11:37 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v3 0/3] coresight: add static TPDM support
Date: Mon, 13 Oct 2025 14:11:15 +0800
Message-Id: <20251013-add-static-tpdm-support-v3-0-a720b73e83db@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAWY7GgC/x3MQQqEMAxA0atI1hNoLergVWQW1UTNYrQ0VYTi3
 S0u3+L/DMpRWKGvMkQ+RWXfCtyngmn128IoVAy1qRtrrENPhJp8kglToD/qEcIeEzpnxs5SS2b
 +QqlD5Fmu9zz87vsBw+t+Z2kAAAA=
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Tao Zhang <tao.zhang@oss.qualcomm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760335892; l=1812;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=m3igMj4R7s1y9FpKNJWImJDhwhMcIhXy+s3EIqKrm+A=;
 b=gcdfQfaDmMEaFKBEjYpbgmeW/uSoRcEwX+ppPkiBB+DRMJInxmaqgMFqFzaBJODKMmWiMVmkx
 F3Gb7ccw0aQBZkip7Tv53zEw0TTgHXqtUdvnmKX2l6NPxUNo//ABJ8y
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyNSBTYWx0ZWRfX3WDsYS2dM42F
 XTN5KLE5v6zMhSZHlpC+VKEu54bxzePIzSGBIreqlwB2xDmILSoUUzgZzpzV5/xFj9pD17f7KB1
 ZNVonrLOzQk53lgEEFmX4bt0uruo/1TCDsQijeL2pvFuwC+kFRRUWmEGZw3+FQJq7mm3BMqMdQi
 aTdWbxkdRjzqoV0D22tZr0x/AJNKPGqcc5wy4d99cO7HlYfuJFBdlw3rSGIGqVEe6JcB+UU/5WI
 WFekDsC837rxOvt450iYYIedzJLZSAtTG5kggHtUyGgADperrNPDxSfFsi4SJqmXGOln6Ogrvth
 rR8DjgPv6iPD6i+SdMB1BPLZwQPBdtnXR4qG5NgRSmF2hTdiPKifJo+F0Ah1Cx9V1ZkB0UdY/vA
 X10ONAdffqdzxDz7I/zYTAzH/tHiyg==
X-Proofpoint-GUID: rAlHBmSdl7RuNZMElEKUOfkIuWMo2RUv
X-Proofpoint-ORIG-GUID: rAlHBmSdl7RuNZMElEKUOfkIuWMo2RUv
X-Authority-Analysis: v=2.4 cv=J4ynLQnS c=1 sm=1 tr=0 ts=68ec981b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=nhnTKuEOM_5bWBThM9gA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_231139_765728_179BE0A7 
X-CRM114-Status: GOOD (  14.36  )
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

The static TPDM function as a dummy source, however, it is essential
to enable the port connected to the TPDA and configure the element size.
Without this, the TPDA cannot correctly receive trace data from the
static TPDM. Since the static TPDM does not require MMIO mapping to
access its registers, a clock controller is not mandatory for its
operation.

Meanwhile, a function has been introduced to determine whether the
current csdev is a static TPDM. This check enables the TPDA device
to correctly read the element size and activate its port accordingly.
Otherwise the TPDA cannot receive the trace data from the TPDM device.

Changes in V3:
1. rebased on next-20251010
Link to V2 - https://lore.kernel.org/all/20250911-add_static_tpdm_support-v2-0-608559d36f74@oss.qualcomm.com/

Changes in V2:
1. Remove the dependency.
2. Collect tags from Rob and Konard for patchset 1 and patchset 3.
Link to V1 - https://lore.kernel.org/all/20250822103008.1029-1-jie.gan@oss.qualcomm.com/

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Jie Gan (3):
      dt-bindings: arm: document the static TPDM compatible
      coresight: tpdm: add static tpdm support
      arm64: dts: qcom: lemans: enable static TPDM

 .../bindings/arm/qcom,coresight-tpdm.yaml          |  23 +++-
 arch/arm64/boot/dts/qcom/lemans.dtsi               | 105 +++++++++++++++
 drivers/hwtracing/coresight/coresight-tpda.c       |   9 ++
 drivers/hwtracing/coresight/coresight-tpdm.c       | 148 ++++++++++++++++-----
 drivers/hwtracing/coresight/coresight-tpdm.h       |   8 ++
 5 files changed, 256 insertions(+), 37 deletions(-)
---
base-commit: 2b763d4652393c90eaa771a5164502ec9dd965ae
change-id: 20251013-add-static-tpdm-support-330b71d6d0f8

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


