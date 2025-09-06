Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D623DCA1002
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 22:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KzeMoy+s6zlBpD4M/aQEK34/gvEbH55hwUN+nBdLWrs=; b=puJlYP6AwW2qBbEQBOLAqvSED8
	KCw8b4B9tkGbXOnYP0tP+yjE3Jxz8UsSI5NSM2tiX74hK/CyDUkZR+w5BoLb4jjHNVWI50z92cEPt
	ftUs9CmlUy2cbHK90iaMFUFZ7WeSWl7JvtRymC8f6feVJxWJdy+lI/cQJw1ql4X8JmuxWs2r7Jefu
	xwE6SO6f6FgODyVC6ZxifwBaK3TKcJZQKkF/a3mUb2gbreEQZABtPt4yekhV+RQgcWLC2KA321wx+
	o24Lcw+SP8SrSEtFUmuwErnuqj9Qs8C8okrURSKwZemWa3w3wR3XOa7ARmctXRr0bTamSxAtozBeA
	9QErx5UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uv1ji-00000008c7f-1wtn;
	Sat, 06 Sep 2025 22:50:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uv1gv-00000008bG0-2eW3;
	Sat, 06 Sep 2025 22:47:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C35A4447C3;
	Sat,  6 Sep 2025 22:47:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5916C4CEF8;
	Sat,  6 Sep 2025 22:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757198848;
	bh=M7YBY+PlDsud3ulKo1KwxdTk5HjWLgupena6NkeHIHw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZdUqjPcCFBZU+8Sntt/qoKCyGcPgXjIZ2nTgx/DSehkzWZ2IwIiXNiCIbXnKUupbc
	 3mlL4BU8Cwe2G4TRNuVG1Z7DXnsT3XXTY4c1XLiUQ5jRLrHsFOEyLNAgblpxoP+d22
	 crQuz6CGyFEcVfB3VslIAJ4yN0IlAe1pRjUe+ZLTPSVnc7lM7j0yxoJzpnpV7pk4QN
	 +7YcDnq0xMqdggvftm7sNM8YX5YbgoZznKbEiubiT4a51Nv2TYAqNLYtSuPxM4D8qZ
	 YZJ3S3yDLOTghMAKTp2Ezq9kI1ns0tScHi1rYFwB37MwGhwsZaXPlMkkZof3KhGV8r
	 RR8ja7xVL8+1g==
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-61e27ee0ae4so431233eaf.0;
        Sat, 06 Sep 2025 15:47:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU4I6lGNIt513ypNOQ6OydQsz6LltXD6UUSVU/Qrtaa/vLwrZ7A3HmnTqVQe80gA0qUycJ+mfVC58QUM7FTm+4=@lists.infradead.org, AJvYcCXP8A+UbWQ9Ni/dvlA+tyKmzNph3C2WHq178HuuR1GLegMmG3d9ztH0JW1wFnzQZRRbLUXc96BC5NavKcVmJVO+@lists.infradead.org
X-Gm-Message-State: AOJu0YwcIusoEcmxOe4Lk+TaJWhpeiuPLBLKJesP4g6lauuUf3ew422x
	en3nEHMAZjV9EG9C9+pMg/uYPMHhhebXR+8K4seDAJDGTT4ONBKsX2Pgk18Uz46ZRA8+27vju1r
	znUnijKeBXI0WKWqeZZlSTtx03sJFiAM=
X-Google-Smtp-Source: AGHT+IHBlQQx0DcSn8WrGT4miIP8Bx5UtUX4jRnhfFKte1qQJwWT9s2fgjzoWbt6eQoAFyWjweW4FuIn9+Y2+ALRETo=
X-Received: by 2002:a05:6820:2222:b0:61e:2938:640f with SMTP id
 006d021491bc7-62178ab6dd7mr1273240eaf.8.1757198848123; Sat, 06 Sep 2025
 15:47:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250530-rk3588-dfi-improvements-v1-0-6e077c243a95@collabora.com>
 <20250530-rk3588-dfi-improvements-v1-2-6e077c243a95@collabora.com>
 <CAGTfZH1DzC9odJVDfYCYw4+Ph5_1CjmrpqR_NUFh1SsVVVLM0g@mail.gmail.com> <24752023.ouqheUzb2q@diego>
In-Reply-To: <24752023.ouqheUzb2q@diego>
From: Chanwoo Choi <chanwoo@kernel.org>
Date: Sun, 7 Sep 2025 07:46:50 +0900
X-Gmail-Original-Message-ID: <CAGTfZH3RikS1XRkxjs6vU3yvw4kayRK2u17_zpqodioKJF5mNA@mail.gmail.com>
X-Gm-Features: Ac12FXxhJBnicQpzbdTVw-Dc0dR90IgnZqqaWnW_MXUfhdwqDh4MQlNQ-InNBH0
Message-ID: <CAGTfZH3RikS1XRkxjs6vU3yvw4kayRK2u17_zpqodioKJF5mNA@mail.gmail.com>
Subject: Re: [PATCH 2/2] PM / devfreq: rockchip-dfi: add support for LPDDR5
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, kernel@collabora.com, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250906_154729_695632_08E701B7 
X-CRM114-Status: GOOD (  12.88  )
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

On Sun, Sep 7, 2025 at 3:38=E2=80=AFAM Heiko St=C3=BCbner <heiko@sntech.de>=
 wrote:
>
> Hi,
>
> Am Samstag, 6. September 2025, 18:09:53 Mitteleurop=C3=A4ische Sommerzeit=
 schrieb Chanwoo Choi:
> > I'm sorry for late reply.
> >
> > Looks good to me. But, this patch contains the change of following head=
er.
> > If there are ACK about change in include/soc/rockchip, I'll merge this =
series.
> >
> > include/soc/rockchip/rk3588_grf.h    |  8 +++-
> > include/soc/rockchip/rockchip_grf.h  |  1 +
>
> done :-)

Thanks.

Applied it.

(snip)

--=20
Best Regards,
Chanwoo Choi
Samsung Electronics

