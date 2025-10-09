Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 228B2CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 21:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JDf3RvnAJ/dSZU1DuUy77Eh2QFyUGi8T1WgDX4m65cQ=; b=lekwYUBJ/rLt/UNk8eZX6HrSy2
	6M0OVP4YUausoNL/LrhrqpjtUCmPSEodgqLH8J9Ga4g6TslNDszNEuFYRcEjqrps5M4MPGAb0WeqC
	0J9YDOe5bJkmsqokX61VD+26jrsj37ezFIYlJCZ95pAInepwl7ueYTLSaVsBqxMjGhejXeX8uKVSe
	F2k/dzhDHF4M8mKMzIRRnm8VITJq6Q80QIvpVPEvHpKcfikKz3hKlcmmvt8ag3+PK1oK6kX8BNEYo
	swNFK4Bsg93HDzxdDuSAs59S6Q2r7IB2lXdfCarcf12UA4WbzcsNV4eI1gBfzqrwjKkk2zyaolW0m
	WfNbYKTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6yS0-00000007BPQ-1xT1;
	Thu, 09 Oct 2025 21:45:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6yRz-00000007BPJ-3EO0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 21:45:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 36F0262430
	for <linux-arm-kernel@lists.infradead.org>; Thu,  9 Oct 2025 21:45:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D435FC16AAE
	for <linux-arm-kernel@lists.infradead.org>; Thu,  9 Oct 2025 21:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760046326;
	bh=JDf3RvnAJ/dSZU1DuUy77Eh2QFyUGi8T1WgDX4m65cQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XhaeHpIr2R/7oEIbBUjdOYNm9eTASl973IABzfSiFC557ApGEuxMDkdaG47rJbzYd
	 RPjJVVhKfaTAmMxxSFbEqQc0T3ECfckL+fG6EtbboaQMwJLIcaEIMxkJsFLIv9LekR
	 YLoCD6U2UjY2L3/sgMemkuIeGYOzgH2Te+y2zcGKbbDSM8JOTlPcJS+EbSaBl/2yqj
	 bpt6EYNJhdIZ3zKd5Yim+ODGmy20Lt9RNmnuXb7BsB/EH+uqogH0IsUyXxjMKK/LrX
	 VvjfdMpDeV2CjQ2uEINaftlX6W2oYMt/Gyc3h3KhikIWPitKE+0ISJY97fomRhEJsp
	 fqa5+NLt0I7lA==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-57a960fe78fso1615883e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 14:45:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVS5Tj4cpE89KbOFIDbAbiSE5b5vz3hrFIdBLhi4WDw4sFX6oEXg21qhO/DBNG2THeKz3VUtazRl3jXF3/JaHeg@lists.infradead.org
X-Gm-Message-State: AOJu0YxMm7WMa6qZTuNk0ZbewdDWu+vtZDg/mZ5QQADOLp/5OqjFAiR9
	UkdkUVDVqUYLzt5Aeo2PJbKLnF1siPTtvYUyW1RTJaI6t+53ysg+1nUudKbF5QGJFhHePmBbGXp
	BBO+dkVTBbQ1LPr82GeqB9DmZOe+xF5g=
X-Google-Smtp-Source: AGHT+IFdXBbuZW52QrqTdHX+lhqTD+/sq95pRmf1cdQmeXGgR4GX2JwjaAoHyFnSrPPPmQHGx6K4ST8vlbfcsWWxaow=
X-Received: by 2002:a05:6512:3a92:b0:55f:3525:3e52 with SMTP id
 2adb3069b0e04-5906dc0d3f1mr2585893e87.14.1760046325181; Thu, 09 Oct 2025
 14:45:25 -0700 (PDT)
MIME-Version: 1.0
References: <20251006-arm64-text-offset-v1-1-bf0e8a27383b@oss.qualcomm.com>
 <aOPLv_-f5sNGtG4e@willie-the-truck> <CAMj1kXHhetfN_bY5AAqqfC4=N9yQCO5R_n7H0BMXZ2VXudv5pQ@mail.gmail.com>
 <obcgfnmgdemf5gtc7gdaj6nzoa2rwxsc6njt4fd2ouwzqj4y7y@ztxwyyoepuud>
In-Reply-To: <obcgfnmgdemf5gtc7gdaj6nzoa2rwxsc6njt4fd2ouwzqj4y7y@ztxwyyoepuud>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 9 Oct 2025 14:45:14 -0700
X-Gmail-Original-Message-ID: <CAMj1kXEphMAoCi5T4w99OgVA2VmF3ZBsZ5-t=Oan8r0S_EaY2w@mail.gmail.com>
X-Gm-Features: AS18NWBbQ-eMZfEdM8Bn394IlzRr-fCZGuh5YoPpU-famY8LTSrZQTWP1N0nZoU
Message-ID: <CAMj1kXEphMAoCi5T4w99OgVA2VmF3ZBsZ5-t=Oan8r0S_EaY2w@mail.gmail.com>
Subject: Re: [PATCH] arm64: head: set TEXT_OFFSET to the historical value
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	David Heidelberg <david@ixit.cz>, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, mark.rutland@arm.com
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 8 Oct 2025 at 12:51, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Tue, Oct 07, 2025 at 01:46:08AM +0200, Ard Biesheuvel wrote:
...
> >
> > Just setting the header field and not updating the base address also
> > means that the boot breaks without CONFIG_RELOCATABLE, and you will
> > get a warning in the kernel log about the load address not being
> > aligned to 2 MiB.
> >
> > So I don't think this is the right solution.
>
> Since most of the people build the kernel with CONFIG_RELOCATABLE, would
> it be better to set it to 0x80000 for relocatable kernels and to 0
> otherwise?
>

When CONFIG_RELOCATABLE is set, any multiple of 64k is acceptable in
practice, but given that this violates the documented boot protocol
for arm64, we only permit this when booting via the EFI stub.

When we set this field to 0x80000, we are basically instructing
bootloaders to violate the boot protocol, which is not ideal, and we
should definitely not issue the pr_warn() we have today in
arch/arm64/kernel/setup.c.

> >
> > If this is really something that needs to be fixed upstream, we should
> > just bring back TEXT_OFFSET in its entirety, but I'm not convinced
> > that this is really justified here. As a workaround, you could just
> > add 2 MiB - 0x80000 bytes of padding at the start of the image, and
> > add your own header (as Will alludes to as well)
>
> Does it mean building a device specific kernel? Or just packing
> everything while building the Android boot image?
>

No idea. What does the Android boot image contain? Is the first thing
that gets loaded the kernel image? In that case, you would wrap the
kernel image before sticking it into the Android boot image, yes.

