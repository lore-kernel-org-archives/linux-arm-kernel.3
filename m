Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66548D4336A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 14:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sFw8yXJLqrkXU5hRV9LHBA5xHB7hRhKhK9JeN1oXec4=; b=heM+WEdzXeGB7+FU6+B15SMr9L
	npueF4iQDtc360boK1SeZVM2mN7THRAQ8LoNe76dEYgLCBfLyWnV60c/ZYTbdFDwBsilc3FszfDyJ
	QFIisKQs+hCUB7+B5zIDCyQyDIziv0w2xyo8SYLN/VqRqB6x1KEmXVHChTG7MfxNpNETaDKq9d+OD
	jIFPka1X23O4yfZQE6pK7RptoxP2cS1NwFQdc+1YDRy2z2t14yFJzrl2Z7P+PeJeHMVukeLOUIUtG
	LH2jfb4oz5YGoT5xCd5gSYx50AcJJqcR93hWO8NqftGqk439utzJgahAqiY9UqVdFAqn5enLOcVzu
	8YcJVRDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t93g7-00000007J7q-2IER;
	Thu, 07 Nov 2024 14:40:07 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t93ar-00000007IE4-1HJf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 14:34:42 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2fb443746b8so8774181fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Nov 2024 06:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730990079; x=1731594879; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sFw8yXJLqrkXU5hRV9LHBA5xHB7hRhKhK9JeN1oXec4=;
        b=WaWmbulM4XWPy+9jMRnsOX03M9KYGJSPOqur9mW/5JS6s/mfHLalJdL09L9s5c+c+f
         dlOqU/Wn/BtZiAAz3hR/JW2JKH32xT9zJpI3bVk0S6Stq4/sMVNgmm3WVPskW3D1gfT/
         s9/oSdrXpa+rtQFUw9+4IjOjsCszKLPR/eDa1cfUGFxOTbTXy+5hqz/PI+8opl0WQNXe
         cwRpP+nobqpXYeisYsyeLf33TAVGx3mKFqhzKx6J5JJN6itMfvuslR6uKp8Ur8Oj+8jb
         WhQwj132CDmypEt8NtvCL1eWNhySK5Uk53zkfxmFQHGquVgaA41Ky6F08uEHVPs2j4w8
         W+Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730990079; x=1731594879;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sFw8yXJLqrkXU5hRV9LHBA5xHB7hRhKhK9JeN1oXec4=;
        b=JKtKWNcQn8aDRzd0pFbPBYxQdfQjipMw7jLf/iKZrARXcJGbMPVp7N6d+xptJ0P7Xa
         QGKUC5ltiuCd8Fha2Yjw/JP2xnt3GqLNtPdyZjK6KV773W3OQ+9p0Mqd+bh6lbKESeXD
         9W5ErBZtKKnPkKa52Cm0pDim0R6WpZEsUkmhHpDOEWC5gfV8VcaHKufxi2b3TrLGUoGq
         hqs/xdtqWB8+UwCiy3n1JDxT7DozZI6RWJRjgaXNcig35uPYaTmzs3XXTCRszKSRiH2D
         mQHwUww51nNoF6x4VFtif/PFemoxQccQBQsWEE6JsW26dYZuVDaTuK5NUMGqQW8fPcEZ
         Svlw==
X-Forwarded-Encrypted: i=1; AJvYcCVvCQX8eAYQmOiSQ5Cp2MtqouZlH32mA0PahPe/wykwzix8CoT+1ACIgn0ZSHSrnzs88/F5AS4o2HeDVn9+YT0k@lists.infradead.org
X-Gm-Message-State: AOJu0YwfMVjYT7rz93e7z0peTAtgVLuhVz2fvVgO4HhsJoZgDzqgQF9s
	H1cqv04DKIT2e9YV30KKDzjFlUg9IQ8u4aWNzUw//goqyD9XJIQKqyOPyRlN9AU=
X-Google-Smtp-Source: AGHT+IE6u/vwpetFFBTpREnEATNArVxMnib3hilqhpSQwRreBBwE7Un+H8iFwlJKP4tC/3/OAp4Img==
X-Received: by 2002:a2e:a1ca:0:b0:2fb:9180:250f with SMTP id 38308e7fff4ca-2fcbdfd77bfmr168671801fa.18.1730990079154;
        Thu, 07 Nov 2024 06:34:39 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff179d7d5dsm2406701fa.108.2024.11.07.06.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 06:34:37 -0800 (PST)
Date: Thu, 7 Nov 2024 16:34:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 0/2] ARM: implement cacheinfo support (for v7/v7m)
Message-ID: <lkxm6m2u25o4qfvpja7qsldqm7zjxejkn6d5qihyxbg2zvntwh@icvun74e6rll>
References: <20241014-armv7-cacheinfo-v2-0-38ab76d2b7fa@linaro.org>
 <CACRpkdbfckBBW5W5sEvz1LwzdOvTKi_fi7tDu+9nPeKumYkPeA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdbfckBBW5W5sEvz1LwzdOvTKi_fi7tDu+9nPeKumYkPeA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_063441_387953_F0F009B6 
X-CRM114-Status: GOOD (  21.80  )
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

On Thu, Nov 07, 2024 at 02:55:55PM +0100, Linus Walleij wrote:
> Hi Dmitry,
> 
> On Mon, Oct 14, 2024 at 3:55 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> 
> > Follow the ARM64 platform and implement simple cache information driver.
> > As it reads data from CTR (ARMv6+) and CLIDR (ARMv7+) registers, it is
> > limited to the ARMv7 / ARMv7M, providing simple fallback or just
> > returning -EOPNOTSUPP in case of older platforms.
> >
> > In theory we should be able to skip CLIDR reading and assume that Dcache
> > and Icache (or unified L1 cache) always exist if CTR is supported and
> > returns sensible value. However I think this better be handled by the
> > maintainers of corresponding platforms.
> >
> > Other than just providing information to the userspace, this patchset is
> > required in order to implement L2 cache driver (and in the end CPU
> > frequency scaling) on ARMv7-based Qualcomm devices.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> I added my review tags to the v2 patches, can you put them
> into Russell's patch tracker?

Done, 9432/1 and 9433/1, thank you!

-- 
With best wishes
Dmitry

