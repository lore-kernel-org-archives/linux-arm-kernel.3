Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5559109C02F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 15:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N8Ha9bsXW8GmW/gx0ZbCJlm8QKxYvQfpM0vtpt73qP8=; b=jqmmg2VYufnblX4hJxp7z7saTj
	lGqYZdTNGC/pEdaU+MDYByiAODNl8tNMouY1NQ07ujB1yu5NLbaK+/c7PMLILS0jaI24ACEBIVUBx
	UnOdHYrYW+kKVauUJWJAb4lj4IVclR+IAtBhEXG2mjNLITVNihCGTd2QmPkeNwzLumPKyZxEJfRwV
	dDzwk++6lmDWj5m39LeJwxv1BMP+YAoExUVYucKpyYOU+SvnQUla/gyNn7+x/WTZMHvf46sdfqNGo
	xZu6RE2lPJuTJxkE1Bo2XIaCJxnIukR593dWvazrSi+IWtA9ezeLyay3SmGHsvb5C3/yj8ZV4zF7i
	4VdtvkQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Pu6-00000003kfs-43oX;
	Wed, 25 Mar 2026 15:12:18 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Pu4-00000003kf8-0pwe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 15:12:17 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-43b7481f9d3so2259352f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 08:12:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774451534; cv=none;
        d=google.com; s=arc-20240605;
        b=h2EavHvlGxdOZkBJe4C0C+u7UTggNN2mi2LY6UBZwA6GyOKkjcjTBlIQP2DFcA1r5v
         WOHvjEHqk60+kdHAk6V7zjVyNY5DrZM4oulIDdWsrzH3Fixfr/3s1ScKY7wAwQaV4EyL
         /6XHQmJqK/NrOljwBL2g+gaRvXgOxs2ataCUItvAmjdzMNCaMpbNsf2KacPhrhTlsDhC
         a7Xq7MzEPdlLWysPibWfWfznVDc/QKzRk0iXkINBUUcmDPmGQULjzVuqsmgkCQR5/AoG
         FIFbeIxiZZ8T+GnBUc6tO1T4gL+c6c2IGx1yelQ8hkl1ma4bPzECPxP2vzM8VYlp7R17
         TB3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N8Ha9bsXW8GmW/gx0ZbCJlm8QKxYvQfpM0vtpt73qP8=;
        fh=3/GTj4v2Ky8Sps4OvxA9iedgYqoUAykUfhoaQssQ2XE=;
        b=XcYbQXlvOXmZC81NueTZ0QYvn5e32a6hFpEZ41hdxhly5N+OjWxZgK7CCNAV8Lsupr
         HXLM/66HYxLYZq4MGzVykRWIQLw0xc/CeQgFAPQd7VzeDvzIZ4/iFRL74umVz/xF3Xx5
         Jmk1HYAxizyKDtMHtL/8j4st14f1M1F746H7jI/otpzp7HaqtVTygQM4DRZnIVUIAMwi
         /ci3ZTVk/hRDX0SZhaCNpuKqFptDN1YkDLTPWtetsEsOjUiaKLJ6lHtMIMT0QrLLnAia
         giETG58LUcVbG4z8511/46Kl+FPMO5cLewY0cqIM78W4G/5F6d8SZbwVucLHsK77EPfy
         cuXw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774451534; x=1775056334; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N8Ha9bsXW8GmW/gx0ZbCJlm8QKxYvQfpM0vtpt73qP8=;
        b=h+MOh29Bc6hp2J/5ZYy4zUECLAINYR2o8WUklO8dRZBkOc2+aLcKTI1DQ6VZU8/NX4
         2DhLSOJQleb1nruAINDKHE3ez9Ky8LIKgP7462VRNDOMhvTZzBmVD4GNwt+hak4XXa9P
         ql12TP/bquukuMccUiRd0boXim1sz5kwc/nFeahEfmAIwtM1CTLwZNHC+7EHE7tXQDo/
         D5YNviKQ5BgDOovXQcX2s/eaktHA/gxs0Rz6JyP/VcH6Ow4G7szuafCJxw6Es1hTRL6e
         JvUgd+d90IREAdOKlkHwehbo6wKh34s6Kw5mglPqXo0bNeu0zDF6wUPOfili8sCODwe7
         64qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774451534; x=1775056334;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N8Ha9bsXW8GmW/gx0ZbCJlm8QKxYvQfpM0vtpt73qP8=;
        b=a862LzVmo2MUyEXZWhEatXUL5UHhT81IC95HyzGc219kU84IklWt2102Zbo0lVVhbw
         1jiusNxZzBlzxd5C2FkGOd6jqnJgQHtFPl1HEiKcODaq+niuy/5fG5MO2wI35mzt6STx
         F3Sx8gGplkDnlqtnq7nQLdHZMomT/xJU0Stp4L88gB4vQ3xCKUAswxgQivbYfOcGVceN
         gloBNqtlKZn4rAT8v8PyMOm7qDUztDkLcjrbISDu6TFje8uoyciYbaopqKETlgEongGQ
         lg3tOPBrVnWeWA0/ckQ1WHIVPOwgtOox19ObMUR0sbWCqISsND96SHLFSo1i/1iSJkgd
         JppQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKvELi7k9xzoJK4ylGcCglINSHhp0aduFp3wicweEYVC7r4H5ETZt3k7ry2tccNkVj84XwMB98HJCwePU4lTB3@lists.infradead.org
X-Gm-Message-State: AOJu0YyYkCwr/xWN2iCKBHR5U0IIyrQA33u+24gKG1Szc/h0lLTHh5g0
	pTstqCRQ5xO6e0qudGe8BLgBygbX2IrPk4d+L23G8vjGDq3zFgpdUQNYum5ha4I6XL3QSmjNoTH
	/nc0wUg5chDmIvFe7avdFSu9izaanwKA=
X-Gm-Gg: ATEYQzzJo1FqYQikcKJsvAGakIYGzbFJARQUI/IQZfHh70VAPPm5C+dZXtfZTVqvgon
	Ju8+yJXYmDMUDYAHLVjVUQ+4EAJYvC/67ZouZIFSgJiGHOKf+qiZUP1fJHUjhfnAhhxaLCjQguV
	K+Mfu+/rcvMV/6JD+vgSa24z6/EA1yElB7F04zTfEhIqexkmGjJSjf5RsxkBOqmdUo6Jvq+9Skm
	N7A2cyCAyCjWuLwI0qB0+1nrhjkAnn57ZLQkAHjWtfaUEkdZoZfRSXk3RYJH76Fg9Tc+2ZMzfJN
	hq6z6RJMaOUtZBqNLAwUSQLFKUe38hEi5SmIT/QA4mN3oG8Ivq/FviI+4cySH7/JJFohR0J781w
	4vVR61+Lgo8VXgI9iJo3CiZOpvQ==
X-Received: by 2002:a05:6000:2502:b0:43b:50d6:4f04 with SMTP id
 ffacd0b85a97d-43b88a3db0dmr5558105f8f.38.1774451533418; Wed, 25 Mar 2026
 08:12:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260324122052.342751-2-xukuohai@huaweicloud.com>
 <edfa617891aa2e2980ecfb8037a7a4ed069e518bbce1777e331c737024feb1da@mail.kernel.org>
 <5b24cd1d-a8cf-4c9c-a0c8-c79c10ea80e4@huaweicloud.com>
In-Reply-To: <5b24cd1d-a8cf-4c9c-a0c8-c79c10ea80e4@huaweicloud.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 25 Mar 2026 08:12:02 -0700
X-Gm-Features: AQROBzCPaabh8daelQqDj3MUVAnt_BoyyKMWkVTLF5Mk4FpOAwGezRlTKeSEVGw
Message-ID: <CAADnVQJ01c5wkfcc7rOi+2X6KuLJCJ6A7H3aHAz4Spxcf_hV5A@mail.gmail.com>
Subject: Re: [PATCH bpf-next v10 1/5] bpf: Move constants blinding out of
 arch-specific JITs
To: Xu Kuohai <xukuohai@huaweicloud.com>
Cc: bot+bpf-ci@kernel.org, bpf <bpf@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard <eddyz87@gmail.com>, 
	Yonghong Song <yonghong.song@linux.dev>, Puranjay Mohan <puranjay@kernel.org>, 
	Anton Protopopov <a.s.protopopov@gmail.com>, 
	=?UTF-8?Q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>, 
	Shahab Vahedi <list+bpf@vahedi.org>, Russell King <linux@armlinux.org.uk>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, Hengqi Chen <hengqi.chen@gmail.com>, 
	Johan Almbladh <johan.almbladh@anyfinetworks.com>, Paul Burton <paulburton@kernel.org>, 
	Hari Bathini <hbathini@linux.ibm.com>, Christophe Leroy <chleroy@kernel.org>, 
	"Naveen N. Rao" <naveen@kernel.org>, Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Pu Lehui <pulehui@huawei.com>, Ilya Leoshkevich <iii@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	"David S. Miller" <davem@davemloft.net>, Wang YanQing <udknight@gmail.com>, 
	Martin KaFai Lau <martin.lau@kernel.org>, Chris Mason <clm@meta.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_081216_285902_95E27E97 
X-CRM114-Status: GOOD (  18.48  )
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

On Wed, Mar 25, 2026 at 12:47=E2=80=AFAM Xu Kuohai <xukuohai@huaweicloud.co=
m> wrote:
>
> On 3/24/2026 8:46 PM, bot+bpf-ci@kernel.org wrote:
> >> diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
> >> index 67eb12b637a5..8f52f4b6c3af 100644
> >> --- a/kernel/bpf/core.c
> >> +++ b/kernel/bpf/core.c
> >
> > [ ... ]
> >
> >> @@ -1507,13 +1507,16 @@ static void adjust_insn_arrays(struct bpf_prog=
 *prog, u32 off, u32 len)
> >>   #endif
> >>   }
> >>
> >> -struct bpf_prog *bpf_jit_blind_constants(struct bpf_prog *prog)
> >> +struct bpf_prog *bpf_jit_blind_constants(struct bpf_verifier_env *env=
, struct bpf_prog *prog)
> >>   {
> >
> > [ ... ]
> >
> >> -            tmp =3D bpf_patch_insn_single(clone, i, insn_buff, rewrit=
ten);
> >> -            if (IS_ERR(tmp)) {
> >> +            if (env)
> >> +                    tmp =3D bpf_patch_insn_data(env, subprog_start + =
i, insn_buff, rewritten);
> >> +            else
> >> +                    tmp =3D bpf_patch_insn_single(clone, i, insn_buff=
, rewritten);
> >
> > When env is non-NULL, bpf_patch_insn_data() adjusts env->insn_aux_data
> > via adjust_insn_aux_data() and env->subprog_info via
> > adjust_subprog_starts(). This shifts subprogram start positions to
> > account for the expanded instructions.
> >
>
> Right, but only the subsequent subprogs are shifted, the current subprog
> is not. Since we are patching the main prog when env is non-NULL, and
> subprog_start is always 0 for a main prog, subprog_start is not needed
> here and can be removed.

sashiko found other bugs too:
https://sashiko.dev/#/patchset/20260324122052.342751-1-xukuohai%40huaweiclo=
ud.com

Pls fix them all.

