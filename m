Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 483F2E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 05:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8TNsIZyk5Im66QqQVkpCl5sYDDDKsswwbUK+aNtF7KE=; b=tNCMfgTgEkzunR/iuvEBuPCY5Q
	synsrPxeq5Pq/pQ+LRW6Oc60+I9XcJZCFfQbieIT3L30c+OckFgBpleP0scKTuKJSv0Ady8Iwj9Px
	JcEn0M/ca3QpblW11ZqU8sT0o0ut7y4VSlrWUx4Cewp+VAmeeNMnemu1IzTARG/TAlIFyJw9ow2uk
	HxR5BEbO02ptpz6BKgDtOUmMQwR17s4Q0XcHPqvZmxlA7Ra4f90aCc7rkrRykvWny9RsFuroOmoEs
	s98Z61CKF4yqb4MIb7bC7a5JjQwTIY2FXZ5hjNfAHJIUjiAS8Y6FiIspbU85Wop3IKHq6yNYQxH/W
	694+2p0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTagC-0000000C9ZV-2xxo;
	Fri, 03 Jan 2025 05:57:04 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTaf2-0000000C9US-48So
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 05:55:54 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2ffa49f623cso154374211fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jan 2025 21:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735883751; x=1736488551; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8TNsIZyk5Im66QqQVkpCl5sYDDDKsswwbUK+aNtF7KE=;
        b=wTs+1paSUfoUQGsucxw/9I9q0xnX/MoZbqH6HWX8PcaTtumxwCwIdfNJRiyd+skznX
         9++Rp0iXS36DKM2xLK8og2mBa4ETAHZDfoN6IB3YtRjFLWbpGSP2d3D9nqgsX2GPZ38C
         X1841ljG0AK/A+mCXtbuKma960Cbl+fw5UUBOgbwmBElB3x1fggrh42SuUuEEEBxaZk4
         /uHBIiqCgs0mEBJ1a2wxe7/8ED9MQqjUd0Gm8m0suvpcrJ4PiapTS26KCRa09G4L8Ssh
         DLRgEvNgsEGFoteIh4H0F0n0I+3p0TmvCgr6tecZPzLQCLPR3MJ95CzuXeXrNv3jUvSf
         BF9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735883751; x=1736488551;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8TNsIZyk5Im66QqQVkpCl5sYDDDKsswwbUK+aNtF7KE=;
        b=feQUC8xraNwvOomArZnXYyqjnLWRm5OetWQh9Evt42qCH6XkP317veDVIu/bSA1cU/
         pPKdJO7QsDpPURQnF1L2ootooia/re4nu2rfnQtz+wvmsp7Y9gEzzOonpvqamcOv58IS
         v3esvRxj3HgAKlG2GVa86qNntNKJg0jhUOV68/c3TvOmmimJaI3/ktb/3JFgHmyY6OKL
         z2bAss5q0KpjtO19FCIZWm9PvHVB9F/ihpTnMirFxsf/RvUjGtXeg1gaC+wLYrrq3ntu
         AAvtBBYIw9/MWy5Fs/1Lv5ihtLiB4uU6Ol0OzXXTQkbjkaE9qH/34RZOWGqsiya5PMFV
         b/5w==
X-Forwarded-Encrypted: i=1; AJvYcCVgKp5v9bEbMJTBiIPrOPq0TTGy6GlqJaJnEJOste//PUIPeo4umZFvD86usp3URx/uD8ZrzXeW2Z98MwMhrtjk@lists.infradead.org
X-Gm-Message-State: AOJu0YzNPkV/mxiZ9dCu5HgWW1TohmDSSkZJXs6JZwj4sQeNREy9uQBe
	16uySrL/bsv5L+H3/Qoy5rG+d66eV9isOv9eoPN0fzsTw6GYgYnV145Tn1seR6s=
X-Gm-Gg: ASbGncv5BPq9C5xm3VfusEyAi62qi9uA7+zaAz8+EXWK3idJw/HB4Gn7ybkHz8uVYM0
	tdf3ix60tj06Q/HxE6Y9h7vktfFLsv9LbhNNcBOR3VNZnVZv5I1xnZYYd5uA6qJ3f4KDEzbyiLm
	zXdoEvA19PzsdRTODwCB2fkOG8YR/WveQygWalG8tQ7WZDT3HBcI4F+sj2XnR/WkOGJKTBdoC/+
	puY+Now5eUsDHJT5o76pIbAsjClzZastnKthgypgR4MpAQm+bEIZTfquZSle/GZzsk+Duf2BHqj
	vP9KcWHDOApDn7GsqtT6/Y/IbR8f/LRYT0ki
X-Google-Smtp-Source: AGHT+IFd8JD4I8sVveMannF81lqmEODVNWfMUqiYkHdf8QJydpiXFJoP8OozGkhJGA83xU2uw5LYtA==
X-Received: by 2002:a05:651c:542:b0:302:3610:a50f with SMTP id 38308e7fff4ca-3046860efacmr177251481fa.30.1735883750994;
        Thu, 02 Jan 2025 21:55:50 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045b096026sm45044071fa.118.2025.01.02.21.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 21:55:49 -0800 (PST)
Date: Fri, 3 Jan 2025 07:55:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 0/2] ARM: implement cacheinfo support (for v7/v7m)
Message-ID: <y74nrynys7srlwmtfzpjwklfkw33vijrnefjm3iyngn2y35mlz@joqsk74rwl2l>
References: <20241014-armv7-cacheinfo-v2-0-38ab76d2b7fa@linaro.org>
 <CACRpkdbfckBBW5W5sEvz1LwzdOvTKi_fi7tDu+9nPeKumYkPeA@mail.gmail.com>
 <lkxm6m2u25o4qfvpja7qsldqm7zjxejkn6d5qihyxbg2zvntwh@icvun74e6rll>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <lkxm6m2u25o4qfvpja7qsldqm7zjxejkn6d5qihyxbg2zvntwh@icvun74e6rll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_215553_037286_789B5D24 
X-CRM114-Status: GOOD (  25.24  )
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

On Thu, Nov 07, 2024 at 04:34:36PM +0200, Dmitry Baryshkov wrote:
> On Thu, Nov 07, 2024 at 02:55:55PM +0100, Linus Walleij wrote:
> > Hi Dmitry,
> > 
> > On Mon, Oct 14, 2024 at 3:55 PM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > 
> > > Follow the ARM64 platform and implement simple cache information driver.
> > > As it reads data from CTR (ARMv6+) and CLIDR (ARMv7+) registers, it is
> > > limited to the ARMv7 / ARMv7M, providing simple fallback or just
> > > returning -EOPNOTSUPP in case of older platforms.
> > >
> > > In theory we should be able to skip CLIDR reading and assume that Dcache
> > > and Icache (or unified L1 cache) always exist if CTR is supported and
> > > returns sensible value. However I think this better be handled by the
> > > maintainers of corresponding platforms.
> > >
> > > Other than just providing information to the userspace, this patchset is
> > > required in order to implement L2 cache driver (and in the end CPU
> > > frequency scaling) on ARMv7-based Qualcomm devices.
> > >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > I added my review tags to the v2 patches, can you put them
> > into Russell's patch tracker?
> 
> Done, 9432/1 and 9433/1, thank you!

These patches are still in the patch tracker in the "Incoming" state.

Russell, Linus (and Sudeep, Ard, Arnd), is there anything blocking them
from being accepted?

-- 
With best wishes
Dmitry

