Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A65EC88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 21:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pQfq1mATHoXVEi2yZgGnZpynXkHV46ypp/DnWHom6Nw=; b=vI7QrG649psOp18A7ZTnxJDhzE
	q7zHR/B+rnri+AJ0DXmzb2SIxVNdY/pLoXvSDeYxuvw7/62PQB8tDPWbzDtdcPRgvcFpo7xxjzAoV
	xz762kE0nJ1QgMVD4x+kQTKvTwwQQ5kLdh9Pw5+WFX4SkS2NtElLyV2tSEyPf0q/DRIIYav0x3qVB
	tR1XMhWOj5aMa1ysVbdG8KtNPudA+o0LJgLe4iczs5EUncLiE0ouIuRBR2nmLwGNuZkolDZfgbB/C
	tbY1YDHcYzwpiTtL5aExMpy8KgZBYUfJzPBHD68yWVR4yU1j1L47cOnhsxR1pszokEvSm8Iedww9F
	ASUh+/4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7JGZ-0000000CWQD-05nt;
	Thu, 17 Sep 2026 21:03:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7JGX-0000000CWPM-21Ym
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 17 Sep 2026 21:03:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=pQfq1mATHoXVEi2yZgGnZpynXkHV46ypp/DnWHom6Nw=; b=fGEOfY4rcvof4IrPRwS6v4Wf4q
	NdlNMUiuh6PGYHRsQ64dXV2FBq9B41pWOG4UKSW9dpvTY9kAQ5WWJ/0PsR1VRiDzSPMtfV2fxLrtb
	P1rxUBBp08HHXJxL8Mcx3Svckm+Y6rtIZzXBcAAaNBcFYqztpE8Tq3ylaxiiA1e657HOV/S8VTL9i
	h1oO5ugfhs/U1MYaFhDKTRqAVOZ0QGOLyldTJjL7FieE+FIrnFVLwQAWOqGhbo149BW2lnmgSaf6B
	5DjJZNyhVGeqcCy3U5yM1YgEGv1grfJ/rei7U6g63UCgC59OEqwu6YS3o5F+ivUJW/DkcGlb0lIOp
	MxkG0vjw==;
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7JFs-00000009GdA-1uv0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 21:03:31 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912e4b11so358875e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 14:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789678965; x=1790283765; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pQfq1mATHoXVEi2yZgGnZpynXkHV46ypp/DnWHom6Nw=;
        b=A7KVN2E2E60TcnyG0bw/dOw9l08mQoJ5wWDaDjAEbjyrTfLj/YjaAu7je0fXNayCvD
         tL41gM6Y648GpmR3PYetTytr5mdNcJxdqmeIUVKeJIVd5iL8e6dOr8MzFsC7Upm36ae/
         /961NjiDPJlLDqU50XCrPbKEBRUueauWJ/dfFaT6kc47GHzDnaOxU1mgcTSQJXa313YA
         QGIlJ+ok0FM3vWi/hJpwA4cAoxekJvtl7D1x7RV+doJoBmeYd3bu37UXdwfgogbvXIga
         q8ruMnmYYBh8RdIp9BEhJOi3OGHGOsrMjNo2gVshKMpMSvlxSyV7WMgzZU1057qeqIY0
         YVVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789678965; x=1790283765;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pQfq1mATHoXVEi2yZgGnZpynXkHV46ypp/DnWHom6Nw=;
        b=K6h/coX7zqPfQ4e6Mky3Ucy8P5eNvyd3F0rvKp+1BYUTXelZjuxlBt/uUmpVvSKzN/
         9aA03+ht/wvremDs3y9DmFYEndapgkq6mBNjXukjppboCd74Qgowz4yx/e2w5inR4S/t
         WLxll/932f0bafWL8iHt/nu4pyiwI/9REKQAAxKJkaHHi9s7T/TtOK4YxHZJTxYpsKMG
         W6yUJnONQC9tgRJTXoFzMS30H0o485xzYal9f4f2dadv1Y6qQH6swHYRmdPPxWBw4Sqs
         KnZlCrJp+JcLBXgkvDApYQRijAhZIhpOYgCBBj1bldNUT9o5FB7h5brN0Ah1arSRbpIA
         7rHw==
X-Forwarded-Encrypted: i=1; AKwUvBw5wa/RWp7Q3OLiPNIbOK/wC0tC4wnl/yGFGxiH9DDwRrJCoKzrPRt8PCRDAsmlJlT6djzhTN93HGMrbVsmiOAi@lists.infradead.org
X-Gm-Message-State: AFuF++mmZixFxR6/n6z8qDEoE+tSGDLjik81oNyOeUecbjj4GtBoMB3i
	Qt+ADAF4/5Af8MKusgAiEQDCQlLlKpf0AryralERIL/trsHkBHf6F6t9FMPKrotVZ2c=
X-Gm-Gg: AYBFou1NQzQRFs3EGmwb4EmTzM89xnoBCZsjD2Wtm3g1BO9eqKFNY6G8bllkpx8Zs31
	pWBj7UKCYfHuEOE5uplBTkJR7NQvL65Cm2KykzJetnSgPCvyoEtFRpgJELSxl6xYHrP0oPxbHY8
	cn0nvk+TJke0y7MinTZAy/GgtGHprZPSbcHq9l5kTp7/uDyRfKvyt4d284YwS2ZfhPjrVSKFhGC
	+ariSmc95Nnsz+1n315AnCPQm8YeL+ZNPca0yPIYIjU3mgf7pfaWo60jJeERMAl7tLZL3kKHzVJ
	Y0IOJ9m9Nbw4rOvMp6itSFt4maJhIALqtf+LqemQm4PA5V5rYpJ3/wXbA/eZgtxemjZG2jLaUT9
	EcHQtn9NDAiKtE6UoeYvqyd9HB9KBIYmgV873j07XPPRdpruM4Lx1QZvQcLReVlg03zBmUFo5bq
	XIpAEtbTJsmJCNW19d5KdqgkJxKgXF0FCX9rmRsGj+pca6vdyeB53c2Oh6yOhWnBGcjw==
X-Received: by 2002:a05:600c:3b98:b0:49d:1f10:8b9f with SMTP id 5b1f17b1804b1-49fc56dba0dmr2100645e9.7.1789678964981;
        Thu, 17 Sep 2026 14:02:44 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.87.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc5755c40sm3106095e9.3.2026.09.17.14.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 14:02:44 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Thu, 17 Sep 2026 23:02:35 +0200
Subject: [PATCH v2 5/6] ASoC: meson: gx-card: add support for audin FIFO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-audin-v2-5-38de4bc1de34@baylibre.com>
References: <20260917-audin-v2-0-38de4bc1de34@baylibre.com>
In-Reply-To: <20260917-audin-v2-0-38de4bc1de34@baylibre.com>
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
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFlrQnNvBO8UVQ8+9qB99/VbLAl3fB9mMG7qDv2Yxp5U5
 frLok6to5SFQYyLQVZMkYVl+r3fBaVqD40TThbAzGFlAhnCwMUpABMJ0mZkWOu4oW5S2wKu3Rzr
 Q+/P8zi2ftoWrZUGXCl7/jeey3uy8inD//RNdj9qdysuEMmYfGw9S67zmvPuhY+4dB5MXj71EvO
 So3wA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_220312_266262_FBF87CCF 
X-CRM114-Status: GOOD (  13.19  )
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


