Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF85CC02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 17:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u54wyKy08YVTcdsmqPxr1bFLRjYzOxYrbgu4ALnLyls=; b=PC9p1JAgpCaUaauFavPCb8MkJf
	Jbl09BleWSTvOCH/aGg3SlepW1lXhbWIC2ByJ/TtD6nexiXYsGMN86cO2hEhQqi1jUw0tB2K/AF+T
	kX7+FPR+j9wn1hDTWxqAA+mPd1QUsAK/cnsYfteCz7p76AiqvdqEsxsaekTGtv1jzkV9o3Wk9gMWn
	bAK73TTXq1QbCTw07SwDmE4Lh8a4qMzgCl0LfVGBprZCh/NBOTBh3zBaTID9ZDXWg76a4kUTtDYwF
	M07LIhItJEC8T4a+aQEqFyWEAm+/3eUFC4Zd9VofwBFxbso1cC6eLuUFzNRMQZJZCWQ4759j8i4Ga
	9d5AHbbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgSX3-0000000AZZZ-1e61;
	Fri, 07 Feb 2025 17:52:49 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgSNX-0000000AX7V-2qag;
	Fri, 07 Feb 2025 17:43:01 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-46783d44db0so23861391cf.1;
        Fri, 07 Feb 2025 09:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738950178; x=1739554978; darn=lists.infradead.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u54wyKy08YVTcdsmqPxr1bFLRjYzOxYrbgu4ALnLyls=;
        b=j4SMuhKdC0HZRv+glSZxT39kWUOWkERyByeeSiVRZ7rR+MfIetdZMF5TkaRlklsgmE
         N8iokbwHw/5zexgsGwm/Y+K4jQW/sW5yS+/gDTd1pOCPjvSXrV/UQEnyepR6IQfSl25X
         GL15YKh4GSYQ5d/b4thRGDtcSF9GFzSB3An7EfaXYm+MkZFlCm9QiPThL8kL2bv4E6Xe
         qvkzXx32vnic2mpPUuWFxDOfR73XtfR4KJRK6VeUba83dVxM7bu+rxbORmfLMUe6c4Gk
         zD7cFPTwLnO0R7SyLA7SxFcrfpcGS/cf/u2ALcbMI2TQ1tgprXrbeRFBO0uwipPFsPFR
         AM9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738950178; x=1739554978;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u54wyKy08YVTcdsmqPxr1bFLRjYzOxYrbgu4ALnLyls=;
        b=Ol7Sq4OORWkGOuxloU+lEotLXYC7sQr3gJCv0R1jYLb+Xn9ulrbwCwvw7XjdG8AJWT
         NNzfm5fzawruX2z1/Us/rvKDgIdGz+UVG/mJxX+XcUYIm7c89I8Bp0itEpwxZ1I1nla0
         Yjcgph4Gi9g4eKt3qItEOCFTyrKOW1fmwZDSr/VuzrPlq5Dgy0E9oZfIgmySFQsYJNxR
         VqNW5fkU1omyUDpYVJOPJrBnrru1gzAKIlazLmQhNhQTf+GJG1Ia001/hA0NxOCeRH6V
         rQNFUPpwMkpD2+D5RAaOs/RXgyWjlY2/DVvVbNLWGlIiEyh+uH1WtP5CHoUsvwZh5fr2
         mSnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaLGQBCqb5ZkALEh0Gy0wJoWFBfLkBqLNMvOxmPMEEJR5QzH+Td3PEyK4LLf3xcwU/eMZpQQGYQezEoGAO+4VD@lists.infradead.org, AJvYcCXPLojHgaddW8lQP/aOdZVpJi4LE8s6hRfSwDxA6GU3GbUtgQ+HaM8cltlduJfDpYbcTzrKcTf2UM+AJlbqZBc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxh4X5fcawg0AZ3/8mQorG5g0awFi2t3GqKN/LjLmd5IRlMC+FJ
	Toi79uyLoBFftLuAJ1V7/a+2aZxHbrnwYVEYx8lmbkJVCG3dJwyo
X-Gm-Gg: ASbGncsvslWSi32FfHn9MLEiqC30vjGkhH1jKpI+9Sb8XTxa9gYB3IxunDHeGipF1V1
	aBqHUhkuiVzkhgxGaaNUE31ZXeOALsPDcNBl8CkM5g/6xDIFHtMR7kCEEQmz9tUBKMrcXg0easg
	mI8T4D45OxM5EN5NbZvnzoZ8gJCwYtd4LKtkM1rNVf+tPBhxpxb5aMntFKh1Sk5E5+W4yGdaeGl
	d9uz+aHq6WsPJW6oB3cjmf5k+HkUxCbwcZusPLNyN/u2d39MQfA7tNIS6Gkd3LPnoyMVnuJlnZz
	LHesyD2uTy0t7fsyfcJBAmC6EVNKCtBgcVe1JBNskeg=
X-Google-Smtp-Source: AGHT+IH3DF2ccE09vTzNT3aWXfr9o8hGV8lDRWlk4BMtyiA39cvcPxbJvfohs7KwFEtPpIsYgHBr/g==
X-Received: by 2002:ac8:7d89:0:b0:46c:7252:927f with SMTP id d75a77b69052e-471679a02c0mr46777051cf.6.1738950178512;
        Fri, 07 Feb 2025 09:42:58 -0800 (PST)
Received: from localhost (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47149275d5esm19033831cf.8.2025.02.07.09.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 09:42:57 -0800 (PST)
Date: Fri, 7 Feb 2025 12:42:55 -0500
From: Trevor Woerner <twoerner@gmail.com>
To: Dragan Simic <dsimic@manjaro.org>
Cc: linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] thermal/drivers/rockchip: add missing rk3328 mapping
 entry
Message-ID: <20250207174255.GA29827@localhost>
References: <20250207164740.14475-1-twoerner@gmail.com>
 <fc3c4542d5cc4d95f74692140e5ea8b5@manjaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fc3c4542d5cc4d95f74692140e5ea8b5@manjaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_094259_717533_9379E39B 
X-CRM114-Status: GOOD (  20.72  )
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

On Fri 2025-02-07 @ 06:15:22 PM, Dragan Simic wrote:
> Hello Trevor,
> 
> On 2025-02-07 17:47, Trevor Woerner wrote:
> > The mapping table for the rk3328 is missing the entry for -25°C which is
> > found in the TRM[1] §9.5.2 "Temperature-to-code mapping".
> > 
> > NOTE: the kernel uses the tsadc_q_sel=1'b1 mode which is defined as:
> >       4096-<code in table>. Whereas the table in the TRM gives the code
> >       "3774" for -25°C, the kernel uses 4096-3774=322.
> > 
> > Link:
> > https://opensource.rock-chips.com/images/9/97/Rockchip_RK3328TRM_V1.1-Part1-20170321.pdf
> > Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> 
> Thanks for the patch.  I think this should also include a Fixes tag

Okay, I'll send a v2. It's not really a big fix. The TRM instructs the code
to interpolate linearly between values (which I assume the Linux kernel does?)
and the table is completely linear in this range.

> and be submitted for inclusion into stable kernels.
> 
> > ---
> >  drivers/thermal/rockchip_thermal.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/thermal/rockchip_thermal.c
> > b/drivers/thermal/rockchip_thermal.c
> > index f551df48eef9..a8ad85feb68f 100644
> > --- a/drivers/thermal/rockchip_thermal.c
> > +++ b/drivers/thermal/rockchip_thermal.c
> > @@ -386,6 +386,7 @@ static const struct tsadc_table rk3328_code_table[]
> > = {
> >  	{296, -40000},
> >  	{304, -35000},
> >  	{313, -30000},
> > +	{322, -25000},
> >  	{331, -20000},
> >  	{340, -15000},
> >  	{349, -10000},

