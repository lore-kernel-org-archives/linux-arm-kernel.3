Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0842ACCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 16:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6FQw10WQ1dcKekY0WJxe794H5jIcScg92QUjH/W0WlQ=; b=uXwOfMV54cdK7v4lvkJmzkknAn
	hLKEaYPLiUZPo1NgdHT782WDQIliUfozXGGPwXYQ6XyGJ1qX87SSgA60R3Tjzq1d7vb2gObYjfJNs
	EhipmjsfDaafpS7KUMz/mQbSx94IRtE+9tKuCW+Aub02Sw3gcEx1tU01ssA5Q7DCoDKkWie1ABKEk
	QlTPgiFsPMGjw91zJ3/RVMu5utlPiQwsDPUG5jQdAGwIQ6H7PdmBRGREuM9HtmT+K6/KkrMt4p4jS
	t2IyqAxrevdoMx44EKY1hgMAyBSXZ9OFRoHSn08U9kGi7pIGqH0D0GXUTtivmx9PGrbxUZJkbBN9u
	qMU7SV9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDmYk-0000000GKAP-4BQH;
	Tue, 28 Oct 2025 16:28:35 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDmYi-0000000GKA1-17gF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 16:28:33 +0000
Date: Tue, 28 Oct 2025 17:28:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1761668907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6FQw10WQ1dcKekY0WJxe794H5jIcScg92QUjH/W0WlQ=;
	b=QhPaMBkGY9zFrl/+OkoBxbpmtIiqQaNgThGZ2IehOdExen53N+8PiWuChp4GfWZY+3PSYC
	ZX+aMtY3f171EvWtBIdek+gFxbe3ZqZHQQVuAgd9Ww/7xieD23D26/Bqf3bn1pasirpF9H
	yLcnNLtZ8E1wW6ON7n/bj6P6vU1Ohj8ZxQkSIV/d7j42UYn9QSEjGieZ/r4awIalP+1FRv
	4kHGhS4ucZOBP11Ja7yIzoXyg8AihAk6I1EfDmNFJllFvNG0OYbRlvLZujome498c2wvUU
	7lqpM8WvoSOJ+IGlc2Gihq4CbP99cSaV55J/s+8jVRDna/DoQxYC8Guv6kGyZQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1761668907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6FQw10WQ1dcKekY0WJxe794H5jIcScg92QUjH/W0WlQ=;
	b=H3KRRrfr1ebqtnrUOyJXz/0MsInJvdsW3vJvDy55ltG7ttVpLhXg8VAIAMrNppSgCDOqrJ
	Xpohfn51lLT2cmCw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Xie Yuanbin <xieyuanbin1@huawei.com>
Cc: rmk+kernel@armlinux.org.uk, linux@armlinux.org.uk, rppt@kernel.org,
	vbabka@suse.cz, pfalcato@suse.de, brauner@kernel.org,
	lorenzo.stoakes@oracle.com, kuninori.morimoto.gx@renesas.com,
	tony@atomide.com, arnd@arndb.de, akpm@linux-foundation.org,
	punitagrawal@gmail.com, rjw@rjwysocki.net, marc.zyngier@arm.com,
	will@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, liaohua4@huawei.com,
	lilinjie8@huawei.com
Subject: Re: [PATCH v2 RESEND 1/2] ARM: spectre-v2: Fix potential missing
 mitigations
Message-ID: <20251028162825.x-4ryn3p@linutronix.de>
References: <20251016121622.8957-1-xieyuanbin1@huawei.com>
 <20251028162005.bLKC89Hy@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251028162005.bLKC89Hy@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_092832_627875_E8D0ACBC 
X-CRM114-Status: UNSURE (   7.53  )
X-CRM114-Notice: Please train this message.
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

On 2025-10-28 17:20:06 [+0100], To Xie Yuanbin wrote:
> The requirement is to invoke the mitigation callback of the right CPU.
> What about disabling preemption before getting the callback and doing
> the invocation?

Something like this:

diff --git a/arch/arm/include/asm/system_misc.h b/arch/arm/include/asm/system_misc.h
--- a/arch/arm/include/asm/system_misc.h
+++ b/arch/arm/include/asm/system_misc.h
@@ -20,8 +20,10 @@ typedef void (*harden_branch_predictor_fn_t)(void);
 DECLARE_PER_CPU(harden_branch_predictor_fn_t, harden_branch_predictor_fn);
 static inline void harden_branch_predictor(void)
 {
-	harden_branch_predictor_fn_t fn = per_cpu(harden_branch_predictor_fn,
-						  smp_processor_id());
+	harden_branch_predictor_fn_t fn;
+
+	guard(preempt)();
+	fn = per_cpu(harden_branch_predictor_fn, smp_processor_id());
 	if (fn)
 		fn();
 }

Sebastian

