Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E73D6CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 23:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DI5307X01YY+aSgpiw1sHT8lbRJrsLbNU3nv0IkXloE=; b=N0lpOrXpG6OK+FNNdn95V/5643
	kIiWz3eHvfKdeK7q0c+FbkHxT4RtSJetiWPc2SCQvsTnjyygW83ope1rMNALNpvEvQitJXG6UXIVe
	y+qjy5TcmOlWrrYCMUaUoCMRHmI8jmBqfoHsTvSKIBkPFTFNASasWwl1tw93QewsqnqEaUbR29A33
	n3BsK9uLqcQUveCSOTjurff3bM7q7OXmXKl9U1nzrRQRXWoUtAhIXrv9mMsQDl6gim6XEGYgKwEHK
	3+hdijlXNZTXbwKlS5Xa/k2jHSo47sDdpQ0ya8QkWcqMKl8hF2dO2uBpCGOmmyyCvtOsjT4SOPJhp
	zJjvLC1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5uuQ-000000011Sf-2XYP;
	Mon, 06 Oct 2025 23:46:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5uuN-000000011SI-2GiR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 23:46:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E0ED845B60
	for <linux-arm-kernel@lists.infradead.org>; Mon,  6 Oct 2025 23:46:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B509AC4AF0B
	for <linux-arm-kernel@lists.infradead.org>; Mon,  6 Oct 2025 23:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759794382;
	bh=DI5307X01YY+aSgpiw1sHT8lbRJrsLbNU3nv0IkXloE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OKvFIIZoRi0LpBPdTV8Kx1P18NQQA+SjQev3uvKjk18HPjfFOMqKin3dR7bQ0hmkk
	 BeUW1/eCdJod9iHOXmxf5MSNOmIQWkji0g/u+AhlY0rdcs6u3BOsEjdf7aGtz+7Wgl
	 o0UsD22nzrgaDhRKAtEwVuC4FnTxoVDQmtlJc8QF+yEFQoF/PMOh/jaqC0J55cCPHi
	 4r8HfZ/LLDvSupLXMPJx4w/WMQdDvzCQd2BcJanO1XiLZtcn4VuzCNP4p/YCXz2EJJ
	 mNfm1L0cvcSIIWjHPBQrTRzX/3vUFH4VjefoB9oVHNi8AO1/orapA84T0MDTlfnEy3
	 X4TXI5NmFzwew==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-36639c30bb7so49482771fa.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Oct 2025 16:46:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU6pnrXFoJ7EZorAVBXTd8GowWJr5Asb/EfgCQ2fMKDeJ4hSdfdss5lDxkQPbAcLcnyEBbFCmkfWMNrc+KKj5Cw@lists.infradead.org
X-Gm-Message-State: AOJu0YwZK0n/BG6qlopNeIHZhcz58ZyVlP8M1bihUQQyr8GfWJJmg6ZA
	Ak9MAP0yDcNvOJMfIw1QFCZEUJYh17tFq9Jkw5z0PAF3qqEuSqjhmQw/lhViVP282u8C1CC1iLD
	sjWP2Je720gmP78tswYVVGFKSaTeq9is=
X-Google-Smtp-Source: AGHT+IHyvFvoeGr40G3kZ7whYFBDihuxtMO4/vgOVFvYBnjqmXXCXOzZUwFZ12WiEap229737Koq6XBMGJvl3PK5iDo=
X-Received: by 2002:a05:651c:544:b0:360:99c:e44a with SMTP id
 38308e7fff4ca-374c371c08bmr43001041fa.11.1759794381063; Mon, 06 Oct 2025
 16:46:21 -0700 (PDT)
MIME-Version: 1.0
References: <20251006-arm64-text-offset-v1-1-bf0e8a27383b@oss.qualcomm.com> <aOPLv_-f5sNGtG4e@willie-the-truck>
In-Reply-To: <aOPLv_-f5sNGtG4e@willie-the-truck>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 7 Oct 2025 01:46:08 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHhetfN_bY5AAqqfC4=N9yQCO5R_n7H0BMXZ2VXudv5pQ@mail.gmail.com>
X-Gm-Features: AS18NWCf2njkvOwODgn8kpQQmCSEMJuBMgh3f5ZuQwXggeLdvTDI9CwNbJxtZGw
Message-ID: <CAMj1kXHhetfN_bY5AAqqfC4=N9yQCO5R_n7H0BMXZ2VXudv5pQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: head: set TEXT_OFFSET to the historical value
To: Will Deacon <will@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, David Heidelberg <david@ixit.cz>, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	mark.rutland@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_164623_618746_DCF75945 
X-CRM114-Status: GOOD (  27.50  )
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

On Mon, 6 Oct 2025 at 16:01, Will Deacon <will@kernel.org> wrote:
>
> [+Ard and Mark]
>
> On Mon, Oct 06, 2025 at 01:21:04AM +0300, Dmitry Baryshkov wrote:
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> > Historically arm64 kernel contained (almost fixed) value of 0x8000 at
>
> 0x8000 or 0x80000?
>
> > the TEXT_OFFSET. The commit cfa7ede20f13 ("arm64: set TEXT_OFFSET to 0x0
> > in preparation for removing it entirely") and then commit 120dc60d0bdb
> > ("arm64: get rid of TEXT_OFFSET") replaced this field with 0.
>
> Given that we made the initial change over five years ago, I'm struggling
> to see why we should start caring about old broken bootloaders _now_.
>
> In fact, I'm far more concerned about changing this to a non-zero value
> and having more recent bootloaders misbehave.
>
> > This caused no problems so far, because nobody seemed to be playing with
> > the extremely picky Qualcomm bootloader as used on some of Google Pixel
> > phones. Current attempting to boot the Linux kernel on those devices
> > will fail to load on those phones with the following message:
> >
> > KernelDecompress failed: Invalid Parameter Kernel TextOffset does not match
> > Error calling BootPrepareAsync Invalid Parameter
> >
> > Since the kernel ignores the field, set it to the expected value of
> > 0x8000, unbreaking boot of upstream kernels on Qualcomm devices.
>
> (same typo)
>

Just setting the header field and not updating the base address also
means that the boot breaks without CONFIG_RELOCATABLE, and you will
get a warning in the kernel log about the load address not being
aligned to 2 MiB.

So I don't think this is the right solution.

If this is really something that needs to be fixed upstream, we should
just bring back TEXT_OFFSET in its entirety, but I'm not convinced
that this is really justified here. As a workaround, you could just
add 2 MiB - 0x80000 bytes of padding at the start of the image, and
add your own header (as Will alludes to as well)

