Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF33CA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 06:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TSuLcRnSGeJ3xtP5yz3Dg/9JsLri62mj/cqN0HfNB3I=; b=XwYQd8g5G5PdBTMfZIC3APHO8y
	KRW3kGAzweR6HtbsCaYk1vSdWvSR5CcSNvk2priID2z7WjOhiJU6r2qvx9b0Fn6goZQl0AfAt46E3
	pChARyKlI0n4DedjnX3YbNZ0xlselHGbTdqo7kGgcvqRV1ukGTcNHGZuxV5K9Cptt3WoTgUwNc9hj
	DUrkLcz1avB8aA2Hlb2bXekVBUPDTUhxphbN70fuIKZDOY/uFymy4itRwHnxI1p+dKvhQVhuPPUFv
	S3tvr8cNzZUhmiWzFqOhgG8za48BZGccFl3qNq7ugicRMA2dcjXJ0/r7Zkx8u6pI8t+iChiO5r0Ea
	1+JvV3Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um4qC-0000000Cljy-3XSV;
	Wed, 13 Aug 2025 06:20:04 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um4ac-0000000CjST-3lGT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 06:04:00 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-6154d14d6b7so7337832a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 23:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755065037; x=1755669837; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TSuLcRnSGeJ3xtP5yz3Dg/9JsLri62mj/cqN0HfNB3I=;
        b=xxVOCYB+ciYuoxNXTycPA9xVxMT6SLI6gUvA7E0ke4O+3cuWJxcLUmRb8R1deCZ8/X
         za9spht0zm//TOSJp4ygVpJnNBsW95tqTuK1TL0DGletWm41uHzwPVehgHWqlMrDhyJ0
         nmXESQ/ZYdyVFGCmvvThfCfduxkkhfPUcqBKHKOfxeC2rkmcSIa/YtbMZq+wHKtplQg/
         x7wvK3gnezhxsLxvrqTwuYG8Fe5u1mQDHaw/twM+vnBevfDxQI5gkjJE65PjJqB7hwSw
         4kupkiN+Mjaxl0MQrVqkPEN9gSftYpzBBi6UK1RKsXXsAj2CcM+wbU48FTsSEW2u11Uj
         JsUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755065037; x=1755669837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TSuLcRnSGeJ3xtP5yz3Dg/9JsLri62mj/cqN0HfNB3I=;
        b=WW7/Eqc7/Z9Xg7ICAaECqLDW9B8+GVsY6RKjuIM4QfsV2XrgPlUo4ovEZWzPFQXC0a
         1LIx1+/JUIk6m6+HoB0jP7tn1N/kI3EEESchG3dHor/fKmPAxpYmPRdpJzdxBAsMoDTj
         zZdpDOe5SkMFGrdP7itrfyvwTBqQqmCD+/KS/TMaQo8+d94ak/01S1B3iXQlhqyxZp6v
         JeObxOJY7l5ESfWCHNWKmBFKowXT479Y0ylgNnrsYhevesb4GZ9Q7VyCeQ1s0yW0GXbs
         Gg+LakSKk9HNJJNOXPUiMoFztjDI5rQ3AVcB5ih4eQ4Tzj1p2cqS9zn8LJUdjzI9apvq
         HpiA==
X-Forwarded-Encrypted: i=1; AJvYcCVLAX5r/Rr/ESXjBFypecE+b2aLrutSLQppk1QgVrEhDH9UP6UjqLfJCgeAqEh92zLK6DY18RmGgV9tqY2crg/N@lists.infradead.org
X-Gm-Message-State: AOJu0YzKExZGeYjm1B7Dl5H36we44vBKq8lW6kk/Fd0IAKxv9BkbfAVT
	DWmtrX07bXfXfh9reT9QjQg20sNAybUDu9UO1faifRsgTzPeQPjQL7jE9NGETqNYJPo=
X-Gm-Gg: ASbGncttCZV3+h0ISjOE/oPm/GQoIHNCyBFBEs/hUpZWpDin52nn3wCIEXtzEOTlJfr
	MM4Ot+vUCnXdn5M4fdCJHAGYZD6l9EvIFOok1vRZ6TWO82fVpZu8LRg9gmenx5wbjTOCrls3w2H
	ZZLSYyL0yvT9fRjFJ3ACSK7kD0kFf8HZFmjZzPpqfnHYYYrFk3nX1yY8/Y2U/j6LqJE6AbEvzMp
	6aoJ8bUwKqcIAnH5v745WVTORveB/pM9CVy9s+CWHwdm2cNUcAlLOkjSqSiQyYCDgsC98L9hvdt
	EwvZDJLa+4+n7J/KJzHVdavejmtzDTOoQs4yCUT/+MEwcdNrwGy5UJ+5FHtKyZJQTtDUMj+aUKR
	nKhlbA+lqNBAFhClQtZpj2fe/ex6qKPysO02hJhNSPFJpyUJkjJYtDieZY7k2UmGRqWreKcyXE5
	8=
X-Google-Smtp-Source: AGHT+IGqtQuV3o9beFdm8AV0OFCgrlJsYi4d+51H/4Z6scb5xUCOU4GITJt7DlZEnnM5yYTlW/+1Mg==
X-Received: by 2002:a05:6402:3509:b0:615:a60a:38a7 with SMTP id 4fb4d7f45d1cf-6186b758722mr1521502a12.7.1755065037200;
        Tue, 12 Aug 2025 23:03:57 -0700 (PDT)
Received: from rayden.urgonet (h-37-123-177-177.A175.priv.bahnhof.se. [37.123.177.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8f2b892sm21498679a12.25.2025.08.12.23.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 23:03:56 -0700 (PDT)
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
Subject: [PATCH v11 4/9] tee: refactor params_from_user()
Date: Wed, 13 Aug 2025 08:02:53 +0200
Message-ID: <20250813060339.2977604-5-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250813060339.2977604-1-jens.wiklander@linaro.org>
References: <20250813060339.2977604-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_230358_955468_9F49E760 
X-CRM114-Status: GOOD (  19.06  )
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
index 52f5806ed314..b89f93b1f8f2 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -354,6 +354,55 @@ tee_ioctl_shm_register(struct tee_context *ctx,
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
@@ -361,8 +410,8 @@ static int params_from_user(struct tee_context *ctx, struct tee_param *params,
 	size_t n;
 
 	for (n = 0; n < num_params; n++) {
-		struct tee_shm *shm;
 		struct tee_ioctl_param ip;
+		int rc;
 
 		if (copy_from_user(&ip, uparams + n, sizeof(ip)))
 			return -EFAULT;
@@ -385,45 +434,10 @@ static int params_from_user(struct tee_context *ctx, struct tee_param *params,
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


