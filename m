Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F1ECD3427
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 01:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ndBvHQLM7mxv7AI6ROioxLQwc2Wuc+XafAFB+8LwQTA=; b=uKqzl5pbj8gf3hsauy7xzR1mfr
	q6zXVhX7HRltB133ceeQFY7z5h/gJYcMP9cChktTAnwkYyf5x2o548Y7WbuDMJWb9CNm/PrnmkQdg
	t15TJirF9FCMyF3dOqfUACKJoOaPULS0ZPAcsAujD/7Zqb5WaxMG/C/705DKOaCrshrQ5GoJLDCJU
	MwUeTQMe4rzR7SK2k8+wb0gZQ8TR6doT43sHngOAoHIydBs7KHGrrj9UdUEYq4U5o1AAqmyKRZUym
	nO9uNLXXFHdW8OSGXWvC6G+YWARH9p83l0+mxkiM2RzfA90JZtot4cNQXMmjH/82NHhPyrOpRJCxM
	c56u94Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMFhV-0000000BzBI-2BOy;
	Mon, 11 May 2026 01:44:53 +0000
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMFhS-0000000BzAj-1OPk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 01:44:51 +0000
Received: by mail-vs1-xe2b.google.com with SMTP id ada2fe7eead31-6314d2e31d6so624072137.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 May 2026 18:44:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778463889; cv=none;
        d=google.com; s=arc-20240605;
        b=Q1mmQQ8LkZCf8e/qw/9luT0r8BoabFzBCLvRl5NFWPl6RbZWinuMKaV39PVvJqe3dp
         BfhVM0qMfrEdMC/c3edAwe9z17QH7+GuXtUvLnsmmRoWPqut3gKpA24xAb+5AUpmnRBf
         67Ajr1/eBIYqkzd6/0+vZ1qIBNriy3dmEzibSWoeP7J4mP8nbmUUheeh4TVKuNQ7n333
         U5ql2AQlNirAPXMxYSVDzzvlSDjA2EHojHrhZ2ptonmvcubjg/eKEsNaC7mputrxLeo4
         h1oUeU5U28WxUZ398JqzF1MnOC6/MGFKzZ1A1vOIoH9/ANA9bD+UQhZaTZU4ZbRU2iXx
         BVSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=ndBvHQLM7mxv7AI6ROioxLQwc2Wuc+XafAFB+8LwQTA=;
        fh=zHBg626qDiltHzpvuqLkTOOd9/TpYT8j27+6z1UVtvk=;
        b=kMs9i+eQyx5n/ymEsoR8a7RshRTgZTfSTK417veTIuqQTolleiNkDmRXI754nCmHap
         BB+Zd3gnlHoKkXkQEeIwaDLTIlaJkISbOSwPayW35odXokzsdzFDeEo6TRc0SwQMHx/w
         V01uSp+/1VfqK0ycKB56wydK11DzEfWmPNUesVeKMNora8YpavGZ2+PXuSvBLar8iBx1
         7fj86cIL5OAuZPdTJ0IapMi8GekrWEWcUBcs9CmAI4Y86C7fmxP4xYPGQ5jyoW4Rncdg
         MHe2RCsb5t2XQxbidcjJBNe+KyInihHTNKrdklfjwzHA64SRuCQaeNLhk+IagKq3ufdH
         PXwg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778463889; x=1779068689; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ndBvHQLM7mxv7AI6ROioxLQwc2Wuc+XafAFB+8LwQTA=;
        b=nd2W3stW5EQsO2wkvD6ipxCX8vCFrNvD/zplpDAlxuH7pF5UTe7SDpB9mhSHzxUDNo
         M8aTpk9son6lSj27sgr0AJ4XQgpCPOzwaJJFLvS0giZTYwJTyheaW83vaiiVe9PkEz3P
         yo37p59t/1ivlSBX066aERJiTT4zdVx+JKxYpQsUgN/ruo0GyI6O+sLC2M8W+4J27Tkr
         iXjCJzkvPIGN0c3wki9TBVuU97cvG6HektKgO/kVQ/zGdmoC0TXaRXhlFHigIa58FHbQ
         NR8BLjWLpK/IEAd4Gia/YTF90PwOsfr/+7lHi6yppRg13KikGOjB8K4lZ6b1laUHYDQF
         mJHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778463889; x=1779068689;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ndBvHQLM7mxv7AI6ROioxLQwc2Wuc+XafAFB+8LwQTA=;
        b=MJLV4e+8swXUI0HiRVf0GIEmJFok5+wMwiG5KhCcqqzdz08XZ6Jag1Z2pTCknCprJ7
         Tbbw1cIk1QgrEHTCGROQIzP/hXYGKfwh0fAUXfgUE0X0JYg0bj70nOW5mAxascS5HRWO
         cv6r8L06x0BlA1tZvHvBAbABUmJB1LO1j9tCmEaC9SkY/fvK+WZ+Yp7t6WelIXOoqzOE
         xlm3Lcuvgy+DftAZo7O5jvf3eCc1747iwsd3sPsRm/0AIJSmOSQjYrzc4i9eFpyf8bpv
         jK/l6+Jwbgt3YgJm/0K0vrYK8u/SLD+otPhhN1/H5OpjShxUxaOAnLT22YbsjazLoMfK
         IbUg==
X-Forwarded-Encrypted: i=1; AFNElJ+8lPmVtThHiINm5ZS8RWrx05n43b8eJySIViMVu2REKYFEumgunVp0vhSQM3UYIonGgr4bxghwZjucBnPlHhtK@lists.infradead.org
X-Gm-Message-State: AOJu0YzSiDaTCka7G/v9h/rSeEol/+DrRNw2Nf87dpse0UJK2mMt+x+Q
	Lhj9N7tB4mIeKh55o24JpH02XABkjzhphDqCuBJReF/sY4lC79wRhja96mnedejgUlNSDSpZtHV
	znoV0MXwzu/Tak9qUFsrj39YLSMONwPK0XGKeVg==
X-Gm-Gg: Acq92OFNa3QsMFSffI3s8A5bg/xM3m1VMFC16PP+4D/sRE4uY7aXix1KANmRUyFGb+u
	sXvBb006U93lCCy5oTHBtneYQB23MIaiSuE9W12aDva6zENW6HKsFM1l2gbm1OvdON1gS5gp7go
	YREuyyvKxiOS4h9Oe3O866C/uIljf4BPVXbKtzq0KMGkIdutLUijm7hS6s26kM+KWyO1Mdl2u4l
	yqqMrwyeiFZmeho747V/pyWpgHgnyca/r4fnnCavyInxQTOYF/fyATRiHYWWW27PpQa4QNb31IU
	yfBLFQ==
X-Received: by 2002:a05:6102:54ab:b0:62f:3cb7:8652 with SMTP id
 ada2fe7eead31-6313e9f142dmr4833089137.13.1778463888492; Sun, 10 May 2026
 18:44:48 -0700 (PDT)
MIME-Version: 1.0
From: Yixiang Xu <m992364136@gmail.com>
Date: Mon, 11 May 2026 09:44:37 +0800
X-Gm-Features: AVHnY4JPopboAW_Ec2owylTnIzbk88ztgfT9KyTE8i92NLZ8aDYkHduXSz8eaOc
Message-ID: <CABEbnPHhbdq2mrnWUbs=FWMeO01qh_AQTzRwMbhvia128rQfVw@mail.gmail.com>
Subject: [RFC] media: sun6i-csi: V3S parallel HREF/VREF polarity mismatch with GC0308
To: linux-media@vger.kernel.org
Cc: Yong Deng <yong.deng@magewell.com>, 
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_184450_387605_E3BC5388 
X-CRM114-Status: GOOD (  15.54  )
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

Hi,

I am debugging a parallel DVP GC0308 camera on an Allwinner V3S board
with Linux 6.8.12 and the mainline sun6i-csi driver.

The sensor probes correctly and the media graph is created, but the
captured frames are invalid unless the HREF/VREF polarity bits in
SUN6I_CSI_IF_CFG_REG are forced to 1.

Hardware / software setup:

SoC: Allwinner V3S
Kernel: Linux 6.8.12
Driver: drivers/media/platform/sunxi/sun6i-csi/
Sensor: GalaxyCore GC0308, parallel DVP, UYVY8_2X8
MCLK: 24 MHz
Bus: 8-bit parallel

Relevant device-tree endpoint properties:

bus-width = <8>;
data-shift = <0>;
hsync-active = <1>;
vsync-active = <1>;
data-active = <1>;
pclk-sample = <1>;

The GC0308 sensor side works:

I2C address 0x21 is occupied by the kernel driver

the sensor node appears as "gc0308 0-0021"

media-ctl shows:

gc0308 0-0021 -> sun6i-csi-bridge -> sun6i-csi-capture

the sensor source pad is set to:

UYVY8_2X8/640x480

With the unmodified sun6i-csi polarity mapping, the driver computes:

IF_CFG=0x00010000

That means:

bit16 PCLK = 1
bit17 HREF = 0
bit18 VREF = 0

The resulting captured buffers have the expected size, but the contents
are not valid image data. Typical UYVY/422P dumps look like repeated
single-byte patterns plus zero-filled tails, for example:

e8 e8 e8 e8 ...
d1 d1 d1 d1 ...
84 84 84 84 ...

As an A/B test, I forced the parallel CSI IF_CFG polarity bits to match
the old Allwinner BSP behaviour:

value |= SUN6I_CSI_IF_CFG_CLK_POL_RISING |
             SUN6I_CSI_IF_CFG_HREF_POL_NEGATIVE |
             SUN6I_CSI_IF_CFG_VREF_POL_NEGATIVE;

This changes the log to:

IF_CFG=0x00070000

After this change, the captured UYVY data starts looking like real
U/Y/V/Y data, for example:

80 16 80 16 80 15 7f 15 ...

and the frame displays correctly on the LCD.

I also compared against an old working Allwinner BSP for the same board
and sensor. The old GC0308 BSP driver uses:

VREF_POL = V4L2_MBUS_VSYNC_ACTIVE_HIGH
HREF_POL = V4L2_MBUS_HSYNC_ACTIVE_HIGH
CLK_POL = V4L2_MBUS_PCLK_SAMPLE_RISING

The old BSP path is known to display the GC0308 image correctly.
It effectively programs the CSI timing/polarity bits as 1 for
PCLK/HREF/VREF on this board.

This looks related to the existing comment in sun6i_csi_reg.h:

/* Note that Allwinner manuals and code invert positive/negative definitions. */

and also to the previous discussion:

[PATCH] media: sun6i-csi: Fix incorrect HSYNC/VSYNC/PCLK polarity configuration
https://www.spinics.net/lists/arm-kernel/msg771128.html

Parallel Camera Interface Timings, Signal Definitions and Polarity?
https://www.spinics.net/lists/arm-kernel/msg771862.html

Question:

What would be the preferred way to fix or represent this?

Change the sun6i-csi parallel HREF/VREF mapping so that
active-high hsync/vsync sets IF_CFG bit17/18 to 1?

Add a V3S-specific quirk for the parallel HREF/VREF mapping?

Use a device-tree workaround by writing:

hsync-active = <0>;
vsync-active = <0>;
pclk-sample = <1>;

so that the current driver computes IF_CFG=0x00070000,
even though this contradicts the GC0308 BSP/sensor active-high
description?

Is there a better way to distinguish HREF/VREF semantics from
HSYNC/VSYNC polarity in the binding or driver?

I am not proposing the hardcoded A/B-test patch as an upstream fix.
It was only used to isolate the issue. I can provide dmesg logs,
media-ctl output, raw frame dumps, and test additional variants if that
helps.

Thanks,
Andrew

