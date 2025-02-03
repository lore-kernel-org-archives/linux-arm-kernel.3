Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69009C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 16:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CXimI5SLiQiBHkqFLm5+Ukj2WZLR7LsHxzJcUyfhXrU=; b=kVHqtOclR5Urwdwxn0BIsbW8FK
	o/zjxENNHaY3RMKuMAKVHf+lxKu465HanjIe4sKf2dXQ7koVL5MhTSrtrZQKl+b0hkzwFceDWbmBo
	kSCrrlYq9ch+cF4EaW1kV/Gloy7oWw1YVF0ZbEo7rn4T66keqccIi1KoEhvrNjFuylYHvgrKPaINP
	1eXY+lA8YtS/Wg6xl97z3NFC/HAO4dL16M1xpntL0pn/F579SHlQp85lF98vHkKyUqhctZcZIg+MJ
	WDvvMoti5FyDkqZH+nw7K0Utdnm0RVwgmuQ6DL/FtXkaYhpegYLAVCP2bQXupHZ/ATAOETAaxNw90
	4gIcgzmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tezdf-0000000G33E-1moi;
	Mon, 03 Feb 2025 16:49:35 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tezb3-0000000G2mA-2C4F
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 16:46:54 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-ab7483b9bf7so455966b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 08:46:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738601212; x=1739206012; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CXimI5SLiQiBHkqFLm5+Ukj2WZLR7LsHxzJcUyfhXrU=;
        b=SxufMnP/rzj2/5MgHtTOzfYQSDGQeFKYxxCya58Rrjen2kQQhAdAuaGTpJ/QvcwObS
         6RJUUqGyw3C/N+S7yypyrAsoKRMYZ6ZxudiGtQcxHWUZ8NI2mc5DmWeVj/V11YXgScCa
         qh1KIJobDB1e4LbcR55YGuIjnHdTf3Ref/Dm6d4akwJOUVdQ5TuO8ysHsNwTP1p8tHtq
         0OOzd5hF+xS4XSlLc2SjVQ9PR5hnzs+yKfwBvoeQVzWmmzo1AFj9yqiNu5m+0iM0jYNZ
         b7Gk8z/ioFW29Jnkuvdh505jNFjpB8fPm5vndY6FHlHx38dZ8pEr5Izc3cfiBIzHL/FW
         2w5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738601212; x=1739206012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CXimI5SLiQiBHkqFLm5+Ukj2WZLR7LsHxzJcUyfhXrU=;
        b=EgsaCEQBvmHLUs7wtoW2PUndeME/8ywU61PVQmT37edIkxfPbMcwqacJXOmozQ1ZGT
         aOnGN70alYVKI4kKqSBtOU81MlTqy85iEzN1049BoafsprF+338fw9xBfimszYLEUyb4
         6hpdBaxIT93ZhzJezv3ODIEiTTG9CedH5rUmo1O5l//7AaMWG9GRxyg38ZiAb7TDqDYk
         WfRDM7IImAFCf00PaUftKExiOgg/IQMZ6OGlAJyMrGU3NV82qfvLQmNFkSFZsq39oIZQ
         59A9T8RvaNOV9UNX6DYVSGVfDxeXAWRQtTVLoQ31dz8JIE49wqrJSocoI0JJE/t5Otjm
         9TAw==
X-Forwarded-Encrypted: i=1; AJvYcCWybyfuIUOp7HxKf+YqbElAPdmTp3qvkZ2bPTkLrCjO68XQh2Mr4O25u+yvjFbOQHcuqK3NgIinHKQtE3xQZjvg@lists.infradead.org
X-Gm-Message-State: AOJu0YzSrrrLq0kg87eHwVdZz0gADAAVVR2rJIj/r3dSmSQN1q4eJAp0
	mQ4CU7KdwrCRmupNGb3Rc0IhNjFvZpLh3SrY6Uo0XLoyoIhdgMvrr3Yx/jX3gLA=
X-Gm-Gg: ASbGncsbFBi9NHMa2nAsB4QLMe173kmal3eLQ28SsiHRAOSGw89qLdqbCi2KTY8cCA/
	8/BfGwUphsB70l4HW1przVY3c6iwxTNw0QgteY7orFj9H3v8oF8NTKcVnXh5UqI8KiPrn6ynR2A
	0vixI4M//uFQ8doFZdUcRT6XALfdMcJhDHTiMlaTnOKmlMxwSbqJVNKjGwB2XI31re02zYSlG3g
	ZaqZa+LKq/8BmVOicBMaO4oi6FH6MRp4K9NW52jub1itXpnZfBaiYEZpQwdOeV11t11I4MPmBLy
	aY+c/rsynDNd/VIuDIZRDudLwoxfybwHISTVRNyjDoXQYyk/pG5nIsX9Og==
X-Google-Smtp-Source: AGHT+IHXs4AvC8if41Og48yMOr1zBX+SD4uou5rx2L22DfDb7S64uAk44ZOshnu8uxmk57Ks/HsakA==
X-Received: by 2002:a17:907:7211:b0:ab6:36fd:1c8f with SMTP id a640c23a62f3a-ab6cfdbdd99mr2830433466b.39.1738601211988;
        Mon, 03 Feb 2025 08:46:51 -0800 (PST)
Received: from localhost (p200300f65f018b0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f01:8b04::1b9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47a7be3sm778193666b.20.2025.02.03.08.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 08:46:51 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 1/2] dt-bindings: altera: Add compatible for Terasic's DE10-nano
Date: Mon,  3 Feb 2025 17:46:36 +0100
Message-ID: <8714f54eb78a2bacf508debb7844abfea78767ee.1738600838.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1738600838.git.u.kleine-koenig@baylibre.com>
References: <cover.1738600838.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=868; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=AzdbwsLGIxqw7TQE28+Rpu8RSV6L75Z0joF7UtUReVg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnoPLvDKT0DgpoDQfq1jscOPJ1mvTJ+mIVfCZPB YKKB/SkLP6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ6Dy7wAKCRCPgPtYfRL+ TicSCAClaFMs/fLDDEylCkIBwk1KoS3U9eDIWGGGfVGmTc2gRVY2gso7FI/tmwjoujp4TMjMxak l/EXRrlegKL7M7vyLGHpNBt1z3ecqobNbrILjqAWyBEMSvlW1UaW2dkjL6pBfs84B923wOWe5XK IDuGVrEjNgJG8g9eD2Bkn4hJHO/KZVUdTQgfAHpFWsj84P++0bRnYSFuHw1rfZO/xUvZMBRNdHQ VT+xsWByp3L/toM+4Fd8uTXPfP0JapVuvSYXT1ot50uadKvpvTB1nuW1Q3TZU180CIhaA4Q+19I bHN+rxiTeHhsWhfjFbSppSPQNsbjPZObp1lujBgN1lCzE6Au
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_084653_568130_1768AEB6 
X-CRM114-Status: GOOD (  10.40  )
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

The Terasic DE10-nano development board features a Cyclone5 FPGA, USB,
HDMI output and an Arduino compatible header.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 Documentation/devicetree/bindings/arm/altera.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
index 8c7575455422..30c44a0e6407 100644
--- a/Documentation/devicetree/bindings/arm/altera.yaml
+++ b/Documentation/devicetree/bindings/arm/altera.yaml
@@ -47,6 +47,7 @@ properties:
               - novtech,chameleon96
               - samtec,vining
               - terasic,de0-atlas
+              - terasic,de10-nano
               - terasic,socfpga-cyclone5-sockit
           - const: altr,socfpga-cyclone5
           - const: altr,socfpga
-- 
2.47.1


