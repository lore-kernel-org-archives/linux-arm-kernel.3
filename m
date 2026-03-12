Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9E80105A58D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 11:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k9kla8PpBQz/94UsEvpzoG2D163jkyCAkG5Jr+I8Q48=; b=34RLzzusQqFytdMX1k6uq5zMkj
	SZ8kWyxpndND/5iP44g58sylmIFgPTdl9Kt3Ssm8F/ZzmYDBxmRNjpuVgq/B2U72joojxTMFPOqpi
	mqt0JAXN7oATmEPUcm25+OSmS1LEUSgJ8UCQVQzhUNEEo4JU9CH60V/AoRTnUOXqC6vXILNb2ySDe
	UdUySLdautQh+zaQdn5H3HJ7+H9cVKufF0ggLtoXM7OzGGcNcdok2sWudL1Ti3kExTgY1d/TK7JZ9
	yyVUtAM+jOp7LCkoupDBv8v8Zq5QcqQzDVcVvOXUobEN4AImL51xvsVgn+X2jFHsbtGI106NQtiRF
	WZRETecg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0eOy-0000000DyTn-3Dqb;
	Thu, 12 Mar 2026 11:40:28 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0eOw-0000000DySz-09TZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 11:40:27 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-b941bb3e23cso149384066b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 04:40:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773315623; cv=none;
        d=google.com; s=arc-20240605;
        b=EBaIeSGMlcYbQtsDpsTBaxprfwAj45Wpy9P/JkJr3Cm1PArtKOkhv20aADPfdOdkoS
         0Q5vv9sD1pDXFMT+ZpQrY2QsDQh42OlhLngzAlV8fLIAwwfAtiHBWLk+7iD6UxLJyFyW
         l0iHN3KFDDB9+0etMAUDui5BA6XtInUZspCnta68vEoj0IkYpVDRRmGJZAsqdjF2MB8y
         avh+Lkb4gaRdktrUursAEz5juPlCie0bRirJ0sKUXpK1LHeiIzSW7UZpid3JjWOE3RrP
         WWniWhUKZthBoIVEwdTHOrcD7NcjBkAGGbmc6AVD8rZTojH9rBFsqh+XyM1qLErqdcrQ
         SMsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k9kla8PpBQz/94UsEvpzoG2D163jkyCAkG5Jr+I8Q48=;
        fh=Fw+NQgKG3o8LoPANKgeabD1UoJslVt/bShCplda2oC8=;
        b=io81UNLLSjiUfSGf7ZvEYqelPTPuhBc/4sbK/jjTylpEPxkB3kyL+EKXprTjoYO+LW
         7RxNBHL1963ejKmEFof4oSwUmv72vo+jOyfhWDT3QBCz+tszSAyTgh1bPvFsI6Tfoazp
         nvlhs3qPjzB66nvx0KxZ/brIXvEiY3mGdIsmvhzDquZhlYWb805amrmyLNL+5KNwzGqq
         7YVKkpeozrmFUy5DEEXzbkdQWcrGAOMOy36zhy9knI9rJQGYGFnIXuy9fQs773wyXtSH
         sW6e84Fi3ZI2ZpL6T/odp9ho8vFNzVDUcxrOVOwzQfdyQusWydXXRvBkItGtQsecz+Up
         xW+Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773315623; x=1773920423; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k9kla8PpBQz/94UsEvpzoG2D163jkyCAkG5Jr+I8Q48=;
        b=al/MiSsEc+GF9xnfh0bRst9Qka23liZ/G//RFWRgODplJQgenSJSRwWdxpWd5lNlcY
         z/+EHBC3Se4nwzNew7ZLhT10fAYDz/GtR6D6pGOTNp58qvUt0PlnxDJlEX/cZlBMnqdX
         YEzQLAcHfdSWR7avrH2jh/qPOBkGehA/Gt1vVmRQulZYUZam/G/0PN1On/JFg0tWQvwr
         jxnRTlh4mvYALlS2vqi9taxnrDS3COewXDhFvXwLNjwDCiA6BnFT/00JCtSBnNxyqL6F
         sYGEH4NLfnIFESQN8SD1G6rO0NWf2bdb/i/FSjRwCjHJO6uB30X/ckWrTX8bs2JDEP/4
         Xyrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773315623; x=1773920423;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k9kla8PpBQz/94UsEvpzoG2D163jkyCAkG5Jr+I8Q48=;
        b=nHutWpkmv/XO3pX/7ZvjHA8v8ox6ij/5r/0qd96xLLOXrJTeusjmuFqRLNNkgOI943
         +wJOKUpgSFsF32e4ExAA42z+0Ef5NvbAwXZZo/fgWXVJhpxz6/MzQItGNe4azTl7882+
         JR341Pl/x8WLA+zTtCrnl6RXvsWBszw9Er9XBJbht2G0JJmUejinDIK1tZXTu0R6kW8D
         JzTORV9i4y2hD4hp4uY+nXgmV178aWSQy10ZflIJzgPsvALNjgAc9oAsLWOyLeBqiee7
         Ky9xXYK4hWesukIIdCNIcyUIax8WD4Ma/WPJbOchHnDEOUSsDJ2pbq15Yg1r+LdYJ9GO
         2UGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGc8i29wvjS7KSm63c1NvGs5NjaHcHBMVZsRpIsqPqjHWz8YPdkKC8uhGuw8WtOEWgqZiNiXK40WlKVD9z45Oj@lists.infradead.org
X-Gm-Message-State: AOJu0YzBN2YyYFx40O4LuP07qdjNjcLLszBKTDdVBc7YmHiktST6ZORQ
	5ZfFfv/UD0h6nOFtaF1I1P0saCXTH738udxu7ONzwV1CEwEi7d8HtlAdyVIReyz8w8u8A/3aIDi
	Xt050Lg4QRyxr1XbQLEmkwTI1LcY5LiM=
X-Gm-Gg: ATEYQzweytmVxnFAN0QIZk78vb5cxlqvzPbnbu/CuXBBP9FJipNEMMqFydKgWyq1oeD
	fbwvCTjyOQYdy2w1k08BEm/yRapG/Sv3hfmVFWbJE5e876qC4GF1wJV3aBMSpK/co3ODb0/yeM5
	m0/w94RWE6dpm1fxcuptIgGPiY9h23tHVFfEgm0h1NWJkETRtELD4jbMo+vZW3+ffi7kN1WnS67
	6wfr0B9zlCcB6LdGaGUYBbH2V7cQO0SUkFv4dyIeyI9hqzvg2CNKHhGfGqGdwWpZW2poZCzgIDN
	BF/ugg==
X-Received: by 2002:a17:906:f58d:b0:b8f:f070:8c30 with SMTP id
 a640c23a62f3a-b972e52a19dmr383837666b.49.1773315622489; Thu, 12 Mar 2026
 04:40:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260226101032.1042-1-linux.amoon@gmail.com> <177260693908.10259.13055467642416391434.b4-ty@kernel.org>
 <87bc37ee-234c-4568-b72e-955c130a6838@arm.com> <f7tfshf7riljjibuqge4ubfjmludubpyh3ppdf6lasurzdzbtj@sw4xxagfhnn3>
 <5d88fb5b-e771-4ea6-8d2c-c5cfd21e5860@arm.com> <qwanhqrpztzkudik5fmberhabnzaly7v53677dohqzj5nq4wi2@6ndpiubyxcbi>
 <DGZXF3LPSRK6.2QYN63QTKUQAX@kernel.org> <cp5uktfqdf6zs53qsye57ior2ikmssgevxxdtevkzpisaif22h@7mrxspkuibow>
 <DH09EDBW3X6T.2996UB1CFCAW2@kernel.org> <7b5592e7-8a9d-2cf0-bb3e-e306a6337165@rock-chips.com>
In-Reply-To: <7b5592e7-8a9d-2cf0-bb3e-e306a6337165@rock-chips.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 12 Mar 2026 17:10:06 +0530
X-Gm-Features: AaiRm52HfWRYYsTJWgJqZ1mPKHzxh5bRhcDvLmP4oDUAAo6L9RCY3sGu0RZ9H3g
Message-ID: <CANAwSgTaZqsHYXD_ACkJGGLgk4knc7N72f4qrJaaenE-cXM8BA@mail.gmail.com>
Subject: Re: [PATCH v3] PCI: dw-rockchip: Enable async probe by default
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
	Niklas Cassel <cassel@kernel.org>, Hans Zhang <18255117159@163.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	Wilfred Mallawa <wilfred.mallawa@wdc.com>, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Grimmauld <grimmauld@grimmauld.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	driver-core@lists.linux.dev, Lukas Wunner <lukas@wunner.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_044026_123979_360D3820 
X-CRM114-Status: GOOD (  47.04  )
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

Hi Shawn, Mani, Niklas, Robin,,

On Thu, 12 Mar 2026 at 07:03, Shawn Lin <shawn.lin@rock-chips.com> wrote:
>
> Hi Mani and Danilo,
>
> =E5=9C=A8 2026/03/12 =E6=98=9F=E6=9C=9F=E5=9B=9B 5:09, Danilo Krummrich =
=E5=86=99=E9=81=93:
> > On Wed Mar 11, 2026 at 1:28 PM CET, Manivannan Sadhasivam wrote:
> >> On Wed, Mar 11, 2026 at 12:46:03PM +0100, Danilo Krummrich wrote:
> >>> On Wed Mar 11, 2026 at 6:24 AM CET, Manivannan Sadhasivam wrote:
> >>>> I have a contrary view here. If just a single driver or lib doesn't =
handle async
> >>>> probe, it cannot just force other drivers to not take the advantage =
of async
> >>>> probe. As I said above, enabling async probe easily saves a few hund=
erd ms or
> >>>> even more if there are more than one Root Port or Root Complex in an=
 SoC.
> >>>
> >>> Then the driver or lib has to be fixed / improved first or the driver=
 core has
> >>> to be enabled to deal with a case where PROBE_FORCE_SYNCHRONOUS is re=
quested
> >>> from an async path, etc.
> >>>
> >>> In any case, applying the patch and breaking things (knowingly?) does=
n't seem
> >>> like the correct approach.
> >>>
> >>>> I strongly agree with you here that the underlying issue should be f=
ixed. But
> >>>> the real impact to end users is not this splat, but not having the b=
oot time
> >>>> optimization that this patch brings in. As an end user, one would wa=
nt their
> >>>> systems to boot quickly and they wouldn't bother much about a harmle=
ss warning
> >>>> splat appearing in the dmesg log.
> >>>
> >>> You mean quickly booting into a "harmless" potential deadlock conditi=
on the
> >>> warning splat tries to make people aware of? :)
> >>>
> >>
> >> Hmm, I overlooked the built-as-module part where the deadlock could be=
 possible
> >> as indicated by the comment about the WARN_ON_ONCE().
> >>
> >> But what is the path forward here? Do you want the phylib to fix the
> >> request_module() call or fix the driver core instead?
> >
> > Here are a few thoughts.
> >
> > In general, I think the best would be to get rid of the (affected)
> > PROBE_FORCE_SYNCHRONOUS cases.
> >
> > Now, I guess this can be pretty hard for a PCI controller driver, as yo=
u can't
> > really predict what ends up being probed from you async context, i.e. i=
t could
> > even be some other bus controller and things could even propagate furth=
er.
> >
> > Not sure how big of a deal it is in practice though, there are not a lo=
t of
> > PROBE_FORCE_SYNCHRONOUS drivers (left), but note that specifying neithe=
r
> > PROBE_FORCE_SYNCHRONOUS nor PROBE_PREFER_ASYNCHRONOUS currently results=
 in
> > synchronous by default.
> >
> > (Also, quite some other PCI controller drivers do set PROBE_PREFER_ASYN=
CHRONOUS
> > and apparently got lucky with it.)
> >
> >>From a driver-core perspective I think we're rather limited on what we =
can do;
> > we are already in async context at this point and can't magically go ba=
ck to
> > initcall context.
> >
> > So, the only thing I can think of is to kick off work on a workqueue, w=
hich in
> > the end would be the same as the deferred probe handling.
> >
> > Another alternative would be to let the subsystem handle such cases, wh=
ich in
> > this case would probably mean to handle the current_is_async() case in
> > pci_host_probe() or pci_bus_add_devices().
> >
> > On the other hand, this would probably end up to be a subsystem specifi=
c
> > implementation of "kick of work on a workqueue".
>
> Actually, this is exactly what we've been doing in our downstream
> code[1] for quite a long time. We've even pushed this optimization down
> to the individual driver level.
>
> To be honest, I'm not particularly fond of this approach either.
> However, on our platform, we have more than 5 Root Port instances that
> need to be initialized during boot. When all of them probe
> synchronously, it significantly delays the execution of many other
> critical drivers. Our customers have been complaining about the boot
> time, and our downstream team had no real choice but to kick off a
> kthread similar to your suggestion.
>
> The code is very ugly and expose a lot of corner cases problem which
> wasted quite lot of time to fix. That's why I was hesitant to bring
> up the this approach upstream initially. But since you mentioned it, I
> think it's worth evaluating whether we can implement this at the
> subsystem level instead of forcing each driver to handle it
> individually. This way, the complexity would be centralized, and drivers
> that benefit from async probe (like multi-Root-Port SoCs) could opt-in
> without worrying about the request_module() deadlock scenario.
>
> What do you think?
>
>
> [1]
> https://github.com/rockchip-linux/kernel/blob/develop-6.6/drivers/pci/con=
troller/dwc/pcie-dw-rockchip.c#L1764
>
> >
> >> I can drop this patch in the meantime. But holding this prolong wouldn=
't help.
> >
I've reproduced the issue on my end. Following Danilo's suggestion,
I used PROBE_FORCE_SYNCHRONOUS to resolve the warning.
If you agree this is the correct fix, I=E2=80=99ll resubmit the patch.

 git diff drivers/pci/controller/dwc/pcie-dw-rockchip.c
diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index 5b17da63151d..ecaf1b446008 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -746,6 +746,7 @@ static struct platform_driver rockchip_pcie_driver =3D =
{
                .name   =3D "rockchip-dw-pcie",
                .of_match_table =3D rockchip_pcie_of_match,
                .suppress_bind_attrs =3D true,
+               .probe_type =3D PROBE_FORCE_SYNCHRONOUS,
        },
        .probe =3D rockchip_pcie_probe,
 };

Thanks
-Anand

