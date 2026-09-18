Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED79C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 13:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xTtOVPmjJhEY4Y5vNG5Ynui/aIBMd7EqZyB7db6fqik=; b=QzOd5DAqCH9YU0vbYiH4bsoqYs
	Vm6UduUPpysmhKuSIwBT6bdy6R4UGJNZgd6TY3Db1jYJUyDApavZVJuI4wD6Sxv+7rha8NTS/FRDx
	t56vRB/XlqRG0FCGCjctTyZ+s6UOuiUM8O/GzmXFCoSk19P++LtEtZK61M/yQGpwhpPk4bpdMHtC7
	J0o+rsJG/xMSR/2TdtlYoQnUV7SSEKFsXEoXkMef0Yp3I5akv4lI+pYAZdNI6U/gWgYM1RQML/M5f
	kpaCGmrapYNGCqBkz4Dns7mlNHcpPNzjLC0WI3ml+XcsVCsDUpr3grwPZ63+m6ymdFduTI4FOSIsf
	8ad7UXTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7YHy-0000000ERK1-2nf2;
	Fri, 18 Sep 2026 13:06:02 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7YHv-0000000ERIg-3BPC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 13:06:01 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e6b885ef8so4265245e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 06:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789736757; x=1790341557; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xTtOVPmjJhEY4Y5vNG5Ynui/aIBMd7EqZyB7db6fqik=;
        b=cqmQHzbkymjXwvWdRWNv7fXu/4Iw686A2ssMjiRKAx1OjnbpXqDNt7VeUnJdJYFqtR
         ixi0onXey87xLiPMHhj7YbTlXQh0+v/grMkJFzT0gw4zqo7b2uUBIj3JLHcuTA8xSYq5
         j8Tkfmk0mLr79QAo6nZYawctR2TusF4C5Us55iGvWaHPBr9jKEzTVM2WnBiYKF3HW6Tt
         a+25j/MlvH2Cu4ezR0CgcAuFSmn8BwpoBPPoDkkiMfNppwqGdbSYZR5rcZO4xplSLnpa
         L1wBCkB1Wk50Vum4cVufEvahcg/2FlS0tSLel7KeWKvp9DJG9sq9S3RF4qT8Ue6OjHjF
         apGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789736757; x=1790341557;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xTtOVPmjJhEY4Y5vNG5Ynui/aIBMd7EqZyB7db6fqik=;
        b=JVXRJqoVml55+Hr9CTTU00lWsRwudYlIKNg4h5TwZ8yNa6r2DebDM19BkFoi1Zz94d
         dmD2p7XRAwF1Hyjef5vrPMfYMb6N3KI97VpF3/Q2Ax9Jgt/miZGuuzTTLOI3re2fzsV2
         jmpF/0YwvHsSKNZUofTpyQQ3kh9LwQ2R8/4rcQHh+DTlui/UkF6VWPUW7pIGHolBxBgx
         QaR3iZGMvx+c45kvCCw3arBR8KCO7Df4MGBD29J4ebaXZTzDUoUARMzQZlKS+0iNcdBC
         SEFWS0YfGUKEB3r9uOOnnCuUylnfTpA/wCN2L6fI3BT45V7XAY2hiee0IiWekKn4LmJj
         sXeA==
X-Forwarded-Encrypted: i=1; AKwUvBxeq59h40FmjeBdUi99nGR4xlGlazMqzdZY9cazKbMHCLiSbzHsjm9NIfUymubcRJuiWLg30SvKynBep6DJnlIK@lists.infradead.org
X-Gm-Message-State: AFuF++lQuFvAYzjL8h6Z2QoGgXRsqkkTxwAzjs5TDgSRZAzqsUWBE0Pk
	qHCQ0OceGLRLlYIyoZuxCgarZx7t0IcUuPRln2rNlnuU3tGItJay5zgc
X-Gm-Gg: AYBFou1MX1YNESpDgmwfOEJRW85g3F1B+LNpGmC7yJ1GuPXeGPD9aaQfLfe0FzO5pXw
	+Al914ijGujZEr5ZAzsMPYNjiJI5Ji4mz5zFDSQbRJNX6W5UMMk10iEPw5YtqkQiLf0UFj/DVtT
	KXD0TzU4Fxy1KM7XONq292Jh1S3SiG1I2wMxpqbm4xC1CymzAezG8WRZsicNLYVM8pFrj5Iu42+
	ExoSSsCFyg5+hxBQAKdEgybo8Dqcm0+Fl2RFmdFBa92cGEIJqKhg4zFVi6U767T42sUCTr5rnke
	BHb9OyCEsV5s5u+x8HXsftoiGAWgcGMN8oQrG/LzNde3YkjeJ6eQ7C65NjLtBK6ZILe0sbGjCzT
	p1qllq6tAai3227ixf4RU3YoAu5AtqYKou3H4ZN62GVuzzKIHXblGwP/fsDlYcN71YmXTgHYEDG
	8CEjx2DUQ6eErCiDg0EAzC45bmBChq6UGD8zu6DzPSDM7g5XOnyTd9P3LQ46fZrahyrdBkN3GyD
	Xbc0oPPzrI+AbC6ZxjDJCBI++J8TYPEdQW0gqrT1p8HjLw+UjQdw2p8cA==
X-Received: by 2002:a05:600c:19c6:b0:49c:f4e1:4c2d with SMTP id 5b1f17b1804b1-49fc5741239mr34035075e9.16.1789736757294;
        Fri, 18 Sep 2026 06:05:57 -0700 (PDT)
Received: from [127.0.1.1] (lmontsouris-656-1-83-121.w82-127.abo.wanadoo.fr. [82.127.110.121])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc7ce0050sm64995715e9.4.2026.09.18.06.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:05:56 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Date: Fri, 18 Sep 2026 15:05:40 +0200
Subject: [PATCH] media: rockchip: rkcif: convert timeout to
 secs_to_jiffies()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-rkcif-secs-to-jiffies-v1-1-110f336750b0@gmail.com>
X-B4-Tracking: v=1; b=H4sIACM3rWoC/yXMQQ5EQBBA0atIrVWihR7tKmJBT5UpkyBdiETcX
 c9YvsX/JygFIYU6OSHQLirzFGHSBPynmwZCeUdDnuU2c6bC8PXCqOQV1xlHYY45mt5VnbOFLfk
 FsV0CsRz/b9M+1q0fya+/GVzXDcQtwll5AAAA
X-Change-ID: 20260918-rkcif-secs-to-jiffies-1b98a96465f7
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Amin Gattout <amin.gattout@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789736756; l=1003;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=kPgx4cLfFtyea67NwR3E633DUHHI/gx0j+1j/jnDfgM=;
 b=pggsFLR06h1pcvdC/nqDIW9ExWwe/rpDAtuNuj4ftZ2dnTT7yl+yPfCBCZSNWi7x/a3d2+q9F
 RJ1IywmT/tFAYuO0IGq4I2KX34bi0eW6c7CxgTnUEabgIXNiscn45mw
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=MSIqDPkCOkwtyP8Fns1m+KFU9SgqoDl2mpLe18vL+hQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_060559_820430_D94EC9AA 
X-CRM114-Status: GOOD (  11.41  )
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

Use secs_to_jiffies() to simplify the code.

Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
---
 drivers/media/platform/rockchip/rkcif/rkcif-stream.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
index 3130d420ad55..f82eaf9a37d1 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
@@ -314,7 +314,7 @@ static void rkcif_stream_stop_streaming(struct vb2_queue *queue)
 
 	stream->stopping = true;
 	ret = wait_event_timeout(stream->wq_stopped, !stream->stopping,
-				 msecs_to_jiffies(1000));
+				 secs_to_jiffies(1));
 
 	if (!ret && stream->stop_streaming)
 		stream->stop_streaming(stream);

---
base-commit: 238650ef6c7c7cca08e032527329424c9fbd70e5
change-id: 20260918-rkcif-secs-to-jiffies-1b98a96465f7

Best regards,
--  
Amin Gattout <amin.gattout@gmail.com>


