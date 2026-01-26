Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31904CF65DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 12:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZJU6h7G/eUm2vepqJIQCiCT70FfImRuAPUvsxAyVCnc=; b=eYE2DacgNl0YV28e6zS4p8XnL3
	EEXDKlyeO8s7K++ql4M1nx2QCmkj39ikZtvMep7iZCn8W3mHhNBwa9fHX/f2/sl2PNtXwVyC0hTMd
	ZXusOnXDEledl4AwAhu0MZy2oZu4QunSEP3iu6wwUFYbjDQCvAoq/6YCpLURWGKHF7vkonfKpowi+
	fbu7x08Fs9PyyU+QWSWeIK65S4lJiwp+QHNLBkzG0euHb9gbEvpjH9gq0RhfLPVRfyloBpqnCdjOg
	P47RDYdfVKgAStNEBbXBoIQozastNL/y1JYmzcsUjYqHLvetMq5/uW5xkUD1GJ9N2kJXzIUhqNArS
	R/ozMprw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkLXR-0000000CV1E-3E2H;
	Mon, 26 Jan 2026 12:17:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkLXE-0000000CUsH-1MHe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 12:17:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3E72044481;
	Mon, 26 Jan 2026 12:17:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E827C2BC87;
	Mon, 26 Jan 2026 12:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769429855;
	bh=cjSjGxnYioTuTQkGGQeoMXFPLKV/lqjRqjCssEI4KVc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lynbX/MKrusm4/GddjW2C1EcTeaJQuHw8aiCSS7Qb59DG6haFmWjqQv91Lne9rOhP
	 Xm18Ia8UBL0QVFeo1MfGDe9D8Lwyf8SXJH/WRy0VR/DKFE/5yW7OaVrnKc7M1H5fAG
	 Fu0GoabENZb4J/VHE6F1CDaQ4ehq0QWkWTi/BFZJhtW7kIv7ler9nUPwTSrRcqhKRx
	 dnEKDXMz1SnjJQjSNYriyxl5pRJw4kYydCYPwQLevyeSyDhUSyXsDEH7BrZudkIxGH
	 X5MsVIOYwrWag99XWz8r9hSQxBY+pilf79P3e5Jhdt+mGIN/sgPLv/fLteN5azlCD5
	 LOUN+L8P/YP2g==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vkLXB-00000005hx6-1Ahu;
	Mon, 26 Jan 2026 12:17:33 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH 07/20] KVM: arm64: Allow RES1 bits to be inferred from configuration
Date: Mon, 26 Jan 2026 12:16:41 +0000
Message-ID: <20260126121655.1641736-8-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260126121655.1641736-1-maz@kernel.org>
References: <20260126121655.1641736-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, tabba@google.com, will@kernel.org, catalin.marinas@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_041736_411622_0B39893F 
X-CRM114-Status: GOOD (  13.63  )
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

So far, when a bit field is tied to an unsupported feature, we set
it as RES0. This is almost forrect, but there are a few exceptions
where the bits become RES1.

Add a AS_RES1 qualifier that instruct the RESx computing code to
simply do that.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/config.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index 8d152605999ba..6a4674fabf865 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -24,6 +24,7 @@ struct reg_bits_to_feat_map {
 #define	CALL_FUNC	BIT(1)	/* Needs to evaluate tons of crap */
 #define	FIXED_VALUE	BIT(2)	/* RAZ/WI or RAO/WI in KVM */
 #define	MASKS_POINTER	BIT(3)	/* Pointer to fgt_masks struct instead of bits */
+#define	AS_RES1		BIT(4)	/* RES1 when not supported */
 
 	unsigned long	flags;
 
@@ -1316,8 +1317,12 @@ struct resx __compute_fixed_bits(struct kvm *kvm,
 		else
 			match = idreg_feat_match(kvm, &map[i]);
 
-		if (!match || (map[i].flags & FIXED_VALUE))
-			resx.res0 |= reg_feat_map_bits(&map[i]);
+		if (!match || (map[i].flags & FIXED_VALUE)) {
+			if (map[i].flags & AS_RES1)
+ 				resx.res1 |= reg_feat_map_bits(&map[i]);
+			else
+				resx.res0 |= reg_feat_map_bits(&map[i]);
+		}
 	}
 
 	return resx;
-- 
2.47.3


