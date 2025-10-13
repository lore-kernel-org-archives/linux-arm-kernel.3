Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B8C5CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 09:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2cY5pJObfGgpMBLjEh34BMdDJO3is2w6d+mwNZItIM0=; b=F6RQXmEbd2TnSoLdy1bU9cDmQJ
	QowONGqF38RW66TwissHJQ8z0sPOdAF057wqN+k57xlZ2CLe94BNRDIWotYd6YXMPIfpWROBemCOQ
	OrQNCebhxtBC30arWHztVT4jeVlIHQ9W5+GP5IlqRXQnXUd6bBHTqvff5rTCUgF59COSxPpAXOz4X
	zi4A3h5WVilMVtH5yZ8RfRDqHZjl2L25XCeUeAo1az+BiUJtiyx1mGy+0mjwgBKWSXLCNStGwOpjg
	5X3VM58bqIgNppROkNnCGljVdcpmtvRDY/YxAYa8MbXl1F9VKxe15wHYbB1VV9p/1pDtLKdJ1Xiio
	vpKSBubQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Ev3-0000000CkSr-3QpB;
	Mon, 13 Oct 2025 09:32:41 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Ev1-0000000CkRp-2Uif
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 09:32:40 +0000
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-42d7d0c58f9so516385ab.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 02:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760347958; x=1760952758; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2cY5pJObfGgpMBLjEh34BMdDJO3is2w6d+mwNZItIM0=;
        b=PuWPDXOpEeV+Za6Idx8ygB7Z6fATrgoKgZJRA3U/lPmnb8M22w9POcsvOmEUa1t3Kk
         j2DnzwZPNjc2kAG5+4pj58MGtMij/fg3muYLdPU9akbqdiGvXI0OM2/WdUHTBouWKSY+
         tKioH3LvSyGEwbMeqJVK4sWFbIhg2B8QEBl0NrUqkkX0zeGIfD2wxk9ygd2jfrEn8KfI
         3BPfbv+mMvDWt6Vi3M7vWvUGweBbj5aPUUV6MrlTKeZvo+qFWX7to809F9TFafwrmoQm
         tm+Qb7zvqI5pi0JLE9QEq30DZYU0dMt+NomS/QHj8d8Pf9L86T9WHYwUkh0G8o1DUgj8
         BzgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760347958; x=1760952758;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2cY5pJObfGgpMBLjEh34BMdDJO3is2w6d+mwNZItIM0=;
        b=cg3E4XCFJqTNjKWWwb58SkjaRdgAHOrleb8cFvff8RHU7R2Tj6lWS699L7e11mr6Cz
         W/2JMVcnRPQ7guSv2MO60i1MdJgd7VWkHRsMNmbJG5SnUPVx92CJH2qgYC7chRKsrZsk
         +pPgfgOqgCdNZMFo/FdC9Xsrufj30pnFwJo7jRvdWl+941m7rT+wFPBhxUQ9hzmlSSEJ
         gJsm+7a8UpTZ4gGH/F2N2SCziIStdp6sHwL1ZnidOKF18uxznBHiTGGiJY1xgsoalhLj
         aeysYqh6R+rvHMCGZanBP0ljsJcKGjQAAiz2YyYSH8miDPj7np5nnSj58bAFl8s1iq54
         JWpg==
X-Forwarded-Encrypted: i=1; AJvYcCUf26mQkJwoyKfacOXV3Nzh9TEoofYvgxTqpwBnLzEVgDYjdmqGexLmSDa2LV3t2aTJCP/LrlPFWUflLOpAG1lk@lists.infradead.org
X-Gm-Message-State: AOJu0YwPvhWdbUNQoGAN/H4SDvDsl/gHkunOxIIm9yJOqDPqSDp4n2WY
	5wj/QRUokU0p0ds+7Ik6aomynumM2QX3FzLFdstUpShIxyosjIlhHg6tw/adJevzTFmk04qpsPL
	7rQCq8I6nsuyvEcU0NjfuJiw4egw4UWqEMYS4sFHW
X-Gm-Gg: ASbGncvXfDaR7YxAj2VPrGmTK8nUiLYQSQkqIJNRLRhA1UkTXucVZwKwIdrEbjv+fBg
	Huq7GDzwvmtplJV8Idd+9guGooNcXEDaMtLsi+Dpdr9RPqyPyd1ZlEC1mxGM6w0ek4go+o+mgJa
	F0O2TwOsZWBwyLQaL7xWW2LE8I/erGtQ2isV3xPefa0B/MY6aWZeMstHwCl8WQ0nmdSMmVoBEhd
	5EPlfyImA9wze6HHJ+urQlLo3vWwfxdnHgtcEepC5eApWEKPoXBo2mAWrWE9r27Bdc0Dho=
X-Google-Smtp-Source: AGHT+IFD0U0uqRWglh/byx1FjKPjMX0/8ojaak8mgzvQHmpOzLLzkC7WYtfOUF9FNclcN4ih9bpH9zBVGTGC6vHRbs8=
X-Received: by 2002:ac8:590e:0:b0:4e6:e07f:dc98 with SMTP id
 d75a77b69052e-4e6eabcf4camr36864821cf.9.1760347957508; Mon, 13 Oct 2025
 02:32:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250929155001.3287719-1-smostafa@google.com>
In-Reply-To: <20250929155001.3287719-1-smostafa@google.com>
From: Mostafa Saleh <smostafa@google.com>
Date: Mon, 13 Oct 2025 10:32:25 +0100
X-Gm-Features: AS18NWBnoAflrsPjZ5od3RG3GtAXLBcqTt1b7ZmUjAfG8TvaxEyJScccM8v1Vt4
Message-ID: <CAFgf54opaN2GciRzRv_BJ2SJZybSJ6ib+mkVvHY0K5A1h0-5pg@mail.gmail.com>
Subject: Re: [PATCH v5 0/4] Move io-pgtable-arm selftest to KUnit
To: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Cc: robin.murphy@arm.com, will@kernel.org, joro@8bytes.org, jgg@ziepe.ca, 
	praan@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_023239_637461_966A1BCB 
X-CRM114-Status: GOOD (  36.87  )
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

On Mon, Sep 29, 2025 at 4:50=E2=80=AFPM Mostafa Saleh <smostafa@google.com>=
 wrote:
>
> This is a small series to clean up the io-pgtable-arm library.
>
> The first patch is a small clean up to reduce the depedencies of the
> test before moving it.
>
> The second patch was originally part of the SMMUv3 KVM driver support[1],
> which needed to factor out the kernel code from the io-pgtable-arm
> library, and based on Jason=E2=80=99s suggestion this can be taken out as=
 a
> cleanup, and a step further to convert it to kunit.
>
> The second patch just moves the code to a new file with no other changes,
> so it can be easier to review with =E2=80=9C--color-moved=E2=80=9D
>
> The third patch converts the sefltest to be modular, that is useful as
> kunit can be a module and it can run anytime after boot.
>
> The fourth patch registers the test using kunit, and converges some of
> the APIs, some notes about that:
>
> Granularity of tests:
> ---------------------
> To make the series easier to review, the series changes the test to run i=
n
> kunit without making intrusive changes to the test itself.
> It=E2=80=99s possible to refactor the tests to have smaller granularity (=
although
> I think that would make it less efficient as we might create the same io-=
pgtable
> config multiple times) and integrate them in kunit as multiple tests, tha=
t
> change would be more intrusive, if you think that is the right approach,
> I can add a couple of more patches re-writing the tests.
>
> Other changes:
> --------------
> - Also, to make the test changes minimal, and the fail messages similar,
>   =E2=80=9CKUNIT_FAIL()=E2=80=9D is used to fail all tests instead of usi=
ng KUNIT specific
>   assertions.
>
> - Instead of using faux device, we rely on kunit_device_register()
>
> - The WARN is removed when a test fails, as that doesn=E2=80=99t seem to =
be a pattern
>   used with kunit.
>
>
> You can find the instructions on how to run kunit in the last patch commi=
t message.
>
> A failure at the test with the new implementation look as
> [  191.675985]     # arm_lpae_do_selftests: selftest: pgsize_bitmap 0x200=
10000, IAS 40 OAS 48
> [  191.676057]     # arm_lpae_do_selftests: EXPECTATION FAILED at drivers=
/iommu/io-pgtable-arm-selftests.c:91
> [  191.676087]     # arm_lpae_do_selftests: selftest: test failed for fmt=
 idx 0
>
> Changes in v5:
> --------------
> - Rebase on iommu/next tree
> - Collected Jason and Praan Rbs
> - Move back #include <slab.h> to the main file.
>
> v4: https://lore.kernel.org/linux-iommu/20250922090003.686704-1-smostafa@=
google.com/
>
> Main changes in v4:
> -------------------
> - Remove one missed __init.
> - Change the kconfig dependencies back as it broke ARM
> https://lore.kernel.org/all/202509201819.f369wBHc-lkp@intel.com/
>
> v3: https://lore.kernel.org/all/20250919133316.2741279-1-smostafa@google.=
com/
>
> Main changes in v3:
> -------------------
> - Move back unused code
> - Simplify printing based on Jason comments + some renames
> - Collect Jasons Rb
> v2: https://lore.kernel.org/all/20250917191143.3847487-1-smostafa@google.=
com/
>
> Main changes in v2:
> -------------------
> - Make the test modular
> v1: https://lore.kernel.org/linux-iommu/20250917140216.2199055-1-smostafa=
@google.com/
>
> [1] https://lore.kernel.org/all/20250819215156.2494305-5-smostafa@google.=
com/
>
>
> Mostafa Saleh (4):
>   iommu/io-pgtable-arm: Simplify error prints for selftests
>   iommu/io-pgtable-arm: Move selftests to a separate file
>   iommu/io-pgtable-arm-selftests: Modularize the test
>   iommu/io-pgtable-arm-selftests: Use KUnit
>
>  drivers/iommu/Kconfig                    |  11 +-
>  drivers/iommu/Makefile                   |   1 +
>  drivers/iommu/io-pgtable-arm-selftests.c | 221 +++++++++++++++++++++++
>  drivers/iommu/io-pgtable-arm.c           | 203 ---------------------
>  4 files changed, 228 insertions(+), 208 deletions(-)
>  create mode 100644 drivers/iommu/io-pgtable-arm-selftests.c
>
>
> base-commit: 5f4b8c03f41782f37d278946296d9443a7194153
> --

Pinging, as this has been reviewed for while, Is there anything
blocking it or any more feedback?

Thanks,
Mostafa

> 2.51.0.536.g15c5d4f767-goog
>

