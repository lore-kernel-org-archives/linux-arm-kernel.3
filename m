Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6647BCF6C1F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 09:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=l6RdcxF0KkuoMThTWV/0U3PjiCm3+6V4PEqv1V5VmIM=; b=3ShTTxF8q44xKk
	VW8ioopMSGDWiBz5SIVhS/6k1b+1lLewBuiUSMDI7Majk4feBjQcycDmUnhBYL1ZwcqMl2rwq9K5w
	AtmWqgZ30U7jmYsZMt2UVtmkEf6havMolPRpigpKgbv0ByqYPZ4MjMDg8U/6eFTlx9eTDnoBTkugv
	cQssK57qRwebuz6pRx1FWK5r+K/G1De/UaXwsCrM1gQPzLQejTaV7JnUUl4ZxOLZVSLwYSbcmCtJj
	K+ZttK+2bhk5vPBMxkkWw5IXzdQ1Rrpk704YNu7YkVeLJken5OQAWZ5+qDA5J+3zX2cqduvkAIAqq
	MiD4FDwu//3cLswx+n1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdQ4f-0000000EYyX-3fHl;
	Wed, 07 Jan 2026 09:43:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdQ4d-0000000EYy4-0Ksi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 09:43:28 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6078dpad2577895
	for <linux-arm-kernel@lists.infradead.org>; Wed, 7 Jan 2026 09:43:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=l6RdcxF0KkuoMThTWV/0U3
	PjiCm3+6V4PEqv1V5VmIM=; b=bVBEMGcww4Vw7b/c9KYdn7pvMqA4Tcdx8irdqG
	mzf1riG3iQ0XlX0ZlwbBzRBQM7ZrRUGp5n+13S86FKN2q4QS6sxTVHuWZUWGAO9r
	9lEUlf5IudA8uVWFSYsUqhbHR2Zy2C51c5PSxb4HwYmQa8jPilcy0SLsFQkVcLno
	xkfkYz49ekF8qo+LXA8+CCBTOJYVuHSm8DyxvtLIanHO5nL8IDBT/3G3jVOfl+gl
	B/VA5iUTeSH/9HhgkVAzuXSNGvotvF+d3QL1ExXYu/aj9g4z8NHQJs4axaeGG4Zq
	HU/SQvdHqdIqfhVlp2FoXgU20BGKsGRcUlDK5IWxxkZH9VGA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhm658772-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 09:43:25 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34c21341f56so4477446a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 01:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767779004; x=1768383804; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l6RdcxF0KkuoMThTWV/0U3PjiCm3+6V4PEqv1V5VmIM=;
        b=UJn+by8IWlIeg6xee0AgXLBQNtAHaTR2zN3aGfcFrKuk1dgUT8o5zIymNYBwSh0VVo
         phICRtHz1eX6VRGFKnBfuRRISCFg+8NzgPEQivX6F8aHZBNAoveaYq5XLo1jXcYHTIjm
         42UcLLNGs2GGTei9Vp3B6eEOUVRjeyz60hujDjetw9qSM5u18GqTc1dZsb8+n3zSgQ4o
         5YoxePKRBYc1qefn0kGsQ71AqjqFHmz0iO7Y8d9Xiez+6tED15EnsHdO9s8G9+sGlO7f
         +JB632fG8kyyieCgSBT+/dr6fQ/S7pTA2wbbBM1rhX20NUKiiyaF40GNiTJJ2M5mHlzQ
         T4WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767779004; x=1768383804;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l6RdcxF0KkuoMThTWV/0U3PjiCm3+6V4PEqv1V5VmIM=;
        b=ABuYjjfR0Y1TucJVSlb/LzUaP0M5RwjhXgx5ubrhHbslQnPsUcbnZoKhJnQxO8/MYi
         RJWfHCmmKPTkTYxvjFF+cNEv0vznLPsaB/W1V1cguG+37I76vuvENEgEsBmF8eiU/JS0
         KF8CFUmFz8yykTUp5vK28cwUchMfbYVzjavUGr22ltDdVu32Y4bItZ9CAUfl6rFeH2nx
         MOqA+Y0r+qVoU7u0d6zP9/YCCJHKXGgk929H4T6o6U8zBS9F46jmfeBSAG06B0/sfbVQ
         Tuyz47yNmYOyRswZoEdozvSAITPzAGr9wbId+Gwtn+BETqLjc823TBsBt7CKm53MvyQN
         F8xg==
X-Forwarded-Encrypted: i=1; AJvYcCVKiIu3ER3wuUorsiFfeaGq9OJiZWO5thwmlfTGilmXQgUCrRdLR+9rBBYYUaVxFwoiLTnrYR2WcJ+kiYavZso8@lists.infradead.org
X-Gm-Message-State: AOJu0YyQjfaPC0M8t1gWpKzO7Us50lbCZiX90H9SEHUX1MItHf6g+bGt
	csi04dLv2bHC0mAgYVdzcZWhj2PCEjIQdyxm30FNOAse49RSttQdRc7gHglbCHPJM122FDpNi/3
	N2/Y0gYLmihiIEJeeSJzjvwwk0Ya+1P7XV7FdP4a4G2xjwNMoZA5UdeC/zUuN0MwO0V+MLY6/Oc
	NGKMM16cG/8w==
X-Gm-Gg: AY/fxX4zoDz6t05wc0FIoYyfGLJyPu5LCi1Hghdy+RENgab7L8aujwuBOv5c/RbaqGQ
	SlA+Si3RRw1jyb9WtJ7NJEXSWOT2kBZi034kjbTLFpqHqx3ENd9PggeH6sc7B7f4Oa8N27eWnmy
	Bylh8WNc/S5rw4/9xtMomopJivKqn3QRSRw/gssnmOa7sBwcoVwxqJMA7arES/uNG7dKYbt8wxl
	PziWUgE8VCUdoPZP2ZXy0ZRxfAbaoIsfs0RQijTCmaGqrc+t0UqDzf+CdF0lz8VUlVcwBwJx1uL
	UferhInepRDpfqQo5B0TFqY1lw+qBZzbAr3ss4vN1JVYAwiBFjy0QI5mNfaGD6xSnKWp75rk9/F
	UXVwU+zPnBCrhj9RJ3CJH6s/zRNkz0inPRA==
X-Received: by 2002:a17:90b:4a07:b0:339:ec9c:b275 with SMTP id 98e67ed59e1d1-34f68c308camr1992723a91.6.1767779003904;
        Wed, 07 Jan 2026 01:43:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE9utHaerxlmRKQBS/EdaJNmJ7bFN1nMsGjL366kf8cZMjULjE7RzNmpNRtkBxRkq0JoaMtcg==
X-Received: by 2002:a17:90b:4a07:b0:339:ec9c:b275 with SMTP id 98e67ed59e1d1-34f68c308camr1992696a91.6.1767779003444;
        Wed, 07 Jan 2026 01:43:23 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe9568sm4472944b3a.15.2026.01.07.01.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 01:43:23 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v3 00/11] Add support for Multimedia Clock controllers for
 Kaanapali
Date: Wed, 07 Jan 2026 15:13:03 +0530
Message-Id: <20260107-kaanapali-mmcc-v3-v3-0-8e10adc236a8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKcqXmkC/x3MMQqAMAxA0atIZgNRsaBXEYfYRg1qlRaKIN7d4
 viG/x+IElQi9MUDQZJGPX1GUxZgV/aLoLpsqKk2VFGLG7Pni3fF47AWU4NuImvIGWfmDnJ3BZn
 1/p/D+L4fuMB+e2MAAAA=
X-Change-ID: 20260105-kaanapali-mmcc-v3-db0c60d6d6f9
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=XpL3+FF9 c=1 sm=1 tr=0 ts=695e2abd cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=AqjRrIuq8FlCCJD4mHwA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 1VzU30rZieHkOQybUnqwvBefoGJfhC-n
X-Proofpoint-GUID: 1VzU30rZieHkOQybUnqwvBefoGJfhC-n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA3OCBTYWx0ZWRfX/uMDjrd0+Avn
 KEq6bSaudumSv1Vkk6C3TMQYxbAQk7XKetKPygDXKNwkV9miTlmwk+Kbq52WcCLC8X0aC/ZNSRQ
 6162WlAHaIdhTjZ4Fw4MyYC1XOhy6VOvdXcFYjnjS0p1PVg1dyCdZ97PiSzS4D2lpogUHwnX9Hu
 C7ItHiBOuYpReXOhF0JvSfmBr2h/sY6tT5FmzNh5FO6V8hv1mLufkQaCx4RJv9390U+dTv6NhpP
 Syn83sAvsK1ZwTp3a0bMBm18tX2/xjLZw88UDAkVL58g5E2ZewACdBrXgOTcY5JDnREXyVCpXjd
 QkbDBZ47fUyD5jCho5Jcq1cTh6dQ+dg8+HXeeFaAZKA1gTnQXFYfSbaYSCAavEVh5a+KXReeD+O
 QRUZLHwK9sizlWLQdSrUt0ayBTcoFNM1RfHcqs6iyHUkQWMp6gHVf3P/yhQgzDIZn1cBVOMRbXb
 yGrZItyVgP1DFJMv8zg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 adultscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_014327_252880_FAA971C3 
X-CRM114-Status: GOOD (  18.12  )
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

Add support for Display clock controller, Video, Camera and GPU
clock controller for the Qualcomm Kaanapali SoC.

Changes in v3:
 - Add RB tag for CAMCC dt-bindings [Krzysztof]
 - Add more description, commit message for the newly added GX Clock controller
   for GPUCC dt-bindings. Update the complete region for the controller. [Krzysztof]
 - Add RB tag for display clock controller [Konrad]
 - Fix the below for the Video clock controller
	- use lowercase for mem_enable/mem_ack reg.
	- use GENMASK for mem_enable_ack_mask.
	- fix the indentation issue.
	- update to use regmap_set_bits().
 - Fix the below for gx clock controller
	- update offset for gdsc as per new mapping
	- update regmap_config as per new mapping
 - Link to v2: https://lore.kernel.org/lkml/20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com/

Changes in v2:
 - bring in the PLL related code from https://lore.kernel.org/all/20250924-knp-clk-v1-0-29b02b818782@oss.qualcomm.com/
   to this series.
 - Add RB tag for DISPCC dt-bindings [Krzysztof]
 - Remove the patch 'Remove sc8280xp camcc to from sm8450 camcc' as this
   series has no functional dependency.
 - Add RB tag for VIDEOCC dt-bindings [Krzysztof , Bryan D]
 - Add RB tag for GPUCC dt-bindings [Bryan D]
 - Fix the commit log for camera cc driver and add RB tag [Byran D]
 - Add comment for using 'ACCU_CFG_MASK' in video cc driver [Bryan D]
 - Describe GXCLKCTL the newly introduced clock controller in the commit
   log [Bjorn]
 - Move the 'gx_clkctl' driver from subsys initlevel to module.
 - Link to v1: https://lore.kernel.org/lkml/20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com/

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (11):
      clk: qcom: clk-alpha-pll: Update the PLL support for cal_l
      clk: qcom: clk-alpha-pll: Add support for controlling Pongo EKO_T PLL
      clk: qcom: clk-alpha-pll: Add support for controlling Rivian PLL
      dt-bindings: clock: qcom: document Kaanapali DISPCC clock controller
      dt-bindings: clock: qcom: Add support for CAMCC for Kaanapali
      dt-bindings: clock: qcom: Add Kaanapali video clock controller
      dt-bindings: clock: qcom: document the Kaanapali GPU Clock Controller
      clk: qcom: dispcc: Add support for display clock controller Kaanapali
      clk: qcom: camcc: Add support for camera clock controller for Kaanapali
      clk: qcom: Add support for VideoCC driver for Kaanapali
      clk: qcom: Add support for GPUCC and GXCLK for Kaanapali

 .../bindings/clock/qcom,kaanapali-gxclkctl.yaml    |   63 +
 .../bindings/clock/qcom,sm8450-camcc.yaml          |    6 +
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |    2 +
 .../bindings/clock/qcom,sm8450-videocc.yaml        |    3 +
 .../bindings/clock/qcom,sm8550-dispcc.yaml         |    2 +
 drivers/clk/qcom/Kconfig                           |   38 +
 drivers/clk/qcom/Makefile                          |    4 +
 drivers/clk/qcom/cambistmclkcc-kaanapali.c         |  437 ++++
 drivers/clk/qcom/camcc-kaanapali.c                 | 2661 ++++++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.c                   |   20 +-
 drivers/clk/qcom/clk-alpha-pll.h                   |    7 +
 drivers/clk/qcom/dispcc-kaanapali.c                | 1956 ++++++++++++++
 drivers/clk/qcom/gpucc-kaanapali.c                 |  482 ++++
 drivers/clk/qcom/gxclkctl-kaanapali.c              |   76 +
 drivers/clk/qcom/videocc-kaanapali.c               |  821 ++++++
 .../clock/qcom,kaanapali-cambistmclkcc.h           |   33 +
 include/dt-bindings/clock/qcom,kaanapali-camcc.h   |  147 ++
 include/dt-bindings/clock/qcom,kaanapali-dispcc.h  |  109 +
 include/dt-bindings/clock/qcom,kaanapali-gpucc.h   |   47 +
 .../dt-bindings/clock/qcom,kaanapali-gxclkctl.h    |   13 +
 include/dt-bindings/clock/qcom,kaanapali-videocc.h |   58 +
 21 files changed, 6984 insertions(+), 1 deletion(-)
---
base-commit: f8f97927abf7c12382dddc93a144fc9df7919b77
change-id: 20260105-kaanapali-mmcc-v3-db0c60d6d6f9

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>


