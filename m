Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73039104BED3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 10:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AtSnr/pzwqYQ0YYWzGf34O7TLaFW7or12l2zSbgjEgQ=; b=GOL9J2J4l0T82v
	F4i0DP6gII7+B1Iyg3kxAZHE3n2lzmnDNECjN6urcEsSWG0JqXkwNhZl+PrD/G/+hRLQyzbhuo+Ra
	0U7SOuZ1SKiCq8zcV7Id+yTSIBKZ9DdPYvJ6FrmckHrBY38qoLQ3l0ndU0LGzmXQ1uJllNKxHX7hz
	zma8kWo0hYDrxoLmpAkldUWNVQ4Z2Cb50UAgH4pzYuqKHhgJAs6QLc5EKyvC6ppdsQF6AsLoxPEdH
	V/i8rOkf8rd5HjrkMdTOVpV66yVZiutS0a+TzTC+mbqxoDB3ta2fMLvM+fCyh8De4tVHmxl94emee
	aZxZp5z7YA1+vhm81ORg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GmJ-0000000BQFl-0yJS;
	Wed, 11 Mar 2026 10:26:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GmH-0000000BQF5-00sF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 10:26:58 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BA5ZXS294236
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 10:26:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=AtSnr/pzwqYQ0YYWzGf34O
	7TLaFW7or12l2zSbgjEgQ=; b=OLwncwu/HAPwFhT3jI8C08s2NPbDwyWZgIDD+L
	DnoF14RK27L+sFtE74vZKXb8v/lIESP29fRP0bRtBGYyGLMKpXGeo531hUBN/HPK
	uZcup5BQv8OpZLc6U97+rx9iHE35MHhQ4Zh5XG6AAdQhIhr7HfjpidGC0IBMlGsw
	+cu3nA7pkw8hi1bO+GCpRVnfh9ca8KaxyZaIudmQNsNjFFecLdExMSVPiKHyKUa6
	FUeUbnU9iR0LsLy8EiVkRyeGqf5jq2R3f/45HfVcfQsVtJoqPpiZCGRBWnMOpjmy
	SCwGqr4faJZe9fW3vxxx6VIia3gQ4qj/Ha2stLFKX645FKnA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu6bb82kx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 10:26:56 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae4e20a414so605967605ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 03:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773224816; x=1773829616; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AtSnr/pzwqYQ0YYWzGf34O7TLaFW7or12l2zSbgjEgQ=;
        b=em7c/2YgzhCBl5kaEtcS/pk74n9jCBN0pKZ4+Bex0cnLj5xCtOk+je+xkd6xbuYstw
         FQBUv7jZBk3g6Ta9294cWqJ5x2SPAc08HWkYNRu3qbJj/rd5UpwdVwryZfY2g6h9xJ/K
         PnmSpFBgMrtlvcESfL05LeqPY2TDrZHhjeZN7a87IGI/i4BC5gcPRebpH3dKddpIkiLi
         VK4tnFZynu8HHfb2q4XAjJJSU5XOfuPW/4hvOkTJLDO/OyUOlpoEnpKQuFbO0e+BNSQ2
         c6XaAmnisIa/oHFUfrQyUZZkIkNBIbXvKiN0UaqQdVPUTz5fbqFh5E6aNd6+PzA/9qsf
         D72A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773224816; x=1773829616;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AtSnr/pzwqYQ0YYWzGf34O7TLaFW7or12l2zSbgjEgQ=;
        b=Y2yJVd5QurDUfNK9cbZFZkLsmIA995By6KQxTfI2zO8cqzYKkXAigXdiEQIkXxUH/l
         Zdzn+HE7IcSs/ixKn+MfZ79lUWr2mv5IxmW/M71fr66pBKjYF1yUO1837hDuioDg7vys
         hSEH1pXw9xmv92tZVtr2LhUq+Ixp3k2bRV+Y+RPZ4Q7aCz0C+wE0L8HIX+MJijfoO7Mk
         aneMNDb4tyzjxBUr2bKJIY0MnXKSXF00VDHXeEyzczin1PtxvEn4fw6d0yYjCKjtyplm
         I96r88u3nGnCYrqZqadm2fAih4d1D4HzZHAGqhN4K4lT+uTr7chXk2ZZYDfNIYqyVrV+
         PkUg==
X-Forwarded-Encrypted: i=1; AJvYcCUoakGVJ4Hy+Bx2IiX8cQjlWejhgiqKS4jnoj0gunbRlyA6nvdxfDsCcUeFd5HPk3VoSE+TgxM7DdrWJPzvOW3Y@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3aZvIGPb0WmIsv2sY2D1yxdd+hMOrZ+ZZ2eHSVnmLDxRKTz6u
	uoDpX5rYsQDex2kpv67ZP8cYAJKRW6oHPLM2peMEoARhZC1NAYdLGHh6IhdtGCLAlG2e/UeBMTD
	FQRSlHtzC8FaA93IQmp0TWB23bZrkiYvtSgtQZt3tXEWAoAcP9M3RselhLH5AWS6KI10Rcr2pEL
	jNSA==
X-Gm-Gg: ATEYQzySUPpue6l5dVALW/nlDDgiCX+ZQhwG8ZDE8HgaqWuKzJcdKTaVOZjLlFmuskq
	MOJ2ff65QE6W6r6I1M+RoeLbhvNjufpj3pN8P3jPNszVn3tDtgoIECEQqjCCRJvevLIHpT60b02
	GsTl5IkHDh3FENoPOokOCuaQwDlYM0N+tehgDbAoJuNuCBzdVWLaFpJ6VWMITVuIiSpnRqhholU
	H8R6wU5851lzflc5Pgh0CcLWRKtyNGte/lY/WXYKOw+9xXjsO0zcxdt3CpjxnWtCuaiGwrMMWWh
	JQv71oty7cYToBuygdBHN0s9DON7Atdc3ac/jKE2rkkeEJHLJUFSBVliiGxbIwNFywSWKLWIvk4
	RQWlj7ZecKRLbuxxO/CoQ0gz+eQh8Oe9B4XHH1U1BRK99OrS0aT2YtZbr
X-Received: by 2002:a17:903:b48:b0:2ae:5b64:12e6 with SMTP id d9443c01a7336-2aeae888648mr22133095ad.38.1773224815830;
        Wed, 11 Mar 2026 03:26:55 -0700 (PDT)
X-Received: by 2002:a17:903:b48:b0:2ae:5b64:12e6 with SMTP id d9443c01a7336-2aeae888648mr22132685ad.38.1773224815269;
        Wed, 11 Mar 2026 03:26:55 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae222872sm19575245ad.18.2026.03.11.03.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 03:26:54 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v3 0/5] PCI: qcom: Add D3cold support
Date: Wed, 11 Mar 2026 15:56:45 +0530
Message-Id: <20260311-d3cold-v3-0-4d85dc7c2695@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAGVDsWkC/22MzQrCMBAGX6Xs2ZRkU2viyfcQD82fDbRGEw1K6
 bubFtSLl4VZvpkJko3eJthXE0SbffLhUoBvKtB9dzlb4k1hQIpbhiiJ4ToMhignpUQmW6oUlPE
 1Wuefa+h4Ktz7dA/xtXYzW75LoqUMxSeRGaHEGOG4o9oKbA4hpfr26AYdxrEuB5ZSxp+NbPe1s
 dhCKo4o2oY2/I89z/MbQhO+3+EAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773224811; l=3914;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=0roWHWaq+9JIwfuEVTAKqaeo0DsMFH0UtaWQXi8DhmY=;
 b=BiHYt3kkPvBXICm/9in+VC/Njx2c911zUi7hE5MRbt74rQVdRgwjYJ/mDOC26hMb/bIpr/DtC
 xVWBvMzRsb5Aic3UIwVcUbtGRRibwRJsCZEKJkngMLWt+8S8j50hAZG
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: itMr-GUvYcfkLOzpvww_AcyXwjN0ufWF
X-Proofpoint-GUID: itMr-GUvYcfkLOzpvww_AcyXwjN0ufWF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA4NyBTYWx0ZWRfX00kp5IxGr7Du
 3jU8RpY3AIYcT8iqVu825a4HHCxzUPC+RrSoziXuy6I1iMhuWp50vbjiMeO0dHJ0RfzLuh3QjT8
 B0kpDdI5QSaTtkFfjLLG/G1+c2292Mh/dyDv77QW/KQwQIRrBT+w5mLGcS8nl0Y15UQNCO1OPrp
 HHkXrrsKj4yd9IiH4oxfmJfHyb+4VoImFPNq4Wvpjave0NuZlnBWa+6v19c8Qb3bpdyoVBUmkpB
 +VRiEVK0zjtDNX5n3SaIMksQbL/9iXtuUbkyq1CQ7Fafq2vwr99w/aTLMiG3FDPaKk/FeJnLi21
 2Aa4p4RL9YQ4BNY0WzBDjP6TGXFXLQ9Ia8GbPaJeo4ufUvOjKP7QPoRxMa3hrXj2b4iQgQW2QAS
 lsjRoIKVSSjb3D7WvB9iQV7tfnl7RqyxKT29SLNPEiYPkbb3go74vLeFaVH+cKcpG5X0f8MntiH
 bOmEa1GzwiLiAWELxPA==
X-Authority-Analysis: v=2.4 cv=CKwnnBrD c=1 sm=1 tr=0 ts=69b14370 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=e1WyCQ9WWvu24y8kmCgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_032657_047333_6596EC1D 
X-CRM114-Status: GOOD (  18.23  )
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
Changes in v3:
- Changed the function name from pci_host_common_can_enter_d3cold() to
  pci_host_common_d3cold_possible() (Mani).
- Couple of nits for commit text, newlines etc(Mani).
- Removed -ETIMEDOUT check and added -ENODEV & -EIO(Mani).
- Link to v2: https://lore.kernel.org/r/20260217-d3cold-v2-0-89b322864043@oss.qualcomm.com

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
 drivers/pci/controller/dwc/pcie-qcom.c            | 165 +++++++++++++++-------
 drivers/pci/controller/pci-host-common.c          |  47 ++++++
 drivers/pci/controller/pci-host-common.h          |   2 +
 4 files changed, 167 insertions(+), 56 deletions(-)
---
base-commit: b29fb8829bff243512bb8c8908fd39406f9fd4c3
change-id: 20251229-d3cold-bf99921960bb

Best regards,
-- 
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>


