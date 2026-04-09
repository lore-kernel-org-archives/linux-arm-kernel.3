Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E506FF364A6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 18:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vYpYuC0n38W0nO+hluOO6jDvBMadgq+PwfBPn4EQ3kw=; b=OhtRSaGrfnz3yR
	jsT66qJVVj8Kr/OeaHMvS/btrhIty+dBxziOGV3eApbEx/O6U1jU+kgLW41yTiAa1HLlsJc30l5Zs
	NaUadWNvXoQyox2yCXZB4hQ7ZD/giGQmLWZa/KjzEDJNPYI7bRKyMk5BMVUqknv1aGQcqu491MFja
	aNvEDkjHaD5WHH3qlbgjPqZaPtbgtQyrU5BwaYjYnFE6qD36AG+sblvNEbwU9XzALImMQum9de5ZY
	MIGGSK0XBXdEtUbLaMW7wo8NeITiB6iQl3fzLZC25xAjEUKTGVXsmatZFjdzxxUFirurOoLCouwus
	TfILyn3309Cz6D/VEgRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAtqM-0000000B3ie-46Uz;
	Thu, 09 Apr 2026 18:11:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAtqK-0000000B3hr-0HsH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 18:11:05 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639CZV94780183
	for <linux-arm-kernel@lists.infradead.org>; Thu, 9 Apr 2026 18:11:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vYpYuC0n38W0nO+hluOO6j
	DvBMadgq+PwfBPn4EQ3kw=; b=oOv1WGiDKNP8CjOph4FPN5YWeLxm8jl8ZEPeHH
	NxDmx0A+301t04L2xXkKAdJ+5J0BE1bJvrlZPk2oNNcNkl9NdhY5sx96RJW8eDwI
	N0y+WxDQq3PtfXK1KKH+ffWlPPaLsE2aYb79UKSq8E8BrJCyKCb25Fg7w3ws6kHH
	pumfCHyQrszHMnvkp3HMkrA6A4U2X/AtsSiwnjVbolVYINyEdNTcDZoN3ZlN7uah
	D2/1VSFjAeHTtG+/90Xydm0G5cIyJc9/FAjArPJdpOfxBr0IudV6UEsdUdHsn21Y
	mAoa0AtQ6/4npULpXkMuepFBdpHlFC6Nxm85bSSJR9sa25zw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dec8hsd3g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 18:11:03 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c70ea91bfe1so690380a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 11:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775758263; x=1776363063; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vYpYuC0n38W0nO+hluOO6jDvBMadgq+PwfBPn4EQ3kw=;
        b=bfZFWIhWC+mR1NteSF6VleB6j9sYqbLNW9mumy/aU+0oBERLG2UJqACos5Z/M3W/P3
         e+UnOo9W0Ft2JcmwCDCh0TZtwblTtP+RFt1kRLI1EiRLIoZeAqR+3jAn9ifYoFDsKOS8
         6CuyH/+USm9Dd4cuLHN+MS4/W+uVuTAkGKwePjRO2K7ll55deJM7XmYsQaqnSa7TAjyC
         m9HqPBIUlOIC7ffqNtK3k1tySx34J8EFkvfvjwJ4/ZhbadhEMk4bwCwTcXbWVFa7/8K/
         TFRbUUJomx8mGf1+ScZ6FERSgDRY0wxqFw9nRwgM/dx/Z8ZHOHxEeZx8n8Drm7dR5SWO
         ZVlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775758263; x=1776363063;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vYpYuC0n38W0nO+hluOO6jDvBMadgq+PwfBPn4EQ3kw=;
        b=kvtnGdLmpD5NE9Ts36BceuE+5ePNsEtEO9pmWbHPdzI+alnHy+FOxvUoKyMTpXigz8
         kDpNCiKVMdvhZ7Jv+CStbwSTyHUG3MpL8CbQucjilDxLt06RJiNSRwgkk5jzXS4I4vQr
         UI8RB9Jttw54209viJyC0H44+hmCLUwOlTOTC0UqSL4iuvBYieE/gN3kHDkO1dxicKK1
         Ou2Y01KkQfctjgQ06ifjOAdJbbi+zvhJecc+zdysFvHss2C6ltLX6eXCjCMc2Ns1Ac2p
         gVIwEawXHAPSXt0KP5eXIS8x9p/pwjR77aTZsITK9cCpufEmVdVm47JaWAg99fw7B8yW
         Vf4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUgL+8PvwKd8p7iM0uCJLCWOmTKmPYvSf66sYdhG8JdF3qCBF2OrZnyYCo9zxWb9hJFYiZPMH7GNYpS/jbgcbui@lists.infradead.org
X-Gm-Message-State: AOJu0Ywos6ZjJ8YykfauDoygkAdZdnC7W1rbJ7alX641YH+gQp56CDTy
	KinHoUTE0zaQWgrr3wpy4DKdHSjdHqCfACFP+WQZIXnTQQVxVJfbVvwxtZRkaGRA+qghliG3t4F
	ss5dhsmfxOOpADPkHisUhBfXHz/RLQy3Jz54JnUmQTG/LahALpZlRlabQCmb8VXeNz+7tdBe2uL
	G9oQ==
X-Gm-Gg: AeBDietxDfjeAmzgdnv0d87L1sn4QblJf3uYgRU3uJrY9JqSmXIetY0A0ajwMoH2T3c
	jBM+gQTEfACkDBkXPK1My9U7wuKSCYHQtzyLTrkQzHJe1VMSxXFrNmT2KW+5/c3wEFNZ1ICVkGp
	CITTSFGmWRKLu6AAvF6U+WVKTCm4GNrGgpp+SLCd+TbeIMJwwM0gTpeyVAdhb6Sk0NJBJmJ8WJK
	URqM1GhGqi7zA4mrKpirZ/cMI+OUK4zYdc099X8swrBpP+ZLqGGK1wjmA/KVR1kjMgzHrgBqkpH
	2woKj1iU9/Bsrz5HbptRmrmdZADxyhSibnFNl5PmCFMupQH7Yb/KqnaFHw4hNbXQFF7SAlXEcbu
	U2KLs4TgxlL0MwKRBmize3RgcX/E2huLX2cVow0slCqJVuw==
X-Received: by 2002:a05:6a20:1587:b0:39b:fbb2:5e46 with SMTP id adf61e73a8af0-39f2f0968d0mr27843582637.40.1775758262377;
        Thu, 09 Apr 2026 11:11:02 -0700 (PDT)
X-Received: by 2002:a05:6a20:1587:b0:39b:fbb2:5e46 with SMTP id adf61e73a8af0-39f2f0968d0mr27843534637.40.1775758261702;
        Thu, 09 Apr 2026 11:11:01 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7921a2d9ebsm66132a12.30.2026.04.09.11.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 11:11:01 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v2 0/8] Add support for Video, Camera, Graphics clock
 controllers on Eliza
Date: Thu, 09 Apr 2026 23:40:41 +0530
Message-Id: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKHr12kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzMDEwNL3dSczKrE+Nzc+OTk+DIjXXMDw2Rjk5SUJHOTVCWgpoKi1LTMCrC
 B0bG1tQCG5W/qYAAAAA==
X-Change-ID: 20260409-eliza_mm_cc_v2-701c34ddb74e
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=PMM/P/qC c=1 sm=1 tr=0 ts=69d7ebb7 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=O432ggMcIDbDob6sqXIA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: P5rNjsYT-GKoU1E3LDi9TYR9k4okj4UF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE2NyBTYWx0ZWRfXy2BVmTw4rjAD
 OrRDzQbEbTpqyj8/cm8X8D5fUKJxWfPuwhXFgLFmKbkZrXg2tl+ENsRf12KL0NqbxN/5I4E0JrT
 zvfuztr0NnQcdS/ivxXLc+Yi7xRD+Ii7QBpIQBiiz6waQ8quGbCkRtqOf2+ByxAWB5N65TalrID
 zIT+cMxq6BDFz2CZsX57wfevrekF9YgtLiX2y3T7lNrrrfvqLPtNj8HbkUwpPs0QcyFChydf8IY
 7yU4auJ+AdulYHxArf5VHjQlC+w2vqgrH2XMzFeAnteZA4lWYypDklS9xQhk/Au9g88MYdj3QKp
 dSA6Y3SQr7MN+wVBOMdr9l9ng5kCPR3EHwt01Hbr5jSWNDMnoTdXVp83MJiU+jeckmAoFv0gMHD
 5FfS3mf4BzLLUvSqM7Qs8+/BzvqGoo6mPi4E0bXIWNOw80jhgmIqFerwsO7IQJJyGbIyAV//J1G
 IoR+x/+TWePuuSnwdSQ==
X-Proofpoint-GUID: P5rNjsYT-GKoU1E3LDi9TYR9k4okj4UF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_111104_142596_CD50F43C 
X-CRM114-Status: GOOD (  15.28  )
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

Add driver for Eliza SoC camera, graphics and Video clock controllers.
The camera clock controller supports the cambist clock controller and
the regular camera clock controller.

The patches have been tested on Qualcomm Eliza MTP board.

Changes in v2:
 - rebased the patches on the latest linux-next.
 - Add new bindings for Video and Camcc.
 - Remove commented code in GPUCC (limiter code).
 - Add device nodes for the corresponding clock controllers.
 - Add RB-by tags for VideoCC and CamCC/Cambistmclk from v1.
 - Link to v1: https://lore.kernel.org/r/20260317-eliza_mm_clock_controllers_v1-v1-0-4696eeda8cfb@oss.qualcomm.com

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (8):
      dt-bindings: clock: qcom: Add video clock controller on Eliza SoC
      dt-bindings: clock: qcom: document the Eliza GPU Clock Controller
      dt-bindings: clock: qcom: Add support for CAMCC for Eliza
      clk: qcom: videocc: Add video clock controller driver for Eliza
      clk: qcom: gpucc: Add GPU Clock Controller driver for Eliza
      clk: qcom: camcc: Add support for camera clock controller for Eliza
      arm64: defconfig: Enable clock controllers on Qualcomm Eliza SoC
      arm64: dts: qcom: eliza: Add support for MM clock controllers

 .../bindings/clock/qcom,eliza-camcc.yaml           |   55 +
 .../bindings/clock/qcom,eliza-videocc.yaml         |   51 +
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |    3 +
 arch/arm64/boot/dts/qcom/eliza.dtsi                |   54 +
 arch/arm64/configs/defconfig                       |    3 +
 drivers/clk/qcom/Kconfig                           |   28 +
 drivers/clk/qcom/Makefile                          |    3 +
 drivers/clk/qcom/cambistmclkcc-eliza.c             |  465 ++++
 drivers/clk/qcom/camcc-eliza.c                     | 2803 ++++++++++++++++++++
 drivers/clk/qcom/gpucc-eliza.c                     |  621 +++++
 drivers/clk/qcom/videocc-eliza.c                   |  403 +++
 .../dt-bindings/clock/qcom,eliza-cambistmclkcc.h   |   32 +
 include/dt-bindings/clock/qcom,eliza-camcc.h       |  151 ++
 include/dt-bindings/clock/qcom,eliza-gpucc.h       |   52 +
 include/dt-bindings/clock/qcom,eliza-videocc.h     |   37 +
 15 files changed, 4761 insertions(+)
---
base-commit: db7efce4ae23ad5e42f5f55428f529ff62b86fab
change-id: 20260409-eliza_mm_cc_v2-701c34ddb74e

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>


