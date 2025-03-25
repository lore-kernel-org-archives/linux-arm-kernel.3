Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0175FC35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 10:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pjwodPeGoQRNskM8wRB/+5v/OYaad9fMmX1WtOfP2Ug=; b=zn4aRP4qPzJyR+q+vnKRtRw7dQ
	lRwbuySS3KCVZKF3D4JNf0AeVH+easYYRHD09DqtqadCMWVlW4wkK9wGPZU/vt9/WjVjXCHYke5b2
	ZczDMuV4Z4oxB6wrTbjXpkyQpCDoZXlK+D7KscBSl6oc7mHeEGC9p+jY3RrDsVC+HIfAQRwIzdOCp
	hmVLKb5v1cvPV92n82noXYXSBN6cIzBBVhA19ssK6WCWSemi5VIYa93o1rCFVZX2Z5wrwEEumihWv
	9lYRJCxQAbqXxlwcAZalJJhPHb4aGGJDnVwW26gX55E67e3e3U6BnHglET40T4lisuoGg5sy76xOW
	YT3qNoJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tx1CJ-00000005Om9-3wTA;
	Tue, 25 Mar 2025 10:07:51 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tx15T-00000005Nik-48pD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 10:00:51 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52P69SAF005985;
	Tue, 25 Mar 2025 11:00:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=pjwodPeGoQRNskM8wRB/+5
	v/OYaad9fMmX1WtOfP2Ug=; b=C9bnNZUZubciQOiwpWJibY0aPgIVkw+SJaz/Ps
	aaliIjjvmLR9uWL/nlp/Ji+MyFzxP9K0wOlEifwtYAeIxzvoZ122sCdVnNKL8QhM
	djJEozRmLNwD5E+tfvlm6Uf12lwGF/CKZEW2ZPo1JJTFkaQ6HqIdPvEaHMf7jEpl
	WpoiFj25hTD+xgGnz32GwBFrL3j/UNQ3KrQyE28QWMPcM4LUJglxpDfXwOaA0Kbd
	o8qkKB4yplNtWVJC1/WBzPkfDZUnV6+1NzeFPZKoXd0YS95+ry2LyHz/DuQw80OD
	rtRAUCu2ywEKG5WHofSfnxGor3fEvZTcdUqg/UR3MsdkyaWw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45hk7d3yg3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Mar 2025 11:00:38 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1B07940055;
	Tue, 25 Mar 2025 10:59:36 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EFBF3823755;
	Tue, 25 Mar 2025 10:58:44 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Mar
 2025 10:58:44 +0100
Received: from localhost (10.252.12.99) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Mar
 2025 10:58:44 +0100
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
Subject: [PATCH v16 0/6] Introduction of a remoteproc tee to load signed firmware
Date: Tue, 25 Mar 2025 10:58:27 +0100
Message-ID: <20250325095833.3059895-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.252.12.99]
X-ClientProxiedBy: SAFCAS1NODE1.st.com (10.75.90.11) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_04,2025-03-25_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_030048_524894_CDFE14E8 
X-CRM114-Status: GOOD (  15.23  )
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

Main updates from version V15[1]:
- Removed the rproc_ops:load_fw() operation introduced in the previous version.
- Returned to managing the remoteproc firmware loading in rproc_tee_parse_fw to
  load and authenticate the firmware before getting the resource table.
- Added spinlock and dev_link mechanisms in remoteproc TEE to better manage
  bind/unbind.

More details are available in each patch commit message.

[1] https://lore.kernel.org/linux-remoteproc/20241128084219.2159197-7-arnaud.pouliquen@foss.st.com/T/

Tested-on: commit 0a0ba9924445 ("Linux 6.14-rc7")

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



Arnaud Pouliquen (6):
  remoteproc: core: Introduce rproc_pa_to_va helper
  remoteproc: Add TEE support
  remoteproc: Introduce release_fw optional operation
  dt-bindings: remoteproc: Add compatibility for TEE support
  remoteproc: stm32: Create sub-functions to request shutdown and
    release
  remoteproc: stm32: Add support of an OP-TEE TA to load the firmware

 .../bindings/remoteproc/st,stm32-rproc.yaml   |  58 +-
 drivers/remoteproc/Kconfig                    |  10 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/remoteproc_core.c          |  52 ++
 drivers/remoteproc/remoteproc_internal.h      |   6 +
 drivers/remoteproc/remoteproc_tee.c           | 619 ++++++++++++++++++
 drivers/remoteproc/stm32_rproc.c              | 139 +++-
 include/linux/remoteproc.h                    |   4 +
 include/linux/remoteproc_tee.h                |  90 +++
 9 files changed, 935 insertions(+), 44 deletions(-)
 create mode 100644 drivers/remoteproc/remoteproc_tee.c
 create mode 100644 include/linux/remoteproc_tee.h


base-commit: 0a0ba99244455fea8706c4a53f5f66a45d87905d
-- 
2.25.1


