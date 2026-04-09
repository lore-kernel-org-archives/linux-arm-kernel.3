Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE7C5EA3C59
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 12:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C159+BoCf0JeccgPtowgYy9MrOmnFdOSeFm140he7+U=; b=KiFGZcA8TnUBVHqX36bpX9Aqea
	L1Ch5T/6h9zfnckX2lv7Dg1nzjL4TNa730KFd62X9/j3gchuumODI0DDnl1v5mlNvBlmKkrs36uVZ
	LIwGyH1EIh/F/sGIYt+4UxgmBT3LGXJqy2kfJpqtOKD+y9+6WVYPs7c4uF/FitG4/Dy+YErwYdmr6
	sJksD2b9lLJbp39L5Hc1depjRG7b87tBOGT2Y0Vrj5VKWK1gtOw9lruQRi1faevIhCvyGA3P7G2pd
	mmDiNtaCjhcoWce4KO0NCuNWnBE8v80KH33BWJ02FPtIdJ5seYwS5XbcqU1AN3LsyhXUmiVMdTd9Y
	nHbKXR/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAoB1-0000000ALYa-2ubk;
	Thu, 09 Apr 2026 12:08:03 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAoAw-0000000ALYD-2yrd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 12:08:02 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-43cfce3a195so495329f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 05:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775736477; x=1776341277; darn=lists.infradead.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C159+BoCf0JeccgPtowgYy9MrOmnFdOSeFm140he7+U=;
        b=jOtkvZVDJ1/c7BMQfM2YCmq2yg3yN5BdRzelo7JnJaypoa3X44Ak3yIug8PpQAQts4
         t/WoPv8rNWHLaPjn4yJbUbM0iif7DCOuuidLi8ZjElcaDoxYKUFF87fxbiTIsP+UKhs3
         XowPE0g2Ji3zL2FEFmTodny7WvHVfqfqrFqfm6TxUk8AQSJVB32Op8eKO6drDiropyAJ
         gxUiM9A8ReHqw/NOv4SiLhj3T5zJpQt3zvuQulZtSkpluCwGrDfeC5xHWJuaVuIrfQ0v
         CWYAc10zhKKCqlhY8ffvhsWrocGxX3DYtgs6Fkuuh0W716BkpwRUFTKMDiAtuaqedCv4
         fprA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775736477; x=1776341277;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C159+BoCf0JeccgPtowgYy9MrOmnFdOSeFm140he7+U=;
        b=RcoVKEmztV4WOuQeX8qE7v4B8FAipcsAsQ1k8zp1pab4xW8Iw5y7KO61CQ5P9HuYjn
         7mjo1FOjA9T/1K0i4PrEB2APjuf4s5n07dZzdiI2A19D+ajC6uAvca3LjfwNcFjZ3MNe
         erkiUSmZ2OzfTakNsrXjiAVtj2FEOeoXa7XzxqES0HPb6Ml7NHDYhOkTacHA08l15R/y
         I1JX6Fi7gsPBJh0fXcfVMKY3MWKmmPA5keHNFfS/M/Fab0MLcinF9PzdHtR7gPVsrHcb
         r1qaWwRdSdO3mZYTJpuR+hB4KmuCdOVyjTjBO7e76Ma3kydEtzR3Cz+lyWAxBHXuSF13
         oSNg==
X-Forwarded-Encrypted: i=1; AJvYcCWZi9SIq7/qrHdP10/207xqoFcGIc53S6bSKQT0ILeISuRwC9t8HxKJHm4z6DaF1wzjZjAWTyS+sOI89GRcyUvu@lists.infradead.org
X-Gm-Message-State: AOJu0YyIvd5UagPkWeKovv8xhL8fO99IFrXfNoiH3IpaX/KFw+q08cv7
	vWDAbsfccXSJfCOgckZg5UFx44ZgOD+bXOgvGRd6hvjm8EcdCQax05M3EpiOh4IpSXs=
X-Gm-Gg: AeBDievzzB21L3eI51Ej82nZp0EYgj3urRsg7Un9Zi4gePu97H2ClM/JfymP0FDv2eU
	XVqDyKjjZlLo/IhRNVssJrgkzdniJY4o9G2zEuwTIyrQdohooDpb3qzpmXuI31Fall1c2I72Ei6
	PEOhjOJmpDgeqa1n0E90qjhgLkBFHr7LSmpFVhMzmqimHPdF+FfnbVHoeKhbE/UdaMoKvXWE996
	Cws2SwX3Ws2ZCn17q2gHKOf2VxabQ/IWOhzVchIcm9THd15IncbVW9Rr/9rGmdnx4pSJwkph25O
	A0nYiZxDU8y30k18+zrGJPQ3r0DrQ3iRYROk44o0eU3C6F6Jfwrx5YwwXDqsL6eH54vuQ00m2n8
	wZCeB3be1oYs0h7X6oH08Ku3EocCkWQEQPbm2DPG6r+UrMl4SZslhUTpFAWFueOjq0Qsx+J3w2K
	um9U8YxLS99DyQaKbzYkGQCRAPwcnMfa9G/4G8Pi+2aoOgCg3C5qjDMke3ZEOyBmy5zcex9bmJg
	6YL983k9Mh4IBY7XNrN9ZZCITLF
X-Received: by 2002:a05:6000:2086:b0:43d:309b:f2db with SMTP id ffacd0b85a97d-43d5a126f8dmr4358618f8f.7.1775736476554;
        Thu, 09 Apr 2026 05:07:56 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:e6b4:ab32:911e:de1c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d2971sm66154263f8f.22.2026.04.09.05.07.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 05:07:55 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Apr 2026 13:07:54 +0100
Message-Id: <DHOM1MT2MQON.3F5MF0V2RYSFJ@linaro.org>
Subject: Re: [PATCH v2 5/7] soc: samsung: exynos-pmu: add Exynos850 CPU
 hotplug support
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Henrik Grimler" <henrik@grimler.se>
Cc: "Sam Protsenko" <semen.protsenko@linaro.org>,
 <linux-samsung-soc@vger.kernel.org>, "Krzysztof Kozlowski"
 <krzk@kernel.org>, "Peter Griffin" <peter.griffin@linaro.org>,
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Alim Akhtar" <alim.akhtar@samsung.com>, "Tudor
 Ambarus" <tudor.ambarus@linaro.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20260401-exynos850-cpuhotplug-v2-0-c5a760a3e259@linaro.org>
 <20260401-exynos850-cpuhotplug-v2-5-c5a760a3e259@linaro.org>
 <20260409115630.GA15706@localhost>
In-Reply-To: <20260409115630.GA15706@localhost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_050801_534372_E99A256A 
X-CRM114-Status: GOOD (  10.06  )
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

Hi Henrik,

On Thu Apr 9, 2026 at 12:57 PM BST, Henrik Grimler wrote:
> Hi Alexey,
>
> This patch breaks compilation for arm(32) exynos devices. Compiling
> with exynos_defconfig I get:
>
> [ ... ]
>   CC      drivers/soc/samsung/exynos850-pmu.o
>   CC [M]  fs/squashfs/page_actor.o
> ../drivers/soc/samsung/exynos850-pmu.c:17:21: error: call to undeclared f=
unction 'MPIDR_AFFINITY_LEVEL'; ISO C99 and later do not support implicit f=
unction declarations [-Wimplicit-function-declaration]
>    17 |         u32 this_cluster =3D MPIDR_AFFINITY_LEVEL(read_cpuid_mpid=
r(), 2);
>       |                            ^
> ../drivers/soc/samsung/exynos850-pmu.c:17:42: error: call to undeclared f=
unction 'read_cpuid_mpidr'; ISO C99 and later do not support implicit funct=
ion declarations [-Wimplicit-function-declaration]
>    17 |         u32 this_cluster =3D MPIDR_AFFINITY_LEVEL(read_cpuid_mpid=
r(), 2);
>       |                                                 ^
> ../drivers/soc/samsung/exynos850-pmu.c:48:21: error: call to undeclared f=
unction 'MPIDR_AFFINITY_LEVEL'; ISO C99 and later do not support implicit f=
unction declarations [-Wimplicit-function-declaration]
>    48 |         u32 this_cluster =3D MPIDR_AFFINITY_LEVEL(read_cpuid_mpid=
r(), 2);
>       |                            ^
> ../drivers/soc/samsung/exynos850-pmu.c:48:42: error: call to undeclared f=
unction 'read_cpuid_mpidr'; ISO C99 and later do not support implicit funct=
ion declarations [-Wimplicit-function-declaration]
>    48 |         u32 this_cluster =3D MPIDR_AFFINITY_LEVEL(read_cpuid_mpid=
r(), 2);
>       |                                                 ^
> 4 errors generated.
> make[6]: *** [../scripts/Makefile.build:289: drivers/soc/samsung/exynos85=
0-pmu.o] Error 1
> make[5]: *** [../scripts/Makefile.build:548: drivers/soc/samsung] Error 2
> make[4]: *** [../scripts/Makefile.build:548: drivers/soc] Error 2
> make[3]: *** [../scripts/Makefile.build:548: drivers] Error 2
> make[3]: *** Waiting for unfinished jobs....
> [ ... ]

Thank you! My bad.
I will check for the next series what I missed.

Thanks,
Alexey


