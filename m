Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B86F1FF8867
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 06:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UTUH6bkslQjtgduW9VKGT60BifNc2etF7zX5YAiYbfg=; b=j6M9Z521QHYAoX
	NGvnxj25gOL/yFZhjvzvX2Pcw2KgkZP+yl4sWC0Mw72D2iOMqySMUrd7k7/HoKscqGa7tYqDf1p3W
	XzTSiKehVpl1BATpUgcv8qMmXYnB511ybTiVsbRF6d5vRgZsVL78O55Yq8XycToACp5UnFtTkxPCN
	UCTh8jLWIfwP/88N3aSLtbTjIJg1bsyOT9r3FcdlcYQHecM2J54A9rEUXiM+1Uo+3id/Zp3IwuOmi
	rbnh8q3x2epD+u9G/mDuTGr0hE2Xs+cF43d6FWePqlANlHDo/biAalVyhnSouy1FiVnQfT6o2vKi4
	YSFj3BCEcK9QHmEcu5cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHyd6-000000032Me-3DLX;
	Wed, 29 Apr 2026 06:42:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHyd3-000000032LS-1Nfa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 06:42:38 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T5q9nR3347488
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 06:42:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=UTUH6bkslQjtgduW9VKGT6
	0BifNc2etF7zX5YAiYbfg=; b=oLCgepusP1XZEwmXqnyK5u6/0z3E9x5hL6HT/J
	1hXaPa2NSpPTSo+XShuxRugIC/ZFIn1DtB2zV8mx4n8P9xTryypBTz7zabAdE7s9
	H+WTeaFDs+O+usOT74B97j1GkNg9TwWSeUQUBhXXqIV/d2F5V0wBuM3lDq5tO70J
	Fz71POYHxw+SBNsYUAdXENIDkatDx6pbpv0131SqAM7YcDhOO1sWl/JFhRXAvWb+
	yJ8RpZFzqud9cB0dER4x/wfF06hsmKZS1xxll96PucMMebrq8BAFBjC71FlZm4zw
	lz3NZFSjwT6Mo1AzWe0VWjzaEIXLs009NWlemImYWl3f+Sew==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du2m4t070-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 06:42:35 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35fb6cd0879so10827481a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 23:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777444954; x=1778049754; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UTUH6bkslQjtgduW9VKGT60BifNc2etF7zX5YAiYbfg=;
        b=HcLigMArSZZrvnUX8RCcxzYNEffjyYhBiygkTalkiB/cHAX1IbzNPsc3EPVdB/diLU
         kbGzlzjaCD5OCNfCgR3OtCaLdBCZnmkckbimIPG74kJboCOHj0gGbJFq/f1KTXi0Bff+
         T7IXHg58218hjWEcMO+0fo024Xl0ewf0x4YM5GBPO6EmJtCjT2idUPk5BNeDIfHQChQ4
         7VO+1u7bVH5uvKDpwdngSnIckZNl4SIDQaiKVyNTLsLLyDP1fzQQZaY86J/kv54j7Ttm
         /110CMDR05D/AzegHcL+y95RabRDxq/Yn5BSnmWIpLaJPU7hTD6gFEjV3smnTg5wmA4I
         lmKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777444954; x=1778049754;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UTUH6bkslQjtgduW9VKGT60BifNc2etF7zX5YAiYbfg=;
        b=XarCRfZny2pP1cYydBVnb6y0M08oGtYqL7jY9kr8NHBkFKZrX5ll3Xr+FR6SPnyUSZ
         5AH5Qua23jllXk6GU/BC0OAP95lri9KJvbinxy9ykWxXW/0tOQadE5NQV0gVHeRClZ1e
         pamc6BxJTwhzjSN9MQ3pq1ooQnRQPJpv3xPJ2Li9TXKJdV9w/is1nbeaPXwkOzOiSpVn
         mpr2k9lQoNveFChs30kiJe8s3o/V+r4RmrZMZGOBLihfIPHfz0NdIVPAD6pGgfJIY8jm
         9n37/KKE+KajBFiz0Z7tWokSvXlL7pfwYo3xBT7yddWwGPkYEhvUpWzmrX49XJTPi7BD
         c56g==
X-Forwarded-Encrypted: i=1; AFNElJ9yOVDh/eEI9OP/oJvo2Mot3x4humlRRhincaXnNw3FG44IkHgipnAhQ5Z7nZiwHSNBGOegIe1YtJipUXtfYAWw@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4PNcijwb470Z8n28CBkjyOcX9SdSvDv0+/f5HVEP7p+XB8OdZ
	bDSsbazws+HOJL7WTqNZaThE7SRXv3CTQ0Li/BYdPIMH6YnQr4XSBA2pvav3EJ8k+XFjKH5qdOJ
	HVlpJ+gzVjwN5C/bJCyCbpzrk2/8pKZrHgtyvgUBF5YxTtSqPqBm3H0O+xNh5YngRDi0PrlHHne
	mA/w==
X-Gm-Gg: AeBDiesOTOk/nmq4x3Q0w/oR1UxgWe1momPsRLHEnvJRodFogDLQU9I5b199Pjpi/qv
	JF4PEtjaX94mjbSr83LfdIiTvuO2qCahyl7P6VGKMLgYGX2PnmOoFP0K40tO/zyiaf29R5PzlqY
	QZ7P4+txixz1F/exw5f4Xzu9ZexejcS7we1JzkwYdovdRovFcp1uSJXzhIa6rLJkl3TJh+3Vlqx
	W8zoTt4kRRur3O29+naeKbEnVtQXouyrIc6bVQgacZ6zGi2Uqj117SLNmiC+m0Mv76WI9JOpBT2
	RQdsfKYON22NjlwtW9UKYh8xWYYWhAMPARb09nOIVETqOYXqriz7KE0HRZxTejdwtV8PBE13hiL
	gfyQLxjUSmQZzUCGMR6fmXnTMqXZ5FOT0dVx3RO5PlVKsNtnbks7sypMZiQZZZmo7SHw=
X-Received: by 2002:a17:90b:1d8a:b0:362:e826:cefe with SMTP id 98e67ed59e1d1-3649206415dmr6932173a91.23.1777444954334;
        Tue, 28 Apr 2026 23:42:34 -0700 (PDT)
X-Received: by 2002:a17:90b:1d8a:b0:362:e826:cefe with SMTP id 98e67ed59e1d1-3649206415dmr6932128a91.23.1777444953773;
        Tue, 28 Apr 2026 23:42:33 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a0303d59sm2021414a91.15.2026.04.28.23.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 23:42:33 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v5 0/5] PCI: qcom: Add D3cold support
Date: Wed, 29 Apr 2026 12:12:22 +0530
Message-Id: <20260429-d3cold-v5-0-89e9735b9df6@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAE6o8WkC/3XNSw7CIBSF4a00jMVwL4+CI/dhHMhLSVS0aKMx3
 bvUxHaiE5JD+H5epIQuhUJWzYt0oU8l5XMdctEQd9id94EmXzdBhhIQDfXc5aOnNhpjEIxi1pL
 6+NKFmB6f0GZb9yGVW+6en24P4+2YUAxQfxM9UEa915FH5oJGsc6lLK/33dHl02lZDzKWepw1Q
 jtprFobyxG1EkzwP5rPmgNMmlctvJbetQ6VkX+0mLVg89+iamuhhdhKK9QvPQzDG0GufaddAQA
 A
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777444949; l=5111;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=rEjaiQ56SR1KUsMRM2T7xYZF8Samoy1STOTX2pwIjxs=;
 b=nFE7WNlOA2D0NObbgbm8Z28DulxFlIX8tKKG1NRoYoKSnvSrvGNO2dS6LRFn3a7VGpIm07p9L
 GKXMh5FoWDHDRWNtJMdq1UH/tRj5rH/WuJHh+F9FP/hR43OUVpHkfza
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA2NCBTYWx0ZWRfX+T8MnOrPPMzA
 Re8fj6QQCGIUuJVJWfAqg0TyFhzTkhnZu/aj/rNzQti0gFDCU2uJxBPYTseXIGfiPxX095rnblr
 gk/ycrv5wC+2izIXgQRRGtXEOiz7TBdq1roGxHW/9OtNgMdsu4cv426G6hEM9Wf+jWlkxlYhwPS
 2Dg6fbKXiJIIpzBZ+RIFFfTyCG8/fg/EIA74GJTrOclHe1w3olePAprbLHRYlXqClUTTzjI+34i
 mXZlWj6UrlnWZImZI17zVZd6iBjssmwBHXPp9S9fA9Yl7nl7o8bEMlrIJAIedrn5xc9WjFD1XaB
 5oT1iKmzgvHqKLdLAoJZKeKmIfFQ40Kb2Pt/p1iSGCi8s9NcCDhgEsx9WjN5GGqh2hvhAJojNTd
 DST9yANCBxAQ6F90RdkiqebSInWSNZG07Tth5RlGUQgVJB7bO7Pu+dnuQG0G8azkPThgAf1j11/
 Dqgery7T3tebKt/A7GQ==
X-Proofpoint-GUID: LuGwILkaiVIZJpVQUPxGRa7p4Zj_8CeM
X-Authority-Analysis: v=2.4 cv=MuFiLWae c=1 sm=1 tr=0 ts=69f1a85b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1XWaLZrsAAAA:8 a=pGLkceISAAAA:8
 a=JfrnYn6hAAAA:8 a=Z0v7mYVB04eUNMBhXUoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: LuGwILkaiVIZJpVQUPxGRa7p4Zj_8CeM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_234237_495146_0FEF5EB9 
X-CRM114-Status: GOOD (  22.20  )
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
Changes in v5:
- Add additional checks for legacy, integrated endpoints also as pointed
  by sashiko.
- for older platforms we need to read LTSSM state from ELBI regitsers,
  updated the code to read elbi regitser by sashiko.
- Couple of nits by sashiko. 
- Link to v4: https://lore.kernel.org/r/20260407-d3cold-v4-0-bb171f75b465@oss.qualcomm.com

Changes in v4:
- Added new argument to the API to know if there is any device with
  wakeup enabled and pme can be generated in D3cold. we need this info
  to decide to turn off power to device or not.
- Couple of nits in commit text (Mani).
- Link to v3: https://lore.kernel.org/r/20260311-d3cold-v3-0-4d85dc7c2695@oss.qualcomm.com

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

To: Will Deacon <will@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Krzysztof Wilczyński <kwilczynski@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>
To: Jingoo Han <jingoohan1@gmail.com>
Cc: linux-pci@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org

---
Krishna Chaitanya Chundru (5):
      PCI: host-common: Add helper to determine host bridge D3cold eligibility
      PCI: qcom: Add .get_ltssm() helper
      PCI: qcom: Power down PHY via PARF_PHY_CTRL before disabling rails/clocks
      PCI: dwc: Use common D3cold eligibility helper in suspend path
      PCI: qcom: Add D3cold support

 drivers/pci/controller/dwc/pcie-designware-host.c |  15 +-
 drivers/pci/controller/dwc/pcie-designware.h      |   1 +
 drivers/pci/controller/dwc/pcie-qcom.c            | 224 ++++++++++++++++------
 drivers/pci/controller/pci-host-common.c          |  71 +++++++
 drivers/pci/controller/pci-host-common.h          |   2 +
 5 files changed, 242 insertions(+), 71 deletions(-)
---
base-commit: 3b3bea6d4b9c162f9e555905d96b8c1da67ecd5b
change-id: 20251229-d3cold-bf99921960bb

Best regards,
--  
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>


