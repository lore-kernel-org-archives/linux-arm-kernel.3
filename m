Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11217C83F34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 15:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=efekQXQZrme7QsOpedSZsB6fxq6pPsbBEH1ewRwDxdA=; b=FuiBtcu3jAdT0y96orERHj2jIy
	kpl1CvFlcC1uirI22BXhV/qLnM44cky1lruFCWSMdWCaeffhG2OuDn5Xo4rLe3p5kqbqYbvcE1N3D
	ZDsoCe+k7B3IDghIN9m+PF4Y/8OKa29DfYvmfQFjHEbGQwtK5EE/XIJd7ClAxxygh9KBRfN6mVY1z
	zb2972yVQydTPOKwp9LUwS5xnozj4QQNqMk4OWZa7SOXsZYY7lQTrjw/acuDorQv08FdQIQJ3oVnM
	H+dVUjPSieD+rf5ozA3fBfYxwxZxqBWSX2XF+kJQugJlZHPAuvtGpYDLIK5rkRX71B4FAF3hajJ0D
	ypzKdCvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucQGl-0000000ATwh-3aBk;
	Thu, 17 Jul 2025 15:11:35 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucPv6-0000000APyT-3vfh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 14:49:14 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4561ed868b5so8338095e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 07:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752763751; x=1753368551; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=efekQXQZrme7QsOpedSZsB6fxq6pPsbBEH1ewRwDxdA=;
        b=ZteZWHpYi8+Xg4CkbBa7dclepsPCrXR7jqdXfuMcN7RNCDFp1DgdoM241PlkvvfnrT
         5RK18vtwYNFJYmu8DUqHt2cadcVcKXIwDxlCYkBwJ8YHMYA1oV+jykwwW15zQeujIThc
         NNBPFpzV02L3haEx8W50ja2ess++2tKkYdCoVoklhkXYw5bnZQeqgy7mj5p6UM5OdHfY
         LeKbO0U13P5hvw/B197d5OSroMAKYIArc+5VqI5Dl6kLvevzKqwI6p1Bxq3wBXqWAdQQ
         RExGc45Tvx2wfu03Rn020L2bH9YNuv88EpVZCs5jNTRuCRKn8TjdXIfGWNKL1dp7rGLj
         5Haw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752763751; x=1753368551;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=efekQXQZrme7QsOpedSZsB6fxq6pPsbBEH1ewRwDxdA=;
        b=a6+oOktM9Kz6eUc9a2jcmr1hqTCTvBhFNn0SmW4awTmGGmQp3gWEhMxNbmcFMP3Bqm
         J8KERHt6F8fQHTLBv2hDRx52WC26NO83+SHfGxw5/WXTFiYEKbmbv0hKiSCb4xNOok+F
         xBUujQqtQp30qLwxcMoXKyJmoBwrGokokiFNJ5mEewN491VTfbwuY3dvlZgxjtJgQvfU
         nQzep/q+jM3tJBecO2ofFTfEloGeOaidIgC98+VSXysanNzrgrVq8fFPilgBUzWLB8ZC
         tNsc5UaBe3z8kSypmHPyKZCnocB7NHOnXYFAhHTVSUhElxZ99lTQhdocUZxGvWI6NKKU
         Mymw==
X-Forwarded-Encrypted: i=1; AJvYcCWHIuBxP3Zt+8AYEVNRZ5SK3o3mQFXW78Mqm6RzLUPDFeISYLPb06LbL1PJt3stXkPa23HI426Z5NJ153CPh/Kn@lists.infradead.org
X-Gm-Message-State: AOJu0YwlqEOhPFPGLksHMMrdb+2+2OIzW12sIH29g/Vwrp4MIm7wgzFf
	xsXM6WGlZudNv59fWJIsj6OdqRLIi55dd7yFve71PqfGsgKhaouPxN8z/cmnpVAsyL2wJA9sh+G
	32b4KAG84MkhXHNaM5L3zbRNNgJbmEU0=
X-Gm-Gg: ASbGncsEsCWo4kVtm9ImMLZlZasbG1qcCXsvFAnbIbsBBdGAv7x1gjBiNBC1jpmt6p6
	PhnjWQ8uH1XTjsagRyDLKVV3mZ0l5pcDibhMZiIL1eXsOYz0AbD6TWLy2glp0gETWtcg+n09ogi
	PT5NlEThVrTSrPdnFdNftShLZhXJv6Z8N9UYKcIpFt1iEI9fTccHGaTqnQq9OWEWPaxq6lJFcjH
	eljh7AfkVWU32cj7WwO87w=
X-Google-Smtp-Source: AGHT+IG4miO/dv212kLZpG/e9v0ljtOerGAGBpNDY1tobNdy2ARDGjlhc1t+cVUf7eDrDA2bneaE9/9c2sJ3VTWdlXU=
X-Received: by 2002:a05:600c:5492:b0:456:207e:fd83 with SMTP id
 5b1f17b1804b1-4562e330ff3mr65892995e9.4.1752763750958; Thu, 17 Jul 2025
 07:49:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250520-vmlinux-mmap-v5-0-e8c941acc414@isovalent.com>
 <20250520-vmlinux-mmap-v5-1-e8c941acc414@isovalent.com> <g2gqhkunbu43awrofzqb4cs4sxkxg2i4eud6p4qziwrdh67q4g@mtw3d3aqfgmb>
 <CAN+4W8hsK6FMBon0-J6mAYk1yVsamYL=cHqFkj3syepxiv16Ug@mail.gmail.com>
In-Reply-To: <CAN+4W8hsK6FMBon0-J6mAYk1yVsamYL=cHqFkj3syepxiv16Ug@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 17 Jul 2025 07:48:59 -0700
X-Gm-Features: Ac12FXxv9eZP3WGHijR1aiMMgitwCgckpKc4CSnltjSp9gY2rQ-YiI071IreGAA
Message-ID: <CAADnVQ+WZsaDS-Vuc9AN7P3=xvX8TG=rY65A8wYdOARLtkt6Mw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v5 1/3] btf: allow mmap of vmlinux btf
To: Lorenz Bauer <lmb@isovalent.com>
Cc: Breno Leitao <leitao@debian.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, 
	linux-arch <linux-arch@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	bpf <bpf@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, Alan Maguire <alan.maguire@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_074912_978356_EDCE4568 
X-CRM114-Status: GOOD (  13.64  )
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

On Thu, Jul 17, 2025 at 6:18=E2=80=AFAM Lorenz Bauer <lmb@isovalent.com> wr=
ote:
>
> Hi Breno,
>
> Thanks for reaching out.
>
> On Thu, Jul 17, 2025 at 1:39=E2=80=AFPM Breno Leitao <leitao@debian.org> =
wrote:
>
> > Should __pa_symbol() be used instead of virt_to_phys()?
>
> I'm not really well versed with mm in general. Looking around a bit I
> found some explanation in [1]. Your suggested fix does make sense to
> me based on that.
>
> Let me run the patch against bpf-ci and see what happens.
>
> 1: https://lore.kernel.org/all/90667b2b7f773308318261f96ebefd1a67133c4c.1=
732464395.git.lukas@wunner.de/

Thanks for the link.
Key quote: "arm64 maps the kernel in the vmalloc space."
I think the map shouldn't be destroying linearity of kernel rodata.
__pa_symbol() should work for start_BTF, but would be good
to double check with Ard that the rest stays linear.

