Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20416C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 23:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8zh8FdoLPVYOFi3kDPtIftnZ0sQPUwKSPCzdZ4sWpZI=; b=ksPufDTswKtxVCxhsMyytENql5
	4znS9i7d84xW87yneO5HqXXd8aWmkLQI+aPZ2ePJSnzdcsQgjwQaNc6LvWpA1fObGH1Kj8pNtBhz6
	5YZFGU4qqqH97jBGfkVK5eBl3HBbN8ps+hZ0NaeFOR9YweNXXJB4wS1w7p3j4SKw9PhmDQL8JzN3o
	rKu6+yT4eJD4CanwM9CWpwqb3itSqF+9PMB6Srg7g9NqqpDNxf1QL1IhUSnpBRtzVymSuBin3kf+s
	AmFWHVt9876lutKZcNi5/6ZJmY2tPdQ+F0xynccUiauSiF1ML9sipxjwqrt4axunzVjt7pys+mNGF
	5DZpSnRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtvsg-0000000F5NF-3lq0;
	Tue, 11 Aug 2026 23:27:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtvsf-0000000F5N7-3b4w
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 23:27:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5308443E52
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 23:27:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37ECE1F000E9
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 23:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786490857;
	bh=8zh8FdoLPVYOFi3kDPtIftnZ0sQPUwKSPCzdZ4sWpZI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=O/hkjEgwHZmqcJgzgQhL8puh4FXSELEoQIZ+Vsz1CiMhEeVx1qWnWYNhxOvms+Yco
	 8tMtLBgZUdJWGtTyWyucBVB8RUQSqJoSOLGbsWglbXKgsN0YoqTDEZZPKOXZ3VJpdp
	 8yJdJ5nwH93Dc4l+sg+GPZDL9q05JiNPdqbPaxHYr6ziT/ZGh0ZCvs+gA6wvEZKNjs
	 aG8UI1NZMPe/LRCX+qAfURlWYe56aaSccsii5RzaHL11yyKdjYwGDnhnzMiMeW0eI4
	 5mbNgqVEnj2P7rT768z/CDe8p//GJFElcY4c/D5wbZa/G2SFO4RLoVUC3WtezyWt2R
	 3YmxAxgRHBeMg==
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-9034b6b7674so2954286d6.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 16:27:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rrtdg9T3wVXkbb+hHoiRpbvjJcbS1OixtXR74kMmLgbP/DGv11l+DkdUZ3b7SUQXr90eLYjxJ5uCMATjOXI4UR5@lists.infradead.org
X-Gm-Message-State: AOJu0Yyk5nI3xhNC1h4Fp/YVqUPJpDZrK0pIeAkVKCy1fbcfTaSwg74L
	x0I0J8ESt+44R/9k07P6E4Vbq8qqFVcdvqXmnEnIuoPLAd8eB1BkkXrPWD41O5h0un/hm808HIf
	BIgpuyg8eXv0lYgEeGCasFm3krsdxR6Q=
X-Received: by 2002:a05:6214:4a07:b0:90a:3b62:805d with SMTP id
 6a1803df08f44-90a6ff13336mr8751586d6.4.1786490856251; Tue, 11 Aug 2026
 16:27:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1786230311.git.jpoimboe@kernel.org> <8faaead205b219607b6fc2359ae743be824056eb.1786230311.git.jpoimboe@kernel.org>
In-Reply-To: <8faaead205b219607b6fc2359ae743be824056eb.1786230311.git.jpoimboe@kernel.org>
From: Song Liu <song@kernel.org>
Date: Tue, 11 Aug 2026 16:27:23 -0700
X-Gmail-Original-Message-ID: <CAPhsuW6npZ+AP7wmw2j9JnfBkOSzM7pGUEs53fdTpmKOY8AuMA@mail.gmail.com>
X-Gm-Features: AUfX_mwMFKcqpM918zS1IsQwoCA_15C58RBfTvEXqZhQOjWORDLmFE6stS8l6Sc
Message-ID: <CAPhsuW6npZ+AP7wmw2j9JnfBkOSzM7pGUEs53fdTpmKOY8AuMA@mail.gmail.com>
Subject: Re: [PATCH v4 01/22] objtool/klp: Fix .kcfi_traps special section extraction
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
	live-patching@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
	Joe Lawrence <joe.lawrence@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Sat, Aug 8, 2026 at 4:18=E2=80=AFPM Josh Poimboeuf <jpoimboe@kernel.org>=
 wrote:
>
> create_fake_symbols() creates a symbol per entry for special sections.
> It does so in two steps: first for the sections which have
> ANNOTATE_DATA_SPECIAL annotations, then for the rest, using entsize or
> the reloc count to infer the entry size.  The second step skips the
> sections already handled by the first one by looking for a symbol at
> offset 0.
>
> That heuristic is too fuzzy: with Clang and CONFIG_CFI, it misfires on
> .kcfi_traps because Clang emits a .Ltmp* assembler-local label at the
> start of the section, so no symbols are created and
> clone_special_sections() extracts nothing.  klp-build still reports
> SUCCESS, but the livepatch module has no __kcfi_traps section and the
> traps for the patched functions are lost.
>
> Look for the actual fake symbols created by the first step instead.
>
> Fixes: da4326573ae8d ("objtool/klp: Fix kCFI trap handling")
> Reported-by: Joe Lawrence <joe.lawrence@redhat.com>
> Closes: https://lore.kernel.org/r/akQNqlfFC0T5pcMa@redhat.com
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>

Acked-by: Song Liu <song@kernel.org>

