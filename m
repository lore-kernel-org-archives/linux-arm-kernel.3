Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E3FDC71135
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 23:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1+AXM43LJmcTiZ4+XLqifo1WeAnz6FejMu0e+/VkXQ4=; b=xoHi8yNBFSZkBwofOMU7IAcpCm
	4ugEOZYTtUCad27/9qmvpL1squrFEbyh2Ht5ynXdYi4AguJf5dBg/ePhN3RKebuAIQcO9y77g+wnX
	6AsK4KWbuD2xFH9CqwOM/aTkBXyB7buFPAcJpNA4KCAfk/mhfvuUXrpEQnVSCIrcnAPL8nEdweJH4
	5LeiLEjwjAVF+BaYGLRFtQHZ1V5Yeu4PnjeUvwb45Ek7vlSCUwPTG/wUfW+0LCW7d0l+3KBBH+s1V
	SrUaG5GrYL/emq9G+wR1mvR0aflxOs6OnaII6JBtKb77Lftt/o6WcUgx6IUMVWYml9j3uIAJmvdGg
	nmf1dS7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPV4u-0000000Bh4f-3r3m;
	Wed, 11 Jun 2025 23:41:56 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPU9a-0000000BVX4-1wbH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:42:43 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-408d7e2b040so190101b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681762; x=1750286562; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1+AXM43LJmcTiZ4+XLqifo1WeAnz6FejMu0e+/VkXQ4=;
        b=XA6TFG5Qq5k/ua4TuoW+FQZMPMP75zpoO+lS3nmQ0wopySq045K5HGar60p4p+4q0w
         rW2/nNvta2vOzRboP6MidYvHk4r+nRUIdC91Q8wBzEouU7bMVyC3wEYa5FjOm0xphDjA
         7drjF38kanfMwJMPZaYTIczhhJgQ5tOxZG4h8VZw/VAvYm4imm5NhB/ZjA8yK8vAi3cY
         j2mgSDrTH1fNqeJciKeaw44GAUhL0CgbUW7KjWzJBTbqgEBB4nJMP5m1htCPGOdWEFlt
         HzSdUmxVjOxug+TEX/YgqAFmtmFFId6M4g/9W06cuhZcyp7AgWTGqdTp0Yu3/4SZrbf3
         rBZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749681762; x=1750286562;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1+AXM43LJmcTiZ4+XLqifo1WeAnz6FejMu0e+/VkXQ4=;
        b=PARBFG4d3MtbmlzjQ9OHS+TmH4ohCRWEqwcojz5clEWC3O+geqPm+MiIwNq5E+NL6V
         41suQczkdeJs6+lnWh4sEe114jdaWSsES9pNtY+//rCC2zxAIdiEeKyMXHPDvprzuDX/
         q2zJFd+JaAuiKQmBOyey0nqy3bsACo2cQbuh0iw7YjmPez8hMjeyz20/N0del30wcHS/
         74rJsq2ebflq1WsVLVKKL/KiizbDXjxmuMFAXZL83nhB8gUi24aJ0otJEy9Y0oicIgbj
         71sopRcy3f5hT3UbBhvWPIGJWdK822a7UesEK9WaRDjQZyYEEHT3DyOOaykdaRXxt6EV
         wLUg==
X-Forwarded-Encrypted: i=1; AJvYcCWVWxlrXenhZgXJgMc+4bm+V2XJYkcnUltPZPO/y3yeHiJ7KpnsG5ic4dmmAydEhJIKRtqYglpJGsPaNfWne05l@lists.infradead.org
X-Gm-Message-State: AOJu0YzlTBOtpZJ5hgkM/6NpxYSEfLhPFRQDzJvWBPYJWy+UfL2LLgOF
	aHv4KKXzTTUmbk7FtZPTy29VF4ZKTFfY1bpaCzDeT+78krddflL+85AotFKv30BqDkI=
X-Gm-Gg: ASbGncvtGBQgLzK4feRfmLcfGSPE9S/82GsVrCc1iuZ6pe8BxRi9+vvzf9YOy9mtkJ/
	0ATn12wduv7k4D/i0hM9Nr0ii9a/uHmXwZ88GKloIqQS3CjARk3meuPV8jUXFhJUG9kU1Lv2E83
	SDYFxUU/o6427Lr2p3OaU4PxzxHolIBsBiyGt1QlTiK2vLM6K/jNGMXZCLbFgzezKw5lLttFkDc
	430wrxI0XTvEP3jSG2ZmQl9INSrhW/EcCERww8B2vwPNN2HldAZ66JlR+XwDSOwN3ZbZYF2NKP0
	jhzejQp8e5HK/yeSqPlssDFW0btfqb+VHhYXXG8THNN/l8pj7Ck/lsWTtgIRxmFM66p8
X-Google-Smtp-Source: AGHT+IFMMzvtGjq/XF9sKG5BGljgdifNq6jOybNnZI2VIWkdnxiv1hDecZPrcYLXm/jeBNerhjgiZw==
X-Received: by 2002:a05:6808:144f:b0:406:39b4:2232 with SMTP id 5614622812f47-40a5d053e13mr3229763b6e.3.1749681761758;
        Wed, 11 Jun 2025 15:42:41 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 15:42:40 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 17:39:04 -0500
Subject: [PATCH 12/28] iio: chemical: scd4x: use = { } instead of memset()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-12-ebb2d0a24302@baylibre.com>
References: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com>
In-Reply-To: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com>
To: Michael Hennerich <michael.hennerich@analog.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Francesco Dolcini <francesco@dolcini.it>, 
 =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>, 
 =?utf-8?q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>, 
 kernel@pengutronix.de, Oleksij Rempel <o.rempel@pengutronix.de>, 
 Roan van Dijk <roan@protonic.nl>, 
 Tomasz Duszynski <tomasz.duszynski@octakon.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, 
 Mudit Sharma <muditsharma.info@gmail.com>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
 =?utf-8?q?Ond=C5=99ej_Jirman?= <megi@xff.cz>, 
 Andreas Klinger <ak@it-klinger.de>, 
 Petre Rodan <petre.rodan@subdimension.ro>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=810; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=w6sewnHJwVlZtUZ1XCEB4lsBcr4uySr0t3enC0nXMgo=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSgXTO0fwqvdhMYlsTHXtIYGob2RsszuHsUyLs
 SfL1LagKj+JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEoF0wAKCRDCzCAB/wGP
 wPZeCACIJ32MRJGFXAWVkUo7XJ8IPrL0OrDOVi8YV9Bz71zO9E1Xbt2tdxaHIRCxRXTjHv0+zxe
 w/o0PiRItwBJgVkYx0LCNcV0wRJiX/3SOXvkNIYHEjW/6bG5mIuft2mWy9pOWtFB1hHlRO5OHW0
 HRZV2jH97fcqcIdH9wSd/O5uzb2vY2Mv537m9vzG3NCE1EZ6ni5m4frRR2Ju3EquwZ5eFRMUZDk
 6TffT8htFYg5wCw+GGZ+kUM+ESDQvMFNiOZTKVDPOJtDl6Lepqk3gBrXVA5n8ijfXQPulfkc44L
 Ad5/aXu1TD4BBvsWqxbL+8KuoPFw5kwu1Q/N4uflwEd9cOV+
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_154242_511534_0EDFC4BC 
X-CRM114-Status: GOOD (  12.19  )
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

Use { } instead of memset() to zero-initialize stack memory to simplify
the code.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/chemical/scd4x.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iio/chemical/scd4x.c b/drivers/iio/chemical/scd4x.c
index 2463149519b6d82caede9c9b253942fa421fdd3c..8859f89fb2a942d940b1ba7adf202977df7b4ad6 100644
--- a/drivers/iio/chemical/scd4x.c
+++ b/drivers/iio/chemical/scd4x.c
@@ -665,10 +665,9 @@ static irqreturn_t scd4x_trigger_handler(int irq, void *p)
 	struct {
 		uint16_t data[3];
 		aligned_s64 ts;
-	} scan;
+	} scan = { };
 	int ret;
 
-	memset(&scan, 0, sizeof(scan));
 	mutex_lock(&state->lock);
 	ret = scd4x_read_poll(state, scan.data);
 	mutex_unlock(&state->lock);

-- 
2.43.0


