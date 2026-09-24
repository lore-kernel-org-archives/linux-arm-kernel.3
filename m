Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3013C98318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 15:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ni9MwLgYZlL3v8+dEAMfhbtgbNrk2WDN56GHtl6Py64=; b=FHlr6zRau3ndgOqPqx2jBNg8yM
	T51mI/ByUxv5PzmSHewWtWcFgSY8Y/Qa4afa6c9gMK9Penj3YiHcKQvkq2mNbnxj4aB6k/RKJ14pD
	SJ+KqQq0AchrZpJD0W/xRD/MAkuElGFKEMxh3PGeUPH59KpS81iPONbMZlrZgHincuj285+yYxvC7
	Hwp98Z6RG1WihJEfMeYjfNKela1+84FHE9uEijPzKJ7l9mD8weWC2Cbuy8vpa5TqhtGkzmaXHd+eN
	rFf7hzf2oGydNNNp5tLPE+JFqCrFE3QKp+nGnDlRRMiL/DAPW7gSjLPeQ9IS6E1x8C4AxW0zYhdxe
	5BwszH9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lhN-0000000BTyQ-0t7r;
	Thu, 24 Sep 2026 15:49:25 +0000
Received: from mail-ed2-x10.google.com ([2a00:1450:4864:33::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lhK-0000000BTxa-3WXB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 15:49:24 +0000
Received: by mail-ed2-x10.google.com with SMTP id 4fb4d7f45d1cf-6a9adea43b6so6046a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 08:49:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790264961; cv=none;
        d=google.com; s=arc-20260327;
        b=A777E1gixTKNBzAZ9hWPvtK3tU8qQy6Oss7LMqROvrXo3ky5F0hCL8z18ru1uwFKhB
         r2c36JIGUyIWKwk1Xu1MhRACsMhuwTlHa2JP/jj7vg2hRDP7Vh+Jv1c/FlPqjbuo26E6
         JnUQFH0oJaTqQ8B7CES9EZP+DnckkrpoHwdyWGoZLOlJ4HYe6hl/qFDaVztuFXnxNOzJ
         d/dtxN8595UbV9LISyYBxeW595FDoNC2jq8xCamtENbimDE4HlDqrRqC+4/oXQqDlZm7
         g+2+bULyrh3gLToyaodMdMXu/112Z4D9nOFJ3OTE0G+s285WxDn+Em9Jn3rv3z+lHIXS
         t7dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ni9MwLgYZlL3v8+dEAMfhbtgbNrk2WDN56GHtl6Py64=;
        fh=C0gZ58wPuD+goDXikWNZDj/JHOiMyS3a4rPC3cClxj8=;
        b=S4gq6ul9NSCKiD9ow9fXBrrH/jukbsVANPc9B1PHgvj6WFAYwwA9vo9n+ztxYJEU6P
         otccmnc4oc0epW7FHFwqPDmd8VNJvzvfP8pXbaX1jI52Bh64fRxkWCAtQ5SYg/tNWj4b
         JVS8d1adv+dgpM3/4L/ZRE51D99ROrL+9nEZsqxPS9ePqAncfSH9EicIe28dR5JUL2hz
         1JY7N7K9A3JFk3QHUAdOknrd0bxTykv35a97fPTsyUSkgdEuqYkueMhf0HxNkC7q6HIR
         Ih2gtAdzMkkgK45UO6JmFTbXeLn3Jbpr5P4rE0vYuCLFEUKxW/8OyrvbdVN37bwOdI+G
         549w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790264961; x=1790869761; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ni9MwLgYZlL3v8+dEAMfhbtgbNrk2WDN56GHtl6Py64=;
        b=dI1lQYrPj75bbC4RWawBIL4pBZTyTOpi5SgNjAdvPmPMg1tLli6P2hsVyll+vLhbAl
         GRBcFmNnf2plNme3A8U+x0ddM3oz3d8TFGsI30vS4Z/vVCsYlx4of9Yvp078CBLOT57c
         7SxX8lZQEesoh0VaaCCYKmQSIqdobwH/iZOZZ8VB9C9YhZ2TxN8LH5czR5Mz50NSK3Ni
         Qa4bn0mIEQxjHqJlFe2pUa/izQGgE5BXWqOYruxw7FyWFTTlANPEbJnE9okHqARNXguH
         9ULwPQELLTHY7eGQPsLObjckbFRQ591Uchm1gCybqSS0SBUy4Spu3cDaf5TaExDHZAhU
         s/Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790264961; x=1790869761;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ni9MwLgYZlL3v8+dEAMfhbtgbNrk2WDN56GHtl6Py64=;
        b=S1wcbJWKNtFlHd/y7P+dP9iai2m4Fqn04B04z+bKCb9Gb5e7AcLTbRoY+1UT6euZrw
         vD9vG4KY0xqxdUKUUsdes/zNAuFXRxrMdM93hOPpybjtrfkWer9W6D6a0mxqCXp+/im1
         i26269b0huQ3wTtr2CDweW80H0DN/+oHpqoRcnEeSzb252f/KnUl11JX04rEjr6RgInS
         MjFQUj8c7yx4BxryQgPtSBM9vWooRIpAEhLg+JFl0+wtY2dbJfhqS+LxMqCBesCH23V5
         WBT8XtpHJ9F+yVk71icqjZvMnTst+4Gd97X03vZsi5lxVaB2A29AoM8U6seQL1N0LthB
         zKWw==
X-Forwarded-Encrypted: i=1; AKwUvBx/jAeKxmzgQSh54DZZ92s3JLekiBtiUKodXBXUA9gCUAs6DzsSXwJrBcRDXeGBmKadrYAPPpeuPh2AhGp5Auzk@lists.infradead.org
X-Gm-Message-State: AFuF++l7QIxgBUkv/vVLHY3ka/I/joOhWc1WYouNMH+I0Z3Hu3a51Drh
	n3Jb2cPlMUTBHtM0KbzIPYEd+fEQy/oO18OZ14iB/d3mvENZpeXAsOVtNT3Vyljo6GHDQD1w1DY
	4NByT8h6pI1fgDVw2Dwp5PuCyDigYqNL59Fhx9eHJwA==
X-Gm-Gg: AYBFou04HaicGwAELpfGGRpXHKDLdeaz204UtyPdetqa1+PA/miIipwvaChwA/FU9KT
	oolcCaK41Y7bhq0qXPcPDWmfg4Qx9Ylwdbve0V0uyhzYKYgPJrys0xj8oOsLth/uAe39OxyO3u7
	ejLoIE9zn61hYVrygsRV9NgM/5XJrFZa7Wtle20ReoONdWNfVfhxju8jfS2t4XS+cU7hzOCjc08
	lPbaF4yIC9MLTojfp/KxDlXehR33HtkwUwnOkgt6siuskvJA6kKq1g7v7NV3IQ+qMPP/b9Pb2dj
	r+O+wLYg1a3HiH9S3YPemW2OY0FY2tMto2BNF6dtze3PL0i0TRXRLYLRjQgA2PN+lJQG87EZjCX
	EPiQpLgED4nXVoQcGGLQXfIR6
X-Received: by 2002:a05:6402:3548:b0:6a9:b549:701d with SMTP id
 4fb4d7f45d1cf-6aacc508f6amr2199041a12.15.1790264960542; Thu, 24 Sep 2026
 08:49:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
 <20260916-remoteproc_virtio_map-v1-12-dac8c5eb4aa9@valla.it>
 <arKiOCGrWAKyc-bc@p14s> <arLawAw6kgFT2e0W@bywater> <arP06mWDehsIDh5s@p14s> <arP5AvA51GHrI8aN@bywater>
In-Reply-To: <arP5AvA51GHrI8aN@bywater>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu, 24 Sep 2026 09:49:08 -0600
X-Gm-Features: AclHuK9rmhqK1cH6j-fLQ3mp9InwiyRIAYoT3KXZouMAk75cYXsRA4d_MaQA2vI
Message-ID: <CANLsYkyT3NopaQy8CpTUrD-MTbif1dvyjaUUcQUWLzcTL7GpcQ@mail.gmail.com>
Subject: Re: [PATCH RFC 12/12] PoC: arm64: dts: imx93-11x11-frdm: add multiple vdevs
To: Francesco Valla <francesco@valla.it>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Robin Murphy <robin.murphy@arm.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Peng Fan <peng.fan@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, virtualization@lists.linux.dev, 
	imx@lists.linux.dev, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_084923_037544_005B27DF 
X-CRM114-Status: GOOD (  56.88  )
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

On Wed, 23 Sept 2026 at 12:42, Francesco Valla <francesco@valla.it> wrote:
>
> On Wed, Sep 23, 2026 at 09:48:58AM -0600, Mathieu Poirier wrote:
> > On Tue, Sep 22, 2026 at 10:19:48PM +0200, Francesco Valla wrote:
> > > On Tue, Sep 22, 2026 at 09:43:52AM -0600, Mathieu Poirier wrote:
> > > > On Wed, Sep 16, 2026 at 11:10:57PM +0200, Francesco Valla wrote:
> > > > > Add rings for multiple vdevs, as well as the required virtio nodes for
> > > > > I2C, SPI and GPIO functionalities. On top of that, add example
> > > > > peripherals using all of them.
> > > > >
> > > > > NOTE: this is a Proof-Of-Concept, not meant to be integrated!
> > > > >
> > > > > Signed-off-by: Francesco Valla <francesco@valla.it>
> > > > > ---
> > > > >  arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts | 128 +++++++++++++++++++--
> > > > >  1 file changed, 119 insertions(+), 9 deletions(-)
> > > > >
> > > > > diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
> > > > > index bd14ba28690c..dfa3b122ac5f 100644
> > > > > --- a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
> > > > > +++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
> > > > > @@ -53,6 +53,32 @@ button-k3 {
> > > > >                 };
> > > > >         };
> > > > >
> > > > > +       gpio-keys-virtio {
> > > > > +               compatible = "gpio-keys-polled";
> > > > > +               poll-interval = <100>;
> > > > > +
> > > > > +               button-v1 {
> > > > > +                       label = "Button V1";
> > > > > +                       linux,code = <BTN_3>;
> > > > > +                       gpios = <&v_gpio 23 GPIO_ACTIVE_LOW>;
> > > > > +               };
> > > > > +
> > > > > +               button-v2 {
> > > > > +                       label = "Button V2";
> > > > > +                       linux,code = <BTN_4>;
> > > > > +                       gpios = <&v_gpio 24 GPIO_ACTIVE_LOW>;
> > > > > +               };
> > > > > +       };
> > > > > +
> > > > > +       leds {
> > > > > +               compatible = "gpio-leds";
> > > > > +
> > > > > +               led {
> > > > > +                       gpios = <&v_gpio 18 GPIO_ACTIVE_HIGH>;
> > > > > +                       label = "LED V";
> > > > > +               };
> > > > > +       };
> > > > > +
> > > > >         reg_usdhc2_vmmc: regulator-usdhc2 {
> > > > >                 compatible = "regulator-fixed";
> > > > >                 off-on-delay-us = <12000>;
> > > > > @@ -89,11 +115,6 @@ linux,cma {
> > > > >                         linux,cma-default;
> > > > >                 };
> > > > >
> > > > > -               rsc_table: rsc-table@2021e000 {
> > > > > -                       reg = <0 0x2021e000 0 0x1000>;
> > > > > -                       no-map;
> > > > > -               };
> > > > > -
> > > >
> > > > Why is the resource table removed?  There is no mention of that in the
> > > > changelog...
> > > >
> > >
> > > You are obviously right, the commit message here should have been a
> > > poem, not a form of hermetic poetry. My bad.
> > >
> > > The resource table here is causing problems with how Zephyr is managing
> > > it at its side. If it is kept in a separate memory location and copied
> > > there at runtime by the remote processor firmware during its startup
> > > (which is the current Zephyr behavior), then there might be a race
> > > condition when the aforesaid firmware is loaded and started by Linux
> > > *and* at least one of the vdev drivers (here including rpmsg_bus) is
> > > built-in. In this case, the copy of the resource table done by the
> > > remote processor might - depending on the async execution of the two
> > > processors - overwrite the status bit set by the Linux driver:
> > >
> > >   Firmware load and startup (echo start > /sys/.../state)
> > >                            |
> > >                        |
> > >                        V
> > >   The vdev devices get registered (by register_virtio_device())
> > >                            |
> > >                        |
> > >                        V
> > >   If a driver is built-in, it probes and sets the vdev status
> > >   inside the resource table @rsc-table.
> > >                            .
> > >                        . (in the mean time)
> > >                        .
> > >   The remote processor starts up and copies the resource table from its
> > >   dedicated section to @rsc-table.
> > >
> > > Depending on the system load and the complexity of the firmware, the two
> > > operations can happen in whatever sequence, causing a race condition.
> >
> > This would happen regardless of this patchset.
> >
>
> Correct, *if* the remote processor is copying the resource table to a
> specific location and expects the host to use that. On Zephyr (which is
> clearly outside the scope here) this can be enabled through the
> CONFIG_OPENAMP_COPY_RSC_TABLE option. I am keeping that disabled, and
> removing the rsc-table node here.
>
> I am planning to reason on this and propose a proper fix in a separate
> patchset.
>

It seems like we need two solutions here, one for imx and another
applicable to everyone.

> > >
> > > This is somewhat masked if vdev drivers are built as modules, as the
> > > devices does not probe immediately but only after the modules have been
> > > loaded, giving the remote processor time to start. Note that this is not
> > > a solution! but a workaround.
> > >
> > > If the rsc-table node is not there, the startup logic falls back to the
> > > classic rproc_elf_find_loaded_rsc_table().
> >
> > We can't remove @rsc-table to make a problem go away.
> >
>
> I need to re-take a look at the NXP SDK to understand what's the real
> purpose of having the rsc-table here. Judging from the commit message
> that introduced support for such facility [1], it seems the SDK is not
> really using it.
>
> Maybe someone from NXP can comment on this?
>
> > >
> > > This is specific to i.MX platforms [1] and is probably not normally an
> > > issue because - as stated in [1] - the offical SDK from NXP seems not
> > > to check the status inside the resource table.
> > >
> > > > >                 vdev0vring0: vdev0vring0@a4000000 {
> > > > >                         reg = <0 0xa4000000 0 0x8000>;
> > > > >                         no-map;
> > > > > @@ -105,12 +126,42 @@ vdev0vring1: vdev0vring1@a4008000 {
> > > > >                 };
> > > > >
> > > > >                 vdev1vring0: vdev1vring0@a4010000 {
> > > > > -                       reg = <0 0xa4010000 0 0x8000>;
> > > > > +                       reg = <0 0xa4010000 0 0x1000>;
> > > > > +                       no-map;
> > > > > +               };
> > > > > +
> > > > > +               vdev2vring0: vdev2vring0@a4011000 {
> > > > > +                       reg = <0 0xa4011000 0 0x2000>;
> > > > > +                       no-map;
> > > > > +               };
> > > > > +
> > > > > +               vdev2vring1: vdev2vring1@a4013000 {
> > > > > +                       reg = <0 0xa4013000 0 0x2000>;
> > > > > +                       no-map;
> > > > > +               };
> > > > > +
> > > > > +               vdev3vring0: vdev3vring0@a4015000 {
> > > > > +                       reg = <0 0xa4015000 0 0x2000>;
> > > > > +                       no-map;
> > > > > +               };
> > > > > +
> > > > > +               vdev4vring0: vdev4vring0@a4017000 {
> > > > > +                       reg = <0 0xa4017000 0 0x4000>;
> > > > > +                       no-map;
> > > > > +               };
> > > > > +
> > > > > +               vdev5vring0: vdev5vring0@a401B000 {
> > > > > +                       reg = <0 0xa401B000 0 0x2000>;
> > > > > +                       no-map;
> > > > > +               };
> > > > > +
> > > > > +               vdev5vring1: vdev5vring1@a401D000 {
> > > > > +                       reg = <0 0xa401D000 0 0x2000>;
> > > > >                         no-map;
> > > > >                 };
> > > > >
> > > > > -               vdev1vring1: vdev1vring1@a4018000 {
> > > > > -                       reg = <0 0xa4018000 0 0x8000>;
> > > > > +               vdev5vring2: vdev5vring2@a401F000 {
> > > > > +                       reg = <0 0xa401F000 0 0x1000>;
> > > > >                         no-map;
> > > > >                 };
> > > > >
> > > > > @@ -149,8 +200,67 @@ &cm33 {
> > > > >                  <&mu1 3 1>;
> > > > >         mbox-names = "tx", "rx", "rxdb";
> > > > >         memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
> > > > > -                       <&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
> > > > > +                       <&vdev1vring0>, <&vdev2vring0>, <&vdev2vring1>,
> > > > > +                       <&vdev3vring0>, <&vdev4vring0>,
> > > > > +                       <&vdev5vring0>, <&vdev5vring1>, <&vdev5vring2>;
> > > >
> > > > Who is using vdev5 vrings?
> > > >
> > >
> > > Another thing that should have been in the commit message. Vdevs are
> > > defined, in the Zephyr application I am using as PoC, as follows:
> > >
> > >  - vdev0: RPMSG (tx and rx vrings)
> >
> > To be backward compatible, there has to be a way to make vdev0 defaulting to
> > RPMSG.  It would also be nice if bindings were define for RPMSG so that it can
> > show up in the list of remoteproc-virtio devices like i2c, gpio and others.
> >
>
> What vdev type is inside vdev0 is up to the resource table (i.e., to the
> firmware running on the remote processor), not the remoteproc-virtio
> framework.
>

We are of the same opinion.  Up to now vdev0 was automatically
assigned to RPMSG but with this new feature, it can be anywhere in the
list.  I see your point about RPMSG not requiring hardware
description.

> Defining bindings for rpmsg would today be... pointless? Since no
> hardware needs to be described for it. The same goes for virtio-can and
> virtio-entropy.
>

Just to make sure we understand each other, there are entries in the
resource table for virtio-can and virtio-entropy.  Please confirm.

> >
> > >  - vdev1: entropy (single request vring)
> > >  - vdev2: GPIO (request and event vrings)
> > >  - vdev3: I2C (single request vring)
> > >  - vdev4: SPI (single request vring)
> > >  - vdev5: CAN (tx, rx and control vrings)
> > >
> > > vdev5 is not represented inside the devicetree because the can-virtio
> > > driver registers a single CAN network device and has thus no need for
> > > such representation.
> >
> > Then why is it part of the remoteproc's memory-regions?
> >
>
> Because a vring description needs to be present for it, or the
> remoteproc-virtio won't be able to fill the entry inside the resource
> table.
>
> > >
> > > > >         status = "okay";
> > > > > +
> > > > > +       virtio {
> > > > > +               #address-cells = <1>;
> > > > > +               #size-cells = <0>;
> > > > > +
> > > > > +               vdev@2 {
> > > > > +                       reg = <2>;
> > > > > +
> > > > > +                       v_gpio: gpio {
> > > > > +                               compatible = "virtio,device29";
> > > > > +                               gpio-controller;
> > > > > +                               #gpio-cells = <2>;
> > > > > +                               interrupt-controller;
> > > > > +                               #interrupt-cells = <2>;
> > > > > +                       };
> > > > > +               };
> > > > > +
> > > > > +               vdev@3 {
> > > > > +                       reg = <3>;
> > > > > +
> > > > > +                       i2c {
> > > > > +                               compatible = "virtio,device22";
> > > > > +                               #address-cells = <1>;
> > > > > +                               #size-cells = <0>;
> > > > > +
> > > > > +                               eeprom@50 {
> > > > > +                                       compatible = "atmel,24c1025";
> > > > > +                                       reg = <0x50>;
> > > > > +                               };
> > > > > +                       };
> > > > > +               };
> > > > > +
> > > > > +               vdev@4 {
> > > > > +                       reg = <4>;
> > > > > +
> > > > > +                       spi {
> > > > > +                               compatible = "virtio,device2d";
> > > > > +                               #address-cells = <1>;
> > > > > +                               #size-cells = <0>;
> > > > > +
> > > > > +                               sram@0 {
> > > > > +                                       compatible = "microchip,mchp23k256";
> > > > > +                                       reg = <0>;
> > > > > +                                       spi-max-frequency = <20000000>;
> > > > > +                               };
> > > > > +
> > > > > +                               lcd@1 {
> > > > > +                                       compatible = "adafruit,yx240qv29", "ilitek,ili9341";
> > > > > +                                       reg = <1>;
> > > > > +                                       spi-max-frequency = <10000000>;
> > > > > +                                       dc-gpios = <&v_gpio 21 GPIO_ACTIVE_HIGH>;
> > > > > +                                       reset-gpios = <&v_gpio 20 GPIO_ACTIVE_HIGH>;
> > > > > +                                       rotation = <90>;
> > > > > +                               };
> > > > > +                       };
> > > > > +               };
> > > > > +       };
> > > > >  };
> > > > >
> > > > >  &eqos {
> > > > >
> > > > > --
> > > > > 2.55.0
> > > > >
> > >
> > > Thank you!
> > >
> > > Regards,
> > > Francesco
> > >
> > >
>
> Thank you for the discussion - is helping in defining further
> requirements and constraints.
>

Well, I certainly appreciate that you are willing to have a discussion.

> Regards,
> Francesco
>
> [1] https://lore.kernel.org/all/20240719-imx_rproc-v2-2-10d0268c7eb1@nxp.com/
>
>

