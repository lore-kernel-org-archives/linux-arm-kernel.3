Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE71AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 20:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KYSxXPen50jU9/mkf/L/2/YHLeSPCph0sWADACblHak=; b=h2BmL5kfceiAlE9RQEuGa0+hHz
	hIXOTBpeVl7C6yJWvNPSHeuN6EzCRuj2ysgHPGx9hcIvQLGXZ2IIRY9tSp8x5K0zALHotJkDVRJoY
	Os8m8u9pWY5IYkmyuaNWTlbqN2hZ5qc1uKJf2qdhaIO55I+nQBqC92epVioVVAI55yAL+8KkNWyrl
	wcfRWHvyHwR1VkIGiwDj3/VOeyV4JBh3DIEuPMA3jcLSCRXuzxxeF79jJtmSq5wQgn8sfwGguv1Nm
	usx9EBSGVmInqnewoErwYZhiV6NsjtbTpdEpURtalGsE1rslYdttsG68LZ2qJcR8gRGNXf+s1hH9e
	kwOfSdJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wefMe-00000000Bu9-3qJs;
	Tue, 30 Jun 2026 20:47:29 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wefMZ-00000000BtY-1N3P
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 20:47:25 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-84592b55832so2541880b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 13:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782852442; x=1783457242; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KYSxXPen50jU9/mkf/L/2/YHLeSPCph0sWADACblHak=;
        b=QztcbFMHqJ5bc+JuyDfIHRQZ6PVWiLny9LQSK77H/ssc0KJ0GoGw68JE6SqmEYDjm5
         HAsu44VuEp7fAaIjEvhRz5ADbUmVv3Tdel8mfsDdcshaTtdlp+JL1NePHvpU0vxDJokJ
         a0M4g5FsJQEtX7L5xTfnI+i1hCmaI6R2CM/HyHO+KpkquiDO+FZ8RBFJ3SQeAo20B5YL
         5NXeHSjA/cMxcGjsT3/42iejMkSYwdzbSfIxU+ZJLByS3k/20ekjze001gTHtDMrEqzO
         3wl1PxU31dTr83JdzTTzcSvK70z8zfSJFnI3vsmkvq3qjeetl0+q5GLtD8c6slAIY1Lk
         XhKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782852442; x=1783457242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KYSxXPen50jU9/mkf/L/2/YHLeSPCph0sWADACblHak=;
        b=HWeQ3WFTGkNZ7HDZn3PI7rDFG6kmr4fFl47Q/PGA51J7OhcPL0huKeljaQw0zpGVm4
         fphNHsjw3vvIoUv0IpK77GpX5SWUwYh4ns1K8XyskA4jhAInUNudY+RY1iELW82NpI8d
         WeSvOv73W3F0Vf+QPuISDJoEsMKyqVvZPy2vEMbC69ua1MAmFthaCPitKqa9cLvYwMBk
         SC9kP2TTp7+I39yk1kSuxqQYtVL+ME49ygn1YySeheiS9vdywQXuZb86/9Tecxyeuirn
         R13VewjdfrppMgFzEJZJUxHbT4ltWdDeita7pQyzIRG9DZ5VumLNlY0NdwaOdqAdoQKM
         w0YA==
X-Forwarded-Encrypted: i=1; AFNElJ9fXy+CyIR3U1ESLalYhefw6zALs/RtOjVrxZKJvn72X2+nVNnloUhXSc+adAOrkIgOxRbkEXOHwclF1shOa0r2@lists.infradead.org
X-Gm-Message-State: AOJu0YyEieVwWh68LaOjLA71o6leWiLrqkqtOtoYxl6X5g/hB3pxHmEQ
	EFNWukqArTF+s1gIGcjnFJmcEohd//+vTEeC4ZRDWy0fQMtMHra2lZPm
X-Gm-Gg: AfdE7clS4tbrAKfPYUyeETlyFMDNDZZFEvn7EN5qLnE4o/qy8Tlg243/irG0eE/US8Y
	olSjMNVAkB97yVk0VZD2GX/w6ZGJY0/NvUd3awFUeweZFApRfpXJbJNJUJB3PJSKjGRn5DJ2zXO
	Coa0A/UH/b1d61X5CD5s3z4TknK6VOS1JcPj6Ev3dUF7iMog7YIeazmaQhTI9B05udVxPaMd/3H
	v+lxGel/TkF5plqT3yxWV0VWRFYHCBrdzvQ8EeCqfS8RWGU8Y0YlVKxup6H1STtusk2sUJVar7l
	aOiBEPcdS92ia7sd4QiPUPuNVGNwSmHeng+zrP7VjyoDtBMAo3d8sVj/UIZgbRZLig6hJOtIxCK
	mm5hvLm/eB2Ojcioh6btem0/7loWj8rTSOj90KDfMYLde2wH8FxTMbFGkqyWRjiQlZid6DWN48A
	jtEnw4KD/B1FscSuBbWs2dTviBgQCdgG0kTOAbnpb+jm5Wlwqt4mdJMkwhDUA3mbNs8ZeEOE4xF
	eJ/NeN0sw==
X-Received: by 2002:a05:6a00:a24e:b0:845:344f:ef1a with SMTP id d2e1a72fcca58-8479eec64e1mr4599716b3a.15.1782852441908;
        Tue, 30 Jun 2026 13:47:21 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8479ff8b454sm2773464b3a.10.2026.06.30.13.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 13:47:21 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: arm-scmi@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:SYSTEM CONTROL & POWER/MANAGEMENT INTERFACE (SC...),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be|_ptr)?\b)
Subject: [PATCHv2] firmware: arm_scmi: simplify some allocations
Date: Tue, 30 Jun 2026 13:47:19 -0700
Message-ID: <20260630204719.334211-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_134724_437223_A06E2693 
X-CRM114-Status: GOOD (  14.62  )
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

Use flexible array members to combine allocations and remove kcalloc
usage.

Add __counted_by where appropriate for extra runtime analysis. Move
counting variable assignment after allocation before any potential array
access.

Also make registered_protocols a static array. No need to use
struct_size when the value is a constant.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: fix missing struct_size.
 drivers/firmware/arm_scmi/notify.c | 42 ++++++++++++------------------
 1 file changed, 16 insertions(+), 26 deletions(-)

diff --git a/drivers/firmware/arm_scmi/notify.c b/drivers/firmware/arm_scmi/notify.c
index 40ec184eedae..8f69f2f599b2 100644
--- a/drivers/firmware/arm_scmi/notify.c
+++ b/drivers/firmware/arm_scmi/notify.c
@@ -209,11 +209,11 @@ struct scmi_registered_events_desc;
  * @init_work: A work item to perform final initializations of pending handlers
  * @notify_wq: A reference to the allocated Kernel cmwq
  * @pending_mtx: A mutex to protect @pending_events_handlers
+ * @pending_events_handlers: An hashtable containing all pending events'
+ *			     handlers descriptors
  * @registered_protocols: A statically allocated array containing pointers to
  *			  all the registered protocol-level specific information
  *			  related to events' handling
- * @pending_events_handlers: An hashtable containing all pending events'
- *			     handlers descriptors
  *
  * Each platform instance, represented by a handle, has its own instance of
  * the notification subsystem represented by this structure.
@@ -225,8 +225,8 @@ struct scmi_notify_instance {
 	struct workqueue_struct	*notify_wq;
 	/* lock to protect pending_events_handlers */
 	struct mutex		pending_mtx;
-	struct scmi_registered_events_desc	**registered_protocols;
 	DECLARE_HASHTABLE(pending_events_handlers, SCMI_PENDING_HASH_SZ);
+	struct scmi_registered_events_desc	*registered_protocols[SCMI_MAX_PROTO];
 };

 /**
@@ -276,13 +276,13 @@ struct scmi_registered_event;
  * @eh_sz: Size of the pre-allocated buffer @eh
  * @in_flight: A reference to an in flight &struct scmi_registered_event
  * @num_events: Number of events in @registered_events
- * @registered_events: A dynamically allocated array holding all the registered
- *		       events' descriptors, whose fixed-size is determined at
- *		       compile time.
  * @registered_mtx: A mutex to protect @registered_events_handlers
  * @ph: SCMI protocol handle reference
  * @registered_events_handlers: An hashtable containing all events' handlers
  *				descriptors registered for this protocol
+ * @registered_events: A dynamically allocated array holding all the registered
+ *		       events' descriptors, whose fixed-size is determined at
+ *		       compile time.
  *
  * All protocols that register at least one event have their protocol-specific
  * information stored here, together with the embedded allocated events_queue.
@@ -302,11 +302,11 @@ struct scmi_registered_events_desc {
 	size_t				eh_sz;
 	void				*in_flight;
 	int				num_events;
-	struct scmi_registered_event	**registered_events;
 	/* mutex to protect registered_events_handlers */
 	struct mutex			registered_mtx;
 	const struct scmi_protocol_handle	*ph;
 	DECLARE_HASHTABLE(registered_events_handlers, SCMI_REGISTERED_HASH_SZ);
+	struct scmi_registered_event	*registered_events[] __counted_by(num_events);
 };

 /**
@@ -338,9 +338,9 @@ struct scmi_registered_event {
 	void		*report;
 	u32		num_sources;
 	bool		not_supported_by_platform;
-	refcount_t	*sources;
 	/* locking to serialize the access to sources */
 	struct mutex	sources_mtx;
+	refcount_t	sources[] __counted_by(num_sources);
 };

 /**
@@ -706,9 +706,12 @@ scmi_allocate_registered_events_desc(struct scmi_notify_instance *ni,
 	if (WARN_ON(ni->registered_protocols[proto_id]))
 		return ERR_PTR(-EINVAL);

-	pd = devm_kzalloc(ni->handle->dev, sizeof(*pd), GFP_KERNEL);
+	pd = devm_kzalloc(ni->handle->dev, struct_size(pd, registered_events, num_events),
+			GFP_KERNEL);
 	if (!pd)
 		return ERR_PTR(-ENOMEM);
+
+	pd->num_events = num_events;
 	pd->id = proto_id;
 	pd->ops = ops;
 	pd->ni = ni;
@@ -722,12 +725,6 @@ scmi_allocate_registered_events_desc(struct scmi_notify_instance *ni,
 		return ERR_PTR(-ENOMEM);
 	pd->eh_sz = eh_sz;

-	pd->registered_events = devm_kcalloc(ni->handle->dev, num_events,
-					     sizeof(char *), GFP_KERNEL);
-	if (!pd->registered_events)
-		return ERR_PTR(-ENOMEM);
-	pd->num_events = num_events;
-
 	/* Initialize per protocol handlers table */
 	mutex_init(&pd->registered_mtx);
 	hash_init(pd->registered_events_handlers);
@@ -796,18 +793,16 @@ int scmi_register_protocol_events(const struct scmi_handle *handle, u8 proto_id,
 		int id;
 		struct scmi_registered_event *r_evt;

-		r_evt = devm_kzalloc(ni->handle->dev, sizeof(*r_evt),
+		r_evt = devm_kzalloc(ni->handle->dev,
+				     struct_size(r_evt, sources, num_sources),
 				     GFP_KERNEL);
 		if (!r_evt)
 			return -ENOMEM;
+
+		r_evt->num_sources = num_sources;
 		r_evt->proto = pd;
 		r_evt->evt = evt;

-		r_evt->sources = devm_kcalloc(ni->handle->dev, num_sources,
-					      sizeof(refcount_t), GFP_KERNEL);
-		if (!r_evt->sources)
-			return -ENOMEM;
-		r_evt->num_sources = num_sources;
 		mutex_init(&r_evt->sources_mtx);

 		r_evt->report = devm_kzalloc(ni->handle->dev,
@@ -1673,11 +1668,6 @@ int scmi_notification_init(struct scmi_handle *handle)
 	ni->gid = gid;
 	ni->handle = handle;

-	ni->registered_protocols = devm_kcalloc(handle->dev, SCMI_MAX_PROTO,
-						sizeof(char *), GFP_KERNEL);
-	if (!ni->registered_protocols)
-		goto err;
-
 	ni->notify_wq = alloc_workqueue(dev_name(handle->dev),
 					WQ_UNBOUND | WQ_FREEZABLE | WQ_SYSFS,
 					0);
--
2.55.0


