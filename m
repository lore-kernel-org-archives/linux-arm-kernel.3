Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF14CC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 14:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fs7nqD12lkBPC3o5IKJmDFRrEPWNWVuJ0deEV/XnG9g=; b=dM/2zX590x0oHQBkQjg80ii7D2
	fzvYpO0QJ61LBM27HmqylxxCYBx+ov0CM2XOFwP2AcgPCFuyr7oWbNBqMMQXFO2VqgHazoMCACMTt
	95z7tQe8UpaEN80WOm4reDJShC33NeFEJiV1cqUhnKpLtoRHeIfAqAPJ6apIGPqI12GXKKWM1/xIu
	S1q79IXHoeEwa4QIti61YHl+9vnn+cip3/aDpbQ1h8+5B/NFIBxaegE6Vhh7B7TzXXKJfP9TXeOXQ
	s9gxEMUSzqklFTdZzXXKMQeEPnbbOWi/9IIaZhdV0tFYOAiN7RKm+PJI9FMb77r4whHXa400EkCgl
	0S6IyVqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0iHy-0000000C1T9-1dma;
	Fri, 04 Apr 2025 14:44:58 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0i61-0000000BzKg-2AOC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 14:32:38 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5eb92df4fcbso4048797a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Apr 2025 07:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743777156; x=1744381956; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fs7nqD12lkBPC3o5IKJmDFRrEPWNWVuJ0deEV/XnG9g=;
        b=C50KXz0G4SFAvy0/zGW1TctuLu6sGu1y3g03OEQTdg068MqjYMFOaHWzQ2IjVMD+hE
         wG3vcZbwfbQIYlRRZkP2t/98dcrWsMzyKTqyjd1GZf1wqpNFK36m+/x5+zp5k/2sAFZU
         y/On7eFfAFjulbkKVBoO9U0BE4XbfIhjPcumPr9VWd3Wwx/N6GinGCJrUdpEJvLoBuOd
         m3x68NTTt1nyNLWl8z6n9J6hxZtEqthvxrqj8zcLNcOK5EMozVYgDQuLKxS2cjCrgBWl
         gCAegeVVu+8+693rht2BmDz3Wh15vNXkohgUEmghSIyBbQyOx3Fr1eNXedsq7VHDcXm4
         R4Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743777156; x=1744381956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fs7nqD12lkBPC3o5IKJmDFRrEPWNWVuJ0deEV/XnG9g=;
        b=LDyrL+25INxRNqXw6gthQQpHaHCIAkWZVR1qbfcfw1HoGtZ/SCRTBCyXQ8+O+txHvI
         IZKTsAYJN+CFHrW7hpr31ksXBjJvT8EV3sUkt9COSQvW5/BdBaawoXifhm4Wb8IyFWYQ
         y1KbEByLTjP8J4CVZyh0+ItqD8wcT8eoIQAnj1KCgn9AihvwlHJQj4LZj1VAGtSFB4Hq
         kJa5u4JzGOHE7tJktT+TPF6o5Q5H/CCcjv7HhHTCWangkUOIGXKqHm4Qtpn3URr6LCqP
         6cymWr5yacK2iBhrYiu6ojbK3MyZxlkMNB9gjJttfRCQ6mDL8iis/YSjWmPGK/IZi1O0
         IBzw==
X-Forwarded-Encrypted: i=1; AJvYcCVAoVuvjKnOUGAsl/JL8N78jnCSHINsiG0KFbOzBrltxeB3Vg64t2H+/j+HVFEUY4slFxWgFkzGNctkgH6iMYjR@lists.infradead.org
X-Gm-Message-State: AOJu0YzkAVePu9EkVw8PQ5Aj9qNBLAGKJ9hXE98fCOGTPHlA9bbUEXGU
	DQrWpn6LP8w/7xRaQeINNxO9HwlLxalvNY+Zw/v+mMVNZhjBVbEqqq7EM0ZpR5vDFDp9Ce385X4
	ggq0=
X-Gm-Gg: ASbGncsOcpxcky+E8FrunldzSIFHeo5MKCGpWDSQccbzWvGyEssOeFXcMpW7baVMB59
	6FQ5Puqhl6UKa4XaA70Pr/KNV3TlF5zxjN66EkbRibrAWqMn7Iv0JdeWUO2jsGdcFjRBIRDVf1d
	FKZYn+FeYDr/b4/gsBV+hcf7gVRcv9d70K4nd2gteXFuLUiGEjaYqLLwcdpWok0Xpg8xF5cMyZv
	tRaS1IxIIuIE0wj9SOVZmO3n0utuAaMdsViAGexPE0kKpOJo6dpfuFJj54ZD+qhqntbGBQuWEjN
	jBZXfdCHjrb7c/ZCjhqKa4dc0p9/Fy3qe+Rths2VfiSKCP0pba9xawyud6c3/DtBBzhkArcNg5w
	14uq2HHrGCtaTv3E6t808Hw==
X-Google-Smtp-Source: AGHT+IFs+Hyg3/qgGfM04VQJy6hexkwcypVkkd955EopjzAxNOwVqKRSb29t6l7fEI6wJVCNyo9dwQ==
X-Received: by 2002:a05:6402:42c7:b0:5ec:958b:6f5a with SMTP id 4fb4d7f45d1cf-5f0b4711e42mr2859878a12.28.1743777156026;
        Fri, 04 Apr 2025 07:32:36 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f087f0a0f3sm2567450a12.43.2025.04.04.07.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 07:32:35 -0700 (PDT)
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
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v7 06/11] tee: refactor params_from_user()
Date: Fri,  4 Apr 2025 16:31:29 +0200
Message-ID: <20250404143215.2281034-7-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250404143215.2281034-1-jens.wiklander@linaro.org>
References: <20250404143215.2281034-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_073237_560694_E334B514 
X-CRM114-Status: GOOD (  18.73  )
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


