Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C111CD149F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 20:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hNPFlVbZVA/OKJ3932WwecR37g7+EI0egSRr36/qweM=; b=E1d78Ch8WJcv3JTfrFkePKuUGB
	4nhyEJ72Pqs8WjLkU7Xth57avTtKeHRYbdGmr4h+GL8yjiefoZKLgDARiPuLKHSJ+Vl+yL+2ouFBU
	HX7cjmuTsiXkOFAGFvVb5+ANkJG10IC2TCc8E+r5LoPv0XJlOzuyszADA3wGnZPC4BKDZbDx9I6/L
	nm3oZyJkE5caqfPCtnXaGBnNuSj6zRLsT7g66Xww7CtpCyqLuTS+YX6YJstuX0Xa+16JXU/AIZn3s
	HcxT6pxzIt+ql7afvcH1Fhoku7zpV6HYSfDKAyxEFul3uZ5TaT8aW318RybSxOunvfCPDDgDMGavl
	1oVEs1xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4ROn-00000005Don-3avr;
	Fri, 25 Oct 2024 20:59:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4RND-00000005DX7-1mQT
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 25 Oct 2024 20:57:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=hNPFlVbZVA/OKJ3932WwecR37g7+EI0egSRr36/qweM=; b=UdyAXVau+8oWw/eIXVGpYb/hGT
	TlJIDre9vodsRr8/zqcmSiF8A0fA/AWuVVU92ExtgO43mmQA7HJ4AI6s4UYGP9xIj/iwVa3ysahAH
	DXaPleNvhLgVmapukYbxLZWB7cugJXdTU65P8+NgU0Kkeqh7dgqa1hTo96WWQGeSeUdIjoVaDtbws
	yjJZ0jCO2mmPyp5ZVFxJ+zMCbx5iSmmjs0rRVMekxcpRM7rfZodHIaLB52f3FmZYi/WYJvgXKZRVV
	3YAUhDbl6+lv/x4r/i4dZuPFrp803/CRwt2ZxmfdBobK0SNVsO8QqdBoJ3W/CRC6kamV4g/hq1svC
	65qcvwhw==;
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4RNA-000000095j9-0fZ0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 20:57:30 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-53b13ea6b78so4110651e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 13:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729889845; x=1730494645; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hNPFlVbZVA/OKJ3932WwecR37g7+EI0egSRr36/qweM=;
        b=eG5NmktX/fA0dMmQlhlC0Q4uKf+tgYLqYWtnmDT0k8xBfhq/rOwZ4bKIElCgm5USk2
         wv+doreocPKM9xVPsKvaGDzQDbuPimqsZ/GNnX/3nifyxS+SCS2RsivZqr22cpg5DOcA
         3dvxMBftXw6mcHfTNn8CdG5px9z+Oza+vPSkXIuN3A/78vhDslZruZhqCpPl85TnSGLZ
         JpVDdS65LSO9+6scfyqf2j0V1eMgNGyRt2FQA0YpklMCz6c2N9A/rmWP1tdhUGdgDlSB
         q0g50fpD1l2q1paXoWYOz1wRWy0utwSAsxjC9hXz3cTVNxYX0UN6vVyVntxR1E14dHNT
         yLSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729889845; x=1730494645;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hNPFlVbZVA/OKJ3932WwecR37g7+EI0egSRr36/qweM=;
        b=UKjMEyxA+ETlzGyNegJ9WK6Kz1MLtUzv0T6MrcANnmDEIiq/lS0l1BAwj2KpmlWWoH
         hUI92cHU1RwEzvV4pinyFbN/VIBYcWfwDIZXnZRFLxjQdCT/dlKKpVkMM4eE5SObblXI
         bv6gry9n0hiXeHXo5bu5Wt/772lDayarT1+npxzk8kDoDovf4Sd+tEnYPQ8ic0+snMeP
         kmCd/6UxL1XtbUE7D4o+OqRP59MWEg8vlZPY7NVxuscg2AesroeOE4us9HMZOpU9wjwJ
         fmj8kgmufCznZ3LkChlhS2td/CnhtLfII/+iWgUjYLmphufNzI7GdPnEB2hU0oXqrWPi
         4qYQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9tmF3RU1RGgd3796kGZTTcc/hfdu20SD0bdAjAHTYz1AW15wPFgOgbB8RGP1IHClDHDy+z9C38SCx5M0FMcFN@lists.infradead.org
X-Gm-Message-State: AOJu0YxG/bxVLaVTUqwI1oYNkPCn5LTuAllM7XY1yEgv8aTpAYk+b0vr
	+yadZou7Qt/K1jjJCtDm8/aCBZmrr0ESQjAqgoUgDL2wYRbLwBOYpnr9iGxAUCFyI7WlvQ7CApR
	Ikaj5yYgXhai8KGwheZ4mLUZqvwZonGdUC2X5lw==
X-Google-Smtp-Source: AGHT+IGNM4TYAOHuoUTcKkN3riSvNQrGUI2BitGMjHxjJ9ZNHlb/Bci2C7h3R3BXPLmrz9pSyztWUOGUMtDmtzwbabk=
X-Received: by 2002:a05:6512:3da8:b0:535:6baa:8c5d with SMTP id
 2adb3069b0e04-53b348cbb72mr418498e87.20.1729889844751; Fri, 25 Oct 2024
 13:57:24 -0700 (PDT)
MIME-Version: 1.0
References: <20241017-arm-kasan-vmalloc-crash-v3-0-d2a34cd5b663@linaro.org>
 <20241017-arm-kasan-vmalloc-crash-v3-1-d2a34cd5b663@linaro.org>
 <69f71ac8-4ba6-46ed-b2ab-e575dcada47b@foss.st.com> <CACRpkdYvgZj1R4gAmzFhf4GmFOxZXhpHVTOio+hVP52OBAJP0A@mail.gmail.com>
 <46336aba-e7dd-49dd-aa1c-c5f765006e3c@foss.st.com> <CACRpkdY2=qdY_0GA1gB03yHODPEvxum+4YBjzsXRVnhLaf++6Q@mail.gmail.com>
 <f3856158-10e6-4ee8-b4d5-b7f2fe6d1097@foss.st.com> <CACRpkdZa5x6NvUg0kU6F0+HaFhKhVswvK2WaaCSBx3-JCVFcag@mail.gmail.com>
In-Reply-To: <CACRpkdZa5x6NvUg0kU6F0+HaFhKhVswvK2WaaCSBx3-JCVFcag@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 25 Oct 2024 22:57:12 +0200
Message-ID: <CACRpkdYtG3ObRCghte2D0UgeZxkOC6oEUg39uRs+Z0nXiPhUTA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] ARM: ioremap: Sync PGDs for VMALLOC shadow
To: Clement LE GOFFIC <clement.legoffic@foss.st.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	kasan-dev <kasan-dev@googlegroups.com>, Russell King <linux@armlinux.org.uk>, 
	Kees Cook <kees@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Mark Brown <broonie@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Antonio Borneo <antonio.borneo@foss.st.com>, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_215728_425871_F3DBA5CB 
X-CRM114-Status: UNSURE (   9.68  )
X-CRM114-Notice: Please train this message.
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

[Me]
> What happens if you just
>
> git checkout b6506981f880^
>
> And build and boot that? It's just running the commit right before the
> unwinding patch.

Another thing you can test is to disable vmap:ed stacks and see
what happens. (General architecture-dependent options uncheck
"Use a virtually-mapped stack".)

Yours,
Linus Walleij

