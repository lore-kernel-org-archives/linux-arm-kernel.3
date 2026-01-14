Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19ABFD3CC81
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 21:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V2IFPWB+T8VdoZY6NJv4zwx5iiV744THuNeTgWC4nyo=; b=2XyM4LUGCMxVGXsJpV7MiAMlVF
	nUyHjJbwrGOFEy+XO+A9dzEJRYGe2pqw+vzVx5YxWhZsYiuyJduRXS9ZEyM2Yu+7jM+iMK4T1nmAi
	m7uwfJTGs/CwFAHCWc1X0crBy7fdSy1XWrhxhNld+S3rHyJ3yLqayA+tPEDNFFAJ7GUCe6kz0FXXM
	Pq+/SaYOYUXC/EUqWRDecZYTm9NldXHR0ZBUt5j+3RRPiDXIpR6I8ojHrL3CQDD2au/Zk5kLZNlTT
	QhKNw7uDMlVqV94kZCdGE0yAEaFPXOgukpHy2Z9RkxE+sduuLZ9kcD4Hyp2pYQrHTIoHV5FHKjTAK
	EUgrWyzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg8qp-0000000AqQF-1QZ5;
	Wed, 14 Jan 2026 21:56:27 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg8qn-0000000AqPe-1PZJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 21:56:26 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-47a95efd2ceso2517795e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 13:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768427783; x=1769032583; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V2IFPWB+T8VdoZY6NJv4zwx5iiV744THuNeTgWC4nyo=;
        b=A4CifVlibjaK/rYR/ZN3Dzp3ms+OTEQ9SDfomviuWE7cpcXwKBD6s4IRHR23fovH9Q
         VWjTKujunOC2OTPPXNmG7ZFR8GNSaDr6zKCPptKLsCrepNcZiH0uEgH9Xax3nyzzxDeH
         BjnmHDssazePl4fqgc/CNpQ32WidDSzu7/gAVuGiQx/p3G6UMwHDsyH0J+DgI6edCxzb
         6rVZFzOTiAbZbfLurrTL53CdAzNP3gkjuYUlklTUc2m3X972yVDJ9N8WzahgHt7cYynn
         VWCQGdUJcaHI2yT8eq+pDSV70aFGskLPk4fa0HDPMDHVb2K4EUY0y2NCPP5cLQj/GGoB
         c9EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768427783; x=1769032583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V2IFPWB+T8VdoZY6NJv4zwx5iiV744THuNeTgWC4nyo=;
        b=R/UIzW0KrXbUr0BkI1PVFfwbdOdmNMc7MPnberxo90gmc0G6X6TlCiXHvrCn/iDxtP
         KXAD2QrpO504jSsxERXUPXaJIKFX0Ihj56hiV+Hav2u6GWUGuEE0hFFRdwAS9gU28+xo
         N8KNn7IBcYIQcJJWI17nNeLg5VF9qHlV7erKoBArDkqRM2JhlSBNdH8QzqVV86scjd5s
         bQf/MRQmKbteiIlbTQy4pn5E59cBLkYJdB4o49tBIMqMxeV711ymCcsFMWX7T/NNgBXo
         aZt5T1rIcMOR/AFWQbmr3fzJa3FpuunGW9MoztYuvGKvmEXWKhrJFINABcQwJKbYCsQK
         oE1A==
X-Forwarded-Encrypted: i=1; AJvYcCXrEhSwOaE/fReKEYVTlcmzwYGPq/7LCC/yueE4rPoYU2AvBjBK/7h8u6i/84EHPkt2R5NxzDqWkmJzQsjyrFXA@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7rt3lOn+Fs+7VNL78cAIbYvoFe1LuM0m6XauivVNEUZOxSyfQ
	pWVONoLhPYkfGhQKywsvw7ZE0Try4da0tv5FG9U6tzA0J16E4nDteVgflQQIZO2ORYrKExR8BUz
	dvcub7rIffwNOmcFqcnB++QJqSSfFm68=
X-Gm-Gg: AY/fxX4uesWqThwbwAoawDDPTN38azzHOb3cCnuxiQq9qiHIXqQhiOiTWagt7OHtifu
	qU37cnG41czXhdzLqAW2FaFXLmprRUNrcvbL92yPvDXRWONWDCRyNtHrD8RdqHHq0Q1vH91ddss
	6//jg1CbuFxLJ69qFKDZQD5h8fEOSIx3U4cBDcl95IABu2325D2EU2xk5KUPrRKok4/NL+bDRoW
	WxmH9HJAvqBuMb/G1Ld8X0qI4DPAcx/L/i4SEwO0eUeRAT8qQlJVuUC31JGj9urxn/ynAZ4pc98
	HMo/DpFfdYKmiwpCIf5iIG+ZMNla
X-Received: by 2002:a05:600c:4f0b:b0:477:c71:1fc1 with SMTP id
 5b1f17b1804b1-47ee4819f30mr39840995e9.19.1768427783081; Wed, 14 Jan 2026
 13:56:23 -0800 (PST)
MIME-Version: 1.0
References: <20260102150032.53106-1-leon.hwang@linux.dev> <CAADnVQJugf_t37MJbmvhrgPXmC700kJ25Q2NVGkDBc7dZdMTEQ@mail.gmail.com>
 <aWd9z8GVYO12YsaH@krava> <CAADnVQLxo1uPbutGNKrv=f=bSVkzxOfSof0ea8n7VvqsaU+S3w@mail.gmail.com>
 <aWgD3zH7vsiBdIcr@krava>
In-Reply-To: <aWgD3zH7vsiBdIcr@krava>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 14 Jan 2026 13:56:11 -0800
X-Gm-Features: AZwV_QjPeGyIa5g7MAD4JaS1tAElwUa_x4uErmV3ep-P21EZz9S74OzD-I8OSSs
Message-ID: <CAADnVQLHVogD1mjMCsHcJOayuZW4OwadEN0g9wu=6d97uRSWqQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next 0/4] bpf: tailcall: Eliminate max_entries and
 bpf_func access at runtime
To: Jiri Olsa <olsajiri@gmail.com>
Cc: Leon Hwang <leon.hwang@linux.dev>, bpf <bpf@vger.kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Puranjay Mohan <puranjay@kernel.org>, Xu Kuohai <xukuohai@huaweicloud.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	"David S . Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>, 
	"H . Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
	Network Development <netdev@vger.kernel.org>, kernel-patches-bot@fb.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_135625_410943_46EE8F86 
X-CRM114-Status: GOOD (  14.85  )
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

On Wed, Jan 14, 2026 at 1:00=E2=80=AFPM Jiri Olsa <olsajiri@gmail.com> wrot=
e:
>
> >
> > > fyi I briefly discussed that with Andrii indicating that it might not
> > > be worth the effort at this stage.
> >
> > depending on complexity of course.
>
> for my tests I just had to allow BPF_MAP_TYPE_PROG_ARRAY map
> for sleepable programs
>
> jirka
>
>
> ---
> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> index faa1ecc1fe9d..1f6fc74c7ea1 100644
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c
> @@ -20969,6 +20969,7 @@ static int check_map_prog_compatibility(struct bp=
f_verifier_env *env,
>                 case BPF_MAP_TYPE_STACK:
>                 case BPF_MAP_TYPE_ARENA:
>                 case BPF_MAP_TYPE_INSN_ARRAY:
> +               case BPF_MAP_TYPE_PROG_ARRAY:
>                         break;
>                 default:
>                         verbose(env,

Think it through, add selftests, ship it.
On the surface the easy part is to make
__bpf_prog_map_compatible() reject sleepable/non-sleepable combo.
Maybe there are other things.

