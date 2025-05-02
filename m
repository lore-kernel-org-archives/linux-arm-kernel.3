Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F40C3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 10:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fs7nqD12lkBPC3o5IKJmDFRrEPWNWVuJ0deEV/XnG9g=; b=qSXaPVZVkTRGZsvhkJvtjp9fvC
	0C5lGu03GTRJspnfOgv3B22SGxbQSVGD+ak4zspGbC9jsP743smWLOQSphrtQer1J2Zd96o227Mf0
	hKLNZ1xeDKR2t5qRF38kmISoxaWyqVLxad/ljLDs5tNEVVjThKoFjg6yU1RH4CBAA0xjyo6dVsshl
	qoNFWEbkLQDRGbPflHZREC+d8FyOCll+r0Z9v6TgWKkcUo8xT1bWbAN9AfmIay5/aovhFrIdG8AdC
	ZB4EK9+B8GXdvi9d7paQG/xEYc+NqmLTGhLEpjDufRQ9zzlpxH0kDuo/QkqYny8hGXN2f3+bWTxEN
	IOHpXo7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAnfY-00000001a0E-280V;
	Fri, 02 May 2025 10:31:00 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAnCe-00000001Skp-1UXh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 10:01:09 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5e5dce099f4so2111905a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 May 2025 03:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746180066; x=1746784866; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fs7nqD12lkBPC3o5IKJmDFRrEPWNWVuJ0deEV/XnG9g=;
        b=Afz7PHxX/BXtTlprJsTKOWNVomQ1xkFZtorBT/XJa5fjp27d8BPvr0cFz9SowvGkKz
         6wm3fSxsO1uZgAWbpMqwBjDp7iDQOUqwBcD+D9Yt57xy9MpfUqHTnCaj48N7xcnU95QV
         JKkczuSGLIFuBXXBShjMxOw0UGc1LKYH9XxlHr5IcXnrrB1iA98YPzlYYPd6X+sKWW7P
         qBi6qKE9/jf+v83IB0u0nFLkUzgKLK0X8JgkvJfQlawXk/AOCvBA5P6rNiwNYeR10Bvr
         9L5tRYhoxvtNj4ohn8RF8vcSoV2QL8nnvBmZKWjEGttsh5usb8IqBEcnSWCWCWrBxf9F
         INpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746180066; x=1746784866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fs7nqD12lkBPC3o5IKJmDFRrEPWNWVuJ0deEV/XnG9g=;
        b=Zyuri+IZBe+IOVRblzURbl4tlZqYbwlyAZp35MRhsyzadPBv4aENbrAi4fIy42tsO7
         LltB8IHPtRRyT6ExQ8ijDtgobLb1j0+k0FUQ4FSY3jkOClko+x6eSQPpseS02bGMuTtl
         gn5vWDkBYV81R7TgjP8aGmIT3p8OH3/PKXiLtdza7Bu/reeML9B8cqWa6Dx4VM403uRs
         dAdExARQkE6GoCLAVNbEXz2pOoB6iy2tESgobhzfWDk6oCABGJE81ZNBPxT7NDAma7s2
         xn7rTvq8sKZXivDMXrumLzL1GVM4oJFyMM41rGDLyhKlCSnWrFsYa2fTttY3Hrk8xk3e
         0pLw==
X-Forwarded-Encrypted: i=1; AJvYcCXiBIJUGXqgWc9dfupZmLvi+hRvvKd/rFBblyeN4UNZM4zXtMLPUuFwnmT+N/YZPfYvSUVe79oWwXdnfLSfVXip@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8iDygQiE14YZ1yopENH+blNDQvf7n8IamHsHwI58scuCUWjcL
	uWMfbI7gxJYSsNq7Qq12Qo1otPuuE6y0Ruc+IqRQZK09cEcLUHEilJfJleevfCg=
X-Gm-Gg: ASbGncsiqtsFsrPqgGj5V4tps/+XFXhpopIvNruwg7yYG8+Lqxp2htaQ1/ufCG6TgVd
	6NwDJRgWK9LhqT3PJl+MVlSf+o2ytUXLaqfxWP4ORCOCkbuYD3TZ1IchtKM4/z6HAx6ICcR/wW2
	pVS1KjUh2hOGiuxc52UXwJ2LdNOEQSNgI2IB80HKYB5jMbz4V8etsxhIE09X+kC2WgUHDOGuH3M
	/DLzFBM/Viict5US7O6FGpliKRnASLkuyvC6Tr4aGKdYQrMbyB84qS20x90VrhhE830g7qNOZu5
	g1bCLgeL5Pzvgkxnu4vZ+Aus4RWVZspLZegNIJ2O6lMR+8vvI4WcgTJFcUjVuoaBrTAmY7qxWNr
	kGJOT9ie7kop0InvUjQ==
X-Google-Smtp-Source: AGHT+IFFcCMXXLABaW9tvRZ1qpMWwe7p/TbtI+cL2YnquR0Nl0siV3BBf3ahUJ21DjrVNKWPwxmwtg==
X-Received: by 2002:a17:907:3f0f:b0:ace:9d35:6987 with SMTP id a640c23a62f3a-ad17ad24ac3mr199106166b.3.1746180066113;
        Fri, 02 May 2025 03:01:06 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891473a1sm26030566b.4.2025.05.02.03.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 03:01:05 -0700 (PDT)
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
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v8 07/14] tee: refactor params_from_user()
Date: Fri,  2 May 2025 11:59:21 +0200
Message-ID: <20250502100049.1746335-8-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250502100049.1746335-1-jens.wiklander@linaro.org>
References: <20250502100049.1746335-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_030108_397397_91CB4152 
X-CRM114-Status: GOOD (  18.76  )
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
---
 drivers/tee/tee_core.c | 94 ++++++++++++++++++++++++------------------
 1 file changed, 54 insertions(+), 40 deletions(-)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index 685afcaa3ea1..820e394b9054 100644
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


