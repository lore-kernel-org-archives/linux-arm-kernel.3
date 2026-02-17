Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF1F3E68165
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 11:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bqnU+1TM5gIEHCVNQzhu+53HuEr/QxKQz4ZoYABsYvo=; b=joW4LM8A0+URne
	pPqnaIE6LQ6Zy1w9DT0duArRMMfYNFAlSQ6288KNhpv93rLqCmdFN/sAvSnx6uGIOHEEmZA4cA9fF
	JKKxHAN8XF6puwrmQ3WUJT642WSvbRdJ+v9ZrOjsTCYWh5JTiLB26OTI4aao+9Lm5zlLb+T92cVuk
	s3xkmOo6YXW6/ajCG+qkSNhsNZtIVIH93xS/BDFLiuM7DEJjyWh5+gNLn1Yi0C/IRFbrDN6j3lODi
	lnLy5V4q6bkf9V9K/+2c8mdqYpUPJzRVeLPsQ+dryrtia9zCV4AWb3vYTQWBAv5bMjsHSUe79RIqL
	ZzhXE9HV4U6BG8iUQMpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsJ6u-000000086E7-0NDG;
	Tue, 17 Feb 2026 11:19:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsJ6r-000000086Dd-0FYG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 11:19:18 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H81kfC3392904
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 11:19:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bqnU+1TM5gIEHCVNQzhu+5
	3HuEr/QxKQz4ZoYABsYvo=; b=IBtByGiFfKARYol4oLKZadtge89ZfGjf06BhOF
	DpzGV8YBamjsJdEXaL73tp7cHGbYnmV6mhgnmbbrrU5GFF9dpeKCkBwNfB4aghmq
	Vhbt24U0XbEwGAC1OjFGsfbatxOCx3H+Lo53/mjFlEbIby6dlSsIKjIUSBuV4+AG
	O3oyJyBVWYMEutqd39LO88hntrhiOahhAqwU99qDW0E/bENr1WoV6+ow4nd6oV/Z
	VtHLqJmN1oRaGPn76gaNDFnsuao9NrX2ChDfnrvXJBED9XZnHB+VS1CFEo6Ei46X
	IwocB9mkrlow9n92E+lPG8GrirwyoCWwxxi5CHYCTuHLus9Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc5kha9an-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 11:19:14 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-824f75919f4so4018720b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 03:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771327154; x=1771931954; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bqnU+1TM5gIEHCVNQzhu+53HuEr/QxKQz4ZoYABsYvo=;
        b=e+ARzvsqkMoun0MytuHMyKwfV6evGdvhVt+tBV+NylJgaeRqvOZaJhSltIp8Bos23s
         FXe0sPYrZEvs2uUft+m3EAYnp63mLRfcpWYubCS93GcTfGoS2hjrgNmwYJt0u+cEa/i/
         bT9Kuet9aba40DTOuvrPGX2BXMJAPfMsZG1SLrs4umcEyUgB5WEhhH9IAj+5BRdr5l2B
         +dA+javJ4hjgDlmyo9qF7F85wfj+71R3VbMQ9bLL49NzEkmPaPjqvDjY8+1fTL4VzNwK
         6wZ9+9GJ2GCvfFDFG7rdiXyDGSDsNhzzy1/sutw82dtvZZMAf9yTPMQO81SmHdUH3Vxj
         KPOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771327154; x=1771931954;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bqnU+1TM5gIEHCVNQzhu+53HuEr/QxKQz4ZoYABsYvo=;
        b=RPKKsFdyniyHbKjIfVOAvYwb+/II6MzWVok3PWQOlKgH//vsq1JG6oWyxaqksfNRnA
         66gVQHLRBOLx/wOU/8KvBh9LdprE8xZLnILghkHqkT2bJEvfs5+aI6IhfWFRpN7ohcTz
         LPQFvhW3I4r4vToPIhKUoH5jXaLr6828CNco8nEAF6cbgzpRncLEm9ZHtW0ZjjCYJ5NF
         KBEfqfRUqtmcgMrXHKPYfuviGB419sqvaNddDz89xmHJsuBt8syDDQtS+/a4WXvQi7qO
         XKwwlOpacTHcprEa+QgRO2jRBzsQUfjNwPa3uCXDBjt7+Fotc1B+vZCdjKdKcjV3ygEA
         KBZg==
X-Forwarded-Encrypted: i=1; AJvYcCW6lLwvGDtRid8nwlZ25jT0QcoqMolRVVo8H2fZV+W+KU673tOdgQ42SIXiRuikF5E5r+3tN3NJgeEfgDKXHwds@lists.infradead.org
X-Gm-Message-State: AOJu0YwKVSAig2CMCQcvB3fvQ4wxcMrPN+Bt8eVLQfSxH2lEfsQ179aY
	Ez6SKa65MRlzVH5o7Gkvho5Fd2GDo/weD9R0pq08Mof9LTkB97hoyHEwyKbtSL2T92jm+Dyy0Pz
	2Vl6rQEQEeB+ybJkOFpAbcJ+nUV+ZBhBhfuqNrasfg6GMSJAWUcMgRXJcV2uMXxC6fpIiklRjXE
	m2yA==
X-Gm-Gg: AZuq6aLXvXy4p4snG3Qw63ZcZRcR3BtIYAs9XW46+sTM+li87hCP6ERcUNDYlMm8aAx
	f+6XjKMzvgLNfqZskHsTWbNxPsXP8n1EQo6M38/hBIWhU2CvT28OC8++FodgtztWA9k67cEVc7E
	rzgBqtJJotTvTr1cCSHsMz1tdu2M50pmHBIEbZlp/cm68E+JsTMeAKAknmf4+/4tDoScP5Gjaox
	PfuV95RpP9AgLMJoiRVbzrCG3Q7LwTw2b3c+RsPaEu5hBT9N3YJKTSK2aH6/huIYwAvPF0HEOnU
	mPQue5WLq3WNHF8WhT0+Xhn98leHpBYmuA4xhDa4eE3FDvBJeHedrAK6+7+IjbqnA/ptXNg69jB
	XWPTKlBkakAMol74fC0bw9hNrG9VHEFk4+ugSAwA1BzxNfTX3+cQJdQ5T
X-Received: by 2002:a05:6a00:2d28:b0:824:374a:13f7 with SMTP id d2e1a72fcca58-824c613370cmr13273020b3a.55.1771327153597;
        Tue, 17 Feb 2026 03:19:13 -0800 (PST)
X-Received: by 2002:a05:6a00:2d28:b0:824:374a:13f7 with SMTP id d2e1a72fcca58-824c613370cmr13272994b3a.55.1771327153092;
        Tue, 17 Feb 2026 03:19:13 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6b9a661sm13181914b3a.50.2026.02.17.03.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 03:19:12 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v2 0/5] PCI: qcom: Add D3cold support
Date: Tue, 17 Feb 2026 16:49:05 +0530
Message-Id: <20260217-d3cold-v2-0-89b322864043@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKlOlGkC/zXMTQqDMBCG4avIrBtJxlaSrnqP4kLzUwfU2KQNL
 ZK7NwrdDLzDx7NBtIFshGu1QbCJIvmlBJ4q0GO/PCwjUxqQ40UgKmYa7SfDBqeUQqFaPgxQxmu
 wjj4HdO9KjxRfPnwPN4n9uxMtFyj/RBKMM2OkaxzXVuL55mOsn+9+0n6e63Kgyzn/AAJ8NLijA
 AAA
X-Change-ID: 20251229-d3cold-bf99921960bb
To: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Will Deacon <will@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        jonathanh@nvidia.com, bjorn.andersson@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771327148; l=3572;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=vfy+YzqqKerb02XrtXzWTVN+T8EmD/WiyxKqOvqNYg4=;
 b=Bn9M23h3apUJmIuD/7Q/hILoVU69OPDlI4bmae1vUzWbKDwi1LNRx25XUFJlmFU5bAOo7qBuB
 nrYGrQQ0rmvCcpeuE0uod0BCwRYMWp15bw5jPFucUC+qdJ5YG0olQR9
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=Coyys34D c=1 sm=1 tr=0 ts=69944eb2 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=e1WyCQ9WWvu24y8kmCgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: NcxRbXxMrpyg0VwZTPalphIw7PhD6MGF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA5NCBTYWx0ZWRfX5nEgNrhLHKtK
 KyDcQSrhJQc5e/kZKg67isaLrXmL7/YisOUqVR+tuHfpagiYUWQs8yc5b0zoM6Fbis4etd2AREU
 7Hi2hKVNKaKQkg758YZW+97UyFKItiuSmvAGRiqYcSphNjzJ5XIq8a2k1fZgv22zAKJJS5Lyfld
 Lx7Nb8VEvjPdWUp6plm4RMS1G34J+7hOnwCDpZ+RKFKsmzmCDmHEcFCcq5O4QJNQWINq6gbspxQ
 ynD+JV7/EiQQFEEyY4BFV4JiE6zJaka8gAc3HrQ3NVBPeLjWriV17uFmPUJbWa5JBrKMjQEXedP
 bX4oxZwKKMQqWBpZvBE7hncbIrJ0DaMr0XqpNHjuct5DVApVt+wVfJPzEtL4NdJnIYLBMU2V3c9
 aUKmnsB/VUJCZPGAJ1JM4QlqRA2kdwhEy4xd8D+mv67T05qXUfd0aIxtkHjrsV6uPrTmunoUT22
 IYXjWTCXIq9feQnY1PA==
X-Proofpoint-ORIG-GUID: NcxRbXxMrpyg0VwZTPalphIw7PhD6MGF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_031917_127859_1FFA30E8 
X-CRM114-Status: GOOD (  17.66  )
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

This series adds support for putting Qualcomm PCIe host bridges into D3cold
when downstream conditions allow it, and introduces a small common helper
to determine D3cold eligibility based on endpoint state.

On Qualcomm platforms, PCIe host controllers are currently kept powered
even when there are no active endpoints (i.e. all endpoints are already in
PCI_D3hot). This prevents the SoC from entering deeper low‑power states
such as CXPC.

While PCIe D3cold support exists in the PCI core, host controller drivers
lack a common mechanism to determine whether it is safe to power off the
host bridge without breaking active devices or wakeup functionality.
As a result, controllers either avoid entering D3cold or depend on rough,
driver‑specific workarounds.

This series addresses that gap.

1. Introduces pci_host_common_can_enter_d3cold(), a helper that determines
   whether a host bridge may enter D3cold based on downstream PCIe endpoint
   state. The helper permits D3cold only when all *active* endpoints are
   already in PCI_D3hot, and any wakeup‑enabled endpoint supports PME
   from D3cold.

2. Updates the Designware PCIe host driver to use this helper in the
   suspend_noirq() path, replacing the existing heuristic that blocked
   D3cold whenever L1 ASPM was enabled.

3. Enables D3cold support for Qualcomm PCIe controllers by wiring them into
   the DesignWare common suspend/resume flow and explicitly powering down
   controller resources when all endpoints are in D3hot.

The immediate outcome of this series is that Qualcomm PCIe host bridges can
enter D3cold when all endpoints are in D3hot.

This is a necessary but not sufficient step toward unblocking CXPC. With
this series applied, CXPC can be achieved on systems with no attached NVMe
devices. Support for NVMe‑attached systems requires additional changes
in NVMe driver, which are being worked on separately.

Tested on:
  - Qualcomm Lemans EVK, Monaco & sc7280 platforms.

Validation steps:
  - Boot without NVMe attach:
      * PCIe host enters D3cold during suspend
      * SoC is able to reach CXPC provided other drivers also remove
	their votes as part of suspend.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Changes in v2:
- Updated the cover letter (Bjorn Andersson)
- Add get_ltssm helper function to read LTSSM state from parf.
- Allow D3cold if there is no driver enabled for a endpoint.
- Added a seperate patch to make phy down in deinit part to avoid power
  leakage.
- Revert icc bw voting if resume fails(Bjorn Andersson).
- Link to v1: https://lore.kernel.org/r/20260128-d3cold-v1-0-dd8f3f0ce824@oss.qualcomm.com

---
Krishna Chaitanya Chundru (5):
      PCI: host-common: Add helper to determine host bridge D3cold eligibility
      PCI: dwc: Use common D3cold eligibility helper in suspend path
      PCI: qcom: Add .get_ltssm() helper
      PCI: qcom: Power down PHY via PARF_PHY_CTRL before disabling rails/clocks
      PCI: qcom: Add D3cold support

 drivers/pci/controller/dwc/pcie-designware-host.c |   9 +-
 drivers/pci/controller/dwc/pcie-qcom.c            | 162 +++++++++++++++-------
 drivers/pci/controller/pci-host-common.c          |  45 ++++++
 drivers/pci/controller/pci-host-common.h          |   2 +
 4 files changed, 162 insertions(+), 56 deletions(-)
---
base-commit: 9702969978695d9a699a1f34771580cdbb153b33
change-id: 20251229-d3cold-bf99921960bb

Best regards,
-- 
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>


