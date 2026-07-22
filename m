Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF3A5C4453D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 07:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AAaWVXp7htB6pd1cjG1QCcAG4F8gffJDPJKffSqmwRI=; b=UmhYiNPaXStvYvS8kSltblr7R1
	OF9neFiiaWCqCUfcwwUpwDReHvdRKt3JUqU0yr+GYZOzQkpU3dgaSNIjMLhz3llS6vLkqbfkm/uGx
	M4MKppSDOe1KB43Tv3BwBaUGPGv+a/F6/RntC0lGhKphNwgICQqYErVZvZkkLW/9BumJv5jRYp+i5
	w2WeQ5XOtZerxL+v2bDfHtmo+u09IqkaWDuO/3YRSSzlGeMYFqSi4yYk4AFbQX02VxRZ0+ndzLv5Y
	7Oma3Dup8SIlbbd1x9kx2FHKSfYfkjhUEiwSBWyOHZoExBb2Dwv5pwuQiUMVhUCv1jpdLc8uNgCHn
	H+kyak3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRbW-0000000B6iG-416M;
	Wed, 22 Jul 2026 07:42:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRbV-0000000B6fp-1Eil
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 07:42:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 75A6660A65;
	Wed, 22 Jul 2026 07:42:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A0A81F00AC4;
	Wed, 22 Jul 2026 07:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784706176;
	bh=AAaWVXp7htB6pd1cjG1QCcAG4F8gffJDPJKffSqmwRI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WExykvXJO/7dwIQyy+HhxJwZ9vCm77VxMR+nSLr6QZ5b12/UAkuNffJR/tO+9WJPx
	 8dqvmeU1bdN3L4e2/6Gc3PC6It40MBJS47vrcUL5HqkM3Y79eUQWB+HVUIFATCiUP8
	 9iE72x9UZJI1m7a1rU83sI3SSud2t6ppU7N1MdO7OzBLsoldk1HvzIesIM+4AhXT0s
	 b1c8X+HtcIk+e2yErOUua668InnZ+RjlpAIw7fwJl1UNUJRKAF3LfdbBm4IYUVah38
	 v1VEQOoJ6HKWKzEOcEx+gOBi4b0GME0hfmtFFF94ZRJ71VSSayxgLGUMfhrUntajaG
	 iMuHSnkW4KNig==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wmRbR-00000007VfN-3jpJ;
	Wed, 22 Jul 2026 07:42:53 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: [PATCH v3 01/28] arm64: sysreg: Emit RESx/UNKN values for Mapping/Fields definitions
Date: Wed, 22 Jul 2026 08:42:07 +0100
Message-ID: <20260722074234.3330999-2-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260722074234.3330999-1-maz@kernel.org>
References: <20260722074234.3330999-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, yaoyuan@linux.alibaba.com, weilin.chang@arm.com
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


