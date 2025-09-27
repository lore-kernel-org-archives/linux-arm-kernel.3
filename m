Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F50CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Sep 2025 11:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tCU7v9P/MJ30ZurEFjUc6Z8kHq4xzsD3/KiXCSsv1l4=; b=c9lI0u8ItmlJ4dHHsuP7iAwzK2
	idlOg2c6IkCaZPe0wI/cWuh6LTuq9J1LXbJPJh7DlFUi+xcaIQZqmBor4ZRKXWvYQIboYYViKGjPY
	GzEVK5AzzSvPnEANxAgDzGZSJfU8V3j3cWubuw9ghqXt7NtzWs+HLgdU/cMgR9lWLdVyCJS5a/H+E
	BdEUHGgVAHYr5z0aBWXhoqZyfTqm0Vi3gF7XlsPwF8WgScY441619yI21VfajyKLHW5oCrhUqZtPx
	eZ12PqK91VBFem7VTy2WWYuqj3VVpTOqS2+1t/mkkh5k+Ac/ZqswWaUL0FMX8FpFvk+tLW/PLmFLa
	ZpNAqt+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2T7h-00000009Kjq-2Chp;
	Sat, 27 Sep 2025 11:29:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2T7f-00000009KjR-1i5j
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Sep 2025 11:29:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 456A4444DE;
	Sat, 27 Sep 2025 11:29:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21754C4CEE7;
	Sat, 27 Sep 2025 11:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758972590;
	bh=woOJMQVx2gK/ZTrYKUvp8Kze1O8Xv6dnLbcVNoWtA9U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SVgcX3cww3I4jhHCG7p2ABBDtOytr0l9MxhhncYqy5LR8JN5xjlQyUF3pl5FRss0U
	 kyeZAAZrF01Cms/Qa0DPHwW8Jjzr0pNLck4xq5y7BTLcUW/oKuLos+2GxbPcsGa/8i
	 BYMt7JRiLicMmrc26p6bmo82Wyf4/jl+8OJngpMBtWqT8k6SRHtKyvDeHNtuafos98
	 8PREpN34kn2BwkHuHiFubyMPM3l/tYJmn+subZv71IHRQVn4bk39d8IiA/VnN5bHJ8
	 4Jr5gAjstzMheamBOOVLdgUUxsnsA0ix7Y8S+hJ7CniqBhq4gX+zxMoOhLSkWQ4l3b
	 FD21L0Hje1EPQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1v2T7b-00000009rcA-2IVo;
	Sat, 27 Sep 2025 11:29:47 +0000
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oliver.upton@linux.dev>,
	Sean Christopherson <seanjc@google.com>
Cc: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sebastian Ott <sebott@redhat.com>
Subject: Re: [PATCH] KVM: selftests: Track width of arm64's timer counter as "int", not "uint64_t"
Date: Sat, 27 Sep 2025 12:29:01 +0100
Message-ID: <175897248729.2798309.11771785872259733527.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250926155838.2612205-1-seanjc@google.com>
References: <20250926155838.2612205-1-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oliver.upton@linux.dev, seanjc@google.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, sebott@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250927_042951_476417_FF555B99 
X-CRM114-Status: GOOD (  10.17  )
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

On Fri, 26 Sep 2025 08:58:38 -0700, Sean Christopherson wrote:
> Store the width of arm64's timer counter as an "int", not a "uint64_t".
> ilog2() returns an "int", and more importantly using what is an "unsigned
> long" under the hood makes clang unhappy due to a type mismatch when
> clamping the width to a sane value.
> 
>   arm64/arch_timer_edge_cases.c:1032:10: error: comparison of distinct pointer types
>      ('typeof (width) *' (aka 'unsigned long *') and 'typeof (56) *' (aka 'int *'))
>      [-Werror,-Wcompare-distinct-pointer-types]
>    1032 |         width = clamp(width, 56, 64);
>         |                 ^~~~~~~~~~~~~~~~~~~~
>   tools/include/linux/kernel.h:47:45: note: expanded from macro 'clamp'
>      47 | #define clamp(val, lo, hi)      min((typeof(val))max(val, lo), hi)
>         |                                                  ^~~~~~~~~~~~
>   tools/include/linux/kernel.h:33:17: note: expanded from macro 'max'
>      33 |         (void) (&_max1 == &_max2);              \
>         |                 ~~~~~~ ^  ~~~~~~
>   tools/include/linux/kernel.h:39:9: note: expanded from macro 'min'
>      39 |         typeof(x) _min1 = (x);                  \
>         |                ^
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: selftests: Track width of arm64's timer counter as "int", not "uint64_t"
      commit 34f46fecfe96b404ef14e97b8e59cde693276f28.

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



