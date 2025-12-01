Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01322D116F5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 10:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bCF0FSqyYlnyWEBaqmzmHC6kRsLUVYOKh7WHQQM9qF0=; b=05CUlwP9+3cJaY
	tCetL4Im/x/yZ5JocmgZvYvRo3iyXJCVhVZh+Hpe57s2Q5Jc6QBgK2t09AIEc0+yzzTGuAhCsGNSM
	j0AwgeZBIQg4nCEVKndX7wGTDxKZHEhcju/f55qD6UDoIZ2SxlOVCy8PNeAAhHhBMVnIVGKw/cbhq
	i64XIcm7wchBmIf/fO4QxB0xFRmFbcMLuPrYwEizPe/oSXxheV2MA8Wr1CVQVi6E7ZVpATmh+uame
	6EtTznejCKZ6vTxHZlXXX+48BaN3Aj3C2Xd6xCGmYKGrtkjFT63e5K/vKsYupSQrhTMMxm2NqqB3c
	zQeKD9fbppdy7PfgF7yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ1Pj-00000003MIi-3gEp;
	Mon, 01 Dec 2025 10:45:51 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ1Pf-00000003MFY-0ozq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 10:45:50 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-42e2e167067so678332f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Dec 2025 02:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764585945; x=1765190745; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bCF0FSqyYlnyWEBaqmzmHC6kRsLUVYOKh7WHQQM9qF0=;
        b=FgOQ48Fv4ntRGXiuxdoB+JgFxA+d1z+JDa7+LCRYufC/xqqxjKy41HzsOQ3Vygl1p3
         qrMZXXd13MJnpIERzoO/abxgXhrKnWluxU8pOsYdPnsOqxQPtk9k5NuztKvgmw4LkY5M
         Oa7v5grRQXkR3gAMScdzDWWEYWlEUZWRXnU6BhjOtHqRCj0d2ZVyVqS/KJkfKMcHd6Cc
         ZuZiKTnn/fwCt1rCNz3MAWOhaqwYv6oV2sLElNZQlSQUgi1fC2pcBOr/icF0aB1i6Bi3
         h5Z35GYt+omkYGTnH81bJsHaQuZB2TiO1ZlBwjlkWMVy8axsprC7PgCy+JcE+zroZwaK
         dixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764585945; x=1765190745;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bCF0FSqyYlnyWEBaqmzmHC6kRsLUVYOKh7WHQQM9qF0=;
        b=Pi6oWTGWAeHR2KPrq+hev+1+OpKL8CiJldUXxYsSQBlA1bVi5Gtx4AavhJkv2y7GZs
         r4TMFgB7cIaA6B1+079KY7SIPMPIQ4W6D7ZTS9g7v6CYbPoZtWNV7fuCqkBTS04/ZpH5
         a/44L/OVM48UVWA7hwYJPbwDS40IpvpNskzDsb1pgCqr16pwiQ68D83+bWo28GqaZBpu
         mo6xXFDtwXFLXrmbnS12uddHP5x6ibbZyecW+KQjWtq16KtRREGonUceDWFh6BYoVFC4
         f7wIK1IW1PWRz4JXaZ6r9lK1t3UUmoYJiBWNyqkI9Y9z2jEFFYJoXxMyrE5qzAGcg9IE
         sbHg==
X-Forwarded-Encrypted: i=1; AJvYcCX2ItEccb71Mv1LeurAEM2g3UHk8elVAa/Wv6g/XBeptfwOIXyVJRcs7qDsCvw+1xJu7b6gTxw+9YAyIDS8PAdu@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1tlc/EnLDEiYrzV7DfguIIXD0Qn+mIkD017nX5b2a6TF0jc2R
	2fJ4+O2XdmfTMFz9kJiE8Y3LZ7b2ig5u34AyOYE4oFpvEfta147hH/qN
X-Gm-Gg: ASbGncsU5PXN3gigRX+0cI0SU4t5pD1b73XRDg3BndznEur1Emhsin3qd1jyA0OqY9G
	AhK5HL09Azi7J3qdRLx/uPKWLQFjmhCm6GsZa60NdIOOID3E458S+4Km+BxgXbtUkWHhuI+I+Ce
	odjGrAZJrzAiWRrGElvqqTMnFTedQ6cYdDiIALrqHrKhlE9rE1Ou8eM+5qgRskEh+KVKv8mPCa9
	53i0SkYe+0tk3aStCu6xfzAZEIDWL5MW8BdEKGibAUFRvStIRrrwPJ5yuaMxNQXIY/HzaXq1em3
	mDcxte+a3oFc8pzxflUSkoQNQQGoVmj9l0Vs25MQEUn3hcyFKGdH1cTWoWYMLtE55QkQ4WynZab
	0H57WjEcq+BJwoCZ0B+an/OQmzJnr/1WFkw8ALfgItApdcmUI0vrkSI3YKXYw/rsw7Wfbq3B/qw
	uryDJzEfpPbNbDGerTbyeTCTfSZQ==
X-Google-Smtp-Source: AGHT+IF+saINz1aMfFQPoF21DyIcobxATSuvnAhtrL28gk23j/ZdYr9KXTQtKbBxA0p/NCWRqd312g==
X-Received: by 2002:a05:6000:1f03:b0:42b:3867:b39c with SMTP id ffacd0b85a97d-42cc1cf452amr32151633f8f.34.1764585945022;
        Mon, 01 Dec 2025 02:45:45 -0800 (PST)
Received: from [127.0.1.1] ([2001:861:3201:3d10:4ab6:6efe:9b65:a6af])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5d6049sm26264262f8f.10.2025.12.01.02.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 02:45:44 -0800 (PST)
From: Gary Bisson <bisson.gary@gmail.com>
Subject: [PATCH v3 0/4] Add support for Ezurio MediaTek platforms
Date: Mon, 01 Dec 2025 11:45:16 +0100
Message-Id: <20251201-review-v3-0-07f9af7341fd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALxxLWkC/2WOwQ6CMBAFf4X0bMm2tBY8+R+GQy0LbCLUtAQlh
 H+3cNJ4nGTe5K0sYiCM7JKtLOBMkfyYoDhlzPV27JBTk5hJkFpIEHyX8MWNBjBSm6qqBEvyM2B
 L7yN0qxO3wQ986gPanzmUSijIC3MGXXLB7xSjH/POhuXaDZYeufPD3uspTj4sx69Z7tW/C7Pkw
 Bsnm1YpRGfwq1Bv2/YBEYIT0dwAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764585944; l=2679;
 i=bisson.gary@gmail.com; s=20251201; h=from:subject:message-id;
 bh=jNo2dVX46ep7yogASVgnWC6hbGoR5SWan4ITaGGLyNc=;
 b=ZPpeBmyjbzBJZ6wFdMpdSHQvmIZGec77e91q9/e8Xner55jTqegx9NWGkO0rZ51b4arn7x5pL
 jf2BEC53e2wAz/tAvu1Zx3ADXWriypUbET+29EYWFmcjB+CuoiJGAoy
X-Developer-Key: i=bisson.gary@gmail.com; a=ed25519;
 pk=eaOrLwovHUZBMoLbrx+L1ppj+AH+TfgxkVhIEyrhkeE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_024547_259756_91C12402 
X-CRM114-Status: GOOD (  13.26  )
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
 .../boot/dts/mediatek/mt83x0-tungsten-smarc.dtsi   | 1481 ++++++++++++++++++++
 6 files changed, 1523 insertions(+)
---
base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
change-id: 20251201-review-750072579991

Best regards,
-- 
Gary Bisson <bisson.gary@gmail.com>


