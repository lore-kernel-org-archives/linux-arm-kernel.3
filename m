Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C61A3CD6E44
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 14:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tcS4djirQ7jCuPbZgRdCiKvbNxNqGGa9ynUDWxizWQY=; b=Xf+ppIJS3KXMOBGVoUQtoqUz8O
	+rHLLLHi3E9dAziEmHAunMU7wQbOypE6Q9IO+pcUTDN3rU2LhX3StKPKabXh3mePiZ7G4wehCaAY3
	sbSyL+ZrDfIknen0+Ipb6GF0/XKJ1W+r9OJw0UfsBe1J2KL1MAQ17NmZ6ps4cujtqMMBpcdA7GwEv
	rE2lQAw5RLzyju9qRgOpnvG7lR9ujHv7MugMHW3ZodA6K9rku/mjSHSugRW9PjM4huaSgRYGOHv8r
	D42A4MJ4XLVQH+DL6FVsOUM2+EKilVfM2PRdVRfsp75ta74CZMismJOeQ46mqvyV+zZ2blEqFSLH7
	ZSzsYz5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSbjf-00000005qvQ-3IEu;
	Thu, 28 May 2026 14:29:23 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSbjd-00000005quL-2cbN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 14:29:22 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-67c9616b4feso20087934a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 07:29:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779978560; cv=none;
        d=google.com; s=arc-20240605;
        b=gk2fr0x0KWBaoQRjkLHcSE9fdrcb85uJKIFV2Ko7yfo4zQyX72pLdPSpYiOlY3gY/G
         up1PDT3PPCA36DfvoBU6COPQGwtQdE6BtqtiRAeuIwRwZwhu8ww2zB7IPBE0DFdSvo67
         oH6RKQ7g6S4Gscz4L8q5f+oh7MtAsq+Ooh3VtFEYR+31eDpl6pALw5Q+ttIKitawHQhj
         mE334XWErO4CkDg7UdVEJ2f0pgj4yqOSC9v4I6K4f35gQrf96GzSP9fFmquE2XDocBlg
         Zs/15YkLCGPI1/2KMp8dJMvHDvpZbhGokD8Cn96djDBu4R5/q3GbqJHKIxai00dwj5T6
         LL/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tcS4djirQ7jCuPbZgRdCiKvbNxNqGGa9ynUDWxizWQY=;
        fh=gwnJ3emC+HUdfDF4A8BKxEA9ZTkCtp4FK0vWVp1Mq1M=;
        b=ZWjkgp/tbx62QxfLMbVhiWwQ23qBvy/O4fbXJmddrVIFUrHsJB7UumpsynX0a7qqsa
         ssi92ZgCslYzGzC6PYNSduibD6zphAN53dU/LtdH8Z6XNaVrBed+CwiWJ8abHpeE+rZ5
         5AM3qo/3X2KrAh/DEu9x6qsD0sg95E1MMV7h40eBbLqbMZxaL8gjMbZMtk+0vgY51uux
         r5fRXJ8pp9nwkrod+Vc8Rlcg0Ymu+NmuzcA3BVEALmZgRAncQe0pXXtNToCEhJKPn2QV
         zLwjKOdeFjNscQCn2jRTAfrHJQQI6uNKP8bWqtiOECi8M7/voBCU1EUQROoHE8ugiJX6
         v34g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779978560; x=1780583360; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tcS4djirQ7jCuPbZgRdCiKvbNxNqGGa9ynUDWxizWQY=;
        b=HhxHw7NiqD+hBQCtswdbr/K+h+hJrOR4YF9n0b+w0rgxHGS7g4HhMnXJeBQLtufvv7
         /CQ6WWNIl77J/E8rBhabPvvHZysEeCom/XQQG7lCNqstL0M7KOr6IXJV7xWTAKughxyN
         X2dP/zG+Q5hv6iSCeedcvpz+Y2MyhuvXqa57RPNfem+V9+9z2FjBvTAqS7ANK6UgqL9q
         L0yKshYZuLWontxAFE9pLqyksh1rEa2n/EZugxXaNH67OfANygIlCvWAemwH0LvMeGmd
         Ygi0w58TwFcuNod6VW5Lt4QwAqvmrinGvxV210OvMJyL0x3X0IAj1K7+bVv1M6mtzZ7w
         AQ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779978560; x=1780583360;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tcS4djirQ7jCuPbZgRdCiKvbNxNqGGa9ynUDWxizWQY=;
        b=lSpMM73bEB/tmyTyBuMgdA+w/h/6p6Ol41EqcjFlfTaB7C7/LvbVhx+L+r+I3fuGeG
         nPUXld/D6WyOdYd9g1mRAD7EL+9wcdqB2eKhEEdOiIB0Nc/eOi+EOXZxfgFx7U/xP+eO
         ZyAjEZWwak950y8z6oEIRaC//irfWWRN9kMpBvduy4OAL5X8Hk6Mve0JqB+btLBLJ20H
         KhwJILrQo0JSvCdUYZgeih4cVvLGJR28gTcWeYYAG/6M4l3xhkVKOKNKMxEsPevuK2Qf
         PSU1v9peLaajkEI7nC+sJsW37nJMoWeiFo4TYt7A9ScFqEF3664yY1d6UZvIg6dPDNAH
         HQSw==
X-Forwarded-Encrypted: i=1; AFNElJ+yIXjk58BqMK7YAATxPMopgbPdUaadPVlPVN/XERKY3/m/kvQa+J1FRZA0t389wweWLoOM9Yhld7QaJrikldcJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzduELNeKfC0CSNEJIb++Hk8W1uXOzYIwSuvMlUV3VXRvBUomKy
	1Df1lDLpe/2JlGvzdlYXorXAFn5g/ViHlN/5j+8PrF3LMveqfeQ15wUUqdoS8c0nq0TrYmTfopD
	rbRC7726gZ7EvO7qMem6E7WrGcafJn4Q=
X-Gm-Gg: Acq92OF/6T1TL6uvzEy6boDOxk1oGSZfAigFwZLEfVVFkvvUoublEn71X0j05eWQr2I
	ZpZDA0TLpoN4u56gVLtFjvDsY9jYNjgcKzS9mrWOLc7mKHasB07LCL6RJmt615dqT7CuYeOmQPr
	0RA03dhahumB+R2LVmYSrj6I1IEC6LyofDQpRYRLCIrv2QgaxGOJ9GJRNSlWCTvO/121cxxa/as
	FP0LvZBuV+nSaaTDX68pnQQH572/M42ghaI6bsI0WX6m9cARw1j7DeqCmz2V0thK/WEWPp2A2g6
	S0TEYx/5bpcAf8vSTkWfCA6wNN7nrLYVQg==
X-Received: by 2002:a05:6402:5245:b0:683:5589:4317 with SMTP id
 4fb4d7f45d1cf-6889c43f438mr16097714a12.11.1779978559466; Thu, 28 May 2026
 07:29:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260427234801.2104511-1-puranjay@kernel.org> <20260427234801.2104511-4-puranjay@kernel.org>
 <ahhGVf3RSWuMk0ph@willie-the-truck>
In-Reply-To: <ahhGVf3RSWuMk0ph@willie-the-truck>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Thu, 28 May 2026 15:29:06 +0100
X-Gm-Features: AVHnY4IxAMzVUf7Klr6RFJQ7T-EB9G9CeanOxKaT9tIv-dLEfZRdJbL6TplpLhw
Message-ID: <CANk7y0hMXmGuu9SrgXTaTHt5c460d6_PMxOLf_K=k90_9yU0ew@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 3/3] selftests/bpf: Enable stack argument
 tests for arm64
To: Will Deacon <will@kernel.org>
Cc: bpf@vger.kernel.org, Yonghong Song <yonghong.song@linux.dev>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_072921_678300_779EF54A 
X-CRM114-Status: GOOD (  13.81  )
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

On Thu, May 28, 2026 at 2:42=E2=80=AFPM Will Deacon <will@kernel.org> wrote=
:
>
> On Mon, Apr 27, 2026 at 04:48:00PM -0700, Puranjay Mohan wrote:
> > Now that arm64 supports stack arguments, enable the existing stack_arg,
> > stack_arg_kfunc and verifier_stack_arg tests for __TARGET_ARCH_arm64.
> >
> > Signed-off-by: Yonghong Song <yonghong.song@linux.dev>
> > Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
> > ---
> >  tools/testing/selftests/bpf/progs/btf__stack_arg_precision.c | 3 ++-
> >  tools/testing/selftests/bpf/progs/stack_arg.c                | 3 ++-
> >  tools/testing/selftests/bpf/progs/stack_arg_kfunc.c          | 3 ++-
> >  tools/testing/selftests/bpf/progs/stack_arg_precision.c      | 3 ++-
> >  tools/testing/selftests/bpf/progs/verifier_stack_arg.c       | 3 ++-
> >  5 files changed, 10 insertions(+), 5 deletions(-)
>
> Do any of these tests pass more than eight parameters? If not, then
> they're not touching any of the stack stuff you added for arm64.

The test "test_two_callees" has ret +=3D foo2(a, b, c, d, e, a + 5, a +
6, a + 7, a + 8, a + 9);
so, 10 arguments are tested.

But you are right, I will send a patch to increase all these tests to
pass 10 arguments so it increases test coverage on arm64.

Thanks,
Puranjay

