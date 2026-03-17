Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 293D5F33801
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 06:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=grG6esplvyUewgvA3Y3jc/bN8nKq9yVtK9UsxaYqAWg=; b=SEIU/sL+io38IRTjm6vuAqku2y
	ZM6dQYLxm/iDtuFsBcASJZVm+00jZxcmPE0mYGVNlWvXiCuAzkJga49Jd7/3yk45+m2IaCXHHl4Kb
	IwtMttamjJmFltbbyp2eDyhKURiry411rXqHAj9b+zvCGAtwdKbKyYhQPBA9+W9KGBvq2BXmfvFfU
	Xux4oSCY7ALj6ORnUwQz9katNrE9qoC0qCyz30NeZyltJWa9vgJi5L067IxOombIEp+jJzzm1sJNc
	ZDnNxt8Ec319v2QHnNv/JT6VRuOHnLp41HKWX3DiqHeuE2zh2hEp47MGYni3tmHSXfHPXIUDhAGOm
	vtNX9P/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2NrZ-00000005Uqm-4607;
	Tue, 17 Mar 2026 06:25:10 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2NrX-00000005Uq3-0Dl9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 06:25:08 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-6611f41eebcso7160737a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 23:25:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773728705; cv=none;
        d=google.com; s=arc-20240605;
        b=lWvyW3IdzprGvph8PAopGvB6qx7/gehB1Rs59yZ0b3o0LqTOY3Zh+4+cqmkAULJe7P
         aV8bJSeze6e4vq4HxeamapsNm9PY0ufFpl1Wbsc9UHVPYZrHa90GoB+4wbGO/9FaesTb
         biiBlHodvx0CH+8cPd6faEPz5wcu12KNa+7adzSMWhXmH1GbJCCpzHaTgEZ1njao7unM
         oJQeVPka5S9P+ar04bMiTVCvkpD7+rLmDF5a0KbBErLi3P1tNoFJl2mf6gGqnJSJ/6If
         IhfjeUKGkVPvRnk/GtSCeEWyFTbZWeddRLkwkZPGtW8kB2eC1tL5NpcKsGU+FuvIndcI
         9h2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=grG6esplvyUewgvA3Y3jc/bN8nKq9yVtK9UsxaYqAWg=;
        fh=ioSMG7RVKI7wtoHR0B1mmSbpgP4WGirDfYibsGn7k3E=;
        b=OKGd8AyeBmrmKS829Jpkrinq1ZtuOu+uPIB+Xvl1tbeZsQO/kdZ7b8xmS/Wp6MjGef
         LnLGdbWWMaw1hE+rjymXltfPSIVYhAj1w4KfF2gX3oAARfqrmenHc52bj5kMX3Opztg1
         nwkswTiMdI0SL9RaALjRuc6aXgwOMBQwVTeEL+23JjMi1MK7oyvRRxttevylsWDYPcOX
         vQBY9+S0Wh+SgvSO4evpuWnS/NNZVgKN8UkraV3s50gXiMXowkYRE6I5BpwxWY4l5KTO
         fI2w6S75Kd/nzBqchUgvY3YqRzrLMz2fBUdQ/zjpNGL13fbiNha5c5oWnz+OVUP/bTga
         9wSQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773728705; x=1774333505; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=grG6esplvyUewgvA3Y3jc/bN8nKq9yVtK9UsxaYqAWg=;
        b=MxEJH+Z2oXov2MOa0qJeOIGXDkfN2Wd3y+libUGQksNLqW35IuJ6wKJU/208v6em9P
         ZnmxbgLjJjbEQEh7FjwOrELHkV73Iz9/JgLD594R4BVCSWz0eciDsQoQpsjdx+AZVkja
         FukjhSpEu8WCisGlH3vB/RCIAJN/pxrkhwg4+sXUGNPZV3ZUeblUA/75/fyTQYSMNfzZ
         p8wEXIkJe4HPWvrKZEuHZoZCHenGOWenKYjzqTZpTD2uiu+wX3kw5i/68cTadxzK7Tnl
         pUlAeyIbnAXw7kqAuv8AkkX5IOgmf9j1CteVM9jkgzOuU7qGu7cWUXLkFVg5DK1F0kNv
         1Onw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773728705; x=1774333505;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=grG6esplvyUewgvA3Y3jc/bN8nKq9yVtK9UsxaYqAWg=;
        b=HUyyV1LHtDi6rCu6sQY/LrcblX406JQUxOtToKEt+fIh+MXXMmy2d6e0A4XLLUsGOw
         LAHWWR0Y6ACGhqiaSv6ZRyMS4HdCHC4dxW9v1TzzIpnRGzhkywRYHA6ztghl/ZLvogch
         gjTfDmJmAb/EAfNCgApTIz3Lxk8PvfwdZoFJtMOEiN+9maoEGX4f2CaqT1IVLmMH9WXo
         4pq+pQmXfZ6sYAt9hO6L7190RjNco4VeocZrS9DD91c5jjEa+in4sYzWSvSDA6uRV+kF
         +gnsJ2UGVm/VTuv4jk5CSzS3AR12V0KBJpn66e1qobt/hJmfv5Da9Fnsmsz6qhPBbluV
         jlyQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5SYPHgbDRsfwOAl+HT3lNmbqHxgUodIs8/TjbqgKzLjoRYpEpq9pAujXVz6nQ7Mgo0nnLvwHlbDjetH10kN7T@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9JQzf4EEizj6+Qm9Sm01uLfpPt9ss6k02+55GEai+XlDEqWLP
	YbfZHNk871XPoQQsp6AZO0B35kLLtAxNnaxTtOfOrPYuzpvf9LeN88+0jR/77UMjvewawingVUk
	QnKy6kvuKKx0aP4NIXM02TZJFPl6vvj4=
X-Gm-Gg: ATEYQzzXayNqIcj9yzvjpIKvcn+ldq9UClvos/rrzaDLb8lQz0O32Q3iVMGhH5WfoQY
	t9/evH4Yszkw50leXOeLu6Xn6cEQ0aldMeTGOAZO0ZypbHLoUQaFkzi9cf7sj2qhGb1ygXsChN4
	1765HPjkjylBng5OZV74ZugPnKRmTMQtlRLxMbaM3ayiQWc+rZgzIJaZhWRZpLgJSXqhcqYsHMw
	3ZT7vKGhXLSadZowVqa7OIMGjP3IhiHATYVAjC4K2M0/yS3d2pvdlFJLON+yKjhOnY/lFBbtZaS
	Rc91YA==
X-Received: by 2002:a17:907:a42:b0:b97:17b7:d8eb with SMTP id
 a640c23a62f3a-b9765392026mr1010186466b.38.1773728704481; Mon, 16 Mar 2026
 23:25:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260226101032.1042-1-linux.amoon@gmail.com> <177260693908.10259.13055467642416391434.b4-ty@kernel.org>
 <87bc37ee-234c-4568-b72e-955c130a6838@arm.com> <f7tfshf7riljjibuqge4ubfjmludubpyh3ppdf6lasurzdzbtj@sw4xxagfhnn3>
 <5d88fb5b-e771-4ea6-8d2c-c5cfd21e5860@arm.com> <qwanhqrpztzkudik5fmberhabnzaly7v53677dohqzj5nq4wi2@6ndpiubyxcbi>
 <DGZXF3LPSRK6.2QYN63QTKUQAX@kernel.org> <cp5uktfqdf6zs53qsye57ior2ikmssgevxxdtevkzpisaif22h@7mrxspkuibow>
 <DH09EDBW3X6T.2996UB1CFCAW2@kernel.org> <55c28218-1638-4b90-a9cd-a177fb5abcb6@arm.com>
 <DH0TM60TVX5D.20W4O1X696ALA@kernel.org> <6cfe4bda-036f-4bb9-8a08-ed75f61cae24@arm.com>
 <DH1QCLS89ADR.3H0XABP0GEFQT@kernel.org> <4f9fdfc9-f2ad-49b1-a6b9-ae64aaa47cfd@arm.com>
 <CANAwSgQ6eaM=Z=MBmS0=HrLfBxOh+vqnRSkEge_q6y+oe7AU5w@mail.gmail.com>
In-Reply-To: <CANAwSgQ6eaM=Z=MBmS0=HrLfBxOh+vqnRSkEge_q6y+oe7AU5w@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 17 Mar 2026 11:54:47 +0530
X-Gm-Features: AaiRm52xTModvcS_wCghjufMEmds7Entym6jtUGNfqUcYmHWBvki21yZ4UCg2r0
Message-ID: <CANAwSgTVw7Tn7ZHFBqdHkZHbuTDSgbt5L_rhrVVtRwQu7ZS+tw@mail.gmail.com>
Subject: Re: [PATCH v3] PCI: dw-rockchip: Enable async probe by default
To: Robin Murphy <robin.murphy@arm.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
	Niklas Cassel <cassel@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>, 
	Hans Zhang <18255117159@163.com>, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	Wilfred Mallawa <wilfred.mallawa@wdc.com>, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Grimmauld <grimmauld@grimmauld.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	driver-core@lists.linux.dev, Lukas Wunner <lukas@wunner.de>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_232507_203612_2C0669E5 
X-CRM114-Status: GOOD (  62.31  )
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

Hi Robin,

On Sat, 14 Mar 2026 at 10:42, Anand Moon <linux.amoon@gmail.com> wrote:
>
> Hi Robin,
>
> On Fri, 13 Mar 2026 at 23:07, Robin Murphy <robin.murphy@arm.com> wrote:
> >
> > On 2026-03-13 2:39 pm, Danilo Krummrich wrote:
> > > On Fri Mar 13, 2026 at 2:15 PM CET, Robin Murphy wrote:
> > >> On 2026-03-12 12:59 pm, Danilo Krummrich wrote:
> > >>> On Thu Mar 12, 2026 at 1:48 PM CET, Robin Murphy wrote:
> > >>>> On 2026-03-11 9:09 pm, Danilo Krummrich wrote:
> > >>>>>    From a driver-core perspective I think we're rather limited on what we can do;
> > >>>>> we are already in async context at this point and can't magically go back to
> > >>>>> initcall context.
> > >>>>>
> > >>>>> So, the only thing I can think of is to kick off work on a workqueue, which in
> > >>>>> the end would be the same as the deferred probe handling.
> > >>>>
> > >>>> Hmm, in fact, isn't the deferred probe mechanism itself actually quite
> > >>>> appropriate?
> > >>>
> > >>> Yes, I've also mentioned this in [1], including the fact that it technically
> > >>> even complies with the guarantees given by PROBE_FORCE_SYNCHRONOUS. I.e. the
> > >>> documentation says:
> > >>>
> > >>>     Use this to annotate drivers that need their probe routines to run
> > >>>     synchronously with driver and device registration (with the exception of
> > >>>     -EPROBE_DEFER handling - re-probing always ends up being done
> > >>>     asynchronously).
> > >>>
> > >>> However, I'm still not sure how I feel about this, since I consider this to be
> > >>> more like a workaround that just moves things to a "more approprite" async
> > >>> context.
> > >>
> > >> I guess the underlying problem there is that there are at least 3
> > >> different significant aspects to what "synchronous" can mean:
> > >>
> > >> - literally in the context or device/driver registration as documented.
> > >> Off-hand I'm not really sure what useful property may be *specific* to
> > >> those conditions that a driver might rely on, other than for
> > >> super-special cases like platform_driver_probe().
> > >
> > > I'm not worried about this one, as it is already special by not being compatible
> > > with deferred probe. I.e. the caller already has to promise that the
> > > corresponding probe() call will never return -EPROBE_DEFER.
> > >
> > > This is a much more error prone requirement than just "don't call this from
> > > async" already.
> > >
> > >> - serialised, i.e. probes of multiple devices won't happen concurrently
> > >> on multiple threads. This is probably the one hiding the most driver
> > >> bugs, e.g. internal shared/global state without sufficient
> > >> synchronisation. I guess this falls out as a side-effect of the first
> > >> condition, but AFAICS it *can* also still provided by deferred probe
> > >> (given that it's a single work item iterating a list one-by-one)
> > >>
> > >> - in some regular thread context that isn't liable to have issues
> > >> synchronising against other async_func workers (i.e. the request_module
> > >> case). Again, deferred can't have a problem here, or it wouldn't have
> > >> worked properly in general for the last decade.
> > >>
> > >> So it's not that we'd be relying on some dubious "deferred is always
> > >> synchronous" assumption - AFAICS deferred *can* launch async if the
> > >> driver permits it - more just ratifying that deferred is still able to
> > >> effectively honour all the useful properties of PROBE_FORCE_SYNCHRONOUS
> > >> other than "during registration of the thing".
> > >
> > > Yes, and as mentioned above, EPROBE_DEFER has always been a valid path for
> > > PROBE_FORCE_SYNCHRONOUS, which is why I brought it up as a a workaround in the
> > > first place.
> > >
> > > (The reason why I still say "workaround" is because nothing actually needs to be
> > > deferred.)
> > >
> > > Anyways, as I mentioned...
> > >
> > >>> On the other hand, eventually we want everything to work with
> > >>> PROBE_PREFER_ASYNCHRONOUS, so maybe it's also good enough for the time being.
> > >
> > > ...plus there are not a lot of PROBE_FORCE_SYNCHRONOUS left anyways.
> > >
> > > Do you want to send a patch?
> >
> > Sure, I just wanted to check that you didn't see anything obviously
> > wrong with my reasoning-by-inspection - if you're sufficiently happy
> > then I'll write this up as a proper commit message and post the patch
> > (likely on Monday now) so we can all nit-pick the details :)
> >
> I believe the issue lies in the r8169 module, which currently has the
> PHY address hardcoded to zero in mdiobus_get_phy. I have modified the
> implementation to scan the MDIO bus for all possible addresses to improve
> hardware compatibility.
>
> Can you check this at your end.
>
> ----->8-----
> $ git diff drivers/net/ethernet/realtek/r8169_main.c
> diff --git a/drivers/net/ethernet/realtek/r8169_main.c
> b/drivers/net/ethernet/realtek/r8169_main.c
> index 58788d196c57..fa99e33eccfe 100644
> --- a/drivers/net/ethernet/realtek/r8169_main.c
> +++ b/drivers/net/ethernet/realtek/r8169_main.c
> @@ -5420,7 +5420,8 @@ static int r8169_mdio_register(struct rtl8169_private *tp)
>  {
>         struct pci_dev *pdev = tp->pci_dev;
>         struct mii_bus *new_bus;
> -       int ret;
> +       struct phy_device *phydev;
> +       int ret, addr;
>
>         /* On some boards with this chip version the BIOS is buggy and misses
>          * to reset the PHY page selector. This results in the PHY ID read
> @@ -5455,18 +5456,30 @@ static int r8169_mdio_register(struct
> rtl8169_private *tp)
>         if (ret)
>                 return ret;
>
> -       tp->phydev = mdiobus_get_phy(new_bus, 0);
> -       if (!tp->phydev) {
> +       /* find the first (lowest address) PHY on the current MAC's MII bus */
> +       for (addr = 0; addr < PHY_MAX_ADDR; addr++) {
> +               struct phy_device *tmp = mdiobus_get_phy(new_bus, addr);
> +               if (tmp) {
> +                       phydev = tmp;
> +                       break;
> +               }
> +       }
> +
> +       if (!phydev) {
> +               dev_err(&pdev->dev, "no PHY found on bus\n");
>                 return -ENODEV;
> -       } else if (!tp->phydev->drv) {
> -               /* Most chip versions fail with the genphy driver.
> -                * Therefore ensure that the dedicated PHY driver is loaded.
> -                */
> +       }
> +
> +       /* Most chip versions fail with the genphy driver.
> +        * Therefore ensure that the dedicated PHY driver is loaded.
> +        */
> +       if (!phydev->drv || phy_driver_is_genphy(phydev)) {
>                 dev_err(&pdev->dev, "no dedicated PHY driver found for
> PHY ID 0x%08x, maybe realtek.ko needs to be added to initramfs?\n",
>                         tp->phydev->phy_id);
>                 return -EUNATCH;
>         }
>
> +       tp->phydev = phydev;
>         tp->phydev->mac_managed_pm = true;
>         if (rtl_supports_eee(tp))
>                 phy_support_eee(tp->phydev);
>
> > Cheers,
> > Robin.
>
I've submitted a patch to address the issue you reported.
Could you please verify if this resolves it on your side?

[1] https://lore.kernel.org/all/20260317061700.7734-1-linux.amoon@gmail.com/

Thanks
-Anand

