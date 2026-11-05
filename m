Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D19F606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 11:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FodKAECd;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dzu7lZrR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=4Ws7TqmU4/IeBwBBpZCt1tOlLLbXCOSbAUzKGumP7dA=; b=FodKAECdkyIt8050ANIO72YBF0
	hyltHteJPdEvzGv1Kwfo+H/ilITa+8a6wlzg94hcm1oUwTU/lJym4zz31gQlde6V3uMa6/bY/gApP
	U4syo5+XPm696EMacs52PCchVGtFeeMt99HKMvFveLvDhdKt54za1JZG44idwwtuqcR9N3v6w4+0e
	gkUELIVNMyaqSVb4OtndsiE3I4aSGh575CE/GjKHzTRnbPNqehq6bHJDXqiCzX5ykCOFAJP9W8lsa
	rSUCve4isg872EYixac3+EcWSSKAey0ZOahZVmMWLE6pd++RKDtfkrAsUuJsoKvD+EA4ELDIr8JbI
	unIKNCSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvci-00000008dye-0RbO;
	Thu, 05 Nov 2026 11:27:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvcg-00000008dxf-1wLa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 11:27:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A47EC60267;
	Thu,  5 Nov 2026 11:27:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46B0C1F00A16;
	Thu,  5 Nov 2026 11:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793878033;
	bh=4Ws7TqmU4/IeBwBBpZCt1tOlLLbXCOSbAUzKGumP7dA=;
	h=From:To:Cc:Subject:Date;
	b=dzu7lZrRotT8ZDOhIyjiwczcaEui94p5+LJFguUCdLTd2Jf2vz7Kr1i8Ii9PkpHGY
	 gZaRBNSnLazMlOZUX7Co1YUy3uoUzErY+BhUExeRgBSFk5uBxNc085uTweHePifpOv
	 ZbtJ/Z8Q7oCJ+5NVMLjSbANfGXPidY6xkD7R8fE6PmKcj9PjWG2TDOK/WHUl/YUndM
	 cCO8jaebPduBfVreQShHez4TnVgt2/Mqd3HGDpuL1YewPEOaGF3d8rFB17T5qBe9VY
	 uv6SkewgpaZVESiK+m5r+I0wlTN6z7/HsFeqOcvVKgJIKtTPAI4DBrjR4i8mLtwZB6
	 8MV43iwF5BWhg==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: arm-scmi@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] firmware: arm_scmi: Fix fallback to short name in scmi_pinctrl_attributes()
Date: Thu,  5 Nov 2026 11:27:05 +0000
Message-ID: <20261105112705.3045759-1-sudeep.holla@kernel.org>
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

In scmi_pinctrl_attributes(), the return value of extended_name_get()
is returned directly. If PINCTRL_NAME_GET failed, the error propagated
to callers -  aborting pin/group/function descriptor initialization,
despite the short name already being available in name.

Discard the return value of extended_name_get() and return success as
intended unconditionally after the successful PINCTRL_ATTRIBUTES
transfer. On failure, extended_name_get() won't have overwritten name,
so the short name copied from rx->name remains intact, which is exactly
the fallback behavior described by the existing comment.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-8ef1b8d2-695d-41e8-8b54-5f45fbb5eb1b
Fixes: 2145af01b9cb ("firmware: arm_scmi: Add basic support for SCMI v3.2 pincontrol protocol")
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/pinctrl.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/arm_scmi/pinctrl.c b/drivers/firmware/arm_scmi/pinctrl.c
index 42cb1aef1fe1..c8e26168a8a4 100644
--- a/drivers/firmware/arm_scmi/pinctrl.c
+++ b/drivers/firmware/arm_scmi/pinctrl.c
@@ -233,10 +233,10 @@ static int scmi_pinctrl_attributes(const struct scmi_protocol_handle *ph,
 	 * on error just carry on and use already provided short name.
 	 */
 	if (ext_name_flag)
-		ret = ph->hops->extended_name_get(ph, PINCTRL_NAME_GET,
-						  selector, (u32 *)&type, name,
-						  SCMI_MAX_STR_SIZE);
-	return ret;
+		ph->hops->extended_name_get(ph, PINCTRL_NAME_GET,
+					    selector, (u32 *)&type, name,
+					    SCMI_MAX_STR_SIZE);
+	return 0;
 }
 
 struct scmi_pinctrl_ipriv {
-- 
2.43.0


