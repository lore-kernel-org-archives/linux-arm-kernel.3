Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B3D7CA0FE7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 20:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n6KAJgpe+g35DHpdkouiNXTkH/lGhIRNqTvdrNu3evo=; b=kTYNaRai/6SnRKj5q/fpmOWuJA
	nurfAdk4iCPm5bMPsqE/3qWRDjTCEGuQFGDV9ifcM0WFnSCX/zzf7gqbAAFMAqlJWwcLbtkz/BhAr
	GSeY2oUa68l+W2slfamLLt76Zwslnw5+FZU4oxcOu1wADezzGCv7er+afMy9IEzESC7fksT0yPz9V
	km1QdiQYp78Z6wY9ayCrMibvBofwm7w6lF5OJvAO+z8fH5XIS4fmfFqqLnt2dT7JFJVI6HcqDc/Ds
	2styhp27wuUs1WhbyUHpeg+kNAK/l/nzQDuYguTfal2tI2trkt0d5B3KZyIIlBueCwo3SyVEWfeZm
	6zkYukOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqdYx-00000009WXc-1rp7;
	Mon, 25 Aug 2025 20:13:07 +0000
Received: from mail-pg1-f201.google.com ([209.85.215.201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqdSX-00000009Uo9-0jcD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 20:06:30 +0000
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b49c4e7ba85so1528260a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 13:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756152387; x=1756757187; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=n6KAJgpe+g35DHpdkouiNXTkH/lGhIRNqTvdrNu3evo=;
        b=HNFfglC5ZJDY0CHIJXtFj9QSU4kEkAnNTerNsplmzP9TTkXD1d+WNBT9gVprCnEDNR
         fDJTkqLBFvq5RrbQZlCHaOiVEhWZG78iXlITcOFqthk3pY7l+Xz0AkVDJutWo21L7WOi
         vBpaiNE79N+85I86or4rNeFL8un/gAcQpUSJa1p4DsThlOvdgr0ze7Om2Go8gLw3Ykwu
         ik6G79XrHzVU+eltN6uwK2+f5vmFuH5lMxRINxaa/YL4tJOZu3JNGwCyB/SH66nMOfY/
         YbWlykrj/w1I3rXsn1vZGPAdCUBpVIZ8DWAWWGD1wPwSVdjWWznRDMIE5o/waRadBdFG
         lIUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756152387; x=1756757187;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n6KAJgpe+g35DHpdkouiNXTkH/lGhIRNqTvdrNu3evo=;
        b=CVXoquAHNxacjSnSR7fPELE1mp6raTBUXzYJVm7dgbG5Ft8HOOupT3yyUYV7eokH9F
         hPhwOixUC6AeMoPTNyIJYogOIOLm/jcEFll68/LswtY7l9N4Wqmd0wuo4ywgle725Kxk
         cF8SHW4M8/h6rhgYDWvRIEVsHAHNaRbRVVydatyocDMpkLHbzcNx6zVgyNybmBGYyHgc
         D//KOknEzprJSPIXdBJ9Q/BchJbzwWby/uOjTIJvPLhL3DpykRApUsn2mcHw8uuxqauk
         d1FFK77otDlOA13M2HvG0hz7rX9suxt+a5z5TCjq7bmdCCzrphvx3H9P6xz7tvsYf+Mt
         9HHw==
X-Forwarded-Encrypted: i=1; AJvYcCV1qo4NYBZjsfcoBvhyYF9Mt7yOKjPF4l+8ZgNC1QSaecQsU6t8lT7xEJhEPbLFVBHcz7M/BkzPa2Ta0DMMBGtR@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/dav0+k7yHDRG8FVbQrTMbRCMRoGRyKYw3rw/INZPw1QihpQ0
	KqVvGp+OTgum7GxYFO8Kme92NB+SmghPZsn0NgcGxAqc3IgxD102mtT5xic7JLXRO+lNe0Q2Ttb
	hPZLnfA==
X-Google-Smtp-Source: AGHT+IF91dn1j6fIvX+uRWorld3If0wpZl5jf5hDJFPUly2WnQsNSAnJfoCi7L3EWOQImM7m2slTmOJmyMA=
X-Received: from pjbok14.prod.google.com ([2002:a17:90b:1d4e:b0:325:8fba:708c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:fc4b:b0:246:76ed:e25d
 with SMTP id d9443c01a7336-24676edecf2mr117886095ad.50.1756152387296; Mon, 25
 Aug 2025 13:06:27 -0700 (PDT)
Date: Mon, 25 Aug 2025 13:06:18 -0700
In-Reply-To: <20250825200622.3759571-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250825200622.3759571-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.261.g7ce5a0a67e-goog
Message-ID: <20250825200622.3759571-2-seanjc@google.com>
Subject: [PATCH 1/5] Drivers: hv: Move TIF pre-guest work handling fully into mshv_common.c
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Peter Zijlstra <peterz@infradead.org>, 
	Andy Lutomirski <luto@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Frederic Weisbecker <frederic@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Josh Triplett <josh@joshtriplett.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Uladzislau Rezki <urezki@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-hyperv@vger.kernel.org, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_130629_226400_B4C5BDAE 
X-CRM114-Status: GOOD (  17.85  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Move the root partition's handling of pending thread work fully into
mshv_common.c so that the "work pending" and "do work" code is co-located.
Splitting the flags-to-check logic makes the code unnnecessarily difficult
to maintain, e.g. it would be all too easy to add a check in "do work" but
not in "work pending", and vice versa.

Note, this adds an extra CALL+RET when no work is pending; that will be
remedied in the near feature by switching to common virtualization entry
APIs.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/hv/mshv.h           |  2 +-
 drivers/hv/mshv_common.c    | 24 +++++++++++++++++++++++-
 drivers/hv/mshv_root_main.c | 24 +-----------------------
 3 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/hv/mshv.h b/drivers/hv/mshv.h
index 0340a67acd0a..db3aa3831c43 100644
--- a/drivers/hv/mshv.h
+++ b/drivers/hv/mshv.h
@@ -25,6 +25,6 @@ int hv_call_set_vp_registers(u32 vp_index, u64 partition_id, u16 count,
 int hv_call_get_partition_property(u64 partition_id, u64 property_code,
 				   u64 *property_value);
 
-int mshv_do_pre_guest_mode_work(ulong th_flags);
+int mshv_do_pre_guest_mode_work(void);
 
 #endif /* _MSHV_H */
diff --git a/drivers/hv/mshv_common.c b/drivers/hv/mshv_common.c
index 6f227a8a5af7..1acc47c4be0d 100644
--- a/drivers/hv/mshv_common.c
+++ b/drivers/hv/mshv_common.c
@@ -146,7 +146,7 @@ EXPORT_SYMBOL_GPL(hv_call_get_partition_property);
  *
  * Returns: 0 on success, -errno on error.
  */
-int mshv_do_pre_guest_mode_work(ulong th_flags)
+static int __mshv_do_pre_guest_mode_work(ulong th_flags)
 {
 	if (th_flags & (_TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL))
 		return -EINTR;
@@ -159,4 +159,26 @@ int mshv_do_pre_guest_mode_work(ulong th_flags)
 
 	return 0;
 }
+
+int mshv_do_pre_guest_mode_work(void)
+{
+	const ulong work_flags = _TIF_NOTIFY_SIGNAL | _TIF_SIGPENDING |
+				 _TIF_NEED_RESCHED  | _TIF_NOTIFY_RESUME;
+	ulong th_flags;
+
+	th_flags = read_thread_flags();
+	while (th_flags & work_flags) {
+		int ret;
+
+		/* nb: following will call schedule */
+		ret = __mshv_do_pre_guest_mode_work(th_flags);
+		if (ret)
+			return ret;
+
+		th_flags = read_thread_flags();
+	}
+
+	return 0;
+
+}
 EXPORT_SYMBOL_GPL(mshv_do_pre_guest_mode_work);
diff --git a/drivers/hv/mshv_root_main.c b/drivers/hv/mshv_root_main.c
index 72df774e410a..6f677fb93af0 100644
--- a/drivers/hv/mshv_root_main.c
+++ b/drivers/hv/mshv_root_main.c
@@ -487,28 +487,6 @@ mshv_vp_wait_for_hv_kick(struct mshv_vp *vp)
 	return 0;
 }
 
-static int mshv_pre_guest_mode_work(struct mshv_vp *vp)
-{
-	const ulong work_flags = _TIF_NOTIFY_SIGNAL | _TIF_SIGPENDING |
-				 _TIF_NEED_RESCHED  | _TIF_NOTIFY_RESUME;
-	ulong th_flags;
-
-	th_flags = read_thread_flags();
-	while (th_flags & work_flags) {
-		int ret;
-
-		/* nb: following will call schedule */
-		ret = mshv_do_pre_guest_mode_work(th_flags);
-
-		if (ret)
-			return ret;
-
-		th_flags = read_thread_flags();
-	}
-
-	return 0;
-}
-
 /* Must be called with interrupts enabled */
 static long mshv_run_vp_with_root_scheduler(struct mshv_vp *vp)
 {
@@ -529,7 +507,7 @@ static long mshv_run_vp_with_root_scheduler(struct mshv_vp *vp)
 		u32 flags = 0;
 		struct hv_output_dispatch_vp output;
 
-		ret = mshv_pre_guest_mode_work(vp);
+		ret = mshv_do_pre_guest_mode_work();
 		if (ret)
 			break;
 
-- 
2.51.0.261.g7ce5a0a67e-goog


