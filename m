Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47FD7C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 16:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GvgM2IbfWBcG4/oTfKmRrdxwIvc181owD475503ERJ8=; b=npOkK6JsHFkdi/LaqxiZsysA2V
	+xmpFGrnFbYOoNLob2MvhdzO0l/1uJdo8kaVoaLetCbywvgBIMQaJ4SdxM5Zv4W6pz9cxnPJLX2W3
	eLAD8355w/IBNTDJxVjzcbKxxEoh6AVu/YnoQgvACDHZnB1iaplC0iDv4Os2toiQQrj5uix+octW/
	z9XSuEUQ5j4vMc/HX8947aOEt8X/QAJ2/uRc5repO1x5RhYdEyyWeJ11d3JwcpDpF9obqFHRBbycT
	ngK+XRQa4TBRcIbfiC0tf+hbD5fTJGpZ2YloGj6CEmNAj2GHUBwUKku0ioO9DcZOC9azXfL63G0a1
	ia8/kHFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL2Td-000000019Mc-3jCy;
	Fri, 30 May 2025 16:21:01 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL2H6-000000016yk-3iHG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 16:08:06 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-450cf214200so18442105e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 May 2025 09:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1748621283; x=1749226083; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GvgM2IbfWBcG4/oTfKmRrdxwIvc181owD475503ERJ8=;
        b=Zmd40OoAgLJrWMQe1x6ITWeeSiIsTL0O+5HCfo0gM3q514nKD2+HsNiNsbLAif0iYl
         bF8SbMsGZDRJ4E/3uRz7jpor/zh996fbHoZbdz90KvQfhGdZrMxJ7ZI92YccqJdna4AF
         TpyyHGXUF4Kw5JwClx3sz4MdnSSopNdAsS0Z4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748621283; x=1749226083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GvgM2IbfWBcG4/oTfKmRrdxwIvc181owD475503ERJ8=;
        b=U1tUT9as4oafUwyvmfgBlphHn5b/eH3zjgXNYT0gs+Rz1B5uimTAYfhMyGUkvepH4z
         pKvr4psWw0k0MXb6k2oYh/FfcLcs1LXHDricOg9XoAYVRsQZwL8GiwXDe/zw428Spgl4
         onllSo0OPSIXaJlqpbinIRrsteOcBLIEIVK7NowaQv57um+uGwaHVyDr3cGJkNRwz851
         uD1hLPpCaTdbjuvW1j4+UELJDZrLSco72VRtCdZTFgWu15Yv32BjnftJNFLH73Ks7gRf
         UuV+5b56rdReHU3k6VWJ5p7A3pdWmDBujJrKg2DVPd407MNd1d4Dcujbr94pyzgq9UJy
         Q9Ow==
X-Forwarded-Encrypted: i=1; AJvYcCXbqTUPnby+WAPcZpWFjG1mYhJfAfRd5u8bA9H64HqATveAl/N2BzyUPss/AFjumQfNW4Qe7XrlJK4DHEr7uLiB@lists.infradead.org
X-Gm-Message-State: AOJu0YyXC4521aBjxF3qNRv/a5pA20fnTrM36de0NXSkUl4V6R4l50KV
	tHdhGZJ5uHT2sWgmByj9ikMyaoOoowkm4cgiS8daT153CwbNfWd7jo5HXrg6J74S1/c=
X-Gm-Gg: ASbGnctuMKDGyI5g6HMqrfT2LLEkcwXI1HLvVkaodl4zOQNNBxKufkQp0nVEGC8a0B+
	ANLiMOKHjEoryNAFyCygPCbgh404ZiZ6ci0lvtTnOR8PwtDPxxOjblnOOYfQ6SrYccvZDEzyBgJ
	mN5E0+S7fYTjnw8k5XB+A2umXAGoY2VfXbUeod617wU6QjXlg0mYGujeXm5sUvgA1ArGlIP/9oS
	YiES8SiNh3me57yDVwPIWS+PVw3zOwIONcHBLWNTCJS4Qj6zK4/Eaa3EpYGIuG5xpveCGgRaaam
	f8qvTSdM1KMe6D0Ayh7AYyLOQ9DrGxTU20oO8+0Zx/3Oc0KO1fJcGuTmVdQd4uuKt52LYKeMQBT
	iWNXDUr75R4OsbjV4OcJ8DnrjKHyUihIW5o4gSzsN78cW4WIvH7s=
X-Google-Smtp-Source: AGHT+IFYdaNMtebMqrcyfFwd8HXEmCu6MtcABHOw6woSEVwRzVUsS88bwdlnnTOG4SmcQTNczADG4g==
X-Received: by 2002:a05:600c:4f87:b0:442:cd03:3e2 with SMTP id 5b1f17b1804b1-450d87fd991mr30332145e9.2.1748621283200;
        Fri, 30 May 2025 09:08:03 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.33])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450dcc18a80sm9716365e9.38.2025.05.30.09.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 09:08:02 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	Frank Li <Frank.Li@nxp.com>,
	linux-amarula@amarulasolutions.com,
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
Subject: [PATCH v5 6/6] ARM: mxs_defconfig: select new drivers used by imx28-amarula-rmm
Date: Fri, 30 May 2025 18:07:37 +0200
Message-ID: <20250530160748.2476088-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250530160748.2476088-1-dario.binacchi@amarulasolutions.com>
References: <20250530160748.2476088-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_090804_922529_2DCDD710 
X-CRM114-Status: GOOD (  13.10  )
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


