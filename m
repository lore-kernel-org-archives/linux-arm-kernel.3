Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 195FFC71132
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 13:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1IEUo4OXi/6u8Jsr6TBxYCa+QoyT/MABPEkrypIa5tU=; b=tnfkkhFXAA0/DMsAbH1NJmhIBT
	SeXXynJ2G/FqEzeG1U5RVC/rBmDRshU1HWjTCxgK3lvgbHAQVoJubGFBFN05gkQtRSlnB7EHBXLgu
	J+ROYzfpeX7U8s9vmD3GdiZH+0L9FqrOhnZ+Te7GzD5mHAeaE4CpM6bFEWmAb+5SwK7mo3Z0Bjl3A
	lshmJN2DU5U8k1Qk+tIazxrFqTm5h9N1hIQiRtaKkjbkyMRt0YwNOfhCnWl4eMNtKhEHgzMH9BMFF
	6hJtMeU3EVmIIkmYdixR8F20g8AxqQ4xL2/0+iO/4H5EdkfWv+/6fCnXctblhbZVXlo/YUxhbVo7G
	2qPqt0tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyxK-00000006wv9-48h2;
	Tue, 10 Jun 2025 13:23:58 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOxHu-00000006fUr-0WVr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 11:37:07 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-48d4e47eec8so10084431cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 04:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749555425; x=1750160225; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1IEUo4OXi/6u8Jsr6TBxYCa+QoyT/MABPEkrypIa5tU=;
        b=Yrk8meyRkGJuPf6xAAEPOc//S9t3zMh7XQsAz1JBKkAbMNZSlv/xz+tpjZPmmiLmuA
         p9xMkTGX0mKEGshMYgQXf9I5dLrblmrYdYP0awnv+tBBQ53Fyb2R2f5xJM0UqggA2L5I
         lksO6mxNOyGaq+FUdkOjJ1Jkn3/SLp5MgpAuZf1rmZsB9TjsfrqZzGJWE9dhbg9Jz5om
         DSNijIr62ZZ69UnWlQ7cVwTOcuLNjdl0zwCQEHCuQyIuhVtsS/A3Tm5d0aU56OtN8roL
         lZhbQ1G2ZyIequWrFvyi+t7Q2CRBrZuHkDh2yncM4ylljoB6+wNVbBzV9I/E7Wg6gUNa
         AdNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749555425; x=1750160225;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1IEUo4OXi/6u8Jsr6TBxYCa+QoyT/MABPEkrypIa5tU=;
        b=XYcXG7ss8PrypandCUU1l8ycC2lgkqCuoYDx/XbOURvtSc+A7VvrVDq4xMCFMGJvGu
         rdW0k66T9wfXcvaAtGeyE4HZODgg3bJoLMljALf1TLzB9whoyoZkYQQvSmEKYDWVdYR/
         j0lIYg1fJ4baR0wKMTUH7dGMwFp8SGz8+227O17c2WjAWd2Y8CTRRXjswS96gsHvY4wx
         pQQHr/+3lbllYiWiEL7x2IEEorbfggrhDIa6uJwwQySFz/d9l7+QzitR4Uu40zLml3rr
         tSL/OTD6ARJAD6G9Tn9Z6Gj8AplzX4VEY1TFHWFB/r1A37VVAMJVWstDEXytt/LdWVy5
         68jQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrI4VTRWWyW5rqMfsI6lmyy06XdcHbIJVVJVFoyMhdILtS8XSqKENGfYTjl/0MT0ZH96+pxKuYLbI/bOgZjzfz@lists.infradead.org
X-Gm-Message-State: AOJu0YyL7BwdSt58mlEMETHRvcopdVHJIaf08j3WD1HkyeeHKB+6h5F9
	+h0n791SSmuzu8GpjFxV3+9VHG0XGFYguhbTZAKljV1rHcdwhm9ot1Qw67+tb0rYtZsRuE/R2+0
	PUrIEIF5C/zUCYqN6stzCj6BmEwmVxbltBt/aobcE2g==
X-Gm-Gg: ASbGnctuOzYyW2p061OXOPNPEJ0c94kaeavjzPqIGvxzktYrruuoUKRItU0/gbohIDZ
	ukqv3w0xuUQrHN3kW/lDkhOKBiKFqS15sl9a1UJO/1wZATBXs96sS58GZ+FlBreCYgm0NGxdkjH
	4vCQ05uWkEjWotb+Dwa4UVN/Ap02sQucMH5Dgiy7kimQ==
X-Google-Smtp-Source: AGHT+IHvHKo08me5RcB6HhT8MUj1njWXYeU3P86l+7s/He8833skTN9xQoNPfcqRdrNFzqssiZdslfW5Rg84q+3rI0M=
X-Received: by 2002:ad4:5d44:0:b0:6fa:c5be:dabd with SMTP id
 6a1803df08f44-6fb09f8a766mr87178436d6.11.1749555424663; Tue, 10 Jun 2025
 04:37:04 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYuppX5LeRjOAZWsYRCs76PVbnv-TN_RrszhDsk=KregyA@mail.gmail.com>
 <15979303.uLZWGnKmhe@diego>
In-Reply-To: <15979303.uLZWGnKmhe@diego>
From: Anders Roxell <anders.roxell@linaro.org>
Date: Tue, 10 Jun 2025 13:36:53 +0200
X-Gm-Features: AX0GCFt6fIa22bGlOZEBQVbwxbv765S6LyHqHyQH8BFAYJiOCtlXCLCPP7EEZaI
Message-ID: <CADYN=9L+Gao0w_CThNd96-yYbZDMZnwY7RvagCOdzUC4rKc-Ug@mail.gmail.com>
Subject: Re: next-20250610: arm64 No rule to make target rockchip rk3399-rockpro64-screen.dtso
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Regressions <regressions@lists.linux.dev>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Naresh Kamboju <naresh.kamboju@linaro.org>, 
	Peter Robinson <pbrobinson@gmail.com>, krzk+dt@kernel.org, 
	Dan Carpenter <dan.carpenter@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_043706_173837_3B12D08B 
X-CRM114-Status: GOOD (  15.29  )
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

On Tue, 10 Jun 2025 at 13:22, Heiko St=C3=BCbner <heiko@sntech.de> wrote:
>
> Hi Naresh,

Hi Heiko,

>
> Am Dienstag, 10. Juni 2025, 12:25:31 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Naresh Kamboju:
> > Regression while building arm64 with the Linux next-20250610

[...]

> > https://storage.tuxsuite.com/public/linaro/lkft/builds/2yJ4IOQa1XxMqDgm=
zjEl7VszYE9/build.log
> > * Build link:  https://storage.tuxsuite.com/public/linaro/lkft/builds/2=
yJ4IOQa1XxMqDgmzjEl7VszYE9/
> > * Kernel config:
> > https://storage.tuxsuite.com/public/linaro/lkft/builds/2yJ4IOQa1XxMqDgm=
zjEl7VszYE9/config
>
> thanks a lot for this notification.
>
> I'm surprised that overlay build at all when I built it yesterday.
> But yeah, the dtbs_install target really broke with that change.
>
> I've amended the commit now [0]

Thank you for the quick fix.
I applied your patch and built it, it worked fine for me.

I built it like this:
tuxmake --runtime podman --target-arch arm64 --toolchain gcc-13
--kconfig defconfig dtbs

Tested-by: Anders Roxell <anders.roxell@linaro.org>


Cheers,
Anders

>, to change dtso to dtbo and ran the
> dtbs_install target sucessfully with that change.
>
> So on the next linux-next creation, this should hopefully be gone.
>
>
> Heiko
>
> [0] https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.=
git/commit/?h=3Dv6.17-armsoc/dts64&id=3De14491aaa6ff598bbe9d462e44c01ac6575=
4f445
>
>
>
> >
> > ## Steps to reproduce
> >  - tuxmake --runtime podman --target-arch arm64 --toolchain gcc-13
> > --kconfig defconfig
> >
> > --
> > Linaro LKFT
> > https://lkft.linaro.org
> >
>
>
>
>

