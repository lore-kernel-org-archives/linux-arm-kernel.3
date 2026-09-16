Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31257C982C3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 14:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc
	:Subject:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lnsiuBxb1FQpxXJWR6gPEUhDTTJH491tjHU0LVsf0Ho=; b=zHYjlF1ygYlgExO0TquT63XmqY
	3TmVk1CCtru4bpxGzI/vfZ/tlUUW+2EvkNIJtZozYJBlyl5pXladd/1liPNo+stG6QN9hPZn2mlCA
	8+kQBq+RA2k+azYW2aswsr2+ZjjsA8gRmLGcGMBc5miypNmMtHWgGUvkl2wCmbcJuFpCiv7n+bKPR
	vc9oMeajVYTXZ5GREZjMOftooAVXNL2Ba2DGp1PyNSaugv1zVwDyB9yiDNbfP46QmJLtTvhzKDtKp
	lTfAE4kGYAcsmcn2pfghs3S9466poak+Wi6xtFIA493PUC7uTov8tPo5QMJDWXl+4hmHnKpoKDFrd
	3dZJVnew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6qkP-00000009RVj-1GVQ;
	Wed, 16 Sep 2026 14:36:30 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6qkH-00000009RTT-2JXP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 14:36:25 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 19EFEC5CD64;
	Wed, 16 Sep 2026 14:37:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0FF2060337;
	Wed, 16 Sep 2026 14:36:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0B9C411C7AFFA;
	Wed, 16 Sep 2026 16:36:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789569377; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lnsiuBxb1FQpxXJWR6gPEUhDTTJH491tjHU0LVsf0Ho=;
	b=Ds77EU29hHqrCKdSyQyb13FI02+4b7AhthNJ8FvUq+cR7psCg0OyhYTZ09yjcOrloJBc2K
	pFrwDPraez8EI+M+nueYy0ed4J1kpOJmdt6CgB4AkwbTtsoSgQwru87DZ2ldSelp/Lv8bl
	xFlorn0U/TQc3OgOoeSvLIWx2aWitcdJIq6VI7NJrpuG78Xxh4FJ3qjjM1+2HxtHGeJWMF
	JuhNDvZHKv8Mf1lcOU//4UL0gpW/j+oEh0Iqdv2JnhX9c4824qn9eAyzzdN9bYIceYD9nV
	KJBU/6p6qX9sTF9MxfM+rbaiNBWXkWlRo0SLWw0ciNWLPN/g6OFlyTHUtiq+Aw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Sep 2026 16:36:12 +0200
Message-Id: <DLGTEC6QXU0E.3MF7Z33ZQD9V0@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v4 2/4] drm: mxsfb: Add optional DPI output bus-width
 configuration
Cc: "Marek Vasut" <marex@denx.de>, "Stefan Agner" <stefan@agner.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Frank Li" <Frank.Li@nxp.com>,
 "Sascha Hauer" <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Francesco
 Dolcini" <francesco.dolcini@toradex.com>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, "Alexander Stein"
 <alexander.stein@ew.tq-group.com>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>, "Francesco Dolcini"
 <francesco@dolcini.it>
X-Mailer: aerc 0.22.0
References: <20260813092836.38367-1-francesco@dolcini.it>
 <20260813092836.38367-3-francesco@dolcini.it>
 <178954813309.214898.6895255097019153080.b4-review@b4>
 <20260916091543.GA277833@francesco-nb>
 <DLGP7GKZJBOP.350QK94UOGRYV@bootlin.com>
 <20260916114350.GB284106@francesco-nb>
 <DLGTA297W2SP.36MAJCYAC9O2X@bootlin.com>
In-Reply-To: <DLGTA297W2SP.36MAJCYAC9O2X@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_073622_069615_915C4180 
X-CRM114-Status: GOOD (  20.71  )
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

On Wed Sep 16, 2026 at 4:30 PM CEST, Luca Ceresoli wrote:
> On Wed Sep 16, 2026 at 1:43 PM CEST, Francesco Dolcini wrote:
>> On Wed, Sep 16, 2026 at 01:19:08PM +0200, Luca Ceresoli wrote:
>>> On Wed Sep 16, 2026 at 11:15 AM CEST, Francesco Dolcini wrote:
>>> > Hello Luca,
>>> >
>>> > On Wed, Sep 16, 2026 at 10:42:13AM +0200, Luca Ceresoli wrote:
>>> >> > LCDIF programs LCD_DATABUS_WIDTH from the selected media bus forma=
t. The
>>> >> > format reported by the downstream panel or bridge describes the di=
splay
>>> >> > input, but it does not describe how the LCDIF data pins are physic=
ally
>>> >> > wired on the board.
>>> >> >
>>> >> > These can differ. For example, a 16-bit LCDIF bus can be connected=
 to a
>>> >> > 24-bit display by wiring the available color bits to the correspon=
ding
>>> >> > display inputs. In that case, using the display's 24-bit format to
>>> >> > configure LCDIF selects the wrong data-bus mode and changes the as=
signment
>>> >> > of color bits on the LCD_DATA pins.
>>> >> >
>>> >> > Read the optional bus-width endpoint property from the LCDIF outpu=
t port
>>> >> > and use it to select the media bus format used to configure LCDIF.=
 This
>>> >> > allows the LCDIF bus mode to describe the physical interface
>>> >> > independently of the downstream display format.
>>> >> >
>>> >> > When the optional property is absent, or it has an invalid value, =
continue
>>> >> > using the format reported by the downstream display device, preser=
ving
>>> >> > the existing behavior. The code is not validating the DT for
>>> >> > correctness and just fall back to the previous behavior in case of
>>> >> > errors.
>>> >>
>>> >> Why? Generally speaking errors are better spotted immediately, not i=
gnored
>>> >> silently.
>>> >
>>> > My understanding is that the C driver code should not validate the DT
>>> > and that this is the general recommendation when parsing properties f=
rom
>>> > the DT.
>>> >
>>> > The DT checker is going to spot errors in the DT even earlier and in =
a
>>> > static way.

Ah, I forgot... I fully agree static build-time checks are way better than
runtime error checking code. But they are not done as a mandatory and
unconditional step during a build, and so not everybody runs them. Moreover
checks are added over time, so even if all checks pass today some might
fail in the future.

As a result there are plenty of devices out there with invalid dtbs, and
they just work by chance.

It's the hard reality I'm afraid. :(

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

