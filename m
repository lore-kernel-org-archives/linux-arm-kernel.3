Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98697C44500
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 16:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/cSGQxcB2p2Gyuq3R/odzpGEXeoQPr+VuqI6gIHS/2M=; b=BejPqTGX7A1QpKzQrro8tB9839
	eVtvT3palOMqZ3i+EgF7RBwVhCrN1FKqqp+syMs3T+zWYhie/cqUpUFuzf8Kt1hnxVU0oZXZn+78a
	SsmgSkNI3+b1h21uvkCn5awci9ZOFpV/7SnXQT4neO9DfQvQKJVl5Nd9NokvAAQZ2vNjuC5gQ0gbd
	dbTy9SYxPe8AARdQ5x9w+wPmm3dDbkctcKWDNUCi+mjNFuOJqeRVmVLMqrWm41GZNQ2Vey7gpG8K6
	VM1D+PiwCDQ/6G2WhFFmBH3A5moE626aV1qkSZCiMxrjVPCikKuuoR3DiCIscmDmdOXeYOsmAaaHc
	LbgQZyNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyBe-00000002b0o-1tds;
	Wed, 01 Jul 2026 16:53:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyBb-00000002ayv-3qCC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 16:53:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AABA54013E;
	Wed,  1 Jul 2026 16:53:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06FB71F000E9;
	Wed,  1 Jul 2026 16:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782924799;
	bh=/cSGQxcB2p2Gyuq3R/odzpGEXeoQPr+VuqI6gIHS/2M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=nUivfTGUboF6NUpuDFIuYdEaTJUOVukxZ757IaDOfO27N9G1WQlVtWlLKsLkM+U0I
	 j+spLyakyos4VT6bGUCGDR+wMeRA6t7lVTKdoEQmTd4pqSTgK1Xi8/VcXwxAKUvRer
	 ovhjFdWWcn7XtUXtIW0gviAF4a0PAF0RdC34gQ271Tk7ffK8HkMIizQ6XuyB27GM77
	 jXQWSr4LpEPRTQemBg2673rJSpqcNJXjrYIN1lBL9Zy8SH0KwopFeiRpumyI3gWs67
	 hHPzEkKxaGHOa1V7+jwtXKP++rh2QY0o58/9kslprWGpJNBs6rjc/LJuH2Czhb2j71
	 NK911/hXG4DuQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Wed, 01 Jul 2026 17:52:24 +0100
Subject: [PATCH v2 03/14] firmware: arm_scmi: Clean up channels on setup
 failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-scmi_core_fixes-v2-3-1f5e85553f73@kernel.org>
References: <20260701-scmi_core_fixes-v2-0-1f5e85553f73@kernel.org>
In-Reply-To: <20260701-scmi_core_fixes-v2-0-1f5e85553f73@kernel.org>
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

scmi_channels_setup() can fail after the common BASE channel or earlier
protocol channels have already been registered in the TX/RX IDRs.

Route this failure through the existing channel cleanup label so the
transport channels, transport devices and IDR state created before the
failure are released before the probe error path frees the SCMI instance
ID.

Fixes: 05a2801d8b90 ("firmware: arm_scmi: Use dedicated devices to initialize channels")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/driver.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index b9ba566fc759..861087b2920e 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -3262,7 +3262,7 @@ static int scmi_probe(struct platform_device *pdev)
 	ret = scmi_channels_setup(info);
 	if (ret) {
 		err_str = "failed to setup channels\n";
-		goto clear_ida;
+		goto clear_txrx_setup;
 	}
 
 	ret = bus_register_notifier(&scmi_bus_type, &info->bus_nb);
@@ -3377,7 +3377,6 @@ static int scmi_probe(struct platform_device *pdev)
 	bus_unregister_notifier(&scmi_bus_type, &info->bus_nb);
 clear_txrx_setup:
 	scmi_cleanup_txrx_channels(info);
-clear_ida:
 	ida_free(&scmi_id, info->id);
 
 out_err:

-- 
2.43.0


