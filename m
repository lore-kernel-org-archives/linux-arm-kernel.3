Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C25D132D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 14:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RCD3Q2YdIVAxPFAAJwbPXmd28Y6JXATrIQ5pwcB4yzU=; b=HC5yxfmXcQCV1lr2cHw5Aq/rlq
	jUGLfhNeuf5vrw129blycTYwp9tqi2C9v4U/kFFkDsOxENLE/c3QcDLDPBtXWEzGwtF34IE+CHcoy
	ZNHKAm+VK9ljIk8OxowOyOQukQvxhLtX1LAvVP3z/u3tgHQBdxJsWLVYAYfiqC01PRTShxF1BX7Iu
	+9G95YHoSuflNubKIwQB3uPktYzDV7caOfBIlZjHPfERNtNLOCMXoY+47dKGRxYBFqcz+ARWNHLj9
	a9cWJZOye24n0ZEhXp26QAC97D0peLL76peqMnHkBQlDWtEJjnOMO+6FNi5ZX3A36lM64XFEtOKVy
	ZPoWUlNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7xsw-0000000E15I-3BPt;
	Mon, 04 Nov 2024 14:16:50 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7xHT-0000000Dtna-2kwU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 13:38:09 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4AfqkT029108;
	Mon, 4 Nov 2024 14:37:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=RCD3Q2YdIVAxPFAAJwbPXm
	d28Y6JXATrIQ5pwcB4yzU=; b=NopvYOf4lkojTI3Qekra4C84gk8Rcys1krOXjm
	Bl4QON9GLkit10ECuSbTfq7cdRAof3R4RUrOERfn4vXAjrkxI+hAZNgnkez5dGhS
	DEuL+TaVa812Jh514d4pD5egZJDknW26a5KFf90DzUswy4nlx1Z/K777bekLsx4C
	fFbFYxgT8sL1L+J4eAzMHbCKeVoQvp7T1BWZquskTaqfvIV2uJA3krGJf18ZvgKU
	LllcjYLhCT0cZMALWZ07xsglpjp0uVUdRT4ntr+nlSp30adz4pQBPBDu3YdGTB6D
	Sxk//PSwCPIJwCirgnVEze1tuzQeUJjMusGvhqoRCFkRGh+g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42nd0578u3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 14:37:59 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B6F0B40045;
	Mon,  4 Nov 2024 14:36:48 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E67CD28A180;
	Mon,  4 Nov 2024 14:35:53 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 4 Nov
 2024 14:35:53 +0100
Received: from localhost (10.48.86.121) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 4 Nov
 2024 14:35:53 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <op-tee@lists.trustedfirmware.org>, <devicetree@vger.kernel.org>,
        Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v13 0/7] Introduction of a remoteproc tee to load signed firmware
Date: Mon, 4 Nov 2024 14:35:08 +0100
Message-ID: <20241104133515.256497-1-arnaud.pouliquen@foss.st.com>
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
X-CRM114-CacheID: sfid-20241104_053808_065071_D4F264FB 
X-CRM114-Status: GOOD (  14.36  )
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

Main updates from version V12[1]:
Fix warning build by fixing the inline declaration in
remoteproc_tee.h (when CONFIG_REMOTEPROC_TEE is not set).
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202410262040.PWNrKv2Q-lkp@intel.com/

Main updates from version V11[2]:
- rename structures, functions, and variables from "tee_rproc_xxx" to
  "rproc_tee_xxx",
- update rproc_tee_register to return an error instead of
  "struct rproc_tee *" pointer
  
[1] https://lore.kernel.org/lkml/20241025205924.2087768-1-arnaud.pouliquen@foss.st.com/
[2] https://lore.kernel.org/lkml/ZxZ4cBilIlpf3IPw@p14s/T/

Tested-on: commit 42f7652d3eb5 ("Linux 6.12-rc4")
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

Arnaud Pouliquen (7):
  remoteproc: core: Introduce rproc_pa_to_va helper
  remoteproc: Add TEE support
  remoteproc: core: Refactor resource table cleanup into
    rproc_release_fw
  remoteproc: Introduce release_fw optional operation
  dt-bindings: remoteproc: Add compatibility for TEE support
  remoteproc: stm32: Create sub-functions to request shutdown and
    release
  remoteproc: stm32: Add support of an OP-TEE TA to load the firmware

 .../bindings/remoteproc/st,stm32-rproc.yaml   |  58 +-
 drivers/remoteproc/Kconfig                    |  10 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/remoteproc_core.c          |  72 ++-
 drivers/remoteproc/remoteproc_tee.c           | 510 ++++++++++++++++++
 drivers/remoteproc/stm32_rproc.c              | 139 +++--
 include/linux/remoteproc.h                    |   8 +
 include/linux/remoteproc_tee.h                | 105 ++++
 8 files changed, 848 insertions(+), 55 deletions(-)
 create mode 100644 drivers/remoteproc/remoteproc_tee.c
 create mode 100644 include/linux/remoteproc_tee.h


base-commit: 42f7652d3eb527d03665b09edac47f85fb600924
-- 
2.25.1


