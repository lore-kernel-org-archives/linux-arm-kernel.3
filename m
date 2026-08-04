Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA2B6C55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 17:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DCj2HtSGnhXe/Ygho7KA2q0SbWlkqUr8cQ+cFl5j0aQ=; b=oiwpLg10JgiFPr
	cq7629S5d3vJkunX07nD8BGCoRFWUc9W1yz98UCOXz4nWRu6peRkoETgM7HmtctImJztAZRgIiMsG
	ixSQCzyZrqdUnYP/vi284uhHM+02JJtVukiG4Q2meSvHcsjsXcTe1a92CFDjt1mPrTB4uS2eInAQo
	xM4JQDksW1oZenGmA+CrzXgisqgodu0CSVvkfMCOGfSgUgfICYPOhrsYXPMJA97dyTOIEe7jd8Nla
	+wuT4kQk1PhHukX6/OfCwJ9vKO5zmnBQI3jbVu2j9JRD7RyjcRToVQBH5Ln6zfyPT5VA3AyNxpC+R
	Ht5oR51bfF0T3bmt193g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJHh-00000002Wwi-0oxs;
	Tue, 04 Aug 2026 17:50:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJHd-00000002WsF-2Vxn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 17:50:35 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674H0ASe268790
	for <linux-arm-kernel@lists.infradead.org>; Tue, 4 Aug 2026 17:50:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DCj2HtSGnhXe/Ygho7KA2q
	0SbWlkqUr8cQ+cFl5j0aQ=; b=Y9dOD2IFK81gElcd1KYYdzgmaWqFV6FKlLknQA
	W27ku4pHnad6XFinvORylWWRwyuRa9NMUKPwuGxMc2ejwrI2YFbcP/SeDqGiQY15
	LC6O3ebT/8+G9ug4BWiEO2oNS08tjmvwImlDwrpTKeOVB07qVbd6cEmO1QU7Be+I
	ItahjrfHPQJ3SRZBYsu240+sxqhsRlFmWQ5EmMJakMMmwDL2sb5I2pLPPA1L5Ouv
	GTOHuUovrYVpvR7oRGi5IxQCv9APVzMC9wncfMVpk3uGdQC0ekDQV9oFtG3+LvlN
	1z70dLK48E+ws4FPrQ6X9Hx8F/L6BRXQtCpDWTMbghkZCv4Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fum3nr80e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 17:50:31 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ce8a76df2dso1899785ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 10:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785865830; x=1786470630; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DCj2HtSGnhXe/Ygho7KA2q0SbWlkqUr8cQ+cFl5j0aQ=;
        b=DJQcZmnXFWBrWohHw4U1sYC9I6wx+UAapKOUa383qgaTBM5slTxCoozJr/Q4nQ96E9
         uaDW2Ml5j8/JDay6Vtlfp2VzcBwwE+p78qcp7tLzP6tgUfjPPuSTPHQdNWKt3gk/5h6V
         +ynpCGMuiv/d0GJlCz1a+JrjPHwVX/j4CiXhEs1xYYsq/Fh9O3/D9UiGnji1IGJxFgCZ
         8CMGFlsRyD/pUzqn2zOiaFRfx4B8PzLZxdTFl6HNbb2kAucVCBA/Zw/r3xXV28K3n+OJ
         btMWDa8BnHuJs4Dh0oSXXARY6DtKkobIodUDKfYsNmN5DP+bdwfcrQjXticw9HobVo6U
         K8UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785865830; x=1786470630;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DCj2HtSGnhXe/Ygho7KA2q0SbWlkqUr8cQ+cFl5j0aQ=;
        b=dGgNHiESmLe1Skd8vz651Y7ZtwAeHfJJqJgrnvo/wxY809Fqgx7SrTXOxjBKkKLGYp
         ZndXLLwJx7wtfGlE7l6f0QaarETbQEwevU1/aX61kR9FTtfV28CO9a3Gy7FLN6J5vL5F
         D+Ut495yw5Q66CyJ66NMEM4CgRm99nE1u7Lgt3y38wzE3iARE5WSZHN1ejYNy0OG7/Y1
         R1A1MZXrNJqO9ef2XYJyRryYHqSu+EJOobO3XJm3dsl8lagXRfYIQ+ps3BRh3OyPIACs
         ApjYDmMOihSAQD22jXMTMN2CqVRuXIeDBva5x923R79A5XEdmQA0GGnxW59wGTobXTv2
         VBdw==
X-Forwarded-Encrypted: i=1; AHgh+RqZQoLhMv4yAXEqr0IdB/48WrStA6Ix+k0wPKi993/M4L4zsf37IZ4ocYzDy/4wbMVAP2xQwgnM2KQLZSM35VEJ@lists.infradead.org
X-Gm-Message-State: AOJu0YweQFyNsfoADeqYwRZ4JY7i9KVlqz9o0R44rLeeIonNKNWsrzmk
	VZNt/YDBSdWzD3TWaEPHKI0CI3yKVQm9jVngqTo5ZYqs6smvyb+/7Z2L4NSHxyuxkn7LgjBVJ1s
	ovhMu1i5fzZZDzVp8tE8yRJ2N/JzuV8PnIcYtePRjEPqtxV27QxdMBqZ+FP34XjG05xk8TxoyXc
	JYEg==
X-Gm-Gg: AR+sD13XiQ4QONq5wsPBUcfeHh/WB1+QUjbtvHxR+f4uAczfsvS6OJVO7wx9t0OXDuQ
	45MyTsHC+M0N0btXfTollEl5w8xM0k68i8OWZMaFAtSuL0kPre8iDRcN1cx3M2pyqg6RKJrsGw4
	E+QlJj5iwGLlJAOrBsoK/emwrPTpRSosdG+bz/U8yJKnTVQmrUC5Z/J0QaQHLvatSTKA3lOukd5
	GI8bl/V0grDAB3hj7ix+ZCYfx2RAi/C5AcUCf6Ua3soVbTi+RDx5GwkVqKww2d1PjoSTTp4mGVI
	AQS348qLsM01HXFA1azTuSc1RwfA0UABC9lfetrv3ck/CNYPFlWX9VzjGAP9aBsSFCzhjR3pKSg
	8gZjxrkAS20TURVdOnrs9C9GT
X-Received: by 2002:a17:903:b48:b0:2cc:7e4a:bcc5 with SMTP id d9443c01a7336-2d0ca9d0975mr4965255ad.32.1785865830524;
        Tue, 04 Aug 2026 10:50:30 -0700 (PDT)
X-Received: by 2002:a17:903:b48:b0:2cc:7e4a:bcc5 with SMTP id d9443c01a7336-2d0ca9d0975mr4964505ad.32.1785865830115;
        Tue, 04 Aug 2026 10:50:30 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586790e21sm7052108eec.24.2026.08.04.10.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 10:50:29 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v9 00/10] Add support for Video, Camera, Graphics clock
 controllers on Eliza
Date: Tue, 04 Aug 2026 23:20:13 +0530
Message-Id: <20260804-eliza-mm-cc-v9-v9-0-39067760dc3c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFYmcmoC/x3MTQqAIBBA4avErBsQEcmuEi1sHGugPxQkiu6et
 PwW7z2QOQln6JsHEhfJcuwVrm2AFr/PjBKqQSttVacM8iq3x21DIiwOrY3eBOcmTR5qdCaOcv3
 DYXzfD5WYpL9gAAAA
X-Change-ID: 20260804-eliza-mm-cc-v9-66fa4d99b2ca
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE0NCBTYWx0ZWRfX6/jQWPuhwinc
 cO9C3y9bza7fUdDeDRPZl9HAUC8kQCofh5Iyrm3asR94xDfbEgNXUCoUWurfiuzYUlH9L9gMx9A
 DpnYoLFDqzd0Iz7xB+jUxo3/0FvYnrvVL9AbfuZaJU8ZMIWbv1NKv5A56MCnRa+vyEnHTM+k3s6
 uX46p8Exhsy0buIQuFZrBZow73wT2WJUoYRcsBOk1WFIgsvvktTQekPtPuXqglMTXB2nqEjuf3E
 kIZmtvl9hJp9hH5LhXnZkqCG/ED39EV75EILYG0gtnWWGRbAJXP4uBaDJus2IFeH6BgwP4XxKsg
 yk4uJdL8KJnHLJjBdD3nqinjKjfgL7w5QC24yapNu/VnAWIpg2owYCJzrwjtP3TCIadIn00EJmr
 4dO6SssNyVd7aK6Z0GzVF66CqL6KZYerQaZ6q+wIbtKx7KppgPzy5TmU6SZsKQ01L988RJUfw1S
 YJX/SMXqG3LN5X3rn6w==
X-Authority-Analysis: v=2.4 cv=AZqB2XXG c=1 sm=1 tr=0 ts=6a722667 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9qvLLBMeT0BavxF-EG0A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: FejgdqRu0GkZTkEQMkhks0fFzTXcbMkA
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE0NCBTYWx0ZWRfX1gzbmMc1G2nx
 CmDR4TEqq7vDLL3/2yoFCUnyj54BcIBIBWGrhvnkjtBx8u5naY3QastPisB+OwU45mSxE3k2CZH
 2BLIZXWXE9jqeWFGpa7aJTb71AZM2qo=
X-Proofpoint-GUID: FejgdqRu0GkZTkEQMkhks0fFzTXcbMkA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_105033_774657_166A908B 
X-CRM114-Status: GOOD (  21.95  )
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
and MXC rails dependency. Add explicit power-domain voting for Milos
which are required. Hence extended the Milos camcc & videocc
documentation bindings for Eliza.

The patches have been tested on Qualcomm Eliza MTP board.

Changes in v9:
    - Rebase the patches on tip of linux-next.
    - Added the RB-by from patchset v8.
    - Link to v8: https://lore.kernel.org/r/20260717-b4-eliza_mm_cc_v6-v8-0-5cca1bef2e48@oss.qualcomm.com

Changes in v8:
    - Remove unnecessary '#include <linux/mod_devicetable.h>' from the
      videocc, gpucc, camcc and cambistmclkcc Eliza drivers.
    - Added the RB-by from patchset v7.
    - Link to v7: https://lore.kernel.org/r/20260713-b4-eliza_mm_cc_v6-v7-0-4d91bcef50eb@oss.qualcomm.com

Changes in v7:
   - Add missing 'power-domains' and 'required-opps' properties to the
     Milos camcc and videocc dt-bindings, and the corresponding device
     tree nodes, since the Eliza bindings extend the Milos ones. [Konrad]
   - Update the camcc, videocc driver to 'use_rpm' flag for Eliza.
   - Add the RB-by tags from patchset v6.
   - Link to v6: https://lore.kernel.org/r/20260609-b4-eliza_mm_cc_v6-v6-0-17df09e5940c@oss.qualcomm.com

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

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (10):
      dt-bindings: clock: qcom,milos-camcc: Add missing power-domains support
      dt-bindings: clock: qcom,milos-videocc: Add missing power-domains support
      arm64: dts: qcom: milos: Add power-domains for camcc and videocc
      dt-bindings: clock: qcom: Add video clock controller on Qualcomm Eliza SoC
      dt-bindings: clock: qcom: document the Eliza GPU Clock Controller
      dt-bindings: clock: qcom: Add support for CAMCC for Eliza
      clk: qcom: videocc: Add video clock controller driver for Eliza
      clk: qcom: gpucc: Add GPU Clock Controller driver for Eliza
      clk: qcom: camcc: Add support for camera clock controller for Eliza
      arm64: dts: qcom: eliza: Add support for MM clock controllers

 .../bindings/clock/qcom,milos-camcc.yaml           |   31 +-
 .../bindings/clock/qcom,milos-videocc.yaml         |   29 +-
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |    3 +
 arch/arm64/boot/dts/qcom/eliza.dtsi                |   76 +
 arch/arm64/boot/dts/qcom/milos.dtsi                |   10 +
 drivers/clk/qcom/Kconfig                           |   31 +
 drivers/clk/qcom/Makefile                          |    3 +
 drivers/clk/qcom/cambistmclkcc-eliza.c             |  464 ++++
 drivers/clk/qcom/camcc-eliza.c                     | 2803 ++++++++++++++++++++
 drivers/clk/qcom/gpucc-eliza.c                     |  606 +++++
 drivers/clk/qcom/videocc-eliza.c                   |  404 +++
 .../dt-bindings/clock/qcom,eliza-cambistmclkcc.h   |   32 +
 include/dt-bindings/clock/qcom,eliza-camcc.h       |  151 ++
 include/dt-bindings/clock/qcom,eliza-gpucc.h       |   51 +
 include/dt-bindings/clock/qcom,eliza-videocc.h     |   37 +
 15 files changed, 4727 insertions(+), 4 deletions(-)
---
base-commit: 0f6da28aab51b16762ed82e8fdeaa5042da45b08
change-id: 20260804-eliza-mm-cc-v9-66fa4d99b2ca

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>


