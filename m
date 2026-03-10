Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA703FD4F01
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 16:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K58+q75J3LD3mDRig06x+UazutdjEE7vGtq+vglIB7g=; b=e9O6gld8wT9/joJnbzeWNx9So7
	Y5x5Gp+C64NFUNAWohT5yhvNoWJv8mJNdmPaa/ld3RwhuvpleVQOXR+1CrLc2wPVzJYnWx/1mAGpB
	QHr7DDGIkZXhbvT5lgGHY8uo1VXXY9CpUUiC4OpmBHOo1OnCG212gU3zEiKRKnBzRH5QCW0gwBNil
	TrHeUwipuaICoyYRuwDiKLaJ5Q76paGbn8/zZkEkMG6WPwj8KjaL2mMOi1SGK3Jy9OuEur1atS90D
	+acdNVpCyFUwkabCtEZJodVCfZfdun8YP6ZImWaeSOuelxNXg3rvq54wOJa70eR79dRfcIePwKhb8
	EslYVeeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzzYW-00000009sby-0Rl5;
	Tue, 10 Mar 2026 16:03:36 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzzYQ-00000009sb1-28De
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 16:03:34 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5a126c8aab9so7596114e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 09:03:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773158608; cv=none;
        d=google.com; s=arc-20240605;
        b=HQz5NxcwhRYFvvixGG/pVggBAitpEeahArIuL9vedCTy3pQ8+CyosBS8t/BgAurB2R
         GJpTXCK0PGxtMDkcDt707eGzeciELJ0SUxS6RkOz+NC+hETnOAn5dpRGuMIglmumssaF
         IygdcyS/5fChUu+eA//2Nz1zHS2CQHkIdWv9yprgkNd0lOOTaEOzbrkDMThdINMyf92v
         co8lrtBYkKdq2f3MqwvJziyKduRNzh1dMJSK0knEs3tB/Md8Et8AQhQrAERbtJQpdoDS
         jKU/hLXB2h3CT4/3gad93Mhv/2s3EFa4SEEqm+sO5YF4v4AWCFG6c4qSC3bBS3aBuv7x
         VWVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K58+q75J3LD3mDRig06x+UazutdjEE7vGtq+vglIB7g=;
        fh=FMHc7hFERsUotNsWsc282G8JWUapFec87mjQsp8kHKI=;
        b=J1mv27B1ZwRzM4E0I4kgFyZ+uaa/07LTrQ6NyNM0FjWm06TqzVdCkUxto6svcy+jVk
         VXb1dZxTwFjgdPKWbbvouuzWYVZ6uoxL2Mvu1p3ZA+Z/f+1CZkFTvhiQjq5hZAi5SQEf
         gdVy8Lv6UaaLDt+wAjBsdYgO93YLgGWYhIiOTcDVv2KfHj1rT9UObERoaVbxh6wkueTj
         Z78X8/LTXgq8pkRg7xWMudHoAuFbYRAffCZyb4YyPrrKJYz/vTcpGEfgix0WK1Jj+1jN
         D3cxf+o4wGkEIpK29HtKyOvpGrfA5rqk656ySjUydL+gTTWZ+BdjwfDAL9R84U6WRoTy
         jmMw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773158608; x=1773763408; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K58+q75J3LD3mDRig06x+UazutdjEE7vGtq+vglIB7g=;
        b=evVKf4AO8iMPqk5N9tDRh3Vp+J62zB6fxhpxSxO5Um2RO9QaYXpVJ4a4XLulGcMRLf
         riyZV6QFii8Eo2yJRMVZlRcdZYs+C+Wbu2mYwvZWCYGrZy9IglxLY0Rs5Eh6KjJqQIjx
         KHDTI7SRHyq0EKNGc02Dv/feHykhTrf18jntWXaAeCM8rpIyZuk2+b7bVG9uCE5p6SU5
         ovkKhiTUKoQZBgKtZ3Ruxszsw6yfc/J8AC7GhVGyskkiJgJdmkb4CsDFIZ9d6d7kF3RR
         Mtuc6oCpJL/Urs4d1bGTUNJKjj6m+ZHJvsuZC4XS8fjm1t3fcccLIXpEYmYmcisdSSTX
         uy8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773158608; x=1773763408;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K58+q75J3LD3mDRig06x+UazutdjEE7vGtq+vglIB7g=;
        b=WVbm4nR1xEDYx/rDdENJSIzMgwD85P2RcfRXkQLKyXY8tZWLkJs/NkBZJOeflvkVmF
         sMzHjO8GTSl/BzoQinftEMU1v5H5AJREUYda/fWMnAB7SRL3DTpCIkbLCGtgFgpIKKRJ
         kV5XopP4fVevpgHK1sqNHhzwd7Fd5nta3b+2MV6Y7zicXMHpofBkgHs0enfVA4ea/mYd
         j8WA6YjdkepwdYDSiH6q9iGxGEtVCPWyl7MzH6NWz6zUIUap5G9ZpnIYSDZik/tTQc9f
         SQX5lrxjWfvVPAToq+dI2p5lkBMs03bJWhpJeoHeJyxIBjFTKUutlTWx3n5L9U+V53Mj
         DQ5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXjpFgWej2RG7dvrP5rXrV6LhuTDGJJ9kJpqwGFowFxO/70AyC/myq5XpYHCpLQEPXSDZfsYGYFRXrR4l2r/os4@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+MLoJb7lTczjXDTqWMJyyy2Fl1/ZvLlp+cMHlnwOjtK+UQuoX
	oUrxtRBM1jLaO0CaUxSlvZ3BQo5KBs0arumju9lL6kGvyqyN1sFPOs2IqkIsolZg9MNLm33V/WD
	hAV2kODk0ggj+fVKnREsuUbQnRYXah+c=
X-Gm-Gg: ATEYQzy4r62MsQJqdXWkIbrxs6xcWQtxVWHGovAwbnP3yw9FXw39WfdeVy7JA/B69VJ
	XbBlotT5yNEkTYaLlW8MWGzh+qn0jh+QHtO+2WIrBkOlldgzaB6WNvFmON6re+x0Y+Re9shUvAe
	DjKh58Ppjw3ThNtXmBzCfvsCyRjbmu9ljsxfYRD1yKUH4wKlNr4X4QOgZMSFFmOC0GjNQQ+2NGD
	8ZlKH7melNHCd1fgO724C4T5flHuKWuNCefxuSO/E3w133YxSYORt6pGYmEae/gntxPcEL+X1Lt
	48Ll5fTuTk2pNcxQLgJIIeSMAUvKM95jLwB9i8BlW0RaJZdLD5zIoHZezHAfgeZVpZnbXpI=
X-Received: by 2002:ac2:4e99:0:b0:5a1:2f5a:cb61 with SMTP id
 2adb3069b0e04-5a13caaeba8mr3635889e87.2.1773158607681; Tue, 10 Mar 2026
 09:03:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260310124950.1345117-1-andrei.botila@oss.nxp.com>
 <CAOMZO5BVtRHW1+qtMEH9akO7ULS3LppzGXMB2_M-JJVwjbv1oQ@mail.gmail.com>
 <67e082c5-2b34-4960-8fd1-6cd007e0584c@oss.nxp.com> <CAOMZO5CHGssc3Tuf6fJg2_P=bp7=itfDVRANqQOiK2b-2ooeFA@mail.gmail.com>
 <d5bb01c1-17c9-4d76-8a49-00ffd85c7580@oss.nxp.com>
In-Reply-To: <d5bb01c1-17c9-4d76-8a49-00ffd85c7580@oss.nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 10 Mar 2026 13:03:16 -0300
X-Gm-Features: AaiRm50hQtki5ODEQm6WBm-CMqmZXFNtS_jtFUq9YGrHeYsH6rVUj6xnzW50JoM
Message-ID: <CAOMZO5A2qG8_d=5S9xdackhUt+DS-YtrvRvNeqA40X4TiVcyaA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: s32g: force S32G RTC as rtc0
To: Andrei Botila <andrei.botila@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
	NXP S32 Linux Team <s32@nxp.com>, Chester Lin <chester62515@gmail.com>, 
	Matthias Brugger <mbrugger@suse.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_090330_562489_7A94D420 
X-CRM114-Status: GOOD (  12.26  )
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

On Tue, Mar 10, 2026 at 12:21=E2=80=AFPM Andrei Botila
<andrei.botila@oss.nxp.com> wrote:

> rtcwake -s 10 -m mem
>
> rtcwake: cannot open /sys/class/rtc/rtc0/device/power/wakeup: No such fil=
e or directory
> rtcwake: /dev/rtc0 not enabled for wakeup events

You're missing the 'wakeup-source' property for the I2C RTC.

> > date -s "2026-03-10 11:00:00"
> > hwclock -w
> >
> > Power-cycle the board. Does the "date" command retain the correct time?
>
> date -> Tue Mar 10 11:12:43 UTC 2026
>
> date -s "2026-03-10 11:00:00" -> Tue Mar 10 11:00:00 UTC 2026
>
> hwclock -w
>
> date -> Tue Mar 10 11:00:06 UTC 2026
>
> <Power cycle>
>
> hwclock -r -> 2026-03-10 11:00:31.104653+00:00
>
> So looks like it does retain the date between power cycles.

Yes, the I2C RTC is working as expected and is battery-backed.

You should use it as rtc0. Instead of relying on random probe order,
it is OK to pass an aliases inthe board devicetree to force the I2C
RTC to be rtc0.

If you use the SoC RTC as rtc0, the time will not be retained.

