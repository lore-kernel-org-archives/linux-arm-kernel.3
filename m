Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB3DD5C0DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 08:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=18QUzibWbUvzdO3mSa7PVgq3DCScRHDw8cH0GYL+t4Q=; b=gG6ZdmeFWpr2V29rbJ76orkdpo
	Pj2PVPud08gTckui94r6WZxL9f/LFJbvGtEeJ0qrO80Z8uGTnB1CWT8rrv3eVGOwVhTvZf89mevZJ
	koY0yRq4L2RKrEckMZ6znkhpYOq2XdBNKslzVJQMXSaklsx4mlbbi2eSWBx7AdQT9XujbZUOC9poY
	OXNNzbiK+jwE0H57FVpWfNq9E78hEzQwRPe84KscSTspb5qOSc2FkZ36fWPTMh5dWLt8Z7oJ7TfeO
	TfOudeeFsahGOa9Y4iAyQO36rWSD3jQTX5Y+6gR4y8Ty02dpMdLya13UrfbLID3hR4hNwXReMpbOW
	ZsQoNmtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVQPG-00000004vAl-09YM;
	Tue, 16 Dec 2025 08:27:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVQPE-00000004vAb-0P9p;
	Tue, 16 Dec 2025 08:27:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2922460173;
	Tue, 16 Dec 2025 08:27:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC4B5C4CEF1;
	Tue, 16 Dec 2025 08:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765873658;
	bh=rE9Ya5hAlvxFBkqWRdp1h1Tw4atfvwW4q7E/otCHqMI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JpH0ju1F8NUs3civI5pVZ0tGQuWRgVmJea/HUdFrdPkxzabRyvvWngSvPwbNCTYPM
	 LJhIccwNtxPnFVZsJpjcpGl6URl9HoPyZlVGLkXNQioxIxUlUHqExaKN17uE1o+paN
	 YIuIEHbyBtzPN2eAcDgL7HhmXY/jt4Sh4cJXRHafAOdEeo3X/RvSkX8KvfVxqYwkN0
	 JX856NBteLWPccrXuACAGyV7qGbQ2wZXIYL2a0xP9lOzCYR16+RdIzhXRdd/aRzbla
	 ShNeBUsczzSfo6Dy7whFpMq3VOLTjncclOgtP5L92fUVPRhMUtuHyyH7Dk+zoItnnq
	 rMHeQFc4RhbtA==
Date: Tue, 16 Dec 2025 00:27:38 -0800
From: Kees Cook <kees@kernel.org>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Jeremy Linton <jeremy.linton@arm.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 3/3] randomize_kstack: Unify random source across
 arches
Message-ID: <202512160024.B688A8D0@keescook>
References: <20251215163520.1144179-1-ryan.roberts@arm.com>
 <20251215163520.1144179-4-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215163520.1144179-4-ryan.roberts@arm.com>
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

On Mon, Dec 15, 2025 at 04:35:17PM +0000, Ryan Roberts wrote:
> [...]
> @@ -45,9 +46,22 @@ DECLARE_STATIC_KEY_MAYBE(CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT,
>  #define KSTACK_OFFSET_MAX(x)	((x) & 0b1111111100)
>  #endif
>  
> +DECLARE_PER_CPU(struct rnd_state, kstack_rnd_state);
> +
> +static __always_inline u32 get_kstack_offset(void)
> +{
> +	struct rnd_state *state;
> +	u32 rnd;
> +
> +	state = &get_cpu_var(kstack_rnd_state);
> +	rnd = prandom_u32_state(state);
> +	put_cpu_var(kstack_rnd_state);
> +
> +	return rnd;
> +}
> [...]
> -static inline void random_kstack_task_init(struct task_struct *tsk)
> +static int random_kstack_init(void)
>  {
> -	tsk->kstack_offset = 0;
> +	prandom_seed_full_state(&kstack_rnd_state);
> +	return 0;
>  }
> +
> +late_initcall(random_kstack_init);

Doesn't this need to be run for every CPU? (And how does hotplug work
for such things?) And doesn't it need a get_cpu_var?

-- 
Kees Cook

