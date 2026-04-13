Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C818F34C5E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 15:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vM9wZdZcyMlqdDFu3IlYmYUvddN4NzeV7CdThu4jwmo=; b=w6Iel6Y4hrVDzoMynijpqVJXWH
	eKyuQrm6vKoThP1adgCfGHQMXYMM9yq1SQaf75X3FUkRQ+5UtNrigTb/rDWXvcTrdbBBqzvv7wjXe
	+QuVw3CH/MFDwj7HV716vBqUIChablGf02X1BhZ9CCYsXC/hm9hdvxn2bQd7Mz6rpB2qLLjs2st3f
	uH7Wd7vmi+jGMtdZEsBYR3TySPfsq+HbSZbjnn8qM+uyFccA+Yx4xXkHfnFumHGtiARawwrYzj5Rj
	lpr2BR05tU96Uno5WBHca0cfKyRljhBDwGmvY2kDWnQWC9zeiT871nmT4PKOkMMitkviBVCFqUPhJ
	DjJNpL9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCIwJ-0000000FwFR-29I8;
	Mon, 13 Apr 2026 15:11:03 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCIwH-0000000FwEz-0kIo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 15:11:02 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-b9bfcbaa81eso694306466b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 08:11:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776093059; cv=none;
        d=google.com; s=arc-20240605;
        b=fCk8BBhybl8SnS/4F5YIPxDDQcqW8O7qOuptOJq9HJpfFUdni8ncTZDNQ9cVrOXkQ6
         jP8OoUSoAvFWBe6M/3X+AMd/OHdht+XIPZ9uLLCwwQqhjomjBudU2+rtd4gid7VoyVwx
         2pUzKssfPi5t8qYHt5Z9zW3D7Jw9xv9U78DxrLqu7EZW5YObpI0Kwbsq2zNgrA0kh5EF
         jC8kEMD5StuOc3USIvwDw0gIl9fsTDSw8RG8ucmzrhcVA6A13Z+eR3L9+V5FkwULkYWk
         wuhGeMjZYVuh1tc3qvHVwgLl7tTAUIchzC//UfNDS+AfxEsYUSybMZIiI1E+/f1VXbnd
         auzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vM9wZdZcyMlqdDFu3IlYmYUvddN4NzeV7CdThu4jwmo=;
        fh=XmQL0bHzLU0b+OanrstVum5RZYgcj+egss9Ktgryu/w=;
        b=iuG/dpRPPLFyD0O2W9hFMXKbBYDK+KYqUvlaNgLLh2Mq1KTSs8oNrv4BQkx/7ndGai
         IzAIUpkVpl1Iflps9Q1JIbNbBaeW53g3j2bsez7In+nZircz8/04fmyCEMnDZAOSVl4h
         epOutGD1qKBGFeNqjvZ4lRu2aKl8PKlnObkHwzf7BDvBPQjnlBFamu0rCQz/C33Am+1U
         eBRZ9tzLK58W/KJxdhOKVJcMLsz6qguu4Jrcn5Bc8JDgSqlRsFNOkbRfN5gBYgy6k93B
         6pETbSm3mUMU/cBRYrTfgqqzhBwW7TylenCQFmX/YqvYCATXauKAQQoDU1htKY7/XM8S
         jXBQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776093059; x=1776697859; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vM9wZdZcyMlqdDFu3IlYmYUvddN4NzeV7CdThu4jwmo=;
        b=tx/Md+XSDwNtjQlaiHAM7+Blrpq7UY0nr3U/x9KPNRuyPKZAhCbcDE4aP8C3yBRJVf
         wAadwu4E3/Wy8qXko655R9abjBC8hIwPU2eyihhh/PjRCklFA/bYBDf3GW9216NoYjab
         gjDgYqn/VVrBpN3BSa2W5BRyxvKvfr6PahAo9h5aGGnRvWUlE3iD1RZ9WzvqGOr+E6iC
         D3bK7GfKBj7IESA2DsgpxdLHktHOMrqh9hJjHen0LMT22lxUO677ewn3v2E0WJPLLGd2
         zUKDk8mfcHmKugjxOpjk3BjQnpOX1/IGAL6VPR9OfIPLfRf1Bzp2Dpuzmp3r+uHl4ADe
         Gq+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776093059; x=1776697859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vM9wZdZcyMlqdDFu3IlYmYUvddN4NzeV7CdThu4jwmo=;
        b=iz8zuDYL+zyjD7ZIn8ukneAOhhJXQD/m2z49vZyyl3xvi1l6FM/G7qiscJiI7D2hlS
         tJ1gEc5gzIyhE6+ZL/NxQtTa3JaNpl0u2pxIn96zKrrnzk23zhzf0CQK0Rz9rCrmZjJ5
         hLJgtRhdUKJ+128s/1+LQYDNP6wlxa6vdxBy0l2vjTQRUDLCeFqnKb5x07X+AmFU3rii
         91KQW+wKEMaMsW30WNsnqvrgWgW9O7/P8XIk8pD1DdUhP4PK1bUDpKB8VTHxvh23n7Hs
         czRb/Ohi0Q5CYqgW8PqhuOCz423unQvUxm3s4COvnYAjqSfKkPgb1GlyzDuv2LPHTUPC
         FDUQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Ts9Icr1wZzA0EXbOt9Vok//DkuOLhmOZ3TYc9pbU2ftqzo29rkigAPJMfqBqVqF4PHEsFQFw/FD9n+Nr5ThMV@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9b/KZ/xgdrugbDM2s91scuEeceIfXbBMTy6qIbpg0KnqZub/f
	wmx0XbmD6c7JM1RnR7wzfYRW2nggS45scRanfGSmQ32gafVBeYzTRzyoB4Jgh+/RSrSf7j5cUPu
	Mw2oE5B4Q+4iPWb59qGq1gUwaF3ftNZUVdObG8q+haA==
X-Gm-Gg: AeBDietxpGU3MI06iqE702/DiZG62Fo25LAmKrPvkm6aKtYjt8mDqDsD4UjezCUjcYY
	kefygeiCyjkk6eGAhTKG0JH7L/AMDW5XjE8Q7HmC1EiBUH1gkrO2ExXYQrfc1Rb3CZzDhNjFbUF
	lQYPDOLx06lOQA2JFRRU/J12GTfsqz4DzJn3+Rntq/WvCtSgdUeDFAyEcz/RHO3TTGkHMJVWDmc
	+iT8q45uvgM9fV6I0Tjpv8w7f+vOuSY9iy/zykcXQXHko+BAp50pxWWT/U+BwBG5KHeOuCdF2V9
	yDWiTCkf4lzZfZxIcO0yUiMmdn/peXSz8UZSFuux
X-Received: by 2002:a17:907:a806:b0:b9c:3ba2:2da8 with SMTP id
 a640c23a62f3a-b9d72aeb9b9mr837246866b.52.1776093058550; Mon, 13 Apr 2026
 08:10:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260327-imx943-rproc-v2-0-a547a3588730@nxp.com>
 <20260327-imx943-rproc-v2-2-a547a3588730@nxp.com> <acqjS440STRl2sK2@p14s>
 <acs2PAZq2k3zjmDW@shlinux89> <adUghiyZbe3fmcNX@p14s> <PAXPR04MB8459AA009C932EB9D6139A11885BA@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <adZ4WIaC6WN97JhR@p14s> <adbzPl7ydUvb+MIS@shlinux89> <adkcugNgyrkHtUML@p14s> <PAXPR04MB84591BCD80728EE880CA2AD888262@PAXPR04MB8459.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB84591BCD80728EE880CA2AD888262@PAXPR04MB8459.eurprd04.prod.outlook.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 13 Apr 2026 09:10:45 -0600
X-Gm-Features: AQROBzCaZSu11OL-gVz7edUov2FxFa3cn6A3jeYa2s3YGR-BUVKoLOxzFnKS1Lg
Message-ID: <CANLsYkyn9aPg6Z9CTOXzmjKobRKiBo0_d=uhtxgUcszeW4-VGQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] remoteproc: imx_rproc: Pass bootaddr to SM CPU/LMM
 reset vector
To: Peng Fan <peng.fan@nxp.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Bjorn Andersson <andersson@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Frank Li <frank.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, 
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_081101_298767_118AAE93 
X-CRM114-Status: GOOD (  51.31  )
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

On Fri, 10 Apr 2026 at 21:01, Peng Fan <peng.fan@nxp.com> wrote:
>
> > Subject: Re: [PATCH v2 2/3] remoteproc: imx_rproc: Pass bootaddr to
> > SM CPU/LMM reset vector
> >
> > On Thu, Apr 09, 2026 at 08:30:54AM +0800, Peng Fan wrote:
> > > On Wed, Apr 08, 2026 at 09:46:32AM -0600, Mathieu Poirier wrote:
> > > >On Wed, Apr 08, 2026 at 01:30:16AM +0000, Peng Fan wrote:
> > > >> > Subject: Re: [PATCH v2 2/3] remoteproc: imx_rproc: Pass
> > bootaddr
> > > >> > to SM CPU/LMM reset vector
> > > >> >
> > > >> [...]
> > > >> >
> > > >> > >
> > > >> > > Aligning the ELF entry point with the hardware reset base on
> > > >> > Cortex=E2=80=91M
> > > >> > > systems is possible, but it comes with several risks.
> > > >> >
> > > >> > I'm not asking to align the ELF entry point with the hardware
> > reset base.
> > > >> > All I want is to have the correct start address embedded in the
> > > >> > ELF file to avoid having to use a mask.
> > > >>
> > > >> I see, per my understanding:
> > > >> FreeRTOS typically exposes __isr_vector, which corresponds to the
> > > >> hardware reset / vector table base.
> > > >> Zephyr (Cortex=E2=80=91M) exposes _vector_table, which serves the =
same
> > purpose.
> > > >> I am not certain about other RTOSes, but the pattern seems
> > consistent:
> > > >> the vector table base is already available as a named ELF symbol.
> > > >>
> > > >> Given that, if the preferred approach is to parse the ELF and
> > > >> explicitly retrieve the hardware reset base, I can update the
> > implementation accordingly.
> > > >> If you prefer to parse the elf file to get the hardware reset base=
,
> > > >> I could update to use them.
> > > >>
> > > >> Options1: Something as below:
> > > >> 1. Include rproc_elf_find_symbol in remoteproc_elf_loader.c 2.
> > Use
> > > >> below in imx_rproc.c ret =3D rproc_elf_find_symbol(rproc, fw,
> > > >> "__isr_vector", &vector_base); if (ret)
> > > >>     ret =3D rproc_elf_find_symbol(rproc, fw, "__vector_table",
> > > >> &vector_base);
> > > >>
> > > >> if (!ret)
> > > >>     rproc->bootaddr =3D vector_base
> > > >> else
> > > >>    dev_info(dev, "no __isr_vector or __vector_table\n")
> > > >
> > > >No
> > >
> > > If your concern is about rproc->bootaddr, I could introduce
> > > imx_rproc->vector_base for i.MX.  Please help detail a bit.
> > >
> > > >
> > > >>
> > > >> This makes the hardware reset base explicit, avoids masking
> > e_entry.
> > > >>
> > > >> Option 2: User=E2=80=91provided reset symbol via sysfs As an alter=
native,
> > > >> we could expose a sysfs attribute, e.g. reset_symbol, allowing
> > > >> users to specify the symbol name to be used as the reset base:
> > > >>
> > > >> echo __isr_vector >
> > /sys/class/remoteproc/remoteprocX/reset_symbol
> > > >>
> > > >
> > > >Definitely not.
> > > >
> > > >The definition of e_entry in the specification is clear, i.e "the
> > > >address of the entry point from where the process starts executing".
> > > >If masking is required because the tool that puts the image together
> > > >gets the wrong address, then it should be fixed.
> > >
> > > The hardware reset base is the address from which the hardware
> > fetches
> > > the initial stack pointer and program counter values and loads them
> > > into the SP and PC registers.  In contrast, bootaddr (i.e. e_entry)
> > > represents the address at which the CPU starts executing code (the
> > PC
> > > value after reset). As you pointed out earlier, this distinction is c=
lear.
> > >
> > > In our case, we need to obtain the hardware reset base and pass that
> > > value to the system firmware. However, e_entry should not be set to
> > > the hardware reset base. Doing so would introduce the issues I
> > > described in [1]. This means we should not modify the Zephyr or
> > > FreeRTOS build outputs to make e_entry equal to the hardware reset
> > base.
> >
> >
> > As I said earlier, I am _not_ suggesting to make e_entry equal to the
> > hardware reset base.
>
> Let me try to restate my understanding more precisely and please
> correct me if I am still missing the point.
>
> From your comment:
> "
> If masking is required because the tool that puts the image together gets=
 the
> wrong address, then it should be fixed.
> "
>
> I understand this as saying that masking e_entry is not acceptable, becau=
se
> e_entry already has a clear and correct meaning: it is the execution entr=
y
> address, and the kernel should not reinterpret or =E2=80=9Cfix up=E2=80=
=9D that value.
> At the same time, we still need to provide the hardware reset vector base
> to the system firmware, and that value is distinct from e_entry.
>
> On i.MX94/5 platforms the reset base is software=E2=80=91programmable, bu=
t that
> information is not represented by e_entry, nor is there currently a
> separate place in the remoteproc framework to convey a reset=E2=80=91vect=
or
> base independent of the execution entry point.
>
> Given these constraints, I see limited options on the kernel side.
>
> One conservative approach would be to rely on a fixed, platform=E2=80=91d=
efined
> reset base for the affected SoCs. And update RTOS linking script to put
> the vector to the location of fixed hardware reset base.
>

The problem with the current patchset is the overloading of
rproc->bootaddr in function rproc_fw_boot() [1].  After that point
rproc->bootaddr holds the hardware reset address communicated to the
remote processor's firmware and not the beginning of execution as
intended by the definition of e_entry.  This is very confusing to
anyone reviewing the code without a clear understanding of the
context.

To fix this I suggest masking rproc->bootaddr in
imx_rproc_sm_cpu_start() and imx_rproc_sm_lmm_start() with a copious
amount of in-lined documentation.

[1]. https://elixir.bootlin.com/linux/v7.0-rc7/source/drivers/remoteproc/re=
moteproc_core.c#L1401

> Thanks,
> Peng
>
> >
> > We are going in circles here.
> >
> > >
> > > Given these constraints, the feasible solutions I can see are either:
> > > - option 1 (explicitly retrieving the hardware reset base), or
> > > - continuing to use masking.
> > >
> > > Please suggest.
> > >
> > > [1]
> > >
> > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F
> > lore
> > > .kernel.org%2Fall%2Facs2PAZq2k3zjmDW%40shlinux89%2F&data=3D0
> > 5%7C02%7Cpen
> > >
> > g.fan%40nxp.com%7C8a5ce35d492b4adb2d3b08de97192cbb%7C686
> > ea1d3bc2b4c6fa
> > >
> > 92cd99c5c301635%7C0%7C0%7C639114331565834960%7CUnknow
> > n%7CTWFpbGZsb3d8e
> > >
> > yJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsI
> > kFOIjoiTWF
> > >
> > pbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DPnkirz3BMEuLsJU9
> > MHQNon84HIyMX
> > > 08x1wCK04dS7VU%3D&reserved=3D0
> > >
> > > Thanks,
> > > Peng
> > >
> > > >
> > > >> The remoteproc core would then resolve that symbol from the ELF
> > and
> > > >> set rproc->bootaddr accordingly.
> > > >> This provides maximum flexibility but does introduce a new
> > > >> user=E2=80=91visible ABI, so I see it more as an opt=E2=80=91in or=
 fallback
> > mechanism.
> > > >>
> > > >> Please let me know which approach you prefer, and I will update
> > > >> this series accordingly in v3..
> > > >>
> > > >> Thanks,
> > > >> Peng.
> > > >>
> > > >>
> > > >> >
> > > >> > > 1, Semantic mismatch (ELF vs. hardware behavior) 2,
> > Debuggers
> > > >> > > may attempt to set breakpoints or start execution at the entry
> > > >> > > symbol
> > > >> > >

