Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D459FD690ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 08:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EYr4h/c0WQP59LjcKOXodUNANQzD9BhOLn9fwkTUXdw=; b=awr04/8N1U3ecDn3v9MmwN/V6t
	OHFkh9+vrPFdK5R1wHYgd+Hc416rkzSW6o9lP/uroZn2V1LPXSBaaVmrBzZIynoA8P5bc345aEpNL
	pKF/uxmPkzOT70aNe9J3p+ohxuOGtwG17CTQ3C8sxnPLr62GfafZyGp5wo//4F6zh8NYojQ6x3dZB
	RYGQ/XK316AQcNdMWQ5hYOscnRzTBCc089r13n2yit3cgGfIt59RrdPM8j0snHcXuMHxBhvmvMw7R
	SWuIHgkBHIDqFkwDjGeXaINywyGU+MhS2wG/1FOQmQ0v/PQxSNXH8VfhSSnKUySLOHIWIHnTpw97b
	71n6FNNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGaKd-0000000F5Hr-3q9c;
	Thu, 28 Nov 2024 08:57:03 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGaEa-0000000F45G-0G75;
	Thu, 28 Nov 2024 08:50:49 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AS20mMo014838;
	Thu, 28 Nov 2024 09:50:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=EYr4h/c0WQP59LjcKOXodU
	NANQzD9BhOLn9fwkTUXdw=; b=Cq2gG0udCMmyFRXkl+cmmchbQjWFadgBjjPbAx
	1W4jzoSRgq8pSxF8He9LOfuz6QwwHzsIA8Nedyu/mlRGsWqaUlRX6AcReY7Frsdq
	Tyv3etwZEnNe0NahQ+dzspPTlP69X1VnvE2Mnauy6z8iI9J+hXCk/sZ+RTy3VSlK
	QzK9S4YT7f7TdGzXrCu5jeeIgABSC0KC8s4lJVPLTNPK46HOwcePPac/dZrlN8k+
	jG3zodNPqFljM56OPtXmSXeWPNXfy2tANBrjb9FAKOLKKbQr3zblUJEZcSeYovOl
	fps5s05Cx5JM08pUjRK9y30alkODhzGiZBvqD2r6skaM74aA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 436719b4kq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Nov 2024 09:50:30 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 249CC4002D;
	Thu, 28 Nov 2024 09:48:36 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 82CDD266A56;
	Thu, 28 Nov 2024 09:42:48 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 28 Nov
 2024 09:42:48 +0100
Received: from localhost (10.48.86.121) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 28 Nov
 2024 09:42:47 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer
	<s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        "Jerome
 Brunet" <jbrunet@baylibre.com>,
        Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>,
        Matthias Brugger
	<matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
        Patrice Chotard
	<patrice.chotard@foss.st.com>,
        Fabien Dessenne <fabien.dessenne@foss.st.com>,
        Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <imx@lists.linux.dev>, <linux-amlogic@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>
Subject: [PATCH v15 0/8] Introduction of a remoteproc tee to load signed firmware
Date: Thu, 28 Nov 2024 09:42:07 +0100
Message-ID: <20241128084219.2159197-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.86.121]
X-ClientProxiedBy: SAFCAS1NODE1.st.com (10.75.90.11) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_005048_392053_DBE086CA 
X-CRM114-Status: GOOD (  13.74  )
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

Main updates from version V14[1]:
Fix Rename missing load() to load_segments() in pru_rproc.c.

Main updates from version V13[2]:
- Introduce new rproc_ops operation: load_fw() and release_fw(),
- Rename load() operation to load_segments() in rproc_ops structure and
  drivers.

More details are available in each patch commit message.

[1] https://lore.kernel.org/linux-arm-kernel/20241126091042.918144-1-arnaud.pouliquen@foss.st.com/T/
[2] https://lore.kernel.org/linux-arm-kernel/20241104133515.256497-1-arnaud.pouliquen@foss.st.com/T/

Tested-on: commit adc218676eef ("Linux 6.12")
Description of the feature:
--------------------------
This series proposes the implementation of a remoteproc tee driver to
communicate with a TEE trusted application responsible for authenticating
and loading the remoteproc firmware image in an Arm secure context.

1) Principle:

The remoteproc tee driver provides services to communicate with the OP-TEE
trusted application running on the Trusted Execution Context (TEE).
The trusted application in TEE manages the remote processor lifecycle:

- authenticating and loading firmware images,
- isolating and securing the remote processor memories,
- supporting multi-firmware (e.g., TF-M + Zephyr on a Cortex-M33),
- managing the start and stop of the firmware by the TEE.

2) Format of the signed image:

Refer to:
https://github.com/OP-TEE/optee_os/blob/master/ta/remoteproc/src/remoteproc_core.c#L18-L57

3) OP-TEE trusted application API:

Refer to:
https://github.com/OP-TEE/optee_os/blob/master/ta/remoteproc/include/ta_remoteproc.h

4) OP-TEE signature script

Refer to:
https://github.com/OP-TEE/optee_os/blob/master/scripts/sign_rproc_fw.py

Example of usage:
sign_rproc_fw.py --in <fw1.elf> --in <fw2.elf> --out <signed_fw.sign> --key ${OP-TEE_PATH}/keys/default.pem


5) Impact on User space Application

No sysfs impact. The user only needs to provide the signed firmware image
instead of the ELF image.


For more information about the implementation, a presentation is available here
(note that the format of the signed image has evolved between the presentation
and the integration in OP-TEE).

https://resources.linaro.org/en/resource/6c5bGvZwUAjX56fvxthxds

Arnaud Pouliquen (8):
  remoteproc: core: Introduce rproc_pa_to_va helper
  remoteproc: Add TEE support
  remoteproc: Introduce load_fw and release_fw optional operation
  remoteproc: Rename load() operation to load_segments() in rproc_ops
    struct
  remoteproc: Make load_segments and load_fw ops exclusive and optional
  dt-bindings: remoteproc: Add compatibility for TEE support
  remoteproc: stm32: Create sub-functions to request shutdown and
    release
  remoteproc: stm32: Add support of an OP-TEE TA to load the firmware

 .../bindings/remoteproc/st,stm32-rproc.yaml   |  58 +-
 drivers/remoteproc/Kconfig                    |  10 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/imx_dsp_rproc.c            |   2 +-
 drivers/remoteproc/imx_rproc.c                |   2 +-
 drivers/remoteproc/meson_mx_ao_arc.c          |   2 +-
 drivers/remoteproc/mtk_scp.c                  |   2 +-
 drivers/remoteproc/pru_rproc.c                |   2 +-
 drivers/remoteproc/qcom_q6v5_adsp.c           |   2 +-
 drivers/remoteproc/qcom_q6v5_mss.c            |   2 +-
 drivers/remoteproc/qcom_q6v5_pas.c            |   4 +-
 drivers/remoteproc/qcom_q6v5_wcss.c           |   4 +-
 drivers/remoteproc/qcom_wcnss.c               |   2 +-
 drivers/remoteproc/rcar_rproc.c               |   2 +-
 drivers/remoteproc/remoteproc_core.c          |  68 ++-
 drivers/remoteproc/remoteproc_internal.h      |  20 +-
 drivers/remoteproc/remoteproc_tee.c           | 508 ++++++++++++++++++
 drivers/remoteproc/st_remoteproc.c            |   2 +-
 drivers/remoteproc/st_slim_rproc.c            |   2 +-
 drivers/remoteproc/stm32_rproc.c              | 141 +++--
 drivers/remoteproc/xlnx_r5_remoteproc.c       |   2 +-
 include/linux/remoteproc.h                    |  20 +-
 include/linux/remoteproc_tee.h                | 105 ++++
 23 files changed, 894 insertions(+), 69 deletions(-)
 create mode 100644 drivers/remoteproc/remoteproc_tee.c
 create mode 100644 include/linux/remoteproc_tee.h


base-commit: adc218676eef25575469234709c2d87185ca223a
-- 
2.25.1


