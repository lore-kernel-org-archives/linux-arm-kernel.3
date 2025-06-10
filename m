Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E4DC61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 10:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cjWUaZj830iJEScbjAkMyM8p8jFPI25PYUQdDEHFIkg=; b=L9baPm1lE8y2bmk0EyHR7p8Gry
	xoB+TF68ZMIBUHrg3RhD88aXLhojfqBak5eJ+uEX0ZQzsE95YSkMV3oaXeCjKrYXIovp2ttsIGEd0
	sE8q018pzE3owZ9/YEFz0ZE1uT1ASyvkhkGINa+OK9xZJkCXukqQxbazATUaJz3Oc35Pu3GctYzgd
	UXdVT4+1vES+N0ZVG75Uh9iOS2NseHtVuU8xdrjFI0M/WSnzpHJ2UhgiMBl/w/0zyI1/1ehE9HVmb
	/F7xSh2iu1yu7TDOvzAtmxwvwHeIaMCae3Eiu6fJwsgr8JHVcuDMDNEsyJQSaXEUkoDnFQv2Gixta
	90iR92gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOwfH-00000006Yc9-2X28;
	Tue, 10 Jun 2025 10:57:11 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOvnm-00000006R3e-2Mxa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 10:01:55 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-6077dea37easo6197225a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 03:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1749549713; x=1750154513; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cjWUaZj830iJEScbjAkMyM8p8jFPI25PYUQdDEHFIkg=;
        b=XWaMjPHK42zZGLziED2z8kMRNP9Raupk6kHTGGxMbH/C+tDc5sKng2PemffuV52AuM
         nR1O3mpxuMAdAr2yXM5fl7rPKVWQnKBUREghq1N17NIWYAZL1Z0H6j36CZ3NjVJp9m1N
         Ey060U4asUSdx0UpXXnH4MDGfyJQSgXZfnuQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749549713; x=1750154513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cjWUaZj830iJEScbjAkMyM8p8jFPI25PYUQdDEHFIkg=;
        b=SbCfmNEf/qeLMrY/M/tyxO0hetPODZeIFrWSLFbVSeYYjUV7Y3IamG2KrtdVrDKHVi
         S881qw85J/gp0mEs+9L1W7/KbpHHeCm1bFsRHXYgGap5Lzsdk3VOWfGdqnprQ3Rg11vS
         B2YYVWtUlaF5gYoIoFHOopTNr/0ejZ7FO9N3eDiFGZWTjrjW6xnLOwpQQ021qjxNpqjy
         RkdCrC8wvKTFOxf+B9GLnkSq/eLLpIBX02SiLUO6Aybv9T0mUV5KcTA/2hG86K6HQSQy
         444vrOWJd3nPejmHB2pUqaTCC2c1x6OcWL7bkOzOegAJlqShMUg48UlTRCrAF6jVpHZQ
         oTDw==
X-Forwarded-Encrypted: i=1; AJvYcCWLuU7p6BZXdRzA/UIAahk8zwsEwBnpVqkJG1QMThbn93kP1edA4ABXRCnO6uESbMTDd/hRL+cRWDPkGS2gd2cn@lists.infradead.org
X-Gm-Message-State: AOJu0Yww5o+MiMOsJoSpTgQd485zPGun+VS2fnm2/ODQRRLPgWJ13Jh6
	sI2ajOnVk6I+TDtXllPgtZ9ntKAPG647fuJYNaF1XNBkmKul/5/Ab8eUt4NxnS9Cqa4=
X-Gm-Gg: ASbGncurt6Kxa7wuCRBrK4F+HUon02wtTYM8NIvSPN0W9WuruNBdAeXDuMd8bXAb6Ze
	5UusS0blr0desQi2xMMbN3TXyDAk/5sdmcE4x/0IbsCwfsP1hhjacqislgiQpK1LkWk4VhTYOIA
	WLAW8k81DXdDK6/fUlaLiOAm3Otrc8TzyNKzKCHx/K1gjdVa8bKZLY7YZGtz1BpoloKkeo3s48c
	agevBTM4+jGpXXA8ifXYhN9LSrmNAOPU384N6eT05Z1/oU3qZO6JaDKFs5JtqCplTI6GKd/iIMy
	7uDO8Ev36o6Y646FVRrssyZSwGWZHE2Qjj5pCHAMhWdiVuRirxQxYr/CZTJyHe0WrnKMOl9AHkb
	xiTZhq2JXjzMg27oB6633q4Kbdqk=
X-Google-Smtp-Source: AGHT+IH2ogjmL19YKgDcUsr9qdGaloNFiPiqPmqMHmLp/CVdnSTRnMn5FSL3f6mAcCf4N7SCTwQtCA==
X-Received: by 2002:a05:6402:3590:b0:602:225e:1d46 with SMTP id 4fb4d7f45d1cf-60773eca93bmr16613922a12.3.1749549712993;
        Tue, 10 Jun 2025 03:01:52 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.179])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6077837ed0bsm5953438a12.36.2025.06.10.03.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 03:01:52 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Matteo Lisi <matteo.lisi@engicam.com>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Ard Biesheuvel <ardb@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Eric Biggers <ebiggers@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 05/10] ARM: imx_v6_v7_defconfig: select CONFIG_INPUT_PWM_BEEPER
Date: Tue, 10 Jun 2025 12:00:18 +0200
Message-ID: <20250610100139.2476555-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610100139.2476555-1-dario.binacchi@amarulasolutions.com>
References: <20250610100139.2476555-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_030154_595860_4642C64D 
X-CRM114-Status: UNSURE (   9.94  )
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


