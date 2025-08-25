Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29434CA0FE7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 20:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+oyHFbNT6msf6glrd5KFIdZcOF0+oR5scj5fBrCtJpc=; b=0Tv/mfX97Z1CLkhHaG0AKMq3Jr
	Y/tm5m2wU7Sxz0ZbDTneysICxUgKNMbu7mbwmoBSFMQ30pPw3UpZ73u5X/apPaw+Uo2OnJN6MSwgq
	RCFt5YyN+4asbfGg6ow1iWo4T5fX6SRjlCFXiOlWTzAa2OlB1QA93ghDCjD6qD2xAStXGM6EGxfaG
	KjHQ2Mh2gexNa9Y9XQfUvIDT+J7QulaHh1jG2rwKRUZvCpFhzF12Gd4yBHiC+wdFY8xD9ruf6BQ89
	GDQ14EYlUf0moj6t9Tcmg/AD1rWsVwrKgHHNf2BRiUj4/6PzxrMa3/GIVtQDCZRObnMZaeR+tcd6x
	pBQK/New==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqdeN-00000009XoF-2Rut;
	Mon, 25 Aug 2025 20:18:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqdSc-00000009Usa-0fWr
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 25 Aug 2025 20:06:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+oyHFbNT6msf6glrd5KFIdZcOF0+oR5scj5fBrCtJpc=; b=E7DzcDAK4qID2b1tMQb9K3JxdM
	iRHw+fDUDZYG7t/99DHEgTsHaVNxPFl3zYHCYlIEXBwg6ahR1PivBpXWw+8Dj9U0XMg3u3olGxCXu
	Xw4rFE4zHwpfhU4TtZKphJ0pcFJ/526V+31vP1MPwOP8Pykd4KfT6UOtDiIi1TwbHCXKNj3EyETfg
	xWkvkH2Kw3c7OzbtM6QQFBTGtDdoFwZSjwYaIqxhIJ4mUsA2NDzkQQNPYKpCl0qCMvTM/oVLD2Pkm
	12vKisMVdsbloZ7AGTEn170NZxqwGp6yHye6MV/Nz8lSEDUUlEvNtLClBLROLRjkNANdiEIlbbTjR
	haPYP2qg==;
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqdSZ-000000021uh-1VZv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 20:06:32 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-77057266cd8so1507799b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 13:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756152389; x=1756757189; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=+oyHFbNT6msf6glrd5KFIdZcOF0+oR5scj5fBrCtJpc=;
        b=pZUkgU0Z4J6UHeKC7cq7umFddQiR3MxaIH97/oSY4xhv6JlV4Ni5RngXmWlUojJ74p
         BQttE0DPkhRe+tqCxboUSZFZbqIuV/YtkkKAhDcuNr4AcMPcPIuD9eE/5MC+WtYRrTjd
         JLrjqL9QzrRvY4ZlDHZoik1Sd6Q9qvZnIC53U7ILuoHLQottgvnKE2C+QraFfBXBNUs4
         KIbn56gDMXfwAlF7fDR0GfP8peddvcmSZx7KkkKPtg9jYw2frwhjJ7XMlDviL3AtJcOH
         6/+Mog8jKqIg1NSxjKn12AAZiQufhiQ6R0i7LN0hPVZTiqSQ3fkWdLSFpIDN0ja8Ii4K
         kzwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756152389; x=1756757189;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+oyHFbNT6msf6glrd5KFIdZcOF0+oR5scj5fBrCtJpc=;
        b=V2I7dTIC/xsZkmtjfldoVO7hXR3AY3/63bPlxVhUeb7EL9Ss7OSVOrxqMgSAtV++LG
         2vDICcoe6u8Qh4usr/SPStOBoIKlpgQCnI7yg1fZGcozbRt9XRpaYtQ3BcuDxELcRWng
         qxJO/ChXvzVnnZCVBAVbSfowWk9Hr7QFhD6fqJq/d/eqgWgiggDMgmXAvhodceItZo/m
         NSCW2YvED1YcsSFPNteiK4y5PaPqWxO/eYdJF12c4X+xwwUyNdYzXDpIWiDhYCQN6rfG
         jRm2Keo+CVZnw0XM/MdbXyLL9DpuC5XiWqZOFb6kCPDhgXljD7aspsV3xE0rBo1o3Ldr
         eBOg==
X-Forwarded-Encrypted: i=1; AJvYcCVKUBj2gxHOLiJ4JOUgKTl4GNQGnh2P9CfY1wgOBAZwwO9SnjbNSuSeqZmNMr+m8phE0FpYghiuc0L0luphKG8Q@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1F0f3f5Fe3YjM9G3RcG3USwsTEqBBf+dgMLsJBqMAC5FWFBHa
	wuvMWNojIcxIKOuOakqHjHgUW01pbsTOy3oNKtxeGwpLD8veR9kfJk86Fw8BXPnjQtqzIEgGUAN
	8+V9HXg==
X-Google-Smtp-Source: AGHT+IHf2Zj5lnIbPMIr1AZKuHUHSE22v55RmD47MKsgM79RfmKmA7vJz/pJwEChfBNBSyo/bobLCf+GttQ=
X-Received: from pjbpq16.prod.google.com ([2002:a17:90b:3d90:b0:325:7fbe:1c64])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:6a0f:b0:243:78a:8289
 with SMTP id adf61e73a8af0-24340def606mr21242988637.48.1756152389107; Mon, 25
 Aug 2025 13:06:29 -0700 (PDT)
Date: Mon, 25 Aug 2025 13:06:19 -0700
In-Reply-To: <20250825200622.3759571-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250825200622.3759571-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.261.g7ce5a0a67e-goog
Message-ID: <20250825200622.3759571-3-seanjc@google.com>
Subject: [PATCH 2/5] Drivers: hv: Handle NEED_RESCHED_LAZY before transferring
 to guest
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
X-CRM114-CacheID: sfid-20250825_210631_451310_E3B2BB51 
X-CRM114-Status: GOOD (  13.84  )
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

Check for NEED_RESCHED_LAZY, not just NEED_RESCHED, prior to transferring
control to a guest.  Failure to check for lazy resched can unnecessarily
delay rescheduling until the next tick when using a lazy preemption model.

Fixes: 621191d709b1 ("Drivers: hv: Introduce mshv_root module to expose /dev/mshv to VMMs")
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/hv/mshv_common.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/hv/mshv_common.c b/drivers/hv/mshv_common.c
index 1acc47c4be0d..b953b5e21110 100644
--- a/drivers/hv/mshv_common.c
+++ b/drivers/hv/mshv_common.c
@@ -151,7 +151,7 @@ static int __mshv_do_pre_guest_mode_work(ulong th_flags)
 	if (th_flags & (_TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL))
 		return -EINTR;
 
-	if (th_flags & _TIF_NEED_RESCHED)
+	if (th_flags & (_TIF_NEED_RESCHED | _TIF_NEED_RESCHED_LAZY))
 		schedule();
 
 	if (th_flags & _TIF_NOTIFY_RESUME)
@@ -163,7 +163,8 @@ static int __mshv_do_pre_guest_mode_work(ulong th_flags)
 int mshv_do_pre_guest_mode_work(void)
 {
 	const ulong work_flags = _TIF_NOTIFY_SIGNAL | _TIF_SIGPENDING |
-				 _TIF_NEED_RESCHED  | _TIF_NOTIFY_RESUME;
+				 _TIF_NEED_RESCHED  | _TIF_NEED_RESCHED_LAZY |
+				 _TIF_NOTIFY_RESUME;
 	ulong th_flags;
 
 	th_flags = read_thread_flags();
-- 
2.51.0.261.g7ce5a0a67e-goog


