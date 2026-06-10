Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E8FCD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 08:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ylu+Tb2JTyurGTPgutanmdf7MDZCdOCesAoVpcfnghM=; b=wdozQOzS+cULYvZUXPFZcxiINS
	3oeu9iu1E091MfG71NhOA9pZBpjgFG2nBVxo+VNTAS8ws8ZsouxBl4R08z8v8ocdXmjH5h9n4Ai6F
	Wl3DpjzP3waPWA6jCgX6cdL8BZ80W489br9NL09dAluiCbZqztE8Amcp2Pe+uCHsddN933LYP+opF
	RGFf8wvd2zlD8Q7jHn0rz0a0pj0gjKSJRXK+/jYrl9Uu+qRaI/wbFpdgbb0gMu+1ikRy0bYli0w21
	OpejD83mrcnWQAeGcjLLddER7TE2rbrzPTPFBtt8bZbLkLBj96LYzaEoItK9Wlu1G6bTWQKWGE8H9
	yO3DZA7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEfT-0000000787C-15aG;
	Wed, 10 Jun 2026 08:52:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEfM-0000000783f-0eQc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 08:52:06 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7iS7q989051
	for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 08:52:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ylu+Tb2JTyurGTPgutanmdf7MDZCdOCesAoVpcfnghM=; b=azUaAkRE5t+/5fvz
	PLwsA/3+jRNUPKVPL4YDG19TJvdpgRcbAVEFhjCpxXG8ZEZmtGBNXQ4+NC32EAPe
	maq92V9Cq5WWz1IKAkDvemHjGyE/qlui+r23KsO+TSWK8FPgIVqpz9e4s8krxAwJ
	8YD3Bkm14Mc2G6csrWePkLvjeIoygPaD16COKt3DhxGFGl8zunFRZlxMZh6Q5ko8
	3XwnpfgiFPhT5TiWZLKvM7kdpY1QihZ9rg5bDoTEzUw6xniOK5+ROYGmzbrrxcTt
	4Lyi+LCKArzoFJGPSDy48yQrKvgwVqrUkirPPkM/JcETtOfenpoJJbruBd8WwsOu
	VkPXtw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq2seggrb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 08:52:02 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0c32faa62so117686525ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 01:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781081522; x=1781686322; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ylu+Tb2JTyurGTPgutanmdf7MDZCdOCesAoVpcfnghM=;
        b=JkcrkCteObnBQUcMm2F8sjofAMlc73bfoQS+UBYAsmZso0zvEuLAhUYwi0GRZz6PPx
         rdRR5JWhcnvwvxRPL7KHj3uNoxttsgduzj12kLXXDitK+9z5pgBZ806SSednGWSxq38d
         MDVoFztg5/57sOegT4gDVkAFVrgigYrikO1N8rL+ZyHtJTkjjBpPWvAwA5rwEo9CECfC
         HIhvCd1zWRHugpy+Z0PeUWaFuuBv1ZfxxGGrwkh1sOBk6oyjS33RqhTbjquTmvO5UPns
         J/ybrUmzG1HS8vhAzF7V0dykT7VlE7fBNs+WmAPOao27k1yu9ZslUzZJlRRGoCxTaK8m
         cX6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781081522; x=1781686322;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ylu+Tb2JTyurGTPgutanmdf7MDZCdOCesAoVpcfnghM=;
        b=fWCq1u/HRWT0+bPx7MRADB1NTxBCP92Wxd3p2BL/zRYSw2IGY8TVlF85r6tREUqCYR
         yQAKNUqT5S2IqqEMPGRl8gVNnKlGgNPYrNL7wVKimHEWoW63rKRrrzvmZSsyAur3m/VC
         pY5cYiti1Mzh6bpLRMsY9jBzZ7gJ9ocH7nvW+z0izKbHy5Um9d9Rgis9tmt25ErPwVhK
         NnyzrzvPgCzlu30ElAQYiPxiEROBZZOeMSJ9VJLId+3DbSKRmPOU0LMqbO00X2XGKjEK
         gXyF+XZdVa4HIPyzaXrL5DSYATU2eBwUKdarsZhiAU6Uf236cVQBB7S8twiVpZkQzOZr
         qynA==
X-Forwarded-Encrypted: i=1; AFNElJ/y9bAOCifWGqhUj13jBMPguQs9s/RPB4E0fKFq3VtDRI/s51WtQYCVit5gyvr61tEKxS+aDovPJvh2TzylsDyn@lists.infradead.org
X-Gm-Message-State: AOJu0YyYtQPCifC8I0eocijugey0nWHOyNCpD/l9tlVEsUoxLDivmWYK
	l1We2wi158XOLGi3xOR4ZHyoIM2COFjM1BWPugVhRBObBOjABA78GAZgAdfYcscEC8vW6kvQAyC
	rcThaGvjxLnBFc9UvdYbFYP5VXEb5SV0z/BOY0Hd9rZ4Ifx/XJLLy/X9Mi2nJuh2Zu6ARTMWQN/
	4vlQ==
X-Gm-Gg: Acq92OGOhf+CgTjqjAsFPDqcAcD+so0X3XTOFmyO3ifD7hQteedaLXe8snyW931vDc5
	4KWiZAStLMh8tQY/Z1+KI85A7tdVCD8LhVnzX+AbOSnID9IT8EHnZjAQxks3r+k0pCR2pwOexNy
	SCb8gQ+aCHKixZXPBFtq3nWOVO6/dBcv/S2C7bc6DGJLQdjZB3ClZvqm/IPBiOZKGJnw5fHeMX2
	08Boi9WCuMYWAXAXRJY93q29Dega0Uv17dw0iuuuhzEzf7Xw9x2AhO4TtRzPgnTgpq/untGORUK
	dvCyeBGR51hwSbSlXzQbRzkNh5gubEKHLj5GtQ9N0IKT0yIlAdjczKGgx/ABFXHAGcxMayQ98I7
	cVTcVl9uCeO2kT2AqUhbOc69LPzt+qXarg5N9BP6wDyU7naHAd/L0wwbYiOOmJ6sCGDiCvH4biP
	VCYyZCVPJdmdfykxhw9phr9VY7R6bRNPd2HclNSVDmf93S9JAe5bmRcH0nPBc=
X-Received: by 2002:a17:903:1a2d:b0:2c2:bd7f:ccd4 with SMTP id d9443c01a7336-2c2bd7fcdb2mr36628715ad.21.1781081521043;
        Wed, 10 Jun 2026 01:52:01 -0700 (PDT)
X-Received: by 2002:a17:903:1a2d:b0:2c2:bd7f:ccd4 with SMTP id d9443c01a7336-2c2bd7fcdb2mr36628045ad.21.1781081520095;
        Wed, 10 Jun 2026 01:52:00 -0700 (PDT)
Received: from hu-ppapaniy-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c24edc8acasm114618175ad.45.2026.06.10.01.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:51:59 -0700 (PDT)
From: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 14:21:28 +0530
Subject: [PATCH RFC v7 1/9] firmware: arm_scmi: Add QCOM Generic Vendor
 Protocol documentation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-rfc_v7_scmi_memlat-v7-1-f3f68c608f25@oss.qualcomm.com>
References: <20260610-rfc_v7_scmi_memlat-v7-0-f3f68c608f25@oss.qualcomm.com>
In-Reply-To: <20260610-rfc_v7_scmi_memlat-v7-0-f3f68c608f25@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781081505; l=40905;
 i=pragnesh.papaniya@oss.qualcomm.com; s=20260120; h=from:subject:message-id;
 bh=zvgtiOY9qUjQklvu4UM79+owpYtVrSbxEet9NtPp8R4=;
 b=GAtvnH7zwKmTtSpg2u3qO2YkWuFKMbIpUbicIcK2WPrXvry2dJ3dtB15O4IQTevm4lfj6aryw
 u+apweTqsJ2A9L7vaRb9dYU9zhUGs8jD0c05XqEVTTqST1tiWk0NRia
X-Developer-Key: i=pragnesh.papaniya@oss.qualcomm.com; a=ed25519;
 pk=09P9nFmZLXJ9+4Jx10ZK5rIW0Fmk79A/DLErm6aVA0c=
X-Proofpoint-GUID: g3etLzz7ZZSEOFn8q4gKPbx__l6t6Tl9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4MyBTYWx0ZWRfXxpAeCo5VUbBK
 vaiRdXzo+C8lDNbqsWdTOfBoGSgN7/gSh5VIW9nrCAnr+WBm8XLT+Wj8lZJBjEYylPBN/+GGQnu
 5AtjXkVEbs2nLIotM+L4KcfJCkXAA71ch+kYAlV/WuWjv7scZRDb+M0ePlg/NDGe5d2dqP3R/iI
 8sTN3RQ5Z/JpRE0OmKg7VhIcKB+yLXkO9HGMkHDdaFhtJ6pvm7H5UCOAhtMo87lzt0NdO+Qzuhr
 wqTY1pBPHDWUDGrycdO0/0PKKEwutzocrROV8jQreXrSxcwhWjz8vqpshTfvwXUCajYINiscmsM
 X1lkKKX/rScNzxP2G2XWgPbqQ7+koUSnkB5VIMN9eNnV0YdIfJQF/KPfj6uctJMDb6w4I6ycbio
 jKSfWy07izy5pFkhxd2M58SarCXxUlQn8lwckd058OmN9z5AVmCSJ3ut958QYMP9BE0ufIIMTUM
 RY8vLzZr0fhzvuGereg==
X-Proofpoint-ORIG-GUID: g3etLzz7ZZSEOFn8q4gKPbx__l6t6Tl9
X-Authority-Analysis: v=2.4 cv=Md1cfZ/f c=1 sm=1 tr=0 ts=6a2925b3 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=TLQOcO4xEgnVrnW6FtgA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_015204_498489_68307C34 
X-CRM114-Status: GOOD (  17.12  )
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

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

Add QCOM System Control Management Interface (SCMI) Generic Vendor
Extensions Protocol documentation. It exposes Qualcomm SoC-specific
features through (algorithm string, param_id) pairs carried over a small
set of generic SET/GET/START/STOP commands, alongside the standard
PROTOCOL_VERSION / _ATTRIBUTES / _MESSAGE_ATTRIBUTES handshake required by
the Arm SCMI specification.

Document the protocol so that drivers targeting it have a stable reference
for command ids, payload layouts and status code semantics. The first
algorithm covered is MEMLAT (memory latency governor), including its
memory-group model (DDR, LLCC, DDR_QOS), event-map programming and per-
monitor frequency voting tables.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Co-developed-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Signed-off-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
---
 .../arm_scmi/vendors/qcom/qcom_generic.rst         | 647 +++++++++++++++++++++
 1 file changed, 647 insertions(+)

diff --git a/drivers/firmware/arm_scmi/vendors/qcom/qcom_generic.rst b/drivers/firmware/arm_scmi/vendors/qcom/qcom_generic.rst
new file mode 100644
index 000000000000..ba0c64729790
--- /dev/null
+++ b/drivers/firmware/arm_scmi/vendors/qcom/qcom_generic.rst
@@ -0,0 +1,647 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: <isonum.txt>
+
+===============================================================================
+QCOM System Control and Management Interface(SCMI) Vendor Protocols Extension
+===============================================================================
+
+:Copyright: |copy| Qualcomm Technologies, Inc. and/or its subsidiaries.
+
+:Author:
+   - Sibi Sankar <sibi.sankar@oss.qualcomm.com>
+   - Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
+
+SCMI_GENERIC: System Control and Management Interface QCOM Generic Vendor Protocol
+==================================================================================
+
+This protocol is intended as a generic way of exposing a number of Qualcomm
+SoC specific features through a mixture of pre-determined algorithm string and
+param_id pairs hosted on the SCMI controller. It implements an interface compliant
+with the Arm SCMI Specification with additional vendor specific commands as
+detailed below.
+
+Supported algorithm strings are documented in their own sections after the
+generic commands (currently: MEMLAT, see below).
+
+Commands:
+_________
+
+PROTOCOL_VERSION
+~~~~~~~~~~~~~~~~
+
+message_id: 0x0
+protocol_id: 0x80
+
++---------------+--------------------------------------------------------------+
+|Return values                                                                 |
++---------------+--------------------------------------------------------------+
+|Name           |Description                                                   |
++---------------+--------------------------------------------------------------+
+|int32 status   |See ARM SCMI Specification for status code definitions.       |
++---------------+--------------------------------------------------------------+
+|uint32 version |For this revision of the specification, this value must be    |
+|               |0x10000.                                                      |
++---------------+--------------------------------------------------------------+
+
+PROTOCOL_ATTRIBUTES
+~~~~~~~~~~~~~~~~~~~
+
+message_id: 0x1
+protocol_id: 0x80
+
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |See ARM SCMI Specification for status code definitions.    |
++------------------+-----------------------------------------------------------+
+|uint32 attributes |Bits[31:16] Reserved, must be set to 0.                    |
+|                  |Bits[15:8] Number of agents in the system. Must match the  |
+|                  |value reported by the standard BASE protocol's             |
+|                  |PROTOCOL_ATTRIBUTES response.                              |
+|                  |Bits[7:0] Number of algorithmic strings supported by the   |
+|                  |system. Only "MEMLAT" is currently supported hence it      |
+|                  |returns 1.                                                 |
++------------------+-----------------------------------------------------------+
+
+PROTOCOL_MESSAGE_ATTRIBUTES
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+message_id: 0x2
+protocol_id: 0x80
+
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |See ARM SCMI Specification for status code definitions.    |
++------------------+-----------------------------------------------------------+
+|uint32 attributes |For all message IDs the parameter has a value of 0.        |
++------------------+-----------------------------------------------------------+
+
+QCOM_SCMI_SET_PARAM
+~~~~~~~~~~~~~~~~~~~
+
+message_id: 0x10
+protocol_id: 0x80
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 ext_id     |Reserved, must be zero.                                    |
++------------------+-----------------------------------------------------------+
+|uint32 algo_low   |Lower 32-bit value of the algorithm string.                |
++------------------+-----------------------------------------------------------+
+|uint32 algo_high  |Upper 32-bit value of the algorithm string.                |
++------------------+-----------------------------------------------------------+
+|uint32 param_id   |Serves as the token message id for the algorithm string    |
+|                  |and is used to set various parameters supported by it.     |
++------------------+-----------------------------------------------------------+
+|uint32 buf[]      |Serves as the payload for the specified param_id and       |
+|                  |algorithm string pair. The payload size depends on the     |
+|                  |(algorithm string, param_id) pair; see the per-algorithm   |
+|                  |sections below.                                            |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: if the param_id and buf[] is parsed successfully  |
+|                  |by the chosen algorithm string.                            |
+|                  |NOT_SUPPORTED: if the algorithm string does not have any   |
+|                  |matches.                                                   |
+|                  |INVALID_PARAMETERS: if the param_id and the buf[] passed   |
+|                  |is rejected by the algorithm string.                       |
++------------------+-----------------------------------------------------------+
+
+QCOM_SCMI_GET_PARAM
+~~~~~~~~~~~~~~~~~~~
+
+message_id: 0x11
+protocol_id: 0x80
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 ext_id     |Reserved, must be zero.                                    |
++------------------+-----------------------------------------------------------+
+|uint32 algo_low   |Lower 32-bit value of the algorithm string.                |
++------------------+-----------------------------------------------------------+
+|uint32 algo_high  |Upper 32-bit value of the algorithm string.                |
++------------------+-----------------------------------------------------------+
+|uint32 param_id   |Serves as the token message id for the algorithm string.   |
++------------------+-----------------------------------------------------------+
+|uint32 buf[]      |Serves as the payload and store of value for the specified |
+|                  |param_id and algorithm string pair. The payload size       |
+|                  |depends on the (algorithm string, param_id) pair; see the  |
+|                  |per-algorithm sections below. The response payload is      |
+|                  |returned in the same buffer, overwriting the request       |
+|                  |contents on success.                                       |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: if the param_id and buf[] is parsed successfully  |
+|                  |by the chosen algorithm string and the result is copied    |
+|                  |into buf[].                                                |
+|                  |NOT_SUPPORTED: if the algorithm string does not have any   |
+|                  |matches.                                                   |
+|                  |INVALID_PARAMETERS: if the param_id and the buf[] passed   |
+|                  |is rejected by the algorithm string.                       |
++------------------+-----------------------------------------------------------+
+|uint32 buf[]      |Holds the payload of the result of the query, returned in  |
+|                  |the same buffer used to send the request. Size depends on  |
+|                  |the (algorithm string, param_id) pair.                     |
++------------------+-----------------------------------------------------------+
+
+QCOM_SCMI_START_ACTIVITY
+~~~~~~~~~~~~~~~~~~~~~~~~
+
+message_id: 0x12
+protocol_id: 0x80
+
+The activity to be started is defined by the algorithm string; see the
+per-algorithm sections (e.g. MEMLAT_START_TIMER) for valid param_ids.
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 ext_id     |Reserved, must be zero.                                    |
++------------------+-----------------------------------------------------------+
+|uint32 algo_low   |Lower 32-bit value of the algorithm string.                |
++------------------+-----------------------------------------------------------+
+|uint32 algo_high  |Upper 32-bit value of the algorithm string.                |
++------------------+-----------------------------------------------------------+
+|uint32 param_id   |Serves as the token message id for the algorithm string    |
+|                  |and is generally used to start the activity performed by   |
+|                  |the algorithm string.                                      |
++------------------+-----------------------------------------------------------+
+|uint32 buf[]      |Serves as the payload for the specified param_id and       |
+|                  |algorithm string pair. The payload size depends on the     |
+|                  |(algorithm string, param_id) pair; see the per-algorithm   |
+|                  |sections below.                                            |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: if the activity performed by the algorithm string |
+|                  |starts successfully, or if it was already running.         |
+|                  |NOT_SUPPORTED: if the algorithm string does not have any   |
+|                  |matches.                                                   |
++------------------+-----------------------------------------------------------+
+
+QCOM_SCMI_STOP_ACTIVITY
+~~~~~~~~~~~~~~~~~~~~~~~
+
+message_id: 0x13
+protocol_id: 0x80
+
+The activity to be stopped is defined by the algorithm string; see the
+per-algorithm sections (e.g. MEMLAT_STOP_TIMER) for valid param_ids.
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 ext_id     |Reserved, must be zero.                                    |
++------------------+-----------------------------------------------------------+
+|uint32 algo_low   |Lower 32-bit value of the algorithm string.                |
++------------------+-----------------------------------------------------------+
+|uint32 algo_high  |Upper 32-bit value of the algorithm string.                |
++------------------+-----------------------------------------------------------+
+|uint32 param_id   |Serves as the token message id for the algorithm string    |
+|                  |and is generally used to stop the activity performed by    |
+|                  |the algorithm string.                                      |
++------------------+-----------------------------------------------------------+
+|uint32 buf[]      |Serves as the payload for the specified param_id and       |
+|                  |algorithm string pair. The payload size depends on the     |
+|                  |(algorithm string, param_id) pair; see the per-algorithm   |
+|                  |sections below.                                            |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: if the activity performed by the algorithm string |
+|                  |stops successfully, or if it was not running.              |
+|                  |NOT_SUPPORTED: if the algorithm string does not have any   |
+|                  |matches.                                                   |
++------------------+-----------------------------------------------------------+
+
+MEMLAT: Memory Latency algorithm
+================================
+
+The MEMLAT algorithm string (0x4D454D4C4154, ASCII "MEMLAT") is hosted on
+the Qualcomm Generic Vendor Protocol and runs on the CPUCP firmware. The
+6-byte value is treated as a 64-bit algorithm string and split into two
+uint32 fields on the wire: algo_low carries its lower 32 bits and algo_high
+its upper 32 bits.
+It samples per-CPU performance counters at a configurable period, computes
+per memory-group statistics (Instructions-Per-Miss, back-end stall, etc.),
+and votes the resulting target frequency to the bus interconnect for DDR,
+LLCC and DDR_QOS. Userspace control of the algorithm is exposed via
+parameter IDs issued through QCOM_SCMI_SET_PARAM and QCOM_SCMI_GET_PARAM.
+
+The hw_type field carried in most payloads identifies the memory group:
+
++----------+--------------------------------------------------------------+
+|hw_type   |Group                                                         |
++----------+--------------------------------------------------------------+
+|0         |DDR                                                           |
++----------+--------------------------------------------------------------+
+|1         |LLCC                                                          |
++----------+--------------------------------------------------------------+
+|2         |DDR_QOS                                                       |
++----------+--------------------------------------------------------------+
+
+All multi-byte fields below are little-endian, in line with the SCMI
+specification. mon_idx selects a monitor within the group (0-based, less
+than the firmware-supported maximum). All SET commands return the SCMI
+status word; on success it carries SUCCESS, on lookup failure
+INVALID_PARAMETERS, and on an unknown param_id NOT_SUPPORTED.
+
+Frequency units differ per command: MEMLAT_SET_MIN_FREQ and
+MEMLAT_SET_MAX_FREQ take kHz for DDR/LLCC, whereas MEMLAT_MON_FREQ_MAP
+expresses the resulting vote (v2) in MHz for DDR/LLCC. For DDR_QOS all of
+these carry a raw level index (0 / 1) rather than a frequency.
+
+MEMLAT_SET_MEM_GROUP
+~~~~~~~~~~~~~~~~~~~~
+
+param_id: 0x10 (16)
+command:  QCOM_SCMI_SET_PARAM
+
+Allocates a new memory group on the firmware side and binds it to the
+underlying interconnect path (DDR / LLCC / DDR_QOS).
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 cpumask    |Bitmask of HW CPU IDs that contribute counters to this     |
+|                  |group (limited to 32 CPUs).                                |
++------------------+-----------------------------------------------------------+
+|uint32 hw_type    |Memory group identifier (0 = DDR, 1 = LLCC, 2 = DDR_QOS).  |
++------------------+-----------------------------------------------------------+
+|uint32 mon_type   |Reserved for SET_MEM_GROUP (set to 0; populated only on    |
+|                  |SET_MONITOR).                                              |
++------------------+-----------------------------------------------------------+
+|uint32 mon_idx    |Reserved for SET_MEM_GROUP (set to 0).                     |
++------------------+-----------------------------------------------------------+
+|char mon_name[20] |Reserved for SET_MEM_GROUP (zero-filled).                  |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: group allocated.                                  |
+|                  |BUSY: no free memory group slot (the firmware-supported    |
+|                  |maximum number of groups is already configured).           |
++------------------+-----------------------------------------------------------+
+
+MEMLAT_SET_MONITOR
+~~~~~~~~~~~~~~~~~~
+
+param_id: 0x11 (17)
+command:  QCOM_SCMI_SET_PARAM
+
+Adds a monitor (a CPU subset that votes within an already-configured
+group).
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 cpumask    |Bitmask of HW CPU IDs assigned to this monitor (must be a  |
+|                  |subset of the group's cpumask; limited to 32 CPUs).        |
++------------------+-----------------------------------------------------------+
+|uint32 hw_type    |Memory group identifier the monitor belongs to.            |
++------------------+-----------------------------------------------------------+
+|uint32 mon_type   |0 = IPM-based latency monitor, 1 = compute (stall-only)    |
+|                  |monitor.                                                   |
++------------------+-----------------------------------------------------------+
+|uint32 mon_idx    |Index of the monitor within the group.                     |
++------------------+-----------------------------------------------------------+
+|char mon_name[20] |Human-readable monitor name (NUL-terminated, used in       |
+|                  |firmware log lines).                                       |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: monitor created.                                  |
+|                  |NOT_FOUND: hw_type does not match any configured group, or |
+|                  |the firmware-supported maximum number of monitors already  |
+|                  |exist for the group.                                       |
++------------------+-----------------------------------------------------------+
+
+MEMLAT_SET_COMMON_EV_MAP
+~~~~~~~~~~~~~~~~~~~~~~~~
+
+param_id: 0x12 (18)
+command:  QCOM_SCMI_SET_PARAM
+
+Configures the common counter IDs (instructions, cycles, stall, etc.)
+that the firmware reads on every sample for every CPU.
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 num_evs    |Number of valid entries in cid[].                          |
++------------------+-----------------------------------------------------------+
+|uint32 hw_type    |Set to 0xFF (sentinel for the common-events case).         |
++------------------+-----------------------------------------------------------+
+|uint8 cid[]       |Array of CPUCP counter IDs indexed by INST/CYC/CONST_CYC/  |
+|                  |FE_STALL/BE_STALL. 0xFF marks an unused slot.              |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS / INVALID_PARAMETERS if num_evs exceeds the        |
+|                  |firmware-supported maximum.                                |
++------------------+-----------------------------------------------------------+
+
+MEMLAT_SET_GRP_EV_MAP
+~~~~~~~~~~~~~~~~~~~~~
+
+param_id: 0x13 (19)
+command:  QCOM_SCMI_SET_PARAM
+
+Configures the per-group event IDs (cache miss / writeback / access)
+used by the IPM and write-back computations for the selected hw_type.
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 num_evs    |Number of valid entries in cid[].                          |
++------------------+-----------------------------------------------------------+
+|uint32 hw_type    |Memory group identifier.                                   |
++------------------+-----------------------------------------------------------+
+|uint8 cid[]       |Array of CPUCP counter IDs indexed by MISS/WB/ACC. 0xFF    |
+|                  |marks an unused slot.                                      |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS / INVALID_PARAMETERS if hw_type is unknown or      |
+|                  |num_evs exceeds the firmware-supported maximum.            |
++------------------+-----------------------------------------------------------+
+
+MEMLAT_IPM_CEIL
+~~~~~~~~~~~~~~~
+
+param_id: 0x17 (23)
+command:  QCOM_SCMI_SET_PARAM
+
+Sets the IPM (Instructions-Per-Miss) ceiling for a monitor. CPUs whose
+IPM falls at or below this ceiling are considered memory-bound and
+contribute their cpufreq into the monitor's voting pool.
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 hw_type    |Memory group identifier.                                   |
++------------------+-----------------------------------------------------------+
+|uint32 mon_idx    |Monitor index within the group.                            |
++------------------+-----------------------------------------------------------+
+|uint32 val        |IPM ceiling (instructions per cache miss).                 |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS / INVALID_PARAMETERS if (hw_type, mon_idx) does    |
+|                  |not match a registered monitor.                            |
++------------------+-----------------------------------------------------------+
+
+MEMLAT_BE_STALL_FLOOR
+~~~~~~~~~~~~~~~~~~~~~
+
+param_id: 0x19 (25)
+command:  QCOM_SCMI_SET_PARAM
+
+Sets the back-end stall floor (in milli-percent: 100000 = 100%) for a
+monitor. CPUs whose back-end stall is at or above this floor are
+eligible to contribute their cpufreq even if their IPM is above the
+ceiling.
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 hw_type    |Memory group identifier.                                   |
++------------------+-----------------------------------------------------------+
+|uint32 mon_idx    |Monitor index within the group.                            |
++------------------+-----------------------------------------------------------+
+|uint32 val        |Back-end stall floor in milli-percent (0..100000).         |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS / INVALID_PARAMETERS if (hw_type, mon_idx) does    |
+|                  |not match a registered monitor.                            |
++------------------+-----------------------------------------------------------+
+
+MEMLAT_SAMPLE_MS
+~~~~~~~~~~~~~~~~
+
+param_id: 0x1F (31)
+command:  QCOM_SCMI_SET_PARAM
+
+Sets the sampling period (in milliseconds) used by the firmware update
+loop.
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 sample_ms   |Sampling period in milliseconds.                           |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS.                                                   |
++------------------+-----------------------------------------------------------+
+
+MEMLAT_MON_FREQ_MAP
+~~~~~~~~~~~~~~~~~~~
+
+param_id: 0x20 (32)
+command:  QCOM_SCMI_SET_PARAM
+
+Programs the cpufreq to memfreq voting table for a single monitor.
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 hw_type    |Memory group identifier.                                   |
++------------------+-----------------------------------------------------------+
+|uint32 mon_idx    |Monitor index within the group.                            |
++------------------+-----------------------------------------------------------+
+|uint32 nr_rows    |Number of valid rows in tbl[] (must not exceed the         |
+|                  |firmware-supported maximum).                               |
++------------------+-----------------------------------------------------------+
+|struct {          |Per-row mapping. v1 is the cpufreq trigger in MHz; v2 is   |
+|  uint16 v1;      |the resulting memfreq vote (MHz for DDR/LLCC, a level      |
+|  uint16 v2;      |index 0/1 for DDR_QOS).                                    |
+|} tbl[]           |                                                           |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS / INVALID_PARAMETERS if (hw_type, mon_idx) is      |
+|                  |unknown / OUT_OF_RANGE if nr_rows exceeds the              |
+|                  |firmware-supported maximum.                                |
++------------------+-----------------------------------------------------------+
+
+MEMLAT_SET_MIN_FREQ
+~~~~~~~~~~~~~~~~~~~
+
+param_id: 0x21 (33)
+command:  QCOM_SCMI_SET_PARAM
+
+Clamps a monitor's vote to a minimum value. Units are kHz for DDR/LLCC and
+raw level index for DDR_QOS.
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 hw_type    |Memory group identifier.                                   |
++------------------+-----------------------------------------------------------+
+|uint32 mon_idx    |Monitor index within the group.                            |
++------------------+-----------------------------------------------------------+
+|uint32 val        |Minimum frequency: kHz for DDR/LLCC, level for DDR_QOS.    |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS / INVALID_PARAMETERS if (hw_type, mon_idx) does    |
+|                  |not match a registered monitor.                            |
++------------------+-----------------------------------------------------------+
+
+MEMLAT_SET_MAX_FREQ
+~~~~~~~~~~~~~~~~~~~
+
+param_id: 0x22 (34)
+command:  QCOM_SCMI_SET_PARAM
+
+Clamps a monitor's vote to a maximum value. Units identical to
+MEMLAT_SET_MIN_FREQ.
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 hw_type    |Memory group identifier.                                   |
++------------------+-----------------------------------------------------------+
+|uint32 mon_idx    |Monitor index within the group.                            |
++------------------+-----------------------------------------------------------+
+|uint32 val        |Maximum frequency: kHz for DDR/LLCC, level for DDR_QOS.    |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS / INVALID_PARAMETERS if (hw_type, mon_idx) does    |
+|                  |not match a registered monitor.                            |
++------------------+-----------------------------------------------------------+
+
+MEMLAT_GET_CUR_FREQ
+~~~~~~~~~~~~~~~~~~~
+
+param_id: 0x23 (35)
+command:  QCOM_SCMI_GET_PARAM
+
+Reads the current target frequency that the firmware is voting for the
+selected (hw_type, mon_idx) tuple. The response payload is returned in
+the same buffer used to send the request, overwriting it on success.
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 hw_type    |Memory group identifier.                                   |
++------------------+-----------------------------------------------------------+
+|uint32 mon_idx    |Monitor index within the group.                            |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS / INVALID_PARAMETERS if (hw_type, mon_idx) does    |
+|                  |not match a registered monitor.                            |
++------------------+-----------------------------------------------------------+
+|uint32 cur_freq   |Current target frequency in kHz for DDR/LLCC; raw level    |
+|                  |(0/1) for DDR_QOS.                                         |
++------------------+-----------------------------------------------------------+
+
+MEMLAT_START_TIMER
+~~~~~~~~~~~~~~~~~~
+
+param_id: 0x24 (36)
+command:  QCOM_SCMI_START_ACTIVITY
+
+Starts the firmware sampling and voting loop at the configured
+sample_ms interval. Has no payload beyond the QCOM_SCMI_START_ACTIVITY
+header.
+
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: timer started (or was already running).           |
+|                  |GENERIC_ERROR: events not yet initialized                  |
+|                  |(MEMLAT_SET_GRP_EV_MAP not called for any group).          |
+|                  |NOT_SUPPORTED: invalid param_id under START_ACTIVITY.      |
++------------------+-----------------------------------------------------------+
+
+MEMLAT_STOP_TIMER
+~~~~~~~~~~~~~~~~~
+
+param_id: 0x25 (37)
+command:  QCOM_SCMI_STOP_ACTIVITY
+
+Suspends the firmware sampling and voting loop. Has no payload beyond
+the QCOM_SCMI_STOP_ACTIVITY header. The configured monitors and freq
+maps are retained, so a subsequent MEMLAT_START_TIMER resumes voting
+without re-programming.
+
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: timer stopped (or was already stopped).           |
+|                  |NOT_SUPPORTED: invalid param_id under STOP_ACTIVITY.       |
++------------------+-----------------------------------------------------------+
+
+MEMLAT_SET_EFFECTIVE_FREQ_METHOD
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+param_id: 0x27 (39)
+command:  QCOM_SCMI_SET_PARAM
+
+Selects the algorithm used to derive the per-CPU effective frequency
+from the cycle counters.
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 method      |0: const-cycles method (CPU cycles / const-cycles, scaled  |
+|                  |by the cluster's max frequency).                           |
+|                  |1: legacy method (CPU cycles / sampling-window time).      |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS / INVALID_PARAMETERS if method is not 0 or 1.      |
++------------------+-----------------------------------------------------------+

-- 
2.34.1


