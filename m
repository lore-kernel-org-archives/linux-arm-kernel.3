Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCBC2D46BE9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 19:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zzAg8lqJi8CGVltcQNciuUESfJS837OPRMaiUqjansc=; b=LI7uWZr64pqfbfTFRuU0Vu2Rf5
	sgoMLTb6I0xuutLPoTKt49yOHZucz+sbaYk2UoMqnr8PfHhpEfFYdj5BVkaQUtvCf3uE/yixcPGSO
	FukuOyfYjEdYYNheoFCUmpDXTBxNSAnVDa7bkW9JC+ew8ftMlegu8sfxrNOCvbWevGdbOwbm1D7aU
	KqLOPJTbIOmcikpQu0m1/mJySwLhaTkwl7mjsmgSKtHVIQ3R+lL6SSPxvARV9CFcz6C10G4KvO/wa
	V23a3x+Ck5Co0ZPiTjzSSqOLa41ZI+/BXnLDuBz3UUCYoYPlSZlfYAl/oXKt91zOLQHEaZP+r3IO8
	nhP/kf+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlBHC-0000000GgRW-3gDK;
	Wed, 28 Jan 2026 19:32:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlBHA-0000000GgRM-3Xv9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 19:32:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B076760007
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 19:32:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67C75C116C6
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 19:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769628747;
	bh=IiwbjnmVlSFLLrr2f6Lv3b3fMnBrMPaG/Tsycyd1dhw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Kb+HaArR3As0IcZgqbCe+RnxV2EHO9zDCjJVspz1Gyu8t4fLAV2MFdEME3Q/jLAzI
	 J2XxBHPZ8ZIEEA0kSvX7Sc5LcHqQyrW8TZMOI+m+fsQ7P3SFRW0GLznGSyRHnO8poP
	 0fNHarOjwQgy3kYg406g817vo5xceHtpKf8TqEAcaqK7TtR58CkSx73TdRNsebqbpt
	 shc6ulsSEgK9+P9OhmItB9cOT+1uTw+8QQqSH9LnN8xNqRCepVOaNY2CgS/IcIT8C7
	 VUN9pE/7ZlSActDkW/xSdbij3TvhsOdarYoXTeM1ejfREh4Z/NQrRuxTnbNYzzR/O2
	 g/r3xB72zmNdw==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-655af782859so463267a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 11:32:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWDCt0ZNed+cIeBXPxMaTnc68hIrgwfZo1T5cfq429ss1Lzl2kZ6Jk2zpuEEkuRWvn9KslmzgcJL+StSZXnqYt3@lists.infradead.org
X-Gm-Message-State: AOJu0YyQ46fTkBXFf6kP8bzpP5W6q3Y5h+boo9QYv16sRzcTGylzQzay
	U6aYiLllbUV3hUoe4+hdx/mxHp7lGw2OIwBzccO3+T29kGeEi49qSb6eGlAhO0Wzgsm/sg08ii9
	z4WqoUQHZBy09lp5c1/1FGZ6VlNsUPqI=
X-Received: by 2002:a05:6402:3481:b0:653:9849:df10 with SMTP id
 4fb4d7f45d1cf-658a60a2a1fmr3733526a12.26.1769628745986; Wed, 28 Jan 2026
 11:32:25 -0800 (PST)
MIME-Version: 1.0
References: <20260128150112.8873-1-leon.hwang@linux.dev>
In-Reply-To: <20260128150112.8873-1-leon.hwang@linux.dev>
From: Puranjay Mohan <puranjay@kernel.org>
Date: Wed, 28 Jan 2026 19:32:12 +0000
X-Gmail-Original-Message-ID: <CANk7y0j-RYyRRGOe+twJxebtW+mW1bPPWjR32FFQwtLZYgqbMQ@mail.gmail.com>
X-Gm-Features: AZwV_Qiswo9Qd3heR-XulOgpYmPZU3b8UEXHtqM39bOgPFTkq8gNQ7vCrLWrxoc
Message-ID: <CANk7y0j-RYyRRGOe+twJxebtW+mW1bPPWjR32FFQwtLZYgqbMQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 0/3] bpf, arm64: Add fsession support
To: Leon Hwang <leon.hwang@linux.dev>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Xu Kuohai <xukuohai@huaweicloud.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Menglong Dong <menglong8.dong@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-patches-bot@fb.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Jan 28, 2026 at 3:01=E2=80=AFPM Leon Hwang <leon.hwang@linux.dev> w=
rote:
>
> Similar to commit 98770bd4e6df ("bpf,x86: add fsession support for x86_64=
"),
> add fsession support on arm64.
>
> Patch #1 adds bpf_arch_supports_fsession() to prevent fsession loading
> on architectures that do not implement fsession support.
>
> Patch #2 implements fsession support in the arm64 BPF JIT trampoline.
>
> Patch #3 enables the relevant selftests on arm64, including get_func_ip,
> and get_func_args.
>
> All enabled tests pass on arm64:
>
>  cd tools/testing/selftests/bpf
>  ./test_progs -t fsession
>  #135/1   fsession_test/fsession_test:OK
>  #135/2   fsession_test/fsession_reattach:OK
>  #135/3   fsession_test/fsession_cookie:OK
>  #135     fsession_test:OK
>  Summary: 1/3 PASSED, 0 SKIPPED, 0 FAILED
>
>  ./test_progs -t get_func
>  #138     get_func_args_test:OK
>  #139     get_func_ip_test:OK
>  Summary: 2/0 PASSED, 0 SKIPPED, 0 FAILED
>
> Changes:
> v1 -> v2:
> * Add bpf_arch_supports_fsession().
>

Please fix the commit message issue detected by AI and then

For the series:

Acked-by: Puranjay Mohan <puranjay@kernel.org>
Tested-by: Puranjay Mohan <puranjay@kernel.org>

