Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9BB8FF8867
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 08:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dQVHkLqjIbMiur37tdNBpO1Zpy3OgeKlp5miPa3rQFM=; b=q4d6f/O0xCpsHnz1MLW32HrVwR
	9m2fkLceFF8gP4Il3un/Stjxm6ihs1czoeeHaNyfc0p5TGqZ6WPXOlhN9O3BtYii75sqSMJ5u3qLi
	UeU7HNVS/L5xu+vsTWO8BOHKoyTPPmn44kWpROXv4n88T4x8zAM2IEk/Y+jf52kueXQ+xNZvQIMsf
	jESEXFLg/qgq2WigmRaTVCtHYyP/gx7X+NO9MLiwB/5jmUbG6Wr9JPBunIu4gfvq2TM7eowiChUY1
	f6M2cgm6dp6YkGqFZJumVaV6MTUxfGGg7MssV2Iq6PX51iV/uJOxNNQPv7PPYCOrr4RBXM5OvN7Ks
	85WpJRjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI0j9-00000003Gem-3zXN;
	Wed, 29 Apr 2026 08:57:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI0j0-00000003GbT-0azh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 08:56:55 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8qa0J870088
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 08:56:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dQVHkLqjIbMiur37tdNBpO1Zpy3OgeKlp5miPa3rQFM=; b=DqCm0W0kwskraCe0
	wO5N3pJBv6B/92ovLDzA+LNbFpXXriiqoLVZIAuX/rJkncVPs1WZ3nllU1bCNvz+
	1kF+Vsu65eMUSaXeQXGEYYu5PTvQLwxTsoI6l8btGvY6+1/o902zMcbPRPWlOpm3
	xuxfkQa88RP4XLyIpv/2IzB+3ZSN3RY94FyjPbLu5KJUo4TlPaWq9w5a/KKP8YvZ
	GG2Ys7q5ZmW0yozGUHGx+jhw8aN9guQIRw21gLuOPzqC4PDiSCkhNYT3vSAZu2jn
	KcbtgE9xZKdxEgfiv6PgLOqkkXK4rFl3ccErBDQCrg8/OOH7AeFsPPhvOrdGyod8
	KfPm9A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du0u1u32m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 08:56:53 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50fae95c82cso251148581cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 01:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777453013; x=1778057813; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dQVHkLqjIbMiur37tdNBpO1Zpy3OgeKlp5miPa3rQFM=;
        b=Xi7m56RUfGQ+kHt5/SA9vtWuQ5S/ax7zmnvONngoPBvalL6bwn8fdbzKZfgkm+ZQY0
         r+1YPNlkU2mRxNxAh+kDWYQYfsTYR4Lb5awp+sffVSNkHzbHqgFB+aI639dIJCjQ3zN7
         QbV6K8so5cy2TrEEQ37qBRtS39+X8pIaEKSXtjcD6kKDEbf0EKYXUtGHwM+OUl6RAgRe
         gHRegmMh57VqLmJZctnukL+dOPMEZ6CjfCeuChLkgpwprF1NuU4NHFawILEX3Qmv7lAk
         m9PJ+hywr17xLi/KMZRWkXnDCMHFW97xwGG29TwNYhnfmkJk3/kHlNMuvJI4+/oYFedi
         zSJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777453013; x=1778057813;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dQVHkLqjIbMiur37tdNBpO1Zpy3OgeKlp5miPa3rQFM=;
        b=q40iX6zowKE1KutPDTx/wyY/bM+NUlMJ4mYD/ZL9NXgd5VPK4GBu7yUPQMYwCRSU9T
         q6Z6eMTiMnOaeq0Yv/EWSdhbtLrqp4VifQncQ0BcmE8fW8oHl8/MQDRWsA75apk/kYhi
         nlm/lfX1TtVnaWq5xuS9SuTyHUsX3tfMdBq/KNm8jUu7mhnNHLk+pdg2RwV8jjSZLitY
         dMj1FMUE+yHQUJRuFsOrR5T53kOaAtb3GgDCEg5sPLYBv9oqFRBmeAXS3HVFbZouYXoF
         7bL5w6+wvXnLNBJ9WA1+cWDFAGec/tPKcIdtnpg5joJ1lybcEf3JDNEt+RgnA6yXxSto
         X0Qg==
X-Forwarded-Encrypted: i=1; AFNElJ9h4McM4LeiMAGSjemLUsjRzRvOUBZq9Xg1efnTnNNysggoOecHpgb+m/H7UIQS7joHXCVhN7/pbZf7EntDoN98@lists.infradead.org
X-Gm-Message-State: AOJu0YzKOQPRaLyUpoUNAKTwcPZKWf9DE0GIXLnm666XxWwZYiWdA3OF
	oLy+9fEZbBTMkjd0LvhL1zzy0iKY67Ckd+WIbuUOvw4qG+YLfMQpfsl04j6abHGVSyZjt1ZU661
	kayQ8ZD1mAJiG3ycDD00U+iIjkHDIESBbhbG508ThmA/APt7+gU5EQPKUMljQ7GUkul/kfVGAQp
	tL0Q==
X-Gm-Gg: AeBDieuxTtu9KJoOnY9gqNACxLzloILg48rqWw6qnMFnKfHyu9EQ2t01s5lznLdgBvN
	D4k8YXR6XurDWEtcQWmYK6O4sNfAOrzG8FPINIJIHsUIu92ETzeR40jvkfvg+S66wCH4+ePTrlQ
	VLOeNuYgQqhAmyOtjQoQA3MhzCLMHx64SiPG/s8jWE6YH94Ao1tehhVSFiK7nMGocmrERrIMzW6
	oNV43opgD2cRO0P9Xr/+9Geu8fstBgtTQnEnwf9k6x8GaIdlKylvRK3b3VRtW/bH/ltcBGcOwIu
	E64PsO+RHat0utZMUbtgFzT9TC/y2rjjgyVF21IdcleXl+7eanZ0vDcXyYZQK8PsklUY4RiZCvt
	gDupvweJvy/FBHuAQ+iuhln0b/looHq4ELaipHDtXw6DjcaDL8bpAeT4=
X-Received: by 2002:a05:622a:5c86:b0:50e:6165:11e5 with SMTP id d75a77b69052e-5100e0fbbe7mr88087861cf.2.1777453012699;
        Wed, 29 Apr 2026 01:56:52 -0700 (PDT)
X-Received: by 2002:a05:622a:5c86:b0:50e:6165:11e5 with SMTP id d75a77b69052e-5100e0fbbe7mr88087741cf.2.1777453012295;
        Wed, 29 Apr 2026 01:56:52 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b4216ed6sm4950689f8f.16.2026.04.29.01.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 01:56:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 10:56:35 +0200
Subject: [PATCH 4/4] ARM: defconfig: qcom: Drop Qualcomm SoC drivers with
 defaults
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-qcom-soc-kconfig-v1-4-69ba540b3fe9@oss.qualcomm.com>
References: <20260429-qcom-soc-kconfig-v1-0-69ba540b3fe9@oss.qualcomm.com>
In-Reply-To: <20260429-qcom-soc-kconfig-v1-0-69ba540b3fe9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2578;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=CK38rKkDq+RLbFZ8AxFtRY8upy3ep/OyRQxWo0tHp9M=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp8cfLpwLrADeABkQUYzrPeDG/v+md2BW9vCT3/
 mBcNj8Vk9GJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafHHywAKCRDBN2bmhouD
 15JeD/wN0+T9uIxwU5//x1nBjE86nPqdtn527hOFGO7EpTkZLXALmDGpcFLb7+bsaWRRLZp37nV
 jbA650wDzgKnfFEqX3LsgUYrCNOB+AeuMuINLkhn3ps2OC1Iylk4dVRDBri9O142qEDxaxjYNzh
 NWzAAFpuGtcMVB408bGMxf7iHxghGlnxsoH9g7NndgeFrASSfSmLKVB31gPjM8pWyte/wfTdGih
 H4X5tQszGxtYADbZ5HMCU2DA2o7cv4hrdNPMi6FIIvx2NUYpCMHkUjkBZAvc0vXlz55ejFADe79
 thpod87l6uolVxeEhLyxkFALw0yKzFVLMD1TkiknPkXpYvbLEBzTLOncgHO7APV845KlpZODFba
 5Wf6KSM0T/hgaU6IsUOUAY1fDucYbQm2zsBDmkc9olWgGJML9YigxSrr2NwEA7i9ytF0aXfSEPD
 XKTKBlUiHpUJvvKrMyen3gcMRvLFmriwkWMxzndXJj3Cy/BHalXBE1vmeWyOBksNK7uCC+/azkX
 4pWW3JEFtP+NM/+Wscje/EGuOw0E/4Up5/BSzELfMRoqBWfpXCMuoIC5gZCbe1k27VG9GT4KacG
 FUELvscNMf3jSqWa15RP3KLDrZZoHr3saYJES/kjBzQPy+6KJNnR9+VokEAtfAOiIR/n5KP1L+j
 TTgBlXF5eT+lwMw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: 8q8tWn27HOCHNFqxLzYXNNZXNvuQMSbu
X-Proofpoint-ORIG-GUID: 8q8tWn27HOCHNFqxLzYXNNZXNvuQMSbu
X-Authority-Analysis: v=2.4 cv=aPPAb79m c=1 sm=1 tr=0 ts=69f1c7d5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=gBdK3KNpVRY46ggoUIgA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA4OSBTYWx0ZWRfX9Lz4xKiSIWAN
 QHOVvgRakBgekRRI3eVGicIvy2w1ykKNrm21ufY/36qxvB5/NzOjgtlnpUn2yQdsTnjx98VUnDu
 p6RzGYRm3P2+NVdm7Cd1p3ZPm53K0wuOJtFuF6KjN3q2ezGmzH3tXnK1N4HyyhrqWfmbsWkKC2+
 iJ0rgfbX0ZlVxVL3wZYugzIxYWbzL3dTbRYEm/vh13BzxybG5/PMQu+NT7wV9IECRYC9QJlvSF5
 FPHNGYNDJU8V4SV8GHBL9LLkROX5lctDhmpNUXM3ArzV5Zr6OPkXi6tYZRHO503oeOi/9Db0Ol+
 7+CkaGOvZs1GEGSqZ3jYSPmBGgnVHBd1TivVPHm6Cb+vQydJkYLkaF6ONqvJ0hbgtjCDI3XhvJG
 0hHVstJj7+9uimX/4k44X5bY01FS/Ur3FY90AbPmnCyg8SRDRA7uP/BJLZ78pf+aiOdpvCMo3xH
 /pkp1T9p6d/1/1zpSJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_015654_193697_60ABCA00 
X-CRM114-Status: GOOD (  10.52  )
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

Several Qualcomm SoC drivers have defaults, so their defconfig entries
are redundant.  Keep the few options which choose specific choice
different than the default.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/configs/multi_v7_defconfig | 11 -----------
 arch/arm/configs/qcom_defconfig     |  7 -------
 arch/arm64/configs/defconfig        | 18 ------------------
 3 files changed, 36 deletions(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index bcc9aabc1202..09abe406d2a5 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1152,17 +1152,6 @@ CONFIG_ASPEED_LPC_CTRL=m
 CONFIG_ASPEED_LPC_SNOOP=m
 CONFIG_ASPEED_P2A_CTRL=m
 CONFIG_QCOM_COMMAND_DB=m
-CONFIG_QCOM_GSBI=y
-CONFIG_QCOM_OCMEM=m
-CONFIG_QCOM_RMTFS_MEM=m
-CONFIG_QCOM_RPMH=y
-CONFIG_QCOM_SMEM=y
-CONFIG_QCOM_SMD_RPM=y
-CONFIG_QCOM_SMP2P=y
-CONFIG_QCOM_SMSM=y
-CONFIG_QCOM_SOCINFO=m
-CONFIG_QCOM_STATS=m
-CONFIG_QCOM_WCNSS_CTRL=m
 CONFIG_ROCKCHIP_IODOMAIN=y
 CONFIG_SOC_TI=y
 CONFIG_KEYSTONE_NAVIGATOR_QMSS=y
diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
index 29a1dea500f0..b738e7f8a5e9 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -249,16 +249,9 @@ CONFIG_RPMSG_CHAR=y
 CONFIG_RPMSG_CTRL=y
 CONFIG_RPMSG_QCOM_GLINK_SMEM=y
 CONFIG_RPMSG_QCOM_SMD=y
-CONFIG_QCOM_COMMAND_DB=y
-CONFIG_QCOM_GSBI=y
 CONFIG_QCOM_OCMEM=y
 CONFIG_QCOM_PM=y
 CONFIG_QCOM_RMTFS_MEM=y
-CONFIG_QCOM_RPMH=y
-CONFIG_QCOM_SMEM=y
-CONFIG_QCOM_SMD_RPM=y
-CONFIG_QCOM_SMP2P=y
-CONFIG_QCOM_SMSM=y
 CONFIG_QCOM_SOCINFO=y
 CONFIG_QCOM_STATS=y
 CONFIG_QCOM_WCNSS_CTRL=y
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index dd1ac01ee29b..116d0b17e404 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1656,25 +1656,7 @@ CONFIG_MTK_CMDQ=m
 CONFIG_MTK_DEVAPC=m
 CONFIG_MTK_PMIC_WRAP=y
 CONFIG_MTK_SVS=m
-CONFIG_QCOM_AOSS_QMP=y
-CONFIG_QCOM_COMMAND_DB=y
-CONFIG_QCOM_GENI_SE=y
-CONFIG_QCOM_LLCC=m
-CONFIG_QCOM_OCMEM=m
-CONFIG_QCOM_PMIC_GLINK=m
-CONFIG_QCOM_RMTFS_MEM=m
-CONFIG_QCOM_RPMH=y
-CONFIG_QCOM_SMEM=y
-CONFIG_QCOM_SMD_RPM=y
-CONFIG_QCOM_SMP2P=y
-CONFIG_QCOM_SMSM=y
-CONFIG_QCOM_SOCINFO=m
 CONFIG_QCOM_SPM=m
-CONFIG_QCOM_STATS=m
-CONFIG_QCOM_WCNSS_CTRL=m
-CONFIG_QCOM_APR=m
-CONFIG_QCOM_ICC_BWMON=m
-CONFIG_QCOM_PBS=m
 CONFIG_ROCKCHIP_IODOMAIN=y
 CONFIG_TI_PRUSS=m
 CONFIG_OWL_PM_DOMAINS=y

-- 
2.51.0


