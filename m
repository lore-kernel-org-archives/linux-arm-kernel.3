Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 394B0C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 03:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eWeCVs/LUULbQLdaOp27Hroq5hpYWQynHTMF6/hHolU=; b=2NTlfRQeAPAq0ZkOQTKL0wAijF
	fmr8p3sf/loJ6Kr4/oeM0jAZtJSsYGzrsRIMnU/s4WkwoiLGSy6ixXCM2bO8KKWmQwnGBHSIWPF6L
	BYeguTRZwldP/6RMKdcVUdgYPleXF37yeBDpFe1tGhvtFNRCt3vYhkksdJxt0srV2UDtVC9ruSFEn
	HJ5jdiICszSIVK7KLCn8WgwZag7fbHEa8wpPxiqCM7mL5IjSPGSLxeo+PeCHBO9sU6zj0xWrSThmD
	81aS6kQan+JUCC56YHuSXVZyymgCKI+IJ7HoYasb2nNl2lQ43a9YE4vEUV5OElgaC64MriHW+CGKq
	I++PMO5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlfx6-00000007OEI-2X9W;
	Sat, 22 Feb 2025 03:13:16 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlfvd-00000007O7x-0RUv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Feb 2025 03:11:46 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-439950a45daso17038865e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Feb 2025 19:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740193903; x=1740798703; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eWeCVs/LUULbQLdaOp27Hroq5hpYWQynHTMF6/hHolU=;
        b=aYu9t9ENVpq44BsbNVgUSflx9brKgIKB3H7QW3x/JUy++i1FvnjWrlhzVc2pPZHqTT
         Pore3EYaEBU3zVpE4GMIk3YyeVZj6WbVxM3ljVEtrMWwISrQJxa+LBpA9ybriiCgxKy+
         Yoy/SSGIPJc22I7/EpKJjaH3jCSnaYwqlghLB+5gd2MnSkfcMlbzooBSF1ztcWjylnAO
         B3VYXyla/ccuO1T+pIJGoe7WfOWq1h8ZrsP58Se5gSN1B3E83kZiU5jOSU7yFRUIeySp
         Hjr0GY9f7XFSMpSBWfI55WPsjvpUcApbDQFkKUX0i2c7M+G9hy+13U+dBuE009oc4HGT
         Zgew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740193903; x=1740798703;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eWeCVs/LUULbQLdaOp27Hroq5hpYWQynHTMF6/hHolU=;
        b=ly6WGt/D0NkdCwBQVs/GMl9ZJBVR5z2ocXyqCDBGM2o/knKJ72m+SE1so7VVVGyMRn
         /ApbxRw2pv/prCrF83JI8P2aCHymUp4O0+r+it3u0l1GZSF6RefaI39nM7lI/kPSzN88
         E8BJf1m+lTX4x2KDAz3WCl7hoQgoFW1krZzcf+21F9kIIxKNJ3add0+IU03kxP1DtNMT
         g9MuUHLLM/FfkNedkImUCFO3hKZu1RW4stg2kgGbQxQsRrC1Tpql1V74P3CpmURTSnGl
         aav16b/RCVsN8QyhNVlOl5Us83gIFOx6KJKTIUHOAC+d80dyf6l5dtqKT0AgzY7jIJLX
         W43Q==
X-Forwarded-Encrypted: i=1; AJvYcCUlKi/PfRl2lNbkx9RiBmm0DgaeEWzicAFkjcIflixMlhHW18ZO54zpMoQUEPeKROjsrV0BaUW7kRbzhS3HGVev@lists.infradead.org
X-Gm-Message-State: AOJu0YxKiA1/httbs8qIoIpIcFvsscL0YSDU0p+iXtrXAxlQ3vvI7soP
	PcLO/NaygJM7h1T7bNlWxzSmtVHRkJAgJc6B9Z5W4Uc9Mkvy/WAhR0SnnpN6NJAYM0hrKRODlIl
	weRxounKi//CzV1V0P59YuRFZ4y0=
X-Gm-Gg: ASbGnctrwb9GlH0vglOT2EuU3boe34N2jPtC89O9jsmtAe5b1a1et7lQRxoo6Z8mc1f
	Fr3a1f9//3GFfTCT8mShznxc9IDN7zEcM1SWaucGPbtm1+tcN9NHC/8KeB0iQ5LZ+iTXqdyb+eW
	z+PBhw14HDjzzI8gZf6SSCK3Y=
X-Google-Smtp-Source: AGHT+IFHd4FjvQqCrCtKgqnPKpghXHhZlzz58QS00WpJ2p2XRTL9M2RMPB6SCT69PYsT5XfrlmC6wGcJGaq0WN+opd4=
X-Received: by 2002:a5d:5350:0:b0:38f:2a84:7542 with SMTP id
 ffacd0b85a97d-38f6e97af1emr3987132f8f.28.1740193903162; Fri, 21 Feb 2025
 19:11:43 -0800 (PST)
MIME-Version: 1.0
References: <cover.1740009184.git.yepeilin@google.com> <e2eb5c6912f292ed229aa4fb14e42d7f4c2f8571.1740009184.git.yepeilin@google.com>
In-Reply-To: <e2eb5c6912f292ed229aa4fb14e42d7f4c2f8571.1740009184.git.yepeilin@google.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 21 Feb 2025 19:11:32 -0800
X-Gm-Features: AWEUYZlZHAk5-Pi4bkDG584UOJ60mu8CwbUKbEyBXUnO5vXzR3fB-Zakai_-2X0
Message-ID: <CAADnVQ+bJwwYKCU-HRWdgdfpc4pETxsVFtBOKAvfzLrR0Xvs4A@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 6/9] arm64: insn: Add load-acquire and
 store-release instructions
To: Peilin Ye <yepeilin@google.com>
Cc: bpf <bpf@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, bpf@ietf.org, 
	Xu Kuohai <xukuohai@huaweicloud.com>, Eduard Zingerman <eddyz87@gmail.com>, 
	David Vernet <void@manifault.com>, Alexei Starovoitov <ast@kernel.org>, 
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
X-CRM114-CacheID: sfid-20250221_191145_154376_CA5C8D1E 
X-CRM114-Status: GOOD (  14.71  )
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

On Wed, Feb 19, 2025 at 5:21=E2=80=AFPM Peilin Ye <yepeilin@google.com> wro=
te:
>
> Add load-acquire ("load_acq", LDAR{,B,H}) and store-release
> ("store_rel", STLR{,B,H}) instructions.  Breakdown of encoding:
>
>                                 size        L   (Rs)  o0 (Rt2) Rn    Rt
>              mask (0x3fdffc00): 00 111111 1 1 0 11111 1  11111 00000 0000=
0
>   value, load_acq (0x08dffc00): 00 001000 1 1 0 11111 1  11111 00000 0000=
0
>  value, store_rel (0x089ffc00): 00 001000 1 0 0 11111 1  11111 00000 0000=
0
>
> As suggested by Xu [1], include all Should-Be-One (SBO) bits ("Rs" and
> "Rt2" fields) in the "mask" and "value" numbers.
>
> It is worth noting that we are adding the "no offset" variant of STLR
> instead of the "pre-index" variant, which has a different encoding.
>
> Reference: Arm Architecture Reference Manual (ARM DDI 0487K.a,
>            ID032224),
>
>   * C6.2.161 LDAR
>   * C6.2.353 STLR
>
> [1] https://lore.kernel.org/bpf/4e6641ce-3f1e-4251-8daf-4dd4b77d08c4@huaw=
eicloud.com/
>
> Signed-off-by: Peilin Ye <yepeilin@google.com>
> ---
>  arch/arm64/include/asm/insn.h |  8 ++++++++
>  arch/arm64/lib/insn.c         | 29 +++++++++++++++++++++++++++++
>  2 files changed, 37 insertions(+)
>
> diff --git a/arch/arm64/include/asm/insn.h b/arch/arm64/include/asm/insn.=
h
> index 2d8316b3abaf..39577f1d079a 100644
> --- a/arch/arm64/include/asm/insn.h
> +++ b/arch/arm64/include/asm/insn.h
> @@ -188,8 +188,10 @@ enum aarch64_insn_ldst_type {
>         AARCH64_INSN_LDST_STORE_PAIR_PRE_INDEX,
>         AARCH64_INSN_LDST_LOAD_PAIR_POST_INDEX,
>         AARCH64_INSN_LDST_STORE_PAIR_POST_INDEX,
> +       AARCH64_INSN_LDST_LOAD_ACQ,
>         AARCH64_INSN_LDST_LOAD_EX,
>         AARCH64_INSN_LDST_LOAD_ACQ_EX,
> +       AARCH64_INSN_LDST_STORE_REL,
>         AARCH64_INSN_LDST_STORE_EX,
>         AARCH64_INSN_LDST_STORE_REL_EX,
>         AARCH64_INSN_LDST_SIGNED_LOAD_IMM_OFFSET,

Xu, Puranjay, other arm experts,

Please help review these patches.

Thanks!

