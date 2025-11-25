Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC9CD0EE00
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 17:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BLB/dgVhe3BEdpj5a0hsuyDq7Jx3wTKbCXCAOZWt9d4=; b=bH0wu7GuCEdNSy
	XOyJDJX6+SKth1HJKCG4s+rlz3BFyZVDCy+lu2GbnYGS/h+D8a5VyT1xNgiGgcTtjrorVFMkmo5If
	PfVFSUw0Vy/XiaMj33ddx8oCmKN4eW0yHnSq7ImLqwTORtRYKk1au2o6oS5ASsFU6T8fiJtNmNtZ0
	hEX5q16rH8ZOcVw6jRbbb918rRzr7I7TJ6nPWJDYIB1qaCk+T0jiEdcW+GIJCc/QU/Mpcp4CUPsxw
	s3rcZZYZS9xClrLXKgJFx3u75qP4VtY3cz5St78ou4piOfHNtxZ+t1qikRfwxnbU3itkZFzXZdKPV
	g3f5FF7CFMKK6MbKd2XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNx6d-0000000DgYa-2umz;
	Tue, 25 Nov 2025 17:45:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNx6b-0000000DgYE-04EQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 17:45:34 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP9xJYf2650830
	for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Nov 2025 17:45:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=BLB/dgVhe3BEdpj5a0hsuy
	Dq7Jx3wTKbCXCAOZWt9d4=; b=hACGw8Mc7aY7u017oxdLcJkj9dcYd6NSMsYLx4
	xrMiLYHKiUz8Po21hEjoAu3JakrHxUNPbZ/sS4O97Fm0HM+zFUeV2YuqkwL7sKnp
	+TgPiI8yBZWEWGKOoyp9UF+/ate4TR6FlwdYR6F1SW2z4RMU6nxXprE77FESVW4d
	DWybg/+0skKxZaSq/mGy8W9FuDxIWZnAAEQeDucICxmsIm/o7J589ObFx7p1xJBz
	NcT6K5/refG3HvOUzRgFCU2+elwPT0Dv0RNu9Y7GykiyKbm5B5OvsD6f+gU2BzCW
	rASXdGHwi8oAz2vbv5GHVO+67/2VfLa25vgg9ZoVK+GSclSg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anaabsca6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Nov 2025 17:45:30 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2956cdcdc17so59997915ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Nov 2025 09:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764092730; x=1764697530; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BLB/dgVhe3BEdpj5a0hsuyDq7Jx3wTKbCXCAOZWt9d4=;
        b=EjWIEGmLp7/NA/n53a5IzACH63AveCPgh6/V6z71qE+KLaOi7CaRQQGln97Zx2QapG
         YAneqVF/9RWrtzv+npa2RpZmH9PPq0kB3VZwzGZoiLiRWDxFtGiyR7XRrgBoNuQA3Np7
         7WLIKCk+bnHsHP0ZqZMPUWvZTK7Jd7b8n6PaRL3Un6HfZiJUyKVvsXs6zg11mCazMhkW
         fGDSP4fdx7GhPJskkxs/9sUrUG8xn7A7qchVQeCb5q+6uR+xEZMLNiH08vHzmPZ7hdtA
         IOvud+eghoaBiiAkWo8tpisGD00woCHM9OYZEmZOZkE2C39hgdHX6Ti//f2xQg/9l68l
         pXhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764092730; x=1764697530;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BLB/dgVhe3BEdpj5a0hsuyDq7Jx3wTKbCXCAOZWt9d4=;
        b=VOV/clmd1v2WKJdIa8DJMewxepKid8LIvGNE6hv/5HLiNyHR2pOP2ObnF5gWGs1z6G
         URNxpTTaWA/qb197UPD16Q16Gg1TkJtDXGhd2FlEcYUiujY0i03vahase15EzDutjELC
         Oz4rfUialpU8NBLzQjGnF10iggdaK6uO8TxgxHF9KBDEpiBEutO8tq43mh8vQGY8A4dx
         MTNXzQmEymzgTYo5kjNMwZrYp0MCxcP+lz6UJNOUbsDgtfNKDhvDVCmjx0ZkSmGxeh7D
         KM91v5ALmAaCs6bLWC3WR7nwJrgj26oZwqxU2H0e7saqnrHLbK9JLZ4RwFVcpNHCc2W5
         5kWA==
X-Forwarded-Encrypted: i=1; AJvYcCVTgt1qv2JPjAcHM2x0M4p7abRG6JsfV581HCvWWYyGf35POEzWkSljoZ2Iw1NRs1cNNmVfxdaF9RQtwqK2oFX1@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7eu8XhPXMwCiV7mYdEZ/ybJTB2jWrA3RSKVUYgpu5wgbnxT8C
	CBy18VnJk7H9Dd2O17IBu5yWXe5FlaE5AGyygnBfy2ktHY4NbOXtpkiSdAF7SHnrAQzjcbTHVrq
	jIN/Q+7ZW3BAGwR+ilUVc5HvyBeSj+ZrAYb1oBd+6vitNSsybX828ZemE5RoBHomSAriQJRhdEj
	MlXA==
X-Gm-Gg: ASbGnctIhpwosmHMnEv2i4Z9rGhKmaAAtvMRSX7Q8HWZhmpiuYs9+tuBTYiMVm7A5s2
	Gpjo6pRgFWqrKci5Y3bj5zbD4X97OZRWjjsKdzp10rhWyNRv//V2JmNcASYf/lPvEqOOX3EA708
	cjJ+pDsRU3OlJc5Xw+Be1/pVF7z2x9r+Jwb3LIgj0kmcfHrEhATByNp7y6bAANcYwzvHzlSIRPE
	85Cn1YoWqW5DH+B+SySRd2A9fyGB+tdkgeip3DdhwLpGcDALXocdaPUnfUvla8FWI/K55kJmsrf
	lVkwi1WedDrWFX2RgnniT+evdDqyxrGlL7/QecktjcOsF3tSytZynPC6vjLFjUPxMAXGC2hwuQN
	vh7zuWw8KT65e4rQR19fCVkgipTMefAddDw==
X-Received: by 2002:a17:903:b4f:b0:295:5613:c19f with SMTP id d9443c01a7336-29b6c68d7dfmr203097275ad.42.1764092730240;
        Tue, 25 Nov 2025 09:45:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEfgOyK3bt2O6uanwsFHJxsoyo9esFMOv6LtZKMFgNWt+4F89Wuduzs1jP5jU4DJqm9YWhHUA==
X-Received: by 2002:a17:903:b4f:b0:295:5613:c19f with SMTP id d9443c01a7336-29b6c68d7dfmr203096895ad.42.1764092729738;
        Tue, 25 Nov 2025 09:45:29 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b13964dsm174500785ad.38.2025.11.25.09.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 09:45:29 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v2 00/11] Add support for Multimedia Clock controllers for
 Kaanapali
Date: Tue, 25 Nov 2025 23:15:09 +0530
Message-Id: <20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACbrJWkC/y3MQQqDMBCF4avIrDtghgahVxEX02SsgzVqoiKId
 2/QLr8H7z8gSVRJ8CoOiLJp0jFk0KMA13H4CKrPBirJGkMWe+bAE38Vh8E53AjL1liyz6ry8ob
 8m6K0ul/NurkdZV5zevmP5/kDqNS03HgAAAA=
X-Change-ID: 20251125-kaanapali-mmcc-v2-0f1525477deb
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=Vd36/Vp9 c=1 sm=1 tr=0 ts=6925eb3b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=b2bYCZbHhW0TxhAsxsEA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: XV0VC5JyIKQDAeJ8dLVchmUJUmrKQIPi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDE0OCBTYWx0ZWRfX142oMBIvpuPf
 e/nTAnFMg3UI5HAMlNcKCLn4cT0OOfZuIB734fSoRSD1dT5MizJY2y5/1e8N/migyjLRvskPoLP
 qTnrbyUpwaNUzy/M78aw55UkdCunD+kU7qS6TzgIuLpqbIu2FMy8Z207vZLy1veMs2WyfflSE32
 gCtEJNv5GnF2qkegl5ciVgKjKGjp1yRgDgA3XNmjFmcJXyVx2vkibN3titeFtEWIgdyj7PxqK59
 xvij4tfrDa6PgCkoLmq/imEZASyG7RjtvtDyI4MhWJyaaadVWwx1u+eFarmy/Sq++tr3U0PL07n
 8KCAgodfyMxejXFXEbImr3prjoAwSW3T/171QBm6XjyWlpjEV4u+FzQFZcHDrDaOONVvkpX0/lp
 yoFychjlFxhd3ynKo3gEOYhLPQBJvA==
X-Proofpoint-GUID: XV0VC5JyIKQDAeJ8dLVchmUJUmrKQIPi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511250148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_094533_075184_10E340BF 
X-CRM114-Status: GOOD (  18.25  )
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

context dependency: https://lore.kernel.org/lkml/20251121-gcc_kaanapali-v3-v3-0-89a594985a46@oss.qualcomm.com/

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
 drivers/clk/qcom/gpucc-kaanapali.c                 |  494 ++++
 drivers/clk/qcom/gxclkctl-kaanapali.c              |   76 +
 drivers/clk/qcom/videocc-kaanapali.c               |  821 ++++++
 .../clock/qcom,kaanapali-cambistmclkcc.h           |   33 +
 include/dt-bindings/clock/qcom,kaanapali-camcc.h   |  147 ++
 include/dt-bindings/clock/qcom,kaanapali-dispcc.h  |  109 +
 include/dt-bindings/clock/qcom,kaanapali-gpucc.h   |   47 +
 .../dt-bindings/clock/qcom,kaanapali-gxclkctl.h    |   12 +
 include/dt-bindings/clock/qcom,kaanapali-videocc.h |   58 +
 21 files changed, 6995 insertions(+), 1 deletion(-)
---
base-commit: 88cbd8ac379cf5ce68b7efcfd4d1484a6871ee0b
change-id: 20251125-kaanapali-mmcc-v2-0f1525477deb

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>


