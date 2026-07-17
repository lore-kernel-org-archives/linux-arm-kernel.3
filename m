Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED271C44515
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 07:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hJ2+RsjIu1eHK3Gfe9WhoyCOoyu0fRnru2GWuIngT/k=; b=P8vTDfGJPYgQrq
	/5jPH5EsuQadt3TwTrw4+ORvE11JjoCFwnM2Aw1RdboJpiwmpH151rpjvQs9AkV/o1jecaftsq9cB
	Eot5kuLyWPXtQbA7VGoXDPWoyJUSdNsG4xH5Aw/CKR2YB7MbL/i1PfCcJQE3Ar+ZXfUaOReCl0Jw7
	N6oZ43G++y3PnjPS9NtG0Ga68dxIxeYwUBOjJXqlRSUHtjwiy4zqSp1C5QzqWiCp91fluqnQtOliC
	9v/odV4dH6JO2psq6CAlc3MLwyYQB6sXyAw9Vfjru7WekCoEioglaPPh4MvfoHYr9afTn6SeEuM8v
	4c60Ts8CKBa7FF48873A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkd3F-00000001SSF-3xpj;
	Fri, 17 Jul 2026 07:32:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkd3A-00000001SRD-3rld
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 07:32:04 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cWFh851755
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 07:31:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hJ2+RsjIu1eHK3Gfe9Whoy
	COoyu0fRnru2GWuIngT/k=; b=bnTGWMS5RWeZ/AFSSYaHklNPHV99mFQNQoOI4z
	jV/mcWRp5hOUlz8KOOHdXIfQBAriVOtYJHnLlfkAB+LrGID79YFm1sL/Hv8yql0d
	plZEKzOcZvO16b7KcCExc46d4o5yBIvOnbSuPQRbDL5wUCS8R8thYTTtex/zdvf2
	11KcDOL/K4zgPq9CyS451XPIu5x/yCk1j3wnLCP93uXFM+fbUhvHAyNneFiu9frw
	HtnXj1YtiEk3URujtb8bldj4pwJY/iqSwGl/0kk3kOubaB+BFCJ/wpQzRImMq6JG
	RY9zYHMwj23OLM8IyC2LEHDFUNhpso5JACWt4Ky2fk1T2Nhw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fff9p8767-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 07:31:57 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c891ed872ddso13223523a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 00:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784273517; x=1784878317; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hJ2+RsjIu1eHK3Gfe9WhoyCOoyu0fRnru2GWuIngT/k=;
        b=IoHvBWoBJ9D/sFGHD1PIlYJRPnbQ7KvZthVtPWHwfxowZInaUqfLOKid0Q/8RsSmB9
         OdI2hFfi5KA+5vUZyhcGJUliQFqYtGB1C9XMphHXWSRhGAgqfzGV9RG0JGjT5FpKpMD8
         SUtdBBqpZPX3r8RCGE81bEkzS03q+MdB9YmSHFxCkWHGkjJ4nupMbwaxzUP0JcpU5dr5
         RbOx0YKbpYy5Jx4jcd4rnYvFfKUPc6Ew3k0i1TzF95vRz+eedgouyE/dOABPYcRN092z
         kunG7nc1JveOFsYUMDFwdtgVEHm3z0p2xMy8NHjr89AvPzq73TFTedwFZy0JOyDKUjBK
         OB0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784273517; x=1784878317;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hJ2+RsjIu1eHK3Gfe9WhoyCOoyu0fRnru2GWuIngT/k=;
        b=qHY1CHMtnvKYzTpmAwmRoBqw18LJ3YCaZPd8+DzPLK12eppFhNVMCYiefrjtSEtdWx
         P6sl3sx5qql05Zl/Ld7qen4Jx358lepO5PkJAolfjN8YD2AN+Hq0Ysy00/uoNn7bL2uJ
         kyXtrAG1IXoE6qJY/ys0wQIdd2EATzm2DSKzR8VFSn4zSs0Vp1/Z8s3BVC13SNglTM3p
         xQxT51pAjVUWz/CodiDKTdJ6CS2yA0iR2475OlzAkBRnA/LQh2zlHLYhUD7IdVpbFiue
         woKR+mS/GYft6EG4uZTPJ420zcqimsUBnA44SIFQLze60RJKrVnugBSEcSKJt5BquY94
         Ii5Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro3Jma0l1GQbrSl2PCmRxSWz73OchUnH+hXQr5RRWZdhjkELh96vLXpjFLNQI2ukEdDynYTq4ZXW9//az9xyMfx@lists.infradead.org
X-Gm-Message-State: AOJu0YxOecE1APZvclMeoV3DX4jwqVKU60nM/6OcL0tiN6K/+7ZJcmuT
	Q9pVhZEFAtE73NFukjJQNpTiVcY6yLLOgL4CBohMy64GK3fl4oHzM/CQfPn1+1u0SihTByMpTs9
	sSkOkBdlZFk8Ix3xuWoTF4R4UopN5fsrzHY40Ltl/bDPWQs/RSwLsZcckOhQDXzUHgjx3fJuv+/
	2gKA==
X-Gm-Gg: AfdE7clta6HjMUnwxj3WOriHTAqSmVRi9jAjacbl9We8aZgiR9vxtvN2fvmHtv7ikoS
	ltEAqgox8jTLGrEhaTTgTXycvSxIgai3zeIosh1XfkECUbJuIbdCLoKEKXQR41T21OYfZuHNYFR
	M0G5sM+xF0x+WtKY2Yh091BWXLPJXxzTjM+lXmir8AautbWunANcbm9C6aQXD/xY6RafksUX8uQ
	Y13phwYv/JTHHfuVDzATi/SSQbMe82G55fg5UBifkNpLq0XJ+jdHM1R7BjMbyaOU6VGkSqgnbLD
	4ys0e2RCyG5bgByaJPUqIVHeG8zKg7ePOBIaQcv1dl5pALP6rIOraXH2ZAaGE6zakSbKWpGZ9n6
	oLmSCnsNUnRbBfhgp5ugmU/Cw
X-Received: by 2002:a17:902:ef01:b0:2cc:d192:50b5 with SMTP id d9443c01a7336-2cf349aa87emr17541485ad.34.1784273516589;
        Fri, 17 Jul 2026 00:31:56 -0700 (PDT)
X-Received: by 2002:a17:902:ef01:b0:2cc:d192:50b5 with SMTP id d9443c01a7336-2cf349aa87emr17541225ad.34.1784273516079;
        Fri, 17 Jul 2026 00:31:56 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448fba7sm5882525ad.6.2026.07.17.00.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 00:31:55 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v8 00/10] Add support for Video, Camera, Graphics clock
 controllers on Eliza
Date: Fri, 17 Jul 2026 13:01:44 +0530
Message-Id: <20260717-b4-eliza_mm_cc_v6-v8-0-5cca1bef2e48@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGDaWWoC/33N0QqDIBQG4FcJr2dYmeau9h5jhOlpCZmbbrIte
 vdZN7uJweHA/8P5zowCeAMBHbMZeYgmGDel0BwypAY5XQEbnTIqSckIIwJ3FMNoPrK1tlWqjQw
 zqlRVayqZaFC6u3nozWszz5eUBxMezr+3F5Gt7T8tDcEF1z0RUAtK1MmFkN+fclTO2jwttKKR/
 yBeVHsQTxDVougU9DWBbgdaluUL3JTTAAIBAAA=
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
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: OcxM4GF_aebU3U3mvOdd38ILja5bLyi1
X-Proofpoint-ORIG-GUID: OcxM4GF_aebU3U3mvOdd38ILja5bLyi1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA3MyBTYWx0ZWRfX1LzIub2dee0E
 wG85lw0INOPtgAhySr+/no/RiylBNT77HbWh5lsYcktAwZ3i6XuSQmBSQwlUrmNKOk2fKVcSqec
 pohzQzWsvTC7TyOISaIETr9Nlhwj5lRSeKWXQOGVlUbUSMM3qcvpxt6mLjtLy77XUliWDLxteg2
 pnKLNj5CkvCF+U5CSXexnI666YVfVD1whr47Aa5xArKzXwDtUdyFFkw8wjs5ahv2GTOQNeXGG0L
 R/OcITl7N+SWJZr0eQV9DWUHtW3zMUtd2UsBM9QrLiw6Uzjlgleft3dGFLbgREWW3isp01CyojW
 xDfxMR9OYDex68Ax7a8m7TrVFs35gTWmE9ozWSDnx05JhycVd0xjM4EV19HmfX6Osr0Q87umAL2
 mA6Z74If2C0oTIC6LN6isKx7b6zvlhlVkQTWRig1QcnBXP1Axb+gpqYp9VgH2xHYHtLbJN/5D/2
 1mi1MfwX8r3Yu5t0nyA==
X-Authority-Analysis: v=2.4 cv=TaqmcxQh c=1 sm=1 tr=0 ts=6a59da6d cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Y_ikFBnX2WV78VM4M2oA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA3MyBTYWx0ZWRfX55IrUZPCloBO
 FqQXwH1JLd0/g9YnFdjux40FyJLEQzk4VovChw0MDaI73N0piAZTVrqITbKknKXbXkZDfUBybde
 f24AhwF58gvpS536YkMVy2rgB9+ZGeY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_003201_882501_36FB1903 
X-CRM114-Status: GOOD (  20.89  )
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

Changes in v8:
    - Remove unnecessary '#include <linux/mod_devicetable.h>' from the
      videocc, gpucc, camcc and cambistmclkcc Eliza drivers.
    - Added the RB-by from patchset v6.
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
base-commit: a87737435cfa134f9cdcc696ba3080759d04cf72
change-id: 20260609-b4-eliza_mm_cc_v6-64cc35d4a698

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>


