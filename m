Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E48FC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 10:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pA6OisM0xiSXM2QYlyPmLpjSFc9U7oYBc1YKa/QuGPA=; b=fggoSC4FLzvLxc
	TIKC3e4WZtvjz6wxYy6y4JkwHs0kuHP31cSBsL+j2VvYvz6uE00w29jYOdP1zCpOU7pXr3VtZMtei
	8KdlnYSL4kHUPo6WWhfsQPvKaC+XHP2lMkf1wq9obxvyktMdCp53V851wtgl6X4QNXm33C3rZFAfF
	4arRxYfg8rCST+YhTwnAR6yDks8nzshWdt3yQsRe5oeUa3LEgZ5eIB8TTFBnpKa1V4U2DkU04dqH/
	kEEyNt/29hxgRaTenl41RE3ZLFot/0l7fQ3mCLjy+IdAPHf4gvYwBmwnd0D5KezMZgf+4o6ANkqcv
	kjeY/cYQOXbo+xkTRUDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um8o1-0000000DOQZ-07uI;
	Wed, 13 Aug 2025 10:34:05 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um8LP-0000000DJkO-2Ylj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 10:04:32 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-31f28d0495fso8648694a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 03:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755079470; x=1755684270; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pA6OisM0xiSXM2QYlyPmLpjSFc9U7oYBc1YKa/QuGPA=;
        b=DZeio7/n/5vsiBddxfWItVwLaFnBYlRreCZVCErX+tlRIlp9OXKssER1ud5dUoFuuX
         Y8KSNW2ACBOII9q2+2cGl1aFtpDWMqyRHvq6g3zCiK3XwTzKdFNwrfwQTL25inM40dc8
         CiIbzB8J8hrCoo3/e/EsqK3bD/zj2UqQme2m4vbyVCcknQIEe+1TpK2he33/dILunCIm
         PIlnyR3mChL0JQDcwcgbc0x1EiFKckYfhbMMnkUrHO5JWR6xjbSHZVWp+6QD/dtBqefk
         ZHnSuVHqnHeS6TjHVkc10gR2uTOi3XM67G5h7UzqppFb7WG9062dX143pJnh4SMk7af/
         pf9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755079470; x=1755684270;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pA6OisM0xiSXM2QYlyPmLpjSFc9U7oYBc1YKa/QuGPA=;
        b=U+YsMVFQ5hT5zKiChpJdKSjAMnywSGejiLrqxDWWwHNTgwx5bJ1xyoqKVLJIxPTR3R
         uCeDmZjceUZ56G+3qotAsfzpFxecn1K/9PFEQ+h3bZVHqcI1DmEAVpTh0kTVNqrF0tjS
         8Zyy9W7DCRYwLYB6z9Uhl9eYPNQ6M9owV84gCbrYuMunzxYxXVheMqJeimXtbk/vBr93
         zg4L/ZKl6GKkFEREQV4uuC92y0PmD6VNH2w0OfSunEJcESmr8euc6HC/2TwvUNN3Jaeo
         o+Id6qp/vdCZLFk8GfeGSdgEBNegNYM1Aeh8uSPYuSlQ+JGd1Ilj5AuDvsPXYXR/x1KB
         ygDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNDIYb3FNOudliNnoOy1NBvIK2xSCkVXM86/GRAIUFAP5zbdrpPizh+9akY5M4XvWGfuU+a7ni4TlzzsDUvma5@lists.infradead.org
X-Gm-Message-State: AOJu0YyguIa4U2IEaWmiEB+Cii/ue60wB64CUaqNSUV3rk7JwVucD5d3
	13YmNSY/8cWJXZ7u3cjcziM+zPUo5ZFO1Lk1yszVqPNGOpoEHjWyRU5H
X-Gm-Gg: ASbGncsslwnSwwpcO0T0CwYP0YUqsh2PtLQQaCULs+BotPvDCLTOCpgO5z0H/wnuRFk
	03nJHC9LHpXQAmZ7B/WJ+J6gS7CEwFTtgPFtqEgd9oLAx1fEwDG58WHDSLh0ByDjI4kd6Vp8qiE
	G2tSZfZVXmcrgftorSA9v6jhiyDBxX//G8w+wJ8j4YLSnk/qC7seZfl0kVWVwdBV0YvbtY4x3fp
	PPc3Wo2UutMptyR9CYSTolaDQKWi/3Rhp8pGuC5tGIfujbeebnpSNDI8h7h6WDYn6iKP1CkWO2c
	Sqsgn1mzPRJtgS5xKxoKhbRb/ogeQ/ch8ydYBwhF6INP8cI2EW2ihS/ZEr5cQj5W+lx/QMGNiV5
	zHnUpRuuAQKJ2MjtP+Xs8peMsA3LzNROHywlEYfBOZr2Co7OuTAc279zHgcwCpJRLr2Kr+TWB+C
	iquw==
X-Google-Smtp-Source: AGHT+IEGRUvzVmCw1gWq+fPL2z8gPf1Lc1jO0/qbCXCywxlp9sv7Gs9Tm2YFFW1IY+GR7t19aZAzjg==
X-Received: by 2002:a17:902:e889:b0:240:a889:554d with SMTP id d9443c01a7336-2430d21d1d9mr41164265ad.45.1755079470435;
        Wed, 13 Aug 2025 03:04:30 -0700 (PDT)
Received: from [172.17.0.3] (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8aabdedsm321545335ad.167.2025.08.13.03.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 03:04:29 -0700 (PDT)
From: Leo Wang <leo.jt.wang@gmail.com>
X-Google-Original-From: Leo Wang <leo.jt.wang@fii-foxconn.com>
Subject: [PATCH v11 0/3] ARM: dts: Add support for Meta Clemente BMC
Date: Wed, 13 Aug 2025 18:04:12 +0800
Message-Id: <20250813-add-support-for-meta-clemente-bmc-v11-0-8970d41f88b0@fii-foxconn.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABxjnGgC/5XSzWrDMAwH8FcpOc/Dn3Lc095j7GDL8mpYkpJko
 aP03ef00sAycI8S5vcXlq7NRGOmqTkers1IS57y0JdCiJdDgyfffxLLsTQayaXhIFrmY2TT9/k
 8jDNLw8g6mj3DL+qon4mFDpnTwmtwAY1UTXHOI6V8uYe8f5T6lKd5GH/umYtYu8/oi2CckUEP4
 Ii0DW8p5/L2gkPfv+LQNWvGIjeuFDWuLC6gocSNE9rhvqu2rqpxVXFRSpUSJg2Y9l29dW2Nq1e
 XbEpSaeCo913ztGuKy1VLEZLA4P6ZFx6u5VV7g+LapMjYELlSsO/ajSugxrXFjSYEq41D4/2+2
 27dqn9oiytTAp+CgsBp33Ubt+4eXHGDBbKRdARs913BH3DLqw5Y8PUiBMqyEGlaFf/Kt9vtFwU
 gvy7zAwAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755079466; l=3316;
 i=leo.jt.wang@fii-foxconn.com; s=20250618; h=from:subject:message-id;
 bh=CjipzCBLA0dk4QE580Prr8K+4dZdrKP11N9W5AAxlSw=;
 b=BJkjd0kiA5Y8obGHU+q6FUc8+QDJ1WXZD9uSxKU29Zky8R5vRxRpNK01HbH/Vk9qthXmKFUNj
 wq0ZQ7HThYLCdP4EjcBvWj1whob5NKgQ/OA7LXugQL6ituxA13vE96/
X-Developer-Key: i=leo.jt.wang@fii-foxconn.com; a=ed25519;
 pk=x+DKjAtU/ZbbMkkAVdwfZzKpvNUVgiV1sLJbidVIwSQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_030431_653661_AA7E7359 
X-CRM114-Status: GOOD (  15.02  )
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
Patch 2 Add pinctrl nodes for NCSI3 and NCSI4.
Patch 3 adds the device tree for the board.

Signed-off-by: Leo Wang <leo.jt.wang@gmail.com>
---
Changes in v11:
- Rebased on bmc/aspeed/dt as requested.
- Link to v10: https://lore.kernel.org/r/20250801-add-support-for-meta-clemente-bmc-v10-0-c1c27082583d@fii-foxconn.com

Changes in v10:
- Reordered NCSI pinctrl patch before board DTS.
- Dropped MAX1363 ADC nodes from the devicetree.
- Link to v9: https://lore.kernel.org/r/20250723-add-support-for-meta-clemente-bmc-v9-0-b76e7de4d6c8@fii-foxconn.com

Changes in v9:
- Fix comment alignment for // PDB TEMP SENSOR.
- Drop non-standard aspeed,enable-byte property from i2c11 node.
- Move NCSI3 and NCSI4 pinctrl nodes into a separate patch as requested.
- Link to v8: https://lore.kernel.org/r/20250717-add-support-for-meta-clemente-bmc-v8-0-2ff6afb36b0e@fii-foxconn.com

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
Leo Wang (3):
      dt-bindings: arm: aspeed: add Meta Clemente board
      ARM: dts: aspeed: clemente: add NCSI3 and NCSI4 pinctrl nodes
      ARM: dts: aspeed: clemente: add Meta Clemente BMC

 .../devicetree/bindings/arm/aspeed/aspeed.yaml     |    1 +
 arch/arm/boot/dts/aspeed/Makefile                  |    1 +
 .../dts/aspeed/aspeed-bmc-facebook-clemente.dts    | 1250 ++++++++++++++++++++
 arch/arm/boot/dts/aspeed/aspeed-g6-pinctrl.dtsi    |   10 +
 4 files changed, 1262 insertions(+)
---
base-commit: b785b5d88cc27a521ea22b3afd85804c4c321d4a
change-id: 20250618-add-support-for-meta-clemente-bmc-941a469bc523

Best regards,
-- 
Leo Wang <leo.jt.wang@fii-foxconn.com>


