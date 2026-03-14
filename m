Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F19107BCF7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 05:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IM7Q6oOyb5nhIw60KEs5pEzxBNhlQ40PGDtJzVWEr0o=; b=AyMC8Urp/fZl1Qt9GeMurUFKTt
	bvV47uCZKaTWv3kDIQHFTamoq4mZoFyewdcezdpzlHEi9PKVnzfQ2feRv8ZU0ZW4g1nT3p7hlTtP3
	AlU9B2BE5npFcaMbqFpEWHnMPuOu3UOkt5y43FGXbflbYmerQ0phpZYETUpypzY2RvcXyq345VxW9
	XU3SXum81jbVkKzAJKCOUmLLFAqYBIxh8HgYkxlESmpvoyd1U6DVt29wiOQ1dnOz3WL+QwyEqROaF
	963e+XKaYho2rRLilKFxwzbCjeKhro6JcES6eJW88PXJVs1sULmMe4B0PLgvtpqxMxTNvSTCL5ku6
	wL0BT8rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1HJf-00000001Vjr-0VMx;
	Sat, 14 Mar 2026 05:13:35 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1HJN-00000001Vhd-2puC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 05:13:33 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b9793fa5371so15199066b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 22:13:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773465195; cv=none;
        d=google.com; s=arc-20240605;
        b=WZ58HMHXL3LClA4QVc/CqEElWhfeuMayxTx0d+a7Um9p3vBepGJUgX0ulMRGK9DUAF
         XuMvFA1gS9CVZx3C55nXA+zSmetlLBHwVXwq7HNcIGq57HGAeU0reFZdldDe6DncQhlE
         cxT7fU1ycYR6YW/HDfknPLrUwz8E21766/GHZybOcASr/d7ddniG8sELuRflIHdvhVFo
         WFT3B/n2jpOpPYJbHWv1S6Fa845BZ/QnYpguqZjik6rEjZMChoe+Q1CN803Nd61Vt1ut
         1a9IMRrkoCOkoGvwrIj9wiKwbeM3LPjhrmUfGObfk3k/nph650Bz/KKcJ9R+DGFd8DuJ
         PsKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IM7Q6oOyb5nhIw60KEs5pEzxBNhlQ40PGDtJzVWEr0o=;
        fh=dW89lz960vgoSP/ir6YY0laPuhIWHcp14uuSRTs2mWQ=;
        b=JHNDJuWIeiL/HnPshXK4kFe/+qrJYbvEEFKGNymR+PltY+wEfvja/qYa1rO88GPImK
         vnCAFkYq9MaeQfjRDNzv5Xu8uBKnptCwh+mxKMzmhey87Ub7DVwNea95KeMvgnnQ0YeT
         kDmuw6aADnO07IqwvC213eNbKZIShJwQnPpqjuSd5U1ArAY7KTsWznOE6lIrCbUVFATj
         J/d497La/7SiWU/jf1Rc161lAgrXwsHm6msgd893YrsSUYa2lSsQytDPrWQsC2LMIuXO
         8fmZj8Aqxr4r4LZeZiEwzU2vSS4bNV25k9ICa8Rz1IYfAvo1DcbjgLn/9BkfuCRHFnmu
         kOOw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773465195; x=1774069995; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IM7Q6oOyb5nhIw60KEs5pEzxBNhlQ40PGDtJzVWEr0o=;
        b=WF/5c5QZSRBwOzrZ0mkjgMKig3Y4k/2i+lGqVxJ/ghkW/FE+ItUOLMhBbQvoDto60W
         9KhariFMTsEjiQzlpgUkKo0RYyZH8nVilOTK0IzLbNu2EGjlqwcqbKlKqzfMyqx5V0qq
         PSPzQ5fGXAOINIBrwRUpd1hNAdyAV4x3q8298Dx74CSVl+EIWo5Rcw4Y+LUwYZRJZh3S
         6vjvVBBSOz5Q3FTVBSm0Mb++Wpu7khxhwNmsr4tVL41YAaXuLi7PspMfvZyhjmdY0JI/
         occiceEyO9U9qKjAbUsCcAz2/P0IvdTumXZdcZ8WvbwHyKQjJVpEL+RWpFU/ofROyeq+
         2MkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773465195; x=1774069995;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IM7Q6oOyb5nhIw60KEs5pEzxBNhlQ40PGDtJzVWEr0o=;
        b=NYoLXFJK+y1qyLxfYKQkDzlD/8Ljug+uemZuOzZBCZ8/OwNVf4nv3Q1lp7Gov8aHXR
         KckxDGFoxaqdWy/NmlfPyYte+upC4I1fuwWqre879+wyTFUTsjsWSXQMsHy2JoVSd1Wh
         7EPjsL5IaMIS07KzBQTKg+Cmwl85lNaCKQInZK+23g/4E7CHq9b84LAbCd1Gp4UT55r0
         zJxUntH5Ybm92ow3gl9N3Yxq/5725hns+JKeMgroaMKdSzC4u3D1CZ+vpm3D1wC45yxe
         OAUfkko4wGcugNX99zbJMwbRy7givvFsoNHcnan4rnvZZdbFbDPILoJ3fCH0ZNR+OVZz
         XQug==
X-Forwarded-Encrypted: i=1; AJvYcCUrU0RDSzcBRK5c2ssGh0CN82g0cF3DNcg71UwQV42SCF+PmbBgTOo2Fdew6Ke+4ML/Pxlq3NC6sT/0ewOh5On4@lists.infradead.org
X-Gm-Message-State: AOJu0YyhXdTXiRkTsTB2bNWX7amX8+4jnQn3QMaLzGYyNBT+IuLZLhE8
	lB6CuQxecCdS9WKfPssv1O35l+KpnR89hpZn+5b2tB8mvO2HFs8pqHtwA5hkj0sYCL39L9OnFsf
	7Q70rWS/DM2r95KoNCmHKISft6TqlsY4=
X-Gm-Gg: ATEYQzxeQtJkHBS6rVFbqoejMagHOQrQMgEeoAqMXpUPhCD41NFm2BiqeQpBiv8vZe9
	yTIl2de1SX8SLupOjNBBDQkNQFVHbjcRq6CxvZCm2IfYUbUbehybbZmXlP/eSLjzYyeCrJg7565
	9pKNwBq9HPIGstI+J+7MH7hxDbLAgtryl3tDRbmV7EF5NOt7Cp288qBvtWpBoO3XDFXfiiJaH9M
	uPUEerBj5v9FsAj2oSy0mMt8SAdtY2i5QVBDVGmpanybIlqQD/g52w3E+yLIjJkFE5PP58S8Vyv
	FkLchw==
X-Received: by 2002:a17:906:208f:b0:b8e:796a:fd5c with SMTP id
 a640c23a62f3a-b976506440amr202919666b.27.1773465195027; Fri, 13 Mar 2026
 22:13:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260226101032.1042-1-linux.amoon@gmail.com> <177260693908.10259.13055467642416391434.b4-ty@kernel.org>
 <87bc37ee-234c-4568-b72e-955c130a6838@arm.com> <f7tfshf7riljjibuqge4ubfjmludubpyh3ppdf6lasurzdzbtj@sw4xxagfhnn3>
 <5d88fb5b-e771-4ea6-8d2c-c5cfd21e5860@arm.com> <qwanhqrpztzkudik5fmberhabnzaly7v53677dohqzj5nq4wi2@6ndpiubyxcbi>
 <DGZXF3LPSRK6.2QYN63QTKUQAX@kernel.org> <cp5uktfqdf6zs53qsye57ior2ikmssgevxxdtevkzpisaif22h@7mrxspkuibow>
 <DH09EDBW3X6T.2996UB1CFCAW2@kernel.org> <55c28218-1638-4b90-a9cd-a177fb5abcb6@arm.com>
 <DH0TM60TVX5D.20W4O1X696ALA@kernel.org> <6cfe4bda-036f-4bb9-8a08-ed75f61cae24@arm.com>
 <DH1QCLS89ADR.3H0XABP0GEFQT@kernel.org> <4f9fdfc9-f2ad-49b1-a6b9-ae64aaa47cfd@arm.com>
In-Reply-To: <4f9fdfc9-f2ad-49b1-a6b9-ae64aaa47cfd@arm.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sat, 14 Mar 2026 10:42:58 +0530
X-Gm-Features: AaiRm52yI10E6vLq92rcORMoPK2tRdzWpVlxX3dbSjvIMnFFuSiMh3dLe0uhnRo
Message-ID: <CANAwSgQ6eaM=Z=MBmS0=HrLfBxOh+vqnRSkEge_q6y+oe7AU5w@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260313_221332_236084_93E49325 
X-CRM114-Status: GOOD (  53.65  )
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

On Fri, 13 Mar 2026 at 23:07, Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 2026-03-13 2:39 pm, Danilo Krummrich wrote:
> > On Fri Mar 13, 2026 at 2:15 PM CET, Robin Murphy wrote:
> >> On 2026-03-12 12:59 pm, Danilo Krummrich wrote:
> >>> On Thu Mar 12, 2026 at 1:48 PM CET, Robin Murphy wrote:
> >>>> On 2026-03-11 9:09 pm, Danilo Krummrich wrote:
> >>>>>    From a driver-core perspective I think we're rather limited on what we can do;
> >>>>> we are already in async context at this point and can't magically go back to
> >>>>> initcall context.
> >>>>>
> >>>>> So, the only thing I can think of is to kick off work on a workqueue, which in
> >>>>> the end would be the same as the deferred probe handling.
> >>>>
> >>>> Hmm, in fact, isn't the deferred probe mechanism itself actually quite
> >>>> appropriate?
> >>>
> >>> Yes, I've also mentioned this in [1], including the fact that it technically
> >>> even complies with the guarantees given by PROBE_FORCE_SYNCHRONOUS. I.e. the
> >>> documentation says:
> >>>
> >>>     Use this to annotate drivers that need their probe routines to run
> >>>     synchronously with driver and device registration (with the exception of
> >>>     -EPROBE_DEFER handling - re-probing always ends up being done
> >>>     asynchronously).
> >>>
> >>> However, I'm still not sure how I feel about this, since I consider this to be
> >>> more like a workaround that just moves things to a "more approprite" async
> >>> context.
> >>
> >> I guess the underlying problem there is that there are at least 3
> >> different significant aspects to what "synchronous" can mean:
> >>
> >> - literally in the context or device/driver registration as documented.
> >> Off-hand I'm not really sure what useful property may be *specific* to
> >> those conditions that a driver might rely on, other than for
> >> super-special cases like platform_driver_probe().
> >
> > I'm not worried about this one, as it is already special by not being compatible
> > with deferred probe. I.e. the caller already has to promise that the
> > corresponding probe() call will never return -EPROBE_DEFER.
> >
> > This is a much more error prone requirement than just "don't call this from
> > async" already.
> >
> >> - serialised, i.e. probes of multiple devices won't happen concurrently
> >> on multiple threads. This is probably the one hiding the most driver
> >> bugs, e.g. internal shared/global state without sufficient
> >> synchronisation. I guess this falls out as a side-effect of the first
> >> condition, but AFAICS it *can* also still provided by deferred probe
> >> (given that it's a single work item iterating a list one-by-one)
> >>
> >> - in some regular thread context that isn't liable to have issues
> >> synchronising against other async_func workers (i.e. the request_module
> >> case). Again, deferred can't have a problem here, or it wouldn't have
> >> worked properly in general for the last decade.
> >>
> >> So it's not that we'd be relying on some dubious "deferred is always
> >> synchronous" assumption - AFAICS deferred *can* launch async if the
> >> driver permits it - more just ratifying that deferred is still able to
> >> effectively honour all the useful properties of PROBE_FORCE_SYNCHRONOUS
> >> other than "during registration of the thing".
> >
> > Yes, and as mentioned above, EPROBE_DEFER has always been a valid path for
> > PROBE_FORCE_SYNCHRONOUS, which is why I brought it up as a a workaround in the
> > first place.
> >
> > (The reason why I still say "workaround" is because nothing actually needs to be
> > deferred.)
> >
> > Anyways, as I mentioned...
> >
> >>> On the other hand, eventually we want everything to work with
> >>> PROBE_PREFER_ASYNCHRONOUS, so maybe it's also good enough for the time being.
> >
> > ...plus there are not a lot of PROBE_FORCE_SYNCHRONOUS left anyways.
> >
> > Do you want to send a patch?
>
> Sure, I just wanted to check that you didn't see anything obviously
> wrong with my reasoning-by-inspection - if you're sufficiently happy
> then I'll write this up as a proper commit message and post the patch
> (likely on Monday now) so we can all nit-pick the details :)
>
I believe the issue lies in the r8169 module, which currently has the
PHY address hardcoded to zero in mdiobus_get_phy. I have modified the
implementation to scan the MDIO bus for all possible addresses to improve
hardware compatibility.

Can you check this at your end.

----->8-----
$ git diff drivers/net/ethernet/realtek/r8169_main.c
diff --git a/drivers/net/ethernet/realtek/r8169_main.c
b/drivers/net/ethernet/realtek/r8169_main.c
index 58788d196c57..fa99e33eccfe 100644
--- a/drivers/net/ethernet/realtek/r8169_main.c
+++ b/drivers/net/ethernet/realtek/r8169_main.c
@@ -5420,7 +5420,8 @@ static int r8169_mdio_register(struct rtl8169_private *tp)
 {
        struct pci_dev *pdev = tp->pci_dev;
        struct mii_bus *new_bus;
-       int ret;
+       struct phy_device *phydev;
+       int ret, addr;

        /* On some boards with this chip version the BIOS is buggy and misses
         * to reset the PHY page selector. This results in the PHY ID read
@@ -5455,18 +5456,30 @@ static int r8169_mdio_register(struct
rtl8169_private *tp)
        if (ret)
                return ret;

-       tp->phydev = mdiobus_get_phy(new_bus, 0);
-       if (!tp->phydev) {
+       /* find the first (lowest address) PHY on the current MAC's MII bus */
+       for (addr = 0; addr < PHY_MAX_ADDR; addr++) {
+               struct phy_device *tmp = mdiobus_get_phy(new_bus, addr);
+               if (tmp) {
+                       phydev = tmp;
+                       break;
+               }
+       }
+
+       if (!phydev) {
+               dev_err(&pdev->dev, "no PHY found on bus\n");
                return -ENODEV;
-       } else if (!tp->phydev->drv) {
-               /* Most chip versions fail with the genphy driver.
-                * Therefore ensure that the dedicated PHY driver is loaded.
-                */
+       }
+
+       /* Most chip versions fail with the genphy driver.
+        * Therefore ensure that the dedicated PHY driver is loaded.
+        */
+       if (!phydev->drv || phy_driver_is_genphy(phydev)) {
                dev_err(&pdev->dev, "no dedicated PHY driver found for
PHY ID 0x%08x, maybe realtek.ko needs to be added to initramfs?\n",
                        tp->phydev->phy_id);
                return -EUNATCH;
        }

+       tp->phydev = phydev;
        tp->phydev->mac_managed_pm = true;
        if (rtl_supports_eee(tp))
                phy_support_eee(tp->phydev);

> Cheers,
> Robin.

Thanks
-Anand

