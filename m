Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE46C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 06:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eRIKFgzkF61kYnLz7Ci2gKmTsN7do9uyOR/32IqtdZ8=; b=3mFgRIedlcxkMb/ySS/eeIyzsK
	ZpE5c5k9lTBkVq9jaXbQ4AnombHxZV2pTg03kJ+Tt6g/AVePj8+mECQO8AN2ZqrFBEn47cLfyQr24
	qB+eT6qq1SAqjrgyBMx2nw/Z3CwWGEdkKfIBGaK9ttr9iU/PqaDtYPIuWU9RfKH5TtW6aphfDFOGT
	bFx1N8nJqBi83fBtbSAhidCtM5cCQ/ryOZvYDdOvj9pr43D1P3K0d0SfyWORaMqVqtj4e7q4PKq4W
	FXxTpa9xdkPLBCMjXu3Lq2cS/XrbUn34KHNvxoHUrZMA/meGpltYS/Z+08WroWH52Qj8eeaLZklG8
	1EQ0Z7ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjWuq-0000000B5Mh-2VPb;
	Tue, 14 Jul 2026 06:46:52 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjWuo-0000000B5Lp-1wRM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 06:46:51 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-47f3b39f2a1so387580f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 23:46:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784011609; cv=none;
        d=google.com; s=arc-20260327;
        b=EksB8u6QiE2d27PCgfAE9Z2de1g5/xq4yV5D/y4aWTwMCMiUP6jf7PsExXrQLpytKL
         /xXKRkC+qgs9rue61Vl0r4XnuKMn7qsGoWBmOUG0yv/JYE9//deq36PdnCGSVYhx6eFb
         7ytbuErOn4ONiWZkLfYZu2HFjBlVMIaafkZtj1p945YW/HeceHKl7eVpa1xdy4QkidyI
         dvhqn5BwEvX9t92M3CnGSx5zR1neIQBkwiFHXl3Lq6MeyesaqJWufiy66jnfwX6x+A83
         2RHfd70oFkOLtc6E0mqZKImxQNGlKbzb846y7Hp2End097GWPWnlwDysL8BnNCgZqzvG
         L1OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eRIKFgzkF61kYnLz7Ci2gKmTsN7do9uyOR/32IqtdZ8=;
        fh=pyfEjMyLrb8gFTZ98nPksGFLftAcOqlryNoW9mkGNEw=;
        b=DQmgwKgN9VkaKmeSErHOz3oxRSp0Vlme2wXFYzFBaTkrrbxYP8SF4+E069Eglqn10+
         J5eCyY0ACqapG7UO8mXCnZ7X8Q4PsFCprKrxJfgvELqm0uOF/nUmB4UO3+kYof+W7zrQ
         ZtkwZcJ77pGkinI9PSAjrGM9SBrCFAnkahQme/8GnaPiStFzmx9fkxnXbAi2BAtdiT7H
         hnafq5vcwAj+9qo8wR9RschcALriWACC2qjChqpPWGHPc0AURZ15uTjkFjSOqOKxQmFL
         ypZqagG8RfjEPLlzOVrksuhJ7Ilwk+PGbfInmMH4zpc/TJLSAtRZYGbrXIfJsosN06nx
         BjmQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1784011609; x=1784616409; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eRIKFgzkF61kYnLz7Ci2gKmTsN7do9uyOR/32IqtdZ8=;
        b=Lf3iEcK55ToTakFjR48jA9/w8OxgFz2sySU6e6E33g2Zd1RHIVwwIgMRI8Bh9NTfpk
         WV6m0xgvg54twLGZtWjtLzCXzgLA6jDcyHdLyps23HzNAE/bO+seQoxfGwnU8iw86943
         gqwOMAWd7Y/ZRAqx19kY/XIfV8K0Ymtj2tuWaWKgUw6tHbdHszIwQDTVcg04bcgOxqaZ
         mi6uawggiGnJG5IZuv19JhQvQO5skSbThdUOV5695GqgLiYPyhKz/oUFfxpRKN8CPTJ8
         Q3AFkmzhxjgysgZm1udNKU687BIXE9Yu5Rn/jJkes5XDtgFksPyIfbB3D7dJI79Hdshf
         Sc4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784011609; x=1784616409;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eRIKFgzkF61kYnLz7Ci2gKmTsN7do9uyOR/32IqtdZ8=;
        b=XKmkZRuV8yBLvoJWD5DWDwk0wCk9h+cnGMMTuNTbDizloNgM1OyZzgkwL9jH9JvYYE
         COAkU7PBQDejQzKy7iCYm1n3pZSgSJvz+qAj5TePOMmDIqPfCa46ck9uOYZvl0NRoDic
         wSxUV2PFERQmrkdcRcDHO34xUGXj/6lSXLA/a/o09laUP3C9jt7CsDGF0G84LfzVvBzt
         FAffGxYc+oEIQ9+sz6pRA7Mc3NE4eH43KdPCazrKwaG/ZWsa6939dQN/L9bJ8G3xz8sh
         T8DYrnvhZ7oyaTB2VoURhySW4YskNXMF0CoKxLciOG0ZupizgcBt9CW/UBqFQhx14p6/
         9fYw==
X-Forwarded-Encrypted: i=1; AHgh+Roj68grxu8Wgj0bvSWNyrO/Cg8KDIKHeQTspzq5qW9M84Ltrli7GTslv9gThy77ROidP5tSFcC64Nod11OIbMkt@lists.infradead.org
X-Gm-Message-State: AOJu0YxGGG8EXwT20U02GbffUpvuLp6uktB720YnGRMf0Ttnt+Npvr6/
	pK3cfGHa0C7QcPqByftfOin+ALCsH5gdeD/++57QNzwR/KcwKCxSDQaLuO5dh7s5C2X98IZ+Xmg
	WBJTdoFZMV0WlbU+qDGZojIB2ApA7TLFi5+8xmU5X1g==
X-Gm-Gg: AfdE7ckY4NgBZ+65RT1poeX2P5plWGX6p/MNHPSn5wgotaMT+6oUeQ97ZUYS6SpEnWr
	zGMCmGJYeHIbX7uksJu34PSD3pOjrX27Ib6seATPhex/jmslSZ9m0jb0qqMoYT5Y3yid5RcHHl7
	ZVCxlff3ds1l4o4aoXJDo3CskuUq8oHvGqUVcobMB0bnUV+/lLIWK/Hs9sSk8hxgoxlsHv2dopj
	E9pdFMmSy0Xy4gWQkaMNWr91BZmaLPCQg/ziOpyhq80ETHn+6CsrrP4ws0c7d9a8WBPc+i6E8w1
	zCtaGavkA+geOYAL0qs7YgsiGyY2y7tYtnlpn/4NJWhNsu/ENzORFwqIxg==
X-Received: by 2002:a05:6000:2c03:b0:46f:f12b:e457 with SMTP id
 ffacd0b85a97d-47f2dcc333cmr14446794f8f.21.1784011608749; Mon, 13 Jul 2026
 23:46:48 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1783524645.git.gregoire.layet@9elements.com>
 <51e455417bdcfe608270c6cb2806b1fd971fb998.1783524645.git.gregoire.layet@9elements.com>
 <eaef5bcc-99df-4549-8d37-fb3d127c414e@kernel.org>
In-Reply-To: <eaef5bcc-99df-4549-8d37-fb3d127c414e@kernel.org>
From: =?UTF-8?Q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Date: Tue, 14 Jul 2026 08:46:38 +0200
X-Gm-Features: AUfX_myOLR4_eYCcAMsMsFbuxCuEv8cibreksrI0hciTFLsi2wYi7z1DbvBt6s4
Message-ID: <CAFi2wKaO9ea77KP3hjoaruMgU8oVbbtuAmXK8p-12HRdRFOACQ@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] soc: aspeed: add host-side PCIe BMC device driver
To: Jiri Slaby <jirislaby@kernel.org>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, lkundrak@v3.sk, 
	devicetree@vger.kernel.org, gregkh@linuxfoundation.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, andrew@lunn.ch, 
	jacky_chou@aspeedtech.com, yh_chung@aspeedtech.com, ninad@linux.ibm.com, 
	anirudhsriniv@gmail.com, linux-serial@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_234650_521161_E4C691F6 
X-CRM114-Status: GOOD (  12.55  )
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

Hi Jiri,

> > ...
> > +
> > +enum aspeed_platform_id {
> > +     ASPEED,
>
> What is this good for?

Unecessary, it's removed now.

>
> > +};
> > +
> > +static const int vuart_msi_index[2] =3D { 16, 17 };
> > +static const int vuart_port_addr[2] =3D {0x3f8, 0x2f8};
>
> Sort of inconsistent spaces. Both arrays should be unsigned anyway. And
> for the latter, u16 should be enough.

True. Acknowledged.

> > ...
> > +
> > +     vuart_ioport =3D vuart_port_addr[idx];
> > +     /* ASPEED BMC device shift addresses by 2 to the left */
> > +     vuart_ioport =3D vuart_ioport << 2;
>
> Simply:
> vuart_ioport <<=3D 2;
> ? Or join the two lines?

Joined the two lines.

> > ...
> > +static struct pci_device_id aspeed_host_bmc_dev_pci_ids[] =3D {
> > +     { PCI_DEVICE(PCI_VENDOR_ID_ASPEED, PCI_BMC_DEVICE_ID),
> > +             .class =3D 0xFF0000, .class_mask =3D 0xFFFF00,
>
> PCI_CLASS_OTHERS << 16

Acknowledged

> > ...
> thanks,
> --
> js
> suse labs

Thanks for the review. Applied everything for the next revision.

Regards,
Gr=C3=A9goire

