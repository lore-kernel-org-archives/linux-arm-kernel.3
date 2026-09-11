Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44340C88E5A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 22:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rx6csCYnBIAKkWZ5xnYlxeHA4bLs6tcrZbjQ0G65hTA=; b=xdIcQ5Gnu67i5T97qbkB3J2VYd
	xbmR+kuuag4gDOG99k1g8tQfQ9A+ZZne2AX0O0ejdAXdEQs06M51LT8UdUXgIc/hHwvVJOo1uv6xZ
	E6BJMQs4cXVScSQe/lUMpAFzf4sLCDRzQVTExHrpiIzael3L7QT5d55f6IKv2qyvDq7A8wHnsVbB3
	0xSKFnMBrq8dVRq8JrhSpxZlGi/5MF1OqGkr4dNdgRTnJfBhtJ+yMe+7NHbi1NwlpbB4uOoBAOq4I
	Wrzjx9aUUOuH1zPa3vw6pP+86qHsIlpAe1ibDxuN2lF0vAkBb2TsmRUNW70dVKPQa016XDwd3qxL1
	cL+8qleA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x59Ws-00000000FOR-2bKs;
	Fri, 11 Sep 2026 22:15:30 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x59Wg-00000000FFD-0Oy1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 22:15:19 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-49cd77e0f95so11141165e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 15:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789164916; x=1789769716; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rx6csCYnBIAKkWZ5xnYlxeHA4bLs6tcrZbjQ0G65hTA=;
        b=nDwwWYnEngUKLduOovXQ36h1muGaxBe2DZbrg8mo9cWHRRmdB9M4VEPYuTOyWLO/3F
         t9WYrIJVad917550etHcwLpVdMY7DuPPo+pZ9oXhP6HGqDao8IFUXzq6D1sLNkxjfpSI
         mAYhbGw+v+mN61k4GberURRVL7I1F3vnwuj6j2LotbLEXwDnH8xfGKKD3/g03Kwji/fo
         n2r4x+HbLvj7pNK6Jv9wtrStU0A5M3XnbRBYwWl4ASi0BRnaRqbpt3LAEsaPwi2Aywvk
         nj90ZZl4dNnrd/3JHgslTutjWGFECyF24rxVRI9BFfqZP8HHdNMRQDa+BUu4l9TOIXtw
         DIkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789164916; x=1789769716;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rx6csCYnBIAKkWZ5xnYlxeHA4bLs6tcrZbjQ0G65hTA=;
        b=hmFerZAPcMH0jE6/BV4yOPWGfBuZ9Iy5e544HY0x42c7zmslbbwWdQkEM1XCV+VRWQ
         CLAHkGxZ0S/7fpnAWV19xqoxyi/uWmtPVonKj4AF2xSc+TSKMaBFPf1xhPPNjovJao2J
         el+O5IHZHVW+bjoOJiU8uyxHQgW/MF5VE+G9W8cSFgTYRs8B0S9yc/beTFUBIujm0F/6
         7xmZ5Oq2nZJqSvw4bN0adygmEBG0Z5hTKaUoTqFMYZAq9vGn30fDuSb3rVVX5M8uKGp+
         LNouRSXTTCYnqvg03v/4X/S8dwM4j/trH9VDUvUUNAuVgiLvUqmzEH/gYRtRa43w4hbA
         LDSQ==
X-Forwarded-Encrypted: i=1; AKwUvBz17yUczf4fbyNGRDvIs14WIhFVRmMaBVVHRq6rgh7cMv+GfExc8wmPwLrsl+tceo2lbw0vpGwlMEWJX+hOlXyN@lists.infradead.org
X-Gm-Message-State: AFuF++lHbWo3BjmVAvbF0EM1AmjRciFnFeyIQaWdW7Ifk7JE9dlvWZmB
	T35HVxpajNj3ZRQiCk0e7kM2G1sSjSSit34jSOJHSBsOZB1BlD4UDNoI7u1omqtNpzA=
X-Gm-Gg: AYBFou1nLnd5/4U5hEj3/LGIP1MNt7LFplH8OhEEgKCH6OpU4aHjZ6TuZ/orKtlR/Hy
	1ZiWpDEltqN8rpjlZ0XkiT7x7ufydxTS7ghPmFPx36r8yrviBUQJn2ULVUfeKPC8Kvc2GmsoGEu
	DiGxclIHx7k40J/MO5LKixuLxeQjXjMjDspsBwDWQPjCFRAS/Zv8h89wQl52Bt+f5CfedZ0PUIw
	5q42f7sg3uw/w1lLIUIK91Bn+ysFOOLnsoqvL5mKjyXInPJzlXJycWNvHPfv+gEnCJ7ZMzrcYIh
	7us0IOXd2mzyiNTNSS6HNUyLD38jhtbTT5my/2kDN9BzHhomzbtL/XYW8NfSl1tjq0QjIIN8CEr
	8v+dlxpC1YGFpisabwenAg7OK6vvM02ZDdNqUEjDGPxcEbwC39No9Kx4tpE72hikpAsQnRRpXkQ
	Jb4VTe9DP30YxQGnNOSRrIam5C7KrtxPcjI5KUTN+Q3kX05qBR/0HmWRr+0cJjTrq4TA==
X-Received: by 2002:a05:600c:34c2:b0:49c:fc6e:a3dc with SMTP id 5b1f17b1804b1-49e619d87ecmr78261575e9.27.1789164916192;
        Fri, 11 Sep 2026 15:15:16 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.87.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c2a419sm202882745e9.7.2026.09.11.15.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:15:15 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Sat, 12 Sep 2026 00:14:35 +0200
Subject: [PATCH 5/6] ASoC: meson: gx-card: add support for audin FIFO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-audin-v1-5-7fbefe928711@baylibre.com>
References: <20260912-audin-v1-0-7fbefe928711@baylibre.com>
In-Reply-To: <20260912-audin-v1-0-7fbefe928711@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2176; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=6fSYtC/gN4yRWzT4VG1S6kcjUzyFoAinugRVvinR+3A=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFlLanPnF/HWmOcoLhLc2aG2y6DOYPfOConb106Fss1Z+
 2z95GubOkpZGMS4GGTFFFlYpt/7XVCq9tA44WQBzBxWJpAhDFycAjCRReGMDNsvL96RqhvU1Piv
 1CHgfe2NXe9suU6fDf2gmDCh41u6z2JGhgk+6q2L/vmtyXV7mvuuaEL6yVSdTdcdDS9l+Rce9Jz
 +hB0A
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_151518_162047_1C4C8219 
X-CRM114-Status: GOOD (  13.60  )
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

Slightly modify "gx_card_cpu_identify()" by making the compatible matching
string an input parameter. This allows to easily support also
"meson-gx-audin-fifo" with minimal changes.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/gx-card.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/sound/soc/meson/gx-card.c b/sound/soc/meson/gx-card.c
index 932be0a09306..132d9771e2b3 100644
--- a/sound/soc/meson/gx-card.c
+++ b/sound/soc/meson/gx-card.c
@@ -66,10 +66,10 @@ static int gx_card_parse_i2s(struct snd_soc_card *card,
 }
 
 static int gx_card_cpu_identify(struct snd_soc_dai_link_component *c,
-				char *match)
+				const char *compatible_match, const char *dai_match)
 {
-	if (of_device_is_compatible(c->of_node, DT_PREFIX "aiu")) {
-		if (strstr(c->dai_name, match))
+	if (of_device_is_compatible(c->of_node, compatible_match)) {
+		if (strstr(c->dai_name, dai_match))
 			return 1;
 	}
 
@@ -96,21 +96,23 @@ static int gx_card_add_link(struct snd_soc_card *card, struct device_node *np,
 	if (ret)
 		return ret;
 
-	if (gx_card_cpu_identify(dai_link->cpus, "FIFO"))
-		return  meson_card_set_fe_link(card, dai_link, np, true);
+	if (gx_card_cpu_identify(dai_link->cpus, DT_PREFIX "aiu", "FIFO"))
+		return meson_card_set_fe_link(card, dai_link, np, true);
+	if (gx_card_cpu_identify(dai_link->cpus, DT_PREFIX "meson-gx-audin-fifo", "FIFO"))
+		return meson_card_set_fe_link(card, dai_link, np, false);
 
 	ret = meson_card_set_be_link(card, dai_link, np);
 	if (ret)
 		return ret;
 
 	/* Or apply codec to codec params if necessary */
-	if (gx_card_cpu_identify(dai_link->cpus, "CODEC CTRL")) {
+	if (gx_card_cpu_identify(dai_link->cpus, DT_PREFIX "aiu", "CODEC CTRL")) {
 		dai_link->c2c_params = &codec_params;
 		dai_link->num_c2c_params = 1;
 	} else {
 		dai_link->no_pcm = 1;
 		/* Check if the cpu is the i2s encoder and parse i2s data */
-		if (gx_card_cpu_identify(dai_link->cpus, "I2S Encoder"))
+		if (gx_card_cpu_identify(dai_link->cpus, DT_PREFIX "aiu", "I2S Encoder"))
 			ret = gx_card_parse_i2s(card, np, index);
 	}
 

-- 
2.47.3


