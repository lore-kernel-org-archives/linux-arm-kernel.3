Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A71E937F2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 17:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3T4p9Po57gL8RRR8ofgCbqP4BdGLIjWvMreG0U33+sc=; b=mWWIwDNnuoswktMGawoZzFrNGo
	rIBXBi8AlVMV9jw1BxcI5h8FXR7tuCSTPM9TL1hgVba4JlYauC1R1KYbO+LSqEZuGJm4tcW8PSprT
	UO3M/2QrFHVHtjjCrlAsmLQmQZTvIftoiBZb2OaeLRGi86ywJtwL3lytYLsWOAe3T99mP4gW9TUb1
	N8CMn4j67tybR15Vsm8kWyYeQo/1S5eXRKfl9/txU3eQef0d6uy36F2OXAM4Vo5u3/CNEl1uqo6fi
	Mx7yK/Ofgap3sHG0RmLJBC7RI1EFENquIXAFy/MZhJXPON76wH9UOyHxk4ADoM5iAUQd06wwyiARK
	pYoJzAaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wByMo-0000000EWS5-0wq5;
	Sun, 12 Apr 2026 17:13:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wByMk-0000000EWPp-0YzU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Apr 2026 17:12:59 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63CE4sGU3561252
	for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Apr 2026 17:12:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3T4p9Po57gL8RRR8ofgCbqP4BdGLIjWvMreG0U33+sc=; b=H5WGEaYlfX6UnXnq
	D9VoEbtRUHEvk+51jV3qYC7Sum8xgffF56MwUNq0J/pbXNfQ/0t5J0eHcqWurUXB
	Q7JwSuWjDFuVJd76+uL6a40cykuLDSdyPXQyoTAoNyLrne4OdnRzjcn9gzRJJNdx
	rPDQBEC/2KyBuda89CUFloqU4f2FUX4C+N0VcsUYvsDesZL1/CrWe57IudQfRw5l
	1ZuDDE5PcmZcvWahvpLvNA1ob+j0DdkeKrbaJ67y1NeRMfItVl/3UzvYV5zgF/Xa
	ZSDXDbZlcym1wEGFfByWlkvyvgtgnayCJaOmzArGvfR8NVIfDS+uIJi+HgB5oaAn
	+pw+dQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dffb0jpj0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Apr 2026 17:12:57 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d9a6a853bso90721001cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Apr 2026 10:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776013977; x=1776618777; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3T4p9Po57gL8RRR8ofgCbqP4BdGLIjWvMreG0U33+sc=;
        b=Y2MMxyvqLRhuO9Fa1wG4wALmTcGRSaJRvY87fxjXn0mGpQGOXzQZ3Ltlnc1TRwbxqG
         zBMaRy8bNK5/odTIvmK0BDST8IrFBnmCMaK7TpyHyITvIMHmTvQbMhDkN0JvfDh+hxgl
         5YWOiyfxHlFDsuPaA66w5m6k5uhoQ9F+X1KsqDleOAEXlhGDy6gqFG0ONVCLxcy/aAa1
         aDjUTlGxBC6kf8CJ+vla3VX8ZTkierpjNpmi/VjrUNIbR+6KtDKAF8ltgs5kjlF7c94T
         Dk4nxSWzBVMPRNXRFtd262tkcTWkpDxRrSQ/BsHNAgk3NNwHSBtbL6vcTWIqalQVwzL6
         0fiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776013977; x=1776618777;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3T4p9Po57gL8RRR8ofgCbqP4BdGLIjWvMreG0U33+sc=;
        b=jEqIFcZhHmw26fhNWChYjtZ9dHObAMJ0fEmssTzvYTkcXBrz0+DxoaFBA5Y3aQEb9R
         Z3Hvke6LJILL1Uj/TIFXvRdB8T9t6kuRAF6CgJIxRCyCcGpXeaSI2dv+ZuhyrLqxibY9
         oMmKltED8GZ6bUkzcSskGPg0n+R+KZ3Ab+/4npjh795a/DaI0vIJ3Si2NOU3M6FbLVev
         phVzl4wSJe8LB6fAc3qlj+1j0YBXMu33vjfT08/GMhGFnWh7sJrPRSPPIwBkRGZw2zCz
         cvMBFBO1FZ7AyaSUrCzATmVMgnhQkLLQBJ4+MzXKzVUUE/4bYyvnTbqQszpZcayIRigC
         msEA==
X-Forwarded-Encrypted: i=1; AJvYcCUnskdelb5faaKPmOP4cFdvmDpcAWGO557htDsMho9sGIGECmAYdv/D4p/FUrwQK9IOd/FAVqiFEsZBk9Yy+Bue@lists.infradead.org
X-Gm-Message-State: AOJu0YxkMRx+5J40NpqPVvdxney4eMNyOfNYBo/8xbA1Zay5Pxy3SzSJ
	o4k4UinuYpMtBN5eCKpejb6cRCBuCQ+iX+Wl/V5Nz45mNIYhi6rnfoPFc0BwU6ob8NoUdUdUews
	Y7gbBk7lIw4D/tQ10YQyN0AxUa4375S6rOYxURMDIGKatAmBC2E9mL52wExWLy2EFt6SOTQWmI4
	wkHw==
X-Gm-Gg: AeBDiev53FD5jtpsNcRhu9lyK7j2cA17JPawCUmzYIZ1ReJ4iYi6AkeBUxsDl/5Mn6b
	WOOhR3j6LUJ8nb2oRtTTl+LyEXOoO9eXQ1bFEXPbPyG1sG3jsVsb7B4e8IYEYkfRsaziv+du1Q4
	FM8YyL1wZFRkBzCuqg060vHlMAXLv4jjTj9b6+qwjjIu6sWS9YHLWjFtqBggI5ZS2003IP21SPt
	ptJLXcgfS1Y4ZT5rcHjJKAOue/f+F93C29EH/McCMn1+7rE2qUMnT3pWc1U77l+iQGnSi7TvlEM
	eZudxWRKfI7+tCmDXI+A5XRTNxeZ2SZDV8l2C+LYZtLPgk2C+mPI0V6xTHUjz8rJJ9NTdGtQQLQ
	YwvrgWIMU+RiXe5DF1QN6iwrNKUEn7WsUIFkcMRXF1aaS
X-Received: by 2002:ac8:5843:0:b0:50d:8d0f:a507 with SMTP id d75a77b69052e-50dd5baecb2mr162145991cf.45.1776013976554;
        Sun, 12 Apr 2026 10:12:56 -0700 (PDT)
X-Received: by 2002:ac8:5843:0:b0:50d:8d0f:a507 with SMTP id d75a77b69052e-50dd5baecb2mr162145581cf.45.1776013976079;
        Sun, 12 Apr 2026 10:12:56 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63de3499sm23715547f8f.1.2026.04.12.10.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 10:12:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 12 Apr 2026 19:12:45 +0200
Subject: [PATCH 2/5] ARM: configs: Drop redundant I2C_DESIGNWARE_PLATFORM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260412-b4-defconfig-multi-v7-v1-2-e76de035c2df@oss.qualcomm.com>
References: <20260412-b4-defconfig-multi-v7-v1-0-e76de035c2df@oss.qualcomm.com>
In-Reply-To: <20260412-b4-defconfig-multi-v7-v1-0-e76de035c2df@oss.qualcomm.com>
To: Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>,
        soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3603;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=jjIEBMQ8waMqMWAZa0PumarSPjZYZOqQbKDr0oElp8s=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp29KO10ougV1FJoMvqmzP/pO7HYyUIFjsgXMan
 6UvpE4W4sCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadvSjgAKCRDBN2bmhouD
 1ziiD/43A+Y5ILBAY43ub/OOhpW6/2Am4oy2oBK3PZe/MvPqpJ5+Tc6dtSpa45S6r/favOs5ijq
 ompsMapLtmQaCt1EIhOvjCEAmtPYvmSbBHcTW0egVOQ1awGTNyne0zEjlvdYxc1JWe4N7+6blIx
 7L8OPjtZKG0H5LIFvGgQGF8CokLW7M8ELuD6HvrjF6Vz+On8JW/YY4Qm+6ZObuA+Vp6J8EawHSU
 vcskD2KKh/jdfyau9mNWjdUl78fdPBZMYUJGliJ6YLZNmwbCq2TkNB87ErvtlY7s8oAH8sLhvN3
 mOv46TwLROZezfr5rlwvxOjUtrmanBcpVaaYJ6QOCFDhbig49Uq+hBvVehT/l6Ffs5KOdtfIlm3
 ej5Fqkp58OZ0YsOzlbq9zwzeyz+wCpB2xti16vwRtfU43dFdyyfFjC/honmDKa5nAVOCpcVbKd5
 m9ARPDN2/mnmoxziB1E6T684bG0Ggs6mxhkD+mqgndcHw1nCv9w7gk6SUFWE1B+hU3PGvWExBYW
 JAKwWDh2PSNeHqxx0MPjGyXUNCTmbz8js8HvPQ1CnyBupNBTngyvodDT06gFRV9MkkhRU1xkcHS
 FA+4JVouCgi5GL/ElG7gDapuH6vScUzAe/77ZrhuTowIkh7WuNAVWMGNESOaj+haHzYKnUEWox0
 3h6KVvevLESNrhg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=YfmNIQRf c=1 sm=1 tr=0 ts=69dbd299 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=knklNFjf03hsu1HMgqoA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEyMDE2OCBTYWx0ZWRfX+xkIKvO08jCz
 JTnMOTcxUZFQyEFXyXUDlrgAsIkb6dRzbDfoSuGYx5axh5U72RUiJMQ467L4MWwWh1CVu+q3ixr
 qgzOSvTPe9Q9TABL/STxUhAuI6BZ6+xlcYRsgzoe69VU+no3RIwxR8RNQOk51XQiIGDUDxA/iAo
 mFBr4DZdwZ7r6+Gp3zlZxNO76sb90JlJuz1Ygwoky/6vXHdE/bJxMnU8XNQMWpic6xTnlBDXBpI
 i06zmDj7uf6jK3WjG7g7Z+Wd9P+yZtd2njHbDPyarKfWbGxXezkp3u4QEZDrCdWNaAxdGZoeEU/
 rqh8WL93YR4K0ZCv+WIf3uk4C8cPRs4LJK8Uae2F3Y1JhL4ziQqqgVH0fYpsLQwclUeNDAltOI5
 eB27+xWdSBKyYrsLKG2BC2hwLEnboalqubLwAN8nXHxGNb9subgflD6jBTUh4Uu+BsJo1POBdOZ
 Pb7WjgCxo1obQZQqb3w==
X-Proofpoint-ORIG-GUID: GUeTLCNP509WF_uN8ZYdkImqbPJpJ0T4
X-Proofpoint-GUID: GUeTLCNP509WF_uN8ZYdkImqbPJpJ0T4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-12_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604120168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_101258_180706_389DF655 
X-CRM114-Status: GOOD (  12.52  )
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

I2C_DESIGNWARE_PLATFORM is default=y via I2C_DESIGNWARE_CORE, which is
enabled.  No impact on include/generated/autoconf.h.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/configs/hisi_defconfig      | 1 -
 arch/arm/configs/multi_v7_defconfig  | 1 -
 arch/arm/configs/pxa_defconfig       | 1 -
 arch/arm/configs/socfpga_defconfig   | 1 -
 arch/arm/configs/spear13xx_defconfig | 1 -
 arch/arm/configs/spear3xx_defconfig  | 1 -
 arch/arm/configs/spear6xx_defconfig  | 1 -
 7 files changed, 7 deletions(-)

diff --git a/arch/arm/configs/hisi_defconfig b/arch/arm/configs/hisi_defconfig
index 384aade1a48b..dde9cff951d4 100644
--- a/arch/arm/configs/hisi_defconfig
+++ b/arch/arm/configs/hisi_defconfig
@@ -43,7 +43,6 @@ CONFIG_SERIAL_OF_PLATFORM=y
 CONFIG_SERIAL_AMBA_PL011=y
 CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
 CONFIG_I2C_DESIGNWARE_CORE=y
-CONFIG_I2C_DESIGNWARE_PLATFORM=y
 CONFIG_SPI=y
 CONFIG_SPI_PL022=y
 CONFIG_PINCTRL_SINGLE=y
diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index c477454a4694..4f3d1fa99887 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -420,7 +420,6 @@ CONFIG_I2C_BCM2835=y
 CONFIG_I2C_CADENCE=y
 CONFIG_I2C_DAVINCI=y
 CONFIG_I2C_DESIGNWARE_CORE=y
-CONFIG_I2C_DESIGNWARE_PLATFORM=y
 CONFIG_I2C_DIGICOLOR=m
 CONFIG_I2C_EMEV2=m
 CONFIG_I2C_IMX=y
diff --git a/arch/arm/configs/pxa_defconfig b/arch/arm/configs/pxa_defconfig
index c51ae373ca88..2d5f5dfe5af6 100644
--- a/arch/arm/configs/pxa_defconfig
+++ b/arch/arm/configs/pxa_defconfig
@@ -278,7 +278,6 @@ CONFIG_I2C_CHARDEV=m
 CONFIG_I2C_MUX_PCA954x=m
 CONFIG_I2C_MUX_PINCTRL=m
 CONFIG_I2C_DESIGNWARE_CORE=m
-CONFIG_I2C_DESIGNWARE_PLATFORM=m
 CONFIG_I2C_GPIO=y
 CONFIG_I2C_PXA_SLAVE=y
 CONFIG_I2C_XILINX=m
diff --git a/arch/arm/configs/socfpga_defconfig b/arch/arm/configs/socfpga_defconfig
index f2e42846b116..19a8e30a7b22 100644
--- a/arch/arm/configs/socfpga_defconfig
+++ b/arch/arm/configs/socfpga_defconfig
@@ -84,7 +84,6 @@ CONFIG_SERIAL_8250_DW=y
 CONFIG_I2C=y
 CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_DESIGNWARE_CORE=y
-CONFIG_I2C_DESIGNWARE_PLATFORM=y
 CONFIG_SPI=y
 CONFIG_SPI_CADENCE_QUADSPI=y
 CONFIG_SPI_DESIGNWARE=y
diff --git a/arch/arm/configs/spear13xx_defconfig b/arch/arm/configs/spear13xx_defconfig
index 8b19af1ea67c..6712ae741c19 100644
--- a/arch/arm/configs/spear13xx_defconfig
+++ b/arch/arm/configs/spear13xx_defconfig
@@ -63,7 +63,6 @@ CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
 CONFIG_RAW_DRIVER=y
 CONFIG_I2C=y
 CONFIG_I2C_DESIGNWARE_CORE=y
-CONFIG_I2C_DESIGNWARE_PLATFORM=y
 CONFIG_SPI=y
 CONFIG_SPI_PL022=y
 CONFIG_GPIO_SYSFS=y
diff --git a/arch/arm/configs/spear3xx_defconfig b/arch/arm/configs/spear3xx_defconfig
index b4e4b96a98af..b96baa63fd58 100644
--- a/arch/arm/configs/spear3xx_defconfig
+++ b/arch/arm/configs/spear3xx_defconfig
@@ -43,7 +43,6 @@ CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
 CONFIG_RAW_DRIVER=y
 CONFIG_I2C=y
 CONFIG_I2C_DESIGNWARE_CORE=y
-CONFIG_I2C_DESIGNWARE_PLATFORM=y
 CONFIG_SPI=y
 CONFIG_SPI_PL022=y
 CONFIG_GPIO_SYSFS=y
diff --git a/arch/arm/configs/spear6xx_defconfig b/arch/arm/configs/spear6xx_defconfig
index 7083b1bd8573..dba3bf3fa19a 100644
--- a/arch/arm/configs/spear6xx_defconfig
+++ b/arch/arm/configs/spear6xx_defconfig
@@ -34,7 +34,6 @@ CONFIG_SERIAL_AMBA_PL011=y
 CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
 CONFIG_I2C=y
 CONFIG_I2C_DESIGNWARE_CORE=y
-CONFIG_I2C_DESIGNWARE_PLATFORM=y
 CONFIG_SPI=y
 CONFIG_SPI_PL022=y
 CONFIG_GPIO_PL061=y

-- 
2.51.0


