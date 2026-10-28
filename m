Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB34606A320
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 13:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3Wb2+hju;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hv47h6cS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=466VYmHKB4yRhX0BdQY8Bw/8WoRDHBthhMiUqk6SuvQ=; b=3Wb2+hjuBWD/v8W35GR3a1dL1I
	EIoR1FDqDW2iv3yW0Pc75ckvJlFwnWhC2fg72xyOUoqBIsdIt4hc2NbGExZVE3qVbiPWFMgscdOp/
	y/p+xtSifGyCwKmi+4U4+LybVxsn87QZt7d0jDnZYR1+kNfPTggBskXuiYTuKEomseUbg4n5N2pyT
	ct3QHGxpcu+bAWN82ugD6BW/OJoPS1pOmlULd5H6FJmeEChmeF0eL7iGyx7/pYfspfh+By9EoyhXe
	XcrxwQ+PZsmReKD/xg85YZ0cV99wHIBH7vLR1DfH4FYhtI+Dwu/8p/c6WBzySepV8qgzwiRisdYqz
	9za/ieGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM3L4-000000070ff-0x0k;
	Wed, 28 Oct 2026 13:05:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM3L2-000000070ev-47ih
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 13:05:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4668E600C8;
	Wed, 28 Oct 2026 13:05:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D54BD1F01825;
	Wed, 28 Oct 2026 13:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793192708;
	bh=466VYmHKB4yRhX0BdQY8Bw/8WoRDHBthhMiUqk6SuvQ=;
	h=From:To:Cc:Subject:Date;
	b=Hv47h6cSFoOFTKVNUfvyXo6OoMM4x+ou39H0yS6bPHu8oFzUTkmoqlYGayQ/SsYD0
	 W1DCe+GXn55oVnejZqqWynjdjs/FJT/6CBFkSJRuWQuFq/YNHKM8ht2A4Smuab9HZn
	 WNNCPyP6rkbpTMVMuP/g7asOT9If7q41Xlh0m+9LmxkzPB9dFodMBq663rR/7y9LUr
	 J/KHKqKY9eJqObJlPTAhWzfIuSFVYnmt6XfDMJXoag3aOuCl1xaqrlg7kBGzqTMt/l
	 JyQ0LxNKH7OS/aL1Cao8y25JjvJGOE9lEgjG0qQK44uLKFUnHTF8KX+2h7dRoyfLrz
	 pH3zieOgsCcXw==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Peng Fan <peng.fan@nxp.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH 1/3] firmware: arm_scmi: imx: Track copied syslog words
Date: Wed, 28 Oct 2026 13:05:00 +0000
Message-ID: <20261028130502.2999676-1-sudeep.holla@kernel.org>
X-Mailer: git-send-email 2.43.0
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

The MISC syslog iterator records the number of returned words plus
firmware-reported remaining words in the caller's size output.

The debugfs consumer uses that value to dump its fixed-size buffer. A
malformed or inconsistent response can therefore make it read beyond
the copied data and allocation.

Return the accumulated number of words copied into the caller's buffer
instead. The generic iterator bounds this count to the initial buffer
capacity before processing each response.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-c3c9437c-ba1a-4db6-837f-cb0950d89018
Fixes: 4fa62e80c7db ("firmware: arm_scmi: imx: Support getting syslog of MISC protocol")
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
index 637973fb45e6..0c708b2dd496 100644
--- a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
+++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
@@ -438,7 +438,7 @@ static int iter_misc_syslog_update_state(struct scmi_iterator_state *st,
 
 	st->num_returned = RETURNED(r->numlogflags);
 	st->num_remaining = REMAINING(r->numlogflags);
-	*p->size = st->num_returned + st->num_remaining;
+	*p->size = st->desc_index + st->num_returned;
 
 	return 0;
 }
-- 
2.43.0


