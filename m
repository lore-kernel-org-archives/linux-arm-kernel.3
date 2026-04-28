Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 075EAFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 18:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7h2l5w/4MlgFymyVX4157mNdyPzUfFBWoxLZ4x6zqiU=; b=dVaJx8T08BecVRejeVFzj7cSCy
	2s1G/kP+sEVfhlwyEG2DTrxcOdjtCMeiCw7Ptf5DepsuEmlJw9ERiyo6UYihsHrKSPvv6mQD3b8Wc
	+b/MoU26iJ308+R+taNN2jpE4m60aH550AQ7wJR2liw1pgiBAO6IPAVYaRY5unNmA9zkafie1x9id
	dNSLSaklFh4x4sCH5DSnJgc/+VPwQrUSirb8ljiZRclY7RnBzFIRsDx9eVs45tEiBw57/GLymNYmp
	P8DIz/aK98rS7FpDEPzhHmfpEuM2zbmhqrPP0YZvJaRidzze5pQ2kE2XLdyPU7FbfB7Qdzm/3JWNP
	crm6EB5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHnFs-000000025F1-3qPP;
	Tue, 28 Apr 2026 18:33:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHnFn-000000025D7-2oeK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 18:33:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 230E461146;
	Tue, 28 Apr 2026 18:33:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20157C2BCB3;
	Tue, 28 Apr 2026 18:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777401230;
	bh=0gYTXT5cwiHXgjhwQq7mPkQl0OAfMOcDPdrEdHjjCvo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ozaf3kurp+MOugnbZiHhV4mumqMt0CWIXc3TmjJz+9k3+HFT50AoOX/4/pjC+sMeU
	 6hN1sgaklIpfra0+9/dpdNEvF2/pO75kLMChMyWERY4Fcnca3z8+a7XsxgKWInEK45
	 yueKt+AUXhou39YqbG2SGlKBzuSctYulIb4cCgY/8mVLjHX6eGwp056dam7wl19pyy
	 fptxJnUvTrYJlj/BlO612zFx70bZ5/s/YpSyc9GsoE4iDnqxrVwp1R54/fk4+CfJrw
	 /f26taxgq2kPyPP0mDmWn30WCyvs1XsHnebSIHBmftzeYJ10iQStSZPZE+d1Kw1rbR
	 SG+KYDolsM3vA==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Tue, 28 Apr 2026 19:33:25 +0100
Subject: [PATCH v2 01/11] firmware: arm_ffa: Check for NULL FF-A ID table
 while driver registration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-ffa_fixes-v2-1-8595ae450034@kernel.org>
References: <20260428-ffa_fixes-v2-0-8595ae450034@kernel.org>
In-Reply-To: <20260428-ffa_fixes-v2-0-8595ae450034@kernel.org>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Jens Wiklander <jens.wiklander@linaro.org>, 
 Sudeep Holla <sudeep.holla@kernel.org>
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

The bus match callback assumes that every FF-A driver provides an
id_table and dereferences it unconditionally. Enforce that contract at
registration time so a buggy client driver cannot crash the bus during
match.

Fixes: 92743071464f ("firmware: arm_ffa: Ensure drivers provide a probe function")
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_ffa/bus.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_ffa/bus.c b/drivers/firmware/arm_ffa/bus.c
index 9576862d89c4..601c3418e0d9 100644
--- a/drivers/firmware/arm_ffa/bus.c
+++ b/drivers/firmware/arm_ffa/bus.c
@@ -26,6 +26,8 @@ static int ffa_device_match(struct device *dev, const struct device_driver *drv)
 
 	id_table = to_ffa_driver(drv)->id_table;
 	ffa_dev = to_ffa_dev(dev);
+	if (!id_table)
+		return 0;
 
 	while (!uuid_is_null(&id_table->uuid)) {
 		/*
@@ -123,7 +125,7 @@ int ffa_driver_register(struct ffa_driver *driver, struct module *owner,
 {
 	int ret;
 
-	if (!driver->probe)
+	if (!driver->probe || !driver->id_table)
 		return -EINVAL;
 
 	driver->driver.bus = &ffa_bus_type;

-- 
2.43.0


