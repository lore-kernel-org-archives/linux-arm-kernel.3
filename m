Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B60E0D25031
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Jan 2026 19:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6qkrUF2RLZLAfR72blD0obsNP0e+yMnfnNhdR4To/xk=; b=ey29+UNeYqyhfqh5KWVeHHZIMK
	nAV7oLwYX2BbOd1V2UxfuvF+7L1Kubju2asm8Jj+SyoP3F4OWbxpGSBE+OIDR7wiXzUV5FvwXI9ep
	RPDfzVlGNbz5vcRl3ToXBtElUmu5oi7Qi3bjGyUpLxwJVU9z2gcHOcR6QrRAiYaq4AnRR8xnjH5kT
	2LvB2SkQsrut92K7guxNsS/bFe57fKy67KE/d48nw/mq1fps1QhRJ+c8ZlLE8AtrFGxvUR1yNT94D
	nnt0kX6sR8m3UDYRXi+aK7zcYPOYPIrUDc0vInpBdy+d2++uzsQDgeZJZwKbLxKCyW/q2LP2IwW0/
	HRE5jKRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vf19k-00000004ReG-3zom;
	Sun, 11 Jan 2026 19:31:21 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vf19h-00000004RdU-3fep
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Jan 2026 19:31:19 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-b8010b8f078so950855066b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Jan 2026 11:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768159875; x=1768764675; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6qkrUF2RLZLAfR72blD0obsNP0e+yMnfnNhdR4To/xk=;
        b=QyqumeVsp/5iMNUmfjnefKbvJHVZhkbGRDhQfzLSu+PCXrImkhsO/rnpokW+GH/df1
         yOcKMPNuXrC+07LosDRIzM0V73gzWLyNAkpmzXEFYvljE0KN34cwjHpqDmVmOSoywixG
         4tJXq3t/2of4VcAMsY5fiSEqkmlJM02BbMIHEMK3Xxff8LKBAeauv2JOPfoAFcjCgi2p
         s7UHaTTkclClCzjtdXH7SjcserG1Ct1PUpZ1JHowruSVIhEkmIBOgozrMN1Xkjox67K2
         nkhy45V7I0/3GktIV9Evy3hJNU4VwuWf5oPq0p3BsCDM0tP2J6iVeELBgAtYdhy9HWia
         TYPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768159875; x=1768764675;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6qkrUF2RLZLAfR72blD0obsNP0e+yMnfnNhdR4To/xk=;
        b=IvGM0vBW9bXjf2EvoplpZYWR8ZBw1hh9WLu+k942pD6hDdht8xLmxk28edTK4dqKuC
         pc7RHf2wCCXxqLsYzf1rLiDNcNBcPnNMXPqkSea8tHjXwBtMFvjBXgsmwQyq35Khc17p
         GWec+VkbkuhLtK9YgJPmmbCf+MpRGeaoimww6gupha2Qrq4SMAFm0hCD9rz3XbQosocn
         u+XfdS9DeMezTy8/oukykE5Fj9ncAYDCLUvqyxWZaAXch3ym1JFw/7f+gMCGftOG3aXI
         hSmmGzwNx5ZwRDyuBRHK7E76aEq1TdUJamlhSVwVaQft3InV4xlqpfA54JaPnN0tygZA
         k4lg==
X-Forwarded-Encrypted: i=1; AJvYcCW8s9XQk7wL7sUGJs7PxyKER1Vhi9Tp0XF0SmYAe0IYuRvtCy9QcFKZjuBwMZSZ1th3nAlRE1Rdh+qZqWvuvgil@lists.infradead.org
X-Gm-Message-State: AOJu0YyWxzj2WioiMvVuwcnD4OcJNrDHmX5zdH3GTRPxAhEwuXdtiVXa
	jEzAfdctrWKsjnp0/B+fOXShRRUfbtbPsb3KzrZfEbqODbaRxMx+21uh+Wwn1b9Ur3tO1XwDzRi
	QvqPsA+18R/lAqBncmbDEpmkAi/BVyo4=
X-Gm-Gg: AY/fxX5AZ2/6RStYQR5TRJ65O4ABMIrXTanXQtm9PWQzvg+rRyyVwsSMMD0OxpHu8js
	EQFmZ8tVkz3IBctk+s2WwibMhpCau0xhXSZ//nsZjSHKyx/UFgowFaP1juuuY1qTxv1tFDW+cpP
	yHv4lSrQi395PxC4NQmFIJMpfZMEyXIatZZPYV3oa/OsaxDimq5XSQCty3yfJM5Fxlg+o6ZO/ql
	sZ0R3Ls1AYaWXhXxITFapV0JMX68NAASvTAGmyIPnt0HSFNhL1MtFmHkPV/VjplWeI=
X-Google-Smtp-Source: AGHT+IFWHn5dbPTd753DAc8rct7bCxMeL1qXuxz+hBvBFK6fMM9k25uVZu5YNTzZOJAyMEZFBK+guOsxRA7rnfdhq2c=
X-Received: by 2002:a17:907:97c1:b0:b87:1c20:7c68 with SMTP id
 a640c23a62f3a-b871c2089c4mr94188166b.16.1768159874510; Sun, 11 Jan 2026
 11:31:14 -0800 (PST)
MIME-Version: 1.0
References: <20260103083232.9510-1-linux.amoon@gmail.com> <20260103083232.9510-3-linux.amoon@gmail.com>
 <aVkfNBUDUumzV0-X@venus> <CANAwSgTmAbswY6scsxj40B7Y6QbnkqWPuCqyevRjdtHNemq0aQ@mail.gmail.com>
 <aWGLE-zcPUvQj3Q0@venus>
In-Reply-To: <aWGLE-zcPUvQj3Q0@venus>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 12 Jan 2026 01:00:57 +0530
X-Gm-Features: AZwV_Qg69Yw4dYa-ixw5oGHgx-Nm67dcEorw3Ehevd0t63RHaOwAygX9fHLU11Y
Message-ID: <CANAwSgRi+STUapakKV4XrGVD8B6LSetGC8Ya+Ubiki7dOQyGUg@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] arm64: dts: rockchip: rk3588-rock-5b-5bp-5t: Fix
 USB host phy-supply on Rock 5b-5bp-5t SbC
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, FUKAUMI Naoki <naoki@radxa.com>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Yongbo Zhang <giraffesnn123@gmail.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:USB TYPEC CLASS" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_113117_934643_FB63BFE5 
X-CRM114-Status: GOOD (  26.11  )
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

Hi Sebastian,

I am having difficulty articulating my thoughts clearly right now;
please bear with me as I try to explain.

On Sat, 10 Jan 2026 at 05:03, Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
>
> Hi,
>
> On Thu, Jan 08, 2026 at 12:25:12PM +0530, Anand Moon wrote:
> > Thanks for your review comments.
> > On Sat, 3 Jan 2026 at 19:35, Sebastian Reichel wrote:
> > > On Sat, Jan 03, 2026 at 02:01:18PM +0530, Anand Moon wrote:
> > > > The USB host USB2 and USB3 on the Rock 5B, 5BP, and 5T is powered by the
> > > > USB_HOST_PWREN_H gpio pin which is used to enable vcc5v0_host host
> > > > regulator which ensures proper power sequencing and management for onboard
> > > > Double-USB-HOST.
> > > >
> > > > Update the u2phy2_host node to reference the correct phy-supply.
> > > >
> > > > Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
> > > > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > > > ---
> > >
> > > u2phy2_host is connected to an onboard USB hub chip, which is
> > > powered by &vcc5v0_sys as the comment says.
> > >
> > > You can see this on page 9 of the v1.45 ROCK 5B schematics (page
> > > name USB2HUB). The usb hub chip uses VCC5V0_SYS + VCC_3V3_S0 and is
> > > connected to USB20_HOST0_DP, USB20_HOST0_DM. The related USB
> > > controller for that in the upstream DT is &usb_host0_ehci, which
> > > in turn is using &u2phy2_host. Thus at least for the ROCK 5B the
> > > existing DT is correct. Properly describing the downstream port
> > > VBUS regulator would require something like the following series:
> > >
> > > https://lore.kernel.org/all/20250911-v6-16-topic-usb-onboard-dev-v4-0-1af288125d74@pengutronix.de/
> > >
> > Actually, the Radxa Rock 5 B doesn't have an onboard USB hub chip.
>
> Seriously? I provided the exact page for the hub chip in the
> schematics and it's easily visisble in lsusb too.
>
My apologies for the confusion. To clarify, this board lacks a USB hub
chip that matches the
detected USB IDs and is capable of powering both USB 2.0 and USB 3.0 interfaces.

[1] https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/usb/microchip%2Cusb2514.yaml

This is the reason we have a separate power regulator for USB 2.0 and
USB 3.0 ports
and Type-C controllers.

There is a USB2HUB -> U90078 FE1.1s_QFN chip (page 27) in the schematics,
It's probably connected to the PCIE M.2 NGFF for Bluetooth

[2] https://www.snapeda.com/parts/FE1.1s-BQFN24B/Terminus-Tech/datasheet/

$ lsusb -tv
/:  Bus 001.Port 001: Dev 001, Class=root_hub, Driver=ehci-platform/1p, 480M
    ID 1d6b:0002 Linux Foundation 2.0 root hub
    |__ Port 001: Dev 002, If 0, Class=Hub, Driver=hub/4p, 480M
        ID 1a40:0101 Terminus Technology Inc. Hub
        |__ Port 003: Dev 003, If 0, Class=Wireless, Driver=btusb, 12M
            ID 8087:0a2b Intel Corp. Bluetooth wireless interface
        |__ Port 003: Dev 003, If 1, Class=Wireless, Driver=btusb, 12M
            ID 8087:0a2b Intel Corp. Bluetooth wireless interface
/:  Bus 002.Port 001: Dev 001, Class=root_hub, Driver=ohci-platform/1p, 12M
    ID 1d6b:0001 Linux Foundation 1.1 root hub
/:  Bus 003.Port 001: Dev 001, Class=root_hub, Driver=ehci-platform/1p, 480M
    ID 1d6b:0002 Linux Foundation 2.0 root hub
/:  Bus 004.Port 001: Dev 001, Class=root_hub, Driver=ohci-platform/1p, 12M
    ID 1d6b:0001 Linux Foundation 1.1 root hub
/:  Bus 005.Port 001: Dev 001, Class=root_hub, Driver=xhci-hcd/1p, 480M
    ID 1d6b:0002 Linux Foundation 2.0 root hub
/:  Bus 006.Port 001: Dev 001, Class=root_hub, Driver=xhci-hcd/1p, 5000M
    ID 1d6b:0003 Linux Foundation 3.0 root hub
/:  Bus 007.Port 001: Dev 001, Class=root_hub, Driver=xhci-hcd/1p, 480M
    ID 1d6b:0002 Linux Foundation 2.0 root hub
/:  Bus 008.Port 001: Dev 001, Class=root_hub, Driver=xhci-hcd/1p, 5000M
    ID 1d6b:0003 Linux Foundation 3.0 root hub

> I don't want to waste my time and expect a certain level of quality
> and this is certainly way below it...

Please accept my apologies for the miscommunication.

Could you check the enable status of the USB_HOST_PWREN_H pin in the schematics?

USB_HOST_PWREN_H -> VCC5V0_USB20_HOST0 / VCC5V0_USB20_HOST2
USB_HOST_PWREN_H -> VCC5V0_USB30_HOST0 / VCC5V0_USB30_HOST1

My current patch is trying to address this issue.

>
> -- Sebastian

Thanks
-Anand

