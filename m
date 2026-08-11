Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 091A2C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 12:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+g0yyxU25w21pcLuXRAHww3PrvUBtCpd+aa0SHubV3M=; b=v5P3SzWLugo7SThVPlfnASmbSb
	TzEug+kSsPOSIjI04vWaF04+F/d2eCi6sSOsHgFzI/93HlSnCAzoH8ZxFJyhRscBHuJIh/Z4D7fHZ
	kMmMItEMlsubiXEhJdcWyg3jiwc7RmTnQzv3jqMglVyXOJfRH0e6gDKL1zTKI0zQl5BFs9WkOQxLO
	JuJoIDez1D7Mzw9QsK7vuQNhy16fOup0NCxVYw9S2TW2XZdMGhQU3J1IvNg7bgOWjGH+a+ED3S8bH
	VfAekxVdUu7TLEpA4h8d9ZUvJefAQx7zXrsp9iwmqErHy/u0aP0bugZ42gcmOh5i4IMTKcdyE6OwN
	JDD3qS4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtlQQ-0000000DzmZ-3QmG;
	Tue, 11 Aug 2026 12:17:46 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtlQO-0000000Dzm3-0gyw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 12:17:45 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-6a17c7c3c6eso8445a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 05:17:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786450659; cv=none;
        d=google.com; s=arc-20260327;
        b=egdOZrwI8/0ZgQsNJK/3qRr5ZIv+B1fNI61lOYToQx/sVE+A+4cdIRgdU3h+VH8j3w
         VzlckPsNDC0phQhN/V5zCHtkgSktGsKppKramzYDkN8OOObW1mz6h2RDkWH9zd/d5uTG
         EAsyGa526ywl3aj+RaW+YKCFsqMqUgTZlNDZ31Td1JzvpjGpDSr0z+eB3hnxj68W/O7m
         VUZ9YKEAr8KUuVODdpUc7ugCYL6+HNk3LkFAAVa97YsBRSeCKjsvyV6lpPxtnUtnZhQt
         TW8O5yVPhXHxZGN6WIem8yPPhpvV+Xm6/M2drj8GkIvAnTWQW3SNEQ8zT3NPzca2GVnr
         62yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+g0yyxU25w21pcLuXRAHww3PrvUBtCpd+aa0SHubV3M=;
        fh=Y6FwbSls4LGDOhd89/gVpwkPdsDlHUUA/bkFG2mXHgw=;
        b=g0uLXhIhMvd8BiMQQAcSUfYC25UgEORm1CZ6LSGM/Fp7qTVX3/jYvi0ArXnA5YosgT
         1wBQfii15C+sUMWaVc9dASeyxh0NfWDAqwr+eeAs7U2eXdIL9+2JPEOasvXFQh/MRdlL
         C655wfFKDQTE68cMX/YiBcTqdaEPge435G/Eb51GIU/RatwwPavUBE1c52U1u8JfkXWS
         nr+rRgrRkdhkcLLmPR2aoEZ/mOFuFv1+Q0dFygisyFgP2xb48PG37f21nhL922bcwZbs
         GAKTZod0G/fTY8BYvNDRBeUiURU9XojN92vXRzwTmDaktYQb5WHWNgILg+0DGCy36Enn
         Wq4w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786450659; x=1787055459; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+g0yyxU25w21pcLuXRAHww3PrvUBtCpd+aa0SHubV3M=;
        b=hthQzHvftYgEihH49DGwVkCUJN4C2qV/NRV8CNzrZMpfiuQIQ2oCZ0+hfxmzi1l/iI
         yLpEIIGZSJRd8E49ZxIdMuaT9UNUQTc2yvHoljW+A52RlVzVQG36qcV4UMIgwIpXJXHu
         vnUjnSPyXkdW3ef2I3YUI9pVLyk6ht5AyaybeL4Ypxpte9LxbdDa53gt8vpIMNTsNpdp
         h+a4o44EDyZ8Lk0XPV0zx4IozkfiZLO8fPz60e1q6wEd1a65l79+UslAlF3FN/ouOOYL
         /Uu64jBtQ9la4b06j24EBXiCaWFNiHmUnxJfEaVJ/toFLzAW3UF8ZBuGOXQ8CmrCdkbC
         JyoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786450659; x=1787055459;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+g0yyxU25w21pcLuXRAHww3PrvUBtCpd+aa0SHubV3M=;
        b=C/3Zr4NLp+4/7havjVF8gGlwNEUNAnq+LxTTrCPcsTQk7INZlDGza3HfYaWzefkefD
         1axXKm4wxov8teZYFOg9DZQitJQZfA9ug7DfWABUpPhpocVzbjYaxf4/Q7umVxdAFGk0
         j0H2UQo3+8od9wjtPfUyYg3JbemFL44XWUMgB2l+6QZZPOpJuxcLn5Suh81Ix/kN+eCW
         pgP1mjbG0rkCLWxobxS2rDkXO1vkT+tINm4OMMB3/YyCst+gS7+rVF17IejfUm/6F2/W
         S5eNsLzUpuwXGITIwEKkBbfKJrINEMzMOyuUNAplLQ9j+eK/EF1bOk+1vlBqABpVcl7S
         hJWw==
X-Forwarded-Encrypted: i=1; AHgh+RoFEBiXAP/dEpzE24b0qsAjaF6irHxrOIHUsQkm/TmHBISm63EIW2q8AaIZqTCeZjrCK49BsVb7+NZLOaqLPWdY@lists.infradead.org
X-Gm-Message-State: AOJu0Yzz9LW/JPixH268sdEKO3yMxGtpC6hSFllkelSgx6NVw3wUe4se
	6xC8RYH9yKq3Kc2jIL+AjARi5PGyVcCO9x+b5bHmTDTkKv+oy8QjT09iLpxFjDzQRix5dSrlS0u
	B6qji+gfXwJVRJg/QjJHalm6nxTTm49o8hwEt3s8U
X-Gm-Gg: AR+sD10oQLOQZ8cfHYGUsGdsGTnP26iFPGHpswpSHca4yE0g1R3/pqjhNJKsTPOEAXK
	xvttZyz+v4YeZFNlvxJKK2XIaoIHsaxIVoe+/NLS5FzBThsb2v6IHV1E06pwHrmUmh3HNwsb/10
	+2X1AD3byYefosW8Kn0ynUWNvX+ab8gEEA2SD0xgvmH3xYlYxuz8qHgofSicM2JBadeVHWDbE+x
	VeJPsX9ofBnYU1AJjJHwdi15nFvDwTTyfiZlRhWnkq2Pz2sAL0ZfnkgAxv3ONApYScGf/bYBdCJ
	t3OIeWZ1A9R4bbyp7MytrrMGa3WJZvdXodSJgfTVLfjlikK/TL2txGfHbQg/cHsDbpIw7ODOZ1k
	=
X-Received: by 2002:a05:6402:1843:b0:67b:7d05:60b8 with SMTP id
 4fb4d7f45d1cf-6a3697f7d29mr8059a12.10.1786450658392; Tue, 11 Aug 2026
 05:17:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260808085824.732659-1-smostafa@google.com> <178621460524.381735.15023846552532101058.b4-ty@kernel.org>
In-Reply-To: <178621460524.381735.15023846552532101058.b4-ty@kernel.org>
From: Mostafa Saleh <smostafa@google.com>
Date: Tue, 11 Aug 2026 13:17:25 +0100
X-Gm-Features: AUfX_mylL7mka5X7s4oaoqXqkvT0gVqweb7ayJRqhutnUStI5GPh-r5yrwruQqA
Message-ID: <CAFgf54qY8c9wO_RHQZpVSKUCTOgr+WWKCxetjb6BGf-G=5OTSA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] KVM: arm64: Fixes for timers and pKVM
To: Oliver Upton <oupton@kernel.org>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, maz@kernel.org, seiden@linux.ibm.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, vdonnefort@google.com, 
	tabba@google.com, sebastianene@google.com, keirf@google.com, 
	yaoyuan@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_051744_221427_D74C21C2 
X-CRM114-Status: GOOD (  17.58  )
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

On Sat, Aug 8, 2026 at 7:44=E2=80=AFPM Oliver Upton <oupton@kernel.org> wro=
te:
>
> On Sat, 08 Aug 2026 08:58:21 +0000, Mostafa Saleh wrote:
> > What started as a  small patch ended up as a 3 patch series thanks
> > to Sashiko.
> >
> > First patch from Marc to consolidate the offset calculation,
> > follow up patches fix issues with non-protected VM and timer
> > offset and protected VM running with broken CNTVOFF_EL2.
> >
> > [...]
>
> Dropped the unintended SOB in patch 3 you mentioned.
>
> Applied to next, thanks!
>
> [1/3] KVM: arm64: Make timer_get_offset() work in all contexts
>       https://git.kernel.org/kvmarm/kvmarm/c/2858600ecd01
> [2/3] KVM: arm64: Fix timer offsets for non-protected VMs
>       https://git.kernel.org/kvmarm/kvmarm/c/47d3eef780e3
> [3/3] KVM: arm64: Fix hvhe and broken CNTVOFF_EL2
>       https://git.kernel.org/kvmarm/kvmarm/c/2e813a6e8ebe
>

Thanks Oliver! I believe there is one more bug. I'm not sure where the
bug is or if it relates to the broken timers.
Before those patches I could not boot a protected VM because of the
panic, now after booting protected VMs, I sometimes get a system
reset.
I confirmed that cntvoff_el2 does not get written to non-zero, I also
removed the sysreg write completely (rely on xzr value at init) so my
guess is that the HW might be allergic to more than just non-zero
values in cntvoff_el2.
I do not have issues with non-protected VMs anymore.

Thanks,
Mostafa




> --
> Best,
> Oliver

