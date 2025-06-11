Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7154BC71135
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 00:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F8QCKzZLzA9c1boYxiH6Zgd6l2s0DqEIDVHfSqU5zrU=; b=JF1nqtk22z3BldAg/ygxWP9eiS
	lIKV35F/WQ4g/zCPVdKMFH/Rmp66Gf7NSo+vDzevBReZ6/8cOrxIfXHtIliWhHRsaXM5/Cr+Ikpvx
	/V+kBo66wLy/cvIJ1tCuVLm2pnOxmUPvI8lSazuViV0HvDFUcvdlq9Kmc6kRqjj08hALyBfQCFQ6O
	8EwLQMkIL7UD7TwSgx0OuSpkpFjo65RbdrQ6nglzSNm68/eCezjU/pQ9ljP4RsxkZxOlz68NlDJM+
	JaINPrmqW7YxvMqpedn3zlmInpa1tEM1kXE4cM3PjNWyDQXK5xz3ZtP1RD8NAcifRfC9jz4IcDMz5
	RP5dLYsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPVMa-0000000Bjnk-3TN7;
	Thu, 12 Jun 2025 00:00:12 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPU9w-0000000BVo0-2v2j
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:43:06 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-404e580bf09so95195b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681784; x=1750286584; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F8QCKzZLzA9c1boYxiH6Zgd6l2s0DqEIDVHfSqU5zrU=;
        b=Gd695UAKGwydGiQ7dxCYHTAFS74Nwtbq6vKfVdKsCQ8IrU8qp0nIpmMKiwheNbNMHb
         9ThtqWNKQTIexN3ARQjCXB2Oygm75oc5FBfhcW9pCz6uhcToWtTS5nnTwD65LP+P7SRn
         3jIzYfTfplFVt+w+C5jmFfbNDtdHQRbqWkn7yyzc1Rhccemj4JdF5MfTbNSkWsfopO74
         fNG9U6ks2UH/TNIhnAmcMOrRZ9WYzUS3dgOC9Y9QFBWNF3s8ONmlO5tO6JEmS5Evxo0e
         fvoZqwwHVYyLoDd40JjoxJdd+UkkBKCfL8qyilqfQwzpO6XDEFZyEcykoVhCp5FHe3tF
         GTbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749681784; x=1750286584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F8QCKzZLzA9c1boYxiH6Zgd6l2s0DqEIDVHfSqU5zrU=;
        b=pFEP5B4UtPzohtL3mKRwQMSGglT1Kquhs0wFDp/bcDXFPm7upZKKf+I0/b3Q8z5tvR
         PpRYk8WI4JEQLKi6rE32KeE5hCIbvS4KrUr/mmwHeC6+j07h5IpWX69/KOCoM3/+faa/
         6wbJvunuxuvz88KVp/H2tS7q3rEAOKD3wKu7plkU0pBaIc8OCmP7a7oloe7fzTIealOy
         dY2NtLiev8JR3bxwgWjm5FlEiQ6Tc2sNucFqBf3so03QrmoeKoOdq0TshvSsZQYslVUL
         p3j7EbwzriAtQEVZa669GxWWclJUF49rAPnXumTzBL7STWC2WOOi8x+nPQJFPpAZImzG
         wJNw==
X-Forwarded-Encrypted: i=1; AJvYcCVQZm7AfQRSfL5kFV6YoNFRtF8vX0QGYedxrF6sqENjVkXs872gZpixs69bqjDgTIL15LSf0TbB6eWXRc3AkLXM@lists.infradead.org
X-Gm-Message-State: AOJu0YzlNombiiGtT+KZCWuitprxwUhNhXfx7ED10yx7c6jVvXLLL63J
	mFJSCgT9ftbSwoFC0FDBUW4f06916xkw4/Lz1CcWGcPKJu4iV4tlhb0x9d+b65g4ifc=
X-Gm-Gg: ASbGncvltBxIGa9xKpY+KJq7F+DShSQZYvqW2BhKzUR0a1F7dJRIuEjkL5pP8/QR2PY
	mMm8omcctkbcY+t6BxdyYSV2g/Fi1N6dKC3D/loWX/3Xa3IweyfwWCVT9T7e0yhbFQ6yG1teORV
	8x84db3IJ2xKj1mozzSyfCK+za12Gp6ziZfKY4FowyQdugUrHeu6TvgyjstLuFQJR9khBCgJLkk
	cjQ5oL/xdmd+dSaJQAGTjR1kpvkTNb/1qZAW77BFIXomwXZiXT0FGqKYT6LH7h6rHtuYKjpyh5C
	COVndI3v0ZxSiYIUrd0X5UNlfE8pf30pbQ+/ozRZNx3En/l5Hn59ak8VGJnwx6PensPD
X-Google-Smtp-Source: AGHT+IH53kFC4pQ00iW8frMOPsS2aW2HVSZ9BOgRUzZQwvvNEv752UPhJnf5JrLuBhq1/flY7pu0bQ==
X-Received: by 2002:a05:6808:164d:b0:401:cd6d:25e2 with SMTP id 5614622812f47-40a65f92499mr1064493b6e.4.1749681784031;
        Wed, 11 Jun 2025 15:43:04 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 15:43:03 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 17:39:17 -0500
Subject: [PATCH 25/28] iio: pressure: mprls0025pa: use = { } instead of
 memset()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-25-ebb2d0a24302@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1025; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=+Al+Scx0CuEWvmKSaR9FmNdQ/zr1q9Yo8+2pHc+n7jQ=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSgYqU/X8zadeXISux/OIM8m2Cz7MRuRxATYcV
 71OkLQHQ0+JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEoGKgAKCRDCzCAB/wGP
 wHHRB/sFQd4QvOKtJlimYNNmwLWT8x571H1gIrBjRcfNuzvQddwOXZULzkxba8/Lj/g41g9T0Fh
 uwYOV52qXTHRasuWN6cTVSBSNo/K+9CEGdRWSIUqOF141Ti3/hm7iKloBYRHP5KlfhztlEVvBSO
 UVlWPLsr8ndFwcGj/M1lNwTZENm/nAXlochyQYMHsX7ojshZQEm2BWXiUnTUrFdv6Yr3groQUyW
 dzkx9EmFcUYCuxAkx2sdIPfNCMTKAlUp67GEvcdCf9xtNkjY6Q5G2NqrtGeYmGHS63CmPwJtxYE
 NWy1n7x6KNDIiXYX2AlAAOY+bvwSYvg9fG0jz0c2dypLa1eD
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_154304_752167_2485D7D0 
X-CRM114-Status: GOOD (  13.17  )
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

The initialize of the cmd value is trivial so it can be moved to the
array initializer as well.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/pressure/mprls0025pa_i2c.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/iio/pressure/mprls0025pa_i2c.c b/drivers/iio/pressure/mprls0025pa_i2c.c
index 1a48f8d43d716b28b8fceb8e1a06d63a73a74a86..79811fd4a02b370b3fde8bd67a5115a3934f8614 100644
--- a/drivers/iio/pressure/mprls0025pa_i2c.c
+++ b/drivers/iio/pressure/mprls0025pa_i2c.c
@@ -44,10 +44,7 @@ static int mpr_i2c_write(struct mpr_data *data, const u8 cmd, const u8 unused)
 {
 	int ret;
 	struct i2c_client *client = to_i2c_client(data->dev);
-	u8 wdata[MPR_PKT_SYNC_LEN];
-
-	memset(wdata, 0, sizeof(wdata));
-	wdata[0] = cmd;
+	u8 wdata[MPR_PKT_SYNC_LEN] = { cmd };
 
 	ret = i2c_master_send(client, wdata, MPR_PKT_SYNC_LEN);
 	if (ret < 0)

-- 
2.43.0


