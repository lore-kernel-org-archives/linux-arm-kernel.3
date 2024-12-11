Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 762A1E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 11:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jfzckOZQbltxC6H30tDEw75Y4uZ6lGIUQBcpNCwyAy4=; b=FmF1k6W12QeJsOK65Hc17pHlkN
	r+FmCqyR8CFg1dWDMztqIGLY88QUUDf5YfZ3VBBcwI+oKI/JfauO2Evav6s1CARTi1WVbXTIVs5uA
	9o0DAje9+7pANKQuDL6x/cUBtBROuvdfDt46LJbetsB5+xMGhlJsOcdjn8HuuejFHCCXKMeIxyfGg
	OqcgxVES3QplBUmGCXVuGAn+N5RTqfc3iT4Mlzxcx3HcVdcmMuMXEcuHRQRT2+IZAqrWa6F4fatzg
	XbKEJxGNmvPc9kH7JyMh7/00T71cVAKrd0NvnGWNAhfkGzdlKeXx376+8Yk5syoX1yLNCUpZi7ETO
	/l4yOo7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLL1X-0000000EjKG-2rph;
	Wed, 11 Dec 2024 11:36:59 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLL08-0000000Eit0-0fjz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 11:35:33 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2161eb95317so47624205ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 03:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733916931; x=1734521731; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jfzckOZQbltxC6H30tDEw75Y4uZ6lGIUQBcpNCwyAy4=;
        b=Y2rU49xFCbUgxOEwAINWAVZrr5jLj3Tbycnff6wuZofUre8S+2o7abYGTId2tgV5WW
         p1iqq/g5BXRJsorZeQfLh58MFXvTcm/A3b/My5KqOCH7HdqGE7Pmv9xC5MGaRwWyDM0v
         sM7B/Hai3pS0gjEvbEKMuYXS3Nn/hokVfw/zEYUZw4VQ6tsprV//eduqP9AP/K9LBU+5
         ohLs5hD2wMbZ0qxzxBMjcF0EPT58wNaeIir99q4IM9/TKFvWtGgy+LKuj4z6W4B+Jq+B
         uQM7vFnkM94hq/MqzGtIHK2AAtZ96YjQ5GF+JwGX8eUPQ6nL1yKdUr87MVh7zwNV3agf
         Qkow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733916931; x=1734521731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jfzckOZQbltxC6H30tDEw75Y4uZ6lGIUQBcpNCwyAy4=;
        b=GIYsHr8JmCE2N6qxSgMjX7+96hBTh/JtQfJaj46+eppKnReea/bkf4Z+7QPjvZ7L11
         nbw9G1dkl3TA/XhnmJUtMlRcHniOnThPUiI9lyfmgQ5OSnssjAhwmnpHG1mxBCoi9r+L
         GLmdZlHlLe8FJv0n2QxHA4CsK8blv1ftMakt7X652kKLyDfJ3suorpdWaFwhsjDH1Tbg
         lLwtAU2R2WpuKDdws3XEq+yVVs8eQPbT7xos0nFMqvnTuFyHOJ1xSTE5shnbq+PEVKN2
         UmMXhWBblk+8GrZ14zDaaVZ3ywRd9cGOuEPtWopFOucjjeumPCQigG9NIPD0HQdHcjbx
         8tDg==
X-Forwarded-Encrypted: i=1; AJvYcCX1H3oPPsF+/DANrwtlo56CKuyRkC4MTG86Y6UDE2ql+Jx4rahSirL1fwQ+U7ysy2vB9EISw/1Nm9HXJQ1ZczkF@lists.infradead.org
X-Gm-Message-State: AOJu0Yy41RGiLmvRVRj4AlAKPa8vIQGtxI0owg/W+59W754jY8q6Q+ZH
	1a8jyFrRwj3LiTkEkQOu+GQ9H2HiQdD9jH0eSGBEWNDPfYYgC7H9qhBk3LXK
X-Gm-Gg: ASbGncucBrsvqWV1ugz47dZVJ+GoYLW6ZaTs6dE6VkcHBRhX4bjvWqHy+CyghoLSzDe
	1rggeCGy+sJEJYy6x3W1y6hyy29NfLOI1IibDeLjZPlUBFVOxYt6e0eKSubbC5I6UghdQWj/9nN
	W+L0viJIwEA8YqvbxnCax+jgXnick4dn3bWJgfjorJ2njeVF8Z6WQ+B1vgoHO6gKbWBrYjG8W1b
	KW9Yh4KphBfmH6RI4ER6SP57VF3mnnl61jzpUVK9mKri/ZvHgdG85c6t3iRoW1dFslgPg==
X-Google-Smtp-Source: AGHT+IFh+SOIc2pSK+oc73lJ9XAuJ74bWyxa1vkuaFSPTypJbOqSoOBkbcihWmoq5jPUmTdegrgTaA==
X-Received: by 2002:a17:902:dacc:b0:215:b75f:a18d with SMTP id d9443c01a7336-2177839599cmr40156315ad.11.1733916931480;
        Wed, 11 Dec 2024 03:35:31 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-216404df131sm56765635ad.203.2024.12.11.03.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 03:35:30 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Nick Chan <towinchenmi@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 0/3] Apple DWI backlight driver
Date: Wed, 11 Dec 2024 19:34:36 +0800
Message-ID: <20241211113512.19009-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_033532_195800_A7B643EC 
X-CRM114-Status: GOOD (  13.48  )
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


base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
-- 
2.47.1


