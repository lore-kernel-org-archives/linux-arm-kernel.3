Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E6F606D803
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 15:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EtpXhOsi;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TBZncIgw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hyCHHGbbmA+viHCUOeD0u0cyeXuCDyyU6WJlzk8TPBU=; b=EtpXhOsiPlbB8A
	5+9IErhWeIxippt/M/mLzPIkv7Ehjb0o4SSJu/bLNo2WNXctKTjZyTF+Y0puBhX8n8+Q+9xynKGwO
	nrS+8ZhFYwEfEr9lJQcPE4PFsPNiCMx9E+MgcA0Ocs1C4XKhxc7Uir1/wMIpWnZdmRb7YVhC//04I
	kCuRATo0Ve/GzhPzT3cIF3AhvaPb7In+oXu0KTfIBrELiD/cHoKs2NxHZoXWAHCPRIPsrvLgT7jqr
	hAjPeEgI0CyDtlTFSZim408UQc4+kOMiH5HcCuMq9vZBvBR228p8u4DH169e/+cT8oAdYhP+eBtig
	txwGDamFcD7r7nyUeRMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxQZ-000000096dg-30KW;
	Thu, 05 Nov 2026 13:22:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxQY-000000096cQ-1PZb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 13:22:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1D40B43773;
	Thu,  5 Nov 2026 13:22:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB39D1F000C1;
	Thu,  5 Nov 2026 13:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793884970;
	bh=hyCHHGbbmA+viHCUOeD0u0cyeXuCDyyU6WJlzk8TPBU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=TBZncIgwr6KNvmo9eJUl10KdRygW8kka91W2lHkSWzbeDr7bkjnl2C542l+2/vTLT
	 6vOxlg1weaE0dg5ZjP5MzSe+em4F3oSuQoWpIW0GruGShkvQerQTTo/6Nu+n3bC1ll
	 HMyvHR24MN75TjXd43gGs+pvunUNRWv5n1nX0cy/QBfr/u/OCcymkQ5OfXlL8KPYwq
	 V5mutcPW0Mml5NjmH3ncV1KpmPh/7XUBYHHpS5j+iIx55fT8yAklLIBqMAIEXlkdRp
	 OGnZIsP29/8ZeOgPP0fijBVmA3XNWb6rM+bzEDAQquwl43dE3ztnY2pT/JLc7b7/SM
	 mnoqEACnS+vjA==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 05 Nov 2026 13:00:13 +0000
Subject: [PATCH v2 2/3] arm64/gcs: Move gcs_check_locked() out of the
 header
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-arm64-gcs-store-gcscre0-v2-2-954d5bffd69f@kernel.org>
References: <20261105-arm64-gcs-store-gcscre0-v2-0-954d5bffd69f@kernel.org>
In-Reply-To: <20261105-arm64-gcs-store-gcscre0-v2-0-954d5bffd69f@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2217; i=broonie@kernel.org;
 h=from:subject:message-id; bh=dH1M/vyc1MFAQw48E90smOwrG3W8MQm/arC7/achGFE=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLeNCtvnrqKq0oiLree9b1oQQtbtI8m/43Q/1+Mlyx7Z
 jrrs+m1jlIWBjEuBlkxRZa4LO6X9SWv1/AdXNgGM4eVCWQIAxenAEwkeCvD/6IzXDUNgjtYbgRK
 n60/reHYvHi+0mTzhxmb9ZnbJu4WD2Vk2L51q1baOsVlCzL/sRpf0Mlqshd+Fr4nbefmrx6dF4W
 8GAE=
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

gcs_check_locked() is currently a static inline in the header but there
is no real reason for this, it is not especially performance critical.
Move the implementation into gcs.c to reduce the size of the header and
make future refactoring a little easier, no functional changes.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/gcs.h | 15 +--------------
 arch/arm64/mm/gcs.c          | 13 +++++++++++++
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/include/asm/gcs.h b/arch/arm64/include/asm/gcs.h
index bbc22e382cfe..3e6eeeebd282 100644
--- a/arch/arm64/include/asm/gcs.h
+++ b/arch/arm64/include/asm/gcs.h
@@ -62,25 +62,12 @@ static inline bool task_gcs_el0_enabled(struct task_struct *task)
 }
 
 void gcs_set_el0_mode(struct task_struct *task);
+int gcs_check_locked(struct task_struct *task, unsigned long new_val);
 void gcs_free(struct task_struct *task);
 void gcs_preserve_current_state(void);
 unsigned long gcs_alloc_thread_stack(struct task_struct *tsk,
 				     const struct kernel_clone_args *args);
 
-static inline int gcs_check_locked(struct task_struct *task,
-				   unsigned long new_val)
-{
-	unsigned long cur_val = task->thread.gcs_el0_mode;
-
-	cur_val &= task->thread.gcs_el0_locked;
-	new_val &= task->thread.gcs_el0_locked;
-
-	if (cur_val != new_val)
-		return -EPERM;
-
-	return 0;
-}
-
 static inline int gcssttr(unsigned long __user *addr, unsigned long val)
 {
 	register unsigned long __user *_addr __asm__ ("x0") = addr;
diff --git a/arch/arm64/mm/gcs.c b/arch/arm64/mm/gcs.c
index 680749611a9a..84add924dc60 100644
--- a/arch/arm64/mm/gcs.c
+++ b/arch/arm64/mm/gcs.c
@@ -140,6 +140,19 @@ void gcs_set_el0_mode(struct task_struct *task)
 	write_sysreg_s(gcscre0_el1, SYS_GCSCRE0_EL1);
 }
 
+int gcs_check_locked(struct task_struct *task, unsigned long new_val)
+{
+	unsigned long cur_val = task->thread.gcs_el0_mode;
+
+	cur_val &= task->thread.gcs_el0_locked;
+	new_val &= task->thread.gcs_el0_locked;
+
+	if (cur_val != new_val)
+		return -EPERM;
+
+	return 0;
+}
+
 void gcs_free(struct task_struct *task)
 {
 	if (!system_supports_gcs())

-- 
2.47.3


