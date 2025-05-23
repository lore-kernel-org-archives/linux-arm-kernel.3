Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB3EC54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 11:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wQNTYFxJcLThg6miRUZ20/4ovosP139mFHxX+RSQDfw=; b=ASq5OvoJaoAXDbOE6VVlrXY8sj
	3RieyzEXxOdBYpnTA8HLAv8ID02Y8YM0cLmRVkrEOQjvzixFY0RA2j79CabEsq+xrycrHHZki1xw2
	U93yfNWZX5a21w+RnW+wKTK7pTSU5nv/IOizUWZY7O1DwNyVkslvQ1a32NFcCHu6ENH6j6FxJe9Ty
	7hqq3vm3V2KV1ANg/kqUSUMs7ZCGbT2+i0bAKNGfVbjdnWm5cqmClDJzwAoopOL+8GAV+ANxwSYn5
	Xs51mW17jcXGbsrL2/OuTpmlSyGVhlaggBGN9b59/I2gTqU86s+4LR8hAKROslVDJPV8n4Q7JaaNN
	Eb0C61oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIQxc-00000003kiC-2DRu;
	Fri, 23 May 2025 11:53:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIQv0-00000003kXI-3sJH
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 23 May 2025 11:50:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=wQNTYFxJcLThg6miRUZ20/4ovosP139mFHxX+RSQDfw=; b=XOeulmKe7F2S76qYpX9U5/WL0n
	YzHpoGlXEuWu1rqOrzAfr3OQnyiA65wFGYo0VICItQCTdsjX2EQD1YsZDWcrCh8YenMdxRWt8YKG3
	hGaJKlX/DP3ij/hOoRjBwjDkvDg9hGxVC6S0BzW0NhpP5sDJJ4xk+anl4z+wJOsB22q6xx49ka7uA
	dYLHm3RsLOiIf9SeG0ynw35Py5g3vPs4oc9oIjzWwDnAhITp9hCiAM54aOkkNCMeZRg13g82uYKco
	Apm/ZDZkXoTd3meDF98Unmv7DEiV1CwDWHwUias5l97mKuo7bPMxBZTBvD22ymKp63ed1Fw4U/FsZ
	K1khY15g==;
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uIQux-00000001IeF-1kKs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 11:50:29 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3a361b8a664so7095679f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 May 2025 04:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748001024; x=1748605824; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wQNTYFxJcLThg6miRUZ20/4ovosP139mFHxX+RSQDfw=;
        b=MVaDSiBf/I1WJpQ8vRgG9li+PgyCaTPiN9ZuoFguio3ur2EblJdjNxis4F41hneaxQ
         ddBF0vLWXdZOLsBYj2SBxRsFCVosl6TAh8CRAQk7IluMv5IDaJ+xvaIyV+fV4XyUyYBj
         xupqbT0mdmcdUbghNbeegyymRw5v1XRsvgTMk25XxbQ2hPy5L0yZlbIqc9ynUhGQkR+q
         583mWu5ukt05vPLEg/7H2ODm96vVG1X/Cxo1mb7mq1Fq00C3AO2zIiSl5PBWrYbpwIQ6
         +isfOLJRBpVQ1ARKdwlo/Gdx3i1gMzXtarG+Wvb6c3dyrPk/S45TwaZ6oLhx1O47PjGP
         46cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748001024; x=1748605824;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wQNTYFxJcLThg6miRUZ20/4ovosP139mFHxX+RSQDfw=;
        b=qq94sPDrUoacBHjP/0vSTr5fDyZ3PBbBLH+RQ4fcFDtsrDa3fZBXwBdgQaUwdUsrrT
         hASsa1HpA8aupvz/5PWn0XkM7ng48E95aIxKtHD1M+zpddsEp0e1qtIB0Cys2+Iyk3xM
         TmIa9IqYBgYXJGwiXWoeqFvx/D06FDY9Hn8Vm9IsC6jbv28UXbliYVgtJTulqvnS6hvO
         P9ORKxTy55HFh/qidSze/0mOki7iK9vorM33u5+7HKvIAeOinCVLIPpZol5PVylpqumR
         2lMoYEGM1fqSL6AWhBffi6P86nL0sloNh42zEwoWNq3pEDuWH5dBiMNwatAJtgnGHU9b
         /ZDw==
X-Forwarded-Encrypted: i=1; AJvYcCUwRgCCpeOjY1OyjFJTvZGS68Rf0NMI2vhaSgis/wlmA9IO6DcdVXW9RVKJ64gGQXe/f8CSsPUPpv6saZShApLB@lists.infradead.org
X-Gm-Message-State: AOJu0YxKo1aRU3wNQPWoJDJrejkQh9riJXLD0wDOOixucnYib6fQtjbW
	wpHPlgy/3/CoXswlH03xwV/T/0VYeIAql6dscyaEhQ1gAO0agBzydCdWOgRObCKt1T0=
X-Gm-Gg: ASbGncs2xovtz6+j1e4eG0zUoELhqwYrfd1mhjtW3fjqS8Z/9wqsbXxcMppLHMeIlKS
	+Rp0Iwudn5w5Z60MS8Je8RvnBFts7LvstAFi2q9m6mLCCn8oYOy/El3pN3oCfI5s3xcxaGthDeK
	xSb1NZ7ayCCVlqpz/x1tVx7KcaTw6ymo2f7W0hcXUdTbmcEOLcuMTN6ucZ2pdnugGOmXOvmKfRh
	oGnnwIIVMTV09oIv2pwTy2V4kRjp+W5R9O5BwQaiXC7rL87fxZSWKW6oUMMC6+leeGbcg2pMjmh
	2XGmgsZ/xZRMOVw43VzkxmkeSLbJZj9+75i/yjb+5+yLhMMFnFbflh2lLFCQgUNAfVz0KijXZ9v
	lPOiug+qQwYI1Xxclioc=
X-Google-Smtp-Source: AGHT+IFpDEUARbS9nI22EhBBURMTqfdF8IuO4DDFECq7YXlTnusZMssv3NCG2mxUM1vPEhScrHwV+w==
X-Received: by 2002:a05:6000:1acb:b0:3a0:b979:4e7c with SMTP id ffacd0b85a97d-3a35c808ccdmr26294322f8f.3.1748001024378;
        Fri, 23 May 2025 04:50:24 -0700 (PDT)
Received: from toyger.tail248178.ts.net (i5E863BE1.versanet.de. [94.134.59.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca6265fsm26216571f8f.43.2025.05.23.04.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 04:50:23 -0700 (PDT)
From: Casey Connolly <casey.connolly@linaro.org>
To: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Eric Biggers <ebiggers@google.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Will Deacon <will@kernel.org>
Cc: Casey Connolly <casey.connolly@linaro.org>,
	Nishanth Menon <nm@ti.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: defconfig: update renamed PHY_SNPS_EUSB2
Date: Fri, 23 May 2025 13:49:43 +0200
Message-ID: <20250523114956.457102-1-casey.connolly@linaro.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_125027_634284_F2FA791D 
X-CRM114-Status: GOOD (  10.79  )
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

This config option was renamed, update the defconfig to match.

Fixes: c4098f3e6134 ("phy: phy-snps-eusb2: add support for exynos2200")
Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
---
 arch/arm64/configs/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 897fc686e6a9..7e04a2905ce4 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1572,8 +1572,9 @@ CONFIG_RESET_IMX7=y
 CONFIG_RESET_QCOM_AOSS=y
 CONFIG_RESET_QCOM_PDC=m
 CONFIG_RESET_RZG2L_USBPHY_CTRL=y
 CONFIG_RESET_TI_SCI=y
+CONFIG_PHY_SNPS_EUSB2=m
 CONFIG_PHY_XGENE=y
 CONFIG_PHY_CAN_TRANSCEIVER=m
 CONFIG_PHY_NXP_PTN3222=m
 CONFIG_PHY_SUN4I_USB=y
@@ -1596,9 +1597,8 @@ CONFIG_PHY_MTK_DP=m
 CONFIG_PHY_QCOM_EDP=m
 CONFIG_PHY_QCOM_PCIE2=m
 CONFIG_PHY_QCOM_QMP=m
 CONFIG_PHY_QCOM_QUSB2=m
-CONFIG_PHY_QCOM_SNPS_EUSB2=m
 CONFIG_PHY_QCOM_EUSB2_REPEATER=m
 CONFIG_PHY_QCOM_M31_USB=m
 CONFIG_PHY_QCOM_USB_HS=m
 CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=m
-- 
2.49.0


