Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35215CAC5A8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 10:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Yo+Q95uh5jotGS0XMAhzU3v5BuGqR1XASUujcKEby6E=; b=yRwxoB6aXdGeQqW4jgzrWthqJO
	ryo2EkuOnP5hIlfdxTvYhN9crovNKrqa3s8jaoGVlG8DE0PFEjhXz35KqUKnFkOiear/HKB1o/69E
	sZMNtipwVXyQUbeXeeIFAvGHQHK5DT1nC82j+0EFML8lkVJYbfSCjv7vOA+iaQ6B0YTezvhijL0sW
	6Tu1MbK12xWzVZTlLp1zrLyxNlRTjEiq690U3TXrbEXxe4bRTgr7Gz/C8R4FGGHZs14fQVNi9/pBW
	3ZGMBLOlOYkUB2xBMV6trH/mnEgYNwjPzeBaCtFGyAWjQNalCWD0yqRCv0npGDXv0n7RR8mXUXEvk
	5eMJGn0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzCLy-0000000H9uS-0POY;
	Thu, 18 Sep 2025 10:59:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzCLr-0000000H9rp-1VRi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 10:59:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0AA4B43C65;
	Thu, 18 Sep 2025 10:58:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CC74BC4CEE7;
	Thu, 18 Sep 2025 10:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758193137;
	bh=LL/Uw6VE1EBTQfjT9hHDOnQ6gjK5F3ud8EjZ7zF1IIY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=tNBxkVaUZNfgfAzmWty8ZnFuWL4PXG2UJIyez+aRdN8N791hD7mlow51DFOl/8ciN
	 IbUAjgY+NxL+0GblSmQumlQEWNMOSGLin+I+Qo91w4a7ldsAN/RO/1zYyxqMyXCAsn
	 1abM2gM7GpRXaHX1BrkaK0w8w8aFTx5rOk5vKrap+grPUBaYRamVd4OOwWPBI1POFr
	 hDswyR2HkfczjReuAnSVJpeASpsFRjx8qbUgz+RMmyHPH9guJ43p/4nkpFBTHGjY42
	 HlYkaloVBbCVNOcGFLY6XhLnzow3XITAwdBnlcTMrg4yOrmaw160KUG3Tz47qFjy+a
	 k/L1Xt4kuONtw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7A16CAC5A8;
	Thu, 18 Sep 2025 10:58:57 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Subject: [PATCH v2 0/2] Initial Amediatech X96Q support based on Allwinner
 H313
Date: Thu, 18 Sep 2025 12:58:42 +0200
Message-Id: <20250918-x96q-v2-0-51bd39928806@posteo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOLly2gC/zXMSw7CIBSF4a00dyyGRx/gyH2YDtDe2juBCoTUN
 OxdrHH4n5x8O0QMhBEuzQ4BM0XyroY8NfBYrHsio6k2SC47boRgm+lfrBuwV0pzzVuEel0DzrQ
 dzG2svVBMPrwPNYvv+gfkD8iCcabbQUzWzspM9+vqY0J/dphgLKV8ABL5JE+ZAAAA
X-Change-ID: 20250911-x96q-57e63380804e
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758193136; l=1208;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=LL/Uw6VE1EBTQfjT9hHDOnQ6gjK5F3ud8EjZ7zF1IIY=;
 b=b8FZND3HZqDv0aMwfb+6qib/2eYbxutllyTSOaHscNvnojhJl4jYWwTmXgAGP3vddNoNTaqKs
 JjrhlLVOWdXCExdZ5LQB51ANHIyoWqR/qMs616ntY3FzhUaJ/sRWzHQ
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_035859_448195_2790B79F 
X-CRM114-Status: UNSURE (   9.78  )
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
Reply-To: j.ne@posteo.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This patchset adds an initial devicetree for the X96Q set-top box.
WiFi, Ethernet, and HDMI depend on drivers that are currently not
available in mainline Linux, and I didn't even get the SDIO WiFi chip to
enumerate, so I left these peripherals out of the in the devicetree.

The builtin infrared receiver produces IRQs when a nearby remote sends
events, but they somehow don't end up in /dev/input/event0.

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
Changes in v2:
- Several dts improvements thanks to Andre Przywara's review
- Andre's Reviewed-by tag for the binding
- Link to v1: https://lore.kernel.org/r/20250912-x96q-v1-0-8471daaf39db@posteo.net

---
J. Neuschäfer (2):
      dt-bindings: arm: sunxi: Add Amediatech X96Q
      arm64: dts: allwinner: h313: Add Amediatech X96Q

 Documentation/devicetree/bindings/arm/sunxi.yaml   |   5 +
 arch/arm64/boot/dts/allwinner/Makefile             |   1 +
 arch/arm64/boot/dts/allwinner/sun50i-h313-x96q.dts | 230 +++++++++++++++++++++
 3 files changed, 236 insertions(+)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250911-x96q-57e63380804e

Best regards,
-- 
J. Neuschäfer <j.ne@posteo.net>



