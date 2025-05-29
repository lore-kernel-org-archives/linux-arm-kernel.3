Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08636C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 15:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xTXx7XXdzk7EWRnp78xo+LM1GM1iIdxfMvNDWhkbA/U=; b=Kzp9FkQKpk4QmihRSeJAT2ID6c
	CKrhRFuHvKWMC1YUMqG4AiZxq2WZBJC6ezq99BsO7Bi6Col9z7G+SGmfRkf7I0b6I42wp0yX+G+4M
	qLbBpmb+u5xKPUxFRUWKXs7iTOxwMfuIT3nJ1QxYMZqFza9cdnKCO/Z6TXyQVrMRKQIlqKphayR/f
	qcyXcb/IBFUkxOoJLcUldqy724h18r5zEyXxErLe+4tqPwvL1rE4yNkmlRyLUryAnzmKVm1iqFElU
	VELT60OmCP3OzYNcONbXP4tdYMvv/9l6CJAbDBI0GXmU7VOu72VmHCO5uuKALwtFDmSx0lkiFUCMq
	Tv8NoCcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKfGJ-0000000G50Z-0Hg7;
	Thu, 29 May 2025 15:33:43 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKeMX-0000000Fz2J-1rIG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 14:36:06 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-6045a8a59c5so1644842a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 07:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1748529364; x=1749134164; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xTXx7XXdzk7EWRnp78xo+LM1GM1iIdxfMvNDWhkbA/U=;
        b=e/zFWlG383yQWw7GetB94GXPQEAdMmcXs1HPzjy5iJUBZmaMSVK1xtmWd1dikrmY2R
         I7dRetZ6cf5cCk/MS/SYmCqkZzXpG+8Ak9dZM+FSmEIeb+QOmgXu4NXI/IcgE/t/XPaX
         kt67Sr15RTiDQjGyrd/SSWWUb2s9nlX50nj1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748529364; x=1749134164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xTXx7XXdzk7EWRnp78xo+LM1GM1iIdxfMvNDWhkbA/U=;
        b=ekYS/u0o454o1hwZM8ia6jpT90Bk0LBMg00kWqw5KeFUrgHijyHtOAuMGX69e+HT+Z
         cr3Gcnc7nPSMHVvO0H4+b77ihDRagob0O56sIfFswshBDlIpn+0sJ90TyMf0Nn3Cc3vh
         mHGGqgOnrPQbkXo9ttzQwb0uNTN/ef6hV98M0gVeY0p3Oe7zsYGEmlVqgO6+HXA6fbLo
         1TE8LnKi5uopbhqe/TnFvP90RoheM5iM8FJJG60yotaFpM+EOutWrQF1w2OAWQagAO2z
         Lva2TOdAzJTbgqGF2R8GU1IEBFh0LbnBqyz612b5qot/GSX9TA6A94icClFvXIICjy75
         x2XQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+wUkFJHx8QB8ptRVILxSi2YgkiKE1CkufSyVrOudmFtAwMUNLmbcYNjq+uLVKEET9eva4GaXlIjf98d3Ndno9@lists.infradead.org
X-Gm-Message-State: AOJu0YxyPsujOL4oxlK29PDwAr406RMEINg1BjYShtBqKGX6CWhknyRf
	IlXQ+g+CxJ5gf8wJL+F7SD4Xu17xSKHqndSOSfTkbnkkVEMBrszP1kbfcia4XRxRO9o=
X-Gm-Gg: ASbGncuJ6CEop1GhOidQTq8SUGwhSKS9z1aBUxvkk2v5aVrUtltLI37UMckVau6lkrK
	OK5j3Tc4L6vpwyrQmiavX44iQmKS4KerNV5t2L1lKKfZbCS92IoQqVx5AScnAA8RAt3VyQ8Rt1x
	M3zpGRVauEGFUO0XXrqalBo1XuN52L1QCnXPQikQ6dnlIJEPh2o+ect9H4ELoxW3TX8rQV1gPin
	+CAkpE3+9CzQC5PT0iNQUniMCLYkL80rlLjOZBMd6oU5H2BlNJ52T30DQcYPUddbR+jOKW2pP/f
	kdvRTKU4wVtfzaxJCir+IWfO7kiPkvzq6IBJwLWtoqTcSgUl7zCDvK+IUiJQV4UtAFGXhaK2Cmb
	PyiIUKxW4EMsU4QFj
X-Google-Smtp-Source: AGHT+IGNd99MwT3JpoTl6fZS3HsjpB6dOJqE1wiiL6YvPMiOlp0uVZuWybnPHDsSV0wIHKZmVqHGfA==
X-Received: by 2002:a17:907:9611:b0:ac3:3e40:e183 with SMTP id a640c23a62f3a-adacda55ce4mr238586366b.3.1748529363612;
        Thu, 29 May 2025 07:36:03 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d7ff075sm154305866b.37.2025.05.29.07.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 07:36:02 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
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
Subject: [PATCH v4 6/6] ARM: mxs_defconfig: select new drivers used by imx28-amarula-rmm
Date: Thu, 29 May 2025 16:35:13 +0200
Message-ID: <20250529143544.2381031-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250529143544.2381031-1-dario.binacchi@amarulasolutions.com>
References: <20250529143544.2381031-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_073605_489503_5801C39F 
X-CRM114-Status: GOOD (  13.01  )
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


