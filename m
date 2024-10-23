Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE7ABCFA45C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 17:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4T91d+bznCB7MrilGZZnGDp0TGLFXhhuyuq/BXHaJaU=; b=aAASAt15aBrHqcDCADIWcwBYeq
	xhJlkGYwWN94kU2TLiaQy9Qa1f7p/VbQgya1VLTOYB++PXnWNBwhRU3a2KsOwT9PlcARlKt/ZXdsH
	QpXgvqMZUH5DvmpKGDMpMV6GqOhIvvgpcjSJT9YbbR7fNLTLGzPi6xJ7M+uTVmpfM+vL9CZ2T9FK/
	ZC8RnpIYwHGjIqC85xZJY9QFvuCWVgybRZA/3AwuzHsDvYdcIDUOo+ziU5T3n6Ut3uXaOVE41nZyY
	YC8eJT53qoRE62JO3vmNhCdt9D5zlzL+cnlH2dxG0d3QPD85XQcuwYgEXVuV1z2lB7uzlApM6BIFZ
	3G0lE7QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3fRO-0000000FQ86-1CUf;
	Wed, 23 Oct 2024 17:46:38 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3e7R-0000000F7gX-0X3o
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 16:22:03 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2fb559b0b00so62325531fa.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 09:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729700515; x=1730305315; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4T91d+bznCB7MrilGZZnGDp0TGLFXhhuyuq/BXHaJaU=;
        b=EL8g9ZN7ZFYnkBoCZ7es1fidNV2CHmkT4K1j++dLWpLOiWByY8ZoaObueqkiiieO39
         fVySEiypsBPfVtHprlhoCmzSzq00kTn04FcaL+37Tp/3vUFkwobQDjI2XENbXE1L+Kx9
         frww63ZzBpm5OPEMOD8lBxmLAo1CgmbnAXzdaHUZvIWgZEJKzeJADySjcq740nJO87lN
         4kYLQ/q3E78H6rBDh6jaCdF6+nCNI/1kYcLynKwObswrgFSrFyQhy7aq8dHhqec/r2sZ
         xPLFDp/ugG6kug+JjnHoHSBuEspSBfCHBEAIMfLhMzfUU9xb79tmO3JFcRzkHP+fTMtq
         fZhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729700515; x=1730305315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4T91d+bznCB7MrilGZZnGDp0TGLFXhhuyuq/BXHaJaU=;
        b=WoMn0J2b2miqQzUTKG9exrcUJu3fu+OgCWTw98PC+/wdJ/Rcr5Dy+uU9ry3SjkqKRO
         +KjZz4VbDOD6612b0/RyIhEBOgkw2AHVD2KE4/25AcwTHDsuAq1Tq93SWkUiXl0wnyAS
         H2ROdqku4cOeHvgARp5OaJbgb7hgUcK/oqWxwHLi9h4jndduXww4bOEGdfpcd0qQvgYC
         5Cp4s2RA9OvzGiT+MymNysR6zgI1m+1IZNYFoOFkDkE8MWjxhaJ9ZWVKICyu3AmOi9kB
         0RS7fSR2L7Nxk1E0H8K6S2W5CB81e4usHS9X51Y86aYte9cHu92kmBoihRd0r1HRLTTL
         vlLg==
X-Forwarded-Encrypted: i=1; AJvYcCU2jGfqigb+GornsmHk8IEW52EiAXh8m5iynbT/2wqzmjwpSCKC0xtxINfS6EtRqI31p4PR6Dp5bIqPfMNEdMpG@lists.infradead.org
X-Gm-Message-State: AOJu0YwRM+sd0qCqVEIxxMu329oUXlmiV3rGiVZwccKsuXt91vwoX3dR
	eZ0cWfSvWzW3oK0AsW5ld9n2JDN4dsLXBzvmA3FfeYXS1+bOeqvx
X-Google-Smtp-Source: AGHT+IGSuRDP9QiG7QKq9fGBE5EgHFrsYc0Z88Wu4omye9JKc34vnBuHAWvJD+QR/DERkoh54VOejA==
X-Received: by 2002:a2e:819:0:b0:2fb:c20:dbc3 with SMTP id 38308e7fff4ca-2fc9d5d4042mr14177941fa.39.1729700514531;
        Wed, 23 Oct 2024 09:21:54 -0700 (PDT)
Received: from playground.localdomain ([86.127.146.72])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66c72609sm4588382a12.88.2024.10.23.09.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 09:21:53 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	sound-open-firmware@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] ASoC: dt-bindings: audio-graph-card2: add widgets and hp-det-gpios support
Date: Wed, 23 Oct 2024 12:21:12 -0400
Message-Id: <20241023162114.3354-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241023162114.3354-1-laurentiumihalcea111@gmail.com>
References: <20241023162114.3354-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_092157_450387_CBEAE9F2 
X-CRM114-Status: GOOD (  11.30  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Introduce the 'widgets' property, allowing the creation of widgets from
4 template widgets: Microphone, Line, Headphone, and Speaker. Also
introduce the 'hp-det-gpios' property, which allows using headphone
detection using the specified GPIO.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../devicetree/bindings/sound/audio-graph-card2.yaml     | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml b/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
index f943f90d8b15..f0300a08f7fe 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
+++ b/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
@@ -37,6 +37,15 @@ properties:
   codec2codec:
     type: object
     description: Codec to Codec node
+  hp-det-gpios:
+    maxItems: 1
+  widgets:
+    description:
+      User specified audio sound widgets.
+      Each entry is a pair of strings, the first being the type of
+      widget ("Microphone", "Line", "Headphone", "Speaker"), the
+      second being the machine specific name for the widget.
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
 
 required:
   - compatible
-- 
2.34.1


