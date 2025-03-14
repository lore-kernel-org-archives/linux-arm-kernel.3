Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C489C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 23:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nVsn+tfKHHydjyMGFQzYaSfWZr4r8NiOObk/ROots50=; b=WljpHKlkeeKnuC5wzFMO837fUF
	1jDUP458Cnz+dzXXUUR9dq5yU4sDebISiColAM7tXV6InSMR8DMN9sJsxgDt6qcahxRQXw5DgN9VF
	OZPTroYhfhb1gyc0lMw1iwRDJeMLICcj5MEDzcPm2+0ZCvs0d8OweCDpbPVOwyigOZd5J0ji/d9c/
	0II+iJV8HvJNpGUgUoWjmJTe7pecBTiRu/+zDQrXTYLcQ4JnaZlujXX+UVhIR1N72yC1ZpEa9wPdq
	7IJBNSTVueQOYatZPjK4oJetZvT1J4jWHoOM0fxKCC4IgqfJmcO5/34KqYNpy3vQx305XweMHqpj5
	Ivcjkfmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttEf9-0000000FWlj-1B5n;
	Fri, 14 Mar 2025 23:41:59 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttEdS-0000000FWgI-35rk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 23:40:15 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2239c066347so55098065ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Mar 2025 16:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741995614; x=1742600414; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nVsn+tfKHHydjyMGFQzYaSfWZr4r8NiOObk/ROots50=;
        b=Wxvs8Q/baSLiZPOLMhZ9hO9s4GBp/U0/IJsDV2KpjDfJdObpCAwMD8Ib0DYZAzuJfA
         okYAs0G6wDZd/ZWr/844Zr1QRASA0BsyybdXgEarVduwPB+mXM5f7RNBKCm6xedggFsO
         6om85EGq/C1ShQma8lRnkDPBIK6FXKXykALXalxcDq+L+Q+DzeL7maBPMkwvpKD1kH9y
         ClgfdnKinmj+uu053BX/b/uc1kXNEd2d4fulITfYmjieNbzCavt6R3ovDO1UYVNNR36K
         5mJo+EmPUTc7LQpI5q5w3q/Qq1tLS5+2Y+x1/P4igE9qqBHHfKcGHi39rqXc31XgQlKk
         /hOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741995614; x=1742600414;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nVsn+tfKHHydjyMGFQzYaSfWZr4r8NiOObk/ROots50=;
        b=vckEtum+TGctYO7MA2BVkuJZhg8gjkEAfnZbmHCajJhC9OiBtmt/PYsuvyrQWHhNCe
         yTSVKe9RvbxFQLhU0X4GNWrEO+RVYM/CiAxxgnJeF6MShs6SLM6d8wlVMehEwS9UpiBB
         Lq/CbqQn3OSXE8r1M7fs8MVHlcvx2vWZYQ+ecWljrkZigPYeGDs8ghB8tGs4+NVuqLbC
         mj/gJlHasRFhZw/lijymLGKUCsF6KVzRFhjYB/5qaltolbddsd7YNW8MBADOwl3NNsPu
         XAJ9tig5Die5umbbcRXaaYC/fEx1u47TbjUO13Te51Hh/HqXCAY2X4cHvIUPpQOFbuT0
         p9Lg==
X-Forwarded-Encrypted: i=1; AJvYcCXDI4PXoulX1BoYfGNiYNkQhtcNodEq9Ih+/9nFKKy3Ku87tdVSi7hqh97sBDCBvuT51tXvDF14rYRAAwrNZ5v3@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6WYP9MNmovIZ3SR5WJKSJCIwrxnFYjFHLF1PQYIMzzBdD+HIZ
	V4MiwgQluL0X6PgOy6CMc/ZEf+vZKZ1XBEkAz0FByWyNSb/+AHYu
X-Gm-Gg: ASbGncs/3YXXhcVPBIo8dtQ7OwHz9lSdB9x+SDOofEkDNKKkM6twn1I+GOv+t7Pj/Tp
	XKz998zz9WOrxli2IVBrmXvGhcOQFDlbeDJv4iFsPQs7n1MxHTZzIgNwNhVH3XfmBqks+9RMVow
	idcy4EZR4gQAUq58J2JVm0mG3zzNhSYMVlrJH20W3Kbg7T+JmQWiGBTwyiqMGUomSsamHfSX0EF
	dqzgE4jKt+ABPS6fCfrx/+ySG4+/9Sty47Ks5T9huV5IZHftFWZK5ce7bljRfBAFNAFjvtfSeVc
	E0TEYlS1MjQqq5z639JH9eHdSf1JybtGSj72Mwxj
X-Google-Smtp-Source: AGHT+IGjOrXc4ow/tKqJ4tqaPFLLb7WlMrAJtuGww00AJ+3W8ap1jSuRZuNSWgniLxNwNri94jxBaw==
X-Received: by 2002:a17:902:f70b:b0:224:d72:920d with SMTP id d9443c01a7336-225e0afa009mr57678505ad.37.1741995613632;
        Fri, 14 Mar 2025 16:40:13 -0700 (PDT)
Received: from [192.168.0.56] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bd5c03sm33890155ad.249.2025.03.14.16.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 16:40:13 -0700 (PDT)
Message-ID: <f6f08d64c777a6022771ab0adf96cefb6b631d75.camel@gmail.com>
Subject: Re: [PATCH bpf-next 00/11] bpf: Mitigate Spectre v1 using barriers
From: Eduard Zingerman <eddyz87@gmail.com>
To: Luis Gerhorst <luis.gerhorst@fau.de>, Alexei Starovoitov
 <ast@kernel.org>,  Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>,  Song Liu
 <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, John Fastabend	
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav
 Fomichev	 <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa
 <jolsa@kernel.org>,  Puranjay Mohan <puranjay@kernel.org>, Xu Kuohai
 <xukuohai@huaweicloud.com>, Catalin Marinas	 <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Hari Bathini	 <hbathini@linux.ibm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,  Naveen N Rao
 <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael
 Ellerman	 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Mykola
 Lysenko	 <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, Henriette Herzog	
 <henriette.herzog@rub.de>, Cupertino Miranda
 <cupertino.miranda@oracle.com>,  Matan Shachnai <m.shachnai@gmail.com>,
 Dimitar Kanaliev <dimitar.kanaliev@siteground.com>, Shung-Hsi Yu	
 <shung-hsi.yu@suse.com>, Daniel Xu <dxu@dxuuu.xyz>, bpf@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org, George Guo	
 <guodongtai@kylinos.cn>, WANG Xuerui <git@xen0n.name>, Tiezhu Yang	
 <yangtiezhu@loongson.cn>
Date: Fri, 14 Mar 2025 16:40:08 -0700
In-Reply-To: <20250313172127.1098195-1-luis.gerhorst@fau.de>
References: <20250313172127.1098195-1-luis.gerhorst@fau.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_164014_792230_3A09A385 
X-CRM114-Status: GOOD (  20.83  )
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

On Thu, 2025-03-13 at 18:21 +0100, Luis Gerhorst wrote:
> This improves the expressiveness of unprivileged BPF by inserting
> speculation barriers instead of rejecting the programs.
>=20
> The approach was previously presented at LPC'24 [1] and RAID'24 [2].
>=20
> To mitigate the Spectre v1 (PHT) vulnerability, the kernel rejects
> potentially-dangerous unprivileged BPF programs as of
> commit=C2=A09183671af6db ("bpf: Fix leakage under speculation on mispredi=
cted
> branches"). In [2], we have analyzed 364 object files from open source
> projects (Linux Samples and Selftests, BCC, Loxilb, Cilium, libbpf
> Examples, Parca, and Prevail) and found that this affects 31% to 54% of
> programs.
>=20
> To resolve this in the majority of cases this patchset adds a fall-back
> for mitigating Spectre v1 using speculation barriers. The kernel still
> optimistically attempts to verify all speculative paths but uses
> speculation barriers against v1 when unsafe behavior is detected. This
> allows for more programs to be accepted without disabling the BPF
> Spectre mitigations (e.g., by setting cpu_mitigations_off()).
>=20
> In [1] we have measured the overhead of this approach relative to having
> mitigations off and including the upstream Spectre v4 mitigations. For
> event tracing and stack-sampling profilers, we found that mitigations
> increase BPF program execution time by 0% to 62%. For the Loxilb network
> load balancer, we have measured a 14% slowdown in SCTP performance but
> no significant slowdown for TCP. This overhead only applies to programs
> that were previously rejected.
>=20
> I reran the expressiveness-evaluation with v6.14 and made sure the main
> results still match those from [1] and [2] (which used v6.5).
>=20
> Main design decisions are:
>=20
> * Do not use separate bytecode insns for v1 and v4 barriers. This
>   simplifies the verifier significantly and has the only downside that
>   performance on PowerPC is not as high as it could be.
>=20
> * Allow archs to still disable v1/v4 mitigations separately by setting
>   bpf_jit_bypass_spec_v1/v4(). This has the benefit that archs can
>   benefit from improved BPF expressiveness / performance if they are not
>   vulnerable (e.g., ARM64 for v4 in the kernel).
>=20
> * Do not remove the empty BPF_NOSPEC implementation for backends for
>   which it is unknown whether they are vulnerable to Spectre v1.

[...]

I think it would be good to have some tests checking that nospec
instructions are inserted in expected locations.
Could you please take look at use of __xlated tag in e.g.
tools/testing/selftests/bpf/progs/verifier_sdiv.c ?

[...]


