Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A142FCD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 16:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O2vrQJJ/tAQxfPGzBUN6ljzsJ4iwh3MwwaLYpb/o5fI=; b=Nv56TvOEdEtADuGnVdU8E9ZYb0
	tQ5Jk/MrHUoxvC1/PinIYthf+gtCto3oxtlTBfOGAsacaSrCGf4hg6bnwuF45PM1uwuPvEQD9Bn/g
	TAjqJ4L5dZjRhLT6wFzYKxZHEaXLooYuJGATXcGCukFuY0qyCKprlwz70gACVmgMNhBwJlgDzMmLm
	00fIlmDJVhAMDVX+3MS3LzFDMcO5WmxgRCYum1IHs9xD+sKNH4+E5TkUla9fMTSdboxSpLiVbrvdz
	SN8vl+KsgBFFyeL4hWQVmsMUDM8FBxJohdxjyYOx38IzG3Pm9c+zNljxky6CACPL/erq+gjUU54So
	fCKD8LQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNCXi-00000003DvW-0CTy;
	Wed, 13 May 2026 16:34:42 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNCXe-00000003Dux-3QI1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 16:34:41 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-67cac5ece75so11373080a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 09:34:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778690076; cv=none;
        d=google.com; s=arc-20240605;
        b=fNGZFyoeOfu4IS42wfzj5u0wFN0uWDntLovViKAtWTc08qIQz1iplHitdka7/vK866
         xKUOAoL4JZoogb5ArTrPM18JypuWdrXg73akCAil5cBL1EKosDXUy9YL9dv+5IkjHW2Z
         fDQC8VPEpVCCKltIqu4jT2gG9aa1aVYjY/DiGKIw3h1dMc02Q7jwjrLDnjU9FNWYO7SM
         pp9IPy7UWFhcv5lQStG9kwnZiC46bjesye8C6WNbUuo0B0ZEvr2Y+iB+bPHfDUDUIyz6
         j3mmvdxtaIjB9NYtUCsOrag+pVKEFSvfopTU6rfeqxtxOddl3Rt8Bl1vvN5EHV1Ax5Qm
         EWtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O2vrQJJ/tAQxfPGzBUN6ljzsJ4iwh3MwwaLYpb/o5fI=;
        fh=AjtACKFCH6FrlS26zWKUEuCGnBE327KPnwmwmwIvA0s=;
        b=F5ToL4XjWyhHiC+wwAc2ngmhOuN23MuHv6bp/ta/WVChjQoFlcNJoq+KsoMeLxMtVM
         V788Emx2iVs08iAfQc/WW74ssbZjNr5cN1ivxgpNuw3112hDjDz34TjnELKOXhi6p2Ft
         QZljWdpu845T+Nw8AJF4qT6ctmGkMUBPcr1VtX3B7PDJTJBsJFsfx4WbtVoa2P4Z/z58
         MxS+0gWAD+MkruMgcZWlDlsax0XyBP/2SMFRXW+KLeUJnKq8WSVDYI8l7gtUNc0jr/R6
         MZGMaxGhpVKA0zBA7NRmYHhLQZC82x2eOE3wdYF9v+a3x6hpSEJBHONnzz9Ms7uLmoZb
         u5ig==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778690076; x=1779294876; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O2vrQJJ/tAQxfPGzBUN6ljzsJ4iwh3MwwaLYpb/o5fI=;
        b=WZsMvhyhN/ZOjWTL4sJt4ZNmrUZnIFzqJDC45rsR+U0aAmpo+E4qP6000Sy/Bltu05
         MkilgDAP4s8UiKCv/asLVpT2mrzKD1k80P4AKvrc5QkNt0Q7F05smkCyK+xZkHM2Ddfs
         ThXV13F7kragcu4mIEH8oYoaRDoeS6ihuF3ED0mxcQAUZ20LDHCCncD1LZn+cbyRNmsa
         7Z8JGLgZ+wf/C/cNf1eeIwyxazyEv3CXiQHVTgbMu/0fO6rqvLjcNppHzPaA7q2w9UYO
         pizJucifmT0KiLMMz4EwbOafhxtOy9xBUcyZ8rfcLCDibBr1HGIos6goj+y9DaJkEXOo
         1DdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778690076; x=1779294876;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O2vrQJJ/tAQxfPGzBUN6ljzsJ4iwh3MwwaLYpb/o5fI=;
        b=lBH51Yxz7zWWQfp2sdkePCVsjG2E+MKrk4iTtOoZPeFUFe9ApbicvqHScyYOkI3yjF
         nmhPVJzEdUWxe7UTNbaA2Y8Ry91OMEG4vFMKCpeJATm8mFzn+wMz3uUd1vFltMB0lShM
         CqMIOeciyefmMGu73lZ+AbotrjVcjm4xJlpGqY3dGBgOzEkaw0YtI3Rq8+aiYhkBP5ZX
         ld8rpCR8B8GqnFcTvxxeNeGyNDF5OqAqcYH3MqITVlM2FOXrOzLjiI7TbEhkkIumbRIB
         xJF8fy+Rsu4TfsFIty2ewoO6eiZ+Z+Hty3+vUS2197X+xpTFzzG1WOfbDCkPmyb6peG4
         C3og==
X-Forwarded-Encrypted: i=1; AFNElJ/JB91kvmfECu2BdvDBzN4WH83inI2cPvdzENJZ3cxU6VHmRL4tl8Ox/EWmGEynJQpz8EloGlUXGr0WYpa9Q9zK@lists.infradead.org
X-Gm-Message-State: AOJu0YwYAWLb+SBYF+D8PWdW0An3EmpGG80TJH6eVdQUKsOPV393k7ug
	8FutQ0ae5rR7OjXLzIEspZTXKm0RiWuHOXtGRMU0w71HT0iDIl6i+IjmCr669jxBsFu38sJaeQL
	mH18Wi/1diF/CugpB6iPlIwT17SKxj4uAaDxK2aiYtQ==
X-Gm-Gg: Acq92OH7E+YHJdJXX4MTvphXQ2rwU1zVhbKMDO0UZ78TejVuAZD0aB5i225KmCIe2Wq
	Zi5zOBmIFtv9bCWp2P1A/4otsHNeGlvxw7Qmczz4hMGRpe+MBkLywhE2jySpYhBNZPgvRLHcTE7
	EljgZ/tA3lYwQqBrCOeejS+ZQqbeCVylXFw+q78P8EEo8OGVlz5zmciQ3I5913DbV77+MkVoyAF
	2hmm/Bg+j/0yll3aL/gQ+R5PYV1nXF6fie4NVtjXf2sk+LGIQQZeT192jHRCYT74ddHW9mfHBZc
	paUm/awBLnYOqugP56M4VualPfe7XaHZK6hl2cW41A==
X-Received: by 2002:a05:6402:3112:b0:680:c7b7:25bf with SMTP id
 4fb4d7f45d1cf-682558f0800mr1771862a12.6.1778690076185; Wed, 13 May 2026
 09:34:36 -0700 (PDT)
MIME-Version: 1.0
References: <CANLsYkzt9xUczxSU28u-TfZAAjr0ufZKXAj8Eqfq=45gufXW3w@mail.gmail.com>
 <f7ef3417-eb84-4467-ac72-a9bc8b0c81e8@foss.st.com> <21de8440-adf7-454b-acfc-06e50882e075@ti.com>
 <4c526816-b127-43e7-86e9-eee4dc1152bc@foss.st.com> <c6f68ab5-271a-41ed-b285-75b739f1edd6@amd.com>
 <87850f70-5275-4393-941f-d01146a9cffc@foss.st.com> <da3b79b7-9dad-48cb-b552-cf6df445899f@amd.com>
 <08c815f5-ccbe-404a-95a1-a549aac8a55d@amd.com> <CANLsYkz8HpM_8eS7DjN_jmYs4T7P9xY0jYmdiAx5WO=_1zvFpQ@mail.gmail.com>
 <ae5cfa0f-e929-4abb-b27b-8eb27586d183@amd.com> <agNKHsAEscc1TDiq@p14s> <13140ca1-b4bc-4acc-9f7c-d23490e56dbb@amd.com>
In-Reply-To: <13140ca1-b4bc-4acc-9f7c-d23490e56dbb@amd.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 13 May 2026 10:34:23 -0600
X-Gm-Features: AVHnY4LlL7Ttn0kyLcAEI25wPPbnshkIgGcqf1PBJs6sXkh3goBpnufJocwDTiY
Message-ID: <CANLsYkz9-+1o4ek0f5jS=-G1nPpp7BkCmNE5cin1zRY_e6Me-A@mail.gmail.com>
Subject: Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
To: tanmay.shah@amd.com
Cc: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, Beleswar Prasad Padhi <b-padhi@ti.com>, 
	Shenwei Wang <shenwei.wang@nxp.com>, Andrew Lunn <andrew@lunn.ch>, Linus Walleij <linusw@kernel.org>, 
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
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_093439_091433_82313FA4 
X-CRM114-Status: GOOD (  37.94  )
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

On Tue, 12 May 2026 at 11:20, Shah, Tanmay <tanmays@amd.com> wrote:
>
>
>
> On 5/12/2026 10:41 AM, Mathieu Poirier wrote:
> > On Mon, May 11, 2026 at 04:35:46PM -0500, Shah, Tanmay wrote:
> >>
> >>
> >> On 5/11/2026 12:58 PM, Mathieu Poirier wrote:
> >>> On Mon, 11 May 2026 at 10:47, Shah, Tanmay <tanmays@amd.com> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 5/5/2026 10:52 AM, Shah, Tanmay wrote:
> >>>>>
> >>>>>
> >>>>> On 5/5/2026 4:28 AM, Arnaud POULIQUEN wrote:
> >>>>>> Hi Tanmay,
> >>>>>>
> >>>>>> On 5/4/26 21:19, Shah, Tanmay wrote:
> >>>>>>>
> >>>>>>> Hello all,
> >>>>>>>
> >>>>>>> I have started reviewing this work as well.
> >>>>>>> Thanks Shenwei for this work.
> >>>>>>>
> >>>>>>> I have gone through only the current revision, and would like to =
provide
> >>>>>>> idea on how to achieve GPIO number multiplexing with the RPMsg pr=
otocol.
> >>>>>>> Also, have some bindings related question.
> >>>>>>>
> >>>>>>> Please see below:
> >>>>>>>
> >>>>>>> On 4/30/2026 11:40 AM, Arnaud POULIQUEN wrote:
> >>>>>>>>
> >>>>>>>>
> >>>>>>>> On 4/30/26 14:56, Beleswar Prasad Padhi wrote:
> >>>>>>>>> Hello Arnaud,
> >>>>>>>>>
> >>>>>>>>> On 30/04/26 13:05, Arnaud POULIQUEN wrote:
> >>>>>>>>>> Hello,
> >>>>>>>>>>
> >>>>>>>>>> On 4/29/26 21:20, Mathieu Poirier wrote:
> >>>>>>>>>>> On Wed, 29 Apr 2026 at 12:07, Padhi, Beleswar <b-padhi@ti.com=
> wrote:
> >>>>>>>>>>>>
> >>>>>>>>>>>> Hi Mathieu,
> >>>>>>>>>>>>
> >>>>>>>>>>>> On 4/29/2026 11:03 PM, Mathieu Poirier wrote:
> >>>>>>>>>>>>> On Wed, 29 Apr 2026 at 10:53, Shenwei Wang <shenwei.wang@nx=
p.com>
> >>>>>>>>>>>>> wrote:
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> -----Original Message-----
> >>>>>>>>>>>>>>> From: Mathieu Poirier <mathieu.poirier@linaro.org>
> >>>>>>>>>>>>>>> Sent: Wednesday, April 29, 2026 10:42 AM
> >>>>>>>>>>>>>>> To: Shenwei Wang <shenwei.wang@nxp.com>
> >>>>>>>>>>>>>>> Cc: Andrew Lunn <andrew@lunn.ch>; Padhi, Beleswar <b-
> >>>>>>>>>>>>>>> padhi@ti.com>; Linus
> >>>>>>>>>>>>>>> Walleij <linusw@kernel.org>; Bartosz Golaszewski
> >>>>>>>>>>>>>>> <brgl@kernel.org>; Jonathan
> >>>>>>>>>>>>>>> Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>;
> >>>>>>>>>>>>>>> Krzysztof Kozlowski
> >>>>>>>>>>>>>>> <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>;=
 Bjorn
> >>>>>>>>>>>>>>> Andersson
> >>>>>>>>>>>>>>> <andersson@kernel.org>; Frank Li <frank.li@nxp.com>; Sasc=
ha Hauer
> >>>>>>>>>>>>>>> <s.hauer@pengutronix.de>; Shuah Khan
> >>>>>>>>>>>>>>> <skhan@linuxfoundation.org>; linux-
> >>>>>>>>>>>>>>> gpio@vger.kernel.org; linux-doc@vger.kernel.org; linux-
> >>>>>>>>>>>>>>> kernel@vger.kernel.org;
> >>>>>>>>>>>>>>> Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Es=
tevam
> >>>>>>>>>>>>>>> <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>;
> >>>>>>>>>>>>>>> devicetree@vger.kernel.org; linux-remoteproc@vger.kernel.=
org;
> >>>>>>>>>>>>>>> imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org=
; dl-
> >>>>>>>>>>>>>>> linux-imx <linux-
> >>>>>>>>>>>>>>> imx@nxp.com>; Bartosz Golaszewski <brgl@bgdev.pl>
> >>>>>>>>>>>>>>> Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add gener=
ic
> >>>>>>>>>>>>>>> rpmsg GPIO driver
> >>>>>>>>>>>>>>> On Tue, Apr 28, 2026 at 03:24:59PM +0000, Shenwei Wang wr=
ote:
> >>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>> -----Original Message-----
> >>>>>>>>>>>>>>>>> From: Andrew Lunn <andrew@lunn.ch>
> >>>>>>>>>>>>>>>>> Sent: Monday, April 27, 2026 3:49 PM
> >>>>>>>>>>>>>>>>> To: Shenwei Wang <shenwei.wang@nxp.com>
> >>>>>>>>>>>>>>>>> Cc: Padhi, Beleswar <b-padhi@ti.com>; Linus Walleij
> >>>>>>>>>>>>>>>>> <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.o=
rg>;
> >>>>>>>>>>>>>>>>> Jonathan
> >>>>>>>>>>>>>>>>> Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>;
> >>>>>>>>>>>>>>>>> Krzysztof
> >>>>>>>>>>>>>>>>> Kozlowski <krzk+dt@kernel.org>; Conor Dooley
> >>>>>>>>>>>>>>>>> <conor+dt@kernel.org>;
> >>>>>>>>>>>>>>>>> Bjorn Andersson <andersson@kernel.org>; Mathieu Poirier
> >>>>>>>>>>>>>>>>> <mathieu.poirier@linaro.org>; Frank Li <frank.li@nxp.co=
m>;
> >>>>>>>>>>>>>>>>> Sascha
> >>>>>>>>>>>>>>>>> Hauer <s.hauer@pengutronix.de>; Shuah Khan
> >>>>>>>>>>>>>>>>> <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org=
; linux-
> >>>>>>>>>>>>>>>>> doc@vger.kernel.org; linux-kernel@vger.kernel.org; Peng=
utronix
> >>>>>>>>>>>>>>>>> Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> >>>>>>>>>>>>>>>>> <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>;
> >>>>>>>>>>>>>>>>> devicetree@vger.kernel.org; linux- remoteproc@vger.kern=
el.org;
> >>>>>>>>>>>>>>>>> imx@lists.linux.dev; linux-arm- kernel@lists.infradead.=
org;
> >>>>>>>>>>>>>>>>> dl-linux-imx <linux-imx@nxp.com>; Bartosz Golaszewski
> >>>>>>>>>>>>>>>>> <brgl@bgdev.pl>
> >>>>>>>>>>>>>>>>> Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add gen=
eric
> >>>>>>>>>>>>>>>>> rpmsg
> >>>>>>>>>>>>>>>>> GPIO driver
> >>>>>>>>>>>>>>>>>>> struct virtio_gpio_response {
> >>>>>>>>>>>>>>>>>>>             __u8 status;
> >>>>>>>>>>>>>>>>>>>             __u8 value;
> >>>>>>>>>>>>>>>>>>> };
> >>>>>>>>>>>>>>>>>> It is the same message format. Please see the message
> >>>>>>>>>>>>>>>>>> definition
> >>>>>>>>>>>>>>>>> (GET_DIRECTION) below:
> >>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>> +   +-----+-----+-----+-----+-----+----+
> >>>>>>>>>>>>>>>>>> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
> >>>>>>>>>>>>>>>>>> +   | 1   | 2   |port |line | err | dir|
> >>>>>>>>>>>>>>>>>> +   +-----+-----+-----+-----+-----+----+
> >>>>>>>>>>>>>>>>> Sorry, but i don't see how two u8 vs six u8 are the sam=
e
> >>>>>>>>>>>>>>>>> message format.
> >>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>> Some changes to the message format are necessary.
> >>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>> Virtio uses two communication channels (virtqueues): one=
 for
> >>>>>>>>>>>>>>>> requests and
> >>>>>>>>>>>>>>> replies, and a second one for events.
> >>>>>>>>>>>>>>>> In contrast, rpmsg provides only a single communication
> >>>>>>>>>>>>>>>> channel, so a
> >>>>>>>>>>>>>>>> type field is required to distinguish between different =
kinds
> >>>>>>>>>>>>>>>> of messages.
> >>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>> Since rpmsg replies and events share the same message fo=
rmat,
> >>>>>>>>>>>>>>>> an additional
> >>>>>>>>>>>>>>> line is introduced to handle both cases.
> >>>>>>>>>>>>>>>> Finally, rpmsg supports multiple GPIO controllers, so a =
port
> >>>>>>>>>>>>>>>> field is added to
> >>>>>>>>>>>>>>> uniquely identify the target controller.
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> I have commented on this before - RPMSG is already provid=
ing
> >>>>>>>>>>>>>>> multiplexing
> >>>>>>>>>>>>>>> capability by way of endpoints.  There is no need for a p=
ort
> >>>>>>>>>>>>>>> field.  One endpoint,
> >>>>>>>>>>>>>>> one GPIO controller.
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>> You still need a way to let the remote side know which por=
t the
> >>>>>>>>>>>>>> endpoint maps to, either
> >>>>>>>>>>>>>> by embedding the port information in the message (the curr=
ent
> >>>>>>>>>>>>>> way), or by sending it
> >>>>>>>>>>>>>> separately.
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>> An endpoint is created with every namespace request.  There
> >>>>>>>>>>>>> should be
> >>>>>>>>>>>>> one namespace request for every GPIO controller, which yiel=
ds a
> >>>>>>>>>>>>> unique
> >>>>>>>>>>>>> endpoint for each controller and eliminates the need for an=
 extra
> >>>>>>>>>>>>> field to identify them.
> >>>>>>>>>>>>
> >>>>>>>>>>>>
> >>>>>>>>>>>> Right, but this can still be done by just having one namespa=
ce
> >>>>>>>>>>>> request.
> >>>>>>>>>>>> We can create new endpoints bound to an existing namespace/
> >>>>>>>>>>>> channel by
> >>>>>>>>>>>> invoking rpmsg_create_ept(). This is what I suggested here t=
oo:
> >>>>>>>>>>>> https://lore.kernel.org/all/29485742-6e49-482e-
> >>>>>>>>>>>> b73d-228295daaeec@ti.com/
> >>>>>>>>>>>>
> >>>>>>>>>>>
> >>>>>>>>>>> I will look at your suggestion (i.e link above) later this we=
ek or
> >>>>>>>>>>> next week.
> >>>>>>>>>>>
> >>>>>>>>>>>> My mental model looks like this for the complete picture:
> >>>>>>>>>>>>
> >>>>>>>>>>>> 1. namespace/channel#1 =3D rpmsg-io
> >>>>>>>>>>>>        a. ept1 -> gpio-controller@1
> >>>>>>>>>>>>        b. ept2 -> gpio-controller@2
> >>>>>>>>>>>>
> >>>>>>>
> >>>>>>> If my understanding of what gpio-controller is right, than this w=
on't
> >>>>>>> work. We need one rpmsg channel per gpio-controller, and in most =
cases
> >>>>>>> there will be only one GPIO-controller on the remote side. If the=
re are
> >>>>>>> multiple or multiple instances of same controller, than we need s=
eparate
> >>>>>>> channel name for that controller just like we would have separate=
 device
> >>>>>>> on the Linux.
> >>>>>>
> >>>>>> As done in ehe rpmsg_tty driver it could be instantiated several t=
imes with
> >>>>>> the same channel/service name. This would imply a specific rpmsg t=
o
> >>>>>> retreive
> >>>>>> the gpio controller index from the remote side.
> >>>>>>>
> >>>>>>>>>>>
> >>>>>>>>>>> I've asked for one endpoint per GPIO controller since the ver=
y
> >>>>>>>>>>> beginning.  I don't yet have a strong opinion on whether to u=
se one
> >>>>>>>>>>> namespace request per GPIO controller or a single request tha=
t spins
> >>>>>>>>>>> off multiple endpoints.  I'll have to look at your link and
> >>>>>>>>>>> reflect on
> >>>>>>>>>>> that.  Regardless of how we proceed on that front, multiplexi=
ng needs
> >>>>>>>>>>> to happen at the endpoint level rather than the packet level.
> >>>>>>>>>>> This is
> >>>>>>>>>>> the only way this work can move forward.
> >>>>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>> I would be more in favor of Mathieu=E2=80=99s proposal: =E2=80=
=9CAn endpoint is
> >>>>>>>>>> created with every namespace request.=E2=80=9D
> >>>>>>>>>>
> >>>>>>>>>> If the endpoint is created only on the Linux side, how do we m=
atch
> >>>>>>>>>> the Linux endpoint address with the local port field on the re=
mote
> >>>>>>>>>> side?
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> Simply by sending a message to the remote containing the newly =
created
> >>>>>>>>> endpoint and the port idx. Note that is this done just one time=
, after
> >>>>>>>>> this
> >>>>>>>>> Linux need not have the port field in the message everytime its=
 sending
> >>>>>>>>> a message.
> >>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>> With a multi-namespace approach, the namespace could be rpmsg-=
io-
> >>>>>>>>>> [addr], where [addr] corresponds to the GPIO controller addres=
s in
> >>>>>>>>>> the DT. This would:
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> You will face the same problem in this case also that you asked=
 above:
> >>>>>>>>> "how do we match the Linux endpoint address with the local port=
 field
> >>>>>>>>> on the remote side?"
> >>>>>>>>
> >>>>>>>> Sorry I probably introduced confusion here
> >>>>>>>> my sentence should be;
> >>>>>>>>   With a multi-namespace approach, the namespace could be rpmsg-=
io-
> >>>>>>>> [port],
> >>>>>>>>   where [port] corresponds to the GPIO controller port in the DT=
.
> >>>>>>>>
> >>>>>>>>
> >>>>>>>> For instance:
> >>>>>>>>
> >>>>>>>>        rpmsg {
> >>>>>>>>          rpmsg-io {
> >>>>>>>>            #address-cells =3D <1>;
> >>>>>>>>            #size-cells =3D <0>;
> >>>>>>>>
> >>>>>>>>            gpio@25 {
> >>>>>>>>              compatible =3D "rpmsg-gpio";
> >>>>>>>>              reg =3D <25>;
> >>>>>>>>              gpio-controller;
> >>>>>>>>              #gpio-cells =3D <2>;
> >>>>>>>>              #interrupt-cells =3D <2>;
> >>>>>>>>              interrupt-controller;
> >>>>>>>>            };
> >>>>>>>>
> >>>>>>>>            gpio@32 {
> >>>>>>>>              compatible =3D "rpmsg-gpio";
> >>>>>>>>              reg =3D <32>;
> >>>>>>>>              gpio-controller;
> >>>>>>>>              #gpio-cells =3D <2>;
> >>>>>>>>              #interrupt-cells =3D <2>;
> >>>>>>>>              interrupt-controller;
> >>>>>>>>            };
> >>>>>>>>          };
> >>>>>>>>        };
> >>>>>>>>
> >>>>>>>>   rpmsg-io-25  would match with gpio@25
> >>>>>>>>   rpmsg-io-32  would match with gpio@32
> >>>>>>>>
> >>>>>>>
> >>>>>>> The problem with this approach is, we will endup creating way too=
 many
> >>>>>>> RPMsg devices/channels. i.e. one channel per one GPIO. That limit=
s how
> >>>>>>> many GPIOs can be handled by remote from memory perspective. At
> >>>>>>> somepoint we might just run-out of number ept & channels created =
by the
> >>>>>>> remote. As of now, open-amp library supports 128 epts I think.
> >>>>>>
> >>>>>> Right, I proposed a solution in my previous answer to Beleswar who=
 has
> >>>>>> the same concern.
> >>>>>>
> >>>>>>>
> >>>>>>>>
> >>>>>>>>>
> >>>>>>>>> Because the endpoint that is created on a namespace request is =
also
> >>>>>>>>> dynamic in nature. How will the remote know which endpoint addr
> >>>>>>>>> Linux allocated for a namespace that it announced?
> >>>>>>>>>
> >>>>>>>>> As an example/PoC, I created a firmware example which announces
> >>>>>>>>> 2 name services to Linux, one is the standard "rpmsg_chrdev" an=
d
> >>>>>>>>> the other is a TI specific name service "ti.ipc4.ping-pong". Yo=
u can
> >>>>>>>>> see it created 2 different addresses (0x400 and 0x401) for each=
 of
> >>>>>>>>> the name service request from the same firmware:
> >>>>>>>>>
> >>>>>>>>> root@j784s4-evm:~# dmesg | grep virtio0 | grep -i channel
> >>>>>>>>> [    9.290275] virtio_rpmsg_bus virtio0: creating channel
> >>>>>>>>> ti.ipc4.ping-pong addr 0xd
> >>>>>>>>> [    9.311230] virtio_rpmsg_bus virtio0: creating channel rpmsg=
_chrdev
> >>>>>>>>> addr 0xe
> >>>>>>>>> [    9.496645] rpmsg_chrdev virtio0.rpmsg_chrdev.-1.14: DEBUG: =
Channel
> >>>>>>>>> formed from src =3D 0x400 to dst =3D 0xe
> >>>>>>>>> [    9.707255] rpmsg_client_sample virtio0.ti.ipc4.ping-pong.-1=
.13:
> >>>>>>>>> new channel: 0x401 -> 0xd!
> >>>>>>>>>
> >>>>>>>>> So in this case, rpmsg-io-1 can have different ept addr than rp=
msg-io-2
> >>>>>>>>> Back to same problem. Simple solution is to reply to remote wit=
h the
> >>>>>>>>> created ept addr and the index.
> >>>>>>>>
> >>>>>>>> That why I would like to suggest to use the name service field t=
o
> >>>>>>>> identify the port/controller, instead of the endpoint address.
> >>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>> - match the RPMsg probe with the DT,
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> We can probe from all controllers with a single name service
> >>>>>>>>> announcement too.
> >>>>>>>>>
> >>>>>>>>>> - provide a simple mapping between the port and the endpoint o=
n both
> >>>>>>>>>> sides,
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> We are trying to get rid of this mapping from Linux side to ada=
pt
> >>>>>>>>> the gpio-virtio design.
> >>>>>>>>>
> >>>>>>>>>> - allow multiple endpoints on the remote side,
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> We can support this as well with single nameservice model.
> >>>>>>>>> There is no limitation. Remote has to send a message with
> >>>>>>>>> its newly created ept that's all.
> >>>>>>>>>
> >>>>>>>>>> - provide a simple discovery mechanism for remote capabilities=
.
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> A single announcement: "rpmsg-io" is also discovery mechanism.
> >>>>>>>>>
> >>>>>>>>> Feel free to let me know if you have concerns with any of the
> >>>>>>>>> suggestions!
> >>>>>>>>
> >>>>>>>> My only concern, whatever the solution, is that we find a smart
> >>>>>>>> solution to associate the correct endpoint with the correct GPIO
> >>>>>>>> port/controller defined in the DT.
> >>>>>>>>
> >>>>>>>> I may have misunderstood your solution. Could you please help me
> >>>>>>>> understand your proposal by explaining how you would handle thre=
e
> >>>>>>>> GPIO ports defined in the DT, considering that the endpoint
> >>>>>>>> addresses on the Linux side can be random?
> >>>>>>>> If I assume there is a unique endpoint on the remote side,
> >>>>>>>> I do not understand how you can match, on the firmware side,
> >>>>>>>> the Linux endpoint address to the GPIO port.
> >>>>>>>>
> >>>>>>>> Thanks and Regards,Arnaud
> >>>>>>>>
> >>>>>>>>>
> >>>>>>>>> Thanks,
> >>>>>>>>> Beleswar
> >>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>> Regards,
> >>>>>>>>>> Arnaud
> >>>>>>>>>>
> >>>>>>>>>>>> 2. namespace/channel#2 =3D rpmsg-i2c
> >>>>>>>>>>>>        a. ept1 -> i2c@1
> >>>>>>>>>>>>        b. ept2 -> i2c@2
> >>>>>>>>>>>>        c. ept3 -> i2c@3
> >>>>>>>>>>>>
> >>>>>>>>>>>> etc...
> >>>>>>>>>>>>
> >>>>>>>
> >>>>>>> Just want to clear-up few terms before I jump to the solution:
> >>>>>>>
> >>>>>>> **RPMsg channel/device**:
> >>>>>>>    - These are devices announced by the remote processor, and cre=
ated by
> >>>>>>> linux. They are created at: /sys/bus/rpmsg/devices
> >>>>>>>    - The channel format: <name>.<src ept>.<dst ept>
> >>>>>>>
> >>>>>>> **RPMsg endpoint**:
> >>>>>>>    - Endpoint is differnt than channel. Single channel can have m=
ultiple
> >>>>>>> endpoints, and represented in the linux with: /dev/rpmsg? devices=
.
> >>>>>>>
> >>>>>>> To create endpoint device, we have rpmsg_create_ept API, which ta=
kes
> >>>>>>> channel information as input, which has src-ept, dst-ept.
> >>>>>>>
> >>>>>>> Following is proposed solution:
> >>>>>>>
> >>>>>>> 1) Assign RPMsg channel/device per rpmsg-gpio controller (Not per=
 GPIO
> >>>>>>> pin/port).
> >>>>>>>    - In our case that would be, single rpmsg-io node. (That makes=
 me
> >>>>>>> question if bindings are correct or not).
> >>>>>>>
> >>>>>>> 2) Assign GPIO number as src ept.
> >>>>>>>
> >>>>>>> i.e. *rpmsg-io.<GPIO number>.<dst ept>*. Do not randomly assign s=
rc
> >>>>>>> endpoint.
> >>>>>>>
> >>>>>>> Now, RPMSG channel by spec reserves first 1024 endpoints [1], so =
we can
> >>>>>>> add 1024 offset to the GPIO number:
> >>>>>>>
> >>>>>>> so, when calling rpmsg_create_ept() API, we assing src_endpoint a=
s:
> >>>>>>> (GPIO_NUMBER + RPMSG_RESERVED_ADDRESSES)
> >>>>>>>
> >>>>>>> Now on the remote side, there is single channel and only single-e=
ndpoint
> >>>>>>> is needed that is mapped to the rpmsg-io channel callback.
> >>>>>>>
> >>>>>>> That callback will receive all the payloads from the Linux, which=
 will
> >>>>>>> have src-ept i.e. (RPMSG_RESERVED_ADDRESSES + GPIO_NUMBER).
> >>>>>>
> >>>>>>
> >>>>>> Interesting approach. I also tried to find a similar solution.
> >>>>>>
> >>>>>> The question here is: how can we guarantee continuous addresses? G=
iven
> >>>>>> the static and dynamic allocation of endpoint addresses that are
> >>>>>> implemented, my conclusion was that it is not reliable enough.
> >>>>>>
> >>>>>> but perhaps I missed something...
> >>>>>>
> >>>>>>>
> >>>>>>> It can retrieve GPIO_NUMBER easily, and convert to appropriate pi=
n based
> >>>>>>> on platform specific logic.
> >>>>>>>
> >>>>>>> This doesn't need PORT information at all. Also it makes sure tha=
t
> >>>>>>> remote is using only single-endpoint so not much memory is used.
> >>>>>>>
> >>>>>>> *Example*:
> >>>>>>> If only rpmsg-gpio channel is created by the remote side, than fo=
llowing
> >>>>>>> is the representation of the devices when GPIO 25, 26, 27 is assi=
gned to
> >>>>>>> the rpmsg-io controller:
> >>>>>>>
> >>>>>>> Linux                                                      Remote
> >>>>>>>
> >>>>>>> rpmsg-channel: rpmsg-gpio.0x400.0x400
> >>>>>>>
> >>>>>>> /dev/rpmsg0 - GPIO25 ept (rpmsg-gpio.0x419.0x400)-|
> >>>>>>>                                                    |
> >>>>>>> /dev/rpmsg1 - GPIO26 ept (rpmsg-gpio.0x41a.0x400)-|-> rpmsg-gpio.=
*.0x400
> >>>>>>>                                                    |
> >>>>>>> /dev/rpmsg2 - GPIO27 ept (rpmsg-gpio.0x41b.0x400)-|  0x400 ept ca=
llback.
> >>>>>>>
> >>>>>>>
> >>>>>>> *On remote side*:
> >>>>>>>
> >>>>>>> ept_0x400_callback(..., int src_ept, ...,)
> >>>>>>> {
> >>>>>>>     int gpio_num =3D src_ept - RPMSG_RESERVED_ADDRESSES;
> >>>>>>>     // platform specific logic to convert gpio num to proper pin,
> >>>>>>>     // just like you would convert gpio num to pin on a linux gpi=
o
> >>>>>>> controller.
> >>>>>>> }
> >>>>>>>
> >>>>>>> My question on the binding:
> >>>>>>>
> >>>>>>> Why each GPIO is represented with the separate node? I think rpms=
g-gpio
> >>>>>>> can be represented just any other GPIO controller? Please let me =
know if
> >>>>>>> I am missing something. So rpmsg channel/rpmsg device is not crea=
ted per
> >>>>>>> GPIO, but per controller. GPIO number multiplexing should be done=
 with
> >>>>>>> rpmsg src ept, that removes the need of having each GPIO as a sep=
arate
> >>>>>>> node.
> >>>>>>>
> >>>>>>>
> >>>>>>> rpmsg_gpio: rpmsg-gpio@0 {
> >>>>>>>         compatible =3D "rpmsg-gpio";
> >>>>>>>         reg =3D <0>;
> >>>>>>>         gpio-controller;
> >>>>>>>         #gpio-cells =3D <2>;
> >>>>>>>         #interrupt-cells =3D <2>;
> >>>>>>>         interrupt-controller;
> >>>>>>>     };
> >>>>>>>
> >>>>>>> Then in DT, use like regular GPIO, but with the rpmsg-gpio contro=
ller:
> >>>>>>>
> >>>>>>> rpmsg-gpios =3D <&rpmsg_gpio (GPIO NUM) (flags)>;
> >>>>>>>
> >>>>>>> If the intent to create separate gpio nodes was only for the chan=
nel
> >>>>>>> creation, then it's not really needed.
> >>>>>>>
> >>>>>>> [1]
> >>>>>>> https://github.com/torvalds/linux/
> >>>>>>> blob/6d35786de28116ecf78797a62b84e6bf3c45aa5a/drivers/rpmsg/
> >>>>>>> virtio_rpmsg_bus.c#L136
> >>>>>>>
> >>>>>>
> >>>>>> It is already the case. bindings declare GPIO controllers, not dir=
ectly
> >>>>>> GPIOs in:
> >>>>>>
> >>>>>> [PATCH v13 2/4] dt-bindings: remoteproc: imx_rproc: Add "rpmsg" su=
bnode
> >>>>>> support
> >>>>>>
> >>>>>> The discussion is around having an unique RPmsg endpoint for all
> >>>>>> GPIO controller or one RPmsg endpoint per GPIO controller.
> >>>>>>
> >>>>>
> >>>>> Endpoint where remote side or linux side?
> >>>>>
> >>>>> If unique endpoint on remote side per gpio controller then it makes=
 sense.
> >>>>>
> >>>>> Unique endpoint on linux side doesn't make sense. Instead, unique
> >>>>> channel per gpio controller makes sense, and each channel will have
> >>>>> multiple endpoints on linux side. As I replied to Beleswar on the o=
ther
> >>>>> email, I will copy past my answer here too:
> >>>>>
> >>>>>
> >>>>> To be more specific:
> >>>>>
> >>>>> Linux:                               remote:
> >>>>>
> >>>>> ch1: rpmsg-gpio.-1.1024 ->     gpio-controller@1024
> >>>>>     - gpio-line ept1
> >>>>>     - gpio-line ept2    ->     They all map to same callback_ept_10=
24.
> >>>>>     - gpio-line ept3
> >>>>>
> >>>>> ch2: rpmsg-gpio.-1.1025 ->     gpio-controller@1025
> >>>>>     - gpio-line ept1
> >>>>>     - gpio-line ept2    ->     They all map to same callback_ept_10=
25.
> >>>>>     - gpio-line ept3
> >>>>>
> >>>>
> >>>>
> >>>> Hi Mathieu,
> >>>>
> >>>> So upon more brain storming in this approach I found limitation:
> >>>>
> >>>> This approach won't work if host OS is any other OS but Linux. For
> >>>> example, if the remote OS is zephyr/baremetal using open-amp, then O=
nly
> >>>> Linux <-> zephyr combination will work, and we won't be able to re-u=
se
> >>>> this approach for zephyr <-> zephyr use case. The concept of rpmsg
> >>>> channel/device exist only in the linux kernel implementation. This
> >>>> brings another question: Should the protocol we decide work on other=
 use
> >>>> cases as well? Or Linux must be the Host OS for this protocol ?
> >>>>
> >>>
> >>> Linux and Zephyr are very distinct OS, each with their own subsystems
> >>> and characteristics.  The design we choose here involves RPMSG and,
> >>> inherently, Linux.  We can't make decisions based on what may
> >>> potentially happen in Zephyr.
> >>>
> >>>>
> >>>> I think your & Arnaud's proposed approach of single endpoint per
> >>>> gpio-controller on both side makes more sense, as it will work
> >>>> regardless of any OS on host or remote side.
> >>>>
> >>>
> >>> Arnaud, Beleswar, Andrew and I are all advocating for one endpoint pe=
r
> >>> GPIO controller.  The remaining issue it about the best way to work
> >>> out source and destination addresses between Linux and the remote
> >>> processor.  I'm running out of time for today but I'll return to this
> >>> thread with a final analysis by the end of the week.
> >>>
> >>
> >> Okay. Then that means multiple endpoints on Linux side can be consider=
ed.
> >
> > If there are multiple GPIO controllers then yes, there will be more tha=
n one
> > endpoint.  At this time I do now want to condiser other bus architectur=
es (i2c,
> > spi, ...) to avoid muddying an already difficult conversation.
> >
> >>
> >> If we decide to go single-endpoint per device on both side, then for
> >> that here is the proposal to represent src ept and dst ept:
> >
> > I do not understand what you mean by "per device" - please be more spec=
ific.
> >
>
> "per device" I mean, per rpmsg device/channel. In our case that would be
> per gpio-controller.
>
> >>
> >> When we represent any device under rpmsg bus node, I think it should b=
e
> >> considered remote's view of the adddress space. So ideally we can
> >> convert it to Linux view of the address space, via 'ranges' property.
> >
> > There is no address space to consider since there is no GPIO controller=
 memory
> > space to access.  All that is done by the driver (remote processor) and
> > completely hidden from Linux by rpmsg-virtio-gpio.
> >
>
> So IMHO the dt-binding is the representation of the device hardware and
> is independent of how driver will access it. Any gpio-controller device
> node, we are just representing how gpio-controller hardware on the
> remote side looks like, and what is the corresponding view of the linux i=
s.
>
> The rpmsg-gpio driver is different than the platform gpio controller
> driver mainly in two ways:
>
> 1) How the driver is probed: rpmsg-gpio driver will be probed when
> corresponding rpmsg channel/device name-service announcment will happen
> from the remote side.
>

I agree.

> 2) The GPIO Ops are not performed on the hardware directly, but it's
> done via rpmsg commands on the remote side.
>

I agree.

> However, the GPIO controller hardware remains the same. So bindings
> shoudln't change.
>

That is where I have a different point of view.  There is no need to
have information in the bindings the kernel won't use.  We are
advertizing virtio-gpio devices and as such should use virtio-gpio
bindings.  The only thing that changes is the transport method, i.e,
encapsulated in RPMSG rather than directly over virtqueues.

> IMHO That means, if I want to move any existing GPIO-controller to the
> remote side, and want the rpmsg-gpio driver to handle it then, all I
> need to change is the compatible string of the current gpio-controller
> device node. The rest of the address space should remain the same, and
> leave ranges property empty. If the remote core has different view of
> the address space, then the device should contain remote's view and
> parent bus (rpmsg-io bus) should provide linux view via 'ranges' property=
.
>
> That is just the device hw representation in the device-tree as rpmsg
> device. Same for any other type of the controller: i2c, spi etc.
>
> Thanks,
> Tanmay
>
>
> >>
> >> So bindings should include 'ranges' property in the parent node. Then
> >> linux view of the start address becomes src ept, and remote view of th=
e
> >> start address becomes dest ept. The remote view of the start address i=
s
> >> expected to be the static src endpoint on the remote side.
> >>
> >> Following representation of the rpmsg devices (gpio, i2c, spi or any o=
ther):
> >>
> >> rpmsg {
> >>   #address-cells =3D <1>;
> >>   #size-cells =3D <1>;
> >>
> >>   rpmsg-io {
> >>     compatible =3D "rpmsg-io-bus";
> >>     ranges =3D <remote_view_addr(dst ept) linux_view_addr(src ept) siz=
e>;
> >>     #address-cells =3D <1>;
> >>     #size-cells =3D <1>;
> >>
> >>     gpio@remote_view_addr(or dst ept) {
> >>       compatible =3D "rpmsg-io";
> >>       reg =3D <remote_view_addr addr_space_size>;
> >>       gpio-controller;
> >>       #gpio-cells =3D <2>;
> >>       interrupt-controller;
> >>       #interrupt-cells =3D <2>;
> >>     };
> >>
> >>     ...
> >>
> >>   };
> >>
> >> };
> >>
> >> Example device-tree:
> >>
> >> rpmsg {
> >>   #address-cells =3D <1>;
> >>   #size-cells =3D <1>;
> >>
> >>   rpmsg-io {
> >>     compatible =3D "rpmsg-io-bus";
> >>     ranges =3D <0x10000 0x50000 0x1000>,
> >>              <0x20000 0x60000 0x1000>;
> >>     #address-cells =3D <1>;
> >>     #size-cells =3D <1>;
> >>
> >>     gpio@10000 {
> >>       compatible =3D "rpmsg-io";
> >>       reg =3D <0x10000 0x1000>;
> >>       gpio-controller;
> >>       #gpio-cells =3D <2>;
> >>       interrupt-controller;
> >>       #interrupt-cells =3D <2>;
> >>     };
> >>
> >>     gpio@20000 {
> >>       compatible =3D "rpmsg-io";
> >>       reg =3D <0x20000 0x1000>;
> >>       gpio-controller;
> >>       #gpio-cells =3D <2>;
> >>       interrupt-controller;
> >>       #interrupt-cells =3D <2>;
> >>     };
> >>
> >>   };
> >>
> >> };
> >>
> >>
> >> Thanks,
> >> Tanmay
> >>
> >>
> >>>> To be more specific this will look like following:
> >>>>
> >>>> Host (Linux)                       Remote (baremetal/RTOS)
> >>>>
> >>>> rpmsg ch/device 1:
> >>>>     - rpmsg ept 1   <------>     rpmsg ept 1 gpio-controller 0
> >>>>
> >>>> rpmsg ch/device 2:
> >>>>      - rpmsg ept 2   <------>     rpmsg ept 2 gpio-controller 1
> >>>>
> >>>>
> >>>> The question is, how to decide src ept, and dest ept on both sides?
> >>>> I still think it should be static endpoints.
> >>>>
> >>>> I will get back with more reasoning on that.
> >>>>
> >>>>> On the remote side, we have to hardcode Which rpmsg controller is m=
apped
> >>>>> to which endpoint.
> >>>>>
> >>>>>> Or did I misunderstand your questions?
> >>>>>>
> >>>>>> Thanks,
> >>>>>> Arnaud
> >>>>>>
> >>>>>
> >>>>>
> >>>>> I gave this patch more time yesterday, and I think the 'reg' proper=
ty
> >>>>> should represent remote endpoint, instead of the gpio-controller in=
dex.
> >>>>>
> >>>>> So in this approach remote implementation is expected to provide
> >>>>> hard-coded (static) endpoints for each gpio-controller instance, an=
d
> >>>>> that same number should be represented with the 'reg' property.
> >>>>>
> >>>>> On remote side:
> >>>>>
> >>>>> #define RPMSG_GPIO_0_CONTROLLER_EPT (RPMSG_RESERVED_ADDRESSES + 1) =
// 1024
> >>>>>
> >>>>> ept_1024_callback() {
> >>>>>
> >>>>>       // handle appropriate gpio port ()
> >>>>>
> >>>>> }
> >>>>>
> >>>>> On linux side:
> >>>>>
> >>>>> So new representation of controller:
> >>>>>
> >>>>>  rpmsg_gpio_0:   gpio@1024 {
> >>>>>              compatible =3D "rpmsg-gpio";
> >>>>>              reg =3D <1024>;
> >>>>>              gpio-controller;
> >>>>>              #gpio-cells =3D <2>;
> >>>>>              #interrupt-cells =3D <2>;
> >>>>>              interrupt-controller;
> >>>>>           };
> >>>>>
> >>>>>  rpmsg_gpio_1:   gpio@1025 {
> >>>>>              compatible =3D "rpmsg-gpio";
> >>>>>              reg =3D <1025>;
> >>>>>              gpio-controller;
> >>>>>              #gpio-cells =3D <2>;
> >>>>>              #interrupt-cells =3D <2>;
> >>>>>              interrupt-controller;
> >>>>>           };
> >>>>>
> >>>>> gpios =3D <&rpmsg_gpio_0 (GPIO NUM or PIN) flags>,
> >>>>>       <&rpmsg_gpio_1 (GPIO NUM or PIN) flags>;
> >>>>>
> >>>>> Now in the linux driver:
> >>>>>
> >>>>> You can easily retrieve destination endpoint when we want to send t=
he
> >>>>> command to the gpio controller via device's "reg" property.
> >>>>>
> >>>>> This approach also provides built-in security as well. Because now
> >>>>> gpio-controller instance is hardcoded with the endpoint callback, i=
t
> >>>>> can't be modified/addressed without changing the 'reg' property.
> >>>>>
> >>>>> Just like you wouldn't change device address for the instance of th=
e
> >>>>> gpio-controller right?
> >>>>>
> >>>>> This approach can be easily adapted to all the other rpmsg controll=
ers
> >>>>> as well.
> >>>>>
> >>>>> So, dynamic endpoint allocation doesn't make sense in this case. Dy=
namic
> >>>>> endpoint allocation makes more sense for user-space apps which don'=
t
> >>>>> really care about endpoints and only payloads.
> >>>>>
> >>>>> But, here we are multiplexing device-addresses with endpoints, and =
so it
> >>>>> has to be fixed, and presented via 'reg' property. So, firmware can=
't
> >>>>> change device-address without Linux knowing it.
> >>>>>
> >>>>> Thanks,
> >>>>> Tanmay
> >>>>>
> >>>>>
> >>>>>>
> >>>>>>>>>>>> This way device groups are isolated with each channel/namesp=
ace, and
> >>>>>>>>>>>> instances within each device groups are also respected with =
specific
> >>>>>>>>>>>> endpoints.
> >>>>>>>>>>>>
> >>>>>>>>>>>> Thanks,
> >>>>>>>>>>>> Beleswar
> >>>>>>>>>>>>
> >>>>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>
> >>>>>>>>
> >>>>>>>
> >>>>>>
> >>>>>
> >>>>
> >>
>

