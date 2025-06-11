Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05CAFC71135
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 00:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wFtBqHig8Fed23T8+cfJndFoBL4sOX9Nb3YXu3tizw8=; b=jLlQDtIjB/Wjo5tkMCejKNGXmb
	Gr8+e5hN1UF7FitZspEOySostyaXjfTWJ11JV++tjn53+nyUjRnN0yG/GKP/itHMSkXkqyUm+yt0O
	TcVvyXBGEratV1qskTrXvhUvmLTYAY5NKzV3b/AuK3M+mKWPpatv2DlOAjdicQZeFjpQcpEmfT7W7
	WFqWFQtFlaM2dvDbt9yyi+KxGSN4jMZGOx8evvjjys/EJJpjbFwxDuoqiCLwNFm4JczM9qJ4DN/VF
	GMd367+fe6xuvilTsSmV+WxdzF9cvEOjtgdogolSBhNhdYdFXMeISMOEeaODv6bDs9CdIQEpB/OoP
	7PvpqBwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPVR2-0000000BkdL-2dd5;
	Thu, 12 Jun 2025 00:04:48 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUA1-0000000BVro-0aH6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:43:10 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-739f2508ffaso247259a34.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681788; x=1750286588; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wFtBqHig8Fed23T8+cfJndFoBL4sOX9Nb3YXu3tizw8=;
        b=bQ29/D6WhGPMPyCgJN9c5p9QoXt6gADPgCpRG/kO3gR120YFThalPuknbgXQLw/Lkk
         xQTs2uMmmT8hcdnyyuNd68G2gpLt2UA0DuJejSRxsFRE4rL3A6jNxYWj5ulKM4IVdPXL
         1XuQDozJhzP1k4M/+LyoRdqicloH458NwUUPioNwFIKOKSZhNfY/xNd1WCkTRfUm+5M6
         F3HYpZFLiSoZi9yvh/xlODK8zKWANxDMq7Ph0EDgZoIc8lYsx3sztmGJ1W8d3zIBoJum
         8qBT0ueWrsypLQ82bcRyyv470be8PC0J4TA9kk9Ka5MMSoKlx0/MUNPg0w91v6XhTyLf
         3OVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749681788; x=1750286588;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wFtBqHig8Fed23T8+cfJndFoBL4sOX9Nb3YXu3tizw8=;
        b=JIcoXUs7eKD58gT9TPyOsSve2aW3I0r16T8z7thpAGd+TLB+k+0OPFvNRydHJSiHyN
         kv2QlQifpW2+a6Jm40pfyx+AKovIjCaDd8FAqW96+t90VvDerGEt+k3dqvJ0rARs8Kpz
         j+1/rrMKHUx6k9HPFiYUCdXeFE7S7sIEOUFcmLNbIk031VfqkJJI3IJNBCLAeUGJ80+F
         SU+KQO45aE8EVNdR/zUq4fLHXJf8eKOvkiuIHMBC0IGYSEWM7ST61nuNb+ZPtMn2Oj/l
         2uQ46shc2KsPFsAvyDnzvGvLiL3/Ej2L4czfDvQQTfh+6zCgDp/qa6aYfEblNVsR+gcl
         z8KQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4IHFRv9NYgdL09WZA9L8Ea8R+K7NfNFh/xlw7s8MOfmWTxnzK5kYNFDrRtLk6fpeqfXi3WVljVr7hwrXcKniv@lists.infradead.org
X-Gm-Message-State: AOJu0YzpoK6lvCdl0bk4Rf4HCjA+blldMmWMVlKqM9WonPeo3lxwMB7O
	BFIUkrAZdfNsysK0Gj+Pcpumd4u7UZdeA9XglEjwG7rveBJHvfJBzVgqhYg2OuofS2I=
X-Gm-Gg: ASbGncugM2BiFSM5KE6tpklgGY+K+n3SfhOAzvd2D1Xg3IFtLPRbaV7oB1OrmD4aZxC
	/LmuEkf0B3HLblzSsmOSw7kt5n4eq4DwbqDi1g8FstW5mfxXUDBgMQH+xDNdXYZQkmcqRlAfzeP
	pIZi4fLh07WveALG7kDGy25p3rwScyB0742f1uOd1lWLhfcnL7KCO1KGut41AC1lZZosduG8y0s
	VT4JQciueYacYUmYubVv1/Hx2MOjpV1udWOo0eMI6buyrF8MuOj8puAav5JUZKB+ApDEyfwMVfi
	+AVlRkTPR7guA8SQkBTD8GgAGcOZ8lz3UHd0g4pLiML9sHAbPCwcyO7FLoRpR/DAXZWd
X-Google-Smtp-Source: AGHT+IG5W7kH4+hxgdGC5cYojtw65mnpGPuM8rfmDxflahn9sv2QuWNjrWb24/1rv7CIa/pXKjlkYg==
X-Received: by 2002:a05:6808:238c:b0:406:72ad:bb6b with SMTP id 5614622812f47-40a66adbc50mr575420b6e.37.1749681788466;
        Wed, 11 Jun 2025 15:43:08 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 15:43:08 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 17:39:19 -0500
Subject: [PATCH 27/28] iio: proximity: irsd200: use = { } instead of
 memset()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-27-ebb2d0a24302@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=797; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=H2LBBJsUJiIc60MPGSJU2UBb5KBWsOEZhj5u9YgC6RQ=;
 b=kA0DAAoBwswgAf8Bj8AByyZiAGhKBjfIgQfT+NI7ZBHF6EqEZASLyMpQI6Xmjd023Z/HVL55R
 YkBMwQAAQoAHRYhBOwY2Z5iDoPWnNhomMLMIAH/AY/ABQJoSgY3AAoJEMLMIAH/AY/A1PwH/1/i
 g0gWTD7ZaRxp/hx7awW+jIFoQGzh6qTEbYue/UlgwqG8WG/qXLGJtE2TMNEr4xak/0DjEmHUQi0
 6TuTAR57tOQGCcFyvgFcpEHWGzydpL1M2UuzsT6SrTEkw8xRBk1Sjru/5SPcKg3fG0YQNSV0u/u
 y6b5ToQ6S7Fyrp/CQ9iLat82yU2B4m6UeVvKbVnUqQKf5W6irfzYAIiHsGm0U6Vt2JB0bw/xENa
 0AvOII7wKZ+yCTn68OJNIUuuO2GriVCbnOFFVj9k1xyiFlL1+f/o9rELPgpsoL23p4rJAR11ciY
 NhG+Uu1ETT3wLhRDyyFvmrfMPWxajwsHHsexQU0=
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_154309_187751_CF519EF1 
X-CRM114-Status: GOOD (  12.46  )
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
 drivers/iio/proximity/irsd200.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iio/proximity/irsd200.c b/drivers/iio/proximity/irsd200.c
index 5e751fb0b12fb2167f4d11e814915cb2761ab9bf..253e4aef22fbdca84a0f8393d6f423385c8dcda8 100644
--- a/drivers/iio/proximity/irsd200.c
+++ b/drivers/iio/proximity/irsd200.c
@@ -763,10 +763,9 @@ static irqreturn_t irsd200_trigger_handler(int irq, void *pollf)
 	struct {
 		s16 channel;
 		aligned_s64 ts;
-	} scan;
+	} scan = { };
 	int ret;
 
-	memset(&scan, 0, sizeof(scan));
 	ret = irsd200_read_data(data, &scan.channel);
 	if (ret)
 		goto end;

-- 
2.43.0


