Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71AECCA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 20:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2lAdfxofOjXBbqsp0/iF1q0AKoAn+osrW0QUEeXjGUM=; b=ilKRwLWcqfTAkK2BTMk7yZkbt6
	0XHLVUwHjZZb0MzG5Yt+3msYWnVsalElv92HAbSil13ps/0K2EWbo0Yay7OfmJHOuSbH3dVLrtLkR
	gXGuqPCrUHrwF7RywCRv/0UthcmQE2EaUpimR833WkUR0XROF47+8juILRif5iKrl4uM0rr47Zr0z
	61u7kl3PtwaXoudvRJ7viX9y9lhiDU9vS9F4cp8tB5+Tl6Q3tceivJI2K8uk56QuFfGYatBTL4Ayl
	AGM+kxLxgZ9h2iU4HTIecxgAxaoMxNdw3et/R2sPcgU/0rsOO2lrTiZf7Q+HpFaggtvbKfRTzAEYU
	vr/KEAJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDpIN-0000000H82l-1KBI;
	Mon, 05 Oct 2026 20:28:23 +0000
Received: from mail-ed2-x0e.google.com ([2a00:1450:4864:33::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDpIL-0000000H7zY-01Lp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 20:28:22 +0000
Received: by mail-ed2-x0e.google.com with SMTP id 4fb4d7f45d1cf-6afbfed31d1so2505815a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 13:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791232099; x=1791836899; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2lAdfxofOjXBbqsp0/iF1q0AKoAn+osrW0QUEeXjGUM=;
        b=kGaZ7rX9gd2DJKWb0AmnzHmYH3ybHJKsfXJh+qhvJutvObwVxQsf0dS7J8mUxDFWE6
         zbn/D8XuB9GveXY5LijHW4SOuF5wA7mrSfa5i5udG5B+odF3YkMIYxGkkzO+dgtC4fky
         BGrV0TtOkU2RrcvK2w0KDgLQuLeqXsnMniwYzZop6SvKyzNuY7KtUNRRqFTxhe11YO5T
         Gg8fsq9gew9vPAbcE7huHr/AiRjPWq66Qc8Oftk/Z07o7wci/jl8MZQnphszW3B+abi4
         WutAQNSDFebplTc7MYiXzd589M2qIhKNpg/4T2PdjRuUKyfYt+16rAG4Fd4jHkkqWqC8
         JNjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791232099; x=1791836899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2lAdfxofOjXBbqsp0/iF1q0AKoAn+osrW0QUEeXjGUM=;
        b=Stv1Arl3LgmE+H0axXuMMhMBgz0yc6cxfJA5fuNk6vUJiJGZwuobhzy5B9Pn42IXq4
         Cyr4IRFVfsBfZxZ18xRy+ez94pR5l/0UnskZVRnln+98zuIfYDt/TTj/HAdx6bdifgyc
         UqhJ8q/DpR5JWCnmlsRM8yWkD0Vz8dzmmx7ccq7rk/K8qryw9ZjHXgmHz/bgVX2OvnKR
         5bzJt55qMQClw4oV947nQ6qbu6azgMVIzw3TK4RM8H6rSJckDInJKuWEr91RRiOYIUn2
         ba0pWxZyBwxujZIofCS/cx1CZVWk+Zf2QATQ0gB0UgXo28bdAcFBEB18S0cH5VETYHyW
         ot0A==
X-Forwarded-Encrypted: i=1; AKwUvByWYnfn1QSg3IxZiJG3gOeZyIoNq+YeK+eq6PpXkFFiGQarg45EUOYKn2gUuaNTBhaKA9W1IvQlwh6CD5xieobK@lists.infradead.org
X-Gm-Message-State: AFq9FYIzvtgFhQTPrlR2X6XBX52Wj+RV/enG2m8Obd9VHED78CiPWL3W
	rDkGIgZ6Yim3H7JUcv//gc1LyHpws8tQdt0MZAJ/4qFX8ovk09IeM/3F
X-Gm-Gg: AYBFou2pbRnb8lLp9MU5CbKLLlckgco96U2uhj5W41hjjxswqu7ZB0QyzB8X+lOXSFr
	Pu0f2Ar/BgJMI1QHgkChsOatMHGmsSA0Uw390WPQC6khINgbivpbgmp5xOlprswjBF1HHto0XQX
	6buQb9MXM/IVjjmfoFVKBnQTsb5GlkSpsxZLyd5iNrhNiHpAcmZg1jQR/anNYbKBAFHgDZIMVKq
	bopDiQ4gOPZiiSv/oXnx/AIYwZ/4W/SSrgG4qo1bMrfZrXOPg7u8VCJBBt8lceSTwRFjizTRDcF
	C1LrZ93WyM8+gKHnB4/l1/U2agqeWUuat1N/0W97AKcDduztPu+hDC8bCdw8blqRAjjXBauWoMA
	dF8Q+aFjdi29CxJNl09iuZK4r183OUrivP4f0UqjqG3T0O3SOCoyjKNWroaTkJkgfJvmySTODDv
	x95Nw+2yfT3qEBaAVfJrZTG4aAbAIbCFFCqliUNswWEIv3fUOpUVJFWZwsEXRfMuCCLCelyjLTS
	Q0yRWDz6T7ytGFQQ4k4SD1JG3pGQoclDg==
X-Received: by 2002:a05:6402:3905:b0:6ac:73f8:2e5a with SMTP id 4fb4d7f45d1cf-6af9e3002b7mr10742942a12.41.1791232099075;
        Mon, 05 Oct 2026 13:28:19 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb01e572asm3801024a12.13.2026.10.05.13.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 13:28:18 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v3 06/11] rtc: sun6i: add Allwinner B288 compatible
Date: Mon,  5 Oct 2026 21:27:26 +0100
Message-ID: <20261005202731.153971-7-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005202731.153971-1-pmazzini@gmail.com>
References: <20261005202731.153971-1-pmazzini@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_132821_057604_D18F63D8 
X-CRM114-Status: GOOD (  12.29  )
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

The driver only uses one alarm interrupt, so no functional change.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 drivers/rtc/rtc-sun6i.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
index 7fc60880e409..cd6ac5bb20cd 100644
--- a/drivers/rtc/rtc-sun6i.c
+++ b/drivers/rtc/rtc-sun6i.c
@@ -859,6 +859,7 @@ static int sun6i_rtc_probe(struct platform_device *pdev)
 static const struct of_device_id sun6i_rtc_dt_ids[] = {
 	{ .compatible = "allwinner,sun6i-a31-rtc" },
 	{ .compatible = "allwinner,sun8i-a23-rtc" },
+	{ .compatible = "allwinner,sun8i-b288-rtc" },
 	{ .compatible = "allwinner,sun8i-h3-rtc" },
 	{ .compatible = "allwinner,sun8i-r40-rtc" },
 	{ .compatible = "allwinner,sun8i-v3-rtc" },
-- 
2.52.0


