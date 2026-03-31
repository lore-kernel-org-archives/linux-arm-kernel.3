Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF84109B468
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 13:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lyzcvyaYCGVUi9yrNol1TrvSRR8R4hP2IEaQrhe4x1w=; b=w8UdOf23juxveoD3IjCZIdR4dx
	W02PtKwosvsV1XePYRsbqlKjf5AwmEVxKO6GoNmQyJdj9CjvwwJE7MKjfCQuapxp0z5PqpkrSTdD+
	qYADBx6N/ce3ieRlaQtLLQEnWf37FGOIz+WiLHL/87i9/2LW1PaLz0f7aIC477JHzIUmiMv66C2Ed
	xwoTt5oazr7odzc7FABj9e99YuwQAjLPMd8+JMvXYeFXvvxRMtl0SERHT5T/mCBbEZiGx17H+rJos
	2zBjzGhPNYA0vAu0MKCOTkQe14uWiDeoLtMkJIw7+MDkm9Jai3ckO114r5gOpqQSUtAW3t+s/U00s
	dSXp2uWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Yzr-0000000D05X-2MgP;
	Tue, 31 Mar 2026 13:19:07 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Yzp-0000000D054-1VGP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 13:19:06 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-43cfd832155so1455395f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 06:19:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774963143; cv=none;
        d=google.com; s=arc-20240605;
        b=gOgbDE6Te22RwHx5djU8vuQ8Tc4gxril2ut640qAklIKymrP2A+eDE1PUuR2sj3Hio
         Csr9X7WOHz6akljXbqMlH32fddiEoxvxsgfAKI+D0VYQnUcxzpmk0J9jtJhj617+0gmu
         92vU9GEtVuGw1sMDkeLL6J0E4Apkxt+kJlZ/Vu/zpZmjnGJnyu5PAXE5gy8RyPtCmHdN
         TS92kU8uEUXJ5djmgQJEDoZFDKv8hJvZOTsHvSpPzahrIx6lkYR2x9o7vu/PVxX2jO3q
         2RIzthAS3JbMVepIEX2nHU8/0NmBhpQEq7ReLa5kLezTaqpYriQC/sTF3vkbtbGpkVD5
         BErQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lyzcvyaYCGVUi9yrNol1TrvSRR8R4hP2IEaQrhe4x1w=;
        fh=X3/q4FVNXTl4QIaaUmk1wUjmxs4r1P8gzra9Gad+S74=;
        b=Y8w3mnxL2dCjxWAZTKXS/g1OA+oPOgPknmVCgh9lhIrzhYr1a0uUc0K4v1OQyZBl8L
         8x+9IugmWQ1e61OHkmIGtHFB/p8lQFdWElu/N9f2LQjDH+zux2Sd3V7ZyeKV92KKPsd+
         rT556KcwpQ1KN32rpa3bx/FQZEvIIKBtDSaPdkcQOCyE8zM/f4AS7ehrfc1KkBurO83C
         9l1FMzy5DEMf06udcBt5DjAv+VfV/wvEzuE2m12yakclOXW4BW+KsYUe2plpv5+X36+s
         AZz9X0rsqzzSjSHsF8nGVBnadagzIciRAOwEOOvuyjZMNiuZiSRpZ1mMsJFmUylG+Y3n
         J8tw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774963143; x=1775567943; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lyzcvyaYCGVUi9yrNol1TrvSRR8R4hP2IEaQrhe4x1w=;
        b=Fomkr7ndsoCv+O4ruIiGkzj69bfR9jD6MELCFZqPNH2pOsBBdRNeUoOdhbru2YTVUE
         xGda7NofUNSy8bPhckwUUXq+dxYyVMmfI2uip5Rq7rt0TR73Pk8jdPLcQTfbklhwQYA8
         Lnn2EEtC1heo5++6/CCiXMBOSwB+OoA68/yUwE/CclM4iRiIrBi0etm4DJb6JDQ/kIG8
         XJHn6MBIqy2khXWbqID1+8O+q18hpuAh99OBbvup5zE0Eo7agMttLxxs13l33ISgWVFw
         96bG6z0iY2wzNSZrb1FxfcZi1PQ1qTGQWtTLvVvvkSXGvsGAyLCuSGVcOrn41fN1z7xe
         Shtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774963143; x=1775567943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lyzcvyaYCGVUi9yrNol1TrvSRR8R4hP2IEaQrhe4x1w=;
        b=ZAlOR74MXRyWCRpURzuVlehxlOsRrK2SV8LG2mutbufaxkvZUVrVw0ikCddUYt693t
         58wGBGoNcsSHgmVY3a04wC2+eIIEbgMuGmCDkHcX2gTu6o2er2MPqz4+jPvt3UvIldsW
         5YwquBwYZCA+82WCE0vd+szC2vWX6dTdbPw4SBI9bhQSXlwLXqyn85KyqdhC71pMqaLk
         iO57wxy8VcemIeAVbVi1XezAL6ksoo23uyxyO8WXFeRb8LwR7VW9ZjEP/G0HRjW3OGKn
         9uVpkWvGuRghMwryaienfSyb0Tr6ChacMO8srQP7YMxCENvszWs7Z5Z6MtfoL5DUgvU7
         Ylog==
X-Forwarded-Encrypted: i=1; AJvYcCVPfezIBz9OR92zejuN5RsGSgmZn5phuKmWstQTQgVG44MioSxxQbtZi5nKj9efqLbrA4QEw2IDbjZ/a9ankGzw@lists.infradead.org
X-Gm-Message-State: AOJu0YzHacUd4tl/lLNx3RT0tVfDS4YA10WbUQy1aZNoyw2tjBBp+5KG
	qs3ouH2AkZ3WUNs6FOZugNdr4ESju48caAO2k4DhB65EWw2rwWLZgK95b57Pt2/5MqNU43QpblT
	1UF5xS8SlSlVZWfARohTt6NixxAkCu5g=
X-Gm-Gg: ATEYQzwVUU/6QsifvJamR6dVHYoPj7EAB4HUSdXTAJ8MYRcWq9S1Yiy6PlPgqN82OKp
	XyV090wfhvhXt7LMPPLjmRpoj5Shw1QO6cBI5aUjWASaJboxoW9g7p7WXE1eySUEPqjp5tgTUQt
	HstIdJg2qh5plby2SAZ155PTs/hhoWup9szqM7tGYsS7KDceLMSkcu14kEYcwhuLtFxexjyq046
	KjBLPkTBEVBmyraTRW1iitbbFqSWqIQFY8rh5K4lnCPAEczp8rR07TrAht3yH1okcdu1TQM142v
	WHb0OiA=
X-Received: by 2002:a05:6000:26ce:b0:43b:3e34:7fe with SMTP id
 ffacd0b85a97d-43b9e9e8cf7mr28614862f8f.21.1774963142825; Tue, 31 Mar 2026
 06:19:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260318150245.3080719-1-demyansh@gmail.com> <f9bc0534-4b7a-4b14-974b-4d7811ccd899@app.fastmail.com>
 <acJhCCPfVxjFUZ5R@J2N7QTR9R3> <CAOLeWCsxhzdxQviizJ4X4VOp_28LCtO-RjWoCcZG29rQw86NVg@mail.gmail.com>
 <9a12e043-8200-4650-bfe2-cbece57a4f87@app.fastmail.com> <20260331063659.GA2061@lst.de>
In-Reply-To: <20260331063659.GA2061@lst.de>
From: Demian Shulhan <demyansh@gmail.com>
Date: Tue, 31 Mar 2026 16:18:51 +0300
X-Gm-Features: AQROBzBaGepPtd_VWMHro3KW-LD9dB2qVKP_uq1I2sDMcGkC9q030qEeq5iFVi0
Message-ID: <CAOLeWCtnZz=kHGk4C2f9Mbfi3tEBE100iCkMBhcG47dmR9eDWw@mail.gmail.com>
Subject: Re: [PATCH v2] raid6: arm64: add SVE optimized implementation for
 syndrome generation
To: Christoph Hellwig <hch@lst.de>
Cc: Ard Biesheuvel <ardb@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Song Liu <song@kernel.org>, 
	Yu Kuai <yukuai@fnnas.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, robin.murphy@arm.com, 
	Li Nan <linan122@huawei.com>, linux-raid@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_061905_415217_1E19EB52 
X-CRM114-Status: GOOD (  27.85  )
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

Hi all,

Ard, your questions regarding real-world I/O bottlenecks and SVE power
efficiency versus raw throughput are entirely valid. I agree that
introducing SVE support requires solid real-world data to justify the
added complexity.

Due to my current workload, I won't be able to run the necessary
hardware tests and prepare the benchmark code immediately. I will get
back to the list in about 1 week with the requested source code,
unmangled test results, and further analysis.

Thanks!


=D0=B2=D1=82, 31 =D0=B1=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 09:37 Chri=
stoph Hellwig <hch@lst.de> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Mon, Mar 30, 2026 at 06:39:49PM +0200, Ard Biesheuvel wrote:
> > I think the results are impressive, but I'd like to better understand
> > its implications on a real-world scenario. Is this code only a
> > bottleneck when rebuilding an array?
>
> The syndrome generation is run every time you write data to a RAID6
> array, and if you do partial stripe writes it (or rather the XOR
> variant) is run twice.  So this is the most performance critical
> path for writing to RAID6.
>
> Rebuild usually runs totally different code, but can end up here as well
> when both parity disks are lost.
>
> > > Furthermore, as Christoph suggested, I tested scalability on wider
> > > arrays since the default kernel benchmark is hardcoded to 8 disks,
> > > which doesn't give the unrolled SVE loop enough data to shine. On a
> > > 16-disk array, svex4 hits 15.1 GB/s compared to 8.0 GB/s for neonx4.
> > > On a 24-disk array, while neonx4 chokes and drops to 7.8 GB/s, svex4
> > > maintains a stable 15.0 GB/s =E2=80=94 effectively doubling the throu=
ghput.
> >
> > Does this mean the kernel benchmark is no longer fit for purpose? If
> > it cannot distinguish between implementations that differ in performanc=
e
> > by a factor of 2, I don't think we can rely on it to pick the optimal o=
ne.
>
> It is not good, and we should either fix it or run more than one.
> The current setup is not really representative of real-life array.
> It also leads to wrong selections on x86, but only at the which unroll
> level to pick level, and only for minor differences so far.  I plan
> to add this to the next version of the raid6 lib patches.
>

