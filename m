Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E317EC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 03:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zYRwMvyfo/b0Z0fdscYgn1jvIel8XvwropGmloEytZI=; b=wQHrizaQfzRNb+
	9bPZWHNqqHqMEX2K+5PmPWJXZtC7wZmPyxb66ajDHkOJjBt1DuoSfntuuOb/nemfShieuNu4dfyQr
	k/5+AiWszt9zZABjgGkINL1J/C4KgrX3ZGe5ar+T8IXo/4O82qVk5ntmhS5fH2eDpUR9++7ziN9ul
	vtYLqicQGkGdE0JOvtVnaKBI2gyB9iBc8Ci6gMBXAWz6JiKO1K/vPWjrD5qyya5q5PHIXqkwGTxgl
	mzQmK4cE7VJEREextHnFBTQwjWJ6XAZTS1ykL/AaBeSA5gTDGujOpWXb6UCVSW7LfUN0u9SezG3At
	YPL9wfB2ATusVsM3AcPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueQQ8-00000003veW-3Ocw;
	Wed, 23 Jul 2025 03:45:32 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueQNd-00000003vPS-1fd0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 03:42:58 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-23f8d27eeeaso13468705ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Jul 2025 20:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753242176; x=1753846976; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zYRwMvyfo/b0Z0fdscYgn1jvIel8XvwropGmloEytZI=;
        b=DUss4yfT5CxTRIfns/NtuCgJGKkQcW2hGilsS5gdlspf4Ic6AfeoHdGkkzBiqxtoyf
         EKLooP7ClfcNaSEXew9JFuQtfRrQRKYL8RB+IGUoQ+BVkLKHP1wdIiwtVI5lrOWD08Ky
         2q+QKGbuLdg/wNR8RkTZNZqvFlpjXitf+ChoFTdPGMpYzOiA85TUGvrrrnfH2hXMBySf
         zXLXYgYLN/Ju6gyTk2hCvyKLW7NpoETo3rNVZZVmfOwgPKArDnHEd6fv+rPVauCMjFy5
         xb4ZsUy7kYrT5QNtJnoXWcn/mV4v5fpyD0Ow4Vfn22dWoPD2EUwRe4MMgk5qRIuq3M71
         mENQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753242176; x=1753846976;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zYRwMvyfo/b0Z0fdscYgn1jvIel8XvwropGmloEytZI=;
        b=WFMWYnRZjzkBObfu3IDb6X35VvzpnIIlpon1ILC3Kxbpk9Xyk/1OaM6v0Bocisf5DC
         C4byZ6TeMs8wXtKnNCivvYZvfhUYnHkwisB3b7FLCFBibl9xmfVG7aP1YTNhjN1Aan7l
         KPSquciyp5acY85jT2d429k60AezYvx1yIjO8YQR3iIqEYJp9xHRfZw9V/4IQU5eLLrV
         fAEDJOjLsNKeeXJVGlyImzmMS+h1Xy2Lrp3vx1zlP5ZbroztSUmDgBYKa8yzEyLyJ5tH
         6D7xm8vl6L4qQae2i1Jsdo5jtv2JDNfZy+iCNL7uAZtodUn6PZ3wP8h2pcNCnUHwzVuv
         P61w==
X-Forwarded-Encrypted: i=1; AJvYcCWndEJEnpzh9HlYrYdlq32hHbrrd43HzKq1d6TU8/mD7MRf8I1PnmwpBIYJZOglR9VRpl7380cmKu8gt5L6CosL@lists.infradead.org
X-Gm-Message-State: AOJu0YwJk/d7+6te1I/41hvMgMGpNnQUz5CJcuro+Zs39Fvqu2w7cgja
	96FDaEMRQkwcnkA+PvVnn19YMMY3ORI+q4hIV1od+2MXzhGnAewDWIMI
X-Gm-Gg: ASbGncuRqRGYcUrKiwYVlMC9wTXKYzu/1hEzZiJdmnZhii5bIDovu1vjkbFFQ2YA9Xi
	7lx3mCxxAGH0RNzvNp4cHZnHwAkymAZ1RKR4EBs5lzt9r1G7bXK0vWG20AbKOFMoJWN9QBmBP0I
	x2azt7gHl+rFEdq6rudbkeaI2UrFbcAdqdNVMnRlrGYXR5sIBOsqAuKScZYud18gGu6TksbF5mG
	NPB85TBra9asJf6sHQ8s0NzmLXH+LofdSOgY8SnUNfWMmmfRTom7+lVIdX2teWf4kb8ZeP1B9C9
	Cq/Qvq0WTStmnnzUr3A8hrNxegFtL8Jg1RLLPtKlbvvOQZqFzorPRgXkCxFf/5tOqKVHCUKdLq/
	4S5rt7YkavC+BNCFW4VAX4xcGD4ZjF8cC+o/XbaZe8Tk5R4B02u6K2P7UALA0bmPCjjU=
X-Google-Smtp-Source: AGHT+IHgMmQu7p8TJdr89s8prYT42MP3mN0kb1mkNyslHGE6mS1Jt2errHLIA3LNcROo3VW3v/R5OQ==
X-Received: by 2002:a17:902:d50d:b0:236:94ac:cc1a with SMTP id d9443c01a7336-23f98193560mr20187515ad.27.1753242175660;
        Tue, 22 Jul 2025 20:42:55 -0700 (PDT)
Received: from [172.17.0.2] (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6b4d47sm86197605ad.99.2025.07.22.20.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 20:42:55 -0700 (PDT)
From: Leo Wang <leo.jt.wang@gmail.com>
X-Google-Original-From: Leo Wang <leo.jt.wang@fii-foxconn.com>
Subject: [PATCH v9 0/3] ARM: dts: Add support for Meta Clemente BMC
Date: Wed, 23 Jul 2025 11:42:39 +0800
Message-Id: <20250723-add-support-for-meta-clemente-bmc-v9-0-b76e7de4d6c8@fii-foxconn.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC9agGgC/5XRTWrDMBAF4KsEraui35HVVe9RupDGM42gtoPtm
 pSQu1fJpoa64CzfIL43aC5iorHQJF4OFzHSUqYy9DXEp4PAY+o/SJa2ZmGU8Qp0I1PbyunrdBr
 GWfIwyo7mJPGTOupnkrlDGZ1ODmJGb6yozmkkLud7x9t7zccyzcP4fa9c9G36iL5oqSR5TACRy
 IX8yqXUt2cc+v4Zh07cOhazco3e45rqAnpi5aN2Ebddu3btHtdWF42xzMgOkLddt3bDHtfdXAr
 MxjpQ6LZd/7Drq6tsQy2wxhz/2Rd+3aB23Q2qG9iSD7lV1sK2G1auhj1uqG7rcw7OR/QpbbvN2
 t31D011DTMkzhayor/u9Xr9AaF65QhAAwAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753242171; l=2850;
 i=leo.jt.wang@fii-foxconn.com; s=20250618; h=from:subject:message-id;
 bh=AuSAmkqHcM4OHqTPBGVEv3kpwNw3rYsqqDHlncqpHCc=;
 b=jkX0xnPl1Vav8XFrtAj/GFS9wUTsOPnX24pKpHMomGWsUEABEEgRbz2vJNi0ABEwzZN+MnGG8
 G/9njjuRVmeD5DHubis+ZuzI6RhPD/s3XRDqu3Gr8e0JUMY3jRefu32
X-Developer-Key: i=leo.jt.wang@fii-foxconn.com; a=ed25519;
 pk=x+DKjAtU/ZbbMkkAVdwfZzKpvNUVgiV1sLJbidVIwSQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_204257_444052_977A032D 
X-CRM114-Status: GOOD (  13.99  )
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
      ARM: dts: aspeed: clemente: add Meta Clemente BMC
      ARM: dts: aspeed: clemente: add NCSI3 and NCSI4 pinctrl nodes

 .../devicetree/bindings/arm/aspeed/aspeed.yaml     |    1 +
 arch/arm/boot/dts/aspeed/Makefile                  |    1 +
 .../dts/aspeed/aspeed-bmc-facebook-clemente.dts    | 1294 ++++++++++++++++++++
 arch/arm/boot/dts/aspeed/aspeed-g6-pinctrl.dtsi    |   10 +
 4 files changed, 1306 insertions(+)
---
base-commit: 52da431bf03b5506203bca27fe14a97895c80faf
change-id: 20250618-add-support-for-meta-clemente-bmc-941a469bc523

Best regards,
-- 
Leo Wang <leo.jt.wang@fii-foxconn.com>


