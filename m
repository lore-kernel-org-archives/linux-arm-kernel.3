Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A294CCD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 10:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RrAk3Qchsl9HTYYm+whnBSrxmWERJEvxM4jVWJl2EWg=; b=zr23APGxBhbagN
	IgCuLHR6fdglbRJqUdBZX+g4BP8aukAShZ9YA7Es6yzhOU/zrQo7nM2kPpoMzZMRgWOMRFHoeejsA
	A08PISwome8PN3bevAZ02H48CPYFguoWH/bv1X5EpgaTbhPKspREaPwrJf6Gn290Hemgs+gKec0rZ
	NSjibENl5QBAl6UeaVpukZGirLrSH0M5XCP1sDBDxBSmS9igWxa5RFDF5ASTzA8lDa7hEXOqUxmU/
	Efyw9hiSDbv4byQvrcVQbdY4WJGJvttb54npDT6FcbHo+UkjzMgf7JAtmiUeaI+1kp3VtsPRYlp4C
	tPd3KM8RP5i5ZCdxzRfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRSp9-0000000GyMl-1TVo;
	Mon, 25 May 2026 10:46:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRSp6-0000000GyMF-1Zes
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 10:46:17 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P7dwbc1594683
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 10:46:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=RrAk3Qchsl9HTYYm+whnBS
	rxmWERJEvxM4jVWJl2EWg=; b=mZqfAbTEnRpaIWs5d8tduMEw+NTdHXNbZfILfL
	PLgonA7oeyGfQKdlwL/7MxAasB9hjFNrpCeRUnB/Z1dMtN5PRjCskRWU4q40Ibk+
	n0j6TQMtlzRQUwtQVgEfuiZsbWmB/e3FxaFgtvCPx/y40HLaTAn/IJbwpibYuJ3m
	2VATpCLG0IUave2AI2v09FKzuH2/+L1nA6RxspFDAJGeY08DwFGCC0O31cjMV/yW
	VxJE4/0pNJ+X9P+zw39ZeIiUBAkVfGXcAWo7oCCc5V6raHaTmdyPlqP9dCMoHh5b
	i6KSZ8Ysv7r+FiDqv1sGbryg9tku2wBUYngJfxvaiYYL0HOg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb88w5s95-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 10:46:14 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b4678c6171so102529765ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 03:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779705974; x=1780310774; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RrAk3Qchsl9HTYYm+whnBSrxmWERJEvxM4jVWJl2EWg=;
        b=GpQii4yJBGk7LNPZi4hlUexP/xdP+H+dVFXr6sgm9UQk7QUo55rur2chIXM3dpsufp
         K0o5CzmBI26EEFy3E/AUbYqM1Nt9YbQ8BoNrccQ1tBMGxoy/dElcFErPifthn33y7NDx
         GQdO1+JG2k+LNSTLOPJZ8DTiYzG+DLvem9JKbeXPYE/si5kbar8EAdsr4fcCPYnAlJPJ
         zS1j6itnDAMHbojGhfKjAQhAqWEwRIYeRGkBSaYm1aI9jSqszMw63AKtMN0FcO+47uxe
         Aajj+stfFS//+JIUEwhoeuuTmDgSTxfck/iCu1I2yuSKIqw4C2ioIQxxyxy41HI9PrSn
         xfvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779705974; x=1780310774;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RrAk3Qchsl9HTYYm+whnBSrxmWERJEvxM4jVWJl2EWg=;
        b=N+Q9mZ5qNVnPEthBDfZHxYA+RNpNnuta6t89y00N4EDWPSasEI7Qi4DC6oIbPfp2N6
         H7JM1urgrnKGmM63A2spxTAbl1vcJlmUKgj58XpuYvg0ZFV/YmsNaWwESj8baHcuU7B4
         Jp5hQqgYfp7yv7FECE9P3GWYtNmb4MK+PX8I/RJuhQw6dmW8pB6FGWSPpVTKbRl941FX
         21SMU+UMyNmScCNB+o0sAcO1EbZlI5bq7KR9nvTDi56+6UHBBUbn//3n+85+VtWdbtQV
         faNYvYbZR/2WWf9eZPK6asyCqGZxsWkEKEdqG4AzkBwNbQ6MD0sOWij67d4aUcakDxTy
         LQrQ==
X-Forwarded-Encrypted: i=1; AFNElJ+UUEVnTpqRpyxsT88YHj4Ydz3+k6brzazt50tfdFRwquK/U58f7CxilErOUoDKRJK+WP8Z04vP3239GA+B/z4y@lists.infradead.org
X-Gm-Message-State: AOJu0Ywl6ILnLw4nbeLFVd4izf0/hLzNUl8pnlx+UcTQyoDD3mTBehXD
	z8jI2PEUXqROKWXZEHWg1cIRY8CGrgUxlz1QoD1hZCwiQJXYHntbwCF96Nv2j8eabT9E59MLEx0
	aXeLMRTTDZMz2w2/NPCh+JOiAYn0yMioA/f0nW7Y3ZXmvA0Y6Sg7hQZCGfTyJ7O/kfylSc6pmaS
	kq3A==
X-Gm-Gg: Acq92OEY1UGdYs+/WXXi0vk8MWgjB0JhAEMZRTA4UntIV/HjMs+bI7SUJe2DhmLqYm0
	CidWDptAEv7mGH/gve1aoCCikAnW/gB4Mn6mf/kBt1Y/ruz9wXssyWgZQPP0Z3EH3Zujt7WDbM/
	YkiAQykkrQ7ebb4iE2WgQf+Nri8iSqYIdkMrMMC8pfjQJFVAXD2PSN0MnrLZjTZ24rL3x5nJu6D
	lAjpn8ZFRur5tZLe+nIuP9mHexsqwiI42BjM5lE3dvEIIqqA1h7jUuuyxvHeNJgSasGY+hj/XDM
	v6cERwKAyVJushOujnyyMQ9luLLPaCw6jUpLw466QJIX0wf4w1FHOi839FDtGD8aXEM8+n8eaYY
	yD3XyzvkvGpOJGG9UPDPXprx0sGkh0uebEci3KNk2o3mo0w==
X-Received: by 2002:a17:903:2f8d:b0:2b2:be01:5532 with SMTP id d9443c01a7336-2beb0841de5mr148146345ad.35.1779705974077;
        Mon, 25 May 2026 03:46:14 -0700 (PDT)
X-Received: by 2002:a17:903:2f8d:b0:2b2:be01:5532 with SMTP id d9443c01a7336-2beb0841de5mr148145745ad.35.1779705973407;
        Mon, 25 May 2026 03:46:13 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb591f63dsm118666175ad.83.2026.05.25.03.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 03:46:12 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v5 0/7] Add support for Video, Camera, Graphics clock
 controllers on Eliza
Date: Mon, 25 May 2026 16:16:02 +0530
Message-Id: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGooFGoC/33MSw6CMBCA4auQri0pfVBw5T2MITAdpYlQbZWoh
 Ltb2LhQTCaT/JPMN5KA3mIg22QkHgcbrOtjqE1CoK37E1JrYhPOeM4kKyme7auuuq4CqAZONct
 ASGMaLZHEp4vHo30s4P4Qu7Xh5vxz8Qc+X1epOIw2wCA3RusG1M6FkF7v9Rlc16VxkVkcxEdRm
 fhSxKyoEoRmBniRrSjyvyKjgnnWKCkkFqb8oUzT9AZZ8FIqPwEAAA==
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
X-Authority-Analysis: v=2.4 cv=S/jpBosP c=1 sm=1 tr=0 ts=6a142876 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8HYrQF7E7KXWYYjJzRwA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEwOSBTYWx0ZWRfX7eOJ4UblPDRd
 PXja8i+jtIn9Po7zP/3e7O4MKDGIWcFVE8Iu25OxVQlS7+DoP3f8UoqCzkVrDtDtsowSgIL7VIz
 O8Lk9+yYQFXsxEvAF8q1GFvaTKeAR4GR5TVNhIn5fwAs7Kso3UAbtJAuMhrwkZ4t+rUSuNeOtg+
 SOGozC+6kz4+RocZ5tHoyp/4QM5VWmymgAHXkaFEFkXw5t8s38HYG8AFwwLlq0lOGkse3H9R/57
 OLWPA+kU/N6TN1AKDuCxMx2PXvhkxRLmbN45NLLGeSA1w7TuAkwR+HtMVd7FzFsh8ftwE4yKagn
 QIhD/Zn0EZkCEJlqi+FGM7dTV8S9lRh+dFDCt+DXhXPahsEQAgGs3E1qopKXch0/JrDIGrP2CGh
 lY1vnq5nHY9pd1GAJSTicfC08RciFG8Uq3K+4+x7F/4mRzTvGAJcdiJIyd6iF2WCP7l7oqwchRV
 yuHOLLoBIqnNlbTjN0g==
X-Proofpoint-ORIG-GUID: OiJ00D0D5duH5YGDPuGl5U8vkB48_0WA
X-Proofpoint-GUID: OiJ00D0D5duH5YGDPuGl5U8vkB48_0WA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_034616_430462_D59FB8FD 
X-CRM114-Status: GOOD (  20.03  )
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

Changes in v5:
- Taken care of comments from v3, v4.
- Update milos-videocc and milos-camcc bindings to add '#power-domain-cells'
  as required property in bindings.
- Remove duplicate clock 'gpu_cc_gpu_smmu_vote_clk' from driver and
  bindings.
- Add '#power-domain-cells' for 'camcc' and 'cambistmclkcc' device node.
- Link to v4: https://lore.kernel.org/r/20260513-eliza_mm_cc_v2-v4-0-e61b5434e8d9@oss.qualcomm.com

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

 .../bindings/clock/qcom,milos-camcc.yaml           |   12 +-
 .../bindings/clock/qcom,milos-videocc.yaml         |   10 +-
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |    3 +
 arch/arm64/boot/dts/qcom/eliza.dtsi                |   61 +
 drivers/clk/qcom/Kconfig                           |   31 +
 drivers/clk/qcom/Makefile                          |    3 +
 drivers/clk/qcom/cambistmclkcc-eliza.c             |  465 ++++
 drivers/clk/qcom/camcc-eliza.c                     | 2803 ++++++++++++++++++++
 drivers/clk/qcom/gpucc-eliza.c                     |  607 +++++
 drivers/clk/qcom/videocc-eliza.c                   |  404 +++
 .../dt-bindings/clock/qcom,eliza-cambistmclkcc.h   |   32 +
 include/dt-bindings/clock/qcom,eliza-camcc.h       |  151 ++
 include/dt-bindings/clock/qcom,eliza-gpucc.h       |   51 +
 include/dt-bindings/clock/qcom,eliza-videocc.h     |   37 +
 14 files changed, 4666 insertions(+), 4 deletions(-)
---
base-commit: db7efce4ae23ad5e42f5f55428f529ff62b86fab
change-id: 20260409-eliza_mm_cc_v2-701c34ddb74e

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>


