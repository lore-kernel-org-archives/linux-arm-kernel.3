Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F0AC36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 23:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NihBRY3Qx+zlswEGaDL64cOxdG56gPbPLooVIn/eW4c=; b=F9Htd7ipVERhfTlt+Hxfzk7cOM
	jMBaP56aAJyGM7FWpv/iRuk+TbVR03UwS9AcDTZJu3NOHEYbe9Ht26Gdn7enzFLsydoRgEDlZ6uSb
	EHWjqYV7viAU96M8h4af1njfD/hyGWndTnq/hR6yoKJu9UPzLJE6hCgBtLuIBHz9nHTN1MOns5nEa
	hF8kau0XmZhv1Yxvh8Gt9zlq7vWB/qjjzIS9GXpIHDtGHnKO3FiGRhOfw3hj1iB7z9sH8vL75tuQ3
	KW552AghpwNeI7FK596wFwLa3XSvfV6wnz0BOAoaFRe2mJehDB9BK8PNhbHXehWSwuQwpS2zp8QWZ
	FqdhP0kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzOmP-00000001bK2-2sUX;
	Mon, 31 Mar 2025 23:42:57 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzOka-00000001b9I-3QI9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 23:41:09 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-30613802a04so50969851fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Mar 2025 16:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743464462; x=1744069262; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NihBRY3Qx+zlswEGaDL64cOxdG56gPbPLooVIn/eW4c=;
        b=DQNSqG942bDAljtd00SxXpxGiltoxWPvR5WNJrzDT85p3ghU0SCqnoXrkp9eZW7GVE
         7FthNjgqclAfNPEMfOmg7lm1NdRuxINIQydTnEpXmoRwSkrNznkgXnVwfoVzACDi4Zdm
         n5Zq2jBi9Q3SAfaDgOZKbAAu7U3moQGU2/DzFa5a5cZp9j1pqKIvM3u10c3/VUOcOO3B
         ziuHODoOEL5lHj2GSz8CQiTjUi5jWvn5vG3NDo9nj6taCGZGjNXO9P/TrY2XUqaH12Xy
         kFSY3WUMbX1ijdXWLex6BGhWhhx7HUW0BZ3h7ZCRyAPA7IWfBsUDrmKX4pXu4JT3bs9p
         P/ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743464462; x=1744069262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NihBRY3Qx+zlswEGaDL64cOxdG56gPbPLooVIn/eW4c=;
        b=RZ1JRrHr2n3T1fHTqpQBqPXXUovCMDV7ceQ2xAyBR0TQmdVnGFqNW5v5Yxt02r9kz9
         nfnFtQIlashNpFWSR/b4R/G5WGR7NvREfpBQk34OtC6XzcoKf6owBIQQDrzkgkSTYwFo
         ci4qSopXE6RpJNzHmbBDvYrxZUvA7howFY85rb7zPtm7fbrZLzTowkw4j4ufOxOKq8+x
         Y+CEiXL0i7f4lW3vVs7kd2E7vDBYvZIdqfsmXAMTe302icsx0vam78+q+//8fmyQPE5P
         EYASAqrDJv2ood/sPPU0e6EMVD0HYQzdoLT08/cTycQ4WBjum7JPBODGIWzeXgtPTzFa
         SmPw==
X-Forwarded-Encrypted: i=1; AJvYcCWS3Ddz8FZKoTPKo5nDHttWD0rRTiAQCi/qZe4wfY9aoV3riXMb93YYjBTDgFsLG5KrlF4V48jAQicPvRpF0zeK@lists.infradead.org
X-Gm-Message-State: AOJu0YyIhFU8kEng30utI2X8zAKAtYxL7lbF/702B7aHh5FM9g5AECLU
	sf6bo+nDmWZhG+NemMHeQwdr15oWi+0w+UvlJIuATo9yCGkYZH5JqU16wds+yKxaAKULqzpIxjX
	DQ4o3uk3z95ob4VlzXOeOQB5y8Gs6SNa0JhQ=
X-Gm-Gg: ASbGncuvwbXdFxhPJF9sH/HfDGV1oVUFgTl/HCOsmj5IvqSGVhfr8v8+ymHhySxT4N5
	plL/EZzJFPhn0aUUbfLzwf2DCofn0mzN3yIs/ph8ib04JBr06nxooAdz2FPkYsTPIF4XWf3xMSX
	IbX8vUAXEEFsvgwyWRWTjI7iez63niRrIBV7TLSXb8I3+TIlaJM9vkQDo=
X-Google-Smtp-Source: AGHT+IF3h32uucL3xY40HmWzn3evA+K+jabkhnqDz5vygl4XMcKOz4J5P2nUFJqU9c4v2ED1QiiikYOA6qjqGVaMVCo=
X-Received: by 2002:a05:651c:199e:b0:309:1e89:8518 with SMTP id
 38308e7fff4ca-30de02ce300mr34282961fa.27.1743464461848; Mon, 31 Mar 2025
 16:41:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250331230034.806124-1-willmcvicker@google.com> <20250331230034.806124-3-willmcvicker@google.com>
In-Reply-To: <20250331230034.806124-3-willmcvicker@google.com>
From: John Stultz <jstultz@google.com>
Date: Mon, 31 Mar 2025 16:40:50 -0700
X-Gm-Features: AQ5f1JpN1uPBwlW10PDmdE0JIkoJNtbjg8pC6IakGecLKV2zkoUWAmiRsCtx93c
Message-ID: <CANDhNCrxTTkeq3ewos=07jD67s3t6rXOv=u=_qV6d+JEVoXeUA@mail.gmail.com>
Subject: Re: [PATCH v1 2/6] clocksource/drivers/exynos_mct: Don't register as
 a sched_clock on arm64
To: Will McVicker <willmcvicker@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Saravana Kannan <saravanak@google.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Donghoon Yu <hoony.yu@samsung.com>, Youngmin Nam <youngmin.nam@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_164104_865479_6481054F 
X-CRM114-Status: GOOD (  24.97  )
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

On Mon, Mar 31, 2025 at 4:00=E2=80=AFPM 'Will McVicker' via kernel-team
<kernel-team@android.com> wrote:
>
> When using the Exynos MCT as a sched_clock, accessing the timer value
> via the MCT register is extremely slow. To improve performance on Arm64
> SoCs, use the Arm architected timer instead for timekeeping.

This probably needs some further expansion to explain why we don't
want to use it for sched_clock but continue to register the MCT as a
clocksource (ie: why not disable MCT entirely?).

> Note, ARM32 SoCs don't have an architectured timer and therefore
> will continue to use the MCT timer. Detailed discussion on this topic
> can be found at [1].
>
> [1] https://lore.kernel.org/all/1400188079-21832-1-git-send-email-chirant=
an@chromium.org/

That's a pretty deep thread (more so with the duplicate messages, as
you used the "all" instead of a specific list). It might be good to
have a bit more of a summary here in the commit message, so folks
don't have to dig too deeply themselves.

> Signed-off-by: Donghoon Yu <hoony.yu@samsung.com>
> Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
> [Original commit from https://android.googlesource.com/kernel/gs/+/630817=
f7080e92c5e0216095ff52f6eb8dd00727
> Signed-off-by: Will McVicker <willmcvicker@google.com>
> ---
>  drivers/clocksource/exynos_mct.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exyno=
s_mct.c
> index da09f467a6bb..05c50f2f7a7e 100644
> --- a/drivers/clocksource/exynos_mct.c
> +++ b/drivers/clocksource/exynos_mct.c
> @@ -219,12 +219,12 @@ static struct clocksource mct_frc =3D {
>         .resume         =3D exynos4_frc_resume,
>  };
>
> +#if defined(CONFIG_ARM)

I'd probably suggest adding a comment here explaining why this is kept
on ARM and not on AARCH64 as well.

>  static u64 notrace exynos4_read_sched_clock(void)
>  {
>         return exynos4_read_count_32();
>  }
>
> -#if defined(CONFIG_ARM)
>  static struct delay_timer exynos4_delay_timer;
>
>  static cycles_t exynos4_read_current_timer(void)
> @@ -250,12 +250,13 @@ static int __init exynos4_clocksource_init(bool frc=
_shared)
>         exynos4_delay_timer.read_current_timer =3D &exynos4_read_current_=
timer;
>         exynos4_delay_timer.freq =3D clk_rate;
>         register_current_timer_delay(&exynos4_delay_timer);
> +
> +       sched_clock_register(exynos4_read_sched_clock, 32, clk_rate);
>  #endif
>
>         if (clocksource_register_hz(&mct_frc, clk_rate))
>                 panic("%s: can't register clocksource\n", mct_frc.name);
>
> -       sched_clock_register(exynos4_read_sched_clock, 32, clk_rate);
>
>         return 0;

Otherwise, this looks ok to me.

thanks
-john

