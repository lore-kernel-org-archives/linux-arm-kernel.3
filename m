Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 946DBF3ED5B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Apr 2026 17:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E8BI6rhlMtlSuplpTUVFQcStsgNDWUSIkfvD3X7GsUM=; b=KlVWN9xmItdIGSyvu/CAzof8nI
	IaPk9Z9hmDTkVLg5GSzlmJLws1rDV7U6tXBne5e6oGuqFawzdJ9k0FhOBLFrXZftxe3g9AiWG5V4I
	bZZ2G1s3sQPtmH/jm76S+bbHxpZHqXtor3s4O8jV+U+m641v1kFfuKmqjNk2dLQeu2Qx4sZe+LXCh
	11EeGBPKVISoHZpk38FVmiwgd7Om4rPyqjcbuxJNa9NOdOEZ4ixhfsQTDQbUMYQnYN8sK/V9WOmIK
	SCShQuLeuc2sVgv+kRH8YP/jgBTX3W9gqOnWPPe1DlzstoPyDqI0mbB66km1kAFiU2FlkTjcVhEc/
	TF+QKl5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBbs9-0000000DfAz-39Qn;
	Sat, 11 Apr 2026 17:11:53 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBbs7-0000000DfAA-1Ixm
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Apr 2026 17:11:52 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-43cf5ad500fso2550312f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Apr 2026 10:11:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775927509; cv=none;
        d=google.com; s=arc-20240605;
        b=GtRfr9Hms/FIlHHDQnz5x1Zipx8tkQszTyPs5/wgOz10K9GA5pDrO+/KNlfR+W2ruy
         c5Dm43jqEh0h0hE+lePdGuB+W7+y+W8UVfNi6eFxRK85D9lwH9Kp1JYU55d54lLqDCt2
         s6W8CggzgQrhCNb7LOG2CJNxd9801+g7sYRxrUGoK81lZs8FBwUeC2osl0sJojo9k2fG
         LsPqnk7FIXOT83ooZgQ4I857cI2FoaABReb5kAn2GnbH4wvY+QfL1WLjgNXODy690dZo
         hKEfJ5C7UHHqOIMdwie9dN39dK6cBVyBtOfC5JsNRriq0M2nodSClIgZKwtN+uyu/2ZJ
         o36w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E8BI6rhlMtlSuplpTUVFQcStsgNDWUSIkfvD3X7GsUM=;
        fh=n7sB2m711Z7YppfYVeknkGoMJyz8fJ81ysk6saLSOW0=;
        b=DCw0vvuBsgwLUYYtWdLmOj0TqY/fPiusiPpT69N4EnkBx/xg99vmRaxbAjDC2ZQLp4
         Tl/3A7y4rqzQLuu4zun2P3+gygR5jSI+6rmlOhnxadIV9PYjBSjsMUYFgCCYiEQw7VQj
         q9ixiuz8Jo41Y/n+jtAxZ5L1/k1j+02IVtIjwSf5xQYam81zB/6y/Neyk9JZbui6UtF/
         j39bj3NX7xye9tpbg9SSmWe531K4Np2JYGBg3HG9nbfQMnq1QPzigXROChc5W2OZfGFA
         KFmfxrfeHq9Zk9kcXtxdTNjOanEmMaNWlGLk4aKUPBCbrnnJIBgyye6wu8PuH5L2JI0L
         dsqQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775927509; x=1776532309; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E8BI6rhlMtlSuplpTUVFQcStsgNDWUSIkfvD3X7GsUM=;
        b=pcQJR7HL2QVJ3o1Sl1M2c6BCQLC+GPu1wDab+7tb5dYavGMbAiVuvV4esQb0FzWBtV
         Llkq0PzbYg19oSRzwztMA8pJ223f6xbAImTAh0mIym2Hmi1Bij4dw38/kmY1BMPmNYRj
         UiPr/xwyGc0qQGd8+89SnU88NSqBBDq6UkCCYuSMwfQFyuHtlwScMmy0RYFufelf5VCP
         HLBNb9+UE94cD4qmT3+C+0f/c81qJsbs9l1eH3gc6Xj0OrUKiG/T627ZlCo6+aRuuibe
         /HvscDBgwUjgGmdF+DLhkU39KlYYGYW/nIACi7K+AF3XFrbS2kU8X480qIjPjb8saj32
         xGnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775927509; x=1776532309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E8BI6rhlMtlSuplpTUVFQcStsgNDWUSIkfvD3X7GsUM=;
        b=p6DJSCvX9QERxxruR8ekjVID8pPr+b2sWAT9N9j/iqB3Y/YtnJ2ogrWDXWqanN5lXq
         H0CIYp7MWVEEl3puwjnJU1pm3gn+YkINOZnYyDywtYjZCVS9Nlad+tx8ZvBC9PuPvjH6
         3aw7QjQS2t0NxedaM2MEeAWa56TmD390QH7njX8SleLVZxh1otiGYGNYcXVprfj0jnA7
         YJGc7PGs50CYZsCYstBCAshpdp2kl9OpqofkFi0uQHalrkWwaPL63he6dpbsWpKvuTrK
         1lBW0arXlrAL8DY8B/aKv+KHCQrVOCDLWq0Pw2ZosVv1PsvPamywEEDPiL+Hqa5xo48J
         TVXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTZl3xOa1JbVBwf7uHZAcF1rCHplr59aj8yN4YABHxgzwdUFa5edVDGa3VcBa9/jJXwJd7WhrEcBhR9QMZW0Bf@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3L6sGpeGvSFNadIccg951qgIEGPk5y7DySMO2r8CyvtFwTpyJ
	gZ7dVIVUkcALCNHyf7hgTDjagSvxa5Am+Y2hx7oK63tkT4t4HUIeNZXBnBbwLcWGypy7b7wtOHr
	v23ugyvti4jncFxVfUK/vnmoTNFWFhu8=
X-Gm-Gg: AeBDietPME3VP+2yW+jAmUE2yw5f+GjsOr8jjr82rr+VqFo1suymWi8ZBHkIc88AIPC
	cx9i1C2Kpgg2FEPiVK5gHnGANgi6L8Y36b45J427qVPJgqzNR7lxvvYA4x+Vrz5IK7M639c0RVA
	H4mmAWUVaidOUYr4mD43hPWo5wDBBaxfuzucfo9OsYnse+DmrqZhpWmfV9jszPmJ35tuj45D7id
	HAcSH/RFw7D8SKOhtGKPF62Slwp2yGSKyZFRI/R+JoONpAMh4t0CzoqdSHojtN/SLTxzageswJ0
	KI7tkGzBrTsPjF2+KCipIOa7wgOL6MMOg8GhOROYfD7W+2kbz8Uh78oiLHclx0x7Hbg1GHBlN5Z
	xGUVfLoCcLgLh2wfEZ6FCtcrm3Nr/rW97SDy/
X-Received: by 2002:a05:6000:184f:b0:43d:61:652a with SMTP id
 ffacd0b85a97d-43d642cd3f8mr10908143f8f.40.1775927508541; Sat, 11 Apr 2026
 10:11:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260411133847.1042658-3-xukuohai@huaweicloud.com> <e7535d00be73466e4a09621be0cc898e0ab76422427a17996e4d34712d16fbe3@mail.kernel.org>
In-Reply-To: <e7535d00be73466e4a09621be0cc898e0ab76422427a17996e4d34712d16fbe3@mail.kernel.org>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sat, 11 Apr 2026 10:11:37 -0700
X-Gm-Features: AQROBzD1PETSYrQ_4Ut3JAZoHyozvOBttmiXhABIYq9ciFQj2SBH_0deqnr1OqY
Message-ID: <CAADnVQ+482iOBCPieOVGd5yBdkBeSjVj75xehNAjeJJaT9rKqg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v13 2/5] bpf: Pass bpf_verifier_env to JIT
To: bot+bpf-ci@kernel.org
Cc: Xu Kuohai <xukuohai@huaweicloud.com>, bpf <bpf@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Yonghong Song <yonghong.song@linux.dev>, 
	Puranjay Mohan <puranjay@kernel.org>, Anton Protopopov <a.s.protopopov@gmail.com>, 
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
X-CRM114-CacheID: sfid-20260411_101151_400410_68F589DB 
X-CRM114-Status: GOOD (  18.76  )
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

On Sat, Apr 11, 2026 at 7:43=E2=80=AFAM <bot+bpf-ci@kernel.org> wrote:
>
> > diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
> > index 3fa3c74869d0..bd96b3a01b99 100644
> > --- a/kernel/bpf/core.c
> > +++ b/kernel/bpf/core.c
>
> [ ... ]
>
> > @@ -2553,46 +2530,53 @@ static bool bpf_prog_select_interpreter(struct =
bpf_prog *fp)
> >       return select_interpreter;
> >  }
> >
> > -static struct bpf_prog *bpf_prog_jit_compile(struct bpf_prog *prog)
> > +static struct bpf_prog *bpf_prog_jit_compile(struct bpf_verifier_env *=
env, struct bpf_prog *prog)
> >  {
> >  #ifdef CONFIG_BPF_JIT
> >       struct bpf_prog *orig_prog;
> > +     struct bpf_insn_aux_data *orig_insn_aux;
> >
> >       if (!bpf_prog_need_blind(prog))
> > -             return bpf_int_jit_compile(prog);
> > +             return bpf_int_jit_compile(env, prog);
> > +
> > +     if (env) {
> > +             /* If env is not NULL, we are called from the end of bpf_=
check(), at this
> > +              * point, only insn_aux_data is used after failure, so it=
 should be restored
> > +              * on failure.
> > +              */
>
> This isn't a bug, but this multi-line comment has text on the
> opening /* line. The BPF subsystem preferred style places /* on
> its own line:
>
>         /*
>          * If env is not NULL, we are called from ...
>          */

AI is correct.

pw-bot: cr

