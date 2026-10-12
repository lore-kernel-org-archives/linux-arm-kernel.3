Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC36CA9ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 10:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WCb6XoubVQ4Mh43VO0uwVKASyleTbzUvSNlnrWOxN8o=; b=Ax1mS10V1aQvPA01vnvH7cjv4K
	73wcMT2HFev+KTIa/VEo3NCU5DSxuOH5TLksQ+1gZkJU1ihVGsdLHPpLBiFfouBTqOfWFG4abgZw6
	At+A8boy6ZUcZi6penG9fz8bFmORu1KRP6Y+WTd07pB49eTWpWvgao6S+dUHGkbKpGi0SqO2jrWke
	gf9kICNWecn22EjHXUovaVq32JQA0frhK92cZYV89skrOQ7PCZdyQETf1M1uUBrLa3a8S/CoHg6U3
	dlglaRMaf//LeHN+E5iUu6OyHRbiNAUXZqC/pgcl4krZ/6zPQK1hyq4APA8OdbP+Z7wVusR9jtSYy
	bgk2ewTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGDLU-0000000AFoJ-0yqd;
	Mon, 12 Oct 2026 10:33:28 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGDLS-0000000AFnZ-0Stl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 10:33:27 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-c2e62319cfaso163901466b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 03:33:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791801204; cv=none;
        d=google.com; s=arc-20260327;
        b=jNFHhblozJ2d/YIgcB8T3IB33RjBpPRWWzRH1gJSk+yhqBZFgIIf8q3WDlmnMNkA0x
         lQ+YTqm2M49zc8Fw116t71VUOiKFbV2balqonkcaluK9vY5GdyMCQil5b7T1Vf6YWHFC
         OLWjfomklFEDrfLw46LVCrzrTBHgeHwN+u6dsar1xq1BQopXicNZvBA41hxZRd7Y4Mh2
         BFIPOWpcdE0QY+WiaeL9fxXHO2MBlnOSeEF/opZYt/qVuqNBUU4JH6OCF/9xs28IJM3H
         +tqK+jxoAedOCh73QCMjGy5LeYePwzxVN3DmFVHwBnajbKYERBeSoN7/nJfw7ZdYqBX5
         pJEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WCb6XoubVQ4Mh43VO0uwVKASyleTbzUvSNlnrWOxN8o=;
        fh=QrdJh81PS6FYVQlsBarTBhoB09tyJLRAZAmMxx5RtNI=;
        b=DhK68ifYel9iJLVSNcW9g9cqpupl1z7psIRn2pOWNo5/6/RPlL67+UBd5q1lEbM9AZ
         Fh/nXNv2miIdOPBxPheH/sSHKnGz4gofzIWlAzEB3kwxDy4vZB4uV2OLOcLQYAn7PQ+k
         lzbw7ZHgKpz0sWTjox8Ute6HipS5wi1j3W8a2SWjYLpuRGvw4VfS9KHqYCLkEh7BLN/6
         b2iLO6X0smNZEUhs05Z9hmPwahvnRpqfAMpjkcVZ+f6Jt1lspdYZQxJAC8FUtnpcVJku
         isIKH91Z8P1KnOolqhGGvq/Tw6TpEnICI/KSXAdzdzuNdFhVsNprODRXgz32D/c5b7uB
         OLpw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791801204; x=1792406004; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WCb6XoubVQ4Mh43VO0uwVKASyleTbzUvSNlnrWOxN8o=;
        b=eIcb3NOUloZq5YKstXjUZVadPmeRqp+mHoAJgP9GA441bqhxRMc15O1SGRd6KYIwjP
         eBSG5gIacPTRwrhfLauOxtoL7hdFJFICIj8GuvBUdMEOTEMoxueStkjiev8Ish+b/j0Y
         2EnUsA1St7LsUlNgPBfKU9PP/GwsMt2UnUOGzrYubLEO2vViuQK13yb25njluKU2huRk
         1b5zXklJVlFf+M8A1M0xPje0O55BxlB4fvwkSEBArt6NqQ6ESCkiQxHabBLHv6BSba/h
         Fm4bArieIEN7zidx0Z5nN8mwma3d36E19SaO7sShBc1CF7PjIZ3SskHMKekhqz2+xVuR
         YVbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791801204; x=1792406004;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WCb6XoubVQ4Mh43VO0uwVKASyleTbzUvSNlnrWOxN8o=;
        b=yfVMEeGFhE13jGqAqeh33Vw34HChor60iBgGcG57/8D6l9RuGs0Fl/UyO87pxvHj0a
         3AwvFzSkjmbWbiveJ6lEH3q+1+e8+LBuG5yE/cYaJE1xKWy+01xEvFXpYEyJLe9+VJ8Y
         FniNp4e+ROg7GbAiHpV9RB+WhbPaaxrj8gEQxAED/5K04K8rNUxH8sYYvb1NLfMhRU4p
         TEsyG+E7k3h5IzRYmxk5eUxaZI4O6xxes67MGuC+96+yCsmeWJ3gjwtXiQ+rPOFjmWLJ
         lECRosSpT3laxjcTrwMStx837wwoTFZhz83oL/6Xn9yXvLZ7xXCGpcJ47SpRNsbDvPMh
         JamA==
X-Forwarded-Encrypted: i=1; AKwUvBxh86DtDvMxeUEIjbUHkONLLWbRco7qFlCrtCRnovQ4iga9UKl5PE70KhxSKWrXGHVkXvGlaWW0aeeiXIhsj+97@lists.infradead.org
X-Gm-Message-State: AFq9FYI9kxUzg6pcKh0F9l/tSsXsASSVjt1koVDMszVFTLufaQDksEls
	2Jc6ZzrBamcfd4syomQbRUDmEiKCfb52PRXBMwDfKceNUnPDojcegGM7xJ1Sw8jPE2Gn9n7G3qW
	2r9OahyFl7dzOsdu7YdzrLHkAEQfr/d4=
X-Gm-Gg: AYBFou2v24jgwvBFXJTgk84Ju81f8ayn6Lk6GPp/fdPglzBzOfOsb3NeNy548dqz2Yq
	uT/Wf45zTxVzQ8I6QTg2hui0Dwc/dyTimgVmNhdysCnZlOYHkGbKLpVj4NSQJt4YXf6H0JhFDwc
	f16VKER62gtVkeyrIl3IBcvImiR4nX9YNZM6g0z/XkZIApszafV2eoPQ2Q1IYojER2GtYRuvUvi
	4woO5SPqKy4+l4yCVI01HTZHqcjVGjUCbCrty0iKi+p9oSv1E2CxYZvekvHAROLUI8nH9Lo6aSw
	zpBU0YqAYUHCIADYla024+K47hLsVdJeGxiQbG+4gKCbZ2Dbj3C8X23MqnR0ZjUVpTGs4WUOtwu
	3LcQkYPxe/nriQMAnDoIG+6zuuvd2OhVnkuB0cQiYVRqAfikw/ybAQOHoK9bTkFsl6p4rc/xVy1
	d8iCigtV6P2ibkBxzDngldTKOB0GibkHupq2edFMiO
X-Received: by 2002:a17:907:2d88:b0:c2e:4373:521 with SMTP id
 a640c23a62f3a-c31aa0d2286mr787580766b.46.1791801204012; Mon, 12 Oct 2026
 03:33:24 -0700 (PDT)
MIME-Version: 1.0
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com>
 <20261011-gpio-mxc-cleanup-v6-6-cb47ce2ad758@nxp.com> <CAHp75VcadkqzMxShq1PLzqgNZypB+vqr3a_m1utu-NOx39iK1g@mail.gmail.com>
 <asyvcJxbM5aD8pzE@shlinux89>
In-Reply-To: <asyvcJxbM5aD8pzE@shlinux89>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Oct 2026 13:32:47 +0300
X-Gm-Features: AclHuK8bE2RNRViMXGduuI7Gu1WFvoqdAJYcBik89ymBcvSwk0SX4J83VWey8Go
Message-ID: <CAHp75Vfi8xqFU7nUjE1ktYKWgXGYy3XQKnz4nAJZeR2_o3ywkA@mail.gmail.com>
Subject: Re: [PATCH v6 06/13] gpio: mxc: replace of_device_is_compatible()
 with hwdata flags
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_033326_175565_26DFABCF 
X-CRM114-Status: GOOD (  19.64  )
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

On Mon, Oct 12, 2026 at 12:54=E2=80=AFPM Peng Fan <peng.fan@oss.nxp.com> wr=
ote:
> On Mon, Oct 12, 2026 at 12:25:41PM +0300, Andy Shevchenko wrote:
> >On Sun, Oct 11, 2026 at 2:54=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp=
.com> wrote:

...

> >>  struct mxc_gpio_hwdata {
> >>         unsigned dr_reg;
> >
> >>         unsigned high_level;
> >>         unsigned rise_edge;
> >>         unsigned fall_edge;
> >> +       unsigned int flags;
> >
> >Obviously you need another precursor patch to move from 'unsigned' to
> >'unsigned int' in the whole driver.
>
> Could we keep as it is? I try to avoid adding more changes if not critica=
l.

No, be consistent. You can add a new member with just 'unsigned' type,
but it's discouraged, sooner or later you should provide such a change
anyway.

> >>  };

...

> >> +#define MXC_GPIO_HW_DATA_COMMON        \
> >> +       .dr_reg         =3D 0x00, \
> >> +       .gdir_reg       =3D 0x04, \
> >> +       .psr_reg        =3D 0x08, \
> >> +       .icr1_reg       =3D 0x0c, \
> >> +       .icr2_reg       =3D 0x10, \
> >> +       .imr_reg        =3D 0x14, \
> >> +       .isr_reg        =3D 0x18, \
> >> +       .edge_sel_reg   =3D 0x1c, \
> >> +       .low_level      =3D 0x00, \
> >> +       .high_level     =3D 0x01, \
> >> +       .rise_edge      =3D 0x02, \
> >> +       .fall_edge      =3D 0x03
> >
> >Why?! Just to save a few lines? This makes it harder to follow the data =
part.
>
> If I expand the macro the imx7d, imx8qm, imx8qxp hwdata, 24 lines will be
> duplicated. I would keep as it is.
>
> The current hwdata as below:
> static struct mxc_gpio_hwdata imx7d_gpio_hwdata =3D {
>         MXC_GPIO_HW_DATA_COMMON,
>         .flags =3D MXC_GPIO_HAS_POWER_OFF,
> };
>
> static struct mxc_gpio_hwdata imx8qm_gpio_hwdata =3D {
>         MXC_GPIO_HW_DATA_COMMON,
>         .flags =3D MXC_GPIO_FALL_EDGE_WAKEUP_BROKEN | MXC_GPIO_HAS_PAD_WA=
KEUP,
> };
>
> static struct mxc_gpio_hwdata imx8qxp_gpio_hwdata =3D {
>         MXC_GPIO_HW_DATA_COMMON,
>         .flags =3D MXC_GPIO_HAS_PAD_WAKEUP,
> };

Yes, I saw it in the next patch(es) and commented there that what
should be done is split of the common part to another data structure
(or be wrapped into one with a .flags member).

--=20
With Best Regards,
Andy Shevchenko

