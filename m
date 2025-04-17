Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77C19C369C9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 17:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dE6SxxoVsu6bAOJzYvjRfaMyKOzoyxv/L4EKxjSDtow=; b=ow2CtpZTEuDNcTyiVdZfZ0LwP/
	k/ROwEuc6m8v7EX72YhdclWrz7Xio5xWEUca6tRYNaDc7MhNyN3o/vVWZ+R3pggQfh2SbETEyZov9
	iK1JOtoodc+3W0LPYbzswwRBUYOLvw4BxwJGt2jcGEkZrKK3ZbOvYzi62lwzXe1H9jQDPvmXFDrWD
	x/VsEa8x6okJEnleigIuSv3TIHvhQ9/LunUaqi7UGi9ZFELj/gBGsJd7hNwfJOXy3QO18L1inKX5P
	sfR7Ntvu1tcDOJkd55oOhHhJOE3nZouxKpENDDQrtK2gz6hB73bFA8k3x1pLOC1RWc32pK6XxpQ4r
	UWb+srNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5SgG-0000000Dlsy-0lZZ;
	Thu, 17 Apr 2025 17:05:40 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5SUj-0000000Dji0-2UKQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 16:53:46 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-601f3674116so256523eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Apr 2025 09:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744908824; x=1745513624; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dE6SxxoVsu6bAOJzYvjRfaMyKOzoyxv/L4EKxjSDtow=;
        b=m6A/yPitWWWAPGfyVmhV00Ccf4mioNTE1r7sUSHBwEK6mLN6M6WEJmoafpMScwWUEh
         +ruWIdJMwHgN4VeVpO7pjKrAPGTzTgil0YF0biHaIWfvhqYy7hA5H0sWqQcT4Q/9dPdK
         AMYACWD1gWLZl2MeaBIfr7UTnH9C3Pa+AkG23I4YE9wqAJlAEjxVcJrBTs/tkq/nKzl0
         8RuUTJJ1APel4Bs0EbnuiG8aDugM4Pafh2TxCQtBZFKbwOOvzOYgwcWOhpFZqcf4WTt9
         8fsjdgD9zfRHuRpQsW+QWNQgRmyU8eQq/vt446QVMWR4kaO7SyntwKuzEHy/6UBS9oGa
         m9tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744908824; x=1745513624;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dE6SxxoVsu6bAOJzYvjRfaMyKOzoyxv/L4EKxjSDtow=;
        b=IRmIuaFN3+oBeauZg//nt5JEIuCRzQCZrWDyZqTsO5SALh9qj046aT85dhfkM7J9e2
         yhOcrsk7gvrlfN8YKDUIJ/fgKyKnSkVL2lpSnaeZ0j6PVCa4HTNnL/FdNZDw/mflH6SC
         lzqqtpj1hBLd7e8FVcUUAmD6S90TZZ1uju2eOhnBvWQ302fq+5EohuWSxP/JYlCEr21o
         lASVV+fzTxKkif1NPAa1OB7PVD/8z2vf3nHE3QXZuEWERhpUzZC8mvo6tFMqIZBJ4fDj
         6nsQudh6VpVeGpwGc1Q07pEXyj8DrbfdQVify5Te5DaN66UgQuH70W1hYrJxhea0m3oZ
         fIyA==
X-Forwarded-Encrypted: i=1; AJvYcCUxW/Zq7fzID/HyxhEgVqI8BhU1r3YYmgxU5malc96YEAlnISzioOE2Iv+LEEEvSqphfjBxPZiyEkR2KnWBEXFK@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6G8/GiuQeCrUaTY4SkySgJsSEFIPjMzOzeNH3cTV0BcJDnbOh
	ZWT3XVpt5oUs9SUxtpNnMOwCP2tyUS4cuLS/c9BRcb4Q8+TQbSfbMiJBn6c3Svs=
X-Gm-Gg: ASbGncu4EuF33R8UVmbm8xPo7SnyBKFNTh9jQpPBKNYnQwvQnfLD1w7DEFREaSOwo5W
	9R84yfI3wHYdQkMplQBLlzbJs6T4SamZm52agRl9CkK9SAZFxXea73Q+HX+qcGUYoW9dra+yrh/
	I3mP+B//QnXf8GymrHG5Vw2r2J4X3rBBWJhy9P/IxcsD6hfEvfSSmiQV7uNtnJCBmcjYq0ehgjD
	nUUHQ/6sBEwm94U0xAqLtJN0YF7F2nJIgFyQHn+G+Db8TcCQ1U79AXudsigjRt6zi5YWs533qhH
	Gt8ILVM/EvHNLKT++FT7IEIfhQpJkObqrFjBuirwy/cUjAY=
X-Google-Smtp-Source: AGHT+IERyfliHqOpjlqcDa7ZrMu1+2ERYktZP0hnNbOKPHC3D9PzMn6Rl32Ql9yI8ux6efJekwkBJQ==
X-Received: by 2002:a05:6870:51c9:b0:2c2:3a7f:e702 with SMTP id 586e51a60fabf-2d4d2a698cdmr3439263fac.11.1744908824620;
        Thu, 17 Apr 2025 09:53:44 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:c91b:eea3:7afd:2dee])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d5218248b7sm15812fac.47.2025.04.17.09.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 09:53:44 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Thu, 17 Apr 2025 11:52:37 -0500
Subject: [PATCH 5/8] iio: chemical: sps30: use aligned_s64 for timestamp
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-iio-more-timestamp-alignment-v1-5-eafac1e22318@baylibre.com>
References: <20250417-iio-more-timestamp-alignment-v1-0-eafac1e22318@baylibre.com>
In-Reply-To: <20250417-iio-more-timestamp-alignment-v1-0-eafac1e22318@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>, 
 Tomasz Duszynski <tduszyns@gmail.com>, 
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, 
 Andreas Klinger <ak@it-klinger.de>, 
 Petre Rodan <petre.rodan@subdimension.ro>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=788; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=3yOfvG8p2c/ytiXdb5sEiM+QYDtKi9bavtlkBMDyU4A=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoATH0x2omz5kJqpY0JXJ7mnTmq6wvL7fWawMYF
 Tw/lLU9/AKJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAEx9AAKCRDCzCAB/wGP
 wKMdCACE2PBpPPcevzJ6YTHViUZU0pvKAxxOAJmdKbv9y3bksVEOUfx0P2P/dY0jsWLIEXzBaDr
 5y9dHqAC7o4dmkMKsZj2Vh5HyjQUKEskgopiCeIeGcMi9Y7Q7LEwfyaSnoR9wy0UrcrESvMTHb5
 7fnFE+562x0uyC5FtFHUFXolswx8YwAwCqYXOG10SGEXfGRc3qapr13FohQ/yFIzWoRK/WCqTkk
 xT3YnJTSZ+L+6Ft/jBhKe7FA9oGDUvjJf5gBIP/yJBAuEDVk60oAwHgT2GmlAztKoFECtHnxReC
 XCzUxh/dcdtae/HvWj37osRH2cBNtm6nubyDnKWO5uRYaB7z
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_095345_648693_8B7EBD79 
X-CRM114-Status: GOOD (  12.24  )
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

Follow the pattern of other drivers and use aligned_s64 for the
timestamp. This will ensure that the timestamp is correctly aligned on
all architectures.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/chemical/sps30.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/chemical/sps30.c b/drivers/iio/chemical/sps30.c
index 6f4f2ba2c09d5e691df13bc11ca9e3a910d98dc8..a7888146188d09ddbf376b398ee24dab7f0e2611 100644
--- a/drivers/iio/chemical/sps30.c
+++ b/drivers/iio/chemical/sps30.c
@@ -108,7 +108,7 @@ static irqreturn_t sps30_trigger_handler(int irq, void *p)
 	int ret;
 	struct {
 		s32 data[4]; /* PM1, PM2P5, PM4, PM10 */
-		s64 ts;
+		aligned_s64 ts;
 	} scan;
 
 	mutex_lock(&state->lock);

-- 
2.43.0


