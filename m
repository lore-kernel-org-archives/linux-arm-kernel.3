Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C85CD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 09:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=khYHto0da/rGsGN1yk7Vbe05HTgfzl5xI2TS8KPj3Tc=; b=mR8H3kiCgGxwcpWAYj87MojrT4
	yaXXN4ioCMCRy0udxhWapC4ZJKycUzXvdHF88rbPWD7IFvNk0nwGNk/Py0EJfqkc941IMNtrYIqje
	NzGTno3Rm5UnAxCUtFDxDS2PSok8dvSaBDJPleDAJ+3B4XMnpobis0tajbV3heBDvTJl6c/XI+4lc
	9fmThCWy/BY9oZTJv+0slmtpWjfGWCYyy1KhWfB88FqlxwAHLmm9qU/CdT/MTsKY7u6iQWAasoOSI
	Xqq9gXaTOXN06J7A/fyONwGD/6aK/cT6USVCN5sBfWC4q7KXFvzxihLQSWaHF8xG0ZkRsBsGfbw8p
	xzZaRh1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRoMh-00000001Z0b-1PC6;
	Tue, 26 May 2026 09:46:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRoMe-00000001YzQ-39GT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 09:46:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DC5DE60018
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 09:46:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 948ED1F00A3F
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 09:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779788779;
	bh=khYHto0da/rGsGN1yk7Vbe05HTgfzl5xI2TS8KPj3Tc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZC4nw5RlVagCmmwh4piDdw1J2TtzBgSQ+gE2+/aAu4gq5Ues8ljzCh5XrVTRPMPAl
	 wQrjB+ZBvM+3odSH4XpiLeAErDAIbRLShUgJ2xSBGmAnFejCqUJJMHEbwIhMIkeAnN
	 V6IDBUtlQZ/q+YN45k7LpxS+1jBMMrq+tPTMwqP5ZZZhOHV7sfaTIrjZ37daUqn29N
	 FbWR2IY0/ZwxyOVioJM/6adNGD9JE5ucr8yJ4kNcWemjyQPWiBevgsATkU/FV0ZwO+
	 YA7Q3VnJbvVFECOdTok7R3VkgeL5Hb6um2GYL5R4ozYD09TUBXC9pysNClMrx8bXqj
	 vwL745W8zPYwA==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a85b30dd54so11095286e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 02:46:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8NCiDZLJeRqPXKOB3Y4tAnERbnEhxOmmM2NqseBtxi0cllBwktEAvPJMIMRdal/trbi2vQG/wqtMuGkMZtswDo@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4goa/K6JMqZb7a7wo13P/uNIl3EONEgDKdepvrl+bx1lthOFC
	YrMNMALk7WTJNBCP4nKXo6NE1IfpNGZOLuz30Z/x5+BofutSelozIPxvX3C1WHXWBslZbdU2w63
	xxzETvbJW0dKTiVvBmzWSQ5cWIN5AGCE=
X-Received: by 2002:a05:6512:a91:b0:5a9:163a:9ebc with SMTP id
 2adb3069b0e04-5aa32328f6emr5890808e87.19.1779788778299; Tue, 26 May 2026
 02:46:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260523-pinctrl-imx-v1-1-73b7cb731351@gmail.com>
In-Reply-To: <20260523-pinctrl-imx-v1-1-73b7cb731351@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 26 May 2026 11:46:04 +0200
X-Gmail-Original-Message-ID: <CAD++jL=YqfDXE9OgKX4fbk0FgK8=W0gWMVHJ1icmHkRd4pN5JQ@mail.gmail.com>
X-Gm-Features: AVHnY4K6rfRItQ-L5UFwu1FlZNpnb2Hkdgdyqdf1qhLTp0XnK7hfhnYE8AoesZ4
Message-ID: <CAD++jL=YqfDXE9OgKX4fbk0FgK8=W0gWMVHJ1icmHkRd4pN5JQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: imx1: fix device_node leak in dt_is_flat_functions()
To: Felix Gu <ustc.gu@gmail.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Sat, May 23, 2026 at 12:27=E2=80=AFPM Felix Gu <ustc.gu@gmail.com> wrote=
:

> for_each_child_of_node() holds a reference on the iterator node that
> must be released on early return. imx1_pinctrl_dt_is_flat_functions()
> has two early return paths inside the loop that skip this cleanup.
>
> Replace both loops with the scoped variant so that the reference is
> automatically dropped when the iterator goes out of scope.
>
> Fixes: 63d2059cd665 ("pinctrl: imx1: Allow parsing DT without function no=
des")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>

So what we got here is a non-critical patch on top of something that was
critical and was merged as fixes. (A minor memory leak is not critical
and not -rc material.)

Linus (the big penguin) has been annoyed of too many noncritical
patches going in as fixes recently so can you please resend this after
the next merge window? (I will try to remember the patch as well.)

Yours,
Linus Walleij

