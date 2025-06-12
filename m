Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC5AC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 10:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cjWUaZj830iJEScbjAkMyM8p8jFPI25PYUQdDEHFIkg=; b=uj+KOOAeUB6F1+AmCJxWHhsH4p
	UE3xiEFXaBjIcYsLF8sY1HiCIO3Hw42CYgL3Lu54nanmxqYjIx+8yQMHqVa4BtvzB0lQ3rQ91xx04
	sBK4KZHGo6Uznn45JJ+LQ+237fOc9LCkdlKTUgV30V5F0srnFXR+dMmU3gvhEjYf4lTSn5SAlyce3
	xsPGTrXVgFbvXwtdq/IksVG5K90KLZg+nQqeIGeH7E6JOXi5IZ8qwJZv78NwPpwEwma7YMLY8g5Y9
	C0rMg/+NBHGiS84EC9tP+becx0bezjiOGnuYKnRQoyCeHrMQ5YXnYb+lvFkyYqprCReFa58Bj8Ba1
	Yx42zaGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPeyv-0000000CwpX-3EVm;
	Thu, 12 Jun 2025 10:16:25 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPdvI-0000000Clop-04kK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 09:08:37 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-adeaa4f3d07so122127066b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 02:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1749719315; x=1750324115; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cjWUaZj830iJEScbjAkMyM8p8jFPI25PYUQdDEHFIkg=;
        b=A6W46yrutuob0B6yZahuhk+LLRN7GEdMuLC2VLbXdOjlJA4gw+a1tFgDaQD0Zx8hr0
         pR3x5FRafDJf4yaFn6mihHFFGkWZMIgreGwooMeo/ON4Itmbo6U0NjCFw4VBZ9/bz++X
         fe+1vgJ/96xGTxJuNGinvKM7GQqqYE6IiNgjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749719315; x=1750324115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cjWUaZj830iJEScbjAkMyM8p8jFPI25PYUQdDEHFIkg=;
        b=F2nHDDhAKO5xOzMYbXb4bw3lf9DYFUeRmRMWrEY97KVqnj9L6bb/i4w6aAJsFb5Rkw
         dq4fFLTi9RuJFy7YwuE9hHUrYvnlg8ZlmPuco7hQU0C/gRr9sMXTYdLGOCP6SpsU5Rxh
         GRKjuIEqguzZA2wPwFgWU2SWyQpTjli326es+wmzLgZ4qG0JXJqWvqV4reyGuwy18I0u
         y7KE+9mrjAnBKeN6PR7YG4kujcLW3jYBjH3uu6wnG3Z6OLoPwfpNJTIk8NU89PakTReb
         jfDgqn6bkAtugBM9naSddGHxvU9BMbmH6hTain4nMvZ+ZUBTXxDzT+4uM3qwETNQwTjj
         vCcg==
X-Forwarded-Encrypted: i=1; AJvYcCVxBwPI2qgaDw1gWj8a4Job9USn3E+XmbOgd34sRiXLcZD0o6rkh3BasyP8KARGJpYozX33wyg5M43dHHLx11rE@lists.infradead.org
X-Gm-Message-State: AOJu0YwDk5fKn9SycUrQCHnS9hzwkYmAT/Ex9uVfbY4Z4zQJRq+pNV9Y
	nKIyQ1jQLlFz+Mu4XUC0Qw9PIogXJBm+Uj2ZUoRym+j/9DFAi+hxbQcEKs8Gls05n6Y=
X-Gm-Gg: ASbGncv53b50143P72oqfEKDSKN23/1fHDCNKY5reXvV7BRPJnpSnMDoBolA6PFs+gJ
	LVl1iwQsW8rHQfyxXnqcZIzNASutT+oXyQHuW6PrT/8xq6Ca9+f9PAaIw0lHlIeDYeXlP03/Dia
	noFqBZx8w4c4E0UkQ7sAWXQicfeHXJPyYgah9LswC6yrWdFt2wrZQ9AlFpiv3wm3xqyE4TteE4k
	hYmLN6pwpE88T3UjzIbjk36M4J5gpoCyUlOkcP6lvKwwSWNZZqghnw8ybdrmVESa6OzqC4I+J8l
	C2oe7Bmn3H4st4d1My1pqKBcf2oaR2jcc9EwuoH3yOXqd2/QEEcYLMC/ADbhvoKPkJt7qCF26yz
	hrDefI0Ame0urnFwMmZcx2/53Ug==
X-Google-Smtp-Source: AGHT+IHw+40tHRpT0a1pb4c5L8hi+hHN6rjyVSOULz4Jjlr+LKsqnaDwCLiI3mpNwIAMKOAJoxYTlQ==
X-Received: by 2002:a17:907:986:b0:ad8:88f6:a7d with SMTP id a640c23a62f3a-adea3809b1dmr281579466b.58.1749719314703;
        Thu, 12 Jun 2025 02:08:34 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.38])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adead4cf274sm99933366b.31.2025.06.12.02.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 02:08:34 -0700 (PDT)
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
Subject: [PATCH v4 05/10] ARM: imx_v6_v7_defconfig: select CONFIG_INPUT_PWM_BEEPER
Date: Thu, 12 Jun 2025 11:07:50 +0200
Message-ID: <20250612090823.2519183-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250612090823.2519183-1-dario.binacchi@amarulasolutions.com>
References: <20250612090823.2519183-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_020836_047567_14ADA9DC 
X-CRM114-Status: UNSURE (   9.40  )
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


