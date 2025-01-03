Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46907E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 13:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tVo8vbmWhwjrxttB6H2z3OXCC+woAC8CNcN2ekPRIq0=; b=Ybb2V/1Vki4g87tKQ+f8PvK6XZ
	eTGVAl9AfFA0SaMt9UCjPAbhc/Zgc/fXBXjzmHsu2bQ6V1rZn2z8bV21pXRbkxL8PRo85emBTf3gN
	tPyOMU/CxkU9j8bqP3OCDhMfx/JHg2BcoEm+xx8vqebr+f+a8acyzvLKj6rnJj7J5Vwa/ufp/44TH
	Vx3BVIynfmL7DeIJ4Y9Mdvv+pi7uNU+97QwrT205CV5/k9+dxQKyo7kUO+FsM1wuB7lRBySRUYuth
	QWYtT7Y4r8xcpKG9hoYEAFsXrqy+l7XbByeyVYJO1rAKFq7id/hWm08HIiEGz7Y2BPCJPWYxtaaVk
	wvuT27nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTi9O-0000000D2tG-2yzw;
	Fri, 03 Jan 2025 13:55:42 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTi8B-0000000D2mh-1IuY;
	Fri, 03 Jan 2025 13:54:28 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5d437235769so1615780a12.2;
        Fri, 03 Jan 2025 05:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735912465; x=1736517265; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tVo8vbmWhwjrxttB6H2z3OXCC+woAC8CNcN2ekPRIq0=;
        b=Qgw7lV9Y3t7jxdigWBGqMO6BjHeVE3B+ReDjczzfzLEcN7Hm7+ZNyzELCdo7+syCi6
         S9xoSMsEAHKyFGMm/8ZdbW7aeK8rsheZFkNCyxC4m26i8qfZPM+pzo2YXUxRaXfKdAma
         6OHxLbqnKJh+Xd9ZO0sK0no6IClDcmvV/eH2clqsGAG7gtMTEyT2CbWhUwNGhCDjz4sf
         SaLUBe35RrJesYT7mL6JzQN3h3KKjosDkSMDqpVNUa0NbOzV7s2ACpVR9+2t8XQQR9dI
         glpb9Prda6wEdVqchRSW5EkI/o2YAAPMekEUoWrBP/rl2mfQR+JBsmgkgEN4c0pmbWF3
         Lhxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735912465; x=1736517265;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tVo8vbmWhwjrxttB6H2z3OXCC+woAC8CNcN2ekPRIq0=;
        b=xSW5rR7QvxUSLfwTLNOOqnTwKnw7I00D0NxbXZROitlcwwo5O6FVYmHrYVqUYS339C
         54NlAw1rYi4+D8OYF6LNWHEuvvemXlAWJdJ7+T33LAJMXqrOs5lFllBVlm120mqpeesJ
         ED337FG6VXx0O/rG2aRVnCMxPrpdcdw1g3yBLT+COe4oYLi9ogeuQIACll1GaDgCF+7J
         qL8BK5VjcliAu+BL1fBDws3qBdMY5A5LQaUHEciwY8WmH7KvLG3bOeO8NRhVfyaW5u4N
         re4poJwxd26Fs4qPplxhrTtjr01pSPmkqMCO/OEEwNWP6dVo2BOABl99o3Itd6CisC5h
         SgKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVL0yTSvmPCtiIMQBQ8LWICmyExE6jnruJr443h6aJsGqrDqiGIMAIutM5Kj7yxISiUcgW1kuIm1GL+VRf5PwN8@lists.infradead.org, AJvYcCVYSJt/igXTzYW4fgBrvvzLxMbN0OTX/TZX5b3u0U5xJo90XzDENXW92i71OTfUYMeXuw8Xjp5sVtOaLKIl5qY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxb3Pvf5E9rSbz6hIOsZj7+mMeCHEXMSXcYZd8vv7rOelcQHNEv
	CAMFyKdMbT4QGU9YMykOC9XXKWdALSmd3CgRJqx/HempJaGyfof9/k7/pZrrPYJTy9gsoLtFN/t
	4/NSUdk0aqiz3v2rP+Nikj1bobvs=
X-Gm-Gg: ASbGncvjQgJG5ln3Okg9E8nTMA5LI6WROiqbJZhYeBcHEkMPG1Jq5WgaWW6Dt+DipLw
	0+pZv/Y507nStjYjhGMrIOldtJj/JOH5r4x/rqQ==
X-Google-Smtp-Source: AGHT+IFCy4cX2g6FtcQK2HmkJSadw4C8OACfHYIQXMm6vHMHgImTy7arX0MLS7Gx9zqqNK5rsyL2IvomXDwFK7bxOBA=
X-Received: by 2002:a05:6402:5193:b0:5d0:b455:36ad with SMTP id
 4fb4d7f45d1cf-5d81ddf7fc1mr50522480a12.27.1735912464792; Fri, 03 Jan 2025
 05:54:24 -0800 (PST)
MIME-Version: 1.0
References: <20240809073610.2517-1-linux.amoon@gmail.com> <Z3fKkTSFFcU9gQLg@ryzen>
In-Reply-To: <Z3fKkTSFFcU9gQLg@ryzen>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 3 Jan 2025 19:24:07 +0530
Message-ID: <CANAwSgS5ZWGTP+A11r_qFSrjWZH_DqsM89MLiP+1VAxhz+e+2A@mail.gmail.com>
Subject: Re: [PATCH v2] PCI: dw-rockchip: Enable async probe by default
To: Niklas Cassel <cassel@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_055427_350738_03CB8BE8 
X-CRM114-Status: GOOD (  24.90  )
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

Hi Niklas,

On Fri, 3 Jan 2025 at 17:01, Niklas Cassel <cassel@kernel.org> wrote:
>
> On Fri, Aug 09, 2024 at 01:06:09PM +0530, Anand Moon wrote:
> > Rockchip DWC PCIe driver currently waits for the combo PHY link
> > (PCIe 3.0, PCIe 2.0, and SATA 3.0) to be established link training
> > during boot, it also waits for the link to be up, which could consume
> > several milliseconds during boot.
> >
> > To optimize boot time, this commit allows asynchronous probing.
> > This change enables the PCIe link establishment to occur in the
> > background while other devices are being probed.
> >
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> > v2: update the commit message to describe the changs.
> > ---
>
> Hello Anand,
>
> I tried this patch.
>
> It gives me the following splat on rock5b (rk3588):
>
> [    1.412108] WARNING: CPU: 5 PID: 59 at kernel/module/kmod.c:143 __request_module+0x1c0/0x298
> [    1.412853] Modules linked in:
> [    1.413125] CPU: 5 UID: 0 PID: 59 Comm: kworker/u32:1 Not tainted 6.13.0-rc1+ #38
> [    1.413781] Hardware name: Radxa ROCK 5B (DT)
> [    1.414163] Workqueue: async async_run_entry_fn
> [    1.414565] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    1.415175] pc : __request_module+0x1c0/0x298
> [    1.415559] lr : __request_module+0x1bc/0x298
> [    1.415943] sp : ffff8000804333f0
> [    1.416234] x29: ffff800080433470 x28: ffff42bec2e40000 x27: ffff42bec2e400c8
> [    1.416860] x26: ffff42bec1739000 x25: ffffb5bec9400e18 x24: 0000000000000000
> [    1.417485] x23: ffffb5bec93e1a90 x22: 0000000000000001 x21: ffffb5bec74298f8
> [    1.418111] x20: ffff800080433620 x19: ffff800080433410 x18: 0000000000000006
> [    1.418736] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
> [    1.419360] x14: 0000000000000001 x13: 0000000000000000 x12: 0000000000000000
> [    1.419985] x11: 0000000000000000 x10: 0000000000000000 x9 : ffffb5bec750b834
> [    1.420611] x8 : ffff800080433468 x7 : 0000000000000000 x6 : 0000000000000000
> [    1.421235] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000030
> [    1.421860] x2 : 0000000000000008 x1 : ffffb5bec750b708 x0 : 0000000000000001
> [    1.422486] Call trace:
> [    1.422701]  __request_module+0x1c0/0x298 (P)
> [    1.423086]  __request_module+0x1bc/0x298 (L)
> [    1.423471]  phy_request_driver_module+0x120/0x178
> [    1.423895]  phy_device_create+0x230/0x250
> [    1.424257]  get_phy_device+0x80/0x168
> [    1.424588]  mdiobus_scan+0x20/0xa0
> [    1.424896]  __mdiobus_register+0x21c/0x460
> [    1.425265]  __devm_mdiobus_register+0x78/0xf8
> [    1.425657]  rtl_init_one+0x7c8/0x1140
> [    1.425989]  local_pci_probe+0x48/0xc0
> [    1.426323]  pci_device_probe+0xcc/0x248
> [    1.426671]  really_probe+0xc4/0x2d0
> [    1.426989]  __driver_probe_device+0x80/0x130
> [    1.427374]  driver_probe_device+0x44/0x168
> [    1.427745]  __device_attach_driver+0xc0/0x148
> [    1.428138]  bus_for_each_drv+0x90/0x100
> [    1.428486]  __device_attach+0xa8/0x1a0
> [    1.428826]  device_attach+0x1c/0x38
> [    1.429143]  pci_bus_add_device+0xb4/0x1e0
> [    1.429505]  pci_bus_add_devices+0x48/0xa0
> [    1.429867]  pci_bus_add_devices+0x74/0xa0
> [    1.430228]  pci_host_probe+0x94/0x100
> [    1.430560]  dw_pcie_host_init+0x258/0x720
> [    1.430923]  rockchip_pcie_probe+0x2ec/0x510
> [    1.431300]  platform_probe+0x70/0xe8
> [    1.431623]  really_probe+0xc4/0x2d0
> [    1.431940]  __driver_probe_device+0x80/0x130
> [    1.432326]  driver_probe_device+0x44/0x168
> [    1.432696]  __device_attach_driver+0xc0/0x148
> [    1.433089]  bus_for_each_drv+0x90/0x100
> [    1.433436]  __device_attach_async_helper+0xbc/0xe8
> [    1.433865]  async_run_entry_fn+0x3c/0xf0
> [    1.434219]  process_one_work+0x158/0x3c8
> [    1.434574]  worker_thread+0x2d4/0x3f8
> [    1.434907]  kthread+0x118/0x128
> [    1.435193]  ret_from_fork+0x10/0x20
>
>
> Perhaps we should defer this patch until phylib core has been fixed?
>
> For more info, see:
> https://lore.kernel.org/netdev/Z3fJQEVV4ACpvP3L@ryzen/T/#u
>

Thanks for testing this patch.

This patch should have been tested on hardware that includes all the
relevant controllers,
such as PCI 2.0, PCI 3.0, and the SATA controller.
I will test this patch again on all the Radxa devices I have.

This patch's dependency lies in deferring the probe until the PHY
controller initializes.

CONFIG_PHY_ROCKCHIP_NANENG_COMBO_PHY=m

To my surprise, we have not enabled mdio on Rock-5B boards.
can you check if these changes work on your end?

-----8<----------8<----------8<----------8<----------8<----------8<-----
alarm@rock-5b:/media/nvme0/mainline/linux-rockchip-6.y-devel$ git diff
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
index c44d001da169..5008a05efd2a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
@@ -155,6 +155,19 @@ vcc_1v1_nldo_s3: regulator-vcc-1v1-nldo-s3 {
        };
 };

+&mdio1 {
+       rgmii_phy1: ethernet-phy@1 {
+               /* RTL8211F */
+               compatible = "ethernet-phy-id001c.c916";
+               reg = <0x1>;
+               pinctrl-names = "default";
+               pinctrl-0 = <&rtl8211f_rst>;
+               reset-assert-us = <20000>;
+               reset-deassert-us = <100000>;
+               reset-gpios = <&gpio3 RK_PB0 GPIO_ACTIVE_LOW>;
+       };
+};
+
 &combphy0_ps {
        status = "okay";
 };
@@ -224,6 +237,21 @@ &hdptxphy_hdmi0 {
        status = "okay";
 };

+&gmac1 {
+       clock_in_out = "output";
+       phy-handle = <&rgmii_phy1>;
+       phy-mode = "rgmii";
+       pinctrl-0 = <&gmac1_miim
+                    &gmac1_tx_bus2
+                    &gmac1_rx_bus2
+                    &gmac1_rgmii_clk
+                    &gmac1_rgmii_bus>;
+       pinctrl-names = "default";
+       tx_delay = <0x3a>;
+       rx_delay = <0x3e>;
+       status = "okay";
+};
+
 &i2c0 {
        pinctrl-names = "default";
        pinctrl-0 = <&i2c0m2_xfer>;
@@ -419,6 +447,12 @@ pcie3_vcc3v3_en: pcie3-vcc3v3-en {
                };
        };

+       rtl8211f {
+               rtl8211f_rst: rtl8211f-rst {
+                       rockchip,pins = <3 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
+               };
+       };
+
        usb {
                vcc5v0_host_en: vcc5v0-host-en {
                        rockchip,pins = <4 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
>
> Kind regards,
> Niklas

Can you check this on your end

alarm@rock-5b:~$ sudo cat /sys/kernel/debug/devices_deferred
[sudo] password for alarm:
fc400000.usb    dwc3: failed to initialize core
alarm@rock-5b:~$ sudo cat /sys/kernel/debug/devices_deferred

Thanks
-Anand

