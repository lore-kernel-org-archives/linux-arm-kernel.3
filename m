Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11DB9C44539
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 09:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UxNgVJhMvwFWg/2Me6o/CdOE7h6LMTECv+bVDJcfX3U=; b=Q12bz/koJIHSCL1+ezwmzMIcju
	XGHmyHMOMMqSqHwo3lkjWFBzANLZ7b1jF+358WCt4Xvk5CV7X2hssIX5g66tAle52nIrqXymFdC5g
	xNL7VPpoveq+mEOcgpf/mUKifP6ALnGUUeRR9MnYWbe1/rFggPw5eKMAOuvsuGkmcGvmIqQVQSFCB
	SeXWhz2nIBRMVdhZqCl5MRtQMFwKmrLD4eS06rSJylJPpOw1sJ3agPNEC5QVS1wsv3f88SpwRCwaq
	5v39rUE6DVxZZeUJsNPNxC/GAuQ30t4x3GXfcfGQKnoc86Gdte2O0XGORJik+bxUwtsAmY1aEmRv7
	ZOUSKB4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmTEo-0000000BPVH-3zrC;
	Wed, 22 Jul 2026 09:27:38 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmTEl-0000000BPUU-3l0q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 09:27:37 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so94609985e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 02:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784712454; x=1785317254; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UxNgVJhMvwFWg/2Me6o/CdOE7h6LMTECv+bVDJcfX3U=;
        b=Ybb16VzAgWXZNPCtWeZX3uU+7VFI0eQlkgPwWS3JB6s4Qx/A4sSE/tXNCtRFodqSBD
         RGQDk4BvZhOIstlS81rIygjZaBE2WzEiTz4zWHbh3gzSbyxGxW5zACgyG+mxJTsCfjlg
         aB1aABAmPAAZqK0WJWdmUi3PgkE1wmf7eariri3+7m6rc8GHLCx7aRMNeSEMGX7w0csh
         xlD15vGpjdCiLd9S6YDJOaQl0Ci5MRsqTKFAiiSw3m2xuN1LbNIeElCfAzzdq0gG/Tq2
         LCvCy3+TbgtuuTCcY5AGMRqvuuOSD7zXKIHtpXG+EfYZ9WMA1hqyaJjZLHL3PQnk55GX
         OmJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784712454; x=1785317254;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UxNgVJhMvwFWg/2Me6o/CdOE7h6LMTECv+bVDJcfX3U=;
        b=tLGtQXWolhlC4JpRzFakQttUjm9PVAJETTu8ANYQji6nZerrBq4aHI06sUW5U+ik3Z
         ebLk7FFl3I1F54KH1WcNEqkSRBYg1RsWnVvt4db673lXv4j9wNvuJ/QdI61oE47G9jyM
         1SA/4vigfSp2mIzGW2rlcXer4JCVfc7nmB9YhsLJzFP43AeSwLa0HagGSdZuF9XHY4Ol
         gY8M+ixQtsx5492fGxBsDmauBE8VatelFXpTOUh/26WzCJHWXB5JNwBS/Mff7C6BtxUS
         Y0UFLqmIO0pJSPtdSSDSWmJ8frEzayvIoueOLd44F4iIURNkoimVbrc657XBjbY+y0V3
         AtKg==
X-Forwarded-Encrypted: i=1; AHgh+Rom81G5C4JTDK+p4MIpnCntBghBIZy/bfRNQRFI7Y2zVL8yeT+SeBNXtRUzZI+5xjY/qqxXZQ0IHqFOWFXgQ/lK@lists.infradead.org
X-Gm-Message-State: AOJu0Yz//xgHQ3pnFus9Cbq5JKnmd4iQiI6LrTFsjxJNrHZUe2NxvXiB
	ZK8Lg+xQS9z21q+moK+/eg5DxC1HwfSl8exgD7l7PszNvMn/hoIzm702
X-Gm-Gg: AR+sD12PZb4DO3YKFFKfs6sj///lvxNE9C/KDC/+GNCpu9YOZS21i+uQl8gKLo5dSTf
	I2bl1ShTyB2raNSb/ANoKagkTAZmPa5NYxRiPT0hhhrAisdOnImmv8IzYpj2oHPXiM4D2t76Q0R
	iCr3AqsDeSJvv3ocrDL3C8ij/Nrkd66/gYNMj5+9Aqvjn4jTmhjSn3FRCqxT80l2dXfH/6zYZrx
	HjIJtDkFjK6MmtzNJBrS/DefevriBvnlPPwqt8IVmFqbEc6TCflvOduaqf4GtHOzuTrbzPAjkMR
	iqHovKX5pvZEliqUG+PkdDSL8UkMCrdIKR2/+4N5oGVL7s4p9YMfDJZynv5vwuu1QCyiT36qxx/
	X+p7P9j2XZ+gExeiLComlA/MRpmIYOq2+nvdJolcYydUgokV0Y9S0ZMrdngdtGDymORQRCnu1DK
	8Ejo7Q2Kpm+MDeC1cAJPmf+A0g4Ea3Swj4RVMhxA3TaiUswSPMbL/QeC/r8WCSYNCx7c0ZUuRbT
	aA/pQ==
X-Received: by 2002:a05:600c:350f:b0:493:e365:ace9 with SMTP id 5b1f17b1804b1-4954a3db7e8mr245764085e9.11.1784712453569;
        Wed, 22 Jul 2026 02:27:33 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956a4f2453sm59985695e9.3.2026.07.22.02.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 02:27:33 -0700 (PDT)
Date: Wed, 22 Jul 2026 11:27:32 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Francesco Dolcini <francesco.dolcini@toradex.com>, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH 6/8] arm64: dts: freescale: imx8mm-verdin: Add Toradex
 OV5640 CSI Cameras
Message-ID: <3ak4ffamwvdrtgw3bivzvrbtkmyh7g3lvuk4xwvdiuzizi3iu3@uxqvyif7rvpx>
References: <20260713-v1-verdin-imx8mm-dtbos-v1-0-4acd63db4504@toradex.com>
 <20260713-v1-verdin-imx8mm-dtbos-v1-6-4acd63db4504@toradex.com>
 <al5mDqeFE8QVbUd9@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <al5mDqeFE8QVbUd9@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_022735_954343_311A6231 
X-CRM114-Status: GOOD (  19.65  )
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

On Mon, Jul 20, 2026 at 02:16:46PM -0400, Frank Li wrote:
> On Mon, Jul 13, 2026 at 05:06:27PM +0200, Ernest Van Hoecke wrote:
> > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> >
> > Add device tree overlays for the Toradex OV5640 CSI Camera on Verdin CSI_1.
> >
> > The default overlay describes the current CSI Camera Set 5MP OV5640 with a
> > 27 MHz on-board oscillator. Add a separate 24 MHz overlay for the legacy
> > camera module.
> >
> > Link: https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
> > Link: https://www.toradex.com/accessories/csi-camera-ov5640
> > Link: https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
> > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > ---
> >  arch/arm64/boot/dts/freescale/Makefile             |  6 ++
> >  .../dts/freescale/imx8mm-verdin-ov5640-24mhz.dtso  | 17 +++++
> >  .../boot/dts/freescale/imx8mm-verdin-ov5640.dtsi   | 78 ++++++++++++++++++++++
> >  .../boot/dts/freescale/imx8mm-verdin-ov5640.dtso   | 18 +++++
> >  4 files changed, 119 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> > index c465aa19e526..ed3d678e7c5e 100644
> > --- a/arch/arm64/boot/dts/freescale/Makefile
> > +++ b/arch/arm64/boot/dts/freescale/Makefile
> > @@ -189,6 +189,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-mallow.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-yavia-dsi-to-hdmi.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-yavia.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-zinnia.dtb
> > +dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-ov5640-24mhz.dtbo
> > +dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-ov5640.dtbo
> 
> Need not add dtbo here,
> 
> +dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-ov5640-24mhz.dtb can
> auto dtbo build dtbo.
> 
> check other dtbo.
> 
> Frank
> 

Hi Frank,

Thanks for the review.

Our desire is that these dtbo's are standalone targets that are shipped
for runtime overlay application. Users might, on dev boards especially,
want to enable or disable any combination of these overlays, and change
the combination between boots.

The combined dtb targets validate the overlay and in some listed cases,
provide a ready-to-use combo. They are not intended to cover all
possible use-cases.

My understanding is that indeed a dtb-y targeting a combined DTB will
build the prerequisite dtbo, but it would not be an install target.

Kind regards,
Ernest


