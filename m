Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23AECC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 18:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bBV0Sy/rtjPKatjfVFGEaCghJwUWQiYq5g6kIT5vukg=; b=dctPR4+2WgrrvLweh/U5v9upyR
	Xp6rRfUviOL3H8GAArFkrOJiN+0PonS38XGwmMmC/+4h41kFAyRVdiD6luPNyZe9F0mDnW94pdg5Y
	+nuQ4VzxsiiG1icQsHpRvLYxea8inC7MEa1ldIDT5O3UH3n5Ry+Ti2GdvurEU9wJM1kPw398URIMQ
	Q5Hg2KchA1ENb/3MIlbWuzI05I01Gwv6HUQP8OJxhtCZXS2iDwvlYHB5pT4Eqe0+OqK8nCERiQtFd
	rr4ZN+0LerBM8oeoTq0YqbK+8wSibZQuVBeLKVxiIGpn5Ity78oYjogv+kvenonnBaNgYIt3CtciO
	vj5tgssg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiHNw-00000008SiO-3yuP;
	Wed, 12 Feb 2025 18:22:56 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiHMV-00000008SM7-17Xs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 18:21:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739384485;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bBV0Sy/rtjPKatjfVFGEaCghJwUWQiYq5g6kIT5vukg=;
	b=cKQR2P+ttQ/BgsdDwJ+mzvZLKksrrUpdDq4sttwg/xaPtIQb1hD/KM/asNzta7bIbDth9p
	ZGpzkyUokez8jPodLYnSY1G76mtn0NZ9VKl3IAldWwZ82Vaordn3UX4E2vVQjOdEOrlYEs
	dBSxoeNMzKxCw3p37cGz2gN3e15c448=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-ItXxF3_NMSOMkV84K72B0g-1; Wed, 12 Feb 2025 13:19:50 -0500
X-MC-Unique: ItXxF3_NMSOMkV84K72B0g-1
X-Mimecast-MFC-AGG-ID: ItXxF3_NMSOMkV84K72B0g
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5da0b47115aso6852194a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 10:19:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739384389; x=1739989189;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gZh4AjieEBhVpChkY/ZbfZf/JCY7uSfZ7yn1oUrifN0=;
        b=Aj6nT6TK2a1wEBAM4O04SOPZOHxiKy/s+L3BBII/0UUOKzYwyOiVS16p9PeYGCy7iA
         5SfbmObJezuIF4MdbGZ+KY4EoFVAyThFrlOsci4YGjJlpoS4BkPlU9i1hSEsn+HA5LZd
         BOrWXEoJDzaZNe+sx4oP8cacpc3tc22SJo2DcTgIE+9UGyKOigInkqORK3vLbOHu+RiO
         G+u31dQm/AxLsoCGEFZqPQ/KN76Aq5Lhgwg22LsfEl+hthYskFU6xxoAwYy5c2OTvQfQ
         3R1HBNoSOdp3EAFpoOkOppIWko6rqRODDG77eQIvx0euktvwuPkBUIUg8e/8/3AhZyv7
         cchQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSEVKHbVIX3hJHp59nz9E3umRaEhcOQ3rDLIvXCUJ3yT7gvd2i9BkeIcQ3ZJ7+WX5nE/UswVp9ey9SiTgAQAPa@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3BdHs/yLbAFLT9SsAR5LlURf++hVv1ijChb0ljHKRch/6I5IY
	oHveNoZYNPBWesK+cDUEQhCDOBHclCVbpvAn4j/mMQSZFuDe/XmtAak6uCyczKZIq2fSq3SyhWj
	dFFDXa7pBcISqCjCY/5AoA8bRt3QB/P+RlwK2Wp8iDXaKuuMHTS1metExI7nld5ku3nCy6a8H
X-Gm-Gg: ASbGncs2CNApCqmC/MiycHQCPuUVEHfjyAVCBCY6Yho7nT2Xj1BebTzeWUmJBzdIbZD
	XTMAuN5HHPJ9UUH+VNn9vDN7abCExyfgugcJkzXPPkkGkwSbdx5EYl+bwLiz7/kGxRlvILslr3d
	HOutoLPSr17NPb06Y0yyvGMcyhLTeq4Oxqd1/FLt1fNcQR+vxqtSzAnoO7tGIF3P6MSHiLlFMJn
	vaMQliGIWIwO4YFhAJrcN10NnwyHkmwDN/kX1HPSiwT7JjXcjD3A2yrkq0Uw0hCr97r3nCRG+Vz
	adJw4MAnTLHfkimX2zxJmDKqtOK40j1OoqReXZKGkbWVVrwwgE0DRhDOH9RUQkw2KGV1GlWU4Jl
	mRV1XBmUoGxQorQSrt2J9ezT+KeVOLtknDQ==
X-Received: by 2002:a05:6402:4605:b0:5dc:8f03:bb5c with SMTP id 4fb4d7f45d1cf-5deadd9217bmr3909050a12.11.1739384389354;
        Wed, 12 Feb 2025 10:19:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IESGQAXDzed7Fmi16ciLszJ4Ey0xkXA+j06UKHlLqfUdrmcANPKem5IWP/WHHNGNcVUN6LRhQ==
X-Received: by 2002:a05:6402:4605:b0:5dc:8f03:bb5c with SMTP id 4fb4d7f45d1cf-5deadd9217bmr3909028a12.11.1739384389013;
        Wed, 12 Feb 2025 10:19:49 -0800 (PST)
Received: from ?IPv6:2001:16b8:2d24:c00:803c:5b80:8fe:19d4? (200116b82d240c00803c5b8008fe19d4.dip.versatel-1u1.de. [2001:16b8:2d24:c00:803c:5b80:8fe:19d4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de4d250084sm10090241a12.16.2025.02.12.10.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 10:19:48 -0800 (PST)
Message-ID: <dfbc4edd2670fc102ba4959d99bb2c5d6bd1d626.camel@redhat.com>
Subject: Re: [PATCH] stmmac: Replace deprecated PCI functions
From: Philipp Stanner <pstanner@redhat.com>
To: Andrew Lunn <andrew@lunn.ch>, Philipp Stanner <phasta@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,  Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Serge Semin <fancer.lancer@gmail.com>,
 Huacai Chen <chenhuacai@kernel.org>, Yinggang Gu <guyinggang@loongson.cn>,
 Yanteng Si <si.yanteng@linux.dev>,  netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed, 12 Feb 2025 19:19:47 +0100
In-Reply-To: <885058ae-605b-46e6-989b-3ff52908e6fd@lunn.ch>
References: <20250212145831.101719-2-phasta@kernel.org>
	 <885058ae-605b-46e6-989b-3ff52908e6fd@lunn.ch>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BhlxvTPWqHrvorFS9px28dC9DUfw1glDXqagDFRU7V0_1739384389
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_102127_375275_429363C4 
X-CRM114-Status: GOOD (  20.42  )
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

On Wed, 2025-02-12 at 19:13 +0100, Andrew Lunn wrote:
> > =C2=A0=09/* Get the base address of device */
> > -=09for (i =3D 0; i < PCI_STD_NUM_BARS; i++) {
> > -=09=09if (pci_resource_len(pdev, i) =3D=3D 0)
> > -=09=09=09continue;
> > -=09=09ret =3D pcim_iomap_regions(pdev, BIT(0),
> > pci_name(pdev));
> > -=09=09if (ret)
> > -=09=09=09goto err_disable_device;
> > -=09=09break;
> > -=09}
> > -
> > -=09memset(&res, 0, sizeof(res));
> > -=09res.addr =3D pcim_iomap_table(pdev)[0];
> > +=09res.addr =3D pcim_iomap_region(pdev, 0, DRIVER_NAME);
>=20
> I don't know too much about PCI, but this change does not look
> obviously correct to me. Maybe the commit message needs expanding to
> explain why the loop can be thrown away? Also, is that BIT(0)
> actually
> wrong, it should of been BIT(i)? Is that why the loop is pointless
> and
> can be removed? If so, we should be asking the developer of this code
> what are the implications of the bug. Should the loop be kept?

Yes, the reason why the loop is pointless is that it calls BIT(0) for
all runs, instead of BIT(i). This would have caused an error btw if it
weren't for pci_resource_len(=E2=80=A6) =3D=3D 0, which I assume prevents t=
rying to
request BAR0 more than once, which s hould fail.

The commit message should mention this, agreed.

I assume this is not a bug, but the code was just copied from the other
part (also touched in this patch) where a loop was necessary. Argument
being that if the above were a bug, it would definitely have been
noticed because the BARs other than 0 are not being mapped, so trying
to access them should result in faults.

Although a confirmation by the respective developer would indeed be
nice.

P.

>=20
> =09Andrew


