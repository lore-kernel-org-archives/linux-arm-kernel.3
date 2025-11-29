Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA745D116EA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Nov 2025 23:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qCXAC0GBbAxPWdhq7j/4nJ+adBCJDMjQOJVyf/bKFTU=; b=0salH+gBw+OMH9sJcP5MDtxysW
	hEbRLnjzXFV2v9K+8GZdvG16X6RUPfon95vd6mIbQUYb1uEf9W9tQdGr+HoRyb5H9/yDsUfB1l+3F
	wXQqTpsN2vztfbcqjaLmsu5w+lgDfY9NUzKPeFPi/Cm88I2bwL06YcFzNUFm0eYIvjC3ZgGhmz2x5
	NqTeEffnx23aYmjENYkg0jMOaEoUsI8IboGxISqvs2cj1M6R338dhzh/Byjh1hd14holFfM/z+Osv
	pLBAzsmRL/1+7xm10mjgurETcEx7PLENTc+fl9sjqhpECgv2OVihZBIvKR+5r//8VcDUf9I/NHNZ/
	WA3ItHEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPUeK-00000001sPj-0zmp;
	Sat, 29 Nov 2025 23:46:44 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPUeH-00000001sOY-2706
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Nov 2025 23:46:42 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-7b852bb31d9so3431682b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Nov 2025 15:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764460001; x=1765064801; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qCXAC0GBbAxPWdhq7j/4nJ+adBCJDMjQOJVyf/bKFTU=;
        b=GWxwBEgAPZJ19rw/6yASIEq3PrcIXLkwdgztwsXoHpmJaDh7kYUuv2jJ9GeRhMuGxh
         xAvNO6mdyzqGEKVwHZMqEeEUCSsIqHDY7Ex4d2heaUgNVe8D8WAYBJAZ3OJC/ABngNKJ
         aSkZwCDmjfkpTywDjmLjJPndAsK6hQnyijmptoXRa5WGBRZMwJhnSay96HBjkqYfMx3n
         aZFnna8MMhTyep+GoIJB7I8mnB+lhZ8nka+64TRvIsAIjO40Labd/21D0PnWOjVdFBQu
         p33seuQwRm4SG5ujXzlxNU9koxti4szegM8vXvQpD4jRCU4HmPOgMw+t1uXJt6KYB3HS
         nH9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764460001; x=1765064801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qCXAC0GBbAxPWdhq7j/4nJ+adBCJDMjQOJVyf/bKFTU=;
        b=ZFgkJMuCz12namg+XGIvsDI1b9PzRTLH1p31cN1ElTs5Iysiuux2/Sn5+yWGcuuIVv
         PRsPUs0jBsaynn1S0H5aG6c1BThOCJlkiGbyb/vHtyOHd+GdINl4XJC33K7UUaMkNPcP
         ti80eYnbWMDv9PcqKacNzOU/UmX3MdM1v5J+ddMS1x52l/i1sxsCkTg7B9MeKwo0hEwn
         nKmRC4Bdm8l6K21PgcXaLsr6s1OJ+8KAm262wlTOndIgf0kBF4nyr1nAufs/bNe6H+oR
         kYW2PMJIvkRp1IqBCzIW5AIi/PiiQV5LwaPPJv26tJc9gVY4yoFqG7k5wv+i0w7byHfV
         8nLg==
X-Forwarded-Encrypted: i=1; AJvYcCUCQsBDspQH5LmbsB4vl0MYwI4oq7rVaQjcNvV5E7I7Op3oJ0EOdwI/xvASJvuZzjAUr5NUCk2u8GSqWhVOBj3V@lists.infradead.org
X-Gm-Message-State: AOJu0YwJZnoEH6WaWNA2oYznzEIGMPWQ114HEVmzgU9fVCJO+zkJeMdB
	FxFd6GGa4e+VPJp5Xo4nPPS/rH0cpaeaO9ZfHKVNudKAOxiXCkGWzkEU
X-Gm-Gg: ASbGncu5FcsvP2ovKj1v4F551VhbHonqjJIJYfgswui5UJXKhusG9OhCYyVn9r9AJaW
	fgL3BIWju9ytRVsVt0K1dXVbAM8lvn1s+uChg057QR+iNeFtRT2QojHD5m+2ySW9ThNnDDH9INg
	Y4bMETeVw0fV66xuDll0ZQrCWM/gn9rRg8zc9ADnRgajBDnoi7OtXWLmRVUKnKawdyIitBciFRq
	GYF9opacCvmcKsa8KptlSZw2fL0cQcS4cLM/LiDD8IitFQLBQ4twbT+85ue1hAU9z56bXB4j2Xo
	AFciF9JXIf7bCyEc64eiOmGwp5fFvysEAetCuLyDud5gu4WL5FEAocbcrPphKWyM8JUAqLH1yee
	5E9g4EMg9JzNn8Rta6b7bsqUvrxGlnfHRwP2rGo7QlW0tdX9r4tbENnfzCmUdCp+6wd7SwBGJBv
	aeJxGG
X-Google-Smtp-Source: AGHT+IEvcsMa5l/AhUy3wA67rw2nUoJkcI0nAX7R5RA7tZwpSoC+/PEIe8H7hubTPSio4L+mBgUalw==
X-Received: by 2002:a05:6a20:3d1a:b0:34f:47f8:cca2 with SMTP id adf61e73a8af0-36150f424b2mr33755297637.58.1764460000749;
        Sat, 29 Nov 2025 15:46:40 -0800 (PST)
Received: from SC-GAME.lan ([104.28.201.78])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15fc08bd1sm8921049b3a.63.2025.11.29.15.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 15:46:40 -0800 (PST)
From: Chen Minqiang <ptpt52@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Andrew Lunn <andrew@lunn.ch>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	Chen Minqiang <ptpt52@gmail.com>
Subject: [PATCH v3 2/2] net: dsa: mt7530: Use GPIO polarity to generate correct reset sequence
Date: Sun, 30 Nov 2025 07:46:03 +0800
Message-Id: <20251129234603.2544-2-ptpt52@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251129234603.2544-1-ptpt52@gmail.com>
References: <20251129234603.2544-1-ptpt52@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251129_154641_583175_ACEFAAA8 
X-CRM114-Status: GOOD (  14.40  )
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

The MT7530/MT7531 reset pin is active-low in hardware, but the driver
historically hardcoded a high-active reset sequence by toggling the GPIO
as 0 → 1. This only worked because several DTS files incorrectly marked
the reset GPIO as active-high, making both DTS and driver wrong in the
same way.

This patch changes the driver to respect the GPIO polarity using
gpiod_is_active_low(), and generates the reset sequence as:

    assert   = drive logical active level
    deassert = drive logical inactive level

As a result, both cases now correctly produce the required
high → low → high transition on the actual reset pin.

Compatibility
-------------

This change makes the driver fully backward-compatible with older,
incorrect DTS files that marked the reset line as GPIO_ACTIVE_HIGH:

 * Old DTS marked active-high:
       is_active_low = 0
       driver drives 0 → 1
       actual levels: high → low → high  (correct)

 * New DTS marked active-low:
       is_active_low = 1
       driver drives 1 → 0
       actual levels: high → low → high  (correct)

Therefore, regardless of whether a DTS is old or new, correct or
incorrect, the driver now generates the correct electrical reset pulse.

Going forward, DTS files should use GPIO_ACTIVE_LOW to match the
hardware, but no regressions will occur with older DTS blobs.

Signed-off-by: Chen Minqiang <ptpt52@gmail.com>
---
 drivers/net/dsa/mt7530.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 548b85befbf4..615e9a5709ca 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2405,9 +2405,10 @@ mt7530_setup(struct dsa_switch *ds)
 		usleep_range(5000, 5100);
 		reset_control_deassert(priv->rstc);
 	} else {
-		gpiod_set_value_cansleep(priv->reset, 0);
+		int is_active_low = !!gpiod_is_active_low(priv->reset);
+		gpiod_set_value_cansleep(priv->reset, is_active_low);
 		usleep_range(5000, 5100);
-		gpiod_set_value_cansleep(priv->reset, 1);
+		gpiod_set_value_cansleep(priv->reset, !is_active_low);
 	}
 
 	/* Waiting for MT7530 got to stable */
@@ -2643,9 +2644,10 @@ mt7531_setup(struct dsa_switch *ds)
 		usleep_range(5000, 5100);
 		reset_control_deassert(priv->rstc);
 	} else {
-		gpiod_set_value_cansleep(priv->reset, 0);
+		int is_active_low = !!gpiod_is_active_low(priv->reset);
+		gpiod_set_value_cansleep(priv->reset, is_active_low);
 		usleep_range(5000, 5100);
-		gpiod_set_value_cansleep(priv->reset, 1);
+		gpiod_set_value_cansleep(priv->reset, !is_active_low);
 	}
 
 	/* Waiting for MT7530 got to stable */
-- 
2.17.1


