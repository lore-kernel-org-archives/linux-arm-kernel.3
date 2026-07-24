Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 032D1C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 19:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UIrEUXeMwkKPn3AMJe5EPVmRwSj/wiphCk2WS28J/Pk=; b=L3NkY2oifth9nTJ+RBvQtuUdAx
	799qd1vhShI5flf4Bznttqn2Iyvlvb6dQINKQM/94/d/dvWqG6iyMXEghzEiiXP7pY503M9gq/0aB
	4fzHAa94jA+UcVHJby/fKeH130VT6TG1E4krcjtoR54GezELOIjFqoNtJQGPG2XrqUL9RtzM21pql
	DyRCcpDazFkGd+d0s1aiCFG2dUT1Y6+q3OEi65pZ00rtujaSxaQfjvTs0JUX0Vy086fndO3zYBwKr
	sN/TwWghhgKiGfUR/EWn1v1nF65JtuA/4kya9Rh69JcMPktU75ttWpbJvHkZoyiwdVfQ6qxB2SbL+
	mM64fiIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnLwX-0000000HC1H-3Ttm;
	Fri, 24 Jul 2026 19:52:25 +0000
Received: from mail-pg1-x546.google.com ([2607:f8b0:4864:20::546])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnLwV-0000000HC0q-0xnI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 19:52:24 +0000
Received: by mail-pg1-x546.google.com with SMTP id 41be03b00d2f7-cb4bd11ddf8so809749a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 12:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784922741; x=1785527541; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UIrEUXeMwkKPn3AMJe5EPVmRwSj/wiphCk2WS28J/Pk=;
        b=cKe3TGlOg2FkJf7rbmoghna3hmVowUJzOh3g9Hig8wtDCVZfJPBP9x0EZT88KeF2O1
         Chj/Kl9anRcMK0KgQd7cEJu7pGGLXexPpmYCkRn5U2xy4I+xMOpPo2UBTDGNJjr3WtxU
         M/CA4Le87kmS9gu8QIzmIZE+SPdpAuFj4MBLCXLe28+nVoZHHI2UWMYcpHxPn591svEy
         5snJdjgJFXS4qz87jqfNc8ljfsVrRIy2FiI3rKgRCc2A7yCHafdXXHDNFQjLTqXTbbpE
         5TcKf6uOg+W1rJLw3bL/Lk4dESrvIKYmwnAefW/LHFFesVBcpVkq4ZwoZVdiqbApj0R+
         AQ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784922741; x=1785527541;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UIrEUXeMwkKPn3AMJe5EPVmRwSj/wiphCk2WS28J/Pk=;
        b=LofcgjywhothSGMOWttVX3mLVHkLcy4OollG7xWf4Cnl8QvF6wj9VTnlBnc5kt3ZJ/
         NUvMLb/zzEHGuu4Ds9mMYFGeyEK/fpIVsuTs6jAgE2uNKxSXMLw2IuVFvCRSe0FN2wus
         ieq+WeP29nwOiLNvDp41sRm3HrzZqDa+jH5/D9sFAl8sxYmxuphz/ZsGwJDKjB1luhTP
         tViidnzRdqUpEllCPzt5DMDuRvDH1wPR10evzzyjF/DAsPGxPh03d5qlpeSXlw2SgpgF
         nho61siiU02u9IHCYrIwCcikYqgw4+HMlFOzxY5fYOD2P1tnMDQ5/w2bMVl22tStSVtW
         7vXQ==
X-Forwarded-Encrypted: i=1; AHgh+RoyXeSSwXkPDqpHu/3ZFxgY+cB/svHFBOeqOIBUmuvL3HVgf/Cl5DBvhJidtzPtfdCltd3ocdD6K0nSRrzqJYh4@lists.infradead.org
X-Gm-Message-State: AOJu0YxcrwTPIiKBss4AobfNbQfd6wzDDYyQ4e+vINIPxruNlrVJdzcT
	dpNz1veDA63w+zPI1GkNUef1riVyLrixLwC3yR+PCx6VwjSqRSqF1zTcvEhZCd0YJ0PkpATRLLL
	zHPzJJQ==
X-Received: from pgvf24.prod.google.com ([2002:a65:6298:0:b0:cbb:9724:6775])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:e0a2:b0:3bf:e2dc:bc85
 with SMTP id adf61e73a8af0-3c44b1ca809mr9783772637.40.1784922740833; Fri, 24
 Jul 2026 12:52:20 -0700 (PDT)
Date: Fri, 24 Jul 2026 12:52:20 -0700
In-Reply-To: <20260714160411.302386-1-alexandru.elisei@arm.com>
Mime-Version: 1.0
References: <20260714160411.302386-1-alexandru.elisei@arm.com>
Message-ID: <amPCdAswlk24Xilf@google.com>
Subject: Re: [PATCH v2] KVM: Ignore MMU notifiers for guest_memfd-only memslots
From: Sean Christopherson <seanjc@google.com>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: pbonzini@redhat.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	maz@kernel.org, oupton@kernel.org, suzuki.poulose@arm.com, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	david.hildenbrand@arm.com, mark.rutland@arm.com, ackerleytng@google.com
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_125223_270854_E13673B3 
X-CRM114-Status: GOOD (  10.69  )
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

On Tue, Jul 14, 2026, Alexandru Elisei wrote:
> +	 * TODO: Skip gmem-only memslots on mmu_notifier events entirely, once
> +	 * gfn_to_pfn_cache is also wired up to directly pull from guest_memfd.

So it turns out we need to solve a very related problem[*], thanks to commit
b9220d32799a ("KVM: x86/xen: allow shared_info to be mapped by fixed HVA"),
which as it says, allows populating gfn_to_pfn_cache directly with an HVA, i.e.
without a memslot.

My not-yet-tested solution for that mess is to give gfn_to_pfn_cache its own
invalidation sequence, at which point there shouldn't be a need to process
gmem-only memslots just for gfn_to_pfn_cache, because it will already be equipped
to handle memslot-less invalidation.

Given how simple this change *should* be, I'm going to put this patch on the
backburner for now, and then assuming my proposed change actually works, I'll
grab your original change (or more likely, re-post it as the last patch in the
series weans gfn_to_pfn_cache off mmu_invalidate_seq).

It'll probably take me a few weeks to circle back to this, as I finally crawled
out from underneath a pile of urgent and am just now getting back into review
mode, but this is fairly high on my todo list, so with luck we might still squeeze
this into 7.3.

[*] https://lore.kernel.org/all/aj2hi-NcqUUCaoQF@google.com

