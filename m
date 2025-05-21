Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A1F7C54E92
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 10:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DTWiBkBhS2QuL+xSXWqqij2r9yFJ6qW2raK9TVRAI7Q=; b=idldzPXQKZHrBAUu86NGZYkdZK
	uCQKPIfUbkF/OaYc76PdsC39DTypOTmSjCya12BhNuaWFxI8HlTpKRMFgGIg1ohzaizmPDGXlgOkD
	wOBcn0YPYPBWo/FHmjtRonhnPNzcJtl9zxdB7s3dGFgxxzs+fozWD0TjvSJMooxtHaJG2seuDM76u
	8V2MLsgD0cI/Q8quGXnhexb2pT83bjA+dmiiS3k2O72OTIL93wQCqFuGELwCvQ9MtEf5a3gCkA7fM
	N7mxcmuCq1WiL4DBWGJKH1iUD/x6gqvL1Knqs8JVALupxIRICm9YEWR44HQ5wTaVusfEGgNsT2U48
	Ao6oCnmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHghj-0000000FSld-3Cfu;
	Wed, 21 May 2025 10:29:43 +0000
Received: from sender4-of-o55.zoho.com ([136.143.188.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHfwo-0000000FLuZ-1InC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 09:41:15 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1747820471; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=agGqAnt3Bc9RFcPTZ0KKHJHUmsmpZfMgKqzqAUcrECb5obxwgVb4Eg8EABux6BLm3kt52wE0XntHtQDdU1iSzogSSCeYjhpKOkRBzUx66aH6pUBQPHvesJOPoxIs+rvwg8Nrzt6LM3FDyKnwInsr6Jq/UJJUxTZRpWQCZURHUGo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747820471; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=DTWiBkBhS2QuL+xSXWqqij2r9yFJ6qW2raK9TVRAI7Q=; 
	b=NA+0SSKzhL9H0xgLq7m+ZKOSusHuzXi2EB7JslWSlK36AsgggbtPNTD25HiigbM63Ez6gLXU9DSv9zcTYPUchGwrmIpQpOcWyyxUsQ0CtR0eLryZI/T43yXf0m9sKupKxEqUaFGgcPbG5R27/+3sx4+U44Ps38whkT2amcz5FcQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=anirudhrb.com;
	spf=pass  smtp.mailfrom=anirudh@anirudhrb.com;
	dmarc=pass header.from=<anirudh@anirudhrb.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747820471;
	s=zoho; d=anirudhrb.com; i=anirudh@anirudhrb.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=DTWiBkBhS2QuL+xSXWqqij2r9yFJ6qW2raK9TVRAI7Q=;
	b=KUiYpN7i0A9FIjwGvhL8E7tX6SSRdDxx2GwrqhIEkpVVvT113SBHU/KC81lxu7Cf
	ABLN4oRMA1v8jKXMi5RhjNFU4vhWmW4Y9mX5dcuji9S3pde8taQSeCdkBXm5C8jenie
	j0sodbh9w1XMZm/1e96MJJ8TOLn/fWN+W/gR41P0=
Received: by mx.zohomail.com with SMTPS id 1747820468781754.4226643973292;
	Wed, 21 May 2025 02:41:08 -0700 (PDT)
From: Anirudh Rayabharam <anirudh@anirudhrb.com>
To: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>
Cc: anirudh@anirudhrb.com,
	linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] firmware: smccc: support both conduits for getting hyp UUID
Date: Wed, 21 May 2025 09:40:48 +0000
Message-Id: <20250521094049.960056-1-anirudh@anirudhrb.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_024114_560015_AC59DA01 
X-CRM114-Status: GOOD (  10.23  )
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

From: Anirudh Rayabharam (Microsoft) <anirudh@anirudhrb.com>

When Linux is running as the root partition under Microsoft Hypervisor
(MSHV) a.k.a Hyper-V, smc is used as the conduit for smc calls.

Extend arm_smccc_hypervisor_has_uuid() to support this usecase. Use
arm_smccc_1_1_invoke to retrieve and use the appropriate conduit instead
of supporting only hvc.

Boot tested on MSHV guest, MSHV root & KVM guest.

Signed-off-by: Anirudh Rayabharam (Microsoft) <anirudh@anirudhrb.com>
---
 drivers/firmware/smccc/smccc.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/firmware/smccc/smccc.c b/drivers/firmware/smccc/smccc.c
index cd65b434dc6e..bdee057db2fd 100644
--- a/drivers/firmware/smccc/smccc.c
+++ b/drivers/firmware/smccc/smccc.c
@@ -72,10 +72,7 @@ bool arm_smccc_hypervisor_has_uuid(const uuid_t *hyp_uuid)
 	struct arm_smccc_res res = {};
 	uuid_t uuid;
 
-	if (arm_smccc_1_1_get_conduit() != SMCCC_CONDUIT_HVC)
-		return false;
-
-	arm_smccc_1_1_hvc(ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID, &res);
+	arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID, &res);
 	if (res.a0 == SMCCC_RET_NOT_SUPPORTED)
 		return false;
 
-- 
2.34.1


