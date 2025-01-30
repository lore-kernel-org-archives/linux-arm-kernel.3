Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A47F8C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 16:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kVZIBsJ2ukDO0m/xIz1rl1s2choG2uPMysZ4azq+d4A=; b=QgU7bqY7GWDbncEbOvb57BcRhu
	BmiJI1by0NdDx/Gw/ftyNB0U4zuqffUbSJyjkYpem4YMiIaGNaPCStXmI4BSFx6Xl1ad4NzNvaEg6
	adLEYTqbT2n9PHukmsxvbcZB9S8fv/SwfO4c66rP3TNAo9PlwtoKf1AG/H8aoCTUCimwyCWwaSQsE
	gHjQKHACZhGQzwxj4HLjAnPSmMNUzcWUeImH78BjsgZxptaz6KR9DuidtjOw3s3DJRgVb2+RhspqU
	Jy56kQoNmLa7lptij6n1zWfaG66MzmEEa1yz0zNNaBwAE71dAicKnQaXGAyTxC3K5cAIsxMiVSwI6
	QjAC4bdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdXaE-00000009BMG-3qAM;
	Thu, 30 Jan 2025 16:40:02 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdXSr-00000009A1N-0B3c;
	Thu, 30 Jan 2025 16:32:26 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1738254731; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fQWzZcpM8Pfrr8eayTzqraDrIw8mLMDULhMcuQb4ioqeWO81T9ByuMDihsuF8yYEJh0QI0X6oQunPzuJPd83e/ATEDHzTJO2AtGClVpC31kgqUfgr08OgnzIfLiJGOPa/FShxRt/uOUTbSf78b7PQvhvTluINjy3J2Q7O8vU5oc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1738254731; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=kVZIBsJ2ukDO0m/xIz1rl1s2choG2uPMysZ4azq+d4A=; 
	b=Rlyuxd1gGd47iVmFX29Du18QW02Cq0Q11hUGBj1WJEkNkf6OhwOPfCvsoHr979Xb7ZTqmCfJDG8bMW86UJtLIq2phZV6xQ8AEAWihWcKxVWO4Qpic3ay6dpQODgD2Vi5KUM9OcaeUgGJ20/rMnI+ipv13ahc6C6DNpYR4I/iYmI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1738254731;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=kVZIBsJ2ukDO0m/xIz1rl1s2choG2uPMysZ4azq+d4A=;
	b=cIdfJqelPO8aBYBLT4nqAdTTHY1tIycgwgYGXQxkY/Xzy8b90w+AWpOX4mCbo7G8
	lwTUtWqsmUPWKjPKizAboDVKdAspbNSEsXdornjaLOgvq5dou1PwaSWdNSjq6Lpw+Kf
	hVVpRlOWI/8qoMQwjNWiV9b+a3Ex7qDu9+LuE7Mo=
Received: by mx.zohomail.com with SMTPS id 1738254713036254.3717036219166;
	Thu, 30 Jan 2025 08:31:53 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 30 Jan 2025 17:31:17 +0100
Subject: [PATCH 3/7] hwrng: rockchip: store dev pointer in driver struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250130-rk3588-trng-submission-v1-3-97ff76568e49@collabora.com>
References: <20250130-rk3588-trng-submission-v1-0-97ff76568e49@collabora.com>
In-Reply-To: <20250130-rk3588-trng-submission-v1-0-97ff76568e49@collabora.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 Daniel Golle <daniel@makrotopia.org>, Aurelien Jarno <aurelien@aurel32.net>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-crypto@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_083225_153777_3D9081C2 
X-CRM114-Status: GOOD (  16.93  )
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

The rockchip rng driver does a dance to store the dev pointer in the
hwrng's unsigned long "priv" member. However, since the struct hwrng
member of rk_rng is not a pointer, we can use container_of to get the
struct rk_rng instance from just the struct hwrng*, which means we don't
have to subvert what little there is in C of a type system and can
instead store a pointer to the device struct in the rk_rng itself.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/char/hw_random/rockchip-rng.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/char/hw_random/rockchip-rng.c b/drivers/char/hw_random/rockchip-rng.c
index 289b385bbf05e3c828b6e26feb2453db62f6b2a2..b1b510087e5862b3b2ed97cefbf10620bcf9b020 100644
--- a/drivers/char/hw_random/rockchip-rng.c
+++ b/drivers/char/hw_random/rockchip-rng.c
@@ -54,6 +54,7 @@ struct rk_rng {
 	void __iomem *base;
 	int clk_num;
 	struct clk_bulk_data *clk_bulks;
+	struct device *dev;
 };
 
 /* The mask in the upper 16 bits determines the bits that are updated */
@@ -70,8 +71,7 @@ static int rk_rng_init(struct hwrng *rng)
 	/* start clocks */
 	ret = clk_bulk_prepare_enable(rk_rng->clk_num, rk_rng->clk_bulks);
 	if (ret < 0) {
-		dev_err((struct device *) rk_rng->rng.priv,
-			"Failed to enable clks %d\n", ret);
+		dev_err(rk_rng->dev, "Failed to enable clocks: %d\n", ret);
 		return ret;
 	}
 
@@ -105,7 +105,7 @@ static int rk_rng_read(struct hwrng *rng, void *buf, size_t max, bool wait)
 	u32 reg;
 	int ret = 0;
 
-	ret = pm_runtime_resume_and_get((struct device *) rk_rng->rng.priv);
+	ret = pm_runtime_resume_and_get(rk_rng->dev);
 	if (ret < 0)
 		return ret;
 
@@ -122,8 +122,8 @@ static int rk_rng_read(struct hwrng *rng, void *buf, size_t max, bool wait)
 	/* Read random data stored in the registers */
 	memcpy_fromio(buf, rk_rng->base + TRNG_RNG_DOUT, to_read);
 out:
-	pm_runtime_mark_last_busy((struct device *) rk_rng->rng.priv);
-	pm_runtime_put_sync_autosuspend((struct device *) rk_rng->rng.priv);
+	pm_runtime_mark_last_busy(rk_rng->dev);
+	pm_runtime_put_sync_autosuspend(rk_rng->dev);
 
 	return (ret < 0) ? ret : to_read;
 }
@@ -164,7 +164,7 @@ static int rk_rng_probe(struct platform_device *pdev)
 		rk_rng->rng.cleanup = rk_rng_cleanup;
 	}
 	rk_rng->rng.read = rk_rng_read;
-	rk_rng->rng.priv = (unsigned long) dev;
+	rk_rng->dev = dev;
 	rk_rng->rng.quality = 900;
 
 	pm_runtime_set_autosuspend_delay(dev, RK_RNG_AUTOSUSPEND_DELAY);

-- 
2.48.1


