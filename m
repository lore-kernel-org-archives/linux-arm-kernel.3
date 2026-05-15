Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3795BCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 02:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Cc:To:Subject:
	From:MIME-Version:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OrImahDwtBEomhJ5MtxnEoRzflH3GdPUO7jMCDRhb4w=; b=s/PFgFrsE8Pf9SqteVa3tx0f30
	tLUZBIDLi1/uRQeND3O/6o9ozigAulxTpdRkBLOFuehFBJbsVRtXPiLECny6YNq0oF1DX3JtHSKg5
	Pni/j6ilRJ5Pn4Qw8RZoz/13uyuUA2CAgulm7Rvlywjr8Wug2qQnTlWyaQyqhfhxMBmZ/QBXN8LLy
	7CXCdo5usZNnakLRvsQMKMce9NKJw4SWZIS6yK6U7tpfc3CoJUtiGvUnwjM6ST4WMU2wL7jSNoYM7
	+XqZm9+DqKCJzk2Pg6/cyeBqDouqrZHseT2rGFpo2+Tfh6E1NNJ51iDwEMd+9HEBNV8tj9//cp77X
	xOSBk1ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNhys-000000075Kb-2t6A;
	Fri, 15 May 2026 02:08:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNhyp-000000075JZ-15bb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 02:08:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 68A4B4387C;
	Fri, 15 May 2026 02:08:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE5B2C2BCB3;
	Fri, 15 May 2026 02:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778810926;
	bh=xCHGOvSiHLqCOrP+JKzt9pzABYAnM6/1kNNixxX6KE8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=YzzXhh4gwgzBXVS/MYDUB0SY7m548HQFIawW8TFOIdnsUoRcWHkVikXINgzP7785U
	 5USN6u6xcmJ8WjZvkkonQRy7YKoP2kStpWIu5fK6+IuZvOn49UZc24btcdX5q5jpVa
	 5H6BZ9hwmqIAc72r9zyZ+zqtA8+D+N8OYytAEHu48+cLxTsB54UYb+2EClnBWSHPWd
	 p5ct9ch9fYebZC3F7dE/yK/dLoK2KrgDv+l+OZ4nOPYAWVWN+kJkOw6oH1RszTzyXy
	 HwcBB1pFi9EmqJmwi0cQgL/bcXG26lqJUgfG514dX//yNu/QeXbgsr1NhpzyxZvHvl
	 MxiJ2gU1WwMEA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 19/21] objtool/klp: Introduce objtool for arm64
To: x86@kernel.org
Cc: live-patching@vger.kernel.org, linux-kernel@vger.kernel.org, "Peter
 Zijlstra" <peterz@infradead.org>, "Song Liu" <song@kernel.org>, linux-arm-kernel@lists.infradead.org, "Petr
 Mladek" <pmladek@suse.com>, "Joe Lawrence" <joe.lawrence@redhat.com>, "Mark
 Rutland" <mark.rutland@arm.com>, "Will Deacon" <will@kernel.org>, "Miroslav
 Benes" <mbenes@suse.cz>, "Catalin Marinas" <catalin.marinas@arm.com>
In-Reply-To: <5b66146373b1ff1aba1318fd51867dea2eb882f6.1778642121.git.jpoimboe@kernel.org>
References: <5b66146373b1ff1aba1318fd51867dea2eb882f6.1778642121.git.jpoimboe@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 02:08:45 +0000
Message-Id: <20260515020845.CE5B2C2BCB3@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_190847_324303_05795042 
X-CRM114-Status: GOOD (  13.62  )
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
- [Medium] The arm64 instruction decoder misclassifies trap instructions (e=
.g., `brk #0x800` used for `BUG()`) as `INSN_OTHER` instead of `INSN_BUG`.
--

commit dd63f0c03bab6a47f34cfcb310454460653638ed
Author: Josh Poimboeuf <jpoimboe@kernel.org>

objtool/klp: Introduce objtool for arm64

This commit adds basic support for arm64 in objtool, initially enabling=20
only the "objtool klp" subcommands.

> diff --git a/tools/objtool/arch/arm64/decode.c b/tools/objtool/arch/arm64=
/decode.c
> new file mode 100644
> index 0000000000000..47658c76e1af0
> --- /dev/null
> +++ b/tools/objtool/arch/arm64/decode.c

[ ... ]

> +int arch_decode_instruction(struct objtool_file *file, const struct sect=
ion *sec,
> +			    unsigned long offset, unsigned int maxlen,
> +			    struct instruction *insn)
> +{

[ ... ]

> +	if (ins =3D=3D 0xd503201f) {
> +		/* NOP: static branch */
> +		insn->type =3D INSN_NOP;
> +	} else if ((ins & 0xfc000000) =3D=3D 0x14000000) {

[ ... ]

> +	} else if ((ins & 0x7e000000) =3D=3D 0x36000000) {
> +		/* TBZ/TBNZ: intra-TU sibling call */
> +		insn->type =3D INSN_JUMP_CONDITIONAL;
> +		insn->immediate =3D sign_extend64((ins >> 5) & 0x3fff, 13);
> +	} else {
> +		insn->type =3D INSN_OTHER;
> +	}

Does this code misclassify trap instructions?

On arm64, BUG() is implemented using the brk instruction (such as brk #0x80=
0).
Since the decoder doesn't appear to check for brk, it will fall through to =
the
else block and classify it as INSN_OTHER.

If INSN_BUG is misclassified as a normal instruction, won't this lose dead-=
end
propagation and corrupt objtool's control-flow analysis?

> +
> +	insn->len =3D 4;
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1778642120.gi=
t.jpoimboe@kernel.org?part=3D19

