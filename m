Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC0BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 13:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iBDVxtwo5G522sp2YomwpfimJG3Bg2W+ONywALKIPQs=; b=fJAva1x+r/fsx5Otgx8nQHiGbg
	cGkFD7KYLkOf+E2FmzOO9gD9wz1raIvdATjustg6dPWm4SAxzodKlw5gzynvlhDg3tB5qo+107QzS
	VTC+iH55+Oqhw3DHaedfCXVZ2oVkJ3cztB42p6VWZWxlwQqrizAWFqGYbDpiObfz8R2oEyeM4e391
	muxHR/NodmiscSsH9hD8ts7BYjIDeqN9TBtfg8N2NKO8S+yjaKbjolLrjbHGCVD0z4LBhbNX2Frkw
	NS4nMp4b0V9l0AE0pUIRdcwIHyLSc+vnf0GLZg/FcXdGHhELudQWlIb0TIu+LDZkeNpdBSxuPKUq3
	9kTox17Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiXiG-00000006Zgn-0fCL;
	Sat, 11 Jul 2026 13:25:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiXiC-00000006ZeR-2nlL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jul 2026 13:25:45 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66BAo12B3723385
	for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Jul 2026 13:25:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iBDVxtwo5G522sp2YomwpfimJG3Bg2W+ONywALKIPQs=; b=ka7rUrs6/xqjYSFn
	vjEKpAhTmyML7ay+HEAZ6lOYCG0Sp375uzFsqQeqmzdhrL7wbnPf6aQ0amM4l64o
	n8hRCM1PRPv6WCZd7ERUH5BZoVhzxnO9afsZcuMHqRsXR3aD43TOd5rxWKCgH7+Z
	h9SeD/hogE488Dc78wURZ0MddJG72+gt2jxcPpUpYEZhiCRlOl768/QWl1o+3wbC
	gr4RZDVuOBx9iupHjqnk02TUW3pbXPxZcsd3LgtXYyeQQMBb09HvbdhU73sf9QXy
	OaKsnP6J32dAIP6r5W7Moy+01DVz5hUddUcHs/chkOrAUSeaorEhNFhpmzg07+nd
	fmVQNQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbeaf8urc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Jul 2026 13:25:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e4f27f49bso177072985a.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Jul 2026 06:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783776343; x=1784381143; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iBDVxtwo5G522sp2YomwpfimJG3Bg2W+ONywALKIPQs=;
        b=O67t5/1uHhhA6wYVXyCg3ej/akUIP/C+oBJ1tJ76JNw3gH2AoqVLrYwYM7I1UjnvP+
         9YghNqG+L6exKsab8C6BTkB5JJBhgSYyH6yGvTgWYFwCyk7rD8dbOZ02rIJGFZoKz8wI
         4CaCfHY29Sy5znGphofPZycJRlIUwQGvGEoLSOTnMTmAlMeLHJ/QZM2X4f2FyGIn1g6N
         a0hR4F3aCAW6LNp117KEGQvD6wSefLcjZPtGq6+B0bBBfxrbtLQs4Yr4TxA9qXugU3/M
         LIMIDkeB19UhQhPW8T4sqrMT6znpcbdTlQjAa+bH91Wi0hye33sjfdPRfL2tZD9kTRDk
         Xsxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783776343; x=1784381143;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iBDVxtwo5G522sp2YomwpfimJG3Bg2W+ONywALKIPQs=;
        b=chZ9EbqPhyoFZ1Ga/ujs+ipq7+xpFLECdtGsWe44MW700025Xmf9NSyWCBv+SS1hIe
         7W0qizmVBG9YzXSbI1XwDtcxyBdCVWfMukwE7ehQlGYtcCzXqsHIC8CS4zSEQzuGLZMy
         wJMVlAhtYk+v9Qaj+C7QalaeKUYBuFIB38JGz02yunG7wNoS71aVN9JkU56o0EJsldHh
         DU9BrQ0N0/sRbwFD1aI3wOHusiFlZ2h3NbWG7g0OPCbAQoAx33Uo3Q32fPIvpbAGx2tl
         KCfLl6JMd14lqja1iI+RfGBpHzQTTx1cvsNEmUGG8GQpT8znUgdQB8oHf4hW1qe+n4SY
         /uBA==
X-Forwarded-Encrypted: i=1; AHgh+RpwwZrI3awWOnFx7sNuMUjAEj09dnfKB6pteQd2w3BJMrz+QkfFPV9sAroZDoNLOsXKw4+T/dF9N8B3TAMEKR5c@lists.infradead.org
X-Gm-Message-State: AOJu0Yzg2tLM4utf7DqUREPUHV8a+JhfBonbHd7RV9ulLvKFrpOM32tB
	BZYFnwiTx+HIar8NgIfF4j9fM09DMQSNOPZ6gf4wi6CzfxWBh+ujgLijzjTetH8WLvJWMvkcyf/
	PNFi0VCMGETTpZp7iv9sy6ptoi3hMm31a7TfxVky2GEXV5YPj9oB6VluNPKUWUgy+uOhoR+723L
	zb9g==
X-Gm-Gg: AfdE7ckb7oZqWVewOEH+rt3kG/IlQWa0GZj8mJJ1vadbWFY+gHJ2PKc/2ZpilUmh0yv
	BwLyIjbePcje+1XEl2xf7YR+I7t9Atl5hegKrnPMHffOX3EGXIs1rBQJZR6hTm7ck9dE2Z38pSp
	vVSatcOl8aR9rIy+9JKd4+Xn8pd9PXhpZ8ZMJ00uD9pd1RbcQaFlQhRAM8m2/Jc+U+8n3brKZ1o
	9icJhKhe7z6iIIsTWNiCmN+LQAuMd30ZidfVSCQvv5LqxX/9RdkJHO1iS/Npg2ELeFwNRxZe16+
	Lrr5PGa0efUECczntTjF+LZDQU823Z6cM0q421o1X9Bd4CKbh1kbaO1V0Z6QUUuXvjGlR/VLjJb
	+AfWzgZXJzOuaB5OiN6z9JJPFazes/e8bE/k=
X-Received: by 2002:a05:622a:302:b0:517:6350:ed50 with SMTP id d75a77b69052e-51cbf280b74mr27809191cf.45.1783776342864;
        Sat, 11 Jul 2026 06:25:42 -0700 (PDT)
X-Received: by 2002:a05:622a:302:b0:517:6350:ed50 with SMTP id d75a77b69052e-51cbf280b74mr27808931cf.45.1783776342410;
        Sat, 11 Jul 2026 06:25:42 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d843csm67915265f8f.14.2026.07.11.06.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 06:25:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sat, 11 Jul 2026 15:25:05 +0200
Subject: [PATCH v2 5/5] ARM: defconfig: qcom: Drop Qualcomm SoC drivers
 with defaults
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-qcom-soc-kconfig-v2-5-4a907e064281@oss.qualcomm.com>
References: <20260711-qcom-soc-kconfig-v2-0-4a907e064281@oss.qualcomm.com>
In-Reply-To: <20260711-qcom-soc-kconfig-v2-0-4a907e064281@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2578;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=trZ/E4XO26da/mhSb5ySVVyndUZizSNk3tZ3uomkL08=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqUkQ1f4RiqpM0ITH/xryaAJr9qgCLPwsVUHAOJ
 S0smNtt692JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCalJENQAKCRDBN2bmhouD
 1yyTD/9fo4hEfWZLWYdwoIT18lw5uGPdnNcv4EEVDTdbusW3Wk7Q3kj/Ao8Gxeu3xVTW/oUoVT7
 0lK9FNC4LY2NeiYhtVIeHH8sKn4c/N6CnYlymMm5rzD9VghRsSD/iiBRbKXqnxUr2yFY1t42K9K
 Frog2+v0nP/fgbM6STr8QINxFO/vcvr8aAXtJSmO8wOII4wo5ftnM0y80EbRk3P21f7fw4+SBtN
 wbenZDUdsLktim5x4mhiPMQCEEI+24EBcrnNo3RN1ypivQUfuM7P//6zgXH3gtqpiEiG7NkYLsS
 VxvMThuIYi4ALuylEeNvb3HXn1e63gxjDVzAT6/T8tIGMd8ISV2gZNgNDixB/GePyTkjeqY2OHy
 e3biRP/M9I0useKfC+y28Wk6NmpmSMKhlyHL0NtMoaBNhi1/Z6XrLOy/N+YtvU+u8B/Fwx0GHK4
 ieIcftFVxS+4mPWbcqFArfSas6OgZ/imal7jB9eix6UkYxdgqSUWMHFfcH9ESUEv3CA3ZmmWkOi
 XYvfgFdHsmc8sxWzb9PNZfgQZmhghYi0nAWRQxQgY6BgYaHLycgdwh5nKa5VW2JkBu714hYEL9f
 TIMmCjv5+E9be+NVgpno12P+LPgL1f54VXwxUkAXkUXne2bLp6sAzbar7wSt3ajMQesyGr06ZTn
 mSyo7V8DuLMyOBQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: cGm67retTRS5MONEBItFz-YgUlEF4Mxg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDEzMiBTYWx0ZWRfX3ASXI3scVaWy
 kVWE8LIOZZQTifb2eGzWJFSssQQlacIC7d/xXCyBaHIk5uEXRYZcc6YRI8QJhEXS5cc3pJM/KjG
 ICo3SqcrvJwlx1Muuein4wwcdrPGeQ4y5jlHEwtu7voLDICaD64LsRTS9bKuYeY/os5CSWxG82x
 VfJm/GScraiP5upJxvRLfqPZJIcVydU9YcliTbvC9s7i5Rzg0cJjtEWnoIS/ppXBgvKw0Ygk6zP
 ynWQvoxSu1sHh0/BhgjVupKt4qO9D4sJGupGub/Jd0hYRsgH6Y+Pqa5rNKxlkcZ7sGbTRSfr1Zx
 T0NGohBNpk1vOYzDDNeDvm6qPS9Zuogee2HFT/vmKKp3gFvyE85T73UikH6AIqJTYG1PFS1hODN
 Dio0NnK0+HWbcpVcCrK1HJzwXpQljNmTalwwWl/K53CCy6Bi075TzeQQ8iR2XvL67tLjy1Sso/I
 Du+vd02uzXgTdrv6fJQ==
X-Authority-Analysis: v=2.4 cv=O5MJeh9W c=1 sm=1 tr=0 ts=6a524458 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=gBdK3KNpVRY46ggoUIgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: cGm67retTRS5MONEBItFz-YgUlEF4Mxg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDEzMiBTYWx0ZWRfX90Pal83pbNWR
 ezboPHxh+wsE9jteX9IzMv4qnDUvdu9ILh9qQOTiTwJvLo6h4ZIcz3SRDlEMb8BFPQcBgPV0Uyc
 zBSq7fiF/2lyVwLot2gvvFLDtXiwVRY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-11_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607110132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_062544_724398_009BCCDE 
X-CRM114-Status: GOOD (  11.03  )
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
index 2d6292f8cab3..9347998e495f 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1141,17 +1141,6 @@ CONFIG_ASPEED_LPC_CTRL=m
 CONFIG_ASPEED_LPC_SNOOP=m
 CONFIG_ASPEED_P2A_CTRL=m
 CONFIG_QCOM_COMMAND_DB=m
-CONFIG_QCOM_GSBI=y
-CONFIG_QCOM_OCMEM=m
-CONFIG_QCOM_RMTFS_MEM=m
-CONFIG_QCOM_RPMH=m
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
index df0a0ce5b097..330d28ecf7f7 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -235,16 +235,9 @@ CONFIG_RPMSG_CHAR=y
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
index dfc52e32802e..bb6afa8a6396 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1645,25 +1645,7 @@ CONFIG_MTK_CMDQ=m
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
2.53.0


