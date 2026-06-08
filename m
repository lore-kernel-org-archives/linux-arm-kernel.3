Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F21EECD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 05:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2/Cp0a9gP5wzO7K0gKJb8DvCw3TdIDmmKCsdwU1/y3w=; b=kNwlPSsgNTCyBe2iPa+uWZTt6J
	P3sSGNA52LdYJ/lN3wHU7lARG6vvX1XTmh1h6gFAR1wsXucggA56dPCOeGSGBmmahNQZajHmzPxGL
	pTMxLQhKB6BCVG9MyPfUPxKouwYIoKFIdNioK2cC/FOMGyROFf+ppPZT7apgkGWsd58HTTDcKRzHZ
	7KNYpIkbabd1KUfHh6Pph10eOJ1C0/bpXtBI6p6ypVYwBK/iQi6gJHu749dOtNr/yn5DF+wme+qnJ
	o/1OZiKvmVvKHSpKxbYSmLTinC2ef5YTGzLkn/6hleScjqEe/4hcmzxrGGQKQC4AVxhtno9aW+fv1
	7/qQO7hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWSDF-00000002otk-2GWD;
	Mon, 08 Jun 2026 05:07:49 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWSDB-00000002otL-3zmd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 05:07:47 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-7e16f05fd79so39263257b3.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Jun 2026 22:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780895264; x=1781500064; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2/Cp0a9gP5wzO7K0gKJb8DvCw3TdIDmmKCsdwU1/y3w=;
        b=WG/tynPMi/iBsQypngR0JOQO2KwHhmae89e6qBr93cj/TDgFZ+6Tx+g+lcATTU3KK2
         g+0pvNDp8vdbKofx9iXc+DFXu4AqP1rWK/cZyEXijjPGYr2jTUaO8LX8rWKRVzWKGiNM
         cdIaVnnBUKLrjS+CRBdF2qT7f8j8RRZI6vMehXzmMZDHof46/j4JaM39d8b/3wGS/9Rq
         bOSpnu6TVXL7CGpdpyjZOX9zwmOYi8jgiSvTuwe2VP0cJmJkiuSfOPatMoqQ3LAvkh9g
         ngLVhMTMBmPy+nzYU2NBmEf5JZuAdKT7QlfdDcpiEVFeNesi30PB2z8KY5V7rMoVSUOV
         7V6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780895264; x=1781500064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2/Cp0a9gP5wzO7K0gKJb8DvCw3TdIDmmKCsdwU1/y3w=;
        b=btPOptQ8RaimcUcOQRnhOxY9766X6PTALFb+Ma8uv1APx7JPSk8YlQlJUG93bHFvOM
         oFmJqbrv95y8JH9Y+h4ftd6B/l21OMYnLMQ1bQc065jTqyAPayx3Or6nEYqCcr2tjAUx
         Snwyj0MaCenbjDUBj52ZnNYdUHDt3nayzfoC2+y/R2h41s6tJqqRMQ4R8C5MYbx95BzJ
         4YbdKkILmvhn2HwOR/AzJo+c7nlXWE1PSVpTuQHdFMMJNRukXdiPxkPapbbS89E29V3x
         NJWjeoq102t6yX0uZU1Vv0Tu3oiqezVa2yTioEpWQDfO1Lt4rz/Sofb99hP2T1OU8S/P
         ivRw==
X-Forwarded-Encrypted: i=1; AFNElJ81oS8thFnx+3tikwLgHW1zGnpAg9WBhRqmk+PsPGdTf+yyS/aVaCCmFRvWykEydnSLL/oeVT1O4uAZpK7NX1cS@lists.infradead.org
X-Gm-Message-State: AOJu0YxrXwHMYAYgURmNGyfgYj2E0KCGkMQHNObwOB4TJ1k60fUOwGfB
	+TYMnKdYb2V8TBuZpUIRdWqqA4kJu2+6S3LMtbzp+gVPI4XIqecxc947
X-Gm-Gg: Acq92OEKQPSk/O68tLOq4ItRmOXEwH1ZORpd/JP4tOFRSic4lsIYmkfrBnklTCdlbpV
	nVZEqfeyHMe19oaDkQiAvziWyizm7oIvnitp1318NHqyBy0IuH5C/w61DdN4KN6yAkJJgiom1pP
	sjqbQDE8MPLvRDd/1tRFezVZeDcEYjvO4n1VSefjFvcm8qysJ2u8DmjT20nriQQKcA3/dd+JWP4
	srqlnaVlDcr8ZhMVDsUN3EhWQTiFI4Qo0IeE6vLCQQOJc9iq0U7+ESD+G3OLwvQWIDjLGbOkNgy
	H+AZ4Jne7nsvQ/2I0AbObbTjsvqNWjsLzsVCJLCT9HLdKwdPDWAKQN9wD74kx8FqzcHC1ubf0M+
	C/dykTsVoGMSQ93r9b/anMcOQ9ocVRJFJmN7+ezCUGl9+24HSOtANhPSYeMmPcDht+EnrjrYLKy
	D0XX1XRhmB/R9XNS/q9vSsbrC/OPWi7ZgcpU0lblxaHaqlDXp2O4GRJ1b33v1sxL5HKiCd6rIH0
	eYJl4XNFuKNbh+WidOQu1C8Kg5r/yHAaFwhD4/0qEBPFQ==
X-Received: by 2002:a05:690c:6181:b0:7bd:73f3:7a70 with SMTP id 00721157ae682-7ed109c657bmr130266297b3.32.1780895264088;
        Sun, 07 Jun 2026 22:07:44 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7ea20ea8179sm80663187b3.2.2026.06.07.22.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 22:07:42 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: arm-scmi@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:SYSTEM CONTROL & POWER/MANAGEMENT INTERFACE (SC...),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be|_ptr)?\b)
Subject: [PATCH] firmware: arm_scmi: simplify some allocations
Date: Sun,  7 Jun 2026 22:07:24 -0700
Message-ID: <20260608050724.6358-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_220746_029600_A99C521B 
X-CRM114-Status: GOOD (  14.32  )
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

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/firmware/arm_scmi/notify.c | 42 ++++++++++++------------------
 1 file changed, 16 insertions(+), 26 deletions(-)

diff --git a/drivers/firmware/arm_scmi/notify.c b/drivers/firmware/arm_scmi/notify.c
index 40ec184eedae..45cbb3d2d684 100644
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
+	struct scmi_registered_events_desc	*registered_protocols[];
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
@@ -800,14 +797,11 @@ int scmi_register_protocol_events(const struct scmi_handle *handle, u8 proto_id,
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
@@ -1666,18 +1660,14 @@ int scmi_notification_init(struct scmi_handle *handle)
 	if (!gid)
 		return -ENOMEM;

-	ni = devm_kzalloc(handle->dev, sizeof(*ni), GFP_KERNEL);
+	ni = devm_kzalloc(handle->dev, struct_size(ni, registered_protocols, SCMI_MAX_PROTO),
+			GFP_KERNEL);
 	if (!ni)
 		goto err;

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
2.54.0


