Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF20D29DDC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 06:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7DqCfMXfva/7EU0eva/qMdiyDegqvNz5OpdG8C6Jchk=; b=AMND+Fsp7fJuH489OceEnh8KsQ
	cllROn3tKS1KjM+8sTxmdqS3Zmh7enOmGpjvgEu9kdmnRc9itlFm1kcVjxLT4ZVx0gJOqB8ucoYNK
	2fpxT1e5UrihvMbSIfQNhSN4gEiz5dKCaq/kdgDW3K2YC4P5LyesOAlJSbzIyVZ4Mnhjt5IZWdrh5
	lOehvAhUjkFTTUaPH7gfkAUkLLUkPOLdVCC5Akr3av/Coiq4BNvh+gRomVrhGNo+HpTDMve2Njgrh
	HLEo1FTdTAixrVBhpwLuDqJF4iuVAT752EHbskoA/U8B596t1FADkDw0vi4DN4zLTyGQMzXvdeKNe
	Cd8NYCpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfY6m-00000006beU-2jca;
	Tue, 13 Jan 2026 06:42:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfY6l-00000006bdU-1AhY;
	Tue, 13 Jan 2026 06:42:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 38048600B0;
	Tue, 13 Jan 2026 06:42:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CD381C19422;
	Tue, 13 Jan 2026 06:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768286545;
	bh=mWrwJnOeRgEO6bZMfF2f2PPydNykNaiqT+Cf+jwnAHo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=sIcmLKmdrQdddoInVxvmz048vQnrtpYGM2efLLp3hutIhqSlMJcU8duxoMvi5IpKi
	 2X/jGdvC+4e0+UoezK76cY8ZDSYsicNKiLCOauHRMr1oJl6OuzRpJz7K5wAn7hb/x3
	 8to9jOzkVyCGzHDl4XkFxQKUCI0vYi9DWebC6CKAa5VLBOnzltCHE38yh9y1KBeNGO
	 BujdCdpBZHLYt24NaTAIkmltcHCBlzcsIPUFa3cJlpVlOFW4dS4fb7Nyi/RXzoPnW1
	 yb5qWOQfH4fdb2IuEwpt/4XW+Go18WxYXGXwq/G4iwfbopBYt1+xF/5Q7nEqLDSlWu
	 vaSBpuOWewZMQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C09F4D29DDD;
	Tue, 13 Jan 2026 06:42:25 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Date: Mon, 12 Jan 2026 22:42:25 -0800
Subject: [PATCH 2/3] mfd: rk8xx-core: Configure `rk808-clkout2` function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260112-ppp_connectivity-v1-2-284d6e83b212@gmail.com>
References: <20260112-ppp_connectivity-v1-0-284d6e83b212@gmail.com>
In-Reply-To: <20260112-ppp_connectivity-v1-0-284d6e83b212@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Lee Jones <lee@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Rudraksha Gupta <guptarud@gmail.com>, 
 =?utf-8?q?Kamil_Trzci=C5=84ski?= <ayufan@ayufan.eu>, 
 Martijn Braam <martijn@brixit.nl>, Ondrej Jirman <megi@xff.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768286545; l=1504;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=ySfNjI6t8Mnuq2/ifE0ZjoFXQgOPGkiy/R6d0iMEMgg=;
 b=RYIUKOvuwbl5bNrcjJRBKCvN4zR/uEWENYzfyCgtOLKTGNhHcD6wgIPpYaUDMVU+2EzN4GNLR
 mVb3zHI1nmvCzdRUtIDJ4jN4KmqqTvgyiFD50giORdpGvKrZrMSfPzG
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=ETrudRugWAtOpr0OhRiheQ1lXM4Kk4KGFnBySlKDi2I=
X-Endpoint-Received: by B4 Relay for guptarud@gmail.com/20240916 with
 auth_id=211
X-Original-From: Rudraksha Gupta <guptarud@gmail.com>
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
Reply-To: guptarud@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Kamil Trzciński <ayufan@ayufan.eu>

While the Wifi and Bluetooth chip are defined in the Pinephone Pro's
DTS, it actually isn't able to be used. Let's define rk808-clkout2 so
that userspace can actually interact with Wifi and Bluetooth

Co-developed-by: Martijn Braam <martijn@brixit.nl>
Signed-off-by: Martijn Braam <martijn@brixit.nl>
Signed-off-by: Kamil Trzciński <ayufan@ayufan.eu>
Signed-off-by: Ondrej Jirman <megi@xff.cz>
Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
 drivers/mfd/rk8xx-core.c  | 1 +
 include/linux/mfd/rk808.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/mfd/rk8xx-core.c b/drivers/mfd/rk8xx-core.c
index def4587fdfb8..602218694334 100644
--- a/drivers/mfd/rk8xx-core.c
+++ b/drivers/mfd/rk8xx-core.c
@@ -282,6 +282,7 @@ static const struct rk808_reg_data rk818_pre_init_reg[] = {
 	{ RK818_H5V_EN_REG,	  BIT(0),	    RK818_H5V_EN },
 	{ RK808_VB_MON_REG,	  MASK_ALL,	    VB_LO_ACT |
 						    VB_LO_SEL_3500MV },
+	{ RK808_CLK32OUT_REG, CLK32KOUT2_FUNC_MASK, CLK32KOUT2_FUNC },
 };
 
 static const struct regmap_irq rk805_irqs[] = {
diff --git a/include/linux/mfd/rk808.h b/include/linux/mfd/rk808.h
index 28170ee08898..077fe2e15b78 100644
--- a/include/linux/mfd/rk808.h
+++ b/include/linux/mfd/rk808.h
@@ -934,6 +934,8 @@ enum rk806_dvs_mode {
 
 #define VOUT_LO_INT	BIT(0)
 #define CLK32KOUT2_EN	BIT(0)
+#define CLK32KOUT2_FUNC		(0 << 1)
+#define CLK32KOUT2_FUNC_MASK	BIT(1)
 
 #define TEMP105C			0x08
 #define TEMP115C			0x0c

-- 
2.52.0



