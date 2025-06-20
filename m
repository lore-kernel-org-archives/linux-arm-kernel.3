Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B26BCC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 08:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LaH9Kr0KBdWEdHexAhzixmWuUEOjZiRLNEaItTOC7wo=; b=LYOdzU2ROT9Henx2gWvhr1kUu1
	P2M+eWzD+meX0KIPUCK8Vc+y+50W0WMd9GBzYE0RWmhv7nSVCgP1FYyvCHHQwCvJqol1L4Bzj6YuH
	owr282e9glYOfXzxKb7PJkB9PI24qowsgeIUXdSWnp+p0zNX8PAiqZ5TjjB4+ILMCL3pHnvPOHwl6
	LI0+f8/8JldJCYepYNAcbsG1CBuy0MwyNKza8vL/9Aj20Nt1IJbxRyQzqjhgbie6pZKBE9eWGjYim
	hY2Hoa4aaP6WgI8MYakNVNqr4ElNfyJuSM/Il9LlBb/Al9To+FtwDsNIH5PFL5ISHVkrFBf1AVodX
	9mVwYKRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSX2C-0000000F2rC-1YVU;
	Fri, 20 Jun 2025 08:23:40 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSWlk-0000000F0CT-42Yp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 08:06:42 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-451e2f0d9c2so11128485e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 01:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1750406799; x=1751011599; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LaH9Kr0KBdWEdHexAhzixmWuUEOjZiRLNEaItTOC7wo=;
        b=bHB1ct00eyajB7hLop86OcaZLmQtLfL7s3CTpu3F9a1jbvWzACg+/C3Ywq3Mqal0ZE
         lcpaiGh/9H0mjtQcZdkwUfQk6etE/2ynqepZPXEhQ1u3Czv5IbfYwykynzCkUTiIn0m+
         AOgre8rgDgSzcKOMvPMdB5WB85yWhWkHmWXcI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750406799; x=1751011599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LaH9Kr0KBdWEdHexAhzixmWuUEOjZiRLNEaItTOC7wo=;
        b=hvfFnOQZcV4GkNNxJDd3rp5NwGl/wWZcs9JqPpDfFm3RmLarvolzJ4DXDDML2QxueH
         VGPPwmBnH64enSX2zjrpDfziBcMIzzchS6UbpLue5mK0AZFd1wysfb8LKTZzw/7SiusZ
         o3KkBy2h9sCzbFyf7HdzK3CtiEu2j07z4Bmr7aBkmQdXbQcdbO/xnblSq4i9+h9+4h5H
         6o47oaoSF5H4tR5bJ1MndE32wa3yyQleB1ljLJSXcXDeMl192DE0p7R0+7h3wXM5Xy7K
         AxZhBHbAchx5TFacw+5WbzKWetKFVAIK1pTA/fGwJhxzO929UkA/XD4FdbuSHRDIozMJ
         W59A==
X-Forwarded-Encrypted: i=1; AJvYcCUy24iAbPeOByA8MBe/bZLSEpb426LpMaB9GdrfZNz8zVpdB0xnXyNvSZrjCeI3YSqAD1E6JqL10eRyG0Uqvr34@lists.infradead.org
X-Gm-Message-State: AOJu0YzOWdw6v+8WNnYDx0nKL0ekDDXIOlgobaxb7162Jqmc4CVxUZ5v
	7DklXOou5FcP9C8g3wqptg6D/+uALLnkv86VuA74J4zceAxVq4TN+cyP5Sjo3i6rYKA=
X-Gm-Gg: ASbGncsOCKtHjMnk5U/fZMcLH/Z2KrsfGlWC77NyGZJnVm+t3pxMn/7SNpg1JXnVSES
	t2j8nQumEeAUhPkFqmfO8gDmliC6EPceLvwKxwo9ggEneMOZt33LMu0JsKb9vQDWRRLxszu9uiG
	g5rECngLLnlqvSYiJNDsdx6QGADAJccW1q673hyiQ8ROJyOSRRDnhU5Tn5EzNCZn6xKgMWxTt9z
	mcOQzL9cOsD8uIT/SpGp0M0sPCmRQ0VEwZTpPHzdlxelQRStEJCY7hmhsXNi9GZ0PRkouWwVD7o
	APmZyJAMY80wm6a2GdBYbLagQBUvfssCXrBUzAxA3MuuAdPCyKaZRFX2xhtr7+tIFwv8edk8dRq
	diLMs9zESZVjR90kv6j3GPvRm7YbQDc0u9GbLm2BiplrT7qb8boaV
X-Google-Smtp-Source: AGHT+IH7fwkHJC3cXXyAdVYkYDzLjEdQXHbS11KLEXj8zNWxo6QfxaTajDmFHgq5T93JnBlRG9Likg==
X-Received: by 2002:a05:600c:c105:b0:453:60c8:f0e6 with SMTP id 5b1f17b1804b1-45365e42d77mr9268105e9.2.1750406799284;
        Fri, 20 Jun 2025 01:06:39 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.224])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ebd02basm50137905e9.39.2025.06.20.01.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 01:06:38 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Frank Li <Frank.Li@nxp.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 5/5] ARM: mxs_defconfig: select new drivers used by imx28-amarula-rmm
Date: Fri, 20 Jun 2025 10:06:21 +0200
Message-ID: <20250620080626.3580397-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250620080626.3580397-1-dario.binacchi@amarulasolutions.com>
References: <20250620080626.3580397-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_010641_002101_5FB75224 
X-CRM114-Status: GOOD (  12.64  )
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

Select the options required by the imx28-amarula-rmm board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v6:
- Drop [PATCH v5 1/6] "dt-bindings: mfd: convert mxs-lradc bindings
  to json-schema" because applied by Lee Jones.

Changes in v5:
- In mxs-lradc.txt:
  - Fix deacription formating
- In imx28-amarula-rmm.dts:
  - Drop #address-cells from gpmi node

Changes in v4:
- In mxs-lradc.txt:
  - Fix typo Low-Resoulution -> Low-Resolution'
  - Wrap lines at 80 char.
  - Drop '|' from the description
  - Describe what each interrupt is for.
  - Move touchscreen-wires constraint for imx28 to the top level
- In imx28-amarula-rmm.dts:
  - Drop label property (deprecated) under the leds sub-nodes.
  - Add microSD comment above the ssp0 node.
- Add patch 5/6 "ARM: mxs_defconfig: Cleanup mxs_defconfig"
- Add patch 6/6 "ARM: mxs_defconfig: select new drivers used by
  imx28-amarula-rmm"

Changes in v3:
- In imx28-amarula-rmm.dts:
  - Drop xceiver-supply property from can0 node.
  - Rearrange the order of specific nodes and properties
    alphabetically.

Changes in v2:
- In imx28-amarula-rmm.dts:
  - Replace '-' with '@' for the pinctrl sub-nodes.
  - Replace edt,edt-ft5x06 with edt,edt-ft5306.
  - Drop LCD reset hog pin.
  - Add correct #address-cells and #size-cells to gpmi node.
  - Replace edt-ft5x06@38 with touchscreen@38.
- Drop from commit messages all references to LCD display.
- Add patch [1/4] "dt-bindings: mfd: convert mxs-lradc bindings to
  json-schema".

 arch/arm/configs/mxs_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/configs/mxs_defconfig b/arch/arm/configs/mxs_defconfig
index 91723fdd3c04..3b08c63b6de4 100644
--- a/arch/arm/configs/mxs_defconfig
+++ b/arch/arm/configs/mxs_defconfig
@@ -64,8 +64,11 @@ CONFIG_INPUT_EVDEV=y
 # CONFIG_INPUT_KEYBOARD is not set
 # CONFIG_INPUT_MOUSE is not set
 CONFIG_INPUT_TOUCHSCREEN=y
+CONFIG_TOUCHSCREEN_EDT_FT5X06=y
 CONFIG_TOUCHSCREEN_MXS_LRADC=y
 CONFIG_TOUCHSCREEN_TSC2007=m
+CONFIG_INPUT_MISC=y
+CONFIG_INPUT_PWM_BEEPER=y
 # CONFIG_SERIO is not set
 # CONFIG_LEGACY_PTYS is not set
 CONFIG_SERIAL_AMBA_PL011=y
-- 
2.43.0


