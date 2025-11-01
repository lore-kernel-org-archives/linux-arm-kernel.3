Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08220CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Nov 2025 08:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e0mQAWV3XfpMeJi9ai8J8FQrA7XgmRdoJSKbFj4v+kE=; b=HzrMoBon24frxmuO9vFpA8auEB
	h2fl+iCmrbwADldVWA2jBdGRbdPsgOqzBglxiziHtyyE168XxpfRigtmdu9T0yiaRerm+p/N3JG/6
	PtTiabYMGmsildXXtpDUG3QV2DfUmjxWHyGWp+z3x0kXUompuRVoor2v7f7U3lZmkbreRM2/qQOyo
	KmNKN9W+Hq1AuA7y96iVbi5inmBcyzblCcO4EIcb2G8YSsxg5vz/2uzLTxkFAEwlT++MTN7t2AXxT
	bJoF6BQ42DfcrK3yYwjcZbwLoR2AgXbF9XkhYq5q8Kqf+XEgXXQg2pctdg5DdiGurSwLR3QoQFC6w
	RCZD/vKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vF6gU-00000007Asc-2hWW;
	Sat, 01 Nov 2025 08:10:02 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vF6gR-00000007ArZ-31vh
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Nov 2025 08:10:01 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-634cef434beso7436772a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Nov 2025 01:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761984597; x=1762589397; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e0mQAWV3XfpMeJi9ai8J8FQrA7XgmRdoJSKbFj4v+kE=;
        b=Khmpq+7/wEPQhtd0RxlWjaxEYD79PZYyZsy8mg+EA2PXSIyfT5DmRAMbAni4uYxZ7C
         Jk+iJl6RLN416EkrCTMbQOabA/0GeNP9hU5G4pWmxR4LmN0Qscj7BYHoZZ3vy0E8RiXD
         RTqcEc+tNbiYKo8AB1t/8bkvYmRpu3Tb+Kqe4aTJdee/5hdy2evPWAtcDWiH823LKuWT
         J2y7okzhwFqfuzgQRCNn0K5M0El5fJyzLFiJBoR/wBVYwdK0RU4rs8anvz1SbwWc9C/F
         9dm0to5qKSOiUZqGKjTAixRGn5arr+5VWXss8/cICBAc7BqDLbz8jChGGQ1LGTsOOhsH
         Iosw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761984597; x=1762589397;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e0mQAWV3XfpMeJi9ai8J8FQrA7XgmRdoJSKbFj4v+kE=;
        b=KAJFi9Xq5Jr1Fby18GNm21Q61sdSpeHtArXEhYmqNWKrCDHixi23vItx8tNoE2pllu
         jzjn5YU8I/tyFqAUkMG2smOGqpLuG1IHN5OBBSWt/ZuYDkkJyDWk5/zQRlqRzFXteaB+
         3i4v59gvgTgaZq/GT4aKWrSMMZNxVqPIZeTW35bQUIjTZ9w9SLwB/eI9HrEt/9FPIxgT
         4DYXYN0tGYXaY/3BiexDI7tPfxMsXQW7cAnuqsSyNEZCWMTDAH5KhVl9r1WOVTkXTnVw
         azkXJWcelUNuxUZXs9d0XEdQ9/0xdpMKWrjrm9Jh24RiZr539F15QGde18nKqq3CmQ05
         C+iw==
X-Forwarded-Encrypted: i=1; AJvYcCWG/ZsLhtx51yYK6B3vmkKXRhVRtph4b2JV66AmKgIzWkNwn3TFtAVCKxwTMXxhKAmxBQf9ZF0fqo3lEy+Gwz/H@lists.infradead.org
X-Gm-Message-State: AOJu0YxXzkGgy6aYvLDs/QQDkKf3bfK2fMz+LT7nPYwJ+6P21/XOYtb+
	oC3McymZeoafR2SlSUTl1L6PlYtwN8FvKSckf6COPgWfMhPNCqdJaKcFDXNcXT8Usc2mfcnbbaP
	dSOwaTr2x0fUVgZD/qYM5YThlS9MCPRY=
X-Gm-Gg: ASbGnctuZiaZH9VVSIt5HnXjP4AootwRccP9lOHgk2f7wHvyKMerkB8hWASjzuqvmMm
	GrOgiciKIfBxO7E254b23bCwRHgGz1G/FhW9jBCUuouNTrth59otkEXFkrfSRepFevPFLA7NxD8
	Ffnblq3aD82KeOpU2NCjrtLMMMczKeLFOHmYp9PhghjYmd0BNrQpmyXLkSF4rICiZGJ1oxw+tmO
	5BLITqyt84ZeoBkI2uY+1GjBnZztRjQ6RiAiAV2xuftW9sslRpX3YvvAZk=
X-Google-Smtp-Source: AGHT+IEStKAQTy8wZtpmhPqSnnW8TO7bXnzRVtqDvw1DcTKtsF9EE994q0FWQ6fL+UQYmZUp56Mhe4DohrV4ECJKEvI=
X-Received: by 2002:a17:907:3e02:b0:b6d:ba72:7524 with SMTP id
 a640c23a62f3a-b706e270c58mr803014966b.11.1761984596818; Sat, 01 Nov 2025
 01:09:56 -0700 (PDT)
MIME-Version: 1.0
References: <20251027145602.199154-1-linux.amoon@gmail.com>
 <20251027145602.199154-3-linux.amoon@gmail.com> <ukgkfetbggzon4ppndl7gpitlsz7hjhzhyx3dgxqhdo52exguy@bqksd7d27lpy>
 <CANAwSgTECOAoKeJS_=HxkkTP4OJvYu5xGQxY__Auh81v3QT=-w@mail.gmail.com> <e7cttuu5525k7ryvmkh6ifspm5vloj4muazvmp3yxtkgsdtbjs@u4odsfurejxq>
In-Reply-To: <e7cttuu5525k7ryvmkh6ifspm5vloj4muazvmp3yxtkgsdtbjs@u4odsfurejxq>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sat, 1 Nov 2025 13:39:41 +0530
X-Gm-Features: AWmQ_bn4roPSmQJ8KCYtDIOw3rDpVxIdUMmrjbDOUs1b7sXIsyCe60QAiCMVpHM
Message-ID: <CANAwSgTRFMiSN8Q-tndvVXk7NxuNJE7GmcBXq46RQ=Z6-qOLEw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] PCI: dw-rockchip: Add runtime PM support to
 Rockchip PCIe driver
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
	Niklas Cassel <cassel@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>, 
	Hans Zhang <18255117159@163.com>, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	"open list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS" <linux-pci@vger.kernel.org>, 
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251101_010959_809725_C90F3A47 
X-CRM114-Status: GOOD (  29.12  )
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

Hi Manivannan

On Fri, 31 Oct 2025 at 20:23, Manivannan Sadhasivam <mani@kernel.org> wrote=
:
>
> On Fri, Oct 31, 2025 at 07:33:23PM +0530, Anand Moon wrote:
> > Hi Manivannan
> >
> > Thanks for your review comment.
> >
> > On Fri, 31 Oct 2025 at 14:09, Manivannan Sadhasivam <mani@kernel.org> w=
rote:
> > >
> > > On Mon, Oct 27, 2025 at 08:25:30PM +0530, Anand Moon wrote:
> > > > Add runtime power management support to the Rockchip DesignWare PCI=
e
> > > > controller driver by enabling devm_pm_runtime() in the probe functi=
on.
> > > > These changes allow the PCIe controller to suspend and resume dynam=
ically,
> > > > improving power efficiency on supported platforms.
> > > >
> > >
> > > Seriously? How can this patch improve the power efficiency if it is n=
ot doing
> > > any PM operation on its own?
> > >
> > I could verify that runtime power management is active
> >
>
> This is runtime status being active, which is a different thing as it onl=
y
> allows the runtime PM hierarchy to be maintained. But the way you describ=
ed the
> commit message sounds like the patch is enabling runtime PM of the contro=
ller
> and that improves efficiency (as if the controller driver is actively doi=
ng
> runtime PM operations).
>
> > [root@rockpi-5b alarm]# cat
> > /sys/devices/platform/a41000000.pcie/power/runtime_status
> > active
> > [root@rockpi-5b alarm]#  find /sys -name runtime_status
> > /sys/devices/platform/a41000000.pcie/pci0004:40/0004:40:00.0/power/runt=
ime_status
> > /sys/devices/platform/a41000000.pcie/pci0004:40/0004:40:00.0/pci_bus/00=
04:41/power/runtime_status
> > /sys/devices/platform/a41000000.pcie/pci0004:40/0004:40:00.0/0004:41:00=
.0/power/runtime_status
> > /sys/devices/platform/a41000000.pcie/pci0004:40/0004:40:00.0/0004:41:00=
.0/net/enP4p65s0/power/runtime_status
> > /sys/devices/platform/a41000000.pcie/pci0004:40/0004:40:00.0/0004:41:00=
.0/net/enP4p65s0/enP4p65s0-3::lan/power/runtime_status
> > /sys/devices/platform/a41000000.pcie/pci0004:40/0004:40:00.0/0004:41:00=
.0/net/enP4p65s0/enP4p65s0-2::lan/power/runtime_status
> > /sys/devices/platform/a41000000.pcie/pci0004:40/0004:40:00.0/0004:41:00=
.0/net/enP4p65s0/enP4p65s0-1::lan/power/runtime_status
> > /sys/devices/platform/a41000000.pcie/pci0004:40/0004:40:00.0/0004:41:00=
.0/net/enP4p65s0/enP4p65s0-0::lan/power/runtime_status
> > /sys/devices/platform/a41000000.pcie/pci0004:40/0004:40:00.0/0004:41:00=
.0/mdio_bus/r8169-4-4100/power/runtime_status
> > /sys/devices/platform/a41000000.pcie/pci0004:40/0004:40:00.0/0004:41:00=
.0/mdio_bus/r8169-4-4100/r8169-4-4100:00/power/runtime_status
> > /sys/devices/platform/a41000000.pcie/pci0004:40/0004:40:00.0/0004:41:00=
.0/mdio_bus/r8169-4-4100/r8169-4-4100:00/hwmon/hwmon11/power/runtime_status
> >
> > Well, the powertop shows that the runtime power management is enabled
> > on Radxa Rock 5b,
> >
> > PowerTOP 2.15     Overview   Idle stats   Frequency stats   Device
> > stats   Device Freq stats   Tunables   WakeUp
> > >> Good          Wireless Power Saving for interface wlan0
> >    Good          VM writeback timeout
> >    Good          Bluetooth device interface status
> >    Good          NMI watchdog should be turned off
> >    Good          Autosuspend for unknown USB device 2-1.3 (8087:0a2b)
> >    Good          Autosuspend for USB device USB 2.0 Hub [2-1]
> >    Good          Autosuspend for USB device Generic Platform OHCI
> > controller [usb1]
> >    Good          Autosuspend for USB device xHCI Host Controller [usb8]
> >    Good          Autosuspend for USB device Generic Platform OHCI
> > controller [usb4]
> >    Good          Autosuspend for USB device EHCI Host Controller [usb2]
> >    Good          Autosuspend for USB device xHCI Host Controller [usb6]
> >    Good          Autosuspend for USB device EHCI Host Controller [usb3]
> >    Good          Autosuspend for USB device xHCI Host Controller [usb5]
> >    Good          Autosuspend for USB device xHCI Host Controller [usb7]
> >    Good          Runtime PM for PCI Device Intel Corporation Wireless
> > 8265 / 8275
> >    Good          Runtime PM for PCI Device Rockchip Electronics Co., Lt=
d RK3588
> >    Good          Runtime PM for PCI Device Rockchip Electronics Co., Lt=
d RK3588
> >    Good          Runtime PM for PCI Device Realtek Semiconductor Co.,
> > Ltd. RTL8125 2.5GbE Controller
> >    Good          Runtime PM for PCI Device Rockchip Electronics Co., Lt=
d RK3588
> >    Good          Runtime PM for PCI Device Samsung Electronics Co Ltd
> > NVMe SSD Controller SM981/PM981/PM983
> >
> > PowerTOP 2.15     Overview   Idle stats   Frequency stats   Device
> > stats   Device Freq stats   Tunables   WakeUp
> >               Usage     Device name
> >               1.1%        CPU use
> >             100.0%        Radio device: rfkill_gpio
> >             100.0%        runtime-rockchip-gate-link-clk.712
> >             100.0%        PCI Device: Realtek Semiconductor Co., Ltd.
> > RTL8125 2.5GbE Controller
> >             100.0%        runtime-rockchip-gate-link-clk.717
> >             100.0%        runtime-rockchip-gate-link-clk.714
> >             100.0%        runtime-rockchip-gate-link-clk.489
> >             100.0%        runtime-a40000000.pcie
> >             100.0%        runtime-a40800000.pcie
> >             100.0%        runtime-rockchip-gate-link-clk.718
> >             100.0%        runtime-rockchip-gate-link-clk.706
> >             100.0%        runtime-rockchip-gate-link-clk.708
> >             100.0%        PCI Device: Intel Corporation Wireless 8265 /=
 8275
> >             100.0%        Radio device: btusb
> >             100.0%        runtime-fcd00000.usb
> >             100.0%        PCI Device: Samsung Electronics Co Ltd NVMe
> > SSD Controller SM981/PM981/PM983
> >             100.0%        Radio device: rfkill_gpio
> >             100.0%        runtime-fc000000.usb
> >             100.0%        Radio device: iwlwifi
> >             100.0%        PCI Device: Rockchip Electronics Co., Ltd RK3=
588
> >             100.0%        PCI Device: Rockchip Electronics Co., Ltd RK3=
588
> >             100.0%        PCI Device: Rockchip Electronics Co., Ltd RK3=
588
> >             100.0%        runtime-rockchip-gate-link-clk.711
> >             100.0%        runtime-fc400000.usb
> >             100.0%        runtime-rockchip-gate-link-clk.704
> >             100.0%        runtime-rockchip-gate-link-clk.701
> >             100.0%        runtime-rockchip-gate-link-clk.716
> >             100.0%        runtime-rockchip-gate-link-clk.707
> >             100.0%        runtime-rockchip-gate-link-clk.709
> >             100.0%        runtime-rockchip-gate-link-clk.719
> >             100.0%        runtime-xhci-hcd.1.auto
> >             100.0%        runtime-feb50000.serial
> >             100.0%        runtime-rockchip-gate-link-clk.715
> >             100.0%        runtime-rockchip-gate-link-clk.710
> >
> > > Again, a pointless patch.
>
> This patch might make sense on its own, to enable runtime PM status of th=
e
> controller so that the runtime PM could be applied to the entire PCIe hie=
rarchy.
>
I will update this in the commit message.
> > I implemented a .remove patch to ensure proper resource cleanup,
> > which is a necessary step for successfully enabling and managing
> > runtime power for the device.
>
> How a dead code (remove callback for a always built-in driver) becomes ne=
cessary
> for runtime PM.
>
Ok, understood we don't have platform_driver_unregister in
builtin_platform_driver
I will drop the first patch.

> - Mani
>
Thanks
-Annad
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D

