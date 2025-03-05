Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0137BC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 13:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tnKwjJ1FVLv4umx37hI66Bb7z/WCUlz7TSg/JWGf0qo=; b=kuZXIgX3Pb9ed4vivFew1GJ5Cn
	V6wPa+aLgP/QWfvP3TvhzMcaxd+boW4mn6KstoiociR7VrphH1AorEk/3Y+FcuV0n3fnjxjnb9BtB
	alE4BM/AZivk1SnFbB94R8IPKmCxdN3HOi4unJ1Ne8ecZT8TlSDK7yUZkndcZPyHuct6821nsuySL
	qRFQle95VZzp92LmfXue80oUVJXPlz+s6WkhQCF61+3W2YxOgvqNmHATsaEtqr+UBVtR2si+gNq2G
	Y7fOoInT/T2J3QAtkdqkfvt65tcdnqK7P1UljZU6z0Kj8uXSuqFEogsB2FOE6+avs4/RdRyoZFDUQ
	7UiUKM6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tporf-00000008CPY-1EcY;
	Wed, 05 Mar 2025 13:32:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpoSd-000000087s7-0F9d
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 13:06:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=tnKwjJ1FVLv4umx37hI66Bb7z/WCUlz7TSg/JWGf0qo=; b=GYrY/clUL5UB3jM47HcJag9PU5
	rGl4FF8ubw6uqxtXklIIRc4JsZW1UCd435s8oQuHlYKyLKpKMRSuE2UWnQ1n9kX7KFsHF3eXUtWV4
	XtSfvm7sNchOhQ7FZ+DAgDfMY9mAEwQi1RsRdCJZTDo8cA80B2eJ89PFaYgF57QeHidP2ZVnIhlLT
	PHtPAkXz72H8wiPT+vP0Z+W4mOZaH/zxZgb2Jv1R0vjSTUKhzx6jUZxUo6tA6a2lTKh/GFqvQLS2U
	vTDoILvcjVBKxGhqWkfNEmZ/cYHux4fxTdlZosWmtkiE/GPDvxEh8AI+DoF5O6DFjfqdUJL6UO5PT
	z7EJGwFQ==;
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpoSZ-00000000XR8-46co
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 13:06:53 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5e4ad1d67bdso10763071a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 05:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741180009; x=1741784809; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tnKwjJ1FVLv4umx37hI66Bb7z/WCUlz7TSg/JWGf0qo=;
        b=kK/XHZs4iIOaXPQxjwP+Uyt8LF+JYCMdfshnrG3+xI0HX722Sl/7kS9cwfOMaiJyW1
         WWrwmCWPw0XAK2keghx+j1n85t8RVBy0J7bYxaDiijhzQ3Xh7iohGumKcwgQUu12PX2R
         Xe1KDezN5tlZs4mMOpedrU/VhbTF8iq/TYG/k+rnXnK0gkDK/N/rxZxUPCesS6GWHgnQ
         F7lBhrUAT6YmGXbn3aUU6eqRq5kY9VlkRVg85T90DlwsYuBec+iFTy7+9O60SgNOZoAb
         FU/N14gJLHtHIvTYZAYCImkCwJJTWJmWexwS7V2bI7Gaxi6oUMTo+Xt8aCBK8P7jUjqv
         5j6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741180009; x=1741784809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tnKwjJ1FVLv4umx37hI66Bb7z/WCUlz7TSg/JWGf0qo=;
        b=VWvwUgmBL0mXHZ6J3wFM9FH46JdKhJXi0ANM7TMiC0oJ5wiTC5pbMZ55cByFenoxG6
         YQMhdNbqHprJ2ofWlsLWygqtal29q9j0B7JXwlsEhLehY5B1LbstEoBo5NHXI/08JSdx
         Z8KCidy4igoLHIac04F/jj+vTBD3HMC9hnkS5roQLjQ582YhGv8PCYdMiQAM2TOm9cAZ
         YxN4rAqppaE8GYdnZNNOAGSSpbckHdhzK8DT7eAZIoHAtH4rYbq76ji4+oakc6wjq2+n
         tfSJ+NFiumyJ4kxn63mW3R/xZd6zESuVJGleVoEEC+lsDVc6QND9+oU1Fhsh8ib3RfwW
         Sbwg==
X-Forwarded-Encrypted: i=1; AJvYcCWbg172vIGhCBJsK53qDzwb3F3C/HiLPyVKG58WtDBJ0iD0DF7gyU8sqVVi5e0U/eKklR70IRprD2Syv4vOwuH8@lists.infradead.org
X-Gm-Message-State: AOJu0YzQ46/EJ/iV93fuUQzIxcwcFxanOoywlA1Nh30KyeGKFS7Smhp7
	v3DnC1dW4+AaiSGF/beFPc2qyMsYmfCU3TD1R8VcnPbUuNV/osBt4ukaqoMKlSM=
X-Gm-Gg: ASbGncuxnKo0kN/XsmsGaNg2A74FHMajKkSu7AN3YhQ4yF5U9GXBqZxECXMk2JNebsa
	TFqI56Ojtbnapz0HqzRaI0ZScay1/KqCL1NZeXxxV5k7ibC7FdQx6FYT7BetfPlC9k9mh/zKCXN
	XKlsJqgwy830KkwUmXHcHy5OiM6Q4CW6SsLPtsc8CRJzyE0ufV4yBAblkwxYRCtNq66kuM+b3qd
	8hR0u09D/HyRDLbf92e2j+XR7CjaJhqxzms95nBKMQlRmC1vi1t7Fk4dfDItkIDgCHIxnNUcPJK
	EY7lDI/A7IQVe0SaqtZhIA95dJaqztjjKGJobNmz106xCRJzO7yNmCEoqR3vPlt42kuwFSK/9v6
	ggempDUeWOodQ0YJFljZsxA==
X-Google-Smtp-Source: AGHT+IFkv93UBCNyDTbp+dhfIHJd1mUccVi9lWn9kUXL6jjZpjjTaG6v7cqJg4o/sMmedLPajLbIUA==
X-Received: by 2002:a05:6402:2714:b0:5e5:437b:74a7 with SMTP id 4fb4d7f45d1cf-5e59f37c457mr2370034a12.8.1741180008509;
        Wed, 05 Mar 2025 05:06:48 -0800 (PST)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5bcd1595bsm65714a12.42.2025.03.05.05.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 05:06:46 -0800 (PST)
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
	Sumit Garg <sumit.garg@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	azarrabi@qti.qualcomm.com,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Daniel Stone <daniel@fooishbar.org>,
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v6 03/10] optee: account for direction while converting parameters
Date: Wed,  5 Mar 2025 14:04:09 +0100
Message-ID: <20250305130634.1850178-4-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250305130634.1850178-1-jens.wiklander@linaro.org>
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_130652_262574_D9A5A964 
X-CRM114-Status: GOOD (  24.22  )
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

The OP-TEE backend driver has two internal function pointers to convert
between the subsystem type struct tee_param and the OP-TEE type struct
optee_msg_param.

The conversion is done from one of the types to the other, which is then
involved in some operation and finally converted back to the original
type. When converting to prepare the parameters for the operation, all
fields must be taken into account, but then converting back, it's enough
to update only out-values and out-sizes. So, an update_out parameter is
added to the conversion functions to tell if all or only some fields
must be copied.

This is needed in a later patch where it might get confusing when
converting back in from_msg_param() callback since an allocated
restricted SHM can be using the sec_world_id of the used restricted
memory pool and that doesn't translate back well.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/tee/optee/call.c          | 10 ++--
 drivers/tee/optee/ffa_abi.c       | 43 +++++++++++++----
 drivers/tee/optee/optee_private.h | 42 +++++++++++------
 drivers/tee/optee/rpc.c           | 31 +++++++++----
 drivers/tee/optee/smc_abi.c       | 76 +++++++++++++++++++++++--------
 5 files changed, 144 insertions(+), 58 deletions(-)

diff --git a/drivers/tee/optee/call.c b/drivers/tee/optee/call.c
index 16eb953e14bb..f1533b894726 100644
--- a/drivers/tee/optee/call.c
+++ b/drivers/tee/optee/call.c
@@ -400,7 +400,8 @@ int optee_open_session(struct tee_context *ctx,
 	export_uuid(msg_arg->params[1].u.octets, &client_uuid);
 
 	rc = optee->ops->to_msg_param(optee, msg_arg->params + 2,
-				      arg->num_params, param);
+				      arg->num_params, param,
+				      false /*!update_out*/);
 	if (rc)
 		goto out;
 
@@ -427,7 +428,8 @@ int optee_open_session(struct tee_context *ctx,
 	}
 
 	if (optee->ops->from_msg_param(optee, param, arg->num_params,
-				       msg_arg->params + 2)) {
+				       msg_arg->params + 2,
+				       true /*update_out*/)) {
 		arg->ret = TEEC_ERROR_COMMUNICATION;
 		arg->ret_origin = TEEC_ORIGIN_COMMS;
 		/* Close session again to avoid leakage */
@@ -541,7 +543,7 @@ int optee_invoke_func(struct tee_context *ctx, struct tee_ioctl_invoke_arg *arg,
 	msg_arg->cancel_id = arg->cancel_id;
 
 	rc = optee->ops->to_msg_param(optee, msg_arg->params, arg->num_params,
-				      param);
+				      param, false /*!update_out*/);
 	if (rc)
 		goto out;
 
@@ -551,7 +553,7 @@ int optee_invoke_func(struct tee_context *ctx, struct tee_ioctl_invoke_arg *arg,
 	}
 
 	if (optee->ops->from_msg_param(optee, param, arg->num_params,
-				       msg_arg->params)) {
+				       msg_arg->params, true /*update_out*/)) {
 		msg_arg->ret = TEEC_ERROR_COMMUNICATION;
 		msg_arg->ret_origin = TEEC_ORIGIN_COMMS;
 	}
diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/optee/ffa_abi.c
index 4ca1d5161b82..e4b08cd195f3 100644
--- a/drivers/tee/optee/ffa_abi.c
+++ b/drivers/tee/optee/ffa_abi.c
@@ -122,15 +122,21 @@ static int optee_shm_rem_ffa_handle(struct optee *optee, u64 global_id)
  */
 
 static void from_msg_param_ffa_mem(struct optee *optee, struct tee_param *p,
-				   u32 attr, const struct optee_msg_param *mp)
+				   u32 attr, const struct optee_msg_param *mp,
+				   bool update_out)
 {
 	struct tee_shm *shm = NULL;
 	u64 offs_high = 0;
 	u64 offs_low = 0;
 
+	if (update_out) {
+		if (attr == OPTEE_MSG_ATTR_TYPE_FMEM_INPUT)
+			return;
+		goto out;
+	}
+
 	p->attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT +
 		  attr - OPTEE_MSG_ATTR_TYPE_FMEM_INPUT;
-	p->u.memref.size = mp->u.fmem.size;
 
 	if (mp->u.fmem.global_id != OPTEE_MSG_FMEM_INVALID_GLOBAL_ID)
 		shm = optee_shm_from_ffa_handle(optee, mp->u.fmem.global_id);
@@ -141,6 +147,8 @@ static void from_msg_param_ffa_mem(struct optee *optee, struct tee_param *p,
 		offs_high = mp->u.fmem.offs_high;
 	}
 	p->u.memref.shm_offs = offs_low | offs_high << 32;
+out:
+	p->u.memref.size = mp->u.fmem.size;
 }
 
 /**
@@ -150,12 +158,14 @@ static void from_msg_param_ffa_mem(struct optee *optee, struct tee_param *p,
  * @params:	subsystem internal parameter representation
  * @num_params:	number of elements in the parameter arrays
  * @msg_params:	OPTEE_MSG parameters
+ * @update_out: update parameter for output only
  *
  * Returns 0 on success or <0 on failure
  */
 static int optee_ffa_from_msg_param(struct optee *optee,
 				    struct tee_param *params, size_t num_params,
-				    const struct optee_msg_param *msg_params)
+				    const struct optee_msg_param *msg_params,
+				    bool update_out)
 {
 	size_t n;
 
@@ -166,18 +176,20 @@ static int optee_ffa_from_msg_param(struct optee *optee,
 
 		switch (attr) {
 		case OPTEE_MSG_ATTR_TYPE_NONE:
+			if (update_out)
+				break;
 			p->attr = TEE_IOCTL_PARAM_ATTR_TYPE_NONE;
 			memset(&p->u, 0, sizeof(p->u));
 			break;
 		case OPTEE_MSG_ATTR_TYPE_VALUE_INPUT:
 		case OPTEE_MSG_ATTR_TYPE_VALUE_OUTPUT:
 		case OPTEE_MSG_ATTR_TYPE_VALUE_INOUT:
-			optee_from_msg_param_value(p, attr, mp);
+			optee_from_msg_param_value(p, attr, mp, update_out);
 			break;
 		case OPTEE_MSG_ATTR_TYPE_FMEM_INPUT:
 		case OPTEE_MSG_ATTR_TYPE_FMEM_OUTPUT:
 		case OPTEE_MSG_ATTR_TYPE_FMEM_INOUT:
-			from_msg_param_ffa_mem(optee, p, attr, mp);
+			from_msg_param_ffa_mem(optee, p, attr, mp, update_out);
 			break;
 		default:
 			return -EINVAL;
@@ -188,10 +200,16 @@ static int optee_ffa_from_msg_param(struct optee *optee,
 }
 
 static int to_msg_param_ffa_mem(struct optee_msg_param *mp,
-				const struct tee_param *p)
+				const struct tee_param *p, bool update_out)
 {
 	struct tee_shm *shm = p->u.memref.shm;
 
+	if (update_out) {
+		if (p->attr == TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT)
+			return 0;
+		goto out;
+	}
+
 	mp->attr = OPTEE_MSG_ATTR_TYPE_FMEM_INPUT + p->attr -
 		   TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT;
 
@@ -211,6 +229,7 @@ static int to_msg_param_ffa_mem(struct optee_msg_param *mp,
 		memset(&mp->u, 0, sizeof(mp->u));
 		mp->u.fmem.global_id = OPTEE_MSG_FMEM_INVALID_GLOBAL_ID;
 	}
+out:
 	mp->u.fmem.size = p->u.memref.size;
 
 	return 0;
@@ -222,13 +241,15 @@ static int to_msg_param_ffa_mem(struct optee_msg_param *mp,
  * @optee:	main service struct
  * @msg_params:	OPTEE_MSG parameters
  * @num_params:	number of elements in the parameter arrays
- * @params:	subsystem itnernal parameter representation
+ * @params:	subsystem internal parameter representation
+ * @update_out: update parameter for output only
  * Returns 0 on success or <0 on failure
  */
 static int optee_ffa_to_msg_param(struct optee *optee,
 				  struct optee_msg_param *msg_params,
 				  size_t num_params,
-				  const struct tee_param *params)
+				  const struct tee_param *params,
+				  bool update_out)
 {
 	size_t n;
 
@@ -238,18 +259,20 @@ static int optee_ffa_to_msg_param(struct optee *optee,
 
 		switch (p->attr) {
 		case TEE_IOCTL_PARAM_ATTR_TYPE_NONE:
+			if (update_out)
+				break;
 			mp->attr = TEE_IOCTL_PARAM_ATTR_TYPE_NONE;
 			memset(&mp->u, 0, sizeof(mp->u));
 			break;
 		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT:
-			optee_to_msg_param_value(mp, p);
+			optee_to_msg_param_value(mp, p, update_out);
 			break;
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
-			if (to_msg_param_ffa_mem(mp, p))
+			if (to_msg_param_ffa_mem(mp, p, update_out))
 				return -EINVAL;
 			break;
 		default:
diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee_private.h
index dc0f355ef72a..20eda508dbac 100644
--- a/drivers/tee/optee/optee_private.h
+++ b/drivers/tee/optee/optee_private.h
@@ -185,10 +185,12 @@ struct optee_ops {
 				bool system_thread);
 	int (*to_msg_param)(struct optee *optee,
 			    struct optee_msg_param *msg_params,
-			    size_t num_params, const struct tee_param *params);
+			    size_t num_params, const struct tee_param *params,
+			    bool update_out);
 	int (*from_msg_param)(struct optee *optee, struct tee_param *params,
 			      size_t num_params,
-			      const struct optee_msg_param *msg_params);
+			      const struct optee_msg_param *msg_params,
+			      bool update_out);
 };
 
 /**
@@ -316,23 +318,35 @@ void optee_release(struct tee_context *ctx);
 void optee_release_supp(struct tee_context *ctx);
 
 static inline void optee_from_msg_param_value(struct tee_param *p, u32 attr,
-					      const struct optee_msg_param *mp)
+					      const struct optee_msg_param *mp,
+					      bool update_out)
 {
-	p->attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT +
-		  attr - OPTEE_MSG_ATTR_TYPE_VALUE_INPUT;
-	p->u.value.a = mp->u.value.a;
-	p->u.value.b = mp->u.value.b;
-	p->u.value.c = mp->u.value.c;
+	if (!update_out)
+		p->attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT +
+			  attr - OPTEE_MSG_ATTR_TYPE_VALUE_INPUT;
+
+	if (attr == OPTEE_MSG_ATTR_TYPE_VALUE_OUTPUT ||
+	    attr == OPTEE_MSG_ATTR_TYPE_VALUE_INOUT || !update_out) {
+		p->u.value.a = mp->u.value.a;
+		p->u.value.b = mp->u.value.b;
+		p->u.value.c = mp->u.value.c;
+	}
 }
 
 static inline void optee_to_msg_param_value(struct optee_msg_param *mp,
-					    const struct tee_param *p)
+					    const struct tee_param *p,
+					    bool update_out)
 {
-	mp->attr = OPTEE_MSG_ATTR_TYPE_VALUE_INPUT + p->attr -
-		   TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
-	mp->u.value.a = p->u.value.a;
-	mp->u.value.b = p->u.value.b;
-	mp->u.value.c = p->u.value.c;
+	if (!update_out)
+		mp->attr = OPTEE_MSG_ATTR_TYPE_VALUE_INPUT + p->attr -
+			   TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
+
+	if (p->attr == TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT ||
+	    p->attr == TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT || !update_out) {
+		mp->u.value.a = p->u.value.a;
+		mp->u.value.b = p->u.value.b;
+		mp->u.value.c = p->u.value.c;
+	}
 }
 
 void optee_cq_init(struct optee_call_queue *cq, int thread_count);
diff --git a/drivers/tee/optee/rpc.c b/drivers/tee/optee/rpc.c
index ebbbd42b0e3e..580e6b9b0606 100644
--- a/drivers/tee/optee/rpc.c
+++ b/drivers/tee/optee/rpc.c
@@ -63,7 +63,7 @@ static void handle_rpc_func_cmd_i2c_transfer(struct tee_context *ctx,
 	}
 
 	if (optee->ops->from_msg_param(optee, params, arg->num_params,
-				       arg->params))
+				       arg->params, false /*!update_out*/))
 		goto bad;
 
 	for (i = 0; i < arg->num_params; i++) {
@@ -107,7 +107,8 @@ static void handle_rpc_func_cmd_i2c_transfer(struct tee_context *ctx,
 	} else {
 		params[3].u.value.a = msg.len;
 		if (optee->ops->to_msg_param(optee, arg->params,
-					     arg->num_params, params))
+					     arg->num_params, params,
+					     true /*update_out*/))
 			arg->ret = TEEC_ERROR_BAD_PARAMETERS;
 		else
 			arg->ret = TEEC_SUCCESS;
@@ -188,6 +189,7 @@ static void handle_rpc_func_cmd_wait(struct optee_msg_arg *arg)
 static void handle_rpc_supp_cmd(struct tee_context *ctx, struct optee *optee,
 				struct optee_msg_arg *arg)
 {
+	bool update_out = false;
 	struct tee_param *params;
 
 	arg->ret_origin = TEEC_ORIGIN_COMMS;
@@ -200,15 +202,21 @@ static void handle_rpc_supp_cmd(struct tee_context *ctx, struct optee *optee,
 	}
 
 	if (optee->ops->from_msg_param(optee, params, arg->num_params,
-				       arg->params)) {
+				       arg->params, update_out)) {
 		arg->ret = TEEC_ERROR_BAD_PARAMETERS;
 		goto out;
 	}
 
 	arg->ret = optee_supp_thrd_req(ctx, arg->cmd, arg->num_params, params);
 
+	/*
+	 * Special treatment for OPTEE_RPC_CMD_SHM_ALLOC since input is a
+	 * value type, but the output is a memref type.
+	 */
+	if (arg->cmd != OPTEE_RPC_CMD_SHM_ALLOC)
+		update_out = true;
 	if (optee->ops->to_msg_param(optee, arg->params, arg->num_params,
-				     params))
+				     params, update_out))
 		arg->ret = TEEC_ERROR_BAD_PARAMETERS;
 out:
 	kfree(params);
@@ -270,7 +278,7 @@ static void handle_rpc_func_rpmb_probe_reset(struct tee_context *ctx,
 
 	if (arg->num_params != ARRAY_SIZE(params) ||
 	    optee->ops->from_msg_param(optee, params, arg->num_params,
-				       arg->params) ||
+				       arg->params, false /*!update_out*/) ||
 	    params[0].attr != TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT) {
 		arg->ret = TEEC_ERROR_BAD_PARAMETERS;
 		return;
@@ -280,7 +288,8 @@ static void handle_rpc_func_rpmb_probe_reset(struct tee_context *ctx,
 	params[0].u.value.b = 0;
 	params[0].u.value.c = 0;
 	if (optee->ops->to_msg_param(optee, arg->params,
-				     arg->num_params, params)) {
+				     arg->num_params, params,
+				     true /*update_out*/)) {
 		arg->ret = TEEC_ERROR_BAD_PARAMETERS;
 		return;
 	}
@@ -324,7 +333,7 @@ static void handle_rpc_func_rpmb_probe_next(struct tee_context *ctx,
 
 	if (arg->num_params != ARRAY_SIZE(params) ||
 	    optee->ops->from_msg_param(optee, params, arg->num_params,
-				       arg->params) ||
+				       arg->params, false /*!update_out*/) ||
 	    params[0].attr != TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT ||
 	    params[1].attr != TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT) {
 		arg->ret = TEEC_ERROR_BAD_PARAMETERS;
@@ -358,7 +367,8 @@ static void handle_rpc_func_rpmb_probe_next(struct tee_context *ctx,
 	params[0].u.value.b = rdev->descr.capacity;
 	params[0].u.value.c = rdev->descr.reliable_wr_count;
 	if (optee->ops->to_msg_param(optee, arg->params,
-				     arg->num_params, params)) {
+				     arg->num_params, params,
+				     true /*update_out*/)) {
 		arg->ret = TEEC_ERROR_BAD_PARAMETERS;
 		return;
 	}
@@ -384,7 +394,7 @@ static void handle_rpc_func_rpmb_frames(struct tee_context *ctx,
 
 	if (arg->num_params != ARRAY_SIZE(params) ||
 	    optee->ops->from_msg_param(optee, params, arg->num_params,
-				       arg->params) ||
+				       arg->params, false /*!update_out*/) ||
 	    params[0].attr != TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT ||
 	    params[1].attr != TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT) {
 		arg->ret = TEEC_ERROR_BAD_PARAMETERS;
@@ -401,7 +411,8 @@ static void handle_rpc_func_rpmb_frames(struct tee_context *ctx,
 		goto out;
 	}
 	if (optee->ops->to_msg_param(optee, arg->params,
-				     arg->num_params, params)) {
+				     arg->num_params, params,
+				     true /*update_out*/)) {
 		arg->ret = TEEC_ERROR_BAD_PARAMETERS;
 		goto out;
 	}
diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
index 165fadd9abc9..cfdae266548b 100644
--- a/drivers/tee/optee/smc_abi.c
+++ b/drivers/tee/optee/smc_abi.c
@@ -81,20 +81,26 @@ static int optee_cpuhp_disable_pcpu_irq(unsigned int cpu)
  */
 
 static int from_msg_param_tmp_mem(struct tee_param *p, u32 attr,
-				  const struct optee_msg_param *mp)
+				  const struct optee_msg_param *mp,
+				  bool update_out)
 {
 	struct tee_shm *shm;
 	phys_addr_t pa;
 	int rc;
 
+	if (update_out) {
+		if (attr == OPTEE_MSG_ATTR_TYPE_TMEM_INPUT)
+			return 0;
+		goto out;
+	}
+
 	p->attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT +
 		  attr - OPTEE_MSG_ATTR_TYPE_TMEM_INPUT;
-	p->u.memref.size = mp->u.tmem.size;
 	shm = (struct tee_shm *)(unsigned long)mp->u.tmem.shm_ref;
 	if (!shm) {
 		p->u.memref.shm_offs = 0;
 		p->u.memref.shm = NULL;
-		return 0;
+		goto out;
 	}
 
 	rc = tee_shm_get_pa(shm, 0, &pa);
@@ -103,18 +109,25 @@ static int from_msg_param_tmp_mem(struct tee_param *p, u32 attr,
 
 	p->u.memref.shm_offs = mp->u.tmem.buf_ptr - pa;
 	p->u.memref.shm = shm;
-
+out:
+	p->u.memref.size = mp->u.tmem.size;
 	return 0;
 }
 
 static void from_msg_param_reg_mem(struct tee_param *p, u32 attr,
-				   const struct optee_msg_param *mp)
+				   const struct optee_msg_param *mp,
+				   bool update_out)
 {
 	struct tee_shm *shm;
 
+	if (update_out) {
+		if (attr == OPTEE_MSG_ATTR_TYPE_RMEM_INPUT)
+			return;
+		goto out;
+	}
+
 	p->attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT +
 		  attr - OPTEE_MSG_ATTR_TYPE_RMEM_INPUT;
-	p->u.memref.size = mp->u.rmem.size;
 	shm = (struct tee_shm *)(unsigned long)mp->u.rmem.shm_ref;
 
 	if (shm) {
@@ -124,6 +137,8 @@ static void from_msg_param_reg_mem(struct tee_param *p, u32 attr,
 		p->u.memref.shm_offs = 0;
 		p->u.memref.shm = NULL;
 	}
+out:
+	p->u.memref.size = mp->u.rmem.size;
 }
 
 /**
@@ -133,11 +148,13 @@ static void from_msg_param_reg_mem(struct tee_param *p, u32 attr,
  * @params:	subsystem internal parameter representation
  * @num_params:	number of elements in the parameter arrays
  * @msg_params:	OPTEE_MSG parameters
+ * @update_out:	update parameter for output only
  * Returns 0 on success or <0 on failure
  */
 static int optee_from_msg_param(struct optee *optee, struct tee_param *params,
 				size_t num_params,
-				const struct optee_msg_param *msg_params)
+				const struct optee_msg_param *msg_params,
+				bool update_out)
 {
 	int rc;
 	size_t n;
@@ -149,25 +166,27 @@ static int optee_from_msg_param(struct optee *optee, struct tee_param *params,
 
 		switch (attr) {
 		case OPTEE_MSG_ATTR_TYPE_NONE:
+			if (update_out)
+				break;
 			p->attr = TEE_IOCTL_PARAM_ATTR_TYPE_NONE;
 			memset(&p->u, 0, sizeof(p->u));
 			break;
 		case OPTEE_MSG_ATTR_TYPE_VALUE_INPUT:
 		case OPTEE_MSG_ATTR_TYPE_VALUE_OUTPUT:
 		case OPTEE_MSG_ATTR_TYPE_VALUE_INOUT:
-			optee_from_msg_param_value(p, attr, mp);
+			optee_from_msg_param_value(p, attr, mp, update_out);
 			break;
 		case OPTEE_MSG_ATTR_TYPE_TMEM_INPUT:
 		case OPTEE_MSG_ATTR_TYPE_TMEM_OUTPUT:
 		case OPTEE_MSG_ATTR_TYPE_TMEM_INOUT:
-			rc = from_msg_param_tmp_mem(p, attr, mp);
+			rc = from_msg_param_tmp_mem(p, attr, mp, update_out);
 			if (rc)
 				return rc;
 			break;
 		case OPTEE_MSG_ATTR_TYPE_RMEM_INPUT:
 		case OPTEE_MSG_ATTR_TYPE_RMEM_OUTPUT:
 		case OPTEE_MSG_ATTR_TYPE_RMEM_INOUT:
-			from_msg_param_reg_mem(p, attr, mp);
+			from_msg_param_reg_mem(p, attr, mp, update_out);
 			break;
 
 		default:
@@ -178,20 +197,25 @@ static int optee_from_msg_param(struct optee *optee, struct tee_param *params,
 }
 
 static int to_msg_param_tmp_mem(struct optee_msg_param *mp,
-				const struct tee_param *p)
+				const struct tee_param *p, bool update_out)
 {
 	int rc;
 	phys_addr_t pa;
 
+	if (update_out) {
+		if (p->attr == TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT)
+			return 0;
+		goto out;
+	}
+
 	mp->attr = OPTEE_MSG_ATTR_TYPE_TMEM_INPUT + p->attr -
 		   TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT;
 
 	mp->u.tmem.shm_ref = (unsigned long)p->u.memref.shm;
-	mp->u.tmem.size = p->u.memref.size;
 
 	if (!p->u.memref.shm) {
 		mp->u.tmem.buf_ptr = 0;
-		return 0;
+		goto out;
 	}
 
 	rc = tee_shm_get_pa(p->u.memref.shm, p->u.memref.shm_offs, &pa);
@@ -201,19 +225,27 @@ static int to_msg_param_tmp_mem(struct optee_msg_param *mp,
 	mp->u.tmem.buf_ptr = pa;
 	mp->attr |= OPTEE_MSG_ATTR_CACHE_PREDEFINED <<
 		    OPTEE_MSG_ATTR_CACHE_SHIFT;
-
+out:
+	mp->u.tmem.size = p->u.memref.size;
 	return 0;
 }
 
 static int to_msg_param_reg_mem(struct optee_msg_param *mp,
-				const struct tee_param *p)
+				const struct tee_param *p, bool update_out)
 {
+	if (update_out) {
+		if (p->attr == TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT)
+			return 0;
+		goto out;
+	}
+
 	mp->attr = OPTEE_MSG_ATTR_TYPE_RMEM_INPUT + p->attr -
 		   TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT;
 
 	mp->u.rmem.shm_ref = (unsigned long)p->u.memref.shm;
-	mp->u.rmem.size = p->u.memref.size;
 	mp->u.rmem.offs = p->u.memref.shm_offs;
+out:
+	mp->u.rmem.size = p->u.memref.size;
 	return 0;
 }
 
@@ -223,11 +255,13 @@ static int to_msg_param_reg_mem(struct optee_msg_param *mp,
  * @msg_params:	OPTEE_MSG parameters
  * @num_params:	number of elements in the parameter arrays
  * @params:	subsystem itnernal parameter representation
+ * @update_out:	update parameter for output only
  * Returns 0 on success or <0 on failure
  */
 static int optee_to_msg_param(struct optee *optee,
 			      struct optee_msg_param *msg_params,
-			      size_t num_params, const struct tee_param *params)
+			      size_t num_params, const struct tee_param *params,
+			      bool update_out)
 {
 	int rc;
 	size_t n;
@@ -238,21 +272,23 @@ static int optee_to_msg_param(struct optee *optee,
 
 		switch (p->attr) {
 		case TEE_IOCTL_PARAM_ATTR_TYPE_NONE:
+			if (update_out)
+				break;
 			mp->attr = TEE_IOCTL_PARAM_ATTR_TYPE_NONE;
 			memset(&mp->u, 0, sizeof(mp->u));
 			break;
 		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT:
-			optee_to_msg_param_value(mp, p);
+			optee_to_msg_param_value(mp, p, update_out);
 			break;
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
 			if (tee_shm_is_dynamic(p->u.memref.shm))
-				rc = to_msg_param_reg_mem(mp, p);
+				rc = to_msg_param_reg_mem(mp, p, update_out);
 			else
-				rc = to_msg_param_tmp_mem(mp, p);
+				rc = to_msg_param_tmp_mem(mp, p, update_out);
 			if (rc)
 				return rc;
 			break;
-- 
2.43.0


