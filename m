Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46BEFC9830D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 20:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uae9hpUYrYglCWSSadpE9LyEi0ppwlaugCpZRYr3ziI=; b=lOh8/4M+Ofz4NUPT/zPgeRCKEr
	OTffdkzBzPvkj3JC32PRc9s57Fd2Zb6hzKmZ7FWlYntf41gdMvfPGMJhXz/yPbcoyyBIQxUw5ltAs
	mOxwloXdSTPuO7NRajpHYoAJfgJurPNS06yAxnDiCYHMJ3qbO3gTlWuPZDzssOJat/cc07lBHsY9V
	ClOdJgtoH8wjdfyj/zc9QKqLjx9v6ijD+j3xkgfgZZCGdMlyMQYjgq7JwuTvxjgPy+Mj6wF1QP80X
	oo3zDfbwHUn6tbyFu8oXD6mLXh8nnJHRTj+piLSKaxtIvz4HQDfO/jRRcA4BsakcTVJzdCvtRmAxi
	wmL1OYkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Tsi-00000009VSl-2Wu7;
	Wed, 23 Sep 2026 20:47:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Tsh-00000009VRG-1gBg
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Sep 2026 20:47:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Uae9hpUYrYglCWSSadpE9LyEi0ppwlaugCpZRYr3ziI=; b=SrzR7AtO3tLIjuuPNM8Pc2z9j2
	Qz3JdlFBAaJZ7DUywLqTC2KvjYP8gJwOJxaUvCvv8Ainj04Qj/BwvCjhUYvKsM3Ed538gMMXtxUIS
	wXAo/4Kcm+vkugqbluKRClaOcVgluSx8UYtQqcRdRjfJMZFpej8TFPNtFihyRgSU2ICUeHFtt1ZYG
	hB0C2wnoieWj4m9lXLyZJb51SNuAufzMQ89PP2eY3EEavtUx5pmd5kjQwEuxq7Vktmn1w75tiQvmL
	9CtBF1dMn5z2ZCnoUHxpMZNUrzcHICaw2x7RHHuZpXRbt1KSn1cOWTPxcPLK6BM8CFC8okemvl/vm
	ZY47PT4g==;
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9Tsb-0000000FGmF-4AG7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 20:47:54 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-482f6350faaso918188f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 13:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790196468; x=1790801268; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uae9hpUYrYglCWSSadpE9LyEi0ppwlaugCpZRYr3ziI=;
        b=JX2wx1eOkf5Qu6MWkw+w3pOZyqNlEJe1Q51EVbGrgosALNxx6ztyJhLpy12ToFezrL
         mkz6yl9D2ZvnZe2MhuA5hKp1leMSd/r4Dsn3qLksss6qx2UIxkOawRss2207Msc2ZyaJ
         08ogul+KY756rGphyKwfHiXA502FqecU/VpNY2w7BiM9TEYJIeKq6kVQk3DtaTdwJLxN
         Qem8CjGp/y7FwYKlIaMgNtKpilxD7c5rb75KF0Ai/YV9akZCunRXr0kFWXlSCuA9vfsb
         TR52xZYK/f/Ovrb7FEXsdPzwBRKbNMlfCX0pIuMPiHnf+nNueIK+rndGSiGA5tbZndnS
         01QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790196468; x=1790801268;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uae9hpUYrYglCWSSadpE9LyEi0ppwlaugCpZRYr3ziI=;
        b=mHsp6dObgx7O316AFSDwWBKsAY0bo4mc35BwGWv6Gqj/+1Op5eEVG4JgN6htWHUP66
         /4Xvq3F5Q4cKtey3hjO9+8ce/494mCuOMYM+17kQip4gBCe2RnEkX0jsBktzaG9oQx9t
         mHC6JIWKzSwsGlzmlPVIU47W56LlxBB6iVPoRVbJEaTSBVNtvCatih5d4PW2pAlcnmG+
         cHQkRUyvi/uCDpb+0Y+5Q7Hu+LfVel2JxbUHX1nZlov155eULdbVkX6L+NMBeguE4mW2
         Ja0AUI2jl8h+g6rGMYzZjjvzM/gpZ7gZSsEBrxCLBSSn1piXVg2kdhCdsykKnmRGcsBi
         CCTw==
X-Forwarded-Encrypted: i=1; AKwUvBw7g9gKd69W+fD7ypqAwt4Ux07D0I/SbZd9dViuv2iCexay+wLGAC7bjNRz/WKqjwwCrz7PHzuyaY2ZBx+30Pa9@lists.infradead.org
X-Gm-Message-State: AFuF++kEfygtA6wI54yZzpWp3sSri3hp7//K7/H7Blm/SiLWpGkL76uX
	JS9IjZ1Pf8l8EWNo/U+XvvaJ/IekMBhZXWPQU99JVCDlAsZxDGEiTLC+K179T0YnY6s=
X-Gm-Gg: AYBFou238Sd4l7xUxanOD1wnr48dv0GVKbQQr/HMnaFfwO0fn7l1i9BcSDeI4r5NmqN
	fILhwzpjxDZ4GzMQpYWIBZTSBJRjo0fK7aJiVdwM6GOwXoU5j9dDROzhNIpU+Y/ifODk1zCLjnf
	rxnr+WhslQitZIfl/wMFWQVEQdIoX1Qoz+I6Z7JzONo+GLHn6bIOwZYw4d+c4moiCPGZEWmXbPa
	opM5tJmfXEYRpIuo0ECnY77ODKTKyhjXtfoxdw77vbs1BZStpsZEAnPS58SsDsMxTsQ6FjpjGHR
	jYFy3ZQHz2HSSW2CDYZbAQlb/Axz2LnWPg41s8Uux2Jf+OmcDqk6/q7OJMYX79LZCxS6WvcRz8O
	2WhLkn10v2OJsoStspF26BmeXJPq8809aNyfGB2phE/v3iK/I2fAwCbFM+LkMo0eG2BpLjzS/h4
	MNOtGDTMk3PunmZtpkCjiO40Zq12ijcC+LhZnQxo022xnYgY1IQLj0b7Ae8QBOBePGc1pKwZ0Hh
	OvyZxzk/ijYIu8UtS5v58t4zeG4
X-Received: by 2002:a05:6000:617:b0:486:f46d:bb02 with SMTP id ffacd0b85a97d-4887197b60emr438659f8f.57.1790196468392;
        Wed, 23 Sep 2026 13:47:48 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488688893a0sm9653251f8f.32.2026.09.23.13.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 13:47:47 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 23 Sep 2026 22:47:34 +0200
Subject: [PATCH net-next v3 4/5] net: stmmac: sun55i: Support TX delay
 extension bits
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-allwinner-a733-gmac-support-v3-4-15735155a789@baylibre.com>
References: <20260923-allwinner-a733-gmac-support-v3-0-15735155a789@baylibre.com>
In-Reply-To: <20260923-allwinner-a733-gmac-support-v3-0-15735155a789@baylibre.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Andre Przywara <andre.przywara@arm.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1789; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=B+n/07rbShxe+UCgpvoXo+3mb6MPP+M9H3khzu3hpGI=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlbrN6aX1BpNohN+nGv6lzKq6dxK0vWL1vyT8Xpckfx5
 h8t31Imd5SyMIhxMciKKbLUcFeLv5PU+jJrus5tmDmsTCBDGLg4BWAiUxYzMizurl7xTPXxju68
 fVyKXxfOCvqpquYo5qGe6ZfZve+E8X6Gf6r7XI+uWFA929e1/vyEne/vXV83L8NuGev7YM8Wfde
 5XSwA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_214752_659270_8F3AA9CC 
X-CRM114-Status: GOOD (  14.23  )
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

On the A733 GMAC210, the TX clock delay is 5 bits wide: the 3 low bits are
in the ETXDC field and the 2 high bits in a separate field.

Add an optional mask for the high bits to the match data and set it when
necessary.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c
index e759311f40fc..49abbb248b61 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c
@@ -42,6 +42,7 @@ struct sun55i_gmac_data {
 	int (*init_resources)(struct platform_device *pdev,
 			      struct sun55i_gmac *gmac);
 	unsigned int flags;
+	u32 etxdc_ext_mask;
 	u32 txdly_step_ps;
 	u32 rxdly_step_ps;
 	u32 offset;
@@ -86,17 +87,21 @@ static int sun55i_gmac200_setup(struct device *dev,
 				const struct sun55i_gmac *gmac)
 {
 	struct device_node *node = dev->of_node;
-	u32 val, step, max, reg = 0;
+	u32 val, step, max, low_bits, reg = 0;
 	int ret;
 
 	if (!of_property_read_u32(node, "tx-internal-delay-ps", &val)) {
+		low_bits = hweight32(SYSCON_ETXDC_MASK);
 		step = gmac->data->txdly_step_ps;
-		max = FIELD_MAX(SYSCON_ETXDC_MASK);
+		max = (1U << (low_bits + hweight32(gmac->data->etxdc_ext_mask))) - 1;
 		ret = sun55i_gmac200_validate_delay(dev, "tx", &val, step, max);
 		if (ret)
 			return ret;
 
 		reg |= FIELD_PREP(SYSCON_ETXDC_MASK, val);
+		if (gmac->data->etxdc_ext_mask)
+			reg |= field_prep(gmac->data->etxdc_ext_mask,
+					  val >> low_bits);
 	}
 
 	if (!of_property_read_u32(node, "rx-internal-delay-ps", &val)) {

-- 
2.53.0


