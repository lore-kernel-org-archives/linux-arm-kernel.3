Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86DA7C43327
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 20:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KYSxXPen50jU9/mkf/L/2/YHLeSPCph0sWADACblHak=; b=Sw+Ul2aRZ8OZuqw+/B9a56zkKc
	yLm0Gfe4f/jwoVR5YHDPxVC5GO3upRETljY76kSsTInb1eILiOvFr5JDvr2UE54mkGL+6LM3FKho3
	avDaT2HrSJB2PhpLVKuKXCeFOxJw6Njn8p4cTt/FKrRb2TJM1BC3Q+r8pC5pakdyyUJwvyocgFB0w
	7+PAafPMrfRYKJV8hMWnUEZO7o5f5Pynsd6yEaaDkc6Sy/lABeQHCxsdeyA4xdKElU3SQ4bqf0kbi
	p6C90d+2pRFN4/+nAh0yOanSqimcPls51Alq6x7om9p/sBU5ykjC65X4rssl3Cb8bJPgfHFdxBS8E
	nKGy7ASA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wefQw-00000000C4M-1u9A;
	Tue, 30 Jun 2026 20:51:54 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wefQu-00000000C42-3HR6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 20:51:53 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-37fc01881f2so3270595a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 13:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782852712; x=1783457512; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KYSxXPen50jU9/mkf/L/2/YHLeSPCph0sWADACblHak=;
        b=PvizgHpdk8KWJgc3/Igt2MgBdv3MCYeI1TVi7DbiolABC0k9SCGwd5k7EYSh2oPDCq
         BYVuwPXzm0n7Il0GUjngA77trgbqw+EbRc0hWN+6JjafkXhAukzN75snHY9d9chkB9d8
         B1T3SiaZ9rMrEFcKmK3CZq32YuBtLq2n7GDPlBl3pmNpaMd1+sr/V/DqrLgHjMcH4UKI
         QbBXlOoGlwHTaB9NcmWFDUL1HG5AWNYssJ9oHRcXsW9K2YohSvlRcl6qHvkniXQh+4BY
         BimnQceE+5ekrhWj0Nmhe4lzJFXS0A7SYClKRcQsq9ipd1e5dUxVWcuzli4gd5FlRUwE
         wTfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782852712; x=1783457512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KYSxXPen50jU9/mkf/L/2/YHLeSPCph0sWADACblHak=;
        b=AqSI19nWPulIk/5gewouw5aOiGyvAz72CvjYaO5gUVrQeqoCsyXYCwmCgbD6wemx99
         Ve5us0tHgl9eiyPQ/EegwapgvlxpAV8bKBsPfNQmQLClcUL11ulf+wBdiOW+FpIy33qM
         sur3hLygT/iRFFe8jxcv78uLAbhniXuymdQq4aDoSv0HMglxWwqgGBEvQdyFYN1ibZlK
         +K/FjSD5vryd/Qo3oUyGlTSmjym1qFIjdzgsahYrQBc7Bh+10KYoNqCSAwWdGTj7fdyj
         4CmYdbADI//2bEdQTS2n3YeQ/CtMoQj+m/5uQlXQnf+XEaxO9YnqSrUNFzywkf0x3jYm
         BeyA==
X-Forwarded-Encrypted: i=1; AHgh+Rr+7Iui83uSix4g90p+Gukvt++32B41Mk7Ru6sKwBTTxfd2GhNM5WgE84j3YznzAej53cf2d0He6cCjaUNXXNjZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxNxIioof8Z/xQSZiUdqwwLdj2Yb7CC1Dh2A910n5g/8NIoD7ac
	fa/UBSOKy/v37Qf5n0wHSXIp61eI5Onfn/JjKn8/2uuaZMZYVek0+zHO
X-Gm-Gg: AfdE7ckWRRk/ARdLjxzvhPKuyZG72EdtAi+ACPsdtkifJsIEyyLMLqkzXuz9Sh6dTiH
	JizI7nrCWZdpNNp/bkes5UVId1l/BsvIZ0O15cJKN6+Vr+0XLz09cw/DlhX1EeL4FWN2G1lv2yo
	BR67GjiXIyaH1024n9rmV4D2Pjf+G2DOHqEk5pP6aymbykTPpZIBP3u2AYMyqmOeqrEjVRJygSZ
	kdoyT5O/2kVBvWfFlvX2r6lE0dgJKMTQ0nSbw7RuQrsX5xOe4MTCpLZBPT49GVm2DXD4N/802k1
	i4EubFnMUC8pZjp2aUmx77+yhHU+NccD+57tkT+zkbc9kPJ/Jgh7/xvbqmgUQomBA60xzRDd76m
	b3Tha89iMilMrXAU4kHmemTy91prx5Mm8VBvZjx5CX7Q9WpldjOeIuRyRXjhm0R2cGKiwMtjfC3
	ekFU2qPpsc0CpWnQj/g38Q9/L6DQyUGmSFZFGJcrQIZnurgt/X9102BDBVzZpseUoFNrs/abL06
	OPkAm7ZZg==
X-Received: by 2002:a17:90b:4fc3:b0:366:52fe:e749 with SMTP id 98e67ed59e1d1-38052538759mr4416067a91.5.1782852711641;
        Tue, 30 Jun 2026 13:51:51 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38096ba2a98sm441541a91.8.2026.06.30.13.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 13:51:50 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: arm-scmi@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:SYSTEM CONTROL & POWER/MANAGEMENT INTERFACE (SC...)),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be|_ptr)?\b)
Subject: [PATCHv2] firmware: arm_scmi: simplify some allocations
Date: Tue, 30 Jun 2026 13:51:49 -0700
Message-ID: <20260630205149.356798-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_135152_819928_57850B08 
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


