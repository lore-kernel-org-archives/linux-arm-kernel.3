Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31A04C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 02:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To
	:Subject:Message-ID:From:Content-Transfer-Encoding:Content-Type:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vxFwu5R7sxps9teXeOqSJ8ZpqQ5AyDlKfsho2IFEN1o=; b=NikUMd4xfcAFH/5iV82O86cNGQ
	rEU/0RnDdDzKKBkAMbT/LkbDmn7X0kefp+qDaFbILgnlUguXArXup6uSmdW3U9U36NK6DYzWllj4d
	n913fpDATgueiE+YXbF6bnSwPY8seGgYQSgoYACK7Qhzwj4sG/qews7s1lVwk3LlUJPisU8+ClsaO
	pfpoWNIW6kHaTdyIBspDxDa8+y35cCkTYzdpfMU0Y6Zv1NtX/2XsunZqusc7TWt1/WSB4w45TFpUA
	hgqe98WvAUV3Y0vTmaJ1bFxfLDi0yTtgoJUV7EGDrNGZairNVasoiYhckdOgJGE77FQ5gHr+3rpAe
	xUaI0XzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcxW8-00000006Ctw-1lni;
	Wed, 29 Jan 2025 02:09:24 +0000
Received: from out-189.mta0.migadu.com ([2001:41d0:1004:224b::bd])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcxUm-00000006Clh-1RkO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 02:08:02 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738116467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vxFwu5R7sxps9teXeOqSJ8ZpqQ5AyDlKfsho2IFEN1o=;
	b=AnTFkeq3b6TXFV6Ogt+Be6Mxklk3mFNdKxoBTZMKGjv6z+kBP4niiHFyeIBStgFb7sVpbT
	oOwaxOX7a5wNxuuCCkE6tjzYZd1dMMsCcTK6c3H9dcSb7ufLnFXhrKmmT5fk/ewLKEaj5v
	1cVaY9C0o3MvHlI9WMsie9posK2fu+M=
Date: Wed, 29 Jan 2025 02:07:45 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ihor Solodrai" <ihor.solodrai@linux.dev>
Message-ID: <bda935ed074d3151d9afe02df06f026b8ea30690@linux.dev>
TLS-Required: No
Subject: Re: [PATCH bpf-next v1 7/8] selftests/bpf: Add selftests for
 load-acquire and store-release instructions
To: "Eduard Zingerman" <eddyz87@gmail.com>, "Peilin Ye"
 <yepeilin@google.com>, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: bpf@ietf.org, "Xu Kuohai" <xukuohai@huaweicloud.com>, "David Vernet"
 <void@manifault.com>, "Alexei Starovoitov" <ast@kernel.org>, "Daniel
 Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>,
 "Martin KaFai  Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>, "John Fastabend"
 <john.fastabend@gmail.com>, "KP  Singh" <kpsingh@kernel.org>, "Stanislav
 Fomichev" <sdf@fomichev.me>, "Hao Luo" <haoluo@google.com>, "Jiri Olsa"
 <jolsa@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>, "Paul E.
 McKenney" <paulmck@kernel.org>, "Puranjay Mohan" <puranjay@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will  Deacon"
 <will@kernel.org>, "Quentin Monnet" <qmo@kernel.org>, "Mykola Lysenko"
 <mykolal@fb.com>, "Shuah Khan" <shuah@kernel.org>, "Josh Don"
 <joshdon@google.com>, "Barret Rhoden" <brho@google.com>, "Neel Natu"
 <neelnatu@google.com>, "Benjamin Segall" <bsegall@google.com>,
 linux-kernel@vger.kernel.org
In-Reply-To: <131a817f7f2749e78e527a251ca7971588cf62f8.camel@gmail.com>
References: <cover.1737763916.git.yepeilin@google.com>
 <3f2de7c6e5d2def7bdfb091347c1dacea0915974.1737763916.git.yepeilin@google.com>
 <131a817f7f2749e78e527a251ca7971588cf62f8.camel@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_180800_768126_54FE594A 
X-CRM114-Status: GOOD (  14.05  )
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

January 28, 2025 at 5:06 PM, "Eduard Zingerman" <eddyz87@gmail.com> wrote=
:



>=20
>=20On Sat, 2025-01-25 at 02:19 +0000, Peilin Ye wrote:
>=20
>=20>=20
>=20> Add several ./test_progs tests:
> >=20
>=20>=20=20
>=20>=20
>=20>  - atomics/load_acquire
> >=20
>=20>  - atomics/store_release
> >=20
>=20>  - arena_atomics/load_acquire
> >=20
>=20>  - arena_atomics/store_release
> >=20
>=20>  - verifier_load_acquire/*
> >=20
>=20>  - verifier_store_release/*
> >=20
>=20>  - verifier_precision/bpf_load_acquire
> >=20
>=20>  - verifier_precision/bpf_store_release
> >=20
>=20>=20=20
>=20>=20
>=20>  The last two tests are added to check if backtrack_insn() handles =
the
> >=20
>=20>  new instructions correctly.
> >=20
>=20>=20=20
>=20>=20
>=20>  Additionally, the last test also makes sure that the verifier
> >=20
>=20>  "remembers" the value (in src_reg) we store-release into e.g. a st=
ack
> >=20
>=20>  slot. For example, if we take a look at the test program:
> >=20
>=20>=20=20
>=20>=20
>=20>  #0: "r1 =3D 8;"
> >=20
>=20>  #1: "store_release((u64 *)(r10 - 8), r1);"
> >=20
>=20>  #2: "r1 =3D *(u64 *)(r10 - 8);"
> >=20
>=20>  #3: "r2 =3D r10;"
> >=20
>=20>  #4: "r2 +=3D r1;" /* mark_precise */
> >=20
>=20>  #5: "r0 =3D 0;"
> >=20
>=20>  #6: "exit;"
> >=20
>=20>=20=20
>=20>=20
>=20>  At #1, if the verifier doesn't remember that we wrote 8 to the sta=
ck,
> >=20
>=20>  then later at #4 we would be adding an unbounded scalar value to t=
he
> >=20
>=20>  stack pointer, which would cause the program to be rejected:
> >=20
>=20>=20=20
>=20>=20
>=20>  VERIFIER LOG:
> >=20
>=20>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >=20
>=20>  ...
> >=20
>=20>  math between fp pointer and register with unbounded min value is n=
ot allowed
> >=20
>=20>=20=20
>=20>=20
>=20>  All new tests depend on the pre-defined __BPF_FEATURE_LOAD_ACQ_STO=
RE_REL
> >=20
>=20>  feature macro, which implies -mcpu>=3Dv4.
> >=20
>=20
> This restriction would mean that tests are skipped on BPF CI, as it
>=20
>=20currently runs using llvm 17 and 18. Instead, I suggest using some

Eduard, if this feature requires a particular version of LLVM, it's
not difficult to add a configuration for it to BPF CI.

Whether we want to do it is an open question though. Issues may come
up with other tests when newer LLVM is used.

>=20
>=20macro hiding an inline assembly as below:
>=20
>=20 asm volatile (".8byte %[insn];"
>=20
>=20 :
>=20
>=20 : [insn]"i"(*(long *)&(BPF_RAW_INSN(...)))
>=20
>=20 : /* correct clobbers here */);
>=20
>=20See the usage of the __imm_insn() macro in the test suite.
>=20
>=20Also, "BPF_ATOMIC loads from R%d %s is not allowed\n" and
>=20
>=20 "BPF_ATOMIC stores into R%d %s is not allowed\n"
>=20
>=20situations are not tested.
>=20
>=20[...]
>=20
>=20>=20
>=20
> [...]
>

