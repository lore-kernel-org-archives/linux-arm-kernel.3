Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF387C98315
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 23:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qj9+bs6cuOoBlqZWY25mJTqCjRNyWKyN1e3Xy+xHVDE=; b=BS62ZfMtsvyBGuHjPfGwFV9JeC
	/KMigpLQBOrh7Wl1IDqmCVbgppa3iUpb6FKX40YPf/RzXyjiQVoUj1YF8oZQOSP8Uplzw6IwFAWIV
	e66cSlvNv3u84PY3c1fGywpLe8yeqcntRX48asQRoFZvfWfa8xtxelFU7TW+q3qyna0N9mzHZCzXO
	6EjAG7ZyPcPjMLY6gSvJ1WJyrQXyufXO9uVUp3ZWE4Jj3H098wXBliZ8M8T+lhU5TeRqH2ycCu387
	wyO6Eq9hkjfweTHKkHp4sbLhypZuQSKwMDmNNOhckjxSX3cSHuw3/WkE1whz7yetq2quGtqWSnz5t
	7Ckq01Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhc72-000000019Bb-1qmZ;
	Sun, 18 Jan 2026 23:23:16 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhc70-000000019BD-1CAW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Jan 2026 23:23:15 +0000
Received: by mail-wm1-x342.google.com with SMTP id 5b1f17b1804b1-47ee4539adfso30878295e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 15:23:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768778591; cv=none;
        d=google.com; s=arc-20240605;
        b=GxOb6TT0jOyUH7hmC8geLvFdEGbUEE2wqUBFIvxcpO+st8srpx2Wz2l1EolkLewtoS
         19e0q46KEpeSQWHNRFfH3oI+g2WztoVwjcMMH8wzXciivPNe/yy40gHqRvuyaSphu7RU
         4yHiN/Ens1rBync0oEUmlBeN7yWDXqhDPBx5DkNo3DB/tWglUj9JS9Cy4kIvZpe35h7s
         AWxIOKwN+uVFQa/yUlX+UpCF3DbRk2JK1w8RhAKXZHsuJRJwj4mVC3Kua7ywSGvZOumv
         carkgpvRmORKL/b3T6vCTHX/z8BEjA4LQ/M86H4Be3+FByylLh8FsTAHeOiJCLwBR6XD
         /Whw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Qj9+bs6cuOoBlqZWY25mJTqCjRNyWKyN1e3Xy+xHVDE=;
        fh=xMqHdk03pKtB4Mb4vRLXGWT2QHEcKtgxJiyVuzp9Ecg=;
        b=iDWj6yx2G1iljkbef154JhaFjzyuNX+XhofQrdGB7aLTcZjh9/+twd/Lxxg1f07GrK
         5GShcTGgq7XfXV0q0FalRexBLOGZuyQe5U6JtGb7ZU1L1ITz+rgivFKuN1Vmhg47CCfH
         GBsKpp5hsYiHzpGhxPzvbMAx2mP53dK8/HOphPTmO0cweoM0y4NFRkx/r5aCHCG21HhG
         A5unnyfIUOtrrqsqSeoa18N7vOYDOTWfgHMmDUiAZF3qnND153JY+OLylDqNRXkK6PFP
         yUPLdo0g9CH8sm7xyCyuwdV6NRosdPQ7jtIU5ox2Q1H5CCcIPcH64bvv23xJ7Z9BzfmY
         +r3Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768778591; x=1769383391; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qj9+bs6cuOoBlqZWY25mJTqCjRNyWKyN1e3Xy+xHVDE=;
        b=ZJVTogp1f4IuBJY1HsCNsC7HPwkwT7jZhE3lZ0Et/nF239aJDeBcivxaZzlCTJa1rV
         l7rcgnACoi2DsjP9BoVlqM/Qn4sUdwSzIZoRYXu3CtJFk/hvwEBRBk6tGjAVORRGWq7x
         JdfDZwcpybaZD3bAGOM7MkVMThO2ZZKJo2WOK+Oay3gWO6hq2Y28GXtuGJQX7QhcbvnX
         76haTopXOuVfFKNc+HRmaxUnkj5xmdVyuRl4ZukmMhdYOxYHAux1g6A4jsYsqpbDrBko
         YCA1EJDmD81vrOCo2EgRxs/hS63Tq9QdA6d9D4kLaJonH0fpHaYGhl3d96d7aZPLUFPE
         /O2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768778591; x=1769383391;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qj9+bs6cuOoBlqZWY25mJTqCjRNyWKyN1e3Xy+xHVDE=;
        b=mdfdn+4URiPNoQ2QCUGBOTPziMmo2pmhjxSmW9YtCYxec1+/VmmK0T3RIfQGewNZb0
         DkX0BVknxpY4xSkQzpIf7kQBAqraP0uw5E75rUL6U1/H/tEnUAcl1eqUYDl6l8cRCghJ
         5B+Lwlc6pWThzYHQiEyE09+B4H2dKjDKY0WblnX00e9qEwAUlBoU94OKbVLuUQqyMZ0F
         S8+EXOrjlUSEFS8ft/lDY9u+ZtaGNHIK64FmzTSGwS+qurCSyyfdH6TDZRojRjWMd1AT
         935wjUmNh++UocJdyItmZSiLH66/3iTTSibTbd9fD7l+jyruzFff+6cT9usxPKhqcGFE
         wGAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVz4z6fEpVe09tpi3U6YaKimJkg8lQR4mXFe5C018Hp5bkBbbjHmaDpd8x96MHRzbFuzNNPyEUlK1lrUQG3LAvH@lists.infradead.org
X-Gm-Message-State: AOJu0Ywg0uXPshabYtmwJ5hkJDJ5FQa4CiODuOTLUq2vP3+PDZ+pxTfi
	F+02AsLnR2tKzxBoM+uyT4EnCIcx1nNvXwKuOFP+KXURkBlrEMwzDXpQC5tMNiaEn94i7B3mY35
	14sHuDgHRAWS/Fvn/TloRY4LRenpOC5M=
X-Gm-Gg: AY/fxX52nonF82yHNWvXQoK/vls8xsetMfJgJ1G685RAnVKn5EYuZK3rnOZ9ouCOLy4
	7IIfdrme108h4R7FMlG1Tsdrl1W4xEmet2BUBm1CwzcY4bdVQiEKpLGqGqN/QHp9+RUFgCLm49a
	h5qbISnB04MKNMxeqQJpZsj+ySUMMkUx3HnlZItDbi9xsJbq7jj1MwApsSAXhjK0dsBnEuoyIrK
	IVLQeoGHjmxrcOLYgozILg7VIdTTaQACdk6g4JhtHOGfLpbDKjhMg8VILhhrpryMQqsooSutztJ
	46ONPnD7rhy5WXHn3pTlqSs3D9Yi8mN+RlxTaaG5
X-Received: by 2002:a05:600c:4e50:b0:47d:18b0:bb9a with SMTP id
 5b1f17b1804b1-4801e34dafbmr115818315e9.33.1768778591376; Sun, 18 Jan 2026
 15:23:11 -0800 (PST)
MIME-Version: 1.0
References: <20260114093914.2403982-1-xukuohai@huaweicloud.com>
 <20260114093914.2403982-3-xukuohai@huaweicloud.com> <2e5ed01463ae8f79780a42c4e7f93baeafd2565a.camel@gmail.com>
 <21aec5e1-4152-4d51-ad25-91524c544b66@huaweicloud.com> <CAADnVQLha64x_LQ1Ph+0dEdP2sNms71k41pwEVMwxrbBG78M5Q@mail.gmail.com>
In-Reply-To: <CAADnVQLha64x_LQ1Ph+0dEdP2sNms71k41pwEVMwxrbBG78M5Q@mail.gmail.com>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Mon, 19 Jan 2026 00:22:35 +0100
X-Gm-Features: AZwV_QhXNCnBfXpzOxaenytG-TJEPUUqlLt6PeHTKFkO5S-gYxj3GjU0W9a_p0E
Message-ID: <CAP01T76vdqFAa4zYBsDdijY==CrSJ=Qh7iki+y=2_G_EUBr+PQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v4 2/4] bpf: Add helper to detect indirect jump targets
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Xu Kuohai <xukuohai@huaweicloud.com>, Eduard Zingerman <eddyz87@gmail.com>, 
	bpf <bpf@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Yonghong Song <yonghong.song@linux.dev>, 
	Puranjay Mohan <puranjay@kernel.org>, Anton Protopopov <a.s.protopopov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_152314_353899_335C2D91 
X-CRM114-Status: GOOD (  33.87  )
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

On Sun, 18 Jan 2026 at 18:20, Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Wed, Jan 14, 2026 at 11:47=E2=80=AFPM Xu Kuohai <xukuohai@huaweicloud.=
com> wrote:
> >
> > On 1/15/2026 4:46 AM, Eduard Zingerman wrote:
> > > On Wed, 2026-01-14 at 17:39 +0800, Xu Kuohai wrote:
> > >> From: Xu Kuohai <xukuohai@huawei.com>
> > >>
> > >> Introduce helper bpf_insn_is_indirect_target to determine whether a =
BPF
> > >> instruction is an indirect jump target. This helper will be used by
> > >> follow-up patches to decide where to emit indirect landing pad instr=
uctions.
> > >>
> > >> Add a new flag to struct bpf_insn_aux_data to mark instructions that=
 are
> > >> indirect jump targets. The BPF verifier sets this flag, and the help=
er
> > >> checks it to determine whether an instruction is an indirect jump ta=
rget.
> > >>
> > >> Since bpf_insn_aux_data is only available before JIT stage, add a ne=
w
> > >> field to struct bpf_prog_aux to store a pointer to the bpf_insn_aux_=
data
> > >> array, making it accessible to the JIT.
> > >>
> > >> For programs with multiple subprogs, each subprog uses its own priva=
te
> > >> copy of insn_aux_data, since subprogs may insert additional instruct=
ions
> > >> during JIT and need to update the array. For non-subprog, the verifi=
er's
> > >> insn_aux_data array is used directly to avoid unnecessary copying.
> > >>
> > >> Signed-off-by: Xu Kuohai <xukuohai@huawei.com>
> > >> ---
> > >
> > > Hm, I've missed the fact insn_aux_data is not currently available to =
jit.
> > > Is it really necessary to copy this array for each subprogram?
> > > Given that we still want to free insn_aux_data after program load,
> > > I'd expect that it should be possible just to pass a pointer with an
> > > offset pointing to a start of specific subprogram. Wdyt?
> > >
> >
> > I think it requires an additional field in struct bpf_prog to record th=
e length
> > of the global insn_aux_data array. If a subprog inserts new instruction=
s during
> > JIT (e.g., due to constant blinding), all entries in the array, includi=
ng those
> > of the subsequent subprogs, would need to be adjusted. With per-subprog=
 copying,
> > only the local insn_aux_data needs to be updated, reducing the amount o=
f copying.
> >
> > However, if you prefer a global array, I=E2=80=99m happy to switch to i=
t.
>
> iirc we struggled with lack of env/insn_aux in JIT earlier.
>
> func[i]->aux->used_maps =3D env->used_maps;
> is one such example.
>
> Let's move bpf_prog_select_runtime() into bpf_check() and
> consistently pass 'env' into bpf_int_jit_compile() while
> env is still valid.
> Close to jit_subprogs().
> Or remove bpf_prog_select_runtime() and make jit_subprogs()
> do the whole thing. tbd.
>
> This way we can remove used_maps workaround and don't need to do
> this insn_aux copy.
> Errors during JIT can be printed into the verifier log too.
>
> Kumar,
> what do you think about it from modularization pov ?

Makes sense to do it, I don't think it would cause any problems for
modularization.

