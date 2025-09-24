Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B32CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 13:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rr4AHNLZpak0/qwDXluW3tBh9480ZbWvsfmpnJ8cepg=; b=xHRaJluyZIiiTVxVRWOz2C34Gc
	rxcFdCCm4yafaYpKIU7MrYhktta1xZa3b9+RA3wOV6432R1eDLMyk8dpR3b5bgCVPnxOZfe3zVbl7
	rSsHUW/SkyX3nkOIB1HiLVPocaZok7jXClX6K1F/ijqv4SUl523N70wTfPticWk8MmY/sgk7oTi22
	YFxVsOllMGbdsJw0/dJ4AflPFR+EUbcqj4vMRz/u/sA7aJWuei5B5gXA//ZvjTnipPsH8mBjOb7s5
	vBpGosNu95wC7o8EhiacuWxJi+rGrCdj1pFFpzEldlxCooQkVok8KHqssL61GO5Fc1SeQzKmSgo7G
	auFVb3Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1PE3-0000000052c-17WK;
	Wed, 24 Sep 2025 13:08:03 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1PDx-000000004wV-1vQl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 13:07:58 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-b0418f6fc27so1192007166b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 06:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758719275; x=1759324075; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rr4AHNLZpak0/qwDXluW3tBh9480ZbWvsfmpnJ8cepg=;
        b=JROnVm2SLg1zDb/dzJyjCwvkBlNiOFfGDVr0gLXvYeCj9HtQvUKqnH9CC4RJMD2TWL
         0vQGqtcrpmhB0uasT6UsSgXcEk50ETMVW/1Yi4tfMwnr+Uh8lsTxcr+65BxECm1F4IVx
         FhoEXhuikPNVIOA6u8Q/6nb2D0TxGw/gcwokU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758719275; x=1759324075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rr4AHNLZpak0/qwDXluW3tBh9480ZbWvsfmpnJ8cepg=;
        b=TwQzftKCAWYtkeJNcJfNT3Ot6ZdCr8ftf2pWzBNMAWVBWLI/Uvlapab6a5KFwbXeWK
         pmCp8JIJ3rXlIYa25rmk3YS3o150Y+fe+aSeW1Jwx7deoWPR+D00YfCx3ghVFZKHpsCh
         v9f5YF5km5w140+suK7F9Fg3UzDvUckJA0R9GfXRuuwFEXSKhoYgcXfuf4dKsSBZtk3l
         1uW6rqX31YnwgOdezjJBArmV6P5Qojx+RGBrVdhDtKd65tBiDAj1AWYhoQxlyPhBVAfT
         VRxJjId6Jsvc6xAWyO31d2F7AkUte3zPBUf6F+vsVfJdTbHe51mIxpTTsDvGkrNC0STA
         orMg==
X-Forwarded-Encrypted: i=1; AJvYcCUej+aQZ3SqzzZ7W53J0j5s0uBf4JY9WxtiCVKnZY8QvNGkYpEfDD5mI3in4xSVdZhXQm1lT7WzUHFWGc3kU4de@lists.infradead.org
X-Gm-Message-State: AOJu0Yyz6oZ8TaGR23BdCP2dEFYF2mKzEjBFsV8AyNaByuEdQ+q8bhRJ
	Li56YE8Khr/NPFRRNaxvqYqhxZEhej6zJ7XIXTqjpszXQdoSzNkMVGSq5BJUISsA+Zs=
X-Gm-Gg: ASbGncvcOAVs1Hl/Uo2xUZFWQXHU+jF/J723u5qT052sIhSDQDwNiGH6Zt5eF1XFKsy
	aZ9QazMPiqRiEDkMsLpV5V7J+oDFTg6fd5uhmXpGHIdGSoTvLpbPi5QxB88gjP0cOvK9jKKZfvv
	lS1PM8+CixiWO2pR/keg2U+C4VH5QUjkQ6Fvmg7DyJDAgywm/25G9Y0IphJoEcfu5mZC+YqEubI
	ayvslcaYLOIu8Ma3bGHfRUiDKTjiy2evx14Og3BVh7Zz89H/+K6ko5H/Y38yADsH6TbKX70yZUs
	o527mtv9YI6oRUnv21ENq+Hmq8TnGcddE2Eeyta3iIwdR0E0gtMfbltjA3Pq3IuWAcnevqUzmzp
	NJobyHZ1u79WoH2qk3EKVP0TOYGZyFLgi6cNU8DYIUWfWgaOAc7z35q5X4RyTxDiPlQNPW2lu1U
	k5ybxRqHADTEOVcXQEiUAZrz0S8Ychf0Dv19WeYOxc7zwtCxxRa0HLlg9/18k=
X-Google-Smtp-Source: AGHT+IFx9RJ+/2IFWtcGeD4AIDWcZcKVdKo7r0/4aN/+yno0pYXxsSMoGTi5NzRLLyVL5lFzEdLoFQ==
X-Received: by 2002:a17:906:6a03:b0:afe:dd76:7cd4 with SMTP id a640c23a62f3a-b302b21c432mr677014766b.57.1758719275523;
        Wed, 24 Sep 2025 06:07:55 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b1fc5f382b0sm1574379866b.2.2025.09.24.06.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 06:07:55 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [RESEND PATCH 3/3] ARM: mxs_defconfig: enable sound drivers for imx28-amarula-rmm
Date: Wed, 24 Sep 2025 15:07:46 +0200
Message-ID: <20250924130749.3012071-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250924130749.3012071-1-dario.binacchi@amarulasolutions.com>
References: <20250924130749.3012071-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_060757_494314_E4367C5B 
X-CRM114-Status: GOOD (  10.39  )
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

Enable TLV320AIC3X I2C codec and simple-card support used on Amarula
rmm board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 arch/arm/configs/mxs_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/mxs_defconfig b/arch/arm/configs/mxs_defconfig
index 3b08c63b6de4..603fb003b223 100644
--- a/arch/arm/configs/mxs_defconfig
+++ b/arch/arm/configs/mxs_defconfig
@@ -100,6 +100,8 @@ CONFIG_SND=y
 CONFIG_SND_SOC=y
 CONFIG_SND_MXS_SOC=y
 CONFIG_SND_SOC_MXS_SGTL5000=y
+CONFIG_SND_SOC_TLV320AIC3X_I2C=y
+CONFIG_SND_SIMPLE_CARD=y
 CONFIG_USB=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_STORAGE=y
-- 
2.43.0

base-commit: cec1e6e5d1ab33403b809f79cd20d6aff124ccfe
branch: microgea-rmm-audio

