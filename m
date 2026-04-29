Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D72FF887E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 17:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/kb5CXOOm0mj4ODKw/K4npAFTtH0bYa0bnYZ1mb4DgI=; b=lppvf3NTsWk9GAk+5JkDa/b+5v
	DXgUS8wqBov+Z8nDonWUEXTwiHw7txZf75S7NY6mJbwiIgvF+NemXDPC6tLoahkqWHbrcG8Cy9Q0g
	4oiTIt08nx64VE0qs4LBkgjkhqRPSEKV+tfeL7tAxA+AI/IY2fQKEnGR2vAZirOExoKcNyb3LWWSD
	2vXfu2hb3akNyrTG0ZlUHX9rOIb4XZqF1AERuv2J5/WP6HvugKD1Io/Y6ZlMDopsNYJxq4IQd0ila
	J92x8OInfC+QSPQTLgK9OFIozDpmZwM2L/HwbBo1azjwqiaimFn94vL4xI+fFcOhfsP3HcHSvYSmH
	IgopfkTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI8n1-00000003yjN-3Vsv;
	Wed, 29 Apr 2026 17:33:35 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI8my-00000003yhf-2Euk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 17:33:34 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-66ba9dfe83bso52993a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 10:33:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777484010; cv=none;
        d=google.com; s=arc-20240605;
        b=YYMEtWIuKPs9Thp6+gCbWcAqL7T+X1OR5Wnyd1/NvNBIOYS0IVZyAoosd9t/G+xX8p
         7HitdPzRol5zk3yXspHCoturAiP70BnJHjtYOHTnZyL49+IRoBtILLiDJAYcv6JgH+V4
         sBGH0Ie+7WDubaAeQAEC4pjlXmRhUJdTWtJ45YOVNd9eiKkB4xb0j5kwr9yRj906laCy
         rCsVv+RO7VsOfIFXwPUBV2bU+KFrYrLwDXy2ei8Fl1y2kRseY3kcm+62nAuSHI3rF5bb
         rIS4xBUBsIdGwBV04ObRwOfV3sBpnzkvjMDVuaKwU1SY5jeaU+2zn9fIvOeVZJGFiNJR
         g4zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/kb5CXOOm0mj4ODKw/K4npAFTtH0bYa0bnYZ1mb4DgI=;
        fh=cQCKVpXzJglEmjqj+4mhm9LUovSD67I13HjqbjoFz9U=;
        b=CSkxoxt3ozFFi+g0dXS8dxJ1iJrAjjrQOtQ1R70nxON9mImfaDq3RbrBhq5dIYeJUD
         tmgsfVErnfqdyvUBDgdWW8ugCdD89mUQ/qwRkmaZ70595hJ+UYQbdVq1L16qd7iEr9j5
         juilo5GyefO/O14fW0AilW+sAOq0lWdDuJsCy5+l234+LsviHHV4e1W786zRtjTAzy8+
         pw+K7rnHmJVAbpfgS0dh9YY6JiI5M0m5+pFcM/gaClOX6xpkc/PGzIqgGQG+8oF1B7MC
         sX1+N7fa6t5qyM0kO9uuwX07pGmufURWfpBB4X+GPQA5PupG+z+kDmDlyY0LKRBFRQzj
         Ofmw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777484010; x=1778088810; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/kb5CXOOm0mj4ODKw/K4npAFTtH0bYa0bnYZ1mb4DgI=;
        b=EAMvYdz6pIiQqxOQlE6DkIIIoHjgeBx6BLZyPN9szBCzYsH/C28tp9VeGEeatRBZaH
         fwlvjxSINzLLHxzlD9r7zw7wsVRHnR67VRvenj6eldY44RrlnyH0DTkgX0w+tPrcnFoD
         pZzVyIM1zEjjQ+049rGPPwKmT6mgL95ouoveoV1LStwP2oW7eVGr2sX4WSGf42dRZ6KT
         4Pd2hF+5lkhnKyWQXrcrIRirw9EVupg9AYnWHEM0zPSc2Xd+6bYQm/3cYZgZCt1tp54y
         Vkc/mysRIbEVpRPBo9Ht3BHxVpn+6UGaSmuReUA6p1uDCW5I+uwBt0v5VMvyBbk1nytT
         orBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777484010; x=1778088810;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/kb5CXOOm0mj4ODKw/K4npAFTtH0bYa0bnYZ1mb4DgI=;
        b=DrD8Ido83IJOqAp7fPDfUuJX9owXz5bPsb65qb4RPZPcGIACc/JJYB/QYue6N0oFAG
         PgUOzXDdX88oIwRm1Dj9mGMfg0r//klmhxNGESMGi0ZinXDu+O8ch75QuYJNberv+Ctg
         2utFVsCdW0Qq0CHl/2XDMt6myXqguOWn57vfAkuKDgfdrbDR9Xq4/KmlvzcSrv0UAgMy
         QYagROfWh5QIoZ1Ehcb/vtx829huSAmM3lnqE9h3hGzHKa6uhCBte6K9/ByMEd7p3P09
         180m4I0Dnhq+3NfakHEzHZVdBSoNyjtZFyIYUyNtV463Z7FDuN6flYqHLFYl+UAZmTpG
         h2Yw==
X-Forwarded-Encrypted: i=1; AFNElJ8hNxkUunUr8wnoKHy5c8WFaB+5Dyt4lZTohb90Ww2uUUHlQ750RvuVTTaERt88RBjhAdyn3GAUz0/mgrN8DAqm@lists.infradead.org
X-Gm-Message-State: AOJu0YywLHjdF9ZyrP5wUkVGGCBZFlD3YVXhC+/uOJtnYMhXF/eNiUXa
	/TlZFgrorfb4oFMo4dP91IN2k4FM3vAUKjz4Ed7F0PPyXD/lmXCc9eiGaqZxbVtUh6tO23pbRw6
	Spax5ZfBMK/mk2hoV0IiOjr7bbzHshWxIo7r3BZuZbg==
X-Gm-Gg: AeBDietqxEcM0JueMEzeX8r7pQXqFxge0Si9kkRzEHToJr9XRDtc/Ler/F0+hVshEXe
	bt7FkDB4uSpSdByV8AqnWlDmiCDwX84VoLOXUcqX/3UGU25AwlMaF/ze82zwMvqImUkQe91IJOh
	mA91b7CMf+SS9Zch+ZyxSZqYKXN8bl8g4ANuf6QN+aT/2stQuzWfyen4Ur/4GTKTCq2c4IDE71O
	l/Lux6Q8zq4/kBpl7yRNW/qE7U3F9qOBHzlCLGx1bF8c4BMOrAyYOQ+Yz7nSHd9SF8OZ+QUjklb
	AyvlsiK6uJbcTsPP9uBiJidUyYpanlqB80tsBqwVp/wUGYoWzUGz
X-Received: by 2002:a05:6402:1ed3:b0:672:5255:af77 with SMTP id
 4fb4d7f45d1cf-679bb07ee71mr5034063a12.13.1777484010328; Wed, 29 Apr 2026
 10:33:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260422212849.1240591-1-shenwei.wang@nxp.com>
 <20260422212849.1240591-4-shenwei.wang@nxp.com> <22fb5fac-2568-42be-a7e3-7e89d0017eb3@ti.com>
 <PAXPR04MB91850A11C58419C03909145F89362@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <6412a758-4560-4cf1-a0d0-5b24d1a715f1@lunn.ch> <PAXPR04MB9185009A17DFDF3D6C8B44E789362@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <6e01e114-e336-4744-b6b4-563ec42e321b@lunn.ch> <PAXPR04MB9185A098D894B6A6EBCC13F889372@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <afImuoeHolxGgw3H@p14s> <PAXPR04MB9185F2F6DDB55AC56C92D63B89342@PAXPR04MB9185.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB9185F2F6DDB55AC56C92D63B89342@PAXPR04MB9185.eurprd04.prod.outlook.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 29 Apr 2026 11:33:18 -0600
X-Gm-Features: AVHnY4KBveuXaT50xXGT561BJAnz_p9YSdb7SJnI5b60PkMgL6_ZMJ8SGU0KF-U
Message-ID: <CANLsYkwvL0Z3+12MD=J+Dc2yAU2T8ypizyG=6AhYoWOh55odHA@mail.gmail.com>
Subject: Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Andrew Lunn <andrew@lunn.ch>, "Padhi, Beleswar" <b-padhi@ti.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Frank Li <frank.li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_103332_635512_9B0FF307 
X-CRM114-Status: GOOD (  26.85  )
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

On Wed, 29 Apr 2026 at 10:53, Shenwei Wang <shenwei.wang@nxp.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Sent: Wednesday, April 29, 2026 10:42 AM
> > To: Shenwei Wang <shenwei.wang@nxp.com>
> > Cc: Andrew Lunn <andrew@lunn.ch>; Padhi, Beleswar <b-padhi@ti.com>; Linus
> > Walleij <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan
> > Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> > <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn Andersson
> > <andersson@kernel.org>; Frank Li <frank.li@nxp.com>; Sascha Hauer
> > <s.hauer@pengutronix.de>; Shuah Khan <skhan@linuxfoundation.org>; linux-
> > gpio@vger.kernel.org; linux-doc@vger.kernel.org; linux-kernel@vger.kernel.org;
> > Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> > <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>;
> > devicetree@vger.kernel.org; linux-remoteproc@vger.kernel.org;
> > imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org; dl-linux-imx <linux-
> > imx@nxp.com>; Bartosz Golaszewski <brgl@bgdev.pl>
> > Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
> > On Tue, Apr 28, 2026 at 03:24:59PM +0000, Shenwei Wang wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: Andrew Lunn <andrew@lunn.ch>
> > > > Sent: Monday, April 27, 2026 3:49 PM
> > > > To: Shenwei Wang <shenwei.wang@nxp.com>
> > > > Cc: Padhi, Beleswar <b-padhi@ti.com>; Linus Walleij
> > > > <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan
> > > > Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof
> > > > Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>;
> > > > Bjorn Andersson <andersson@kernel.org>; Mathieu Poirier
> > > > <mathieu.poirier@linaro.org>; Frank Li <frank.li@nxp.com>; Sascha
> > > > Hauer <s.hauer@pengutronix.de>; Shuah Khan
> > > > <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; linux-
> > > > doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix
> > > > Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> > > > <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>;
> > > > devicetree@vger.kernel.org; linux- remoteproc@vger.kernel.org;
> > > > imx@lists.linux.dev; linux-arm- kernel@lists.infradead.org;
> > > > dl-linux-imx <linux-imx@nxp.com>; Bartosz Golaszewski
> > > > <brgl@bgdev.pl>
> > > > Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg
> > > > GPIO driver
> > > > > > struct virtio_gpio_response {
> > > > > >         __u8 status;
> > > > > >         __u8 value;
> > > > > > };
> > > >
> > > > > It is the same message format. Please see the message definition
> > > > (GET_DIRECTION) below:
> > > >
> > > > > +   +-----+-----+-----+-----+-----+----+
> > > > > +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
> > > > > +   | 1   | 2   |port |line | err | dir|
> > > > > +   +-----+-----+-----+-----+-----+----+
> > > >
> > > > Sorry, but i don't see how two u8 vs six u8 are the same message format.
> > > >
> > >
> > > Some changes to the message format are necessary.
> > >
> > > Virtio uses two communication channels (virtqueues): one for requests and
> > replies, and a second one for events.
> > > In contrast, rpmsg provides only a single communication channel, so a
> > > type field is required to distinguish between different kinds of messages.
> > >
> > > Since rpmsg replies and events share the same message format, an additional
> > line is introduced to handle both cases.
> > >
> > > Finally, rpmsg supports multiple GPIO controllers, so a port field is added to
> > uniquely identify the target controller.
> >
> > I have commented on this before - RPMSG is already providing multiplexing
> > capability by way of endpoints.  There is no need for a port field.  One endpoint,
> > one GPIO controller.
> >
>
> You still need a way to let the remote side know which port the endpoint maps to, either
> by embedding the port information in the message (the current way), or by sending it
> separately.
>

An endpoint is created with every namespace request.  There should be
one namespace request for every GPIO controller, which yields a unique
endpoint for each controller and eliminates the need for an extra
field to identify them.

> Shenwei
>
> > >
> > > Shenwei
> > >
> > > >        Andrew

