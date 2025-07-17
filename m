Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AAE5C83F34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 17:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vnmPbk+SzjnQUab3zLiOuEdr6xig/TglCXCOUdlG6xw=; b=Zk4QclTx/8KDNh
	ylZyi17fDyu7ZnJMnyOE2HwduWFb0ViLQE9Hl+5kzeuotBZPJ767sesGROE3V2clRAw8HFUBn8Itp
	pBm9+RY/FZOlrvsRKevz9DDDmTagAmZUyfCynGISZg8ZF2UhPuS3/jNbB8RaywoSkVhnai8jf9ao2
	ZXftuCMU79ZbqcFN5W/TL4L8FndkzGwEFt9gat0FuyCBxMwSIcCiukbPpeOn87mqLGugCySStU6wY
	UO8H0ADyeNoy9W9pJrSMxavgoMpjIsBDVJehYB06FSkoyOEdcXJs9FOv1lAsIVfE4Ax6FhEBWuXKy
	7PwwctwkHSfDRHYWeMkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucSJ2-0000000AmBl-41EA;
	Thu, 17 Jul 2025 17:22:04 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucQ4y-0000000AR1Q-3I0F
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 14:59:26 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2350fc2591dso11549095ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 07:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752764363; x=1753369163; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vnmPbk+SzjnQUab3zLiOuEdr6xig/TglCXCOUdlG6xw=;
        b=gTTEr5oHpY5zYpvhDzzXIFL77bTSA7IN4bLEgtc2d6+w0y8oX2A1fgh6wQFONNGXl9
         e9CfaLHygmY5XvdNEzvxuUqozMCmhmCwUTDbuw7OPE13+VjEy4EfVfqyjL+fDIe/bUg5
         gAUKBGF4whFTK2iQfUC54iy/fx+2AkfGn22AC2KWjW5X3TQI0N0G63D9xyEDUo/KA/Zl
         b+xnHOu0+zTBlF1Gag5BwwG/uBVGaQirUVYxVRVL052LYdMvmaE6tstLpc2F+tyAWLit
         RPoUb/oxMO/xBZz/Jr9AdXTmHADc5Jap3a2s9O9G3ha2Y5kdS/92kvRAf+GZzL7kmQzV
         S7Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752764363; x=1753369163;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vnmPbk+SzjnQUab3zLiOuEdr6xig/TglCXCOUdlG6xw=;
        b=vJX/z4VZWR86V/84qYFnuPJQw4VGRpe3vUPf7mSBwCoAeOsCshLbi/bbCYsph9iSKu
         3Ib5SufmfCpPk5Dcffxbre44b7VmE/jk43HQbIifChfbAXoBNaa7EkAPTlf2IBTMnP+A
         rDcgsLRrjMRCsS63yyuRJsIVGinBUuEWXwR1qOT7afHFIddT65GxzFXNOITT/TSm7I3Q
         1Z2O8FoS3brZWZVJuwVk6rAIQ36K7Sm0uTteWQsLTA1gsui/A5bIF++PtMaAQn0DC/3b
         /WDmvELcNJ2KM3gU1GKjQSk5I4iPPZrdzQdwQP7FchabbdM1LA4buB3fZPuTeMSe9tcD
         XVcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCck9ufImnoxy4xy3An10ciRT5Ll8L/uKeA77DycU57lGiGGSvSJhILi4AwJZsSsORmnyY37LKNPRtCNRU5zBw@lists.infradead.org
X-Gm-Message-State: AOJu0YyzgG9fGT9uHBRE9Kd8DrgC/ZTXYbzUoIdIa/6nzheLdwBXzFZb
	IFgsRtRRVSDSi8UZA3Ij5mloVrz9lMqjMT+d9tG6o8AXZkSOx+k7Hdyc
X-Gm-Gg: ASbGncu+p41AYaJtSmjsZOPieOxjU8hXE01ZSyfMYc2HHdFssVQztdTPhovb/2mutdh
	2y//VNSYI6hIwqF/wX38SLPYvZRSN5tNuJ2TRwAE0wDsJrGkh9v8TR32eTkYNRLRqkCCRz2//QU
	Ed/XNzD4OieHXg52Fs1+1xNAKkqOCiJV8+E8wVuSEPxIqdB6OWl3YmDHGXN0VZO1BymFIKR5ryw
	MMjtu2xCLfPnA4DSyd2K3e0Cgwe+evPaqEj1QG3QZpJSCCTxvOaKZPOFCVxZcx7+SIZ4KsgbrBk
	cTkRLYdijso6J6xbjSCtd5NsoB5zrLdnB7/MfFSlTzBaueja/JPdSzv82ED4ArjT0up419Z5MXC
	NEGbBlzbDg1ouQMmmWeq72EryHY7AJxqyPcozY2OP4S9YpueRkzEJZ9EFnsFRQTDsGNI=
X-Google-Smtp-Source: AGHT+IHgkzEOYEeBylkMIDMLWlCKIz9EjBVWlMOVczHADMYS0NEj3G6AuhDKx5MYpE25LRvaHDKgNg==
X-Received: by 2002:a17:902:d4c1:b0:234:595d:a58e with SMTP id d9443c01a7336-23e38fb11efmr1511875ad.25.1752764363108;
        Thu, 17 Jul 2025 07:59:23 -0700 (PDT)
Received: from [172.17.0.2] (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de42aea81sm144603915ad.82.2025.07.17.07.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 07:59:22 -0700 (PDT)
From: Leo Wang <leo.jt.wang@gmail.com>
X-Google-Original-From: Leo Wang <leo.jt.wang@fii-foxconn.com>
Subject: [PATCH v8 0/2] ARM: dts: Add support for Meta Clemente BMC
Date: Thu, 17 Jul 2025 22:58:58 +0800
Message-Id: <20250717-add-support-for-meta-clemente-bmc-v8-0-2ff6afb36b0e@fii-foxconn.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALIPeWgC/5XRTWrDMBAF4KsErauif0Vd9R6lC2k0agS1ZWTXp
 ATfvXI2NdQFZ/mG4XsDcyMj1owjeTndSMU5j7n0LZyfTgQuvv9AmmPLRDChmeFn6mOk49cwlDr
 RVCrtcPIUPrHDfkIaOqBOca+MC6CFJM0ZKqZ8vXe8vbd8yeNU6ve9cubr9BF95pRR1OCNcYjKh
 teUc9u9Qun7ZygdWTtmsXEFP+KK5hrQmJh2XDnYd+XWlUdc2VwQQqYESRlI+67auvaIq1YXbUp
 CKsNA7bv6YVc3l8kzRpM4BPfPvebXtezQ30xzbZKobYhMSrPv2o3LzRHXNjfqEKzSDrT3f91lW
 X4A8/ldSugCAAA=
X-Change-ID: 20250618-add-support-for-meta-clemente-bmc-941a469bc523
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 leo.jt.wang@fii-foxconn.com, george.kw.lee@fii-foxconn.com, 
 bruce.jy.hung@fii-foxconn.com, Leo Wang <leo.jt.wang@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752764359; l=2456;
 i=leo.jt.wang@fii-foxconn.com; s=20250618; h=from:subject:message-id;
 bh=JMX/QgUhmqLWxuEkWEUiV/WuMSD4F4bRfw4zHmMzWUw=;
 b=O7FZv7SmN+3mZNqZcFF0E6+kINF6Do9tG1Je+dkH5V0XJWXbF2wApr0D+XWg6pkWRwXAS+RhJ
 tgITsqyOYw1AMNw2JUBAAELEhjLPkzXTNYi7iabDimDhxy6AIb8bJbp
X-Developer-Key: i=leo.jt.wang@fii-foxconn.com; a=ed25519;
 pk=x+DKjAtU/ZbbMkkAVdwfZzKpvNUVgiV1sLJbidVIwSQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_075924_826357_47C33C37 
X-CRM114-Status: GOOD (  12.50  )
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

This series adds initial support for the Meta Clemente BMC based on the
ASPEED AST2600 SoC.

Patch 1 documents the compatible string.
Patch 2 adds the device tree for the board.

Signed-off-by: Leo Wang <leo.jt.wang@gmail.com>
---
Changes in v8:
- Relocate IOBx_NICx_TEMP TMP421 sensors
- Enable byte mode for i2c11
- Link to v7: https://lore.kernel.org/r/20250716-add-support-for-meta-clemente-bmc-v7-0-d5bb7459c5aa@fii-foxconn.com

Changes in v7:
- Relocate CBC FRU EEPROMs from i2c13 to i2c12.
- Link to v6: https://lore.kernel.org/r/20250708-add-support-for-meta-clemente-bmc-v6-0-7f3e57bd0336@fii-foxconn.com

Changes in v6:
- Correct Author email to match Signed-off-by email address.
- Link to v5: https://lore.kernel.org/r/20250627-add-support-for-meta-clemente-bmc-v5-0-038ed6f1cb9f@fii-foxconn.com

Changes in v5:
- Remove accidentally pasted texts.
- Link to v4: https://lore.kernel.org/r/20250627-add-support-for-meta-clemente-bmc-v4-0-ce7ff23460c4@fii-foxconn.com

Changes in v4:
- Move properties of nodes defined in the same file from label ref back to where they belong.
- Move pinctrl default configs for ncsi3 and ncsi4 to aspeed-g6-pinctrl.dtsi.
- Add properties to i2c10 and i2c15 to enable MCTP.
- Link to v3: https://lore.kernel.org/r/20250623-add-support-for-meta-clemente-bmc-v3-0-c223ffcf46cf@fii-foxconn.com

Changes in v3:
- Modify leakage sensor to reflect current design.
- Link to v2: https://lore.kernel.org/r/20250621-add-support-for-meta-clemente-bmc-v2-0-6c5ef059149c@fii-foxconn.com

Changes in v2:
- Fix patch 1/2 subject line to match dt-bindings convention.
- Reorder device tree nodes in patch 2/2 to follow upstream DTS style.
- Link to v1: https://lore.kernel.org/r/20250618-add-support-for-meta-clemente-bmc-v1-0-e5ca669ee47b@fii-foxconn.com

---
Leo Wang (2):
      dt-bindings: arm: aspeed: add Meta Clemente board
      ARM: dts: aspeed: clemente: add Meta Clemente BMC

 .../devicetree/bindings/arm/aspeed/aspeed.yaml     |    1 +
 arch/arm/boot/dts/aspeed/Makefile                  |    1 +
 .../dts/aspeed/aspeed-bmc-facebook-clemente.dts    | 1295 ++++++++++++++++++++
 arch/arm/boot/dts/aspeed/aspeed-g6-pinctrl.dtsi    |   11 +
 4 files changed, 1308 insertions(+)
---
base-commit: 52da431bf03b5506203bca27fe14a97895c80faf
change-id: 20250618-add-support-for-meta-clemente-bmc-941a469bc523

Best regards,
-- 
Leo Wang <leo.jt.wang@fii-foxconn.com>


