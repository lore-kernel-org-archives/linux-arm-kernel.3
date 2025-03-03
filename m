Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E40C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 15:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MKS1T/XQ/tWs8ecRTlu3cl4kKPJmu8O7rwuQ99x/CTQ=; b=Xt9gEtO+XFCDhS2qHbmvKKF0gx
	9Qb9kNNqrb5+sQvyxrWqEZj02vkvv6QWuSpTeG51SlYMbx+RZMBl99e9m7abHx4r0WXpm7/GRQyOZ
	g7FWOrmZxLIQWSlMvmF5KChx544l/IQ27F8fB3FsvRcd1Rx1hnVNhuJawDtGqlTmrQ7EJMzOXcnRL
	FqvgL453lp2s5Q6WXZ3XvKDhxvzzPm6mc+EmFj5GCWfB/EHR7950ZwS5E108pZdXNGYjlDyOdZqqX
	YYRv74F39/Ru90BsmCsP8OjhLfrS/TOaRX0qTlartsjDul8y85MBt90Q3GV0U1snCmEQi8hSro6gI
	Deal98pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp85M-00000001OKF-3SV0;
	Mon, 03 Mar 2025 15:52:04 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7dl-00000001IKY-10sN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 15:23:34 +0000
Received: by mail-wm1-x344.google.com with SMTP id 5b1f17b1804b1-43bc31227ecso6733345e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 07:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741015412; x=1741620212; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MKS1T/XQ/tWs8ecRTlu3cl4kKPJmu8O7rwuQ99x/CTQ=;
        b=KPP6gGYv58mYWPodLVCYF6EMogfkyHpUVXXgFy/owQ5AG5+lxd5HSbBa16FYuU3ceA
         xYJNTh5WMg7UjMg5ubMMbfQE67gzpFm69JC96fXukfYoqwK9w4GQnmZtaHb2GCwEBxlH
         UGyd8S2kz5cO+DGp0sGZ+2/MKb0ONjka43cLcx1LJqbaNUTn50bM4WdnL5bWqQtlmDvx
         mRPHszlNcUp3B8s4SB0kb3En+g+CdRVqaO3F041L1kjq+K+l2a3y2MFKe+aQa91DraZt
         cljW3Ob1wouglKe+5Op+VfdRCmtoYW/CxcCKPJ1tCQVc0TfaktvrYqqRvBKzYqclJzaT
         UWIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741015412; x=1741620212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MKS1T/XQ/tWs8ecRTlu3cl4kKPJmu8O7rwuQ99x/CTQ=;
        b=clf4bjCHL1SDct2KS6hCwCQYGupsnOp95fJQjDaoFKTRNlRCSOLM+8+JV5z6uSOE1s
         I8hm1dfrMGdCAjcn3Uu/431sCiZgB0kNsC+xZrs2zcvQoPHg+V+kjP+RccejhqDOQAu5
         TOOFYz9BUcrGIj5DyISWUsWdd8fnHxgIurZjH1mGQuxAEovwOYVHNXvMPCeyz/6aPsVn
         fII2yoctzRa2XOgq3LufaIc00eB72q3GsC6m8NMc+h8EHlJx77HESAnH1qsavPLPKW++
         OmyYQuC9cW6siNlN3ki6sQmLnR6rXi/+iDcV+NqOh/xJ3zM6T+BOifNNphN+E1xwz8Gs
         GS+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVo63+IvAsdkTPBCLHgMidzwOLjbgaBcqZ9sCR7SEhjdE8CRho7kI+Pq8SQTgWfEBG0l5xNlDHd/zDUtxipxqrX@lists.infradead.org
X-Gm-Message-State: AOJu0YycTICWnwoOwFkXIiiuaJSbDV8qSP6zE7Ag17eqgQfYkDACiOmw
	ba/zu6Zd8uxTcoh4lVQkNkKvjScoldetIRTirNU5uFKTdSbWLzct
X-Gm-Gg: ASbGncv0UcZUhLnkhkRubjT/zRDfIrwFXauom7EikMrF3+zXqHpLEjUn0vhdZqcVu1o
	02btA1DkhyGLU7RQA2EcJmdRBYuvXstK4xVF02DTr6CWK8zn70+wFnEB0Qew/QOykeuQXL5m3Pe
	L6qfoPD8+eiqZOW0GMvwc7L8MkH7nWfHFG7irKb9sF/m56kHymc9MU4NFixcYBd6KUaGxVESFVz
	avQaNhsnN+5sDrpr7JrisFytawIZjamQyBoNedaO/e40ZOZPlw9kbGRzY64VleNJQn+3hTFRoMx
	UAK81Im7UskQSt5/uRRbdZA0YhCBF7tmbR8=
X-Google-Smtp-Source: AGHT+IGlH16ifEyb4PlL+eWM8UXuzJH348pjxTrHJU3GO0ZnngxsPxkDQyxyCAS30KE/L9MfeFB7Sw==
X-Received: by 2002:a05:600c:511e:b0:439:6017:6689 with SMTP id 5b1f17b1804b1-43ba66e0bf5mr109140235e9.9.1741015411800;
        Mon, 03 Mar 2025 07:23:31 -0800 (PST)
Received: from localhost ([2a03:2880:31ff:74::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4796084sm15030999f8f.19.2025.03.03.07.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 07:23:31 -0800 (PST)
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
Subject: [PATCH bpf-next v3 17/25] rqspinlock: Add locktorture support
Date: Mon,  3 Mar 2025 07:22:57 -0800
Message-ID: <20250303152305.3195648-18-memxor@gmail.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250303152305.3195648-1-memxor@gmail.com>
References: <20250303152305.3195648-1-memxor@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3149; h=from:subject; bh=bthuxBncjGOs4mky1mKdWZk3nTI3RWDlXR+RsRusmm0=; b=owEBbQKS/ZANAwAIAUzgyIZIvxHKAcsmYgBnxcWYc+Sgz0ORRtjBX9jRAAhbYoGw0HwGVEnt1lkK 0s8wahWJAjMEAAEIAB0WIQRLvip+Buz51YI8YRFM4MiGSL8RygUCZ8XFmAAKCRBM4MiGSL8RylTSD/ 9TP8RtAKolLrilNYH10VbArS3ra9jOCKUgFIRYMn7uqajviRSi77CSgnaVlYnmA9EfkXqnPw6r53W8 inm8T7K1fkgOmvIbYxtsKTKVPyW6c0loQf/rxpgCr7uK34o5YRBK/iSgFyLS4uAE5QbB/Pf9jJ28lv Wtgk/Ey42frf7Uf5RQNdrzPGWDnh/n2149+2agrmt9UNjkHTYYsrn6TOvYBRgxX0kiN60RLQbmXTjC nHD31GAomXGCnNxzEDhY1G2vG7r5C67GzOWT3UMHmKgQdaRcF/Lsw8fkI6g612CABQio63//Nm0QSA Myxwcedn9UdnGHGvM0F3IlXZs2Ub9fwmfoi6C1gmJ3MJiii8TYzxMoVYTXMM5yktxCqQG11WnTNq0l b3CpjATOtu5zhfGJH4mG717bInDxZ1ZmPKWEEGT4Hz0ePktKsfs56WLmTMhKVkRnC8Fa8ztfYGJLdG bQg5bPK0unpb/3Z3pIjZUHVpqVYWKGFYCmKd8AYmN3D7RlJn7HRmZCf56bovKsEgHPk9ZlLamM213o m1cj0p0dLPhfrYItv1LDuMe8Xkd/8Dzp3oWLhMa097fZFVsUhzB6TnuCE56VdlV2ZEvObJHft6x3OR yX8L4HXgOOdKq1WkjxYTYQtu9ZbqUVfB5ojTHrx1qJR9u7pdx19dUvyvMZQg==
X-Developer-Key: i=memxor@gmail.com; a=openpgp; fpr=4BBE2A7E06ECF9D5823C61114CE0C88648BF11CA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_072333_289485_5FEC1A11 
X-CRM114-Status: GOOD (  14.38  )
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
 kernel/locking/rqspinlock.c  |  1 +
 2 files changed, 58 insertions(+)

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
diff --git a/kernel/locking/rqspinlock.c b/kernel/locking/rqspinlock.c
index 3b4fdb183588..0031a1bfbd4e 100644
--- a/kernel/locking/rqspinlock.c
+++ b/kernel/locking/rqspinlock.c
@@ -85,6 +85,7 @@ struct rqspinlock_timeout {
 #define RES_TIMEOUT_VAL	2
 
 DEFINE_PER_CPU_ALIGNED(struct rqspinlock_held, rqspinlock_held_locks);
+EXPORT_SYMBOL_GPL(rqspinlock_held_locks);
 
 static bool is_lock_released(rqspinlock_t *lock, u32 mask, struct rqspinlock_timeout *ts)
 {
-- 
2.43.5


