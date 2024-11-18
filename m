Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41E3CD49221
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 13:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7O5nEKFBIBm1GCz6ZDzn1l9NyOXSXAkg3gdqNTBw/HY=; b=Aizn5/eLMvGCWI
	5KqIWu8yxUTB4cKinVUJgAAkGMG1tGDssaFnQG7F3a7SAS7YKqhwFHWgkN8hj0iTpALGM9Nukt4PF
	3vl/LxS1O0Vf4lKTH4Qw7BiSmTe1MHZIdDqKG27JrANGELsVQZ/UqR/HfK2ob+PkOxTambX+1idUj
	0iWn46a0SJeB2BSKtOytQNVz1hr+dioxH9nHtRsFSSqgdc3ZUpmSgsmznbH+Ab0nT4h9UuzSVWjFO
	zZDeiAyeMX0MA6cffujZr3EKKHIamdNilz936TNW8Di4BXLNI589oHAiNBfgbr91tV/Jx8U5wpx7y
	umZTvoOzDYRzfG/+FipQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD21c-00000009dcc-1W1v;
	Mon, 18 Nov 2024 13:42:44 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD1yv-00000009cm1-1uy4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 13:39:59 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AIBbYPa032344;
	Mon, 18 Nov 2024 14:39:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=7O5nEKFBIBm1GCz6ZDzn1l
	9NyOXSXAkg3gdqNTBw/HY=; b=nE2XcsPfH3AzQg1iYCU7fjXmHVVhj3gQQmL2SJ
	P9RXzEE/UBI70MbQ+E2n1ytEhHrHr5mmXbxb6pMRdFraFww5wWNws3itwLP40K3E
	13m3NS+MerDYrS+1rHHJNR8AV9qNRLimWORgfxvpDGKUH1I7eqsnsGVq2a2zmXWH
	0t0PFd7ytjQFgfUvZsb2kw8ITw8dKAtCiXshX0Rlz1gLuOwePA/TuZEk0zAMWXf9
	7MelT8lBC+UuSLdxehjkkRyudRBSsNRg5hKbUSPpdQlGddKYzrsLQlm9oGZZnGtZ
	oi59IJ8jjS9qBLZs23zG8Aix4GzBLs3miGhuRPkXn1qGAVPw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42xkqeq7rh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 14:39:41 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7574E40053;
	Mon, 18 Nov 2024 14:38:29 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2D14026E70C;
	Mon, 18 Nov 2024 14:35:26 +0100 (CET)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 18 Nov
 2024 14:35:25 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v3 00/15] media: stm32: introduction of CSI / DCMIPP for
 STM32MP25
Date: Mon, 18 Nov 2024 14:35:23 +0100
Message-ID: <20241118-csi_dcmipp_mp25-v3-0-c1914afb0a0f@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJtCO2cC/2WNQQ6CMBBFr0JmbUkZxBFW3sMQgqWVWUCbDiEaw
 t2tuHT5XvLf30BsZCvQZBtEu7KwnxOUpwzM2M9Pq3hIDKjxXGhNygh3g5k4hG4KWCkiqi+6cBU
 NPaRViNbx6yje28Qjy+Lj+zhY8Wt/rUJXf60VlVaP2plrT0ilwZvzIrksufETtPu+fwA3Eyy4s
 AAAAA==
X-Change-ID: 20241007-csi_dcmipp_mp25-7779601f57da
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Hans Verkuil
	<hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Alain Volmat <alain.volmat@foss.st.com>,
        <stable@vger.kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_053957_810281_B2AA1419 
X-CRM114-Status: GOOD (  12.95  )
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

This series introduces the camera pipeline support for the
STM32MP25 SOC.  The STM32MP25 has 3 pipelines, fed from a
single camera input which can be either parallel or csi.

This series adds the basic support for the 1st pipe (dump)
which, in term of features is same as the one featured on
the STM32MP13 SOC.  It focuses on introduction of the
CSI input stage for the DCMIPP, and the CSI specific new
control code for the DCMIPP.
One of the subdev of the DCMIPP, dcmipp_parallel is now
renamed as dcmipp_input since it allows to not only control
the parallel but also the csi interface.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
Changes in v3:
* stm32-csi: use clk_bulk api
* stm32-csiL perform reset control within the probe
- Link to v2: https://lore.kernel.org/r/20241105-csi_dcmipp_mp25-v2-0-b9fc8a7273c2@foss.st.com

---
Alain Volmat (15):
      media: stm32: dcmipp: correct dma_set_mask_and_coherent mask value
      dt-bindings: media: add description of stm32 csi
      media: stm32: csi: addition of the STM32 CSI driver
      media: stm32: dcmipp: use v4l2_subdev_is_streaming
      media: stm32: dcmipp: replace s_stream with enable/disable_streams
      media: stm32: dcmipp: rename dcmipp_parallel into dcmipp_input
      media: stm32: dcmipp: add support for csi input into dcmipp-input
      media: stm32: dcmipp: add bayer 10~14 bits formats
      media: stm32: dcmipp: add 1X16 RGB / YUV formats support
      media: stm32: dcmipp: avoid duplicated format on enum in bytecap
      media: stm32: dcmipp: fill media ctl hw_revision field
      dt-bindings: media: add the stm32mp25 compatible of DCMIPP
      media: stm32: dcmipp: add core support for the stm32mp25
      arm64: dts: st: add csi & dcmipp node in stm32mp25
      arm64: dts: st: enable imx335/csi/dcmipp pipeline on stm32mp257f-ev1

 .../devicetree/bindings/media/st,stm32-dcmipp.yaml |   53 +-
 .../bindings/media/st,stm32mp25-csi.yaml           |  125 +++
 MAINTAINERS                                        |    8 +
 arch/arm64/boot/dts/st/stm32mp251.dtsi             |   23 +
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts         |   85 ++
 drivers/media/platform/st/stm32/Kconfig            |   14 +
 drivers/media/platform/st/stm32/Makefile           |    1 +
 drivers/media/platform/st/stm32/stm32-csi.c        | 1137 ++++++++++++++++++++
 .../media/platform/st/stm32/stm32-dcmipp/Makefile  |    2 +-
 .../st/stm32/stm32-dcmipp/dcmipp-bytecap.c         |  128 ++-
 .../st/stm32/stm32-dcmipp/dcmipp-byteproc.c        |  119 +-
 .../platform/st/stm32/stm32-dcmipp/dcmipp-common.h |    4 +-
 .../platform/st/stm32/stm32-dcmipp/dcmipp-core.c   |  116 +-
 .../platform/st/stm32/stm32-dcmipp/dcmipp-input.c  |  540 ++++++++++
 .../st/stm32/stm32-dcmipp/dcmipp-parallel.c        |  440 --------
 15 files changed, 2219 insertions(+), 576 deletions(-)
---
base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
change-id: 20241007-csi_dcmipp_mp25-7779601f57da

Best regards,
-- 
Alain Volmat <alain.volmat@foss.st.com>


