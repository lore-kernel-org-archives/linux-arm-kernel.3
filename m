Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B68FCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 15:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h8L+nXE7L85P9lNyL2I2gs9CTUVcJOwgVrd7ZFlSaCE=; b=dpT6E9gWS+I1AD4YgLeFAYV8e7
	oecGvDA+x9iS4WRe0X4r+0CXIDKvykIyfojZEyu7xRqq4bBJmJ36Dc212Tv/laUpgC1mlTebc8Iva
	AFjf5B9K8tE2DQ4xwq3x8pOAZht84hN832t11f8T0TQPsgNsswg/Bcw3IF60cNXqOvYBCMMBeS7zS
	WHHDGb0YXXeGTFH4EQXQ2MK02u/rDyMGBkBNGFI7kf2OAxTFoE5dt1StHQbC3utfMxgsdowzW4Iu+
	NIMlhDwBfHvXlTzctoSvrwQxdJ2EGdM2b/sAqcqvh5DcYleqsK7I4WrYGvPU0YjkzYiLVQfX+ATqL
	IR7nwA+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI72w-00000003s95-1aPP;
	Wed, 29 Apr 2026 15:41:54 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI72u-00000003s8h-1Auk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 15:41:53 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2ad21f437eeso7799245ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 08:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777477311; x=1778082111; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h8L+nXE7L85P9lNyL2I2gs9CTUVcJOwgVrd7ZFlSaCE=;
        b=x8BWSOzDXBfX28nMH6w905iEwOfNPveDaF1dsuY5gbTZVT3N3LDJeJFwzUHzwDBQzH
         cTNJHUSYliuLxRuDUf4B+tcOHFHs2wfBwNNRDi60+GYK8Tika/RfaWHjIvuYuZrSRc5b
         RTuIZhAG6iWlcZfKeh9ZYYYj4ntKu25lxhq7xLAN8FBk9+pCuGg4cYQFThRc8WhCUEAj
         94a+XuFcNmQMUo1BH4elM9RgsGj90cF11ByWxEnSWJ8fj+Ut1M6+8JgiRlbh2PCZqR/p
         v1SryuZkbmtTel+z25nCfjW/mbvvbe7kbobJh1s7VXnu9QZj6vRzccb3PbkhgzN1wqca
         paTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777477311; x=1778082111;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h8L+nXE7L85P9lNyL2I2gs9CTUVcJOwgVrd7ZFlSaCE=;
        b=IaCWoeXh2prX4XSeE1gb3LXr4SviSMoJsZPjgnGs5TO2l4+PvX7bek+EANym3nuB5P
         UVheceUIx3+0nuekT5oxUUAHujrkMB25FBamdPydx8KA7RGJs05VYA9VVDY2OqbNkxXB
         zswkzMJPaf4yrCaDZRnJEbkA8kVUKknm7ELbja+X4+0iBHmmlRzminbLXXTf3MdvOstt
         1Ae95bQQpjo5Nc0kuU50noPwq8k7qOx/7oSTADLvU6+uiSs8L7O+aFR9aC42WrdQ2LZz
         +FT2ndt/oivSjK9id6YqWV9BaJbkStPd+B79uQ5NCI455GBfnR56PbFncVgk/n1gBVpL
         Qgpw==
X-Forwarded-Encrypted: i=1; AFNElJ9jeeqXoITqaM0j8IT0l6xC42C/YnJjekNrUQEWOh/3Cv7F79NpXcVCb5960lI6nQjOgroQKZUjgKjAtJrfySdo@lists.infradead.org
X-Gm-Message-State: AOJu0YxYc7crdrbDCRQTAOhVbVoJQkj8++vp9Y0yOoIG6nT3OhQmcAwa
	0oI6ZOAlys+GLle017G3vhHtZMPjTBx74FP2lfeGeNGVSzrTBpGEe/3W5UpdwgoalA4=
X-Gm-Gg: AeBDieuhcyG90xbQW+7n4ii3vpNEwLY88MLthvY0Vc9qqDMh+PTfSgbHCfaoaEsPb5h
	at9kQD8bSLVxb/2D7puVe8vKOOAJ/wToMcnaljubiy4HTG6zwS6a1S5Sowh+Af5Mtou/ewkxG9A
	zvW0B9s5lfAiN4p0igptP0PBZDK5Os9kL9HKCDO7KOpYOQtwSlLGkSWka7xy+UATYJDIHeMJjMI
	vLWx90JlGd74UrHBtEtu2KAsyzkD90EEFS6PSshKmFd1rmj7trEle7hnfsDsN1WaJMLEpeCJDpz
	lGnVyUUHDxOmVzFxJTo1oQu0fU+uKrf4f3L22iaRQ/MTerUqr5qnmdYWPGQb5SWPPy5LdIwZX46
	VRBmB2g/iKVlIQ79ehbs58gyhw1t01KbFFBttQWTvBmwN2e8a2DG+/VbQTmWNcAB41HLAJMuScd
	NV8C77i+zAV06Ry/1DWoITCfcciKkOcB7RcF+Szw==
X-Received: by 2002:a17:903:2410:b0:2b4:68c9:302a with SMTP id d9443c01a7336-2b9882388cdmr33673325ad.17.1777477310614;
        Wed, 29 Apr 2026 08:41:50 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:8131:aef0:bb67:5559])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b98899055fsm27045325ad.80.2026.04.29.08.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 08:41:50 -0700 (PDT)
Date: Wed, 29 Apr 2026 09:41:46 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Andrew Lunn <andrew@lunn.ch>, "Padhi, Beleswar" <b-padhi@ti.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, Frank Li <frank.li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	dl-linux-imx <linux-imx@nxp.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Message-ID: <afImuoeHolxGgw3H@p14s>
References: <20260422212849.1240591-1-shenwei.wang@nxp.com>
 <20260422212849.1240591-4-shenwei.wang@nxp.com>
 <22fb5fac-2568-42be-a7e3-7e89d0017eb3@ti.com>
 <PAXPR04MB91850A11C58419C03909145F89362@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <6412a758-4560-4cf1-a0d0-5b24d1a715f1@lunn.ch>
 <PAXPR04MB9185009A17DFDF3D6C8B44E789362@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <6e01e114-e336-4744-b6b4-563ec42e321b@lunn.ch>
 <PAXPR04MB9185A098D894B6A6EBCC13F889372@PAXPR04MB9185.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB9185A098D894B6A6EBCC13F889372@PAXPR04MB9185.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_084152_346479_6228EBCE 
X-CRM114-Status: GOOD (  19.44  )
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

On Tue, Apr 28, 2026 at 03:24:59PM +0000, Shenwei Wang wrote:
> 
> 
> > -----Original Message-----
> > From: Andrew Lunn <andrew@lunn.ch>
> > Sent: Monday, April 27, 2026 3:49 PM
> > To: Shenwei Wang <shenwei.wang@nxp.com>
> > Cc: Padhi, Beleswar <b-padhi@ti.com>; Linus Walleij <linusw@kernel.org>;
> > Bartosz Golaszewski <brgl@kernel.org>; Jonathan Corbet <corbet@lwn.net>;
> > Rob Herring <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>;
> > Conor Dooley <conor+dt@kernel.org>; Bjorn Andersson
> > <andersson@kernel.org>; Mathieu Poirier <mathieu.poirier@linaro.org>; Frank Li
> > <frank.li@nxp.com>; Sascha Hauer <s.hauer@pengutronix.de>; Shuah Khan
> > <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; linux-
> > doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix Kernel Team
> > <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Peng Fan
> > <peng.fan@nxp.com>; devicetree@vger.kernel.org; linux-
> > remoteproc@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> > kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>; Bartosz
> > Golaszewski <brgl@bgdev.pl>
> > Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
> > > > struct virtio_gpio_response {
> > > >         __u8 status;
> > > >         __u8 value;
> > > > };
> > 
> > > It is the same message format. Please see the message definition
> > (GET_DIRECTION) below:
> > 
> > > +   +-----+-----+-----+-----+-----+----+
> > > +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
> > > +   | 1   | 2   |port |line | err | dir|
> > > +   +-----+-----+-----+-----+-----+----+
> > 
> > Sorry, but i don't see how two u8 vs six u8 are the same message format.
> > 
> 
> Some changes to the message format are necessary.
> 
> Virtio uses two communication channels (virtqueues): one for requests and replies, and a second one for events. 
> In contrast, rpmsg provides only a single communication channel, so a type field is required to distinguish between 
> different kinds of messages.
> 
> Since rpmsg replies and events share the same message format, an additional line is introduced to handle both cases.
> 
> Finally, rpmsg supports multiple GPIO controllers, so a port field is added to uniquely identify the target controller.

I have commented on this before - RPMSG is already providing multiplexing
capability by way of endpoints.  There is no need for a port field.  One
endpoint, one GPIO controller. 

> 
> Shenwei
> 
> >        Andrew

