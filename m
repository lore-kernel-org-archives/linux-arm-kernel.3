Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35029C43602
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 16:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RvPGrV8NE4JxDz89/TlgY36u3wEzVwPRYMNH7LCnBU0=; b=lLbZFEUwov8Vi9d1juqli6kyUX
	1zTdlRaDMqPkDYkizsvA5Mt3F/8YpvtjrWfvDwWPZmpvQpzG+9fsZd7ZNn4rIfa0lnYSD0HHoF9p7
	Iyh2GPUL7sNW4+naD4ljO7v2Hs6rN/d8R8R08JOIc9FIh+ny6C/hS4Ua+KDc9AcEDp5WWfy8aRyb0
	FVhEoOQLXCEkDTdBVxavPvQRnbrjOA0NZtY1cq8CA6sSNM4GsMsUpmkHgXumbU/hw5jBcua4/E8o9
	Ie7R0rMNeSV7RVFf95XeuYhmhanRX2LmaCLY0N03FBYhlzh44PAWy6zs/Up+Jq4tpkRn+n+Za8hAo
	z6877GPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJsV-00000004uEe-0Peb;
	Thu, 02 Jul 2026 16:03:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJsT-00000004uCF-1c5P
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 16:03:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B1BFA601CA;
	Thu,  2 Jul 2026 16:03:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67D8B1F000E9;
	Thu,  2 Jul 2026 16:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783008180;
	bh=RvPGrV8NE4JxDz89/TlgY36u3wEzVwPRYMNH7LCnBU0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KlrCelUnYJZceEN21WvSOb/jRMKU06rbbjMSh3Mlqrh1HmoLYJG8EKqCSbtuKg0xc
	 YJ7/98/qtH94SIS/EvIlhZ6vQo2ZKrEpD2fghuWeoAclJgHMdrhMynEB/ZFyPFQqoU
	 euHESnDvzGpqJvvgN1rRGaNm4GMDMAK0iwUAjVMi+ZrOgZ44AQX5blMlYjxjeZ8W6g
	 k7z5H4obH8FiG6k1snzoZQDvYFjctrNV8bbXYW8uh4kQlbxHMVr7tMRid7H4BrhPtX
	 uxU/fCJUa4Q7KCOwfjpdZ2Ue+VxVq0Qod8bvPLvk5CkCQVky2lKB5Za7JB+OTX2/Eu
	 PHxnRKH/ZJZiA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wfJsQ-00000000ojd-1JvR;
	Thu, 02 Jul 2026 16:02:58 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 01/28] arm64: sysreg: Emit RESx/UNKN values for Mapping definitions
Date: Thu,  2 Jul 2026 17:02:21 +0100
Message-ID: <20260702160248.1377250-2-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260702160248.1377250-1-maz@kernel.org>
References: <20260702160248.1377250-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

The sysreg file is using the Mapping qualifier to indicate that
a given encoding is only a mapping to a particular register.
As a result, we don't output any definition, and instead expect
the canonical definitions to be used.

This works rather well for individual fields, but creates problems
for macros that refer to more generic classes of bits such as RESx.

Relax the above rule by emitting the RESx and UNKN values for Mapping
qualifiers as well.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/gen-sysreg.awk | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/tools/gen-sysreg.awk b/arch/arm64/tools/gen-sysreg.awk
index 86860ab672dc7..d7f7ceb768fe5 100755
--- a/arch/arm64/tools/gen-sysreg.awk
+++ b/arch/arm64/tools/gen-sysreg.awk
@@ -228,7 +228,7 @@ $1 == "EndSysreg" && block_current() == "Sysreg" {
 }
 
 # Currently this is effectivey a comment, in future we may want to emit
-# defines for the fields.
+# defines for the fields. "Mapping" does emit the RESx/UNKN definitions.
 ($1 == "Fields" || $1 == "Mapping") && block_current() == "Sysreg" {
 	expect_fields(2)
 
@@ -239,9 +239,15 @@ $1 == "EndSysreg" && block_current() == "Sysreg" {
 	print ""
 
 	next_bit = -1
-	res0 = null
-	res1 = null
-	unkn = null
+	if ($1 == "Mapping") {
+		res0 = $2 "_RES0"
+		res1 = $2 "_RES1"
+		unkn = $2 "_UNKN"
+	} else {
+		res0 = null
+		res1 = null
+		unkn = null
+	}
 
 	next
 }
-- 
2.47.3


