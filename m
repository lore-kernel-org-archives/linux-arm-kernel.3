Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E7A2CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 02:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Cc:To:Subject:
	From:MIME-Version:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZDNnIRMHkSYwMfxR5k4l5ncBbucBQZkKPFW617Sixjs=; b=qoNEHgSR5u8n2O6mN6WDxCnHJT
	KQnQVw2O0pWhmniT2S4v4Hy4OgMhR5Ae+On9GdJA+XmqPDixvKVMEOib59ZE+rIRYFKl141KGhVwn
	kTl0ShSLlkL+TPqldkPOD+d6DXLjp+7iln/7H8WeuSATGePhaD7vGCVtfv6K0gUC4p7kEkbvG0bD+
	ByNGlZITVqcHrpEdUjQH75qu6HGOzNg9zrl//Ex9qzooBXOymHJ36aXVrqRqkfyJ/aPgaaPPehXX+
	Uwx29Y0vlmnYeDchQJ+jo2U3fLjy2b9Y9lI3/RF+Mr4rDcLrL9Y6YKx5mpZK9Q71gGfNUj7l18Odn
	IFoXA7Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNiXc-000000079Ox-1v4w;
	Fri, 15 May 2026 02:44:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNiXZ-000000079OK-1Kb3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 02:44:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A40BD42E05;
	Fri, 15 May 2026 02:44:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF2B7C2BCB3;
	Fri, 15 May 2026 02:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778813080;
	bh=xddcZ6kMGB/rYMEe75+BVJi4hJyQUito4b9gPm8fIH4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=pa6o4LlxYgmirQt3ntPFMTLSJDXIAwZIOH9BQDvGw+2rFq7bMQUumud4wBa3/93kl
	 gb72mifNw4QLgld1sRYfhZbUzYQWYCRTSy+SEHYeOIgO+rIsJpwtAllPA+Qs8+UvvI
	 Rz96xPcOQtUzsnnqTVm/nlYqQJe/tzKErYoBMqll8NviSZIc6zlx2tbzew9o3S3JFf
	 620nORRqfWEZ+RmQ6wCaLewA6Z63H35S9Nc4rG2lbXHSHjTaweyWkBmZvX/hu9Rwmk
	 TnvfXN9XcY+y4n6Io8U4VvMdbhiLFgM3ToV1rkx+DI3SrG3f52ex8A5/N3crhtBAzw
	 aKHgbYJmNCuaw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 21/21] klp-build: Add arm64 syscall patching macro
To: x86@kernel.org
Cc: "Miroslav Benes" <mbenes@suse.cz>, live-patching@vger.kernel.org, "Peter
 Zijlstra" <peterz@infradead.org>, "Will Deacon" <will@kernel.org>, "Joe
 Lawrence" <joe.lawrence@redhat.com>, "Catalin Marinas" <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org, "Mark
 Rutland" <mark.rutland@arm.com>, "Song Liu" <song@kernel.org>, linux-kernel@vger.kernel.org, "Petr
 Mladek" <pmladek@suse.com>
In-Reply-To: <3bf3cee43039fc4da84e83d0891a92e25f40f00f.1778642121.git.jpoimboe@kernel.org>
References: <3bf3cee43039fc4da84e83d0891a92e25f40f00f.1778642121.git.jpoimboe@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 02:44:39 +0000
Message-Id: <20260515024439.AF2B7C2BCB3@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_194441_377682_498FB3C4 
X-CRM114-Status: GOOD (  10.23  )
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
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The arm64 __KLP_SYSCALL_DEFINEx macro omits the ALLOW_ERROR_INJE=
CTION declaration, silently breaking BPF error injection for livepatched sy=
scalls.
--

commit b4d1a9ea352f196a7fd3e7198fdade51440d08e5
Author: Josh Poimboeuf <jpoimboe@kernel.org>

klp-build: Add arm64 syscall patching macro

This commit adds arm64 support for KLP_SYSCALL_DEFINEx(). The commit
message states it is mirroring the arm64 __SYSCALL_DEFINEx() pattern from
arch/arm64/include/asm/syscall_wrapper.h.

> diff --git a/include/linux/livepatch_helpers.h b/include/linux/livepatch_=
helpers.h
> index 99d68d0773fa8..4b647b83865f9 100644
> --- a/include/linux/livepatch_helpers.h
> +++ b/include/linux/livepatch_helpers.h
> @@ -72,6 +72,25 @@
>  	}								\
>  	static inline long __klp_do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))
> =20
> +#elif defined(CONFIG_ARM64)
> +
> +#define __KLP_SYSCALL_DEFINEx(x, name, ...)				\
> +	static long __se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__));	\
> +	static inline long __klp_do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__));\
> +	asmlinkage long __arm64_sys##name(const struct pt_regs *regs);	\
> +	asmlinkage long __arm64_sys##name(const struct pt_regs *regs)	\
> +	{								\
> +		return __se_sys##name(SC_ARM64_REGS_TO_ARGS(x,__VA_ARGS__));\
> +	}								\

Does this macro definition omit the ALLOW_ERROR_INJECTION declaration?

The standard arm64 __SYSCALL_DEFINEx() macro explicitly registers the top-l=
evel
syscall handler with ALLOW_ERROR_INJECTION() to enable BPF error injection
workflows like bpf_override_return(). The x86 implementation correctly
preserves this functionality.

Because this macro is missing that declaration, it looks like it might
introduce a regression where BPF cannot inject errors into the replacement
syscalls in a livepatch module on arm64.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1778642120.gi=
t.jpoimboe@kernel.org?part=3D21

