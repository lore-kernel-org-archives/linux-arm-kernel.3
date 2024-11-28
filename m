Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB007D69113
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 15:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nSDQWd9UZqV/STl4BJjbppPEGE1hH0ufO/G2aXdmVa4=; b=Q2IaZpXG+q0y4cMA/JlKMscvHk
	TWTjwcv80XGOW7qelRT/1lEITvNs5WHdYaLq51XPkmaRrc6qbpyA6PSGBVLGUsQLyepPIvkY9VAMs
	uVdAs9g4dexRzPYx5urEvIKTF+ceyiSWpaSc2vv9W9VJYoY2EVx62qkDqNY8HSaaNoYe1J2svXw5y
	Cqc3wpXt9VZzPiXs2JocqNvU2Y57GdnLcURC4P40y2PJR+VgzGhrPl6KGz2udCw8oH+FUwfHXqEWm
	TmPDhAj+JvkL+kFIMLDDY9Ks1Km5m1a6mlRPniQb/r5NM5cni7Nh3Ua7aFNJaQnduusA1B8PrLcoN
	+LImTWrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGgD5-0000000Fqh7-0azl;
	Thu, 28 Nov 2024 15:13:39 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGg9K-0000000Fpu4-03bA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 15:09:47 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-aa543c4db92so124610066b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Nov 2024 07:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732806584; x=1733411384; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nSDQWd9UZqV/STl4BJjbppPEGE1hH0ufO/G2aXdmVa4=;
        b=TtdL8xGsimzs0ZL98lH03vr1pK4ji32QiWKSKjJR/7+cqCXJWJv0NNJ9vLGXiJNrNr
         +ydn6tLJaGuidCVErs7fNFkr0PQRzKeq78HSuhkghCWnmCt2KwP+NnSPOj8AKv92k42G
         T14fB225QR1FUHe2q8t0WND8RvzKi9XbRRpSlvo1X/CbR5+sf/9QQTgok0kS8KNdVNUv
         ac5TTBRMrVuXTw9EpwADoE4fo+z2W2ijRoTDds0eviurZTVRNHBZYhsr6zLKe9Nf7xB3
         uijUfCixsNNHtPzOi5tkcQpbdLo2O63WYwxS5g6wcTVoqqzuLL/+NnhSSkzu8js5SYCu
         fYyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732806584; x=1733411384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nSDQWd9UZqV/STl4BJjbppPEGE1hH0ufO/G2aXdmVa4=;
        b=O3qt/KnIIuklW/UuHpsU1q7PKBMUuM+QqXJomYcPcbB4rQpOpmfSTrzNkNCxkuO0mC
         cDIzO7tyWagFMAJL4Al5aUDRPfgn2nIngV87Xrzrp5scuId8mEPOnS2A7PU0feoD2Y3w
         S3+7KXO5KPbwq90LEkCaKU/bXeSks9YtvFCTObUn9yN7xoiZ6EIb68ViqNGsy91oqihc
         TV5mtX3YYlhzwZpp79CnOV5TJO9X+54n1tfrcqC8uWFSTzONYqBTje0ziCS6e+Ti2bNT
         UMF08iffPVAXCiaALQFH3PIEyMDSEBGHqWkRpbro4dfEpI0AAh42LBtzRvl0cXYf1QGt
         cDiA==
X-Forwarded-Encrypted: i=1; AJvYcCWAWqXOEBl2KDnm7FChLVy5Y88qDN3L+8CBC5MqZ0IofdrswmZSr3JMEVa/fIhnx6eM15lInD4uchCUbsfP4Xv0@lists.infradead.org
X-Gm-Message-State: AOJu0Ywz4EnytOEHWIZwYMuamBLvhqlsrZ3FrX1Zz6DtEeX9r1Fe2iRn
	uGUZHHowvy4Q2jFXeG8dF68q3au33eL8AtHyW2wSlBBH91JKU/8PrAC9KPvtfyYuerlu+ltmVJI
	E
X-Gm-Gg: ASbGncs3qEctBLJTKE1Xh18WopvrIFjB0Jr7bgf2Tag4ui+QWglQhIQVhp8wXomyefM
	u9W/gLzIvREV+JWtK4h7blCz7W2UrfwLNuOV8jPWK2/43pLQLTY2CVgG7SxU/cfZHVpt02xO5S3
	GjLeR/mhs6wrQaq1wSyEzosyK9FQ1/NSSkTDbe3GmfiMj64d3rGAv5rLkjpsFY2B+pAe8NQAsar
	7Ez/uRq2nOgBuY3YgynYFnalCafwiakjm+o/AH/h9RExFWsTYZEuzBp5YjOXDlvymv1UDOafLX5
	ReLA/pCI+DwFil2+bUQNGe1h
X-Google-Smtp-Source: AGHT+IFczydmRUVLph98ARVeS7m39ferHjNypQC0GBkaMIew+rg3FObFAMkzk7HUaoGXVR1JZIiMyg==
X-Received: by 2002:a17:906:23e9:b0:aa5:41b2:e23c with SMTP id a640c23a62f3a-aa581062cacmr618603066b.54.1732806584114;
        Thu, 28 Nov 2024 07:09:44 -0800 (PST)
Received: from rayden.urgonet (h-79-136-84-141.A175.priv.bahnhof.se. [79.136.84.141])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa59990a78esm75711366b.163.2024.11.28.07.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 07:09:43 -0800 (PST)
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
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v3 3/4] optee: sync secure world ABI headers
Date: Thu, 28 Nov 2024 16:09:03 +0100
Message-ID: <20241128150927.1377981-4-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241128150927.1377981-1-jens.wiklander@linaro.org>
References: <20241128150927.1377981-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_070946_056238_FF862A0F 
X-CRM114-Status: GOOD (  19.41  )
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
without FF-A. The ABI is extended to deal with restricted memory, but as
usual backward compatible.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/tee/optee/optee_ffa.h | 27 ++++++++++---
 drivers/tee/optee/optee_msg.h | 65 ++++++++++++++++++++++++++++++--
 drivers/tee/optee/optee_smc.h | 71 ++++++++++++++++++++++++++++++++++-
 3 files changed, 154 insertions(+), 9 deletions(-)

diff --git a/drivers/tee/optee/optee_ffa.h b/drivers/tee/optee/optee_ffa.h
index 257735ae5b56..7bd037200343 100644
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
+/* OP-TEE supports Restricted Memory for secure data path */
+#define OPTEE_FFA_SEC_CAP_RSTMEM	BIT(3)
 
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
+ * Release Restricted memory
+ *
+ * Call register usage:
+ * w3:    Service ID, OPTEE_FFA_RECLAIM_RSTMEM
+ * w4:    Shared memory handle, lower bits
+ * w5:    Shared memory handle, higher bits
+ * w6-w7: Not used (MBZ)
+ *
+ * Return register usage:
+ * w3:    Error code, 0 on success
+ * w4-w7: Note used (MBZ)
+ */
+#define OPTEE_FFA_RELEASE_RSTMEM	OPTEE_FFA_BLOCKING_CALL(8)
 
 /*
  * Call with struct optee_msg_arg as argument in the supplied shared memory
diff --git a/drivers/tee/optee/optee_msg.h b/drivers/tee/optee/optee_msg.h
index e8840a82b983..1b558526e7d9 100644
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
+ * Values used in OPTEE_MSG_CMD_LEND_RSTMEM below
+ * OPTEE_MSG_RSTMEM_RESERVED		Reserved
+ * OPTEE_MSG_RSTMEM_SECURE_VIDEO_PLAY	Secure Video Playback
+ * OPTEE_MSG_RSTMEM_TRUSTED_UI		Trused UI
+ * OPTEE_MSG_RSTMEM_SECURE_VIDEO_RECORD	Secure Video Recording
+ */
+#define OPTEE_MSG_RSTMEM_RESERVED		0
+#define OPTEE_MSG_RSTMEM_SECURE_VIDEO_PLAY	1
+#define OPTEE_MSG_RSTMEM_TRUSTED_UI		2
+#define OPTEE_MSG_RSTMEM_SECURE_VIDEO_RECORD	3
+
 /*
  * Do a secure call with struct optee_msg_arg as argument
  * The OPTEE_MSG_CMD_* below defines what goes in struct optee_msg_arg::cmd
@@ -337,6 +349,49 @@ struct optee_msg_arg {
  * OPTEE_MSG_CMD_STOP_ASYNC_NOTIF informs secure world that from now is
  * normal world unable to process asynchronous notifications. Typically
  * used when the driver is shut down.
+ *
+ * OPTEE_MSG_CMD_LEND_RSTMEM lends restricted memory. The passed normal
+ * physical memory is restricted from normal world access. The memory
+ * should be unmapped prior to this call since it becomes inaccessible
+ * during the request.
+ * Parameters are passed as:
+ * [in] param[0].attr			OPTEE_MSG_ATTR_TYPE_VALUE_INPUT
+ * [in] param[0].u.value.a		OPTEE_MSG_RSTMEM_* defined above
+ * [in] param[1].attr			OPTEE_MSG_ATTR_TYPE_TMEM_INPUT
+ * [in] param[1].u.tmem.buf_ptr		physical address
+ * [in] param[1].u.tmem.size		size
+ * [in] param[1].u.tmem.shm_ref		holds restricted memory reference
+ *
+ * OPTEE_MSG_CMD_RECLAIM_RSTMEM reclaims a previously lent restricted
+ * memory reference. The physical memory is accessible by the normal world
+ * after this function has return and can be mapped again. The information
+ * is passed as:
+ * [in] param[0].attr			OPTEE_MSG_ATTR_TYPE_VALUE_INPUT
+ * [in] param[0].u.value.a		holds restricted memory cookie
+ *
+ * OPTEE_MSG_CMD_GET_RSTMEM_CONFIG get configuration for a specific
+ * restricted memory use case. Parameters are passed as:
+ * [in] param[0].attr			OPTEE_MSG_ATTR_TYPE_VALUE_INOUT
+ * [in] param[0].value.a		OPTEE_MSG_RSTMEM_*
+ * [in] param[1].attr			OPTEE_MSG_ATTR_TYPE_{R,F}MEM_OUTPUT
+ * [in] param[1].u.{r,f}mem		Buffer or NULL
+ * [in] param[1].u.{r,f}mem.size	Provided size of buffer or 0 for query
+ * output for the restricted use case:
+ * [out] param[0].value.a		Minimal size of SDP memory
+ * [out] param[0].value.b		Required alignment of size and start of
+ *					restricted memory
+ * [out] param[1].{r,f}mem.size		Size of output data
+ * [out] param[1].{r,f}mem		If non-NULL, contains an array of
+ *					uint16_t holding endpoints that
+ *					must be included when lending
+ *					memory for this use case
+ *
+ * OPTEE_MSG_CMD_ASSIGN_RSTMEM assigns use-case to restricted memory
+ * previously lent using the FFA_LEND framework ABI. Parameters are passed
+ * as:
+ * [in] param[0].attr			OPTEE_MSG_ATTR_TYPE_VALUE_INPUT
+ * [in] param[0].u.value.a		holds restricted memory cookie
+ * [in] param[0].u.value.b		OPTEE_MSG_RSTMEM_* defined above
  */
 #define OPTEE_MSG_CMD_OPEN_SESSION	0
 #define OPTEE_MSG_CMD_INVOKE_COMMAND	1
@@ -346,6 +401,10 @@ struct optee_msg_arg {
 #define OPTEE_MSG_CMD_UNREGISTER_SHM	5
 #define OPTEE_MSG_CMD_DO_BOTTOM_HALF	6
 #define OPTEE_MSG_CMD_STOP_ASYNC_NOTIF	7
+#define OPTEE_MSG_CMD_LEND_RSTMEM	8
+#define OPTEE_MSG_CMD_RECLAIM_RSTMEM	9
+#define OPTEE_MSG_CMD_GET_RSTMEM_CONFIG	10
+#define OPTEE_MSG_CMD_ASSIGN_RSTMEM	11
 #define OPTEE_MSG_FUNCID_CALL_WITH_ARG	0x0004
 
 #endif /* _OPTEE_MSG_H */
diff --git a/drivers/tee/optee/optee_smc.h b/drivers/tee/optee/optee_smc.h
index 879426300821..abc379ce190c 100644
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
+/* Secure world supports Secure Data Path */
+#define OPTEE_SMC_SEC_CAP_SDP			BIT(8)
+/* Secure world supports dynamic restricted memory */
+#define OPTEE_SMC_SEC_CAP_DYNAMIC_RSTMEM	BIT(9)
 
 #define OPTEE_SMC_FUNCID_EXCHANGE_CAPABILITIES	9
 #define OPTEE_SMC_EXCHANGE_CAPABILITIES \
@@ -451,6 +454,72 @@ struct optee_smc_disable_shm_cache_result {
 
 /* See OPTEE_SMC_CALL_WITH_REGD_ARG above */
 #define OPTEE_SMC_FUNCID_CALL_WITH_REGD_ARG	19
+/*
+ * Get Secure Data Path memory config
+ *
+ * Returns the Secure Data Path memory config.
+ *
+ * Call register usage:
+ * a0   SMC Function ID, OPTEE_SMC_GET_SDP_CONFIG
+ * a2-6	Not used, must be zero
+ * a7	Hypervisor Client ID register
+ *
+ * Have config return register usage:
+ * a0	OPTEE_SMC_RETURN_OK
+ * a1	Physical address of start of SDP memory
+ * a2	Size of SDP memory
+ * a3	Not used
+ * a4-7	Preserved
+ *
+ * Not available register usage:
+ * a0	OPTEE_SMC_RETURN_ENOTAVAIL
+ * a1-3 Not used
+ * a4-7	Preserved
+ */
+#define OPTEE_SMC_FUNCID_GET_SDP_CONFIG		20
+#define OPTEE_SMC_GET_SDP_CONFIG \
+	OPTEE_SMC_FAST_CALL_VAL(OPTEE_SMC_FUNCID_GET_SDP_CONFIG)
+
+struct optee_smc_get_sdp_config_result {
+	unsigned long status;
+	unsigned long start;
+	unsigned long size;
+	unsigned long flags;
+};
+
+/*
+ * Get Secure Data Path dynamic memory config
+ *
+ * Returns the Secure Data Path dynamic memory config.
+ *
+ * Call register usage:
+ * a0	SMC Function ID, OPTEE_SMC_GET_DYN_SHM_CONFIG
+ * a2-6	Not used, must be zero
+ * a7	Hypervisor Client ID register
+ *
+ * Have config return register usage:
+ * a0	OPTEE_SMC_RETURN_OK
+ * a1	Minamal size of SDP memory
+ * a2	Required alignment of size and start of registered SDP memory
+ * a3	Not used
+ * a4-7	Preserved
+ *
+ * Not available register usage:
+ * a0	OPTEE_SMC_RETURN_ENOTAVAIL
+ * a1-3 Not used
+ * a4-7	Preserved
+ */
+
+#define OPTEE_SMC_FUNCID_GET_DYN_SDP_CONFIG	21
+#define OPTEE_SMC_GET_DYN_SDP_CONFIG \
+	OPTEE_SMC_FAST_CALL_VAL(OPTEE_SMC_FUNCID_GET_DYN_SDP_CONFIG)
+
+struct optee_smc_get_dyn_sdp_config_result {
+	unsigned long status;
+	unsigned long size;
+	unsigned long align;
+	unsigned long flags;
+};
 
 /*
  * Resume from RPC (for example after processing a foreign interrupt)
-- 
2.43.0


