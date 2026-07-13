Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4FBFC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 14:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ez7YUef5mEFU+Crqyi0ygTIsVaTvNiD4a2c1lC/wGGs=; b=tsDy+IQavk5PAC
	Vqis8GOE0xvBdFEZrTkKQz6jYr1e1AdZq4KRIZQMEsHn6s890o8FhTXV/depFdgZ8m6XaCQujncae
	Uh9kwKZLBx+leq4nSi04DL50BIzSLjI4P7t9Sj3jPyPonvKIdPgFSoZAyzXTuSisaHH8b85S0kYjK
	yjV3V5Beb/hhwgGUYd9QsMEMUqB0nw47BjYcZn/vqT/rAFALCCuHiwf+G2FvNq6cVQLxbX7GXliCX
	oE29pqJTrA80hQBMCcFSXGArAm9T4F+p/pqkR7JzpPWqvsiKNVGLkJOw4QUD2HFhnq9gfBeOhLd1C
	zpz9bLCz39gRkCpsOEmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjI2h-00000009eg9-0rJT;
	Mon, 13 Jul 2026 14:53:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjI2e-00000009efH-0nkF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 14:53:57 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCEIKT1495445
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 14:53:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Ez7YUef5mEFU+Crqyi0ygT
	IsVaTvNiD4a2c1lC/wGGs=; b=kUvUi8+z+4Crdv2DjL0RBFoT4EI8da8zVwmh5A
	b+iQjsWGrAURFvKsdvjeiQfPpKQRc2RSEQmZQMHeqmF0Uz8g5/p0NWD/FL1CAfz/
	JvRzjXg7N+acVhR1CLFJi2Bw5tf1348oVXtasYPzhlAvOC6LNsfCwvktq++z4gVq
	sXgZzqZ/nBZTXSzP2972s31YOeXTQfmSMIE8zMpM5/pqnMf3V5mpQtAIucT4P2cM
	4qmOhzrgvRlyr1d5DMtoJasVBog9jXyTnJUZZZkTX0L9MCvo0Mw/R75vjlGEsgwP
	ZLDeT//F+rCVNb2pO71qD+wOFq+ozCeFSB8w18Hjb/Kjs/0g==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjnm34yg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 14:53:55 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-4489d5b6876so3942976fac.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 07:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783954435; x=1784559235; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ez7YUef5mEFU+Crqyi0ygTIsVaTvNiD4a2c1lC/wGGs=;
        b=Q6vcS6KSHx2DbQhaoSl0/kDcyzQMLPeu38r12fYXR5rEdACTlvwM9jzn8b/7oyHDWB
         6q6d0vEF0jtc//c5ERQxKp3APzw7IMOMY3lewHcTP5erC5oPBd9uyEgLdN60BvuFr1mp
         FHIGGASBLFQSdYwazG66abCStM3qTZTAygNX/URwpqbGaGb12ooKmhOr3rH2MmO8f8NU
         IiYswZNSKWo0JRweSbTrYWcxXTMoSO11OQ/RauqaFkFEJs/vMsfZu0xMsRnZF4L5fyhv
         zHh66B5Oir5OtmhHl8O60LlxJvAfnFy/JRu30CMbzZgYspOYBh7WaUhMjNoIqf4d7DKB
         fIfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783954435; x=1784559235;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ez7YUef5mEFU+Crqyi0ygTIsVaTvNiD4a2c1lC/wGGs=;
        b=H9lAq7039joksNC84a8YBGps2DpriNgY5u0Q6SNLMRn9qnCzlOxE8fZ55FZIe+cNHv
         mEEa+mdbT6dnHpRZ0HIvmfOK42lWF1X6AjHGoWYYmGLsdeLorRqmxK10BrDDi27cOKq5
         uGj4a97zSbDMhUaWuQHrfAWPRHe50hTFLuyFfHs90NN1XJ8tv9KHDPxN3JeFnC22cuWR
         Ne21k+fq0cM5lm3/To08xO0qNTEaMRTF7elpKU34mj7pzKOHQpqnPXtt+IEU64EKd5KH
         2JeOW8ktnh7PTtlGZC/a8iBfzOLogCuXtntyb8wuCTiOD/m8UQ2uKNVrIdwJMyYNhoeA
         Gfhg==
X-Forwarded-Encrypted: i=1; AFNElJ/XpikJ6g6Ngye44ZdDKg/ihWZJtMP+Jzaqqtah88AgIYOm64IZUnJwIRdkQ8RGlcdm4GF+EcZyq7prjaBJL+WV@lists.infradead.org
X-Gm-Message-State: AOJu0Ywi/eDUWcfMRAAm4z/kMXRFRRESlv8pjK1OjrdF2sz2kJDj2X4H
	5CR7MQhZ8Yjtp56RRM7tfyknkyNtmm9k21On7qtfJVcg7Ro8FQjYJR3AYcSnxdc0wkzQ7qBNd+q
	/SYiDCwjW41rJgk6XT+CwFzCTGUYWpKHqNrxJsY6jObpeXRH2sWfevt2Pevzm9Tll+NGsd0LVrj
	uy1Q==
X-Gm-Gg: AfdE7cn1Xxgy3lfDnJhaYDgkWGGIC+sJmKg2GdR63SWVNrZyqn+c204v6y74EKFL/Ie
	qATMC/0TLvVBablfPFG1fBAydkHfNvkS45S3MpObPt8FSQ0voLuAM9IUfB4g5hzsAnTAdQZcFV7
	sPrBfc3pyLtO6K75m/1myKz6Wv9JQuni3hof+ll+qYI4avqWGUJal+KBPDoa2Q3JX5sW5V4FccE
	3vziSR5D76qE8sY5eqgIFU+Com2hwmvglk2xydBe76B53Hno0APEhGX9NyJJlv/b2zKxKQTl/6f
	gwDtpL4dT4Cshpi3s/SLM3L/ziCE2dvmA+H6bD66fkDC19ScYxOXzLD76PKwQO+9ozuu+epgpU2
	4PIS2qib+CtNdzUVRVghHxkQCZ/a0DlDWkjI=
X-Received: by 2002:a05:6820:83db:20b0:6a2:b8bb:cb88 with SMTP id 006d021491bc7-6a39a5c509emr3590800eaf.17.1783954434690;
        Mon, 13 Jul 2026 07:53:54 -0700 (PDT)
X-Received: by 2002:a05:6820:83db:20b0:6a2:b8bb:cb88 with SMTP id 006d021491bc7-6a39a5c509emr3590770eaf.17.1783954434194;
        Mon, 13 Jul 2026 07:53:54 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a38e9bc8casm6728746eaf.2.2026.07.13.07.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 07:53:53 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v7 00/10] Add support for Video, Camera, Graphics clock
 controllers on Eliza
Date: Mon, 13 Jul 2026 20:23:38 +0530
Message-Id: <20260713-b4-eliza_mm_cc_v6-v7-0-4d91bcef50eb@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPP7VGoC/32NUQ6CMBBEr0L225KKpVi+vIchpC6LbEKptkpUw
 t2tHMBkMsmbZGYWiBSYItTZAoFmjuynBNUuAxzsdCXBXWIoZKGllkZclKCRP7Z1rkVsZy20Qjy
 UnbLaHCH1boF6fm2b5ybxwPHhw3u7mPUv/beWJMW+6nppqDRK4snHmN+fdkTvXJ4MmnVdv9RGP
 wC5AAAA
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
X-Proofpoint-ORIG-GUID: Qr4hnumJDJT4Xe3yMmVaHIJq3gxqtgN4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE1NSBTYWx0ZWRfX512FDOzH0r2U
 9hg2+ryKp47aW18n4CkH9FFS2a0oWL58ziemFFEUVj0LFVf5BTqbQ9rPnZLQzlomxYgPUWMr2MM
 R5P38pb32uOgGn4EXzFIh/ny5sxdE4ZZM1A75pi5wIMJsxesQ+lMXRfnzCDRpuDwTknDHPqa1gV
 p7cj/T3TJibZEO6OvGDa2/+fA1a2henofnv85acpWUBA56Ofxb4PFLpFfaAI+oBIxRKJ6sYD6ko
 nAgSvraJAUsSYkD3fWHK6qmnRSHJOBQubMMBiDWPjcmXAgx8Qfnj46/eMja+1hWekPGUIhclwMc
 MwuF43nwnxG0wsYv7F6VSLRI4srmQsARd40O480XiFEg6M2x9UaUxwHCg+i+bQcrSZl6N/JDILX
 7pDvh7smoU6npN7MJZ2izbugHID8NAo+f95gk8OL8/UJtjYIjmdrR0yGf5yBgfJOSj+Tqu/kLIS
 pRE5pXopnTbk3LIIB/w==
X-Proofpoint-GUID: Qr4hnumJDJT4Xe3yMmVaHIJq3gxqtgN4
X-Authority-Analysis: v=2.4 cv=AfmB2XXG c=1 sm=1 tr=0 ts=6a54fc03 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Y_ikFBnX2WV78VM4M2oA:9 a=QEXdDO2ut3YA:10
 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE1NSBTYWx0ZWRfXxflwB+DvKF4l
 QdmQbuFnQVvcjgDSuwBv9Ht4O70lVGH1cqC/FRLxv54VpFqQ9YCZI53fwlOefk5MoUQ73jcREOE
 u2p8FE4RyBbHvNVle5lHcFp+TatLRN4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_075356_246814_8268F751 
X-CRM114-Status: GOOD (  21.46  )
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
 drivers/clk/qcom/cambistmclkcc-eliza.c             |  465 ++++
 drivers/clk/qcom/camcc-eliza.c                     | 2804 ++++++++++++++++++++
 drivers/clk/qcom/gpucc-eliza.c                     |  607 +++++
 drivers/clk/qcom/videocc-eliza.c                   |  405 +++
 .../dt-bindings/clock/qcom,eliza-cambistmclkcc.h   |   32 +
 include/dt-bindings/clock/qcom,eliza-camcc.h       |  151 ++
 include/dt-bindings/clock/qcom,eliza-gpucc.h       |   51 +
 include/dt-bindings/clock/qcom,eliza-videocc.h     |   37 +
 15 files changed, 4731 insertions(+), 4 deletions(-)
---
base-commit: a87737435cfa134f9cdcc696ba3080759d04cf72
change-id: 20260609-b4-eliza_mm_cc_v6-64cc35d4a698

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>


