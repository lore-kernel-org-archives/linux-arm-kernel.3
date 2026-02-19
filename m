Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 412B6C531CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 19:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=38g61/9aXkUWWt02FHoroWMrNX+028vZ9S831TTYG4E=; b=E1kkMh2sG7HAHX2FQGtLzDSe1Y
	H5anHQYNLxcYONatcX9kD3YumHUcsS9T9N2bU9Vl+mR75+zJdnObTaQ1PNSg9MH9D44mqj8r7mci3
	8xxBhgUG4rOcVRIQdIiuEejV1Q97WIBn/VxfVZqy1v63WSsBVg6FZp71exMyYmROU+2Bm9RM8OWCh
	batWd0nORbsNZARzp0ah4hcconm1oRx9iI8L8xVaWajhsLTY+il7zaj1VRs549woWYz0tynfPtfRy
	uJ3Zexef1Bkl4gw2sUGQbEqL1pvU1y0ZRbl//n/AOkU1xbeHuUat9eb61MLpBstO4Bj4o0z6l7YuE
	1UHdhl/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtA7x-0000000BtJ2-3xQJ;
	Thu, 19 Feb 2026 19:55:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtA7q-0000000BtDC-0Fjg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 19:55:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2AF034457B;
	Thu, 19 Feb 2026 19:55:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 084C1C4CEF7;
	Thu, 19 Feb 2026 19:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771530949;
	bh=IhAX95LdoQ8+4nwPLbvRaw+mcpWGJGreooYLh+/dXf0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N+Z8SdIjWFIKVvQeQ7Kam1DgyReVosNwqRf9keumfSTspmOdRtjCv9Bh9+FHM94jp
	 TNIWeAVz6N5Q4Xt6BBISt5p5U8Y021zpbla/+W3nk1buZs10vehzcsHhJepWHe2PDW
	 LFBe1Rq7oTYld90WIrZrrY0Nfp/ac+Zr3IH4bWRdW+jLHpSkmqjXCga3oxeJVW0Dy9
	 5JfNVpB7/OBTQAvSYF4zzQ7vc1WCJ7lEe9+de0AEl+cjbyZakbWLVJtbYibuJIwTId
	 HW6cuOrcWhLbx10JZh1lYfp+UCTEF8Va8KOFLKuWXkESWQMkIbJlXCuqGd0mz7r8c6
	 clZcRbg9bZFWA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vtA7n-0000000CGHL-0d89;
	Thu, 19 Feb 2026 19:55:47 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 8/9] arm64: Convert CONFIG_ARM64_BTI to FTR_CONFIG()
Date: Thu, 19 Feb 2026 19:55:31 +0000
Message-ID: <20260219195533.2455736-9-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260219195533.2455736-1-maz@kernel.org>
References: <20260219195533.2455736-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, tabba@google.com, will@kernel.org, catalin.marinas@arm.com, mark.rutland@arm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_115550_144345_6784B1F2 
X-CRM114-Status: GOOD (  13.50  )
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

Even if the kernel doesn't use BTI and doesn't expose it to userspace,
it is still OK to expose the feature to the rest of the kernel including
KVM, as there is no additional state attached to this feature.

The only purpose of this change is to kill the last user of the
FTR_VISIBLE_IF_IS_ENABLED() macro.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kernel/cpufeature.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 8eb9dc35cdba4..d58931e63a0b6 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -317,8 +317,8 @@ static const struct arm64_ftr_bits ftr_id_aa64pfr1[] = {
 	ARM64_FTR_BITS(FTR_CONFIG(CONFIG_ARM64_MTE, VISIBLE, ALL_HIDDEN),
 		       FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR1_EL1_MTE_SHIFT, 4, ID_AA64PFR1_EL1_MTE_NI),
 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR1_EL1_SSBS_SHIFT, 4, ID_AA64PFR1_EL1_SSBS_NI),
-	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_BTI),
-				    FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR1_EL1_BT_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_CONFIG(CONFIG_ARM64_BTI, VISIBLE, HIDDEN),
+		       FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR1_EL1_BT_SHIFT, 4, 0),
 	ARM64_FTR_END,
 };
 
-- 
2.47.3


