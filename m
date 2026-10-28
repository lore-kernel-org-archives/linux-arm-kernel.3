Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5217D606A320
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 13:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=o50D/qBL;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T5KDMnv6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Lupen3Bz7z6fzGugIVqcT5Cw4W+hgoB1rBA+DEWqbiw=; b=o50D/qBLkh5II3
	3RE336TfkSOoXtq7IJfvkw8F+z3sE2dkfvIzhPdSq7ESPopDX0wLaRIciDL5azeixBshVxASu3ob6
	6cyIfeT8NjQZH2vEocHb2cFI56Hcd3rd5fLnzbo+GpsBwS4DB21FmMWbIUyYVv7fcxqW9xbig2k+3
	PsXVDwMWEDpDX57TuUUe4/djWUoNqaDAE7/Wlv5CAPF/z6FQ36zZbgchMK+nHJr4P7FN1moO4u3Ah
	6vn0qzf4vTa5jOvJ6F7a4gCrF1ofs9/e5B3LiucjgIfD8mzOwuBNWYv7dweOfv292Ho/wlpmeCYHt
	8NCodZftphc274Mdcsgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM3LA-000000070iW-0d3Y;
	Wed, 28 Oct 2026 13:05:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM3L5-000000070gK-1G5Z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 13:05:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1518843D75;
	Wed, 28 Oct 2026 13:05:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D157C1F031E0;
	Wed, 28 Oct 2026 13:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793192711;
	bh=Lupen3Bz7z6fzGugIVqcT5Cw4W+hgoB1rBA+DEWqbiw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=T5KDMnv6A1NFN4vPEdpRUQJ718pEuJGhdnw85GpT4/p4nvfAuyHSXPMP8bhzsuhmL
	 zEgoBoaPEtS79y+fBobpSArdWJXco0sWNWQiOBuEj8W4LMPzMbARmYGjQc7hyPQFZv
	 M7xC6d8RJ9QLAsgYbYIEBTKpI9y4JfMwzSrS6c/Oih6YsR/9sYwfecDi/dXAEB3S6e
	 rW18zVk3HY4jnQuomP+Z26hA1DNhGTAd7ubevGWA09QwWKz0NDjpZcnzZzdmGLFibl
	 X14HOB36UaqCVEo+X1A8l80RZvd50DGGrwBd0zPo/KLSb3yiiHogeNLGNVLUq25EC7
	 7LPB5ZVWplvmA==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Peng Fan <peng.fan@nxp.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH 3/3] firmware: arm_scmi: Unregister notifier on enable failure
Date: Wed, 28 Oct 2026 13:05:02 +0000
Message-ID: <20261028130502.2999676-3-sudeep.holla@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028130502.2999676-2-sudeep.holla@kernel.org>
References: <20261028130502.2999676-1-sudeep.holla@kernel.org>
 <20261028130502.2999676-2-sudeep.holla@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

scmi_notifier_register() adds the caller's notifier block before
enabling the corresponding event at the platform.

If enablement fails, the caller receives an error and can free its
notifier block. A concurrent registration can retain and later enable
the handler, leaving the failed caller's block in its notification
chain. Event delivery can then dereference the freed block.

Remove the notifier block before dropping the handler reference when
event enablement fails.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-c3c9437c-ba1a-4db6-837f-cb0950d89018
Fixes: e7c215f358a3 ("firmware: arm_scmi: Add notification callbacks-registration")
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/notify.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/notify.c b/drivers/firmware/arm_scmi/notify.c
index fb60fb07c0ed..e5de0d29c346 100644
--- a/drivers/firmware/arm_scmi/notify.c
+++ b/drivers/firmware/arm_scmi/notify.c
@@ -1395,8 +1395,10 @@ static int scmi_notifier_register(const struct scmi_handle *handle,
 	/* Enable events for not pending handlers */
 	if (!IS_HNDL_PENDING(hndl)) {
 		ret = scmi_event_handler_enable_events(hndl);
-		if (ret)
+		if (ret) {
+			blocking_notifier_chain_unregister(&hndl->chain, nb);
 			scmi_put_handler(ni, hndl);
+		}
 	}
 
 	return ret;
-- 
2.43.0


