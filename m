Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF9DCD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 07:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SR0MIdclzqLJ5NMQX/zWd9Yh3H6pzRPWDeVIlwB7J0g=; b=hW16br9VhtyJT8dMU2b/78Hc0p
	dN9br/4G0k/YfneHP8HQI9z8lujyd3J28lzek5C/5uEf+wMAPXmTBMJ7XXKaqL4cGrCXT1P5DwInh
	gmyhRnZzv4e9ifA5lwQcuH9g5Q/ZF0D6I41m/xdZHOBuzGw5xX9SV3WmnZ6JHfh6oXrFSsb4lFYrp
	9UWdN/7hpKJced8w2NvgEvadEw57xFjIYU537IVJyYNaKuiUvNEJoL2J505aXmQ+SaDP7KpUtGjV5
	w0kQri26QgHQPUJD71vlMOpzaFZlqrsspCNpiRrhOwy9A6/E3iS8swUozShaf7AeQ9mRN2Gow487a
	C2aNGHaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwfo-0000000AV9N-0T3l;
	Fri, 12 Jun 2026 07:51:28 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwfl-0000000AV7b-2e2G
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 07:51:26 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-7e16f05fd79so7549157b3.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 00:51:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781250684; cv=none;
        d=google.com; s=arc-20240605;
        b=hnzDuKtB7elMrakmwfJEFeYHP+xV8Zg/mB7ur9X9UGbW9jmRfFz5qnAGpbqmg7MnnG
         HZiitiI4/hWkjOXFPnKBXq+YRxypG3jZ6WaiiqiSD72OtpyVmIoEtT7rYyWR38+EcHxc
         gozok2/z/rkuIzSbAJI7NfIxQ8YeFVF0fxi+U3f+Jfghdgjy/uktC/Wyo+vjprn05Jo6
         qVELQ6Lvz8/94EcsPF6uqR979icM20EE6M9IAbgAmFmtbp8ODIr0fbo77p+QuuImo3ky
         ekQE4ComGMdKFNeGzuwu1wGZ1DDe90upPkTp5op0HljMf/mJD5AzGIA7gC1DtH66IZuy
         LqJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SR0MIdclzqLJ5NMQX/zWd9Yh3H6pzRPWDeVIlwB7J0g=;
        fh=k8AYbJVKqC8PXTxFV3QARsQgeHX95eVRMXPyYqe/wDc=;
        b=FDVGcTkZ6EioqfeQQrjeb5cFzUsXJJqMwpIdM7fDNpP36ETWsQEUuZ3b1++DMUc8iT
         sIEPnigVXpMV7WvtzDMBlwuU1vZRylGvf66+g6Y1nHYwS1bKliELF4QA0jySmm2qssC2
         YL6vlOYaC/KDuVdzoXkTdudwD5NcZCBL6gd0r4lMnBS4G5nz0yhfeHTebtggLFbijKjx
         yptmNF8FFiBcBz6Ov7tXUJHR4svIsOSjDZ0Wf2RsqF/n+I/VYo84rQPd7NucNQDra4EE
         ko/6UAaraKWIh5gFYStJ6jn1soQ8Gtqq51iBFaL6EuUk9yu2XhrRxfFpXOotle2v5gw8
         a0BQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781250684; x=1781855484; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SR0MIdclzqLJ5NMQX/zWd9Yh3H6pzRPWDeVIlwB7J0g=;
        b=JOhF6nOIbCfUZAzO2UuSe0qzd2eq4vdOYELm2ohhzadLdFxsnS9creqTVabmmv8SgY
         tenPr6AnFgaQQna83MK46w0fKrsZ5hYL7laWujJgaV3o/fOM/gEWxv8hEB9imHnoLM9N
         evD53XulURY/6DfuOnr2yp3w5QsRgbTOTo5C8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781250684; x=1781855484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SR0MIdclzqLJ5NMQX/zWd9Yh3H6pzRPWDeVIlwB7J0g=;
        b=HijKG445VxoBV7Ie3m0idr/dFhNYF8vwbtJJmhxXQT5KfQLDuOm9fneTQq78zX2fmX
         pJTt3d7SmtL3nxcKjg3o8+JcJl0i+IxqqAwOgFLneQjv6VvAESJSNLIY+3+wD3Fg/Veu
         yQLxq5rzksLa+grUIhVxVBYd9OHsIZrbLHwX9LSZ0dCP6zjDVYPsY08J0uJTHGF9b+oy
         gbSsZg6gNEgM7g98kF8h/S1caU1Rva6d4Cx6ydJ55X6MPja/2AN4GghPa8o4e2B1SSls
         RlMBWL3t+skh7E/Bzj0IQqvTSvyaGc4+G849ygZKZ785kesMQxweASkUr8lmHEsj4dNR
         2FAQ==
X-Forwarded-Encrypted: i=1; AFNElJ/TDM7uc3kGDt+qAq+b6L9yhu/S1VkxEWYLvmZ9or9IYRQUPTCd8voCgITiFmMAxWEHDzd9PYoG8Jg8QKTnM1/q@lists.infradead.org
X-Gm-Message-State: AOJu0YzMGGiS/Io4D+HQhDricINbSPJz/xED1RAhjculc8Ba5Y+K+7Tr
	64g6MAmCgRzgmWLycVWGyfct3I7/8ivWTiDGc52TV1MNmEsl9xaiFa3/+2BwbpYI4fP1bav2QH3
	+LHSbvj++4Gxeb8MBT92E/hTOH7Yw/yGsI2Z60Tit
X-Gm-Gg: Acq92OHmh+HXNiyMBs0uGoWEaIqznx/fU53T53tZ7wqb/e4qB9GF5iNQG5tOAT4efR3
	pn0pTAyCRKR6HLQLskpdA3yWfL7OBeLzx9Hj0HSnCx9L4chZrmiPEdRWU/bLwzX1pnSoXwEG2st
	Jj4rXd06PfnjxNvDlSu9unFfil5iDBMAMcm0aomMFQMime0EhLrd9C2H4UUVGpnog2qScmiCRJR
	11nrcWjkDKNJTI9fugZfDBE5P/Mywu25AaxeUGe++BIcCfFGlbpiX163GA8QQKeOtqwWeUj0Vpr
	hIOLDMk3
X-Received: by 2002:a05:690c:ec7:b0:7bd:73f3:7a70 with SMTP id
 00721157ae682-7f7b8523999mr14898787b3.32.1781250684397; Fri, 12 Jun 2026
 00:51:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260610084053.2059858-1-wenst@chromium.org> <20260610084053.2059858-5-wenst@chromium.org>
 <ailytpKQcvYTUH7j@ashevche-desk.local>
In-Reply-To: <ailytpKQcvYTUH7j@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 12 Jun 2026 16:51:13 +0900
X-Gm-Features: AVVi8CeA8ndBvqsmj_bBdEg4mr2h2E0R3_zPJJzKBFEx0mTdugBDzHIodwmMGm4
Message-ID: <CAGXv+5FrD7abUvw5JgZECcGBvtOOpezDtmUrCRmVAbDx0ApxhA@mail.gmail.com>
Subject: Re: [PATCH v2 04/16] usb: hub: Return actual error from
 hub_configure() in hub_probe()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alan Stern <stern@rowland.harvard.edu>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_005125_838055_C04882FA 
X-CRM114-Status: GOOD (  19.51  )
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

On Wed, Jun 10, 2026 at 11:20=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Jun 10, 2026 at 04:40:38PM +0800, Chen-Yu Tsai wrote:
> > The addition of power sequencing descriptor handling in the USB hub cod=
e
> > requires dealing with deferred probing from pwrseq_get(). The power
> > sequencing provider may not yet be available when the USB hub probes.
> >
> > Return the actual error code from hub_configure() when it fails, so tha=
t
> > the driver core can notice the deferred probe request.
>
> Makes sense to me.
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> One nit-pick, though.
>
> ...
>
> > -     if (hub_configure(hub, &desc->endpoint[0].desc) >=3D 0) {
> > +     ret =3D hub_configure(hub, &desc->endpoint[0].desc);
> > +     if (ret >=3D 0) {
> >               onboard_dev_create_pdevs(hdev, &hub->onboard_devs);
> >
> >               return 0;
> >       }
> >
> >       hub_disconnect(intf);
> > -     return -ENODEV;
> > +     return ret;
>
> Can we convert to regular pattern, id est checking for errors first?

Sure. Will do it together in the next version.


ChenYu

>         ret =3D hub_configure(hub, &desc->endpoint[0].desc);
>         if (ret < 0) {
>                 hub_disconnect(intf);
>                 return ret;
>         }
>
>         onboard_dev_create_pdevs(hdev, &hub->onboard_devs);
>
>         return 0;
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

