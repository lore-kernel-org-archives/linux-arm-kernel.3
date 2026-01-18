Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DBA3C9832F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 17:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jbVT+n+hXWyHCV2WZg3Nq6x/sxk23UNrTtH/JUKPBJM=; b=CoGet03bybiEyQzP5ny40YPG1i
	1nImr9Wfkj6cRyKH3/xiBHhpF6qKiz0vOlbBahc4TcPhZ0Ikq0qTCV7rzULggyd+WAAJgKxqf1ZSN
	bzeuUWl9nWxpcifaE9fIfpREbr4ANpqv6bR7nt6O5DjBYmmYq79Feodiw2rFIXj9F/vGb271v0KV/
	7fuYKFhRpDJc5KvvP4dDB/5m6ZdX3FOU8wqq99zx8cgOM+dMVYc9GrVEVxUT4Gn8SnoB55InI1BAA
	kEb1Vc/a8UpIDNZkiCaVN27DseU3T6egmSIoff8yosZMLnSvE6HK5IgZRn6xOG39lMuGkfP5CcvrU
	29G4G54g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhWSP-00000000Ztj-42ZX;
	Sun, 18 Jan 2026 17:20:57 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhWSN-00000000ZsU-2Ghr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Jan 2026 17:20:56 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-42fb0fc5aa4so3098744f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 09:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768756853; x=1769361653; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jbVT+n+hXWyHCV2WZg3Nq6x/sxk23UNrTtH/JUKPBJM=;
        b=AD5HwUYwW3bbWV+1oKT0X5YSRmHcOszDRrDawIdJAhYCPvH1ADcsFT7/djlFITO3mu
         9MeRox8ZPgmAyYSTTIyCudG81tUJBKHpY5KSzE63HSSqe1VVOFliUmS0AF3XuR+UGcPU
         wZnbMS9jyCbeLCCP3jvLfhGICbXKtVrKOZxtNAr4c1stjxlnpNj+h0vR8tNU00PF4RLp
         DgV62ANRVal9J99IVWex4RAWNk86f6aK1dQUl6atj4eXXXyIhlgXeU16h4nQsJj0mRJb
         bzk7mYtEw/yW0izT6gGjZoG3jJr4BoFVjhDzsfvtT6vqu8Sso9CxCNyJ2LvPLyckQ/1N
         wvoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768756853; x=1769361653;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jbVT+n+hXWyHCV2WZg3Nq6x/sxk23UNrTtH/JUKPBJM=;
        b=GepU2BrFyR6VXUv3bDr0IimdqTMquBjEY2wzOT4GlMx4ZFxhWVvTM5xSfk34GGyPK0
         +UtsjI9Kg3TyNZZDzX+AoHUJPiRzpA1jcr2IT37GgJXejtth9IuhgtUYGPnFtNZo68JV
         8HcAHVles4IaefxDHvlkXA0rOirE5y7MVeiQUeruDhlmaZMy61XFjH16bm377FCvJgxi
         EckRhHJnKAfpxAC4rGYPNzF8G6B8CfAgmj4St8/WJ5USkHg0s6IfB08kEAwZ0OPyO0dj
         /vG7w2GciobFRHoSK2WE30xPlSTdfQLk9V2icY6aXhNikn7CXA6/8ctflgDlMyLsx5GW
         eAEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOpjGXFhdeGC6H3zPTYaVfMDRCFrUOzFV65WS66kbVdFim3u5YWL81a3A4KFukXRpZGOfKsSGnCXv5qZ/ZuRLK@lists.infradead.org
X-Gm-Message-State: AOJu0Yx81NBPeMvj4mgXQjsw/Ua14MHSZUsoGXqmaTgvNgneR4hIMber
	bKpbgtFg9S9Lu69bJEDwvJz/GMX8FPo9S47/h3dTcFmj+k8MOphdy57yPQmnT5gC7hrLeTqtegm
	U6qDmRNZpMl+6/e/YUin3hR+oi2aGRYE=
X-Gm-Gg: AY/fxX7aBOvCdmFNeSCGbhYP+KFtUu3Bg1I5EXtha2K+ec+HpNyg0mDXJ4NQw/kOP4l
	HiNw9sdRrOnm7AtJos6eAyD3m8cWeD6qlpBbKHn7882E6pGdID3L/nOW3WC12uSStDAA1NHgVxI
	n6ov8ErDnbBtwvxLoI0dnp+aJX/QTu0m92QIgdUNpjYjh58ZrevkLA04WKvKug7laqoiqFNGgyS
	KkS+qsUW+2tGfl7eNu+6YypBS73N8hOVQspqzpABjB4FnHh+bUaNaEH5bYp7roU/m8VZlL64JwR
	GDIrVg/0rEjXpTNsNKR+g8hPvZ4ZBuJWMxODkqBQBIryfkHpJJZ3ZRhuHTV4chxWbg==
X-Received: by 2002:a5d:5889:0:b0:430:ff81:2961 with SMTP id
 ffacd0b85a97d-4356a082ebfmr11458212f8f.51.1768756852760; Sun, 18 Jan 2026
 09:20:52 -0800 (PST)
MIME-Version: 1.0
References: <20260114093914.2403982-1-xukuohai@huaweicloud.com>
 <20260114093914.2403982-3-xukuohai@huaweicloud.com> <2e5ed01463ae8f79780a42c4e7f93baeafd2565a.camel@gmail.com>
 <21aec5e1-4152-4d51-ad25-91524c544b66@huaweicloud.com>
In-Reply-To: <21aec5e1-4152-4d51-ad25-91524c544b66@huaweicloud.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sun, 18 Jan 2026 09:20:40 -0800
X-Gm-Features: AZwV_QgbzSH8QhkIA5IBTf-o2R_jfbCedMdIqj5SuegXfrd15yBgYo1j3Yi0_sg
Message-ID: <CAADnVQLha64x_LQ1Ph+0dEdP2sNms71k41pwEVMwxrbBG78M5Q@mail.gmail.com>
Subject: Re: [PATCH bpf-next v4 2/4] bpf: Add helper to detect indirect jump targets
To: Xu Kuohai <xukuohai@huaweicloud.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: Eduard Zingerman <eddyz87@gmail.com>, bpf <bpf@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Yonghong Song <yonghong.song@linux.dev>, 
	Puranjay Mohan <puranjay@kernel.org>, Anton Protopopov <a.s.protopopov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_092055_628391_43AA0F8C 
X-CRM114-Status: GOOD (  28.40  )
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

On Wed, Jan 14, 2026 at 11:47=E2=80=AFPM Xu Kuohai <xukuohai@huaweicloud.co=
m> wrote:
>
> On 1/15/2026 4:46 AM, Eduard Zingerman wrote:
> > On Wed, 2026-01-14 at 17:39 +0800, Xu Kuohai wrote:
> >> From: Xu Kuohai <xukuohai@huawei.com>
> >>
> >> Introduce helper bpf_insn_is_indirect_target to determine whether a BP=
F
> >> instruction is an indirect jump target. This helper will be used by
> >> follow-up patches to decide where to emit indirect landing pad instruc=
tions.
> >>
> >> Add a new flag to struct bpf_insn_aux_data to mark instructions that a=
re
> >> indirect jump targets. The BPF verifier sets this flag, and the helper
> >> checks it to determine whether an instruction is an indirect jump targ=
et.
> >>
> >> Since bpf_insn_aux_data is only available before JIT stage, add a new
> >> field to struct bpf_prog_aux to store a pointer to the bpf_insn_aux_da=
ta
> >> array, making it accessible to the JIT.
> >>
> >> For programs with multiple subprogs, each subprog uses its own private
> >> copy of insn_aux_data, since subprogs may insert additional instructio=
ns
> >> during JIT and need to update the array. For non-subprog, the verifier=
's
> >> insn_aux_data array is used directly to avoid unnecessary copying.
> >>
> >> Signed-off-by: Xu Kuohai <xukuohai@huawei.com>
> >> ---
> >
> > Hm, I've missed the fact insn_aux_data is not currently available to ji=
t.
> > Is it really necessary to copy this array for each subprogram?
> > Given that we still want to free insn_aux_data after program load,
> > I'd expect that it should be possible just to pass a pointer with an
> > offset pointing to a start of specific subprogram. Wdyt?
> >
>
> I think it requires an additional field in struct bpf_prog to record the =
length
> of the global insn_aux_data array. If a subprog inserts new instructions =
during
> JIT (e.g., due to constant blinding), all entries in the array, including=
 those
> of the subsequent subprogs, would need to be adjusted. With per-subprog c=
opying,
> only the local insn_aux_data needs to be updated, reducing the amount of =
copying.
>
> However, if you prefer a global array, I=E2=80=99m happy to switch to it.

iirc we struggled with lack of env/insn_aux in JIT earlier.

func[i]->aux->used_maps =3D env->used_maps;
is one such example.

Let's move bpf_prog_select_runtime() into bpf_check() and
consistently pass 'env' into bpf_int_jit_compile() while
env is still valid.
Close to jit_subprogs().
Or remove bpf_prog_select_runtime() and make jit_subprogs()
do the whole thing. tbd.

This way we can remove used_maps workaround and don't need to do
this insn_aux copy.
Errors during JIT can be printed into the verifier log too.

Kumar,
what do you think about it from modularization pov ?

