Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B73C0C3ABB6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 22:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=17gov8UGLw19JO63i+8Tynj4+yH+shKjHULnMu5Ruz8=; b=jUT+ZANESnBQA1Pi8OK+JRXqvg
	tNZIVUgL8YO1GtmIOSm3lnhUnQPirLdNRJvy518M8q0EMVmO3U2UCN0QLpaptXOouzB4a6KGQB26G
	4g1xbYkFlVJA/3Lf1p0WVaWP+pHVXMBl7t7CUj7yHm/IcbNSs9kF/ZFxQu8K1IgVURwdsYim9DTXY
	Y3qSZWh5J+Hgp1OrF+06KT1ouLjApA5gibQgrg0Xw4nDDrQoqkO7FMCJ/xXFYCSZ/knAY0WzL5Ypp
	05F9V8OwyU9zGwcGABMXQf6xngkuiP00Nt/jVMSh34aHlftxO6xvTg0JxqF0q/Kwr1jqWvF1+5aUy
	D4+stujA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4JK-00000008ltU-3v4V;
	Mon, 05 May 2025 22:29:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC47A-00000008i3P-1bfL;
	Mon, 05 May 2025 22:16:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 40F7C43A5A;
	Mon,  5 May 2025 22:16:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74826C4CEEE;
	Mon,  5 May 2025 22:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746483403;
	bh=7mkq1wehpyT8zEaNclLrNl2PA/Y6QJyMqTDjuO215UE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Qg23aQr4UqlMt9KKxM8zCmAjf2uLJX1A+AapTi0JMlXvL2p8qDRcxdTvsUvBYMkrB
	 SziLTVCI65kFmsnoTQ4z32DouPAFyNCs2px5m31Rp+UR2q7R0Nthi7JUOd0ApbaqPd
	 7RxCrAMksLcaTYliXsrRHpbBVEGmvvcwNaYS7s73UlLePvoMpaRpo0v02MU3My1+B6
	 bR2NZ8rAIHJRFmlJjxbdbQnSH7HS67+SSYQg8y6tMAcStnbSyRRbPalKdlQS+oLABT
	 YXZEn+6THRRU8Ntpe1Cl5Q4sO6kLSn1uUca+pifS089MOp5oTzPkvY4Frn8ub7g99O
	 JflrVejDrwgiQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Stefan Wahren <wahrenst@gmx.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	florian.fainelli@broadcom.com,
	umang.jain@ideasonboard.com,
	dan.carpenter@linaro.org,
	laurent.pinchart@ideasonboard.com,
	javier.carrasco.cruz@gmail.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev
Subject: [PATCH AUTOSEL 6.14 068/642] staging: vchiq_arm: Create keep-alive thread during probe
Date: Mon,  5 May 2025 18:04:44 -0400
Message-Id: <20250505221419.2672473-68-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_151644_818956_092D0028 
X-CRM114-Status: GOOD (  11.87  )
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

From: Stefan Wahren <wahrenst@gmx.net>

[ Upstream commit 86bc8821700665ad3962f3ef0d93667f59cf7031 ]

Creating the keep-alive thread in vchiq_platform_init_state have
the following advantages:
- abort driver probe if kthread_create fails (more consistent behavior)
- make resource release process easier

Since vchiq_keepalive_thread_func is defined below
vchiq_platform_init_state, the latter must be moved.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Link: https://lore.kernel.org/r/20250309125014.37166-5-wahrenst@gmx.net
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../interface/vchiq_arm/vchiq_arm.c           | 69 +++++++++----------
 1 file changed, 34 insertions(+), 35 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 0c7ea2d0ee85e..64f9536f12329 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -280,29 +280,6 @@ static int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state
 	return 0;
 }
 
-int
-vchiq_platform_init_state(struct vchiq_state *state)
-{
-	struct vchiq_arm_state *platform_state;
-
-	platform_state = devm_kzalloc(state->dev, sizeof(*platform_state), GFP_KERNEL);
-	if (!platform_state)
-		return -ENOMEM;
-
-	rwlock_init(&platform_state->susp_res_lock);
-
-	init_completion(&platform_state->ka_evt);
-	atomic_set(&platform_state->ka_use_count, 0);
-	atomic_set(&platform_state->ka_use_ack_count, 0);
-	atomic_set(&platform_state->ka_release_count, 0);
-
-	platform_state->state = state;
-
-	state->platform_state = (struct opaque_platform_state *)platform_state;
-
-	return 0;
-}
-
 static struct vchiq_arm_state *vchiq_platform_get_arm_state(struct vchiq_state *state)
 {
 	return (struct vchiq_arm_state *)state->platform_state;
@@ -1011,6 +988,39 @@ vchiq_keepalive_thread_func(void *v)
 	return 0;
 }
 
+int
+vchiq_platform_init_state(struct vchiq_state *state)
+{
+	struct vchiq_arm_state *platform_state;
+	char threadname[16];
+
+	platform_state = devm_kzalloc(state->dev, sizeof(*platform_state), GFP_KERNEL);
+	if (!platform_state)
+		return -ENOMEM;
+
+	snprintf(threadname, sizeof(threadname), "vchiq-keep/%d",
+		 state->id);
+	platform_state->ka_thread = kthread_create(&vchiq_keepalive_thread_func,
+						   (void *)state, threadname);
+	if (IS_ERR(platform_state->ka_thread)) {
+		dev_err(state->dev, "couldn't create thread %s\n", threadname);
+		return PTR_ERR(platform_state->ka_thread);
+	}
+
+	rwlock_init(&platform_state->susp_res_lock);
+
+	init_completion(&platform_state->ka_evt);
+	atomic_set(&platform_state->ka_use_count, 0);
+	atomic_set(&platform_state->ka_use_ack_count, 0);
+	atomic_set(&platform_state->ka_release_count, 0);
+
+	platform_state->state = state;
+
+	state->platform_state = (struct opaque_platform_state *)platform_state;
+
+	return 0;
+}
+
 int
 vchiq_use_internal(struct vchiq_state *state, struct vchiq_service *service,
 		   enum USE_TYPE_E use_type)
@@ -1331,7 +1341,6 @@ void vchiq_platform_conn_state_changed(struct vchiq_state *state,
 				       enum vchiq_connstate newstate)
 {
 	struct vchiq_arm_state *arm_state = vchiq_platform_get_arm_state(state);
-	char threadname[16];
 
 	dev_dbg(state->dev, "suspend: %d: %s->%s\n",
 		state->id, get_conn_state_name(oldstate), get_conn_state_name(newstate));
@@ -1346,17 +1355,7 @@ void vchiq_platform_conn_state_changed(struct vchiq_state *state,
 
 	arm_state->first_connect = 1;
 	write_unlock_bh(&arm_state->susp_res_lock);
-	snprintf(threadname, sizeof(threadname), "vchiq-keep/%d",
-		 state->id);
-	arm_state->ka_thread = kthread_create(&vchiq_keepalive_thread_func,
-					      (void *)state,
-					      threadname);
-	if (IS_ERR(arm_state->ka_thread)) {
-		dev_err(state->dev, "suspend: Couldn't create thread %s\n",
-			threadname);
-	} else {
-		wake_up_process(arm_state->ka_thread);
-	}
+	wake_up_process(arm_state->ka_thread);
 }
 
 static const struct of_device_id vchiq_of_match[] = {
-- 
2.39.5


