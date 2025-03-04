Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A4C3C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 00:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=urfZQlGq/pVWGO0zyd3wt9oayIr9+WV6zda/5R7lTs4=; b=apbLByf/fhyVDGKVresqzHlJqC
	XOoaAUZJptp7cngQpJZs0/bhhfIcu2bzomSkK3OCu1L8AJ3hQeEQe/OaE9WzLv+4rSbh4psrgP3bD
	pGebNaZCOoyotFF/cModJdEO9XHEcafFjK4kZfbnuD41fMAOqADuIX58xzEJWA6UJGrMGEOCnqcVz
	VMwQCWGWgXrQa+C3uCRBHPEBbT4LHV7O5/65C7np0StnWPtMNcG8n2oIFFunrVkxyAmsCNEPAkNMJ
	4BRgFwFhLqumy/kH4O588SqSrDTUQFh98WlNwYsekbqqJsr+rF6xyrH1nIPLlpaurxmj//kPVF2X1
	+M4TCJ5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpG74-00000002ebU-0fX9;
	Tue, 04 Mar 2025 00:26:22 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpG5B-00000002ePD-2x8u
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 00:24:26 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-390ec7c2cd8so2405297f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 16:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741047864; x=1741652664; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=urfZQlGq/pVWGO0zyd3wt9oayIr9+WV6zda/5R7lTs4=;
        b=aUwt8AaPpktDAXNclOPiFCkqs54de7gTFeecje0CDuIzvT3q5+rfWQl0/yC8iLyML6
         YR5CaF/UdLDK3iSbLJP3kbueVwbZnru8YGeaKCFX/dCUN1Nira6fTOthbR4OG4Vr1U++
         PHYKtKLw9RMNE7i0mY3a8ky+8AafJfjHhfTXnC0n9ZZyo94MSTrk+iVlDJcD0qK9kmSF
         XrnfrOL6eMg7hy9Dzg34vXRMQoj+CVppGPxYqkFjyh0cbyC6eCyWGK1gFpiDHqQjA1L9
         klDQU6Sp6TFz4nCJRxeALRAbnmFwyHbiabc3E9N/+0LsQZLhWHc/a6VTjfKJFzwE+w6i
         0Vtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741047864; x=1741652664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=urfZQlGq/pVWGO0zyd3wt9oayIr9+WV6zda/5R7lTs4=;
        b=vN6kB53PPaqxBONydIDX08YEyuOzZVT5SuD//ldKicyqarHA+j/3dEUI+7dF5ZXy5t
         oy00C4yjXMdgsGyGiHP7ShRV3LWxhnr+2bWhyGUfBCdLVzJA3DuJZ8q2dxOPnxguVY7w
         YckqU26I5okhv7g9nz3IoYT96pEaas15cEjW+bRt+5YAjlhH6MGGLSZmgglnifVqoyMA
         YQhvmsz1YKhjwv/8zTvN8SgeM833tdrO3mAugRTKanFhF3wNzMWq1dDpvVqNq2Zc6C7f
         DayjEtKR5r3vJj0BAq1vNsnFXZ51luCQxJG4auUoPYKtyl6hG/nY4GN24T+r6aU5yvRU
         3x1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUP6D8JMNLvR8mbhFd35xJx7o+2pd5HfbBcc4rvfYo41xVXQ1ZQPpIvlrJ6c9eFiZSL3//sXpLdbeo3vgLLsN3/@lists.infradead.org
X-Gm-Message-State: AOJu0Yw37DBmzzJZ23FKDIUvmSdPWsBokfpu4TNM867IHovxB8jUHqdq
	zDb8QIH+sxUJO00kDL8pQ4l9xKaqqI5EylO9cA2C5j6FKP1sXFlZwT8AK5Qrk5md5mbHCU+Nue7
	XT9usNkxf5riyvPPfhnknKOrXlLqz0Ysu
X-Gm-Gg: ASbGnctoYmYFIROz/YNO51y7UzbLi1TiNgqi7etJgnrLbRk8o4U89r38xCfOwi7CQl5
	fx49kY26m3G0mYflGtRqN2l8zXRlB58XX+MXcgy1b7ee7R4rlx9zg7IHTVG6EK1pjBnT4e3tPFB
	Cnaro/d+ljCzuC7JpEx6jTygeTh8N4QdSGmA1OcEmf6A==
X-Google-Smtp-Source: AGHT+IHO+uVmNNZv/qkoEu5z4sgYhqObHiMzlFXLnOjF27YhrY281zOCVH1Tw0rSTwju5ncIQJYZex/bg3HsNm15TPA=
X-Received: by 2002:a5d:598d:0:b0:390:f0ff:2bf8 with SMTP id
 ffacd0b85a97d-390f0ff2f85mr11378429f8f.10.1741047863798; Mon, 03 Mar 2025
 16:24:23 -0800 (PST)
MIME-Version: 1.0
References: <cover.1741046028.git.yepeilin@google.com> <b0042990da762f5f6082cb6028c0af6b2b228c54.1741046028.git.yepeilin@google.com>
In-Reply-To: <b0042990da762f5f6082cb6028c0af6b2b228c54.1741046028.git.yepeilin@google.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 3 Mar 2025 16:24:12 -0800
X-Gm-Features: AQ5f1JrTqby__bpiM0CWE4k0H7GR2tFUkKqgrjo6SaastgWB_5YIMYTwEno1ALo
Message-ID: <CAADnVQKX+PoSUqPBB2+eZrR7wdq-8EVaMxy_Wur7g8wyy3Dcmg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v5 1/6] bpf: Introduce load-acquire and
 store-release instructions
To: Peilin Ye <yepeilin@google.com>
Cc: bpf <bpf@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, bpf@ietf.org, 
	Alexei Starovoitov <ast@kernel.org>, Xu Kuohai <xukuohai@huaweicloud.com>, 
	Eduard Zingerman <eddyz87@gmail.com>, David Vernet <void@manifault.com>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Quentin Monnet <qmo@kernel.org>, Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Yingchi Long <longyingchi24s@ict.ac.cn>, 
	Josh Don <joshdon@google.com>, Barret Rhoden <brho@google.com>, Neel Natu <neelnatu@google.com>, 
	Benjamin Segall <bsegall@google.com>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_162425_744175_5C1A50DC 
X-CRM114-Status: UNSURE (   9.32  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Mar 3, 2025 at 4:13=E2=80=AFPM Peilin Ye <yepeilin@google.com> wrot=
e:
>
>         switch (insn->imm) {
> @@ -7780,6 +7813,24 @@ static int check_atomic(struct bpf_verifier_env *e=
nv, struct bpf_insn *insn)
>         case BPF_XCHG:
>         case BPF_CMPXCHG:
>                 return check_atomic_rmw(env, insn);
> +       case BPF_LOAD_ACQ:
> +#ifndef CONFIG_64BIT
> +               if (BPF_SIZE(insn->code) =3D=3D BPF_DW) {
> +                       verbose(env,
> +                               "64-bit load-acquires are only supported =
on 64-bit arches\n");
> +                       return -EOPNOTSUPP;
> +               }
> +#endif

Your earlier proposal of:
if (BPF_SIZE(insn->code) =3D=3D BPF_DW && BITS_PER_LONG !=3D 64) {

was cleaner.
Why did you pick ifndef ?

> +               return check_atomic_load(env, insn);
> +       case BPF_STORE_REL:
> +#ifndef CONFIG_64BIT
> +               if (BPF_SIZE(insn->code) =3D=3D BPF_DW) {
> +                       verbose(env,
> +                               "64-bit store-releases are only supported=
 on 64-bit arches\n");
> +                       return -EOPNOTSUPP;
> +               }
> +#endif

