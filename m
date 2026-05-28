Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3689CD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 09:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HXwHjuQDu8ibUYMF90MOYbBP5MlSflxyRi1EYtgFSNE=; b=ZkATEU9e9n3ItdJHT1dIacWhD0
	QNcI8iec9L4P1xkFPq24PggR7beqnK7hJht207xCeJe0oQc6U+7RYvrkfHzU4v4FyDcxJcNC72UIL
	/UNOSBDJ2jdMHphdalo89hCY+yHeecIdykrYNNsBpLWifyCHFkS5LTIfcZEGTXdI8LzvjjQkeSDrU
	uq3Ha20Fa9oEzVRwuwRUUGmlQfcbNZNb+pTQ7cBtYj4OQZkKHQBdMUi6rMr1ujdu4bBOPOEy2IwNL
	k8ujUopqVr/uu5k73f+tZ4nxn3HSsGQXYuD3TAtjK0JgVNHuqVfys0DXrounvWZ/oDuR/zjMeG2ym
	TNidNsRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSWhB-00000005Sx2-1jth;
	Thu, 28 May 2026 09:06:29 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSWh8-00000005Sv2-1wXk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 09:06:27 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-490426d72f7so58550305e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 02:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779959184; x=1780563984; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HXwHjuQDu8ibUYMF90MOYbBP5MlSflxyRi1EYtgFSNE=;
        b=QoYZg43Qh3tS2apmnZvQimVV4AsbjJPp3jh+8JsNF7jxs0lZiUC+Mr+v/xnrKR2TK7
         L+MrqNMOhCsbeytHKe4R1ifnzDiylfZuJjIoMHm5aH8i8YaL5oQRMHWsakAVyqcKZYNO
         Td4peJ/X64qaBeydCHDm63GxjqgU8SANF61TwIt51jOJl1g15NZ44wMZNvJjs/u8/33v
         XXRYequUjWLWDuSYsM0sA3N4q+P04k7RdKWJ77oGi+46QncPHvVxby0nnpqwHQEEis9U
         4bvU6gL7IeDV+fS9gMe6+UFWRY05/Y/UqkkFcJyUGfEsxnVB914duKwW13xqLovY7Vw0
         heFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779959184; x=1780563984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HXwHjuQDu8ibUYMF90MOYbBP5MlSflxyRi1EYtgFSNE=;
        b=G5iq6dibHI6Jo5/ES1fQXUvRO46GZcNYeOqtRXvfX2izMepwyTB/KSxwYZkDjU08kn
         Dm3EfMUKcmkPIVvjZDU6mRxtiDbjmR4fOOeqhsuw+PZ+mybXscexWGhtHTm3IfgJoKM3
         9hILcdMzlm+BHweC16uqHZ1t8wIALghdBHrteFw3/VgIFavzYqgufLCz4ciHr/37FR7N
         9esEdZZUufoeMXQ+fYgDXjrWQmV5t+3AI/ME6mSgACvarYpdQWLQ/ank6bukYUY6q9gG
         jSAnAE2nOy0f9ZHBf8svCeJquWUHFBpkID8vo1cHHQxKSDJNIr7pCEWbYBC9pJd0RFC8
         r+Ww==
X-Forwarded-Encrypted: i=1; AFNElJ+6Rzcy3xMTXoW4zi5ESbKrh/AQewoSDcRS9gCHfDwpJslYFV8s7s7PDVW16RUGXPiALoqFbX/TLK2+TkaJtbIu@lists.infradead.org
X-Gm-Message-State: AOJu0Yx76VKQq5KmlTrybQfhDbmbugfhqV2AxN6aNYjAtsKwIRQ2gVpF
	JHhRw5MUYg1NW4jjdXgyB3Z+LRCaSi9jQgoO8jQ4pEnn8IQBvTzkz4l2roI07qfN6+E=
X-Gm-Gg: Acq92OEbjZUybZXmxW/JHHI8f3fyTAIDVZyFz7l5MYjVIqb2zyJt1jdO9yyxHKt5/yA
	3o3iw2sY+BMYgSlQ5sxNTeBt2nja7qGlgbOYlZcoj+U2w/6FSQ/ZDYnehjbST63er6KvRKQa5cm
	c5dzmwt1Rv409Bjb2zpMfccAWMlv980n/gxRVL+pr4xbaIPuQMDmHPNJqMMDP5csvqFknqF9FSt
	GYtyp1P3a/toEqYzy2Cq7Xu92wYDFM3bMdeeLVZQC8ICqv6sycTY4k4uFyx7yM1wdUyy2Gu1mYK
	8PfRCLWlGt3+H9HVPaJZFYH52GfE79udlXXY2AE5fuZWIRknFiUCLNsKzp2w5mb36bKaxd719hC
	DRdSysmn/erCYX33qg6ufPY8pu8MGd5DHOdsjP0gjYeblg+EFpp3VNS8PSltSBefHoJQ4gGChLd
	H0EFRK8DpMphlMVLrGnUXTnClbKEJ17wm1fm0dwvdTPjXhLZQQgpqmDCfTi7qdT5VuHenIOG9p6
	R8/Kxw+K672iIa8I9mmdlnQqz20mWAHC4uH
X-Received: by 2002:a05:600d:644d:20b0:490:3cb4:f1b3 with SMTP id 5b1f17b1804b1-490426c5a3dmr316858035e9.16.1779959183906;
        Thu, 28 May 2026 02:06:23 -0700 (PDT)
Received: from localhost (p200300f65f47db04e95e43453a0d1648.dip0.t-ipconnect.de. [2003:f6:5f47:db04:e95e:4345:3a0d:1648])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49092a92594sm25459615e9.13.2026.05.28.02.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 02:06:23 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v1 1/4] ASoC: codecs: mt6357: Drop unused assignment of platform_device_id driver data
Date: Thu, 28 May 2026 11:06:00 +0200
Message-ID: <11da50a7e2ab846fa5f008a07d0fe55c7f9ae2a2.1779958164.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779958164.git.u.kleine-koenig@baylibre.com>
References: <cover.1779958164.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=979; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=j6jOumpq5gAt03JpOtXtKkMmLQ9/IfPUPKwsJ+irT0M=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqGAV6JWW05p9YMuTnCUN+tAfzN5KlSlBte2zuO Fe1Vyee5uCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCahgFegAKCRCPgPtYfRL+ Tmv5B/9QxmexYBMfr9rLI+7CIDpTjP/vYDNsSTrpVxW9VUTCBqpRAepHU/7+5jnlEOMw3i2QBr1 bpY3pgGiB2hzS1a9rHS6aBewtcB+AHs+QT+il1Ddcdxe3XxMyZ0ysDXnbstnK5rrCZOpHtSY2BV A0Tg83dKjiZpl65ycXph+21NMIgxARJPosjLKsJBU5DWkuubT1nSlKsSqRtb2c5NEXOPkYNX8SU H2GmPWthgRl6Z30z+dQ1A7+AS7mTXllZnT8M+9m2OH5k3TO88Ui3cYju7+wltsJ6wAa9HAGfMES M4nXnd2xR5w7av8C+pvvGsa5mnZwoS0L1W96hJnZXlsyYUph
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_020626_549564_4D9F8F43 
X-CRM114-Status: GOOD (  15.72  )
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

The driver explicitly set the .driver_data member of struct
platform_device_id to zero without relying on that value. Drop this
unused assignments.

While touching this array unify spacing, use a named initializer for
.name and drop a trailing comma after the list terminator.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 sound/soc/codecs/mt6357.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/mt6357.c b/sound/soc/codecs/mt6357.c
index 674cf7df9df4..3b07087e1cab 100644
--- a/sound/soc/codecs/mt6357.c
+++ b/sound/soc/codecs/mt6357.c
@@ -1834,8 +1834,8 @@ static int mt6357_platform_driver_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id mt6357_platform_ids[] = {
-	{"mt6357-sound", 0},
-	{ /* sentinel */ },
+	{ .name = "mt6357-sound" },
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, mt6357_platform_ids);
 
-- 
2.47.3


