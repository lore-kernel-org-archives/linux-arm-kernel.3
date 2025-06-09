Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1594C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 10:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cjWUaZj830iJEScbjAkMyM8p8jFPI25PYUQdDEHFIkg=; b=lXS1L4vLBXdpmYamhDaWu+mrpm
	T0nlUwrJoFgqQw+Rj1iLkHeey7l7mfOBny+5HR0Ho/kQ1CtTgQUThh7uucBKLXuOSjw2diIInA89x
	1/IfVsNkPvRz+5gUtpZRz/xANYe4CY3C7jl+FU39gJnmj6/mXahcipempOgSuh63MjkZwNT0e9UFx
	GPncJUQMWvmsMR8xqem0NBWrnZiijM6GqYnwUGZlGBV/SKpNxmHCcsqCWlLpoiHaBPVjCNfjdRpZW
	Tc614F+tdEYSJVRYJ7iVQx/d1qqo0VQU6t3az0qTQbCkgLyTUVZ6XKSlnb3BnTyvcuJJUKghi98L4
	127T9oYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOZjF-00000003uHc-1gjK;
	Mon, 09 Jun 2025 10:27:45 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOZYi-00000003sSp-2m9T
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 10:16:53 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-ade326e366dso385605966b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Jun 2025 03:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1749464211; x=1750069011; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cjWUaZj830iJEScbjAkMyM8p8jFPI25PYUQdDEHFIkg=;
        b=epcTPj9KpZzsb5sRP872W/Oc6T2Sdi+DzvuZ/tDN+4tUKkjDv5KKVgQg98jKqDXXuM
         NhY2a4i+9j7OcumQ3xYN1M5iDMZbbDjAuUy/GpF7rG/1M3EaZ4m/Iih8osDHvZhs7n0c
         LeV3c5TnkP8gbcpRRWCph8/Uk0g5EIfo/MLcY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749464211; x=1750069011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cjWUaZj830iJEScbjAkMyM8p8jFPI25PYUQdDEHFIkg=;
        b=uoVfzV9bMNLI8qesky7TEcZUw61RamjVDUDOkDcmHfb+/Kj5ShJS4gWYbUBlY4lHJu
         AXALu1b3ad4YUz/4duBVXDS9S+ojrm0SoPShQrKdfxAGTwLDQTkzcbS38mb358vQSV/z
         xPBnEZlOQJeuS6r04JmfWPOBb9gEHRcXz9b6pUb6QnJwAvaW4CodszBpK8eibGT3wwxc
         mWuO8dnZVBJBTtGJExID9h1doGazHGBQORTcgSmfs7uPReQW/66VPPDYn/IqV6GXzQWn
         1Ja9y9qyq9Zhqu3OLec0zzgEowGNR04oUP5mggunFHfmh7ZNQ8m+AUsZ3/dH41ogAH2V
         PiGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcaChkyjHZu2AH2TGGamKll+ObGQwNr9rNByMOMKwgszRBSh74MIHhb5XiOuUHY/qMNyTY8+6ogMrTGfoVvj3h@lists.infradead.org
X-Gm-Message-State: AOJu0YypIP96y/Ptl+Kg3GKXWUpYs66bUIM3F1QoUWFXeShI03Wi45HR
	25Riy7S/55rCuw3wb3WnfZijXnsccDAVm8WIsBdTxzzG0Bv2aE6C86cwRlZsBRb88zQ=
X-Gm-Gg: ASbGncsMyMByzDtcwGvR3i8QcPSbuEHqc1YvQWqT58qJYZnqUaKEXDwbWYWR5rUcTmY
	s2/1E/oMQEiI3G2oRwdWPXKAnQVekgE1H13kEKI4xEkO6L9DkfRFw+sC8q7+aKIRbOR7jAd2/nS
	2jWYukJz43UjXtv/S2yCnEb4KAosvK+fSgnuxH7czA9P7qRfh7e0I8wrgdtB99LlRucaI3DOesz
	btqlLDreoOhFLS0xg+iVsfu72ya8AlFphqo8I3ELn5dh11rLlLVXGGi+W2XKvDl7ueMs/8spmWW
	WUpTKsTAWdNoxDwUAggkDIft37v0dfIVDPIuOCv8adsP6UKFdwz4uqtSyJEmwoNZmu9BPmdT10/
	0vuD/aStcJFsAnRKPE2vu3VUIykG1S3gUpMx3sfyiH8fEu/rFA14=
X-Google-Smtp-Source: AGHT+IHVur4mTo1DAOmuoShYKnP3X3CWsYNLx4FXLXqZkGHw2GltIvMQnVbilsvCUXJISjKKmcuYsQ==
X-Received: by 2002:a17:906:6952:b0:ade:37da:2183 with SMTP id a640c23a62f3a-ade37da236fmr647331466b.45.1749464211252;
        Mon, 09 Jun 2025 03:16:51 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.40.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1db55c7esm529257066b.49.2025.06.09.03.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 03:16:50 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Matteo Lisi <matteo.lisi@engicam.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Ard Biesheuvel <ardb@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Eric Biggers <ebiggers@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 05/10] ARM: imx_v6_v7_defconfig: select CONFIG_INPUT_PWM_BEEPER
Date: Mon,  9 Jun 2025 12:15:38 +0200
Message-ID: <20250609101637.2322809-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250609101637.2322809-1-dario.binacchi@amarulasolutions.com>
References: <20250609101637.2322809-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_031652_696566_DFC0173B 
X-CRM114-Status: UNSURE (   9.37  )
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

The driver is required by the Engicam MicroGEA BMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm/configs/imx_v6_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index d40ca9edd264..917bc8a27794 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -180,6 +180,7 @@ CONFIG_TOUCHSCREEN_COLIBRI_VF50=y
 CONFIG_INPUT_MISC=y
 CONFIG_INPUT_MMA8450=y
 CONFIG_INPUT_GPIO_BEEPER=m
+CONFIG_INPUT_PWM_BEEPER=y
 CONFIG_SERIO_SERPORT=m
 # CONFIG_LEGACY_PTYS is not set
 CONFIG_SERIAL_IMX=y
-- 
2.43.0


