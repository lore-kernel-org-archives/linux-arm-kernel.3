Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7700C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 02:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KNxwB5jR27apFYwBn9D2kUqUcuE8WjWzuBYJrhaEbfo=; b=JEZztV+j6yEgpE4TheUBoDg7Kg
	5+EjfcMzEUfBJ4VXM+ODm4ENIKUYUmajvZQ6arq3OLh30g64lcb9+envXiO/K6Sl7wJrKip560GBV
	gugV0SmjWaY/PBokeA2SFOzhqzQ59cFI+0XvRo+z17d3zQfklhnTJqQa9B2YyJavs+z3MDbFQAY7J
	4qeh5MPm7WV1biw7694XZ6a27Ijbdssu5TFv/xxRpnQ99aaKXFPOoI2oM7Wy+opeyotmk6HnwD5ry
	XFzNPqFH27CW0IMwTOowuWY8JQ0mwqe1H67uwNBxEhcCxxSosxLvZBWN7ONkxctrKMvxWqi+IxC9A
	oXHhcFRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCUbq-0000000Dwec-426a;
	Wed, 07 May 2025 02:34:10 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCPsO-0000000DQnS-3Q6C
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 21:30:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 25564A4AF55
	for <linux-arm-kernel@lists.infradead.org>; Tue,  6 May 2025 21:30:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3E4BC4CEE4
	for <linux-arm-kernel@lists.infradead.org>; Tue,  6 May 2025 21:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746567055;
	bh=LF4XyTkcgWoicn7uCeNsDcChHQo5BLnimhFxKCYZDII=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fNluEQFkkeCwvPrfzIVWjNz/fxO7XClp4/+43s1LbqX5aWnCweVwRbbM2lIYlPpCz
	 pE4shwMICs31y+e3dEBL0qFiTMcHcQa6DaDtdijSyzGWXbbjB0hMmZioDeseLr5LdV
	 Bqm8W7lsCe7nxWxPzYGpJS2OEXeEOpbTANCxdQrXEirS3KWCwLf6Sh79/T5nqBXM+D
	 A38Hy9YlwRtnXh9GEgv+xaYXKVMviIpE+Tr/vWwHMxGfW3rwbvDmRokxWBFQRkA1OV
	 PY8L5UOfl7dsosAq05DeIbgW+tayqRx9TUDyQcdHmAp1X11LklEHfM946KdUBE/zBm
	 8dwZM/sqTM0KQ==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5e5e63162a0so9420899a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 14:30:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUHhOsy9Xdmtcba/4dU/yPlmgHLRXTrUpEfr6DxSzt54Czr/wS0MBW26nebpdsjmywt6lIhs0CQv6z0vGDjdXTy@lists.infradead.org
X-Gm-Message-State: AOJu0YwEaLVUGp1R8GGHfCtG6WF56RavMEI6ngDXhEinflkbrdT5YKEt
	xrY/FENxxtHkwZ0LaTKL6VwCUSLptU6ajz7BP7BaepnV6/4dpJ2k6ZPMlTrl0Jf351SNIYfTwtq
	9I1ptjLkpq26NEDBWpuRlA+EXng==
X-Google-Smtp-Source: AGHT+IEnd5G8SKlNRW5w4iFO/mLcDtaGwA9ndk5+resb4iEheEVI1rHK1zs74rWur7nF5rXXl5sEz573M/0kmSBOH+I=
X-Received: by 2002:a05:6402:1941:b0:5fb:9f73:d0e3 with SMTP id
 4fb4d7f45d1cf-5fbe9e29f20mr703063a12.18.1746567054358; Tue, 06 May 2025
 14:30:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250407-arm-brbe-v19-v21-0-ff187ff6c928@kernel.org> <20250506154702.00002b57@huawei.com>
In-Reply-To: <20250506154702.00002b57@huawei.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 6 May 2025 16:30:43 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL2ZeNhpm3E=xVEtdiwGXV7Ni4YpdYn7thvbgt7Gn-QUA@mail.gmail.com>
X-Gm-Features: ATxdqUHdtGklHSUrSP-OlxuranOH14q1bQqj56TmZsXDcW7Zo0EE4YurWkIdGsA
Message-ID: <CAL_JsqL2ZeNhpm3E=xVEtdiwGXV7Ni4YpdYn7thvbgt7Gn-QUA@mail.gmail.com>
Subject: Re: [PATCH v21 0/4] arm64/perf: Enable branch stack sampling
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	James Clark <james.clark@linaro.org>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Leo Yan <leo.yan@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kvmarm@lists.linux.dev, 
	Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_143056_980346_C94EE561 
X-CRM114-Status: GOOD (  14.94  )
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

On Tue, May 6, 2025 at 9:47=E2=80=AFAM Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> On Mon, 07 Apr 2025 12:41:29 -0500
> "Rob Herring (Arm)" <robh@kernel.org> wrote:
>
> > This series enables perf branch stack sampling support on arm64 via a
> > v9.2 arch feature called Branch Record Buffer Extension (BRBE). Details
> > on BRBE can be found in the Arm ARM[1] chapter D18.
> >
> > I've picked up this series from Anshuman. v19 and v20 versions have bee=
n
> > reworked quite a bit by Mark and myself. The bulk of those changes are
> > in patch 4.
> >
> > A git branch is here[2].
> >
> > [1] https://developer.arm.com/documentation/ddi0487/latest/
> > [2] git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git arm/br=
be-v21
>
> Hi Rob,
>
> Expecting any changes on this?  Anything specific we can do to help then =
shout.

I hope not. Still waiting on Mark R's review though... I'm sure there
will be something and since perf drivers seemingly only get reviewed
once a cycle, I guess it will be another cycle... Sigh.

Rob

