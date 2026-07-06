Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7596FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 21:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oafaChChcAwJSOuf1i0h67RyVsfw8NcuMZenVaI95Rk=; b=v31q307OjLRiAk0tF7kDCRBI74
	LW1MRnjRSMDqjHc/BvbHnV7pLQW345/X0IKJv4HBMm/Zq0MBlS+fEAaYbGXA37FqTgmSGIXJ5rp6w
	04HGQKrHFFqnDFGqUpqmUqHISJgAbdYk3bDKUPT7PZvgdaTgjjCweL1Mu8PmxCfJ8rsXGLA37Yrd0
	5Vo2qN5KexgQvWwL5aSjrp+AoyNH9QMjoS0Ni/+ykjlm0CD0yXbl1m2mEbwHi43yoprWI8THtZ8ib
	8GmrJYDdIXIBGnBlXJ6CeXurs1CVB7U8ZEoYzw/vfAh36FK2OXT9+de1WFIhquGDp1c6lfO4gmt9f
	xYHq9pQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgr67-0000000Dfi7-2f5T;
	Mon, 06 Jul 2026 21:43:27 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgr65-0000000DfhW-1ZzP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 21:43:26 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-c9fe4c5eb39so2113424a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 14:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783374204; x=1783979004; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=oafaChChcAwJSOuf1i0h67RyVsfw8NcuMZenVaI95Rk=;
        b=U+wJJ8ZREqlk4/u4y3KBkWe8+i48rE0lqN7YRx5g+fpfwRAx68O4le69RTqW9gEgVl
         CQE6LCTpO/xWKhNgBbdjMkzY+8Oi2lSREWWCM3+n53MNh+Vgy+vLy/HWkB0H1xwpFuuV
         HK99bBIkurBTYsqLnmcNcVc3D6DOWhTDPVHNZi3ZIT40Wwag58Ziq1OHDf8e4ZUIf1CW
         4U2tJWaC4dow/WkYBjKqVsAF9NByjr24J3+82ZX4dk8mu91fhCfGMw4FNg9K3aHs48Ts
         CaoReE0Gz3p3DtfAgRC5DhHRK1Y2B7ioohlNecXuclhhyr2rmw52zxTlF1owoiz7vvZU
         FjXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783374204; x=1783979004;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oafaChChcAwJSOuf1i0h67RyVsfw8NcuMZenVaI95Rk=;
        b=kW8ZxWq/wyPFHH5sRYqQjyXS7AoB8J/sFkBYJuqdD76Nj9VihzA5b8XgTBxZrU67yP
         Xenob5DibQ7a6/BkMEAofoTNyO8bY+mSIgJfgni44lqltk3o55Gt0rvAUtbyyA9w1NJE
         uiZ2XB5JBk2RBYwRcE09Ip6SFfSC3FX0s2gKj2XDiB3Fj35Z0YxeByY0E/HJftch816p
         AljlvDXcx9krtGHFjZGlOyyBbFQ4NqlVRdBzftiFBeF45HzCMJi2/HAab3gJsrNEHsGg
         NNEZCXsTV8cs3R1GHqo8yFHtPWiQSTmAr8ih4pMpDJ1VTBrSGeqA16OocmK2Lh4t4Ukf
         VfHw==
X-Forwarded-Encrypted: i=1; AHgh+Rp63FpVejL2UW27MNV00DNR9gxSWKi9Hay1O1CRIuKP/oUFrhZ80AoZ6OyOiTUJi0Lua6Z+Jjit5OWSbT0010v8@lists.infradead.org
X-Gm-Message-State: AOJu0YxPTAxkrD61SaVznDa7R6dRIiuvaOSEPYPU1lCL4nuCsWx6HpFD
	sUhHsb/pgtHput03weH3wqPG+CLCxmU89D6L/f6+GwJh5IOium8auJ2f2YjgiXjv7EYzO/rF0E6
	IGaAe/Q==
X-Received: from pgwa11.prod.google.com ([2002:a65:654b:0:b0:c99:d21a:f6cc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:a383:b0:3bf:d1f9:b1d5
 with SMTP id adf61e73a8af0-3c08efad6fcmr2613875637.60.1783374203865; Mon, 06
 Jul 2026 14:43:23 -0700 (PDT)
Date: Mon, 6 Jul 2026 14:43:23 -0700
In-Reply-To: <20260702142912.6395-2-alexandru.elisei@arm.com>
Mime-Version: 1.0
References: <20260702142912.6395-1-alexandru.elisei@arm.com> <20260702142912.6395-2-alexandru.elisei@arm.com>
Message-ID: <akwhexqW66RK5Gru@google.com>
Subject: Re: [RFC PATCH 1/3] KVM: guest_memfd: Use memslot id to keep track of
 associated memslots
From: Sean Christopherson <seanjc@google.com>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: pbonzini@redhat.com, kvm@vger.kernel.org, david.hildenbrand@arm.com, 
	maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com, seiden@linux.ibm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	fuad.tabba@linux.dev, mark.rutland@arm.com
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_144325_443452_A0D80E5B 
X-CRM114-Status: GOOD (  18.56  )
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

On Thu, Jul 02, 2026, Alexandru Elisei wrote:
> To enable memslot operations, KVM maintains two arrays of memslots, and an
> RCU pointer to the active (in use) array. Changes are made first to the
> inactive array, and the RCU pointer is updated to point to the inactive
> array, which becomes active.
> 
> The guest_memfd file maintains an xarray of pointers to memslots that use
> it as the memory provider. After the RCU pointer to the active memslots is
> updated and until SRCU is synchronized, readers can observe the old or the
> new value for the active array, and therefore the old or the new pointer
> for a given memslot.  For memslot creation or deletion that is not an issue
> for guest_memfd, as readers will either read the same memslot pointer saved
> by the guest_memfd file, or a non-existing memslot.
> 
> But when changing the flags for a memslot, readers can read two different
> and non-NULL memslot pointers. 

And?  Why does that matter?  KVM memslot updates aren't atomic.  Practically
speaking, they _can't_ be made atomic.  Userspace is required to quiesce all
activity that must not observe inconsistent state, i.e. userspace must pause
(stop running) vCPUs when performing a memslot update.

> Since there is no easy way to ensure that the memslot pointer that the
> guest_memfd stores is consistent with both views at the same time, modify how
> the guest_memfd file keeps track of the associated memslots: instead of
> storing the pointer directly, store the memslot id and address space id
> (as_id), and use that to reach the memslot in the active list of memslots.

I don't see how this changes anything.  Readers can still see the old or new
memslot depending on when kvm->memslots[] is derefenced.

