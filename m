Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C39CD5BCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 01:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SYbs/MKBJVpipjYP+IfAmb04OO4GAu3z1Fjn8q1WnZM=; b=t37CCvoQMoQ7mQj+1Ramotkz0s
	Vq+1MYvTj0+FZvvmg09oAu3E8oVo5n9islhS1FeLycV026agzL0UTnL/jRC42qPMzk8pfy6767kQv
	kuFZRrgDR+PK9KgqeW958kSzzRi3RAuBYarGWc7JbEMpAebihbIPpNnJHuD4tilXmLQOTMfX8vejc
	/jHOcplJYLlQhhvftyaDdP187eUqmR6/Q4syYkJDH3SblGYhCDp60sBAT8VZm1dk+yrUz7RN95sph
	pzxnH3bVElyMKqekso8go+BkCs3Q76vPilgFH9p17WpU+2CI5J9Zb/+UqOq55eltrYsAdT1hn+9y7
	h0Z2IsKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRKIM-0000000G1ky-16Nx;
	Mon, 25 May 2026 01:39:54 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRKIG-0000000G1hf-1uhi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 01:39:49 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-7e582b3bcaaso7828235a34.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 May 2026 18:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779673188; x=1780277988; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SYbs/MKBJVpipjYP+IfAmb04OO4GAu3z1Fjn8q1WnZM=;
        b=blCk2WoudO4XGvS5xHFqlAOQhOBEuYh4WsxXlL/yuF2vlAsuoq4nfFheQjNXGgQJdZ
         SrbIvDhQ8ydXiXis5pFZxwgZfxxQSmQ4qV7phGh1M32yM6ahPxK1dEn+F5SoMDow2vGC
         VyKukp+6zDVFOysNdvWZbJFj7aaEOXuu1YQUi7zzVkI39H1mD5N+32AGzfzAW94ogG4U
         eWyCtNB9ONR+UE8sPhaCPHIuuI2XFA8sRaWK6yseav/IciyxGeaE6NoBWMvkDt5QjY8w
         TmoyfJHMQondvb1Jt9e2iD+HMC2RsrjjbVKyL4ywuPhPmn9wZ0Ck/8KkTlTWKMrnTCpc
         SO0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779673188; x=1780277988;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SYbs/MKBJVpipjYP+IfAmb04OO4GAu3z1Fjn8q1WnZM=;
        b=UbVW3R7LeKvLY4MbOeghefPY7MR1aZlNaROzFBG7i2bgC7TlnQCBXqQ9rmWc7Wbi2D
         47jTSY7djtk4HRTRUHVGhS+I3M85Wr27/bIvFlHmMmhNLEie1KrJ5h+8E5SGD2cBcyWb
         ed1HbOfrg1uEhdScfuaHNF4cXga1VCRmz1pVoYM8Ey70uzIBOCdIiGlhPfZpupDOZe4M
         9/DHhJzi4Mcp+sKNj8Q0SRFkPu6aOIzBtVcwXL9IYMNn7+pbv28sfJ+uSMmfu7NCU4LD
         r3gx1olfJkuDAfkhUULBjbdmaqeiXJ5oqg+3ACmofMePIHYKlyXTkCBOq7/qXSzYRbFY
         3JIw==
X-Forwarded-Encrypted: i=1; AFNElJ9LergKZSbB4F1Y+vtLOKvCjO+WX5DoBJvnhmn3tu3qaH01yfzVYGlpKwwu28dm3xQuX0tEZt33o6oo+4pdhFCd@lists.infradead.org
X-Gm-Message-State: AOJu0Ywvxz/3dQT0OYRKTCo1+YJ3D6EpOiH01x+9tItzRMhuIERUBtMi
	fkUYCwijvB/N6UWBdQFzU0ASFMT8w6xL/4V8/HDVqld/856LPAgxms7OzRjLRzeYZfQ=
X-Gm-Gg: Acq92OFKqyLq5boLPEF/wXEplZutGyVYMq11QuX203OncdOYHElxQYWnJOF9e8NOF8S
	g5rBOkOnnSjKE+6RmyGg7iGsTlzrQ4BB+3fkWoQUV6XtFwQCyKJGcYYRQSybZic0qscEWCY2aa4
	SFELh429ALGMM/F06HfAzCY5XrJ/dl3xDP1WatZVXxO5eMB9CB/VtobFx6zezdvGLT0NPuB4Hlb
	Rswd2Nc3u3/W4XTtodiCNMXjEnzPJzUiigu31YZCYMAaWncqFN8tDkU3Sm4alNOCr4+8xbL3H02
	fbfgi2joXQuZFC939/j0YxACzo2eHpsEElJBfHLPBYqFgT9w4anZ6xNYPgcbXIX0CDFM8ohBMzu
	vIR2ZR81iLNEofJM4qmfFCldvOp0VrZ//2wVXQ+SR5c/fEKeWwFYSMlNB87fqifm9TAY3C2zbAQ
	BleK/wCnpBveGldV7rYoWSoB4hPb3C
X-Received: by 2002:a05:6830:3707:b0:7dc:cb67:cb57 with SMTP id 46e09a7af769-7e5fee981d4mr7582287a34.16.1779673187667;
        Sun, 24 May 2026 18:39:47 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:713b:3006:84c3:c1bb])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e6060b2dffsm6250206a34.0.2026.05.24.18.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 18:39:46 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sun, 24 May 2026 20:38:34 -0500
Subject: [PATCH v2 2/9] iio: common: scmi_sensors: simplify timestamp
 channel definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260524-iio-timestamp-cleanup-v2-2-c37c9408b7f7@baylibre.com>
References: <20260524-iio-timestamp-cleanup-v2-0-c37c9408b7f7@baylibre.com>
In-Reply-To: <20260524-iio-timestamp-cleanup-v2-0-c37c9408b7f7@baylibre.com>
To: Jyoti Bhayana <jbhayana@google.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1869; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=T4Bf5vbSPVSOe3vw9rQJwnz9U9F9C23dWoMfCegfy7I=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqE6gq5kb7gqNIvRa1NfJv7HOorfQZ3sqHYlddI
 Jml3lPpMcCJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCahOoKgAKCRDCzCAB/wGP
 wNzjB/99KlgYJikZIqEx1VRYZkMM2mAJQ0if0DHyVfTAhaCsz+wJI+IQPEslFn5JAl9jhLjhmzi
 PYD3VGA6lBMGRcJSUCgM1OWVM7B7QltkL95q39cLNNpYOAVmZQx7i1YAgGsDZgyHGNZi7Ui9FbH
 7SDCW7Xyd6pJ/tgTruIR+eKKLvhkVd3GaEcUc3513TBTtXTIh5IJCAzBqKfNlH4YcvKZ7F8FYlz
 YbLeyrMG6PzwvU49sYkKLGrsU7+sg+hUQx5IcdbiTf9BDcAPq7thGaVSVGtoAdpTKnP7Q/l9ohs
 O9uFitSD/dtrvSvYhnJy7skna6h2/a4L6D9etMkFCdEGvdUM
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_183948_506002_6D5D11F6 
X-CRM114-Status: GOOD (  12.62  )
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

Use IIO_CHAN_SOFT_TIMESTAMP() to define the timestamp channel instead of
manually filling in the struct iio_chan_spec fields. This makes the code
less verbose and mistake-prone.

In fact, there was an error here as the sign should be 's' instead of
'u' which is now changed to 's' by using IIO_CHAN_SOFT_TIMESTAMP().

If we find that this breaks userspace, we will have to revert this
change, but seems unlikely since the timestamp channel is well-known to
be a signed 64-bit integer globally.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/common/scmi_sensors/scmi_iio.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/iio/common/scmi_sensors/scmi_iio.c b/drivers/iio/common/scmi_sensors/scmi_iio.c
index 5136ad9ada04..442b40ef27cf 100644
--- a/drivers/iio/common/scmi_sensors/scmi_iio.c
+++ b/drivers/iio/common/scmi_sensors/scmi_iio.c
@@ -419,17 +419,6 @@ static const struct iio_chan_spec_ext_info scmi_iio_ext_info[] = {
 	{ }
 };
 
-static void scmi_iio_set_timestamp_channel(struct iio_chan_spec *iio_chan,
-					   int scan_index)
-{
-	iio_chan->type = IIO_TIMESTAMP;
-	iio_chan->channel = -1;
-	iio_chan->scan_index = scan_index;
-	iio_chan->scan_type.sign = 'u';
-	iio_chan->scan_type.realbits = 64;
-	iio_chan->scan_type.storagebits = 64;
-}
-
 static void scmi_iio_set_data_channel(struct iio_chan_spec *iio_chan,
 				      enum iio_chan_type type,
 				      enum iio_modifier mod, int scan_index)
@@ -629,7 +618,7 @@ scmi_alloc_iiodev(struct scmi_device *sdev,
 					 "Error in registering sensor update notifier for sensor %s\n",
 					 sensor->sensor_info->name);
 
-	scmi_iio_set_timestamp_channel(&iio_channels[i], i);
+	iio_channels[i] = IIO_CHAN_SOFT_TIMESTAMP(i);
 	iiodev->channels = iio_channels;
 	return iiodev;
 }

-- 
2.43.0


