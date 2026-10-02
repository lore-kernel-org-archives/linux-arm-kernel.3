Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E45BCA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 04:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qUvdgCKkROCjP349zxT7t9Uo7jvFeQ+8hplckcwjOaA=; b=02JRVjf/gHSI5nnxNJ9h7qpsgE
	NHLgDZyLpK2p2U4bOXTUYMIYNDSIthlSgpf2KL4Bx5Nwu+NZO1w0qYl+n1rFfweUIGZs1DUZXbmgf
	nRMkNlhxEdqa43EbWEok0vqpcwtWA5mszpujH3cGS4BgEJV6VqgQjxVn6n0deKFbAuecnOsS4JIL8
	WlDNQboAnhW4UM6UjqXJn1PBdi4Rdb5fs2jiS2QwNrmlRlQp98ygTrT6WvCaACCkQuOSEJF59DsEd
	28JGtnbT8HQ2yH2knRWrSLwXY9KBtsQaro1V+cn8mcQzZzFdbRMXkggZpI41Uf6TLZd6EEs7hinvh
	3141DeUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCV3i-0000000AcAr-1ZDA;
	Fri, 02 Oct 2026 04:39:46 +0000
Received: from mail-pj2-x2a.google.com ([2607:f8b0:4864:39::2a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCV3f-0000000Ac8x-2c6z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 04:39:44 +0000
Received: by mail-pj2-x2a.google.com with SMTP id d9443c01a7336-2e2d9fdf798so14676135ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 21:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790915983; x=1791520783; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qUvdgCKkROCjP349zxT7t9Uo7jvFeQ+8hplckcwjOaA=;
        b=J+/HmPDRyJQzyQroYglAAlD+qC0rc8UwqwgXcV5kHekkScXo3msmdN9QWaIl1PFCHI
         9vI1GaxHacOU6+pe7BOIwuUNlVNKcOMRMnvfzEDh8QoZhbyuRvi7xo75KZGuuWGf/5jx
         Vi/lQ+WWf+DKjJrLeM6Dq85QmMiDZdG6ynUbL1UmAkFm50ykXV9nBSTGKSs19vJA9rpi
         4AjdCJ1phkNOOlirTlKLAq01APcBt0IACG3tm3Bcqz5s+4h953H1u0FMHCuEp39umyBh
         wBRQoKG6quAUxXFK0G7X/dPQaowAOZsEmppqHLP7WtGdeQLuzq3g2zKu3kjE9Xl7EewA
         YuJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790915983; x=1791520783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qUvdgCKkROCjP349zxT7t9Uo7jvFeQ+8hplckcwjOaA=;
        b=Jn1HEaR0PERkm9qhNCbnez09Jkl5MKs0V/byZ+QzBAnlWyFxGg08gLk7AcDSgGsXO8
         RSlikdk6ykitoqNv4fLQBNXoA+74zayiHfOzTIBO2j06SsUgivx+MZAckZLfc8VqGMzg
         FtipTySDqoeDGl0UtkR2Lzsj3DEaVbHylkh/oyu4wXCJm21JAX8KA7rVCtrPUGHfZ8I/
         wwkf84CUOJs7zRQ9/fb8YC9Q8oH3W3iNvazP/voDV2/Jd7o9T32CCoKZPB1xBdV5Gbzt
         Pbatu723V3oUOnrbv4Hsn3dbhiu5Z4XPUkkCZB4OE0yliO1CZMoNT0OltP1UELZzRx9X
         U4Ow==
X-Forwarded-Encrypted: i=1; AKwUvBzQLrsHn8cEkkx5kgkrzXOH7xHLiHiUTUNkkbSGCFJd7CqUzCVdIvSBGnMRHBzDw7yc2709B9DFj0+lU9ryJ7p2@lists.infradead.org
X-Gm-Message-State: AFuF++mwGY5B1TqD+dBOx1/KdbqVl25+ih0mAX8XoWUNBjHCRcUxmVg8
	8PBvLLzJJ/P+qhbxCoJX+2I7RBnMPBVfWI3T5V9rdheiR/3TVHxJRpAR
X-Gm-Gg: AYBFou24kRd94CvMEODtYeEcitIIM8Vr7XoY4HQwL1P/IaZnLdUjbkHEZeZfMdKx2NR
	H2q0qKnJZ8094+knK57qtkl7BFsLBfQX36aUwM+RdPnt9QVKAvEI2zPNJUyKLzl9GyupMUfX7lw
	BUFJdMwI+bd3eF9Qae3olFVGE2Wast2KeYr4S9A9BRvr2SDeDJX8GzXxkuaVTq5icMHitPs2ped
	tEo5Esj6vyztzCIkKAl8fmxBfFIb66DJXILyaaijw+y7Ax2tmfN5nHR7xYiLR6BeB0Ccf9W7CyF
	XtNXNooSoAHl1xzAvbYzL2hWIeGEq8K2ODpPkjxcC3643+h4a2MFkd0xGWGgss7eWaAWQss+Jm9
	JU61MwR4R+XsxrmxBWyG3NnRa4wWq/W2VoRjvf9qP0GTMI0ckhIVVwNDrhzPbWL62spE3fEBFMu
	IK6KAMYzebPkWjt+IiIIdkMDMVU6gK92ba/TC4nebr8z+DsesF5/EgY+mSj6pwnZLcON/pldpxV
	kc8yHVzk4L7AxyfX+hEjfBfV1E3widXGZ/FWnkOZPnRzAGXJyh4R4WIIqmOI1TYm5ZqQQERjp+U
	Ny+2vAvaZfGLGg==
X-Received: by 2002:a17:903:1d2:b0:2e1:24ec:df50 with SMTP id d9443c01a7336-2e49b652192mr13098135ad.21.1790915982554;
        Thu, 01 Oct 2026 21:39:42 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f67c413sm3713985ad.20.2026.10.01.21.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 21:39:42 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	Cyrille Pitchen <cyrille.pitchen@atmel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 5/5] ASoC: atmel-i2s: remove redundant error message
Date: Fri,  2 Oct 2026 11:38:56 +0700
Message-ID: <20261002043856.97295-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002043856.97295-1-phucduc.bui@gmail.com>
References: <20261002043856.97295-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_213943_670078_185C55DB 
X-CRM114-Status: GOOD (  11.61  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

The errors handled here are already reported by the called functions,
either directly or deeper in the call chain. Therefore, the additional
dev_err() call is redundant and can be removed.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/atmel-i2s.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/atmel/atmel-i2s.c b/sound/soc/atmel/atmel-i2s.c
index 9b651eb4f0a4..e1d8af056234 100644
--- a/sound/soc/atmel/atmel-i2s.c
+++ b/sound/soc/atmel/atmel-i2s.c
@@ -699,7 +699,6 @@ static int atmel_i2s_probe(struct platform_device *pdev)
 					      &atmel_i2s_component,
 					      &atmel_i2s_dai, 1);
 	if (err) {
-		dev_err(&pdev->dev, "failed to register DAI: %d\n", err);
 		clk_disable_unprepare(dev->pclk);
 		return err;
 	}
@@ -714,7 +713,6 @@ static int atmel_i2s_probe(struct platform_device *pdev)
 		pcm_flags |= SND_DMAENGINE_PCM_FLAG_HALF_DUPLEX;
 	err = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, pcm_flags);
 	if (err) {
-		dev_err(&pdev->dev, "failed to register PCM: %d\n", err);
 		clk_disable_unprepare(dev->pclk);
 		return err;
 	}
-- 
2.43.0


