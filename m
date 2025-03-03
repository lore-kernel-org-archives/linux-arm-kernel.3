Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3702C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 15:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oib9X6F+jD32qthRhftfxOrIXcfGV0ymse+3a+fep28=; b=SfR0MBJwSzOkq6L14gdx+vl99j
	8KVCEYLpSzOMSbhziOJTr+00UNdjdpiM51U1ELjfG183F24BUN0Uw6gqSSDfdZVrrJY0p8ZdtYWBc
	i2ivBiZ2xuDOCRRjykDs2d+b4fL9rj0i09owYpgY9D9IP4kqERAiP/1eo6L1WC2gZvm65J1CXG7kx
	ELwM5sNNXtM6aRzhAHUgf4Ngz3e8xfjOTlYhRmeOBJA+Wf7C0lLaUGsHntszIzancZ4zY/aEQNp2d
	tinzoOQwR7/3CELcR/jorHokXSmG9m7q/pxVyYZNFXQfjaufaK96szPQ4b0UofDt9mp2JXcE8+XDt
	5v+jznSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp80k-00000001NRP-2wSz;
	Mon, 03 Mar 2025 15:47:18 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7di-00000001IJE-3sMO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 15:23:32 +0000
Received: by mail-wm1-x341.google.com with SMTP id 5b1f17b1804b1-439950a45daso29214605e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 07:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741015409; x=1741620209; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oib9X6F+jD32qthRhftfxOrIXcfGV0ymse+3a+fep28=;
        b=niFplgjsxlU4d06uMPUhh2HGkRR1HgebKy5/eeJNqS835Hbv7NJ2syNGh76R13kHE8
         YQA2xYcjbxEdYAwfKJ3TccyZbuaG32FTXRaFGilwTB4cG3NpykjqbgQf9V5PCuJpVwUc
         7uzm8h3oGUFqWHy7rO8MunDtIFeEYTJxadMIxjn7VZIfnEVxp2LrCYiYRye8ZNhqJuIb
         y68nXh3VtnTK2KQV2f+sGd6Wt3VMLl+mXEg5QW9NoiKaUZ8Zcpc63pDkxHfDcT8ggCRG
         zik7z9wVts3T3/QYuxmCvuuha8zhDy03U18PuHlOb82wF/Cma1CGRlHEt1f8HxyQvYo+
         QEJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741015409; x=1741620209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oib9X6F+jD32qthRhftfxOrIXcfGV0ymse+3a+fep28=;
        b=RdXa8+sArT+c3nwgSg1zipDedSkaGy/X6RrMkpFimq9o9IwC9mOwKKhnK9dJQ85Mor
         J4GCUDYwrJnlyjxFoZ9xRC01ffV1YRlUDGXm97frOFKyaArWDPVnzOwROj2hagk328XE
         tkdbyZiVKjQOYHHlE4fJ5FdVjEYpLDBwbMZpf6ft6vetQmAJGxUNXmk7/OEUcLhUh+L4
         kq1PO/4+yDsFTtOm4uIMhW6SG/3JlgvOnOifTl0AseLAKfo7WatgcLbNiSuw/AVed186
         +4+pK5Ua0RdO7fxKE8mBHMCmikzlpDWjOWjlGj8oHx1HEjUFdxLJ190CRy3NNz4/aM29
         yd0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWbCl5JJ4qsaKZYtESI+E4DgtbAkDeXSEGefYp7riZfpLSDfkd1hRIX0ZaimfstVS3Pu6gAuQiUxto4rD3RS2Fu@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1XK5khtq+tfpBkQxuyHnA5dIK8ezqkXMa6YNfh/SCwv+gaXA7
	0xjZ2SFdVsNgBbHeUDlXyi0ThcW38otRoZTXRTdvEhFhNKaf+Vm9
X-Gm-Gg: ASbGncvlPv7VjdueAGnorcJU+W0kJmvkMpIHbQeHg5aNlL+hoB52VIL2GbXWQRoD1Sk
	55QqLVAF1+DIePPhOPefIYV5mxaH8e1st1T8d/7LouUYo3JdCK+MlxHs1hNfxi+tv3IdcVtVLbD
	GENeFYXvE3SY71BMWuUOfOYL6lo6WV+k2NK6ojIBgS91rQqUvPBvqbTQQN4EnE9O3wFE3vP/y7o
	s/jlL+8OvHe7HfgiwfCwlnHWT2eW/nZctDanJLBgflXvBIPgbJQGIFVDvf+4X/Rsdg4LSNB4kWs
	S/Bi+DTTNyXlbmihYPZrIEW6dSAuGdPAp5E=
X-Google-Smtp-Source: AGHT+IHK0E0NT4rN+IBrKPzoxmISlpoRx++6wRPzHRPKMbke27YkpGiSQnpSIDIa7J8yfk3LY6QLQA==
X-Received: by 2002:a05:600c:4e8b:b0:439:a1c7:7b29 with SMTP id 5b1f17b1804b1-43ba6703c35mr123515565e9.17.1741015409574;
        Mon, 03 Mar 2025 07:23:29 -0800 (PST)
Received: from localhost ([2a03:2880:31ff:44::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e485db82sm14510061f8f.88.2025.03.03.07.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 07:23:29 -0800 (PST)
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
Subject: [PATCH bpf-next v3 15/25] rqspinlock: Add helper to print a splat on timeout or deadlock
Date: Mon,  3 Mar 2025 07:22:55 -0800
Message-ID: <20250303152305.3195648-16-memxor@gmail.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250303152305.3195648-1-memxor@gmail.com>
References: <20250303152305.3195648-1-memxor@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2125; h=from:subject; bh=XzehY2DPwsFHlB5VuQsc3kNRx10DtgHBazvwnaqKM4M=; b=owEBbQKS/ZANAwAIAUzgyIZIvxHKAcsmYgBnxcWXYD8EVbB4Iydj+LTkfn6cdW8csGFE6TObIbKx E0nmgrCJAjMEAAEIAB0WIQRLvip+Buz51YI8YRFM4MiGSL8RygUCZ8XFlwAKCRBM4MiGSL8RyrkJEA Ct9v2S2uZ5k2kQeAFIPGD+gS68B4nVheOj37Umc8z+EwrGBzZ82mY8MkklYthiJE2AQBdHrtWAwoqG tZbTvmL6+lzWfEYRZt2xi60n3hTJMO3dlntsG+nTWnBWpIQZX5PNvzwPOl1/8OQMO+69prEjQItSyu eMEd38+aF8KI6iN85h1WM0KeOubpLLpUWfdNufr7Gsq0Oi1qImSnF/ilMPpOkoWQnvjxBU2ZKp75De P5Whx7I1WBvsuPW2lX4rzXBrMWbAWPQpojlxod4Ls4y3A61yRekC7LremgMkSs6gvc7Tnw/Z9lQWCU CgtczCyFYGLMz+mNBIEEbLqTQdgdrvV3fFCY78DcBB7xUvGlqD6CIZGr6DZljaV2SoWRHRCmv5Ft8H gVx7H5tqZgvWVo2SoMK4dnjxpn4/df+FCKxss6T2T6c60eFLmTgvI0DME2DNvOKFHgBhQpy6p3Cxsl H4g6MJFPnCJsqycg5cOVJKjPPgeoTGZlXrmAyPL60whVruu8QiWcCAFv4taoKU7M5yTeAGfAYdFU8l 6Ws3FsgbVuQ7DFWtfrLU7462oedcdeEAj81i6KLZmyfucZ073rF8/ghmFeBJtrIiheHs7mCqctGJjH +MDX6Nid6DYpDuM6VXjrvhhN8QfGnRpqsnGqUV9O6Cf6rbVzKauRdtvFhKgA==
X-Developer-Key: i=memxor@gmail.com; a=openpgp; fpr=4BBE2A7E06ECF9D5823C61114CE0C88648BF11CA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_072330_963850_F0DF2DC8 
X-CRM114-Status: GOOD (  14.54  )
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

Whenever a timeout and a deadlock occurs, we would want to print a
message to the dmesg console, including the CPU where the event
occurred, the list of locks in the held locks table, and the stack trace
of the caller, which allows determining where exactly in the slow path
the waiter timed out or detected a deadlock.

Splats are limited to atmost one per-CPU during machine uptime, and a
lock is acquired to ensure that no interleaving occurs when a concurrent
set of CPUs conflict and enter a deadlock situation and start printing
data.

Later patches will use this to inspect return value of rqspinlock API
and then report a violation if necessary.

Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
---
 kernel/locking/rqspinlock.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/kernel/locking/rqspinlock.c b/kernel/locking/rqspinlock.c
index b06256bb16f4..3b4fdb183588 100644
--- a/kernel/locking/rqspinlock.c
+++ b/kernel/locking/rqspinlock.c
@@ -195,6 +195,35 @@ static noinline int check_deadlock_ABBA(rqspinlock_t *lock, u32 mask,
 	return 0;
 }
 
+static DEFINE_PER_CPU(int, report_nest_cnt);
+static DEFINE_PER_CPU(bool, report_flag);
+static arch_spinlock_t report_lock;
+
+static void rqspinlock_report_violation(const char *s, void *lock)
+{
+	struct rqspinlock_held *rqh = this_cpu_ptr(&rqspinlock_held_locks);
+
+	if (this_cpu_inc_return(report_nest_cnt) != 1) {
+		this_cpu_dec(report_nest_cnt);
+		return;
+	}
+	if (this_cpu_read(report_flag))
+		goto end;
+	this_cpu_write(report_flag, true);
+	arch_spin_lock(&report_lock);
+
+	pr_err("CPU %d: %s", smp_processor_id(), s);
+	pr_info("Held locks: %d\n", rqh->cnt + 1);
+	pr_info("Held lock[%2d] = 0x%px\n", 0, lock);
+	for (int i = 0; i < min(RES_NR_HELD, rqh->cnt); i++)
+		pr_info("Held lock[%2d] = 0x%px\n", i + 1, rqh->locks[i]);
+	dump_stack();
+
+	arch_spin_unlock(&report_lock);
+end:
+	this_cpu_dec(report_nest_cnt);
+}
+
 static noinline int check_deadlock(rqspinlock_t *lock, u32 mask,
 				   struct rqspinlock_timeout *ts)
 {
-- 
2.43.5


