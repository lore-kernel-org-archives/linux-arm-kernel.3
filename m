Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D21C43327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 18:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Pu3bwvVTJSBGwVuDVBPY5a/3kPulEt99t/TlX7CirM=; b=qsDHv5dFavmk9Fbh0ry4WCaGiM
	SmrgaztFJLCksnugq7HqlZ1KF9c/j+1zu6wJTghpk2GYfis8CYWsxPHTBn/m3BbzVJ+h1wGdk0XS+
	phAb8fhwiM/aNrPmrcTN6/wiSqYWL8Zq4QN86m+QwAA4UIHKfrFmkQaPFBNgbQ4/a8nKm1jOa9D/N
	IvFyVTxWvh/UG3i9xe4YGfKqim5PCdpjRFg1AcozmJ5bvTGa106IHS0xHJG+E0ChgCeA43SPgCZYY
	tDD3FP2e5hJwbJdVR5uOtlG9ITYLZVrJcFESjdCKkXvN1seHloP7hBsZDgWRSgLD9KFhfxEOtOv/A
	ovWmsCtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdArv-0000000Bk2c-3mWS;
	Fri, 26 Jun 2026 18:01:35 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdArq-0000000Bjzw-3ntV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 18:01:35 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-461edb387ddso1290208f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 11:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782496889; x=1783101689; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Pu3bwvVTJSBGwVuDVBPY5a/3kPulEt99t/TlX7CirM=;
        b=ja+I/Cn5nh2KWZLeRVcsw7dXtX0MPw+ajtyMXN9Hlv77g6YZCpCwDF/MhQb5Nk5ZE9
         0R734XKFJAK4ogd7yKKnvS9KloPA7cQHddFjAmeMPExEpO+dTdJUbDA4o9+spQWzBZWH
         AWQg2uHYagLnMPrMjnQtMPae4HoLt4AsSYu7ZPExICQI8qhCVIopvmty5b8BM6EDfm+1
         JkhNDRSyIecirx93tUnGVmYoisJ59+8Ql7GvvHtPK1ae/tSXHQrFEg5oJUCcuip/8vlZ
         99MAOi4rVmEIFayEdkjlkaKm0D5WxCYGjb2WU9wuDLKh/1pwUImuwaKJpGGm+18Czqly
         gcIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782496889; x=1783101689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4Pu3bwvVTJSBGwVuDVBPY5a/3kPulEt99t/TlX7CirM=;
        b=ibdJ64DeLAo9tjZ/wxBJnfqqJlfg53d0PCWRrejyDQVzQPZ2Leco4O4qZr42onhWHZ
         QGeyQmwIu0yy2fdcg6Quzc9p34C2k7tgV2UdBwayf9eJDKqKccyQUnOhVLnU8b1RsGV0
         7SdVm8eJIoXul1NG9p7rxhEGzUz6dTGhUmuN43kSh/ME87NfHfiqYV6trbUmtUnuxzG8
         QQHcYI0zgw8g0jQ6FmJw6Gfdmo9yyP8Xo3hNBbXjv5sVzOBcd20IdI4HY/HAr9xHIeL2
         zXX36OSJuAMMvg41LlaVfuIEo/REmJ2DpdXjnrMzL7hvSW0a31p/NiBZvdItqXEumUXG
         ONKQ==
X-Forwarded-Encrypted: i=1; AFNElJ8VNKx3EyAj6BDHUV/UvmDMeaz+5hEP2UqdNEL+IZmjj7WPJvA68bl6HG+/gcOqVXKEnLry6uIbMsLaelgCFZyB@lists.infradead.org
X-Gm-Message-State: AOJu0YyVq8/1XW05Nq2dTwJ/gXkqfmmMk7oKQCvLdTyovuorXvQ2ucMg
	OgFYZMa8IwflEN3jCRSvxZv+7LVFAvlTp4eorMSBjbJnmOap6OEx8OXKlKOEZL0HkEc=
X-Gm-Gg: AfdE7ckcJf4f7LVhMFmO+JYL0GRM8Q0bW/lDpDCwZ4UxzwLDwxGLe+uClp/mOL23bwG
	4qrgjRckigcULaz1q7fkKjkHGkCzYdNgTA17tMsV89Q0rYEjZzMHbuWEVSmadsTCXcX+oBZXunZ
	cvKoce3SOQ+hnR26bZ6DV4x33h9OAAG5tSVfPdVQLQsoG3nGS22ts9l6aODhSz2WscHGtPewCAE
	QM0WtQIMSC+Dlg4dwnBRdEyU/xwBO3c/0vG5Tfaq8snoKoUnhsQhpVH9C0TIvkDzkmbuGNUxU1b
	vul39ypRZ60jCVwuXKamTTtrqij9wZ3w8vDaBs6j6k0/4utVHKmFrb2aKM4mUYbV+4RgGyMaIOw
	YqT0pYDmCtNOJr0c44u3fqfobIFTEX6zNLOGqaPx3F4lITRnQ/iNU3Tygj7EMbqO3o8z4kRoJFH
	CNWMqe8aZUdDRWCTMOkNdTSp7cCqNlrqY5Xo7kzu4SYX+l/iAkE4jWvLZwHkaloYwCXpK78XM21
	uq+uJKQlSwC2oA=
X-Received: by 2002:a05:600c:8b6d:b0:492:367f:8039 with SMTP id 5b1f17b1804b1-4926689a1c4mr129181475e9.33.1782496889019;
        Fri, 26 Jun 2026 11:01:29 -0700 (PDT)
Received: from localhost (p200300f65f47db04b3606a871f5f1c38.dip0.t-ipconnect.de. [2003:f6:5f47:db04:b360:6a87:1f5f:1c38])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4926c2954efsm48167005e9.2.2026.06.26.11.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 11:01:27 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/17] ASoC: rockchip: rockchip_sai: #include <linux/platform_device.h> explicitly
Date: Fri, 26 Jun 2026 20:00:22 +0200
Message-ID: <d2fe7dc85277b01526f9320ed5baab2acd29660b.1782490566.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782490566.git.u.kleine-koenig@baylibre.com>
References: <cover.1782490566.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=901; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=wiQ/vcN9yqIC4sO1aCpSqdLoX21DBVtg1q10dXzjuGo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqPr49qSP2y8FOQPKksQy9Ga9uLoAQXuQWxfh3p I/V6cThLDaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaj6+PQAKCRCPgPtYfRL+ TguCCAChulsb7LA3PaMi7MyduR+3smp+OnkByHv/0OcMzkhVsmyy3BO/FMSij9hrhx5UzKXtYCF B/cBzfi/EkWVY1cE7ZORNNOmmC1fSRZZ3f+S64TDUcqqD+m+pqITM8OB2Q8X7LY+8RAk4Rwz8ri 58w3TKtqcPhY0l/B65mypKhUe1li2Lg2wbCccROMqFOap8c4wySw7zmzOzidk//5xa2Vq+V0iEk yTntNx+twfeolHSZodcmXx35avQrnNbQJOceqdqYuubZi5V4BnL5dt++wlhYfVIhEdoohbeAvSQ XAsyYm+sRiwegMHWaVt/f5241d6cDts58TWqQJPvMd9k11KZ
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_110130_974663_73DEB616 
X-CRM114-Status: GOOD (  11.17  )
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

Currently that header is only included via:

	<sound/dmaengine_pcm.h> ->
	<sound/soc.h> ->
	<linux/platform_device.h>

which doesn't look reliable, still more in the presence of the comment:

	/* For the current users of sound/soc.h to avoid build issues */

in <sound/soc.h>.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 sound/soc/rockchip/rockchip_sai.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/rockchip/rockchip_sai.c b/sound/soc/rockchip/rockchip_sai.c
index a195e96fed0a..37e81d56bc16 100644
--- a/sound/soc/rockchip/rockchip_sai.c
+++ b/sound/soc/rockchip/rockchip_sai.c
@@ -11,6 +11,7 @@
 #include <linux/delay.h>
 #include <linux/of_device.h>
 #include <linux/clk.h>
+#include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
-- 
2.47.3


