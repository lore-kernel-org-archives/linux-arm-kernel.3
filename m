Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE735CD4F39
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 17:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JC+WHcUhpCEgLv+z/dz5uJKI5jcxrqy0Eu1amoyfn8U=; b=315Uh1QcbSSvWfwZ3WooEGh4s2
	DsP7qiUFTPQPxpV8X0537av/p5IJREZLpd7pME7vp3TRgbVMqnSPM5b5BaglIZJ3nfHDs8g7hKICq
	qBUnQ+m3gd/mbk5Erejzgty8KpT/qu0hKMxFoUpDM/jrgkjCm5YG9/SQ7hmwFHmZ8D5aSEgLKqdMf
	WuJaUZM538Y2/IlrSmOTzsyQ1Tw2MgVRSHp4lD0vZqKI73qyltgDl0/ZwjgU5yPQODEDIyLrMcXjV
	qSDQs23hucx0WdrFjyLrosuN4rNAsgPeNjicMPAuz6FvTfd6+38aupHShUx7IvxUtqmsP03KQ8saH
	CXM/HBXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNZxt-00000006DF4-2wbs;
	Thu, 14 May 2026 17:35:17 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNZxp-00000006DEY-3sfM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 17:35:15 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-8353fd1cb5fso60206b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 10:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778780112; x=1779384912; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JC+WHcUhpCEgLv+z/dz5uJKI5jcxrqy0Eu1amoyfn8U=;
        b=etTeKrNLV3QtZY+J9D/DIm6uONX9uklTYCtfU68xaZBpFVgZFagpeWFJS+3oqBWCYF
         KhvQjg0t5Pk6e2a5HecvYTO751pEsXIaKQM+SeMop/QEsjDTcnmaB08f8POOiwtgqyPY
         sLWtcujC2JY+TvBncEpArv7/0ZmIxlkcu2kJlmPUgIaYvOHWCJo5hY7SB5zJ39mAEufJ
         nCS0+0YkoJVu5koH/C3Hlo4G5lKpMHFHOvZcsWBdmjxEiHr8yD7+6XWlpi9+Krq1X46u
         1gjp/X98yveaSt5DvjD+J//OCyLyL4IMjISCzO5oqdIZJTLDcmV3tfvFawP4sf9z2DSR
         DUoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778780112; x=1779384912;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JC+WHcUhpCEgLv+z/dz5uJKI5jcxrqy0Eu1amoyfn8U=;
        b=Uv5Ziv/NVzWetV8uFioewtC48bf8AclirGzP3YRzqlvk4F6TbZAPZVgRkq9JIoX2Pr
         fbkaRqKSSPb2zeTL7Zk4et0P+3sVr45GQjZs3Tu9SePTlrY/LzdtDfa7UZyYVxQ6gYqF
         jiGAdc8kdYZTSPjiYNpS4uNHWsCfGrzTV9Dx15UtKJ/T4HooW0EerF9ukOb3CrRqh/EM
         Vdm5ElN54uNVfmVgpqcb7djdYFKmai6F+7u5el27R2oPC994jije4DtjMuZdp/OCfsnw
         ldqcKj5++X6WHE6cG3FMGTOMTmr1bmkn5aJ3h7xUfQ9uPFeY7h9iKeImY1s3cQj7xjP3
         UuAQ==
X-Forwarded-Encrypted: i=1; AFNElJ9UAfmA+gn6SoAp1E/VSd3uLj8eaxZXuoPv0jVLrB5C+z6WKzb53/vet5Ws/ZIaREApuITAs4ww1H7IY8JXIgaN@lists.infradead.org
X-Gm-Message-State: AOJu0Ywrrx7vBG+KcrO+5BCu9SEOkN4RwToG7+F3Sa71pCB0C9NQW5DJ
	eFkFDCRFkdp6q/5DrEZWNSAYxrl4vdnU8gn1GAUEZb9fxIEp8WNm5E+208zTP4onMlc=
X-Gm-Gg: Acq92OHZQdi1F4o96X5UIZBKjNpOOz1EUa/1ehIx5rthaMWxaZJs/zif5XVRby5brnQ
	INt8Bbv0t8eNV3t16sKSS2n8RU/4WilJvjCL727YGrA2MCnOp2rnbm1UCYBke4Ix1hQTqnqeySF
	5nbC8Ew2HUCGEZGBBG9fNG6eVc4oK8S5RXlLLcA4oCtbnoPJaq2HgbXKwY0OI9FOrtqRTsQ9tMx
	uQEesUn7r3HgvueBxaTgTP/ZKpDL2FptkJO3DV7GptcMWd20TU1Up8qnxr3afWuqnG/GXPKMt61
	+tqhScQo8sarhMN0343gdj1TESct/tgm5tcCWkIcxwlipAoiD6GX6zzMfQqG/8vavMBt7Jy3iaE
	1qBHqhha3fqBurMloRD2oMB8Lhme8W2S/uekBB7h7bhOu5+gSxwGQzHbbAJWidflZY66h97FneC
	bOvSqS+kRsjYcqdxv5zIjHFUBdSh4=
X-Received: by 2002:a05:6a00:909a:b0:837:6bb9:acc1 with SMTP id d2e1a72fcca58-83f18dbabc2mr4476063b3a.13.1778780112051;
        Thu, 14 May 2026 10:35:12 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:30c0:f7f8:e305:407f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c7ed3fsm3281092b3a.45.2026.05.14.10.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 10:35:11 -0700 (PDT)
Date: Thu, 14 May 2026 11:35:08 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	Beleswar Prasad Padhi <b-padhi@ti.com>,
	Andrew Lunn <andrew@lunn.ch>, Linus Walleij <linusw@kernel.org>,
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
Message-ID: <agYHzH-nJLl1HFIn@p14s>
References: <CANLsYkzt9xUczxSU28u-TfZAAjr0ufZKXAj8Eqfq=45gufXW3w@mail.gmail.com>
 <f7ef3417-eb84-4467-ac72-a9bc8b0c81e8@foss.st.com>
 <21de8440-adf7-454b-acfc-06e50882e075@ti.com>
 <4c526816-b127-43e7-86e9-eee4dc1152bc@foss.st.com>
 <268f8e00-91bc-43ea-ba95-077cf859e7f3@ti.com>
 <9e2492d3-8753-46c7-8db6-5f1a80b4f2e9@foss.st.com>
 <db4c18be-1c8d-4227-9fcc-1d25cec50e37@ti.com>
 <6917e3d7-8c6c-4e63-8eca-5308621ec3e8@foss.st.com>
 <afzIABSh1xtMEGbf@p14s>
 <PAXPR04MB9185BFA6E7375FAD0B15B021893C2@PAXPR04MB9185.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB9185BFA6E7375FAD0B15B021893C2@PAXPR04MB9185.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_103513_987839_429672CC 
X-CRM114-Status: GOOD (  55.40  )
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

On Thu, May 07, 2026 at 07:43:33PM +0000, Shenwei Wang wrote:
> 
> 
> > -----Original Message-----
> > From: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Sent: Thursday, May 7, 2026 12:13 PM
> > To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
> > Cc: Beleswar Prasad Padhi <b-padhi@ti.com>; Shenwei Wang
> > <shenwei.wang@nxp.com>; Andrew Lunn <andrew@lunn.ch>; Linus Walleij
> > <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan Corbet
> > <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
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
> > > > >  From my perspective, based on your proposal:
> > > > >   1) Linux should send a get_config message to the remote proc (0x405 ->
> > 0xD). 2) The remote processor would respond with the list of ports, associated
> > > > >      with an remote endpoint addresses.
> > > >
> > > >
> > > > Agreed, we can scale it for multiple remote endpoints like this.
> > > >
> > > > >   3) Linux would parse the response, compare it with the DT, enable the
> > GPIO
> > > > >      ports accordingly, creating it local endpoint and associating it with
> > > > >      the remote endpoint.
> > > > > Using name service to identify the ports should avoid step 1 & 2 ...
> > > >
> > > >
> > > > Yes, but won't that make a lot of hard-codings in the driver?
> > > >
> > > > +static struct rpmsg_device_id rpmsg_gpio_channel_id_table[] = {
> > > > +    { .name = "rpmsg-io-25" },
> > > > +    { .name = "rpmsg-io-32" },
> > > > +    { .name = "rpmsg-io-35" },
> > > > +    { },
> > > > +};
> > > >
> > > > What if tomorrow another vendor decides to add more remoteproc
> > > > controlled GPIO ports to Linux, they would have to update this
> > > > struct in the driver everytime. And the port indexes (25/32/35)
> > > > could also differ between vendors. We should make the driver dynamic
> > > > i.e. vendor agnostic.
> > > >
> > > > I think querying the remote firmware at runtime (step 1 & 2 above)
> > > > is a common design pattern and makes the driver vendor agnostic. But
> > > > feel free to correct me.
> > > >
> > >
> > > You are right. My proposal would require a patch in rpmsg-core. The
> > > idea of allowing a postfix in the compatible string has been discussed
> > > before, but, if I remember correctly, it was not concluded.
> > >
> > 
> > I also remember discussing this.  I even reviewed one of Arnaud's patch and
> > submitted one myself.  This must have been in 2020 and the reason why it wasn't
> > merged has escaped my memory.
> > 
> > > /* rpmsg devices and drivers are matched using the service name */
> > > static inline int rpmsg_id_match(const struct rpmsg_device *rpdev,
> > >                                 const struct rpmsg_device_id *id) {
> > >       size_t len;
> > >
> > > +     len = strnlen(id->name, RPMSG_NAME_SIZE);
> > > +     if (len && id->name[len - 1] == '*')
> > > +             return !strncmp(id->name, rpdev->id.name, len - 1);
> > >
> > >       return strncmp(id->name, rpdev->id.name, RPMSG_NAME_SIZE) == 0;
> > > }
> > >
> > > Then, in rpmsg-gpio, and possibly in other drivers such as rpmsg-tty
> > > and a future rpmsg-i2c, we could use:
> > > static struct rpmsg_device_id rpmsg_gpio_channel_id_table[] = {
> > >     { .name = "rpmsg-io" },
> > >     { .name = "rpmsg-io-*" },
> > >     { },
> > > };
> > 
> > That was my initial approach.  We don't even need an additional "rpmsg-io-*" in
> > rpmsg_gpio_channel_id_table[].  All we need is:
> > 
> > /* rpmsg devices and drivers are matched using the service name */ static inline
> > int rpmsg_id_match(const struct rpmsg_device *rpdev,
> >                                  const struct rpmsg_device_id *id) {
> >  +     size_t len = strnlen(id->name, RPMSG_NAME_SIZE);
> > 
> >  -     return strncmp(id->name, rpdev->id.name, RPMSG_NAME_SIZE) == 0;
> >  +     return strncmp(id->name, rpdev->id.name, len) == 0;
> > }
> > 
> 
> If we encode the port index directly into ept->src, for example:
> 
>     ept->src = (baseaddr << 8) | port_index;
>

There is no rpmsg_endpoint::src.  You likely meant ept->addr.  This would work
but not optimal on two front:

(1) rpms_endpoint::addr is a u32 and idr_alloc() returns an 'int'.  As such
there is a possibility of conflict.  I concede the possibility is marginal, but
it still exists.

(2) By proceeding this way, the kernel exposes the GPIO controller it knows
about.  It is preferrable to have the remote processor tell the kernel about the
GPIO controller it wants.

I am done reviewing this revision.  Given the amount of refactoring needed, I
will not look at the code.  Please refer to this reply [1] for what I am
expecting in the next revision. 

[1]. https://lwn.net/ml/all/CANLsYkwBk0KbN-k9ce+5=oT+scdZ3nU5AOr3Fz4zT=0AFzghDA@mail.gmail.com/
 
> where baseaddr can be derived from the channel address, we can avoid the possible address conflict.
> 
> With this approach, the patch to rpmsg-core would no longer be necessary.
> 
> Thanks,
> Shenwei
> 
> > And let the rpmsg-virtio-gpio driver parse @rpdev->id.name to match with a
> > GPIO controller in the DT.
> > 
> > >
> > > If exact name matching is strongly required, then this proposal would
> > > not be suitablea.
> > >
> > > A third option would be a combination of both approaches: instantiate
> > > the device using the same name service from the remote side, as done
> > > in rpmsg-tty. In that case, a get_config message, or a similar
> > > mechanism, would also be needed to retrieve the port information from the
> > remote side.
> > >
> > 
> > I'm not overly fond of a get_config message because it is one more thing we have
> > to define and maintain.
> > 
> > Arnaud: is there a get_config message already defined for rpmsg_tty?
> > 
> > Beleswar: Can you provide a link to a virtio device that would use a get_config
> > message?
> > 
> > > Tanmaya also proposed another alternative based on reserved addresses.
> > >
> > > At this point, I suggest letting Mathieu review the discussion and
> > > recommend the most suitable approach.
> > >
> > > Thanks,
> > > Arnaud
> > >
> > > > >
> > > > > At the end, whatever solution is implemented, my main concern is
> > > > > that the Linux driver design should, if possible, avoid adding
> > > > > unnecessary complexity or limitations on the remote side (for instance in
> > openAMP project).
> > > >
> > > >
> > > > Yes definitely, I want the same. Feel free to let me know if this
> > > > does not suit with the OpenAMP project.
> > > >
> > > > Thanks,
> > > > Beleswar
> > > >
> > > > >
> > > > > Thanks,
> > > > > Arnaud
> > > > >
> > > > >
> > > > > > So Linux does not need to send the port idx everytime while
> > > > > > sending a gpio message anymore.
> > > > > >
> > > > > > Thanks,
> > > > > > Beleswar
> > > > > >
> > > > > > [...]
> > > > > >
> > > > >
> > >

