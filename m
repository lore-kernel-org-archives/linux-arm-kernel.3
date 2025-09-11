Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E353CAC593
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 13:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x4btL1Ny/VgPh+KNykLdZfm62nIfCyoogsQt1MKlMMs=; b=dc7zeashXrUbXb6i60MlWJgpwz
	tGCv68aWDKhpxuQOZO7MnNkzf7g4a9Bk8f4yTBFPT9WYXvHGQ8Z8m4VFaeYGAzbi/sDqMAaIP4Phh
	Mjh2qB8nxkypjf2ejM97F91SThDDsA0IFyu2XWmyyQrq7Hw+ArlnSMz8PCSLXfiKUOXr2tAjN0bAY
	3gk9uVrt/DP/rEuT5TITA0hqullrOunbVZA3m9eS2b98Zlks4VhpOS9136aO1Tkq0H3Ox+zEO35eD
	LW/rrRVuFYHwX31q+wdvhult9sl4zZgzM1FkPF8aNvIu2HsxOUFcnzzUyCn9tVv3Q/14vs0YwJ3HQ
	f9KEnjzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwhgu-00000003Lxv-1Yqy;
	Thu, 11 Sep 2025 13:50:24 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwhgs-00000003Luw-1VZn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 13:50:24 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-723ad237d1eso6593717b3.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 06:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757598621; x=1758203421; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x4btL1Ny/VgPh+KNykLdZfm62nIfCyoogsQt1MKlMMs=;
        b=OXpX4zZCZl5ycvFa7XjFHGOJkIjxWXUg35bAmsISLrdyfD2yGHab3Q2O3ZtZcvXWCc
         Wzxe5Cie9EyCKBQICXY2ppSIhHozzD4dw2+kchMhSQOaHFvym1GUB+x4UmzmwF1Ud6Pz
         Z24eMwa2fAMaSIIIS53J6bGz7Zo3xXn7H35WIw1DkQIPNZc9nn2xYv8mlOdQHdWddLUh
         pcyvqlmTE0sWBivuXYbU1DW2dwgTyHdyeoyk+6kuGfWvVse0CJNLns5cATq36lS0aJpQ
         xVbW8pv/6wVcekI9NtCa7+t2hK2VikO87rx2l/Qy4JSXqIS5HKViu436HP7odbOdtgYT
         wmGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757598621; x=1758203421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x4btL1Ny/VgPh+KNykLdZfm62nIfCyoogsQt1MKlMMs=;
        b=hoW+xiYVq4jmfy2ZMZqFs6D3HSaXoQu4QIiyM4z99ftqj0dYt8Fczh58HKLa3dHu94
         z9hE4tMLdChVDfYpoZ5tUSRbba+BcL7/Le0SlkTX0WAWGlnR2sxEGcCa9EGA4TlZsR18
         dcuQIKJ8oyfk0lIxW7UIYMcLR1bPyWlGvH3lV5SKQqh7HaWal8wqgdoJ8u6pTAOLAzGX
         w0vnSQh8Gi9MgW4NUV8hecIfOhBTKhJGGxBViI5IhxxuIu35SyJuweHptU1XsLY5H6Nm
         X2LR46b5JLYnRg+Pz9+sxgcMUDSjmOSxHxTZvfec0XNgqjfpcaXwMOhf1zIfXqHL6qTf
         BKuA==
X-Forwarded-Encrypted: i=1; AJvYcCWyk9/cCHinGE58PoBkzhhu+c3pUeIf1IJzNBmej2TfjCOVdG4lP3e+32tpMSsCg1j+5iJ7KEeD1BGUfdJl/kW+@lists.infradead.org
X-Gm-Message-State: AOJu0YzjhBiWOpruyg9LR/jtR+ujtP7dMt510Z68e3iIUgy4lb4L343a
	MmgoRJzjNAYgl0KBItv0kbk1NMvMdjXGT3JDZA9si+zYCE2ZPdEUVPkERVxKVxHGnuk=
X-Gm-Gg: ASbGnctCnl9uwha38WhWqqURevZJYrfzsQ6mxZnAkw3KWZ/GT8/9IoxCmjPR0q2a9WP
	nWEbxKwuINDoWWH2Xj3ugN/zWP3Zod1hcQqkwfdiLjhwjoUpIYeIPaiJWj0R20tZ1xBHbr2eTcH
	WN/CK+8lFYJvP8jooGdTSWMGAJ+9JAAiQV6k1/gu6vJSFerTw5LslgcTIZwxvcBY6k7JcHIB83x
	O8/LqCRck4yn9uDrNric61CjLo/yVrZlUJHZWWrbPJLRK4HT5wAbhragFJcF6c53dSdZ1LC2u6S
	Ea+ujwGuvPtGi2EsZgqjKMzOL/OM1T1/1s0FoWMvONag/VxF3bwlcpXmJhv4QQDaGiPIMX9E/K6
	roLPINyElPdIAdQd0tjO/RvGIQstanZaehMXtq5QLf7wDXgokdjNyCjkEkcGTkS1BjhkWUt1qEd
	mfQENNweVbHA==
X-Google-Smtp-Source: AGHT+IEHpsckeeWyVXpemY4tDq3wSUZW+nPm11vA/lsrhCABjpCLlAsACaAGZ/LnfZ+HJsZwehMFlQ==
X-Received: by 2002:a05:690c:6087:b0:725:25b1:c775 with SMTP id 00721157ae682-727f2bd1f4dmr151131397b3.8.1757598620963;
        Thu, 11 Sep 2025 06:50:20 -0700 (PDT)
Received: from rayden.urgonet (h-37-123-177-177.A175.priv.bahnhof.se. [37.123.177.177])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-72f7623434csm3526257b3.11.2025.09.11.06.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 06:50:19 -0700 (PDT)
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
Subject: [PATCH v12 1/9] optee: sync secure world ABI headers
Date: Thu, 11 Sep 2025 15:49:42 +0200
Message-ID: <20250911135007.1275833-2-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250911135007.1275833-1-jens.wiklander@linaro.org>
References: <20250911135007.1275833-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_065022_445185_4F3777A7 
X-CRM114-Status: GOOD (  19.42  )
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

Update the header files describing the secure world ABI, both with and
without FF-A. The ABI is extended to deal with protected memory, but as
usual backward compatible.

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/tee/optee/optee_ffa.h | 27 ++++++++---
 drivers/tee/optee/optee_msg.h | 84 ++++++++++++++++++++++++++++++-----
 drivers/tee/optee/optee_smc.h | 37 ++++++++++++++-
 3 files changed, 130 insertions(+), 18 deletions(-)

diff --git a/drivers/tee/optee/optee_ffa.h b/drivers/tee/optee/optee_ffa.h
index 257735ae5b56..cc257e7956a3 100644
--- a/drivers/tee/optee/optee_ffa.h
+++ b/drivers/tee/optee/optee_ffa.h
@@ -81,7 +81,7 @@
  *                   as the second MSG arg struct for
  *                   OPTEE_FFA_YIELDING_CALL_WITH_ARG.
  *        Bit[31:8]: Reserved (MBZ)
- * w5:	  Bitfield of secure world capabilities OPTEE_FFA_SEC_CAP_* below,
+ * w5:	  Bitfield of OP-TEE capabilities OPTEE_FFA_SEC_CAP_*
  * w6:	  The maximum secure world notification number
  * w7:	  Not used (MBZ)
  */
@@ -94,6 +94,8 @@
 #define OPTEE_FFA_SEC_CAP_ASYNC_NOTIF	BIT(1)
 /* OP-TEE supports probing for RPMB device if needed */
 #define OPTEE_FFA_SEC_CAP_RPMB_PROBE	BIT(2)
+/* OP-TEE supports Protected Memory for secure data path */
+#define OPTEE_FFA_SEC_CAP_PROTMEM	BIT(3)
 
 #define OPTEE_FFA_EXCHANGE_CAPABILITIES OPTEE_FFA_BLOCKING_CALL(2)
 
@@ -108,7 +110,7 @@
  *
  * Return register usage:
  * w3:    Error code, 0 on success
- * w4-w7: Note used (MBZ)
+ * w4-w7: Not used (MBZ)
  */
 #define OPTEE_FFA_UNREGISTER_SHM	OPTEE_FFA_BLOCKING_CALL(3)
 
@@ -119,16 +121,31 @@
  * Call register usage:
  * w3:    Service ID, OPTEE_FFA_ENABLE_ASYNC_NOTIF
  * w4:	  Notification value to request bottom half processing, should be
- *	  less than OPTEE_FFA_MAX_ASYNC_NOTIF_VALUE.
+ *	  less than OPTEE_FFA_MAX_ASYNC_NOTIF_VALUE
  * w5-w7: Not used (MBZ)
  *
  * Return register usage:
  * w3:    Error code, 0 on success
- * w4-w7: Note used (MBZ)
+ * w4-w7: Not used (MBZ)
  */
 #define OPTEE_FFA_ENABLE_ASYNC_NOTIF	OPTEE_FFA_BLOCKING_CALL(5)
 
-#define OPTEE_FFA_MAX_ASYNC_NOTIF_VALUE 64
+#define OPTEE_FFA_MAX_ASYNC_NOTIF_VALUE	64
+
+/*
+ * Release Protected memory
+ *
+ * Call register usage:
+ * w3:    Service ID, OPTEE_FFA_RECLAIM_PROTMEM
+ * w4:    Shared memory handle, lower bits
+ * w5:    Shared memory handle, higher bits
+ * w6-w7: Not used (MBZ)
+ *
+ * Return register usage:
+ * w3:    Error code, 0 on success
+ * w4-w7: Note used (MBZ)
+ */
+#define OPTEE_FFA_RELEASE_PROTMEM	OPTEE_FFA_BLOCKING_CALL(8)
 
 /*
  * Call with struct optee_msg_arg as argument in the supplied shared memory
diff --git a/drivers/tee/optee/optee_msg.h b/drivers/tee/optee/optee_msg.h
index e8840a82b983..838e1d4a22f0 100644
--- a/drivers/tee/optee/optee_msg.h
+++ b/drivers/tee/optee/optee_msg.h
@@ -133,13 +133,13 @@ struct optee_msg_param_rmem {
 };
 
 /**
- * struct optee_msg_param_fmem - ffa memory reference parameter
+ * struct optee_msg_param_fmem - FF-A memory reference parameter
  * @offs_lower:	   Lower bits of offset into shared memory reference
  * @offs_upper:	   Upper bits of offset into shared memory reference
  * @internal_offs: Internal offset into the first page of shared memory
  *		   reference
  * @size:	   Size of the buffer
- * @global_id:	   Global identifier of Shared memory
+ * @global_id:	   Global identifier of the shared memory
  */
 struct optee_msg_param_fmem {
 	u32 offs_low;
@@ -165,7 +165,7 @@ struct optee_msg_param_value {
  * @attr:	attributes
  * @tmem:	parameter by temporary memory reference
  * @rmem:	parameter by registered memory reference
- * @fmem:	parameter by ffa registered memory reference
+ * @fmem:	parameter by FF-A registered memory reference
  * @value:	parameter by opaque value
  * @octets:	parameter by octet string
  *
@@ -296,6 +296,18 @@ struct optee_msg_arg {
  */
 #define OPTEE_MSG_FUNCID_GET_OS_REVISION	0x0001
 
+/*
+ * Values used in OPTEE_MSG_CMD_LEND_PROTMEM below
+ * OPTEE_MSG_PROTMEM_RESERVED		Reserved
+ * OPTEE_MSG_PROTMEM_SECURE_VIDEO_PLAY	Secure Video Playback
+ * OPTEE_MSG_PROTMEM_TRUSTED_UI		Trused UI
+ * OPTEE_MSG_PROTMEM_SECURE_VIDEO_RECORD	Secure Video Recording
+ */
+#define OPTEE_MSG_PROTMEM_RESERVED		0
+#define OPTEE_MSG_PROTMEM_SECURE_VIDEO_PLAY	1
+#define OPTEE_MSG_PROTMEM_TRUSTED_UI		2
+#define OPTEE_MSG_PROTMEM_SECURE_VIDEO_RECORD	3
+
 /*
  * Do a secure call with struct optee_msg_arg as argument
  * The OPTEE_MSG_CMD_* below defines what goes in struct optee_msg_arg::cmd
@@ -337,15 +349,63 @@ struct optee_msg_arg {
  * OPTEE_MSG_CMD_STOP_ASYNC_NOTIF informs secure world that from now is
  * normal world unable to process asynchronous notifications. Typically
  * used when the driver is shut down.
+ *
+ * OPTEE_MSG_CMD_LEND_PROTMEM lends protected memory. The passed normal
+ * physical memory is protected from normal world access. The memory
+ * should be unmapped prior to this call since it becomes inaccessible
+ * during the request.
+ * Parameters are passed as:
+ * [in] param[0].attr			OPTEE_MSG_ATTR_TYPE_VALUE_INPUT
+ * [in] param[0].u.value.a		OPTEE_MSG_PROTMEM_* defined above
+ * [in] param[1].attr			OPTEE_MSG_ATTR_TYPE_TMEM_INPUT
+ * [in] param[1].u.tmem.buf_ptr		physical address
+ * [in] param[1].u.tmem.size		size
+ * [in] param[1].u.tmem.shm_ref		holds protected memory reference
+ *
+ * OPTEE_MSG_CMD_RECLAIM_PROTMEM reclaims a previously lent protected
+ * memory reference. The physical memory is accessible by the normal world
+ * after this function has return and can be mapped again. The information
+ * is passed as:
+ * [in] param[0].attr			OPTEE_MSG_ATTR_TYPE_VALUE_INPUT
+ * [in] param[0].u.value.a		holds protected memory cookie
+ *
+ * OPTEE_MSG_CMD_GET_PROTMEM_CONFIG get configuration for a specific
+ * protected memory use case. Parameters are passed as:
+ * [in] param[0].attr			OPTEE_MSG_ATTR_TYPE_VALUE_INOUT
+ * [in] param[0].value.a		OPTEE_MSG_PROTMEM_*
+ * [in] param[1].attr			OPTEE_MSG_ATTR_TYPE_{R,F}MEM_OUTPUT
+ * [in] param[1].u.{r,f}mem		Buffer or NULL
+ * [in] param[1].u.{r,f}mem.size	Provided size of buffer or 0 for query
+ * output for the protected use case:
+ * [out] param[0].value.a		Minimal size of protected memory
+ * [out] param[0].value.b		Required alignment of size and start of
+ *					protected memory
+ * [out] param[0].value.c               PA width, max 64
+ * [out] param[1].{r,f}mem.size		Size of output data
+ * [out] param[1].{r,f}mem		If non-NULL, contains an array of
+ *					uint32_t memory attributes that must be
+ *					included when lending memory for this
+ *					use case
+ *
+ * OPTEE_MSG_CMD_ASSIGN_PROTMEM assigns use-case to protected memory
+ * previously lent using the FFA_LEND framework ABI. Parameters are passed
+ * as:
+ * [in] param[0].attr			OPTEE_MSG_ATTR_TYPE_VALUE_INPUT
+ * [in] param[0].u.value.a		holds protected memory cookie
+ * [in] param[0].u.value.b		OPTEE_MSG_PROTMEM_* defined above
  */
-#define OPTEE_MSG_CMD_OPEN_SESSION	0
-#define OPTEE_MSG_CMD_INVOKE_COMMAND	1
-#define OPTEE_MSG_CMD_CLOSE_SESSION	2
-#define OPTEE_MSG_CMD_CANCEL		3
-#define OPTEE_MSG_CMD_REGISTER_SHM	4
-#define OPTEE_MSG_CMD_UNREGISTER_SHM	5
-#define OPTEE_MSG_CMD_DO_BOTTOM_HALF	6
-#define OPTEE_MSG_CMD_STOP_ASYNC_NOTIF	7
-#define OPTEE_MSG_FUNCID_CALL_WITH_ARG	0x0004
+#define OPTEE_MSG_CMD_OPEN_SESSION		0
+#define OPTEE_MSG_CMD_INVOKE_COMMAND		1
+#define OPTEE_MSG_CMD_CLOSE_SESSION		2
+#define OPTEE_MSG_CMD_CANCEL			3
+#define OPTEE_MSG_CMD_REGISTER_SHM		4
+#define OPTEE_MSG_CMD_UNREGISTER_SHM		5
+#define OPTEE_MSG_CMD_DO_BOTTOM_HALF		6
+#define OPTEE_MSG_CMD_STOP_ASYNC_NOTIF		7
+#define OPTEE_MSG_CMD_LEND_PROTMEM		8
+#define OPTEE_MSG_CMD_RECLAIM_PROTMEM		9
+#define OPTEE_MSG_CMD_GET_PROTMEM_CONFIG	10
+#define OPTEE_MSG_CMD_ASSIGN_PROTMEM		11
+#define OPTEE_MSG_FUNCID_CALL_WITH_ARG		0x0004
 
 #endif /* _OPTEE_MSG_H */
diff --git a/drivers/tee/optee/optee_smc.h b/drivers/tee/optee/optee_smc.h
index 879426300821..accf76a99288 100644
--- a/drivers/tee/optee/optee_smc.h
+++ b/drivers/tee/optee/optee_smc.h
@@ -264,7 +264,6 @@ struct optee_smc_get_shm_config_result {
 #define OPTEE_SMC_SEC_CAP_HAVE_RESERVED_SHM	BIT(0)
 /* Secure world can communicate via previously unregistered shared memory */
 #define OPTEE_SMC_SEC_CAP_UNREGISTERED_SHM	BIT(1)
-
 /*
  * Secure world supports commands "register/unregister shared memory",
  * secure world accepts command buffers located in any parts of non-secure RAM
@@ -280,6 +279,10 @@ struct optee_smc_get_shm_config_result {
 #define OPTEE_SMC_SEC_CAP_RPC_ARG		BIT(6)
 /* Secure world supports probing for RPMB device if needed */
 #define OPTEE_SMC_SEC_CAP_RPMB_PROBE		BIT(7)
+/* Secure world supports protected memory */
+#define OPTEE_SMC_SEC_CAP_PROTMEM		BIT(8)
+/* Secure world supports dynamic protected memory */
+#define OPTEE_SMC_SEC_CAP_DYNAMIC_PROTMEM	BIT(9)
 
 #define OPTEE_SMC_FUNCID_EXCHANGE_CAPABILITIES	9
 #define OPTEE_SMC_EXCHANGE_CAPABILITIES \
@@ -451,6 +454,38 @@ struct optee_smc_disable_shm_cache_result {
 
 /* See OPTEE_SMC_CALL_WITH_REGD_ARG above */
 #define OPTEE_SMC_FUNCID_CALL_WITH_REGD_ARG	19
+/*
+ * Get protected memory config
+ *
+ * Returns the protected memory config.
+ *
+ * Call register usage:
+ * a0   SMC Function ID, OPTEE_SMC_GET_PROTMEM_CONFIG
+ * a2-6	Not used, must be zero
+ * a7	Hypervisor Client ID register
+ *
+ * Have config return register usage:
+ * a0	OPTEE_SMC_RETURN_OK
+ * a1	Physical address of start of protected memory
+ * a2	Size of protected memory
+ * a3	PA width, max 64
+ * a4-7	Preserved
+ *
+ * Not available register usage:
+ * a0	OPTEE_SMC_RETURN_ENOTAVAIL
+ * a1-3 Not used
+ * a4-7	Preserved
+ */
+#define OPTEE_SMC_FUNCID_GET_PROTMEM_CONFIG		20
+#define OPTEE_SMC_GET_PROTMEM_CONFIG \
+	OPTEE_SMC_FAST_CALL_VAL(OPTEE_SMC_FUNCID_GET_PROTMEM_CONFIG)
+
+struct optee_smc_get_protmem_config_result {
+	unsigned long status;
+	unsigned long start;
+	unsigned long size;
+	unsigned long pa_width;
+};
 
 /*
  * Resume from RPC (for example after processing a foreign interrupt)
-- 
2.43.0


