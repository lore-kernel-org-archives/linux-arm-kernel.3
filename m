Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD691D25B47
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 11:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JFMs7MAk+sF+EwNnEAo34qHviH09U+JEWLB9Q+75nFM=; b=BBOxofZwfV/6Fg
	Z0kAhAMtbRcCRg2KpknhIkoeLEkZthPt1UDwCK7yf6mR6nhBXIgLR+xvZ2Jij8d/MrWEFNN8ghxPA
	vYbJCX/sYSfRLc7nbHhLZSCbMedpbxao2h8YAY7HFNa2IdJu/NZja4t9OKtdwjO+8Wc4kszM4dIgN
	JEad0kdiDfdvnbqAxeklv4qQXYdTcsogbc2LICs27EUHb6KQurGZ5LrCNdqy21BjmmXiue4cG/hP1
	dGWStxalhufG0+sp+DsV57NvfkC6T5J0RaRy5HXfRLpQ3HKopXRE2NbN0gf+EcQzKTnXSAkavuTi2
	NCWOg6pMDQC6X0YSIM9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl3ur-0000000FwZU-20xk;
	Wed, 28 Jan 2026 11:40:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl3uo-0000000FwYi-2ZDL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 11:40:55 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S929Fr320331
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 11:40:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JFMs7MAk+sF+EwNnEAo34q
	HviH09U+JEWLB9Q+75nFM=; b=mRT5J5JQRBdLBX+aUJQa9SqHbr3lCYdUAB8k/P
	W0dPHYXGuuLdO2VZIeDY8D6IIuCLVhoF3K1eGyKYfN44x/QKylodfhy0TPo5dYFn
	jEhom0FkLe/tk4zVDPTvXaUxESBD46nLE7bBhNOaxemafNEUQ4Xn4Rzha3u+ENHI
	udJIKhmTnzkQKM+lT6UJ0xwS5LAN6jhVn2bv/1JKk6jq1iFVUl6hrB45sN3dUykA
	UsXPhpa4/YmVMO0gQ5Q4ZSeDViqNkEkzAmqWIVkUeKlG5fPdZhSRAv2To7LXAslM
	ZzagYKy6uz967Zb2igjIG9P0N1TTP0ZrybuHe9kYnOgbYh5A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by4sjtj5d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 11:40:52 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c54e81eeab9so4327826a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 03:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769600452; x=1770205252; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JFMs7MAk+sF+EwNnEAo34qHviH09U+JEWLB9Q+75nFM=;
        b=EQF1luWiOWbp/PZ9UZeoQuSprf4AT6QVQyWP5o7++fQHv5H20D9mxeB8O2+liIUPkE
         PFVlQz4DoybZND3DsN5in8Qt5AHy54mSA0IG9f0BTNE+z5NybbNn76dLlWVMOD5nL4WT
         FCg7GAmMtpNTpNuFf/RJXIrlY8/sMLN+xag8YbRpoCiweacm1lsxDOu+jZ0BUxu0PIxJ
         fuLeqITQUGcP5w/9qKZm7zkl/NrxiRyhe5sFHxhn4KXsRLiObo/DbCnI0PxdIZWzMCAI
         OqKu+Va1GH6azvjQ2VZP97GKbEMhN5XAgHQm1tEW2UFEiL+hJJeiJtsjsqT7Z/lr4abP
         5tXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769600452; x=1770205252;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JFMs7MAk+sF+EwNnEAo34qHviH09U+JEWLB9Q+75nFM=;
        b=H/FXzR1SV/rHSA76vtY88bWZ8WWwqamN9klzckttQUqMoMKVNMQkerc1SgCJ7JFoLf
         FwLxmKczVfEFkO9Xv63n2wX3NZKehPtgaKmVGOjQ7NIkfAz+Hgco4nyPdXro55DF2gGc
         FN+eqYe1CngyjysrqwBNqfs/E+lcAZTfNAVTGYxoyKKHr6HFrc1SVVC1DYBKoGlAdiAm
         Mwb2d/tvx20Sk6WAawv0YIlLwk6FvGvAa6xfSYQY1Q7yLMgSGyjRvev+ouXGqP6ySG4q
         rESt4WZsdHwLQVh8+X4MLFvoZw5jAylr8N08eqEEp+vEmEi2D74zQxK8ejyKMw4J/S9h
         wqYw==
X-Forwarded-Encrypted: i=1; AJvYcCWXrBisjpgwIZqzJdwTrQlTLIztuiv5szbQvmokltXdETFs4kYVFvWQAaJ5ew4bAObYdF7mJ4rnKYJeQqelDUy/@lists.infradead.org
X-Gm-Message-State: AOJu0YwsUdrBh6OfkzNlK4ci6QbsjUejIsGQf+0fT6DZtGJN8XC4WVJx
	l6rCo1kDvd8S+GXV8+ob6NwlUhf9Gr4VW1fskDorqlOW55hKbtM8KNtxlWkqpq2ah/RIZeHpQBF
	x0iR9TzHOBJHnAOVgXHPd4lvUFxkLme1H++zhUhr4bOBqr5o/u2qItLNiBO88T4TJlGnzYHr/TD
	ZGx/PNuw2Ubg==
X-Gm-Gg: AZuq6aJHQfqJqCeX2BUgRPbETZnIJmvv0tYJpzK4vrgKsZyRH/6o2o5WDH/G4WfBpMd
	RItmgSw+6TItnW991Alw4n80m/3GUJCVBjQ68+zQLCfKyhuSQz66HG9QjEXlBjxZWdqvTvycaxj
	4H4J61d2plgP5syJbEHJ+FRCL/OpfilIeZJxPuIYZDXbV1WKrhNFUxfUD0MSxdcm+/CH/5T5oGu
	UmRiZdDWrxcL5qFU5MwhcEicclp3WI3U9sQs8UJFwz3rFDFnUxQT7fJ+zSFXMaDB0mjXZ6OEBLF
	0njwUmNoNiGq/7lac+sT++l9YBCVGUdaEEkIHfU+7WS59iKokFOp8a+R5VkU1NyRTO3Ii5dIXls
	hWPflqZFIxQfhyGdVTImKM/RY2nlHqdS14rb/FT4HjFJe
X-Received: by 2002:a05:6a20:729b:b0:334:a784:3046 with SMTP id adf61e73a8af0-38ec64052cfmr4524165637.38.1769600451648;
        Wed, 28 Jan 2026 03:40:51 -0800 (PST)
X-Received: by 2002:a05:6a20:729b:b0:334:a784:3046 with SMTP id adf61e73a8af0-38ec64052cfmr4524139637.38.1769600451143;
        Wed, 28 Jan 2026 03:40:51 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c642a9f41d0sm2010678a12.27.2026.01.28.03.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 03:40:50 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH 0/3] PCI: qcom: Add D3cold support
Date: Wed, 28 Jan 2026 17:10:40 +0530
Message-Id: <20260128-d3cold-v1-0-dd8f3f0ce824@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALj1eWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDIyNL3RTj5PycFN2kNEtLSyNDSzODpCQloOKCotS0zAqwQdGxtbUAwAp
 ahVgAAAA=
X-Change-ID: 20251229-d3cold-bf99921960bb
To: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Will Deacon <will@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        jonathanh@nvidia.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769600446; l=2654;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=kCxwBVLfjz8Zof/slL59vAhcEvihO5RxyP+2uMtSV3o=;
 b=1iPC8DVEc59rh8Oyk/lTBCt5bbqG+rgzg5oRfZjhYHR/NihEy8k0OzMXb8Thi5aaQ/SRGlKsP
 bbdS/jV/Ig+C94DjoNcBjWXw+F/lw3XTB0XWbQDQnBd8Or2pB88f/Dp
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA5NSBTYWx0ZWRfX4eoeXv0SgkNP
 Pt/XtlgZd6UNf+4klTWEeUHoy69SSVorl+jtWigz/1wv0/0jHieKlTfH7UaRYjTB5eFb7OzV7lH
 RzEMjm7RDbcfSHD5oOAcChmn/9behyEIc0vFhcivLYB65PEHFzDirGQ8rh/MgFhXo+WXO4z878B
 9LyapGhzP9TjcpEgdB37bN2lWnSfTKBVk7Dqj3Q8F8AO6xZVBhx4N5EAWppv7yCLH6Ex9TKeJtA
 bca9dff0vTtDG+QJ5qaRH99Q9urm/HnSr2cNkMnIR0UZw5snZ4/Q8YYbE8P0hRsHBsjGWTH3vtb
 B9JJInDxg0C+OdMZZyURxNbCg9WuxKOA0ntY2zublH/KLV0Y2LJ/ujg5nQ7/bfeo0WKgYqcksdL
 3uP0vdM22rSnGB10fK2aNqPBUdWiyp2TQPrLD/xXi7iZLC1vy/UPRO/k0imq51kCol6oK+QNvlm
 CfnjNiXD5Df5WzdqR4A==
X-Proofpoint-ORIG-GUID: SC1ngCVM9011wMLiQXnB1UN2dSjGRcdz
X-Authority-Analysis: v=2.4 cv=KezfcAYD c=1 sm=1 tr=0 ts=6979f5c5 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=rF_suA9G3wk1FRvBKDEA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: SC1ngCVM9011wMLiQXnB1UN2dSjGRcdz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_034054_772262_B51985E1 
X-CRM114-Status: GOOD (  19.07  )
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

This series adds a common helper to determine when a PCIe host bridge
can safely enter D3cold, converts the DesignWare host driver to use that
helper, and enables D3cold support for Qualcomm PCIe controllers.

The first patch introduces pci_host_common_can_enter_d3cold() in
pci-host-common. The helper walks all devices on the bridge's bus and
only allows the host bridge to enter D3cold if all PCIe endpoints are
already in PCI_D3hot. For devices that may wake the system, it
additionally requires that the device support PME wakeup from D3cold
(via WAKE#). Devices without wakeup enabled are not restricted by this
check and may be left in D3cold.

The second patch updates the DesignWare host driver to use this common
helper in dw_pcie_suspend_noirq(). Previously, the driver skipped
putting the link into L2 / device D3cold whenever L1 ASPM was enabled,
since some devices (e.g. NVMe) expect low resume latency and may not
tolerate deeper power states. However, such devices typically remain in
D0 and are already covered by the helper's requirement that all
endpoints be in D3hot before the host bridge may enter D3cold. Using the
shared helper removes this coarse heuristic and centralizes the D3cold
eligibility policy.

The third patch enables D3cold support for Qualcomm PCIe controllers. It
adds pme_turn_off() support and switches to the DesignWare common
suspend/resume methods for device D3cold entry and exit. If the
controller is not kept in D3cold, the existing paths are used so that
ICC votes, OPP votes, and other resources remain managed as before. In
addition, qcom_pcie_deinit_2_7_0() is updated to explicitly disable
PCIe clocks and resets in the controller, and the now-unused "suspended"
flag is removed from struct qcom_pcie.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Krishna Chaitanya Chundru (3):
      PCI: host-common: Add shared D3cold eligibility helper for host bridges
      PCI: dwc: Use common D3cold eligibility helper in suspend path
      PCI: qcom: Add D3cold support

 drivers/pci/controller/dwc/pcie-designware-host.c |   7 +-
 drivers/pci/controller/dwc/pcie-designware.h      |   1 +
 drivers/pci/controller/dwc/pcie-qcom.c            | 114 +++++++++++++---------
 drivers/pci/controller/pci-host-common.c          |  29 ++++++
 drivers/pci/controller/pci-host-common.h          |   2 +
 5 files changed, 101 insertions(+), 52 deletions(-)
---
base-commit: 590a64365d9bcc13ee644a3e73ffdc3df26cf23c
change-id: 20251229-d3cold-bf99921960bb

Best regards,
-- 
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>


