Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D16F30282
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Mar 2026 20:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TCnQpp47QbhoPpRPIwACTTYpdk9OmiqiOQDc2IoOxcE=; b=gjbER49cIguL7UU/ImsCvVXLrk
	59BDwZnnf9cIeNBGNAmz5N9qN9C0tvVG+l0ZK7eri4SmbCK+s3g2WwAHyYNLSlLCW8vDhdBeqWwt/
	NlLOUNGMtmKhG4mnVdOHYm8pLPEvtZGCDJ98AiF0fq8bsj6/mcKInIX9IZlPVD0RZGxJVf34/Io5I
	EKb2Uzx89C5ej5pfRi7pHbScZwoqmcEC3KOqkQewahYlXEghfOOSEDFJxKZ9wG+mRrdhAXM2xLeTe
	y4R4Bi7IBCnAlCGITpKM4oVORdWosAN7yo0onFanrlCKpwOaIlk4dASngQU2lfTeUvrnxyZcE7S7n
	rLcPtEfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1roe-00000002swX-3b99;
	Sun, 15 Mar 2026 20:12:00 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1roc-00000002sw7-0F6p
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Mar 2026 20:11:59 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-48538c5956bso36072145e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Mar 2026 13:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773605515; x=1774210315; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:subject:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TCnQpp47QbhoPpRPIwACTTYpdk9OmiqiOQDc2IoOxcE=;
        b=AAoFsYf/hN+HsmUdX9IZ5tmyY4ThgSEPo1dD3F0xTVBaT2dmiqASpzy6cuTNHcCIro
         f2OyFDGf1ye/ZBro60RYcRfwAi1z9w6zNA97LZrWoLMbo47mu2V5rN3IyJs6F+/Umy/g
         MWNsWOkWblUAST2WsPEzs9THYe1L8LmacvBYsVE1O2uU0XZSetMusJOylRpPT69We4mD
         ua+ddU3TDlKe8VpZTGKRRx4oxrVnwR0DGh7DvRwQ9b/j6DKXJbd24Z7WtqQux34LGt1R
         eZb3VAG2+g3S40fj1v5qqTpYBW2cQctiB1hNwfe1uDtuGPvHZpt9SngprkEO858ciND6
         6j7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773605515; x=1774210315;
        h=content-transfer-encoding:mime-version:message-id:subject:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TCnQpp47QbhoPpRPIwACTTYpdk9OmiqiOQDc2IoOxcE=;
        b=m68W+NftUFPwnm9f+pWshmkUq4xHSL/GDVCLBLznCC5mvrOLu72l/XgLK6KSnor2NC
         sqH1whe/UzHYUKuZv996fQqdJrGclTd0Eie4W1h6JuvGxE1exHfZnGhUF8Keb6tlszAK
         1qKShs/9nBfLkbIPUIUhASlcp7cJIW4CkKQZ6P7Y4TNd2Iz0zZHkFqq2l5ilAFkRw9Wv
         Ka/HBusj1MXKW1KAX0GK4OhxnpMEudesYTV+lxbktC/JJicT1OydvEHpkrdQs8dzjXSm
         TxADlUhKyNFJ3uZBRZ7Ttcp68vK/C1WH4FDSY7sMBnIMyhguvWOCs89n5mVQ0zeC9z0i
         5q+g==
X-Forwarded-Encrypted: i=1; AJvYcCVR8vo8vQrinxYkH4wVWh7LRKE0vsgHf/F5U09K+2Nat5Sh2hz+umeylW9DcjWoUcs+DIcfYLpnFamyAF1FyeQ6@lists.infradead.org
X-Gm-Message-State: AOJu0YxMI4XwA+PJ2RncCTKbFn491nnpPuFMCovxXgouVQZgPIwtqSa3
	baSd1R4vsd7RCMQV2Eq+rWyVyWI7kN4F+IKPdYfKi4p5LI0jYm+3Qt/X
X-Gm-Gg: ATEYQzxeYem6agR/1pIgM6JSJdxknTocEDLrc9tX/4DsmmoSuzbAWEGeNAbeAY72+8V
	+84aawPLkMSF+vtsfIDOt5pJ6NUOTCoNysTXp8JTwv98i/eWbLyIrcPld5kKb6T5j8G8ScJP7dM
	Beeac5BW+CvXVgeNrGRYz/I1PFoCILGzvyTMSqD74LyYfBxpYq4KbD75uxo5YC57x68Z1qBAiPt
	wxRZGu6kjsAk9EB00ibAWf5mBr3UVSimQifLWIVYUQAUalecepsMSQBbfV5OH0U4zq6p+jEXpTa
	q6f/4Ha4Q/VEsPFtaWOh59wWoa1yDreN7ZBt1o2bl70SqDNaq9y5w9AWiLfTXimSEBJL9lajPUJ
	Ep6nGPLWp0okT8nH6YkuAFihT+3CtxiuzHLLmXAEI771BaEl2yU0lgLPJWkuwPjQWdsAKIghQ0e
	5HEDjbn2RW+gTTC244pHHgtAdRbHRuqR0kAg0PxHjzxeYmtV+PZ13XflILZkZyPBFZOjITKEDHn
	K0=
X-Received: by 2002:a05:600c:4594:b0:47e:e59c:67c5 with SMTP id 5b1f17b1804b1-48555acaddcmr159457935e9.8.1773605515428;
        Sun, 15 Mar 2026 13:11:55 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b7f255sm477090505e9.12.2026.03.15.13.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 13:11:55 -0700 (PDT)
Date: Sun, 15 Mar 2026 20:11:53 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Boqun Feng <boqun@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Ingo Molnar <mingo@redhat.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Lorenzo
 Pieralisi <lpieralisi@kernel.org>, Marc Zyngier <maz@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Thomas Huth <thuth@redhat.com>, Waiman
 Long <longman@redhat.com>, Will Deacon <will@kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>
Subject: osq_lock on arm64
Message-ID: <20260315201153.1d2ae1e3@pumpkin>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_131158_141839_7E5A9114 
X-CRM114-Status: GOOD (  11.77  )
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

Commit f5bfdc8e3947 change the osq_lock (optimistic spin queue) code to
use smp_cond_load_relaxed() to wait for another cpu to relase the lock.

It waits for 'VAL || need_resched()' with a comment that the IPI that
sets need_resched() will break any monitor/wait code.
However arm64 implements it as (03e3c2b7edbe and 1cfc63b5ae6):

#define smp_cond_load_acquire(ptr, cond_expr)                          \
({                                                                     \
       typeof(ptr) __PTR = (ptr);                                      \
       typeof(*ptr) VAL;                                               \
       for (;;) {                                                      \
               VAL = smp_load_acquire(__PTR);                          \
               if (cond_expr)                                          \
                       break;                                          \
               __cmpwait_relaxed(__PTR, VAL);                          \
       }                                                               \
       VAL;                                                            \
})

#define __CMPWAIT_CASE(w, sz, name)                                    \
static inline void __cmpwait_case_##name(volatile void *ptr,           \
                                        unsigned long val)             \
{                                                                      \
       unsigned long tmp;                                              \
                                                                       \
       asm volatile(                                                   \
       "       sevl\n"                                                 \
       "       wfe\n"                                                  \
       "       ldxr" #sz "\t%" #w "[tmp], %[v]\n"                      \
       "       eor     %" #w "[tmp], %" #w "[tmp], %" #w "[val]\n"     \
       "       cbnz    %" #w "[tmp], 1f\n"                             \
       "       wfe\n"                                                  \
       "1:"                                                            \
       : [tmp] "=&r" (tmp), [v] "+Q" (*(unsigned long *)ptr)           \
       : [val] "r" (val));                                             \
}

The "eor" and "cbnz" seem to be there to skip the "wfe" if the value has
already changed, but this only works if the condition only depends on VAL.
This means it can miss the IPI that makes need_resched() return non-zero.

To work I think it would need the cmp_load_acquire() to be "ldxr" with
a "wfe" instead of __cmpwait_relaxed().
But that wouldn't work if 'cond_expr' issued another "ldx".

The documentation I found for the arm64 instruction set doesn't mention that
losing the exclusive access requested by ldx will wake wfe, I assume that
is an omission from the docs?

	David 


