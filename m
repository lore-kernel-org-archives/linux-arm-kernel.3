Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E96C677C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 16:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E8qa5LXunNhsp8X5JiJZg17KZ//sKeVB/2pNQGhvC/I=; b=X30lX67L/CApy8ey8R9UrokGj8
	ZZLg0g5zilt84XHtxIhWXrV0Zg5cWRpexqKehbYBbOvMIjMZ5LfTQmhoYgE9K9TKTjEloVV23/wV7
	igsBEPuJec0HnuHfujPChfmLhNsmap8FcBXFiqDR8gZkssNB6HJAPGlQT30ArdJzIh/7k71gkbmaX
	oCjX0wOUBBjBCGzb2yKflrfZ7X0Ud3kKqyxdsrvB/OVueOK96KkWuPjg+sth402xHdI++hm4SRGXr
	ML1lOwBcCUaP4eqye8CpfjFNUiDcCoKmIiR9TlTqB5dyGKJJmVGgxGZqQbcZ4znS2PwomM/v8bz6p
	B+a6bSsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP2EZ-00000007XMN-3zJs;
	Tue, 10 Jun 2025 16:53:59 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOypu-00000006vT3-2I0e
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 13:16:19 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-ad891bb0957so887614366b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 06:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749561377; x=1750166177; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E8qa5LXunNhsp8X5JiJZg17KZ//sKeVB/2pNQGhvC/I=;
        b=RAYT9t6R7bGyCfyH/kKLpfjw/OFqCjm80Z8FeFRaFjJ9cNXsX1qc1IgsF5bPWcr/WY
         W3fJtohkCIB1PbDuRBNYnIbdkDOfAOnxOUqRVtrYUdgrmpKJSLg2AbUpygQuhRc6ee2O
         ZmxNnjCgQoxeaYDM0DxBkRh49B6CAGPk8K23IeSH0hnkyp/5oS7+iq/BYpYt3dhlxV8Q
         XEqQmx7u8yy5pw3BhZC8eDg6lHmqOCiKec1RJsTiqhRn39mZqtv97q1u+7Af9AZ7r/gT
         +yK9RdCCX8s+uKi8kojaVAoZyFhCmpSId4gNKsL4M0m0gRgrRInS25ktZmAjzEZjeVg/
         zKcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749561377; x=1750166177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E8qa5LXunNhsp8X5JiJZg17KZ//sKeVB/2pNQGhvC/I=;
        b=tb+ChXlsF04M2uD3Jzw2s0+Hp54Uk35ssPcIAiqe6qYgrMaPQo0s2y5H4Ib6eaEOGF
         QCrvPKvclCIXZUtnUHYDY8i3n9i2w2QulSnTsenk0kLhy+NecSsJJ4pqYp8Krlm5OVTK
         WbARw4cAlJSi8znirURohKexrcaXeHs2JcKNLL1ouAK2pv6hJWpvlLkGKUYUWpqOoI1/
         sZqNQdJJrfdoQjNBwTL6QTLgJ6NOyzYrVoWp+SFrzuxbo5fG5en70UtPBGoRZzYFI9Oj
         VzgU1ZmSBJEHe2JwphYckNvVcSf+Uflt1XfY/zjzvU+kjIkJhAmFHp1uVEmwMv/uflu1
         /mEA==
X-Forwarded-Encrypted: i=1; AJvYcCWIzUS7NcxdbkkWjxzsdNlPVnAbV1CcdZsx+Zh+1kcalV/Ev8emUIwImZdyHKgq5FVqCzPj8e4o0RGfJw66kvS4@lists.infradead.org
X-Gm-Message-State: AOJu0Ywh7VZGu3niFOxzI989n88rasMMTrYmwstW8GLKar5xl/onO+L1
	w6snGYdFIrR80jHggwce0B/wiUOQ0C8X74mK4XZ16cHOzq+yOU6MZiTOqWimf5/mYLY=
X-Gm-Gg: ASbGnct8tBOacNmP2TxbEdLiZOHIRDm0FvzbniJ+VW8AKxX0m+Kq/8AYFgOtVh7wjBU
	rgu6SExsk+uZZIsMC7RiXnyFCE9BqQt94W5pcFSxo7CJk3Bkf+Syn6vB/TmniLHJ+Vt06jfz8Ci
	EQ7ybbojuOzeQxXGQvJ03E8cmaCzbUdIqYcCOr2ogkqh4/TeY4tzxYpvX9PuJlTpv8f/A5k/KT7
	IXpaKiIZ/Z3ddcc1DrfRKw2pZfr7yJgq4Q3TJve5fnxgpiANlPPIUdChDUkXg3A/w17Mfgc/5Wt
	KdZbY5DG7t7FWWDiWaCat24kXntYReL2+1ir79mPnzxKZ6EGRXosUs6mTk8I0ET9O2FPxFojPOn
	cB5FEzKYiR3xtkQk9/+6XRBvym6fRTjoZ0cQAoPk=
X-Google-Smtp-Source: AGHT+IGBtPqwFuuJoAzhUd8IVl8tNDOry1bNSziVae04YZxrWPyYutj0nX6K0MH+3Pmqe+BZwOKIiw==
X-Received: by 2002:a17:907:c12:b0:ad2:2569:696d with SMTP id a640c23a62f3a-ade7ac3db7amr264477666b.15.1749561377066;
        Tue, 10 Jun 2025 06:16:17 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade3206a1efsm643651666b.67.2025.06.10.06.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:16:16 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	op-tee@lists.trustedfirmware.org,
	linux-arm-kernel@lists.infradead.org
Cc: Olivier Masse <olivier.masse@nxp.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Yong Wu <yong.wu@mediatek.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Sumit Garg <sumit.garg@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	azarrabi@qti.qualcomm.com,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Daniel Stone <daniel@fooishbar.org>,
	Rouven Czerwinski <rouven.czerwinski@linaro.org>,
	robin.murphy@arm.com,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: [PATCH v10 4/9] tee: refactor params_from_user()
Date: Tue, 10 Jun 2025 15:13:48 +0200
Message-ID: <20250610131600.2972232-5-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610131600.2972232-1-jens.wiklander@linaro.org>
References: <20250610131600.2972232-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_061618_593194_1702DAC6 
X-CRM114-Status: GOOD (  18.62  )
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

Break out the memref handling into a separate helper function.
No change in behavior.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
---
 drivers/tee/tee_core.c | 94 ++++++++++++++++++++++++------------------
 1 file changed, 54 insertions(+), 40 deletions(-)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index d113679b1e2d..5259b8223c27 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -353,6 +353,55 @@ tee_ioctl_shm_register(struct tee_context *ctx,
 	return ret;
 }
 
+static int param_from_user_memref(struct tee_context *ctx,
+				  struct tee_param_memref *memref,
+				  struct tee_ioctl_param *ip)
+{
+	struct tee_shm *shm;
+
+	/*
+	 * If a NULL pointer is passed to a TA in the TEE,
+	 * the ip.c IOCTL parameters is set to TEE_MEMREF_NULL
+	 * indicating a NULL memory reference.
+	 */
+	if (ip->c != TEE_MEMREF_NULL) {
+		/*
+		 * If we fail to get a pointer to a shared
+		 * memory object (and increase the ref count)
+		 * from an identifier we return an error. All
+		 * pointers that has been added in params have
+		 * an increased ref count. It's the callers
+		 * responibility to do tee_shm_put() on all
+		 * resolved pointers.
+		 */
+		shm = tee_shm_get_from_id(ctx, ip->c);
+		if (IS_ERR(shm))
+			return PTR_ERR(shm);
+
+		/*
+		 * Ensure offset + size does not overflow
+		 * offset and does not overflow the size of
+		 * the referred shared memory object.
+		 */
+		if ((ip->a + ip->b) < ip->a ||
+		    (ip->a + ip->b) > shm->size) {
+			tee_shm_put(shm);
+			return -EINVAL;
+		}
+	} else if (ctx->cap_memref_null) {
+		/* Pass NULL pointer to OP-TEE */
+		shm = NULL;
+	} else {
+		return -EINVAL;
+	}
+
+	memref->shm_offs = ip->a;
+	memref->size = ip->b;
+	memref->shm = shm;
+
+	return 0;
+}
+
 static int params_from_user(struct tee_context *ctx, struct tee_param *params,
 			    size_t num_params,
 			    struct tee_ioctl_param __user *uparams)
@@ -360,8 +409,8 @@ static int params_from_user(struct tee_context *ctx, struct tee_param *params,
 	size_t n;
 
 	for (n = 0; n < num_params; n++) {
-		struct tee_shm *shm;
 		struct tee_ioctl_param ip;
+		int rc;
 
 		if (copy_from_user(&ip, uparams + n, sizeof(ip)))
 			return -EFAULT;
@@ -384,45 +433,10 @@ static int params_from_user(struct tee_context *ctx, struct tee_param *params,
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
-			/*
-			 * If a NULL pointer is passed to a TA in the TEE,
-			 * the ip.c IOCTL parameters is set to TEE_MEMREF_NULL
-			 * indicating a NULL memory reference.
-			 */
-			if (ip.c != TEE_MEMREF_NULL) {
-				/*
-				 * If we fail to get a pointer to a shared
-				 * memory object (and increase the ref count)
-				 * from an identifier we return an error. All
-				 * pointers that has been added in params have
-				 * an increased ref count. It's the callers
-				 * responibility to do tee_shm_put() on all
-				 * resolved pointers.
-				 */
-				shm = tee_shm_get_from_id(ctx, ip.c);
-				if (IS_ERR(shm))
-					return PTR_ERR(shm);
-
-				/*
-				 * Ensure offset + size does not overflow
-				 * offset and does not overflow the size of
-				 * the referred shared memory object.
-				 */
-				if ((ip.a + ip.b) < ip.a ||
-				    (ip.a + ip.b) > shm->size) {
-					tee_shm_put(shm);
-					return -EINVAL;
-				}
-			} else if (ctx->cap_memref_null) {
-				/* Pass NULL pointer to OP-TEE */
-				shm = NULL;
-			} else {
-				return -EINVAL;
-			}
-
-			params[n].u.memref.shm_offs = ip.a;
-			params[n].u.memref.size = ip.b;
-			params[n].u.memref.shm = shm;
+			rc = param_from_user_memref(ctx, &params[n].u.memref,
+						    &ip);
+			if (rc)
+				return rc;
 			break;
 		default:
 			/* Unknown attribute */
-- 
2.43.0


