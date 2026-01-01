Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC25EED603
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 14:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k9G+v9hfFk1rhx4A9hpF/JlcAGH8pcP9LimMReXWBMo=; b=kwpij9Pq24EGrjiib20FUbTQoX
	T15mC0U+ToP//LraTydFr/YDhfHJC7ANlDIAQCmaCImy/Q+peCOmzmT10DMjeYvzCUCwI8+RzIazJ
	CQlU+SWJapiQuVgK2kxWsxXOMBkGbQRWIYC0zwYfoRMr2iR6SFYWGNgkhi4z0m3uR7UNEgpeegTeS
	/S4HiAts/zKtPKdClAfKuaXVBcn9XslMsb6QEyJnDlijp0yonpy3I2jluc0ltjQHqcwqw3fz+FUGv
	w5p1Blv95L3GbGG6jCYvkaAgM3ebNM9aayw6FZEI+a4a3djwWNa8Hnazn+z9axJREIqRqZOlCDASf
	viJRbZJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbJpv-00000007HSY-0jdF;
	Thu, 01 Jan 2026 14:39:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbJpt-00000007HS6-0GdK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 14:39:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E952E444A2
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Jan 2026 14:39:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C618AC2BCAF
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Jan 2026 14:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767278371;
	bh=G22NoFIfnxEZGwQ6tAtIuLaQkO46dzLxaedEFtwTcC4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DwWngGvHdL4LRVL+W3/zGNJVIi2ueYKzZWqO6oar/5xbgPkJ7V02ldgGoGjP9LrU+
	 kEgcarLWZ6OlQgiF31k2CPqoxT2hzGVpAWagn38SfQt5FNCA5zV7Cp0hXh6NLEDfDT
	 twGhjSBiQNDUBCfwfSvq+Om0OQNBBb/QKqoncYeQlgziB21Zs+29HzP7/HIHWenuXN
	 xXKbULKBTwvLefsCKlYiz5KJ1LovChIXPAuDigDwJciutML/KS0OZGaUl9h5N65+m8
	 ePrCctS7UbkhWF9QBHdzFG8ABtFEhDqK6eCr3O+BEGqPzcH4BuOdzJI8oxz0RpDFNC
	 K+YiBbuzeBs6A==
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-787df0d729dso91751387b3.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Jan 2026 06:39:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXcXfn97+PkqjCmMgZUVpgYJ0n4QLgO/yTi+PJX6bkoQxSToENyGAKylRDMJcCYCbcIx2Ray3mvm0uPEM0AtLyN@lists.infradead.org
X-Gm-Message-State: AOJu0YxPTMXufghKo5WB9lJLb8grHZB3t4PXcJx7hpH9RoC5SZfo7At7
	RnMnNDTAiLA8FXAkeZ+2d8xnV3S8/RXcp3aeUGjL2yAjzVeT/F9mYBR21ADReMUDJAdqUBokzjK
	0GzdmM2V8Mok4R+mH/QUyKmTM7lLmh2c=
X-Google-Smtp-Source: AGHT+IEchp04KmAZ5T+gOBq+28XFhaa1bKaz5ZkO9N8HZ8/JFUpg+aWJY2a+WRe3EbLOGL4KfdGvOZjgCZzWV1MbKJI=
X-Received: by 2002:a05:690c:4443:b0:787:f793:b573 with SMTP id
 00721157ae682-78fb4091502mr326959257b3.29.1767278370986; Thu, 01 Jan 2026
 06:39:30 -0800 (PST)
MIME-Version: 1.0
References: <20251217-imx952-pin-v1-0-2747f09144dd@nxp.com> <20251217-imx952-pin-v1-2-2747f09144dd@nxp.com>
In-Reply-To: <20251217-imx952-pin-v1-2-2747f09144dd@nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Jan 2026 15:39:20 +0100
X-Gmail-Original-Message-ID: <CAD++jL=6bMXHp4KuVN7xxSidZDhuxLkuiJRnjybJxk4pVeeEFg@mail.gmail.com>
X-Gm-Features: AQt7F2rvyquc560DHr734TPz3A-2hmEAxTBsn2s_Ehck2JwoUtyVn6mnDzTXWW8
Message-ID: <CAD++jL=6bMXHp4KuVN7xxSidZDhuxLkuiJRnjybJxk4pVeeEFg@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: imx: Add support for NXP i.MX952
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Sudeep Holla <sudeep.holla@arm.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	arm-scmi@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_063933_121917_45909A82 
X-CRM114-Status: UNSURE (   9.31  )
X-CRM114-Notice: Please train this message.
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

On Wed, Dec 17, 2025 at 3:41=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:

>  static const char * const scmi_pinctrl_imx_allowlist[] =3D {
> -       "fsl,imx95",
>         "fsl,imx94",
> +       "fsl,imx95",
> +       "fsl,imx952",

Where is the binding for fsl,imx952 merged?

$ git grep fsl,imx952

on v6.19-rc1 yields nothing.

Yours,
Linus Walleij

