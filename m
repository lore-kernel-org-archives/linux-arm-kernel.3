Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5444CAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 13:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yi0r5nq64oj31QVOjln422OWaHa6DWnYy7B2T1z3rUg=; b=HwoKMewRSQw/olS0jT3uUXtCML
	QyznwDgELkxbDlxJJl6qZKYLBJN00YZwUdjO+QVoe1rfNRal1YT58u2cCUNwB7uUyfISiB3HshrhR
	b9ejGhFiZ9Teob01VT7ph7K+eyPtcC3ZItkcsk/gNRVhoRaxtzY/2KnMXeYmPEIWTO9xuYMep3c0h
	Sco4N9piZ0D5WFvWy7dBvpkXsyaQqx+Ezl8b33YS6+C8ZAX1yFs76NltN+jgC/21xroJfxEaY6Je1
	0Lr1Vz97lD2oncE1H7fRsyO3d1pTgDW24t5DzG5PtSioat9M5PSrU/uawy67MqrrTOuyO8VrIpyrg
	Ft089pnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwhhA-00000003MGz-434Y;
	Thu, 11 Sep 2025 13:50:40 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwhh7-00000003MD0-3qW9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 13:50:39 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-71d60110772so5859927b3.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 06:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757598637; x=1758203437; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yi0r5nq64oj31QVOjln422OWaHa6DWnYy7B2T1z3rUg=;
        b=TnTbxWBC+x4Va1QpyzIudcHmzJYKaqs7/8lqQKUyJynEPLVvGbHrkzM6sJBbBFIHf8
         KjPfntJxyUdk07frEeREowCuFEvttufmvG6uBbpLrt+FKevhENxcJXhQv6XMGnv3go2O
         tsc0Uo4WDK4xCmmbKCazXveEWxWS0gb1OJoBBFoGj2pnAUZUrCg3EXC6clJq7Cb5gHS8
         VsUavd5IcQb5Q/Fvr60zsComOkLDZeYVPZZ0n0suarBXXSWg7MBS0uyuCs7HHqFUqwU/
         SHwfpnt9URu0XPQxbtzRhI7/DXWicdBwjimAMv7Vd3aC276sOiKOzCwAeOoDz/bzI3iI
         Cnyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757598637; x=1758203437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yi0r5nq64oj31QVOjln422OWaHa6DWnYy7B2T1z3rUg=;
        b=Hnh7XEsjEgW743jC5cWk+9jrksLAow+irSBtUTu2nsF4esv54HFspDo26i6FRh5sgZ
         7M1/fQtXuz6Ys0fgmbEbSCfzGoHFYXltEOf4yqFBGJ9O2jThNBKz/7SFJ/UH+BCvg+rf
         7rn3NSqDMp0yMaCV4RVaXrsN9W63kqrhnU18IcHglCh1oxfT1bKHNd1oZvwBToFdRPjl
         pfgrtTj+ux77JnAt4WiK5aDMFAqFn7QBNBtrVcvsBFopW9AVgUr4znWeqS29O5fUOu8r
         IEyRfFj0NNZyXw/Ui55kTywkMW+ZoTA7VIqRZUIijRSejAhW+OP333+6qGGRhCoc4qfH
         J00w==
X-Forwarded-Encrypted: i=1; AJvYcCW8zC8k0hIfmpXW0LO0cw/5dEvNbUQbA4weSxu4y/6XaPMAo/Qo3T/T99DR07iefJUkOsMMbJX6DxdSstr+Ze2s@lists.infradead.org
X-Gm-Message-State: AOJu0YysGdH6TcCd40QmnEDBmiw+StbeXz1VrH0UWUjrP5NUuU+rxbVb
	lVxQpF2hmALFlsOv7UMX4cYNd/xuaXsfce2TVK7Ic/zXDvNxn+BXyR3IvfW2D58Z21M=
X-Gm-Gg: ASbGncvQHAabHyR7/9Rhn5/D8p5qTiWF+QF1iNuoNjWh38iYBysnuN1A38gA4cRU55n
	YrrSvGwYVFio79wuSwJDhxYvuxX3MBgRw42FGRv7qYReU20jBiZYY2tuGb3XufBYUJCheQCKzQg
	9icXmShINcTWEPbmo5WmjM6FREnYzPpMqEluPlL3fbPR7zABQ8wNQ5JScpmoShsDUTKQgJdKDSJ
	yiaXOj8+W7mmzTlKukAjn/LXz4zmrCZ/cfpuSrbIPlElcm8jyfITuj29SCtq4e+HIIjJD1Z9L1x
	L5Ya2W8D6D+Xsum/ey344CsrvTr6vY8C5f8y3s838dJ9kiOfFMtyi2O0f2vcwX/ZR4+ozWvBrP9
	h+D5eOYGHu9tMMJNg90eXANswNF19o1HHd9MErUgfwi+3Xoatnce84p/jiJcj7HTQz789SPYzId
	hNvG+mq8SzLw==
X-Google-Smtp-Source: AGHT+IFhFq5K/L+li5E/fnG6u0IEPzqvQNG67ywCbR49sqE1DlYxZ0kS6UjsMtnPo2ezjd7bDqomGA==
X-Received: by 2002:a05:690c:62c1:b0:726:76f0:4b89 with SMTP id 00721157ae682-727f505434fmr181457897b3.22.1757598636586;
        Thu, 11 Sep 2025 06:50:36 -0700 (PDT)
Received: from rayden.urgonet (h-37-123-177-177.A175.priv.bahnhof.se. [37.123.177.177])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-72f7623434csm3526257b3.11.2025.09.11.06.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 06:50:35 -0700 (PDT)
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
Subject: [PATCH v12 4/9] tee: refactor params_from_user()
Date: Thu, 11 Sep 2025 15:49:45 +0200
Message-ID: <20250911135007.1275833-5-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250911135007.1275833-1-jens.wiklander@linaro.org>
References: <20250911135007.1275833-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_065037_979689_ABFA3EB3 
X-CRM114-Status: GOOD (  18.71  )
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

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/tee/tee_core.c | 94 ++++++++++++++++++++++++------------------
 1 file changed, 54 insertions(+), 40 deletions(-)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index 2411d1e2aa7a..4996f194cd9e 100644
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


