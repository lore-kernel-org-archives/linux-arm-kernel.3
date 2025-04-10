Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 544C2C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 19:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uJ44KL1v8cclERlkY/9+gHNrRoHqolMrfYg+/+KMHGY=; b=FcCTuhf2aV8WnUT4/O/CWvUnzp
	8Li2PYLNUbIJ9PCC+BWBvrKAe7/l9N+7k5LlZlaDTsYIkHIHQAtXhczydiYVlQxn5WsvrLOxKVefm
	kK3z1JVxsqzCpXuoYy50ckbhSQMMEqiTdewRDZ0lNsptJYG0glFHWOKaWcRtS3XbRWnsRvMHJFsUs
	sJ6RFl2zWHHlvylP8+bAw0ucedXjrXncBhTCBAk6z/Sz27kRvTfb2t2cHmhGDlj9aBidTv1nHb/NP
	yjDc60t1ifkddU+BzisVqY8uX3uEfKu73vpWCrpt2X5ihFo+ETOtJPAVIGTcre8IDmQpgIiljZzHc
	zTt6IoKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2xSk-0000000BdNS-1cdW;
	Thu, 10 Apr 2025 19:21:22 +0000
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2xQw-0000000Bd1D-0ugI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 19:19:31 +0000
Received: by mail-ua1-x931.google.com with SMTP id a1e0cc1a2514c-86d3805a551so530797241.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Apr 2025 12:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744312768; x=1744917568; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uJ44KL1v8cclERlkY/9+gHNrRoHqolMrfYg+/+KMHGY=;
        b=h7l4YEkXeN+bCrMnyPr0zmCc5+G3uAPViYR73MPEllM0URuwAbp/wfrxWw714jApLv
         LLZiDyqy45dsGXoZZHyV+St9evmOwP75TYb91keh2wBoAmSIwSH70JUbRwYc7z0zKidE
         yxkZ5DRRsdmS1F+Zq18PuMHPdT1cu0kXUdXLGM/1zlS2WRB9STf7rcGWyBmbzQAFRG3O
         kiMrWNGXP0iGQXwBejivA/uDSgyvPAlRQugymthCUVLAfyc3U28CQ4TDMVayz7t/+/wS
         LG6SJDWZ4onMBo1bgmhgOBlOuipxAKsvBoLR6QcMppWlOR074pGIFqzz3YHApwIsZJdT
         RRtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744312768; x=1744917568;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uJ44KL1v8cclERlkY/9+gHNrRoHqolMrfYg+/+KMHGY=;
        b=GwMFx+3SrgQZNy3OVRWBpGWu14HLr+za3fLmvj4uNdhnVpG83Rdzjs9SWT6WtJcta4
         ZWFysZ5Itq4EfQgurDRmhew2uGPjvdBdmh8atFvsuffo30ulneInU+uQk5WGLu2sKm2b
         GYuJtMDdctEjz15I/B94ZClj5xQn/XBau6lMKaQsGThenM/PVUJf9v1BDB55gJ3dCr2M
         rh7LEnJMe1uXso0zaIAN2k/izYi0ZfpSkKQ5GwFC7mp4bJ1NdYc+5WdAfLZrGtV+GK/x
         aKV2igCsR59I04Jj9TgK0bQZrGKTdvDKR420oolfmIMVeCZF7z873frp0E1JNjjzLqAx
         HoAA==
X-Forwarded-Encrypted: i=1; AJvYcCUGbykdPX0cPUmqJ0Xn9KGwPqHAAX8cdNTuGft4aVVfR3yzcSxx89d5D9G1FueO7OtBUKQsDPIXh0z8gQi2Xm7a@lists.infradead.org
X-Gm-Message-State: AOJu0YyMjJR08u2r9EQnoylQQ81J5DqiTPaqeQkgiFx9DPgmOgUU7ECj
	YQD7nWZWF91fgHsLnf/6g9lUnIYY4woEjWEM6djxY/66jY+evMCtY8W9Ji8IZM/CRgJln7LbsMZ
	jaqRhXDNTmdBvU3Mqk1jF2lc9Mzwq5iDKtEjCfQ==
X-Gm-Gg: ASbGncugu3V+13hsXESZ0QdtZp6d2EuSxo0yP1pm3OH+YuuN392H4yoPXaqaukInTzh
	LO1JBvnakvL/RQgEUvFVLPSAdRk4eZOwK6GBzBj3cIbiSQ6q4Dbl7aeFEmarJgp87jeHfzcQDcs
	NyQovtw7AWeZ01TRBM2mC738Ze1n3aXazOJu3pIFLcRHezbWrZpbzhYJa3
X-Google-Smtp-Source: AGHT+IHU6YSwa0MLo8eCVOlFo/lHCz4iATY4ROkZpkiR5Y6ykoDC8YdvHIZgJD1qNNAUnzcTLOICHJeYH9sIlGNd8og=
X-Received: by 2002:a05:6102:5718:b0:4c1:76a4:aee4 with SMTP id
 ada2fe7eead31-4c9d35d5f51mr4752389137.19.1744312768378; Thu, 10 Apr 2025
 12:19:28 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYve7+nXJNoV48TksXoMeVjgJuP8Gs=+1br+Qur1DPWV4A@mail.gmail.com>
 <20250403011849.GA3138383@ax162> <CA+G9fYtrsLHvMH=ofmdS3MMsMTEj3k0PD7=qsRsA4WkSqLkCzQ@mail.gmail.com>
 <20250405002757.GA836042@ax162>
In-Reply-To: <20250405002757.GA836042@ax162>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 11 Apr 2025 00:49:17 +0530
X-Gm-Features: ATxdqUGxZ781SEBtkgK3P-Nu9oNJpMn3ybOmTk6SMAJm8t2wE9n95hV6rO8wxr8
Message-ID: <CA+G9fYv=jUunRgUs=ROptP4p5DNxUuUHxYsnWaxUUXbiwdszsA@mail.gmail.com>
Subject: Re: v6.14-12245-g91e5bfe317d8: Boot regression: rk3399-rock-pi-4b
 dragonboard-410c dragonboard-845c no console output
To: Nathan Chancellor <nathan@kernel.org>
Cc: open list <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, clang-built-linux <llvm@lists.linux.dev>, 
	Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_121930_269205_46BD9BF0 
X-CRM114-Status: GOOD (  15.83  )
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

On Sat, 5 Apr 2025 at 05:58, Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Thu, Apr 03, 2025 at 04:17:44PM +0530, Naresh Kamboju wrote:
> > I=E2=80=99ve re-run the tests to validate the boot behavior on the Rock=
 Pi 4 board
> > with different Clang nightly versions and the latest mainline kernel.
> >
> > The combination using clang-nightly:20250319 successfully booted the
> > Rock Pi 4 board.
> > However, the combination using clang-nightly:20250401 failed to boot
> > the same board.
> >
> > "name": "clang",
> > "version": "21.0.0",
> > "version_full": "Debian clang version 21.0.0
> > (++20250401112529+290d7b82cb5d-1~exp1~20250401112547.1360)"
> >
> > Reference:
> >  - https://lkft.validation.linaro.org/scheduler/job/8196258
> >  - https://lkft.validation.linaro.org/scheduler/job/8196275
>
> Thank you for verifying. Do you test with clang-20 and if so, are tests
> at that same revision passing? I want to make sure this is an LLVM
> regression before trying to get into figuring out how to bisect with
> your setup. Another way to do that is to see if clang-nightly boots are
> failing on the stable branches, which would point to Linux not being at
> fault.

clang-nightly boot failed with stable-rc 6.12, 6.13 and 6.14 and
mainline and next on following devices and virtual platforms.
- dragonboard-410c
- dragonboard-845c
- rk3399-rock-pi-4b
- Juno-r2
- e850-96
- FVP (Fast Models Fixed Virtual Platforms)

Boot Test links,
- https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.12.y/build/v6.=
12.23-2-g8e0839d16957/testrun/28076019/suite/boot/test/clang-nightly-lkftco=
nfig-kselftest/history/
- https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.12.y/build/v6.=
12.23-2-g8e0839d16957/testrun/28076006/suite/boot/test/clang-nightly-lkftco=
nfig-lto-thing/history/
-  https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.12.y/build/v6=
.12.23-2-g8e0839d16957/testrun/28076009/suite/boot/test/clang-nightly-lkftc=
onfig-hardening/history/


Lore link,
 - https://lore.kernel.org/all/CA+G9fYve7+nXJNoV48TksXoMeVjgJuP8Gs=3D+1br+Q=
ur1DPWV4A@mail.gmail.com/

>
> Cheers,
> Nathan

