Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 645C0CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 11:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qgwBmSSCggFVLUhXUYpfKHZun58CwgxvexKdy5tq5OA=; b=YPTlyQmDXcoJu3NoN3Y80CfwIm
	BTCCFQwd8lqp+GW0Vx6zaw/GE64FPfeAdxCEjtHEtgV5+aMDDykZYosDdZor4E9O3vsUvLSjGSmKE
	RU6niyzUW/aatLT2TK7HHZx6Twx15x9YnwHx9N8NzNZqhOaeBVvb+FVjSSCtNxsCP70hwuFCwYjJe
	WfCvBFa8+1Z1GkSICQaIMsSfXcWRy/tsZRYgq0xNYetg/pcVWcOdFxNS1qNFa9SHRwT4gbIdQrfZA
	zmwedtuxoRK/LtIjDfEIwhDqXD2nq5qxFhjAiBi1deThWypuLTGXAisgSu7VUG/Yh9JimsyXzM/N4
	v+iOw8ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAcM-000000018yK-0567;
	Thu, 18 Jun 2026 11:09:06 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAcI-000000018xE-49Vx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 11:09:04 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2c0c1e0b0faso5827555ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 04:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781780942; x=1782385742; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qgwBmSSCggFVLUhXUYpfKHZun58CwgxvexKdy5tq5OA=;
        b=A7VY6dU3vYXp/EQaEszP4qBzMmMUk7/q+05btrdkhP3f4w38OyLbYefJdX8s1uYLK3
         ZKhgFBC9KSMLxNvWoKKLw2JDZUSVQy5je3fqpTr1YXq2LCi/hozUdoOITE5vJ7XHPLpP
         fG8A/1Nbl9yooWpTmBLQTGi9e4Rh9c2KPQLm4scQKULtwtHIKwgd/7/PNNEMiooNpEc5
         /YIwAvqukoU2IWAdHfIjOQQlsVK1nt0wPO8QFxhbOGcOj507lQQmih+edJcVnElBjla2
         Gg8fzFu3ZKayWcAiSjCExmZl0awIHaPzBcUkb4u1OI8QccuZEJmIcpxv0zaccWVwM+vF
         Feig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781780942; x=1782385742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qgwBmSSCggFVLUhXUYpfKHZun58CwgxvexKdy5tq5OA=;
        b=AY33AeG6HO54eSgeOTZcvptalPAAeHAeMda3vcTQggD4tPUOPpzb3UMxh7Icx2aIJ3
         YJT3Alcyv9eo2JVIEut0Qk6MbtYmVMgKCt+5/ObgpvAFtbXNReFIidsPwxJy9X0qJQh+
         QXRXZJ7EFs+3CWdhhwqLpek3esdYNh+vW7+2rSBON+CuopgIvR6vaRU1yTVAhjediBtK
         IjpzIzPir7JZdIob3AU9SvX+gU97ZUXyKTmpM+zXWJCXFQQ98NfvO3/hOhu/yHvsJFRd
         CKdWxDlAv8l8xhQ8w5dY8MYd6TKjTV6bG8/2N1JLlioph6TcRK5gh2NSEig6M0JN5XpM
         2NUQ==
X-Forwarded-Encrypted: i=1; AFNElJ9KX0cKn1xaGrq2D7czXUfx1+/kyB4qGcmcgp0Ukzh2IrssbUqSnkjTK5qmuvyhj4V/ZbjvfKAb8ME6XN5Txwvu@lists.infradead.org
X-Gm-Message-State: AOJu0YxDJSQJP1gtCvB/f4wJSTMOhA7kOeZOjT1mJRJaPnOnOkmXjAlI
	l8pacjF0EBsr5E3kONnyDE9xxxeq79R5grw42hYKl4r6eZOOquBkW0n3
X-Gm-Gg: AfdE7cne/Y/TzFC44zNpLUXAGX9/PljNcMi1UC6hyxZl5UXgbG/UIfY1QIu0zgAcl7S
	YrZsv0KouFL0cwz06Tx3uiNCDR5k/6U7G9U3MxrjfkjXcWxW7kLOHxlrCrBXTpr7KClrhz5U8hS
	shzspCa8qloXLWMBhhAIQZ+nxO2+dri8se4EHCVTqad4Lpy9atPF3I/HxjyzVttKmOYiDoXK5Qi
	L/TkRlsKq09lnY9R/uvSSeJmihB7EX8dkoYENrCVHn+fUWDNpkchy+q+kgUkvEjow/vWW17Ll0/
	t220+YuLh6tDAIMbluR2lIXKLk8e5D+zkEn+A7X9K9NKMESg0tnkOSVxVF8Mj09g53mOC4wyBUU
	IRvNrl0hn1oHp0cOBDlohSGWZ24UHKscuYu9uS5iWp+l4APvlnvXgpfPIe+NtrQQRCfXLm3ru/C
	ccE9yCIyueVVVXsgcEa+miBCR/3xUkDANZTKt99eYW6vrwysc=
X-Received: by 2002:a17:903:2a83:b0:2c6:ab74:985e with SMTP id d9443c01a7336-2c6bc24997bmr85186495ad.25.1781780942104;
        Thu, 18 Jun 2026 04:09:02 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:09:01 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 58/78] ASoC: codecs: tas675x: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:07 +0700
Message-ID: <20260618110827.232983-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618110827.232983-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260618110827.232983-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_040903_036858_A9258A70 
X-CRM114-Status: GOOD (  10.70  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/tas675x.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/tas675x.c b/sound/soc/codecs/tas675x.c
index 6f89a422f3c6..c44bf9144e44 100644
--- a/sound/soc/codecs/tas675x.c
+++ b/sound/soc/codecs/tas675x.c
@@ -162,7 +162,7 @@ static int tas675x_dsp_mem_write(struct tas675x_priv *tas, u8 page, u8 reg, u32
 	 * DSP regs in a different book, therefore block
 	 * regmap access before completion.
 	 */
-	mutex_lock(&tas->io_lock);
+	guard(mutex)(&tas->io_lock);
 
 	ret = __tas675x_select_book(tas, TAS675X_BOOK_DSP);
 	if (ret)
@@ -176,7 +176,6 @@ static int tas675x_dsp_mem_write(struct tas675x_priv *tas, u8 page, u8 reg, u32
 
 out:
 	__tas675x_select_book(tas, TAS675X_BOOK_DEFAULT);
-	mutex_unlock(&tas->io_lock);
 
 	return ret;
 }
@@ -191,7 +190,7 @@ static int tas675x_dsp_mem_read(struct tas675x_priv *tas, u8 page, u8 reg, u32 *
 	 * DSP regs in a different book, therefore block
 	 * regmap access before completion.
 	 */
-	mutex_lock(&tas->io_lock);
+	guard(mutex)(&tas->io_lock);
 
 	ret = __tas675x_select_book(tas, TAS675X_BOOK_DSP);
 	if (ret)
@@ -211,7 +210,6 @@ static int tas675x_dsp_mem_read(struct tas675x_priv *tas, u8 page, u8 reg, u32 *
 
 out:
 	__tas675x_select_book(tas, TAS675X_BOOK_DEFAULT);
-	mutex_unlock(&tas->io_lock);
 
 	return ret;
 }
-- 
2.43.0


