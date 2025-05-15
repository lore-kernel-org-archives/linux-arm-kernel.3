Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7C18C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 18:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bNN+vfuMJJgSzRBBX1dcv69JrH0Sd8EtzpYEboDV/q8=; b=Ibw1SxrR8NVvFJWeUuk+PRHARi
	SSQoyiUQResndF46Kis4QW/ZB3AGLaeDq9P48XQ7aKYu1kHjSr8Rq0LxFACG5S8bou8mMzpYLT09q
	BLc4klSlx/79+1tGM9uW22puyAUFubGUSiBHeZxaqPHExrDXDNEk10kdggrCYiYo+hnMtr0D2mm9G
	u3TrfcNYBgIZ7VSyyMCvK7G07tGrHgDr87gBD6y4SSDdKT9eKO0m2vPf3hURv9FHmqUN3XUhJ5lEx
	vo4Z/vgfO5zDECtxJBzzlsYCVf0ALeFoqS+HwHJ3yNzg2f561ptvtF9pnhf9lo42AX34XPQDbtu+M
	TemFNIZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFcwN-00000001Uv6-1Afj;
	Thu, 15 May 2025 18:04:19 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFcuI-00000001Uir-4Biy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 18:02:12 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-ad21a5466f6so466985466b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 11:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747332129; x=1747936929; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bNN+vfuMJJgSzRBBX1dcv69JrH0Sd8EtzpYEboDV/q8=;
        b=lM5flT3KpxtqfIG96CiRZ3lqwaMWyrd/2h1R1L5U3D4GA9grfg+nySteXOCJg5OPVA
         pABdfYykEpGxvICjQ+Y9vRumdvmPfwD9IA7UVV+cZfuD3RPlvDeFB9syFvAgNNRDO1Zb
         BdPQo0wYy91Wg03xNHoKoVjarmxkZ1F2dalzshy+4zilYSXmRM3BXIUZzAqA4loip22/
         4MNKueyUdfU5yzbuCRqh1QMY5w5xBzLvUuDJE5JAOF8Oot/f7OxcrFxdgA3SPHFj4zjB
         d/alo4PsFKkRiG6seUAyA4bbIZGOusro7GBe9ZTtIRKvLLWLLgRucS38eX9yyU7kibnI
         ov5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747332129; x=1747936929;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bNN+vfuMJJgSzRBBX1dcv69JrH0Sd8EtzpYEboDV/q8=;
        b=lckOPBfVRe/ALXjZoJ5sBNudTJC/q8IJwfgLNaWRo9kE7wrJJPb0ezqOvVr+enVpXd
         1Fk2y5VjC4SYH7ZELIiF9fyyo8/YIxj7nZuEg3gIv+cAWkErxSO5Io5iF5mYTTEGT5ao
         bl2zhhNhUkz8bY656Oq8Dsfphv03vdwYyxDHFh21B0MPycFiluyqZfyDrqvaPBKeW5dU
         YPw9ydv1/xr64Mc4QUS6HDBelk6k21ZXZ2GS0ScvxRwIpuiS3/mi2Wx4GliblDH8wjIs
         CKreuKHM8T8KGsv8l4n8e2EEkTfOvy2iuz0oATZ2iWqMalQAUmK7BzH37FtLNNfuLteW
         pnRg==
X-Forwarded-Encrypted: i=1; AJvYcCVB2a+87N6AFGLXcizKClKZ4pSIf5bjbUzGBy+AmmF2vn9GftKZywcm0oeF9X8wfgI3fmjpL7o0bPSLRI4fvjHF@lists.infradead.org
X-Gm-Message-State: AOJu0YznnjVEJKgkIiwF1jQA83dvCuIJDR6WxSWY1Kl9j1/IunwUIKSB
	VdxY2NHkVx5oOE+MdeLSSyVTaIu3o+JBzN1FEo7zbrXqh9O59n9rWaexonY17xHhTDPFUWfIMHW
	hKngcqNauo71EI915z7juMl8B1MfYGG4=
X-Gm-Gg: ASbGncuFod1WJOZQnOOQY7b44y0E1gH0a0i5UEG851DeV9awcYqD+pe3MueWbqttI+u
	rDs2Wlg1nxt3NFKV9Y9yTwQrQ0qUGT6VBLa5JLjaQkZaCmC8BaY2EGWF8GJ1kDLQWNXBX8EKEob
	L7jeAFkgJfaoHmS8toQi2nbAzFjus3/Wg=
X-Google-Smtp-Source: AGHT+IGJ3VLgyC5oRyYT9SJhjLgRqlja96rlJ3f3rzeXshYp1J9lbgDhqI7B6B7Y0eDrmuUni3A/DX8mMtH0+4aqo58=
X-Received: by 2002:a17:907:980f:b0:ad2:41ae:a1e4 with SMTP id
 a640c23a62f3a-ad50f7c4f3dmr407267966b.24.1747332128837; Thu, 15 May 2025
 11:02:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250430123306.15072-1-linux.amoon@gmail.com> <aCR9RzGMWEuI0pxS@mai.linaro.org>
 <CANAwSgSA-JHMRD7-19wijOY=TSWD-sv6yyrT=mH+wkUJuvxFAw@mail.gmail.com> <92c2949e-2fc1-40e9-9dea-e3d9f7aa571d@linaro.org>
In-Reply-To: <92c2949e-2fc1-40e9-9dea-e3d9f7aa571d@linaro.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 15 May 2025 23:31:50 +0530
X-Gm-Features: AX0GCFsEAXplwRDB3NXZqHZ-d-ohJ2IJuxMQMC4KvVGNnVidBm-TZoRYGMggWAM
Message-ID: <CANAwSgQryVLdRVd9KRBnaUcjtX8xR9w9BBTCvoqKH6funkj=2A@mail.gmail.com>
Subject: Re: [PATCH v6 0/4] Exynos Thermal code improvement
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	"open list:SAMSUNG THERMAL DRIVER" <linux-pm@vger.kernel.org>, 
	"open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>, 
	"moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_110211_039753_0669D382 
X-CRM114-Status: GOOD (  32.02  )
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

Hi Daniel,

On Thu, 15 May 2025 at 18:59, Daniel Lezcano <daniel.lezcano@linaro.org> wr=
ote:
>
> On 5/15/25 13:10, Anand Moon wrote:
> > Hi Daniel,
> >
> > On Wed, 14 May 2025 at 16:53, Daniel Lezcano <daniel.lezcano@linaro.org=
> wrote:
> >>
> >> On Wed, Apr 30, 2025 at 06:02:56PM +0530, Anand Moon wrote:
> >>> Hi All,
> >>
> >> Hi Anand,
> >>
> >> if the goal of the changes is to do cleanups, I recommend to rework
> >> how the code is organized. Instead of having the data->soc check all
> >> around the functions, write per platform functions and store them in
> >> struct of_device_id data field instead of the soc version.
> >>
> >> Basically get rid of exynos_map_dt_data by settings the different ops
> >> in a per platform structure.
> >>
> >> Then the initialization routine would be simpler to clean.
> >>
> >
> > Thanks, I had previously attempted this approach.
> > The goal is to split the exynos_tmu_data structure to accommodate
> > SoC-specific callbacks for initialization and configuration.
> >
> > In my earlier attempt, I tried to refactor the code to achieve this.
> > However, the main challenge I encountered was that the
> > exynos_sensor_ops weren=E2=80=99t being correctly mapped for each SoC.
> >
> > Some SoC have multiple sensor
> > exynos4x12
> >                      tmu: tmu@100c0000
> > exynos5420
> >                  tmu_cpu0: tmu@10060000
> >                  tmu_cpu1: tmu@10064000
> >                  tmu_cpu2: tmu@10068000
> >                  tmu_cpu3: tmu@1006c000
> >                  tmu_gpu: tmu@100a0000
> >   exynos5433
> >                  tmu_atlas0: tmu@10060000
> >                  tmu_atlas1: tmu@10068000
> >                  tmu_g3d: tmu@10070000
> > exynos7
> >                  tmu@10060000
> >
> > It could be a design issue of the structure.or some DTS issue.
> > So what I found in debugging it is not working correctly.
> >
> > static const struct thermal_zone_device_ops exynos_sensor_ops =3D {
> >          .get_temp =3D exynos_get_temp,
> >          .set_emul_temp =3D exynos_tmu_set_emulation,
> >          .set_trips =3D exynos_set_trips,
> > };
> >
> > The sensor callback will not return a valid pointer and soc id for the =
get_temp.
> >
> > Here is my earlier version of local changes.
> > [1] https://pastebin.com/bbEP04Zh exynos_tmu.c
> > [2] https://pastebin.com/PzNz5yve Odroid U3 dmesg.log
> > [3] https://pastebin.com/4Yjt2d2u    Odroid Xu4 dmesg.log
> >
> > I want to re-model the structure to improve the code.
> > Once Its working condition I will send this for review.
> >
> > If you have some suggestions please let me know.
>
> I suggest to do the conversion step by step beginning by
> exynos4210_tmu_clear_irqs, then by exynos_map_dt_data as the first
> cleanup iteration
>
Ok you want IRQ handle per SoC call back functions?
so on all the changes depending on SoC id should be moved to
respective callback functions to reduce the code.

Thank  you for having a look into my changes

Thanks
-Anand
>
> --
> <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for AR=
M SoCs
>
> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
> <http://twitter.com/#!/linaroorg> Twitter |
> <http://www.linaro.org/linaro-blog/> Blog

