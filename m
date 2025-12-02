Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7296AD12675
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 22:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JSLkiY2zvImHUDZbOwBQtO8/4saKzF7QG8VA5Q/K3ls=; b=pShBqHLxnX1ize
	mIJCT7arVpT+CytN/cDzshKNlRli3TnTHfRa5yAcXPrM/Qnn+RXzwliSIh1FWt2fURwsQxNkldKdI
	PGy28RQNaYmPycNyGHcGaro1HijSiGRJrsjp1IamJih8ojJZClCawQZrHuMfSSARnt2X4B9XocM8Z
	JhbnGEBxLr3tnjGkKrXnLTdZgSSrJ0zlpgzuNI/tdm5wjKxpIy7xzsu3Wa/Yqj5mXZc7SGOcoGNgy
	N012KEW48bdnilTODwePmgER5OayV15RYRBW+B7xTHg1lCNw8T5pcdN6L1w+KV8qQ9Y3GvRTHpzzN
	IN8eqzTtGkJuobPhQd/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQYYd-00000005sjs-2h8y;
	Tue, 02 Dec 2025 22:09:15 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQYYZ-00000005si5-44AR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 22:09:14 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-47774d3536dso2359075e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 14:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764713350; x=1765318150; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JSLkiY2zvImHUDZbOwBQtO8/4saKzF7QG8VA5Q/K3ls=;
        b=aJhrCOlX3Db67yJxhvpZHj2D0rs5saHiseV2oVl7ruk+fFcOEoFPHJWF9HfAhaewoQ
         CH3odoFxGBNe6iVdG9fa/T+uxg1EqOVURdRnzGZ3DA8mjhc4vDD5DcF2YF0CcUUrHqUQ
         kzakurSX5CEh99vJIfbEGSaNi9tf4kgAU7xtieuoFojCEglwrb1pLwuKkY9GxZMxva7M
         p8H1EXOumva/hIjygY4TdMYbnziadSmqs4ThLx3qQqfCbB6BmVZWJ6V5xDLsrWNHBqtT
         uW36yAecWa+Az1hRHfBzi32k1eiss40/oN0o3+N8EBniWdZpL9rI/T3I2LAY280Ns87T
         uGYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764713350; x=1765318150;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JSLkiY2zvImHUDZbOwBQtO8/4saKzF7QG8VA5Q/K3ls=;
        b=PR1m7+ryL0b6uzZ0m8nMqiJMvTnBK9k/Y3jKX6jLkbL+KAxDPvcCHHwzwowFkLdfHr
         HQ2Bo9VDjjLmvzsKjlk2uqZOaZq3wGq1+C62bbEUlCL2WJphxUJ3RM6PMg006vP/Cdtl
         Zu8dT1MSeMBQRrwr/G/49FUlD8PLVMxNl36FBfqLejQ+IsiKUvG4RpLVcWPZZtSJSEV8
         925QpaMZqS771NN73q+PbtgSgrYJltcS5GQjUPPWNT60S2qTBGO/WWIyq5bw1MfYZ4Wr
         4k8w/5SpxUfoWYgsSBIFF+hF1GN4Mi2KEhQtlza2NHdL7OBEz8OsWJwgCvOh0TfFGzOT
         DRsg==
X-Forwarded-Encrypted: i=1; AJvYcCWA10gEeHlAGi844Fduk8ydIcEcmSkXib64OZSZkThmPZjJ04VVXS3dmq5a1JfOCZksYj52IPhaPM6HgUCTISmw@lists.infradead.org
X-Gm-Message-State: AOJu0YxJzJF5NQvQCG9mCoTclz1t8FbUXPOblSUKlE6pICZIk0ps+BOW
	38439Q7+bFkK9+CRop/2bSfc0ajvhqERSsqXYrsKrVLDKFDUpUeSbNP+
X-Gm-Gg: ASbGncuLZzsc4jCV/J4n0qkQyMVHS3HDLf1LHKWdxDvKjZ+Nn7t/mgOCAC2zRWD2GbF
	NkAaEgsnBGpl9x0fS6De5V4Y5TMeut7AESxG/dYctNF5Z5nZyR6uvR7SAAafHvBJy6VqMvN9YEI
	Sd3ct/sJCZD1uAxETNBtGCQDpEUvcn7SJysD6dMwPrjaF+L7M9LtiKXY3c1ZgR/4uFVRj/0w1uN
	cudfl+d+XqY01nTsxkzNM3+PNf6MxERNM4XpC8z9r23TAfNjqazrVM8nLl4awbSsSDfq2MRsvq/
	eZ32C/qhapDMIvGQT9ObkjuHspn05UHvzt0dzQu7WZtWhndTw2U9kC3O/rzIx+cNXV5FZg72bY+
	FIAscWwnW0kKcEijjba6WuMruwCgu54sf06/V2Agnp6/tg3hyDSrwgbiOWZpZEjGZLsKrIuseWT
	daYYD7sXRvhBGsSTt/xPYbtpwKFo0oYOGY5TmW
X-Google-Smtp-Source: AGHT+IFa4GbiRXpXHQJ7qzlsxieJBhAIZGPkTWaihBlWgwkhaDnomrokxbDrSKdw1Li+bI3Q3V3kgg==
X-Received: by 2002:a05:600c:1c25:b0:477:9fa0:7495 with SMTP id 5b1f17b1804b1-4792af4311emr1823995e9.14.1764713349971;
        Tue, 02 Dec 2025 14:09:09 -0800 (PST)
Received: from [127.0.1.1] ([2001:861:3201:3d10:d253:f5eb:2f9c:dde7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4792a79760esm11534795e9.3.2025.12.02.14.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 14:09:09 -0800 (PST)
From: Gary Bisson <bisson.gary@gmail.com>
Subject: [PATCH v4 0/4] Add support for Ezurio MediaTek platforms
Date: Tue, 02 Dec 2025 23:08:45 +0100
Message-Id: <20251202-review-v4-0-93f5cd2a0d4a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG5jL2kC/22O0Q6CIBhGX6VxHe4HMbSr3qN1QfCjbCkNnOWc7
 x54ZavLs33n7FtIxOAwkvNhIQEnF50fEojjgehODS1SZxITDrxiHBjNI3xRWQFIXsmmaRhJ42d
 A695b6HpLbIPv6dgFVF861IIJKEp5gqqmjN5djH4oWhXmS9sr9yi073Ovc3H0Yd5+TTxXfy5Mn
 AI1mhsrBKKWuCvkC1P5XyuTBtI2yspSMGv22rquHwDX/qQTAQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764713347; l=2814;
 i=bisson.gary@gmail.com; s=20251201; h=from:subject:message-id;
 bh=hmzAGm2KV+/8JNbNSevtwuUcM8ZgD/Dyr/satwDJz+I=;
 b=Xj8Lo8dDuGarkgHqaWbPYbE0zlRP+EF5lB/j8o9yyNKhDUHj9nD4lAruzZtpbZugLaG/Jepvv
 kL6mTPyn7ysAQGJUs/SRBYUe7iKdEnUWAwHQYzR3l6KPJ1N2sFj2+a4
X-Developer-Key: i=bisson.gary@gmail.com; a=ed25519;
 pk=eaOrLwovHUZBMoLbrx+L1ppj+AH+TfgxkVhIEyrhkeE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_140912_779000_F7BE4150 
X-CRM114-Status: GOOD (  13.25  )
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

Regards,

Gary Bisson (4):
  dt-bindings: vendor-prefixes: Add Ezurio LLC
  dt-bindings: arm: mediatek: Add Ezurio Tungsten entries
  arm64: dts: mediatek: add device tree for Tungsten 510 board
  arm64: dts: mediatek: add device tree for Tungsten 700 board

 .../devicetree/bindings/arm/mediatek.yaml     |    2 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 arch/arm64/boot/dts/mediatek/Makefile         |    2 +
 .../dts/mediatek/mt8370-tungsten-smarc.dts    |   14 +
 .../dts/mediatek/mt8390-tungsten-smarc.dts    |   22 +
 .../dts/mediatek/mt83x0-tungsten-smarc.dtsi   | 1481 +++++++++++++++++
 6 files changed, 1523 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt83x0-tungsten-smarc.dtsi

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
Gary Bisson (4):
      dt-bindings: vendor-prefixes: Add Ezurio LLC
      dt-bindings: arm: mediatek: Add Ezurio Tungsten entries
      arm64: dts: mediatek: add device tree for Tungsten 510 board
      arm64: dts: mediatek: add device tree for Tungsten 700 board

 .../devicetree/bindings/arm/mediatek.yaml          |    2 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 arch/arm64/boot/dts/mediatek/Makefile              |    2 +
 .../boot/dts/mediatek/mt8370-tungsten-smarc.dts    |   14 +
 .../boot/dts/mediatek/mt8390-tungsten-smarc.dts    |   22 +
 .../boot/dts/mediatek/mt83x0-tungsten-smarc.dtsi   | 1510 ++++++++++++++++++++
 6 files changed, 1552 insertions(+)
---
base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
change-id: 20251201-review-750072579991

Best regards,
-- 
Gary Bisson <bisson.gary@gmail.com>


