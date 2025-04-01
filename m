Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA6BC36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 18:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BoYrBmUYS1Fjt2+nydhXunhJyD1+jrRmHYe/TGOnFFw=; b=S5CdnliuRWuu/2Yz4YvWbq3LuR
	M5Cc29+sK3OFwhTKWfWGP0nkre8L4KiXRzRd7JePT44klIWwNtGLXNI//zXvT/2nRbVj25Jvs4/FO
	Y0HTAnqCEUz39BiHvvUWgcIVZsE+xX4HcMLxauub+M2KiGND65gadJMOxb7sB3UgBgbhTaOyvrVm7
	WdzkFoniwwkxrWQOst8k1cOz5qkggwnaWQ0ulOUtBfMQlOOlyBU77aguBmbWBv4GEKxVZ2T2Yt1p8
	N9iJq28VdoEUlAQe6YHeXQHQlx5YE5Zslm38swqv2lwbfns7Uey15tm0xXsgdeQ0IwOWBT/kqW1WU
	DtDe5CIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzg2M-000000044sa-0V0b;
	Tue, 01 Apr 2025 18:08:34 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzfze-000000044Op-08Da
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 18:05:47 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-6f768e9be1aso1178117b3.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 11:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743530744; x=1744135544; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BoYrBmUYS1Fjt2+nydhXunhJyD1+jrRmHYe/TGOnFFw=;
        b=ZBvfmbqj4y+RJZcNe794swOmRjHnlAAE/DweYEi+44jWSISeYS86xypmRE18DP/xWP
         jNZ15wEz0tHZNfa5ECBBXYQ3iSoEhqqNR4K8MKNEWSoiH+5eAHgcU1QG5X/PTDYXTdzv
         sOlskJ0q6k5J2A4eJh+Jpbk0Zsyq8A1TdHZU3aslhl8Ydf15JuUqS2jP0CWKmsQXoAm1
         4XYtVXe/9BIvYo6lescqVMdbH4/JMlhlSiZUMomJdfcD1P4UzBtvvGsolGcuAd2AttJT
         6D/cy5w0ZQLxxOOaI3rFXQzXJKF1AlJ6S/34ulM4EZABnn7n1qs6Nt62A/rBzHzuMWYX
         QsxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743530744; x=1744135544;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BoYrBmUYS1Fjt2+nydhXunhJyD1+jrRmHYe/TGOnFFw=;
        b=jDvhjxCoshnRsaw4GWqMRagGFPcFY5MTLDUfm1wMLcdYFdwbXikZlGS1/8XdpXoDQA
         HbWEUvCwcIDbBG+6rOjjK2jvqGQ4qo7iln1nztl4ltlW1ys1fkfoqm8JhkRKxBWlSGwS
         vEzfp/q9ogaWdgexYopEmPrRGLbxg6Ivfpp6PUh754IMkapaqu1VpX8J1bXVQwPcpm/o
         f1XdHXyiHAzEZs6yMdcxjeTzfm+3/XUjan9Y64QYn9gAQWgZ1bGDZBQ0Pnw8Ldg7ScDy
         9MLM9s9izhq7k6972o5PTC653acd7hcoMi0LDYhX4YNq/tWY4kWJHh1FMI8O6pOqcaTL
         ZJMA==
X-Forwarded-Encrypted: i=1; AJvYcCW24iLNkzXD1p95Q/MPjnj/NeY6kWEQU3CA+yStG/kCfY4BjgIPzBXhvi1VeyZ4/CqkKCsHYG4FpE+mJzqRe+WV@lists.infradead.org
X-Gm-Message-State: AOJu0YwUEL0WpWJ2hAY4AnfmegPP2Q8Q6jkgVjNcMsuOobcR99ZQlTV+
	JadABa7mGnM9YZxCF4RggLKMh0UDzRzRYoeuWyRccUNnQnomeOMAOBI1Uu9CgYbooaZCMMhFEQC
	lJ6k0jTDiI6GdebVqoXnlARhV77g1kaei
X-Gm-Gg: ASbGnctq4d4IQnji9yi3jabmUFPCUNtvdrAH4jCMg1LgRThGQ/wIaldd4/zaawu0r2K
	bmuYDfltsaDuyB7dN3Ka/GIWAgaz4jPQk8Mw55rZFwtZG63eaw4rJFxfObktiHyzTYaWoI51UQO
	9nhRf5UjMVADUHbD9KZBa9V2s2JqBTJfFWLCOUU2+lpw==
X-Google-Smtp-Source: AGHT+IGMVbGaGvOYTg9+RQ9IAGG98GOlapvtbp7KooxcYZhgqUbq/MrtYvN7WFBm50vXzage8iz9PVqJmEAJFgznsZo=
X-Received: by 2002:a05:690c:6913:b0:6f9:47ad:f5f1 with SMTP id
 00721157ae682-703b66ed874mr14693837b3.17.1743530744515; Tue, 01 Apr 2025
 11:05:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250401061546.1990156-1-nichen@iscas.ac.cn>
In-Reply-To: <20250401061546.1990156-1-nichen@iscas.ac.cn>
From: Amery Hung <ameryhung@gmail.com>
Date: Tue, 1 Apr 2025 11:05:33 -0700
X-Gm-Features: AQ5f1JpOwg2Qo4yi4MGTCZ1zyArShoCogVd4mypKFbNMujca6CF07ZTLq3Qc6vY
Message-ID: <CAMB2axOa6D757_FGsW2i4xCDzNP7h+QUGMDvRtnx6EyNfjRBFA@mail.gmail.com>
Subject: Re: [PATCH] selftests/bpf: Convert comma to semicolon
To: Chen Ni <nichen@iscas.ac.cn>
Cc: andrii@kernel.org, eddyz87@gmail.com, mykolal@fb.com, ast@kernel.org, 
	daniel@iogearbox.net, martin.lau@linux.dev, song@kernel.org, 
	yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org, 
	sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, shuah@kernel.org, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, peterz@infradead.org, 
	juntong.deng@outlook.com, oleg@redhat.com, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_110546_076690_B3137E62 
X-CRM114-Status: GOOD (  16.13  )
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

On Mon, Mar 31, 2025 at 11:17=E2=80=AFPM Chen Ni <nichen@iscas.ac.cn> wrote=
:
>
> Replace comma between expressions with semicolons.
>
> Using a ',' in place of a ';' can have unintended side effects.
> Although that is not the case here, it is seems best to use ';'
> unless ',' is intended.
>
> Found by inspection.
> No functional change intended.
> Compile tested only.
>

Oopsie. Thanks for fixing it.

Reviewed-by: Amery Hung <ameryhung@gmail.com>

> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>  tools/testing/selftests/bpf/test_kmods/bpf_testmod.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c b/tools=
/testing/selftests/bpf/test_kmods/bpf_testmod.c
> index 3220f1d28697..f38eaf0d35ef 100644
> --- a/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
> +++ b/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
> @@ -1340,7 +1340,7 @@ static int st_ops_gen_prologue_with_kfunc(struct bp=
f_insn *insn_buf, bool direct
>         *insn++ =3D BPF_STX_MEM(BPF_DW, BPF_REG_6, BPF_REG_7, offsetof(st=
ruct st_ops_args, a));
>         *insn++ =3D BPF_JMP_IMM(BPF_JA, 0, 0, 2);
>         *insn++ =3D BPF_MOV64_REG(BPF_REG_1, BPF_REG_0);
> -       *insn++ =3D BPF_CALL_KFUNC(0, bpf_cgroup_release_id),
> +       *insn++ =3D BPF_CALL_KFUNC(0, bpf_cgroup_release_id);
>         *insn++ =3D BPF_MOV64_REG(BPF_REG_1, BPF_REG_8);
>         *insn++ =3D prog->insnsi[0];
>
> @@ -1379,7 +1379,7 @@ static int st_ops_gen_epilogue_with_kfunc(struct bp=
f_insn *insn_buf, const struc
>         *insn++ =3D BPF_STX_MEM(BPF_DW, BPF_REG_1, BPF_REG_6, offsetof(st=
ruct st_ops_args, a));
>         *insn++ =3D BPF_JMP_IMM(BPF_JA, 0, 0, 2);
>         *insn++ =3D BPF_MOV64_REG(BPF_REG_1, BPF_REG_0);
> -       *insn++ =3D BPF_CALL_KFUNC(0, bpf_cgroup_release_id),
> +       *insn++ =3D BPF_CALL_KFUNC(0, bpf_cgroup_release_id);
>         *insn++ =3D BPF_MOV64_REG(BPF_REG_0, BPF_REG_6);
>         *insn++ =3D BPF_ALU64_IMM(BPF_MUL, BPF_REG_0, 2);
>         *insn++ =3D BPF_EXIT_INSN();
> --
> 2.25.1
>

