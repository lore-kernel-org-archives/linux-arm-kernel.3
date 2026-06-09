Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0BC3CD8CA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 15:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=88cwJVjL2lnzu2cVHtBfD3jOAXqQUPFnSKVzm/xtaEI=; b=bv56IJXMpMDooR
	pSUzXjE72d+RtlcO6OZEeqM2Esh72zrSnryNbh7qDX6SBfsy7/oECcJkAG/G29S2iEzgQPnd10ulG
	yHj2F/0WG3ldyAS9p2344r6Fy/3xNDD2Sp2BmIqq1VLW8JPowxUwPNAqN76VswsoNKSucikodtXot
	2oARac/ik+hv1Q5EbkI4VdIwbjRDAztPMeY0QTchqXnPGzKRtUuGyo3Fb/FE8JrKMIkY6E6Jbg31+
	NnqptTaQStvQbdg5ISHD1Q/Pqgw06/7i9cDhr54Zfl0I/TC+tEp+BoXDqJ3knZXpNF9A+jg4B0SEp
	3in7DL2WSBP5EqcnDERw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWxz2-00000005qXO-1XvK;
	Tue, 09 Jun 2026 15:03:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWxyz-00000005qWz-2WyX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 15:03:15 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClZLc2183118
	for <linux-arm-kernel@lists.infradead.org>; Tue, 9 Jun 2026 15:03:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=88cwJVjL2lnzu2cVHtBfD3
	jOAXqQUPFnSKVzm/xtaEI=; b=aglvGCQCGidI5XCIJbp+GZNa1nQ1FJjU+LP7vo
	wQ7+ec43PuohSglEXOsgxFAGBOPD++z69+aTRHyvHVI4rHMq2ev6ZkOtzqjZnoFe
	p2uG4BPfUjDe+JA280ag11U5PJa30CIYH0Pu6cUZyK+vrqlcLur/lT3i6mZSkqyN
	3VuQN1thZ1eRFN2EAN6NQ4s5MXhXRK0WcaCebhHRknwZh9jvupER5vrVoRcb8/Rr
	jsmjA16PMwZHUZ+/3Yd24fA72VMFVPpRkKF0HOgWpo/uZIyH7Kxx6DGIjEDkifDg
	k14dXD2Lsu+jw2UIW6tyimzvbuC8LHsNNFgawH5faXuZhgeg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epenra2s8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 15:03:12 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84247fed609so2763346b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 08:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781017391; x=1781622191; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=88cwJVjL2lnzu2cVHtBfD3jOAXqQUPFnSKVzm/xtaEI=;
        b=aNcsq6zgXZIrXArqW4j3M7C22HgbZZPw6giwx/+MxVlBmy+dv+HEectSxailQNCMfx
         f/+glk8wqsR9jPhkyNI8VYj5BbKGwLHESSlq+PpHuqhh6Viq2PKvomkHA0o12GS1FAjj
         Mn4dx5fKtNTr59GcZMJmVVpRadXHHyAQlaqwhyAsWWlj+wfmR/3b9zPNQ9s5X8ltt1qf
         MrXX8A41G5cO0euzYnIvBwXjCzjVwxKYz1t0rNSWaR1lnB01u7nkmXW47kPR3gL+aGxS
         exyQwIt8Zk42nLR4OzSyQbHszpy5VHJiXPntvn4E3zYB+RIKGXtW35UCJXU0GNrsyzMV
         /lkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781017391; x=1781622191;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=88cwJVjL2lnzu2cVHtBfD3jOAXqQUPFnSKVzm/xtaEI=;
        b=odsZswFhabNdhndA2+9d+vIV9dTt64ekWEtI/eBYEZcBatF1AdI+RTEtht3AD5R29x
         1voOz5m6RQSsJobWkvEx3fKGmgPLjyVRptQ/d9h1c5CE4Kbl1QG1e3UkZ0TKpx5UM5fE
         DqlsCzIL6wxh0J+siRaP5iKt4dhFfCnkXyT5agVlJjD3n/yYuFzNzeDS41+OstqPSCUM
         uJHYr9gYzQOfDkCpKBE9TqxBtR4d0L4++b/f5ySfETdFGoHqV1YeUhAsAlSygPJC0WXE
         lHg1hUBSGhhuG2Q67AbOMitBblIA+waifTgaj1GXIy/+KiiUWxz5g5/WYng40j8Gs83i
         4Xcw==
X-Forwarded-Encrypted: i=1; AFNElJ/HAXDpwipThNf2XtGF1X1BYddl/wPhBfIhsRovp+0JU4WHc496Oy6bT1ok7kOYZwQQfYKEXaZHnSJFQpcyuvLo@lists.infradead.org
X-Gm-Message-State: AOJu0YzoXqCAQnH3M6LT0MTew4X/6fQTdl4uy5Yrx2JIWon/L89WLwRY
	iLPeWe/8XPWnHM8sedW8kDYJxKxv6/BBSNYt0doeOJlk1zhsoBqrtQGgpq1KLVdPdry6IKut3Kt
	lFVSJrMPObqcI7PZrdgQQF7RLivYRi+UlmlcT2bGuVWV/bA9+y8FqcWHpR+lbPKu2lzcYJMjCSU
	dMEw==
X-Gm-Gg: Acq92OGVf5kLG1/O3SsuijaAwI2vyyd+Ur9r9UDd9YBPo++7D+WYpJVk0IghXtRp23r
	nJ5aLQ8pIyw3kwFgBl9+p6amFtq5PF+UTAhWljfv+8Vb0zhNHcVYKDUGufryprElOGbBFdjxbgq
	ChIhogleglM6Rv6g4hcsI+3qa0bVYpPIyXyhmPUisEJNaNo855yM9n8VcjfNp5FTmJL7Yw+8vFq
	zX4eZ4DpHOMRfdhXA7LhqKftiPLOaS/2YSF18mGpLRjyNw721iETqYrr6f9DrVUmCOQ4XKXckA2
	12wezp2uSEFbyBx4AkhbBvi01Pz3/z9Pn/JI2AAGttAteat/XTnYQ45/PPnRcOGPCfgP64dHcKp
	RU15QNMfEYIZqUghF+2gfd3OGL8I/jWITjoTUq5JEmjQE+d1dgfzYsK6a
X-Received: by 2002:a05:6a00:1946:b0:842:75d0:7e88 with SMTP id d2e1a72fcca58-842b1064cc1mr22480501b3a.27.1781017390614;
        Tue, 09 Jun 2026 08:03:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:1946:b0:842:75d0:7e88 with SMTP id d2e1a72fcca58-842b1064cc1mr22480295b3a.27.1781017389562;
        Tue, 09 Jun 2026 08:03:09 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828d6bd1sm26987659b3a.44.2026.06.09.08.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:03:09 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v6 0/7] Add support for Video, Camera, Graphics clock
 controllers on Eliza
Date: Tue, 09 Jun 2026 20:32:51 +0530
Message-Id: <20260609-b4-eliza_mm_cc_v6-v6-0-17df09e5940c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABsrKGoC/x3MSwqAMAwA0atI1haK1qBeRaTUGDXgjxaKKN7d4
 vItZh4I7IUDtNkDnqMEOfYEzDOgxe0zKxmTodAFatSNGoziVW5nt80S2YgKDVFZjcZhU0PqTs+
 TXP+z69/3Ax0TjeRjAAAA
X-Change-ID: 20260609-b4-eliza_mm_cc_v6-64cc35d4a698
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: ImCoHS-YTAi-gWsrVF0G-TcLVMsLy5Qb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE0MyBTYWx0ZWRfX9afrYkp/i2xY
 6sU8QjBPX93y/LVXiXnxPXY4PxbFpddU5wqPX7lNm8E74xf3IVNtCAqgOkqDmc+a7iLLvpif7DU
 6kBc/8oRlDGaBXK4Pz2QBwrxTuKNPCqf+VV4iZch5KvvvAuX0V3IQy4XhWt7hqF2CxXA7kBY9GN
 UfpfdDTEt30YONmzrwDnDStIWXeTNjW4gUC25WH+S7mZzZslzsjs14R7y9vAYLVcBwRyqJmrwr5
 OiGEUOSKfnzAChz0nWk1ONAAOouXiA+ZJDANl5jXGts6KEKnr8APKWwstDncVpG21UKS34KimlT
 KQV80CkTLrp5TKSMpnKdhzlCcU+QBiVSaSHSkfWpF3yrWItHM5Ys6tH8FQXED6+TAKGHvfP3tSe
 nFX5XAP9gQcO9BOs21FYe9vReoP0qA/aG/SLm0SdKDIMklfLF1feewXgOAFwMDgXod2bDqsJcHR
 N7iVnq8cJe4ZHlQjjTQ==
X-Authority-Analysis: v=2.4 cv=NKPlPU6g c=1 sm=1 tr=0 ts=6a282b30 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8HYrQF7E7KXWYYjJzRwA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: ImCoHS-YTAi-gWsrVF0G-TcLVMsLy5Qb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_080313_649418_1B909E18 
X-CRM114-Status: GOOD (  20.30  )
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

Changes in v6:
  - Update device tree to latest linux-next.
  - Update commit text for no ABI breakage for VideoCC and CAMCC
    binding [Krzysztof]
  - Added the RB-by from patchset v5.
  - Link to v5: https://lore.kernel.org/r/20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com

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
base-commit: a87737435cfa134f9cdcc696ba3080759d04cf72
change-id: 20260609-b4-eliza_mm_cc_v6-64cc35d4a698

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>


