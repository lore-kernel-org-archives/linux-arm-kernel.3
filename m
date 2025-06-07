Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB881C61CE7
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 09:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wep7qVH6kKRWEOlGk3kF7+QndMZjc4UpPN5qp8DyFqo=; b=19nyIw+i0vPJUdmzntPe3cw4ac
	IG79VCJWyjolwRc++CxJ8Ccjfv8/oB0a4tSJwtWcEpcPja8a5hobZR4sZxcX3rbrYGPSoZJ4eACEe
	OSu/uy97mhv1GsR2Z8deKZ67f1UVBk1z89EdXdhA9Fyk8bHi2iDm9UPqhfbp0xRlbANhYupLaGJ8y
	KRbd4hsmm1qsd0//DolX1A41n42VHMdZTHQyCVVkjdYUUlXqnJajD0+tHq03iKdAQaMgZQKxPcTnD
	Q1XfLkAnUSCLYj8OWP0+unT6gQV11RySbHiXmTV/jWGXcoCKpgvYtUweTPc0NG9aMo9lRaxOvxuYz
	4Hinw9Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNqDM-00000001Vp0-3sgt;
	Sat, 07 Jun 2025 09:51:48 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNpwB-00000001UHQ-3ZII
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Jun 2025 09:34:04 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-604f5691bceso5924253a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Jun 2025 02:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1749288842; x=1749893642; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wep7qVH6kKRWEOlGk3kF7+QndMZjc4UpPN5qp8DyFqo=;
        b=FP1icaqxdCUTh2NCa6Gd1EjcXT1pOGqocq5WX1Vhvkv9YPtHvIXrNjuGdbpacqZPBv
         bDgfC44vMNd89E/nt/kybhgTNk5mHCfvQtNE4vbiIkW8nkscSbskfpPVcfxUQsSYqm4q
         5d7LWxqQSb/YzGAg7hEjwbdlNbw0R/EqyvOQ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749288842; x=1749893642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wep7qVH6kKRWEOlGk3kF7+QndMZjc4UpPN5qp8DyFqo=;
        b=iaM5DXAalrq/jsNZnrIcebkfmGvCO1S1YjC4K6o6r/65Z2z+P1ji8cMKzGXrJBpkDI
         Sc7RW1drdu6p953HAXKxIa2xiZG6Yk2D2n1gpdlVfr4ANG2XjVMplj3AoLSQ6idGJzS6
         lDUcxNQ9sWAWEMh2FbAyoh5LtnDYCWmevr5wI+8z5l8wHwdhciK1oXMRyJQvK1a8LYth
         gIgg3Tj0bO165qZ4Ec34PXLu1fbqyPhXQ8ho2od86Ajs4InkRTtGB5HNnvtiho37vEB0
         Yqc6SkdA9hzubibwPkU4woXfZ/DK7OQXTqvCYeVv2lV37Lz8sv4bHYIwVq88k7VWFKk4
         vj6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVxasLiWAmKe6Yt0MUfm8QOMrSG3GdJeP+L/AEPzIWppy7kuB6Y01q3SprRBwuXEiLkaCweCDl9lBA8jGiAKiqJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxSpWJ3kouDhkM2lWzgmKtsmeJxj5GuBXssIAYlPXBZIYw8g2hK
	jZF+WlQvfrAYXup5/eBi2ONy6Xx5wguuRVjAVz6v2wpfBFfi/Zxh3Isux+JuZnJbX+Q=
X-Gm-Gg: ASbGncvEBRTtQ/Scm4DfnlmBO7IyzWFgIKYGStCqUT9LzDtX+0D4fKPWyZBlY2NhNlW
	YYqUlxUZ/Cs4fUjLA2xW4S1O1cDPI4Ld/YIxz8dg8mEroRtyklpLEzOwajCjzUuinR2PHeDJSoR
	XhMKj2CVKhI80txvCsez5kanDd0vbFkHL7IvGD3Obc8yUpA/ws34shwvI9OZsIZND9MNpcQV26b
	zTsbBkF48uHm2FZdnNmda8TJX2u96cudBVD9CvyS+PTQttC2zkXFAVQX1rI1M72/VCLJjOiHJBZ
	/TI8GZcqdGWWFUvk+uHYVIAylciXcFYEmywdWzs3OH6VPwksqMQDKa0RV2o1x4nz7n460PLZTZu
	LdaBj3VqrbUAizIEVOdNoerxyJCGAhoAwrT9LE9Uju91Yl5S2aS5QlReNGLBsLwsYZLzWXZCrK0
	fCun9RxwfoTbUXkwrGFmcrmrddR5Ny8liMaw==
X-Google-Smtp-Source: AGHT+IEr220dwqbHwABkZRanSaWg0ZAOBrjnV/y3GQiOc5eTmcmdbp1c3FhkJ6PtntZ9o0ybwDZdQA==
X-Received: by 2002:a17:906:1994:b0:ade:4304:6b7d with SMTP id a640c23a62f3a-ade430470fdmr89505866b.49.1749288842311;
        Sat, 07 Jun 2025 02:34:02 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-87-5-95-99.retail.telecomitalia.it. [87.5.95.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc1c316sm251541066b.98.2025.06.07.02.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 02:34:02 -0700 (PDT)
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
Subject: [PATCH 10/10] ARM: imx_v6_v7_defconfig: select CONFIG_USB_HSIC_USB3503
Date: Sat,  7 Jun 2025 11:33:22 +0200
Message-ID: <20250607093342.2248695-11-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250607093342.2248695-1-dario.binacchi@amarulasolutions.com>
References: <20250607093342.2248695-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_023403_892691_CE6A60EE 
X-CRM114-Status: UNSURE (   8.62  )
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


