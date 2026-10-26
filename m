Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BBB606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 08:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=waH5aqIh;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y+Iyn/0R
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=w4N8ZW/s1BKVrlyy1gY9Ahq28l6tlIiYccC8/EYeZPM=; b=waH5aqIhY4F1F0
	VsS/1lmQVoNdYMf0nz34MwmziDKBOhbW5RKQuYy1dezF9xCANZY7ca6tuF9+VZeH3i4MhXVrzznFY
	SF3jSKJyTsOYY2nxV1BpWXerIvFZSai0CARcqz0V/UEaoXeY6MD0XG7+baM4xc2fXROS71huQF05x
	nDeZuNnT5GL11s/2Tvy7c+FQS1s4fM6L/fp06WWX+EKW4VPZtcc4fLftyYiGdEGsg6m/DayFvfDv6
	al7V9Isn8Z/wkz91/oOQZe12qpTy9Fs+5oV5KD/ENLY2Bs5qrOeVwvdk3fxIB+w2uQyI0ykBqhikT
	odimc2L5UajFCoMhUw/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLFz7-00000001wWE-3KSS;
	Mon, 26 Oct 2026 08:23:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLFz5-00000001wVe-46KJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 08:23:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2D56D601F9;
	Mon, 26 Oct 2026 08:23:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D595D1F01828;
	Mon, 26 Oct 2026 08:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793002990;
	bh=w4N8ZW/s1BKVrlyy1gY9Ahq28l6tlIiYccC8/EYeZPM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Y+Iyn/0R5Uo0vF0saj3WkwYUlUNM5WYbCbg2LdNLgfQjUqM+OOmRn1FLSf1D2ztOR
	 ZM+HamV97nKXFsgMQNTb6XXOcHFUFvqBEE756eMunDFyIr58Aw4m/TA5/QdqWBJTPT
	 UkRAtK62hKrJ4KTVTD5w5NNCK1dGj8Cppca9ttYZc6jPql3IcwCcJbJY3NljRWxPsx
	 3o721dZQdUW38S3s5g/Pwnw3WZpT16ELLtQ3e1MBMhO+r8ZNZuyCnXvSiKWnssIuUk
	 9hGfr9mpYqcTfgPIerFYouCbshmO5wWzD6D3vFBqE8+vRIMG9hLNioiOCVsgx9ltGT
	 yvdHpWt+x3ZZA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xLFz3-00000007A40-0Md2;
	Mon, 26 Oct 2026 08:23:09 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH 1/2] arm64: Add return value to mte_disable_tco_entry()
Date: Mon, 26 Oct 2026 08:23:04 +0000
Message-ID: <20261026082305.2515705-2-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261026082305.2515705-1-maz@kernel.org>
References: <20261026082305.2515705-1-maz@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, fuad.tabba@linux.dev, catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In order to provide adequate levels of synchronisation when clearing
TCO, update mte_disable_tco_entry() to indicate whether it has actually
done something.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/mte.h | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/mte.h b/arch/arm64/include/asm/mte.h
index 7f7b97e099968..411e5a6f6d94c 100644
--- a/arch/arm64/include/asm/mte.h
+++ b/arch/arm64/include/asm/mte.h
@@ -224,10 +224,10 @@ static inline bool folio_try_hugetlb_mte_tagging(struct folio *folio)
 }
 #endif
 
-static inline void mte_disable_tco_entry(struct task_struct *task)
+static inline bool mte_disable_tco_entry(struct task_struct *task)
 {
 	if (!system_supports_mte())
-		return;
+		return false;
 
 	/*
 	 * Re-enable tag checking (TCO set on exception entry). This is only
@@ -240,8 +240,12 @@ static inline void mte_disable_tco_entry(struct task_struct *task)
 	 * expensive.
 	 */
 	if (kasan_hw_tags_enabled() ||
-	    (task->thread.sctlr_user & (1UL << SCTLR_EL1_TCF0_SHIFT)))
+	    (task->thread.sctlr_user & (1UL << SCTLR_EL1_TCF0_SHIFT))) {
 		asm volatile(SET_PSTATE_TCO(0));
+		return true;
+	}
+
+	return false;
 }
 
 #ifdef CONFIG_KASAN_HW_TAGS
-- 
2.47.3


