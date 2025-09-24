Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06192CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 12:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=G9cki+WEYd1Fo4/29vxQI9Qu3AJnUGwvEMisLWPLAZs=; b=tc9KMui+4sszFP
	jVp45Qiw2CJwCE0fTE+QbJ9NSewbaNEom9FsnoNpWU6KM6R4An0/LQ78buL9Ti7n+Gq/VTDc/i8b+
	KVW3pWapIBS7o0PSrYlHKi+iilxW0ciRZDlmvfdDEssSnVFRHDrk/IIhuQFG+zA9+ROGjqaT7gS7m
	t/Xf5WRiYayLQsalFvOqfEztmH0DqrxiEU9nJuHz2tOEwujYUxMUpP00NCCUqiHOrPLUhTodEGjX0
	p5AUpO+/Ttrd6s1AGFYTzbaj22wH1IWWTEM/FGuyY6UWFSxskfHtXtVAoerdw0cSQJjt9WMemDu+z
	fv1YkStVFc1EI/TOs7gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1OcH-0000000HNoR-0sF1;
	Wed, 24 Sep 2025 12:29:01 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1OcE-0000000HNnI-43pQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 12:29:00 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-780292fcf62so404077b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 05:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758716938; x=1759321738; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G9cki+WEYd1Fo4/29vxQI9Qu3AJnUGwvEMisLWPLAZs=;
        b=D2ekvZvXUwJDcI5rQEDPppoQI3AUhCOcgIsQ523NQAcIZ7bUHmGUIgNd2Fk6y3Izxf
         d7VWBkBT099RxlwO15WzB+pvtkco5NfJRvMG8vdavJ4bTV90JoWZMrtbem0QQu3sEG+J
         X+rcp0YoRETBwoHJEpNHGn8II8sgkTvqq5rTf1/SsE/u2sp7W6Y3TE3xBZr68zWq8DWH
         2Uw2yzYtT77SIQ9PHKbTxKzdiXZVbPY+kdSVoZ8RFOTsvYGpb+AOrVwRXh/GWQcWuiQC
         tJJt+RexDbbqc4lAXrE9Kut/qRzsWAwioEYrUa7NsxOfobMp9+YcqFaHgU0xgt0WaJaw
         /JKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758716938; x=1759321738;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G9cki+WEYd1Fo4/29vxQI9Qu3AJnUGwvEMisLWPLAZs=;
        b=CCb8QLSh0e9il0CbGohdnkOTVWrUYHRlkZkXJHyVQwju/7oiM1VFY9s/eYYrvV5tSz
         jP0whzVsfGLDmam2tdH2gYVdwCUIxutxJkHV6hFQWn52/UQm+Vfo3qy3uMcAU9m6U1zJ
         Tj3mwUYmQR6ageB0HapBHDzaqPdpmU5bOPPqwV7ylQbcqK/hcSJWatLVXn2KGZrEA88Y
         uMFT06X1mSs5DJBDz7w68Qm5b8jUDADQR8n3XoWHuYt/G7sDUd1bl6vsiS2EezJmi6Yb
         ZQZebSeicrsJMhwhPN+yZDmfB95b62/FsV31N3Y6fWZMrZ5CR9dHy/gl5EQLopRCkllU
         wZNw==
X-Forwarded-Encrypted: i=1; AJvYcCXP4LPfhSOLOyYg5WP47oS5Xo7d1wrHjmKITTDlyQ8+ke+exAEdIufZRiKj75sJ41V8MJgK2IbArk+o0AI6LlEU@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0aNO/BVv/b7thRKZatvYCEtvnHpC+AcIIQ26/lgpgIKwAUdMv
	GFOj5tD4dG6iBM/lbM11TdBRVbwl/e5LFXFop3VutlR6gfwMDJJ7KgZE
X-Gm-Gg: ASbGnctEfvz3a0h90728NToLqURFCAe6dxhs4xpPpO0f3EW9bASmwBXcMHJlX7tfX4U
	t+ihmt04U62UI+v4WJbx8D2qfdJb9JaDHSPsPdD7myjeVi5BciZgC5Zn8+itrKAFtuK8jbc2aeI
	0dtUlHGo3xPNAVox/8y69eWKzOC035FmtnGvtq67595fUpyInQNISkoRP7XrNX8jgvXECGKtNl/
	XpB2cDqnRkEL/4JsIji+HA/U0nyN8FDlaFctChFPb14XZn0jotUsRqkoq+4Ru/fELZ0krEXEQu8
	W6EfHlWNhXnSGXcTsmjLd45z6QsXRE6B4W1d0etaVKir1e++XYSoORW6o3cmhsQxWe56lkREUY/
	CljSoiLYsCnPtyVmclTxqCug7iUKzFqc42yc3DmJVCf1JL9aQ4aPpbmUP2zTBxebXWAfAP6L1hM
	8o++vx119FnVeAHtQaNYFPBt8bjzOnWgVW1NOrh8xYvWMMmQtKX1vEBJKVyPLq/ZUj6PEgQP0AC
	AS5j4AqY+yeOPa1Ofv8UGM=
X-Google-Smtp-Source: AGHT+IG4MBG8e2v0+aWHeqFMOXrtFI9OgNz+261XXbIkXToJkywcJkLjC2xVVDMaTiVwkRv5RMwAtw==
X-Received: by 2002:a05:6a00:2e1f:b0:77f:2140:9685 with SMTP id d2e1a72fcca58-77f538b5bedmr7501268b3a.9.1758716937676;
        Wed, 24 Sep 2025 05:28:57 -0700 (PDT)
Received: from 2001-b400-e384-7809-32b4-db27-121a-a0aa.emome-ip6.hinet.net (2001-b400-e384-7809-50d7-4f66-57aa-588c.emome-ip6.hinet.net. [2001:b400:e384:7809:50d7:4f66:57aa:588c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f254f8f68sm11058495b3a.56.2025.09.24.05.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 05:28:57 -0700 (PDT)
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
Subject: [PATCH v2 0/2] Add Meta (Facebook) Yosemite5 BMC (AST2600)
Date: Wed, 24 Sep 2025 20:28:49 +0800
Message-Id: <20250924-yv5_add_dts-v2-0-39a4a8e3c9e6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAHk02gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDI1MDSyMT3coy0/jElJT4lJJiXUsjM4vEZEOTlLRkAyWgjoKi1LTMCrBp0bG
 1tQA6ljkcXQAAAA==
X-Change-ID: 20250924-yv5_add_dts-9268ac14dfc0
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, Amithash Prasasd <amithash@meta.com>, 
 Kevin Tung <Kevin.Tung@quantatw.com>, Ken Chen <Ken.Chen@quantatw.com>, 
 Leo Yang <Leo-Yang@quantatw.com>, Kevin Tung <kevin.tung.openbmc@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758716933; l=1114;
 i=kevin.tung.openbmc@gmail.com; s=20250924; h=from:subject:message-id;
 bh=tFiVhe6+5SAbHrArHEtHiWSR8X3PeSACMPBwCd3KpFk=;
 b=UVVmdvPWigN3kriTk9rFgPHT54UndEAYVQbKwdxLVCvi3Ykim8QPI25cmLzYR2LAl+p2TcHn1
 rIlr8+vvbiuBSzH9fppX5Surc2xp6nYJoqru68dzes7KNcXqTMNtibL
X-Developer-Key: i=kevin.tung.openbmc@gmail.com; a=ed25519;
 pk=PjAss0agA0hiuLfIBlA9j/qBmJaPCDP+jmQIUB6SE7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_052859_019583_6A48382A 
X-CRM114-Status: UNSURE (   9.27  )
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

Summary:
Add device tree for the Meta (Facebook) Yosemite5 compute node,
based on the AST2600 BMC.

The Yosemite5 platform provides monitoring of voltages, power,
temperatures, and other critical parameters across the motherboard,
CXL board, E1.S expansion board, and NIC components. The BMC also
logs relevant events and performs appropriate system actions in
response to abnormal conditions.

Change log:
v1 -> v2:
  - send v2 of the series so that it's properly threaded.
  - add idle disconnect to i2c mux.
v1:
 - create yosemite5 dts fils.

Signed-off-by: Kevin Tung <kevin.tung.openbmc@gmail.com>
---
Kevin Tung (2):
      dt-bindings: arm: aspeed: add Meta Yosemite5 board
      ARM: dts: aspeed: yosemite5: Add Meta Yosemite5 BMC

 .../devicetree/bindings/arm/aspeed/aspeed.yaml     |    1 +
 .../dts/aspeed/aspeed-bmc-facebook-yosemite5.dts   | 1068 ++++++++++++++++++++
 2 files changed, 1069 insertions(+)
---
base-commit: cec1e6e5d1ab33403b809f79cd20d6aff124ccfe
change-id: 20250924-yv5_add_dts-9268ac14dfc0

Best regards,
-- 
Kevin Tung <kevin.tung.openbmc@gmail.com>


