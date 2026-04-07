Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAA72FEEF2E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 13:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EWfiOTUoMlsU2KnUtPmDzhDH5pQC5b/7NcEX/ql4yZI=; b=r5z8IOHUnn8LDb
	tehCvvF0SoJWJc7w1ijewMMhjONJzAOuuvS2PTd9VxwSQy/lsJavbpEq0O83sxwkXm7qVMeJOQpKt
	uEytZyGWb/LU3bafOqIcuq1qmNnKD7bHFqNPMrqVBrxW+hjVOxIQ/sDw8RUDLOpgHDeFLk/ObpSzg
	nbrPPgfsrnh3CB+2H42YnCHsKyRVgA7sip2vrAiW9rpt9bD154bSyx+r991hjEHKPhQ9VDtVpW9Xx
	JV9+NGQfISSrJUp1Ti29k/SGnDgztEIQXTFdepureisVkhCjvqE99qJ8vP0ruT95OeRi74/laWr5v
	Nx368BBYnb0KNGlafqow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA65U-00000006TMr-1Bok;
	Tue, 07 Apr 2026 13:03:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA65S-00000006TMX-2Qrf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 13:03:23 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637Cc8f21405987
	for <linux-arm-kernel@lists.infradead.org>; Tue, 7 Apr 2026 13:03:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=EWfiOTUoMlsU2KnUtPmDzh
	DH5pQC5b/7NcEX/ql4yZI=; b=H22OXZ5ddH0SJQY6Os/LiT+625TJYyTYzyuCUF
	TZYWDMdjkRSss8plmfoBBM6Ng0i4A5guCSGs+sa4gSNwDhOFAu+3JiMniPXH3UTh
	bsBbSFTvJ3CR5jFXLQoSwtbnauWHZC/PQufPKl20d5fyCs4taQXytVpy1hsoJQsq
	RrmI7M340+JMnJwSk7L1gpveK7m9JWIiLA3xqwFNN1MU60G91y/iNuFfQcS6QVCq
	CPQM3puRQiVGnTzq2uRTkcSQei1fTW7H577bcuLYgOAbq+btq9S6fmFwz2uT4fMy
	DptwRqFxYGK39BkfcD26NhnNMAwvM4uCnfvgQdyTy4BlP+qg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmratsmy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 13:03:21 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b0c96f5d9aso60388195ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 06:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775567001; x=1776171801; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EWfiOTUoMlsU2KnUtPmDzhDH5pQC5b/7NcEX/ql4yZI=;
        b=KM1Yyc77womD9mbWCY96Qr44UE+MC8SSsBAI6/OX2beTJy2gzi8OEcRsIxkRpiZmjj
         eEJ60nfaV4idxEnaYOAxl+rUjXZPLI/U2PUOpbealG2q/m9xZWwfBiW3bWKfHBQejhsO
         khFG3WVllq8Rp8VRKyiMXzoQDti8P9vmkC8yKleoHsBa7c83zNGu9lqYzSDXUFfBJJ5p
         ekrbNd03iNZEmgZFc/yMIUEMqJCd499rWfRVR2JNy8vyUqVx/lE8/Fp+lZ4vBqWsmdaG
         n/+x2urmeVkUXA1sI67MBNzq97wahBkHVnoGvUVdsDf5GzE4cuSIaBXUPNQ17vNL8PWF
         5JdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775567001; x=1776171801;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EWfiOTUoMlsU2KnUtPmDzhDH5pQC5b/7NcEX/ql4yZI=;
        b=i+ELTyqBvz8RIW3P084L51TfHPc4RrqDL52xw9H0gNW8ZxUNVbGdOm5T2b2feVoHdK
         NSpKGkiN4LuAlpp0YfoNEZoUWaiHjB+62e+WtwxmP0M1jkIWHLPZUhoUhfU6GSUHv3Dz
         qxy3bphvoJJO9hjhuX0ZLnrIdEJ6FE3bHjH+ciTRsNm6cZVt/Sgm3F9PLw5kGDJYuTy5
         ndyU/XyYZ9ztCpQGmgd6wiksHC2BakJxLMc412yum/Yor6mLtebjXgDCt4/TZB5ptPj/
         MG9v00N04+VsBu4TujAZaw2SHP/7OAOS/44wW2cOInXW7oRDUoOMPGjdgzPPb8YbXsw6
         vGWA==
X-Forwarded-Encrypted: i=1; AJvYcCWIWv5F/Hlae072wDmqUpHM2U3sk1cx3YgYmr2iY2D7oKz3KAp1HGf27OHfLzp94z+cq6yCAydZzFz/151c8CYp@lists.infradead.org
X-Gm-Message-State: AOJu0YziQGTIF9hC9N3rcBH6JIJ8kgihWv98kdrAu0KjXeZVyg+5S1vh
	uRApnE7pO5mMU/ARi29KkJvMcgzd+6VCCiqupYST9/0VnZKCzGz3mZ4hyiuywvq0499XM8uvj32
	1BGKo8ziu8vitBTD8fTlygVMNhag/hQO9mz/tbJv7vk60pyqfExDiqlSfJ5LzFO5BmqwnFMHk/u
	N/WQ==
X-Gm-Gg: AeBDieuegbcXmMG8h7UaVTdvXJAJ4vi1QK8uQSNI7SfQ0a+jmkc8Qc6ZdX1gGrqPFV3
	4PQPJzxqUqX+MHLi73Fc4uRE/+WE8LK6i3O5mSTeGqaOCrCFJtlvy+n4IQtjyqlPbl6xT57Zzx7
	P4BlcuH5uSCzC1HDrZaZLNzIIf3lOyg0EQynDZbDBDE7lN3xVhFik1bXpArIdTdCktbszzK8O6G
	FCBqwUq5z3hghoxY8ZgDbfgBDK3x4Unk7gFVnuQ8xx598cNYdTmz6WFL81lLeJN8qUk++WPbpZy
	88snzu2XJTfX1PJbjLzlLoz4er3So7J8bjlig0KFffIvWhIG8Ys9fx+ZRFKruaAxeLrlJzMmsux
	XuLClqQ6Do4l4dah0AOwP/zzP2RKy4Ak+QxDYOu7LaWnNZosVO/Vtb6GU
X-Received: by 2002:a17:903:1b2e:b0:2b2:4a9a:b149 with SMTP id d9443c01a7336-2b28164b6a8mr163831815ad.9.1775567001096;
        Tue, 07 Apr 2026 06:03:21 -0700 (PDT)
X-Received: by 2002:a17:903:1b2e:b0:2b2:4a9a:b149 with SMTP id d9443c01a7336-2b28164b6a8mr163830075ad.9.1775566999609;
        Tue, 07 Apr 2026 06:03:19 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749794e8sm181564885ad.53.2026.04.07.06.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 06:03:19 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v4 0/5] PCI: qcom: Add D3cold support
Date: Tue, 07 Apr 2026 18:33:07 +0530
Message-Id: <20260407-d3cold-v4-0-bb171f75b465@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAIsA1WkC/3XM3w6CIBiH4VtxHIeDD1ToqPtoHci/ZFMpKVdz3
 nvolp7UCduPfc87oWgHbyM6ZhMa7OijD30a/JAh3dT91WJv0kZAoKAAEhumQ2uwclJKoLIkSqF
 0fBus8681dL6k3fj4CMN77Y50+V0SJaEgvomRYoKNEY45oq0Afgox5vdn3erQdXl60FIaYddAq
 01D0kIqBiBKTjj7o9muGaWbZklzIwqjKw2lLH7oeZ4/GYnYOx8BAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775566994; l=4316;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=bbZHPBwF0Y3DBIKbxtiScwcSKdeSgmMbid936OxbnBU=;
 b=qB71aTfgISqqMCT6mCJwX0p5orSaap73x00G+PAaNBw94RsyjSLRYSvbPHid5mkc7BTNk2a1a
 GsosDzP4BIOArgbVzPjURXPk3AYKV286hmCaS8667ujUbbc2zZlgn5c
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: lwsLNwK31ePCqXlG9ym3d5dRAKEwwkeh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEyMSBTYWx0ZWRfX/+xo+B+6KXlJ
 8QkYxqQPmzjlZ5UjERGTBTwyXB7eJJSl7FQNL104IS0cDKBZgWF5R+psPzx4tJ3FDUPsC328AS0
 W2dnJLpSVxovswCLZNPpb9piSE8ZfumOGJIO5iBLiRSNysJUImGUzLsvDcuMltyzMzC5YyONBbv
 Vg+qC1Ad8pAfXJT1QOssc9pt7BPAakEztzLWMWuwqjbcYUA/I26RQZaDJ6a99umB3fV9ETJhhPn
 UTvKVZc35qMAxacW/bLY6skDHcStKIO2P/UL6q37y7mxKO2UPrKc5fgSXw8VMBs1dBouxwfg5Rq
 yilN92dWWJboHFLHMJRG1FBQqnu0wD0LNisUeCFB2gM7q20doDRnJ8qGLgFNSFsPLLOi1jeCYJu
 eAkq2dzixMhNNutqIGkBaADR2HQWvgkdoW7ONI3uGJDY84NtqKvQlYpoz9iC3KsGQ/ZqAtYJBkR
 mMlrvxFaEq+0TEfnPnQ==
X-Proofpoint-GUID: lwsLNwK31ePCqXlG9ym3d5dRAKEwwkeh
X-Authority-Analysis: v=2.4 cv=D/d37PRj c=1 sm=1 tr=0 ts=69d50099 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Z0v7mYVB04eUNMBhXUoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_060322_628210_E0FBB029 
X-CRM114-Status: GOOD (  20.60  )
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

---
Krishna Chaitanya Chundru (5):
      PCI: host-common: Add helper to determine host bridge D3cold eligibility
      PCI: qcom: Add .get_ltssm() helper
      PCI: qcom: Power down PHY via PARF_PHY_CTRL before disabling rails/clocks
      PCI: dwc: Use common D3cold eligibility helper in suspend path
      PCI: qcom: Add D3cold support

 drivers/pci/controller/dwc/pcie-designware-host.c |  11 +-
 drivers/pci/controller/dwc/pcie-designware.h      |   1 +
 drivers/pci/controller/dwc/pcie-qcom.c            | 194 +++++++++++++++-------
 drivers/pci/controller/pci-host-common.c          |  63 +++++++
 drivers/pci/controller/pci-host-common.h          |   2 +
 5 files changed, 204 insertions(+), 67 deletions(-)
---
base-commit: 3aae9383f42f687221c011d7ee87529398e826b3
change-id: 20251229-d3cold-bf99921960bb

Best regards,
-- 
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>


