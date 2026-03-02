Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36183E9B342
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 10:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k8hzQbFD80VU7OdUiB7tOI+vmm30dRkci0GAtJdz414=; b=wfwwVrjUNvZGwVpia08sOChVrf
	D065+kNmRfRkkP6lEMqS+KWN3WlQP52sFJkiLu5EsbV2lACxVrVZ+j6Mlu5D3CZpADicd4YvbGVJc
	AVyzkVvfs9JlYFtR+hs0gkvI/Qskn57cXOT6k7Jwct6N49GzaJV5rCY+iwhaqaPnnZiMecgNMXYXl
	LRtV2VuXgz/GFXrxX8EulBCiWF4ONBfagANeUpmWSHSt92MqF5GXyXdCftoj46HRCW7QZ+kSrlDrN
	T1btRkvtt8WCfFsnM1iXXvRDBYif3iQZeRrgP+lV67kOAfAEGAx9tEXU1j8Y3nAo10bA3MZqbv+I4
	8PSGGDaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx0FA-0000000CfkA-00kf;
	Mon, 02 Mar 2026 10:11:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx0F7-0000000CfjS-0H9B
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 10:11:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3609043437
	for <linux-arm-kernel@lists.infradead.org>; Mon,  2 Mar 2026 10:11:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12729C2BCAF
	for <linux-arm-kernel@lists.infradead.org>; Mon,  2 Mar 2026 10:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772446272;
	bh=5rGx+CQxlmdX0QBjsQC9nBGMb/T8RhLBrNveef/NwRA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=utn49JxZm3uPD9TuLu1lY4whf2lgHQXpnN/5s4NwISLN4GnfGxTf40s5qVGHwpwzI
	 EY1B1NPNrE1Szflo+Byk18yuFnfP9oHdoCxCbYqqx1vPu2Ite0EQlWI+gOJxuX3xhT
	 l7orLlXC0GliBqKt7oLpsds9ACl6bDWw61yf1wmhBhn1eGKufZUYLanHsDbqJd+Nfw
	 iYSMUULBuHCoqK0uW3yKl/wR7SngDqu+yEmySUQDgH+1c6PtwGV0E3olM20CBfmTL2
	 FmENHzE1SCmgtFhNZQHlz02nZDCK55s0nPpCKw0YE3MUJ4hfAJL5lEwkuhLCDDVEUd
	 BZRMryGbnqBxg==
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-79800183233so55875637b3.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 02:11:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVn18jLOUS2bsk6ZMq7oOWa+0EUMLPirH6gAKZlsrPq/v8BTwr+KznCkYIgo7TN0wZ0DgYuSveO90MYttnEKVAd@lists.infradead.org
X-Gm-Message-State: AOJu0YxrtXw1pgSKdD7Mq+QkQb5yH8EHVWR+Yg+XqUxR3EPlYjoyfqMU
	byPl9nZzPF4Us20O5sJVfHuJxzVJXGYRgi4JZfNbYUEYO2NWAt6Raov+PbdO2osjeRI7SQE78/F
	ZDdgXCt225H3hsh7i8e/iZgVWwLHZ4Vk=
X-Received: by 2002:a05:690c:3686:b0:797:d46b:e86e with SMTP id
 00721157ae682-79874be88demr139170977b3.14.1772446271443; Mon, 02 Mar 2026
 02:11:11 -0800 (PST)
MIME-Version: 1.0
References: <20260225-pinctrl-mux-v2-0-1436a25fa454@nxp.com>
 <20260225-pinctrl-mux-v2-4-1436a25fa454@nxp.com> <CAD++jLkT83xz+PSzZZv_Mv+Mqx_+W30d_xk68EDG-sdmFF3x3A@mail.gmail.com>
 <aaG2xQDnMVGGAOJE@lizhi-Precision-Tower-5810>
In-Reply-To: <aaG2xQDnMVGGAOJE@lizhi-Precision-Tower-5810>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 2 Mar 2026 11:11:00 +0100
X-Gmail-Original-Message-ID: <CAD++jLm=6pTh7N5UAXFaaYWCs5DhfQdb+8TnM5XLcYC886=kLw@mail.gmail.com>
X-Gm-Features: AaiRm52VNn0UFirxG2TzpKTirdRC2cHuoSLXvPJ-P8L7Wd2YNQMbqv19Df0g77c
Message-ID: <CAD++jLm=6pTh7N5UAXFaaYWCs5DhfQdb+8TnM5XLcYC886=kLw@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] pinctrl: add generic board-level pinctrl driver
 using mux framework
To: Frank Li <Frank.li@nxp.com>
Cc: Peter Rosin <peda@axentia.se>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Haibo Chen <haibo.chen@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_021113_160973_A233E0DF 
X-CRM114-Status: GOOD (  21.00  )
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

On Fri, Feb 27, 2026 at 4:23=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:
> On Fri, Feb 27, 2026 at 10:20:14AM +0100, Linus Walleij wrote:
> > On Thu, Feb 26, 2026 at 12:55=E2=80=AFAM Frank Li <Frank.Li@nxp.com> wr=
ote:

> > > +static void mux_pinmux_release_mux(struct pinctrl_dev *pctldev,
> > > +                                  unsigned int func_selector,
> > > +                                  unsigned int group_selector)
> > > +{
> > > +       struct mux_pinctrl *mpctl =3D pinctrl_dev_get_drvdata(pctldev=
);
> > > +       const struct function_desc *function;
> > > +       struct mux_pin_function *func;
> > > +
> > > +       guard(mutex)(&mpctl->lock);
> > > +
> > > +       function =3D pinmux_generic_get_function(pctldev, func_select=
or);
> > > +       func =3D function->data;
> > > +
> > > +       mux_state_deselect(func->mux_state);
> > > +
> > > +       mpctl->cur_select =3D -1;
> > > +}
> >
> > As mentioned I have my doubts about this, explain why this hardware
> > is so different that this is needed.
>
> As board mux (uart and flexcan) exist, for example, only one of UART and
> FlexCAN work.
>
> when modprobe uart.ko,  mux_state_select called.
>
> So flexcan driver can't get such mux as expected.
>
> when remmod uart.ko, we need release mux_state, so flexcan driver can
> get such resource.
>
> Genernally, DT may only enouble one of UART or flexcan.
>
> but insmod uart.ko
>     rmmod uart.ko
>
>     insmod uart.ko (here also need release previous's state at prevous rm=
mod).

Can't you just enter the state "init"? This can be used
explicitly on the uart .remove() path using pinctrl_pm_select_init_state().

Sure the device core does not do it automatically but this is a
special case.

If you want a generic solution without having to change any drivers,
Add pinctrl_unbind_pins() to drivers/base/pinctrl.c and call on the
generic .remove path for all drivers to put the device into "init"
state during rmmod.

This gives us better control of the actual hardware states I think?

Yours,
Linus Walleij

