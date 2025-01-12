Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D417CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jan 2025 13:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mRUu7xwt0GOb8hs+BKrBffaLbY4C8ptCLopKQNeTlgY=; b=X11aia/CG8J9KX4kPVb5wJYJBO
	Fp0Z4Aoobk+pyPiYI2lnoYXImkLLgJtjrjUuG2et9NzRd4qwgR5y9iE5RyxdeXKOAI5H4g33YELnz
	ClARcv1PG5GoZEvRAtbsEsqrbZCxRDWQQxRn4WRUaUckIy3/jHCQq2Rqz6+rd1VKhXtwQgupXPt+z
	b5qeqhITNrCS6D2A6VoNJLFIOsQn4t+JpPXoGPUYVppYjgFEP3MKYT8eL467m9UjPrxJRCz3t9PQt
	EBlVgoNA/Xn/bDB47MJjmT+1WHMrcCD7U963DvlaDAh86yjrKlUhMID+V55j6jjjRW+Ikes31Y3pB
	0wktiDIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWy7q-00000002mEP-0fcQ;
	Sun, 12 Jan 2025 13:35:34 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWy5N-00000002lbU-21Hj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jan 2025 13:33:02 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5d3c0bd1cc4so553414a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jan 2025 05:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736688780; x=1737293580; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mRUu7xwt0GOb8hs+BKrBffaLbY4C8ptCLopKQNeTlgY=;
        b=sSzTljRk4/Gtbg9nzcM5GWQe5t16jN+/Bs8obIOQoSw0Ai19jQHVZCbERuma5ErYac
         3mlUaeD/EAPN1z2+s+CxhA9xOsf2Wnyucfyy26VZCf7KkeF0Ux18CqklGY7I7R43kmzh
         ZlypLkveEXmUy/KcOWcJbbFcDBZYDVDQGBYefgF7KvtgND82RLiUUWzbPWehVx/qJmLx
         bJQvGvDqFWMOMqQycjDpgscdIbhrmfV7Da0ZeqgvZj7IoebVWI9iwwwbjaNZLjX3ge0p
         MDqLAzKWRVoRbj4YGYfBYM50d0qTZKXXrPo6cuIAmGvtl7CV/jz75bdjw34tJiuNu/Yk
         bDPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736688780; x=1737293580;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mRUu7xwt0GOb8hs+BKrBffaLbY4C8ptCLopKQNeTlgY=;
        b=BuVInpaLILnR1vMFiJ4cRPa1i01vonFj9NTK77OSjHndjbSu2pZmoQ6Y/h4JVCzB8n
         49LljdjxVfjNfGIeWiNZueeWS1lZfHToUUF0ewV4gwPbVxQAc2Itd506uEgmM9sLdFbG
         AKaGgeKES/ZMPCKWr5VFu4+tlqCBNzhIu7QxZgOBmhmDhZnlYm+DkzPa38DWl2XJ+bbc
         kRhoDSxC4Wuh/YRaKdyCH3PGwtmFfTb6l3bYpDgwcsuOq6sCf7nKQ29Laj0wj0R9qWcY
         LMlPzmgkbUXTOsxNDe9pNEjlp7kvQ/lU3mglhGVmpODRMedmMV/50b5YLlqppagsjQ6y
         10hg==
X-Gm-Message-State: AOJu0YwFxcntjfcbjYRA7x4/fBuh4KDbgy9E15DdZjuD4sIP/W56JvIs
	IHmyqd6jpJM0BtApOLofr6BnhtSxycAdGplLR86tEhCbOdEPcI+nWfbH35bYNGA=
X-Gm-Gg: ASbGnctQLbkBLUm4NYxie9k/LddP0ZsqtlyX2RVKytP70yuqonomt6lWT65QnZUAa1i
	bhpr2bTgIXU5dCnK5PJHB9grBfb7QC5K8W+1PLuQyjnsxA3vZ2FetPgX+R3zmnt7e278lSmv0wL
	1h1+YZDpm9l1TNe/NuQPEruAoACHbi7VxCpfaeqP9hz8CAHciQYWkTwJHZfee1EEvp51Dz75cnh
	E9zLFKryxRVZhzejTtah4Gs+S7v52WK3OtbZqbcDaD/wKqOv+yo/nLsGh+eW0fuCXqK0UA1
X-Google-Smtp-Source: AGHT+IHe7/2lTE7/Nj6QfvaBW+C/pcgDJDaV2DeHYFVEZqu1pr4HggBi1zI3dnd6icGke5g9aysmUg==
X-Received: by 2002:a05:6402:42ca:b0:5d0:eb6b:1a31 with SMTP id 4fb4d7f45d1cf-5d972e1eb67mr5915789a12.5.1736688780172;
        Sun, 12 Jan 2025 05:33:00 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d9903c4477sm3584609a12.51.2025.01.12.05.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 05:32:59 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 12 Jan 2025 14:32:43 +0100
Subject: [PATCH net-next 1/5] net: ti: icssg-prueth: Do not print physical
 memory addresses
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250112-syscon-phandle-args-net-v1-1-3423889935f7@linaro.org>
References: <20250112-syscon-phandle-args-net-v1-0-3423889935f7@linaro.org>
In-Reply-To: <20250112-syscon-phandle-args-net-v1-0-3423889935f7@linaro.org>
To: MD Danish Anwar <danishanwar@ti.com>, Roger Quadros <rogerq@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 imx@lists.linux.dev, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1232;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=/XBAGwsAFpwFBBQSU961+beyZLkCUNZ5sGTLi9rt57I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBng8SBqm1C6n54I2y3MlkXEqlfvD/rdrdWXja7l
 F8+5Is0j1KJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ4PEgQAKCRDBN2bmhouD
 17VVD/4qthD2/zGGxdy7/UvqcrbSUvelem2TFjP4otSbOQQWt2FoBYJM9pNa/ia4nDRzVPRxvWp
 AB684QLqy1jsKUV6CGPT3D+zER5yVvYN4twzngQrr02IRwqmYMGieUhT4C5lGveMXOBMmGa2mfU
 udJ4cuPGtlhH3fISl4u+3noNIZKMzIg3tNCkfvRsZDOAxAPyLpaePpjLMBYlgfahKqDSJJ3Ymly
 +xpGJ/hwDta2luGxIuxazAdQWU4lIeXdwHWgMBrdSensqJLq59XmNTDvSvGOYe6RhYYZEOGkBh+
 dowV/JQhEousq+sLQk8Vg6rJ20bAffXxCqMtmMMKK0iPtwmP7eeWQipA3SOUCyoWyqstPFDnJef
 WwaKd5jhJ6isWq6wImBLMXOke7etQoi8jD70/MBSBHYv5utAytgbAPEPSfrKdDyrDKanOHAS3Uw
 3qfAbOu3ld+3DGyNuxGR9gKUfogV69mX1twFMUXFg01h/7HOcmqFUu4qyW79JH9Fm5zJO/kIneA
 HbwYf3HvIrn7L1rWNCiZIli0eXsOgM6StdpoUZ9ty2Vp8tBg21cFVNlkY77/RG/d4ZAsx89Kw1p
 bp3xe0sin6kUFa1weHxNQaVneoV7PfrWRYHktdBkv66MzEVc9Yneu5Hxr8HS3MmFxNSjVv5cFp0
 Mqd3su6GpsWZLIQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_053301_526043_2EA2D868 
X-CRM114-Status: GOOD (  10.21  )
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

Debugging messages should not reveal anything about memory addresses.
This also solves arm compile test warnings:

  drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c:1034:49: error:
    format specifies type 'unsigned long long' but the argument has type 'phys_addr_t' (aka 'unsigned int') [-Werror,-Wformat]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c b/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c
index 3dc86397c367d2b195badcf1fcb5f1ef39ffabd6..64a19ff39562fa4a6ba6f7e9de903f689a3d5715 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c
@@ -1031,8 +1031,6 @@ static int prueth_probe(struct platform_device *pdev)
 						   (unsigned long)prueth->msmcram.va);
 	prueth->msmcram.size = msmc_ram_size;
 	memset_io(prueth->msmcram.va, 0, msmc_ram_size);
-	dev_dbg(dev, "sram: pa %llx va %p size %zx\n", prueth->msmcram.pa,
-		prueth->msmcram.va, prueth->msmcram.size);
 
 	prueth->iep0 = icss_iep_get_idx(np, 0);
 	if (IS_ERR(prueth->iep0)) {

-- 
2.43.0


