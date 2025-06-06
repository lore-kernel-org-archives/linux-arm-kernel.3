Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 302B3C61CE7
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 16:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KP+8ZJbQ3Iy35rM91JKh8W2oEf1yzBugHuEwD4w/SXs=; b=bTjqAjregnW1/aibZg4fytb66D
	pUJy8mZVoCw2FXEEHGECmTvEnoZEqrHjGVr71jpah0d0p1eTUoee4hvcUrsHuPEbpqsziJ9FBP6Qw
	Au+id4n36KYZHbUCiroLJa8FWhek09eAuTow3idUJKwT3WnHOiFc9ucyjtaPz0U+IiuLtU5Ugxi0k
	H6X7d5fXUY9HeowMv/KA/xy9NojKw/uQ7UttqbqmWxfQW+wkwJQiiqi9TngGzgTml0L7YNGpov0s/
	Fc8PRQd1t4/RoJjf+ClgbSmaQ4iThzkk5Z6Box4rdseA24d7UUpdar8sO/Xk74DwMDZRFzH+R3/AR
	G3NWp4tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNZs9-00000000d4k-3xrl;
	Fri, 06 Jun 2025 16:24:49 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNZq1-00000000cl0-1Vd6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Jun 2025 16:22:38 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3a35c894313so1925188f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Jun 2025 09:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749226956; x=1749831756; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KP+8ZJbQ3Iy35rM91JKh8W2oEf1yzBugHuEwD4w/SXs=;
        b=jVgKl+nefJDSBF6k3KkDgn5+FMfm5PgauvvcOkn/Qj5CcBmNjPGoaxMrRQM1jw5ijr
         xe8ZAfAuWzfmFNQ8IF5KPchze05L07VsmlxcImmJfjQGL2n+aLtZ8m3oybaD+NlrYW0Z
         BLt6H/daeMQ5ktITJyN8xOfa05WNg5d/8AMiCo2rrJYHCroeK2PC54mDCFfrgffHM63u
         LvN98Eqb26pChUqfDa6MHV2vZTILkXfj4yQmjNQuDSw3IrHVIqaNeSHVKQqkEF+7vamJ
         2alpsuA/ey6cuAnss+zBn/N0+Sv5UFP+rGt2Y/C47Ly1GyeTFsRpLBDxhBL5JJsQdCRw
         yVzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749226956; x=1749831756;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KP+8ZJbQ3Iy35rM91JKh8W2oEf1yzBugHuEwD4w/SXs=;
        b=vET8ZbhSBVm6lQfa3Yzjs4RUO7LlA6n9bd3LAFcTa3FvrV9t4FJWdVC5qk2cW/zJcn
         v7omIel4RtU42nzE8sdnaqr9c3J7tO78mQhIJ9mneb1xuPtzRv9V5xRS2bwJQnVcYQeN
         iNJlQg6H62XXHHDlHJG4NWljjU48joNH2enrewyav3Bw9vaDlc8I0mLW9dw37RaK0dyB
         BBMeOxWUn1ILE5+pNGvdus3RS+xH9ytLilkLFxybcXve/GzkGJG0AGv56Kgeo0FlSyjx
         07oCC1bvSLUizpuO5WwIPYIwDriRn8WY3lFJ7xA9MPlsAVVRKgfboXmvOI0PvEqEN6SA
         hlOA==
X-Forwarded-Encrypted: i=1; AJvYcCU4d7HGgenoBsY5Urt8lQPJD3r+9c2xzsoVZ3zkcb88cTD7B6oj1ftJ7+gYK1vyQBAHFzYR/KjpUbKmLiTtmPli@lists.infradead.org
X-Gm-Message-State: AOJu0YxY8gST6a3m+wTzyxo1uZEEpK2n+YLudgbFz8Zf3KTJRmHy+sGN
	bPoplB1kUAy3eRT1nJStlfDVS4765F9J85bjLwN8SvoDFKceDEzuNlo8/e/KGnajKKEm6q4LJHw
	mRAAPNPe4+WFZVkRbRGbhMsjlXl031agpVH/P
X-Gm-Gg: ASbGnctLaWci3vhupWBCKAASF1sOfSgrjMMe39j9tDvCP5EQP7LbKBjojahZ37UjmW+
	r/5K54GIyfGPrMfWNGnTvlWeL7TEWTgHPq1fP0Ho/FGrDIYx9ZiZw3HduXGzf7s2vTdwUs7Cq0R
	qdoLdF3+Q30F47tJUvcqpfYJQL2fsuQKRnHtdRNKJN6pAe3sQogFs1BH0JB3dysw==
X-Google-Smtp-Source: AGHT+IGVEAky3KX3oy4NEAVyuC3jToJkW1CmYjw5OMscoOz7z7KXYJisj9AihaxTJFjuwXjoE5ERBeNQiq7yk/6UiSY=
X-Received: by 2002:a05:6000:288c:b0:3a4:db49:94aa with SMTP id
 ffacd0b85a97d-3a531ab5272mr3524523f8f.21.1749226955387; Fri, 06 Jun 2025
 09:22:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250411-many_args_arm64-v1-0-0a32fe72339e@bootlin.com>
 <20250411-many_args_arm64-v1-1-0a32fe72339e@bootlin.com> <CAEf4Bzbn6BdXTOb0dTcsQmOMZpp5=DzGS2hHHQ3+dwcja=gv+w@mail.gmail.com>
 <D98Q8BRNUVS9.11J60C67L1ALR@bootlin.com> <CAEf4BzZHMYyGDZ4c4eNXG7Fm=ecxCCbKhKbQTbCjvWmKtdwvBw@mail.gmail.com>
 <D9E9IQQ3QKXM.3UJ17G9CBS1FH@bootlin.com> <DADMLIVHMSSO.3AXSI5216WCT6@bootlin.com>
 <9a2ba0ad-b34d-42f8-89a6-d9a44f007bdc@linux.dev> <DAEFD2WH7HRV.2SOG9Q00QSEXH@bootlin.com>
 <CAADnVQ+T_s6dAwJ5JKqNqA8tq1P+MdfPvPw0EoY5yOf8PnGT4g@mail.gmail.com> <DAFA7QSTVFQF.3MG5408HBVNT7@bootlin.com>
In-Reply-To: <DAFA7QSTVFQF.3MG5408HBVNT7@bootlin.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 6 Jun 2025 09:22:24 -0700
X-Gm-Features: AX0GCFtcDPhEpzZqMjlQoxov485AHY3mrKKmWdCvVJeIQl1NL0jKc2KqPI-LVsc
Message-ID: <CAADnVQKr3ftNt1uQVrXBE0a2o37ZYRo2PHqCoHUnw6PE5T2LoA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250606_092237_403891_D3A36A40 
X-CRM114-Status: GOOD (  29.71  )
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

On Fri, Jun 6, 2025 at 12:45=E2=80=AFAM Alexis Lothor=C3=A9
<alexis.lothore@bootlin.com> wrote:
>
> Hi Alexei,
>
> On Thu Jun 5, 2025 at 6:09 PM CEST, Alexei Starovoitov wrote:
> > On Thu, Jun 5, 2025 at 12:35=E2=80=AFAM Alexis Lothor=C3=A9
> > <alexis.lothore@bootlin.com> wrote:
> >>
> >> Hi Ihor,
> >>
> >> On Wed Jun 4, 2025 at 7:31 PM CEST, Ihor Solodrai wrote:
> >> > On 6/4/25 2:02 AM, Alexis Lothor=C3=83=C2=A9 wrote:
>
> [...]
>
> >> Thanks for the details ! I have missed this possibility, as I have bee=
n
> >> assuming that DWARF info was exposing the needed info. I'll take a loo=
k at
> >> it, but if those attributes can not be represented by DWARF, I'll have=
 to
> >> find another way of getting those packing/alignment modifications on d=
ata
> >> type (eg: re-use/share btf__align_of from libbpf, as suggested by Andr=
ii,
> >> but it may not able to cover all cases).
> >
> > Not sure all the trouble is worth it.
> > I feel it's a corner case. Something we don't need to fix.
>
> TBH I don't own any specific use case really needing this handling, so if
> it does not feel worth the trouble, I'm fine with not trying to support
> this. My effort is rather motivated by the goal of aligning the ARM64
> features with other platform, and so of getting rid of
> tools/testing/selftests/bpf/DENYLIST.aarch64.
>
> For the record, this effort also showed that the same kind of issue affec=
ts
> other platforms already supporting many args + structs passed by value ([=
1])
> - structs alignment with specific alignment constraints are not
>   specifically handled (eg: a struct with an __int128 as a top-level
>   member, leading to a 16 byte alignment requirement)
> - packing and custom alignment is not handled
>
> From there, I could do two different things:
> 1. do nothing, keep ARM64 as-is with the current version which has been
>   recently merged: ARM64 then denies attachment to any function trying to
>   pass a struct by value on stack. We keep the tracing_struct tests denie=
d
>   for ARM64. Other platforms still allow to attach such functions, but ma=
y
>   be parsing wrongly arguments in those specific cases.
> 2. add the constraint applied on ARM64 (refusing attachment when structs =
are
>   passed through stack) to other JIT compilers. Then update the
>   tracing_struct test to ensure this specific case is properly denied on
>   all platforms to avoid risking reading wrongly arguments passed through
>   stack when structs or large types are involved.
>
> I tend to think 2. is better, but let me know if you have a different
> opinion here.

Agree. tracing_struct_many_args is working on x86, but assumptions
about BTF being able to express everything about calling convention
were not correct, so let's roll back.

