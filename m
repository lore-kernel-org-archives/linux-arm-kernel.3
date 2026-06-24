Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14117CDB47F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 08:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jD0yBLMi1WgsXurx9iE/PVJkQmjsO7Pghg9IxUVMHWk=; b=rTGenX6wdQbaKHzUsfXyNQZaqy
	8MU/TSOs0hbiAxEECmMBigFWH9UH+ucBKk4bB1Ud2nBZaz1MAyzFY4ECBSPoAAmlllDkSPyJYrQvN
	eAolgjrmQuzB9NrG8N//lxs6waGUs+UM6iqJ3RHmxIAPqVXMuEu12yJaohiE5v8yuMBh7Tg0vYI+Y
	t0VYTK7bVtBG12o3xhLYULvICruPWl56giG5TxTUPXYQQFWfBa0jT6tQbjO8ldEpCv3NVz3q1ASGm
	mrqD1UY+7G1cNeS1t+r3oDhMoqfUMIF4LkVMWQidOemx6qpe013L+iNBtc/clFxmnb2NJUN9byVt/
	foniE/OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcJ6m-00000007PCt-1Z1u;
	Wed, 24 Jun 2026 08:37:20 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcJ6j-00000007PCB-1RPA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 08:37:19 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-463f1165e16so876916f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 01:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782290235; x=1782895035; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jD0yBLMi1WgsXurx9iE/PVJkQmjsO7Pghg9IxUVMHWk=;
        b=BqKUIBcLTi6y5hVSwddoBqiWOKYJ1DTV9MZVBlsEUrY5j6NEXS0OZpMpYvsWDj1sBd
         xy8IaVlliqOwaNCgRfmAK62K5isCETqBsnrhgJdMqBOr8m0Ku4zs8obWWmqIbPxdL5Hq
         zZCiJWfNWndr8iLiOK1KAY7HTkbKaErznaRvqqotlY66W35Y06SdGRa21R3rjC4g1FnL
         0IS1it/Od4LN4kNoOnhaZ34s9auWHvc9GwBPXq5bsAFk736ryzyFVrTWpPSQ0E5VaUrH
         sPApD8c/h39mXDv0ndls8ZBD1dMk3SgoRtKr5rMQe1P8I6/zPlNhPW5EkrihmhxN0vaT
         Y+9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782290235; x=1782895035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jD0yBLMi1WgsXurx9iE/PVJkQmjsO7Pghg9IxUVMHWk=;
        b=Q1mFSQJpOCyykFiI9SPifofMb5ZGWz5BqjxWJthMyuN+3glPGIRqYyHAV615MvfVsM
         Y3qdPsE5bW53F/qQkpWDT3ycobdKmHrK+quKq9xAs16qG8fR9hmwqcvgc2ILT1OyX6oI
         QNDYea8vVP5YcJZtS7/i4JM86tc8ZprY1jWBGp3UVO/z9EnUlN/FzHBO/tBXUEbR5hom
         0nrOcGd0zbbrNwGB6XnUcF2ViI+TV9jbBeTv+hiEg+Uw296yyUFA2x7pWynSifKsiylH
         0yBpLlymuVMrBJOlc7pX4dj9SIwW9Z+BjB375/USfvHDiVyA0stx+ZymVS2YnOHWwD6q
         vqPg==
X-Forwarded-Encrypted: i=1; AFNElJ+QIjjWULfcoJzQxTSrz9YJNnciOH49KqQ4cJagRcO2fOjlPhLHrLo9nLMj83vJqBst+CljO4YkgtDFbDB3EcaK@lists.infradead.org
X-Gm-Message-State: AOJu0Yywv7JLPxY8S9ztF0Xp40xT9TdTntD/Xwh/dfNGLaZR2y6PlEJ8
	BEfpYJnABa158KJwBjF98WL2pHTxW74/osnavO0UeA5a/Snia3992rzoFS6wLQDhVPY=
X-Gm-Gg: AfdE7cnwH68nq4413xpZe90KenDdiRkm9KiKey+h/4Joapj06Sb2Z6ogFJeLXcEeGha
	H9e1PKIKbVKnqrhKVvq/vr694Le0vEgX9jYeVzGH2Y+gganiNolv/bIxfMI8C+CUEZHPQE8RxRv
	0v4qGiyfQTHXtInD9Kp1feUtTG00HCuDc7SZedRAtc2v9OtyFZDDBQQBtG+A3tLtnN7ysQeJfZD
	fifMwbkpDw0a/6Xj+tJP/wosIFfAQfzzWaF4f4uTLY2Uj3k2r+90GRzgm5N+L3W7MVA7+1w+h3A
	wCy3KZN1SEZ6e2wgEeE/CAjj2kQ6xJWN7yeqVDxj2ysGLcQFeGa0p9flsn7BuLbJdFfbH1xl5Rh
	hrELkfmm5NlEXtqp7G2Mb6lwcMHf1woRAZCh7iOUsMbh9LNeLA8fpyBo39OCa3LKYCuZNadnKnl
	RNyn+qH03Un2/S0fpw3r9JOi3PxnKSUCGapIo+JbbUgIhfWUir+RAYZOxBSpZWldc3eG4/jajLD
	zX1
X-Received: by 2002:a05:600c:c0c3:10b0:490:c2a3:23cf with SMTP id 5b1f17b1804b1-4926087abbbmr24473415e9.34.1782290235329;
        Wed, 24 Jun 2026 01:37:15 -0700 (PDT)
Received: from localhost (p200300f65f47db0497adf84f78eebbb3.dip0.t-ipconnect.de. [2003:f6:5f47:db04:97ad:f84f:78ee:bbb3])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4923fe7b359sm418072505e9.9.2026.06.24.01.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 01:37:14 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] ASoC: rockchip: rockchip_sai: #include <linux/platform_device.h> explicitly
Date: Wed, 24 Jun 2026 10:37:07 +0200
Message-ID: <20260624083708.254517-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=958; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=he88gpG0jTK870kX2aaFn6iF/21ycx8BCce5aacPgz4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqO5c0zoOeNHjkiDlCr6YRt/k1lUxk5W/gh5rpG ETdWZDOavWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCajuXNAAKCRCPgPtYfRL+ TpUTB/wN9y9wbKmFUlmeGAAX4C1nm5ZQ+AOiPMpZ2YHfyme60wMYfbTK/a7sd8abF+2NFyZiKsL 57cZjmkizh8C8rWzvpHY9CuNx0FTNOGtGpJ056qNZv4y4ObzZ57QFCRq7H9QntvYsneOu1l4dVa nnxCVGVLdveudambxzH+kSghZF3uK2x2LMW3jhK9YpCbRfhuys4HaqUNtsp5Z5LsIojkApAN7Sm AK9/bCDmZFJjIAB3RwY6vEan74lgpUcqWaxLOfMuNMGUeWgRNeZPHFJBl2fTrqwOiLHlBtH32sM LecLWggGNYYP0jwTI3wd/q5qxfh+5IWikLgq4vFy0Yr4sGyx
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_013717_390680_2C46C37F 
X-CRM114-Status: GOOD (  10.73  )
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

base-commit: ef0c9f75a19532d7675384708fc8621e10850104
-- 
2.47.3


