Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E5CC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 10:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oxx4GMibVQO5TBqiNfe2w8maxU3edcg5DhjIvgzdEqI=; b=zDHrZPG9K2eAQT4C48vlxf+lqd
	5wp5/C6eixrBZJa3qA7rZzdNp7AkRvYPhLauftDegUWzaQguhlJIHENpPZ5RYx9g944fapr0ZvirT
	F0Sc5t+MdeYsCavRsERVtFPoIL+DjFzWLFDWJ6cPYY3SKs1ysHYA3tfTBNjep1VzBaiFciQQ/5DPL
	N+DczrmaUDlL2VhJBx5KSgkvQ2/yFsgHFQd3KoSfbouV69nTrkXczl565KzbqwcFAStPFvozCDH9w
	xE6ErLGXY9Y3SjFhY5uJEg+CAbf8fUFo3zpWmOn5GMweyKeSBzBUrm36GQZnpoPfON2HcCocNc3CC
	VCqBdjWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4GsP-00000001Tey-1OfC;
	Mon, 14 Apr 2025 10:17:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4GoC-00000001Rky-2FtE;
	Mon, 14 Apr 2025 10:12:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7EFB460007;
	Mon, 14 Apr 2025 10:12:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9C372C4CEE2;
	Mon, 14 Apr 2025 10:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744625575;
	bh=8/5+Mwb/Pk1qbvhX1PLg4XvpKaWqdiHo6PVGtnDXOBg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=N7z+9n9csvtmDw/fgYSTpxhxWxm35QRaPKu/HS+l72nzsdaB8BwzzAf3I8JZ8BmBg
	 h8/E7hOJUHgZFcD8Pj1MCo6z1NYD7MBsKRJJ8dpltXD/eiaD7ZoaOV30yPk5IpNjJB
	 pgqMT5HiGwzXMIGnx4dJXwjSMZcCXv2PjFDZKMYZ9aMGDKv+ioCe4P8UMHHJlN+d4f
	 Ahyf5JnOBZ7IwmnbyKAwVOjRRhKWJE7LYb5ovK6ikxxLe01rrlHrGcOaVSu5vf5NCq
	 PqqeyuhU/3n46CUvMopoVn4qFwzI/R7iiayP8XG2zHD67yx1JH/4zFA5f+rsm7ql16
	 w9s/Pxn9bj9Cw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BB4EC369B2;
	Mon, 14 Apr 2025 10:12:55 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Subject: [PATCH v2 0/7] soc: amlogic: clk-measure: Add clk-measure support
 for C3 and S4
Date: Mon, 14 Apr 2025 18:12:27 +0800
Message-Id: <20250414-clk-measure-v2-0-65077690053a@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIvf/GcC/23MQQ7CIBCF4as0sxYDtEXblfcwXVAY24mlGFCia
 bi72LXL/yXv2yBiIIzQVxsETBTJryXkoQIz63VCRrY0SC5b3gjBzHJnDnV8BWS2rk2rRyWV6qA
 8HgFv9N6161B6pvj04bPjSfzW/04SjDMzNkqfzpaLTl+0W/xE5mi8gyHn/AVxRZfkqAAAAA==
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744625573; l=1253;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=8/5+Mwb/Pk1qbvhX1PLg4XvpKaWqdiHo6PVGtnDXOBg=;
 b=ZH0NEy35W5gs/Tu2051Lyxrw35300elFLKMkQjYgn1ytG5I5ExkRe0Ac/OHwoZohJ3lnXRu65
 XNKR6HG9AfuASs6Z2IWOLeUazeEMbq6wNKIRYHw59Rdgr+/tk2OucSD
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
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
Reply-To: chuan.liu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add clk-measure support for C3/S4 SoCs.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
Changes in v2:
- 1 Rename the clk-measure register.
- 2 Remove unused registers.
- 3 Share reg_offset across multiple chips.
- Link to v1: https://lore.kernel.org/r/20250411-clk-measure-v1-0-cb46a78d019a@amlogic.com

---
Chuan Liu (7):
      soc: amlogic: clk-measure: Define MSR_CLK's register offset separately
      dt-bindings: soc: amlogic: C3 supports clk-measure
      dt-bindings: soc: amlogic: S4 supports clk-measure
      soc: amlogic: clk-measure: Add support for C3
      soc: amlogic: clk-measure: Add support for S4
      arm64: dts: amlogic: C3: Add clk-measure controller node
      arm64: dts: amlogic: S4: Add clk-measure controller node

 .../soc/amlogic/amlogic,meson-gx-clk-measure.yaml  |   2 +
 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi        |   5 +
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi          |   5 +
 drivers/soc/amlogic/meson-clk-measure.c            | 374 ++++++++++++++++++++-
 4 files changed, 371 insertions(+), 15 deletions(-)
---
base-commit: 37021be47d02d2913d6767795a6f4c72b4e63a4f
change-id: 20250411-clk-measure-d33c5ab62669

Best regards,
-- 
Chuan Liu <chuan.liu@amlogic.com>



