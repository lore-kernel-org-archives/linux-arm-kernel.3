Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD876083612
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 12:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3XnKruCK;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V64hvXG/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NZ3CgzX5kCqEc5zzVuYtQMrEP9DNTdrTQOJmfrHXdUM=; b=3XnKruCKJTho+Z
	prWIy65tjJwe/dpb0ZrWZCfP8mrOjDGB88oBjGBGePU0LOloI+cnIqdMEdr2+qDpn4JqwLW4H/6gK
	EcJcDS78TVELMqlHEZaRuriYwYRDo1/LohGx9TiwcaV/Mabq0zHy8NryEYRnpYLkIYIV4meu7xddU
	RMgHhfsXxCoGArkiJUnsR9fw9Zp8Rhhkqr1fO4IVXpjfyVzBaa0eXiTy+pXC3Si1xZbvxsfsk95cg
	JXNhdeEytGYf0153/ihSXpvK4pbLT4cOgpgNXuMzOl5msu3ESt0nJfOKCYcabgRI5F/pFmSxdQQwp
	xN6l7jsbOkuR/y8qoWPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwPE-00000008tJO-2Ok5;
	Thu, 05 Nov 2026 12:17:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwPD-00000008tH8-0UCQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 12:17:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 759CE61107;
	Thu,  5 Nov 2026 12:17:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 877111F0093A;
	Thu,  5 Nov 2026 12:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793881042;
	bh=NZ3CgzX5kCqEc5zzVuYtQMrEP9DNTdrTQOJmfrHXdUM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=V64hvXG/6ati29xvEOwA+mKQa0d7FJScqk/4Vov27oAQ9RgN2TVHLfQY7TjZ6YRk9
	 KfAftY8bbwNhFfUbwevB6z3w0l+tbCxNFkQMBOLGSJdZ/TWkYLs4jC39F0lC8Ivjvz
	 JJhZhwfNodO4qfOxjx8modj8zfRT+sLG6l01SrikaTWYiJxv53wI2hx/XNqRDVGaXq
	 kxR2nIjwAAUeExh/HM4R9cfmuZd9YxBV0Mj98yNoX1l79198Sa9BZC7RrwUdrUs0HZ
	 run9S9EKxte8HsKtXpKdXvma8V73cMNl+tOQy4x105jjH41sz8DUoW3ZZs3UIZqZ0d
	 CQ1r1xtOSHmwg==
From: Joshua Crofts <crofts@kernel.org>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Eugen Hristev <ehristev@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Haibo Chen <haibo.chen@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: [PATCH 07/10] iio: gyro: bmg160: remove redundant pm_runtime_dont_use_autosuspend() call
Date: Thu,  5 Nov 2026 12:16:32 +0000
Message-ID: <20261105121635.1612-8-crofts@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105121635.1612-1-crofts@kernel.org>
References: <20261105121635.1612-1-crofts@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since commit d1706f9da9f4 ("PM: runtime: call pm_runtime_dont_use_autosuspend() on reinit()"),
driver core is now responsible for undoing any
pm_runtime_use_autosuspend() calls on driver exit.

Remove the redundant function call.

Signed-off-by: Joshua Crofts <crofts@kernel.org>
---
 drivers/iio/gyro/bmg160_core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/iio/gyro/bmg160_core.c b/drivers/iio/gyro/bmg160_core.c
index b007f46d3fd6..f1e1d21e590f 100644
--- a/drivers/iio/gyro/bmg160_core.c
+++ b/drivers/iio/gyro/bmg160_core.c
@@ -1169,7 +1169,6 @@ int bmg160_core_probe(struct device *dev, struct regmap *regmap, int irq,
 	return 0;
 
 err_pm_cleanup:
-	pm_runtime_dont_use_autosuspend(dev);
 	pm_runtime_disable(dev);
 err_buffer_cleanup:
 	iio_triggered_buffer_cleanup(indio_dev);
-- 
2.47.3


