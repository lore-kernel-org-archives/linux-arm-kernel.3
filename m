Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 909B6C98307
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 12:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=71x7x3a3jvjtRysKXeUju2pROKPOWXEvD0O9ovjM29c=; b=iue3mlefuMFa6eb3JEc//y2wFi
	WhEhNfJ2cOdRBUVEzDyhxSaiVNi51IOhmlQHK+uPOTP2o5K/pzAVWEkIQZjCs7VLkMEUcCvjiIzPl
	m6TqrW80llKyO/x5tCGdaP5+utAWCU7unQjt5HoLA+bqfBIaMauGiIh63EoZBBLhXPjlT733MUROj
	+JkLYxmrO/FeWXStSFEpWHe8h42LtjbPwDeAThZJjt4fugImf8siS2cfB+yqqYmB+2dwxk5yCZ6i+
	7EUTquFBhkQzm+a6RbTSuDUvR60d3/WVtrcyR4rWcB2g2RsW0ADtnRTGy+FLWZclAlaQ4NKbxCWT3
	quAO7irw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x904r-00000005OFA-4Blh;
	Tue, 22 Sep 2026 12:58:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x904a-00000005O5Y-0vpY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 12:58:13 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBPaZJ2869448
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 12:58:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	71x7x3a3jvjtRysKXeUju2pROKPOWXEvD0O9ovjM29c=; b=Jnu3QQB8IPRGxFfM
	tJ6Av1ELS5xfKXzgEbIwMvlCSIb3Bq4dNkpx6iqYSP/A873wCvHRBezKTF94026H
	JfMpeak+lgmxYru92EmceSA4IR1Ooa1BA02TqTmEo4m+M1D6xAb7W5vH2VpOMMf4
	Ir608TsKahqUo7Y8FRc9mLey1UFdYgjKcMEz8gpIECkT+o/qDqz4/rGyNEdx5d4C
	XKf4rDiYca9KlMZeaG2AALrvHGeqgMxg3X9M7M40BMrfYqM40u2ESN1reL35el8u
	h9Odhe4BhtIiz+T00LS0MMfwBN+i/73HKnzWhU1a74RvzmVdWOpu0R/cJLDE3Js7
	+Q1eSw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guj112355-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 12:58:11 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c9c4d303caso2932225e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 05:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790081890; x=1790686690; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=71x7x3a3jvjtRysKXeUju2pROKPOWXEvD0O9ovjM29c=;
        b=YSPksB/mtkw3VSgjfZNT92933sJ+5NIqiGjDiH6ZZQhZt2qmqO8yFMKFobQQbR12i0
         lH1O/g5ubx4i2FUEaVlk+SbOfwu+O4sB/5X1nJgEGn64myDc4PcrlZNgVGeY0RxTsjRm
         M4vNP1OUcelv2hXjAWf7RWcdgavBbJ7E8ZaXchNJidaPJc0csIcbmvCwlVCpGN3Xjk/Q
         wZMYppTf0s3psFXrV0BoJAz1XwICx6ppVScdp6rXjyc2yQgt/tPCNHBctGhkOp96Xb5d
         TDeAm8G2vPe9+ghevddSjXnkqrhq+fQeMTOHOqEi+acr5rIa7C/+d4x3BgZdZ0NN+Z59
         8sGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790081890; x=1790686690;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=71x7x3a3jvjtRysKXeUju2pROKPOWXEvD0O9ovjM29c=;
        b=xXRcTeBdjlMkBN5XbQt48J2PCg21nif71s6kOE6tmBCzwQAU0uJEuNpxCFJXmFX6FE
         sAWXeA1/jmQ8y07WVagEj8OOv4WvlenBup7mss7ds7TJK5eixhoy+5E0+/hKWpmL2LLJ
         fWnimB+fgmAfXVEaZSTnGS5hNS+o55kHRKtX1kmbsafw4A5o4qlEd63KWMbiTZIY6XRS
         uUqCxyoJyUgaxAny6XLG9M2wgmG1y4dFoyAFnqUE27+52RUHPJYbMlvTbqDVAoL2I1Ln
         UTcvw68LU37JLkhY6+1mDYKbL6odh6CLxwp3sHPiSmIaT8uTipfE1TslArtSg1/t3ka9
         Djqw==
X-Forwarded-Encrypted: i=1; AKwUvBwiXkcvdgcQStJe8YvSiJ6eZq/KrzRisLEr1lE0LKWU2x+EIB+SS1RMDyoe7BNxzrjFVE1E/8rDHM4M4EZPIJbz@lists.infradead.org
X-Gm-Message-State: AFuF++mL+T2xB6c5u36331qKaLE4nWb2HoEOcNXV8xflzBhNdf4ijor1
	pBT/AaxnuRRhDeWGpLsTzrwjuI7kHWhQGRsgBu4l7dqfkb5A+wU4taGofonUL+bPMP3aCh8InMb
	RXL6wHtUNgp1NKSpuATz8sHA9IiidfULS55Sy9sesICYABRYK1110jrCHdA0Asl32uq4RQBNX21
	ZPEg==
X-Gm-Gg: AYBFou1KV8grpkFRyYotuSzWPYvpl94t13Ih1zS3PDc6i06nCauuyidXzTxbTqXP2rU
	/MALk3rZNipPOO/tjefX9h0XMF29vmUXdt4FU3krS7elsJAP47ZztduWFjPNk7zmz/+M6R4ZvOA
	k2nTbUMSzNUX+D4rjP2U8eOZwe3ptky/y5b5tvHWJj8AcXUo907JREPe6D1sOhi9DqonD8+4sQ3
	l2wbAmD9KZxvJg5tIyKAP+3iMApN4aD/GSKQJG9ZZNlMAZaKm+LVzAErsidM0zq8Lu71ZD74Eow
	eo5MZWEptgBM79O/DCNFfkBGvvamcwlf7YQ85K2DxK02wr2+QFRLV8nblMB6BljtxFJI583KxiC
	u5faFxvOnGTmGX9+DDCMH7/kP1WQ=
X-Received: by 2002:a05:6122:3486:b0:5c8:36a6:ddd0 with SMTP id 71dfb90a1353d-5c9b58e98c0mr8394487e0c.6.1790081890419;
        Tue, 22 Sep 2026 05:58:10 -0700 (PDT)
X-Received: by 2002:a05:6122:3486:b0:5c8:36a6:ddd0 with SMTP id 71dfb90a1353d-5c9b58e98c0mr8394408e0c.6.1790081889914;
        Tue, 22 Sep 2026 05:58:09 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5105:ff9:e148:c440])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aaa4537b5dsm1097669a12.30.2026.09.22.05.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:58:08 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 14:57:25 +0200
Subject: [PATCH v9 10/14] Revert "crypto: qce - Mark QCE as BROKEN"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-qce-fix-self-tests-v9-10-b1aa742e79af@oss.qualcomm.com>
References: <20260922-qce-fix-self-tests-v9-0-b1aa742e79af@oss.qualcomm.com>
In-Reply-To: <20260922-qce-fix-self-tests-v9-0-b1aa742e79af@oss.qualcomm.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Russell King <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3276;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=fY87isequqGi2vPc14TLa0uhOXluPBKFeKDCz57mcWg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqsns/UZaT9h/s9Gz6OgARZ9rzxMS3ZQgZpCzKJ
 nnFi47SzJCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarJ7PwAKCRAFnS7L/zaE
 w7j8EAC8IgQUzRusHQCor89biXLZV6riqEpya1oT3nHoywVTkIzWNMVa2TgdT3hX1JjSlLR4MbI
 YVQNujKDgZV2UoAkZzeQpm9dh0row0mW5SQuUZkaG5N54xR41VB969wvJaF1G2cfXAVCUa99UAc
 uhJJ1l6epPuUUAXQMylCIA30yqhBFWYre3FYHj+YURx0Gbf9x9yEnm+1tuwStNkc6piZEmLHogw
 VvnqttPj+07kyCTzTNA2+YSyOsLX5IqOxyk24BdLHXCwEBCrNDySCunebNQHRIMVs2fXe2vpZla
 Z04tjzFEyI34eopJ387OJhAMAFi5ATjiaEwSHIlX5Z+JUO7U7uQdcAtc0Eoe3ZaYPLtZUFX5CAv
 RbRcTqU1VHH05QX2XUq0ZHH1zcpGu6m5ILm2eNiK8rG7uqvPcR3M+kLdasd1mk/+dK4wKit70jx
 cFUjTh0TsuLoMmCQfL4FawROIHMxwh4DXLx3Hfvp4M/r6Xoyo+kDoT0ejcujTMk153FAg4adgKC
 lN44tH60s5gx9JoAxBM2C8Ux6IzAd5dp4WvS78w4ZaQZu2qEXnkB9bpC8ZedIHuDSZnXh6i43xZ
 0psjvcj48SOQT20dvEV3YFhSNKmeLh5/FVCMLzFoOnV7w8V7rYkKrlhGa9cTuc1gXQkXoml+HCc
 7nnehYVdqWTXyEw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: i5kRr_8L3TbwpEwixVaKYsQYPAMh9uaH
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE4NyBTYWx0ZWRfX+MIwPCgLpxZA
 Yn2GAkYU8ofb7Kt+kRgLU6MWiwhDBNwnzBpL9I+T5zdEl2fW4f6sdNyYYHS76lqAYmeMTGN6Apf
 g0kFNuKYMC0bWhIOe01w4XzOkJuHlnE=
X-Proofpoint-ORIG-GUID: i5kRr_8L3TbwpEwixVaKYsQYPAMh9uaH
X-Authority-Analysis: v=2.4 cv=atQnmiZV c=1 sm=1 tr=0 ts=6ab27b63 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=W_IakApU47TVE70GsD8A:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE4NyBTYWx0ZWRfX7wyOK9jfH0qs
 FJO95KiZ/K/vEFLogsWDVK7XeN+YhZLG35UceeAur7ykWqroVhk93SS+FvJKZmRr4FYObtSETSw
 9cgg6UEloblYIFAXxX9LfeCXUL6yiMqoJzsJX1YY1YirM1Ggn2+KKM6BoNgiS8P49oLhCk/8zJv
 GyYmrqlZnwmaQI86luvMgyq6DC8LM5h7NdzeLOc/IYdpsNUvSNVgIQjPUBKJxEdIe0ppWcrYN3+
 0mZXmz1EvdGKxNIWSQsmZhcNzaqzwEnqL9w6rCb0GD410Xnf5YiWrkvDnw7kyoW3sinKGva50UB
 GenUmKG1tFi11PqCY2HWCIFNtDg6I1WsatMN9joZwXgEiekIaqUNbaZHL+diRBM6aLq7B8W0rk4
 YFsVuOnf4jDEANOqHEvjM+3Lc8BIAVayF6WkNtZBmMxG6ljLiDq38GaFfo7HTdcqjT0A8xohBtY
 PQHcvcs9mtvKqiDmCtQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_055812_277989_41DEFADA 
X-CRM114-Status: GOOD (  19.39  )
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

The self-tests for this driver have been fixed. The crypto algorithms
are only registered if the user explicitly requests it with the provided
module parameter defaulting to false. There's no reason to further keep
it unbuildable with the BROKEN label.

While at it: update the Kconfig description by saying this is an
"offloader" and not an "accelerator".

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm/configs/multi_v7_defconfig |  1 +
 arch/arm64/configs/defconfig        |  1 +
 drivers/crypto/Kconfig              | 22 +++++++++++++---------
 3 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index f9b8dbf9318c9d4947e56ef0159311634bf0c1ee..2d6292f8cab39596b540084fbd8b30f4c25cd4ff 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1323,6 +1323,7 @@ CONFIG_CRYPTO_DEV_ATMEL_AES=m
 CONFIG_CRYPTO_DEV_ATMEL_TDES=m
 CONFIG_CRYPTO_DEV_ATMEL_SHA=m
 CONFIG_CRYPTO_DEV_MARVELL_CESA=m
+CONFIG_CRYPTO_DEV_QCE=m
 CONFIG_CRYPTO_DEV_ROCKCHIP=m
 CONFIG_CRYPTO_DEV_STM32_HASH=m
 CONFIG_CRYPTO_DEV_STM32_CRYP=m
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6ec8d3a69c98e0da38465010d11166bb0e058f4a..e80927f87ff26fe3f51db6409f509fb99ad614a0 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1949,6 +1949,7 @@ CONFIG_CRYPTO_AES_ARM64_CE_CCM=y
 CONFIG_CRYPTO_DEV_SUN8I_CE=m
 CONFIG_CRYPTO_DEV_FSL_CAAM=m
 CONFIG_CRYPTO_DEV_FSL_DPAA2_CAAM=m
+CONFIG_CRYPTO_DEV_QCE=m
 CONFIG_CRYPTO_DEV_TEGRA=m
 CONFIG_CRYPTO_DEV_ZYNQMP_AES=m
 CONFIG_CRYPTO_DEV_ZYNQMP_SHA3=m
diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
index 0189dfdcbbe11098ead0ea194293422a31d8fe65..adcbe15851899917fb3039efe89a77c8fe712bf1 100644
--- a/drivers/crypto/Kconfig
+++ b/drivers/crypto/Kconfig
@@ -527,17 +527,21 @@ source "drivers/crypto/marvell/Kconfig"
 source "drivers/crypto/intel/Kconfig"
 
 config CRYPTO_DEV_QCE
-	tristate "Qualcomm crypto engine accelerator"
-	depends on (BROKEN && ARCH_QCOM) || COMPILE_TEST
+	tristate "Qualcomm crypto engine offloader"
+	depends on ARCH_QCOM || COMPILE_TEST
 	depends on HAS_IOMEM
 	help
-	  This driver supports Qualcomm crypto engine accelerator
-	  hardware. To compile this driver as a module, choose M here. The
-	  module will be called qcrypto.
-
-	  This driver does not have exclusive access to the
-	  hardware, causing races with the secure world.  It
-	  is also slower than the CPU.
+	  This driver supports Qualcomm crypto engine offloader hardware. To
+	  compile this driver as a module, choose M here. The module will be
+	  called qcrypto.
+
+	  NOTE: With qcrypto.do_register_algos module parameter set to true,
+	  this driver does not have exclusive access to the hardware, and may
+	  cause races with the secure world. It is also *slower* than the
+	  CPU for the same algorithms. By default it will not register crypto
+	  algorithms and only scale down the interconnect bandwidth and disable
+	  the relevant clocks. Use qcrypto.do_register_algos=1 at your own
+	  risk!
 
 config CRYPTO_DEV_QCE_SKCIPHER
 	bool

-- 
2.47.3


