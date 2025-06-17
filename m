Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD63C71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 14:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IyoERvoh2NngP/A5TLxwVLoRH+17p8MrdSosApaXlk8=; b=m6pyzCowU8PdSxR321aC/vDTCU
	5PIB9TZYETMsKkJQ4vpNPxDpNKoiTq9NobTkowv7nsx49mriuEgL2srPQd9zCXLlna79g49Jx9GWN
	rdHZTUWs6kOdCHXIgMnTFze6JwcrWNIRjairKGzVJfmf/yhamuwEo9KRkdMX1TdO9WnNZzbjvxBPJ
	xJgZkfT/sspGu1iT78UUidqXS24PdNDaWY+pGbKiJY4ziOOxYGjq0TLwYuGaMQM5MDTKFvQvPEN8p
	D6jzee1iH2MGwEsGgTOMEsaB3FKKDspBS5HUe8TLGNuyarCnS0cpWfu6Mrem41MimKPCKoumGZX3Z
	1kVJguHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRXHV-00000007YEK-140O;
	Tue, 17 Jun 2025 14:27:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRWiG-00000007QXy-1jOw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 13:50:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 995FC150C;
	Tue, 17 Jun 2025 06:50:34 -0700 (PDT)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A3E443F673;
	Tue, 17 Jun 2025 06:50:54 -0700 (PDT)
From: Cristian Marussi <cristian.marussi@arm.com>
To: peng.fan@oss.nxp.com
Cc: arm-scmi@vger.kernel.org,
	cristian.marussi@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	peng.fan@nxp.com,
	sudeep.holla@arm.com
Subject: [PATCH] [NOT_FOR_MERGE] firmware: arm_scmi: Optimize notifiers registration
Date: Tue, 17 Jun 2025 14:50:38 +0100
Message-ID: <20250617135038.2439818-1-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250613095059.GA10033@nxa18884-linux>
References: <20250613095059.GA10033@nxa18884-linux>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_065056_594702_CA96AEFC 
X-CRM114-Status: GOOD (  19.92  )
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

Some platforms could be configured not to support notification events from
specific sources and such a case is already handled properly by avoiding
even to attempt to send a notification enable request since it would be
doomed to fail anyway.

In an extreme scenario, though, a platform could support not even one
single source on a specific event: in such a case would be meaningless to
even allow to register a notifier and we can bail-out immediately, saving
a lot of needless computation.

Flag such condition, when detected at protocol initialization time, and
reject upfront any attempt to register a notifier for such completely
unsupported events with -ENOTSUPP.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
NOT FOR MERGE until tested properly even with late loaded protocols.
DOES NOT address the issues with verobosity of messages and lack of
details about failures (which protos ? which resources ?)
---
 drivers/firmware/arm_scmi/notify.c | 39 +++++++++++++++++++++++-------
 1 file changed, 30 insertions(+), 9 deletions(-)

diff --git a/drivers/firmware/arm_scmi/notify.c b/drivers/firmware/arm_scmi/notify.c
index e160ecb22948..dee9f238f6fd 100644
--- a/drivers/firmware/arm_scmi/notify.c
+++ b/drivers/firmware/arm_scmi/notify.c
@@ -318,6 +318,9 @@ struct scmi_registered_events_desc {
  *	    customized event report
  * @num_sources: The number of possible sources for this event as stated at
  *		 events' registration time
+ * @not_supported_by_platform: A flag to indicate that not even one source was
+ *			       found to be supported by the platform for this
+ *			       event
  * @sources: A reference to a dynamically allocated array used to refcount the
  *	     events' enable requests for all the existing sources
  * @sources_mtx: A mutex to serialize the access to @sources
@@ -334,6 +337,7 @@ struct scmi_registered_event {
 	const struct scmi_event	*evt;
 	void		*report;
 	u32		num_sources;
+	bool		not_supported_by_platform;
 	refcount_t	*sources;
 	/* locking to serialize the access to sources */
 	struct mutex	sources_mtx;
@@ -811,10 +815,19 @@ int scmi_register_protocol_events(const struct scmi_handle *handle, u8 proto_id,
 		if (!r_evt->report)
 			return -ENOMEM;
 
-		for (id = 0; id < r_evt->num_sources; id++)
-			if (ee->ops->is_notify_supported &&
-			    !ee->ops->is_notify_supported(ph, r_evt->evt->id, id))
-				refcount_set(&r_evt->sources[id], NOTIF_UNSUPP);
+		if (ee->ops->is_notify_supported) {
+			int supported = 0;
+
+			for (id = 0; id < r_evt->num_sources; id++) {
+				if (!ee->ops->is_notify_supported(ph, r_evt->evt->id, id))
+					refcount_set(&r_evt->sources[id], NOTIF_UNSUPP);
+				else
+					supported++;
+			}
+
+			/* Not even one source has been found to be supported */
+			r_evt->not_supported_by_platform = !supported;
+		}
 
 		pd->registered_events[i] = r_evt;
 		/* Ensure events are updated */
@@ -936,6 +949,11 @@ static inline int scmi_bind_event_handler(struct scmi_notify_instance *ni,
 	 * of protocol instance.
 	 */
 	hash_del(&hndl->hash);
+
+	/* Bailout if event is not supported at all */
+	if (r_evt->not_supported_by_platform)
+		return -EOPNOTSUPP;
+
 	/*
 	 * Acquire protocols only for NON pending handlers, so as NOT to trigger
 	 * protocol initialization when a notifier is registered against a still
@@ -1060,6 +1078,9 @@ __scmi_event_handler_get_ops(struct scmi_notify_instance *ni,
 	r_evt = SCMI_GET_REVT(ni, KEY_XTRACT_PROTO_ID(evt_key),
 			      KEY_XTRACT_EVT_ID(evt_key));
 
+	if (r_evt && r_evt->not_supported_by_platform)
+		return ERR_PTR(-EOPNOTSUPP);
+
 	mutex_lock(&ni->pending_mtx);
 	/* Search registered events at first ... if possible at all */
 	if (r_evt) {
@@ -1087,7 +1108,7 @@ __scmi_event_handler_get_ops(struct scmi_notify_instance *ni,
 				hndl->key);
 			/* this hndl can be only a pending one */
 			scmi_put_handler_unlocked(ni, hndl);
-			hndl = NULL;
+			hndl = ERR_PTR(-EINVAL);
 		}
 	}
 	mutex_unlock(&ni->pending_mtx);
@@ -1370,8 +1391,8 @@ static int scmi_notifier_register(const struct scmi_handle *handle,
 	evt_key = MAKE_HASH_KEY(proto_id, evt_id,
 				src_id ? *src_id : SRC_ID_MASK);
 	hndl = scmi_get_or_create_handler(ni, evt_key);
-	if (!hndl)
-		return -EINVAL;
+	if (IS_ERR(hndl))
+		return PTR_ERR(hndl);
 
 	blocking_notifier_chain_register(&hndl->chain, nb);
 
@@ -1416,8 +1437,8 @@ static int scmi_notifier_unregister(const struct scmi_handle *handle,
 	evt_key = MAKE_HASH_KEY(proto_id, evt_id,
 				src_id ? *src_id : SRC_ID_MASK);
 	hndl = scmi_get_handler(ni, evt_key);
-	if (!hndl)
-		return -EINVAL;
+	if (IS_ERR(hndl))
+		return PTR_ERR(hndl);
 
 	/*
 	 * Note that this chain unregistration call is safe on its own
-- 
2.47.0


