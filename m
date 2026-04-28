Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE59FF886F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 17:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZqMEze76X1xNuYacnRcVl1H8LJPptNWPWYC9Sfl7TqU=; b=bXj/YWD85R4bKbz5FLvZnf6fax
	q4p6hlBh/5zSgIiaUUCIskG/7eWTOI5A0FuWtjDGBumJ3Lv3EXUMKxQyZ73+O2pRJ0zKg1SU33IHv
	xUVLp1+8/XUCUdigeWSwb5e4UK/ZvBaJ5PpAEpMrv5j3Nv+qvjnixAlSk7zHnsr4+3zCpzLX+h69I
	coIaV/GoawYKg5NBDu9smmZHaYJhGofeIyCsgaThNOFuxZWjRsNxK/FDY94LlCjL6s1NsgAKj8aHr
	ZNWYBePEjKTZjGWkGApneDCZ/dWmKZO5k0NAN4XOUQfbF580paujlHRLWZTXNWdmTRnCszLT6aRIN
	aPKQNT/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHmIv-000000021ca-3D5S;
	Tue, 28 Apr 2026 17:33:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHmIm-000000021Yd-0pcW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 17:32:53 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SFsjQL3979392
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 17:32:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZqMEze76X1xNuYacnRcVl1H8LJPptNWPWYC9Sfl7TqU=; b=cXO6su8tscFV66Zv
	9HpQrIGjUPgKemAm7AN+hy1OnacYkmXB9RA9jlKPE3A9AbDqkMPMRcX4tU7w3NXP
	9iYK4k27lbS9Xl382KxrAm18RiPJS/xo/LzYTaRVS8ye1GY0R1pSKH6cW+GYdEkj
	B246EY+94Hb63UaC+QfNlT1cJJicX+zYHklEXlhXE0TzoPtJQ8cYjpoRYLzqDkxF
	xw098wTNQ+5RP2As6WoEoK2iv/BMuYQn7l91BYFe+pUlOdvu4LzuK72RtIm4ZNcy
	BlEEweLM65DIWxvWn7Tr5yfMgbkKad87vFEQ7v359Onis4DU0IiuC/QA8vz2mqIZ
	E5/QNg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtgmsc8vv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 17:32:51 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50ff0bef198so73582451cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 10:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777397571; x=1778002371; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZqMEze76X1xNuYacnRcVl1H8LJPptNWPWYC9Sfl7TqU=;
        b=Mm4aizJxYha2OlaP6SjuLk3jb6RWckJBBmjrBbb8rJQTEJg+y0tBrPfIE9ROcKmLxQ
         xunrbQbI6zDyoiv5XHSLnLeFUBAnEFeIyFnb8WTi2R8ouK4nucDqVSjwaL8pcbp5/q7x
         6LhhGZQNRjDKnoIb2PzIYsbb+bvkZj96IkLl/OOF9lww2jFOaP9mQ8bxk8kxScGm/XJv
         veC8dcXFv3M0rvP3Lz2OGvGyrBL6diHhZVqvCd+PT1ipw721JPgwslEsiljM0zOhJQyZ
         CLrerQkse6wVLiECuLeHNXX0z3ymD0GxSnn8AoybAlK7olXPY1KC1Okt6zbpsALNbske
         Ca0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777397571; x=1778002371;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZqMEze76X1xNuYacnRcVl1H8LJPptNWPWYC9Sfl7TqU=;
        b=fV612DIpilb4HWTP/QMSNLyk7BrL7TOQr2HKY+mxjXROgxJkiPBL0xJXspz6rIusQL
         O7wlxvhYBrs1kWS5fifA6a6oDrBZ/msEA1M3Yk6XcKRyUoiprPafbP3tDD6hPKA1Dkvj
         wi7T1/fvci1AfQtuaePP2LW0e/5pnSflsSYMd7i+PMm/uyEPBWZLQxACZ1AUblF6MD7O
         hZetIk1+e5rnMeAa9mXo+vkBkunBlk9HPPBHPiW4KZVoCShfh3eRV7zkiIKZHIgYaCUz
         ruzYBtY+X0ngczlgLHnEk70BcNW8kfBeQ/6/s8Vr/q2DYqy0EE+D13ISRf46OmNIO/zn
         Er0Q==
X-Forwarded-Encrypted: i=1; AFNElJ9mrF8q1pMvkmiaxGht1yU4RheSeNmr9sF6a9CpSxM6S3EJaJSKu9STgZR3DwLJDQ/lBwVHqBOgu56UO5KpisUk@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4nYVDRPFpUPFoT1oW9BB+4Y5jGDlyojfhGYrqCosr7N7Usu7K
	Y/AE9/BCmhz23Bq/mqdLlEXgOzID08Ofe3G2okoKGSBSuZC21sEEy5zYd+p6cic5+MMmizSi69Y
	7Kx+kt/cX/7aiDOv28Ro7LdBw/gAERw1rVrwOFL0XHb0px9ckT62J2Viugy/lcP689fmdCUvZtO
	UmJQ==
X-Gm-Gg: AeBDievBRC421wXQ0zlhnoLdnfRGtR13omSh5+l0oErHtJ0fpjRAt5vbO2O+H1qJvZM
	ZYfoY6Ni36FjvjVZbw8y5LdtncFANCeYB4r+Bn34JEtx3BwAujVUkhhLnETLg3ZM34BaQ4+z5m5
	4erUm1kGlB9zIC3eG68A7fyZYyGYprk5HokCuGG7aY/wowHIi3g+bHTvBfj8+ZYagjJ7BLcE5fg
	40e9KJ2/uutrbuPXx8E47HtytXMwNmZvbjpzOfjxGZGbEAZmmvMW3F6k5m08cF1wdNC9TXURO0o
	V7/qqz18NRFdTij5Z+DPbmJYD4xM3gSsgt4+zJ20DaN2BM5/Q1yxKl53vkeb7JHerGviNoFN7bC
	4kBryFOKQBhzu3dgPLZ9x3M9uk2sWcbyO+QGSVvkxW2eIMzvW4tfl+Qw=
X-Received: by 2002:ac8:5912:0:b0:50f:b003:59d0 with SMTP id d75a77b69052e-5100e12587amr54650821cf.21.1777397570143;
        Tue, 28 Apr 2026 10:32:50 -0700 (PDT)
X-Received: by 2002:ac8:5912:0:b0:50f:b003:59d0 with SMTP id d75a77b69052e-5100e12587amr54650141cf.21.1777397569510;
        Tue, 28 Apr 2026 10:32:49 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7b8ce444sm2089545e9.0.2026.04.28.10.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 10:32:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 19:32:39 +0200
Subject: [PATCH 3/3] interconnect: qcom: Make important drivers default
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-interconnect-qcom-clean-arm64-v1-3-e6bc3f7832db@oss.qualcomm.com>
References: <20260428-interconnect-qcom-clean-arm64-v1-0-e6bc3f7832db@oss.qualcomm.com>
In-Reply-To: <20260428-interconnect-qcom-clean-arm64-v1-0-e6bc3f7832db@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=14546;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=rfVFsqmmJPTNTZeEO/Qr6YN70g0iVkVM45qtvX9E22k=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp8O858/RGFFrysltXJIcoNtgw9Yeq5SSSE7FxS
 KrN04rItF2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafDvOQAKCRDBN2bmhouD
 168kD/46dTvJsKUr6UB5XcieG/9c8sU17R7oGE25JL5vPWEko/mOOLyCJNtlwaYfGhF+qLuVg05
 ERpHd64hh5ZmZ0+JUWV2w5bXTXgq+SUlYKpfaF8dujuaHUwb1ROlfbF6vfjkTqp9XIr7QtbRbmE
 zlyssgwVc/QQ0Ub6txaJV3/E8gBi/7LAClJIXuMyeO5PwN+GDc8+IXO3TpOY3RmvAXg+2rviiID
 vbF/jvpyvvvKgm673SeOZMOXJRkHz+Y/26uhY2ZlafySQw0QaQebQImRlktLA6LYNE63+Mfz2GU
 TN3OHhdisN1Rz+PuHm7KwjJF9DPWJ8Z8EP826vUPqMKj+HaZjDxcDjYjeDVxGdj6+aOYniNV/h/
 OUaqJP+y33foVFskfme+Q37atsDOxIGKiyhTuP0q4bf71c1c/RROH8uv2RYWknQK1bZUsQyxdme
 SjPyMVZF5isVCo0bpF0eQFksvzKMrlhHmVWIT3si6reG2KYIcoyxhWc9wJ0iszvr7bfnIKE0C/K
 moVb5angwYzYXDG0/kk0rpljP4QTgqC1eCKPrAolyoOmNF3lUkmcowhh1Q2FUd17Aic0pl5QN3m
 geuq/VkpxO0cogI/4NEW5rFR43Uu1Lp4tAVFscUuw/1PCxfAxbZZs/nMPGGUhirmZQJISiLOqP/
 aBZYR4xOVffodbg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: FsCPjbsOXuCYqBMu0P2UgVFVEC_gqlg4
X-Authority-Analysis: v=2.4 cv=R4gz39RX c=1 sm=1 tr=0 ts=69f0ef43 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=rDSDKITe4z-rceAv86YA:9 a=-wcPzy_K7TQbbHLX:21
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDE2OSBTYWx0ZWRfX6kCSZtOLh3Kp
 iXiuJzev7RNnqG/LPSgWfu0YNhCQgTv9nnjC6ORyHNQZhrgUHI1qo9quGNMUm+5LI21JSoweNMZ
 f8wAFE+yjkamCVxgpAxF69OkNdwonHYzZDdwWx375hVaY2GPuyVCj1ZfUdc58JENwd8MMyJ2gKO
 b9zGxDF/5/h0MEBPGi3nOu96sS+G0g5GV7Cl6YFSSVQ0yWR72eu4puz0DM6UM+b872rRGTR4+Fy
 6DXt3nIrToz9cjfjkTPRStiaM6oVHUWZ+sj1aLjlIT2L7/Ns2Lbz+rvom42IegVIflOvFyIKH6X
 g8QEuuVT5sIc+NW8glaMPxtSFOkwJZhrJ4otnOCzXqWqj4Pq866wBHnl7bn+3fcAEAo+UT4scJ3
 eFN/q3KYmMgKztWigDn+Cr5wYcyrhMx/qjqXC4zN3zEG47HRBBAUEB231Q5RuP70LZGZPyq63QG
 xVTzjIc3phEOTljBSyA==
X-Proofpoint-ORIG-GUID: FsCPjbsOXuCYqBMu0P2UgVFVEC_gqlg4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_103252_254772_8D7D0144 
X-CRM114-Status: GOOD (  19.23  )
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

The interconnect drivers for Qualcomm SoC Network-on-Chip are covering a
basic or fundamental SoC feature: bandwidth management between internal
SoC blocks.  SoC can boot without these, but power management or
performance will be affected.  These drivers do not represent any sort
of buses visible to the board designers/configurators, thus they should
be always enabled, regardless how SoC is used in the final board.

Kernel configuration should not ask users choice of drivers when that
choice is obvious and known to the developers that answer should be
'yes' or 'module'.

Switch all almost Qualcomm interconnect drivers to a default 'yes' for
ARCH_QCOM.  This has impact:

1. arm64 defconfig: enable as built-in INTERCONNECT_QCOM_SDM660,
   INTERCONNECT_QCOM_SDM670, INTERCONNECT_QCOM_SM7150 and
   INTERCONNECT_QCOM_SAR2130P, which were not selected before but should
   be, because these platforms need them anyway.

2. arm qcom_defconfig: no changes.

3. arm multi_v7 defconfig: enable as modules drivers necessary to boot
   ARM 32-bit platforms, which are already enabled on qcom_defconfig:
   QCOM_RPMH, INTERCONNECT_QCOM_BCM_VOTER, INTERCONNECT_QCOM_MSM8974 and
   INTERCONNECT_QCOM_SDX55.

4. COMPILE_TEST builds: enable by default all drivers for arm or arm64
   builds, whenever ARCH_QCOM is selected.  This has impact on build
   time and feels logical, because if one selects ARCH_QCOM then
   probably by default wants to build test it entirely.  Kernels with
   COMPILE_TEST are not supposed to be used for booting.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

I propose the change to go via interconnect tree.  It might conflict
around defconfigs, though.
---
 arch/arm/configs/qcom_defconfig   |  3 ---
 arch/arm64/configs/defconfig      | 31 -------------------------------
 drivers/interconnect/qcom/Kconfig | 37 +++++++++++++++++++++++++++++++++++++
 3 files changed, 37 insertions(+), 34 deletions(-)

diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
index 29a1dea500f0..21d225836393 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -286,9 +286,6 @@ CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=y
 CONFIG_PHY_QCOM_USB_HSIC=y
 CONFIG_NVMEM_QCOM_QFPROM=y
 CONFIG_INTERCONNECT=y
-CONFIG_INTERCONNECT_QCOM=y
-CONFIG_INTERCONNECT_QCOM_MSM8974=m
-CONFIG_INTERCONNECT_QCOM_SDX55=m
 CONFIG_EXT2_FS=y
 CONFIG_EXT2_FS_XATTR=y
 CONFIG_EXT4_FS=y
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index dd1ac01ee29b..3134e11da028 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1874,37 +1874,6 @@ CONFIG_INTERCONNECT_IMX8MM=m
 CONFIG_INTERCONNECT_IMX8MN=m
 CONFIG_INTERCONNECT_IMX8MQ=m
 CONFIG_INTERCONNECT_IMX8MP=y
-CONFIG_INTERCONNECT_QCOM=y
-CONFIG_INTERCONNECT_QCOM_ELIZA=y
-CONFIG_INTERCONNECT_QCOM_GLYMUR=y
-CONFIG_INTERCONNECT_QCOM_KAANAPALI=y
-CONFIG_INTERCONNECT_QCOM_MSM8916=m
-CONFIG_INTERCONNECT_QCOM_MSM8953=y
-CONFIG_INTERCONNECT_QCOM_MSM8996=y
-CONFIG_INTERCONNECT_QCOM_OSM_L3=m
-CONFIG_INTERCONNECT_QCOM_QCM2290=y
-CONFIG_INTERCONNECT_QCOM_QCS404=m
-CONFIG_INTERCONNECT_QCOM_QCS615=y
-CONFIG_INTERCONNECT_QCOM_QCS8300=y
-CONFIG_INTERCONNECT_QCOM_QDU1000=y
-CONFIG_INTERCONNECT_QCOM_SA8775P=y
-CONFIG_INTERCONNECT_QCOM_SC7180=y
-CONFIG_INTERCONNECT_QCOM_SC7280=y
-CONFIG_INTERCONNECT_QCOM_SC8180X=y
-CONFIG_INTERCONNECT_QCOM_SC8280XP=y
-CONFIG_INTERCONNECT_QCOM_SDM845=y
-CONFIG_INTERCONNECT_QCOM_SDX75=y
-CONFIG_INTERCONNECT_QCOM_SM6115=y
-CONFIG_INTERCONNECT_QCOM_SM6350=y
-CONFIG_INTERCONNECT_QCOM_MILOS=y
-CONFIG_INTERCONNECT_QCOM_SM8150=y
-CONFIG_INTERCONNECT_QCOM_SM8250=y
-CONFIG_INTERCONNECT_QCOM_SM8350=y
-CONFIG_INTERCONNECT_QCOM_SM8450=y
-CONFIG_INTERCONNECT_QCOM_SM8550=y
-CONFIG_INTERCONNECT_QCOM_SM8650=y
-CONFIG_INTERCONNECT_QCOM_SM8750=y
-CONFIG_INTERCONNECT_QCOM_X1E80100=y
 CONFIG_COUNTER=m
 CONFIG_TI_EQEP=m
 CONFIG_RZ_MTU3_CNT=m
diff --git a/drivers/interconnect/qcom/Kconfig b/drivers/interconnect/qcom/Kconfig
index b2c4272ae48f..56abd679e8be 100644
--- a/drivers/interconnect/qcom/Kconfig
+++ b/drivers/interconnect/qcom/Kconfig
@@ -2,6 +2,7 @@
 config INTERCONNECT_QCOM
 	tristate "Qualcomm Network-on-Chip interconnect drivers"
 	depends on ARCH_QCOM
+	default ARCH_QCOM
 	help
 	  Support for Qualcomm's Network-on-Chip interconnect hardware.
 
@@ -14,6 +15,7 @@ config INTERCONNECT_QCOM_ELIZA
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on Eliza-based
 	  platforms.
@@ -24,6 +26,7 @@ config INTERCONNECT_QCOM_GLYMUR
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on glymur-based
 	  platforms.
@@ -34,6 +37,7 @@ config INTERCONNECT_QCOM_KAANAPALI
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on kaanapali-based
 	  platforms.
@@ -53,6 +57,7 @@ config INTERCONNECT_QCOM_MSM8916
 	depends on INTERCONNECT_QCOM
 	depends on QCOM_SMD_RPM
 	select INTERCONNECT_QCOM_SMD_RPM
+	default m if ARCH_QCOM && ARM64
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on msm8916-based
 	  platforms.
@@ -81,6 +86,7 @@ config INTERCONNECT_QCOM_MSM8953
 	depends on QCOM_SMD_RPM
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_SMD_RPM
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on msm8953-based
 	  platforms.
@@ -91,6 +97,7 @@ config INTERCONNECT_QCOM_MSM8974
 	depends on QCOM_SMD_RPM
 	depends on ARM || COMPILE_TEST
 	select INTERCONNECT_QCOM_SMD_RPM
+	default m if ARCH_QCOM
 	help
 	 This is a driver for the Qualcomm Network-on-Chip on msm8974-based
 	 platforms.
@@ -111,6 +118,7 @@ config INTERCONNECT_QCOM_MSM8996
 	depends on QCOM_SMD_RPM
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_SMD_RPM
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on msm8996-based
 	  platforms.
@@ -119,6 +127,7 @@ config INTERCONNECT_QCOM_OSM_L3
 	tristate "Qualcomm OSM L3 interconnect driver"
 	depends on INTERCONNECT_QCOM || COMPILE_TEST
 	depends on ARM64 || COMPILE_TEST
+	default m if ARCH_QCOM
 	help
 	  Say y here to support the Operating State Manager (OSM) interconnect
 	  driver which controls the scaling of L3 caches on Qualcomm SoCs.
@@ -129,6 +138,7 @@ config INTERCONNECT_QCOM_QCM2290
 	depends on QCOM_SMD_RPM
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_SMD_RPM
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on qcm2290-based
 	  platforms.
@@ -139,6 +149,7 @@ config INTERCONNECT_QCOM_QCS404
 	depends on QCOM_SMD_RPM
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_SMD_RPM
+	default m if ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on qcs404-based
 	  platforms.
@@ -149,6 +160,7 @@ config INTERCONNECT_QCOM_QCS615
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on qcs615-based
 	  platforms.
@@ -159,6 +171,7 @@ config INTERCONNECT_QCOM_QCS8300
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Technologies, Inc. Network-on-Chip
 	  on QCS8300-based platforms. The interconnect provider collects and
@@ -171,6 +184,7 @@ config INTERCONNECT_QCOM_QDU1000
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on QDU1000-based
 	  and QRU1000-based platforms.
@@ -195,6 +209,7 @@ config INTERCONNECT_QCOM_SA8775P
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sa8775p-based
 	  platforms.
@@ -205,6 +220,7 @@ config INTERCONNECT_QCOM_SAR2130P
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on SAR2130P-based
 	  platforms.
@@ -215,6 +231,7 @@ config INTERCONNECT_QCOM_SC7180
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sc7180-based
 	  platforms.
@@ -225,6 +242,7 @@ config INTERCONNECT_QCOM_SC7280
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sc7280-based
 	  platforms.
@@ -235,6 +253,7 @@ config INTERCONNECT_QCOM_SC8180X
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sc8180x-based
 	  platforms.
@@ -245,6 +264,7 @@ config INTERCONNECT_QCOM_SC8280XP
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on SC8280XP-based
 	  platforms.
@@ -255,6 +275,7 @@ config INTERCONNECT_QCOM_SDM660
 	depends on ARM64 || COMPILE_TEST
 	depends on QCOM_SMD_RPM
 	select INTERCONNECT_QCOM_SMD_RPM
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sdm660-based
 	  platforms.
@@ -265,6 +286,7 @@ config INTERCONNECT_QCOM_SDM670
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sdm670-based
 	  platforms.
@@ -275,6 +297,7 @@ config INTERCONNECT_QCOM_SDM845
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sdm845-based
 	  platforms.
@@ -285,6 +308,7 @@ config INTERCONNECT_QCOM_SDX55
 	depends on ARM || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default m if ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sdx55-based
 	  platforms.
@@ -305,6 +329,7 @@ config INTERCONNECT_QCOM_SDX75
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sdx75-based
 	  platforms.
@@ -315,6 +340,7 @@ config INTERCONNECT_QCOM_SM6115
 	depends on QCOM_SMD_RPM
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_SMD_RPM
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sm6115-based
 	  platforms.
@@ -325,6 +351,7 @@ config INTERCONNECT_QCOM_SM6350
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sm6350-based
 	  platforms.
@@ -335,6 +362,7 @@ config INTERCONNECT_QCOM_SM7150
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sm7150-based
 	  platforms.
@@ -345,6 +373,7 @@ config INTERCONNECT_QCOM_MILOS
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on Milos-based
 	  platforms.
@@ -355,6 +384,7 @@ config INTERCONNECT_QCOM_SM8150
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sm8150-based
 	  platforms.
@@ -365,6 +395,7 @@ config INTERCONNECT_QCOM_SM8250
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sm8250-based
 	  platforms.
@@ -375,6 +406,7 @@ config INTERCONNECT_QCOM_SM8350
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on SM8350-based
 	  platforms.
@@ -385,6 +417,7 @@ config INTERCONNECT_QCOM_SM8450
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on SM8450-based
 	  platforms.
@@ -395,6 +428,7 @@ config INTERCONNECT_QCOM_SM8550
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on SM8550-based
 	  platforms.
@@ -405,6 +439,7 @@ config INTERCONNECT_QCOM_SM8650
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on SM8650-based
 	  platforms.
@@ -415,6 +450,7 @@ config INTERCONNECT_QCOM_SM8750
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on SM8750-based
 	  platforms.
@@ -425,6 +461,7 @@ config INTERCONNECT_QCOM_X1E80100
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on X1E80100-based
 	  platforms.

-- 
2.51.0


