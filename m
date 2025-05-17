Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 000D1C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 May 2025 19:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nOaJS8qDeTvR+yb6xG8mvyDJYIWOLLbeVsAQNEudTm4=; b=Y3u+wzB1V2fdFe2eeENL+Z/k2+
	F9/DcKqTxpbWtf03NS3rE5blFRhH1q0ZGFZICTnUAqOwCcivXErTWLqrWonoT0o2gkG8l2MJ8N8fD
	y6USHuX60ndgxkhzF9KGsjUKo9hqQfKbDHo8gJV2xHOCm4KguUbvGtq/4fnxLXpQckoHoMg7ZSS1Y
	/kbf33JkQAloMds6rnHEZ2wKunZXuk9hVJl+iTt08ABq+uSoDHsOugdEkcI1x8gzZdbT3JxdBECrc
	qg6u+AsRPOre+N/pESvfPILeGXCawgcTou4mdiyq54IpI8bhwM0o68tA6iV9LomoYexmOuTydLyL7
	jhPKJ11A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGNRU-00000006Caw-0iDC;
	Sat, 17 May 2025 19:43:32 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGNPS-00000006CKj-3ngY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 May 2025 19:41:28 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-ad5297704aaso434679766b.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 May 2025 12:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747510885; x=1748115685; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nOaJS8qDeTvR+yb6xG8mvyDJYIWOLLbeVsAQNEudTm4=;
        b=nD0MkCmFU6qSMGcK3lx1IJ/J698hM8mw/CRhtwEP1pVzd0/161C3IniJBd4SXm3CfT
         VoT1sfXQt8QMC3geObNG0r4fQnnXo3I0ct04dTpjrmV/4ip8a93z+Pqw94Qx+21SQsAX
         j6BztNJYartedLwmALqOmZ4wuPV2uPKHCMlhoDeb+4Mse4CT5Bx2yPGDfATTWD5m2uSz
         5JFq5L8Dm+hyI540qIyBf7eB8f48H0avTLmc4+tsN4rxSovj2kK9mlkVr8XPSn2Ypqzc
         1cPHO0zFSSE16WREQCiEbxoVEuJJGTjyVYXj/96WvuKGd2HHvZgZFqn0W/Mx0XKwANrF
         v7LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747510885; x=1748115685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nOaJS8qDeTvR+yb6xG8mvyDJYIWOLLbeVsAQNEudTm4=;
        b=X2qqRnIDAkyl3R1nYPrxaIWcyEpoilh0QJoX4RJNuFNXl22/oRxmvH51mMeevCdpPa
         QtGIk5pN9JD8EA5JgWhXVT+SbZgN25QynNPouYLVJ5OD5/qMy4jnOMPgYu5o5WKiPhm1
         v26+l+ZKSb3ir+oDoK/odMT1JG8j+dceHuLkX+aI8BAqyoFIjin8rMh6XajwskJgeH8k
         k0gz76ADQ78TCDboyorcsPIR0N4TXyps2wPX3hHSqes1RbXIzFRLOMNGABmkrx2f6fcg
         oXfQrT5Vwy7THfqRZ8fNF5ypjRnMGzUhnTGbzAQZFSnrcTlOEAVsSELVKN9DRDAaZ91K
         /pFA==
X-Forwarded-Encrypted: i=1; AJvYcCX9zDnm3m984Kq08dAMCKF6LPBScR4wH6uazmSRA5LZlRDxWa8mxJzG34cuLsQQttJZ9Fajd67sGwfSEizYeYAS@lists.infradead.org
X-Gm-Message-State: AOJu0YxmzTNJ4RiLn/G1EGfGzyBFs3d0lNDdZ4srD6GBfGDu/+CEV8Iu
	7guuF+j6BBxqQ0bZ5auidaEekkTzgZWUOWKplwvQWf2Wzs5b5sihQynG9hzSj01KuE59hW8EMzq
	nYa92sjtyDnF0U5dCtYYuIuLOO86lKeA=
X-Gm-Gg: ASbGncvrJ3V+KbQ/pbyb2ijnWg3QMxBz2VudJg0z57QDFo6koD3KooowtYoN2GI02ja
	UGJQrWDXLbEIRA8rgtRYcxD5D1fxG2vH1D6irWwFDz9iMDlk95EyXyiUhh7ZoSCXTEgp6Q+poNy
	v/tFm768Co8PNlT7wTSuoYN4b5YEpKOMw=
X-Google-Smtp-Source: AGHT+IG2h9FdAqyLAeDMlVgp77wyUY3I3sfyW0h4u8fCLKBnBw3n5d3cWdiSpQGUgrrGQ4d5vHrpjCNIEbTBvGh6C/I=
X-Received: by 2002:a17:907:74a:b0:ad2:43b6:dd6d with SMTP id
 a640c23a62f3a-ad52d45adddmr556931466b.12.1747510884424; Sat, 17 May 2025
 12:41:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250430123306.15072-1-linux.amoon@gmail.com> <aCR9RzGMWEuI0pxS@mai.linaro.org>
 <CANAwSgSA-JHMRD7-19wijOY=TSWD-sv6yyrT=mH+wkUJuvxFAw@mail.gmail.com>
 <92c2949e-2fc1-40e9-9dea-e3d9f7aa571d@linaro.org> <CANAwSgQryVLdRVd9KRBnaUcjtX8xR9w9BBTCvoqKH6funkj=2A@mail.gmail.com>
 <3c44154c-7261-4b03-bd12-bddf4d493e74@linaro.org>
In-Reply-To: <3c44154c-7261-4b03-bd12-bddf4d493e74@linaro.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sun, 18 May 2025 01:11:07 +0530
X-Gm-Features: AX0GCFskBeR8WK9jkalSvJrYI5c9Nua4Ww8iaYWYJnYOXYU21l3OTo_PXNe7k2c
Message-ID: <CANAwSgRnRPb9kPT1rxHFUEvyzoCLTrD5JZVtLHZ9A6gV00dOCw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250517_124126_950228_D1DA199F 
X-CRM114-Status: GOOD (  37.60  )
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

On Fri, 16 May 2025 at 20:15, Daniel Lezcano <daniel.lezcano@linaro.org> wr=
ote:
>
> On 5/15/25 20:01, Anand Moon wrote:
> > Hi Daniel,
> >
> > On Thu, 15 May 2025 at 18:59, Daniel Lezcano <daniel.lezcano@linaro.org=
> wrote:
> >>
> >> On 5/15/25 13:10, Anand Moon wrote:
> >>> Hi Daniel,
> >>>
> >>> On Wed, 14 May 2025 at 16:53, Daniel Lezcano <daniel.lezcano@linaro.o=
rg> wrote:
> >>>>
> >>>> On Wed, Apr 30, 2025 at 06:02:56PM +0530, Anand Moon wrote:
> >>>>> Hi All,
> >>>>
> >>>> Hi Anand,
> >>>>
> >>>> if the goal of the changes is to do cleanups, I recommend to rework
> >>>> how the code is organized. Instead of having the data->soc check all
> >>>> around the functions, write per platform functions and store them in
> >>>> struct of_device_id data field instead of the soc version.
> >>>>
> >>>> Basically get rid of exynos_map_dt_data by settings the different op=
s
> >>>> in a per platform structure.
> >>>>
> >>>> Then the initialization routine would be simpler to clean.
> >>>>
> >>>
> >>> Thanks, I had previously attempted this approach.
> >>> The goal is to split the exynos_tmu_data structure to accommodate
> >>> SoC-specific callbacks for initialization and configuration.
> >>>
> >>> In my earlier attempt, I tried to refactor the code to achieve this.
> >>> However, the main challenge I encountered was that the
> >>> exynos_sensor_ops weren=E2=80=99t being correctly mapped for each SoC=
.
> >>>
> >>> Some SoC have multiple sensor
> >>> exynos4x12
> >>>                       tmu: tmu@100c0000
> >>> exynos5420
> >>>                   tmu_cpu0: tmu@10060000
> >>>                   tmu_cpu1: tmu@10064000
> >>>                   tmu_cpu2: tmu@10068000
> >>>                   tmu_cpu3: tmu@1006c000
> >>>                   tmu_gpu: tmu@100a0000
> >>>    exynos5433
> >>>                   tmu_atlas0: tmu@10060000
> >>>                   tmu_atlas1: tmu@10068000
> >>>                   tmu_g3d: tmu@10070000
> >>> exynos7
> >>>                   tmu@10060000
> >>>
> >>> It could be a design issue of the structure.or some DTS issue.
> >>> So what I found in debugging it is not working correctly.
> >>>
> >>> static const struct thermal_zone_device_ops exynos_sensor_ops =3D {
> >>>           .get_temp =3D exynos_get_temp,
> >>>           .set_emul_temp =3D exynos_tmu_set_emulation,
> >>>           .set_trips =3D exynos_set_trips,
> >>> };
> >>>
> >>> The sensor callback will not return a valid pointer and soc id for th=
e get_temp.
> >>>
> >>> Here is my earlier version of local changes.
> >>> [1] https://pastebin.com/bbEP04Zh exynos_tmu.c
> >>> [2] https://pastebin.com/PzNz5yve Odroid U3 dmesg.log
> >>> [3] https://pastebin.com/4Yjt2d2u    Odroid Xu4 dmesg.log
> >>>
> >>> I want to re-model the structure to improve the code.
> >>> Once Its working condition I will send this for review.
> >>>
> >>> If you have some suggestions please let me know.
> >>
> >> I suggest to do the conversion step by step beginning by
> >> exynos4210_tmu_clear_irqs, then by exynos_map_dt_data as the first
> >> cleanup iteration
> >>
> > Ok you want IRQ handle per SoC call back functions?
> > so on all the changes depending on SoC id should be moved to
> > respective callback functions to reduce the code.
>
> I think you can keep the same irq handler function but move the
> tmu_intstat, tmu_intclear in the persoc structure and remove the
> exynos4210_tmu_clear_irqs function.
>
> You should end up with something like:
>
> static irqreturn_t exynos_tmu_threaded_irq(int irq, void *id)
> {
>         struct exynos_tmu_data *data =3D id;
>         unsigned int val_irq;
>
>         thermal_zone_device_update(data->tzd, THERMAL_EVENT_UNSPECIFIED);
>
>         mutex_lock(&data->lock);
>         clk_enable(data->clk);
>
>         val_irq =3D readl(data->base + data->tmu_intstat);
>          writel(val_irq, data->base + data->tmu_intclear);
>
>         clk_disable(data->clk);
>         mutex_unlock(&data->lock);
>
>         return IRQ_HANDLED;
> }

No this will not work,
>
> But if the irq handler has some soc specific code, then it should be a
> separate function
>

INTSTAT interrupt status register holds the pending status of
rising and falling edge of IRQ

#define INTSTAT_FALL2   BIT(24)
#define INTSTAT_FALL1   BIT(20)
#define INTSTAT_FALL0   BIT(16)
#define INTSTAT_RISE2   BIT(8)
#define INTSTAT_RISE1   BIT(4)
#define INTSTAT_RISE0   BIT(0)

#define INTCLEAR_FALL2  BIT(24)
#define INTCLEAR_FALL1  BIT(20)
#define INTCLEAR_FALL0  BIT(16)
#define INTCLEAR_RISE2  BIT(8)
#define INTCLEAR_RISE1  BIT(4)
#define INTCLEAR_RISE0  BIT(0)

static void exynos4210_tmu_clear_irqs(struct exynos_tmu_data *data)
{
        u32 tmu_intstat, tmu_intclear;
        u32 val_irq =3D 0, clear_mask =3D 0;

        if (data->soc =3D=3D SOC_ARCH_EXYNOS5260) {
                tmu_intstat =3D EXYNOS5260_TMU_REG_INTSTAT;
                tmu_intclear =3D EXYNOS5260_TMU_REG_INTCLEAR;
        } else if (data->soc =3D=3D SOC_ARCH_EXYNOS7) {
                tmu_intstat =3D EXYNOS7_TMU_REG_INTPEND;
                tmu_intclear =3D EXYNOS7_TMU_REG_INTPEND;
        } else if (data->soc =3D=3D SOC_ARCH_EXYNOS5433) {
                tmu_intstat =3D EXYNOS5433_TMU_REG_INTPEND;
                tmu_intclear =3D EXYNOS5433_TMU_REG_INTPEND;
        } else {
                tmu_intstat =3D EXYNOS_TMU_REG_INTSTAT;
                tmu_intclear =3D EXYNOS_TMU_REG_INTCLEAR;
        }

        val_irq =3D readl(data->base + tmu_intstat);
        /*
         * Clear the interrupts.  Please note that the documentation for
         * Exynos3250, Exynos4412, Exynos5250 and Exynos5260 incorrectly
         * states that INTCLEAR register has a different placing of bits
         * responsible for FALL IRQs than INTSTAT register.  Exynos5420
         * and Exynos5440 documentation is correct (Exynos4210 doesn't
         * support FALL IRQs at all).
         */

        /* Map INTSTAT bits to INTCLEAR bits */
        if (val_irq & BIT(24))
                clear_mask |=3D BIT(24);
        else if (val_irq & BIT(20))
                clear_mask |=3D BIT(20);
        else if (val_irq & BIT(16))
                clear_mask |=3D BIT(16);
        else if (val_irq & BIT(8))
                clear_mask |=3D BIT(8);
        else if (val_irq & BIT(4))
                clear_mask |=3D BIT(4);
        else if (val_irq & BIT(0))
                clear_mask |=3D BIT(0);

        /* Perform proper task for decrease temperature */
        if (clear_mask)
                writel(clear_mask, data->base + tmu_intclear);
}

TMU clears the rising and falling interrupt according to the user manual.

Thanks
-Anand
> --
> <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for AR=
M SoCs
>
> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
> <http://twitter.com/#!/linaroorg> Twitter |
> <http://www.linaro.org/linaro-blog/> Blog

