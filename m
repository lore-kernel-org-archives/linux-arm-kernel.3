Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11034C5AD05
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 00:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uxgPgZY649uBFpZuPHL/PO7mmTC5hIC1hhbvXAzNB9w=; b=AnSK3/TGh4HxLhsCXC7AK0lLhD
	9Y+90zwI2v1OHyONFjOYio5fXve7v7nr5Vgo3epKj60c7SiFwH3BOby0iq36O+LTTUd8UNBAwhYCY
	Ickh6CiTjhzK/tC8/WrizjhZOuVIvES3OHu94cW4dKgc+qRY5pCGidKDR4VDeCdqcTYnUyS9npT07
	OqzYAnvr1OeOcLjGs1xYssUK+WViC7Z3WcmTiaVaTQPFqhj30go3BUlf99OBxZuwgY1JXysV86plT
	Qtm6gcMk6Hy1t3Fwv15ntiWzDxjzMvU2dfZ+0LNROsXOKRMnbp0/gIOCahvFqZ5EzQ9w8UFPSei0i
	ICmKL0Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsUbv-00000008tex-3SpR;
	Sat, 08 Aug 2026 00:08:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsUbt-00000008tep-3llA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 00:08:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 455C041603;
	Sat,  8 Aug 2026 00:08:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B38A1F000E9;
	Sat,  8 Aug 2026 00:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786147700;
	bh=uxgPgZY649uBFpZuPHL/PO7mmTC5hIC1hhbvXAzNB9w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GzJtKfmmGy/pTC6LyJvs2eEM4qcaiPYAzTZsobH/EDVOAo+c3OavmFkSvDk9u15AH
	 jz0+GU54Dw/X88CIQaFtf/qjSaxlLBMztlMnOsMDKWZDsoYkL5H7bKxwH7G6yqrp5v
	 lSY/Yi8ZGZ2NzAvuC5OBVfSL6YNSZe8UEFWxzEU1Fim81B/3AugLysGYm5jULnpHGN
	 QbR14GmJQBDYaoSdWyOPWkVfHjS+1OfTGAch1jHSqCGhtunw7UKPqevs4s9NsLcuhC
	 /z3TVGHcfbPsBJkd18yuqeDgmkKiBpu4ZrMQid9C/6MBhetFvDrz/xZ78NXv8HnEUJ
	 fzDQBBOojmR7w==
Date: Fri, 7 Aug 2026 17:08:17 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: sashiko-bot@kernel.org
Cc: x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
	live-patching@vger.kernel.org, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Joe Lawrence <joe.lawrence@redhat.com>, 
	Song Liu <song@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Petr Mladek <pmladek@suse.com>, Miroslav Benes <mbenes@suse.cz>
Subject: Re: [PATCH v3 12/21] objtool: Refactor elf_add_data() to use a
 growable data buffer
Message-ID: <emf3idmv3xmm7gplpbykmcnnp44fugljawqlh6yi2hz7acewxg@w2yndfif37f4>
References: <a0fe2363d017a2833e98ae50de797fe55c2796a4.1778642120.git.jpoimboe@kernel.org>
 <20260514231355.DD8D7C2BCB3@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260514231355.DD8D7C2BCB3@smtp.kernel.org>
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

On Thu, May 14, 2026 at 11:13:55PM +0000, sashiko-bot@kernel.org wrote:
> > -	sec->data->d_buf = calloc(1, size);
> > -	if (!sec->data->d_buf) {
> > -		ERROR_GLIBC("calloc");
> > -		return NULL;
> > +	size_old = sec->data->d_size;
> > +	offset = ALIGN(size_old, sec->sh.sh_addralign);
> > +	size_new = offset + size;
> 
> Could this ALIGN calculation overflow if a malformed ELF file provides an
> extremely large sh_addralign value?

Doesn't seem realistic...

> > -	if (data)
> > -		memcpy(sec->data->d_buf, data, size);
> > +	if (!sec->data_overallocated)
> > +		alloc_size_old = size_old;
> > +	else
> > +		alloc_size_old = max(64UL, roundup_pow_of_two(size_old ? : 1));
> >  
> > -	sec->data->d_size = size;
> > -	sec->data->d_align = sec->sh.sh_addralign;
> > +	alloc_size_new = max(64UL, roundup_pow_of_two(size_new ? : 1));
> >  
> > -	offset = ALIGN(sec_size(sec), sec->sh.sh_addralign);
> > -	sec->sh.sh_size = offset + size;
> > +	if (alloc_size_new > alloc_size_old) {
> > +		void *orig_buf = sec->data->d_buf;
> > +
> > +		sec->data->d_buf = calloc(1, alloc_size_new);
> > +		if (!sec->data->d_buf) {
> > +			ERROR_GLIBC("calloc");
> > +			return NULL;
> > +		}
> 
> If calloc fails here, does assigning its result directly to sec->data->d_buf
> clobber the valid pointer to orig_buf?
> 
> It appears orig_buf is never freed on this error path, which might leak the
> original buffer if it was previously owned by objtool. Would it be safer to
> keep the original buffer pointer intact on allocation failure?

A memory leak on the error path is fine, it's about to exit anyway.

-- 
Josh

