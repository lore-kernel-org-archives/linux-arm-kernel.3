Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F154CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 14:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rj8s1wnUATyl/Io36KEtToNI7y6NAciHE7SXMDsNhyY=; b=k42QdIlzUsiun18yL4ihL3klMe
	CuQEmvIsXvAScd7KbGM/HuTruGPwQ8m6UGJHnCd3h4zzycP4nHCWMHV+HqZ/L9zWVSXMEJsnksxms
	iwpi1e++ZDgikDTrZqvms17cLRbtHbmP4TnRF+DmkeYSuDJq5esFIF6UPh0i8TZpnIpX2crpCcoKE
	mdvcnz67KrPypIHES2DJPu6Fl1lOso2Xnal+BIo5ix3PTuFDUVp9gq9YOA/rFX9Q9HtLY3pdjw6PZ
	otdhoUClIQKBGjdho22VtIokfM9PU/ribE2sjrUA3XyntFqCRag1QduByKNzuQwgtjPcWykmTBp3y
	glgrWmpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEpjF-00000006CE7-0NNa;
	Fri, 31 Oct 2025 14:03:45 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEpjC-00000006CD2-0njW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 14:03:44 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-63c0c9a408aso3482670a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 07:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761919420; x=1762524220; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Rj8s1wnUATyl/Io36KEtToNI7y6NAciHE7SXMDsNhyY=;
        b=lepSm5pEBrAgoMn877ghvG5Sfi3H2hcedVSKidV8aEpVhWM9ZXfJ3BvneS+wNIRgQ1
         CYHglLTmiqnBPjWDYepU2SVbPM0RvLJM8OSTooPq/5SAq+k5DB+4CDTpAsstPm0XkwEt
         E0ogcKeEMVX+3sjaXdIBgIGbkSsxQpeYCU56jRQ55zjX0uVGSVYOr/7MoloDFZYbLHoV
         zu9slOk/xH2CrJgSe8a5TOmZNPQDTqT58OkCmhiLNbpy8ob/BuBQGm8pM01Klm+duCqA
         3hJPrSS/fDayaMtpBX8WNwL1aK+FM1IGPecFu8UiAEqWepHUMlbaHjLy/1Q4FV2Z+sam
         tbVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761919420; x=1762524220;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rj8s1wnUATyl/Io36KEtToNI7y6NAciHE7SXMDsNhyY=;
        b=hB0Iyb+8Fq3DyYHk0oZwPK3lauA6TyBqa0Ofyxx0Qxk4svK9+SDez2B9IQAC81O1zH
         hXmw3qKj41zpwWgKKlSO0CKDhrOcruJhc8oS5ZYlW1YjSzOyw99vf0nkWwNOLl4KkeG3
         zoIULA2EJfkk7321XpY3gZLpjFPThmFjKZoGOEY8mje8xdtOCUEaMbbsKWtTnF1wRLIu
         yYG89p+YGe4JJuILhL+RI4ZE9HhcaMoHNB+uVZnXA4qxsBYlBKiMSoPxoqdwWcO/bWYA
         zs47RR1nhwEup39dmuxC8qOU4Tap5rFjCwAvMP5Au8L2uqoIXcpW0YGCd/yYsan1HNlg
         1gmg==
X-Forwarded-Encrypted: i=1; AJvYcCWyFZMi0CAc6M9DBQynDgVRs9jTTWU7w2eX+PkVnalyT3stvarzpDkDkFg5y5YPqPCnM55nVjwYYPpq+razi3zF@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4Y+55D1hk4nYFFF2gme1z6hrnLPFNb6327UaLKtho9iLrS9VW
	Rg0s50MTy2Pd6Rumhh3ihYx+2pwPPJCf9DTiTCg0KS6k7lT+iulCFmem3USIiAT9181VjVZrog4
	+630WDQ33b4M2KTt9hxtxPBE+frvsR48=
X-Gm-Gg: ASbGncuFqZGv/SaZXqf7AKBjni2cF5Tubb81CUyzYgqwhXH1A3Di+lthFqEEFUeeHYT
	y1TJpzstzjOI6O0r41YVlYmvZC0AtokajAhdvBX/F5ZNSIJUXLBAOsHzAELccYMRlkQRbUJ/JPU
	te6FMgWQeSPt5cVMkaLWiY3/3eaHS8OKj8XMhqiDlLrNWg4vA2buBdc+0h0nGBb4jsNt2PeAvd+
	m4MQ560MX3ykCJ9vDSRTNLNm1ffulcgHIQYSLtKnArfVFRQy3e/S6q0NCU=
X-Google-Smtp-Source: AGHT+IFFEnMjDFLH3xr8fEIyqOPBV7EY4VCIK4pS6uE8BEVFtTPJxx3MWiLabn3HLkuRrI1ocxVTpieowo++InLDHHw=
X-Received: by 2002:a05:6402:1e90:b0:639:fca4:c471 with SMTP id
 4fb4d7f45d1cf-6407704da9fmr2381667a12.28.1761919419979; Fri, 31 Oct 2025
 07:03:39 -0700 (PDT)
MIME-Version: 1.0
References: <20251027145602.199154-1-linux.amoon@gmail.com>
 <20251027145602.199154-3-linux.amoon@gmail.com> <ukgkfetbggzon4ppndl7gpitlsz7hjhzhyx3dgxqhdo52exguy@bqksd7d27lpy>
In-Reply-To: <ukgkfetbggzon4ppndl7gpitlsz7hjhzhyx3dgxqhdo52exguy@bqksd7d27lpy>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 31 Oct 2025 19:33:23 +0530
X-Gm-Features: AWmQ_bk2RE7HwEI0_pE9LFbkkRWOVq0EH46VuMrlsLHx-lzP_lVcojMP9zLP-UY
Message-ID: <CANAwSgTECOAoKeJS_=HxkkTP4OJvYu5xGQxY__Auh81v3QT=-w@mail.gmail.com>
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_070342_287814_A10335D6 
X-CRM114-Status: GOOD (  16.22  )
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

Thanks for your review comment.

On Fri, 31 Oct 2025 at 14:09, Manivannan Sadhasivam <mani@kernel.org> wrote:
>
> On Mon, Oct 27, 2025 at 08:25:30PM +0530, Anand Moon wrote:
> > Add runtime power management support to the Rockchip DesignWare PCIe
> > controller driver by enabling devm_pm_runtime() in the probe function.
> > These changes allow the PCIe controller to suspend and resume dynamically,
> > improving power efficiency on supported platforms.
> >
>
> Seriously? How can this patch improve the power efficiency if it is not doing
> any PM operation on its own?
>
I could verify that runtime power management is active

[root@rockpi-5b alarm]# cat
/sys/devices/platform/a41000000.pcie/power/runtime_status
active
[root@rockpi-5b alarm]#  find /sys -name runtime_status
/sys/devices/platform/a41000000.pcie/pci0004:40/0004:40:00.0/power/runtime_status
/sys/devices/platform/a41000000.pcie/pci0004:40/0004:40:00.0/pci_bus/0004:41/power/runtime_status
/sys/devices/platform/a41000000.pcie/pci0004:40/0004:40:00.0/0004:41:00.0/power/runtime_status
/sys/devices/platform/a41000000.pcie/pci0004:40/0004:40:00.0/0004:41:00.0/net/enP4p65s0/power/runtime_status
/sys/devices/platform/a41000000.pcie/pci0004:40/0004:40:00.0/0004:41:00.0/net/enP4p65s0/enP4p65s0-3::lan/power/runtime_status
/sys/devices/platform/a41000000.pcie/pci0004:40/0004:40:00.0/0004:41:00.0/net/enP4p65s0/enP4p65s0-2::lan/power/runtime_status
/sys/devices/platform/a41000000.pcie/pci0004:40/0004:40:00.0/0004:41:00.0/net/enP4p65s0/enP4p65s0-1::lan/power/runtime_status
/sys/devices/platform/a41000000.pcie/pci0004:40/0004:40:00.0/0004:41:00.0/net/enP4p65s0/enP4p65s0-0::lan/power/runtime_status
/sys/devices/platform/a41000000.pcie/pci0004:40/0004:40:00.0/0004:41:00.0/mdio_bus/r8169-4-4100/power/runtime_status
/sys/devices/platform/a41000000.pcie/pci0004:40/0004:40:00.0/0004:41:00.0/mdio_bus/r8169-4-4100/r8169-4-4100:00/power/runtime_status
/sys/devices/platform/a41000000.pcie/pci0004:40/0004:40:00.0/0004:41:00.0/mdio_bus/r8169-4-4100/r8169-4-4100:00/hwmon/hwmon11/power/runtime_status

Well, the powertop shows that the runtime power management is enabled
on Radxa Rock 5b,

PowerTOP 2.15     Overview   Idle stats   Frequency stats   Device
stats   Device Freq stats   Tunables   WakeUp
>> Good          Wireless Power Saving for interface wlan0
   Good          VM writeback timeout
   Good          Bluetooth device interface status
   Good          NMI watchdog should be turned off
   Good          Autosuspend for unknown USB device 2-1.3 (8087:0a2b)
   Good          Autosuspend for USB device USB 2.0 Hub [2-1]
   Good          Autosuspend for USB device Generic Platform OHCI
controller [usb1]
   Good          Autosuspend for USB device xHCI Host Controller [usb8]
   Good          Autosuspend for USB device Generic Platform OHCI
controller [usb4]
   Good          Autosuspend for USB device EHCI Host Controller [usb2]
   Good          Autosuspend for USB device xHCI Host Controller [usb6]
   Good          Autosuspend for USB device EHCI Host Controller [usb3]
   Good          Autosuspend for USB device xHCI Host Controller [usb5]
   Good          Autosuspend for USB device xHCI Host Controller [usb7]
   Good          Runtime PM for PCI Device Intel Corporation Wireless
8265 / 8275
   Good          Runtime PM for PCI Device Rockchip Electronics Co., Ltd RK3588
   Good          Runtime PM for PCI Device Rockchip Electronics Co., Ltd RK3588
   Good          Runtime PM for PCI Device Realtek Semiconductor Co.,
Ltd. RTL8125 2.5GbE Controller
   Good          Runtime PM for PCI Device Rockchip Electronics Co., Ltd RK3588
   Good          Runtime PM for PCI Device Samsung Electronics Co Ltd
NVMe SSD Controller SM981/PM981/PM983

PowerTOP 2.15     Overview   Idle stats   Frequency stats   Device
stats   Device Freq stats   Tunables   WakeUp
              Usage     Device name
              1.1%        CPU use
            100.0%        Radio device: rfkill_gpio
            100.0%        runtime-rockchip-gate-link-clk.712
            100.0%        PCI Device: Realtek Semiconductor Co., Ltd.
RTL8125 2.5GbE Controller
            100.0%        runtime-rockchip-gate-link-clk.717
            100.0%        runtime-rockchip-gate-link-clk.714
            100.0%        runtime-rockchip-gate-link-clk.489
            100.0%        runtime-a40000000.pcie
            100.0%        runtime-a40800000.pcie
            100.0%        runtime-rockchip-gate-link-clk.718
            100.0%        runtime-rockchip-gate-link-clk.706
            100.0%        runtime-rockchip-gate-link-clk.708
            100.0%        PCI Device: Intel Corporation Wireless 8265 / 8275
            100.0%        Radio device: btusb
            100.0%        runtime-fcd00000.usb
            100.0%        PCI Device: Samsung Electronics Co Ltd NVMe
SSD Controller SM981/PM981/PM983
            100.0%        Radio device: rfkill_gpio
            100.0%        runtime-fc000000.usb
            100.0%        Radio device: iwlwifi
            100.0%        PCI Device: Rockchip Electronics Co., Ltd RK3588
            100.0%        PCI Device: Rockchip Electronics Co., Ltd RK3588
            100.0%        PCI Device: Rockchip Electronics Co., Ltd RK3588
            100.0%        runtime-rockchip-gate-link-clk.711
            100.0%        runtime-fc400000.usb
            100.0%        runtime-rockchip-gate-link-clk.704
            100.0%        runtime-rockchip-gate-link-clk.701
            100.0%        runtime-rockchip-gate-link-clk.716
            100.0%        runtime-rockchip-gate-link-clk.707
            100.0%        runtime-rockchip-gate-link-clk.709
            100.0%        runtime-rockchip-gate-link-clk.719
            100.0%        runtime-xhci-hcd.1.auto
            100.0%        runtime-feb50000.serial
            100.0%        runtime-rockchip-gate-link-clk.715
            100.0%        runtime-rockchip-gate-link-clk.710

> Again, a pointless patch.
I implemented a .remove patch to ensure proper resource cleanup,
which is a necessary step for successfully enabling and managing
runtime power for the device.
>
> - Mani
Thanks
-Anand

