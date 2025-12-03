Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC9DD1BDE3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 21:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mex+iFQuIV/0Ik9O+xAwix9ls6VQnAB9P3pjCjfm7do=; b=0JPxpL+50XJtQb
	HXf4VLIjTeV1bAQJK+I98gN4CBQQuWHav7PppPZcZKUu+ZlEj6X9F2wB1vQq5/xm4lLfzfZxk1xqu
	Gc+9r4ZrMR4wbC7f7ulcTCx8QVsL9lRjVNlgp0wbsmHDdUZOjU61Y9i/pBKdE9kDS9L0gDYp5eDg2
	BhfFS82/StsM3TPTvr46TJHdFLfFkfj2qYHwQMCNt9ZjSqXPFoIefXihOb7whlN/EyrYq4fYU6cKP
	j0w0dASEk8hP1bIo+KO2H/m+qCq09D9yFk7T6VQ/fUmxjNNfFO5iJeRQKRAdOXTZu9Dot6zXcoRYm
	dJ5UFps1gbXv45YocNuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQuHl-000000077T2-0BLR;
	Wed, 03 Dec 2025 21:21:17 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQuHh-000000077Q3-0mcI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 21:21:15 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4777771ed1aso1494605e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 13:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764796871; x=1765401671; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mex+iFQuIV/0Ik9O+xAwix9ls6VQnAB9P3pjCjfm7do=;
        b=Q1YEn8WKvfr4ptCjoFDp2zddigYXiMzFYIKU6WiHIgT6dUHqY31QJzBgWaSQ2XED6s
         Rd+c3dnN/rMqgxHRrfRxmZpo/XJlZakBXYTG7JYLf1aWZwnOn51/OaSrSp9KN+YLrtDd
         p/NvMLwKGnS+hsrmys8fsZp0ipusHkS0Cz9TelfNuprr21ZZeU2sEFBQfe3eyXde6Gpo
         p6H+t3q6adteeSZsYWRAobkM0+11BNpEyXvLy/kjL61H7q2jHaKIsflfg0ZFbsE0DiR8
         clknsy1fLoBJ/bDuYZOrWjJsRkcL9bqbXzdH5d3m2Q6EEfMZH9KrBAoGv1j4Ps8XVOsU
         hmOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764796871; x=1765401671;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mex+iFQuIV/0Ik9O+xAwix9ls6VQnAB9P3pjCjfm7do=;
        b=GYW2yk+ZaFENmte6w45vxF1CxvvymrCOD8TCPa43ZQngVpcQy+McoU8lYvZ23d9J6e
         24coj5imf8xj8v9JcUfSv+t2gbly3hw/nZfkz67DbQnmHeRiTJLf6vELCFCrIyDsP4mO
         UjxwYpUFz7gdnL5EURi1fRLRCO8l1G4PofQn23UL7VIsmF27JP+VN1tght/1UfdF0bER
         OXTCnEZE+pD4e3lmbcHlyfXSYtluUXt7XqCb8w/lfnGmVB2FpoY9c4U4vrKagMvEAsLz
         Rc6fdMzXTYizq642hj9JdK0rLrkwWWBNApo4errEac7+TnmVQjXVysYWRJSA6rCDd2FL
         vHmA==
X-Forwarded-Encrypted: i=1; AJvYcCWKtXf2rqFVgjQsVKdukZWTZaZSkqyAfGS+4CO/z454liI2Q7RubvC2PuD9FkFxELy51m3A4dE69pK2pl53a251@lists.infradead.org
X-Gm-Message-State: AOJu0YwZjzUhQXaowuAVmwRdGUlMWnmAq2vlWQvzYj5bUicXx18pIbnc
	8MTotbaXGWfAm1JSo7YqejfdKGfGcEF9Zipk6qseKEl5P+nk3SlGjbET
X-Gm-Gg: ASbGncswidEGEh55VtVAkP45z0d4vEENyAkw0wd/l8T2XWOQLtl8IdMOU1bO/8ljurn
	p2Qqu4PnkYA6cjWnB/Ynp4aHD6+XXfv9xOsPKR9ZtfBaN4Ixx4IJps1QCuNVOAE3SMsKfhhxsqr
	3K4f+CUVjr4yXIxiVu9yKkxqKApkMqYz7r3UBqM2fbPs+06VCEufr4DjbU3mfR6CI6q3MSfWhV+
	H/+22/JFEoVJPWxwytNxNsU+/WiEqWA8+yxHCQ1MJyBncdaN+uMawPnSCdY13UueT1pLe8cWFCn
	5wQxHLb4AuArGQBYa6mi6MXBwunxyWR7hAi9dgrUsmYKpLpZJBgw/7RszpzuSR+JP9YdKFMZY5m
	USITa7Hluc6CfMFqlBJ8gzhh+V+S3BU4DzWbBLibqr9wju3ld+2vSiq6wQoWK8ybvFc5uGx7tpY
	jempTtUUgBsCEBJDkxGeGJH4qfmvWPFMb7Ho20
X-Google-Smtp-Source: AGHT+IFZUeelZJ5F3kqcCFdVqRaV/e//mJ7O77jwvUW4t+w4XWfk+xyTxPI1msMcQ7W3qyrTtfwgYQ==
X-Received: by 2002:a05:600c:3b26:b0:477:7f4a:44b4 with SMTP id 5b1f17b1804b1-4792aee39c5mr37314425e9.1.1764796871145;
        Wed, 03 Dec 2025 13:21:11 -0800 (PST)
Received: from [127.0.1.1] ([2001:861:3201:3d10:2034:6883:1f40:e708])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5c3c81sm41648667f8f.3.2025.12.03.13.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 13:21:10 -0800 (PST)
From: Gary Bisson <bisson.gary@gmail.com>
Subject: [PATCH v5 0/5] Add support for Ezurio MediaTek platforms
Date: Wed, 03 Dec 2025 22:20:36 +0100
Message-Id: <20251203-review-v5-0-b26d5512c6af@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKWpMGkC/23OwW7DIBAE0F+JOBdrWaCEnPIfVQ4UFhupNhFEb
 qLI/16cQ+S0PY40bzR3Vqkkquywu7NCc6opTy3otx3zg5t64im0zBBQCwTB1xJ9c6MBDGpjrRW
 slc+FYro+hj5OLceSR34ZCrkXDnslFHTSvIPec8E/U6156npXbsd+dOmr83lc94ZUL7ncHr9mX
 Ff/XJiRAw8eQ1SKyBvaLKwXZvk/k42BidZFI5WI4TdTW4ZPphqzMmof0EFQbsuWZfkBLw5LX0o
 BAAA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Gary Bisson <bisson.gary@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764796869; l=3316;
 i=bisson.gary@gmail.com; s=20251201; h=from:subject:message-id;
 bh=Zk3MEDuhj8T6cNPtbw4xHlfD+QlH5E0Gxc9yD34asak=;
 b=scneNrWemOBml+JOtmHcwc5xULmq8tCrM8Zr8z2sRVSyj2OaVoV06JTWMVP8+/0hAMYf4QNH6
 vOT4ffGhuizB97iDscsSTIEfuEInDDuEpumHDLVykke4CDOrqGdiLss
X-Developer-Key: i=bisson.gary@gmail.com; a=ed25519;
 pk=eaOrLwovHUZBMoLbrx+L1ppj+AH+TfgxkVhIEyrhkeE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_132113_284220_46D9707A 
X-CRM114-Status: GOOD (  14.58  )
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

This series adds support for Ezurio MediaTek platforms called
"Tungsten". It includes support for MT8370-based Tungsten 510 and
MT8390-based Tungsten 700 SOMs.

Changes in v2:
- Use b4 to cc all maintainers properly
- Squashed patches 2/3 together
- Updated dts node names to be generic

Changes in v3:
- Added per-commit changelog
- Added missing Acked-by on 1st patch
- Link to v2: https://lore.kernel.org/r/20251201-review-v2-0-dc2df44eec7e@gmail.com

Changes in v4:
- Fixed remaining DTB warnings
- Link to v3: https://lore.kernel.org/r/20251201-review-v3-0-07f9af7341fd@gmail.com

Changes in v5:
- Fixed DTB per Angelo's comments
- Added a MT8188 patch for easier mmc eint interrupt change
- Link to v4: https://lore.kernel.org/r/20251202-review-v4-0-93f5cd2a0d4a@gmail.com

Regards,

Gary Bisson (5):
  dt-bindings: vendor-prefixes: Add Ezurio LLC
  dt-bindings: arm: mediatek: Add Ezurio Tungsten entries
  arm64: dts: mediatek: mt8188: switch mmc nodes to interrupts-extended
  arm64: dts: mediatek: add device tree for Tungsten 510 board
  arm64: dts: mediatek: add device tree for Tungsten 700 board

 .../devicetree/bindings/arm/mediatek.yaml     |    2 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 arch/arm64/boot/dts/mediatek/Makefile         |    2 +
 arch/arm64/boot/dts/mediatek/mt8188.dtsi      |    6 +-
 .../dts/mediatek/mt8370-tungsten-smarc.dts    |   14 +
 .../dts/mediatek/mt8390-tungsten-smarc.dts    |   22 +
 .../dts/mediatek/mt8390-tungsten-smarc.dtsi   | 1489 +++++++++++++++++
 7 files changed, 1534 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi

--
2.43.0

---
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org

---
Gary Bisson (5):
      dt-bindings: vendor-prefixes: Add Ezurio LLC
      dt-bindings: arm: mediatek: Add Ezurio Tungsten entries
      arm64: dts: mediatek: mt8188: switch mmc nodes to interrupts-extended
      arm64: dts: mediatek: add device tree for Tungsten 510 board
      arm64: dts: mediatek: add device tree for Tungsten 700 board

 .../devicetree/bindings/arm/mediatek.yaml          |    2 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 arch/arm64/boot/dts/mediatek/Makefile              |    2 +
 arch/arm64/boot/dts/mediatek/mt8188.dtsi           |    6 +-
 .../boot/dts/mediatek/mt8370-tungsten-smarc.dts    |   14 +
 .../boot/dts/mediatek/mt8390-tungsten-smarc.dts    |   22 +
 .../boot/dts/mediatek/mt8390-tungsten-smarc.dtsi   | 1489 ++++++++++++++++++++
 7 files changed, 1534 insertions(+), 3 deletions(-)
---
base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
change-id: 20251201-review-750072579991

Best regards,
-- 
Gary Bisson <bisson.gary@gmail.com>


