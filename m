Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 755EAC02183
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 11:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EG2bE0DIBD2yet8T8gsGufzhGOyOI+URLPnHO/LFp1s=; b=D8RF4wByxFYc8XAM5ZlxZbyzPI
	ONgqgKH/BXKRjnlXFyjUeVLQVHSTD9NTXxyRKhj4i5QG2IQrz5UBsOCR3c+KLu9lLkPCEllVjl3cX
	LqTRJQ9k8wuYm9bRJHZjadmLfZqNm5hN38yBBNxlA5utigXgP1JDOvZ0XahXwbOS98JS/zigD/u2I
	dIEzBHKAKlRSN1oD1JrJ5ZsJ1MwEZspdlwhyLTjXAAUgh55hBchacYa1dGkL5LEnZXuI4KKtkRO2N
	dNejm6tHwo7Nc62b15tXdlyhBxGhEA5iSDQ7hiLi0yNcLTQX/1PaWT8KewVab8yZmPovcHAlSYrMm
	XkDAM8tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXfYz-00000008KCC-0a4D;
	Tue, 14 Jan 2025 11:58:29 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXfXj-00000008K4a-2mW1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 11:57:12 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5401bd6cdb7so5372981e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 03:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736855829; x=1737460629; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EG2bE0DIBD2yet8T8gsGufzhGOyOI+URLPnHO/LFp1s=;
        b=EMuZNYmGd2Hd0KAPMmTDUDPPL1VeuoREz03i73s5dQdCkoEUQowMz7Ohp+JL4vMnED
         g21d/5Jm8YvPNeFltHlpIhoHt9IGZLRkQXq6ziT7JES88Xu7rZHJZCatz4zjgh7BaMbK
         y4GO7crCflGDFgfk3x6kW0Uldouf/e+7OkbvzP4W1u8rnodJHcI7xlQV+6xXvZodsdFL
         wusb7IeTescAm4B0PqH24DZE4uzN1stG5/8BXe1bFun0eVkOYh4t2HXLwZwauvZStR0+
         KEYRSLLxh3gTuhGdusRyWclVgiTQAttPSD6gOkwLPfanHHmRZu0PsGDSQTkH6z2CaW+4
         AexQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736855829; x=1737460629;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EG2bE0DIBD2yet8T8gsGufzhGOyOI+URLPnHO/LFp1s=;
        b=NEd3w1DglHda3zWjxyOsIosg8JB3V1ivRvc63FaW4scBIsHOBSl42qdjG7pOYTVCB1
         dQezCi0A73gYhRWlDEnuIJ9LXZS9FIwa3PggjFh/F28V953iWw6s67maJq7v4gwzbpKv
         IgHF7WnXc+rS7Vna5R4ShNHyu/U9SCG+NwmMfPTUkynr9hvXZMUTgJhJgyXvhqqrfyml
         3g2RmUyTd82MtvgK3ue+qkcXGqT5H7q9EpbuW5NDG8iUKyEinINe4yW74vTh4uwYGc1u
         NnTtR5LrlWqeEvjE3hZArtEOejcsujDCDAAJATJJMynvGPDuuZ19oSN+BkGqoI+gKvIY
         k+MA==
X-Forwarded-Encrypted: i=1; AJvYcCXK8VWdvWeRY9zk5izCTE10iaHL04kZ5w+ty7U4yNLYORfy99OaouCj7Hb3tefJ5rTIwXUJzPX7QIhhOzl/X/4O@lists.infradead.org
X-Gm-Message-State: AOJu0YzyvggxrrOWydxo8W35HuSM5q9Ow6N2qoq46m8iXSNtACEK1rZc
	/bAl8aQEd2RyZqKKYwd5OSElCea0q96YL0RCjfOFI7BIFiQN3URjhcYSfShGu5I=
X-Gm-Gg: ASbGncvq4NCfRU8+0Yxc3ol0TVWx/IDTdRXyyrfpEN1UthgNsBtA+HS3leUa+d9zvj7
	13uHkohR0nJkRALqmK/QIPtBUgSClB3VYpz6u5NKqW2GB3GFSHoK1SOgEAR/CtDKUNncKEFPxz7
	sffOfpqu+/rcd35WJ0kfjxTQ8+/J6vzY0Q9uLq/1Zd3JivcFwJqIN124Qz/j5gr9UdP/UK4v1bP
	ttOzYIA2YjdBbGdLGTy3eDwwxyMYUQNopKgglj35/cvoclifeE+ruol+7Qy5zHq14Qtr5ZAFRk2
	7C3tp9ZTGD9RH8kQQDBR36ymssMSRZki91TO
X-Google-Smtp-Source: AGHT+IGYKaEENsM+ETIIS6i2qNffuQ5PleDdqYyQPQbL0nmR7gJPI/hRo+s9dTmtKsyiRgreA72Kjw==
X-Received: by 2002:a05:6512:39d0:b0:542:297f:4f64 with SMTP id 2adb3069b0e04-542848162e6mr8758502e87.43.1736855829458;
        Tue, 14 Jan 2025 03:57:09 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428be53e70sm1694560e87.64.2025.01.14.03.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 03:57:09 -0800 (PST)
Date: Tue, 14 Jan 2025 13:57:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 0/2] ARM: implement cacheinfo support (for v7/v7m)
Message-ID: <pu5lqb6l57r34fo23lbsfxmyejmfv5zga5dzf6yo5ay3wkerof@lcopwojovhnx>
References: <20241014-armv7-cacheinfo-v2-0-38ab76d2b7fa@linaro.org>
 <CACRpkdbfckBBW5W5sEvz1LwzdOvTKi_fi7tDu+9nPeKumYkPeA@mail.gmail.com>
 <lkxm6m2u25o4qfvpja7qsldqm7zjxejkn6d5qihyxbg2zvntwh@icvun74e6rll>
 <y74nrynys7srlwmtfzpjwklfkw33vijrnefjm3iyngn2y35mlz@joqsk74rwl2l>
 <CACRpkdZ1Joi+UW6EQuatx3Z0P0o+HULjwXB9vaAWOJxdBsNO8Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdZ1Joi+UW6EQuatx3Z0P0o+HULjwXB9vaAWOJxdBsNO8Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_035711_715346_24BA1F53 
X-CRM114-Status: GOOD (  28.94  )
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

On Mon, Jan 13, 2025 at 04:07:36PM +0100, Linus Walleij wrote:
> On Fri, Jan 3, 2025 at 6:55 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> > On Thu, Nov 07, 2024 at 04:34:36PM +0200, Dmitry Baryshkov wrote:
> > > On Thu, Nov 07, 2024 at 02:55:55PM +0100, Linus Walleij wrote:
> > > > Hi Dmitry,
> > > >
> > > > On Mon, Oct 14, 2024 at 3:55 PM Dmitry Baryshkov
> > > > <dmitry.baryshkov@linaro.org> wrote:
> > > >
> > > > > Follow the ARM64 platform and implement simple cache information driver.
> > > > > As it reads data from CTR (ARMv6+) and CLIDR (ARMv7+) registers, it is
> > > > > limited to the ARMv7 / ARMv7M, providing simple fallback or just
> > > > > returning -EOPNOTSUPP in case of older platforms.
> > > > >
> > > > > In theory we should be able to skip CLIDR reading and assume that Dcache
> > > > > and Icache (or unified L1 cache) always exist if CTR is supported and
> > > > > returns sensible value. However I think this better be handled by the
> > > > > maintainers of corresponding platforms.
> > > > >
> > > > > Other than just providing information to the userspace, this patchset is
> > > > > required in order to implement L2 cache driver (and in the end CPU
> > > > > frequency scaling) on ARMv7-based Qualcomm devices.
> > > > >
> > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > >
> > > > I added my review tags to the v2 patches, can you put them
> > > > into Russell's patch tracker?
> > >
> > > Done, 9432/1 and 9433/1, thank you!
> >
> > These patches are still in the patch tracker in the "Incoming" state.
> >
> > Russell, Linus (and Sudeep, Ard, Arnd), is there anything blocking them
> > from being accepted?
> 
> I added my Reviewed-by, perhaps rebase them on v6.13-rc1 so
> Russell knows it applies cleanly? (It's pretty straight-forward to
> supercede a patch in the tracker.)

Done, let's hope they finally get picked up by Russell.

-- 
With best wishes
Dmitry

