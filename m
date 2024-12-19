Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A1E2E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 18:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rGd7ObbG8am+yMUo8jY97Hpu/e58CJlvRLs1UHv0j9A=; b=hoRQ/7jql+VeU4ag6xsmMGyRSI
	TkE+h+uKFYt2cigUtgtkaYo/JB9hId+Mhae77AHhSRXYCqgSPZZD89A5pRQM+lGyB1rKcWKiRXBmD
	Gz+8vp6rIM486QB7k0IojQUjrdD0jmGPedAVL6oEBqnfGDqUVv88VrlHnBOleZLL+wXloox+13RvV
	8ltHlPRW/IZkgGTuPm23aYUglYI4ARuJyYj+3ytmrxevKYYfqe7/H/0x6vsGf3y6OoVQqaABctipI
	ypP6AOg2Sjuk5LaSMYdMqIuXelPXFJZxigTRWinkYic6f7zylnFlToY7O9pUA4FgJ2nHiEPwKDi+L
	xVnBblEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOLP6-00000002kzb-16z9;
	Thu, 19 Dec 2024 18:37:44 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOLNz-00000002ktq-37qa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 18:36:37 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-54026562221so996351e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 10:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734633391; x=1735238191; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rGd7ObbG8am+yMUo8jY97Hpu/e58CJlvRLs1UHv0j9A=;
        b=L0pzmEjEf4EKvkLCF8dO0iq7AKLPEbH1dAfZXLBFBedBGzljseuJbXXthtX5jwmD2W
         9/rIbKMAwP4tmTIKo4HctE+fdJdv+tuRafkr7DqyRZX5hpOY3lboM4A2rbah07V29knJ
         dbv+m/mmqDN1LO62PRws511RA4zRC2QjregH4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734633391; x=1735238191;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rGd7ObbG8am+yMUo8jY97Hpu/e58CJlvRLs1UHv0j9A=;
        b=kVRk2mj0p/Qlv/aNZy/zuErFYU7zqCV4Hkqmc1nW5vcvhnQR+LccaPCIoEgvQuucen
         fNhaGKsMTLZlltqNlv4Gu7q9kkdV7NRlRTV8Q4eCo/WLifjB43Fitou1Wjy8KCMe0nWY
         mO30+lD+GDyxqv2RaDWtehB7QR8RRQdASjG3XfpbPGLsLoZgzWYenvlGXZTm9/Iz+om2
         Hp8GIYu9RffxzeMwuwQBJlm1HlKWQF4MMfI+cGIc4HTODbvaIzKOKe2515RaWZqG1W/x
         ijzbomjxmwf3XXZcbduJduJ+GmFXADpNZtKbxwONVss8AGNTSmwNxlbPvLbzOdfyhGcT
         aTJA==
X-Forwarded-Encrypted: i=1; AJvYcCVMt+BN6m0tFG+YBwLmUbfS1VS3dw442C7P0Q6FrvSSNM9ukGagtsHEZor6LyfqoviYNNC6sAQi0ZRWsDjp4G2c@lists.infradead.org
X-Gm-Message-State: AOJu0Yzql2sqD5wfO8kPCJj3zSaXhFstOUzpoK/xOUjehsLitSZkfH9B
	ARWmeXbhJ/fl1GDm/zppZqsEd8bjMq85sZ2iFBgjvcsQQQj2EhJj1Lf4+c3T19FZkpG5QEsCe9F
	AkA==
X-Gm-Gg: ASbGncttG8ur+17vjtu+iC43JOIFhdxmYpGTDcoi30X2LSLP/MnqgixI6wjkuQKMhDa
	knqaB97hrQvKEypUM4fq1qHse9lPeIxIBTKcIvMhbBw9RU7PWtYK+55V87nd/MuCmXrkIDdAJA0
	zviPpyCKA3yJkOpDzUHB6j8aTNv34qRW58T8kJJU9cuuayjQGBvul3yufpclPGqQcDiC+lbEikk
	3jFnFYPZz2TjzOoXbLNcIMZS23XFI7PyY4v/I85gL2jzgnvw4kH9poxKjlao6f/2e/uwV6Q5XEJ
	y5fMhv/cGz07meeOqG7l
X-Google-Smtp-Source: AGHT+IF0j6eg60ZN/f0LnkHjZyuLwXvXj33Vea2eW1WePFypcn/XceWzYQRxWsnK0kE7tD48p7Q29g==
X-Received: by 2002:a05:6512:3b99:b0:540:1c6e:f046 with SMTP id 2adb3069b0e04-54221025c3amr1513611e87.36.1734633390644;
        Thu, 19 Dec 2024 10:36:30 -0800 (PST)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542238138c3sm239214e87.140.2024.12.19.10.36.28
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 10:36:30 -0800 (PST)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5401d3ea5a1so1036204e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 10:36:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVL3VhOhFA23scaDb1GjdAqdCDwisTJBvJxspD7dMBuC0TplbD8aiOFk8z/bKOn7ekqqR1NFGWj9OGn/tZNuJmc@lists.infradead.org
X-Received: by 2002:a05:6512:1320:b0:540:1fcd:1d9a with SMTP id
 2adb3069b0e04-5422102f5cbmr1448494e87.48.1734633388364; Thu, 19 Dec 2024
 10:36:28 -0800 (PST)
MIME-Version: 1.0
References: <20241214005248.198803-1-dianders@chromium.org>
 <20241213165201.v2.1.I2040fa004dafe196243f67ebcc647cbedbb516e6@changeid> <20241219175128.GA25477@willie-the-truck>
In-Reply-To: <20241219175128.GA25477@willie-the-truck>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 19 Dec 2024 10:36:16 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WnbMegiKDuV1HeWrGyQx42+bPZjwKQ09Q++b-fFBm7gg@mail.gmail.com>
X-Gm-Features: AbW1kvYHski0KpEwR6JI2rs7ZczsyhWkjzlkYCDe4FZwiR8jg7mutRjD544Tlw8
Message-ID: <CAD=FV=WnbMegiKDuV1HeWrGyQx42+bPZjwKQ09Q++b-fFBm7gg@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] arm64: errata: Assume that unknown CPUs _are_
 vulnerable to Spectre BHB
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	linux-arm-msm@vger.kernel.org, Jeffrey Hugo <quic_jhugo@quicinc.com>, 
	Julius Werner <jwerner@chromium.org>, linux-arm-kernel@lists.infradead.org, 
	Roxana Bradescu <roxabee@google.com>, Trilok Soni <quic_tsoni@quicinc.com>, 
	bjorn.andersson@oss.qualcomm.com, stable@vger.kernel.org, 
	James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_103635_810490_19AF9AD1 
X-CRM114-Status: GOOD (  35.53  )
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

Hi,

On Thu, Dec 19, 2024 at 9:51=E2=80=AFAM Will Deacon <will@kernel.org> wrote=
:
>
> On Fri, Dec 13, 2024 at 04:52:02PM -0800, Douglas Anderson wrote:
> > The code for detecting CPUs that are vulnerable to Spectre BHB was
> > based on a hardcoded list of CPU IDs that were known to be affected.
> > Unfortunately, the list mostly only contained the IDs of standard ARM
> > cores. The IDs for many cores that are minor variants of the standard
> > ARM cores (like many Qualcomm Kyro CPUs) weren't listed. This led the
> > code to assume that those variants were not affected.
> >
> > Flip the code on its head and instead list CPU IDs for cores that are
> > known to be _not_ affected. Now CPUs will be assumed vulnerable until
> > added to the list saying that they're safe.
> >
> > As of right now, the only CPU IDs added to the "unaffected" list are
> > ARM Cortex A35, A53, and A55. This list was created by looking at
> > older cores listed in cputype.h that weren't listed in the "affected"
> > list previously.
>
> There's a list of affected CPUs from Arm here:
>
> https://developer.arm.com/Arm%20Security%20Center/Spectre-BHB
>
> (obviously only covers their own designs).
>
> So it looks like A510 and A520 should be unaffected too, although I
> didn't check exhaustively. It also looks like A715 is affected but the
> whitepaper doesn't tell you what version of 'k' to use...
>
> > Unfortunately, while this solution is better than what we had before,
> > it's still an imperfect solution. Specifically there are two ways to
> > mitigate Spectre BHB and one of those ways is parameterized with a "k"
> > value indicating how many loops are needed to mitigate. If we have an
> > unknown CPU ID then we've got to guess about how to mitigate it. Since
> > more cores seem to be mitigated by looping (and because it's unlikely
> > that the needed FW code will be in place for FW mitigation for unknown
> > cores), we'll choose looping for unknown CPUs and choose the highest
> > "k" value of 32.
>
> I don't think we should guess. Just say vulnerable.

Ah, I see. So the series won't actually _fix_ anyone, it will just
properly report that we're vulnerable. I guess that works.


> > The downside of our guessing is that some CPUs may now report as
> > "mitigated" when in reality they should need a firmware mitigation.
> > We'll choose to put a WARN_ON splat in the logs in this case any time
> > we had to make a guess since guessing the right mitigation is pretty
> > awful. Hopefully this will encourage CPU vendors to add their CPU IDs
> > to the list.
>
> Hmm. We shouldn't have to guess here as the firmware mitigation is
> discoverable. So if it's unavailable and we're running an a CPU which
> needs it, then we're vulnerable.

Sure.

-Doug

