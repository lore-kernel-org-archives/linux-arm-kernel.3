Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EFCA10F2865
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 22:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F49vcSE/rqoVB2cNUPw8hx4gbICx0wrJC2VwflfBWVE=; b=SKhP9SMpFTGDaFrhDz2Gjc1+RX
	FRhwsEQN1rLcTFRGaGrQ40dhyr/sdcVEroyBghZ0+AlyDN+Vjg94xB9Q5BNOd4ziDvdE4E/08EnlD
	O+GAo+kjkg3NXeQv+ted2iaokItDm+gNaaJcJslHm5Lr1BxdoV0Gw+fKfVuRFvAPAzrsUg6q7R7fD
	yECY3mDiqC4eEz2ZyGdnDlRn2BxVkyPEad3xugZMgUZ6AHe+pjB8m92gCdJFuXoaf5v7fj+wYpz9F
	pdm+mlEuP8OYiSwXGtIgwiEykGB39WoUEucmMO8CZsBcQnyEHRLRwpvvWBiD3vQon2P/mtasZFc3/
	0NC/Y55g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6FM3-00000008GX7-0udG;
	Fri, 27 Mar 2026 22:08:35 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6FM0-00000008GWl-2fC1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 22:08:34 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-439b9cf8cb5so2488360f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 15:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774649310; x=1775254110; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F49vcSE/rqoVB2cNUPw8hx4gbICx0wrJC2VwflfBWVE=;
        b=sT2PgnNom9fbMOVnJMoDRFNgd5Pq2dl60MK9I5r+/Iq3jmQIt3euo9jAqxHIWhCLFX
         xhi4Fs2K1t9ERDPGHJkS2M22PDCC91bhOnKwFIWHMTJZp0mN1/8PocHcl7DAU+GgNUpv
         T+ztnyPe8mXiFTYtmScc4aVZ0XdMbSuNdk7n2g3WBG3DOgnuKtaYs/zNlzLNeYMpBT3o
         q9RLUq6GbpzIB4QZ9gQhHpf8JCCCS87dL2fb8malrZM5Ndp2LElTsto9ffuX7cOb7lHc
         iXLSsQBn9d35CxiO1tA+GATlNUXVT6+vLVAv43vyxfvo8wnTcs1VRVetvmbpycxPC202
         UsCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774649310; x=1775254110;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F49vcSE/rqoVB2cNUPw8hx4gbICx0wrJC2VwflfBWVE=;
        b=ceJ6h3vyFwTKyUcuQ8s4QVUUC9jOEdX9vq08zkNjZ/gVgrXeJ0mnKBoAOmoTz4yma6
         FKTxomeIheTqeXb0F5q2s1GRHL/pwKQp9gjF+FCOAvqrI6KH0uJxqPbqfO+XF8Yv1Fd8
         ygiiaGjMDX3jmIlbwJ78ndLd8EE4sJV+mndyXDKfEK4DgSnGZzStsrsLxDDuqjpdbUMW
         QCkF7INf8wFrq8IWVVxcTd5OBDGgTl7guyatFu3jqpELOhQO2d2vZv1M8yzmWAXe7ca5
         yBmONZUk1v7g2aOKaZv0oVaSoSRelUkBLJ576TP6sT7prn2HzysJRVHjccC6M9X2M4ID
         u53Q==
X-Forwarded-Encrypted: i=1; AJvYcCXHQWH8y42tlqX4ytm9mTf2wZGaRPJHkWJOk6VWkeC2IjJ0aVaz+hf6BxcYoZjjud66zVAuE8fPaH2pmc5aHygu@lists.infradead.org
X-Gm-Message-State: AOJu0Yzh0AERxeJDnbtz+XWhbOL37KPWCR1X9aH6JcI8SL+h1bJvXKGa
	At8urXObKQ93nJRGBZmA1cu5qsOSAVMvwv6irYPTiZ2FYFlemTv7U0VN
X-Gm-Gg: ATEYQzyUyd7136JSm+p4SP7voeLjO1tVC6q8v17E78RzOE5t+RYUoGXPkBCaoBTuhWz
	Dd6dN7Wil5KwoEwhw9A7kyEbPsNyyIakeVHjUQenfVNdxsWtVJO+Z3pNsLsc747i/i2TVUI4seg
	irI10g748hWFjQsU8sqBVW5smBJ+gW47kseerk6DCtuFtsZB7GzSWMOvBtGX/Q1LCitO63Vr5zs
	54B2zzOhT8LR2lBs0dqnBaMxMRoRH72JgK95e01+Vs9dqITvsg7UeNQDECSmUMJLDEdo+jONGl3
	T0ymi6v9+cf5w5LjG/Vxxky8ArESnvL9FrQVPEmUctRNDN/dOEPt6r1zlKEMmmCGXSaFk+dhkBc
	huoDCdIbyFi+5/X1TLsJJrP/ii3e8nLIt5/mnWgFWuPFTUjRo3fbQd8YOn5TJRAxILBeuE7MItx
	T5tzAmWRUEZNL6cYhyZRnqv/TcMpVxrUy4dvMXH3LBr4FLdx8XMgCVDYwFefefFyE/zv1O6idDP
	H6AOKoldLRk
X-Received: by 2002:adf:f14a:0:b0:43c:f257:c6fc with SMTP id ffacd0b85a97d-43cf257c851mr576318f8f.10.1774649310249;
        Fri, 27 Mar 2026 15:08:30 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf245e4b9sm898900f8f.20.2026.03.27.15.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 15:08:29 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: eajames@linux.ibm.com,
	mchehab@kernel.org
Cc: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	hverkuil@kernel.org,
	linux-media@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH] media: aspeed: fix missing of_reserved_mem_device_release() on probe failure
Date: Fri, 27 Mar 2026 22:08:27 +0000
Message-ID: <20260327220827.266556-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_150833_452673_86AF90B2 
X-CRM114-Status: GOOD (  11.70  )
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

aspeed_video_init() calls of_reserved_mem_device_init() to associate
reserved memory regions with the device. When aspeed_video_setup_video()
subsequently fails in aspeed_video_probe(), the error path frees the
JPEG buffer and unprepares the clocks but does not release the reserved
memory association, leaking the rmem_assigned_device entry on the global
list.

The normal remove path already calls of_reserved_mem_device_release()
correctly; only the probe error path was missing it.

Add the missing of_reserved_mem_device_release() call to the
aspeed_video_setup_video() failure cleanup.

Fixes: d2b4387f3bdf ("media: aspeed: Add Aspeed Video Engine driver")
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 drivers/media/platform/aspeed/aspeed-video.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/aspeed/aspeed-video.c b/drivers/media/platform/aspeed/aspeed-video.c
index 41cb96f60110..a292275f6b7b 100644
--- a/drivers/media/platform/aspeed/aspeed-video.c
+++ b/drivers/media/platform/aspeed/aspeed-video.c
@@ -2343,6 +2343,7 @@ static int aspeed_video_probe(struct platform_device *pdev)
 	rc = aspeed_video_setup_video(video);
 	if (rc) {
 		aspeed_video_free_buf(video, &video->jpeg);
+		of_reserved_mem_device_release(&pdev->dev);
 		clk_unprepare(video->vclk);
 		clk_unprepare(video->eclk);
 		return rc;
-- 
2.53.0


