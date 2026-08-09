Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 507A6C5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 20:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IzizJPNPjNfA/xYYjcXya67+pr2fJ/V/trczrmnBD7I=; b=mak4SplW/+wCa5Y6QoXColY4/E
	5VAuhuZDsQu4OgUNr9/VxH4F9M4SGZk+nhHhdn3toK6yVYPJu+ABQ2GUffjuRO5z2qC4r8emb0pxc
	2HAIqT3oPMBkkqItEAxkYCNKI2Mnwq9bqIuZq1OjvSMiutQ84ARWzqPTOM+oYgj5jAUAy8Eh9Allu
	5SJ7f2Ihy7TfmlT+dltbvyepNx/cYBMk9kr0Q1DAvi0/q7fIOwyHcrmj/qnyExw2IsMuX8oXnoxDp
	IQNl9VEm8fOGbgNNV7UI5gupTFS5mMaDEUiRYOtZdqa1UAaCIv6/hgr0UO54JJbzM/PQrJTV49o3A
	+Z4iWDNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt9w3-0000000Ae4r-3sqU;
	Sun, 09 Aug 2026 20:15:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt9w0-0000000Ae2V-1s3A
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 20:15:53 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679I9ndB3732870
	for <linux-arm-kernel@lists.infradead.org>; Sun, 9 Aug 2026 20:15:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IzizJPNPjNfA/xYYjcXya67+pr2fJ/V/trczrmnBD7I=; b=MsDTcNBN6T7lOxBB
	BCgqY4hefdTCOGraIJtlKPG/VMQ7Jo9Wl114R0ow5VMx95SnAwqMKVKifPXbX3O2
	3opRGPQD+67ITCZTN1agBaiXIdRowd5MafuHcX/fkZHALM6F4byYMyhbaPd7iBQe
	ckqWyhArELAfJVQdUK/V50zHJcv+ctGx4UwpRgbwDvwTD/H8SlgHdezt3/4UO9ZE
	9eZHQTI0kt4Km70aMTyJysccdL10M2LiIkeIZ8J50RHoKcUprogYC5rnUAndZzO0
	Ez6TpHk9Wacbj+3rXM95mVzk7wR5GaI+XtzaXV2OT32lCo9GWING5HbIh/KkDuwv
	ITT24g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwv1ybhj1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 20:15:51 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8e934385db1so13964206d6.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 13:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786306551; x=1786911351; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IzizJPNPjNfA/xYYjcXya67+pr2fJ/V/trczrmnBD7I=;
        b=KwhkNDO1Yo55jlYJeAZwi9+M67SD+E2PCzE68TD8UNXM+Ax7KoE5zXvrLwtK05vdUI
         dtzA/IXoKaE5/nEWzM20q4IUDI2tpoo4nT0qVcOxGoCgpH9CUSimb/NWK3BF9HU6o4OJ
         SGCMsFzq0+zEDQiW7JYtavvxYBVZ4hSEOHC8sLOT4i1SX8SmmiU80VYI2mYJy0a0oDVB
         m54h+UQ0gpNWSu4IXQ8tV27bms2CguYrKi29VTUmVp9eAcqgVYsO8Dogv4Ht4LKumWn+
         ZmF5NDa4fBuHJYTempfK8fdrQQ0wfUWkDtIPFicLt5yDlB+Cf1eWxIJdmC3UmUP687SK
         ehyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786306551; x=1786911351;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IzizJPNPjNfA/xYYjcXya67+pr2fJ/V/trczrmnBD7I=;
        b=j90w6D+OyQ4XJjQ0MafYb38oiJEyxov7X+QfriKWh0wQM/G2hJkzDrWPjP5i46ityQ
         tsD2cVcR3neO5N8zOjXlX6DnqlL0WRojdLpwg0NAtRokJNKokaqmuf0IQpaB1ZEqVWmy
         R1DKRlrwcVlTPotZ7CbCLLsPJexBwvE29agdJhztIt7dNYpeYOh6tB3z7SsaW3HNHsI4
         TeVlmubaNhP+5f3VnLt1Bglvc/wXE5NN+zAD2elYPfPycOyjfXTrvdFG8ZWUXb0fIiue
         X5fyvMaPJTCbVpyB5nXvURoTRLdIS5ujvVXyHcqRv3qTfPHO7/QK3Udf2b984j3VT7vO
         PI6A==
X-Forwarded-Encrypted: i=1; AHgh+RpN1LjsJEnZiLW2+xGg5vDQS/Ze+2tvg4Tm3nlap8Uy5GUBho1ZspM3+GvSIUaXuxaH/nQ1cUM0nGAjUgH0PoHB@lists.infradead.org
X-Gm-Message-State: AOJu0YwLZG0kqLNlcgC8mcMi4j0ji912uwXMpEmaUjM4HlompOKhd7P4
	mcvyfERHWyyr4uaUCqh05YueSjOBW0j68rnOrB4oRNwL8QM9Z4Ralj+yQkRUQ/GD0qifR0AvjLz
	s9e12BgT5HAkTjTPqZmI/Xn+k20Kblph9GKaVo5CtL7v0b0DkMRmooA2y8/2o5unp5L9Mx2CVr+
	Zll23SiRAbNg==
X-Gm-Gg: AR+sD12h3vCTO3FUVzF0Mi9sU1LgJSDzU4YKJkAMhYzN+al4Fjgwkj21Dbq5THR54dG
	M9rXCAcT3Jq4Py5AMAOundFGgBqiupHTRXtmQrrYlF/K57Ue+QpRG3l1dLyBMqjdBta4eCSy/5g
	YgHC8B9Ej/tu98mJi1CjONtvdaDBlqxQT8gjUACWWtznYxLc7/uSpR9dDAzvbQs8Ynmq9GILw7I
	OtlLGYH3zAFn1kCw65wcd8N1QETdGU8VTe+JBq9hz4LdjbBoWMUdj6/ER93ISEQNxZynf1VrtWn
	YaPcvUr04ms7w7/A+3V+NNQY+OZJaXdnXjOiyrdtnL0zeJD+7/mTOvzf8HubufLIuL6EEe++s9/
	fglC1SeMWRLe3bS1nXQ6dF5Ouq8IAMV6csMYbil0lVg/DRMeFriKE6++PAkWsTaWg+F3XoY+ZU0
	eOVvoLcEFNNVCGUA==
X-Received: by 2002:a05:622a:4111:b0:51c:92a0:b2cb with SMTP id d75a77b69052e-52ce60d5ea6mr468766051cf.26.1786306550767;
        Sun, 09 Aug 2026 13:15:50 -0700 (PDT)
X-Received: by 2002:a05:622a:4111:b0:51c:92a0:b2cb with SMTP id d75a77b69052e-52ce60d5ea6mr468765701cf.26.1786306550409;
        Sun, 09 Aug 2026 13:15:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3055f3cfasm1589259e87.70.2026.08.09.13.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 13:15:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 09 Aug 2026 23:15:41 +0300
Subject: [PATCH 02/12] iommu: arm-smmu: add global register definitions
 used by the QSMMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-msm8974-iommu-upstream-v1-2-87f5cd492560@oss.qualcomm.com>
References: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
In-Reply-To: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
To: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2421;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=uCse0G4tqb7yw8phAOieTW4riZX8EVQqZbUSnb6rt0Q=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqeN/uOm5F41+fJk5lrC5TdNjqzxoqf3PLotfHc
 NBoDIXGCTeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCanjf7gAKCRCLPIo+Aiko
 1U4mB/9BkjLJ40OyMG0IH/Bav2udI9uSTLa2z5CQ/s6byYnQqqpJfmkKGapWsPPmTZOYi4xrwGE
 DH7SOwF7QybdC2czzYlfv9q4aganYXnX0yG7rheDfvDHXP2eIoiyBg1VD7u9g8vrfLZoHRUmOEr
 SzeGge2XA+1dWruNDf2P4NIJ6TRvGw51wd/ye6Pn7hkCfufp6Yz0ZFLDIwZcR4ERlH2n2x+UJJ2
 c/rBjygOzs29eHDg/ObTIX61fGFqAGCtuszCLfW8uy7JOtxjiraSvNL5Q2U+OtwmX9sqO7jSP8T
 wpNDypbpwympWONEQZOkL84Duewl2GrWQFXKPVK8VB1ZArWJ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: nPiTWeRelJlv5-ctIoa62wTLPRBXp8dL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDE4MyBTYWx0ZWRfX1O7QZNmG3rdE
 HuaRMEfUEOr3wIllY2vmjjW7oP8j86q1F5fMZefa3Wh9TwVx26eAnJ9jnWoWrE3vyH+PHHqDYvs
 3hPhn7R3bwNeKF/AzHkVlOvGvOC2Hpd/RjJgzSNL3Xsb7m/k+yndLzVGqIol0x60FBrcH2sUzfJ
 YTl9bHJreYNyvkGxNTOOPNEFjyxeqxeuyqOSpO2G/LV0QXM4UPkktcP35syPUw8EzW4a+uTtvP9
 deUV7BPFq6U1PTQuqvAs+JHgljtPHtCtpS55QY1PSTg0Srq21dSjAuw0+O/iG2/6rhVQ1YAwqsc
 s5t7/fjycv+dWsgSoI8e/ODMKeWsoHxJI+3rzU+sJeh5u7qzj9cFP0ALRx9WGoFdI7KbjXvra2E
 N0MDdCDrxRKAQ/PFsVGn0tYl5C/G0xCezVP/Fj+mwuTYxEtkILSL/UTDIC63f3KYqq9HXmW58Iy
 QYIIbHguG+NJ5aghJsA==
X-Authority-Analysis: v=2.4 cv=PbrPQChd c=1 sm=1 tr=0 ts=6a78dff7 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=M2U4UlAmMl8uHlp6m3MA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDE4MyBTYWx0ZWRfXxiO8zit6LB8V
 280yVVVXeg87KgGSoj9BjAgvjeG2Pn9XIcloJ7I8EYU/JkmikD3blzhvrIsPheVsuYea/yEevir
 A1crq9cUq+ziEE4wSLCn3URMgn+naFI=
X-Proofpoint-ORIG-GUID: nPiTWeRelJlv5-ctIoa62wTLPRBXp8dL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_06,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_131552_606151_F5860F19 
X-CRM114-Status: GOOD (  13.69  )
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

The MSM8974 QSMMU support about to be added to qcom_iommu has to
program the SMMU global register space itself, and several of the
architectural registers and fields it needs are missing from
arm-smmu.h: the secure configuration and fault registers sCR2, sGFAR
and sGFSRRESTORE, the sCR0 SMCFCFG and STALLD fields and the S2CR
NSCFG and MEMATTR fields.

Add them, sorted by their register offset and bit positions.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index 26d2e33cd328..49424d8aca6b 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
@@ -26,11 +26,13 @@
 /* Configuration registers */
 #define ARM_SMMU_GR0_sCR0		0x0
 #define ARM_SMMU_sCR0_VMID16EN		BIT(31)
+#define ARM_SMMU_sCR0_SMCFCFG		BIT(21)
 #define ARM_SMMU_sCR0_BSU		GENMASK(15, 14)
 #define ARM_SMMU_sCR0_FB		BIT(13)
 #define ARM_SMMU_sCR0_PTM		BIT(12)
 #define ARM_SMMU_sCR0_VMIDPNE		BIT(11)
 #define ARM_SMMU_sCR0_USFCFG		BIT(10)
+#define ARM_SMMU_sCR0_STALLD		BIT(8)
 #define ARM_SMMU_sCR0_GCFGFIE		BIT(5)
 #define ARM_SMMU_sCR0_GCFGFRE		BIT(4)
 #define ARM_SMMU_sCR0_EXIDENABLE	BIT(3)
@@ -38,6 +40,8 @@
 #define ARM_SMMU_sCR0_GFRE		BIT(1)
 #define ARM_SMMU_sCR0_CLIENTPD		BIT(0)
 
+#define ARM_SMMU_GR0_sCR2		0x8
+
 /* Auxiliary Configuration register */
 #define ARM_SMMU_GR0_sACR		0x10
 
@@ -80,9 +84,13 @@
 #define ARM_SMMU_ID7_MAJOR		GENMASK(7, 4)
 #define ARM_SMMU_ID7_MINOR		GENMASK(3, 0)
 
+#define ARM_SMMU_GR0_sGFAR		0x40
+
 #define ARM_SMMU_GR0_sGFSR		0x48
 #define ARM_SMMU_sGFSR_USF		BIT(1)
 
+#define ARM_SMMU_GR0_sGFSRRESTORE	0x4c
+
 #define ARM_SMMU_GR0_sGFSYNR0		0x50
 #define ARM_SMMU_GR0_sGFSYNR1		0x54
 #define ARM_SMMU_GR0_sGFSYNR2		0x58
@@ -110,12 +118,14 @@ enum arm_smmu_s2cr_privcfg {
 	S2CR_PRIVCFG_UNPRIV,
 	S2CR_PRIVCFG_PRIV,
 };
+#define ARM_SMMU_S2CR_NSCFG		GENMASK(19, 18)
 #define ARM_SMMU_S2CR_TYPE		GENMASK(17, 16)
 enum arm_smmu_s2cr_type {
 	S2CR_TYPE_TRANS,
 	S2CR_TYPE_BYPASS,
 	S2CR_TYPE_FAULT,
 };
+#define ARM_SMMU_S2CR_MEMATTR		GENMASK(15, 12)
 #define ARM_SMMU_S2CR_EXIDVALID		BIT(10)
 #define ARM_SMMU_S2CR_CBNDX		GENMASK(7, 0)
 

-- 
2.47.3


