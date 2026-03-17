Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D691FED9EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 16:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XZEJ8YwY4qNFC6vbOmzTo9hEc0yNxgP5VNZaRbplGJg=; b=xP4r5JpfsswjtjZGHQUkio1Nv8
	z2UISJLZl9XcNhQ2MUjBfGaDfcy8LpnYS9t0yqMI1/5uYm1k449ylJJD/r9/qNvS8UKch0rClXFcL
	0mSoAUmH0i1lN/ggPP5KV8KQu31WD6SDYFD+QHc7K66HfrwIIw3KJR1i4oiu2YG4REcEPF7c+OxlO
	ARsNvv5BKNhVlOetkC7YpgBw7E+ChXeY9YpqfO5WVNhQpdcvOUZLTiy8gM5jVqJWH5ZJQLTJHVbU2
	hZ8qJNtEmqsLivMkocb0X40n6zOXtMWsRuTscybGSWXDuDK/88A9r08oCn12lBnQjxsHAj4G6zqX5
	N3i/47AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2XCE-00000006obE-321d;
	Tue, 17 Mar 2026 16:23:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2XCC-00000006oat-2Dro
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 16:23:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D02B0441C2
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 16:23:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3E1FC2BCB5
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 16:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773764583;
	bh=A8Zxzj2VIVs7gCjiuA/V62IbfaThIn3OZXBZScVzyTk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=n1oilQ2RfVsehzR1BSrE6fgxSTW2dQE0AuT+mhDnN3iMPS7tR7GIDgbhArz+7fqvG
	 quPXg4MNIyX+jzqJMQ/zZ10LQdr3OW/hCkQaQfzNUYR70OY+rAvq6fjPDGjpnID8FR
	 +MXH/8dlIhFagd1PipESy5lYWjQ7+JgOUr2GSqGYHZFow+psiatdybX0vFMfjVDElb
	 Pgy0wr5jqe6ZJS0n6bdg/LXTuVRWnDC5u1qRwNite/yAfUPdRcEvrLK1Y88G8sorn0
	 FedHOExohhq+JDObmMdQKPI2AOtqH4tkdVrUfYTFaNqBm6Ox2Zz9Kp0GZfCykNZe8L
	 FsRc6Yd9UXlpQ==
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-67bb3a6c6f3so28004eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 09:23:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU02plkQFYhzQvDjAiqJQdMKwaH6rL/XUqV//t+bvTyT149tfW37Zlh/uJpFxpbOniA192gRr/AJttmoMSBMYFY@lists.infradead.org
X-Gm-Message-State: AOJu0YyvJUQnjdKbT6kG5p4W0zEKzTt8kKVyK2D4wueYsmSjv7garMyt
	lnshUTPYZpzqRTpTqDzdCzGUf39kZH0IDieGKB2dwML6SE+ZnmKh7Ag1zDFuo9gYYNgPvmQ3K8k
	mP6rx6gOKcsslCVU5jBAhhl3/eEds+9Y=
X-Received: by 2002:a05:6820:2902:b0:67b:af16:488a with SMTP id
 006d021491bc7-67c0cfd4c10mr142151eaf.13.1773764582291; Tue, 17 Mar 2026
 09:23:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260317090112.v2.1.I0a4d03104ecd5103df3d76f66c8d21b1d15a2e38@changeid>
 <CAJZ5v0hwO16=mP_vB=wi7x8CjROAw_Nd_Tq-hEohrDW3C58RbA@mail.gmail.com> <0f92ab73-5996-4977-9ada-e8a26957110c@kernel.org>
In-Reply-To: <0f92ab73-5996-4977-9ada-e8a26957110c@kernel.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 17 Mar 2026 17:22:50 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0iw3aaboh83wdOyYpGK9LkNafbmdU3zhLXtxrbSQU9-_g@mail.gmail.com>
X-Gm-Features: AaiRm50hNFkNvSW2ZboUnTv_v1gMXj6WJgZAzhbsC1wLCWGL90Y_OtahDKKfqu8
Message-ID: <CAJZ5v0iw3aaboh83wdOyYpGK9LkNafbmdU3zhLXtxrbSQU9-_g@mail.gmail.com>
Subject: Re: [PATCH v2] device property: Make modifications of fwnode "flags"
 thread safe
To: Danilo Krummrich <dakr@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Douglas Anderson <dianders@chromium.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mark Brown <broonie@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Andrew Lunn <andrew@lunn.ch>, 
	Daniel Scally <djrscally@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, Len Brown <lenb@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Saravana Kannan <saravanak@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	devicetree@vger.kernel.org, driver-core@lists.linux.dev, imx@lists.linux.dev, 
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-spi@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_092304_628069_34AD39EA 
X-CRM114-Status: GOOD (  17.73  )
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

On Tue, Mar 17, 2026 at 5:20=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On 3/17/2026 5:11 PM, Rafael J. Wysocki wrote:
> > On Tue, Mar 17, 2026 at 5:04=E2=80=AFPM Douglas Anderson <dianders@chro=
mium.org> wrote:
> >>
> >> In various places in the kernel, we modify the fwnode "flags" member
> >> by doing either:
> >>   fwnode->flags |=3D SOME_FLAG;
> >>   fwnode->flags &=3D ~SOME_FLAG;
> >>
> >> This type of modification is not thread-safe. If two threads are both
> >> mucking with the flags at the same time then one can clobber the
> >> other.
> >>
> >> While flags are often modified while under the "fwnode_link_lock",
> >> this is not universally true.
> >>
> >> Create some accessor functions for setting, clearing, and testing the
> >> FWNODE flags and move all users to these accessor functions. New
> >> accessor functions use set_bit() and clear_bit(), which are
> >> thread-safe.
> >>
> >> Cc: stable@vger.kernel.org
> >> Fixes: c2c724c868c4 ("driver core: Add fw_devlink_parse_fwtree()")
> >> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >> Acked-by: Mark Brown <broonie@kernel.org>
> >> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> >> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >
> > Rafael J. Wysocki (Intel) <rafael@kernel.org>
>
> ACK or RB?

RB, sorry.

