Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 236FEEFCE5A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 03:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DSMQoK9CKr+LoofYVBjOMA1G+9sSOQ945cuPkJEnW+U=; b=OC9JYqBcTWn12RTwzc+MUUH64I
	TTLON9ppUaMFFUm2Nqv4XCBIJa3CxRqeTIMSeXsXuRe8sgRhhiHtPiEVQyAD3JzZkca5o0lZnLXFY
	j9NdCpRD9f+fGsdO8OBX8G4OUd28WHvkAHZMxSKZZGteAY+NqUk1XfNeyvTRNY3Xcstvn2q2OJ2kJ
	arsYj3crkUwlUIGJ5N45cp0Iyxre9oaRJ+JlT7FrfzPsH5j4f4EqCJYZsMrO1gl9M54rWSk2cV7xa
	NvDSvTtniQaBdvcQbwD7Bq1rar4Kz05uyd3fbszioFG5xen2jgcmCspl2r/a5iebX4h4qlbrIcKCA
	OqsC8rew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxzpD-00000000sbY-3Sh9;
	Thu, 05 Mar 2026 03:56:35 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxzpB-00000000sbD-3SLq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 03:56:34 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-439cd6b09f8so320388f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 19:56:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772682991; cv=none;
        d=google.com; s=arc-20240605;
        b=d0hwsBixhIgsrh8A02vgSpKPVhWQwAwqes/4SD3jRZ+BqJui8hizWBAHX0bBDvl6Lr
         7FNGVdv0/WRpBNdD5HRJ79Aj7H2Zq3+kFKlq3GDZf4QKqJvjCo9O6VrwK7GPMjVzrs+d
         EmC+CV5GCmB2aI0NgxU/w8nS0Yxw/091ARI/w5Bk5ozGpqlBU87aGw8Oqzf/Z/WNgds9
         uh3i3c2Rxvx6XF2VNKif4VssPtdzxDuKXpTnAf4PNZES+1DuuOcAZHCC3sYlhadxIjBW
         DsLWsnXr6xHbJQiyyqGG8jiZPZw+x7/SbIPr+dismPz+b7DnNSA6uMha/K+zkgyf0kjD
         48BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DSMQoK9CKr+LoofYVBjOMA1G+9sSOQ945cuPkJEnW+U=;
        fh=E/bXuuJtggsgizRwX2xVq4uW6pVKlSLe1xIa4RS4zpU=;
        b=P95CvmQLoMaKVTY+UgZY7oNh6exWF02tdzqVbLF4KzUhpU1QGj3xubGJPAhaXiHmVI
         iYE3NfQPtVq5SQAP5lxgNDpy1kOYC6a5fL0j1OOPkJ37pnjocytt0WRWAM0UaRciK9f5
         YMNxRNQdOvK0tXUD3wvxzvtVJNlev9gpqDj4IDeK7o9ZAbF5UFoAzg4x5+FXGqfOsVs7
         7T9NNokW+CMUjjtJMkNN89pRpboCrong0kbhGTDOITx4yMGj6hMMPCktEFZEpdnOxACD
         zMg5lsvpTJUi/wQEJhDUy3xczt4kcwY5MFuHKhpKdBK6MKKT/e4EvPbFpbVK8XcC5tYi
         8U0w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772682991; x=1773287791; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DSMQoK9CKr+LoofYVBjOMA1G+9sSOQ945cuPkJEnW+U=;
        b=JwCJtfoNT33tKcqM0XZa3Euz+6KFYswB4WU6yFaOiAiszVOSroJNBJdiMw9WP6kzZs
         vXPtz4mXdEHK34bwus2aVLVjPn0QxQhxzZDcZSekrv73lkb1Mm0Uy7MSfgJf3fLOMlfg
         vOcxtJz93fjkHWU7cP55k4xD/7c4RXI3Psw3lc3jcubCoWGtdJIjyv2662juOlB4KtnE
         YcbE1VkZVpMeMAPEksEvDL6ivs3Es6qUMbBkdh4NtUu0IHxETjocA8xVZR3z8zI+DgT7
         jfzYpRkhMku+zJCeKNh3KQNfkImK5KsnotaH9kbyqpzprrGrcRHMVZATyaYJXdKndZUh
         2Pqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772682991; x=1773287791;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DSMQoK9CKr+LoofYVBjOMA1G+9sSOQ945cuPkJEnW+U=;
        b=X0XQgDWphf4PCSYYbDTxxplsbgJ0SFDLY4Kku/XF3LQW2fN0Gm8iOSIfDzo/OvaORU
         2H2CrrdmnsxpjM7vztWy/2k/Ifnf/3qs2uiGqwgNRLQDNCRsF9NO4Yt4BCaG4h7CALnz
         Pjhb2foYskc9NDMOSvwb36xO+xUxUbYsWAC8NZFe2clun/1cZY/S+0QkOqhxwhNDDfm3
         njmybmydnbGoguvFO9k+W03o9qxkbUm5unrDuTxgpQm7NHm1Zg/8ykjaVY6QsPryrro3
         JWujNlSaQGVFZ2z+Gop7rE1SyHeAIsYUXXcL8h8S1QXB2ep44AgG/wzo/wZYLmaxE6zf
         5scw==
X-Forwarded-Encrypted: i=1; AJvYcCXmvOvQuCb5d6/NTyJZjfXZ3trDZbVPyBgmNpSLwSTihGxJHlJ/9osPXxzytsACY0W3l1WEfCmFx0fSo7NhRJFs@lists.infradead.org
X-Gm-Message-State: AOJu0YyYvAT0eAO0PNW6EkQMkFUKOxl1qYlUd255/FgEjD9zx4yOJc33
	4O21ziALDMkOi4oBWJYIpwNfq26Crl5R4TxwwHG4lgru7ptieO4TTQLwv3+XOTpwczeRbcU7Q50
	UX0ewABC8gGFQVjTHjyxZWEgvpxJb4KM=
X-Gm-Gg: ATEYQzz/LaKMmtU6u7YLePbR/kaqXXe8zAGB/UIhHqdwma1JABAdEDJYy37FFHEpgYG
	NuKHJdxeR4hdIYtlkT1YhWPzbnJsz90YvSScnuGBEkUEMq6PNH4Zk1exYmc4c921chUpWrjcNE8
	M393lMg6RguFZ0lWBC9cXTCErRr9teeTS/2HNUa58i1wQy0PTJiirmXrjNJeFj0nrwxjsU1j79Z
	U2x79xA7+wmL4xQ+rsm6QaMQMX1O4i1atK/FlBEA86YpD/4KvJuTxEqZYPw/mQdmV01j/F3XkDa
	95ZZBnBxyKTyEMzxumU9EfvP3E8aJyLs/UDYR+8LcNaShu94mDH9KEZenuqypaM9A1aLa5B6QPg
	3sQH+e3kQJlG1NvZ/ErALOoi/LQ==
X-Received: by 2002:a5d:608e:0:b0:439:c92f:ef35 with SMTP id
 ffacd0b85a97d-439c92fef50mr5426026f8f.17.1772682991134; Wed, 04 Mar 2026
 19:56:31 -0800 (PST)
MIME-Version: 1.0
References: <20260302102726.1126019-1-xukuohai@huaweicloud.com>
 <20260302102726.1126019-4-xukuohai@huaweicloud.com> <CAADnVQLoWzz8ioVg3MFjn08fBLfNq6HdvqLtqXV0zUb=SR_HGA@mail.gmail.com>
 <1ea52c33-ae27-45fb-b4ff-0c4637a4312a@huaweicloud.com> <CAADnVQ+HvsZ0zr6AGLBhMOVX1uRKwRqV28ywcvpVkrsDTyaXmw@mail.gmail.com>
 <0f18b3b1-9bd1-4ce8-a7df-c1149cf6e14d@huaweicloud.com>
In-Reply-To: <0f18b3b1-9bd1-4ce8-a7df-c1149cf6e14d@huaweicloud.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 4 Mar 2026 19:56:20 -0800
X-Gm-Features: AaiRm53xbp8-NAX3A4O1s33pD9uNRg2yfLWGq2t7tCn5lWZ6f21ccsyp9hyEmv8
Message-ID: <CAADnVQ+ryOMoDUAhvDMJYe_mh_gt9Wbe4Vcb+A68tty=RZCtrA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v5 3/5] bpf: Add helper to detect indirect jump targets
To: Xu Kuohai <xukuohai@huaweicloud.com>
Cc: bpf <bpf@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Yonghong Song <yonghong.song@linux.dev>, Puranjay Mohan <puranjay@kernel.org>, 
	Anton Protopopov <a.s.protopopov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_195633_926547_E8F5D617 
X-CRM114-Status: GOOD (  21.63  )
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

On Wed, Mar 4, 2026 at 7:47=E2=80=AFPM Xu Kuohai <xukuohai@huaweicloud.com>=
 wrote:
>
> On 3/4/2026 11:37 PM, Alexei Starovoitov wrote:
> > On Wed, Mar 4, 2026 at 4:46=E2=80=AFAM Xu Kuohai <xukuohai@huaweicloud.=
com> wrote:
> >>
> >> On 3/4/2026 1:19 AM, Alexei Starovoitov wrote:
> >>
> >> [...]
> >>
> >>>> -       for (i =3D 0; i < insn_cnt; i++, insn++) {
> >>>> +       for (i =3D 0, j =3D 0; i < insn_cnt; i++, j++, insn++) {
> >>>> +               env->insn_aux_data[subprog_start + j].final_idx =3D =
i;
> >>>>                   if (bpf_pseudo_func(insn)) {
> >>>>                           /* ld_imm64 with an address of bpf subprog=
 is not
> >>>>                            * a user controlled constant. Don't rando=
mize it,
> >>>> @@ -1512,6 +1542,8 @@ struct bpf_prog *bpf_jit_blind_constants(struc=
t bpf_verifier_env *env, struct bp
> >>>>                            */
> >>>>                           insn++;
> >>>>                           i++;
> >>>> +                       j++;
> >>>> +                       env->insn_aux_data[subprog_start + j].final_=
idx =3D i;
> >>>
> >>> You're adding final_idx because bpf_jit_blind_constants()
> >>> doesn't call adjust_insn_aux_data() ?
> >>>
> >>
> >> Yes, I added final_idx because insn_aux is not updated here.
> >>
> >>> imo that's an ugly workaround. Just call adjust_insn_aux_data().
> >>>
> >>
> >> If we adjust the env->insn_aux_data here, should we also adjust the gl=
obal
> >> env->prog->insnsi array? I think env->insn_aux_data should remain cons=
istent
> >> with the global env->prog->insnsi array. Since constant blinding only =
rewrites
> >> the subprog's private instruction array, updating the env->insn_aux_da=
ta
> >> causes a mismatch with the global state.
> >
> > yes, and subprog starts, and pokes that bpf_patch_insn_data() do.
> >
> > blinding was implemented long before that, so it was never updated.
>
> I see. Since env->prog->insnsi is rewritten by blind_constants now, would=
 it
> make sense to move constant blinding to the beginning of jit_subprogs, ju=
st
> before the global instruction array is split into subprog copies?
>
> This would eliminate the need to invoke constant blinding per subprog fro=
m
> the arch-specific JIT, simplifying the overall flow.

Makes sense to me.
Since we're touching all JITS, lets remove bpf_jit_blind_constants()
call from the too and do it from generic code.

