Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30513D46606
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 18:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8THmu0qXU1sZub569pYlCPkbhQYfiv8r3J7zMWrHXdE=; b=giqeZi19wvbf7jcjLyEdlliyH4
	TDIOMljY3peI34KMvg+1RkiMB1yZV0JlEO1SqAAS4ZQpdf6osN77Dr0S8Pr7JrX3i+3iDeXHH8vvL
	eRVR2BxtzJm+cOAa4mB3cP2+Zxq8R7STlfxeTBmzu75rgPRRFvLx1P/smshYCpIUzBTWXsU5HB3lW
	ME1h3mcmRA4hMDdW79AdoFAYBllloYaWa+YnVWqk2zKYZ4BwY/5P5aVYTvi5HHmUuCrmxJandf+YQ
	5N45jE1Utz0eyT0GuH+4GW8azK8we2wPJBCh1qY9tlgNeIQw0I7epo6wJI+Z28wZol6HW12bNM2vP
	5TMRrqIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgRe3-0000000CvFN-4C7Z;
	Thu, 15 Jan 2026 18:00:32 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgRdv-0000000CvE1-1UJY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 18:00:31 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-42fb4eeb482so711123f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 10:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768500021; x=1769104821; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8THmu0qXU1sZub569pYlCPkbhQYfiv8r3J7zMWrHXdE=;
        b=kUQqVwRAXyqbaGk4HG3EI6ZuBZXD+WQqDx1AR1sQ4QwaVm4JJAQeqCD1kHdzITEhFz
         iJT9WUPncH0YjT55QTHOQom9D26xgdUxHHX+RY+KjODUjmQmmkiwXDDYKqCxaHmftiyf
         75cxa52/bRTBykkkJOhwbiX9s+n/V2MkajYdzQNGWwQeF8wqtofL2C2nDMhct8WlZygX
         rz1SfVNECgwVAE82ITthdjv01Rqb/GJYuV+NJLq4vSy5+W+xrd4Sf0+Z00bqHov48U/H
         TpObMDbX1FLQ1Be7oa7L2itEqRV9XPdlUwcwVBpaDNucE3aD5Di4uWJMq0mnzi0EObS3
         RM3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768500021; x=1769104821;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8THmu0qXU1sZub569pYlCPkbhQYfiv8r3J7zMWrHXdE=;
        b=vE6O63AP/cPgPJHqfdCPJ3UaU/AKVz1ZsTIrUFb9iZKx3UzKv2ds+vCGta3uPFdhe1
         mMPbcRiffQZ/Hw7jXhXBBfGmAhpwdD9ilcsTFqmOe/W5t5Rd5qklytdgqa6E1G7nKft8
         Jm+3QOUfJovrEeyttzyIQ3gzeV0d1I3yxSi7HOFrrrYjwS1id+QVEDGinw6o/X5TzmnS
         Nj0CslsDS6dRDNEBZwUPFpagd9k4SSPngR6bj1D/lENBBusyjeYMpCHoVD6JEO6RnrEb
         XN7dsfz3+7pT3EHKZDCDQAGn5mGw4ezdb/2LACjmAqrq5Yzff0asUPYb/BWmDV2+esMb
         1IOA==
X-Forwarded-Encrypted: i=1; AJvYcCWcaWed8MMFFs/jUyxLOf+wUUtbnD+Ho9lFiQYxcF8wPgTurESpH9XzEfRJKHi6LtTNLUfcaWEv368pUD4T5dFN@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9pRS7HMrTnMY7ONrSMmSTiKxFvqzbxENMVvajR/JV6RJqGz/i
	Fl82rDjSoS64/HoXSdxcctpLOxbqHiskO9NKvHBYrf3P6ASDSKR4i3CL
X-Gm-Gg: AY/fxX4kSFfN8TMXedVQrK1sbshvkp5ZJwslwKdZZMu+CbdeWOMZu+pnHd1u7l+pk9O
	8UYjTREodgNjB2I/vFd+J4g2864if6+OEU75vvmyr4h3AjYJkUgS0zWlv2pwQYE3dVQ0aaCLIAU
	DKC/HvbJbLpgD+Wta61v5Dykj/IudOO+Moqy+MGWdYOFEeW6jKnirXVv7gzTMedKeQNMW5Vammy
	+qDhonGrCKuKoa8WmNeWX8EbrYwxIu8Nm9Dn/jKUAKx194pvoGzvK8K0I0r3EtiEbafEcImLocW
	FQOOwIuhnFWJWRVnh49hAG/ZI6HH1RP3oxK4RrUT0fEUbzYPvufSwU5PFwuskIhuK/zyqBzVFr1
	frTJPBF1ZXxt4VwC9SF6rQTbHjTE1Xgv3s5bIGx31R8Jz3DakvlzL5Fky3gwmSDD19nXQAFtl9P
	U=
X-Received: by 2002:a05:6000:26d1:b0:431:2cb:d335 with SMTP id ffacd0b85a97d-4356a053852mr135704f8f.34.1768500020783;
        Thu, 15 Jan 2026 10:00:20 -0800 (PST)
Received: from krava ([176.74.159.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356997e664sm280337f8f.30.2026.01.15.10.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 10:00:20 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Thu, 15 Jan 2026 19:00:17 +0100
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Jiri Olsa <olsajiri@gmail.com>, Leon Hwang <leon.hwang@linux.dev>,
	bpf <bpf@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>, Puranjay Mohan <puranjay@kernel.org>,
	Xu Kuohai <xukuohai@huaweicloud.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Network Development <netdev@vger.kernel.org>,
	kernel-patches-bot@fb.com
Subject: Re: [PATCH bpf-next 0/4] bpf: tailcall: Eliminate max_entries and
 bpf_func access at runtime
Message-ID: <aWkrMckumhQErMmV@krava>
References: <20260102150032.53106-1-leon.hwang@linux.dev>
 <CAADnVQJugf_t37MJbmvhrgPXmC700kJ25Q2NVGkDBc7dZdMTEQ@mail.gmail.com>
 <aWd9z8GVYO12YsaH@krava>
 <CAADnVQLxo1uPbutGNKrv=f=bSVkzxOfSof0ea8n7VvqsaU+S3w@mail.gmail.com>
 <aWgD3zH7vsiBdIcr@krava>
 <CAADnVQLHVogD1mjMCsHcJOayuZW4OwadEN0g9wu=6d97uRSWqQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAADnVQLHVogD1mjMCsHcJOayuZW4OwadEN0g9wu=6d97uRSWqQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_100023_407373_BE0CDD60 
X-CRM114-Status: GOOD (  17.93  )
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

On Wed, Jan 14, 2026 at 01:56:11PM -0800, Alexei Starovoitov wrote:
> On Wed, Jan 14, 2026 at 1:00 PM Jiri Olsa <olsajiri@gmail.com> wrote:
> >
> > >
> > > > fyi I briefly discussed that with Andrii indicating that it might not
> > > > be worth the effort at this stage.
> > >
> > > depending on complexity of course.
> >
> > for my tests I just had to allow BPF_MAP_TYPE_PROG_ARRAY map
> > for sleepable programs
> >
> > jirka
> >
> >
> > ---
> > diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> > index faa1ecc1fe9d..1f6fc74c7ea1 100644
> > --- a/kernel/bpf/verifier.c
> > +++ b/kernel/bpf/verifier.c
> > @@ -20969,6 +20969,7 @@ static int check_map_prog_compatibility(struct bpf_verifier_env *env,
> >                 case BPF_MAP_TYPE_STACK:
> >                 case BPF_MAP_TYPE_ARENA:
> >                 case BPF_MAP_TYPE_INSN_ARRAY:
> > +               case BPF_MAP_TYPE_PROG_ARRAY:
> >                         break;
> >                 default:
> >                         verbose(env,
> 
> Think it through, add selftests, ship it.
> On the surface the easy part is to make
> __bpf_prog_map_compatible() reject sleepable/non-sleepable combo.
> Maybe there are other things.

ok, thanks

jirka

