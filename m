Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68934C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 16:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XkGXfX6x37QUZsM6pLd70yJpzoAVIy49ICSIs9qnngE=; b=rBtQxRCEceuvGo
	KpEa8sCavfuM8PYY49diyXASE0NJUG16QNcWH04vuQnNmQoVU7p54lhixFj4kXC7IeSrr01fHAVim
	OCPUWirfBmf0TVwMKH6Gffux/l0r7Yw45adz4U394gN4tKRQW4xRpaklAkDdaLfGGm3FRMPFJVLQ1
	wm6wPoxRjkRr1UKADGJ3b6rHVc8Xj/YVxacft28Y/xSAcJdg6LIv++ahdxIIva8UZ/smvk5lVPFME
	p7Qo8/A6eGOhaqNIItt2aWTyJkB6SN4+xScNy+uNDDv3kGHMN7n6bpYohKJ1nDm7yppRK3zGIZxN1
	surcSg48nzkANNJN3ldA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgmcm-0000000D7rs-2yeT;
	Mon, 06 Jul 2026 16:56:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgmck-0000000D7qt-1X6m
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 16:56:51 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFClE762338
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 16:56:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XkGXfX6x37QUZsM6pLd70y
	JpzoAVIy49ICSIs9qnngE=; b=ZKErIk749gR+S6axVFdqFva+LjBiOK52IOsouG
	mYaDGQjZRfPMHEVQM15EHooOgt3dL6n2WZW//bASMB9g3s23HUPyS7yIzMR75dRG
	ab2tKtEJYDD2EBjU6YrqOhGnN+pKH3hIZpEyxF4YodPO7Yl19RK2+ZVsMA8xiBRv
	D6lwJbA1dHr8r1FcAydskeS3LT6GtvyUiBFIIdx3yKH/lmtmOg8897vqbrvBgPUs
	PQDCtQHqxSkngaInscpyDwJBZS7swlvE7mLoxnPkkercpMXN1fxqOo924aGoteWz
	EKuRcjYewMAT7rzgI9Vtkz9QVzbjbG5u88TbWCTnD43zsu8g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87rxtm65-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 16:56:48 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c9667280edeso3888516a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 09:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783357008; x=1783961808; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XkGXfX6x37QUZsM6pLd70yJpzoAVIy49ICSIs9qnngE=;
        b=SRyTJXsMOC9D+QQBea7eBC8l1AeCbt45/6yojHsK29wYXFrNSY30OUT5JBdUEvJEiO
         oCs0+YSPlH80ilx4L2muc32vcTC8ESnUQFe/ygxfcA+m/SAkHddg17IF4DkfichGvzEe
         887EIsm2QD89TRbMwl69xtVuwaarL5w7KtW9OCzXwNk/rTLt3PTcQlSy9i6lDA0/GklS
         mRS7N1E+na5cM7/9mOlyB/NokBrk58yIuhYwZ8d6gtSs/T83qq0oN/7qMHii4ECoSGf+
         kugXAqJAI4vZXpIYpekp41lcKJ7te0NVLDf1Qo0WCuLKnxOcpNB/8YIWO5kNzmBqwC2X
         +h+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783357008; x=1783961808;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XkGXfX6x37QUZsM6pLd70yJpzoAVIy49ICSIs9qnngE=;
        b=R9qc5pznFJ1t9oj7SJotkwPvyE4Na0CbwcbrzdHeXOMKvacyeqpL35z1EiZHQptvck
         ezsRuPFrcidV/39pemn/rm+XYIFXyFGDqknMOV7L/2+E0kON7RJ6nzHDW0IFUu+kqmJv
         vCeDpNjY1Bk4Zy0sfTLJPCDg+WM9aOnKPDBc0V8p924WqGlNkSzAwCDT2QVljJ301XL8
         Rg+cejLTPTzbJH7EPUCpWami8an1oWC9BvjnsuTDkj3fC/mXVSgTegqtlZVYx264/j7A
         S1RhGGcOnn+fRv8PI462eIxfITW1nqckcNXutwczpz02l9kRKcxddQnJthupsXH9TcWa
         C0Ww==
X-Gm-Message-State: AOJu0Yw55F4qHJzs8WbbUan68b7bIiACF5EotSUwCXukj+vm8CTbSAfQ
	jNF8bYe9u+CDBsuUHVPYgEVXTNFttTzykEvfo7JLAcu17XX2ZfNwGkph8e4DyDHhxPWWNa39URa
	eGauHg/UhoVLKWGds/6CsBO0F98dGXrPkqX9JwUknktIzUrfctV2007LNuCF8ZPcEsB7XrpcMi6
	e/og==
X-Gm-Gg: AfdE7cnkKiv/vcjbOi2Z0ze9zUAJM3srAiUUKwigHaRcHdBO6WBmvXsqKXnqj84ClRo
	1cRDMyP6tJ3TubkBxgIS8IpHnDyL6zMTyXlsuhgKs1eC2d3iiR8FJBrqxZom775Ugd4ReJL73JC
	pLbrtoID/DP0wLybUYM2B9wkeJu512kEwrIE4ZS9BNni4fJ6KLj0VE5PlMMYoaHr7b5kBKVzFJq
	roHS4VONGVDKOrGKeaUKWkwxsbgblihLokrUUK5O0IxM5E2NPlMIxP4YZwMktx5+z3/Bks0+igx
	XLvnSzU3XuuzU3fNRc9OozPoMpmlON+2cLssAR90NwsrYfxSFMMlKSIhH5BoPMNAcTJUiPVt2cH
	qIc0sRESUMYwjnj75p9/LVAK8K3kMiYVo+GvqW5EzZw==
X-Received: by 2002:a05:6a21:7704:b0:3bf:7f0b:2f70 with SMTP id adf61e73a8af0-3c08eec7ba3mr1828003637.34.1783357008032;
        Mon, 06 Jul 2026 09:56:48 -0700 (PDT)
X-Received: by 2002:a05:6a21:7704:b0:3bf:7f0b:2f70 with SMTP id adf61e73a8af0-3c08eec7ba3mr1827965637.34.1783357007495;
        Mon, 06 Jul 2026 09:56:47 -0700 (PDT)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8eb0efc8sm6960604a12.5.2026.07.06.09.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 09:56:47 -0700 (PDT)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Subject: [PATCH v3 0/6] iommu/arm-smmu: Add interconnect bandwidth voting
 support
Date: Mon, 06 Jul 2026 22:26:33 +0530
Message-Id: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAEHeS2oC/32NQQrCMBREryJZmxITklpX3kNKCcnXfjCJ5qdFK
 b27sbh2M/AG5s3CCDICsdNuYRlmJEyxgtrvmBttvAFHX5lJIY3QB8MphGnAWCC7FCO4MljvsdQ
 Z9502rVYaOt+yKnhkuOJrk1/6yiNSSfm9fc3y2/608q92llxwaY0/OquEN+qciJrnZO8uhdDUY
 P26rh8JQKYrywAAAA==
X-Change-ID: 20260516-smmu_interconnect_addition-d9567535e9d7
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783357002; l=4134;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=pNZbynUekfOmHusDUjDc/vF186uS4D6Gv3Un79o2yrE=;
 b=zVp3IoV1k1Bdu5+mmVSi/MvhRK4jbvL2R7AbmXGDNW3lBmkJKhNXSYfKXr2YxUIPSNUeOXVL5
 85tOcqpdhETBWbyyTnM2s0bd36rcuYFlF3UntoiBA0kE8UN9ui/b5hn
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-ORIG-GUID: WJA6Yt9I_adDg6QLohkt7G8EbPJ0g_xJ
X-Authority-Analysis: v=2.4 cv=Hv1G3UTS c=1 sm=1 tr=0 ts=6a4bde50 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cnCtU0XpSSdWNXPVHlEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE3MCBTYWx0ZWRfX7rPxAJzLXi3X
 uDQs8Mm6+VYHCJH7npENLlHlZYKjYBDD4kwxDi4lViCg6L3Gwgd6N22LVkFA8O0Ozx8SyqvjVJo
 nLX8WOvS41tifN1QQmGwWk57H1HErsQ=
X-Proofpoint-GUID: WJA6Yt9I_adDg6QLohkt7G8EbPJ0g_xJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE3MCBTYWx0ZWRfX43/R5iEb0DpA
 Sh1JFf4pu6TbHxVuxTsrGLRHkjg3Y5G1hAtlHjf3tNktYMkQpxWGSy8Hby0Kr34GXRjhO8o6X1A
 M/LtQkliw35Y6BHKpPuTZ878GIQ8UdrlxnuED2Vr9hYbYcUrg7AOOiEu3EHXiQgryh/EpHLcJus
 1KoX82mlmO78AD/LOhDjjtLpLILHdvmOvVW+eMppQNUmBAACAn4O1oom0leRaSHC/J60u8f4vZI
 t/fj8Qz2SiqIFMmjx9zvCvObguqCP17X4YttUSS8FGRgNKKAAvIkWy1vJH0fgrff7Zw2yPvtgqf
 PYAarhEwGB64xbUfU2Y/oyI29AhVsXId6I/xPPOpKhOn6EZsQBfuorG2PN59sRfHefNAnBfR1Fs
 PhR1yrL9nyrZhlhN7HHKwq+VScQr3oQg9dLSovg2WBfBQsx5sbejK6yQUlbWTc1dFDmYTLCsmEC
 l2/xz/8ByU5LmpoOhsw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060170
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_095650_419091_7A062938 
X-CRM114-Status: GOOD (  18.61  )
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

On some Qualcomm SoCs the SMMU register space is gated behind an
interconnect fabric that requires an active bandwidth vote before
registers can be accessed. In the common case this vote is held
implicitly by other clients (e.g. the GMU device holds a GEM_NOC
vote whenever the GPU is active), so the SMMU works without any
explicit vote from the driver.

However, during certain power transitions — specifically sleep/wakeup
sequences — the interconnect vote can be dropped before the SMMU is
powered down. If the SMMU is then accessed (e.g. during runtime
resume) while the vote is absent, register reads fail intermittently.
The precise ordering makes this difficult to reproduce consistently.

This series adds support for an optional interconnect path in the
arm-smmu driver. When an 'interconnects' property is present in the
SMMU device node, the driver acquires the path and votes for bandwidth
before any register access, releasing the vote on runtime suspend and
on error paths. Platforms that do not describe an interconnect path
are unaffected.

Changes in v3:
- iommu/arm-smmu: Moved ICC voting from generic arm-smmu.c to
  Qualcomm-specific arm-smmu-qcom.c via new runtime_resume and
  runtime_suspend hooks in struct arm_smmu_impl, as suggested by
  Konrad Dybcio.
- iommu/arm-smmu: Moved icc_path from arm_smmu_device to
  qcom_smmu to keep Qualcomm-specific fields out of the generic
  driver.
- iommu/arm-smmu: Restructured arm_smmu_icc_get() error path to
  exit early on success as suggested by Dmitry Baryshkov.
- iommu/arm-smmu: Dropped if (smmu->icc_path) guards from
  icc_enable/disable since icc_set_bw() handles NULL path safely.
- iommu/arm-smmu: Changed WARN_ON() to WARN_ON_ONCE() and
  propagate error code to callers.
- iommu/arm-smmu: Changed ARM_SMMU_ICC_PEAK_BW_HIGH from 1000
  to 1 kBps as a minimal keep-alive vote.
- Link to v2: https://lore.kernel.org/r/20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com

Changes in v2:
- dt-bindings: Cleaned up 'interconnects' property description —
  removed "Optional" prefix and driver implementation details as
  flagged by Krzysztof Kozlowski.
- dt-bindings: Added allOf conditional using 'items' to restrict the
  'interconnects' property to Adreno SMMU nodes only (qcom,adreno-smmu
  with qcom,qcs615-smmu-500, qcom,qcs8300-smmu-500,
  qcom,sa8775p-smmu-500 or qcom,sc7280-smmu-500 compatible), so
  non-Adreno SMMU nodes on the same SoC cannot use this property.
- Added DTS patches for kodiak, lemans, monaco and talos to add
  the GEM_NOC interconnect path for the adreno_smmu node on each
  platform.
Link to v1:
https://lore.kernel.org/all/20260516-smmu_interconnect_addition-v1-0-f889d933f5c1@oss.qualcomm.com/

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
Bibek Kumar Patro (6):
      dt-bindings: iommu: arm,smmu: Document interconnects property
      iommu/arm-smmu: Add interconnect bandwidth voting support
      arm64: dts: qcom: kodiak: Add GEM_NOC interconnect for adreno SMMU
      arm64: dts: qcom: lemans: Add GEM_NOC interconnect for adreno SMMU
      arm64: dts: qcom: monaco: Add GEM_NOC interconnect for adreno SMMU
      arm64: dts: qcom: talos: Add GEM_NOC interconnect for adreno SMMU

 .../devicetree/bindings/iommu/arm,smmu.yaml        | 27 +++++++++++
 arch/arm64/boot/dts/qcom/kodiak.dtsi               |  2 +
 arch/arm64/boot/dts/qcom/lemans.dtsi               |  2 +
 arch/arm64/boot/dts/qcom/monaco.dtsi               |  2 +
 arch/arm64/boot/dts/qcom/talos.dtsi                |  2 +
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c         | 55 +++++++++++++++++++++-
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h         |  3 ++
 drivers/iommu/arm/arm-smmu/arm-smmu.c              | 27 ++++++++++-
 drivers/iommu/arm/arm-smmu/arm-smmu.h              |  2 +
 9 files changed, 119 insertions(+), 3 deletions(-)
---
base-commit: 8e9685d3c41c35dd1b37df70d854137abcb2fbac
change-id: 20260516-smmu_interconnect_addition-d9567535e9d7

Best regards,
--  
Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>


