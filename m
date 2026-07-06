Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2455DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 16:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZWIz119etuH+575UYAm8u+FQxHrd3RggNnFu04wufqE=; b=GG+9yJYkMfPI1oVVGZ1A5LoGrf
	SADaHc1dljwwUfJxe6Rxb50bhosKaKcMKBTsbo0EnI1tvRs/EymdrOz4MfSHTVN6Jzm2ZcxstYE7r
	PS+Zdtvy+nEfM5daPFviliASnd9YmagbS7KcVcl01AbfH9/eepYPYKNrbTGLNCnEx2XvEYpWFdqzy
	waGxyC2guA4Bcx/V4Eoi23iganeaL2ZKlNQP0ixz/hyARctcEd42hH/U8nC/k5ZGF0nYv37blAdx4
	ar1daZVK9oNVc+mJ31V+SxPniGCLtmy84zDYppFMxOHr3gN3KYJd5dH04vRct7nY5DSMGwX0Foxoo
	yajV77Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgmd7-0000000D833-2G77;
	Mon, 06 Jul 2026 16:57:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgmd4-0000000D80l-0J20
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 16:57:11 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF1Ij980532
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 16:57:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZWIz119etuH+575UYAm8u+FQxHrd3RggNnFu04wufqE=; b=RhQbgbp/Gc3Cw2k1
	FM+795kU1npAxorRu8Ca/uqJcSQZP0gcrzXFhQ2dOBIbEEbC+2+EYyhd0lOSrPp0
	jSUc47Ilph5EI9I4oOXTdJtKRcitfTiDnMJucWUVt+kr5xGDI6DKpdZtOxbk3Oh2
	psaBQ6AaHmmCjO5afJnSgvPzloFBJISWQyCKfS4+aeh7fhrHkTzmuhZpKXdsyNsV
	Ti3jhJVyIwitGgAs29xe2a3gTBzY4XmdLGBfS0r9Ok+uENmwbl8EBIcjCltytoVm
	JuYDTVMgoVfhnV8dCq6mdTPPqD0y5Qa120MKngGEbma8XcFJ0daQ0G2GRaI0Aweu
	il+ltQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89kgt3sx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 16:57:09 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c89704da8c7so4999159a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 09:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783357029; x=1783961829; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZWIz119etuH+575UYAm8u+FQxHrd3RggNnFu04wufqE=;
        b=Egbe5p6tQ4HjjRskYhcb8diVQnVut4OeZivI8XPgKFQVVy8z/Fi97M7E/K3IOcU8rY
         XUADliD3Hoasfp0I8jsm1nYuRKo+a4wCm552tTwDMeFA9m98wcpk9xLvIy9u9fbRR/mi
         NS3p6seGvp/RdEb4be3zlXgDh8QtAENwVnYQHELohXR+6H6LdgjkczSVjbG6Ua3+ojDG
         68fA0m6LB8MMDlZk1BpBqfTYi4qQ3vWQo+rvdXLxlQPP/Vh9wQTTMgcYTvsNsjB3q+ij
         oF8qZrf7MBcbA30K7JtlzIFMvRSOGTZk3iowqKd629H4+70C62I+Wpn6PWZnJd1BdJ0x
         1qtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783357029; x=1783961829;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZWIz119etuH+575UYAm8u+FQxHrd3RggNnFu04wufqE=;
        b=HGSqvBX4wWFXYwlK+B/L+I9/Rptq1JTSRmq0QE4Rg6yvOSEqC7kVSzOcZgPhxgvE6h
         uk61Y8qYUD4KLKSWz5rBsd229+ng4srpiu9ZOB7IMt80yJQSkqJs2cXniPyIs7fteASk
         S82tL8ZYd6DV0BalAi4jAufVg9sVLG7kYIHkM/GdTll/pvmsB39oB1XMum1m+Ssts/lR
         yWE4d5EVEQfajvyO+gnoNL6xbz2mX0IXfv5lo5zfuyRJAiObzmllkIpgHCMNYo3ez0zA
         rgsKAtdcF4oy2MyBR0AgA5adarxgkCEDYpJIW9+ub8SQMBxSoU6jFLN2f31tRHqu29QY
         Z+7A==
X-Gm-Message-State: AOJu0YyDJoh2AOAUoOdfUhRAhjPe+bq4naV2Xt9JGpb0tI+UG2/DRh9f
	fpRscTZjbL6hkh5424fm07q403HyZNfav4ZYv747uIyvsIz1m3EktYO9pzzWGpHTGJBq8g8iws8
	2SmyheGx4frksjtmEVfjbVE6TCOtJifMCamexoU1kET+9kDE4aSnMmBX66jdphtywpR8dbX1DTh
	mYPA==
X-Gm-Gg: AfdE7cmnj5UK81Y+n+W5BtS7bXJyo9LPtNqFGRmHs/fX8/Zd9b9iN7ahW7bjCyAzmQb
	Bx9b+w//ugnu7OuoVF/YzOcSSXG5JJYRcneReDqxWUowcN/Nbw415OqiIxF/HOR/165fVWvZbaL
	6ZisEiG2nFUnjQVxN+128LKTK1ZGcGyn0H4OPT1LczTET2RlQ99Owvr9HleL70SFpa3YF09YMGC
	8sjFvMv2Lj1mqWvASvHbI8SURW4BJxTV0bRm6rUdMGqj1dIk1LVbGbMdT6oC0fKA4vKeKmqjJ02
	eG+UN8lWiF2mjs2LkOMUze5ywtLBwiVj0wl4nAC3IjbxmN3WOXRlA9wFAnvvETilOaqJwJudMcp
	bzlNFMD0IYkGpZaWWIMd1e/kkfaLl9W/kt59ghJPFfw==
X-Received: by 2002:a05:6a20:914a:b0:3b4:68e3:f16b with SMTP id adf61e73a8af0-3c08ee0dd12mr1703395637.25.1783357028896;
        Mon, 06 Jul 2026 09:57:08 -0700 (PDT)
X-Received: by 2002:a05:6a20:914a:b0:3b4:68e3:f16b with SMTP id adf61e73a8af0-3c08ee0dd12mr1703368637.25.1783357028421;
        Mon, 06 Jul 2026 09:57:08 -0700 (PDT)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8eb0efc8sm6960604a12.5.2026.07.06.09.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 09:57:08 -0700 (PDT)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 22:26:37 +0530
Subject: [PATCH v3 4/6] arm64: dts: qcom: lemans: Add GEM_NOC interconnect
 for adreno SMMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-smmu_interconnect_addition-v3-4-afdca0125a65@oss.qualcomm.com>
References: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
In-Reply-To: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
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
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783357002; l=1066;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=jqUN234mlgaPq8CBPF9A9IY6049dMha0UkLsYYR2Tvs=;
 b=1ji8Ma7hdzOxQlIfqJxCYd4J3ISJcrVHCJl+oAGjgiQX8DpK+re8r+OuerLb9O0po65oAjDV3
 yxt38Erb7ESAe8axkhSI4hc2FzLqGqjsLkh6UNnFGO8TVZ8yM5p+i7S
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-GUID: 07Wt5oqS2y8YIHd25vFBuO7qxQRYq0Dd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE3MCBTYWx0ZWRfXxEHY9e9/UFCR
 s3cMEj05ahf701H3JuwQvg987Km/J4Ui0p2XtemZrojx2PEDm5xGuDg7Ph6Dy5Fkx+my3jDPDBm
 Xp93/aS4f9hi+2tzmQx15pqtLceVNBtNtWXRE95EHhQFxAvEOhS5Pqk2EpCfA6m0Ipyv3wq+DLU
 x/t0jP5o/WQnxkggrybBdjv+jisvxIyoyLd/JLHdG9E7v5rXer91VBYvWMWY9dqADyV2D8ZKK0K
 PF7zjlUB9DDnEnB1DLn+XI0sc8Yhw1DFyJDFytHzUUEcupx30yXV9wuqzBZ7lOR65Fz7g8H79xL
 wKH6C0IWJIHHPn+hDXhrcVzWBX0keSuorQNOTpFraN9B3q5mDGFVDavlWcAiYarvSFszHprXaRk
 Sk2NsG5xKPepd4EEfFl8okxAkL9KWb3ajp/gc7Aic4gr1gEGdGCI8U25GrLL8fboUfDe1flF0mN
 FrujRQNzuxfkS/hZ1ZA==
X-Proofpoint-ORIG-GUID: 07Wt5oqS2y8YIHd25vFBuO7qxQRYq0Dd
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE3MCBTYWx0ZWRfX8Qj6xsRWR3z3
 z5vfRfZ0bfw222ud7iTjJKNL1/szBu7r6L4P3cNVMXBpwW3XutqWMtQErqyJg4riPRe91kFuaC4
 zfxb6ECi4KRkSWo+mgZ0tChkthSYpwM=
X-Authority-Analysis: v=2.4 cv=c6Sbhx9l c=1 sm=1 tr=0 ts=6a4bde65 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=JCeWlrImN8qIMoXkfH0A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060170
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_095710_132199_6A269451 
X-CRM114-Status: GOOD (  12.42  )
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

On Lemans platforms, the Adreno SMMU requires a bandwidth vote on
the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
are accessible. Without this vote, the SMMU may become unreachable,
leading to intermittent probe failures and runtime issues.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index a10322c5bc35..167c33d14375 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -4809,6 +4809,8 @@ adreno_smmu: iommu@3da0000 {
 				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		serdes0: phy@8901000 {

-- 
2.34.1


