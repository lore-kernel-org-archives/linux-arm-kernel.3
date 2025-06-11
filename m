Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B29FC71133
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 00:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VlZgeHA644QawbjAzxLvevk+0CPgkFNL80WvPP4oWa8=; b=roq93oyRI/TPTTwZ2iiW3Q1Z3H
	/KYXfpPjpEzeipfUy/inwaTc7J6wC7XjLpQYX7TZ9Ox64DLRpCKfnm1Rbw6LUVHKA4nSSDKK53UDE
	deI1wTRmxvZaVD8Q4tFQckIg6l94CrL5HGzj1wS5aNKPygi2bLm7HVXraCJrYM7ovAlMXXzTxncxS
	8Ez/ERizIOoSu/y8s7T0Mc/uPBYF4pZw/gNcMKa9oIVcjihEK5h5V9NAYrIqTM/qmvKsBT2cU7Ory
	4rQZEzjqQnMb26PiMyRCSIvdzgB9g5jxLJgWR/5M4B5XETvl2xgubqkWhLu6GNNhj8a3ps/D7qO3g
	z5aJvBAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP9IE-00000008TsD-0yGp;
	Wed, 11 Jun 2025 00:26:14 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP93S-00000008SDf-28Kc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 00:10:59 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-311f4f2e6baso6433087a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 17:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749600657; x=1750205457; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=VlZgeHA644QawbjAzxLvevk+0CPgkFNL80WvPP4oWa8=;
        b=toDodBwHOgmoWdmI9T0U/bcaQ00c6ii2Dh1HxcPH79y6LZyKmplIjIFqnYTxU8Qus7
         VfTa7jY5UkACe3m4mwtQ2cN28HpzCZqzHqEFn/zEM9FU18yn6trnI09D1SSW63JxwU5q
         jb8lcnglUWHSggJc9kUIFD30nUqCUgYxQU5Mlv6Y06Z8Z/9PU3OpgBvja5F/bkqLCMVT
         rXMBfs0DLlZ5HB16NPLvHugI89kb8jcxbmMWNE7M52RKy5CtY7h5Xi72PX7ZFM8XkslS
         bPUUM3BurFrLh5AzTIkDLZ6YlvOmuzcO/qNnzf4I1bpcbTdFK34DpdIU2FxiZxSMKoxY
         PIxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749600657; x=1750205457;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VlZgeHA644QawbjAzxLvevk+0CPgkFNL80WvPP4oWa8=;
        b=cuEf20Od3ydZrH01BMsb8WxOMBVOyDnxhca83Bsmpr9uJmG2QW7KzaG9fA40/Nof8i
         QaqS/KPmkREhZnDJjuVwL0bmaSW4XRlQaJD9dT4rNqNP/3YZRhORL+QCS79ystQcKUMB
         aLiuJbJUUxyCvNzvG6n7bXSrBrPb/4w4C9sReLXaLJ0BCquCnVvZ4lLuTcrINojaOn3W
         YkS4Kx3NzWBnyjjgOEQqletqA+VLrX5MGN+WDKAfiCdte5/aB4DcXgkBqkTMjXxhy3d4
         rcHqxWT9+7vWl7fOi0zh6x1+Gq3/50Q6ms0E3rSdA0lyCSPJwuH/ZHkY4uLKmtERihxk
         gqmw==
X-Gm-Message-State: AOJu0Ywgk0LP3yOosbe029oj2R7JaJ8hee4h2d68nyrZkhoZWPXAFKcw
	KFRj6Lec0oDCvo42DJ6fulCCQbHdC9Har/IYErckuu63yggHGUiRHuE+kq6VeHpvsbTSXysm630
	0a9tjtA==
X-Google-Smtp-Source: AGHT+IEo+A1iKKp/d15/c3Y8CK62vwTvYQUmq5gUOhKzuXVKftWt1+9sRfxp1GZ6dnQl+d5j2tHzGoYEsqQ=
X-Received: from pjboh5.prod.google.com ([2002:a17:90b:3a45:b0:2fb:fa85:1678])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2643:b0:312:29e:9ec9
 with SMTP id 98e67ed59e1d1-313af1dd043mr2232849a91.24.1749600657225; Tue, 10
 Jun 2025 17:10:57 -0700 (PDT)
Date: Tue, 10 Jun 2025 17:10:41 -0700
In-Reply-To: <20250611001042.170501-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250611001042.170501-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc0.642.g800a2b2222-goog
Message-ID: <20250611001042.170501-8-seanjc@google.com>
Subject: [PATCH 7/8] KVM: s390: Stop adding virt/kvm to the arch include path
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Anish Ghulati <aghulati@google.com>, Colton Lewis <coltonlewis@google.com>, 
	Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_171058_546019_FC08DE3E 
X-CRM114-Status: GOOD (  12.27  )
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

Don't add virt/kvm to KVM s390's include path, the headers in virt/kvm are
intended to be used only by other code in virt/kvm, i.e. are "private" to
the core KVM code.  It's not clear that s390 *ever* included a header from
virt/kvm, i.e. odds are good the "-Ivirt/kvm" was copied from a x86's
Makefile when s390 support was first added.

The only headers in virt/kvm at the time were the x86 specific ioapic.h,
and iodev.h, neither of which shows up as an #include in the diff for the
commit range 37817f2982d0f..e976a2b997fc4.

Acked-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/s390/kvm/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/s390/kvm/Makefile b/arch/s390/kvm/Makefile
index 9a723c48b05a..b742e08c036b 100644
--- a/arch/s390/kvm/Makefile
+++ b/arch/s390/kvm/Makefile
@@ -5,7 +5,7 @@
 
 include $(srctree)/virt/kvm/Makefile.kvm
 
-ccflags-y := -Ivirt/kvm -Iarch/s390/kvm
+ccflags-y := -Iarch/s390/kvm
 
 kvm-y += kvm-s390.o intercept.o interrupt.o priv.o sigp.o
 kvm-y += diag.o gaccess.o guestdbg.o vsie.o pv.o gmap-vsie.o
-- 
2.50.0.rc0.642.g800a2b2222-goog


