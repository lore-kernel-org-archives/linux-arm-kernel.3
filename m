Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0864C7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 07:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9Ulo2IqCqK6lmTR1n2ctrbmpkiinWsFuA6QDYyT+/w0=; b=igsVKUWPkk2fVN
	Tts/1W5KIFHxu/bgZGSDlw7ngSAFdjdaXQGrAwhHlZJ+mcYDNqQ5A9n7e2NlOQkMn7T4CICbCLMLe
	L1ZkiUMeEoND0PpaImn5FzJyD6x+MM8IDWXqeJmI+KNqgLj2oEYoQ4C/Q41QsnSGGoUxY3oggyAs2
	1WSLhlGA8pFCGiE3Ou2iW1wh0zzc5vD/0mPIooi8wz9J93X2k20+r0uWC3wi6IvozQmumN03DSTK/
	pIr6W9qN7LRynib+Jw4ciw90g2uwbdXIfn7McKk4oXrZ62XSF37qxAb+OwrsFi070NV+/VO2ia76J
	HaZHQYsmLIxtfwKHg9Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV3m7-0000000DruY-1tVR;
	Fri, 27 Jun 2025 07:45:31 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV3Yd-0000000DpbO-2iHf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 07:31:36 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-74931666cbcso1742805b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Jun 2025 00:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751009495; x=1751614295; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9Ulo2IqCqK6lmTR1n2ctrbmpkiinWsFuA6QDYyT+/w0=;
        b=BpWjL00UgK/pE1SZiH60JxgbI2LuwsXTpTmRp12cWaodmdyuZSlCmyw8JfNdtV5gQI
         2qcj53L7VGE8FlZBMikmzwcreJ1Vwbbk5hUW978qch84kBXPtVKPAewdfOF+LycxYT+w
         VR6v2FRTWcxnNzukdU3tkX2coma4ZrdRkpYCTwx6wmK2FLdm2wCSHadUxOZxLCBUoZg/
         pLxl4zDFJNl06vIfftIkhKbETvzwRueh+Ff0uZjscSKyMJFeH0Ho6gb4GaSVWZuIXdCl
         Z6XfXAsT25kNmRuJeFpEOJtjfDpzvdjcAGE/SvV+dm3oRzMYFKatuYwAkfzsRP9OwJPc
         pP6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751009495; x=1751614295;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Ulo2IqCqK6lmTR1n2ctrbmpkiinWsFuA6QDYyT+/w0=;
        b=twJSG0WFNJQJ/4NeJM1/jtla14VD9EBT4bdM0D5qXholYLRn6r8VKDI8aOsZl+iXRJ
         E9gryrPjv8TDTl1h9x+1PTzNYoj9TGU/DU/jopVGsHZYTmkzuMBJsOU4Yaf9lu4ol0xD
         AUztyF5JWcHeo5dhVHYyH8nqBedDvLQAMuGVXOUcYE4sbKC7+npljuWNS6hJii6Dvi5J
         7u8shLZCx+jShozkeW1s802vu84KgXYo2cs76yk+92HqKMaxmn13idqt5x447RU3WLyQ
         wz+Y2thzobTNf4Q7dt6jpTO9YHYWV4dikMbO0AqCoOiLkRKoLLGy+CWoS7ZWjAktc3+o
         5/mQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1BpN7FnrLbs19gj10B0x90uzGnOLqMdbdszgJeGN89ismPGJZXaKaszAfPqFDz94owdYk/4uwCqRKJDdiN6Y+@lists.infradead.org
X-Gm-Message-State: AOJu0YyzGh62yE98+gcCwCiMSToRsJNT4uSwcgZJorjs3GKdkpTD2ZL4
	3bzG8W9yP+6xOcGqwC3diS2aYAIcEUelh/XhlkYcNnGFM+4pOO7Hd3Si
X-Gm-Gg: ASbGncu0ZzOOO4r2NWlZyaO80IJ/uQBnCpCmUKBdw52vBtgLx48DZFCLecU0dFBQcip
	ZyhXD+MpQbLsuXuxWjI/GVuxRwNk/taJAHPXx+WwRs3QaL2H2/O4s6sUEqC+cdX8hsXBKRzOWU4
	O/89qXZRZdJvqJBz9bSgqzsUlEisg3TdJDRhbB+JBsryBv/gXrieKtUe6VlukuSdxXdqf9zDKJM
	lmP5BsLS+X44qc43g/75Lu3I/ahoqR8IOiGwsS4WnDFr8iiGqgN8JUMT6Ega8Qt2U5YO+9RIBXy
	2ZfN0dnokuGwCvvYwCXry5xgXKeSUXn0UoN2oCfqPpkeghKcD7fcaAVZ0VvehzfcOzKalJ9kO6p
	3bynjeKuE1+omNtSrY76DzMzdXJDMTrI=
X-Google-Smtp-Source: AGHT+IHWPxrtW7uCSMjhE308lVU3QsfpWpHidLpZ/iou98J5zU0NWKBg4cfBpKfITecjKJM3Ydlp0Q==
X-Received: by 2002:a05:6a00:18a7:b0:736:4644:86ee with SMTP id d2e1a72fcca58-74af6f4078bmr2943654b3a.14.1751009494749;
        Fri, 27 Jun 2025 00:31:34 -0700 (PDT)
Received: from [172.17.0.2] (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af540a8f6sm1628646b3a.12.2025.06.27.00.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 00:31:34 -0700 (PDT)
From: Leo Wang <leo.jt.wang@gmail.com>
X-Google-Original-From: Leo Wang <leo.jt.wang@fii-foxconn.com>
Subject: [PATCH v5 0/2] ARM: dts: Add support for Meta Clemente BMC
Date: Fri, 27 Jun 2025 15:31:20 +0800
Message-Id: <20250627-add-support-for-meta-clemente-bmc-v5-0-038ed6f1cb9f@fii-foxconn.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMhIXmgC/5XNTWrDMBCG4asErauif1dd9R4lC3k80whqyUiuS
 Qi+e+WsDM3CXX7D8Lx3VrFErOz9dGcFl1hjTm3YlxODS0hfyOPQNlNCWeHkGw/DwOvPNOUyc8q
 FjzgHDt84YpqR9yNwb2QwzvdglWbNmQpSvD4an+e2L7HOudweyUVu1//oi+SCo4XgnEc0Xf9BM
 bbfK+SUXiGPbGssaucqecRVzXVgkYT10nh47uq9q4+4urmglCYCMg7ouWv2bnfENZuLHZHSxgk
 wf911XX8B8kX8AOABAAA=
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
 bruce.jy.hung@fii-foxconn.com, george.kw.lee@fii-foxconn.com, 
 Leo Wang <leo.jt.wang@fii-foxconn.com>, Leo Wang <leo.jt.wang@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751009491; l=1868;
 i=leo.jt.wang@fii-foxconn.com; s=20250618; h=from:subject:message-id;
 bh=9fRWkgV+8VP7UmRHkuiRfuz5hfvvERiwtk8L614dD50=;
 b=0XsbKwFEd4w+7PzCss2Nmt2rO/8TFCmbSJs+qdTQwzawMciw4D7RjYyp2vdqVWZKISYobWBP4
 UD6tzE6U0MHCxtObyeLMadTp/GYPRXTWeuWWAPR/jwtI7cNH8Isi1zI
X-Developer-Key: i=leo.jt.wang@fii-foxconn.com; a=ed25519;
 pk=x+DKjAtU/ZbbMkkAVdwfZzKpvNUVgiV1sLJbidVIwSQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_003135_691796_DFCC980B 
X-CRM114-Status: GOOD (  12.58  )
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

This series adds initial support for the Meta Clemente BMC based on the ASPEED AST2600 SoC.

Patch 1 documents the compatible string.
Patch 2 adds the device tree for the board.

Signed-off-by: Leo Wang <leo.jt.wang@fii-foxconn.com>
---
Changes in v5:
- Remove accidently pasted texts.
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
 .../dts/aspeed/aspeed-bmc-facebook-clemente.dts    | 1291 ++++++++++++++++++++
 arch/arm/boot/dts/aspeed/aspeed-g6-pinctrl.dtsi    |   11 +
 4 files changed, 1304 insertions(+)
---
base-commit: 52da431bf03b5506203bca27fe14a97895c80faf
change-id: 20250618-add-support-for-meta-clemente-bmc-941a469bc523

Best regards,
-- 
Leo Wang <leo.jt.wang@fii-foxconn.com>


