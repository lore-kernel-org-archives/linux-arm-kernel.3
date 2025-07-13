Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32354C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 17:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6UielU/inQTLMHeeKNBTZ5P8oweh0lbHdXh4gUsettU=; b=OTOQ3RqAmAGqpxPBR8LXBdBy/O
	gtwyvOUgMIIH/Kqh0St4asf/HmG2NfskUYCrGxmvBAw45GdbLdi388yYW9XBtcG9sUtDnVnzhvymm
	vI64TLlPZ24ZlTGyYWH8EqiFDODWImZSOJRtyH5imXkokYqmHW6GyOfADp9/RwSezpl1hAeN+yGXR
	kblBdsv78Ngza6NRw3yw8xPr8GSqS9NkXUOwXonceknxd2K2sBRxMNIKez7JwPFlMSNl7o/Bm58zP
	gtnozExro42JRrzfNkNif58htngcXhO5J4pwrkCjC93kQvK7l+f0G+tSDIaAKwFDvGDdLTjtSfmIZ
	TrV/HVBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ub06C-00000000Q6c-3RKe;
	Sun, 13 Jul 2025 17:02:48 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ub03n-00000000Ptv-1jsj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Jul 2025 17:00:20 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-735a6faec9eso1932346a34.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Jul 2025 10:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752426018; x=1753030818; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6UielU/inQTLMHeeKNBTZ5P8oweh0lbHdXh4gUsettU=;
        b=PqBAzUh72D/Y6M6KhVys4M9jo/2gFHQROay1sYeG8RVCXtiEmuikzTNs/Yn0Jrwpx4
         7kXdaqMN7oafdl+8TaGuWcn7P6ai41uJMcE8Yt3+154uLl9U90infoP1FkSBGgNWYbY7
         KW6XS8jjgsMIGTu1PotNMDws+G8pZCtzrKpsHtEHev1YySyk/h5GDXrydnhz7hQ/Gu6Q
         2bLlxfDnMp7fhZN1lWzYYG8/bjeb/uABN/PF7qfUKGc8mKO0E9FsopsY+9+3wWV6WL2J
         DF5qeBct2BMICytlFyb59K5CMln+2paXGS2kYf0D5arpAjIFyxvp7uRXXReYSX8Usi7K
         c3yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752426018; x=1753030818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6UielU/inQTLMHeeKNBTZ5P8oweh0lbHdXh4gUsettU=;
        b=EhwXooVfeT1JH6OGqOWkxA8CK53uPXrOhCmXwdQB4E1qOsyyVkBfB2tVLOxDEgXycL
         cn1DqUoNiYE5ii0kq/lzycHIfKe+RI72S/twBWxyL0ee4LcpvUZIr1IGC+fP8f2Xn3PA
         hL3bnhT8eKESlKc/7tUAeqVtmJumjquUEJ/eO1gGVgCMJrtQlE7Vai2KgAK9mVNDEdo/
         D54Ce0o/3p9npwarnQjUX5nQjKbSLjtnd4bbc9xvgZKlzCtvUynubSi2cs5X0+QPOh/d
         VzqYEJV7rgGeve5OgrhSGlLZXn6q1u9Gp7gyuRuehKFnWB77+4iCJlKyqMUASPinebzl
         0mZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLf3CfUFAPYhkLu3eqSJ/FRgK0VQVdWNizmhmY5vgVuNfU0tj1RpCIOofSXeJ1S6pxtKsSkuA8ru/rpv9QU8Na@lists.infradead.org
X-Gm-Message-State: AOJu0YwP9DmAXSg2RNr4mC74BSmfd/0bgmBSG5b45EfxYcBDeQvkxBoU
	2VCuqNLslSHMEj06of/F2gsVSyHoXumV7aMJR2WcD1RLJSRG4JJgKhSFgKZo7GGXqPCzAhjWQu3
	n0rgwJYVn4G6dL5VRCLn2HrRRpPWc9Z8=
X-Gm-Gg: ASbGncsEvSEkhGVrY5kGGD+eInBThpnTzK25CN8S5UnJJcE5X9vaStPcANtpQgH1dbQ
	I6BCmER4QFPGIQKiO4p9Mw87qwDuOSb9TD/jIaXrcwqI2Hxg4mKPBGrhTBRrOtEJWt0RFSsg61F
	2RJMNJb9bhPWBk1iXRZc4qX/96w27XyTUTw6CBATAHRjz9sSZG/3/YSJSjX+TbfdQSpWkaj79zJ
	D9RSR82fpMTALZKOzI=
X-Google-Smtp-Source: AGHT+IEB4Vjq2MsGI3l8ASuGgXvLmMm3snf9k1QQxT74CBmG6fuOrZfLSiwL66z7qqJZ6YCbD48YTDm6ikzm+G0/g68=
X-Received: by 2002:a05:6808:4fe3:b0:401:cae9:4dc3 with SMTP id
 5614622812f47-4150d745d33mr7375679b6e.8.1752426017998; Sun, 13 Jul 2025
 10:00:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250609031627.1605851-1-peter.chen@cixtech.com>
 <20250609031627.1605851-6-peter.chen@cixtech.com> <CABb+yY17OOBx73655OhBp8At1b81w9M61zzGu4uhXcMTw4Q=Dw@mail.gmail.com>
 <aG0i75h32dWg/L2G@gchen>
In-Reply-To: <aG0i75h32dWg/L2G@gchen>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 13 Jul 2025 12:00:06 -0500
X-Gm-Features: Ac12FXz1lC8UVKS1fKWne5OFNOSCLRX_KfU-_2Y_l2QFGnsGYRRkOTZbJq257xg
Message-ID: <CABb+yY2BmqiQ18hU+7C234UnY8n-8PH5VEoS7nH5Xq5O1krGhQ@mail.gmail.com>
Subject: Re: [PATCH v9 5/9] mailbox: add CIX mailbox driver
To: Guomin chen <guomin.chen@cixtech.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de, 
	Peter Chen <peter.chen@cixtech.com>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	cix-kernel-upstream@cixtech.com, maz@kernel.org, sudeep.holla@arm.com, 
	kajetan.puchalski@arm.com, eballetb@redhat.com, 
	Gary Yang <gary.yang@cixtech.com>, Lihua Liu <Lihua.Liu@cixtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_100019_460159_42DE41D5 
X-CRM114-Status: GOOD (  31.52  )
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

On Tue, Jul 8, 2025 at 8:54=E2=80=AFAM Guomin chen <guomin.chen@cixtech.com=
> wrote:
....
> > > +/* [0~7] Fast channel
> > > + * [8] doorbell base channel
> > > + * [9]fifo base channel
> > > + * [10] register base channel
> > > + */
> > > +#define MBOX_FAST_IDX          7
> > > +#define MBOX_DB_IDX            8
> > > +#define MBOX_FIFO_IDX          9
> > > +#define MBOX_REG_IDX           10
> > > +#define CIX_MBOX_CHANS         11
> > > +
> > if it is not really a single controller owning different channels,
> > maybe implement only what you currently use.
> >
> As mentioned in the previous email, a single controller can support
> multiple different channels.
>
OK. I am not too worried about having all variants in one driver esp
when it is manageable and share the code.
Unless I am overlooking something. Arnd?


> > > +static u32 cix_mbox_read(struct cix_mbox_priv *priv, u32 offset)
> > > +{
> > > +       if (priv->use_shmem)
> > > +               return ioread32(priv->base + offset - SHMEM_OFFSET);
> > > +       else
> > > +               return ioread32(priv->base + offset);
> > > +}
> > > +
> > use_shmem is set for only CIX_MBOX_TYPE_DB, but it affects every read/w=
rite.
> > Maybe instead adjust the base for TYPE_DB?
> >
> The reason we introduced use_shmem here is that we had to adjust the base
> address of TYPE_DB to resolve the reg conflict in the DTS.
> This change has virtually no impact on performance.
>
Yes, I can see it should have no impact on performance and I think
adjusting the base once
during init is cleaner than checking the flag every read/write.
But wait... use_shmem is a controller wide flag, and isn't
priv->use_shmem always set to true  in cix_mbox_init() ?
Is the driver even tested?
....

> > > +static int cix_mbox_startup(struct mbox_chan *chan)
> > > +{
> > > +       struct cix_mbox_priv *priv =3D to_cix_mbox_priv(chan->mbox);
> > > +       struct cix_mbox_con_priv *cp =3D chan->con_priv;
> > > +       int index =3D cp->index, ret;
> > > +       u32 val_32;
> > > +
> > > +       ret =3D request_irq(priv->irq, cix_mbox_isr, 0,
> > > +                         dev_name(priv->dev), chan);
> > The same irq is requested for each channel. How do you expect it to
> > work? Maybe request it just once in probe and pass the 'priv' instead
> > of 'chan' , and in the cix_mbox_isr handle according to INT_STATUS
> >
> For the same mailbox controller, there won't be multiple channels
> simultaneously requesting the same IRQ, so there won't be an issue
> here. As you mentioned, if we need to handle multiple channels working
> concurrently in the future, we would need to modify cix_mbox_isr.
> However, that is not required at the moment.
>
Is it too hard to do it right already?

....
> > > +MODULE_AUTHOR("Cix Technology Group Co., Ltd.");
> > > +MODULE_DESCRIPTION("CIX mailbox driver");
> > > +MODULE_LICENSE("GPL");
> >
> > GPL v2 ? according to the SPDX-License-Identifier
> >
> > And please make sure you run scripts/checkpatch.pl
>
> Yes, I'm also confused here. I was previously using GPL v2,
> but when I ran checkpatch.pl, it triggered a warning due to
> commit bf7fbeeae6db ("module: Cure the MODULE_LICENSE 'GPL'
> vs. 'GPL v2' bogosity").  So I changed it to GPL.
>
Sorry, I was wrong. It should simply be GPL

Thanks.

