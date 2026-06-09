Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA393CD8CAA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 13:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B8ybc8eEm2l2UXbUIsilP7Qkz+jgaPmO0vHKofujiXk=; b=vyKYW7ZOUmKskf7GYlKa89pGUQ
	rQhFwyJSKHGohVYn344r48FsYzjp3LVVGa8C2bUMO8mOYrZUBnlfNGHMx+KZu5nd2K0qYXEj0txGI
	lwzLFPzyj6h8IPDifutp0fVcvh4l2GmQp+lFCxbiEEjp4L2VYYgHaJHQ+hMRuk6OWlx2+wxbTk61M
	0Uad2GYcQtpsMOEI9px4TgX0GxnWL5p6sIDP3m+oPTsjDPNT8dzhPyuppDGbHUtxNfX1MFraaQvel
	15EPi/hkZM7tdhG5fGFvcxZ9TkH8ANcRlLtwQj4VksPgKI6IPDpYEM1A+Z0qDwtb2xeiQtqqVzWs5
	sLNVodug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWwou-00000005hdr-3sKW;
	Tue, 09 Jun 2026 13:48:44 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWwor-00000005hdT-2WKa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 13:48:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781012920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B8ybc8eEm2l2UXbUIsilP7Qkz+jgaPmO0vHKofujiXk=;
	b=DqoT66hkkBUElVsppNPn++GhrIgprm7k8LdkxxrJ9+ofSGWOWVZZoO5zOMcQYdzElqJtGE
	zCtdLOnfDuNCKdzatpPeg3mN1JUsoKTQglJrkiy1ggaoi26rO407nwv65MN5iv/9xIvFAT
	9L2c8RdfySiHYtEQe5BaMC9e760yz3M=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-83-Hil9KHTBOX2RNf-f-HUT0w-1; Tue, 09 Jun 2026 09:48:38 -0400
X-MC-Unique: Hil9KHTBOX2RNf-f-HUT0w-1
X-Mimecast-MFC-AGG-ID: Hil9KHTBOX2RNf-f-HUT0w_1781012917
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-396a8df57dbso3805531fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 06:48:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781012917; x=1781617717;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B8ybc8eEm2l2UXbUIsilP7Qkz+jgaPmO0vHKofujiXk=;
        b=INS266nfNZq6Dckf0QKMT1rlG8X3LeX6waL/l9Ml74CmN+1b6QN/+zlrUiaa36bAzz
         i9KIE+qh4bAJ3G/SaEFyWnmgfTS9f8dWqwOFVdibOBP2EqQkueIuYkF4429hyXNUjQ29
         lecf35/MoTNzj81sKIiOGfx2XeAO1uEQxfYCz1SAFcootdxY2HImG5DgXxAkOT5Pw8Np
         FbZueD+45UxWJEFagDSYzyWV/LO0k4/z621ppb4sHBQC9qKvjERGKVTr7MLHKXNqeGrN
         jdFddIv0K+gyEl96e4qCjEpvWiND7kWNgFvFyqQcmI+PoZIHJY/StNBLVEQIZ+CP5V8Y
         Bc5w==
X-Forwarded-Encrypted: i=1; AFNElJ9n9Pnki344MdNIJl0vm5TFQINkTY7Oq41ZJytP4jClu/wki+o2l674S1XphRm+aUhzzMbH9zHqcBjgROtO/Db9@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0Y13WfTtqw1qKoHMdMQ/MD2W9SqdXRz3xsC9vk4WtYHmgVmmL
	SuM+sJz1bZgh7EG8pi4bhhpdFD8zEM5dym7DP63H3tScD4pihKvZFOaatrFzk+hp5tB0ui5GtHu
	4lyoNDw360h1JxDh74iYsLlBcCqAAdxGGu8Acz/EJ/HdpapWPdbEy792MvwmzSDe8EuKrpMUkis
	Gny/KuA6HbZL3nldeqWsdYJw4k5yDKVJpfB9iJXRSfRFftWNUOj6k=
X-Gm-Gg: Acq92OEU5LWSLNQ8tREy13jWrPjwzlP1bjn0FCsqroJT79iEb2Rb9QuegWrsmsqvan9
	lNID0O0RFSxfB5N1t8HlbKDSnr8ktiYHc6tq3D7TGSclK3NOJRcnFcfGhwF6rZ0RXFFXRfnGewD
	Hq0z1AebnCncbk/Tl/0d3PykQSnh3eL4QqsfldFlC30vINVOrPZ6MZISjlCf2FykhYfs/6i5mSi
	G/yHMaz40rDIWcI
X-Received: by 2002:a2e:ad12:0:b0:396:8d4f:573d with SMTP id 38308e7fff4ca-396d0870a2fmr26107441fa.4.1781012916531;
        Tue, 09 Jun 2026 06:48:36 -0700 (PDT)
X-Received: by 2002:a2e:ad12:0:b0:396:8d4f:573d with SMTP id
 38308e7fff4ca-396d0870a2fmr26107251fa.4.1781012915884; Tue, 09 Jun 2026
 06:48:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260520151007.4193688-1-khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <20260520151007.4193688-1-khristineandreea.barbulescu@oss.nxp.com>
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Tue, 9 Jun 2026 15:48:24 +0200
X-Gm-Features: AVVi8CeBgvu_FxTeu_WpMekXBVDp5tn5JH9vmX9Kfgdgwq-5WsR-GNlc1P-phzU
Message-ID: <CALE0LRufn_ZRtscVxoZkHdNFdjWpyBeRkeongDRE8NGmPCskJA@mail.gmail.com>
Subject: Re: [PATCH v2 0/1] add USB PHY node and USB OTG pinctrl support to
 S32G2/S32G3 SoCs
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	NXP S32 Linux <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qZZ2qFn14lgjaTZr014K8gNrC-MmdnScvv4xX5LhfDk_1781012917
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_064841_731892_29E02991 
X-CRM114-Status: GOOD (  15.49  )
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

On Wed, May 20, 2026 at 5:10=E2=80=AFPM Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> wrote:
>
> This patchset aims to add two changes to the S32G2/S32G3 dtsi support:
> - Add the usbphynop node for S32G SoC based boards
> - Add the usbotg pinctrl support for S32G SoC based boards
>
> v2 -> v1:
> - use hyphenated naming for USB OTG pin groups
> - replace deprecated 'fsl,usbphy' with 'phys'
> - move 'usbphynop' node to the SoC-level dtsi
>
> Khristine Andreea Barbulescu (1):
>   arm64: dts: Add usbphynop and usbotg pinctrl for S32G platforms
>
>  arch/arm64/boot/dts/freescale/s32g2.dtsi      |  7 ++-
>  arch/arm64/boot/dts/freescale/s32g3.dtsi      |  7 ++-
>  .../boot/dts/freescale/s32gxxxa-evb.dtsi      | 46 ++++++++++++++++++-
>  .../boot/dts/freescale/s32gxxxa-rdb.dtsi      | 46 ++++++++++++++++++-
>  4 files changed, 102 insertions(+), 4 deletions(-)
>
> --
> 2.34.1
>

I tested the bindings on my S32G-VNP-RDB3 board by connecting
different devices (mass storage, mouse and
keyboard) in host mode and got them working, so

Tested-by: Enric Balletbo i Serra <eballetb@redhat.com>

[   32.957280] usbcore: registered new interface driver usbhid
[   32.957285] usbhid: USB HID core driver
[   39.683065] usb_phy_generic usbphynop: dummy supplies not allowed
for exclusive requests (id=3Dvbus)
[   39.945747] imx_usb 44064000.usb: No over current polarity defined
[   39.999412] usb usb1: New USB device found, idVendor=3D1d6b,
idProduct=3D0002, bcdDevice=3D 7.01
[   39.999422] usb usb1: New USB device strings: Mfr=3D3, Product=3D2,
SerialNumber=3D1
[   39.999429] usb usb1: Product: EHCI Host Controller
[   39.999435] usb usb1: Manufacturer: Linux 7.1.0-rc4+ ehci_hcd
[   39.999440] usb usb1: SerialNumber: ci_hdrc.0
[   40.575296] usb 1-1: new high-speed USB device number 2 using ci_hdrc
[   40.747558] usb 1-1: New USB device found, idVendor=3D0781,
idProduct=3D5567, bcdDevice=3D 1.00
[   40.747578] usb 1-1: New USB device strings: Mfr=3D1, Product=3D2, Seria=
lNumber=3D3
[   40.747585] usb 1-1: Product: Cruzer Blade
[   40.747591] usb 1-1: Manufacturer: SanDisk
[   40.747596] usb 1-1: SerialNumber: 4C530001310712110235

# cat /sys/kernel/debug/ulpi/ci_hdrc.0.ulpi/regs
Vendor ID Low                24
Vendor ID High               04
Product ID Low               09
Product ID High              00
Function Control             40
Interface Control            08
OTG Control                  27
USB Interrupt Enable Rising  1f
USB Interrupt Enable Falling 1f
USB Interrupt Status         04
USB Interrupt Latch          0c
Debug                        00
Scratch Register             00
Carkit Control               00
Carkit Interrupt Delay       00
Carkit Interrupt Enable      00
Carkit Interrupt Status      00
Carkit Interrupt Latch       00
Carkit Pulse Control         00
Transmit Positive Width      00
Transmit Negative Width      00
Receive Polarity Recovery    00

# lsusb
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 001 Device 002: ID 0781:5567 SanDisk Corp. Cruzer Blade

Cheers,
  Enric


