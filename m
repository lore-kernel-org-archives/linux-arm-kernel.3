Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 268D9C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 10:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t1Z4i78iFUVYmXdwkSYq7EkiOAX8N+OcOOj8F5FsldA=; b=flOTRRlmA05upeKuOwmBSPesdT
	HpgGyG9qnniBgDWiT2Xh24OF0auKEshoJNvJZIGE5ELxEBg+UoFx8tnhFBEEJMT2l8jNEjj/z/nBn
	SWVXNV7+a6sdJkGcZerKfOi8S43UelKhfXUsPGLMnhV8IQKWDXheJiGQLCdRkUsHAaM8tI0cHluhU
	YNZuwBFsEwhJK9by9TH4DWGAoZQKnzXgrGj0ceC4e4CikjND5TQZgRLzGJhOIY96zLmczgfenHu/A
	9GIbbjkoL0s1dU65j3b+h7LhO+irU63MwdD9WmdFjWIMN+LkpzP1tKPShlL7LTosYLw3y6+XoyMf4
	OhfAaqvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9KWw-00000007wOn-3yez;
	Wed, 23 Sep 2026 10:48:50 +0000
Received: from mail-ej2-x10.google.com ([2a00:1450:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9KWu-00000007wOG-2Wjm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 10:48:49 +0000
Received: by mail-ej2-x10.google.com with SMTP id a640c23a62f3a-c29703cb796so99912666b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 03:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790160526; x=1790765326; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t1Z4i78iFUVYmXdwkSYq7EkiOAX8N+OcOOj8F5FsldA=;
        b=ULKzLn/U4higYR5QNi8L5Ic/b4YboH5Q0B0h8tLYOnBsK/eBVmDRADJSfcquKw9cWS
         +aJWmCpshqF9otj379dqgWBVJmKgsue2DS8GfO/LmbEiBeSOWuxJnT3Q5Nlyq6iMplNo
         /9ziBKg7an9L1PfOkzHQtqxafPNptxvHWYrNU0+qTfKAnlBsfwaB9qQ6SJ1/DAIuo5ps
         9W/geTU2LNo27AmMXbd/xYqgmYaNo6C4Np+UBc/bo4GevAdhFckP/s4YlQw3C7QA40rK
         fHZQuTkzvjhlpHo+IHJgADPdJi7n+69wP4hpJtQ4w6kryi//cfr+sSwX/cuxexT2XG4+
         nYYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160526; x=1790765326;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t1Z4i78iFUVYmXdwkSYq7EkiOAX8N+OcOOj8F5FsldA=;
        b=WKfudkl5NtdnxsuJvyewhWTvoNRp5lxCjTHYfmVVItwVWyPc/eg58idhe1iq+Qu2CM
         QR8UCL8oS+X0/tNdJcf3amI1gPd47uS32Ch70CwTPuJiZE5VovR+hj5WS40bpdHQLyqd
         HzxgoGrRtDAJUva6XVIXlC8AR+7rOiE8baLwzoP5knIsAl8HwTI+XcwuMOoFM91jbfb5
         1akGNu162XBN82F6AiQeXhl1Iv0gHEnrZPlg8lMwAJ+KPxeLhTtvZ9TSPcj1yXi6Zmqd
         OQ89D5CpJg0l742Em/xuzVqFszVja9AVkKMzZyW/OZVADv8JALciTP+JLtsGuJWQUO9F
         D3Tw==
X-Forwarded-Encrypted: i=1; AKwUvBxPtXKcbFdsno8B4NlhG3kf1VT7o9xhnAPebZjPYFGRQnxwRAkjS2IjEQH4EZ9Z0g0DCWLXHmGo6rtKTYcv+fnu@lists.infradead.org
X-Gm-Message-State: AFuF++nPBYwUzzx1zXR3+fjAlp5uvqe0WTZg8st30a3J85SwI7gYzlMX
	fi1QfhuSClEWO57pQlh+huQInuVwJNapvrJSUYWMxzMivbTFV2F2hoFAJn6tzfOT
X-Gm-Gg: AYBFou021M5JYZibMaxnrN9vVpUaucVlC3IhQkihjkjsgfE9gF6bG81TiUpGGZ1gsaX
	mb0opJUQ0h7fqqPpJLiz6prm57RsraSGhJsqnDE0i3Q5O+TNzymVjYmkJjKjYIpfzlbz0WZo13K
	XX02DCFxpp6s4LleRVX/Ec7IkScvaktv/rHNeHVSsqRsO9kbnA03T0J/iDl7FN/nadY7ZTYvXc7
	1WP7WhlmmPfrXY0Tjp7JuIWxQd6GlBsLFzkT/y2R0R/GvvwJSOBzDi9aKBFvYnXRVs7mSPabdGx
	qQm/FVR9T9mK+jHuQ4iuV9EpbYUmwPu7LPv6xQ72F0InYnasGopbSz2J6a/p9LfjE4dHTx5nZ7K
	EkR6wwratVyUZ7naYgHIWvhmGZGMcW3dXgVZAONYMkPMYcwo6yVrDQp9GV3/fWy/Cgry2mEIYVq
	XciUYO8SU7RxkQXIgwf/OuORmGxF2090CSsWhmjYAY7d7Mtr3WJmzi/eifiNMOYQFL1Xclf+AAf
	Dl0DQART4bJp77tdwPWMY7E6jCpOlwQigQ=
X-Received: by 2002:a5d:64cc:0:b0:487:81c:6de with SMTP id ffacd0b85a97d-48867093ce7mr3896298f8f.34.1790160194918;
        Wed, 23 Sep 2026 03:43:14 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488687791cdsm5534038f8f.22.2026.09.23.03.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:43:14 -0700 (PDT)
Date: Wed, 23 Sep 2026 11:43:13 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Bradley Morgan <brads@mainlining.org>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, frederic@kernel.org,
 neeraj.upadhyay@kernel.org, boqun@kernel.org, joelagnelf@nvidia.com,
 rcu@vger.kernel.org, "Andrew Morton" <akpm@linux-foundation.org>, "Arnd
 Bergmann" <arnd@arndb.de>, linux-arch@vger.kernel.org, "Vineet Gupta"
 <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org, "Russell King"
 <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, "Guo Ren"
 <guoren@kernel.org>, linux-csky@vger.kernel.org, "Yoshinori Sato"
 <ysato@users.sourceforge.jp>, "Rich Felker" <dalias@libc.org>, "John Paul
 Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>, linux-sh@vger.kernel.org,
 "Chris Zankel" <chris@zankel.net>, "Max Filippov" <jcmvbkbc@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] lib: Add two-byte cmpxchg emulation function
Message-ID: <20260923114313.75494970@pumpkin>
In-Reply-To: <20260911192540.20983-2-brads@mainlining.org>
References: <20260911192540.20983-1-brads@mainlining.org>
	<20260911192540.20983-2-brads@mainlining.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_034848_662225_9D9030C0 
X-CRM114-Status: GOOD (  21.04  )
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

On Fri, 11 Sep 2026 19:25:34 +0000
Bradley Morgan <brads@mainlining.org> wrote:

> cmpxchg_emu_u8() emulates one-byte cmpxchg() in terms of four-byte
> cmpxchg() for the architectures lacking native one-byte atomics.
> The same architectures also lack native two-byte cmpxchg(), where
> such an operation is not supported and either fails to compile via
> BUILD_BUG() or fails to link, because the bad pointer sentinels
> these architectures declare are never defined.
> 
> Add cmpxchg_emu_u16(), the two-byte sibling. It reads the enclosing
> word with READ_ONCE(), splices the two target bytes through a union
> and loops on cmpxchg() of the full word until the compare succeeds.
> Like cmpxchg_emu_u8() it is fully ordered.
> 
> The Kconfig symbol gating this file is renamed from
> ARCH_NEED_CMPXCHG_1_EMU to ARCH_NEED_CMPXCHG_1_2_EMU, as it now
> selects both the one-byte and the two-byte emulation.
> 
> Suggested-by: Paul E. McKenney <paulmck@kernel.org>
> Signed-off-by: Bradley Morgan <brads@mainlining.org>
> ---
>  arch/Kconfig                |  2 +-
>  arch/arc/Kconfig            |  2 +-
>  arch/arm/Kconfig            |  2 +-
>  arch/csky/Kconfig           |  2 +-
>  arch/sh/Kconfig             |  2 +-
>  arch/xtensa/Kconfig         |  2 +-
>  include/linux/cmpxchg-emu.h |  1 +
>  lib/Makefile                |  2 +-
>  lib/cmpxchg-emu.c           | 35 ++++++++++++++++++++++++++++++++---
>  9 files changed, 40 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/Kconfig b/arch/Kconfig
> index 3bb2e568f5b1..d56064797e09 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -1817,7 +1817,7 @@ config CC_HAS_SANE_FUNCTION_ALIGNMENT
>  	# strict alignment always, even with -falign-functions.
>  	def_bool CC_HAS_MIN_FUNCTION_ALIGNMENT || CC_IS_CLANG
>  
> -config ARCH_NEED_CMPXCHG_1_EMU
> +config ARCH_NEED_CMPXCHG_1_2_EMU

Is it actually worth the churn of changing the name?
Maybe just a comment that say it adds both 1 and 2 byte emulation?

David

>  	bool
>  
...

