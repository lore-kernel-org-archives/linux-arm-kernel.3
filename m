Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF5ED116F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 10:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/aq5fWGVWti1VxWY/4bnYEN4VvYNMxggYcsTA53nNMs=; b=C2JJmDSReD6i1h
	n/9tsv9KbmrmjWtJa8IfGjtNYSJwG2Wyyq/+qSjISRiJVxwdl8bSOr2cbmWE6m5ISJLRMX6Z9q2yU
	OLp/JDpVG8LpGOdVg7GN9vG4p95szjM6rTIei5C/E39Eh8FvkBc7nZjsr3VHwMkk/2/SdE3nmnmsq
	OSV4XXpJCl3AGLysJf7+Z5fJFO2BVXjtDlIsWMBh2IMo2/FsiyhJXqKh2qrCLnV1SAmRQ+5hm9jCi
	4uiTjWvpoXCzEWS3nl5YuZm2wRp96wOjGAfoIM5J6BY7IT160T4KxUZXNdd7ieQxhaU9Jn+EPxXHF
	RIduRqw8Vnz7syvJn8TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ14E-00000003JVU-2pfC;
	Mon, 01 Dec 2025 10:23:38 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ14B-00000003JS5-1Cds
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 10:23:37 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-42e2e628f8aso427194f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Dec 2025 02:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764584613; x=1765189413; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/aq5fWGVWti1VxWY/4bnYEN4VvYNMxggYcsTA53nNMs=;
        b=hJWCLYB2kbZ+Mj4Di1s+jP+bs/U8VBVt8us9Ta7nQysCPWQZAygeYOvJ7w5bops+F0
         UndGIobMAiQG6/pgupH7WwQbKUiC6q+hWVUDB90fp3+1mw7lNWC0Io8asPYa678gMkkP
         hh2IMjruGLk78ktHMb2tvy/jjU+miI/mQRYVRXWMCm86dq365ORdam29/tVMMBX/1JR3
         j4e85kLkwCNjV/MXu/VAmJefdI85JDBr/n1r9xStGOGA1Vgln9L7a5A6rjwCgCEsN9RG
         twjVWDMkTP00TDNrVjXYbF6BtnTB9wo1O9iLYK6xaUTIC9tG4j7dx15dE28DAHr+iexJ
         FICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764584613; x=1765189413;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/aq5fWGVWti1VxWY/4bnYEN4VvYNMxggYcsTA53nNMs=;
        b=DspCtzEELu2aALwH9Z5lE7jMKp22iZlF7X1Q8mWIGeMN93tve1d0thVl5nmbYrlXqk
         cuurBJChU+Nl50SxCi1NL9qYUOuwx6lYCMBwCI0hR3APMP1Iy8S3zC5T+k2ythclzIhO
         TqA3+BDtpHHqFaaJm2pydCyEZ1Os7bX9WzX+AvK1tyhne2U8MHwvxuMTYyhHWImHgGRu
         L8jTz4cnP4GXsUR71+rpOF3wNudvS2XTxm/bezWDhebUog6sOwK+oMINN4gWxOx2S4r4
         /ztNrkUuHe/D0p9CYDgXp+xmKVE5lrOFq/X0afi+V+ztpWdMB4558/I3CouBeICiLWha
         L3Og==
X-Forwarded-Encrypted: i=1; AJvYcCW9k0UCBivSx0Usr09fCGKm4cWay/fRI5EZcUTktmHvN4cFRAGFuoca6JeoWFASfjiFiPNIM+BSD9vSFZrC+LKh@lists.infradead.org
X-Gm-Message-State: AOJu0YyUlSrOfxVOg0EPtBxCC/I1hLLMr/Rj6gv6ZW61OiJv9WvFHn7H
	wYViZo75tolvkJr5DWWlRK0950azPmG9XcBJC2G5PTE9eAOYm/5UWx+E
X-Gm-Gg: ASbGnctKX8cDuVJ4EHpFGkLVDAxkqZUoAGcjIAyH4Y/Ytg4VgFBmoJOzQoTEOnEN7ag
	bU5lKyeZCigwYU8e60rTuGt2fOrlqHsrYh0qBopjAQEbSBGJrtMEFEV0N2gH2zRuV9V91cEHa2B
	X+h6JSi13kHSu5wM+DGpnLPnZNNqTfgR8otGteX64LlERVdKB1R8iW0LGjsiK8kgq0c3OlzTrb9
	RaHlFmfhVS12YsV+xWPurUON/NoUrgQxO60ukiykXo8RrXAlkfVQPWfArric6SOmdWhuPb8Wg+s
	1O7GivAfvxeP9gFvGDVlEYz97qxOj7jf+Cu8P1oVgfvPEMzxYjsm34tu1Ba0vTXbjagRuobsTqK
	TEEcYazXFIJATHLrSb8WmfDfQweZwRfzYTMh07kXJC8jRptJUOhQzASLR6f6tjx/ccQQ8vHRsoK
	AWkVVSsDu6U89XwvKsLFWbSGX2yA==
X-Google-Smtp-Source: AGHT+IGFTh5STldnmeUejFuBCNFwzUivENu5VIGhQtql5aFvAWUkx/tqlq9NXgNt2K7ubqXJ0e/UbQ==
X-Received: by 2002:a05:6000:2c02:b0:429:d725:4125 with SMTP id ffacd0b85a97d-42e0f35bbb9mr26849422f8f.54.1764584613159;
        Mon, 01 Dec 2025 02:23:33 -0800 (PST)
Received: from [127.0.1.1] ([2001:861:3201:3d10:4ab6:6efe:9b65:a6af])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5c3c8csm29466439f8f.2.2025.12.01.02.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 02:23:32 -0800 (PST)
From: Gary Bisson <bisson.gary@gmail.com>
Subject: [PATCH v2 0/4] Add support for Ezurio MediaTek platforms
Date: Mon, 01 Dec 2025 11:23:14 +0100
Message-Id: <20251201-review-v2-0-dc2df44eec7e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJJsLWkC/1XMyw7CIBCF4VdpZi1kwCLFle9hXGCd0kkEDBgva
 fruojuXX/Kfs0ClwlRh3y1Q6MGVc2rQmw7G2adAgi/NoFEbpVGJb0RPYQ2i1cY65xS0+FZo4tf
 v6HhqnkqO4j4X8n9zHHrVo9zaHZpBKHHmWnOSwZf3IUTPVznmCOv6AZ/HEueYAAAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Gary Bisson <bisson.gary@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764584612; l=2132;
 i=bisson.gary@gmail.com; s=20251201; h=from:subject:message-id;
 bh=y/Qwl4YPkUepvuWoy1jfQEPKPu+EB9i1kk8NpTVdZ5Y=;
 b=5/iUh1WOB7Fub2h2Y3ecTZKoHP9jfWojItMviKYc2zwnzsE2UkOO/rPF6T7HSOelfoNIcb6yQ
 ezfjdlR0l1jD+MvAemlSDIK44aGQ+gu3AYtB/afKC0mLRg5C3L2QFBl
X-Developer-Key: i=bisson.gary@gmail.com; a=ed25519;
 pk=eaOrLwovHUZBMoLbrx+L1ppj+AH+TfgxkVhIEyrhkeE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_022335_357350_985FBD9A 
X-CRM114-Status: GOOD (  11.93  )
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

Changelog v1 -> v2:
- use b4 to cc all maintainers properly
- squashed patches 2/3 together
- updated node names to be generic (pmic)

Couldn't repro the schema issues sent by the bots.

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


