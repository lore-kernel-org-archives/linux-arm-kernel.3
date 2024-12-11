Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9283AE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 13:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:In-Reply-To:Subject:cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=REoW6tKLm6VGAL/I4zX0e/gQBYiEbhKaPXCwFTe+fq4=; b=PxqahHwR2g9q+l4Y3LYO8rkZ+U
	gy+a2qo56yR46jYehDomFrjPh+6vPCDYF+toNEMpmTfD7dgE/9vUzYVmcL/CK2VdjDxayOUS/V7gm
	TSxUHfWn9XJfvoVjwcxM8QDaTXvAWmrzfy5EXYje73ijKvvnWd+MRBwRFnFECq8k4lIe1msYDjs13
	8j3ZAlTUpO1U4RXkdS/7F5P4OVMxemtk0kKrGKLQNkC/JEx5LAv2yVR7+GayYzJdMESgnc4q/OZAI
	32Tl8zhzpjIRmR27Gg8+rpf4WkmyISBBkuodpXUJc7EoT7KmCcUIc/Dg1nKYgxWSBC2gXMm1HmlB4
	SyyAxN4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLMVo-0000000EwYy-3W0p;
	Wed, 11 Dec 2024 13:12:20 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLMUl-0000000EwSW-40Qf;
	Wed, 11 Dec 2024 13:11:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DB27DA420EB;
	Wed, 11 Dec 2024 13:09:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C8DBC4CED2;
	Wed, 11 Dec 2024 13:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733922674;
	bh=pB6WfjwT9slsXqTxipmydzhAioPaD1EfbAGoCb329Mc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ADI+e0QtZ1oAmgQ0QHjwIA+p/EztuGuNXG9ULPqktb3ReMUSyMvFcxtgk1Xk5pWiH
	 AcC18yzR9mFkvDAKY4YX9IR0JhomxloM4MqHD0feCwEQEhnA6dL0AqzVE5Ea5Jm9d7
	 XT2MGhWOHzzhDtGOYiI42wviTOebSg/1u5fJHYSrxzcdomd0sTuPA0zZZJqd6x7bW6
	 ZNAAiuMbuc1yqnRHzWMlejmZrHyMqmZYixCKheStx6sSuZI09f+vmcSqQF1Di/gFsk
	 vjUXa6LuU4Jm3Um5Uk9Brossj80/7Bw9BSUO+n+qXK3UGmfpQ75feVVJSWXRRoSlmR
	 rhmutss1FC7zg==
Date: Wed, 11 Dec 2024 14:11:11 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: =?ISO-8859-15?Q?Heiko_St=FCbner?= <heiko@sntech.de>
cc: Lee Jones <lee@kernel.org>, jic23@kernel.org, robh@kernel.org, 
    krzk+dt@kernel.org, conor+dt@kernel.org, jdelvare@suse.com, 
    linux@roeck-us.net, srinivas.pandruvada@linux.intel.com, 
    bentiss@kernel.org, dmitry.torokhov@gmail.com, pavel@ucw.cz, 
    ukleinek@debian.org, devicetree@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
    linux-input@vger.kernel.org, linux-iio@vger.kernel.org, 
    linux-leds@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v9 1/9] HID: hid-sensor-hub: don't use stale platform-data
 on remove
In-Reply-To: <3196449.TQGk6oTFT5@diego>
Message-ID: <4s41717n-3888-os6o-384n-7678n0361r0s@xreary.bet>
References: <20241107114712.538976-1-heiko@sntech.de> <20241211120844.GD7139@google.com> <n914pn7o-pr9n-5ss0-p744-73402nnn843p@xreary.bet> <3196449.TQGk6oTFT5@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_051116_058176_7B5E4F0C 
X-CRM114-Status: GOOD (  17.58  )
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

On Wed, 11 Dec 2024, Heiko St=FCbner wrote:

> > > > > > This change was more or less a surprise find, because I wanted =
to make
> > > > > > the platform_data pointer in the mfd_cell struct const and this=
 the hid
> > > > > > sensor hub stood out as doing something strange ;-) .
> > > > > >=20
> > > > > > So patch 2 of this series actually depends on this change to no=
t cause
> > > > > > build errors.
> > > > >=20
> > > > > Ah, right.
> > > > >=20
> > > > > > But seeing that we're after -rc6 alredy, I would assume the bru=
nt of the=20
> > > > > > mcu series might need to wait after 6.13-rc1 anyway - but I gue=
ss that=20
> > > > > > depends on how Lee sees things ;-) .
> > > > >=20
> > > > > OK, I am keeping my hands off it for the time being.
> > > >=20
> > > > I can take it now with an Ack.
> > >=20
> > > Looking to apply this set now.
> > >=20
> > > Ack please.
> >=20
> > I'd preferer if Srinivas could ack this as the more specific maintainer=
=2E=20
> > Srinivas, please?=20
>=20
> The patch already includes the
>    Ack from Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> from a previous version, so I guess it should be ok already?

Ah, I missed that, indeed, sorry for the noise.

With that

=09Acked-by: Jiri Kosina <jkosina@suse.com>

and Lee, please feel free to take it.

Thanks,

--=20
Jiri Kosina
SUSE Labs


