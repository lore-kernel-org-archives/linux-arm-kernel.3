Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3752C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 15:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E8qa5LXunNhsp8X5JiJZg17KZ//sKeVB/2pNQGhvC/I=; b=P2aqo5ZNkJVWnvW4aaG/rHvPXE
	dEmMC0vorRkxJORLcFF7B3kPZdOi5IIpznqWLEusn6A8P3QSGkDAOrqoqE3vvNxAQThIZf7BIRsag
	KaI22eMUXtOcUfBieP2AX1RMkajzUBQ7GgaCTwuGLJXuyqqHxt2C2wJGtyhJ0aiIFg8XLnEmOlpm/
	qRdAxN+09/+I/6vwaP76xIeHKar5j4B11ATwGskwFOfmOHR00MS5wGROQcoVTdrSeKtgX45G6FlsI
	6ys48J9psmvz8gdPCAu447uilKOMBv7EKdBj+GWr2qdJRcj2t7ztEQplhvbXKvH/SDuF9EsD6U5nb
	6dKCE1tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHP6J-0000000DNtT-2Avo;
	Tue, 20 May 2025 15:41:55 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHOpl-0000000DKMT-3j62
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 15:24:51 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-ad560321ed9so353084866b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 May 2025 08:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747754688; x=1748359488; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E8qa5LXunNhsp8X5JiJZg17KZ//sKeVB/2pNQGhvC/I=;
        b=jqdkHVX1aRkQY4zNht/C8loqBo/0HyBDnHzwiAuE9Gh7/0o89PoqJtMyxihNqe+CY9
         rcYAsRaciqNoetn+4TDS/h79fjunFuREVW2GBDe4ig9ZWUpmgxJgcIR7xAwRacs0doKh
         ICxmb1Jjo3TCRQn7T1wKTqT4tpB/3sIpB6ug9SHKud10YOw58Jq7nTa9OyxUAJakFEwE
         0pL6AEe6Zd0r1SkqjOrC3bZdSiWhTlIAlYsWR0EQHMFC32OUtz8n+pheKPtxlTvH0iAd
         fqumyD7pgiBNwIfclHrwqQFErAhoNDIq6xyW83ec2ZPWGrFHLlufGuI2lylc/ib8GEwN
         PL5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747754688; x=1748359488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E8qa5LXunNhsp8X5JiJZg17KZ//sKeVB/2pNQGhvC/I=;
        b=ZuKBtmBR110mmaanrtcjNDgnRFYGNvF3XLC4TFEAjGBii1Oni8/xiz6M7EAalCXUUx
         607PPnu4c+rqCNTa+46jFNs/t7Wq27uTSX98wjmjwAPUSscE914JL2sNqOpkAae33FiB
         7WhlrH3zsqQ9MRvbNHmrgd7auPyiNR67q6ym6+BFLYSch7I4BwGk+X3Jtt9+6iSDOqWn
         oOilykpBOABWKSkJV4QzTXxN8pks2VnJtHeSNHO/VJbomzfjUSt6vWfwxQRUvxPfbUfY
         feoxSVbr8sQb8ANpIfPii+ELWGQA6FXmtedSb0xNIL1DDe7raHppxo8ooeUJaXO8nwFY
         NWOA==
X-Forwarded-Encrypted: i=1; AJvYcCWNW5WoZ6ulpl14aQ1QmVXjptkBKuEA0iL61dwT/kXYvT8YcS2SL8/TOe7nld9pgQ3GOmhSD9XNau8kHHF+VjMn@lists.infradead.org
X-Gm-Message-State: AOJu0YwUAdB+4EpX5WMwgxRp07+cXYhfjP1yLzkE0Nviue2RxaKmM/4s
	mlrXSQwXBt82Z5LWzbo97j+iT7qu9Mmy8cnhrnPjD1sfissD3uTEwvJVKWMMfb4Ef7U=
X-Gm-Gg: ASbGncvh5CMJj/6Kp+ji6VvQYLiKb6WRnR5k+Omdwywl+B4NtXRRplYQ/9Ki8sMwZi7
	C6b/DQUZDqgB3c3fmEr2EEx9mOEsFIK/jOXPHIZj4BDvlSrpf9fFT8VH7t5uDadV61NXOc4YabZ
	YGcXviIXaEcqBdBnTkwuLgKjWQ5Os0x7NbtBoDIQM3DggHNF2815kPFy0sdep5sR3yUbAts3Nkg
	37ynCOqH1CEgi3w2z0zYTPVwNyjgA25dQ6D2nx9Ymda9wrhBrZ5JJlbzco6/00gQvgCNDNTCjS5
	vOneQ4aq3fisf0ir10/VrWowhSjxWRdPlb5Crnqpc0STrps5LQ6ZGBobH67AE3jch242Dh2Cq1x
	8XefWabFOGPhvlsgBB+4SiIYuOGe1
X-Google-Smtp-Source: AGHT+IEImWs7uqKgqwvSaXfZnMr4lkCq2x7vYsraA2w6nH//5aCKKG0iMBeBMIE3Nx+R/TgNxy5Nsg==
X-Received: by 2002:a17:907:970a:b0:ad5:72d4:85f8 with SMTP id a640c23a62f3a-ad572d5076bmr655367366b.60.1747754688101;
        Tue, 20 May 2025 08:24:48 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d278257sm742608766b.82.2025.05.20.08.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 08:24:47 -0700 (PDT)
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
	Jens Wiklander <jens.wiklander@linaro.org>,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: [PATCH v9 4/9] tee: refactor params_from_user()
Date: Tue, 20 May 2025 17:16:47 +0200
Message-ID: <20250520152436.474778-5-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250520152436.474778-1-jens.wiklander@linaro.org>
References: <20250520152436.474778-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_082449_942788_1A284B7C 
X-CRM114-Status: GOOD (  19.27  )
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


