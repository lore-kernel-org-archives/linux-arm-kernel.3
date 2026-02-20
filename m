Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1975C54FCC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 08:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QWyU6+EDa2tZ3izfRcV9455sSz6dG3pm9f1+b8/1vqY=; b=WIa/ViaJWMahRLfuDn59WK7o2+
	0YPRLxeYLZzLWvfgtkDdVnR9IBKGuE6d4anEd+boaZLNfCEeBvvhUaJeRxg1mH88svahcsvG7EfQz
	dBgENYGlTwS/CWVyaGyohvuBDauwEi+3UQpb45sUUSNN0+0QigZMnpZH4jpeirqm55as7yzi6tzI3
	KLXOEFHHyTv6xpjPACzPkRfUavHT+lkSKNItyCDXyHDE4mjr57tN9J+hRY9o/kV66ML30CyWiq6ta
	tuiHNC/GfcX0AYwZG4zD576u6Jq/ZjgwWzcUEWPubVrly9c+cyaS2v1meThbAWIytvgiEoknsaRi2
	fKNQ1KfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtM3v-0000000DQsX-13mf;
	Fri, 20 Feb 2026 08:40:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtM3t-0000000DQs9-02ne
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 08:40:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A158B40A8F
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Feb 2026 08:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FE97C116D0
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Feb 2026 08:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771576832;
	bh=cwpGuMn1KdvSvNgpU8S5spu0pCHspmC3uPRaHcV292A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dbD6US+35B1DTaFeHFhukPBKZRCujlyRinsXovTJj8scp2d/lRVJK3BZQUt9i2kw1
	 xcPmrgkZ6ZRFkZXNJxrYcHzQgOGZ02pYN7g4Ye7uugq3TAHrFi6ipTsh+5BseQJV1b
	 UMQTOaDmUpowCwuiV3zabeAStnYsp4VC6Tfqwc29R6K6Pfh2gb7dxnhQENHL6T8TDx
	 Fe3IV/3GUMef5Y1wYbRMaxq1y7HFG06kzQanOlcbDKpjjqjRVDBvRRpIe95I90Qckx
	 HO0j270rX1yLYD8hqMm2n9qOYhpvdMXRGRaHge9ZNOFGNO310quzMzYdmWo+p+0m73
	 rKW0nIWlpJtcw==
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-64ae2ce2fe1so1810099d50.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Feb 2026 00:40:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWntiaudOcchM8ep/0vwO0fmO6Z8oDDTCDsMQ1O1vg4d0mBsiEf6AkRV5eeHbGYLs11wiUm82bCrL7vmUam+a2K@lists.infradead.org
X-Gm-Message-State: AOJu0YyocVkFRkJ3/Fg0eyAvtubBraKXyhJlU/E1vNIPPeYYcy5/2s2j
	WmuNa5MqYqCiBRRIr2GlD3F0y9L+PoRZ0o7tJmhJnmxzwpL9Jyg7Tx+TsXDnoWmBGo4gg/IgiCu
	VIMbOuFRLUSWVIb+cLx2iJgZ9an6lPFI=
X-Received: by 2002:a05:690e:1444:b0:64a:df3a:1533 with SMTP id
 956f58d0204a3-64c555625c5mr5986104d50.19.1771576831717; Fri, 20 Feb 2026
 00:40:31 -0800 (PST)
MIME-Version: 1.0
References: <20260220021949.40817-1-rosenp@gmail.com>
In-Reply-To: <20260220021949.40817-1-rosenp@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 20 Feb 2026 09:40:19 +0100
X-Gmail-Original-Message-ID: <CAD++jLkZJLsayzMnV=vTZ4nNMB5yWw6oogtbOjnj+MNUMJ8PEA@mail.gmail.com>
X-Gm-Features: AaiRm52J3bhw9AXp2v83yIbHN0n5WyPOfRj4AQR_C4rA1PoazwTXCOblWRlv5eY
Message-ID: <CAD++jLkZJLsayzMnV=vTZ4nNMB5yWw6oogtbOjnj+MNUMJ8PEA@mail.gmail.com>
Subject: Re: [PATCH net-next 0/2] net: ethernet: cortina: support deferral
To: Rosen Penev <rosenp@gmail.com>
Cc: netdev@vger.kernel.org, Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	"moderated list:ARM/CORTINA SYSTEMS GEMINI ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_004033_094466_AEDAB509 
X-CRM114-Status: GOOD (  10.98  )
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

On Fri, Feb 20, 2026 at 3:20=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wrot=
e:

> When using nvmem, it may be necessary to defer probe until the specific
> nvmem driver is loaded to get the proper MAC.
>
> Rosen Penev (2):
>   net: ethernet: cortina: use devm to enable clocks
>   net: ethernet: cortina: fix nvmem mac addresses

Net-next is closed so you will have to resend this:
https://netdev.bots.linux.dev/net-next.html

But I like what I see :)
Reviewed-by: Linus Walleij <linusw@kernel.org>

What I actually most of all want to achieve here is to support loading
the PHY as module, but I suspect that then the ethernet driver has to
be a module as well so modprobe can do its job.

Yours,
Linus Walleij

