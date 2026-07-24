Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2989C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 07:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ro51vT5z7mZG5tqK1ttGlUsx59tQ9Z/vFqR01rpaFQ=; b=FRemnwsiFz8vQE0I1CpinXSYmk
	oErw2GFEacLShR4UsTBCtYZrXJJPw/J+PLq32iwmh3vfvqFx3lYw75w8Ya/kjAR9/rW3BEe/oz9Ve
	pH8g2j+NF8TgAbDAeNlxZ7Ia43D3e/KOfeRsxfi0Iwk3J0DgJNMZfywNkWsu4PUY5+YMy9gJXc3ZK
	8qbO9Y9UXxu7dMW8DiJR4ru9Yix8zWNnFdu+7Uw9ciaqWgzigeFVzyzezUru3ofWQwoy5lFk5Y/Pq
	rohRRJe0tVYDb+KvsdMlBAo90t7PL8F1su8riSenQZNys+ybH7p07oKDUpwJcvB4xt3fT3wVMfl8+
	832vD+iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnABO-0000000FgAF-46wu;
	Fri, 24 Jul 2026 07:18:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnABJ-0000000Fg8e-1tSi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 07:18:55 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lh3V1992557
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 07:18:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1ro51vT5z7mZG5tqK1ttGlUsx59tQ9Z/vFqR01rpaFQ=; b=TGNiMloetntlRhfE
	UhN4tdQIetnqBJ92YXQ63/NTcN8zsC4CoZlDuEwLlUcJnmag7MyHylf54ouUwUsl
	gllGlDA38wqLIKOsYEDj3e5LikG14/L7zqkvUkbo4lM8c07RQEFzsHqOrfprGAjx
	QfrxRKafTr9KiAdpqqB4SQ/JesFJv5KhmZrZs9tUq1TundY+gv86jAqdiryK88nf
	8aa2e5MkiKVABJDkyL/2n+Sb5LcqFSo23xLcQbpxq1SxO10RfETAESEUlTTYaEvr
	FS8siNCGigTEn/NMr7fwegLJEAT3k6pSv6j1nTiGwjGaqcQlqT3aibHpsfP5+jwU
	y/CaEQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm0p50mbr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 07:18:52 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cee1ec30f2so2159485ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 00:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784877531; x=1785482331; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1ro51vT5z7mZG5tqK1ttGlUsx59tQ9Z/vFqR01rpaFQ=;
        b=e3bAAWqqjcGLOOEnK2i39G9ETOQzAXv23dpoBzUjP01gP4feaki378+01fS2cuc3Lu
         GOe+mYoeTg0zWZa3DtPDh9gmb0lQuV1FMEvEeP0Orl24AUBuBcIW1N23CBbAzNvatbFN
         XNUhlVY2KlbWa2OK5+HyH3lCYm1/ewEBPHPEHBrR9A2lZoOgNXi161lZD2B73+DcfaMz
         oU+RAzzRhgPEWvNwv/Bo13ZIY+bQNHPLU/ADEa1rHCz1Oh4vlZ06j3a/zlg1fsK/3J3T
         ScRM4q+Q90yoLADQezvqrN3FO+gZCmpiCSyKjl/hbCksENkohkU9A2++l+seexAkMxHT
         ElAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784877531; x=1785482331;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1ro51vT5z7mZG5tqK1ttGlUsx59tQ9Z/vFqR01rpaFQ=;
        b=marqPjGtLEt11TLz3eW8h5my8rLxaNxaxoOcZylhbm0srWPPYzaBLem0O8ZHjjkQQm
         GOSviUUp2FS+nOX8+qiy6vq7gEYF83AORB3Agm1q0OqfUuySRS/YutoXNjNi5uIFjjxn
         LtXZioHLQ9EyqYEBrNh6TkunNhbQFmw3vHWO5QJIxoe06jWjP0rEW+BQznejKoT4nGTB
         GDa3+y1wQ886Mik2nUGurirWenfxYV2ONIl5XLQ0dUJz4vc9lXZFgnCGXoJDRF25P/nu
         x9sRp4NjjuN9YPPB/fICJLR9V3kMiII38geypwY7OdTyP4WH+AFeVecQMYsqiF8L91IG
         bLcw==
X-Forwarded-Encrypted: i=1; AHgh+RqxIeywgdVbHCnN6IDvsZX+6br3SQ/4L072ZwW2vSGepsT6ukoUO0GaVDVmN7hW4bft80KABt/k0BPtiq5n4Iu7@lists.infradead.org
X-Gm-Message-State: AOJu0Yywym9T2jXg5B2m2NOjQAKBjm0rffGl0TId3RB0ynEwyaqwtmvk
	kCsnjhVrRmaADJPz2vKsGEazkaMgZP3ijjF/zmx8Otf5txzxmlOVQcvo/7/E6Ppqcjz7384hynT
	bPmfPRB9IFjR4r0psQInFE+xK1XKMhMFWmjoxn+vq9Em6Z888Zv44RcFHe8VCbiXn4b0KMLnrSC
	hZVQ==
X-Gm-Gg: AR+sD11r1RGj7QzUG7H4GO6BgnnlCNZ5s0bp2nQmiOfmddE6hSfXilHNH2ZZJHIUAEr
	vb8knOUWMgUc3rWSeUaaW8gt072x3GXsaraTbGfAFnP/e+lIA2jAsYHjGFtU1v9Hkvi7tTUr2tn
	m0pcOw2yFb5hqtDM9v1Ua29fIwGepjQryCJ5WbRp52G4XQFM59O1mcTHdfvlFwOKc4RKXpzWf61
	9kzjznz3ETG5VMFx33Vk8OzOw2wBnOvk++Dml7pxQwuKRwr9H+MckCwedod9V3VEdYJxaeMePXi
	mUeNtWhbmFkeUPQSSwH8D8P/q1f+G+ZOs6xMO0/J2MhtpV/+WDwFcif8deh4WxzmxDqsFQ0Yonc
	K7Z/+GEnwPFpE/w99F+Ah3nn3NBaxisB5hrOrqCplb3wyP4U2wEUCK7/sp0uRuyKyS6kDeLyE8U
	5OjB8AM1cFhXOMupJg5eOvRrRBGvk=
X-Received: by 2002:a17:903:1b2c:b0:2cc:df15:91f5 with SMTP id d9443c01a7336-2cfa6f877d9mr74400735ad.44.1784877530182;
        Fri, 24 Jul 2026 00:18:50 -0700 (PDT)
X-Received: by 2002:a17:903:1b2c:b0:2cc:df15:91f5 with SMTP id d9443c01a7336-2cfa6f877d9mr74400175ad.44.1784877528991;
        Fri, 24 Jul 2026 00:18:48 -0700 (PDT)
Received: from hu-ppapaniy-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efe3afbsm45993805ad.33.2026.07.24.00.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 00:18:48 -0700 (PDT)
From: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 12:48:06 +0530
Subject: [PATCH RFC 01/10] firmware: arm_scmi: Add SCMI QCOM Generic
 Extension Protocol documentation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-rfc_v8_scmi_memlat-v1-1-cb732bcff1f4@oss.qualcomm.com>
References: <20260724-rfc_v8_scmi_memlat-v1-0-cb732bcff1f4@oss.qualcomm.com>
In-Reply-To: <20260724-rfc_v8_scmi_memlat-v1-0-cb732bcff1f4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784877514; l=58108;
 i=pragnesh.papaniya@oss.qualcomm.com; s=20260120; h=from:subject:message-id;
 bh=NVwa6oaza24/Csd5TLISWX6+QzD3TmEvlvRTB2GzPf0=;
 b=1vcG58oBTHxKWyCUb/QHgPOpMkgL3KjhIwtMHGGndu9s6uMtvJ9Qe8KDa6zTXcpqruAcM03Hz
 FPbRJXA/IhZBllzWljEh6MUolyQMYGpAKKsOG3PA9CMLVV5JuUhSs6X
X-Developer-Key: i=pragnesh.papaniya@oss.qualcomm.com; a=ed25519;
 pk=09P9nFmZLXJ9+4Jx10ZK5rIW0Fmk79A/DLErm6aVA0c=
X-Authority-Analysis: v=2.4 cv=Pq6jqQM3 c=1 sm=1 tr=0 ts=6a6311dc cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=xn6pn0MgdEpbbIXp4LUA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: _XR8MtHfJx2U2jGFopfLHkle3exrpVFl
X-Proofpoint-ORIG-GUID: _XR8MtHfJx2U2jGFopfLHkle3exrpVFl
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA2NSBTYWx0ZWRfXynaWjO3eLgzp
 083PmCyCkLSc1GrLlKmdIdBvcJeMTi4nCaf3huDyQxCGnTBeYhRQp7lgvDuybH0bYofmz0ZRB/Z
 m1N7iDynuwk4q/BAx0au53c3YqdecSU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA2NSBTYWx0ZWRfX2G6OrBLgJTsL
 8BAaNqEAYNwuGZR++T9Kv68GBkjtFkV3be1sQbztumnIO6PPmi84sacFIgEQo0roHGYLbHlbeg1
 02qJhNjkqMi0ASbQ/H6f5NcYlwLbpSZ1KJ8gXWThSB9CMJXBdQgcRTvCMoTCrUgnwCWP4Q5iM0y
 MNvy2eVufsKyVj4VSNRahqHhIwLFRWNWRTWiB9VNfChH2j6W6elj8buU6OboWA3j2sSirw1i8nb
 XbScKyToR3nMI/wAxeA8nfRQonslIE81MxKBsDTItlwFp5ttwR4IGvEK4GA8PT0ad+uwOr4qb5v
 2D8FnxsxLuyDPwo44w21zS7dalU41hjtaQ7E7fNa9uL8Xq65jT6MrXGNg7jIJBNMr8Y3Slwlb0k
 tVMCzzkFNWDmDcokKJe79++SSL1w1alPtm6nhK8T6cp1DOmUInll0Yg99xBcRlnRYzH4DnNIOhL
 9RbYpZ/qZxYlnRAnN5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_001853_840890_3AA1BEAE 
X-CRM114-Status: GOOD (  18.55  )
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

Add System Control Management Interface (SCMI) Qualcomm Generic Extension
Protocol documentation. It consists of a small set of generic SET/GET/
START/STOP commands, which is used to turn on/off and configure Qualcomm
SoC specific algorithms that run on the SCP.

It currently only supports MEMLAT (memory latency governor) algorithm.
The immutable pairing of the MEMLAT algorithm string with the supported
param_ids associated with it are documented here.

Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
---
 .../arm_scmi/vendors/qcom/qcom_generic.rst         | 954 +++++++++++++++++++++
 1 file changed, 954 insertions(+)

diff --git a/drivers/firmware/arm_scmi/vendors/qcom/qcom_generic.rst b/drivers/firmware/arm_scmi/vendors/qcom/qcom_generic.rst
new file mode 100644
index 000000000000..42e327d53841
--- /dev/null
+++ b/drivers/firmware/arm_scmi/vendors/qcom/qcom_generic.rst
@@ -0,0 +1,954 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: <isonum.txt>
+
+==================================================================================
+System Control and Management Interface (SCMI) Qualcomm Generic Extension Protocol
+==================================================================================
+
+:Copyright: |copy| Qualcomm Technologies, Inc. and/or its subsidiaries.
+
+:Authors:
+   - Sibi Sankar <sibi.sankar@oss.qualcomm.com>
+   - Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
+
+System Control and Management Interface Qualcomm Generic Extension Vendor Protocol
+==================================================================================
+
+System Control Management Interface (SCMI) Qualcomm Generic Extension Protocol
+consists of a small set of generic SET/GET/START/STOP commands, which is used to
+turn on/off and configure Qualcomm SoC specific algorithms that run on the SCP.
+Each algorithm is identified through an algorithm string and has an immutable list
+of param_ids. All supported algorithms (currently just MEMLAT) have their own
+dedicated section and are listed after the generic commands.
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
+________________________________
+
+The MEMLAT algorithm (0x4d454d4c4154, ASCII "MEMLAT") scales the DDR, LLCC and
+DDR_QOS buses in response to memory-latency-bound workloads. It runs on the CPUCP:
+every sampling window it reads the per-CPU AMU counters, derives its statistics
+(instructions-per-miss, back-end stall, write-back ratio), maps that to a target
+level and votes for it directly on the DDR/LLCC/DDR_QOS interconnect. The kernel
+never issues a frequency request in that loop. The 6-byte value is treated as a
+64-bit algorithm string and split into two uint32 fields on the wire: algo_low
+carries its lower 32 bits and algo_high its upper 32 bits.
+
+With a distinct need to have the memory buses scaling done in SCP in response to
+memory-latency-bound workloads, none of the existing SCMI solutions could be used
+as-is. MPAM does not apply either: it is not enabled on all of the affected parts
+(e.g. Hamoa). The role split between SCP and client driver is described next.
+
+MEMLAT client driver pseudo-code:
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+.. code-block:: text
+
+  probe():
+    SET_COMMON_EV_MAP                          # AMU events (all groups)
+    for each memory group (DDR / LLCC / DDR_QOS):
+      SET_MEM_GROUP                            # bind group to interconnect
+      SET_GRP_EV_MAP                           # per-group AMU events
+      for each monitor in the group:
+        SET_MONITOR                            # topology, cpumask, name
+        IPM_CEIL / BE_STALL_FLOOR              # per-monitor tuneables
+        MON_FREQ_MAP                           # cpufreq -> memfreq map
+        SET_MIN_FREQ / SET_MAX_FREQ            # clamps
+    SAMPLE_MS                                  # sampling period
+    SET_EFFECTIVE_FREQ_METHOD                  # cpu-freq derivation method
+    START_TIMER                                # CPUCP now scales autonomously
+
+  devfreq poll (twice per CPUCP sample period):
+    GET_CUR_FREQ                               # read voted freq, per monitor
+
+  remove():
+    STOP_TIMER
+
+SCP pseudo-code:
+~~~~~~~~~~~~~~~~
+
+.. code-block:: text
+
+  every sample_ms:
+    for each CPU:
+      sample AMU counters (instructions, cycles, cache-misses, stalls)
+      derive per-CPU IPM, back-end-stall % and write-back ratio
+
+    for each configured memory group (DDR / LLCC / DDR_QOS):
+      for each monitor in the group:
+        best_freq = 0
+        for each CPU in the monitor's cpumask:
+          if CPU is memory-bound (IPM/stall/write-back vs. the
+             monitor's configured thresholds):
+            freq = CPU's cpufreq, optionally scaled toward the ceiling
+            best_freq = max(best_freq, freq)
+        monitor.target_freq = monitor's cpufreq->memfreq map(best_freq)
+
+      group_vote = max(target_freq of every monitor in the group)
+      if group_vote changed since the last sample:
+        vote group_vote onto the group's interconnect path
+
+  GET_CUR_FREQ returns a monitor's last target_freq
+  START_TIMER / STOP_TIMER: resume / suspend the loop above
+
+MEMLAT: Supported memory buses
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
+|2         |DDR_QOS_COMPUTE                                               |
++----------+--------------------------------------------------------------+
+|3         |DDR_QOS_MOBILE                                                |
++----------+--------------------------------------------------------------+
+
+All multi-byte fields below are little-endian. mon_idx selects a monitor
+within the group (0-based, less than the firmware-supported maximum). All
+SET commands return the SCMI status word; on success it carries SUCCESS, on
+lookup failure INVALID_PARAMETERS, and on an unknown param_id NOT_SUPPORTED.
+
+Frequency units are not uniform across commands (kHz, MHz or a raw 0/1
+DDR_QOS level, depending on the param_id); each command documents its own
+units below.
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
+|uint32 hw_type    |Memory group identifier (0 = DDR, 1 = LLCC,                |
+|                  |2 = DDR_QOS_COMPUTE, 3 = DDR_QOS_MOBILE).                  |
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
+|uint32 mon_type   |0 = IPM-based latency monitor, 1 = compute (passive        |
+|                  |governor tracking cpufreq map irrespective of IPM) monitor |
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
+MEMLAT_ADAPTIVE_LOW_FREQ
+~~~~~~~~~~~~~~~~~~~~~~~~
+
+param_id: 0x14 (20)
+command:  QCOM_SCMI_SET_PARAM
+
+Sets the adaptive low-frequency floor for a group. When the algorithm's
+voted frequency falls below this floor the firmware clamps it up to the
+adaptive floor instead.
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 hw_type    |Memory group identifier.                                   |
++------------------+-----------------------------------------------------------+
+|uint32 mon_idx    |Ignored (group-scoped parameter).                          |
++------------------+-----------------------------------------------------------+
+|uint32 val        |Adaptive low frequency in kHz (converted to MHz by the     |
+|                  |firmware).                                                 |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS / INVALID_PARAMETERS if hw_type does not match a   |
+|                  |configured group.                                          |
++------------------+-----------------------------------------------------------+
+
+MEMLAT_ADAPTIVE_HIGH_FREQ
+~~~~~~~~~~~~~~~~~~~~~~~~~
+
+param_id: 0x15 (21)
+command:  QCOM_SCMI_SET_PARAM
+
+Sets the adaptive high-frequency floor for a group. Units and behaviour
+mirror MEMLAT_ADAPTIVE_LOW_FREQ.
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 hw_type    |Memory group identifier.                                   |
++------------------+-----------------------------------------------------------+
+|uint32 mon_idx    |Ignored (group-scoped parameter).                          |
++------------------+-----------------------------------------------------------+
+|uint32 val        |Adaptive high frequency in kHz (converted to MHz by the    |
+|                  |firmware).                                                 |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS / INVALID_PARAMETERS if hw_type does not match a   |
+|                  |configured group.                                          |
++------------------+-----------------------------------------------------------+
+
+MEMLAT_GET_ADAPTIVE_CUR_FREQ
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+param_id: 0x16 (22)
+command:  QCOM_SCMI_GET_PARAM
+
+Reads the group's current adaptive frequency.
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 hw_type    |Memory group identifier.                                   |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS / INVALID_PARAMETERS if hw_type does not match a   |
+|                  |configured group.                                          |
++------------------+-----------------------------------------------------------+
+|uint32 cur_freq   |Current adaptive frequency in kHz.                         |
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
+MEMLAT_FE_STALL_FLOOR
+~~~~~~~~~~~~~~~~~~~~~
+
+param_id: 0x18 (24)
+command:  QCOM_SCMI_SET_PARAM
+
+Sets the front-end stall floor (in percent) for a monitor. Analogous to
+MEMLAT_BE_STALL_FLOOR but for front-end stalls.
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
+|uint32 val        |Front-end stall floor in percent (0..100).                 |
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
+Sets the back-end stall floor (in percent) for a monitor. CPUs whose
+back-end stall percentage is at or above this floor are eligible to have
+their cpufreq scaled up by the freq-scale knobs below.
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
+|uint32 val        |Back-end stall floor in percent (0..100).                  |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS / INVALID_PARAMETERS if (hw_type, mon_idx) does    |
+|                  |not match a registered monitor.                            |
++------------------+-----------------------------------------------------------+
+
+MEMLAT_WB_PCT
+~~~~~~~~~~~~~
+
+param_id: 0x1A (26)
+command:  QCOM_SCMI_SET_PARAM
+
+Sets the write-back ratio threshold (in percent) for a monitor. A CPU's
+write-back ratio must be at or above this value for the monitor to treat
+it as memory-bound.
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
+|uint32 val        |Write-back ratio threshold in percent.                     |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS / INVALID_PARAMETERS if (hw_type, mon_idx) does    |
+|                  |not match a registered monitor.                            |
++------------------+-----------------------------------------------------------+
+
+MEMLAT_IPM_FILTER
+~~~~~~~~~~~~~~~~~
+
+param_id: 0x1B (27)
+command:  QCOM_SCMI_SET_PARAM
+
+Sets the IPM filter for a monitor. A CPU's IPM must be at or below this
+value (in addition to the write-back check) for the monitor to select it.
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
+|uint32 val        |IPM filter (instructions per cache miss).                  |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS / INVALID_PARAMETERS if (hw_type, mon_idx) does    |
+|                  |not match a registered monitor.                            |
++------------------+-----------------------------------------------------------+
+
+MEMLAT_FREQ_SCALE_PCT
+~~~~~~~~~~~~~~~~~~~~~
+
+param_id: 0x1C (28)
+command:  QCOM_SCMI_SET_PARAM
+
+Sets the frequency-scale percentage for a monitor. When non-zero, a
+memory-bound CPU's effective frequency is boosted proportionally to how
+far its IPM is below the ceiling, bounded by the scale floor/ceiling
+below.
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
+|uint32 val        |Frequency-scale factor in percent.                         |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS / INVALID_PARAMETERS if (hw_type, mon_idx) does    |
+|                  |not match a registered monitor.                            |
++------------------+-----------------------------------------------------------+
+
+MEMLAT_FREQ_SCALE_CEIL_MHZ
+~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+param_id: 0x1D (29)
+command:  QCOM_SCMI_SET_PARAM
+
+Sets the upper cpufreq bound (in MHz) for the freq-scale boost above.
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
+|uint32 val        |Frequency-scale ceiling in MHz.                            |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS / INVALID_PARAMETERS if (hw_type, mon_idx) does    |
+|                  |not match a registered monitor.                            |
++------------------+-----------------------------------------------------------+
+
+MEMLAT_FREQ_SCALE_FLOOR_MHZ
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+param_id: 0x1E (30)
+command:  QCOM_SCMI_SET_PARAM
+
+Sets the lower cpufreq bound (in MHz) for the freq-scale boost above.
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
+|uint32 val        |Frequency-scale floor in MHz.                              |
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
+|struct {          |Per-row mapping. cpu_freq_mhz is the cpufreq trigger in    |
+|u16 cpu_freq_mhz; |MHz; mem_freq_mhz is the resulting memfreq vote (MHz for   |
+|u16 mem_freq_mhz; |DDR/LLCC, a level index 0/1 for DDR_QOS).                  |
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
+MEMLAT_GET_TIMESTAMP
+~~~~~~~~~~~~~~~~~~~~
+
+param_id: 0x26 (38)
+command:  QCOM_SCMI_GET_PARAM
+
+Reads the firmware timestamp (nanoseconds).
+
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS.                                                   |
++------------------+-----------------------------------------------------------+
+|uint64 tstamp     |Firmware timestamp in nanoseconds.                         |
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


