Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 342BFD75BBB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 06:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pXBYO7IREaqcFC1AY+U6gH0DW+PukJ6oZRwSeQifutI=; b=WNwUIl5DzP3Iy0ozDw2Rak3CZb
	iBDmw2ll25l6ouWQWdsNCPEc23mOWShtgiw1rkJwVYmqxI+6uEDNasKE4QeNdFrqr4XJOkui+kcZj
	6vQV0y41vHURb7havwM3GTlE4u/kDRjIKJNq/MrdDiFLTpX1MbWD9ylmHgOvCRojkqy8CA1JQDzx5
	RkFikULF1siMuLxgk2oa1tjLUbyBm9qJQiTR2zsEyQiTkGJqWNOyoeulPeppe9DmaeJ+hVnPBLpes
	yLP2Lk5UtxFjurPFyWTdiCbFsB/ijabsjJmYcpoilS/nKdaibZoO4YlynikxGloeJ5r5UDAnDsm07
	Iy+3zuYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE0Gw-0000000GtZM-0QmN;
	Thu, 21 Nov 2024 06:02:34 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE0Fz-0000000GtUU-0Twb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Nov 2024 06:01:36 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5cf9ef18ae9so3108726a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Nov 2024 22:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20230601.gappssmtp.com; s=20230601; t=1732168892; x=1732773692; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pXBYO7IREaqcFC1AY+U6gH0DW+PukJ6oZRwSeQifutI=;
        b=aWU0jSn/2f5XMmWUrfShcbvdTTvirFIJhiMG3gFMnL4LD2Pz93pTjoH7PHNZZvjZS2
         MiDKap8MUinNR+9Ezuh3/Fd8HEYRycD2Ho8bQqSwcBY9/IvQ/hyQxgSMlK9p9FN4qDci
         xjBfWmRxmtaIA6VAOcTyyahLP7sKAIcCK5YC85Hx4POGfBZp1gbJy9IhW4zTFD/2sC9R
         ePnevD57EkEK/uVH47Yh0vGNhkK5J5uLe+zavlGjl/k9j36Y3XzyUQBbqjyG5EJcmxMC
         AWQA0jML0higvzqX+q9ts96xuVMBs90h9dlCg5IWIJr91zXJAri9IbVRbYss8sATWypB
         7AxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732168892; x=1732773692;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pXBYO7IREaqcFC1AY+U6gH0DW+PukJ6oZRwSeQifutI=;
        b=a5fGXeNslUtsmgy8VoB/kiYFkhshaQQX13hokIScCeYHh2TZcQpnSwAPCPe+FaV0Q9
         nFuvUhFue8II1Se7hkbs6gXC8KkRS5m6NCoOzEiwvy1IhEGqJt+rDGu3T+dwjETZCEBX
         jLDtp/HeJOZfk2ZSxKWpEwxfPvbvLO5aRlpVFUP2aMCiSXZnmzFEEygUwsPomPR7p/w6
         JzBrUedz4dT9Qj43qDoi/ySDqtvdxeTuHhH4QXvvwDFUa2YrceZiTbT4wYbC3obCrvgj
         6ZyzBz9xxNRUYdElMvhft1JCw+dymjkvfa/FZupbcLclayJMPQkpkOBf2lcVuWTp99tf
         /R+w==
X-Forwarded-Encrypted: i=1; AJvYcCXFpclZOLSunatHhi60iwTolwzPhQI2nsEaBUbCnuNUSI6UynmEpcwpwfpseXW/468TSBkXa7JluK49k/N3ZN5N@lists.infradead.org
X-Gm-Message-State: AOJu0YwVmXxB3V/hgPfPbS2ZMmRtmxjF21+k9LyzReqs7Osc89mw5RIV
	nwZZJW9CrR1v0KTSarrCgGJRsKF5ghU5ZdnSrBFUVdg3RJPkl809ASCxelM895OgsdCe7ooDK0V
	l+O32z/RImg/SNHepCENTdLmYz/+/gZl5zjI=
X-Google-Smtp-Source: AGHT+IErmyO6Auj29nMzsQsciAeQieUSQ40mWvouilmqn2J8jN6CWiJnyXtOkmFurSkWnL1C/48LjVI6yqaWSkbNQBg=
X-Received: by 2002:a17:907:3d92:b0:a9e:85f8:2a6d with SMTP id
 a640c23a62f3a-aa4ef969eedmr214855766b.11.1732168892228; Wed, 20 Nov 2024
 22:01:32 -0800 (PST)
MIME-Version: 1.0
References: <20241004061541.1666280-1-nobuhiro1.iwamatsu@toshiba.co.jp>
 <CABMQnVK_RUC84QQ5zb+ZpuMOZcFMNV6HzEYAfmX4bOrRm+rvTw@mail.gmail.com> <90978892-2086-4c70-9698-0957cc71abb8@lunn.ch>
In-Reply-To: <90978892-2086-4c70-9698-0957cc71abb8@lunn.ch>
From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Date: Thu, 21 Nov 2024 15:01:06 +0900
Message-ID: <CABMQnVJES+VoqNYNgo3zxFkTJVYkR=ZCwWsEFEe=QhKyaYie9w@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: socfpga: sodia: Fix mdio bus probe and PHY ID
To: Andrew Lunn <andrew@lunn.ch>
Cc: dinguyen@kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_220135_428724_2AD8C6CE 
X-CRM114-Status: GOOD (  16.03  )
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

Hi Andrew,

Thanks for your review.

2024=E5=B9=B411=E6=9C=8818=E6=97=A5(=E6=9C=88) 5:06 Andrew Lunn <andrew@lun=
n.ch>:
>
> On Sun, Nov 17, 2024 at 05:53:51PM +0900, Nobuhiro Iwamatsu wrote:
> > Hi Dinh,
> >
> > Please check and apply this patch?
> >
> > Thanks,
> >   Nobuhiro
> >
> > 2024=E5=B9=B410=E6=9C=884=E6=97=A5(=E9=87=91) 15:16 Nobuhiro Iwamatsu <=
iwamatsu@nigauri.org>:
> > >
> > > From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
> > >
> > > On SoCFPGA/Sodia board, mdio bus cannot be probed, so the PHY cannot =
be
> > > found and the network device does not work.
> > >
> > > ```
> > > stmmaceth ff702000.ethernet eth0: __stmmac_open: Cannot attach to PHY=
 (error: -19)
> > > ```
> > >
> > > To probe the mdio bus, add "snps,dwmac-mdio" as compatible string of =
the
> > > mdio bus. Also the PHY ID connected to this board is 4. Therefore, ch=
ange
> > > to 4.
>
> It is the address which is 4, not the ID.

Thanks, I will fix it.

>
>         Andrew

Best regards,
  Nobuhiro

--=20
Nobuhiro Iwamatsu
   iwamatsu at {nigauri.org / debian.org / kernel.org}
   GPG ID: 32247FBB40AD1FA6

