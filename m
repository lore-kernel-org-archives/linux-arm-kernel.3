Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0946B606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 16:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=r/3pzX3s;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=EeAC9zca
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6+1tf605VEw+u+AR0YH1cCPgkt2etMqrPGwsHIMVVIo=; b=r/3pzX3s021z40
	9C8ebIfkAMj/NnWLbSNpG1DJsNkt1KdtiVaW6i1fsOdDeK5RBSOr+i8lIwe5UTTsAfBVcwE+tDH5Q
	QFN/+5FyDtX25BRogtGPj8GQ0Lz38JmPAEKGKfn75zwOfjiqIPVj1BJZxK6qB/vyPpjBqKAnOWNMw
	k5cif52X2BnTsNea6RFJ38BP9lMgTmc9X84ydEsipmI9khXTF7ZLNaDWCWSpfYgUq0uxGwMYOUS1p
	NB23ZlbmYRTisxFAX9JyAimMbjP3qVcfoADwGI9EwjKpsyh6qIwpFRPHmzBOca6OR4wxdcPzHTXLv
	s8gwHK8NrvJatR+xp6Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpXH-0000000C8CY-2nEZ;
	Fri, 30 Oct 2026 16:32:59 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpXA-0000000C88X-0lSz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 16:32:53 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso9200805e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 09:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793377970; x=1793982770; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6+1tf605VEw+u+AR0YH1cCPgkt2etMqrPGwsHIMVVIo=;
        b=EeAC9zcaUuNMtZvaDjkAcELuzSg6fr19EFpVxoaf+MXZ8aV9IPpwkDfb3idEF3tKoU
         bNjnVkmzZ5VBxcgnBbXit+aVEGMJDoCw8hI+eZVIT1e7otfe/IJi+zyRq/zLaOBhpgR5
         ZUP73s0abDA7vdpVWomVGeJ2JPFebOVsctMN2gEKr1w0ebnJqTW04smnj8rI0PAYUO9Z
         JhWS5JltZ55fx3Jb2GNSiC8blXuHeSgDVoPfMpTmKQOWb7udFt8fCncOisv3zD31fuEK
         IityCJ3rBApQyCwlQzIOOHdWB7/a2HC8VQeN71psKzcvYX4UiUxYoHU/beml472q9dY+
         1/FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793377970; x=1793982770;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6+1tf605VEw+u+AR0YH1cCPgkt2etMqrPGwsHIMVVIo=;
        b=nFsI1jN6e42VBBw8a35uA6IgHpRO4muDC9hqIskYdg1bqbbQr8jviGflRbVcYEOE2c
         ryg+Da6ggkEefnQV34u07TQ4bOweG37w32QXAsHebVRPeoDqi/R2Wy4QnjEVoGUbGIq2
         5eqU6+iZYRfX0xXOq6YBqPthguGjwM8tDt5JPj3gisdAMH/CwqvvTTTfk89yi2+F55AK
         Ombf0NsqPr7xdiQPn5rOkKRXYxUWn2YL1bCzSVXhoLc4w7GM93euNt5i55LlSwA/pghT
         mzR+mIJU5oro2j/ItX7XGSDYdc5St/SXBvduuqPccbsmoRjQR0xh8mnyOfPJ5swlDIwH
         GBRw==
X-Forwarded-Encrypted: i=1; AKwUvBysKlLZKBGdG7O+fVMtAXgdhQMQ2B1NM0yBGYhJ41dVuDP6seLCKSDWK0PRG8o/1+0BIYLBNY4l4SH5UkTtxcTJ@lists.infradead.org
X-Gm-Message-State: AFq9FYLGASvkmlU5NrKLd3LnuCWi/UkGbAePaScIjhl7y4y+RSjDJwR6
	5butChqOFySY/rr3qNlheVu7wJxNwfEYjiIC0SwMpAuVb8buYl+2FGVmlkU/S6Gvj0k=
X-Gm-Gg: AYBFou00Kfg4w4lrgbn13l3SfwKtK7eFSVXeIRRQR0HNThggJQbr7DXeWkBfloBgZ8w
	XpncDfcaTtr66JvHJaQs/cQWT7U0zJ2Jq8hudI1pWUdO/gPm4pvRTPL97S/LysOfb+WBJYsnrJs
	YpHhslfSN310h8xIl0EAKenp2yN1JhrTkMp+K64rCmM8RB5Iib9l0MlWs95NgJb4Ht0fJk659JV
	EcdRyVaJTtg8xR2I/IKfZEWRXenwveK0UKGwA8BR+FqANh5ihEpZ2vGUcQaJm3VQwDei/2MDRnZ
	smOVG7QRAwcLQxCcJC0RVaj3JKRYXMtJjwWwF6MR5u1lsPV4JeO6efZ9ZsTe+tF3EH8+lTAiS/9
	TY+v3yan17HFb4h1jlbV+5YlulixGC9zhmIOy8VMdEZgWLq5fvbr49tbXsCddJG/JBCKhV7Jp4r
	05oHBTBGOsL1BrqVGggxViSObmAPwjuGHfoxfmaFR7E1rcKOpfi31mzpi7YplbJHOsI4yfS19Jb
	wG65iG5CzZYKuTFXnFoFwMC0JWbOJyxTjJiwZKQ9dInbZSXaYIinS42/PdZESOuaWMNjufvPvvn
	OA8ObygurhIxmOovzpHP3MnZmGVDtztNlAE0OCP9JN103oissQ==
X-Received: by 2002:a05:600c:8b55:b0:4a2:1655:87e2 with SMTP id 5b1f17b1804b1-4ac17b2b023mr70629455e9.19.1793377969852;
        Fri, 30 Oct 2026 09:32:49 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b959c1sm4062372f8f.45.2026.10.30.09.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:32:49 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 30 Oct 2026 17:29:54 +0100
Subject: [PATCH 2/2] ASoC: meson: card: unregister the card before freeing
 its links
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-meson-card-register-fixup-v1-2-6474985e94f6@baylibre.com>
References: <20261030-meson-card-register-fixup-v1-0-6474985e94f6@baylibre.com>
In-Reply-To: <20261030-meson-card-register-fixup-v1-0-6474985e94f6@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1200; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=MbVgYLo6a0sH0b1W+GvzTE98oQ0+5OC6agqIsxBjCpM=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlPjq0Lkf+sf85oVkmvYbuC66yvHz5Vc3HOvrCEzd/If
 LbFjofPO0pZGMS4GGTFFFlquKvF30lqfZk1Xec2zBxWJpAhDFycAjCRlb8Z/im2TJmvXdm04Wfk
 zt8qz6atM45WzcxKkM82sThy2XpD8EdGhhNTdi+SP1rUmtsY1C7j1bfppaDdlW5mD7kXm0uZKkN
 lGQA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_093252_257968_8E30F7DB 
X-CRM114-Status: GOOD (  11.94  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The card is registered with devm, so it is only unregistered after
meson_card_remove() has freed its links.

Register the card without devm and unregister it in remove(), before
freeing the links.

Fixes: 7864a79f37b5 ("ASoC: meson: add axg sound card support")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/meson-card-utils.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
index 3cdc73b3fe8b..24332f29047a 100644
--- a/sound/soc/meson/meson-card-utils.c
+++ b/sound/soc/meson/meson-card-utils.c
@@ -309,7 +309,7 @@ int meson_card_probe(struct platform_device *pdev)
 	if (ret)
 		goto out_err;
 
-	ret = devm_snd_soc_register_card(dev, &priv->card);
+	ret = snd_soc_register_card(&priv->card);
 	if (ret)
 		goto out_err;
 
@@ -326,6 +326,7 @@ void meson_card_remove(struct platform_device *pdev)
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
 	struct meson_card *priv = snd_soc_card_get_drvdata(card);
 
+	snd_soc_unregister_card(card);
 	meson_card_clean_references(priv);
 }
 EXPORT_SYMBOL_GPL(meson_card_remove);

-- 
2.53.0


