Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8EDDC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 16:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YnIQvPD9lJYDOlBpOrCy1ioFdRL5RyD0q+hZaolXlzo=; b=aZPB+gsTUo3mz27eGgCk9ReT/P
	WrVuU9fWLP4qOoAp+hOtY/SXB6cGXVtT/TYdsU0p3x15tsx013GCydRK+67SKHXA0HDOUVYKNtYAQ
	FktDsSa6MwqEIm3iDCAFuZhuDB0RbGTZFf9WacDaPJ0+e12irL/VhacWQLuUfT/vtyox7kVin8+sv
	9NEXUSirVbA3/DFr6t4FXHa2lIPxTuvwadRXOpuclC+IlCQGk4/DA2l2D/rb7fmbir66IaAY2nOCT
	YK5HAKu+vca+w97rNZI2/b1D/kBkDgDkLZzrZ5W8Esdhm5CLgwZQTozWKfYwU5iJRLkUEmFjN9yOD
	jnfvI3ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNDCZ-0000000Fz5s-0rZU;
	Thu, 05 Jun 2025 16:12:23 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNDAM-0000000Fyj8-2DtE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 16:10:07 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3a3673e12c4so741578f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Jun 2025 09:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749139805; x=1749744605; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YnIQvPD9lJYDOlBpOrCy1ioFdRL5RyD0q+hZaolXlzo=;
        b=VWKFv/yNcw6CpW+Vf5TW9v5GPrknXwNIv5SgTZgQv10bU57t/XTAWscvcu0kh4KQWe
         u1Qp2KarFhHV08esuNQHEw0Qg7fIZtebGU6BtsowaJxLFSFe7Nntz4baUe/+FkUtCA4Z
         s7ymU6nWyhNJK0lujr87w8v5RR1p+SZjyhqt5w+Fxmvbt4LnOqYpeNwYA5Mi2lX6fy3W
         zTvrIR88HidCywwIzoCSclqcnn0LLyr6N1S0QI0NnOX0zfN6mSxmbnePTKywoxXze7Ly
         fbfgpe2hKIEkNmrNps3xQixhOoIRfUKZ0xEGX1n9XBd1BEZ6RT9yfJAzqxLfLN4mGdfP
         m8Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749139805; x=1749744605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YnIQvPD9lJYDOlBpOrCy1ioFdRL5RyD0q+hZaolXlzo=;
        b=DR8RoQH08XY9AnLDPqd+WyoSxTM3HHT1PY8GU8RN0WOSuz5+GgkmtzcW8UL4yAVTad
         HiZabWPb+SGYpWf8rLUUmfYsH9WsRppJ7r/iQwmbPcpVBzDn8de9gn387PRadjGUSQK7
         Ur8QExAY5JYON0H4dBdX+I+Eoq0OKdhf5RBH1kH9hVzmvvQD2Wed3mG+M2erL63VcOCw
         /o1wQhfDWu0g3tjEBLn08XATdBTYqr0kgqnMVO6ok+LM20v3F0z9HizUhz1BvI5m9hE6
         5e/Oz69SxoYmKdMqK8gNI53VBwnj6N3+GHwsnK14m/7yUt39i4cH5vUUhLtAGbkVdgl/
         m8nw==
X-Forwarded-Encrypted: i=1; AJvYcCUBmvoe9IuqB7LwqCBx3cp7RdaSbkU1/2EX+jt6iuOsRW8nXkI7rZQpe65YH4Ky5h+gPhATYjLWLT8oj7IoK7UR@lists.infradead.org
X-Gm-Message-State: AOJu0Yxhb8XDfa3L3lJ6ffj9IZ/DQW8e4wcXaoGH5rl/vZEdh7AVticW
	XJTFaHvVcdjR0BkDVT7XCrJD6PsbM2IgBam/jAkM0LhqQq9If85udKg/4aaz/Y5fIrWM1oxtsVF
	I31WzdNvucT1+fzB1wxKkp08Tcrv9sHE=
X-Gm-Gg: ASbGncuaYWEmHKsFZtxKOwdwDPnjZejCu/dPNdvtvIbjWorLiokJXHNJmv+QXeADepo
	+jnKQXKByKD5+eZla0hfL4Zz6RgrUfmhadcU/qx6nB5loCg3x1NTrZqER1AFMwYWgRXSrMrquQJ
	vv7Tzy3P/+AGIsv1ooNrJgt7UOA3JWBB4/n68RjYpAuHVszfARu1gaJX+JXTwvKj8W1dtTnA==
X-Google-Smtp-Source: AGHT+IF4/r/MeCk1ofRbXjeQgnJMl2fjGGz6lBVtftByV5fvMH1+Rl6IDv+s6YX9w9uN5TsW5ALs3oMs2ojfpEr5ugw=
X-Received: by 2002:a5d:4291:0:b0:3a5:2875:f986 with SMTP id
 ffacd0b85a97d-3a52875fc63mr2749955f8f.44.1749139804629; Thu, 05 Jun 2025
 09:10:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250411-many_args_arm64-v1-0-0a32fe72339e@bootlin.com>
 <20250411-many_args_arm64-v1-1-0a32fe72339e@bootlin.com> <CAEf4Bzbn6BdXTOb0dTcsQmOMZpp5=DzGS2hHHQ3+dwcja=gv+w@mail.gmail.com>
 <D98Q8BRNUVS9.11J60C67L1ALR@bootlin.com> <CAEf4BzZHMYyGDZ4c4eNXG7Fm=ecxCCbKhKbQTbCjvWmKtdwvBw@mail.gmail.com>
 <D9E9IQQ3QKXM.3UJ17G9CBS1FH@bootlin.com> <DADMLIVHMSSO.3AXSI5216WCT6@bootlin.com>
 <9a2ba0ad-b34d-42f8-89a6-d9a44f007bdc@linux.dev> <DAEFD2WH7HRV.2SOG9Q00QSEXH@bootlin.com>
In-Reply-To: <DAEFD2WH7HRV.2SOG9Q00QSEXH@bootlin.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 5 Jun 2025 09:09:53 -0700
X-Gm-Features: AX0GCFt6yH5UVLu_OY8YyoKeWCoB2_l0Zw4RyPbCo3gsHpLrUJ01bzW8146d9WY
Message-ID: <CAADnVQ+T_s6dAwJ5JKqNqA8tq1P+MdfPvPw0EoY5yOf8PnGT4g@mail.gmail.com>
Subject: Re: [Question] attributes encoding in BTF
To: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: Ihor Solodrai <ihor.solodrai@linux.dev>, Andrii Nakryiko <andrii.nakryiko@gmail.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Puranjay Mohan <puranjay@kernel.org>, Xu Kuohai <xukuohai@huaweicloud.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Florent Revest <revest@chromium.org>, Bastien Curutchet <bastien.curutchet@bootlin.com>, 
	ebpf@linuxfoundation.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	bpf <bpf@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com, 
	dwarves@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_091006_568576_9DC8307F 
X-CRM114-Status: GOOD (  23.40  )
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

On Thu, Jun 5, 2025 at 12:35=E2=80=AFAM Alexis Lothor=C3=A9
<alexis.lothore@bootlin.com> wrote:
>
> Hi Ihor,
>
> On Wed Jun 4, 2025 at 7:31 PM CEST, Ihor Solodrai wrote:
> > On 6/4/25 2:02 AM, Alexis Lothor=C3=83=C2=A9 wrote:
>
> [...]
>
> >> Could I be missing something obvious ? Or did I misunderstand the actu=
al
> >> attribute encoding feature ?
> >
> > Hi Alexis.
> >
> > The changes recently landed in pahole and libbpf re attributes had a
> > very narrow goal: passing through particular attributes for some BPF
> > kfuncs from the kernel source to vmlinux.h
> >
> > BTF now has a way of encoding any attribute (as opposed to only bpf
> > type/decl tags) by setting type/decl tag kind flag [1]. So it is
> > possible to represent attributes like packed and aligned in BTF.
> >
> > However, the BTF tags need to be generated by something, in case of
> > vmlinux by pahole. Pahole generates BTF by parsing DWARF. And, as far a=
s
> > I understand, attributes are not (can not be?) represented in DWARF in =
a
> > generic way, it really depends on specifics of the attribute.
> >
> > In order to support packed/aligned, pahole needs to know how to figure
> > them out from DWARF input and add the tags to BTF. And this does not
> > happen right now, which is why you don't see anything in bpftool output=
.
> >
> > [1]
> > https://lore.kernel.org/bpf/20250130201239.1429648-1-ihor.solodrai@linu=
x.dev/
>
> Thanks for the details ! I have missed this possibility, as I have been
> assuming that DWARF info was exposing the needed info. I'll take a look a=
t
> it, but if those attributes can not be represented by DWARF, I'll have to
> find another way of getting those packing/alignment modifications on data
> type (eg: re-use/share btf__align_of from libbpf, as suggested by Andrii,
> but it may not able to cover all cases).

Not sure all the trouble is worth it.
I feel it's a corner case. Something we don't need to fix.

