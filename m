Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BEB3CD4F39
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 22:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Cc:To:Subject:
	From:MIME-Version:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qDaLc7cKtc1Z7qsrVBUu9P40sDWf/8w+XdXDmNoGoHg=; b=LfF7d/EXvDb9G1m+OFnHGx+3LC
	ot6PvMwrqPtlhMCzNtPGOPZ3sptp4gDdwjPLYze1mjQaYTej6ZAnZlOBa/i+gO9wK2etstaO0fTDJ
	kDcerYQQj0a7DuPUmhu0j7S44C5vMyls9ELIaE88f4VNqybTKMwMSsKkqiegabZPHQ/+eja/hbgQD
	GJPpBvnSke5pniFFyIObIpc2Gf7A1Uhn5wPinh2rc0cJZ8miiFGtaGmBI2xlU6HxoBd3V58NsIfUA
	bYbDQHEIBJXgkXf/2Sp+imWXfvF6sfJoHypz5sxAk3wgFwlD04T9JuTfEskuOMCfX2z1gyWMonw61
	2k4e3pqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNeZU-00000006jHW-0xnJ;
	Thu, 14 May 2026 22:30:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNeZS-00000006jH7-1mil
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 22:30:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E2AFF409EC;
	Thu, 14 May 2026 22:30:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1326AC2BCB3;
	Thu, 14 May 2026 22:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778797821;
	bh=5yns+K4CDbbF35ROcL1UsFk0JF6RfU8OVfC6oCazIG8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=bvAGzvanzcVJ4tqsWCZGn3wQSpUAEil8eXUpDwbqMdKk/9uFQMCtC4l8MwdH+oYhn
	 ySrnk0z50ZUIacONiFV6UZf+Q1J5I95aWBe4nc1aPnLN4yT5pZM0c7yOHR17RsK7BN
	 XEld92GAoxisDXweArpdyNQ7sxVUv5UhZagpJzsGDwWZjpTXLxPhaqkXgkL7sMYlWV
	 DnoSW3YUBS8uKCr2oEIMrtCfqwVAQTiIuXwqJ5XgTRLMF9wqFtdW0EJSWl29T9onZJ
	 0bOUFkRAEgRMsXN+5xg1sdUv9sHT6CJLFojYIyVqqTbMjfHHDJAFf5dFbhmilRckiN
	 gkosRnmHX/V+A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 10/21] objtool: Ignore jumps to the end of the
 function for checksum runs
To: x86@kernel.org
Cc: "Mark Rutland" <mark.rutland@arm.com>, live-patching@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, "Miroslav
 Benes" <mbenes@suse.cz>, "Petr Mladek" <pmladek@suse.com>, "Will Deacon" <will@kernel.org>, "Song
 Liu" <song@kernel.org>, "Peter Zijlstra" <peterz@infradead.org>, "Joe
 Lawrence" <joe.lawrence@redhat.com>, "Catalin Marinas" <catalin.marinas@arm.com>
In-Reply-To: <b3b58101e15e1bb5266e57134f0b65f7d8efdd4b.1778642120.git.jpoimboe@kernel.org>
References: <b3b58101e15e1bb5266e57134f0b65f7d8efdd4b.1778642120.git.jpoimboe@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 22:30:20 +0000
Message-Id: <20260514223021.1326AC2BCB3@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_153022_504244_0F25715F 
X-CRM114-Status: GOOD (  14.99  )
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
- [Medium] Missing parentheses in the jump destination check causes objtool=
 to silently ignore all missing jump targets when branch validation is disa=
bled, instead of only jumps to the end of the function.
--

commit aa068d4053e8b92ff17082c7a023821e72f5d625
Author: Josh Poimboeuf <jpoimboe@kernel.org>

objtool: Ignore jumps to the end of the function for checksum runs

Sometimes Clang arm64 code jumps to the end of the function for UB.
This commit ignores these jumps to the end of the function for
checksum runs to avoid errors.

> diff --git a/tools/objtool/check.c b/tools/objtool/check.c
> index 10b18cf9c3608..73451aef68029 100644
> --- a/tools/objtool/check.c
> +++ b/tools/objtool/check.c

[ ... ]

> @@ -1593,10 +1609,14 @@ static int add_jump_destinations(struct objtool_f=
ile *file)
>  			/*
>  			 * GCOV/KCOV dead code can jump to the end of
>  			 * the function/section.
> +			 *
> +			 * Clang on arm64 also does this sometimes for
> +			 * undefined behavior.
>  			 */
> -			if (file->ignore_unreachables && func &&
> -			    dest_sec =3D=3D insn->sec &&
> -			    dest_off =3D=3D func->offset + func->len)
> +			if (!validate_branch_enabled() ||
> +			    (file->ignore_unreachables && func &&
> +			     dest_sec =3D=3D insn->sec &&
> +			     dest_off =3D=3D func->offset + func->len))
>  				continue;

Does this condition silently ignore all missing jump targets when branch
validation is disabled?

Because of the || without proper parenthetical grouping around the first
two terms, if !validate_branch_enabled() is true (which it is for
--checksum or --noinstr runs), the rest of the condition short-circuits.

This appears to cause objtool to skip the error reporting and silently
leave the jump destination as NULL for any unresolvable jump in the binary,
instead of only those jumping to the end of the function.

Should the logic be grouped to restrict the exception to the end of the
function?

			if ((!validate_branch_enabled() || file->ignore_unreachables) &&
			    func &&
			    dest_sec =3D=3D insn->sec &&
			    dest_off =3D=3D func->offset + func->len)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1778642120.gi=
t.jpoimboe@kernel.org?part=3D10

