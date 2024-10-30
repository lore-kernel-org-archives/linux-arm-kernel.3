Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A792D5CCA1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 12:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mU7t2F60MLsG2LmsYh482PvDcQpTzay71lGqfQCsp9Q=; b=XhNc4cSVKf7pBR7JzCZrSjLYA9
	laGo2Me6zgK1M8BOEKL9KLoHy8un7fwGVPONHWrmlxmtutLEy1glc9OjDatByipCvLoIDPtHdFNn8
	tIOycuA84CCybxX+ubHnXWYS84WRBUYn9HjGoyU4CWLPFBfZTz6rOPYfmXuGOJwK8GgIHDYn7B+Gp
	AGoJJTRYmML9nmruvi4WVRcsCzqAx3sNdI5ANBN9Z5uz+i4zYAme8Et3MVwEPm+mzWykca6QuRnhF
	TOsAqYjH571rr4BzfqJYcv8ky9EwaoZJjpGFIaxaacJQJfzeMQc4Tq5rMN5Gy1dx4VScAr/Iyiwvm
	0S4Ewb7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t67k4-00000000JYM-46Jj;
	Wed, 30 Oct 2024 12:24:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t67ho-00000000J8c-2HVU
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Oct 2024 12:21:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=mU7t2F60MLsG2LmsYh482PvDcQpTzay71lGqfQCsp9Q=; b=VdGiX7iRd8qIqTLwxqDhqwhuXs
	GnXSvYtAKEipK3Crva9G7yCjtWiDTW6ig+pcpiKdYKgZm/E6dyyzRmxUevDeOcO7fezC83/+PolB3
	SEEUiMqT4tha3WgMXLLpvGd0ToFE6mKeYtmwoUrZcy5A6k2jNLp8Wo5Cq5FjGpQeyhHzYTSkTYu8U
	svXQL5rGtENa3Rwx48/Wxh8zm4Qh3w4txKTM1k8BFu0WbEd27+jJSW3P0r7Vvw/qQPvR94tREDfAE
	Lh27GzRwUA7GvjNewB/Bk3T1Cyd1EzY5Ud988DuWAVbEXjgwKtxfbRCFFboDswK5GhG6aUoE2wkId
	iKp6pIDg==;
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t67hl-0000000AEyA-1bKZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 12:21:43 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-a9a850270e2so1036191066b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 05:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730290899; x=1730895699; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mU7t2F60MLsG2LmsYh482PvDcQpTzay71lGqfQCsp9Q=;
        b=mEVt32YwLlplRcWjRDV/2km3/dCjf4rupD4/GPEqhMnvVMt0nX+OYbxCnXtMOmLiy3
         7johaxC9mcjSuZ7aR4SvtEaoeuCWeZyBBOLBYxRt59q7zRC8KQfsKWIez2dXFfHskfrq
         bFaB8Tl9ndkgU98yhY9wtdrIu+Tasoky53qo7asSNLcXHGiax0OerQmt4qlASvS7ss2a
         NQPVOH69S2uM7vIlOYh2VryGcNyT67YU2CPEiDlZ5VjdDZl9VSDpR7KsIWCArFrGlrIq
         81wxdvPvnjf9y214dQ5PLeg1TIzaactlrhIM8RWmByalCxES2cFBGHIIB/RN6gEiswfE
         UVjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730290899; x=1730895699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mU7t2F60MLsG2LmsYh482PvDcQpTzay71lGqfQCsp9Q=;
        b=BGIM2ncQ750kZZbYM+1v1SKOdCNl2So1wFfHY8laFVnPPRQV/YlWs3uv4J2ax6gKp1
         9d5QLJ6Q2KCshrW2nA25ZVAYtd97wOG5i4KgU4iWPqceHZzl4sSNVm9KLOl/JpDH4qOT
         lCYIfW9s50hTO2FQAZZFYBUb11kEyfzk0nBQFmfmDU35fM8d5zs/j+hlfqIdTVYqxE5s
         uIQohwerGeZcWl44BlmzgPibeY4kSW9A2x8bX86Pk07zHdxzxZ1SPSEg+2e1GLFLDitY
         3/Xvh3qHvGA2HFhYLAf01zxXdkU4B3ALyWaXvzNCuREh41wAQ+vmwJAqDvMSZdN5U6B/
         EcJw==
X-Gm-Message-State: AOJu0YyvouyzXSZHYNMnVJuWPqINA4q0gPyAZvwesE7TnygLipf6EQnL
	uTRJvncnCCtzVxrkQM0QMTLMa4edgBz1sDXraLtpCwCg218ywo6D
X-Google-Smtp-Source: AGHT+IFLs++qvOnrQcBcH8hYdDdVxrrVuWucZjSjakPaFv4ezw0P51xiY+UuomQqQpb3qzlI8z2wIg==
X-Received: by 2002:a17:907:9487:b0:a99:c0be:a8ac with SMTP id a640c23a62f3a-a9de5ee477dmr1552093866b.37.1730290898593;
        Wed, 30 Oct 2024 05:21:38 -0700 (PDT)
Received: from eichest-laptop.corp.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1f029890sm564494466b.56.2024.10.30.05.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 05:21:38 -0700 (PDT)
From: Stefan Eichenberger <eichest@gmail.com>
To: linux@armlinux.org.uk,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	elinor.montmasson@savoirfairelinux.com
Cc: linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: [PATCH v1] ARM: imx_v6_v7_defconfig: enable SND_SOC_SPDIF
Date: Wed, 30 Oct 2024 13:21:12 +0100
Message-ID: <20241030122128.115000-1-eichest@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_122141_573826_F06D9FF5 
X-CRM114-Status: UNSURE (   9.33  )
X-CRM114-Notice: Please train this message.
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

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

Enable SND_SOC_SPDIF in imx_v6_v7_defconfig to support SPDIF audio. This
change will fix commit d469b771afe1 ("ARM: dts: imx6: update spdif sound
card node properties") which moves away from the old "spdif-controller"
property to the new "audio-codec" property.

Fixes: d469b771afe1 ("ARM: dts: imx6: update spdif sound card node properties")
Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
---
 arch/arm/configs/imx_v6_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index 333ef55476a30..c771d7dbcadcd 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -321,6 +321,7 @@ CONFIG_SND_SOC_IMX_SGTL5000=y
 CONFIG_SND_SOC_FSL_ASOC_CARD=y
 CONFIG_SND_SOC_AC97_CODEC=y
 CONFIG_SND_SOC_CS42XX8_I2C=y
+CONFIG_SND_SOC_SPDIF=y
 CONFIG_SND_SOC_TLV320AIC3X_I2C=y
 CONFIG_SND_SOC_WM8960=y
 CONFIG_SND_SOC_WM8962=y
-- 
2.43.0


