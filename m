Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F1CFC53200
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 01:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o3I//fWT/Ahu1TRVuSuKOsa5VptGAjlzU/RAQ0KA2Gs=; b=CLxkJ4zkB96DZk+X5cU5RGeP+s
	D9+FngxwZtO7fu3GD1PGRVYZtqZAgU8RP/rz9N7Dgx2KwBP60mmDeYfKyB9c9rsIyGRjvosblRyPi
	7Ti6Sg2cA65ZiemeA7OwaDYHJNGF5ddKsg5gYdtd5DwXWblC0cW6V/mYuy70vVXwp2zJRkX8uHl6j
	9YZk4aJa+zsnnaSFtP/Byu9Fhnvf8ZoJWT65XXpRu8dhTZC72rU4oVtYUH+v7LpoX64iPf1FXTE3d
	Ra6hTxNLpj+Sbp07SISvPmMthbGEEvS6Oh0L6loAkXVzvCLyQEVdIXclou9LyqCLkcb1bk0AeAvYC
	sOuySe5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woAHW-00000001mRJ-3tLc;
	Mon, 27 Jul 2026 01:37:26 +0000
Received: from out-172.mta0.migadu.com ([91.218.175.172])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woAHU-00000001mR1-1ac1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 01:37:25 +0000
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jul 2026 09:37:03 +0800
Message-Id: <DK8YVZNAFKSP.1JHSI6NI6LLYZ@oss.qualcomm.com>
Cc: "Alexey Brodkin" <abrodkin@synopsys.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Joel Stanley"
 <joel@jms.id.au>, "Andrew Jeffery" <andrew@codeconstruct.com.au>, "Frank
 Li" <Frank.Li@nxp.com>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>, "Hans de Goede" <hansg@kernel.org>, "Alex Lanzano"
 <lanzano.alex@gmail.com>, "Oleksandr Andrushchenko"
 <oleksandr_andrushchenko@epam.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-aspeed@lists.ozlabs.org>,
 <linux-arm-kernel@lists.infradead.org>, <imx@lists.linux.dev>,
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 0/8] drm: replace simple display pipe users with
 atomic helpers
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ze Huang" <ze.huang@oss.qualcomm.com>
To: "Linus Walleij" <linusw@kernel.org>, "Ze Huang"
 <ze.huang@oss.qualcomm.com>
References: <20260727-drm-simple-kms-removal-v3-0-cd5dc89858c6@oss.qualcomm.com> <CAD++jL=x2Ya_MXrO7FGF6WDzr4dv83K8-TS2AWkA2O0Dko8G4g@mail.gmail.com>
In-Reply-To: <CAD++jL=x2Ya_MXrO7FGF6WDzr4dv83K8-TS2AWkA2O0Dko8G4g@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_183724_558836_EE0F34E4 
X-CRM114-Status: UNSURE (   9.69  )
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

On Mon Jul 27, 2026 at 4:32 AM CST, Linus Walleij wrote:
> Hi Ze,
>
> On Sun, Jul 26, 2026 at 9:45=E2=80=AFPM Ze Huang <ze.huang@oss.qualcomm.c=
om> wrote:
>
>> struct drm_simple_display_pipe was meant to simplify simple DRM
>> drivers, but instead adds an extra wrapper around normal DRM atomic
>> helper setup. As noted in Documentation/gpu/todo.rst, remaining users
>> should be converted to regular atomic helpers and stop depending on the
>> simple-KMS interfaces.
>
> Are these patches independent of other stuff so they can be tested on
> top of v7.2-rc1 or do they need other stuff from drm-misc-next?
>
> Yours,
> Linus Walleij

Hi Linus, patches are independent and can be tested on v7.2-rc1.

I've seen others patches based on drm tree so I did the same. Would
switch to v7.2-rc1 if that's preferred :)

Thanks,
Ze Huang

