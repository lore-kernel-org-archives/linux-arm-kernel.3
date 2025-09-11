Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A37CA1016
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 09:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WTsuPr0C1+tfJ00SepcUlep/Wkf9W5RYeWTkYV6Ftlg=; b=Xf+yUJthu1kiDt
	hFXudduhxd/bUzdsefRkwKINQ3y8pKdlZ6sSm8gPTLD9AfyiZjrdOrybzhCkFitFK+NsTuuiQLO3z
	lX9qeoXdoLfvHLZpxbAe1etuvAA30kOfPn1+30E1Tj1/Jhv98GWVhNUoGB+926GvTd8o8nUdh2Rgd
	XVAsJImOaY6eDeIy1ayt9yExzAIF2GXG152eJLnJML7bVLmpyQeWLo11kjUijV8i8u4Q7hZ3YpbB3
	8z0Qnt0aqdMTGlSNVjgt0bXJILC0BFBgO2MWSNh2m1R94Rbk0CfKtMksb0eiOVKcKYN5Hb/NDUTvJ
	LK0bIVWAvi8FNj4KglRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwdkB-000000029qX-0Dym;
	Thu, 11 Sep 2025 09:37:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwdk8-000000029pS-2JIg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 09:37:29 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B4k7eP019012
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 09:37:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WTsuPr0C1+tfJ00SepcUle
	p/Wkf9W5RYeWTkYV6Ftlg=; b=cx5gELQaK/mRvLGVN/wca+lSeaEGbg9kIcxqlM
	eRgIDd2b9Aj45goaTK+OyB/pUnfM4FR/M/hhlBYCzdri8T+hQJbWoTrqCyyKeosH
	vvt+lKppo3os/vmZgekYjI1BjU/dS3+i7T6aUr1DQDHdBG8JXjgy5V+BvqAk0r7B
	Yqq3/CCy/WycPEzRwnxDsSQxLk20QI8xzLnjg2I/pqrU9yeVwEhoQC+fxJhzWuuD
	sM2CDM9eInTlJnEEbFhNPbEc1nvrtkfyHL1ASHPpILc8ddxXF26gZtZ+hAAujEZt
	RBMgMcnVZ61MICz66AIZlWdS2OpsqBJS1Ufu1ksfWG9KcE9w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493qphruer-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 09:37:26 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-772642f9fa3so1417045b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 02:37:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757583445; x=1758188245;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WTsuPr0C1+tfJ00SepcUlep/Wkf9W5RYeWTkYV6Ftlg=;
        b=Z4Y7AscOGsmdbicNip3ypuwOx6KsIFkDJOQTJgRAe1O+Ipq1UGIiP6YCVihj+AGDfB
         WnWqRK/LB6cDHrY3hDKJbIBZpI71fM38cYZZuYJ2sc6FfcyoPwGHqtYGvWaPLHhtXSBU
         DNvCVPjRS1HX8c/bPe0BGs4sFXHA5icq3r6ka7b0WSsF8t8KqyMcnWAx3rAjVwlZxYev
         vfJhaMIwPfuW8oQMvnfPOfr8XRZtm5U9ug+LQpP7T8tSzWu7y7Q2QU2NVjY5GN35Ttjv
         faCvGCojke95KX5r1sbx/0zPbJrpc9GO3IbAKrj+/D5zDwYk+4yAKneoW0mbziIy+RUD
         ePVg==
X-Forwarded-Encrypted: i=1; AJvYcCXIgTLCNw4THMQX4qXeLucLsKY+xC7bvlAtbQ+LOYEe2vlhw0u2HWHIq+3W7wsxX7pzBttPqTkiGObfUwICw0EH@lists.infradead.org
X-Gm-Message-State: AOJu0YxAI/0zORVTChNKBOMnK0+13iFRFw4AzlPllKtHeiuJ6Hc/whXe
	Hp0woRehMX+/ytJ3DqgckRAKvtNVnVfqp1/jhGc4sTjnPsye36yX0LS1y+wStZR7q2qfDKyCqk8
	zhdC95YsDqwUeSPzc1XFpZzhV5tKz+YqyjsELSztdaLNA4So6IA+9RC6CLdI8/CaCUPVleXKgNg
	llmQ==
X-Gm-Gg: ASbGnctbmf7vg+PJhfddLmdC9uJur5yQriSvQUZ6Ke+yazCTNv3p/SqflfeHYkn5P9J
	gvnJO9LPvEm8TACFFIe/JEd18kmctqZ1qLJpZ7VAMhLEi61lz+iiQG4zAs8HAS9px5phDfz/zGe
	MoIezCyZs/Nu7+WYKmsS6to8l+ukee8O/q/Nd6a8LXyRM6ahd3IeLge9531XfRCxoAdiXGa1Bzs
	MFvRqhg8R++arkIiAXMbJdPHNd2bbdxMoisri0eoZOZ6jmHrHCin6RA9IyJxXXxzVFLPOpVjhZo
	s8FeXT0xitBMqeDqSGwHhylg3tGYb6LeoGzmPtuVnrjB2elJmCu0n8Kodrd9qgIk6ElZ+Q7dh1z
	jv4DyXnJ+g/DI8qHe2lZlMcpLoEQ=
X-Received: by 2002:a05:6a00:189f:b0:771:f071:28fd with SMTP id d2e1a72fcca58-776032ab5f0mr2570365b3a.14.1757583445422;
        Thu, 11 Sep 2025 02:37:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgldY20V8+urkr4ak6p4W/xCCAQs/UMUOmo7GZX/3jtAUQrbLaxmJeSauXvSu+LH87TMBpFg==
X-Received: by 2002:a05:6a00:189f:b0:771:f071:28fd with SMTP id d2e1a72fcca58-776032ab5f0mr2570345b3a.14.1757583444893;
        Thu, 11 Sep 2025 02:37:24 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7760793b730sm1512930b3a.15.2025.09.11.02.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 02:37:24 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v2 0/3] coresight: add static TPDM support
Date: Thu, 11 Sep 2025 17:36:55 +0800
Message-Id: <20250911-add_static_tpdm_support-v2-0-608559d36f74@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADmYwmgC/x3MwQqDMAyA4VeRnFeogQnzVcYosYkuB2tpOhmI7
 27x+B3+/wCTomIwdgcU2dV0Sw346CB+KS3ilJsBPT79q+8dMQerVDWGmnkN9st5K9VNg0wokZh
 wgFbnIrP+7/P7c54XZWwnvGkAAAA=
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
        Tao Zhang <tao.zhang@oss.qualcomm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757583438; l=1654;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=1KctSP7tT4hdSPnIjjOWWclG2Dc6KV/r5m/+90egGy0=;
 b=hSQm9OeSCW4I7m/wlMm3hqgEn6GP+EQWEMukwgLy9pq1T1ns/FGnhrgKP7d8mj011uKFnkTYE
 hPhMjeqM/96B0FmPC3N14+NdrVJs7IsRLNLBGnQAe6Y2Z7r1dIy+oGf
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=aPDwqa9m c=1 sm=1 tr=0 ts=68c29856 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=nhnTKuEOM_5bWBThM9gA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: BjizaSwS71bpNDJXreEgGiPFS4kYOn3j
X-Proofpoint-ORIG-GUID: BjizaSwS71bpNDJXreEgGiPFS4kYOn3j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTExMDA0MCBTYWx0ZWRfX6NxDfHdY68Fx
 x7anM3jm97tLnBu26nc7qJtWauYQv2fqnbui/XqJRXZR/3EwmBOiBQfamNd7WotT12L6tj/x4Xy
 ydJaFGHDreKRvEA2fBS0YkhTeiXHOGtKT5hjamiR9Lnb1X5mwscAzmaY0OgzDdfpCWYSrtk9K3x
 hasgRR1MqUyK20j6yaTwSzvoGIBSsHGY1645sj1IkK0QiqrDWi1BnQjLVSYgwzNxYXNFjV7qbLY
 8XkZW0Du5gHnnOBf2IEbClhLc2iceNb/OBTN2PXzEcM5pHkR6dr8COhJ7V8BMyuAEQTPAh4iB0e
 IGVA97JMU3lFEukn84fulJMpzt0gNSXcpepnuCnuh0OyEYG9WA6guhip/D+jcT1l1vsSUmQIlmV
 Yoe2lEcu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509110040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_023728_716985_9F2FE40E 
X-CRM114-Status: GOOD (  14.33  )
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
base-commit: 8f21d9da46702c4d6951ba60ca8a05f42870fe8f
change-id: 20250911-add_static_tpdm_support-b6eb2ecada26

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


