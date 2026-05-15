Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B508CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 01:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Cc:To:Subject:
	From:MIME-Version:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SQoXexgGKldlhbc2YrP2DRv7q8ep63O6KuKYlEbgc5I=; b=O4gN9q3+eaUlRbtyK9xF2mOPm5
	FzXNGCwIgatdGsruqgkJazZ++3uXqld1b77zwa90gFsMDx8Su0PlbSEJCIGm1or2AT4qSk6gztq2X
	99T8CSOMcs9Dgt03ffXJeIpDTRpdbCcqUFkfd8jIh2CcrijHsqXQd9kAxZ39N9G5PUxEF9/1tiQex
	lZLj6LlB6S7RfSVRmgQRRqPWKXQHFRfqsjC08TbbMbCIKAHuDW2ssEoex1lxtgUypVF49qZmSv1zW
	XRZbZZeTZ9wjP2NSKxWKhByGwHE5vGw/hOSzW3fAX4y0nwng8JKM1eW8rMJIrj5724hkQBrDZ4SSG
	3GdVO3Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNhDa-000000070WI-07NK;
	Fri, 15 May 2026 01:19:58 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNhDY-000000070Vu-3n2i
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 15 May 2026 01:19:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Message-Id:Date:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Cc:To:Reply-To:
	Subject:From:Sender:MIME-Version:Content-ID:Content-Description;
	bh=SQoXexgGKldlhbc2YrP2DRv7q8ep63O6KuKYlEbgc5I=; b=Tkp4hVnIKucJ/EwCRf91yrBboC
	05YXeTeJOrplvlUPsUaJBGqu1HHToNACprksT9dnwRtsvRptEBnBWoHrnEDT7WukR9s8uIfY3yIdx
	6urvuNyvrvk10V0j3QsMMUcF6bm2OzZxgOjkKhYPamKcGXA/5GgWR0ibxxja169XDJP4r3j5xzZPd
	x6/5yafopcO5B1LfcU3r8ngkDnL7mAM9edjERDcUngqjRQwudASCFqIS8FQP8cd0CB+MB5nwF0rdg
	FMK10aQ3JWwCLNnfnvIb8wisSAFjattAuDfoR6ojI93AxNqOtTsrBzmBAq+ZG00mOnTjwfcaGBxjE
	PldiuEbw==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNhDS-00000000kjM-3Wzv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 01:19:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8AA72407DE;
	Fri, 15 May 2026 01:19:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F225CC2BCC7;
	Fri, 15 May 2026 01:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778807988;
	bh=3j+5BX7wS+F4Sxy4cieVbQ+E3J8B4XkGmkCnhpoT/H8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=GcV7ZhqlUSboF6CD1sjOsAE4IYTwRxyYAGQU19lsJe9QOk6Im3vb2h2Qmm0LMiPbA
	 GR4SAQQIt80eZV4WxxKf5gr+lXzvAgaRL1Dpje2ptn5l97L1Z/rBsEV6ox/Kbm9240
	 3P6uf7zdIFWHbGUodD6B1QrZwluS+Zo6ja3t7yDHFiNSnxC8NVjRFN2fld0mGRGtw1
	 CAQMyCUIi/oM68b6dSUTdyNj1wfUp+H3Rl1QyCnAjiHYoiLlaUbywWmFweJibfJJos
	 ds2rzDjvppaUNZb+Q+9f1HsH3PUBt40eLj4zXOKghe+V8BuD296aaEsxzIg7Q6Is3O
	 4g7mst3vcA2FA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 17/21] objtool/klp: Don't correlate arm64 mapping
 symbols
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org, "Petr Mladek" <pmladek@suse.com>, "Song
 Liu" <song@kernel.org>, live-patching@vger.kernel.org, "Mark Rutland" <mark.rutland@arm.com>, "Peter
 Zijlstra" <peterz@infradead.org>, linux-arm-kernel@lists.infradead.org, "Will
 Deacon" <will@kernel.org>, "Miroslav Benes" <mbenes@suse.cz>, "Catalin
 Marinas" <catalin.marinas@arm.com>, "Joe Lawrence" <joe.lawrence@redhat.com>
In-Reply-To: <48efc64058f667159d3dedf367c1d4cdedf84f1c.1778642120.git.jpoimboe@kernel.org>
References: <48efc64058f667159d3dedf367c1d4cdedf84f1c.1778642120.git.jpoimboe@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 01:19:47 +0000
Message-Id: <20260515011947.F225CC2BCC7@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_021951_086422_9BE09DCE 
X-CRM114-Status: UNSURE (   9.64  )
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
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `is_mapping_sym()` function relies on an overly broad substr=
ing match (`strchr(sym->name, '$')`), which risks falsely classifying any u=
nannotated (`STT_NOTYPE`) symbol containing a `$` as an ARM64 mapping symbo=
l.
--

commit fb925cb10f7a9c6ab8ecefca87d3cd3b4e4da879
Author: Josh Poimboeuf <jpoimboe@kernel.org>

objtool/klp: Don't correlate arm64 mapping symbols

This commit updates the livepatch diff tool to skip the correlation of arm64
mapping symbols. These symbols mark transitions between code and data but a=
re
not standard symbols that require correlation.

> diff --git a/tools/objtool/klp-diff.c b/tools/objtool/klp-diff.c
> index eb21f3bf3120b..e1d4d94c9d77c 100644
> --- a/tools/objtool/klp-diff.c
> +++ b/tools/objtool/klp-diff.c
> @@ -501,6 +501,7 @@ static bool dont_correlate(struct symbol *sym)
>  	       is_prefix_func(sym) ||
>  	       is_uncorrelated_static_local(sym) ||
>  	       is_local_label(sym) ||
> +	       is_mapping_sym(sym) ||

Does this code risk falsely classifying user-defined or macro-generated
assembly labels as mapping symbols?

Looking at the definition:

tools/objtool/include/objtool/elf.h:is_mapping_sym() {
        return is_notype_sym(sym) && strchr(sym->name, '$');
}

Because it relies on a broad substring match, could this exclude valid
unannotated STT_NOTYPE symbols containing a $ from correlation across all
architectures?

Triggering a livepatching failure would require an unusual edge case, but
would it be safer to use a stricter match for standard arm64 mapping symbol
formats like $x or $d?

>  	       is_string_sec(sym->sec) ||
>  	       is_anonymous_rodata(sym) ||
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1778642120.gi=
t.jpoimboe@kernel.org?part=3D17

