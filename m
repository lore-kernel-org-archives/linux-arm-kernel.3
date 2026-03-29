Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F9BF3D5F4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 07:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=toe9kpqOLmbJqv5wMH+Pbc9jMDhi/6HRl6vvRfImJyA=; b=rUjCpXkXI4DgCaFBw4CU5lsYQ/
	W9hOo+20pjtfVd1kVz73jiL5TAYUhu1uk3bB6rOOGpZcZlJ+FxzDqLy9Ns1ogC/jeK2kTzicN0CHD
	2nW1xwIuKrbjQMnfDijK8C2TLIKQqSBmdnzzi3TCe1Jl2QdG66RE7KJ6BqriZn5AazXAm9NEbmfna
	ZibB/teblg/CMeuhOOvtjHjzi3hQl5VEQwjWgE3MsYpV1w4yIc5xA7aV1Dwl1cmSyYAnaXAEDLWy2
	ZaAeyhF6eVjL6anQdNYu8B3bbFDIj+i31KezfGIK1j24Ggs+5IZp7a87G+UPjHL240N8slKSgFLlP
	+ixRCwfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6kO2-00000009giu-1L5O;
	Sun, 29 Mar 2026 07:16:42 +0000
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6kNw-00000009gfe-0A41
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 07:16:37 +0000
Received: by mail-ua1-x92f.google.com with SMTP id a1e0cc1a2514c-9519e97c01aso906721241.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Mar 2026 00:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774768595; x=1775373395; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=toe9kpqOLmbJqv5wMH+Pbc9jMDhi/6HRl6vvRfImJyA=;
        b=TqgBjqp8K5nwGUjYxlAr3UHWr0ojZPduvYlzydTQxm9a6q0NaxmX0rm/vZqZc8/RAS
         4pFdZ4C+3+Xj4QoX3S2rAtJVvbqx52/cLXwoPkUzLvBZQte27elbospv/iPoHO2/WcMe
         2N9g9JwYQqso/H730QGxDVoJc3mRbFRxmPQYFA/lAHAsq+lielO81K16cck0XhvOsdB7
         FBbg/kfcxwi6hd6ZCDvzlk5iy1m/FbDqgp3b9B3sA3ToAGVZ2nv/mu081ZMBGgLiLkkR
         /1gexljqbbNI+8VnhPP39wmuipMWqHoR7mLvGwKmcBQhh90X/wowkLarolzl+wAC8BF3
         Z+Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774768595; x=1775373395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=toe9kpqOLmbJqv5wMH+Pbc9jMDhi/6HRl6vvRfImJyA=;
        b=kRSVaNGyYVwgR9HnOQ5Fav4LbUfRqRP92PSuanhWYr+MqAXer+pBx+AKpQis8yiJ3C
         cfqVPInRRMtmX3YxU/3+O8+ZFjgG288WSM/W3194yEHl6mANmgvhV5sKdkhYXU3Qn4b2
         IJJP6pJS2CqMAo+AbrsQuRzs6BMOz6qA8D2uesd4k8TpbtEg6R09lUQ5NGIaqAHyAnVP
         y0tbzGpAJs/1dHkM+sRwNZRMbJWm7pCU7MoNUUdJxTvI0bPtcpWsHp5NLu6y7arO/hsq
         Ny6e84faJ5rmjVpQdXQyu9lpMWWYynVtv5ClMYcZmbNyBPTlTvDu/o1lJ9ZtTwEih9Kz
         4VQg==
X-Forwarded-Encrypted: i=1; AJvYcCXIZDUNOqzvKsliNTYJaHt4MUP7cZBM1af04M1NlB00g3j5cgxAQYj8EdLaI629zfUIpUBahfz7Qt9cGAtevnOB@lists.infradead.org
X-Gm-Message-State: AOJu0YxnsCGVYXYkpHLR5vmrhMRNr6zaCfSaXrhZxRnAosjXE/tbpnEP
	fe4izwQDqsQItzJvzvKDLJgBpakasT+QQbHwriW6zoelOvMPkbQiBisF
X-Gm-Gg: ATEYQzxVgB7MrEtOdtzfTM5U7VukgdHLGJzNpGL3bdqEm1AdsmIQMr7tuC+UUFCqK/q
	yDjWf0Dmdgb/WRq8FKLopxZYaJYd/NC9DTVCRjSzmrOE4xRradMvmaHQGvi/ac5fL4agZgnAzEx
	x6TGnGLAe3y5YmNS7kuTarWLzAPYBTWhJKxEHcuOpQiEjARLOH7FzebD/FjqjFTn8up6Iem+oPe
	WqmG3Rfjlw/X91lIGXR1tORdROqFHnVY8cdc2BnAeH9HN6xMlWCF5+kwnGnj9dehOx1/KzPTQ2c
	e/rN8ZXH813oNC6uED0Rh7cSS2JRYiZiGaMbo+Pa9qmEweT2o54L3dQutKBynpumlwf80sd5HhP
	p1gqZjLwvBPn3mPZZre4ek+KCPxVUkvE+R2MZA0ZK0C+crauDrl9lGTT8bEEP+CJu0GOHWWJ0k5
	+urHDDSkxOBahntjgDO/f9cpQc
X-Received: by 2002:a67:e111:0:b0:5ff:2426:94ed with SMTP id ada2fe7eead31-604f92960edmr3008410137.28.1774768594732;
        Sun, 29 Mar 2026 00:16:34 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac6:d6df:aa::11:19a])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60512a5afa9sm4390638137.6.2026.03.29.00.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 00:16:34 -0700 (PDT)
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
	=?UTF-8?q?Sebasti=C3=A1n=20Alba=20Vives?= <sebasjosue84@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 2/4] staging: vc04_services: vchiq-mmal: add buffer size check in inline_receive()
Date: Sun, 29 Mar 2026 01:15:40 -0600
Message-ID: <20260329071616.507876-3-sebasjosue84@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260329071616.507876-1-sebasjosue84@gmail.com>
References: <20260329062229.493430-1-sebasjosue84@gmail.com>
 <20260329071616.507876-1-sebasjosue84@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_001636_204207_2C0F31A7 
X-CRM114-Status: GOOD (  15.47  )
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
does check buffer_size before copying.

Add a bounds check against buffer_size and truncate the copy length if
it exceeds the destination capacity, matching the defensive pattern used
in bulk_receive(). Use pr_warn_ratelimited() for the truncation warning.

Cc: stable@vger.kernel.org
Fixes: b18ee53ad297 ("staging: bcm2835: Break MMAL support out from camera")
Signed-off-by: Sebastián Alba Vives <sebasjosue84@gmail.com>
---
 .../vc04_services/vchiq-mmal/mmal-vchiq.c     | 20 ++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
index 9c6533f82..44e5246f1 100644
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
+		pr_warn_ratelimited("inline_receive: payload truncated (%u > %lu)\n",
+				    msg->u.buffer_from_host.payload_in_message,
+				    msg_context->u.bulk.buffer->buffer_size);
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


