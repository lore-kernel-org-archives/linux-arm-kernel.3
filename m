Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3062CF45D4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 01:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0EgIhIloE/N1n62OU17JhUeFzVsTf3TjVmSzCNe2pz8=; b=xiPzvK34u3+0KkGvnKIxvyYUgR
	p/g1GUpDR0aBYkZ08lrby4mbxdyTbKAdvIoNkFVcrwqSGTBJZjfxBpzUsqUIJ9uCVDxL5Yas+MGVC
	dhDOYtpBCkW3vfi5l+we9Nf1WV3ZkuOWQzmuO0Vp4R00m5T9hM8TylrDK+SnY7QK8nUccohVUpZzU
	uPJSmsBEmrGDS69GyeLfy9OXOhQJNCowF/b111QmULGlryayRUybM8fAozGMobwg0d4hGAicVHKJ6
	sTiXnUSbAHTzOv+KHQHEm3kRwqgghbdXhUuj+RJcVAV9gKfabru7zLVGqXuOVNHAfLAsY1rDhsmcF
	itJqNu5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfTAi-00000006NxY-0y8v;
	Tue, 13 Jan 2026 01:26:12 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfTAg-00000006Nwv-0hwY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 01:26:11 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-34e90f7b49cso4086518a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 17:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768267569; x=1768872369; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0EgIhIloE/N1n62OU17JhUeFzVsTf3TjVmSzCNe2pz8=;
        b=UWxfaNPlq+giLDyd5Y2Npc91o+UDoNZpG9SQgZTw00DN32b7aeWlyGBeLRAcgvh8Av
         MYpBEOpA32AUrdrxIl4Y2dWRE8GA8CeygWwRw7i/U1Tz6QyrmcIkumBvPuE/iBAMtLOu
         5cIjUk+AGJBwsscPOjnTUBaasioCmBUTmjXojxGhOmwP4G1P9lWfX5/hxi38V3/Co8A6
         3HbA9L14Cy8x7k7X7PSunM5Y0J5LkiJn0SdhKT7iqaqu/SGFSFl3pPT0PL1KlCNPf0X/
         B1rFGHLl0rmEEMr4+cS8CHxrGHxF/jnV4Np/tXLeQ7LQ3Q5puRnRPC+fc9wnu+2aFHoC
         Z3gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768267569; x=1768872369;
        h=message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0EgIhIloE/N1n62OU17JhUeFzVsTf3TjVmSzCNe2pz8=;
        b=DMXyKPZBYafuOHzi/xej0X/40bKcteWxBfZPGyGWuBwFJ6X6sNYxoioEgzUSZ3O+m0
         f1TK0RKOG5DG+H91OV3yx6v7pKDCafmgwEzv6PFxE2HKfcY3mKGojUzCAtwKrax2g4li
         OxrKugnAjPH+KN7n8J47SYKV2YVx5ejK9W8yZoaCtA1hxioXssPAdVWLVVJz9EvI5qRk
         5eW8ZzrIZ6mfsEoeqRME6oiY9tOB+bEFYpL4jp65kGZBut5s6K8zBb1fsO89Kr4aoUPJ
         5cFdsDFuMrQTccl4UIL1w5YRI4QtY9l76tfi6nAlYvTGteQroK1+uSsDlVLvYA09jrwy
         XWJw==
X-Forwarded-Encrypted: i=1; AJvYcCW2emnVi8RGHnafmTxJTyor/uh2XMaeHPEg+PrNfGTmsfZD6ebKkd/cpHOpo7g9REjYRQ2TtyLITPZ71beVCpUo@lists.infradead.org
X-Gm-Message-State: AOJu0YwIdmgzZ0eVv08eX3cpAv+GG+EQxPSgB+EBBcU9ur3zIozpEuql
	tzM9rp9QTMgGn5J+J/nMMix4VlcC84uYUx0SK7QktIgBaCSzSdthKNqH
X-Gm-Gg: AY/fxX6m5Cd9xze+YB/k7ygfiRHSewqgq7sqdBFgagrvyIZVW8x+m3GC8hel/QguoUd
	5AAnKQknNfiCk2qy73xlvZ4A0TODDdREoGVc+N1jt6Nln9D8p9kktqxbBpFSgdvfueXZlj1dPbD
	4ULzVHuO3sf0ETVHkD1bWdL6MFb6QOaCybKF7imHXlYYA4Rgz+H7b/NkcjDVKZkK9y8nqM6/cSK
	5MSlnQojI4htLikDpqWNM1IoI+ov/+Fy7r/VgcJYHD+UBqnAnBsp38exm31vYjs7RyZQTNv6bzY
	g47XdKzzRiGscwHbzEhqiKwnA5JcXYbf/alw7hY8P0356X1Qhl3Kdb5UEI81g0dHm3YA7OtmpE2
	dGFTgA+eYUgn1jS70tz9R1dHAKpdh7iKPq7Gv0ymEzx3RQCB4My+zJCK3X4zDs2MMERhkyE9KTA
	L/MgMf/FQ=
X-Google-Smtp-Source: AGHT+IEntXnjRLs33fTPcuWIB9pCaJyDMLX3lGUH732c23QJBf8RP/3jseGvl9j1QcWwJIm0HDrGDw==
X-Received: by 2002:a17:90b:2f90:b0:34e:5516:6655 with SMTP id 98e67ed59e1d1-34f68c4f92bmr16964903a91.9.1768267568909;
        Mon, 12 Jan 2026 17:26:08 -0800 (PST)
Received: from localhost.localdomain ([47.82.78.41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5fb64bfesm18688677a91.9.2026.01.12.17.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 17:26:08 -0800 (PST)
From: Nick Xie <xieqinick@gmail.com>
X-Google-Original-From: Nick Xie <nick@khadas.com>
To: neil.armstrong@linaro.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: nick@khadas.com
Subject: [PATCH] soc: amlogic: meson-gx-socinfo: add new SoC id for S905Y4
Date: Tue, 13 Jan 2026 09:25:27 +0800
Message-Id: <20260113012527.40725-1-nick@khadas.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_172610_230257_9C7A5CDA 
X-CRM114-Status: UNSURE (   9.53  )
X-CRM114-Notice: Please train this message.
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

Add new definition for Amlogic S4 S905Y4.

Signed-off-by: Nick Xie <nick@khadas.com>
---
 drivers/soc/amlogic/meson-gx-socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/amlogic/meson-gx-socinfo.c b/drivers/soc/amlogic/meson-gx-socinfo.c
index 2a54ca43cd13e..dcb75baaff247 100644
--- a/drivers/soc/amlogic/meson-gx-socinfo.c
+++ b/drivers/soc/amlogic/meson-gx-socinfo.c
@@ -85,6 +85,7 @@ static const struct meson_gx_package_id {
 	{ "S905D3", 0x2b, 0x30, 0x3f },
 	{ "A113L", 0x2c, 0x0, 0xf8 },
 	{ "S805X2", 0x37, 0x2, 0xf },
+	{ "S905Y4", 0x37, 0x3, 0xf },
 	{ "C308L", 0x3d, 0x1, 0xf },
 	{ "A311D2", 0x36, 0x1, 0xf },
 	{ "A113X2", 0x3c, 0x1, 0xf },
-- 
2.34.1


