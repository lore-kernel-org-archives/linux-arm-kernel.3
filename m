Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D22C5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 23:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mTGZpIz4M4r9TSqZuw4PEXtdDxWFgjyQGT20ghOJOs4=; b=c46tIkj1Ucf7plz929W2N7bKKu
	+lGKBp507N19F9ltU5l3tQSqB1MdzoMlxoa2kqJb0jBuBBb4gAFHHlFY5RcVX1v0nxwlcGY8ZSasx
	yNBc9/Bs6kmP+XEBgwFKABvB76i5GrxgevAElxAFh7lnyZ/qHQD8ZpeDaqqkAvhq0IVMpMklJbqza
	RuVHMEcqLmYCmBQOkhSfYQ70yJJjQdmvXju01Os0F+7xTfkjv9082752DKw/UfHVvxDxd/kBn7Tpj
	QRlMpJitXr86fTkcL4pjeQWEVyVN4iu9YBcdIR0NFzABjzpSChdKtUe2SHRRDYyTdSz7sAt/trYaP
	Bcqh5fkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtwHL-0000000F778-0qmu;
	Tue, 11 Aug 2026 23:53:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtwHJ-0000000F76r-27My
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 23:53:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D538260A84
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 23:53:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FAF81F00A3E
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 23:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786492384;
	bh=mTGZpIz4M4r9TSqZuw4PEXtdDxWFgjyQGT20ghOJOs4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=IUETfSDBkQnsDjyBbXLKQ8oMvR0/zFsIs/1G3JE+te8UpUlm+xu9vxMjnZ2OOcHWH
	 eUEi2zqq81g/yASeaTxTmSu3ipVUa5UY9sCfqnSLH/Z98lCND3I8kKJmeEdPuV+aop
	 9lxe30nL4z/b3yzSOUTaZ8fkGZXUbxqO1+3nxLmwPWIvm011c5g6S7ujpfMplzz2nR
	 b4pVIF2CAb44KhJSp0+MTpDPE1G1orSiKjWnM2SkqwirowpcElYtzGpcU5jn8xk2i5
	 KIc0leZzdjiaWE8CFneKZyrF1CZ81dPtF3aw1Dmz2+PwA+brsZ1oOfdmi+sTlLiXvL
	 hIMAm2sntJjwA==
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-92e5d6f35c1so42378585a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 16:53:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrewVrmaVbtXpHhUyadnbaVRXESJUn6zPKWGYalRKeluC2J4i+VAA76nXFBTt3FlHqseJOHsgE/0LZWvdQ/hFDT@lists.infradead.org
X-Gm-Message-State: AOJu0YwIEW4Gwsvxa2C6sqv+8yiiF+RuVRlXbU5UJi2gJ4ziLBz7xYdt
	5QLIQRcVtL0d7wg2N/9ZbnqXjO/V/pZ9wLvMGt9e71NLRdvNz0qCxYFqiuRB85hdD2SM/42aKt/
	KRFvwG5MIyD6jHToO54CB1lazhLMYB4I=
X-Received: by 2002:a05:620a:26a9:b0:934:b89e:ca5f with SMTP id
 af79cd13be357-936b3d9e6a5mr121592785a.40.1786492383827; Tue, 11 Aug 2026
 16:53:03 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1786230311.git.jpoimboe@kernel.org> <e0856be4208a6bed2b22dffe2bf8e010470f49cf.1786230311.git.jpoimboe@kernel.org>
In-Reply-To: <e0856be4208a6bed2b22dffe2bf8e010470f49cf.1786230311.git.jpoimboe@kernel.org>
From: Song Liu <song@kernel.org>
Date: Tue, 11 Aug 2026 16:52:51 -0700
X-Gmail-Original-Message-ID: <CAPhsuW6JgV1a7jMxQ0bknOpQ7WQNSqYbAHWss18GCrzGZ79OcQ@mail.gmail.com>
X-Gm-Features: AUfX_mx9w8Fk2oUp5Q1a-g80ik_We6OMbGfN_eNHn1Mi-ZbBJ5sgkLkmQBXmIKM
Message-ID: <CAPhsuW6JgV1a7jMxQ0bknOpQ7WQNSqYbAHWss18GCrzGZ79OcQ@mail.gmail.com>
Subject: Re: [PATCH v4 14/22] objtool: Reuse string references
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
> For duplicate strings, elf_add_string() just blindly adds duplicates.
>
> That can be a problem for arm64 which often uses two consecutive
> instructions (and corresponding relocations) to put an address into a
> register, like:
>
>   d8:   90000001        adrp    x1, 0 <meminfo_proc_show>       d8: R_AAR=
CH64_ADR_PREL_PG_HI21  .rodata.meminfo_proc_show.str1.8
>   dc:   91000021        add     x1, x1, #0x0    dc: R_AARCH64_ADD_ABS_LO1=
2_NC   .rodata.meminfo_proc_show.str1.8
>
> Referencing two different addresses in the ADRP+ADD pair would corrupt
> the memory access.  Avoid that by detecting and reusing duplicates when
> cloning string relocs.
>
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>

Acked-by: Song Liu <song@kernel.org>

With one nitpick below:

> ---
>  tools/objtool/elf.c                 | 29 +++++++++++++++++++++++------
>  tools/objtool/include/objtool/elf.h |  3 ++-
>  tools/objtool/klp-diff.c            |  4 +++-
>  3 files changed, 28 insertions(+), 8 deletions(-)
>
> diff --git a/tools/objtool/elf.c b/tools/objtool/elf.c
> index 8bf225d70d918..3bb04d6155a8b 100644
> --- a/tools/objtool/elf.c
> +++ b/tools/objtool/elf.c
> @@ -1379,9 +1379,27 @@ struct elf *elf_create_file(GElf_Ehdr *ehdr, const=
 char *name)
>         return elf;
>  }
>
> -unsigned int elf_add_string(struct elf *elf, struct section *strtab, con=
st char *str)
> +int elf_find_string(struct elf *elf, struct section *strtab, const char =
*str)
>  {

elf_find_string() returns -1 for error and positive number for addend.
It is a good idea to add some comments for this behavior.

Thanks,
Song

[...]

