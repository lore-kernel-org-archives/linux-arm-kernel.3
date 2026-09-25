Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5420C98321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 16:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=foA8UbomajTa22DkRxj3005Wjy2ttgaDybzSQGdZd1s=; b=W5nUnFK6se0gUDtTKIOllsBSUK
	95xoKBQMq6oqck8CsIdh0Af1SRh2vgRDWRw2EKEIAokv/vIDa9K1H854UpOdIxE+YhJDX9gPatwhu
	Ka+aFeYE6jzaBNE5MIFh8029Xw7HrGwiwnhR/F7Rb43X/bjVLpypA9BKiBWfMpEMIYlmnEZ79x/4o
	8/dYb8g9Kbfa6NgkSGEOveeI3TJJlZmphv/EGTUfMK5V8l6SiTDSEFjl8RSkIDZfq5rZY/gWPuJUm
	NoDHp4GH94WjDKdX9KndmoFqoGvFbvzZAhtnnIM3VT2lrFxNJMAHJJv1r/DHuSX/eKrwV4la7GcaZ
	1QXh6v2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA8ro-0000000DwaO-3Yqh;
	Fri, 25 Sep 2026 16:33:44 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA8rl-0000000DwZD-0hM4;
	Fri, 25 Sep 2026 16:33:43 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 501C94E4106E;
	Fri, 25 Sep 2026 16:33:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EE3D46073B;
	Fri, 25 Sep 2026 16:33:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A19C0102F1E2A;
	Fri, 25 Sep 2026 18:33:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790354012; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=foA8UbomajTa22DkRxj3005Wjy2ttgaDybzSQGdZd1s=;
	b=UVIlKBXcttrLLrKy6BGsauS7t/MyVySVo242G5oaPV7ZhSacbtUL9/V/bjZW7WNZtfq1nR
	+p0xFsBSa6zjnsGOeaC4k55ZqS4p+L8CxFJ1kj9MDub7xt9b3MNbX/WBAAq8ZeIMvJrNJN
	SfRoXd/ROpQ7w178tshiDhesA0DA7g37XVn2x5dwzGwQywmZcqUx40vWCBnfSSsYwE+JWR
	RXubplVcLtikf8ywNM5oq/ITzF96yQOLn6ut5IGpZZm8xsnwWbfhqacoN8hxaeuPcZ74XL
	FwQynJsoxdHzXMb8CFGKszltbAs2WVNKelNcVq7xoiwSgsz1TAy9wZGUtAtoEQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 25 Sep 2026 18:33:15 +0200
Message-Id: <DLOJIV124RG7.27SOPEOHBTA7W@bootlin.com>
Subject: Re: [PATCH v3 12/19] drm/mcde: dsi: don't create a panel_bridge
Cc: "Luca Ceresoli" <luca.ceresoli@bootlin.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Jessica Zhang" <jesszhan0024@gmail.com>, "Laurentiu
 Palcu" <laurentiu.palcu@oss.nxp.com>, "Lucas Stach"
 <l.stach@pengutronix.de>, "Frank Li" <Frank.Li@nxp.com>, "Sascha Hauer"
 <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Paul
 Cercueil" <paul@crapouillou.net>, "Paul Kocialkowski" <paulk@sys-base.io>,
 "Inki Dae" <inki.dae@samsung.com>, "Jagan Teki"
 <jagan@amarulasolutions.com>, "Marek Szyprowski"
 <m.szyprowski@samsung.com>, "Sean Paul" <sean@poorly.run>, "Jonathan
 Corbet" <corbet@lwn.net>, "Shuah Khan" <skhan@linuxfoundation.org>, "Randy
 Dunlap" <rdunlap@infradead.org>, "Albert Esteve" <aesteve@redhat.com>,
 "Anusha Srivatsa" <asrivats@redhat.com>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>,
 "Ian Ray" <ian.ray@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mips@vger.kernel.org>,
 <linux-rockchip@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <asahi@lists.linux.dev>,
 <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>,
 <linux-tegra@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-samsung-soc@vger.kernel.org>
To: "Linus Walleij" <linusw@kernel.org>, "Maxime Ripard"
 <mripard@kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.22.0
References: <20260916-drm-bridge-every-panel-v3-0-83afb4f1a707@bootlin.com>
 <20260916-drm-bridge-every-panel-v3-12-83afb4f1a707@bootlin.com>
 <arInho2bsfJiCgjV@houat> <DLNCQEG62F5N.O98WAO4U2FJO@bootlin.com>
 <CAD++jLkk-a0MrQUiaDD8OoDDoYVwBwSjFTj5ZBy=Xo7MS4+01g@mail.gmail.com>
 <arTlpd-KAsVpj3UH@houat>
 <CAD++jLmktDoqn2EbXsNnyGRudo-q2NCxUf+9ZjeU+WrY4CBMWw@mail.gmail.com>
In-Reply-To: <CAD++jLmktDoqn2EbXsNnyGRudo-q2NCxUf+9ZjeU+WrY4CBMWw@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_093341_361299_3750FAEE 
X-CRM114-Status: GOOD (  13.14  )
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

Hello Linus,

On Fri Sep 25, 2026 at 6:25 PM CEST, Linus Walleij wrote:
> On Thu, Sep 24, 2026 at 10:57=E2=80=AFAM Maxime Ripard <mripard@kernel.or=
g> wrote:
>> On Thu, Sep 24, 2026 at 09:51:53AM +0200, Linus Walleij wrote:
>
>> > > Linus, unless you have more info I'm going to apply the patch as
>> > > is. Removing this special case would be welcome as a later patch.
>> >
>> > I'd say go ahead as-is.
>>
>> I'm fine with that, but I really want this removed at some point.
>
> If Luca wanna fix this up (drop this path) that's fine by me,
> else send a patch immediately after this is applied and I'll
> ACK it.

To avoid postponing this series I plan to apply as is on Monday. I can send
another patch later to remove the !panel case.

Thanks for the feedback!

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

