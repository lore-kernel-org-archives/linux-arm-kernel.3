Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95037F3D5ED
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 06:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g2/8bJbSlzsQgyqyE2qlsA0InSGRaqOGGPVG89RGKtg=; b=sm2hBNyF9rnO1kFXOql7mxsw4p
	sqNXHpJ2IU4OyjavzProBkSwuu/wCNeJ3WSTauqhSBt5lexbKill/zw1e4VvUtZjCi5YqaI3yPaXW
	G+bVe8XU0Yy3zSg5zrIqbsJpZYE/TtBAR4YNK8D1iLefTC94a3hm3DcvD+uBh5y0pLk7NNQJ1a2JK
	Q84AFHaYIyVIBiUW7i47ZBoQXOfaUK6raCh1NWGOcEPAVBThRUH/rejWKAow+Nd0i1eccfz5kYzaG
	hQ6rZFUsTLo4XOJ4EL9gQhuQqj5WSSHlLP2OUw+4FkVugPiZ7ieDRpM0osNZXO9U0tnsjWjl8/+99
	09mYSefg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6jY1-00000009dVY-0asT;
	Sun, 29 Mar 2026 06:22:57 +0000
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6jXu-00000009dSF-0BKB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 06:22:51 +0000
Received: by mail-ua1-x932.google.com with SMTP id a1e0cc1a2514c-951c5ac6253so974221241.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Mar 2026 23:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774765369; x=1775370169; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g2/8bJbSlzsQgyqyE2qlsA0InSGRaqOGGPVG89RGKtg=;
        b=lsTxii6FY9CVRtyHQrC2FLWxQKxW95l6C3H6gBkCq0Z77FFLaggQc3qwtX2VQ3kcaR
         +aDMIfJBc0yQQgnObMMSXKRJKPcPqAdAnEJUIFlql221NAY8esmXZDFZG1DLHRIjIpSq
         6/HllpjgEzJ3Jrr+R2mQn0/XDhxOXVy3UwYIT/8VlwmUE+0Oqp6DUZA92Olu2RuEJtzi
         Li6qL4pyqF8yzXRDWzTf/kHHZafKMk/EFZBSn8BCuY2yWzfqQ62H3OinaepY5LA0HmaE
         hqseUXadEZOZr+ewzG2l2WzBDuUTnjTkeMKDYP2CyQxPCRMq0jNH0/j/RBIXA0RN18Sq
         On1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774765369; x=1775370169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g2/8bJbSlzsQgyqyE2qlsA0InSGRaqOGGPVG89RGKtg=;
        b=rWaJVAUQlpOlMjbHV/MEAkzSazg9CsMcHsx6VEr4CdMu07uPtHO19QcQ4DkcyLpSjc
         gAp08WumAWoDigE6l9h6lXjIqvEEavmueMG5TAzGivixnFM/Fn903ifSZO9CZaC93XfK
         aimD3pBKhW0VsBvcEMntTLwp3XqVu9Ckz0Le4KtRericUERfzJeJV2uZRV4aXYesrxxJ
         IEyr2CYB6zxJnELj7naYIW1zjSL0PqiLlkzvP1i8cGgvNwb6qStGIw/pT6LUBvnWtS3I
         1cQCyAvMjqnhnssaGsXVDzIxy/24XDLFez7pdks/bUWHSptxw4RdLb1b/qIBeDa+6nc7
         +W7g==
X-Forwarded-Encrypted: i=1; AJvYcCXqa7U9KUp2eBI3/YW3vC0J2BibKQxaoCtDfs6KH9kv3qnU+jVwLTknyuFuZK8AKO4ccRz5Sm7gRMUgU/o3cWXG@lists.infradead.org
X-Gm-Message-State: AOJu0YwKGgC7Lt3YDy532JfRaRt7Ey9g/FRPnbTKUM0By59vzeslZQU0
	8Ksw/iPK2cge1kYZf6FToK5o1R+0U/32I4A3SN8i32Y7D987IZo3MRni
X-Gm-Gg: ATEYQzzAvQfqr+lnOz9Y5EkW4BKkT6CJICfgMm2fnVtkHV3ZhYQIKPhhNM6e8RjAyTS
	bWoy6yhltXIEg4JUp+Yl+kZuDS8Pf5gMWXVQujoYcavAAAxOyzr9VEb7Tf3YOVTWiUyVYKe6Hfi
	k7J9x51LO7Jo0gPtzcdKiAV8uyNdb6mvj38PwljunU4u4ErDVsgQTbo21aHUrXVtyGYc/Wn8g60
	BCAj0NO9Rg/XsPjBpbaxu4y9bTHZezhz1LhhaGUB37FtnW6nIb59vJpC8ODsW6V7FKjjp7j57au
	KCReIPF74M0EW52h/3ior9CdDcgnk/lZJOyrxc4EEa53u1S68SxgWu/78yVGhgerZhaCF2s519V
	OlfRw10534Gnj48GsLYROe6KV+WWm359/G6aVSe0OzGECgFtZPaZwoFh0Fm3oCZh5HKCevhZV03
	EU74w4aAEd6UnzpoFcO7ulcDUAzp7y4jpOS3E=
X-Received: by 2002:a05:6102:6053:b0:5f5:40ab:2d65 with SMTP id ada2fe7eead31-604f928bd10mr2726527137.22.1774765368828;
        Sat, 28 Mar 2026 23:22:48 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac6:d6db:aa::11:19a])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60512d3a037sm4475072137.9.2026.03.28.23.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 23:22:48 -0700 (PDT)
From: Sebastian Josue Alba Vives <sebasjosue84@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com,
	=?UTF-8?q?Sebasti=C3=A1n=20Alba=20Vives?= <sebasjosue84@gmail.com>
Subject: [PATCH 2/4] staging: vc04_services: vchiq-mmal: add buffer size check in inline_receive()
Date: Sun, 29 Mar 2026 00:21:12 -0600
Message-ID: <20260329062229.493430-3-sebasjosue84@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260329062229.493430-1-sebasjosue84@gmail.com>
References: <20260329062229.493430-1-sebasjosue84@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_232250_095491_AC29FAD2 
X-CRM114-Status: GOOD (  16.34  )
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

From: Sebastián Alba Vives <sebasjosue84@gmail.com>

inline_receive() copies payload data from a VCHIQ message into a
destination buffer using payload_in_message as the copy length, but
never validates that this length fits within the destination buffer
(msg_context->u.bulk.buffer->buffer_size).

While the caller validates payload_in_message <= MMAL_VC_SHORT_DATA
(128) to prevent overreading the source, the destination buffer may be
smaller than 128 bytes. This is inconsistent with bulk_receive() which
does check buffer_size before copying. A VideoCore GPU sending a short
inline payload to a smaller destination buffer would cause a heap buffer
overflow in kernel memory.

Add a bounds check against buffer_size and truncate the copy length if
it exceeds the destination capacity, matching the defensive pattern used
in bulk_receive().

Fixes: b18ee53ad297 ("staging: bcm2835: Break MMAL support out from camera")
Signed-off-by: Sebastián Alba Vives <sebasjosue84@gmail.com>
---
 .../vc04_services/vchiq-mmal/mmal-vchiq.c     | 20 ++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
index 4772126d7..e18471930 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
@@ -368,12 +368,26 @@ static int inline_receive(struct vchiq_mmal_instance *instance,
 			  struct mmal_msg *msg,
 			  struct mmal_msg_context *msg_context)
 {
+	u32 payload_len = msg->u.buffer_from_host.payload_in_message;
+
+	/*
+	 * Ensure the payload fits within the destination buffer.
+	 * The caller already validates payload_len <= MMAL_VC_SHORT_DATA
+	 * against the source, but the destination buffer may be smaller.
+	 * bulk_receive() performs this check; inline_receive() must too.
+	 */
+	if (payload_len > msg_context->u.bulk.buffer->buffer_size) {
+		payload_len = msg_context->u.bulk.buffer->buffer_size;
+		pr_warn("inline_receive: payload truncated (%u > %lu)\n",
+			msg->u.buffer_from_host.payload_in_message,
+			msg_context->u.bulk.buffer->buffer_size);
+	}
+
 	memcpy(msg_context->u.bulk.buffer->buffer,
 	       msg->u.buffer_from_host.short_data,
-	       msg->u.buffer_from_host.payload_in_message);
+	       payload_len);
 
-	msg_context->u.bulk.buffer_used =
-	    msg->u.buffer_from_host.payload_in_message;
+	msg_context->u.bulk.buffer_used = payload_len;
 
 	return 0;
 }
-- 
2.43.0


