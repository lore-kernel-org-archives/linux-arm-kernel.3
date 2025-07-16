Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E28C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 06:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ixmx0d+ZX0XcwmYFgmX/CAvbk5ppzzZpsXvym0428IE=; b=xjN6cjXxl0kcXf
	8ccMaZreLQtyg2rX3EFKMLgkk/AKCSe7GaU36qRbKxthlDBn5BZmlNnFQbDPQTfsVBnEYVkhGnNTI
	waRtMYiKiZZkS37qwPyAU8NW0mWq4t71awJ3mQfbVddmHIA/n1CUitdlYiir6leQp03y9/6z5LTMm
	CV0q0Nq6u1dKu0jSnS70WOcCpKRkLP9UwW9KbX4j3iPrM20Pt6c6C5GaIz691nuXf5zxYLK6GmtAn
	DKvm93ZcqKloYqi2v1MmjkC6rt/c2VkV8Vf1ngFqKoB67eFGdIs/2MOAzxK6VFb+r+6kkA99/QJ8S
	RF/KEACoIFrgsDJ1utxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubvql-00000006ukN-3vku;
	Wed, 16 Jul 2025 06:42:43 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubvZ9-00000006sVa-0UpZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 06:24:32 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-234b9dfb842so56065735ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 23:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752647069; x=1753251869; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ixmx0d+ZX0XcwmYFgmX/CAvbk5ppzzZpsXvym0428IE=;
        b=FYuS3y/Pg/L6pERwPuk9k0jWlvBNFwVPBw3eYp35qN3v2BiKSJmxZBaTUOsgWN93dJ
         B/UVpEofHsOHT/efoN5BlWsaDuqZaHhXzIBBy33ekGWCVQu/31uAKX/enCwTzPdVfQyS
         lrItB/PMeIhGJH0e2DuxSZSaKpTvCJEgnloEMikgTQ4Kq9lNvWuG1YykinIa2KzomgQb
         xr1tpeQZeaKX6B7oIWzL+ZbZir3TP0rZlGpntLBQqkmBZQNTNHLTVplqhbFli6JSNMmd
         1kErNzANRp1771u+ekYNqXCrUdvbqSV/KIKKt6DViH4rU7zgbJuR5mgiXHAr4A8YectH
         IxEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752647069; x=1753251869;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ixmx0d+ZX0XcwmYFgmX/CAvbk5ppzzZpsXvym0428IE=;
        b=CAi1MmUJPTlhrwauFlhOIVO5zKakMjfotL+AP4FELuV9SSyZTJsN2Oowj5kp8ZBQYp
         2aUsc8gtCYc+Rim+IAdELqp308XRhDo8bM0RQcvDPuZUh90+BYAjkCw4GUhYh+F6D9i9
         kiSN8w11tFQmbM6OcnZi+23Ole4AehongJx9L8+kAKJGoDIdqtKWI7AIz64yqRba6v00
         gPjXWKpR/Vw8roefSUJfC8NCGjU4F4UOx6yRSNFNLAKBfEKAA14/F3g7tJwNJO6Rtnn1
         cBJLe7d8Ftqo2LXPrHZZ6Ryyex4AUh7jMAqjzMwJZ1DilEU912Blsn68wKtCsh/y1BEN
         DZXw==
X-Forwarded-Encrypted: i=1; AJvYcCWSCaeEBA1w2vvCH/dykJMhLB7d2T3kjuEBljWSdzYhXUAmJ1KvJjzAoUcEhNQYn0wgCMsogkb8oYH7p9a0ohKJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyJ/EjAZ9PrIncs8bzLrRa8zoLAm6x0Iw7t0GY3IYhnhYIYbHrG
	YwdhJEnpgmSR8XeM9FYhBVEd0e8SUxRFSWhz41aJgcT+aS7WBMrGF2JE75bpDw==
X-Gm-Gg: ASbGnct6McSv8ANuMTEQz3AOyEMhCdhvYuq8ulx+L9CHmSxa0nkAnim0GFOsbVdv9nM
	FliZHzp7XZVSoeDYog2LTNq3ROnIuQQo4TRvt11MTQCG8KES2Fx0stV7LeFXKJmv6KPns5R8PNp
	YaEmawEsMeX6XIqNV2+MXCCcjxtTgDY0W5YsWu/uvBAXxbn5z5xTUEFjNnG3W58B15sinroZxwP
	0SGAYGXopQZrijd6DJF6YcZ2TcbnxgES0juYsbt/Np9dc4v8QVxopT5sYwCh91pMyzyzPn2Va3+
	/TnDQseEpIyJ9Ak/KAM6mxVEUqvvlnGx7Fo7zOHuCl8pGhDuNEAlKFbssIWzr9CSLlcsKlO+F7b
	zLfBH444nlTai2o72DaDxgBRe3EJzX+bDbPzVZ1DlVz1Omuxs+4wvt7a2SbROmCaLZlc=
X-Google-Smtp-Source: AGHT+IGm4cJ+T3HY2+WuL/rqcwTfbyVXKPV0HvI1TYx1fR1w0T8QhNT4nMZujHcDMajbIK8BJ72cvQ==
X-Received: by 2002:a17:902:ce05:b0:234:c549:d9f1 with SMTP id d9443c01a7336-23e25770c34mr20051935ad.47.1752647069238;
        Tue, 15 Jul 2025 23:24:29 -0700 (PDT)
Received: from [172.17.0.2] (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4286081sm119060955ad.1.2025.07.15.23.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 23:24:28 -0700 (PDT)
From: Leo Wang <leo.jt.wang@gmail.com>
X-Google-Original-From: Leo Wang <leo.jt.wang@fii-foxconn.com>
Subject: [PATCH v7 0/2] ARM: dts: Add support for Meta Clemente BMC
Date: Wed, 16 Jul 2025 14:24:13 +0800
Message-Id: <20250716-add-support-for-meta-clemente-bmc-v7-0-d5bb7459c5aa@fii-foxconn.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI1Fd2gC/5XRTWrEMAwF4KsMXtfF/x531XuULhJF6hiaONhpm
 DLk7nVm00BTyCyfEN8T6MYK5oiFvZxuLOMcS0xDDf7pxODSDB/IY1czU0JZ4eSZN13Hy9c4pjx
 xSpn3ODUcPrHHYULe9sCDkY1xoQWrNKvOmJHi9d7x9l7zJZYp5e975SzX6SP6LLngaKFxLiAa3
 75SjHX3CmkYniH1bO2Y1cZV8oirquvAIgkbpAmw7+qtq4+4urqglCYCMg5o3zVb1x9xzeqiJ1L
 aOAFm37UPu7a6Qp+xcyShDf/c635dLw79zVXXk0br205o7f66y7L8ANRXyaSQAgAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752647065; l=2248;
 i=leo.jt.wang@fii-foxconn.com; s=20250618; h=from:subject:message-id;
 bh=W6r72LmSQKxnB3NxMfqcJSeFdWoREW67QPymehaZIA0=;
 b=8vhHKoKK7lvo1KdZwHaApUl0O8pnWGj4MKV8UhTeUKzY8y58117CJrT3tf2h2MPLhz4Nyauxa
 rwUzvGqJAkIBN6PqtnrPWjEtFfojOJfps2cVGhHxQKZkXxL9qRlMKI/
X-Developer-Key: i=leo.jt.wang@fii-foxconn.com; a=ed25519;
 pk=x+DKjAtU/ZbbMkkAVdwfZzKpvNUVgiV1sLJbidVIwSQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_232431_161492_76F82AC5 
X-CRM114-Status: GOOD (  13.12  )
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
 .../dts/aspeed/aspeed-bmc-facebook-clemente.dts    | 1297 ++++++++++++++++++++
 arch/arm/boot/dts/aspeed/aspeed-g6-pinctrl.dtsi    |   11 +
 4 files changed, 1310 insertions(+)
---
base-commit: 52da431bf03b5506203bca27fe14a97895c80faf
change-id: 20250618-add-support-for-meta-clemente-bmc-941a469bc523

Best regards,
-- 
Leo Wang <leo.jt.wang@fii-foxconn.com>


