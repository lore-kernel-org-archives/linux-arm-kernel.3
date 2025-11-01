Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB2ACCFA00
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Nov 2025 13:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L9gbS+9LrLe7y4J6JOoi0YS3Bk4wJ8cYhZR5dEyxBSU=; b=UTm2XuOu8dtM3EjDwGHpOrTGyz
	GkBsD2F/oWzNQaESjAAfOZjSjFSUd3xffxzp3ElqYbmGZ9WsFQzGWTArdZEhiF6P4TsgMwA1nUOks
	j1m6M4s7pYfBbPhtNLVrda3d6wwHExcx6v2dw8+77TdUQyP9QP7PKq/3KlKnLstpjxsak36KJfh07
	kujrhpO3lrQSHysSsNf6rnOpBbbz0iDw1N8eQPvWHMm9MFSG57vsVotApnvqeotxN9KCObJr1U92O
	0LLsPDKL0POXlOymkB7eCVsQeKfavxYUBQOrcRax7wqqkY4vnQWEvyGrrdXh7umugXi/AJ55eavUr
	qfrtHALA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFBbs-00000007lfh-22Qx;
	Sat, 01 Nov 2025 13:25:36 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFBbp-00000007lfE-3igU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Nov 2025 13:25:35 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-475db4ad7e4so11475365e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Nov 2025 06:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762003531; x=1762608331; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L9gbS+9LrLe7y4J6JOoi0YS3Bk4wJ8cYhZR5dEyxBSU=;
        b=A0x+cStGTrhZHN2owxVi6Dx8V2Qz5XFz7kmGTYDZ3irsFa43TqwW1iefHFnUEAVpnx
         j5rh0sHOZwxXwubtdaZ/Q5UPIB1D3vlCLlxkgxpVel/Kmv1PHq9FQV24I2KNGuFZa7vf
         WgaZQFEILxDDneLMjjnOOHB/eqSPeUZQ4U5y2K1ZO7qVCZ9I6tNLc/SGsh9S4cvL0o+6
         VBKLiUwqqNUR7pF0QaCyAhxuBEBoml6BjosXqbxeYzn3j6dhgLIXgnUuoSW9pW6kyAdY
         ElprgxCpbDoFicprBt7KLHbWJCjdPK5M8XPm2Sb1+bK1lOmNSM99GSYZrapOxk8ND2EP
         ZG2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762003531; x=1762608331;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L9gbS+9LrLe7y4J6JOoi0YS3Bk4wJ8cYhZR5dEyxBSU=;
        b=QPpMDRHCFt23Nu5uuT1fWnH+xdKCPUqZloY2J9hx4RSxe+QEac05KXdUiFY36+pToV
         UDSmx2nhKL8H01ISnIvnoFdw6nOLNoM5pPuz6kEUiQXc6WESQ3QDnY/ADYLY+LqIEGJ0
         rPZdKEmzxbq00NER285VN4zy7q1Qp9zMGvvV5d2P9Eo38Sq1wUHUprvLaVbjn0EjWT9s
         N3GF2gxZbn1Fvld+XbmagvfF0VnqBdgv6ID9p4GY4gD8XV7ZhtZIvbAt/GWUzVZc5XI/
         ccfYcs1p0bWYIZwX0Nxm3hy5SyvZISRyL7PX0zTzUcbYJiqXayokkQcREONCKUttTycn
         oMWw==
X-Forwarded-Encrypted: i=1; AJvYcCX6RQE5+A4GQCaPjZFgU54REzMQtfP9NeN2LHRXP+wBU5ILaOVeVAkfx53tjNQmGZV7PfkSEDeJVEm1xh9BizIO@lists.infradead.org
X-Gm-Message-State: AOJu0Yx40KdIt+QcRYbS43LxFGaFYM7p3qvlhVLCIRJskHRoJjFPKuVj
	1W2z6kH0+sojWAcWv8YtWwMTHmR5QbHMhAk/KJaqWNI9gJP3OGgItLRG9z0ni9ND+6I=
X-Gm-Gg: ASbGncvO2cMcQdVZCgqPNMNn4BpYHaGRcSLR55c1p3DrK6VPbXH1ZcA4hymWysMtT22
	moNM2TCioGTdvoERorRERL+d32CAkGR+ZN4/M/sKOUzwJPOLRHjVNt94M+h6DHmquWV4oEg0xg6
	8TRivmCeguv1Io+eZ7KaiiCyXgPIZaC4rfBxWiVzYhAEaBXpfibW0waglnsuPxkgLC1XnthHpOq
	zwc8LoOu7VG1prxy93sbKhXEcEuRG8LsAKtRYq8wXYy7tZu7UooYz7ukCS08TOEsNadFU1Y5Ti6
	KZrDVjOw4GF47L7ntbNPIvwOQWZzbwebs20dKk1uAtkVjWSZiBA5H/uahPbwFd0uqbGOQ3+oaLn
	QtZgi8ym6LINoa92cYH5005xJRX1ldF+eZp6QxjehMOkKfFyrGPEvszXf8rFceeqziTsVihF/Ua
	Ygem9MJA==
X-Google-Smtp-Source: AGHT+IHfkE8YJK+hEniklXFT4GhX0FQkyrWL8TAH+8xEiRGBmRw2WAmAAnJ/Iz+FCPOhsKJuLyo9JQ==
X-Received: by 2002:a05:600c:1e19:b0:46e:711c:efeb with SMTP id 5b1f17b1804b1-477308aa8acmr60161545e9.25.1762003531066;
        Sat, 01 Nov 2025 06:25:31 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4773c48de65sm47854815e9.1.2025.11.01.06.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Nov 2025 06:25:30 -0700 (PDT)
Date: Sat, 1 Nov 2025 16:25:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Anson Huang <Anson.Huang@nxp.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] Input: imx_sc_key - Fix memory corruption on unload
Message-ID: <aQYKR75r2VMFJutT@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251101_062534_122093_5A131525 
X-CRM114-Status: GOOD (  14.80  )
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

This is supposed to be "priv" but we accidentally pass "&priv" which is
an address in the stack and so it will lead to memory corruption when
the imx_sc_key_action() function is called.  Remove the &.

Fixes: 768062fd1284 ("Input: imx_sc_key - use devm_add_action_or_reset() to handle all cleanups")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/input/keyboard/imx_sc_key.c | 2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/input/keyboard/imx_sc_key.c b/drivers/input/keyboard/imx_sc_key.c
index d18839f1f4f6..b620cd310cdb 100644
--- a/drivers/input/keyboard/imx_sc_key.c
+++ b/drivers/input/keyboard/imx_sc_key.c
@@ -158,7 +158,7 @@ static int imx_sc_key_probe(struct platform_device *pdev)
 		return error;
 	}
 
-	error = devm_add_action_or_reset(&pdev->dev, imx_sc_key_action, &priv);
+	error = devm_add_action_or_reset(&pdev->dev, imx_sc_key_action, priv);
 	if (error)
 		return error;
 
-- 
2.51.0


