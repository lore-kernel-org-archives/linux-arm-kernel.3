Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02C5BC44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 09:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AAaWVXp7htB6pd1cjG1QCcAG4F8gffJDPJKffSqmwRI=; b=YLV6xqdQIy/6oR7xpHbImoxnwb
	JnJiWekfayl6u/sZHx2ESMyN5U6q33zcHvTmxCQu/q/z9SXHK9DnjD4qhZ0vDlh1k5B6h7j0Hmx39
	SI8cL23vI2BxB70tmCb1mGIxz1tQkEreoJJZknWC78/Fgn2ZXzY3fL2/aNr3BFf+XOolXgkjjgvDI
	vt858Q4kRFGFoXxiNdNb87E4VNR4V3jU/1JlNcxu/2U91qT5ZRZ8wJ54/nPUeiq+L+26bK+DoZZmb
	LEE2j1XC9PCQgSCEJ+31p6iCsx6wB+WoDTKTSO0R/GbAxDWdfn12lkkfeaTo25iq5PfSN1zC0TNq9
	xdG7Cz6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjZFy-0000000BP26-1qYj;
	Tue, 14 Jul 2026 09:16:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjZFx-0000000BP0v-2adE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 09:16:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 28A4A43C64;
	Tue, 14 Jul 2026 09:16:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 092781F00A3A;
	Tue, 14 Jul 2026 09:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784020609;
	bh=AAaWVXp7htB6pd1cjG1QCcAG4F8gffJDPJKffSqmwRI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bfqAFx58D65QoCsmBid/IstNDUEF/sXxfESOrC04DMvT9OFKrbVUneeDKn6GJ6Sl6
	 3j0wCoxsLmWSk+Wr/aLLluLOBUAPRLSoSN9n5r9mX85Cu38GV/pu9G9veaZsT3sD+7
	 UOc2ZdGr+BOHthIBTsTOOjZP0Ay3nMwPYJ6hlmOTzpSGAG8YGq9oMssgH3iAggfkLF
	 39dZZAcWCfwlnfgIk0ZojqiQCerGcouIE6IsltswcvioUUOVud/HDc9ba1o9WDar4L
	 p/8HTiixnqLKq/QgPEBgZuTunq+wRm151dlr347DAp0K5bRVz3qPkpSPzY2D0DrX0b
	 kZsQvRTOsePlQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wjZFv-00000004ny1-0mTa;
	Tue, 14 Jul 2026 09:16:47 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v2 01/28] arm64: sysreg: Emit RESx/UNKN values for Mapping/Fields definitions
Date: Tue, 14 Jul 2026 10:16:14 +0100
Message-ID: <20260714091641.1970822-2-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260714091641.1970822-1-maz@kernel.org>
References: <20260714091641.1970822-1-maz@kernel.org>
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

The sysreg file is using the Mapping or Fields qualifiers to indicate
that a given encoding is only a mapping to a particular register (or
an instance of a more generic register definition).

As a result, we don't output any definition, and instead expect
the canonical definitions to be used.

This works rather well for individual fields, but creates problems
for macros that refer to more generic classes of bits such as RESx.

Relax the above rule by emitting the RESx and UNKN values for Mapping
and Fields qualifiers as well.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/gen-sysreg.awk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/tools/gen-sysreg.awk b/arch/arm64/tools/gen-sysreg.awk
index 86860ab672dc7..e099f7d3b2833 100755
--- a/arch/arm64/tools/gen-sysreg.awk
+++ b/arch/arm64/tools/gen-sysreg.awk
@@ -228,7 +228,7 @@ $1 == "EndSysreg" && block_current() == "Sysreg" {
 }
 
 # Currently this is effectivey a comment, in future we may want to emit
-# defines for the fields.
+# defines for the fields. "Mapping" does emit the RESx/UNKN definitions.
 ($1 == "Fields" || $1 == "Mapping") && block_current() == "Sysreg" {
 	expect_fields(2)
 
@@ -239,9 +239,9 @@ $1 == "EndSysreg" && block_current() == "Sysreg" {
 	print ""
 
 	next_bit = -1
-	res0 = null
-	res1 = null
-	unkn = null
+	res0 = $2 "_RES0"
+	res1 = $2 "_RES1"
+	unkn = $2 "_UNKN"
 
 	next
 }
-- 
2.47.3


