Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 739FBC71130
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 16:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yE6IzPfXHMNhFc7FmQD93cM50XDdvhBiuKkLkDIaWfk=; b=pGLVgmjAmTPsctJ5kaT2mE2KMO
	i6qbzCAS2txgubO8ldPVNuHrwfUjo5mzXZi38+U/o0grovQRZ74vjTOknViT+IwwyoxVcyCuUVblX
	f0qxp9cr5PnhXuofcenUfix3aDO5bNy+dGrj1zIKKlcX6yU2sAAtJWlHsFbB+SBVtdn9hVdW6vGke
	7gngFKyAr6Gcpf7BoMSWAyIygonCGgpXc9zja+NwVioMsoAvq5eYfB8q1c5PWRMa8hHAdluYQ/j/r
	HLAz50NEuhA5jVkiQlTtxBpuBYL/D73nnUzUEPdmnFyzhQPlmI6hj3Ls+rY1noEI5YQmbrIOO9SU4
	LkU3x+Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP2EX-00000007XKG-0o2J;
	Tue, 10 Jun 2025 16:53:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyEw-00000006nLJ-0ZH2
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Jun 2025 12:38:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=yE6IzPfXHMNhFc7FmQD93cM50XDdvhBiuKkLkDIaWfk=; b=pDByJlIKrwlwm463vEVVwYQXX3
	lxFDzDBjT4KgNQhtHttZJ61GvkOfH0pGoMFmmDqb/D9oNB58UDl7TjwE3RbG5YkjUUorVzimpq9fH
	JRCsFzMPy3VQRQn+fbBtlfPfEqCD8loUk5HvrF3et0QhGVnznag5XKOCu6grfHjby1kaYnd5vTCaL
	Xr6eTfQ3J90371K5KayvnflLP7D3EPBrRlB31RarwDDHvkZ/vRe1DpoL+Ay7FqwQYxT1QB7XzVcgb
	N+ek1HyxI3efFcmiibzjScDOAEXvmTrwuBgvkKXF9V7wnq/QSaxkKn9XeMnFhymsNGxNMUnKVjG/y
	jZzoyVTg==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyEt-00000001otp-2de1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 12:38:05 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-452f9735424so13172895e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 05:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749559081; x=1750163881; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yE6IzPfXHMNhFc7FmQD93cM50XDdvhBiuKkLkDIaWfk=;
        b=0kXGZVrbUzyf9pG6aMQJi/Qohq1zhFfPmw8h8ilLUUqFx10SgVSuO56Jm5Q91siHkY
         w0zx9ZzgaJocZ9LNHPClfucRNJXHr5Isb25M0+9Ko9VRS3WUuaIcYcZ+Rk4bRFMmuWYa
         9kylDMECXiXVkjlGFNMKnjtBvOd9zyeAmwkW2cv7oTghYIJ8pEkqn67sUW3hS742NnvE
         C0JranDPf7eMWfD+GrkaRwawi9ZLiAwV8HKNreIB5SwRdwiu7dJvEElpCNPAkzfNTDZ1
         XQPY4FlaqV0YLrF867xnSqr6D1TNC9W49z6YlYkzK4LrYGoaqYkj/Ju+Cky7QU9encFR
         nlCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749559081; x=1750163881;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yE6IzPfXHMNhFc7FmQD93cM50XDdvhBiuKkLkDIaWfk=;
        b=pNo742kcdjMHOE3pBxfSytjKrfw04eq+8scnvv2meTAZ/zbdJ46culuFnaIH7gHOoE
         j0ZEnQhzhd3ckWIDEfmtAdTTcqm3p/zpLzHWl1/CHXyPKw9PaYaWk7S5B2hrQvpDbtLa
         MWPr2w9zDlCASwonAMxYUuFWDkZyZShISPHdI+pieARWl1KARuV/9zuJ9DbePsVkqCPn
         5c7bSHxS0vFb74lstPiFjhLULsa92kGiFVVcyUdUQvYjDBA7Nw9OEBDkcy7HFFTakor+
         9A4ymc0z15HQdPauvHEp8qU3F0iLH7/MxG2cpJsrbYo664yozcjVarfTuiU6V/HBi4cj
         B7DA==
X-Forwarded-Encrypted: i=1; AJvYcCXhWx4EiIWM9T/773drngJ/Pb/hVtUg3adjEK16aKDlVsrFfCxCSdRRk86mFYZ/Kihm2D9HTOyclMZsytn36Itt@lists.infradead.org
X-Gm-Message-State: AOJu0Yyeg1KMZnvB9WwIYAJq4bVQrji91xpK1jTCAX4G1WAfQZvSsow1
	zE/tHRo/RtRhJIJ+BYlBBc3J7cvdnccvvddI46xWyqYO/nujJSy+PTlLG5sUd2CqMNw=
X-Gm-Gg: ASbGncuJMOfSu6ZwYc0yCnGQ2hLUYKy07V3f0IXr553piBSaQDJXXCWlEXKGwjUwTcT
	LMN5uzvXCJm5lyWA3u4dTMDaASRHWejUppRuk4zaRpKMe6lRGm39UQ7DLgfBCiCh5oyB8DC/ITA
	Rgtg4ciIQL8eg2nPFQYw23IuyTJVujeBWEQ/5m6T816sWGuTbth/Mku5IOTyAxqvT628RgXsZaZ
	wbuDBT9HB6jW6pBuqyIEh61NOK0a+pKhlmIOd1Cy7KGK6cnwtnYpqXsqiiuRCqaIEClcyCakFOp
	ZMQify3jxrS8eZBl/cXZ0i2hLUA3tCZAPkpOv++VMGO3SPl/Im+ZSg==
X-Google-Smtp-Source: AGHT+IFIluBj/Xfh9+bgn/r8g+NKbyNkI+i+wm2/n6F+sHhauNTA3wsDUZNyQAG+f+/XcQqd3EiXTw==
X-Received: by 2002:a05:600c:3f12:b0:43c:fbba:41ba with SMTP id 5b1f17b1804b1-452014d4870mr138049945e9.28.1749559081442;
        Tue, 10 Jun 2025 05:38:01 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45213759fb2sm142476805e9.38.2025.06.10.05.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:38:01 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:37:57 +0200
Subject: [PATCH 1/4] net: dsa: vsc73xx: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpiochip-set-rv-net-v1-1-35668dd1c76f@linaro.org>
References: <20250610-gpiochip-set-rv-net-v1-0-35668dd1c76f@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-net-v1-0-35668dd1c76f@linaro.org>
To: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 "Chester A. Unal" <chester.a.unal@arinc9.com>, 
 Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Marc Kleine-Budde <mkl@pengutronix.de>, 
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-can@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1733;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ooSfZcGlJ0aY63V/ZbHM5psbxtwwGfSHGbKlKX+V14k=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCcmB+78fH6tpB5mkVhqkKE708zE39erGR575
 rvI5cGQOxSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgnJgAKCRARpy6gFHHX
 cn1LEADTJc5hTtmM3Acb673ULtyQ/PL+2cob9ouCpVtKyvLjzgdo8oxkHxkhIIRGcVBUGzrn+2p
 XB2CjbT5YAD5jfBwJifMSAicQoGEV7jTT3z6iqGCTeIdJFgDqJ4tb5OdsTuwfjP3/D8L/C576yM
 CYBNpiv80Foim+N/CCGAdXF4yKHiLCAFN/ddfhyiOT5AoKjgKGbJrmUi2G0OfcnOWycYMaKBlok
 uXYKqTOlNEQGzr4z84+wCQH4h56p4FSrC9NNgCHgArspVfHPzAmrnx1H2KyYb1xMhEBRGOfiDWf
 n/lMMRMzGK1ntxAYffXZBuTOHIkoR7v3JlW+KmmP6L0CrTxRGJPcloGEm+SImKMinydtBMGDrw3
 oXGh4zLcTLTFQXzt+DIVG4NDiqzyOYny+23XxbeQRM+e6uGdp2n4V9alflS+uGkPn9cY/dJtYtW
 J5EcuCUG2+nl52eVPbyTcmq4c7XeHAWFBUrDj6B2QtULkBlyvUTdrrP45DNiVN+7yJWuSyadjew
 Oqxpobdmfi4s0uB97Sik3b1m73zPNnXvlwZB/K4SslYy7IDs74RsE5ZyzIlyKMcYONI/nyjVy1W
 lBtCAAzPe5c91Ga+/Zy13VRvYjKe2LPPZWEMyBJ3gn3Kmi0Uv2zvDbhMqU7uNWCcaClJkWhM8Hp
 k4oJ9c5tEqEYlyQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_133803_807365_B64CD3AF 
X-CRM114-Status: GOOD (  13.47  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/dsa/vitesse-vsc73xx-core.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/dsa/vitesse-vsc73xx-core.c b/drivers/net/dsa/vitesse-vsc73xx-core.c
index f18aa321053d75f34544267528d68ade37264e89..4f9687ab3b2bc1cc61946eef33b7d08f779db8c6 100644
--- a/drivers/net/dsa/vitesse-vsc73xx-core.c
+++ b/drivers/net/dsa/vitesse-vsc73xx-core.c
@@ -2258,14 +2258,14 @@ static int vsc73xx_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	return !!(val & BIT(offset));
 }
 
-static void vsc73xx_gpio_set(struct gpio_chip *chip, unsigned int offset,
-			     int val)
+static int vsc73xx_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			    int val)
 {
 	struct vsc73xx *vsc = gpiochip_get_data(chip);
 	u32 tmp = val ? BIT(offset) : 0;
 
-	vsc73xx_update_bits(vsc, VSC73XX_BLOCK_SYSTEM, 0,
-			    VSC73XX_GPIO, BIT(offset), tmp);
+	return vsc73xx_update_bits(vsc, VSC73XX_BLOCK_SYSTEM, 0,
+				   VSC73XX_GPIO, BIT(offset), tmp);
 }
 
 static int vsc73xx_gpio_direction_output(struct gpio_chip *chip,
@@ -2317,7 +2317,7 @@ static int vsc73xx_gpio_probe(struct vsc73xx *vsc)
 	vsc->gc.parent = vsc->dev;
 	vsc->gc.base = -1;
 	vsc->gc.get = vsc73xx_gpio_get;
-	vsc->gc.set = vsc73xx_gpio_set;
+	vsc->gc.set_rv = vsc73xx_gpio_set;
 	vsc->gc.direction_input = vsc73xx_gpio_direction_input;
 	vsc->gc.direction_output = vsc73xx_gpio_direction_output;
 	vsc->gc.get_direction = vsc73xx_gpio_get_direction;

-- 
2.48.1


