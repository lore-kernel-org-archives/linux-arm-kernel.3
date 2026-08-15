Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F9C5C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 12:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=omHTfKpsU+DWgQY2twAMRzTMu3eHiMgDqoPsISGHyO0=; b=FLYKDfZNhNyUptwk6r97ARDawq
	y5gfVrmZW1bgl+CadMHRr/hkulSgt7LVG8kvtXExrh6WxlenivY+TpBavGtJ2jEq3SaignDGrMyF0
	TDGxeU3eGyxK+kU/I3Q6WSHg11cC6XGNNx/Q2+vJXleBLOckehzDV4ur5VMHkrTu/1fBu9osBD+wa
	C6PSK5vXpHuJcIF6o7GFT7p49WqIsz7E3NNYceYc+zUn3+wXu8mTcky+222xkPHZeN66L5Cid59Mo
	b3B7V/sJ3VqN9xz/KdfE6Fc60EXV9OCwairCEjX9Rw0dvK2OqIVna5XSzhwRWtQ90iih5jStZe+fO
	6WZgoc3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvDJV-00000003o8i-0jKZ;
	Sat, 15 Aug 2026 12:16:37 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvDJR-00000003o6n-34JH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 12:16:35 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4954b3c5cbeso1817475e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Aug 2026 05:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786796191; x=1787400991; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=omHTfKpsU+DWgQY2twAMRzTMu3eHiMgDqoPsISGHyO0=;
        b=S5U3iMPD7jMv9K4XgktVc/Hc8O2yj/ajZG7T45jkYNgtqkupFtLn3Pe11pID+FVeAF
         4onmLgZJn3aR6V88QFuI10wRaKusMuMNcBX32CqjdqElFm85owSOSPRom3S3n1k0HOVT
         AQZTQiMVE2JUusnxY+l3zEjm9+2r07+nFOTbn0w4mPFHt5zUCY8gIhlUSb7rJWSpBxtF
         Q2XOhW2W9wqs7/joDL/bUFcGkswlq+SOP3hf+NhNRizsm45Dly4bXdhzvaA4p+1XiYyK
         dM75/7D9Spg2CC7PFwe8LNqNQlA4+4N1tCEwktKaCt2b864KDhz1DnJoEHBnYZKBig5/
         STEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786796191; x=1787400991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=omHTfKpsU+DWgQY2twAMRzTMu3eHiMgDqoPsISGHyO0=;
        b=LK8FeHQ0AvJQvt4hCnYTHv1H0es5ApRS+TfLAjyC7V4zjNkp2gwV1wKV5jvp4o1Bzv
         JAgUohEb5MzRHR+p9Cc043uuLeC2DVIyErbq0NhPpVjwi7jNsUt1f8j4APYBVTsEDYsT
         +vmlmGhRjCcPWXwInHZljLGdAJ91RZvlXIovdBK/TbjNe4b+oo2ukIxU7qDw1tkCDdMp
         +PI/jslnU4ZgziZNSZybOhQa8F2rH9VHLyUDPhegBEXOjlJvkQBYOsOBZTgz/5oLM6tl
         ETQkV2Q8AIcrymYlEvYh+mUBetFFZuXruzZt3EMvwOOS7lcCVAWXNLu/mpEK3pK4x8IU
         9+Pw==
X-Forwarded-Encrypted: i=1; AHgh+Rq+KnZf5PPa4m+V2IHFq5UboZKLX5kfCAwmXZOIYcWC2tlXoW9Uecr9eT/4+jA8gX8/aURMFnDWt58aS69M0zZx@lists.infradead.org
X-Gm-Message-State: AOJu0YzTAGbZxJwrveHmolH3Rsmij7fSus7ySDEs2aRZwiJiyG8A9s0d
	ZwsUioYocrt5O8SagiX7mThUFPJjwKsUZBytVBdZGKA8OForQeXt/6XV
X-Gm-Gg: AR+sD12/4HYPdvoybNzmcafehOsAKac6/+Cwj5lZiRwBCB/FJoa9mATOhQotIgC1rPK
	abk8swCi4ZculVGmO9DioUrVd44ZCcEJFqVmjkZz7xF8iPJ1pofr1qW4kZPM4l2LzIjXse/K5Q9
	G6l5Q4YA446Ni4Wnu33AdoJjBkzeRO0nfUMC8i4YTzDj0u9aEwQIe2AGrqcTLzi8Q0cBmcIswkV
	bLTJvpkbTKXm/FqnZAzhTO4UEkAl3w9Ee9JPnkYqYu4iZ8C27DBTJE0YrL4MwyOBimO+JxLW2PZ
	q33vOeBpzeXXIbVCD6iSGnYZyk36rLkys7wftK2dgUv+85LxnKLY/HXD3o0wb/r8kaPwdZQeYD/
	3WmWtK8pOPlx5MoHN5Tit7br6cUPcaWufpeLFoImsSbrR3cQuC3tiWZ+S+awH+uOWMafzF2hUAu
	YIyZ3/9t+7K2CZER16cyfttq5vVk2GXlbRI7vQbpXuxJhKoOagbgFBQnlvjXppBxq37a7WiGckH
	bxTKMDU9U9bAK64gOZL1XPt5HW22oLqKq7UvbsAnvUmrLHfwaPiX2pZMD4hje0E49XL
X-Received: by 2002:a05:600c:630c:b0:495:7561:a9cc with SMTP id 5b1f17b1804b1-499879b1c50mr91017745e9.4.1786796191200;
        Sat, 15 Aug 2026 05:16:31 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B932600BF05B505F15B0ECC.dsl.pool.telekom.hu. [2001:4c4e:1b93:2600:bf05:b505:f15b:ecc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499899afa63sm113425555e9.1.2026.08.15.05.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 05:16:30 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Vinod Koul <vkoul@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Frank Wang <frank.wang@rock-chips.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Yubing Zhang <yubing.zhang@rock-chips.com>,
	Alexey Charkov <alchark@flipper.net>,
	William Wu <william.wu@rock-chips.com>,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v14 00/38] phy: rockchip: usbdp: Clean up the mess
Date: Sat, 15 Aug 2026 14:16:01 +0200
Message-ID: <20260815121608.64818-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>
References: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_051633_814548_4E7EFA6C 
X-CRM114-Status: GOOD (  27.16  )
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

I retested v14 on my Orange Pi 5 Plus, this time covering the phy-core
notifier patch and the new dwc3 glue patches (28/38-31/38), which do not
carry my tag yet.

Test kernel: 7.2.0-rc7, built from your rockchip-devel branch at
ea51774c5c42 ("usb: typec: mux: initialize mux switch array"), which
already contains the whole v14 series (I checked that 1/38 and 28/38-32/38
are in that history, plus all 32 "phy: rockchip: usbdp:" commits are
ancestors of it).

On top of that base I carry 50 local commits - display, GPU, media and
platform work. None of them touch drivers/usb/, drivers/usb/typec/ or
phy-rockchip-usbdp.c, but two are worth naming so you know exactly what
was under test:

  - drivers/phy/rockchip/phy-rockchip-snps-pcie3.c: a one-line fix to the
    PCIe combo PHY SRAM-init check. Unrelated to this series.

  - arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts: in mainline
    this board still has the old single-"port" graph for usbdp_phy0 and no
    altmodes node on the usb-c-connector, so there is no DP alt mode to
    exercise at all. I carry a local DT patch that converts usbdp_phy0 to
    the four-port "ports" graph and usb_host0_xhci to the two-port graph
    your bindings describe, and adds an altmodes/displayport node
    (svid 0xff01) to the connector. That DT change is mine, it is not in
    mainline and not part of v14 - so everything below is your v14 code,
    unmodified, driven by that DT.

The USB-C link runs through an Epico EC65 "UltraLink 8K/60Hz HDMI to
USB-C" cable - an active DP alt-mode to HDMI converter (GsCooLink chip,
USB VID 0x3679) - into the HDMI input of a Samsung Odyssey G70B. So the
DP link partner your code negotiates with is that converter, not a
monitor directly.

What I actually exercised, running this kernel as my daily driver since it
booted on 2026-08-14 at 20:09 local time (17+ hours of continuous uptime
when I ran these checks):

- The new glue driver is bound to both controllers:

    /sys/bus/platform/drivers/dwc3-rockchip/fc000000.usb
    /sys/bus/platform/drivers/dwc3-rockchip/fc400000.usb

- DisplayPort alt mode is active at the Type-C layer:

    /sys/class/typec/port0-partner/port0-partner.0/svid   = ff01
    /sys/class/typec/port0-partner/port0-partner.0/mode   = 1
    /sys/class/typec/port0-partner/port0-partner.0/active = yes

  driving DP-1 at 3840x2160@120 with HDR, simultaneously with two HDMI
  outputs: HDMI-A-1 to a Sony TV at 3840x2160@60 and HDMI-A-2 to a second
  Odyssey G70B at 3840x2160@120, both with HDR.

  Two caveats about DP-1, both pre-existing on my setup and unrelated to
  your series: the converter emits a broken Y420VDB block, so I feed the
  connector a corrected EDID through edid_override, and after the EDK2
  firmware hand-off DP-1 comes up "disconnected" with the cable present,
  so a boot script does one unbind/bind of the fusb302 i2c device to kick
  it. Neither workaround was touched during the hotplug test below.

- Hot unplug/replug of the USB-C cable. The xHCI host controller was
  re-registered and the DisplayPort output came back on its own, with no
  manual intervention:

    13:00:56  kernel: xhci-hcd xhci-hcd.6.auto: USB bus 4 deregistered
    13:00:57  kwin_wayland_drm: Removing output
    13:01:26  kernel: xhci-hcd xhci-hcd.6.auto: xHCI Host Controller
    13:01:26  kernel: xhci-hcd xhci-hcd.6.auto: Host supports USB 3.0 SuperSpeed
    13:01:29  kwin_wayland_drm: New output on GPU /dev/dri/card0: Odyssey G70B

  (kernel and compositor lines interleaved, abridged.) Note the ~30 s
  between disconnect and re-registration - PD/alt-mode negotiation with
  this converter is slow. After the replug the connector is back at
  3840x2160@120 with HDR.

- No messages at all from dwc3, dwc3-rockchip or the usbdp PHY for the
  whole uptime, before or after the replug.

  For completeness, the DP controller does print a burst of 32
  "dw-dp fde50000.dp: timeout waiting for AUX reply" right after the cable
  is pulled - that is the DRM side probing a dead link, it clears on
  replug and is not from your code. The converter's billboard device also
  logs one "cdc_acm 3-1:1.1: probe with driver cdc_acm failed with error
  -22" per connect - a converter quirk, seen daily on this setup since
  long before this kernel.

One thing I should not hide: I do get a WARN from tcpm, but I trigger it
myself and it is not from this series:

  WARNING: drivers/base/devres.c:1184 at devm_kfree+0xb8/0xd0
  Call trace:
    devm_kfree
    tcpm_port_unregister_pd [tcpm]
    tcpm_unregister_port [tcpm]
    devm_tcpm_unregister_port [tcpm]
    devm_action_release / release_nodes / devres_release_group
    i2c_device_remove / device_release_driver_internal / unbind_store

(trace abridged.) It fires when the boot script mentioned above explicitly
unbinds fusb302 (i2c 6-0022), i.e. on the devres teardown path introduced
by 48bf0f5f9ec8
("usb: typec: tcpm: add device managed port registration") and fcdd23c1984e
("usb: typec: fusb302: Switch to device managed resources") in
rockchip-devel. Those are not part of v14 and I have not root-caused this,
but since they are in the branch I tested I thought you would rather know.
It does not fire on a normal cable unplug/replug, only on an explicit
driver unbind.

I am sending the Tested-by tags as separate replies to 28/38, 29/38, 30/38
and 31/38, so that they land on exactly those patches.

I am deliberately not tagging 32/38 ("fix USB-C reconnect in gadget mode").
I have never used this board in gadget mode, so I cannot claim to have
tested that path.

One build issue to report, starting at 31/38
============================================

The new glue driver cannot be built as a module once 31/38 is applied.
29/38 alone is fine - the glue it introduces only pulls in module.h,
platform_device.h, pm_runtime.h and glue.h. It is 31/38 that adds
#include "io.h" and the dwc3_readl()/dwc3_writel() calls.

Reproducer: ea51774c5c42, arm64 defconfig plus CONFIG_USB_DWC3=y,
CONFIG_USB_DWC3_ROCKCHIP=m, CONFIG_TRACEPOINTS=y. The build then fails at
modpost:

  ERROR: modpost: "__tracepoint_dwc3_readl" [drivers/usb/dwc3/dwc3-rockchip.ko] undefined!
  ERROR: modpost: "__traceiter_dwc3_readl" [drivers/usb/dwc3/dwc3-rockchip.ko] undefined!
  ERROR: modpost: "__tracepoint_dwc3_writel" [drivers/usb/dwc3/dwc3-rockchip.ko] undefined!
  ERROR: modpost: "__traceiter_dwc3_writel" [drivers/usb/dwc3/dwc3-rockchip.ko] undefined!
  make[2]: *** [scripts/Makefile.modpost:147: Module.symvers] Error 1
  [...]

dwc3_readl()/dwc3_writel() call trace_dwc3_readl()/trace_dwc3_writel(),
and the dwc3 tracepoints are not exported - there is no
EXPORT_TRACEPOINT_SYMBOL* anywhere in drivers/usb/dwc3/ - so a separate
module cannot reference them. With CONFIG_TRACEPOINTS=n the trace_* calls
become empty inlines and this should not trigger; I only tested
CONFIG_TRACEPOINTS=y.

dwc3-rockchip.c is the only glue driver in drivers/usb/dwc3/ that calls
the core's dwc3_readl()/dwc3_writel(). dwc3-st.c also includes io.h, but
it reads through its own st_dwc3_readl()/st_dwc3_writel(), and e.g.
dwc3-keystone.c defines kdwc3_readl()/kdwc3_writel() - though those all
access their own glue registers, not the core register block.

Two ways to fix it, whichever you prefer:

  - EXPORT_TRACEPOINT_SYMBOL_GPL(dwc3_readl) and (dwc3_writel) in
    drivers/usb/dwc3/trace.c, or
  - open-code the access in the glue, e.g.
    readl(dwc->regs + DWC3_GUSB3PIPECTL(port) - DWC3_GLOBALS_REGS_START),
    at the cost of losing the dwc3_readl/dwc3_writel trace events.

I worked around it locally with CONFIG_USB_DWC3_ROCKCHIP=y, which is how
the kernel I tested above was built. Note that "default USB_DWC3" means
the glue follows the core: with CONFIG_USB_DWC3=y the default is =y and
the problem stays hidden, but with CONFIG_USB_DWC3=m the default would be
=m. I have not build-tested the CONFIG_USB_DWC3=m case. The Kconfig entry
added by 29/38 does promise "Say 'Y' or 'M' if you have such device."

This reply was prepared with the help of Claude (Anthropic). The board,
the tests and the measurements are mine, and I checked every claim above
before sending.

Best regards,
Igor

