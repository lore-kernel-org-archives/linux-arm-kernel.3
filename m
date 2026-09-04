Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B061C79F85
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 10:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yuuBzDkJl0gt1NGjn9NDS17DR+cp5By7A5gegfW0BAA=; b=w+9LjAf4pMUK13FaUS7kPLrTBq
	5CUvWUZKFQ7fUPJSaWthOU1eR3WLxh6Pld93RvVwCoMJsn+Z3Ebkd/XqLB7ISmpsqX+RDXzPID0nZ
	ZL4NnXf5zQZJPJqlmthHtxvUi8GnjYooY02kyjrUA8l4yDp7mXIsLyedywkmkwUxFE/qOqdW6rV7X
	5KPT/pGsJwWVeEFuGsSHCVIqRuUJrnxrC0HsbqGkD/bcuxpmkZODZ8+Flr47sqAUqvV9+5Y5eA2F5
	HqQZiIprcYEtzG9fosdbYC4xafDL8v1oklg/h1kWAjb1KAfGDSh56UwiaxBZMtwl7cw2lWP+i5rkv
	ErFyHuXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2RW5-00000001jmc-3JRu;
	Fri, 04 Sep 2026 10:51:29 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2RW4-00000001jlH-0DTB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 10:51:29 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-398a4dcf289so1001392a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 03:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788519087; x=1789123887; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yuuBzDkJl0gt1NGjn9NDS17DR+cp5By7A5gegfW0BAA=;
        b=QNYFd7/gJ0dYVOiM/Q9dlMtc5g5+PvNKWTwf9/6itIh0zyS+AX7wDj4arsC0p2TjHb
         dadBLW9/aWJrYumkOzr6CFx877+1atGU6EQLgu/UkyzBCVam/RmAn23rFDgMRMsIlM7s
         PAwRDOLy2dUZAir/fUSVr7bFolok4kskaka6+Q1ynkr/KQ7suDI0gRFsiXQwJ+W7yr6V
         aeZrUeYu8LkyYZNkWKUYgTTrsDXY5+8I8MHkgflYQSulY30mKABtJk+HI8/LqoVgfLjm
         bedieKIdR7eRTkeUppIV8MB9nshxMdJMLR4Mh9JljjQWctwVNpZ2+f5ovcGR1xsGW2hs
         n4RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519087; x=1789123887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yuuBzDkJl0gt1NGjn9NDS17DR+cp5By7A5gegfW0BAA=;
        b=G6Ruj2lC62x0Jk9zwDO4YLDQgRaR2gGD3Mz1yDB151xszrq1VkJjoGu3TgGyoEpvvs
         J2hH42tHAmJWsCPW+KARog+nEnmcd28tKFSkZAWk59IZ9g+L1REs7jGmBHmu7U5Oje3X
         2FtxJRe6Lgky0ODW6x3LmLZ21KFu89hjrX92KMZCoLd68RLNmvx/bQ2Jm6UcvcS42/zs
         HNxNxyL3o97TNpdWg4JqNtwBEjlPPCN+au156p2b+cIVMhDML4lCWQ7XygRkenYv4Cap
         rKE1aVKAQsEFgYWuUKB5Ubr8KEx4sUeyTkJlXQ3uw6mwgv40a31dCslQPXJ+fDiuqhsA
         xhfg==
X-Forwarded-Encrypted: i=1; AKwUvBxZ/KoZIzfSjtQX5ytHb0TThrI47ByGkrObofTXAhiz4JZZXXMa1x8M9SMZAvqJuOJ44r+/WvRRVxakuzFbyZq1@lists.infradead.org
X-Gm-Message-State: AFuF++npkwwuk+BrG3yijjtX+lxloKUJ3OT/OYwLJ90fvLX6inVDvmlf
	YDypaGhoo8jkD0YjYD9hJkgfgXUBrVAs94urjJAnQMAw0rELarRQ+0Tm
X-Gm-Gg: AYBFou35sletrHJnNlWG2Pe8IJEsVegWZ5p27ou2whhFN73FWg9fPwXZZY+ShbcnQBQ
	h6i3G7FGRm2OIdUMzgGH/BNOfyt/Zj5SFHs6TKq7CehKIGSim2JQWBv4Tzd77mN419Edjwvoq4o
	RhcKJuDbc87j+cg/sGtSoOGw872/V7fzlL38x4j+JukVKrL1Eim+gnN4QZjSn/fUxLQQ6LYRgP3
	87eLF2L8M1XV2RFFdghie2kfWNwNF2zDvfwagZ1cs0hqRCG+52PP4PtduU19RKWf0PPqo8Q1RH3
	ii8gNzobNOpX5z0NmsZGK5oGy8sJmFZqdOk+4BTph8NpuQWiDWQ3/DiC40AKiidFcBDmPd1gu86
	HMj6/qg9BRymj0SQN/eLMZBLo/xjA4xbLSN3hav+tNY15zPpQo2lM/jcsecKNlczBFTM9p1GjCa
	FHLUzghrcqazjg5KG5hhX5hlbKqFBAUjfCxUoe4mIbf/8Lnk2bnh4GuFI2oWymt+xojorPgPM3C
	yMEMeSFisiJs6c=
X-Received: by 2002:a17:90a:d00e:b0:399:221d:63c0 with SMTP id 98e67ed59e1d1-39b262409e5mr8455819a91.25.1788519087227;
        Fri, 04 Sep 2026 03:51:27 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339befdefcsm5031484eec.29.2026.09.04.03.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:51:26 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/4] arm64: fix typos in comments
Date: Fri,  4 Sep 2026 16:21:08 +0530
Message-ID: <20260904105114.29474-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904105114.29474-1-hemanth.selam@gmail.com>
References: <20260904105114.29474-1-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_035128_095921_1F75FD01 
X-CRM114-Status: GOOD (  18.77  )
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

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 arch/arm64/include/asm/stage2_pgtable.h | 2 +-
 arch/arm64/include/uapi/asm/ptrace.h    | 4 ++--
 arch/arm64/kernel/cpufeature.c          | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/include/asm/stage2_pgtable.h b/arch/arm64/include/asm/stage2_pgtable.h
index 23d27623e478..cf57da90b5d1 100644
--- a/arch/arm64/include/asm/stage2_pgtable.h
+++ b/arch/arm64/include/asm/stage2_pgtable.h
@@ -17,7 +17,7 @@
  *
  * This implies, the total number of page table levels required for
  * IPA_SHIFT at stage2 expected by the hardware can be calculated using
- * the same logic used for the (non-collapsable) stage1 page tables but for
+ * the same logic used for the (non-collapsible) stage1 page tables but for
  * (IPA_SHIFT - 4).
  */
 #define stage2_pgtable_levels(ipa)	ARM64_HW_PGTABLE_LEVELS((ipa) - 4)
diff --git a/arch/arm64/include/uapi/asm/ptrace.h b/arch/arm64/include/uapi/asm/ptrace.h
index 15649a253a57..0c8c6a126c3b 100644
--- a/arch/arm64/include/uapi/asm/ptrace.h
+++ b/arch/arm64/include/uapi/asm/ptrace.h
@@ -113,7 +113,7 @@ struct user_hwdebug_state {
 
 struct user_sve_header {
 	__u32 size; /* total meaningful regset content in bytes */
-	__u32 max_size; /* maxmium possible size for this thread */
+	__u32 max_size; /* maximum possible size for this thread */
 	__u16 vl; /* current vector length */
 	__u16 max_vl; /* maximum possible vector length */
 	__u16 flags;
@@ -272,7 +272,7 @@ struct user_pac_generic_keys {
 
 struct user_za_header {
 	__u32 size; /* total meaningful regset content in bytes */
-	__u32 max_size; /* maxmium possible size for this thread */
+	__u32 max_size; /* maximum possible size for this thread */
 	__u16 vl; /* current vector length */
 	__u16 max_vl; /* maximum possible vector length */
 	__u16 flags;
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 17b83a2518a8..fd52941b5f07 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -888,7 +888,7 @@ static int search_cmp_ftr_reg(const void *id, const void *regp)
  * entry.
  *
  * returns - Upon success,  matching ftr_reg entry for id.
- *         - NULL on failure. It is upto the caller to decide
+ *         - NULL on failure. It is up to the caller to decide
  *	     the impact of a failure.
  */
 static struct arm64_ftr_reg *get_arm64_ftr_reg_nowarn(u32 sys_id)
@@ -3682,7 +3682,7 @@ static void verify_local_cpu_caps(u16 scope_mask)
 			/*
 			 * We have to issue cpu_enable() irrespective of
 			 * whether the CPU has it or not, as it is enabeld
-			 * system wide. It is upto the call back to take
+			 * system wide. It is up to the call back to take
 			 * appropriate action on this CPU.
 			 */
 			if (caps->cpu_enable)
-- 
2.48.1


