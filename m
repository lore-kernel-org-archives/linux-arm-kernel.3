Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6535FE7718F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Dec 2024 11:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TQ2IkiBTPwiZJOx3g0L64WXeGUqnnVHn4KyvGu674w8=; b=5Gtl9yT+BssbaqP0RZWFcHNVWG
	MC9JquLkEAbxvzmXjHnEb88yAzYNStCeqqgo2G2eorvtgIAG39Vnj1djzxH4937OIzzxPiOZtX1D2
	BEMzt6bLADpC3w8AplpbgH4qYKRbwKY2SSQcBzuBo/3SVHcafR6iyRTkmiaS/FNB4fK8qTKTp786l
	Ud1qeud6Fu2x7PAs96CzM3rJluwzMSlBzHllZaZrPUpVM8PgDQ4KFHzoQF3o6qVpYZCuwPFiOM4IK
	1JcA11jhoasjXy2b5fy06UY8xFShT3q5N6LIJNlBSChd0DmT3ZaeYOX5th5OpJyF8wi/PqlVh7UTR
	OKyaRIEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRrGT-00000003Jeb-0Hbn;
	Sun, 29 Dec 2024 11:15:21 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRrFG-00000003JNd-3ywp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Dec 2024 11:14:08 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-215770613dbso77271805ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Dec 2024 03:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735470845; x=1736075645; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=TQ2IkiBTPwiZJOx3g0L64WXeGUqnnVHn4KyvGu674w8=;
        b=jBwNYKvQ3Q5vZvSbsmYBtXIussS8ZSrLRjl8QCgfLXMwFUWTPCJdIYFgdxEhfp4Lw+
         2toX3Ltszu3btta+r4h/PUDK3Sj97Nj/YiZMS5OIHBHkubapek1JKwv65dORF5n87flO
         ggnCkHjLjw30015P68oU/MgBKW+573clahi/bvAyZWjGNsxEuCYpnFQ2b+9UXeqd/u5g
         D24tjfDkb/RZbrouD2CSh9iTqkq4O5nP+qYlUf8GsUp2lL754FXrWXwA7zbfhFmR1Mdl
         JdfkzTHzjeRczkGFLsxRj/R2HnCxuTB4I536Cg5G1N/KCa1MkHB2H7jyRA/qJHxMMXvJ
         0nfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735470845; x=1736075645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TQ2IkiBTPwiZJOx3g0L64WXeGUqnnVHn4KyvGu674w8=;
        b=Qkd5sGz6xPlaEtua/c2wUbiogzOMOzjVIeqKgx/RHinxucaE8C9QyQe3dk6CUOm5X/
         awQlv8rqlR3gq1P1zAFnfRV2Qv93Wp6LHCNv0ZMXn255qhyLj7jvNET7cMZn2+cJZ0TZ
         foYGxL29cQksVSk0lp/2u/gFXcERCJMqW0shgCtapBQHhhHr+TRC1qzZiGAuPOUuTXvM
         6BZgtqjOhDWO9KgNl1Xp1rO3Ylw8ARGB1VpgiJFvDEKNh2uWh+wMtsF+Lh12B4Yh5hWV
         PdU5vdSlOCY11nXEPAWARXYm7FLqorIglP9IVjff+URAHl4igkX2ChQjg+F3DuTP5lHI
         F67g==
X-Forwarded-Encrypted: i=1; AJvYcCXi1piDQsaKKjfLCED/SR+xzT0zOXtL3KbYzHcpyMADiDYyYRpvTcfZqyhc4ZfPGp7b+22+vOccbJ0pkRGpWzRd@lists.infradead.org
X-Gm-Message-State: AOJu0YwLwL4ZCmmzuWQnU/6CaAAIEnlIbdtXdoJLP1VeemiJEQR7nPok
	zAc9DxOlz19yRedGlDuF5rC5XCrEJFeqBk/vPdX5sx6k46+Lwc0b
X-Gm-Gg: ASbGncvabmADnWPDkAlFhYE7efO7RZ66KI9ryWXqKFwxV2R1NSryZSTmNaczmDMGNS6
	8RDfBcv0f+RRNWh7teklzh86ezoX9xq/d3iS2M1Okxqb2MpmXgx3MwOFbK+bcvqlpFIdaOCX+Yw
	iIhPYgb+xAMq58oSYgzZYsCYGey+h94qw3iJhw9ZrUjfyN0hngAxoBn3WDCxRLWq+ueZF1iYdM9
	Ck54+j/nNenRyVSIqvg7BfqIJBAXuUJf0x7CKAnq0PeOGFXWq/ArUpGNQ==
X-Google-Smtp-Source: AGHT+IFC1QZJfqXlyjwwxcIAnkfum3t6MQ+L3yuYAABJDnspWgtVfFsqagRUXkgAgDc1Jy7GWtwr8g==
X-Received: by 2002:a17:902:d48f:b0:212:4aec:f646 with SMTP id d9443c01a7336-219e6ec1340mr390222995ad.33.1735470845437;
        Sun, 29 Dec 2024 03:14:05 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-219dca02544sm161655895ad.255.2024.12.29.03.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 03:14:05 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Nick Chan <towinchenmi@gmail.com>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v4 RESEND 0/3] Apple DWI backlight driver
Date: Sun, 29 Dec 2024 19:11:16 +0800
Message-ID: <20241229111322.4139-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_031407_005782_DCF1E491 
X-CRM114-Status: GOOD (  12.86  )
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

Apple SoCs come with a 2-wire interface named DWI. On some iPhones, iPads
and iPod touches the backlight controller is connected via this interface.
This series adds a backlight driver for backlight controllers connected
this way.

Changes since v3:
- $ref to common.yaml in bindings
- (and then additionalProperties is changed to unevaluatedProperties)
- Use hex everywhere in bindings example
- Use sizeof(*dwi_bl) instead of the type of the struct when doing
devm_kzalloc()
- Use devm_platform_get_and_ioremap_resource() in driver
- Fix sorting in drivers/video/backlight/Makefile
- In drivers/video/backlight/Kconfig, move config to right after
BACKLIGHT_APPLE
- Explain this driver being completely different from apple_bl

v3: https://lore.kernel.org/asahi/20241209075908.140014-1-towinchenmi@gmail.com/T

Changes since v2:
- Add missing includes in driver
- Fix file path in MAINTAINERS

v2: https://lore.kernel.org/asahi/20241207130433.30351-1-towinchenmi@gmail.com/T

Changes since v1:
- Fixed dt-bindings $id.
- Make power-domains an optional property in dt-bindings.
- Added missing error checking after devm_ioremap_resource() in
dwi_bl_probe().

v1: https://lore.kernel.org/asahi/20241206172735.4310-1-towinchenmi@gmail.com/T

Nick Chan
---

Nick Chan (3):
  dt-bindings: leds: backlight: apple,dwi-bl: Add Apple DWI backlight
  backlight: dwi_bl: Add Apple DWI backlight driver
  MAINTAINERS: Add entries for Apple DWI backlight controller

 .../bindings/leds/backlight/apple,dwi-bl.yaml |  57 ++++++++
 MAINTAINERS                                   |   2 +
 drivers/video/backlight/Kconfig               |  12 ++
 drivers/video/backlight/Makefile              |   1 +
 drivers/video/backlight/dwi_bl.c              | 122 ++++++++++++++++++
 5 files changed, 194 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
 create mode 100644 drivers/video/backlight/dwi_bl.c


base-commit: 4bbf9020becbfd8fc2c3da790855b7042fad455b
-- 
2.47.1


