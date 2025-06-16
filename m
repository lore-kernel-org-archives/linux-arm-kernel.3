Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA1C3C71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 07:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yE6IzPfXHMNhFc7FmQD93cM50XDdvhBiuKkLkDIaWfk=; b=QQ//2yVQytufiEIxCpzCScQPgC
	h5qi9g44GrdiVJzNE93DAydECgcfR7C3FnwbGEKaXp8ptRCucIvPlGmwwa7zwpzvhWwT9LS3blmnD
	t7OI5QGneUbvnT5ZVhoW+YxsX3jeNDlKwi9bmaTm7ajHY7tZDMw6ud7U5X/dZPiXZMQ3CuDn7L/dz
	girPT0d1AS4gHoulHjrJMtmZ3Rd9YArBaAHlAeCqqFwkA8rw+ptKDhO+mnwhcg4dqf9wfL6jhz5p8
	bp3hey9NrWUxzxU7IkEudp64wMtQ/fnoDXrlQjyyw4PKs+HMb1kT+FMv2FjY52lAMEgJsCyY/NuPf
	G/dfJcPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR4Na-00000003evx-1CSU;
	Mon, 16 Jun 2025 07:35:42 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR4CT-00000003dDM-3g4k
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 07:24:15 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3a53359dea5so2782489f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 00:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750058652; x=1750663452; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yE6IzPfXHMNhFc7FmQD93cM50XDdvhBiuKkLkDIaWfk=;
        b=QbtgWjdGxPGUBr4rnKfcthyViX30TVzsvw8qYFpxGUQu2D00RTAujROixitqn9tcJz
         /HPF/jNhPHkJD42p4bA8DZ0kcGrnilVrkGidTfvPYq+N/5j1mvNx2g9kenP3TeGtokqs
         o62vN8nAOOMpD2njpHrzo4CZ2HHvFG8o36nGfWPV0vI0YB4Z7asiHXkXNpNzrkGoj4rK
         sDnXr8/pQhux/YUHF2gKDyC3YqOuQ3CmepVPEG5bZvwAZ5FOyc/AkMIrfsgApKaaDAQ+
         2XTqaEfJ2jMX5A+Bt/KTGmEwTzlSYaIdO/BBJ/8xEk1WH49HahApvpmmsyYKbTzg3ZpS
         RVvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750058652; x=1750663452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yE6IzPfXHMNhFc7FmQD93cM50XDdvhBiuKkLkDIaWfk=;
        b=jGuzaAJNgteB70X4MRrSnqP23lJ3uWXCkopy+2nN6D3CI5kqEjHry7XwqHan5qtxv2
         op6FY2NjO8h0ofKFNxrlpV9emsCzGVyae7PmovSg4E37HJpK/fctBlHOZTk6/nX6O8Ci
         Sum4e4V0lA8syFgeaG3zR+URaAB9mSY/45Qml07Tsek+VAcxgJE5ZqQNBUTHHo4uNZDP
         jmzpY/x7vdrJpMGcPeivDqzRUUNmns/7J49QRo5IGQLKhTYht1JNWv5lHzlfLG/+dyhI
         gdsBKA+o/bTvurKRvBQX62tk67mP/BbpfXNO6HJe7Z8qgcFSq5XLNI5HpRNu9+zS42sV
         m4oQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLhhWoT9LsXytGUnFhlry2awCLALQsVDV+klmk/xB6arvcc/Sl8zpXx0Aft/wZswpnwiv2CBTj8SzGfwFyW4w/@lists.infradead.org
X-Gm-Message-State: AOJu0YyFRXM8CuUiEM55eNkc35jT60kGZvrgmr4KmUGl1PT2SfirGDCu
	XQRTZaAF1++TC+pBotjGhV9mCNkjl9xXRcD8/NnjA0jVKZ9+DgRkyPy4P3q73xUueBE=
X-Gm-Gg: ASbGncufBH9PBjVPsow9csGflgzRHjAoGZc4WHVmG2AyPflRAmmwO+gHphxS2IMD08e
	5yXzYp1WeyXA5UFW/xuWb3FKDGkHs6uA/0AHQC5vOGZ9tkY0Am9w3zZ9wlvGIQ00LRnOywOe9Q6
	pG3HdLbIFoMFV9pU7LNQpmuGWTpTrGrpwEWXyxR71iT9dQcvAy63PRgPBcc/yGFL+dIQqGKVrHo
	8MNsx9sSSQstaZc6dgAum+G8cv+ynMb5oHp/Olu/lSw+KCzyIpwtkD59YevEXPFkPvHjL80gheb
	TX/sWs3HI3EYYkGeQCccUrshJ0ERjGWBzTeDkblOs0lP18v7z5ig7fGm
X-Google-Smtp-Source: AGHT+IHPFBPn3Zq/nUDkUy4oRevEKPyumefMdGv6HX3562iJJprMTS9/QcD9Dlx1hTdScj4u8SVCMA==
X-Received: by 2002:a05:6000:4202:b0:3a4:dfaa:df8d with SMTP id ffacd0b85a97d-3a572367c45mr7317623f8f.9.1750058652323;
        Mon, 16 Jun 2025 00:24:12 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4238:f8a4:c034:8590])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b08c99sm10312334f8f.63.2025.06.16.00.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 00:24:11 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 16 Jun 2025 09:24:04 +0200
Subject: [PATCH v2 1/5] net: dsa: vsc73xx: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-gpiochip-set-rv-net-v2-1-cae0b182a552@linaro.org>
References: <20250616-gpiochip-set-rv-net-v2-0-cae0b182a552@linaro.org>
In-Reply-To: <20250616-gpiochip-set-rv-net-v2-0-cae0b182a552@linaro.org>
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
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoT8aY68phhJHUiYmICb6qi2PtnsxOrk1Qj26di
 Sf0oPxAjkiJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaE/GmAAKCRARpy6gFHHX
 cmsID/90DiNKLTStA2nd+V5BqNvhGiL18/ZS+yk4NDv771RccIIvB08RD8O6h9mQk1BbBx2PGDf
 8uUGoxxBYkl6SrCrU2WGXyT5gq7YAtwvpGuDWz0TgdkbCAT3B3FeIFwkAv0ykw1t7oPjNhRRO92
 FzNqC7ddptm3fGUK0ZyPIj55GA9V5mNR9oNqWMYTNQJFzLbGDVfi5+hEZx36mWoyXue6bGO+ByG
 zjrOM+4AbcL2OsTpAZhuMEHFzWlQ490Tw09iu2MGvdzydWZreBvSFPJm2HdNS7qI181vxwc3Pr0
 iEpTY3DJjRuIAXnAYAErCvz4amgZHJ2OSlcUWjpEKs7+57LZI1hfaIAyTfQpsylp3Fn8ucQZ8Bg
 FEL861RY6dMUJvPo7bz3gmb6bEplPlC7RHjimwXhGXTBqvG6WJCEn+l5JiWQpGzFgsf+QmtA6pr
 SFOwZQv/sBjz7nrwKkUExa74MUFw4w/5zidsXfSMokGQgAOGp3U90lHe15KSVz2BCIkXGTH0sDl
 KPagWn/xrxQH/6uqohnVTmdQmCMwgQ2o12ftsnf979MS5FTIOo+lqMFShb6yHBUdu0B4RluVfIT
 UAR8LI5viexSWvvxWDxg+sYDa7kv5sWzinYOHjoBh1tpudIlKw/Sj09VEzti0RhVxW57ynoPS9W
 tyHSiAbzSI0b3dw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_002413_931099_0574FDBE 
X-CRM114-Status: GOOD (  12.99  )
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


