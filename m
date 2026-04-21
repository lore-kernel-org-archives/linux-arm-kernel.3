Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D64F8FA61
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 11:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YVPaS7F82I+fa/wQlu1iuZvNksosUMMwWhC1cueKpN8=; b=aeQIQlymN2HgIWqr3FPvZpjsQY
	wGYIP47nKi8c7geW4UtwZFpzBoIJnYoC43f5T/mZKiYAZraEKx+WKXkGDBkrvBrI7nIK+qvX2Z8B3
	GSfPO4HkV2e49wjP56QPfi+usJOFXj5ihOdON+8Mxgk8NoQ7SGS9MlDx8SkYJXH++C4My0Jq/Un3w
	5c2ZOhg2yQOCJRQgZ14zBN8FSlElfnIm5TDEKCRG8+BQyNKvritraOXRkUzph32eXfCWvQl6lZJFa
	K+4TQqZ0obMxIdKnVCpIxVAfM5vx3OrwKyNfsWpbdKOPRhYUKwoUNbk6+SydRJj78LKcHB9Cownmu
	CONXzjaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF9fv-00000008Yfa-26uh;
	Tue, 21 Apr 2026 11:53:55 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF9ft-00000008YfE-0Hld
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 11:53:54 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b886fc047d5so756782266b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 04:53:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776772431; cv=none;
        d=google.com; s=arc-20240605;
        b=MOvSDC9dpNH9Qf3dL5tZbGT01bEtDNfODEEJDjFiALtiy2C3XqDWJJbRS0y6X8uiOX
         aAtVzy+nHN6GHVy38cWZmL6Buc1W4gG5Fg80zTuejjHKF1VyRLQhdbHO8HBLWYGwvNmB
         ehXB4qg0FMpCNLW85006pXZ3dKwJuPTaeMlo5DaKPyYQE5sVBcpFUYA7p80z7nb/6Z9N
         k/c+7q1WmHt3UTp0qG727X8WIJ4uIHEu0Om61MS0Ak+eObQH2aoYOx+jKQRE2leH7Z+F
         nqjy2XbTHfnk1Mh5JcxUWnLQdUnGpWm/IOqdmHqly3rJYTNYLM6HvrNyn4S5kWbqvSm+
         +X8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YVPaS7F82I+fa/wQlu1iuZvNksosUMMwWhC1cueKpN8=;
        fh=BqiwRU5cyb5qT8wkG5vBsuaDbEwnxhYX1Dd5Ym4iWL8=;
        b=YkIsqnETbCKWe+/ckLr+qTA94kQT4E0hX26D+XQyMYVo/V/6ASHixMry/H3GT5ZZM9
         4vhxUvfiz+VqVX/79GHcCpKqyBQDTFR9h5DyugGxpyOJmaPJLb5+C6NVbkx0j0qDxelU
         3CdyPTDWdcap/HaT/DGBntB8hvhZh2KReeXJqyOAM6NTZ2LjTlnq+JElmoJHpgtyBHS5
         oeqIq7hzf7qWjnS9+ZCXW6P8nB+Rsazd1xKcB9kuqz+E6XJE1285xJhQkh0veUqcQmaM
         6V2yXxHSNajJN1N9re950MT+h3wotxEIJnPhtGqvGSLbk6CKzTc1Gq9LZ+Bpx6aUO61T
         94NA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776772431; x=1777377231; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YVPaS7F82I+fa/wQlu1iuZvNksosUMMwWhC1cueKpN8=;
        b=bp1Oa+AODWABo/iBcd54QPNiFi9hZR6LGDml7QWHc4K+NogQMDysVW89zvb8f4VMnt
         YeYdJ2Z213eD4qBz0zxEKp3fdZy/OwR2pj8crLvW+xTDRaBOms6j62HuJGaFkZxSPIBy
         bPcS0z1RbU3rPFP8wIIQGXzOB1BRyjlZZzcnnEAAc9bYW0x66untxX4wtavazjVw4W1P
         6nZonklcWhpdQjEFwEKgFD6BqRuTF616YuXX/jhy3qgGHd+7h2On8UV40MzoMgFC04zs
         RTnG1HARs5S4bxz3cLgKUNyUKRp6hZjY/WmAlTMIsAE2jqZXuQvZBoQGMrkksQ+Fu37O
         RUeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776772431; x=1777377231;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YVPaS7F82I+fa/wQlu1iuZvNksosUMMwWhC1cueKpN8=;
        b=bJMuwpBZMmny+2tcVIZfCVvP+UxLdHQouz4dZnrLQauEvfKZlSwjrjYU3BaVRT8n7s
         uFiqXRHSpyKoYSp8T/W11ez3nOR+26IlQKyRO8n+41TqgoYu+RsZQBm47h/lW3sqtKw8
         MVFy8XPECdUtHP1ioTCcq47ed7C7zivOqcMpFR8r4LfTzpi7f9Aypr+Ffn4Paag6iDWv
         zgBXUfpR/cDAVGRqF5Zx/8JyZ5JFbPSoHuTFrZZWSfU63j/oifcanItOlN2Zp02IQoGK
         PFxPAKUWZkiDU9L6ELP3nragfsxyEKTDi+rEjjjWyJi+KXn06C6ivtnWfxI2C8lS6lKd
         bd6Q==
X-Forwarded-Encrypted: i=1; AFNElJ8BstIiw9/u6fcmpZherjgn694pYIT+m/LhjHvkp0R3njUZXIAXvqCN0ZNPRhU6IwTxPwxPEkbZk5Ob1gSRamc5@lists.infradead.org
X-Gm-Message-State: AOJu0YwDbuiq551pzFqywSNrLb54cfcxIIVGVf918g63HJuJ0HRsvF9E
	pe9CDfZcI9OUOaP2r6z8SpCAC0tpcxt5CFFv4wFBcp0loD8n7k3B/lXxZCkGgmzIQDwipZiS0xv
	Mwmu2y53dt6cI6QTIIW0+W+A2tG1S4L0=
X-Gm-Gg: AeBDieuRWQIz6xgybX5q9/PrwzhmzgJhX/Z474OV+bEokZi4umBrFCCqEoQyyXFDklK
	PEQvZ7LjnZmIIQpxugwQ+wiWjxFsZnCSQLZB+ru0bP9XAD081ut2ABifCGmNsrtxz+01dMyZ8dh
	EJfKrcrC2eukabcYnKr8SI+jHS9dHTb+rSptG1d3gv1OPsy2lau97ouL2psylz/583i6D4dplRe
	7gEswhPucP487U3wHYo+6hsxnoZFVo1m723h34hznU+/9GJ/l0XLF1JbKLYGsOGHHDMgLzQYmYw
	LjSjOQ+yvwfyZIhGokQg/FhynxG0OURfbse7ADkv+KP0ti5cX45h
X-Received: by 2002:a17:907:da16:b0:b9c:afde:9b59 with SMTP id
 a640c23a62f3a-ba41bad0086mr877460666b.8.1776772430297; Tue, 21 Apr 2026
 04:53:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260420153603.4097618-1-puranjay@kernel.org> <20260420153603.4097618-3-puranjay@kernel.org>
 <CAADnVQJ_D6XyvMHPr59dxZSgFY3+6UayhcWrDC-U2k-Epv-9eA@mail.gmail.com>
In-Reply-To: <CAADnVQJ_D6XyvMHPr59dxZSgFY3+6UayhcWrDC-U2k-Epv-9eA@mail.gmail.com>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Tue, 21 Apr 2026 12:53:38 +0100
X-Gm-Features: AQROBzDMBnDZlE1GQiV69BTv7CUF26NRR9MAAXFOt6v0yL9UPZlAUh-2o20pDdc
Message-ID: <CANk7y0gNqm7U_0Kc6ZP9jd19gHKScOaTVDa4yxkxTVDonM0iUA@mail.gmail.com>
Subject: Re: [PATCH bpf-next 2/3] bpf, arm64: Add JIT support for stack arguments
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: bpf <bpf@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Xu Kuohai <xukuohai@huaweicloud.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_045353_249880_DBDAA9F0 
X-CRM114-Status: GOOD (  16.94  )
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

On Tue, Apr 21, 2026 at 3:58=E2=80=AFAM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Mon, Apr 20, 2026 at 8:36=E2=80=AFAM Puranjay Mohan <puranjay@kernel.o=
rg> wrote:
> >
>
> nice and clean. I like how it maps to arm64 calling convention.
>
> > +       if (prog->aux->stack_arg_depth > prog->aux->incoming_stack_arg_=
depth) {
> > +               u16 outgoing =3D prog->aux->stack_arg_depth - prog->aux=
->incoming_stack_arg_depth;
> > +               int nr_on_stack =3D outgoing / sizeof(u64) - NR_STACK_A=
RG_REGS;
> > +
> > +               if (nr_on_stack > 0)
> > +                       ctx.stack_arg_size =3D round_up(nr_on_stack * s=
izeof(u64), 16);
> > +       }
>
> I'm struggling to understand this part.
> Why do this when this func calls more than what callee passed in?
> Looks fishy. I'd like to see selftests with more than 6,7,8 args.
> Because only then this logic will kick in?

Your confusion stems from the naming of "incoming_stack_arg_depth" and
"stack_arg_depth" (this should be called total_stack_arg_depth in my
opinion)

So, if you see fixups.c

                func[i]->aux->incoming_stack_arg_depth =3D
env->subprog_info[i].incoming_stack_arg_depth;
                func[i]->aux->stack_arg_depth =3D
env->subprog_info[i].incoming_stack_arg_depth +

env->subprog_info[i].outgoing_stack_arg_depth;

prog->aux->stack_arg_depth doesn't store outgoing stack depth, rather
it has the sum of both incoming and outgoing, that means if a func
doesn't call any function with more than 5 arguments but receives more
than five arguments, incoming_stack_arg_depth will be equal to
stack_arg_depth.

if (prog->aux->stack_arg_depth > prog->aux->incoming_stack_arg_depth)

This check is for - "Does this function call any function with more
than 5 arguments", if yes, is it more than 8? if yes allocate stack
space, otherwise stack space is not needed because argument 6,7,8 can
live in arm64 registers.

I hope this clears the confusion.

Thanks,
Puranjay

