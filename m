Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11133D79769
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 09:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CnkO+pyfjOjiofNSg49xQZUi6tf7VfPDjwPBlAQ3BQ8=; b=tToq9bFvR+rSdxfAtTdcOKmwJu
	5Vw3s1cXEvulAIF0pUNM8iBtsOtDaPW22IQ+MU8z4eNBxqnp5fUONlcQK5NOJK0FwTwE+kITWwEgn
	PgAssnWGxPJg7u3PKe7HKPASomQQmEHW5w1a4cbXXmMIDvb3IiT/JCHxGAmoFdBahcUA1p9YOZKNg
	a48rahg+t35y42QAO9K+c/vv5EqaL+HbV3UDjoQbINzniYYXZ9JstJeyIw3xUtvx639e9TOslIjQH
	uBs9wBeUH93tL9FyivECVPR5a9rLbRFJzxM+cW454kn3I5R0IPjNneermY/itLEyiTX+riLRC4Nkh
	+Al5+DDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm7RR-00000002Sek-0ODJ;
	Sat, 31 Jan 2026 09:38:57 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm7RK-00000002SdN-2F6X
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 09:38:55 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-658b6757f7fso5501956a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 01:38:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769852328; cv=none;
        d=google.com; s=arc-20240605;
        b=HDXDhLUuihFd/ju2ec+m9fsUoSLAIqAflQJj9xuIAGxav0NzbLIQgW2zDN9RDxIx2A
         YLuaT+bOdJgKTsxcQ0UsgeH/wKnM6U6M7LrpMx7sIFmHda+FkfClypxu5XPEoa/y2ZQE
         GZvR4n2sLmx6ctwUVQoB8tXtyg0SRZhUhayZosq0zBQe5EAXr8pADYSHPViuMo+PRn5U
         W3cEVSsrkRA8jEcgc3Wuq8NSm0JUKqXqHkXXpmHf7kUhPU7TuNe0vIa59bj54EEbnkfA
         YF7eGf2iZc++gHApHbmXtxoK/NiyHqvUt7vtuSS0ytkjh6PKr9tOhDpODGt9fZHKWEhP
         qowg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CnkO+pyfjOjiofNSg49xQZUi6tf7VfPDjwPBlAQ3BQ8=;
        fh=WxNgIT/KeVU8fm6pL7kyMBJ9kHXG/tl87qi1m2JQkd4=;
        b=Cgf5BfLHL96SyHuJQjl2Zwpz8bcEIwCu6Nc57rn3iV4ErnzgaRSJ0TPwEjyfEsV5Nz
         IeJZ8VPNTU/LzUkh+rXgvI4J5d1GCKpHtRUv0PWukQTJKk3B4Pv9wG90a+1l/Gu+S8Kx
         v7CTFHBRdUjqUQaVCkHoZld9VfR6C4JugOwcL1yYtQhXDqPT7w/Es2wHGwCrSo/+72YU
         hcrPDBe6IHogF1NHIsUEt0o0sT/2ohuMh5ETSX/uwtALfOx+D7+CS39CcLfn6uytJZfv
         dQ2J0ujNtsPOjokN7ryq1HPUuO/7f/dt+QfOMYf1+WTJN2tj8xvCRmW41RpJcvKOZbDb
         uytA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769852328; x=1770457128; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CnkO+pyfjOjiofNSg49xQZUi6tf7VfPDjwPBlAQ3BQ8=;
        b=kMDE663K4o+pjlnMHifR1wXF9QeoCH65tCpgmyVViT2Miz93n81PYKEBVH2n5GGe6j
         HDoagKSHt/yOzmVPox9brBCQX9pn2rDHT1gdDnXg/DFad2qMM3NrSg6/vOxj9vC4YxGQ
         tKuj9WJALLvQWmTPG7jWostB6RgTHFHRt2kix2v+UYEGqgh5CfNvAg4Akygo92TGiqev
         6RoqZHxk2qs95yhm4y47vb4NOP9bbiSsWEFZ1d2zT81QLLK2G21w0MIY9niqSpVMFpMY
         Sv8N3aZrqChshYDEfaLQvMrkrLB3HZpSvjrpJSV+AdSPf0OZ86jyIDUnGWNw6P7K6FV/
         t1bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769852328; x=1770457128;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CnkO+pyfjOjiofNSg49xQZUi6tf7VfPDjwPBlAQ3BQ8=;
        b=HEQv5zIj7ziWJ4tIoqry2/F11H+pYRwMTGyaX75eDbzXCDWEwBI1aznstYX3bBn8Lh
         rmAieULNYI0Fwth2alcS0r7JOPd93DaQu85uzJp/amL4oeF83Dtvg4yo2iTHWglkIzAI
         /jJtNhvTarSX9RMiR4Qio0OoQp2Cs7m+6+6Ep+TRSbtOtoAA5/WvUo8mbCE7R+epvaR9
         5ni9RSExqqsMiC0f6yYliy0yWEN//ZFcZswdoL77KJcTC/y+nMLK3I5Oej3dBgdMZKY4
         51Xh6+H8NSSCkjsM1PLtKbLWEelGjtkJTCPVdS9bPITLn7SVyEfwcqmZvBNxiX4ucoSX
         rySg==
X-Forwarded-Encrypted: i=1; AJvYcCU+dgOKS0cIWMeOy25KlRjT3pLnIXIXLQ4U5V3r+FtTIG/fMLLx+ROqu53UHcpDuHsD15Mt78YVjU5MGU6vM0Dv@lists.infradead.org
X-Gm-Message-State: AOJu0YyVv4QTdcYSXkflrcaLkkgZhERXJsE2wzXrnrFpjqec6IWC1eDS
	17FItWdiTjBiEpBv1Q1bnrQWNqgXRy/WXHZpCihuIKDxdSwTlVJjyZZbiE+IjB4BX/eFTCuBls5
	bYSLkNQZk3soQajJMP6/ktR8K5FUFHMA=
X-Gm-Gg: AZuq6aKNgxFXyjE8gUf2okZqCxLPdXSheLibczmWWSRmQoh2SsywIsNbkcQWgEkvnPw
	24k1/cFqw992at4d/gCTICkW/y2KRdZ3Mmtq18hZhgfVAUdoI90qaPAtPHRWuyq8RTH8881zVgw
	cG6LiHgpRvjDbPeM6O/cbm4XdYBrxHtGbvRDxmloqPTYaCIY2TU29J6pJ8xljgSTR2UY5F4zGhK
	C6j96WQQ08g/M/SC5FIYc6diVmBqRNgBwJp8ntIM1WLt4YfWMly8Sa2o1psNnZR8O6QqV3MWrLJ
	1w==
X-Received: by 2002:a05:6402:51d1:b0:658:ba49:96b8 with SMTP id
 4fb4d7f45d1cf-658e2e9f42cmr3349030a12.3.1769852327465; Sat, 31 Jan 2026
 01:38:47 -0800 (PST)
MIME-Version: 1.0
References: <20240809073610.2517-1-linux.amoon@gmail.com> <aXtpg0V_sifQEWHJ@grimm-nixos-ssd-2>
 <aXyHITrZ89Mmn8_J@ryzen>
In-Reply-To: <aXyHITrZ89Mmn8_J@ryzen>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sat, 31 Jan 2026 15:08:42 +0530
X-Gm-Features: AZwV_Qi4rUDA22e6_H2MBH2utJIBF_ID2Uvxh97zfsLPgTyq0rIRh2L52PovAls
Message-ID: <CANAwSgTQ-cdyzd2WjHMYCY33p7um3CpjMeTzRO7vcd0fTF6X9Q@mail.gmail.com>
Subject: Re: [PATCH v2] PCI: dw-rockchip: Enable async probe by default
To: Niklas Cassel <cassel@kernel.org>
Cc: Grimmauld <grimmauld@grimmauld.de>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_013852_979452_86936A0F 
X-CRM114-Status: GOOD (  48.45  )
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

Hi Niklas/ Grimmauld,

On Fri, 30 Jan 2026 at 15:55, Niklas Cassel <cassel@kernel.org> wrote:
>
> Hello Grimmauld,
>
> On Thu, Jan 29, 2026 at 03:06:59PM +0100, Grimmauld wrote:
> > Hello Anand,
> >
> > I have tested this patch.
> > Hardware/Kernel information:
> > - radxa rock 5c lite
> > - rk3588s CPU, arm64
> > - defconfig NixOS kernel
> > - picked onto 6.18.7
> > - DT: rockchip/rk3588s-rock-5c.dtb
> > - tested both uboot (mainline) and edk2 (vendor)
> >
> > On Fri, Aug 09, 2024 at 01:06:09PM +0530, Anand Moon wrote:
> > > Rockchip DWC PCIe driver currently waits for the combo PHY link
> > > (PCIe 3.0, PCIe 2.0, and SATA 3.0) to be established link training
> > > during boot, it also waits for the link to be up, which could consume
> > > several milliseconds during boot.
> >
> > I found that without this patch, USB 3 ports as well as the PCIe connec=
tor seemingly stay uninitialized during boot on my hardware.
> > This manifests in a bootable USB flash drive loading initrd from bootlo=
ader (both uboot and edk2) perfectly, but then fails to mount the rootfs fr=
om the drive.
> > In effect, boot is not just slower than it should be, it just does not =
boot all the way at all.
> > In that scenario, the devfs entries corresponding to the flash drive ar=
e simply missing, same for the sysfs where i would expect the USB device li=
sted.
> > Replugging the USB flash drive during initrd does seem to fix that, but=
 is tedious and not viable for a server.
> > Similarly, booting from m.2 SSD attached via PCIe fails the same way, w=
ith rootfs timing out despite the bootloader correctly reading initrd on th=
e same drive.
> > Fwiw, replugging the SSD does not work like it does for USB flash drive=
s, and is even worse of an idea.
> > USB 2 ports as well as SD card boots correctly, even without your patch=
.
> > Without your patch, i am seeing "deferred probe pending" in dmesg befor=
e boot gets stuck, which was the hint which made me find your patch.
> > I am not sure whether that is the actual cause or just a symptom for wh=
y drives are not recognized during boot, and am not quite sure how to debug=
 this further.
> >
> > > To optimize boot time, this commit allows asynchronous probing.
> > > This change enables the PCIe link establishment to occur in the
> > > background while other devices are being probed.
> >
> > With this patch, booting from SSD or USB 3 port works flawlessly, and i=
 have not seen any regressions with SD card or USB 2 boot, nor any other ha=
rdware component.
> > This setup has worked for multiple boots without fail, both with tradit=
ional ext4 and zfs rootfs being loaded from USB 3 and PCIe.
> > Because i require this patch to run my rock 5c from SSD, i am currently=
 running a custom patched kernel, but would highly appreciate this patch ma=
king its way to mainline eventually.
> > There might well be something else going on here. The proposed patch ma=
y not be the "proper" fix to the issues i am seeing, but it does at least w=
ork.
> >
> > I have NOT tested boot from eMMC (either with or without this patch), t=
hough i have no reason to believe it would be impacted.
> >
> > I am happy to provide more info as needed. First time posting to the LK=
ML, i hope i am doing this right...
> >
> > Tested-by: Grimmauld <grimmauld@grimmauld.de>
Thanks for testing this patch.
>
> I tested this patch again on the latest kernel, and it still results in
> the "requesting loading a module with wait allowed while being called fro=
m
> async context can result in a deadlock" warning from the modules code.
> (With the calling code being phylib.)
> See the phylib splat that I previously reported in this thread.
>
I=E2=80=99ve attempted to reproduce the warning but was unable to trigger i=
t locally.

> Note that I've built the network PHY driver that phylib wants to load
> (CONFIG_REALTEK_PHY=3Dy) as built-in. As long as the PHY driver is built
> as built-in, I don't think that the problem the modules code is warning
> about can happen. (But I also don't understand why it is trying to load
> a module when the driver is built as built-in in the first place...)
>
But both CONFIG_PHYLIB and CONFIG_REALTEK_PHY are selected as buildin
for R8169 module.

I have tested with the built-in module
CONFIG_R8169=3Dy
CONFIG_R8169_LEDS=3Dy

As well as the module
CONFIG_R8169=3Dm
CONFIG_R8169_LEDS=3Dy

> Anyway, my networking is working perfectly fine even with the splat.
>
>
> Having async probing for the Rockchip PCIe controller driver, which is
> used a LOT of rockchip based SoCs, is a good thing, so I don't think it
> is right to avoid enabling async probing just because it results in a
> splat on a single rockchip based board (rock5b).
>
Yes, this could help in the module probe pci module.

Earlier, I thought gmac will control the r8169 module, but I was wrong.
Could you please try these changes at your end? These changes are
related to MIMO..

$ git diff ./arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
index b3e76ad2d869..fb3a8ba4085a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
@@ -477,7 +477,6 @@ &pcie2x1l0 {
 &pcie2x1l2 {
        pinctrl-names =3D "default";
        pinctrl-0 =3D <&pcie2_2_rst>;
-       reset-gpios =3D <&gpio3 RK_PB0 GPIO_ACTIVE_HIGH>;
        vpcie3v3-supply =3D <&vcc3v3_pcie2x1l2>;
        status =3D "okay";
 };
@@ -535,6 +534,12 @@ pcie3_vcc3v3_en: pcie3-vcc3v3-en {
                };
        };

+       rtl8211f {
+               rtl8211f_0_rst: rtl8211f-0-rst {
+                       rockchip,pins =3D <3 RK_PB0 RK_FUNC_GPIO &pcfg_pull=
_none>;
+               };
+       };
+
        usb {
                usbc0_int: usbc0-int {
                        rockchip,pins =3D <3 RK_PB4 RK_FUNC_GPIO &pcfg_pull=
_none>;
@@ -550,6 +555,19 @@ &pwm1 {
        status =3D "okay";
 };

+&mdio0 {
+       rgmii_phy0: ethernet-phy@1 {
+               /* RTL8211F */
+               compatible =3D "ethernet-phy-id001c.c916";
+               reg =3D <0x1>;
+               pinctrl-names =3D "default";
+               pinctrl-0 =3D <&rtl8211f_0_rst>;
+               reset-assert-us =3D <20000>;
+               reset-deassert-us =3D <100000>;
+               reset-gpios =3D <&gpio3 RK_PB0 GPIO_ACTIVE_LOW>;
+       };
+};
+
 &rknn_core_0 {
        npu-supply =3D <&vdd_npu_s0>;
        sram-supply =3D <&vdd_npu_s0>;

>
> Kind regards,
> Niklas

Thanks
-Anand

