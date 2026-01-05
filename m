Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D3CECD0409
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 21:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2AQgacz8x6LTCWKBQSLIrsMe5Rnqw2MnbZkxJhjnGKo=; b=QwFzl9ZtTeUMTTMRATNWjnkrIh
	02TthZ7PkSDqTUb3UnXIEsB/m/0speEQbYKuDqBMI8zODD3jtAJcz4wu3qptYdNBYMOKNAsVie0ed
	fL+I4X4BPQjCaVtQDN/rLiU9JqjiNNVtpPWGevxQyr0aSrF/HkqaZDLBAsO39GNG6ALk/JTu+kwX+
	3vdHriaxx5a18uF2ou854qjldnDfgmrtGi8OdclIq3sJB0Y0PaBO2y/Sf+PMqdcZ2ApGKUHK9YTgP
	6APk+O2vtcuyENP4+b5hKh7vNn+J1A1h1DwmFSMofy6yFPXRvu3oP65jYDCYbwTsh/Q6XtYmCyJij
	Xg7ZfEfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcsP5-0000000C8Ue-3cij;
	Mon, 05 Jan 2026 21:46:20 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcsP3-0000000C8UJ-099A
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 21:46:18 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-b713c7096f9so65849466b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 13:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767649575; x=1768254375; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2AQgacz8x6LTCWKBQSLIrsMe5Rnqw2MnbZkxJhjnGKo=;
        b=PQ/0GPBPjZoFAsAaza2BX0FHS85cVHD0un/2IWi79BC+rtI9g2OK0x8i4h73rzBfTA
         9ZjloI8FHGt/YBbSGA6I6KB2s3qV03Tltufrn9b56zHSd90o82TfwIefjoD+lEOaI4R/
         zB/ZCcC4gne8E0AMV5iDjPXJ43wTROOpkxeWJoIQMJdK4E5GLBfQvTlBJ9JW/Zbg5oCq
         PtBd+egx6SHS3b+TRwEbpTgYMBvLyQE1eQ749cKC7N8eiobcrB7l2iiyFxi0Q27bON6p
         TP2oTCgUnQBtvZu1k0Gg7SM5RESxzOxntcGN6+CIQ7Zfkj5dNqIh0/w92x/IrDEXeo0K
         iQYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767649575; x=1768254375;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2AQgacz8x6LTCWKBQSLIrsMe5Rnqw2MnbZkxJhjnGKo=;
        b=vmnqZel2qprZa4472lUW8ewQ02XTYaPkbee1nDDZuOFXQ3T64e6Rtr+ZrMvtG3Xf+a
         dmN9TdK/nvWCxiYhEs/Th6rBupZYC6ypjhUDz7/VPpab9FxkOXR1zU9YR12vhdiHgZyI
         hIXMh7SAZZUhxPcC5JUPnO9gjH92x/Myo6mmC5IdSBul21TWb+wOEbS8og+rrWX47uyn
         mnBhOZgMAbaCy6nHUg/B5UhD76OeTBwVNbAUNEXBNTBoujgtP4qPTput4cxqycevdpAE
         oFfAS0vxC/+p2Hma+XAENpCVmK7lwGT5P3lDpNVSKPhKcF1+88dCXFP088A3mZ7deFSb
         BsYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWP2Q6EdijU9Czryo9N3oLK/VBq/x6k6rpauFN/QtJyz/yNxacYgQ1fGqv2V0npWcyp5MfkQDVtfWYjpOPnFzZV@lists.infradead.org
X-Gm-Message-State: AOJu0YyHdt1oZ+BJ38wSoc77Ugp5o2ZmjxndpF3qzZokHrG7demWP+oQ
	AWjrgdQR0wAmg10oArzE7eoTiayvUzF6PB98CfwvGprs5DO3FqCy+f/ieJCTCjFcTBg/PQbWq9P
	tzdaxjbdPIl6MuhOy30NmEl1L7LZWrKM=
X-Gm-Gg: AY/fxX5DRoPLGokUNnTSo1HtNQc0dKht+O56PLiYPzZD5wYzBfhuRjIpQRTCEEAaHpX
	l1vbG4Rjh08KvUOh6bPNzr9UOUHuaFIh9u9w0Gra4lau8HdipdTtpPl5uV4VDCyqyJoq/XS+sZ6
	DMJN8qKh6b6bx3LIoJ9dcscc9jLA2OBPBu3lXhTg1oErZZbxAVMvhZ4z0Juglam2PSvmx73f6IB
	M2ZK8hJWTLgGpAMtOW9nREs2yn0XdeYS/DkqHokWTET9dnifpIs1QlIqnx1MAUwFL+VsTwR8vQZ
	is3JGunokkM=
X-Google-Smtp-Source: AGHT+IF1rsCaTWKuHuU/DdNT/WlhCRwDnxcpN2RA6MA+qVhMgphIIIFwK8xfuiaraadBaRIRPf+t5spMfoiLc7jhNv8=
X-Received: by 2002:a17:907:7294:b0:b7a:1bdb:30d9 with SMTP id
 a640c23a62f3a-b8426c263a3mr99860166b.65.1767649574761; Mon, 05 Jan 2026
 13:46:14 -0800 (PST)
MIME-Version: 1.0
References: <20260102214043.1410242-1-puranjay@kernel.org> <CANk7y0j7hAJ7OcH_HgN0cVGnUh=iBz=iuD9sYZmSy-koMjB_cg@mail.gmail.com>
 <20260105212213.GA336318@e132581.arm.com>
In-Reply-To: <20260105212213.GA336318@e132581.arm.com>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Mon, 5 Jan 2026 21:46:01 +0000
X-Gm-Features: AQt7F2r2qkyYhWt9Ro6mLpJTWDlG9bogUxKNqnFN-4AlLZBj7oPXj2gxwhDnz3M
Message-ID: <CANk7y0gb8TM7obqWgaNY3aK_TZLX_nivYEATv2GndN5Ghz1hcQ@mail.gmail.com>
Subject: Re: [RFC PATCH] perf/arm64: Add BRBE support for bpf_get_branch_snapshot()
To: Leo Yan <leo.yan@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Breno Leitao <leitao@debian.org>, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_134617_111981_9E3F84F7 
X-CRM114-Status: GOOD (  20.73  )
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

On Mon, Jan 5, 2026 at 9:22=E2=80=AFPM Leo Yan <leo.yan@arm.com> wrote:
>
> Hi,
>
> On Fri, Jan 02, 2026 at 09:51:15PM +0000, Puranjay Mohan wrote:
> > Hi Catalin, Will, Mark, and Rob.
> >
> > I don't have access to BRBE enabled hardware and Qemu doesn't support
> > this as well therefore I just sent the compile tested version.
> >
> > Can you help me with testing this:
> >
> > The relevant bpf self test is:
> >
> > ./test_progs -t get_branch_snapshot
> > #132     get_branch_snapshot:SKIP
> > Summary: 1/0 PASSED, 1 SKIPPED, 0 FAILED
> >
> > skipped for my setup as it is not supported.
>
> eBPF selftest build is quite heavy (many dependencies), finally I built
> it cleanly.
>
> I did a test on FVP RevC, the test hit NULL pointer deference and kernel
> panic in armv8pmu_sched_task().  See https://termbin.com/peg4, the
> backtrace should can give you hints for the issue.
>
> Thanks,
> Leo
>
> P.s. some logs are duplicate, this might be caused by two cores both hit
> the NULL pointer issue ?

Thanks for running the test, it will help me debug it better. But as
Mark pointer out this has fundamental problems which I will try to fix
first.

P.S. - The test on FVP RevC, does this need special hardware or this
is an emulation platform, in the later case, can I do the test myself
somehow?

Thanks,
Puranjay

