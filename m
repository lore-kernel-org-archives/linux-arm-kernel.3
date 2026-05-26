Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F76CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 14:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OJiQqr3Kx8IGfpljF3ubZKSLxL/TpGa8jIJrCHd9nnQ=; b=CXWhMJzzl0Echa
	v82OdlHWvoyenvPBEkBLWJkskFEeh8RzFSw8QkcFkjsIocWwWI8KgUVl9fXoeHi8gxS6vlor5G0EU
	A0YufBUGVML5JBYPI8hc/b6QuLOT1CEybD47vTk6BNuaGZu7TXma6K7fQQx0DDvI+S9X2Jz7o6Jov
	0grxvzf0mVk5RpoVURyJiw5BO8jyONtjPTkCcuYVme/rgjy5BI2rTi81BcK+GX9E3mcjyEW9FeElp
	qzDd3yVLPFuwPFjERYwVLhZmxj2bYBnK9rxzzKgsH4Jt5xN0bdtPr7n34x7dC9wZ/BqjXxcnP+mdu
	84xhdLKe3nIReRPsuIkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRsz4-00000002C59-1qJU;
	Tue, 26 May 2026 14:42:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRsz0-00000002C3y-2DxQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 14:42:16 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QCsBMB2554447
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 14:42:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OJiQqr3Kx8IGfpljF3ubZK
	SLxL/TpGa8jIJrCHd9nnQ=; b=KOvtZH5xB6yp+4JZnbkSbPMS8qvSqY2FJ4t3Qo
	YU+jMF9039wl6J/Boy4V3bDCJFVrs7ErloNk90U2FJ/BB0N0g54JxmkC/0q0zhmE
	XleaxDlE3KdY+4GVOBG6P330O1V9T690DPp7NHCFkgJgbhFxjQKaZYVjp6tvEGnH
	lzUu9AOsgFnRdvPqzNavlHX0HCe0KvGniq03NABx0F3ZhZjiVqzMbWdgARmHKgS4
	eUDEu7Uktyv37nOuESVIFp6IKA0WfogS4v9FxvF6dducyyiB+n9e+HTbb17bCvyG
	Q39GeG6RYX8cb6Xjk/4AldH/o9sKEco52elqZetBJykL0FEQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ed5v3tbx3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 14:42:13 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-837c4eb3bdfso6315262b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 07:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779806532; x=1780411332; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OJiQqr3Kx8IGfpljF3ubZKSLxL/TpGa8jIJrCHd9nnQ=;
        b=MzPhxiPRSKtpZ0tnkyZKmfGJA5idkMyu3mhnw7WdOBgf3bXrWafsBVmPAHc6ug41M8
         C/gIa3x0aS2Tpgkog9QTD1Wz4qXajwgXYRj0r4qoxotmNs69iqSU36+juefqOzL/jaBw
         RSVoCYOTn/a/KirUI9wjPTmdQlxKz8QrQojcFD0+0eN2yAzyH7mlTdRnjPY3gZKeZzMr
         wTa91G0LMBuT3UYNQh56dVjE7v1D6r21ysUGzfFwqfRuSP8D/uL16ev6zcgpnqpYLif1
         9L17s2db4hwcEhIdbBlxhf+LsdgT5prdXMwNonjUTo6eysJtuSCciBqt5KWi3mxLifXy
         k3xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779806532; x=1780411332;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OJiQqr3Kx8IGfpljF3ubZKSLxL/TpGa8jIJrCHd9nnQ=;
        b=pbhQMZhoRwmEKWs0KoNnJrJCfshLTKnDEgcqR64tjAYXb6eKlsxXXsgnFMgXiM6MjQ
         6zaLuJlTaHoib1antPgR3SihmXt1r5OG9f0qqrkK2H+hGSpcIWLQF42Wq+cJIbvtvlWW
         CbirZ02pSxTlkaJze4GvalUggiU+5lCErLivO/viZpvSOL12F0ulJuxMomLQpzgBcAu5
         GfQa5Mf+dI2hXYRN+CzTNIzYjmPv9jvS8a1JO1ktzIx3QlQqlj6b1qNYu2Vpkmt2B8Ct
         XFWW2JRV5YU/924logvOHQEFhGeVpXvN4sFjriCBYM8l57lDjlUBByesJeVXvnx4N552
         rMuA==
X-Gm-Message-State: AOJu0YydltWCObgefEA/afOQlfojWNE1G+SOfejlZP7N3KfUbG5s1pkT
	cj/9HKzY+0OtwzkZT84aCopZHyxcxNIutNCVJ8k/uQ54UtUsoWSAxYLrf+LTpPeV8Fh0iYhlGAK
	Xwdp6K1WE8QqsRCeN5x5U88MIkh7rrDZkOKCmTi+XPA2BFrp+xqE0/spANOGNoufk1UE4US7/Cv
	Gbyw==
X-Gm-Gg: Acq92OECGYNjj9Xl035trLXFTYdx/G7JSflHJeb31aKQkmTqgySisk2+PN5o9UjWq7P
	GULfJsiC/yHo16uNlmuwCzTdmuXTBbbo4dQqHG1RsBKGiNirCE6VyOiswUxaAsWSFPjWu2k/9sA
	hsIyV7EGFXNDuKwgJiJzDOmIWbia/ElVJsMBU7YwEF/b5RZYwwSoKJZclqub5c8Qq/zF3IKkFWv
	F9D1qBpstmkbOct/pYjijBBpOOxKCdXVt5H4t+E70pc1SmkzUMULY8URglLYtxIGvQA0t+e2YJX
	xSo2Rz3rEE7wd0DqQS5CfduBd+d+ZV5XgPIY92ofFmyjvE0G2Ep26vOTVUl3JHHQSruG8u2N1Ks
	r9aLS1+CyzudUKboBwADBow1fFAhrYygkA+QfPzwMp7ERJxeK1WWO
X-Received: by 2002:a05:6a00:2da4:b0:837:e9cc:d465 with SMTP id d2e1a72fcca58-8415f19e22fmr17299168b3a.20.1779806531944;
        Tue, 26 May 2026 07:42:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:2da4:b0:837:e9cc:d465 with SMTP id d2e1a72fcca58-8415f19e22fmr17299129b3a.20.1779806531391;
        Tue, 26 May 2026 07:42:11 -0700 (PDT)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164acc288sm15362019b3a.10.2026.05.26.07.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 07:42:11 -0700 (PDT)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Subject: [PATCH v2 0/6] iommu/arm-smmu: Add interconnect bandwidth voting
 support
Date: Tue, 26 May 2026 20:12:01 +0530
Message-Id: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADqxFWoC/x3MQQqAIBBA0avErBPK0KirRIQ4U82iKdQiiO6et
 HyL/x+IFJgi9MUDgS6OvEuGLgvwq5OFFGM26ErbytRWxW07J5ZEwe8i5NPkEDnlTGFnbGsaQx2
 2kAdHoJnvfz6M7/sBQV7ISmwAAAA=
X-Change-ID: 20260516-smmu_interconnect_addition-d9567535e9d7
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779806526; l=3074;
 i=bibek.patro@oss.qualcomm.com; s=20260408; h=from:subject:message-id;
 bh=uLBVRdHt1DzWyNxdmo3c1un5xSXTEc6wp4DIMqPlal4=;
 b=/Ne81frZrkFm12O3bT5MXS9r78AlTz/iZ3rH89KQuoikLX44xrKyZYzPj9hBcNKbp/325tjH8
 0XBzvdHMDjgBCjsAjZPjbGiePAPo5dN+smBTmF6hDnj3cr3fkfQFBAa
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=V4oTa+TgRi7dib76fc92V+rslyRCAKbK8D4b2RVsMbc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDEyNiBTYWx0ZWRfXzyEwFKZxQMKc
 Uld5JcR+iALsAfgsixlEc+CrMz1YIt/dkBI12mfjWLvkHAZnVGJ9RlsTjyfZaFFCveCiQaxteti
 Sulmjz+FoHc2iy0wf1o7CpYVqtUTy0dxDayJcBzycQdAdcHknkalw9L/o+v9vqQjbGngHLoR99l
 jn5pgrE1/2B+mFriRyVd1jrrUTODXIMbhG2S1nU0Qs406yo+c7lQyF5PDZRKV8zWnAPedIf+tGm
 AdlMIbXzy7QkeyCFtF9ABJlGYCfJjqp0QjmWjctuQdLuwpstoNf2wLl6yV4BKOGv7KM6vi6TBzS
 r6L2Q90uwfteFvPWMF5Sj9sHRig9BuzAtUiHP0QVwQnvWse4w7cbUrVHnHo3m8isluqqIMeKed4
 sEV9FvrDtFvN0bBPwY0ST7+cXPfNX9wjCSyNj7B6RFTzltxv+iLRfZmHtYQxKiuJB7HUM8ygMSv
 HXy0vrj+aKlDOuhqNiQ==
X-Authority-Analysis: v=2.4 cv=Zc4t8MVA c=1 sm=1 tr=0 ts=6a15b145 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=TPSRUwCClOzv9anTvj0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: eiwvVR8im2VX5oWJ5Na9iQ5sGAVd0aD5
X-Proofpoint-GUID: eiwvVR8im2VX5oWJ5Na9iQ5sGAVd0aD5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_074214_690938_3F5F7F7D 
X-CRM114-Status: GOOD (  16.94  )
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

 .../devicetree/bindings/iommu/arm,smmu.yaml        | 27 ++++++++++
 arch/arm64/boot/dts/qcom/kodiak.dtsi               |  2 +
 arch/arm64/boot/dts/qcom/lemans.dtsi               |  2 +
 arch/arm64/boot/dts/qcom/monaco.dtsi               |  2 +
 arch/arm64/boot/dts/qcom/talos.dtsi                |  2 +
 drivers/iommu/arm/arm-smmu/arm-smmu.c              | 57 +++++++++++++++++++++-
 drivers/iommu/arm/arm-smmu/arm-smmu.h              |  2 +
 7 files changed, 92 insertions(+), 2 deletions(-)
---
base-commit: c1ecb239fa3456529a32255359fc78b69eb9d847
change-id: 20260516-smmu_interconnect_addition-d9567535e9d7

Best regards,
-- 
Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>


