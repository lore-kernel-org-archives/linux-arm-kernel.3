Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD46C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 09:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JTNIBChwjFjiMOn5hxM9LK4OsxuMYN3qgXh4AnRdIkw=; b=VCanxS/bIBIUllTlOxlILMborE
	/d7I1bKqU7Ze5/wzs7CWgOfXLpw/5F7VWpOJrBRKPVc/XTM39QUJSVRSFRLHWUvXljKCD6l3O2cXT
	7hZFZ29ZfwwTU/FLRtukDB67aKt2J6A8kkOSu7T6D7t3qFGGXd4L1U3K9pAy1QVKfWK7/8swFFQ2q
	YbP8ZrvNERXl9aLFvLu2JYDkJbr39DeP6MkwK1AxQaWGbrFf5ELiDz4dajjQlcu4Heq7hXwWWY2Ru
	13Ax0usSK/cZ226ju6UP4iXUJKgP8cHkVmC153Mf66iyoKWZ3g1wK4/2lXR4LIMJJVACovivPLxHq
	phXByqaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNq6q-00000001VQQ-2c4E;
	Sat, 07 Jun 2025 09:45:04 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNpw4-00000001UFG-1DT9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Jun 2025 09:33:57 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-60780d74c8cso2381049a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Jun 2025 02:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1749288835; x=1749893635; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JTNIBChwjFjiMOn5hxM9LK4OsxuMYN3qgXh4AnRdIkw=;
        b=KuPAusEODyvflbzwLRgmvhUhssFzNc1slILlkPsaSrdS38b9wcHN6FXpUOU/lpo6Ap
         E5jVxFbL0l+dyPDkqiIJ+5MgDMtYoV9+Dujh3JYZ6KPRqfHz6EHG3LBfhH/tERVPLx6W
         PGmfpcQqKSZE87BdoCfN5rHvmG+PZFfhqxHr0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749288835; x=1749893635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JTNIBChwjFjiMOn5hxM9LK4OsxuMYN3qgXh4AnRdIkw=;
        b=TeSMyAB+W8a+J6cxexAYyNpFd5+gp5SLM7omppeJTZQgH4H2VXUgNlLUYQiHLkIfn7
         IDB3IrOd6idFZDsiAmQy1es3FC34YhOeWtpyWfPNxrGBz7Mx/8eRs0Lf2jWX72oXSvQY
         lBX+T9y9uyIhUTo2NtDJ8sl/9L7J2JmWu/TOd2QPZuXIOW5pP5e/qyKVjR1BUsOsPqte
         a54jXEbfLPNFh8fLEZwaldRmkIacBxs/U3EHjJFq/zed0UnC/JogwLcUgmF7n2JAtIP+
         cz81c94hrASOdve8S1kd7GbqwOjcBzxLUvGQTm5Kiiro0nVQwFbuDUyHBmZPODtYXb05
         QG2g==
X-Forwarded-Encrypted: i=1; AJvYcCWggS6sSV7M4mv/EIIF2zPiSyf5bH7v09vlvbqf4pmD4LlXQsV5QfqEznrZswXTA7OE9IZQcAW57tb300gd80CJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzfjJDih2HBYtg7Adq2X3p+4e2mLRgjmt////wdRlCkcvcxOULJ
	q2UArgwCaVk8wjTkzu3AKn9HCGesAMIGFM02SiDWcHD83UgJeGLRe9jX4kIAeb2yp9U=
X-Gm-Gg: ASbGncsUxEKf7WqzcTC15bO82dulXqqTa3CAfo7YXCuI7AKtDG+9iVFdusIHM1A6k1b
	YpoOxe7LwxiVrk35qqKnQlu6UX8zPqlnksae74tMDIaReA0RA2aOGNAVpZsfPbg+Usg5ebl9S4G
	dSYYXTyDHlxk4engX+SsIqCMKJy43pEgm3hZS3jqOC2NMsTOyZ10VM6jWlqHmrwbB178IvGGAEn
	mQ6K9actKt0PRmF5GzZlRYkb+Krkwg2OWuNw0pHGqxCdviNKvc0Buf052MlKBgzsPaa5QezLZKh
	1ZHzyjS6kAhP+b3WgryhyC92ahuwpNK1sp/YnQWkBj3S6znjTZ6m4S43ZC08Yd3LZGTy6UCd6Il
	hcKOEg7bP7hRXwdJJFgKgY1BANFQiBbV7Z5xtkMXkZ3b7ZeXDB4KVx1pjF+nFYhdcmcxmZDgUBZ
	xP64nL/ZEI6NNzC6mqJ7/+E1E=
X-Google-Smtp-Source: AGHT+IEm28qBVinuNhWsImQPcSHvtdI7CTlAx5NAM/birwbnUAeQpuKn8+d34Y03cUHERB7oLJ6qXw==
X-Received: by 2002:a17:907:1c0b:b0:ad8:9257:571b with SMTP id a640c23a62f3a-ade1a9057b3mr642580366b.16.1749288834791;
        Sat, 07 Jun 2025 02:33:54 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-87-5-95-99.retail.telecomitalia.it. [87.5.95.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc1c316sm251541066b.98.2025.06.07.02.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 02:33:54 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Matteo Lisi <matteo.lisi@engicam.com>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Ard Biesheuvel <ardb@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
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
Subject: [PATCH 05/10] ARM: imx_v6_v7_defconfig: select CONFIG_INPUT_PWM_BEEPER
Date: Sat,  7 Jun 2025 11:33:17 +0200
Message-ID: <20250607093342.2248695-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250607093342.2248695-1-dario.binacchi@amarulasolutions.com>
References: <20250607093342.2248695-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_023356_329941_44A23AC2 
X-CRM114-Status: UNSURE (   9.56  )
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


