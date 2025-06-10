Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F17C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 10:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xtWnccZdwmekAeiqyQYk4mGsFpJfFAArYZd8KxoueRo=; b=XtOv1R4rjpJqQZIKWmlnLnGmtx
	BJHREGJw5dZarlCPIw6QzUajkpwTElRdpwh8BJjsGI+FT2e/8xHMBOtj2l4F4KgUn6crvICRMReHs
	JOEM9R1oz5/rEVksFjToFfIBel+dlxNRsJrXxjwfEqDxh4drsJgv4SXt4aZwXjwlKjV+4yMA2vdV9
	kPH9Xnw0a+Lph0VKJYlmv/SPB+w0Oc+Zrq2ikauCCoFTCJ71R7EN35RuehxGvnGZQEotabMFVZrpY
	HlymjM8ZrDZA9YxnKrddvKNBU0ciBw22lIwHJhT01AKt1ahlAEM8DnKn/oj+FLXPsFGouHOo9qAxA
	K9YNH41g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOwfR-00000006Yol-2cl9;
	Tue, 10 Jun 2025 10:57:21 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOvnv-00000006R6w-3bUx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 10:02:04 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-607fbc13725so2528662a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 03:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1749549722; x=1750154522; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xtWnccZdwmekAeiqyQYk4mGsFpJfFAArYZd8KxoueRo=;
        b=C4Ge366iCPa6jTny+/7E/ixyc2hne3ULGJSmLSndnm0LJ6wxLI4uBbp3M988P6Bf0n
         h/uytESF/pGzu2W7+uC/rrOcc+W+Uq6as31BWOo7hn1Vv8Fdu1M+lPD6RiGuKotE36bP
         JPeJS36rq6jbmGWfdVOAs31cgnSYPk7SIFc2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749549722; x=1750154522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xtWnccZdwmekAeiqyQYk4mGsFpJfFAArYZd8KxoueRo=;
        b=M7jbKhgj724KmJ71uO28S6TBYP7DISrmM32UiROPqn0dh81sdBZa1jBDsXD/BVTQdq
         agwTMuazHFIDP89xrsy3MOqlK6kSgbXsonO2NOGy+C88LlmKVJv4WRMFy9nJG1jlmBq5
         deccWCYUihUTkvn06rGO5onPzpuiMo0lGOkBk9TVZJHf9bYhM7V1LqerEe3aQyfpitRk
         2Wi7yBq5tnkMU6xA5qsiBhOYI+rifvJ5XxaEGIOfxakP44+avK5jjkQKEIGABcb1/Rbl
         WVFo0rd7iP3LcTChKJ7wcr2QhQNvIohOkh7T2ZOlSbG9b7jUyYTE7sCM38LjM/mA7t1T
         ql8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWtiZx92tNE9Tcy2XV2NBUBYRDJrBumNz3ygzq57z9KkM2UIaiwkobeumUPmBf3YZhGXwALT2IO9uhfEooJYiKH@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9rDLrzH6s6cktfH2Gfqg5oqizo2xKxOhkDJnDVhCOE3qhfGvz
	kpYc9uMG6P3rxnk5eh6wjg1bUQZJPLuKqSED3Ipbk+zWrGaLfUXrWmDCmOWT3me5uEA=
X-Gm-Gg: ASbGncvRLP72u+x3X2eC+oGqZk+9A8eyVmQnDEJGYYcnGf8u87cVqFaWA0LZahLxzHw
	7w4RKnvdBD2mTm5hrnIbwApCj7EQtA16XW5ftLRLZwBvENb5v3R6qUD1O4lB5F2CbxwvSN97Kza
	RkS29od12V+Pt/sn4kysvoCAfzoZvF0D8h38t9FOUN8HFzYCf1R4lE/T5DbdWS8MWuAWg4QGhaE
	bXedJtXrTIXInMwr32OyIAZRbXoyqJQlTp/x1O9oiUioRdUxI/6IIuHsJ/pfbYs9vV2MoQMMeoM
	YJYPpKZ31fGtnzH+Sk0MEtSZBpZdex00pmZA1Uii/TmazacpSwfQceajftTW8fpPCb9ayZ6GLJk
	S4f0lmcKZlm+T1SgYHMQeQ9i9si8=
X-Google-Smtp-Source: AGHT+IFpzmTpzfXKwO7hSH+KrhiZpJlmcFC4ApFNg+muY/xafPN/5pLnUmMU8U65bPqg/2CnqXnQXg==
X-Received: by 2002:a05:6402:1ed4:b0:606:f7bf:86f3 with SMTP id 4fb4d7f45d1cf-607735120e8mr13987501a12.6.1749549721976;
        Tue, 10 Jun 2025 03:02:01 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.179])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6077837ed0bsm5953438a12.36.2025.06.10.03.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 03:02:01 -0700 (PDT)
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
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 10/10] ARM: imx_v6_v7_defconfig: select CONFIG_USB_HSIC_USB3503
Date: Tue, 10 Jun 2025 12:00:23 +0200
Message-ID: <20250610100139.2476555-11-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610100139.2476555-1-dario.binacchi@amarulasolutions.com>
References: <20250610100139.2476555-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_030203_888786_7F3C269F 
X-CRM114-Status: UNSURE (   9.09  )
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

The driver is required by the Engicam MicroGEA GTW board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v1)

 arch/arm/configs/imx_v6_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index 917bc8a27794..3181775a214d 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -335,6 +335,7 @@ CONFIG_USB_SERIAL_FTDI_SIO=m
 CONFIG_USB_SERIAL_OPTION=m
 CONFIG_USB_TEST=m
 CONFIG_USB_EHSET_TEST_FIXTURE=m
+CONFIG_USB_HSIC_USB3503=y
 CONFIG_USB_ONBOARD_DEV=y
 CONFIG_NOP_USB_XCEIV=y
 CONFIG_USB_MXS_PHY=y
-- 
2.43.0


