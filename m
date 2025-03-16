Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4241C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Mar 2025 04:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=elS4VXsAjSZVIDIoCNxyLW7RW0fHjd1SmHmDu6oNDNQ=; b=yIxpInBeoI7mzQye6ajvQB3ZCv
	gaEVbZnKF9wh06bFIIOSais97gvHqVZ1QOjpXwfsjToDaE1Sekz+6JZFHVGDEUFYKPoCSKV4Y+Xpi
	pKTow2fnk5uLPXx3m/5FAYo7gVnUZxDl6N6n/Of9yjHS9VDgZSZlgpoSexUzBPfgQU3+L4jkP91Wu
	6uRPTdMgYMBr9RazZPVcBg4cQjVNUnlqBQN1LIC8CMsk9z3Oz0ApMmoXdzT7Go1iB/de5sF1BuPZO
	i9FWUwgO6AGOgwOQLp8pglgWdlpV7RSyqDY2TyQFajV4lpaC162KP5uuYtlD3VU2Z3Qr8E5FV0OjH
	2hlZNb4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttflH-0000000HGdE-3xRf;
	Sun, 16 Mar 2025 04:38:07 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttfGJ-0000000HCMf-3Fsm
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Mar 2025 04:06:09 +0000
Received: by mail-wm1-x343.google.com with SMTP id 5b1f17b1804b1-43690d4605dso6607905e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Mar 2025 21:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742097966; x=1742702766; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=elS4VXsAjSZVIDIoCNxyLW7RW0fHjd1SmHmDu6oNDNQ=;
        b=II5XEAfQDqoQKimpQO3T8ly9n2o7Lc0wSEZKFsf8Tl65LEDI1bryUFeaOxU1Jj8EDB
         65DqgcNoqL9K3VH1xa+depruoo9XovUChsFG1iXjXwqGJNIBr8rFeGhdVSON4iBz2KwY
         C+gqvSaMbhY7Oy13o04CHFIY3ShTygK1CsuZz7VoahuMdxg/iTY6lg1hZgjJc8hXz8ie
         XLQR849aHm5wkliGsRNJClFDiMwnXXKnOG9/uVYt37eZ9XO/Q8890wT5ireMpT88877H
         m3Nf1xx89+3v7Mtkcjf4Z3rekgYLvds8Z0N5AsXAjWt1MGmaggIOnVcQwvA/9QHMNTM6
         CmqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742097966; x=1742702766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=elS4VXsAjSZVIDIoCNxyLW7RW0fHjd1SmHmDu6oNDNQ=;
        b=giBXACnISM6nAs6/E/JHpIX/Qwog8J/8GxvB/jw27s/TwROhJZ8RBQlL0hNO8gAbM2
         JS4oW9yeP4cctMHQlKZ1LwrgAMwnpnA46CYaT3nxj/4WPRJ93Fi4bPeen4+vPIG1wRud
         I9cJLp0zSvvDawZDC/8MB71NMyKilGq2srA+3edakBntnH9Jt30T2f9kNb0u/8Um+R0a
         Cn+xsKF5rxj6MAtOlMWFC2KDJr9Yc6JDyRSjkb9+ow+t8XYYaWHch6qBswxFLyNVCJsV
         X1F7CTL8N6X7d1NlfnbdOvQVZURUaKjorrKkF78Snz4j+xzrIuwkFog74cRyQFHK3NTw
         Q9Bg==
X-Forwarded-Encrypted: i=1; AJvYcCWlJxFd85wPmP+54IMNRUOClcyLAFQ5Doh/SHZK4s6fCvy9r1RAgpwU6MPTFHxchuokq6aFbMsPBR3IxMGjX1CU@lists.infradead.org
X-Gm-Message-State: AOJu0YwI8JAd6ggXciP0MnOLPYN2C+9q8n6bJsa1u1ALUreW2Rk5ZOdC
	gZzTk5SzcqaGLpdLbvpGkEomABwJ+3rz867LWr0PhWSdESEtDCj2
X-Gm-Gg: ASbGnctKG1Mi/Q76lR8T0AOGO0+CgJzzDpTVN7dFu5Z4Ghnc8XnlsF2S7sepjkuQI/H
	t/6KnnVy+Q8JU38I6NaRDhZ/J1GeqIMCeZYlf4IsGWTlPC/mKV23O7tizrutOPpHGAX2l+Nn4Cj
	R2lZn03k+090+jqEpmn3mHF6jPrhsQJR6ZjwVWOGaMpe8PemK4vjmRgil++Rrewy3ML2EIKdyCq
	QnnfMgRYy2qmCscdUFN1/3+sZxcfk1Os/6Gc9hnk3HOW4AD9D3ymSby8SJ3zd3bCRHcaUOMHTlm
	ZyA6mPfONn00++TEIT3fcH026p5K4zzhKw==
X-Google-Smtp-Source: AGHT+IEnbdVB/nE2Pi33KFYYtnULRWUI98TYw/MBJWQBTX6XEUdt0SDKhZrXk7vHOjd1S2LDfZ7qnQ==
X-Received: by 2002:adf:c790:0:b0:391:41fb:89ff with SMTP id ffacd0b85a97d-3971f60b104mr8750937f8f.27.1742097966388;
        Sat, 15 Mar 2025 21:06:06 -0700 (PDT)
Received: from localhost ([2a03:2880:31ff:b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb7eb9ccsm11053346f8f.96.2025.03.15.21.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 21:06:05 -0700 (PDT)
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
To: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Will Deacon <will@kernel.org>,
	Waiman Long <llong@redhat.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Barret Rhoden <brho@google.com>,
	Josh Don <joshdon@google.com>,
	Dohyun Kim <dohyunkim@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kkd@meta.com,
	kernel-team@meta.com
Subject: [PATCH bpf-next v4 18/25] rqspinlock: Add locktorture support
Date: Sat, 15 Mar 2025 21:05:34 -0700
Message-ID: <20250316040541.108729-19-memxor@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250316040541.108729-1-memxor@gmail.com>
References: <20250316040541.108729-1-memxor@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2633; h=from:subject; bh=SBe9SrR1gqB5bS55WnFfwdHWzM4LavhATA7RzB99U+Y=; b=owEBbQKS/ZANAwAIAUzgyIZIvxHKAcsmYgBn1k3eNpMeA1g8bEkNbE5LoMw6rWgMD0iqfFTREsw3 1ViDmC2JAjMEAAEIAB0WIQRLvip+Buz51YI8YRFM4MiGSL8RygUCZ9ZN3gAKCRBM4MiGSL8RyuqtD/ 9/IGQPEqqIYM45Wbzz/zxdRnXzdviyqlrvI07Exouh0vJd+riQkKUn0fvtxOmYGiW0hf+KSPes3ypJ tSGUhUEHoy4KZ6aHeBpDd+Atw6aeLia+nCh/xXga/cb8an5pVO+3oHinEiNot2dfTsznbw2rgqLI/o 18KlBPsGuCz9o9fNDbrrYW89iCAR62qZm/ELBGZ5tUXVLKJTJU5+/FUG2EM+D6yyeWllgXPFCL9B// ySaQANZ8Bhy9vbrVe4wW67L581XJr2ML9um5yEfmYDqkTanYBBHCU+e7kguhEs2Q0bjT9F9AO609C7 uL1NTzcDsH6c0Avd6a/ITdoNp1E4ZvVp6HQqo/pBk6PXgu1gBcudXCyPs+Igx8NV4FiaP31yQ5e01S 9UbxJSSzxs2+fgRnO/i6pqNrO8Mktz8buhxlr5r2gqkDOXqWeWZEDHrj32fD3WgY7j99ENTR9y98bp L0wcKbx1en8AJckwWYMKtSC5TbsAU1rBvKW1jJtjXsifakOYMtf+dASlhIY/fIoefIOQ98NgY3wJDS RwY9kcDNvp8LkYBgR0/kRIpMAkUqpoon7lKnqgV4ZsxKpi8p5BN3ZSvGMbHMrJs+4gaGIeSnBJFaNM 5Lj0WTWrsYOJXYBXA0iaogmJAwZ8UtN5+FNxg+SHFESqpNMmvjruoQOLu8vg==
X-Developer-Key: i=memxor@gmail.com; a=openpgp; fpr=4BBE2A7E06ECF9D5823C61114CE0C88648BF11CA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_210607_805699_ED1F1637 
X-CRM114-Status: GOOD (  13.42  )
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

Introduce locktorture support for rqspinlock using the newly added
macros as the first in-kernel user and consumer. Guard the code with
CONFIG_BPF_SYSCALL ifdef since rqspinlock is not available otherwise.

Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
---
 kernel/locking/locktorture.c | 57 ++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/kernel/locking/locktorture.c b/kernel/locking/locktorture.c
index cc33470f4de9..ce0362f0a871 100644
--- a/kernel/locking/locktorture.c
+++ b/kernel/locking/locktorture.c
@@ -362,6 +362,60 @@ static struct lock_torture_ops raw_spin_lock_irq_ops = {
 	.name		= "raw_spin_lock_irq"
 };
 
+#ifdef CONFIG_BPF_SYSCALL
+
+#include <asm/rqspinlock.h>
+static rqspinlock_t rqspinlock;
+
+static int torture_raw_res_spin_write_lock(int tid __maybe_unused)
+{
+	raw_res_spin_lock(&rqspinlock);
+	return 0;
+}
+
+static void torture_raw_res_spin_write_unlock(int tid __maybe_unused)
+{
+	raw_res_spin_unlock(&rqspinlock);
+}
+
+static struct lock_torture_ops raw_res_spin_lock_ops = {
+	.writelock	= torture_raw_res_spin_write_lock,
+	.write_delay	= torture_spin_lock_write_delay,
+	.task_boost     = torture_rt_boost,
+	.writeunlock	= torture_raw_res_spin_write_unlock,
+	.readlock       = NULL,
+	.read_delay     = NULL,
+	.readunlock     = NULL,
+	.name		= "raw_res_spin_lock"
+};
+
+static int torture_raw_res_spin_write_lock_irq(int tid __maybe_unused)
+{
+	unsigned long flags;
+
+	raw_res_spin_lock_irqsave(&rqspinlock, flags);
+	cxt.cur_ops->flags = flags;
+	return 0;
+}
+
+static void torture_raw_res_spin_write_unlock_irq(int tid __maybe_unused)
+{
+	raw_res_spin_unlock_irqrestore(&rqspinlock, cxt.cur_ops->flags);
+}
+
+static struct lock_torture_ops raw_res_spin_lock_irq_ops = {
+	.writelock	= torture_raw_res_spin_write_lock_irq,
+	.write_delay	= torture_spin_lock_write_delay,
+	.task_boost     = torture_rt_boost,
+	.writeunlock	= torture_raw_res_spin_write_unlock_irq,
+	.readlock       = NULL,
+	.read_delay     = NULL,
+	.readunlock     = NULL,
+	.name		= "raw_res_spin_lock_irq"
+};
+
+#endif
+
 static DEFINE_RWLOCK(torture_rwlock);
 
 static int torture_rwlock_write_lock(int tid __maybe_unused)
@@ -1168,6 +1222,9 @@ static int __init lock_torture_init(void)
 		&lock_busted_ops,
 		&spin_lock_ops, &spin_lock_irq_ops,
 		&raw_spin_lock_ops, &raw_spin_lock_irq_ops,
+#ifdef CONFIG_BPF_SYSCALL
+		&raw_res_spin_lock_ops, &raw_res_spin_lock_irq_ops,
+#endif
 		&rw_lock_ops, &rw_lock_irq_ops,
 		&mutex_lock_ops,
 		&ww_mutex_lock_ops,
-- 
2.47.1


