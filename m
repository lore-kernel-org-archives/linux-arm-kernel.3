Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B415AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 13:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nyHYQJiH0grz6FfspPAI6IMD2L9btQY/X/z4yRA/W0Q=; b=VpPe2sWBfBz2sBfF+KjmpEzS60
	sg2eJ9ROi6o4BzM4vOJV38jvPd/7Jv5l/l4v7AQSd7vaYyjgCYwPV7atZz5+37miOBawnM0nzb8Tl
	HCJZK9XPowAKVFZoiEcYNfmlL9oHhfzeTBbboE3FjcXrg7OBLyhfidNY8zzk4oCQ1OjeIkELmo1Iz
	UcihPr8OGRmW6FrOdLm886aRrPWZjYSooGdATlaUiPCiGe4O5Qh9wwXK/niaRkBBKmfH706lPul4Z
	wL0SGH1I2HxxhCxU2ZD0lFNDtzzdotiuIeUOgtUbOCVnZ6fFyDa+YuFfm/RtVDsVRM2hSQV9baISJ
	YqHxYRvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdls-000000074DH-3HAk;
	Fri, 03 Jul 2026 13:17:32 +0000
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdlp-000000074Bd-0kNY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 13:17:31 +0000
Received: by mail-yx1-xb131.google.com with SMTP id 956f58d0204a3-6651bc5730dso803481d50.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 06:17:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783084648; cv=none;
        d=google.com; s=arc-20260327;
        b=VDLS8SYGefu1tzMm/u0LDRZDEjGheeN72SlxJ7gnRj/TaiInLW3EQ8LQTBO5KWm4i0
         px/JWn8VD5NKu9D8ftc24VU86bcoDEfzFL1oEa3/Ai6dEe3dDNXpy4J+o44l6uCuQbcf
         H2WZk8BUNa/dfwuMJKCtGvYj+W8AWsv24SUElK/k56Ztaojxx8yEjainfnR0F87U6iMG
         gEozDWgoaNd3s8LrjVa9gVRg6fetXktJmlzOAilpQ+bTGu/RHUmlrGu9vGiCsfrP6sLw
         3OPq2QyOZJlQmD8E3Ze8dk3l7WQ3ax4yapq6BzfyyJJQtsBTmWGQHGcKLfcsPBLd0AOW
         actg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nyHYQJiH0grz6FfspPAI6IMD2L9btQY/X/z4yRA/W0Q=;
        fh=iGCTSIOVXW1EMOwzMhh37S5K3GiTBoOjYbFnj0Foplw=;
        b=kUCfzTrFIOeZIq9cioqruhJaOiTtLJ35OPiYv3jpFTu/DytBt1MDfB0JptVljTz+Hc
         jmFiGXEChMwR99U8/mSXGpWKarsGvd+Z6ja0d99xCrPSRmv0+c9r2dhyNbPoBnBctYzr
         o4iqwpAe4789r8dwnTJVCvvYaMVwDCbKPtC9c0r0rKkBcBAlxWpEXk54R6qN05qv+bfh
         UhWA3fad0afmh3xAU8dn217lCApJiXFUc6R2pRLuXYe2QJWprEIiJkItzqhqWHSK5ouU
         gfEiCawzeDXbze30BRi4iurgv9YD7e8+lKUWBYlsr47bVl7opiPugB9eJ6FH5v2ygLzB
         oWoQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783084648; x=1783689448; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nyHYQJiH0grz6FfspPAI6IMD2L9btQY/X/z4yRA/W0Q=;
        b=ReeZhFaERUjLjzcluUPlFsalzWRh2JqHAOquBNHPggaIajZY2GIeNRntJvCvaTvJfz
         dR1ipmrZm93m3PBvXjVbBFdvyjEvzjJSBGRatyVHt/t1AhDJev/FcXG3xkh3F+aAsYVU
         seexNpxAkB4rAC+psMKOnSE8fQhqPDPyqq+Bc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783084648; x=1783689448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nyHYQJiH0grz6FfspPAI6IMD2L9btQY/X/z4yRA/W0Q=;
        b=PioWpE+XRcg/K7EktIK+RN+4EJZ1CLMzCo+j9JOLW+LuGMGzev7CsAZ4hxazykBSZl
         ojB3lb5rT4sGz0smsgvqTHnFz8t+oGCd/n0SkjTQTG7djF3sXKxjQjoPzQHZg4G4f47m
         R1xtfpgMWwlxnh0WnuI84jX2taXBCWPX8cRfqSQPUC3IUfm158t1TspLDHxZd5lT6NFe
         NfAnGcOtN5EJ7EyCoCuKv6SBrom6ScOi17EL1hS//huah0c+/WsvqZYawt7OCkKWOW2C
         N90rdNAMbUB5qSZWoHPt6sIKaPedyoHnBwPZAZfx2rgpvQCJJsYZTLdD0n4DbOpr5wkf
         djPA==
X-Forwarded-Encrypted: i=1; AHgh+Rqxqd278zo3r00ZFOVoLe2n9Ip6RHMp1FYqCLtZdlpmq1wBfjOsEGhyjTh7+teQUwnBKdyxB41I6/N7H7k6E4ea@lists.infradead.org
X-Gm-Message-State: AOJu0Ywf/U2dBvLOpNu8zi7IDlQ+tjHR0uRad8f9aK4h0yCUfFErcdoY
	4YFw1+cw/cHdCEPKDUu3qIi7ZV1h/PJaVeLKiHCZ5dT1z5osAl0bZnnSl6fV4AKkbnKhb+Y7nEW
	za/j6U/68q/EpG8vZfc6OjA1y7mqRjMZkviXBw4e3
X-Gm-Gg: AfdE7cmOTZx3dmG54uZN2l4/feVjTRjRFCGJll7TnNv/KNB188HEZvPc3wpJwI74RHX
	WoTBabI4kV5IZoXT/WHIZXo8Ex5CFvpAPfTBJM8EetR0Ui3lvluMbpuLyzQRwilqUWHRXdhRYqS
	m3X+7rOi0dcBp0QEeKu4zUzLAmQTKY+vAC7SCzPjR5MID5YpcjO5My4fYcvH6EGDnkgb1emajC/
	0zpJb1MXtYRVkG/8o8oP0oMfUg7n9+jH7vYzzz1Si9hN3GkG/iP+E3r9iWdNSti3Ce1f6om1DtI
	q3J93bjzsBGevAdoSSm12pNSvKw=
X-Received: by 2002:a05:690e:4805:b0:664:de7a:a014 with SMTP id
 956f58d0204a3-66521a07484mr6637877d50.34.1783084648062; Fri, 03 Jul 2026
 06:17:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260703110317.1283411-1-wenst@chromium.org> <20260703110317.1283411-7-wenst@chromium.org>
 <ake09vk4fEv1D9QC@ashevche-desk.local>
In-Reply-To: <ake09vk4fEv1D9QC@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 3 Jul 2026 21:17:16 +0800
X-Gm-Features: AVVi8CfejZEcwq-X4tSLhB9B5zlOpwIE7AknFvssi26xknUZgb1hl9QfxXck8os
Message-ID: <CAGXv+5GNucSXrhL=YxarSJHD2ezzYDK3EovFu-zy012KgZ+ZBg@mail.gmail.com>
Subject: Re: [PATCH v3 06/13] usb: hub: Pass |struct usb_port*| to usb_port_is_power_on()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>, 
	Alan Stern <stern@rowland.harvard.edu>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_061729_217281_832E248F 
X-CRM114-Status: GOOD (  19.22  )
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

On Fri, Jul 3, 2026 at 9:11=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Jul 03, 2026 at 07:03:07PM +0800, Chen-Yu Tsai wrote:
> > usb_port_is_power_on() currently takes |struct usb_hub*|, but only need=
s
> > it to tell if the hub/port is SuperSpeed or not.
> >
> > In a subsequent change, usb_port_is_power_on() needs access to a pwrseq
> > state tracking field in |struct usb_port|. Either structure can be used
> > to identify whether a port/hub is SuperSpeed or not, as the field in
> > |struct usb_port| is inherited from the hub:
> >
> >     port->is_superspeed =3D hub_is_superspeed(hub)
> >
> > Replace usb_port_is_power_on()'s |struct usb_hub*| parameter with
> > |struct usb_port*| so a subsequent change can use it.
>
> At a brief look this will be the only function that takes usb_port
> instead of usb_hub in the entire hub.h (I don't count container_of()
> as a function). With that being said I would rather see it to be moved
> to port.c altogether (yes, it's more invasive change, but looks more
> consistent).  I would even dare to move struct usb_port (and container_of=
()
> accompanied with that) and this function to port.h. This might require
> a separate patch, though.

I agree with the reasoning, especially given the function name. However
I wonder if it would cause problems given the linking order. I'll give
it a try nevertheless and report back.

ChenYu

> Perhaps something like: 1) "move struct usb_port and associated APIs to p=
ort.h";
> 2) "...this patch...".
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
>

