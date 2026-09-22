Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DEC0C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 16:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pQfq1mATHoXVEi2yZgGnZpynXkHV46ypp/DnWHom6Nw=; b=4ZmhGxk0dlmie4PDhhp7hdnq9/
	ZkLK8q/5IqrYCzuBU6noplFq7VgED2zG+Vn+nyEbqLw6gNkP4WzF4qjRvguJan7d3ZBllc6Wao/jt
	jXjFCVQu2e1lzpfvnAvDrB89UiMty1MtYd2Q8ezERTi8JqOyx1lzGJWTOLGohpITyejJBXZ0Kdx/1
	dqlFD984J+xnk6FamxOH1yD2h4+XOGspPyyyRGuD14bAaCFJBFnzxAwE2wMbfOoWToRiRVcC14J1d
	b29eyMH02bWGrJc+HCMbihgJAtidbh6aAjlbJOXyNbP8zMwTNXGQRwetyFa3dXqx/HfEfDux7IJ2O
	2nKioTkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92wO-00000005yhu-2lVT;
	Tue, 22 Sep 2026 16:01:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92wA-00000005yaS-0DpV
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 16:01:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=pQfq1mATHoXVEi2yZgGnZpynXkHV46ypp/DnWHom6Nw=; b=PgOLXiVSyDY+e2/ZhvBR8whS6K
	gT9AJ1z8cawY+QCzL43nUDFkZDBqbGQupcFlnQEKeX1Pg0PyfmT96tgKAJtAfI19+HNZ+Qo0JMVHs
	FjiiiH68QlYoQKIai8xBkP2RJ2J3CO+juWQptEFq9tAqPLf9LewOXbInDwaOGpM9K93u9x0hzyeUt
	gDFk267TgOmgpTnpCCRGlm6NNI/C8qPUIveHb/++n7uGGg4a8YfMS0hBlNm/3hMlbWwBG9670/Y6c
	vBpW/ndGWicPcZxK132LPsBccbOngDT/RVgqBuITc41lFS/1cg2HzP7GkErFIQmMhNk7MUtNKOoSH
	LFKTbYRA==;
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x92w6-0000000Dn2s-2zFl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 16:01:40 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-482f633ece3so71253f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 09:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790092897; x=1790697697; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pQfq1mATHoXVEi2yZgGnZpynXkHV46ypp/DnWHom6Nw=;
        b=EHiq/oLofesx1lhyYiCRTFhSWQtkWB9t4gqWV5hvHf0kT1j05/dUa3yNsHJ/jaiZdI
         4v6RQUHbvYcIwl3zO5pX9Yu5uBHd/hq2cB6x0ip5DqBj1jvnza/VqceFtjgRS8FQJqrH
         LnLiFTqVE3jfLV0rXVTBEZjjDVKk9afsyzKpeM78Sc2XU391GmTL4kN7MP5aiKwqkd+W
         hQTRLwZu+ixi9bflN1T0FcytmXTbRWT8jakUkbbnJ7fvxBA8YV13VXQOEIDwqj6SkLxa
         dOatdkKE6+WeLwzVz0oL7RzLCp1+hAqKNbnH75kGJCi9N/eMHEKogHCI/LUwPgr4Mo+4
         T5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092897; x=1790697697;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pQfq1mATHoXVEi2yZgGnZpynXkHV46ypp/DnWHom6Nw=;
        b=Wi90IpjrAu1a4oCx7516mbyOyxV09koMXyXS8FT93C4dUTES8MS9UdJxt/ceGasTHr
         8Dx/UbuVGbfK2U8r3RKXnwIOByt2lOQvS0ZPJoZgB2zM6BhVbD0h2N/0YDnpZUiEy24h
         QWwLwsN6H89gtCTAF5C2zkgatoQF5HYKHFAxj51jWX4ClxLd1YL4ED4taOlMVHWd5ByS
         agKc//1O/vdXPCGkXdGbrANOIOtAt7ZgNKx/XIxe825FqfPF2y2vvoLU22ekh2aMDSiR
         D/vMQHxL5G3lXd5xlT4dl8muQhMLuLOUB0XeNoS7Asp7eHRz0z78AqN53tHPfPVnoXve
         keSQ==
X-Forwarded-Encrypted: i=1; AKwUvBxUGPiz6hqxIeHkCdE1o8vpujNl8yf/zaty6TnM+jkKLQzEz5LemCI5NFizC17DdjGWlO+P9iV5zBppYivEpxn/@lists.infradead.org
X-Gm-Message-State: AFuF++kP8EjnVwRHiXNAhoixanaceAzG7CGxHcMSyhNsBbsR8HO74N2c
	XsjaU+8cDgQt9YrqmHxw03uvL+mVPp//AAQuQUEt8YB6yY/MC8NulDNWCf8zaohycpy9i5kAJbX
	X41SArPsx7w==
X-Gm-Gg: AYBFou2Bg5Eki/Gd1jemubf9e+xkvL3FEQ7iJhDxEWz+wJEqP2hu1UFdG8h1DNkGTK1
	SEHtOuPunbqWJt6iJWOtd+I3os3WeQkioRqbjy6i8eG//dF39YjPL9rJUUMuoT2rfFHVaSk8Z+h
	YXaRpUMex7NNvrzdqvsfHyeYLcbmMNNAmi6avlRXspjLF+oYAKWwpmaJ/InDJ5ppn+nkWzEbZJR
	Ed6Gl2PBj1ADn3wi2yDrlVd36NY2cjaNTQ+cjpPxKRnh8ZKjyz7GU5qW5cWeBxXglSzuoWzwdmP
	Ma/NDwhQ8JNDI9u/CjQGUpRug0mm00NnC+UZeYTESm3kahwl+KPo75tmWHV5oNu8/WY71cKtVQa
	9ozulEnDoGY3LLdGcb3Ola58RAvtyjB4TAGIk3r6jDsnbNW+fhtl5rnnNtYWk147bS21JtFF8e/
	LBdVgC72goT1L9zawVwEeQv8a160agERjUayAkjdAQ555uZ6gR/6uJ7E76Goys4I3GLg==
X-Received: by 2002:a05:6000:400c:b0:487:951:20 with SMTP id ffacd0b85a97d-4886709c990mr52052f8f.46.1790092897354;
        Tue, 22 Sep 2026 09:01:37 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.87.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862786dc2sm6118020f8f.25.2026.09.22.09.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 09:01:37 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Tue, 22 Sep 2026 18:00:51 +0200
Subject: [PATCH v3 6/7] ASoC: meson: gx-card: add support for audin FIFO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-audin-v3-6-a760312c076c@baylibre.com>
References: <20260922-audin-v3-0-a760312c076c@baylibre.com>
In-Reply-To: <20260922-audin-v3-0-a760312c076c@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2156; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=vu+Bm1uBGIa5rQR0KJvCXwwxy1648qk7OnTjRUBnopY=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFmblkV9nDbpoPCsi3wfGe85eb//3veLqzqv8vL9f77H5
 Bb1XNC36ShlYRDjYpAVU2RhmX7vd0Gp2kPjhJMFMHNYmUCGMHBxCsBEnh5jZJh8PLx+x5Kkf4En
 tx3hcQq7ZN6dfHP+huW255scDDPPzZrM8M/y5f8Fz2ObGJ+5Zcr1de14Pev+GRfHepXq9HTff82
 2HxgB
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_170138_843252_1ADF3CEA 
X-CRM114-Status: GOOD (  14.05  )
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
string an input parameter. This allows to easily support also AUDIN's FIFO
with minimal changes.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/gx-card.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/sound/soc/meson/gx-card.c b/sound/soc/meson/gx-card.c
index 932be0a09306..35bc47254752 100644
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
+	if (gx_card_cpu_identify(dai_link->cpus, DT_PREFIX "gx-audin", "FIFO"))
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


