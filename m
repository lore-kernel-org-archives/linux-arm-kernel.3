Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F499E7719C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 13:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fy/DbTIkkOlFt9RUb5dJSds3N2C+4xTIp3gr3Wl8Gls=; b=VgfQhMwnTkcyzmJsvqcp2zNKIR
	ddOdxARVIw5qcCE7KBy1N5HOiVQBSC7UmZpfviMCjILZP9pVqulAK9mUqM/jpVV5eQMhjGqyK+z6u
	jKQikHLTJxftXn7IoZO6z33sJrSDsNvHEQgjEvhExMD6OrFcxui1bQvz4xq4BzCaxVpPB/lYAyMfy
	dN1UbU7Ebinbm/RU9f0Y4vSvSnE4QgkaV8QEayEF/s8epCyD7d1yXgjuEw94PZYVwooZRdadCzQ6o
	RarYfU0L1efrqO94uEdB0IeWt9pgjwROn1/89GR6PbPpZbD6fCrXldXxTAEY37dRJVKEPjH76PU0f
	uYo43fHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWF9C-0000000FUPd-1WfZ;
	Fri, 10 Jan 2025 13:33:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWF6m-0000000FTuE-3ONc
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 10 Jan 2025 13:31:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=fy/DbTIkkOlFt9RUb5dJSds3N2C+4xTIp3gr3Wl8Gls=; b=IupS3WyxoNEnPUWcfzZYbEkqPs
	t+xAd8r2GcCoHNHzB7AB9hSSbkEIrGqHnKZzNocG1pL1s/WUy/P5XikiTsc1iTA+ocHEmGcq8ja2j
	zv+Tg8Kj2w0RNysQB8WTwuy95astP0CXpjfW+05WBL/yfcfgkpBgUHkmAA3fvatMOnEY3sq1PBiTj
	15KC80p3x5QXhqZ9giS4ypcQyTQ/QTMhFpLXrZ+U6l2jt8/xG1D/3+eVk6rFd2P8XV/bolYr8qhpJ
	Bbc3Ocp/9oA/wb5tiFAKQkqieT3hEWSX5liqwxgXGDNzH/oXh/qf+8vFVR3LinYWYMMzx4onQHQ1d
	2D7AWAPg==;
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWF6j-00000009m8p-3fKP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 13:31:27 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43622267b2eso22529585e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jan 2025 05:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736515884; x=1737120684; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fy/DbTIkkOlFt9RUb5dJSds3N2C+4xTIp3gr3Wl8Gls=;
        b=gkXy0PIk34QzrU1YSMfY2kzQSe5BOooeeKDyICAL6FNBdPvpsjEx/q7LaJVHOej0l6
         R4DPbFxe/Xfu3EHdapAA7hZyPrtDbYJM/tipDq3bEDaCuPN7Oab2b6dV5C0FkBrfd5dw
         My06MCWLUaD78hyzGK5HIUbK62lfJVl7TLdVVFH5m5hf5yKQ6AkCrUVL127P/lyWzA2W
         PSbLq/HXQ0j7sAvoDsM43R0Pj2SH/mpL3uJznwVa/3w2hvznSvK2rk9vX9tZk9EAQHhx
         lkw0WeaUJsM8YHg22HHEfHAP5rZFqoVdO0ObpGcN/tZMkMRCYAEHQ6EDUH4+8pqIVDoO
         +UgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736515884; x=1737120684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fy/DbTIkkOlFt9RUb5dJSds3N2C+4xTIp3gr3Wl8Gls=;
        b=oIVeklBM8izuTn9xTNTtH0uLWX80k7oRXHTh8E+0dLTbusm5H2YSLwPOx5JYiQEgkF
         dCj8fqm/TjQ/cjtZYkD8HVg2jniuipo/InYwhFX9tBtnqPSsj2W4SP7H4XZshgjASwIl
         DnSSAjSXF6mefGDMWIi7idyIPcibd4veq4wQ96iqHK4vOt0EnyjJsy/h+8mhiYWcOOf5
         sdPoSf7xiKa2ezA5AVqocOfsgENCuRiM3RbmL0nx1k1VjaPt/LYl++8Q6CFoa4860DDJ
         5AbNtbGfz9wsSeTmBvuNGy7PJ817DdBPp3Qhw3jkm4eKAl29oPJBHmmJjUf3l4SElshs
         5GJg==
X-Forwarded-Encrypted: i=1; AJvYcCUKOcd/ejcvh5G2SIVkE8F0o9d5bxNQB7YQMXrfg1U6Mc/uoDiPJhhVgdABZckQqacpW/AR83D6oJcc6fhBMz4T@lists.infradead.org
X-Gm-Message-State: AOJu0YyExdenKMDElAvCcyQ+vnizcdCu8D3kRtdViWWN28XnM03xm67w
	i8yNzZuIaWeoznEDBtmFo+14KYb/vPZgInh3Ows3GVKfB7+i2ALUjDJhJ5iPITk=
X-Gm-Gg: ASbGnctS3sBD3NasBHGV42kRUAh59d3rrdyvo1xinyYqo+7DMyaAN6eQT4BeC8QC7QO
	wiEMnWI3Utpoy7lCFc03S+GWlSQEdc2ZgxTxTpBC5kX22zNxi/7WTKC5yKDzpAeezYSdWkkvW/D
	k+MzcDsmfaHfDBbLYFwJYvFPlKbXq1yHAkzsd/Ei+FBAOGxa7CbbF3/EIa9kbOJgbDsR7DMmHSf
	GREokxlN4ceO9R9pfa9rRS8poW9iRXtpsq2wG4KQrXrVyrmGYrwIR5v94Qe
X-Google-Smtp-Source: AGHT+IHKxpgNUmOUdkrc6PQxJw1G0Fu/KYCSSNNFr/GjW9WVuFsnr7/fR3quCBLX5bmiMLZjyBIZ4Q==
X-Received: by 2002:a5d:6c6e:0:b0:388:c61d:43e0 with SMTP id ffacd0b85a97d-38a8733b9e8mr10763857f8f.48.1736515883672;
        Fri, 10 Jan 2025 05:31:23 -0800 (PST)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:2555:edac:4d05:947d])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38a8e38c990sm4598193f8f.56.2025.01.10.05.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 05:31:23 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 10 Jan 2025 14:31:12 +0100
Subject: [PATCH v7 2/6] drm/mediatek: dsi: Improves the DSI lane setup
 robustness
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v7-2-6703f3e26831@baylibre.com>
References: <20231023-display-support-v7-0-6703f3e26831@baylibre.com>
In-Reply-To: <20231023-display-support-v7-0-6703f3e26831@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1234; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=Yn0yDiaGCUYQbX+kBDNWi7Wqy2+4x3TU5RubErw6Doo=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBngSEn2Qf8+H9Mmsv7OXpjVxiPUD7Yjb1fkvT0Ur9q
 aV5CbwSJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ4EhJwAKCRArRkmdfjHURTGKD/
 9Ty+ydloEEvoD/Kmij1B/CcQVBe6jSd5+V7KY6pP8cX3F8EGZ5DuX1JRDTw7n6qr0v8t5hMj3vnD4y
 3kcOdro29k0f3zDbIKnPaldi4Xooy7mth7N+AIF1rG5vrhs5ZwSXy274aJnNwjbi7F79VQtY/ED8BK
 JMCyF9De60OQ05V2aA48pVLy+YKkoTMB1fGsR6iAmSINWJN1X92qBuivVZpp0sWhjFdllJnA8EGdOB
 zeRPjNyx0Jn5zrNjYnHseUpuZ8JbV9nWc1zccvD4gVGxDasxqANpeJ6v7srfMCEwDX2lMGQNFqD+V0
 ZVV5PnpcIMWPEmo8Fck7WktUnlvHLppVhOl9ZRJ7J5kRzjvt2n/EvBzUojg2t79aKfTJYm5GDHc9lY
 dWUW6TSq8QSfjkim0hcDojluxIR6FFUsBBYOzXqvptNZr4r6+P2ebaPBNEZBW3T59Z7+AezTXsmLl2
 e3HorWswN5WkZpMRCxFb9n2o9eYtwQs5vTRsS/8hVwnwSpM6d19kGVflYfRjoD9dsS3mhncHZzuDXm
 aSQEe+FxnEU0BZDAdK9ISk1MmLJHWsiJt6V9Ugiv0vEh54yST3DsiO+1pgpS4KQ+yI92tRmf929/4y
 8Ylibc+sqUSryOVik5cnV84QM5Y3QZ9+THVZUDG1vFs6e5bdZDV80jGHCO8Q==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_133126_098735_81A5D9CB 
X-CRM114-Status: GOOD (  13.69  )
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

Currently, mtk_dsi_lane_ready (which setup the DSI lane) is triggered
before mtk_dsi_poweron. lanes_ready flag toggle to true during
mtk_dsi_lane_ready function, and the DSI module is set up during
mtk_dsi_poweron.

Later, during panel driver init, mtk_dsi_lane_ready is triggered but does
nothing because lanes are considered ready. Unfortunately, when the panel
driver try to communicate, the DSI returns a timeout.

The solution found here is to put lanes_ready flag to false after the DSI
module setup into mtk_dsi_poweron to init the DSI lanes after the power /
setup of the DSI module.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index e61b9bc68e9a..dcf0d93881b5 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -724,6 +724,8 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
 	mtk_dsi_config_vdo_timing(dsi);
 	mtk_dsi_set_interrupt_enable(dsi);
 
+	dsi->lanes_ready = false;
+
 	return 0;
 err_disable_engine_clk:
 	clk_disable_unprepare(dsi->engine_clk);

-- 
2.25.1


