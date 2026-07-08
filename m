Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 738E2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 09:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LaHq5X9Zzq1V8bTMYdngc/5HmEjTHXhZR+fLehkk3MI=; b=NL8IRou9knEgn4rOBVe8ikgG0P
	jR7VohEvlp+oK8VQjPG+In/cdCvRZJAgPg0DOoaS32aM7EsE5nSCuQ/K+M0kwhwuaFnjFDqHmWK6I
	KiQ/U6uV0z8K11Yc9/Ar27RK/5LbH5vbrT9DP+vSOXEuq3wg/T/Rf8glAW4qd9pNsJK7Mkay2kZsW
	WJJTkHfmIsPQnRVCSzSx+B7+3TSb/J21f17HiI4fI7KUSi2w+bLsIOQm+wUhPpF0KquVNIZN6+skG
	/7RWoOqBCj/xWT0sV38IlSQ68LQDKBDwe98Fhogy2uzz/QvOJ7CR58zproEOVHG1jsoFQVGRjtWIP
	bE5yq/dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whO8x-0000000Gfy6-15se;
	Wed, 08 Jul 2026 09:00:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whO8r-0000000Gfv2-1BUo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 09:00:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 057A7412D2;
	Wed,  8 Jul 2026 09:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 571AA1F00A3A;
	Wed,  8 Jul 2026 09:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783501228;
	bh=LaHq5X9Zzq1V8bTMYdngc/5HmEjTHXhZR+fLehkk3MI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=DYO5PSoOmdlYhDfj9SlzlrtZsFMxeLXZRYLZD/kuVDK3wh7LEjhzJYJJL+hwK6y8e
	 9bsQtBgrgB+YVTgnmSEOuDGPLyDEesOglx6KdQX0kxJ3S6MijArN8Uy+kPaJqwmOwN
	 niRRbWInIv3u+KTTOk85mfVxWbQP3bBwSMWgaQ9k4n667HZY8Eq1XNi5J3+pHApvKq
	 K0YR4oYycyIcDn3+p1rTTE4JQIGjZWIPZtCgR/9J+QUZQy2mnyg7T02eODQTqXCBW+
	 DztFJ63FgBcCXOvrNGpeTlbHs5aACd4F1Ea4e3sQ7jYk2HJSkvqQPZZM+0UlXMJFhl
	 MYRlmqTuXu4+w==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Wed, 08 Jul 2026 10:00:00 +0100
Subject: [PATCH v4 04/16] firmware: arm_scmi: Free transport channel on IDR
 failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-scmi_core_fixes-v4-4-53142cd60b63@kernel.org>
References: <20260708-scmi_core_fixes-v4-0-53142cd60b63@kernel.org>
In-Reply-To: <20260708-scmi_core_fixes-v4-0-53142cd60b63@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.15.2
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

If transport channel setup succeeds but the following IDR insertion fails,
the error path destroys the transport device and frees the channel info
without invoking the transport cleanup callback.

Call chan_free() before destroying the device so transport specific
resources such as IRQs, mailbox channels and mapped shared memory are
released consistently with the normal teardown path.

Fixes: 05a2801d8b90 ("firmware: arm_scmi: Use dedicated devices to initialize channels")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/driver.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 0a8a1d9de008..9428c0777899 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2808,6 +2808,7 @@ static int scmi_chan_setup(struct scmi_info *info, struct device_node *of_node,
 			"unable to allocate SCMI idr slot err %d\n", ret);
 		/* Destroy channel and device only if created by this call. */
 		if (tdev) {
+			info->desc->ops->chan_free(prot_id, cinfo, idr);
 			of_node_put(of_node);
 			scmi_device_destroy(info->dev, prot_id, name);
 			devm_kfree(info->dev, cinfo);

-- 
2.43.0


