Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC0ECD4F24
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 15:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PLRVRXYe5uxCYuxI2XGDi5MFd0LhFIIf1w7B7feNGuY=; b=L3Fnc2p420An0L
	B/mp6yp+9tRyrMEj6OgICz+H3YpeoVNx8m4dBb0TVoCZl86i+JRujgJVp99oeX2HUp8bvk3TKYzee
	tw8R1sDioj3mEbS4GarJimH956ekr2Wl2MqAAsizvMd3zffS8PQKxwxTQ/DGWkEydEM7/M/thuu/i
	qtjY/B8F8WGKj4DkTrDbF3aeRKmmU9fK1NYdux5NszrAu/pvzv7wR2hTUN+xJSYD/TjD7iTCHCgu0
	+Knuj6dYSgKA+72DHNH/AfWJDluYVquY4CsDHUVM+SFkfusiQl2c+T0eI6dPhfdyNOp4NF6lQkepC
	Oh9JEBc0wWnNugGhxnag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNBV3-0000000345f-33ri;
	Wed, 13 May 2026 15:27:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNBV1-00000003454-2HQI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 15:27:53 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D9jfBj3007206
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 15:27:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PLRVRXYe5uxCYuxI2XGDi5
	MFd0LhFIIf1w7B7feNGuY=; b=SvpdaSqDEuf58NMSIVLGrh34lNxh9ggqfW0V08
	eCMylx2jLky9u1WwsE14Pr2E+uXUSDkZoF2A4dumhbT5RQ5jlQhmq/KnIpz46Fvw
	welp096pKenb0K2VikdluhG3C7oOi20KC4FF/BU+YLPaBy9QxTtq20kcYNJfLngt
	i6iXfv9R1QC+pEr60/jV+YWCQFXm94wg9kiSUjYARn1Ril2jdzqnNTXFr0Ous9+K
	mWotc6Wnvb+r2j6XTz5s7DhpTPANGFUD269YjCLaCrIK7a6VjEfq5CHrSVz0tdej
	vWb6s2hVa0xjypgDGJ/p1/iE5uY8ITRfojaucXR95ZK+VdUQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4py0h9q8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 15:27:50 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2baedd2fd43so42903915ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 08:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778686069; x=1779290869; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PLRVRXYe5uxCYuxI2XGDi5MFd0LhFIIf1w7B7feNGuY=;
        b=CxguDPjYNkAud4PLTmr3J0LFzLuHEVh96L3oEJQIYlmQHwnqsD34c8iB5G0ct2WJXF
         EaYpXDN+cnFmYUikiAZlWGylKD2iUfQXtC563beXFVNP+Pdg3PpGMTX92rNoc6s3hMPt
         thqKtVgEXZPfAmSWoK9zdNQ0KDiOsvXgy6mWibAm3QtlUW+YK4cATXVGxtw0Pl966iI8
         sjmpcdbv7PhORS2+9jEaccCuAQaV4PU+th0tu1jjfSz8ePqSieCEs6uAHIINYhOoEqnr
         4VP/yZ21PmKXAuKJkzlAJdSL1Se1KGDFLmlusbyDXV38EQxkt+QIXgUiVk1ZBo4N1EtE
         XLOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778686069; x=1779290869;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PLRVRXYe5uxCYuxI2XGDi5MFd0LhFIIf1w7B7feNGuY=;
        b=VZ7OMB91sZ0P2h9iom4FesB4IS+Bi84GIGF6goE6yl8V7mhfldtHZQJLZ2aUjWpAQQ
         YEBY2T2H+TD7ASJ745lKcrAJW7nrtYDeZq5UPSMGGiW70r5pIRdtfL1EZJmda8z2Ygxr
         rvb/tnHaJc8CF7gSRRuoOZXmM32ksvAaBSn/IvnUQ2aWG3sRQsmh/lmJkYrOS3PVTRj3
         xJuuiul87QAnkKzaUzIcYyEnmMOGam8rRkrWAkzo3y2pM/SWz1gj3VxBtl9HzoFrCPj+
         MQeoO11NM7n4B4VpOGVIAlP/220wuPAwJUWTkAYMYiNwijQYQOQljdQc2cnFFYuQZ1Lw
         eaoA==
X-Forwarded-Encrypted: i=1; AFNElJ82gd6enUJojV3M/cqrDht+db8jcm7tColflyYzWwTa4/H3UvwbxQ7dR3qyg9glZCbqrHfYiYdvMA4WihjBCfcn@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2dkF2xve8sXJCfXCuiS7hOita5IzsZ853HbDI/xiQ8cUYS6Te
	VbxmCMGU6POfToLikWd38jq7dF8Z9A91IK3Gzng10CxLm5pKXbURpFLlBoK7NFrY6kfxhiVt93V
	ANNLpelDxj8HjFNycPGn+dHnka+cISjX4I3+0cr6b13ROH6HW5zKCFfAnUmlBk/wkyerYaGDOVv
	RP2Q==
X-Gm-Gg: Acq92OGHgCY93r/DhZQtR6uXm8RrIQz0QJjPRblI6cL9kp5cMYcYpY+2Rrn7/v6GWui
	krta3xJbxhvIFueA4SC8Qsl6BE6eWEVyw2XfamjgOi8fBjDlJhiSz2c+GEQd38qBVlIyzlpkrsW
	XMiQ+6fz1DdL1oGy2I0vn0fVtPb15R+ZjO5ABcbYpmuZLev5jPy7vPeUJVQ8ouZBNl1gzDyRTgG
	UNwhB2cRb31KO841j966w8pVcMxAMTxOLy8c8d0LLF9NA9+tnqnOcotxMDWy5XyHVBkwpMLdSMc
	344PHvKflLR3wshBQVwqUfDcoUh/Lotzx3x9ctOb3kRqzD+Ol7jyFeVn0bfJelhVEO7Gcv3SP1I
	B1mjIS/d6CX/n3B/9m+JIUzl5zbsG3HD0Il4MpsLwjD5ong==
X-Received: by 2002:a17:903:22c7:b0:2ba:4086:ecb9 with SMTP id d9443c01a7336-2bd3032f9a5mr37432195ad.36.1778686069428;
        Wed, 13 May 2026 08:27:49 -0700 (PDT)
X-Received: by 2002:a17:903:22c7:b0:2ba:4086:ecb9 with SMTP id d9443c01a7336-2bd3032f9a5mr37431695ad.36.1778686068872;
        Wed, 13 May 2026 08:27:48 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1eafa62sm185042375ad.74.2026.05.13.08.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 08:27:48 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v4 0/7] Add support for Video, Camera, Graphics clock
 controllers on Eliza
Date: Wed, 13 May 2026 20:57:35 +0530
Message-Id: <20260513-eliza_mm_cc_v2-v4-0-e61b5434e8d9@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGeYBGoC/3XMUQuCMBDA8a8ie24yt+myp75HhOht5YFztdWox
 O/e9KWHCo6D/8H9JhKMRxPILpuINxEDujGF3GQE+nY8G4o6NeGMV0yympoBX21jbQPQRE4VK0B
 IrTslDUlPF29O+FjBwzF1j+Hm/HP1I1+uf6k0jHbAoNJaqQ7KvQshv97bAZy1eVpkEaP4KGUhv
 hSxKGUNQjENfFv8UOZ5fgOZ6B+O+QAAAA==
X-Change-ID: 20260409-eliza_mm_cc_v2-701c34ddb74e
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Luca Weiss <luca.weiss@fairphone.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE1OCBTYWx0ZWRfX4rAzTCHIzdZB
 h3eQfDuNj6LqCImHBgEArhiZgjGrC3caHZ17eiEygMSjt73TJNdpCxGmgWteap49fOW74+c7RIK
 p/sw0M/F556JJEz+QfNiVJm5ydjbDQdOo0uM6Ho9In5aPYehucJ1Mkxfhy8KATAtGGu/GHMfCBl
 BdZg1iBMjA+V4Ymt8wNB+SGLf+wDL1bdhkGYn0rsb/YuzPfAA1iOLyUQzn8tlDohyWrkwOQZwch
 nPJUC1Yasv2fhq0PTgqhqSe4ZYNh09QMQqOaRFP3aSGai+tboIVKnVwm+ORYd2iphQN7P5DWuJP
 uviWxq/T94HFddRXAXmhvhEi9ODBCqDv+ggTG4wVvYrUXT+gv3j96Rvdcnj6FvA4uvklw0Kknmj
 z39T+YdaU/U+8YcEccJHyVEqrrLA4HRrP6U+TVbkdoHgpYk0VJveKSq8n6LNbboADHbBmyPMKFS
 zKFLBqnCwges+ELeZlQ==
X-Authority-Analysis: v=2.4 cv=XqXK/1F9 c=1 sm=1 tr=0 ts=6a049876 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8HYrQF7E7KXWYYjJzRwA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: aEXbJCVzI1JiVkckDoiRjQP2thAJiBuU
X-Proofpoint-GUID: aEXbJCVzI1JiVkckDoiRjQP2thAJiBuU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_082751_707686_60A70B86 
X-CRM114-Status: GOOD (  19.21  )
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

Eliza camcc and videocc are on CX and MX rails and doesn't have MMCX
and MXC rails dependency. Since CX and MX rails are already ON when APPS
is active, explicit power-domain voting is not required similar to Milos.
Hence extended the Milos camcc & videocc documentation bindings for Eliza.

The patches have been tested on Qualcomm Eliza MTP board.

Changes in v4:
- Update the clock ordering for camcc and cambistmclkcc in milos.dtsi.
- Link to v3: https://lore.kernel.org/r/20260513-eliza_mm_cc_v2-v3-0-b59c370dc281@oss.qualcomm.com

Changes in v3:
- Dropped new documentation bindings & extended Milos documentation bindings for Eliza videocc & camcc.
- Dropped the defconfig patch and included the drivers as m from Kconfig itself.
- Update the header inclusion in the milos.dtsi.
- Link to v2: https://lore.kernel.org/r/20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com

Changes in v2:
 - rebased the patches on the latest linux-next.
 - Add new bindings for Video and Camcc.
 - Remove commented code in GPUCC (limiter code).
 - Add device nodes for the corresponding clock controllers.
 - Add RB-by tags for VideoCC and CamCC/Cambistmclk from v1.
 - Link to v1: https://lore.kernel.org/r/20260317-eliza_mm_clock_controllers_v1-v1-0-4696eeda8cfb@oss.qualcomm.com

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (7):
      dt-bindings: clock: qcom: Add video clock controller on Qualcomm Eliza SoC
      dt-bindings: clock: qcom: document the Eliza GPU Clock Controller
      dt-bindings: clock: qcom: Add support for CAMCC for Eliza
      clk: qcom: videocc: Add video clock controller driver for Eliza
      clk: qcom: gpucc: Add GPU Clock Controller driver for Eliza
      clk: qcom: camcc: Add support for camera clock controller for Eliza
      arm64: dts: qcom: eliza: Add support for MM clock controllers

 .../bindings/clock/qcom,milos-camcc.yaml           |   11 +-
 .../bindings/clock/qcom,milos-videocc.yaml         |    9 +-
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |    3 +
 arch/arm64/boot/dts/qcom/eliza.dtsi                |   59 +
 drivers/clk/qcom/Kconfig                           |   31 +
 drivers/clk/qcom/Makefile                          |    3 +
 drivers/clk/qcom/cambistmclkcc-eliza.c             |  465 ++++
 drivers/clk/qcom/camcc-eliza.c                     | 2803 ++++++++++++++++++++
 drivers/clk/qcom/gpucc-eliza.c                     |  621 +++++
 drivers/clk/qcom/videocc-eliza.c                   |  404 +++
 .../dt-bindings/clock/qcom,eliza-cambistmclkcc.h   |   32 +
 include/dt-bindings/clock/qcom,eliza-camcc.h       |  151 ++
 include/dt-bindings/clock/qcom,eliza-gpucc.h       |   52 +
 include/dt-bindings/clock/qcom,eliza-videocc.h     |   37 +
 14 files changed, 4677 insertions(+), 4 deletions(-)
---
base-commit: db7efce4ae23ad5e42f5f55428f529ff62b86fab
change-id: 20260409-eliza_mm_cc_v2-701c34ddb74e

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>


