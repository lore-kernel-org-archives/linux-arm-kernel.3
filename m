Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E71C021BC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 09:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7dOhZ4GEiEzNzy8qb84jLXkJZgtOg9xscbP+hl2s5gU=; b=TkaO5b/guMEtMEc2PDZX5l9zGd
	SuhGZJuTzVngW5ZkaAgLUMLQQK3IAD/Ta5+uV8npITUVlDUpclk8Un+P/4pTH/BI4xsmFiu7Qx1aX
	cTQKHhLSSbEdMfPlUfHeGqiUjlnD3iVrg3c2RR+bcvn50RnsHv940crwVjUAqWashSBX13fL23/uD
	CEo8sqcCcm+HJFlGdBLrr3w76dZsu8LLPZ45wpseAQIScytA3bOTbRZ/T/VoeLt6skNTKOWKiKE0f
	VxRqk7adssxpR9Qk6lwXFEhShH7PqJozRQZ+WFi/O2K+59QIt4RUTlYLpksRgVhYZhZDvU1itBGUp
	fuaXYi5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmrZ3-0000000GgOl-0DMM;
	Tue, 25 Feb 2025 09:49:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmr1x-0000000GY3z-2Vfz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 09:15:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740474908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7dOhZ4GEiEzNzy8qb84jLXkJZgtOg9xscbP+hl2s5gU=;
	b=Ul1a3FtKw4SkjeJbk7IKnaU2jGy1PBb8IsUG/LyELosZyrWx5UA2YS9PLT7FGsXKdPuR6y
	6hTbRgSo+V52+6To0gxLPMRAu/FTrTz0stEAAH/4BiwxbAKWddQ71waItzccj7Lqotj7IJ
	UYWIesoMdiWt8MdYp33zcNivG/tdTPI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-342-DPzITfO0O6O1888oKgVx8g-1; Tue, 25 Feb 2025 04:15:07 -0500
X-MC-Unique: DPzITfO0O6O1888oKgVx8g-1
X-Mimecast-MFC-AGG-ID: DPzITfO0O6O1888oKgVx8g_1740474906
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4398a60b61fso26978405e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 01:15:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740474906; x=1741079706;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5mY0Y8NDtCq9U6kZXa7z7cTNd5hZ8Jf2lYO6g2P04nc=;
        b=uUraORYQYF2O0jygfk0XTJ3vpmYSu3LK2N4eYjMjIxWNPUV0iZ6wq8tao9Gc4M+9EN
         w2B6HWJ5hpAyNTWAl1gLJYaCjd8O+kXOdzZX4N3e4uz6B5y22blE+CzwNWRwdzk4GU9k
         9gxhPB3dqlNhrat/Oi+3JwMkigca6A2BdIrarnx3P9mR+9qtNM5ZxCN3vRq/a51eiKPT
         TcVwKptEIZBp4+GpHKaJzxq8HjKDFxTcXHS+BavIENNECzBcm9n/m1ntjX0ZH5TxWsW/
         Mff8WNR2osaSJt/sTXmL9ZwYmvWPYwkoixuKstqWPkvfNmhpwTr6KUfup22Dqos6pmmi
         Favw==
X-Forwarded-Encrypted: i=1; AJvYcCVHa0drlPKHICchxe4Nr3HiLDgVsVN1QBKHwqmWxmS9b2yo4rUN6+PvTMICDQrdfQwcqx2OS2KzsMztjqprRCpG@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8NsBmN/T1sjB3/932IMacXuR+UabYxsIr9MTB4BdYMVuCkpds
	zIB/U77RRURAbFjPpFVGedrFkxPzfhUUPNvdUqY0QsMaZk/iyQFbkpNI1FzP55iK9O2GGEmmwcC
	9nJtUfGrT0ICpO4prbpsO1rvfFHET3O1bts/4vTwJ6YqM9ojYlD17RvIisgJRXX1qpj6rDv4E
X-Gm-Gg: ASbGncu0LeNuj94iC0vV2Ze120aZezTPAJbYhuUDInANmq4kviOALiAa8st0sB3UY7t
	Noy/0wAzXXc3Qj09xO2MTXz6LGIVw18fbPsWqdFT4vSNyxT3o743TXlNBGIs+CpzPXYMW3KxjxI
	o4TXM9TH/1WiB5sNbG1xRq9BbqKf54uZjxvQYYOQ6u6eeacSYLAG2Xw0H9mP8GDqD5UKx1rtEuR
	vn45yURdzB/JTcYuv/0N9MmIyzuuYyJiBX727GXELDUYeCO9LK4LbjCpEhbqa4FulKBhHiwOfAt
	hcrQyddEmC74HwJ3bCjebzQKTRLfpOMSp5noUOBoLQ==
X-Received: by 2002:a05:600c:1546:b0:439:9946:af60 with SMTP id 5b1f17b1804b1-43ab0f72b03mr17377135e9.25.1740474905745;
        Tue, 25 Feb 2025 01:15:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFv74YgG8Iolf174w9Y9ybHGXlvSToIfrToEGjP2c4/7Rl0aROxWh/UMKakDjj4UqxbgXB2bQ==
X-Received: by 2002:a05:600c:1546:b0:439:9946:af60 with SMTP id 5b1f17b1804b1-43ab0f72b03mr17376785e9.25.1740474905347;
        Tue, 25 Feb 2025 01:15:05 -0800 (PST)
Received: from [10.32.64.164] (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ab1532f0asm18718845e9.4.2025.02.25.01.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 01:15:04 -0800 (PST)
Message-ID: <7df6e1846ed6932c789a913c6a10aa8df5e26519.camel@redhat.com>
Subject: Re: [PATCH net-next v3 2/4] stmmac: loongson: Remove surplus loop
From: Philipp Stanner <pstanner@redhat.com>
To: Yanteng Si <si.yanteng@linux.dev>, Philipp Stanner <phasta@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Huacai Chen <chenhuacai@kernel.org>,
 Yinggang Gu <guyinggang@loongson.cn>, Feiyang Chen
 <chenfeiyang@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Qing
 Zhang <zhangqing@loongson.cn>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue, 25 Feb 2025 10:15:03 +0100
In-Reply-To: <437d4fad-6cd4-4f90-a1bb-07193d015cad@linux.dev>
References: <20250224135321.36603-2-phasta@kernel.org>
	 <20250224135321.36603-4-phasta@kernel.org>
	 <437d4fad-6cd4-4f90-a1bb-07193d015cad@linux.dev>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: eWZBtyJB8XrjaZAZgWzv68oZxTbjzplZQMd0p2Gr9pU_1740474906
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_011509_714569_8694BD73 
X-CRM114-Status: GOOD (  21.09  )
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

On Tue, 2025-02-25 at 17:06 +0800, Yanteng Si wrote:
>=20
> =E5=9C=A8 2/24/25 9:53 PM, Philipp Stanner =E5=86=99=E9=81=93:
> > loongson_dwmac_probe() contains a loop which doesn't have an
> > effect,
> > because it tries to call pcim_iomap_regions() with the same
> > parameters
> > several times. The break statement at the loop's end furthermore
> > ensures
> > that the loop only runs once anyways.
> >=20
> > Remove the surplus loop.
> >=20
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
>=20
> It seems that the fix-tag has been forgotten, next two patches as
> well.

Not forgotten, I just think that patches 2-4 are code improvements, not
bug fixes.

The issue in patch 1 would cause actual misbehavior (a useless debug
information print in case of a resource collision), whereas 2-4 are
just ugly code, but not actual bugs: the loop always just runs once;
and unmapping the PCI resources manually is valid, but obviously
unnecessary.

Agreed?

P.

>=20
>=20
> Reviewed-by: Yanteng Si <si.yanteng@linux.dev>
>=20
> Thanks,
> Yanteng
>=20
> > ---
> > =C2=A0 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c | 11 +++---=
-
> > ----
> > =C2=A0 1 file changed, 3 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> > b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> > index 73a6715a93e6..e3cacd085b3f 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> > @@ -554,14 +554,9 @@ static int loongson_dwmac_probe(struct pci_dev
> > *pdev, const struct pci_device_id
> > =C2=A0=C2=A0=09pci_set_master(pdev);
> > =C2=A0=20
> > =C2=A0=C2=A0=09/* Get the base address of device */
> > -=09for (i =3D 0; i < PCI_STD_NUM_BARS; i++) {
> > -=09=09if (pci_resource_len(pdev, i) =3D=3D 0)
> > -=09=09=09continue;
> > -=09=09ret =3D pcim_iomap_regions(pdev, BIT(0),
> > DRIVER_NAME);
> > -=09=09if (ret)
> > -=09=09=09goto err_disable_device;
> > -=09=09break;
> > -=09}
> > +=09ret =3D pcim_iomap_regions(pdev, BIT(0), DRIVER_NAME);
> > +=09if (ret)
> > +=09=09goto err_disable_device;
> > =C2=A0=20
> > =C2=A0=C2=A0=09memset(&res, 0, sizeof(res));
> > =C2=A0=C2=A0=09res.addr =3D pcim_iomap_table(pdev)[0];


