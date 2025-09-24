Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA271CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 23:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0HNP1gFppPHSf0xqi+qP+Sk49znPKJdoy6R6/U+ZjdY=; b=EJ/ou2zgEsXswg
	b7kl3hnQQY5GSZCPqagBemltS9xxt8kR0u/XY/R4wO36jLeVZLHTq0gbDOYQ6JBGhk41SpJlntfFy
	l64q/yJdgwB0my2EWNvBCJOzakmxIDPDLzJQW81XLicUiIoSbBi0uK43zwkHus9eROs2o/nDU4IYS
	PjEMyXdbcfOgTQcldOe3KPX5Kj7P3MzVwr0P40vHQGbhijQJmfYd92odMyx/yAfLjTqTCs4zxqDYm
	NjC70v5+sEwJnQA9BwBvn8EKoSYJOOj12GpTG0sGs/fy2tZ9O+8FDKKCispAeyvR2du6oJELqxwGx
	9ORHHVOLl9dohdH4KuJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1ZM3-00000004sUP-04Xv;
	Wed, 24 Sep 2025 23:56:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1ZM0-00000004sSf-2A7r
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 23:56:57 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ODMWGt023756
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 23:56:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0HNP1gFppPHSf0xqi+qP+S
	k49znPKJdoy6R6/U+ZjdY=; b=VYGsU6/HFqzRsGWtkNv/AU8zPPvoBJdwgerQmD
	k+6h/w6Dg5vjO0QocRdME6RB8oq7dt0nOu2jkihi5eKUExqdInu40wwqrOmnU/Hr
	GcJpfRo4FNSOC2KH3L51FE+ObsWE0qK9qlefKWjr4VRQ3zmB+bO+rrBfqelJOZuC
	VECkrAtMzT9cXrjSW/522DF8N4VV6G9fjC5pxwS2pI+JL8OyyscMmgwVKc4338Y3
	OOHUt9Tm86wd7kY9zekn1NEICcG3fMdXk1MkbYb2hKxXQ/tynhnXIIw9xUDvtpPm
	V2eKaQcQPaEMf9Hx9uvkhCCq+ATaPZG9f/CJ/lZYfcboQuww==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bwp0d4e9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 23:56:55 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-24458274406so7197735ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 16:56:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758758214; x=1759363014;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0HNP1gFppPHSf0xqi+qP+Sk49znPKJdoy6R6/U+ZjdY=;
        b=icn7c76HDXDkPVuye4yRNuoOT7D2rWs1DoSEX70zJfoLeDxJ2CLtyRP1axV5dW3p3N
         5gD9Pae+BmZ2+PjLtRFmURmpjLWrRKTPQORhR0YD6w86kvXwzU0p6YZL9vnlrkjo3Z8v
         ILCaO5+iUHKXCZM4dumb8IQBH6Egjmssk27FOyW8dEJKkTaxvnjF0DOOa5Gr4T+AvK2X
         ZN/87Kipj/IiIQbwC7Qf8qv2J4KqthgIEp3IjuJTUPB/tZvLnNMpQdrOitTquDM3m9gy
         muWmK/LppV0Sd/k58EDOhDEs+FcdcipB87oAWgyXZsMayRvAG5j1XtlwNS7QsX7idA/2
         GtnA==
X-Forwarded-Encrypted: i=1; AJvYcCV54xqocXCrIXGARmH5+4wG8XWFlsKUMjAck1AL713f0TfVlr61oI42k4JarTDveSjV+rrdsoQTiOPhgXCP5l9w@lists.infradead.org
X-Gm-Message-State: AOJu0YxM6ZBbRgWKxsx2nrNIfsaxtuqjunsuTVThjcp1bjMAPctyeNvX
	oNJ/h30o1EUb372N3zyQpE0DytXlLfKEVXndWXybYwSRfYWWQ6H4hkebrEKypCe9LYIg7WNl9F/
	rhhCqxrSFOHXUoBixoF0/X9IGPCHOSQ/eHnMr4SGTgESp7wCVIRk2aitlfIL/Qb7ZUGrRMQbC3z
	0k5g==
X-Gm-Gg: ASbGnctq/Q03z8wfKHXvmiek4FjOd52zelFyVw1ehElMK7rYUDsJVsYl3R9Ay4YYKlo
	ceiR61jvHw0IebCD9pWC1Un+kVNBV6mgP9I+CDdST55MiBG8CxRAxCuXld1NkxR709I4ZRa2T1i
	TUpsm0u+3ObWx8ML9FAcuDw8hCvibQQmYpzHUUmRtJRkdW06BAyEeyzJFZonB6G3KA08djz5B3y
	tPV9z43kNoRG8h386nPGcJne0zFECuolUC0dOP57MCUtEVhN3lc55VJPmgE9DIiVfvFcF9/ip+b
	UwwLKqoUJ0HvNzDGcwzHLy3MxCpVNRqra0qqBYw7WRLek5fC3hzLMZUjIRfDDc2Vvf9NV+YVTH7
	WNnJgP/HnJ8T6XCE=
X-Received: by 2002:a17:902:db01:b0:264:8a8d:92dd with SMTP id d9443c01a7336-27ed49deb24mr18743315ad.20.1758758214110;
        Wed, 24 Sep 2025 16:56:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuXpQ87PpiUVqxhBpphiYJD8lJPb8xabQqGHfuiSSPYt/ISD0gfkaw01Z386R6Y3IXmgxA7Q==
X-Received: by 2002:a17:902:db01:b0:264:8a8d:92dd with SMTP id d9443c01a7336-27ed49deb24mr18742945ad.20.1758758213684;
        Wed, 24 Sep 2025 16:56:53 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6881fd6sm4557185ad.87.2025.09.24.16.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:56:53 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH 0/9] Add support for Multimedia Clock controllers for
 Kaanapali
Date: Wed, 24 Sep 2025 16:56:41 -0700
Message-Id: <20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADqF1GgC/y2NQQ6DIBAAv2I4lwTXIOJXGg8LLJVY1IJtmhj/X
 lp7nGQys7NMKVBmfbWzRK+QwzIXqC8VsyPON+LBFWYgQApdd3yaVx6jvU9cewtKSQKPkhV/TeT
 D+9e6DoUNZuIm4WzHbyFi3ij9xUSPZ3ltp32qdokxbH2FBA6EKEPVOuh0Qxa9B+lM4xR5XWuBV
 piWDcfxAXEoDAzAAAAA
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758758212; l=2526;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=zuun76wqTxfr0E9KMvOfXXE9WAPE5crgdVIf0Pmi2yA=;
 b=htJ6K9g7jj5V9bOvCfCGRKnlr3PiOUcrSOdXlT5I0+7V9VD5wCueNm3RniYGdPvwohf1716Fo
 IAKl0lsQs40D9KXhUkLe7pO1vS81ndR/4Py/o8wjsJVE2UJqY/oWjA/
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=KNxaDEFo c=1 sm=1 tr=0 ts=68d48547 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=0ZJa7YLzid_87pQeuMgA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: vFOYVsaE4SBB13RDJL0oDsYxdsz8MzPo
X-Proofpoint-ORIG-GUID: vFOYVsaE4SBB13RDJL0oDsYxdsz8MzPo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDEzOCBTYWx0ZWRfX+Ztg6E3P1tXx
 Nr4H15VNGADQeVXtf3SiVF06mHOwL84XZTkCPmRZ4a8wQLMSqV844oERO4nGcVVcVvHAJMP9ihY
 /gLvZ3rxODhqYLayQwQM8yC+wJCalNGH/E/8peqSbuCv8+sW/6WC5qO+yd8FpGaWbUZBcF/+YO/
 hx3lGMWjgAij+k1G55mP2CHVkaagRlmhbCh28hayr4LgieGHNylUPjV6iTV0lTAi2mDGPS8dnww
 ugD9mxi4Ia63/2xdRiyF8DItoFhZCigaL1CrF2h0eGzlhy3MJ47biSaMhpLFDB2yjvmCuBr+qw9
 4PTu5kNXw4ql4f016mo7vlpPZK+us7PAyk1HnNEqdmTMA5B7nwS6eP3NV9PWhb70EC0WxSdHy5b
 fr8oyvSY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_165656_682092_C3039256 
X-CRM114-Status: GOOD (  14.49  )
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

dependency: https://lore.kernel.org/lkml/20250829-sm8750-videocc-v2-v2-1-4517a5300e41@oss.qualcomm.com/
context dependency: https://lore.kernel.org/all/20250924-knp-clk-v1-0-29b02b818782@oss.qualcomm.com/

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Taniya Das (9):
      dt-bindings: clock: qcom: document Kaanapali DISPCC clock controller
      dt-bindings: clock: sm8450-camcc: Remove sc8280xp camcc to from sm8450 camcc
      dt-bindings: clock: qcom: Add support for CAMCC for Kaanapali
      dt-bindings: clock: qcom: Add Kaanapali video clock controller
      dt-bindings: clock: qcom: document the Kaanapali GPU Clock Controller
      clk: qcom: dispcc: Add support for display clock controller Kaanapali
      clk: qcom: camcc: Add support for camera clock controller for Kaanapali
      clk: qcom: Add support for VideoCC driver for Kaanapali
      drivers: clk: qcom: Add support for GPUCC and GFXCLK for Kaanapali

 .../bindings/clock/qcom,kaanapali-gxclkctl.yaml    |   63 +
 .../bindings/clock/qcom,sm8450-camcc.yaml          |    9 +-
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |    2 +
 .../bindings/clock/qcom,sm8450-videocc.yaml        |    3 +
 .../bindings/clock/qcom,sm8550-dispcc.yaml         |    2 +
 drivers/clk/qcom/Kconfig                           |   38 +
 drivers/clk/qcom/Makefile                          |    4 +
 drivers/clk/qcom/cambistmclkcc-kaanapali.c         |  437 ++++
 drivers/clk/qcom/camcc-kaanapali.c                 | 2661 ++++++++++++++++++++
 drivers/clk/qcom/dispcc-kaanapali.c                | 1956 ++++++++++++++
 drivers/clk/qcom/gpucc-kaanapali.c                 |  494 ++++
 drivers/clk/qcom/gxclkctl-kaanapali.c              |   86 +
 drivers/clk/qcom/videocc-kaanapali.c               |  824 ++++++
 .../clock/qcom,kaanapali-cambistmclkcc.h           |   33 +
 include/dt-bindings/clock/qcom,kaanapali-camcc.h   |  147 ++
 include/dt-bindings/clock/qcom,kaanapali-dispcc.h  |  109 +
 include/dt-bindings/clock/qcom,kaanapali-gpucc.h   |   47 +
 .../dt-bindings/clock/qcom,kaanapali-gxclkctl.h    |   12 +
 include/dt-bindings/clock/qcom,kaanapali-videocc.h |   58 +
 19 files changed, 6983 insertions(+), 2 deletions(-)
---
base-commit: ae2d20002576d2893ecaff25db3d7ef9190ac0b6
change-id: 20250918-knp-mmclk-9fc2775e2fa5

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


