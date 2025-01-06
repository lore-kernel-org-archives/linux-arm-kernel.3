Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D180AE77198
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 10:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XankIvDMHUqYhqUmdSBV0fOsVivenUwuoWrt76c4yck=; b=iqMExR1zMPa3DeDGCuDPnosJj3
	RkHwxivr1vJcWU0PTbVGK4voPo5T91eF3olOPHwK8Bp2CPm9KxYhY5I7KnWHO3ppSo56GA9b4Ps7/
	Y5oEvem3C7P4MkcYE/6E1rYQRKq7/eOhuarUiT+m+IPKFClCNM0/AXI83FyXnVJJDCdZAfhrlzov4
	miIwD2nO7yUY+2xUFQIhpzwnoRAHh9oma+9uRU40qoX+iFe5hIGTfVnmH78+36Ui0W6OKA/ShWQwT
	GLvuD1gEttKcMGkeIps2bIpX/T9aW06BcQvdB6+k/yXSV+B5ZVA8CNxsTj/awnZfFEV3DFAomWQJp
	5XG0KmrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUkPi-00000000rkY-1lwN;
	Mon, 06 Jan 2025 10:32:50 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUkOX-00000000rZ5-1saH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 10:31:38 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-30227c56b11so163688151fa.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 02:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1736159495; x=1736764295; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XankIvDMHUqYhqUmdSBV0fOsVivenUwuoWrt76c4yck=;
        b=ogdZnIE28sPT3A6+N0jIjbZoa4s2c+F6v7BW7hLRdnWVmzvV9UksWmoPG11ckYGeaD
         bqVfmM9nssfPVKoeko2hZuA8keU7MxCwMVofNDso7ZdxBxPYGJXl+XE15t8xf2wQCDXN
         6Fi0Q3Cu6OE5lfklOpdG0Q5Si9CC+Ai1aQVJMikuEAkAvPhzPVAEfwp9idOlUI7UiiQH
         lkE7GZELL4Ut4cVSlTGp4NAgSBKIGmxi/7+3UVekXo2Agz57rU3+uwo1VRrNGDsnmVcB
         VGIxTYuGW5WEXHHg/SIJ6MoMrPYr8dlDLYdArxfVdg2tbBZjJgTn7zzCGCsWI5aRJkTQ
         PP7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736159495; x=1736764295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XankIvDMHUqYhqUmdSBV0fOsVivenUwuoWrt76c4yck=;
        b=qjX4PFtpxN8tk1x+3uc/CmMNqm3Vj9pegVGy6oUGt0vcCrz7JimMIq70gwiG/7PpMQ
         yjfB1t2zJdQ83nAN0vJ+jDv9XZ/JSif1pRdi52jAQoK8Tnzptv0jxhmfMWMORt3PPSfY
         +USNQ1Djq7xmrssIB5qzQu/CmpSUqrrLA/1roCuh1Lh8WlPSZcFpQ3P4JJ5IiGQS1wov
         YDzYjs4SD2WKT9VWGtUvpbdR/P06nxo1BDNBL7RY/HZ58xqtcSxDkltG6N1tBcCvigaB
         W62bq6VbFiN4KGFIhB/On6ThMCMNMf9kxrH98aFUsS2QsPE+UkZTb4Pcwc5Xx1MR88cu
         4TCA==
X-Forwarded-Encrypted: i=1; AJvYcCW+BI5DU0aFRJv3xBv/eBEA7JWqK4XVIe3spgk77kNSIfSbgMUDilRvfRnbDVD26X//mVejT4yUjx2vwkVrbtOk@lists.infradead.org
X-Gm-Message-State: AOJu0YxJUowOfnI9bUp4gSufT747ZKtCg3st8NvYKc8snJ6jzkTLNILZ
	fh0ZJZx7wfO9KEkqoYksBbPIv/702O5n2JqnHeTojFd9UylsOQmAT5Ono9s/RZbi0ZmImP337jV
	Bw2zs5mnJVIyh1BfmQp3Zs2cB3QVKFdZpVLQebg==
X-Gm-Gg: ASbGncuou62+AWkA9HgzmBE7K5GHByDUJqrrshKQBR4t86TCRg9bUCzwTLuW0t1l28E
	0BknLvpVVu6kq+gWqyr5ELaMDrtg9bZfD+By4HCz+FAqjxxpj7KgVA2pZpiiPYZiuWF4=
X-Google-Smtp-Source: AGHT+IEiDRVszLPNSWReELs+FvHEEQT4b591zdm5BwFAgIooM/r46g0uSJ600ZcQi8LjZ7XFbgcpfge5W6rypOCrkew=
X-Received: by 2002:a05:6512:3d1f:b0:53e:3a94:c2bc with SMTP id
 2adb3069b0e04-5422953305fmr17304530e87.18.1736159494514; Mon, 06 Jan 2025
 02:31:34 -0800 (PST)
MIME-Version: 1.0
References: <20241211102337.37956-1-brgl@bgdev.pl> <awney7utrl5n63xsgzxnnlpqajuqtjnrjsbpzloic5iqt4pv2u@ktkhejuihbde>
 <CAMRc=Mci6bPCirruk90hnjBvJW0=HKhqCq+9p4t2k9B=Oy8Ocw@mail.gmail.com> <fxj2tqrjfr23cxqmtmpj74bombtfjn3qtpz5iiegvhbap7v5md@pkmrskwamatl>
In-Reply-To: <fxj2tqrjfr23cxqmtmpj74bombtfjn3qtpz5iiegvhbap7v5md@pkmrskwamatl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 6 Jan 2025 11:31:23 +0100
Message-ID: <CAMRc=MfRq9xU7a64qCOrDCYgSbeWVKF=PnzS8Cabm5a3zzFekQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] i2c: davinci: kill platform data
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Wolfram Sang <wsa@the-dreams.de>, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_023137_705952_8628977B 
X-CRM114-Status: GOOD (  17.15  )
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

On Sat, Jan 4, 2025 at 1:02=E2=80=AFAM Andi Shyti <andi.shyti@kernel.org> w=
rote:
>
> > > > -
> > > > -/* default platform data to use if not supplied in the platform_de=
vice */
> > > > -static struct davinci_i2c_platform_data davinci_i2c_platform_data_=
default =3D {
> > > > -     .bus_freq       =3D 100,
> > > > -     .bus_delay      =3D 0,
> > >
> > > what happened to bus_delay?
> > >
> >
> > bus_delay is not set by means other than platform data and it defaults
> > to 0 so it's safe to just remove it.
>
> yes, but how is it related to this patch? Can we put it on a
> different patch?
>

No, why? This patch removes platform data and all bits and pieces
associated with it. Splitting it into two just to first remove
bus_delay and then the rest doesn't make much sense IMO. The argument
that it's already not used would be incorrect as it IS used by
platform data (even though it itself is no longer defined anywhere).
I'd keep it as is.

Bart

