Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49761CD342F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 17:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vFkF4r3cnDFkhi+j4GTrq3+5DB9oT6IAsx04T5OXzoY=; b=x/yIHtySbxporxHlOfeQG1gPom
	nBp795gtcnLN9VNY4GMsjtVDSXjDe3mRSMza8mXEvDEyiFe9zl9PUQlNOxDufTpAHvvik9TkdMqxH
	Vgs4v1QWJxz6x6buRY18KhTaQ3t43b/jj2TO/L2h0pBZD1fR4ouE6eKJ2cc8sjmRf5qT9c4KaELLN
	phzKm7G4DlhZ8iJJDlaZtME54BrF/fqUJ3SmDEu4Qm1+J3Fbza3rVHQBXtgqkK0hGNuK4A/Sg3d3x
	/0IH7umzDORNEJEpf59J2fCXZ0KaMe8rnxnyXwT14FmR8OXY/ORyQoX2lzeKXpwwG+3LBP+GCwgiG
	Bf4ZoxXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLPPb-00000007CZJ-0mkj;
	Fri, 08 May 2026 17:54:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLPPX-00000007CXn-05JM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 17:54:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A7FB5443AB;
	Fri,  8 May 2026 17:54:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78217C2BCB0;
	Fri,  8 May 2026 17:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778262890;
	bh=1dYHe65DV95VZFN3CAYebqbE8uRbj3es6XTQIjoGPRk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PPSfo/+fVPkzA3bjANTm5g4wn4Evv6yw/bSsW+NMe0DrTNkOaoWnCKoLLs3oQTIjG
	 Z4D7xL+JcM8ltnRKhkaHpRtU4p5O2bpm1e2PFn3sFjQd1AG5CXrhFVm7NczV5683VY
	 l7TnUIRUTbpspdRWPw4cK0gGtf9ze1zSIcXtmeCkvwAJvmZ6X7SEJtqxjWq06vvO0e
	 f5JCBxegxjmZR0mRCibXUZX3Pu2Qr11x5Nj1rT4Mdt7Jn3lmN3ch3FZU0z6WqR7LA8
	 5ipEQuTEqCIahOdbRea2e1Ck4T/v1X+RnOzM4OPRQZsWbVQa0uoTnX95Q6mht3oHKA
	 J/lJ84hYxHZGg==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Fri, 08 May 2026 18:54:15 +0100
Subject: [PATCH 1/4] Revert "firmware: arm_ffa: Change initcall level of
 ffa_init() to rootfs_initcall"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-b4-ffa_plat_dev-v1-1-c5a30f8cf7b8@kernel.org>
References: <20260508-b4-ffa_plat_dev-v1-0-c5a30f8cf7b8@kernel.org>
In-Reply-To: <20260508-b4-ffa_plat_dev-v1-0-c5a30f8cf7b8@kernel.org>
To: linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-integrity@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev
Cc: Sudeep Holla <sudeep.holla@kernel.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_105451_090954_6369558A 
X-CRM114-Status: GOOD (  11.08  )
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

From: Yeoreum Yun <yeoreum.yun@arm.com>

This reverts commit 0e0546eabcd6c19765a8dbf5b5db3723e7b0ea75, which was
added to address ordering issues with the IMA LSM initialisation where
the TPM would not be fully ready by the time IMA wanted it. This has
been resolved within IMA by retrying setup during late_initcall_sync if
the TPM is not available at first.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_ffa/driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index eb2782848283..6efb85787e6e 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -2106,7 +2106,7 @@ static int __init ffa_init(void)
 	kfree(drv_info);
 	return ret;
 }
-rootfs_initcall(ffa_init);
+module_init(ffa_init);
 
 static void __exit ffa_exit(void)
 {

-- 
2.43.0


