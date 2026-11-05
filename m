Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5BF606D808
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 13:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mO/MgWi+;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kPwsgtMg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WYskst57saLSN4NfYIJN2XlgRB7fhCinmhIN9YTkUyg=; b=mO/MgWi+Rhywd4
	UIwRYAPuswJkV7ns3VYGTqog3SYx+P0UGAQBbc1uqD7xgd493UuNooebovI26lZ2HdsSMZvbzyTBF
	unTZzZi5IPNYd+DOHcVGmEtOWzw5nrARyXkaIe2SjSF6YT9dRBz/mNb40ohhZztlsl2NcJ65DGMGX
	I4oN/gePqCrQAFZw8NE4m+AZZLJ5aUSJRSrBVCuMmOVzH2xdY7V9ufqvOT6MgZNjn/IWANoNu43Nx
	UdafMi1v90y1EJUepQrL+UnNQMhcjWzks9udJyY9oAlKLZH9C2w2+x8j2tPogY8k6IqYAgf7Rtd/2
	V40QwIaHn9HHFjT/K+MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxQZ-000000096dv-3fcc;
	Thu, 05 Nov 2026 13:22:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxQY-000000096c6-1FNO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 13:22:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BC132605F4;
	Thu,  5 Nov 2026 13:22:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 314CC1F00A1B;
	Thu,  5 Nov 2026 13:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793884968;
	bh=WYskst57saLSN4NfYIJN2XlgRB7fhCinmhIN9YTkUyg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=kPwsgtMgthByqOdBPI0+I/GE8EKigC5bnccdfezD8rIgj7C6jZKHWtQQUymOJN8mK
	 h35lysW26cvEohIRestxB2HuGlc6zFyjcGpCrlFY65hkJ9idwaMBVotzeu2nAl73ZL
	 4yRGRgh1wAgDyzvFryrk3CuBSX2U+fIulafiXp36f4EnmBJqmW05affumd3PMQja80
	 ABOTibHlUFIktDv9RgiZxRF1Ju9QeFNEwbKQMXp5lpdeST8CqfJaCMhQun6jjiMvh0
	 0FnxO4g9HdCE2EKgKndBzp2Hhkz1kW+PhESXAADh2CObUAj43aBTrL4RV+m2wMKVhh
	 g7/S4z7Ys0F8Q==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 05 Nov 2026 13:00:12 +0000
Subject: [PATCH v2 1/3] arm64/gcs: Ignore attempts to change GCS mode
 during signal return
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-arm64-gcs-store-gcscre0-v2-1-954d5bffd69f@kernel.org>
References: <20261105-arm64-gcs-store-gcscre0-v2-0-954d5bffd69f@kernel.org>
In-Reply-To: <20261105-arm64-gcs-store-gcscre0-v2-0-954d5bffd69f@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>, stable@vger.kernel.org
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3749; i=broonie@kernel.org;
 h=from:subject:message-id; bh=89Z9BtoATgubK0m2BOgIS3mZAvlCF+CWPrHquvWYOUY=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLeNCvHVWcyz+7ZePJno42g9r7Yjct4i5UzvoQ8vD2/f
 vYRc9uujlIWBjEuBlkxRZa4LO6X9SWv1/AdXNgGM4eVCWQIAxenAExkZi/DX4m6GvXoH36d/VWl
 vpKhvfO+6JpuEj2T6ST/e2bTf9/tHxj+V7vzK6wUm8MqxTdBJPWt5YaUraaXmCJSZveHRnxJ43n
 BCQA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

If userspace tries to update the GCS mode as part of signal return then
we update the thread state but don't update GCSCRE0_EL1, meaning the
change does not take effect.  We may also get issues for other tasks on
context switch since we suppress writes of the register if the two tasks
have the same mode.

Since no currently known userspace tries to use this functionality close
this by ignoring any attempt to change the mode through signal return.
The GCS mode for the current thread can be changed using the prctl()
interface and will be preserved on signal return, allowing updates to
the mode from the signal handler.

Reported-by: Catalin Marinas <catalin.marinas@arm.com>
Link: https://lore.kernel.org/r/as-8IqsbMbOBo5Oq@arm.com
Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
Fixes: 16f47bb9ac8a ("arm64/signal: Expose GCS state in signal frames")
Signed-off-by: Mark Brown <broonie@kernel.org>
Cc: stable@vger.kernel.org
---
 Documentation/arch/arm64/gcs.rst | 13 ++++---------
 arch/arm64/kernel/signal.c       | 22 +---------------------
 2 files changed, 5 insertions(+), 30 deletions(-)

diff --git a/Documentation/arch/arm64/gcs.rst b/Documentation/arch/arm64/gcs.rst
index 226c0b008456..f2bcd66328bb 100644
--- a/Documentation/arch/arm64/gcs.rst
+++ b/Documentation/arch/arm64/gcs.rst
@@ -179,9 +179,8 @@ intended to be exhaustive.
 
 When returning from a signal handler:
 
-* If there is a gcs_context record in the signal frame then the GCS flags
-  and GCSPR_EL0 will be restored from that context prior to further
-  validation.
+* If there is a gcs_context record in the signal frame then GCSPR_EL0
+  will be restored from that context prior to further validation.
 
 * If there is no gcs_context record in the signal frame then the GCS
   configuration will be unchanged.
@@ -190,12 +189,8 @@ When returning from a signal handler:
   point to a valid GCS signal cap record, this will be popped from the
   GCS prior to signal return.
 
-* If the GCS configuration is locked when returning from a signal then any
-  attempt to change the GCS configuration will be treated as an error.  This
-  is true even if GCS was not enabled prior to signal entry.
-
-* GCS may be disabled via signal return but any attempt to enable GCS via
-  signal return will be rejected.
+* The features_enabled in the signal return context will be ignored, any
+  changes made using the prctl() in the signal handler will be preserved.
 
 
 6.  ptrace extensions
diff --git a/arch/arm64/kernel/signal.c b/arch/arm64/kernel/signal.c
index 6a06a4e352b1..80398ac83c3b 100644
--- a/arch/arm64/kernel/signal.c
+++ b/arch/arm64/kernel/signal.c
@@ -741,36 +741,16 @@ static int preserve_gcs_context(struct gcs_context __user *ctx)
 
 static int restore_gcs_context(struct user_ctxs *user)
 {
-	u64 gcspr, enabled;
+	u64 gcspr;
 	int err = 0;
 
 	if (user->gcs_size != sizeof(*user->gcs))
 		return -EINVAL;
 
 	__get_user_error(gcspr, &user->gcs->gcspr, err);
-	__get_user_error(enabled, &user->gcs->features_enabled, err);
 	if (err)
 		return err;
 
-	/* Don't allow unknown modes */
-	if (enabled & ~PR_SHADOW_STACK_SUPPORTED_STATUS_MASK)
-		return -EINVAL;
-
-	err = gcs_check_locked(current, enabled);
-	if (err != 0)
-		return err;
-
-	/* Don't allow enabling */
-	if (!task_gcs_el0_enabled(current) &&
-	    (enabled & PR_SHADOW_STACK_ENABLE))
-		return -EINVAL;
-
-	/* If we are disabling disable everything */
-	if (!(enabled & PR_SHADOW_STACK_ENABLE))
-		enabled = 0;
-
-	current->thread.gcs_el0_mode = enabled;
-
 	/*
 	 * We let userspace set GCSPR_EL0 to anything here, we will
 	 * validate later in gcs_restore_signal().

-- 
2.47.3


