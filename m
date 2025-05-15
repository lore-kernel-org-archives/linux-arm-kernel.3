Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 842C5C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 11:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wH93pyrIEPQfVMzkjhmhq8lcyU/jh4Z97QhhnrcpdMM=; b=C3h4GZmqFy8CP11VuH/eLHw0oG
	DAyvzavWPbsHy3xRANe/UxuSS49/ap5eRM8i7gaTUbzzMbLs91ZSz+axmaUQxbvQqhf5h4cmD9MvO
	ELWc9HmxCbbhXdFuWA4REvcz9OpE6sX9GadalhYXGpW9aOXsR9UVzwdXy0Vjud/QHu8AWfQ/EjSrR
	irTEGzPPHYb2NoooFLVYoGTY0Ji/iimYoIuH4D5Mv2ew1d29eytCkvqAV484gPJLO7mJwUsQbV8Fv
	5Ng89Ua4Agu9NawTIa9XvvmLm+1h6YUi4tyVGyGr9RRIItwX5Y7n9sR40DrHF5B039JLTbsa0Dz9f
	C3W2VuXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFWWE-00000000NHT-2K8J;
	Thu, 15 May 2025 11:12:54 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFWUC-00000000N3w-00aM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 11:10:49 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-ad4ce8cc3c1so98430866b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 04:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747307446; x=1747912246; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wH93pyrIEPQfVMzkjhmhq8lcyU/jh4Z97QhhnrcpdMM=;
        b=GAgOULPbRQHHM8ueyOo2H+OBoIDHhHXxSJ5GswLQ/vaLuR2sAQLhT2KAlPTRM+Uis9
         LJJL6srQ8k5vPxAk9iQFTaqzXMGjnKY+F+nt+MULXKquCVqciQ6DRaxNcdJ1aO/eyd5a
         lK5e5dqa8A4NlJLelWBMQ/1qvuJi8hqREl5t5agMVRmquRxw4eKbo63WSedscG2j9lNv
         N0BgUBvLGj4SphessufJr145M+hBWfZqCGaZ3vgvBZadcp5NyVBNfQH03rsY7MJt4VcK
         uQ/LBmeZSXuJnNGWn/n5Sy92TFWBFC2BRI0JnGp0HZTXxLDSzupSrd7aOBSB7YvdgfKu
         WHIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747307446; x=1747912246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wH93pyrIEPQfVMzkjhmhq8lcyU/jh4Z97QhhnrcpdMM=;
        b=REmPjxV3AHSv3lNHYN4MpblyggKJOQIVus54/sXj1N4f4IjuUjPHOS9ti/bRClFmp4
         R6mFza7ablMvf609srJkjiRZ7oJ2DvNGJVgiijL31Q0I5nukp/7eqCPRjev3pTs+DThI
         /eIKVWWXYtcY9YmzrZ+WLowtLEb2nrUfaiGK17NnbYK/Y9Sq1kR0Ll1+5xslsWf+BPKE
         i+snmt3BJpS0A+OXTNltFhx1vj2l8+xlvR2hNm4dDWeAIL8I4uQdF7U/rr9ctxlfhCK2
         Nf+tmTwB2QxRxl+x1inv7yZ44y0J8F+s5/IkpvMyO7IQQ8pSb3j27Jnevv8HTBs6fqzT
         ROGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwcd8WGru8+beV5VcF0NhdFspz8AmeG8qn0+NyhfPzmAuiZpH2BANvERaP2fyThdF8lLVRFoWwH1n6Gz43PqGO@lists.infradead.org
X-Gm-Message-State: AOJu0Yx28e2xREFP1hZA2Ph8tIJI0mLvSCas+jsk06XHwbSyrlvztAp9
	9kxtUb9COuS0u7ghG8OBLr2/W6R5EwVC+22U5QheJD+K4kpzfB42hz0n/xOUubWYXAEBYjuKNDH
	/dajk45HjncpG0Eu/X/jda3sAwek=
X-Gm-Gg: ASbGncukTbmNrgimckJBEBxw+4c8TXe2UG+JGBacVqwr7EYNAN5d1Es/yXymoutiTqk
	gyEmOLF/8h1cCFyqk8cShNDM3bDKbRvEAGryQlOQL05wFu7MHGeezCBh699UJEmC02o22YGZTh7
	sCt8twPM9fjgx2YqtjOZxfesOam0dLPjRtCylAbLYkNA==
X-Google-Smtp-Source: AGHT+IE0xGxRoRc2hiMiqEaYs/R8BerbabBDK4/6SGlmW7kn9vsBtzHGwphHTBRO8aoYTAxznhm63Sb3LeSpgXFd/NQ=
X-Received: by 2002:a17:906:730e:b0:ac7:e815:6e12 with SMTP id
 a640c23a62f3a-ad4f717d80dmr692300366b.33.1747307445484; Thu, 15 May 2025
 04:10:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250430123306.15072-1-linux.amoon@gmail.com> <aCR9RzGMWEuI0pxS@mai.linaro.org>
In-Reply-To: <aCR9RzGMWEuI0pxS@mai.linaro.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 15 May 2025 16:40:27 +0530
X-Gm-Features: AX0GCFs2e1Pkh4MEeMLO4mfbxvj7Hh0TOcnvMLseg8q2U30qPhgLXLwcneYB4S8
Message-ID: <CANAwSgSA-JHMRD7-19wijOY=TSWD-sv6yyrT=mH+wkUJuvxFAw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250515_041048_042927_103DF797 
X-CRM114-Status: GOOD (  20.03  )
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

On Wed, 14 May 2025 at 16:53, Daniel Lezcano <daniel.lezcano@linaro.org> wr=
ote:
>
> On Wed, Apr 30, 2025 at 06:02:56PM +0530, Anand Moon wrote:
> > Hi All,
>
> Hi Anand,
>
> if the goal of the changes is to do cleanups, I recommend to rework
> how the code is organized. Instead of having the data->soc check all
> around the functions, write per platform functions and store them in
> struct of_device_id data field instead of the soc version.
>
> Basically get rid of exynos_map_dt_data by settings the different ops
> in a per platform structure.
>
> Then the initialization routine would be simpler to clean.
>

Thanks, I had previously attempted this approach.
The goal is to split the exynos_tmu_data structure to accommodate
SoC-specific callbacks for initialization and configuration.

In my earlier attempt, I tried to refactor the code to achieve this.
However, the main challenge I encountered was that the
exynos_sensor_ops weren=E2=80=99t being correctly mapped for each SoC.

Some SoC have multiple sensor
exynos4x12
                    tmu: tmu@100c0000
exynos5420
                tmu_cpu0: tmu@10060000
                tmu_cpu1: tmu@10064000
                tmu_cpu2: tmu@10068000
                tmu_cpu3: tmu@1006c000
                tmu_gpu: tmu@100a0000
 exynos5433
                tmu_atlas0: tmu@10060000
                tmu_atlas1: tmu@10068000
                tmu_g3d: tmu@10070000
exynos7
                tmu@10060000

It could be a design issue of the structure.or some DTS issue.
So what I found in debugging it is not working correctly.

static const struct thermal_zone_device_ops exynos_sensor_ops =3D {
        .get_temp =3D exynos_get_temp,
        .set_emul_temp =3D exynos_tmu_set_emulation,
        .set_trips =3D exynos_set_trips,
};

The sensor callback will not return a valid pointer and soc id for the get_=
temp.

Here is my earlier version of local changes.
[1] https://pastebin.com/bbEP04Zh exynos_tmu.c
[2] https://pastebin.com/PzNz5yve Odroid U3 dmesg.log
[3] https://pastebin.com/4Yjt2d2u    Odroid Xu4 dmesg.log

I want to re-model the structure to improve the code.
Once Its working condition I will send this for review.

If you have some suggestions please let me know.

Thanks
-Anand

