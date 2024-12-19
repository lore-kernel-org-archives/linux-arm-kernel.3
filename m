Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3275E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 17:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YjC8ZqIlUXieFnqFU4Q+uMPIRrrLYw3R91xgwycsm9M=; b=u/05lI4pX/Ft70yKYJPYBhD4ij
	ZzfNCTqwpIXo+r+Y0jzCxiClOjOY8kQMgzdKqQe0iROCzITFm8IbxB1CFstJInTJcI1cwvHxV7jO5
	aHW42/Ic92QfniUx0KpbyB7ddt0ohW4CA0OEWlHcbXphwK4hxLgfEi7H8DinAwRhGRLHT1CoLiBas
	ugsdYhB36zuErNzFJfLdmJfCspaWt2BmsQI8XVvA3lOMndlL2OtTS+MvTmHTbqzJSCkADWWSl1Rqo
	/z7eTDmujm1J8EWBf6iEWpEGCkJo8+xHJJ+5YTHiWuLMcy7bueDuz6sBjlYxMOPW499SXe/wiZHQP
	PYHnrlCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOKZ0-00000002bcg-23by;
	Thu, 19 Dec 2024 17:43:54 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOKPR-00000002Zo2-1eS0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 17:34:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 08614A42812;
	Thu, 19 Dec 2024 17:32:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 333EEC4CECE;
	Thu, 19 Dec 2024 17:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734629640;
	bh=U56i2WXsnIsJr7tkVTslgQGtPhVuhDr/tiC3IyFjrJM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dcHv8K3/4VXnAFYhzkqzKh4G8HAJd2mqFzy2O2hvlgTiVZfx9D6AGTEkcX49IfuPh
	 vTQEcVvYXbdiQ0amtd/r6XaKzW+/MGW1iJoObvWIWVPMWG7b5kXE85e6v0Z4i65CJ5
	 Gu5sRz4aFuaakvEN5sMvh7szDZWUnSkGgVO2NA1fcY7wTz25p01729WMkfY29YJX4R
	 hKjheB4/zgIQLnIAvkGvOaN/OTRqZeJO5VqF8lY6lDOcFsz7pYaaHQcgtR0WJQN5Ik
	 GIgFt31iA7TeYViDWkz1Och2g7n14oJjMrAicvkW1zL8Uw2UmEM7gr7A29GlKtYxvu
	 RK3RJQrQYbfug==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tOKPO-005Lao-E7;
	Thu, 19 Dec 2024 17:33:58 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 1/4] arm64/sysreg: Allow a 'Mapping' descriptor for system registers
Date: Thu, 19 Dec 2024 17:33:47 +0000
Message-Id: <20241219173351.1123087-2-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241219173351.1123087-1-maz@kernel.org>
References: <20241219173351.1123087-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, joey.gouly@arm.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_093401_558048_8AB0CE5F 
X-CRM114-Status: GOOD (  14.19  )
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

*EL02 and *_EL12 system registers are actually only accessors for
EL0 and EL1 registers accessed from EL2 when HCR_EL2.E2H==1. They
do not have fields of their own.

To that effect, introduce a 'Mapping' entry, describing which
system register an _EL12 register maps to.

Implementation wise, this is handled the same was as Fields,
which ls only a comment.

Acked-by: Mark Rutland <mark.rutland@arm.com>
Reviewed-by: Mark Brown <broonie@kernel.org
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/gen-sysreg.awk |  2 +-
 arch/arm64/tools/sysreg         | 12 ++++++++++--
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/tools/gen-sysreg.awk b/arch/arm64/tools/gen-sysreg.awk
index d1254a056114e..1a2afc9fdd42e 100755
--- a/arch/arm64/tools/gen-sysreg.awk
+++ b/arch/arm64/tools/gen-sysreg.awk
@@ -206,7 +206,7 @@ END {
 
 # Currently this is effectivey a comment, in future we may want to emit
 # defines for the fields.
-/^Fields/ && block_current() == "Sysreg" {
+(/^Fields/ || /^Mapping/) && block_current() == "Sysreg" {
 	expect_fields(2)
 
 	if (next_bit != 63)
diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index b081b54d6d227..da3f02cdf1052 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -24,8 +24,16 @@
 #	...
 # EndEnum
 
-# Alternatively if multiple registers share the same layout then
-# a SysregFields block can be used to describe the shared layout
+# For VHE aliases (*_EL12, *_EL02) of system registers, a Mapping
+# entry describes the register the alias actually accesses:
+
+# Sysreg 	<name_EL12>	<op0> 	<op1>	<crn>	<crm>	<op2>
+# Mapping	<name_EL1>
+# EndSysreg
+
+# Where multiple system regsiters are not VHE aliases but share a
+# common layout, a SysregFields block can be used to describe the
+# shared layout:
 
 # SysregFields	<fieldsname>
 # <field>
-- 
2.39.2


