Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3673CCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 06:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P7cmVKMa19PXBwMszLnkcUvMTM39+KT1KleRqDn9CZ8=; b=cBzr030WSmLD/VLAdj9eZ0tM+g
	4HG7sOYGhB/QZj+XF5xAO46CoRufFgACyvCI7mi4P1YBuDR/ZWeFj5R0dXSVHIBoYUNBle454RjEK
	/TsPWBHP5CsVFNnnF+PvIXWz1pUWA+/gn9hAyzYn4LLJaYMRgMH/30q/4knqo8LbGFjGisGszVg6x
	CRSsgU1fCKdr1K8uQS9O7veV3lheODZbqJcj4zyi2pT50OLhWKbQyznV+ti1kTNB3HuITl0Nbtmsb
	4XqMFpsKyB77iSkwi/b7CzNtWAY/gqmW8fpirznbQKqL6DjPP6oUDvt0b6pjd9pDNLg1cdgrclvfL
	Z8KIGNWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBpEE-00000005GRR-0Gnj;
	Thu, 23 Oct 2025 06:55:18 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBpEA-00000005GQ3-2yQn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 06:55:16 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-47112a73785so2568115e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 23:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1761202512; x=1761807312; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P7cmVKMa19PXBwMszLnkcUvMTM39+KT1KleRqDn9CZ8=;
        b=iZpsg4JfRqlibqjglI5c0kf3TSBtTNaL9Qd0byWXQIqibWXb0cAS8gDfLnwLgDw9rO
         zrIOAAt3X3a8SrJ5AktVmaALpFE58EVmFZWFTVg0DL9QGy8hkvRu+0NqqnfGHDsvfwGC
         IHT99MPI0KD+M0tzWk2AlceCYyEoaprWsl2EXnniY56/CGfjmhKFW4jU3qUrAzeQ1DHD
         DJjxQpvIvDq2aAflWcvIhjdh7EjIiLZqWDRg+FXzXbv+FUwgUqzSJcBXmZsUuhX97aJs
         ShiLMw29aGU3JzWCQzQvbROnjTHy+GCONYN/KtpjZ9CRLHH6aaC5B62wiu13tWP9rQzP
         cO7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761202512; x=1761807312;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P7cmVKMa19PXBwMszLnkcUvMTM39+KT1KleRqDn9CZ8=;
        b=EvHgy/VA1dOO0+QqOu07MkhgRjHUzHEqH0nGLGU8Wr2VDjxu2QrjqG6ABTULKGXp/H
         9JGx2FOA+efndB16SN99JiAK6CzTUQB8c/5HqRX3KKe7HXBn7nRx+ZYo0Jb9/tZ36GPo
         o8lrfTkFf53klAxwlZ3yb4zWWh4Ru0gjvdHTfGsFziy69rcPKhozquOQmI0SufOQWiKf
         5MBqkmmayCKAPcHxmAbmB3oYNN4PdWYJlBMLfDpwDDQOHZ5TTR8LDmrUBkQTl7VY7XdJ
         Wzki/BLdI8VpoAAd71iSCrwnr/3sx9VvKRJBxMJEoB9NzaCIr9dGw5OPMk0Cq67JViyA
         ljjw==
X-Forwarded-Encrypted: i=1; AJvYcCWHyLpj+XTw61/c/3MMh+9CHg/Lsm9vAwXAayNK+FpVpAneJqCciNI10yFrSEkXWXI6BsuBNIdatmMoLyy5CJQu@lists.infradead.org
X-Gm-Message-State: AOJu0Yzsv6/mpQU53WB1lSydiUjbFVZHJ0Z/vU0Rg04I34JzknwS9FsC
	nCeTHxzm98JE7ZHKHs0bHj/pexc3lW5sfEpGHQCCLURrr+7C9UgogQy1MuTL5wOpjHc=
X-Gm-Gg: ASbGncu1zxtLKzkFSyz1yL5V/fUMk3cM63X6fGHMfzlRPGLM+DGa/G5Ah4U1zi2dUPp
	ySmsGx9tPby/WWV7CfC9OgabBtgmLVKXuWoPKYSs1pgAST5wVQD7mV+zZATRb5oUAUcx4aH3byb
	Nw5mIay5kb1qpqIdmammndfD7LuGAk+LluODjYJpQI+WqC8n2hZhyP2gMkZhdwp4bcLqrlrQDi0
	+kp9Dg788hpIWuoE4E3EV+Pc/jxlG2bJcv/dZM+OZ/ON4aZpLKTAi+FVlrZzCdnx18Ewt/zJxam
	XvzJVoi1zENYfdAPjmb9RhbPpmd+EuH0RSJZErtEWF6xfRLfq/Mg5hZu8KjUrkL4R58kmvlC0D2
	mOJGHl8RAMX2GQC4O0GdOIco/lQr2OWGQfxxEYdqkH3zC33YoiZYoHWPPZBeDuFH4IEOseivSQ2
	egkQUw/ikHFJE+eN2pZjY+lr+6YNWtZSNwN7fXmya53YN38B2AzsIn
X-Google-Smtp-Source: AGHT+IGKHAzueYEARosceZQSUNRMYONnIXPxr3aLgyLwcX+P5PWjg4x97vF6SnwM4KLaRqLIaysbSQ==
X-Received: by 2002:a05:600c:3492:b0:46e:33b2:c8da with SMTP id 5b1f17b1804b1-4711791cadfmr201702685e9.32.1761202512182;
        Wed, 22 Oct 2025 23:55:12 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-475c4342373sm93215405e9.12.2025.10.22.23.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 23:55:11 -0700 (PDT)
Date: Thu, 23 Oct 2025 08:55:09 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Subject: Re: [PATCH] serial: imx: allow CRTSCTS with RTS/CTS GPIOs
Message-ID: <enih2kbbrs3ngzciceekrks6gwclanmfxtzvrfg4fmeihnej5v@boap3ccfuy6o>
References: <20251016113730.245341-1-matthias.schiffer@ew.tq-group.com>
 <cdkpp74ra2ltr7h46psutkwnzyvl4iegcicnhqqj7svm5trltm@w2egfj5nryjm>
 <7d3df04c482e71760ccc941469c99412b608c92b.camel@ew.tq-group.com>
 <lgse44as4k6fpzarztfnfl7wbxq2bfg5k7m7l6xlsyx23pmem4@khal3tytgwjn>
 <1963351b2e50c537418293e6ab9293576a239c98.camel@ew.tq-group.com>
 <d46d07858a3b5cc9134e17509617901e2215122f.camel@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rlgfuerx234j7yce"
Content-Disposition: inline
In-Reply-To: <d46d07858a3b5cc9134e17509617901e2215122f.camel@ew.tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_235515_001161_D6C024D8 
X-CRM114-Status: GOOD (  13.06  )
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


--rlgfuerx234j7yce
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH] serial: imx: allow CRTSCTS with RTS/CTS GPIOs
MIME-Version: 1.0

Hello Matthias,

On Wed, Oct 22, 2025 at 03:36:51PM +0200, Matthias Schiffer wrote:
> As it seems preferable not to introduce the wrong code in the first place, I
> would propose to change the order of patches: The first one would update the
> handling of CTSC and IRTS with CRTSCTS in the absence of have_rtscts (without
> functional change, as CRTSCTS can't be set without have_rtscts), with the final
> patch of the series allowing CRTSCTS with just have_rtsgpio.

Sounds good.

Best regards
Uwe

--rlgfuerx234j7yce
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmj50UsACgkQj4D7WH0S
/k7wtAf/XcUFLM+wtZWzXix6dvhz+7BSQxsfdu/Y4GbDepTozo3tR+L4K4aSn4bZ
3ugNccUP7WI420z0hKS+Hfn10yomj9Ews/SGPoyysgqms0X3gU003eEbsfHAEjIW
4WdAbjFC2UVa2K5C/4TtvTEt7PKXuJDjjN7OKUX8LAS2fyBJnG1Us40nZaDGu5Fs
PuFGIzamgj0MQCFgtroBTuXmVolkOLuRXwHc7ul9EVN6nY0ki+OVIy0ZDZ580fSr
sNGh9lLSragixhuHHgzETqam2QphEW/Qqs/m4fONp0cZluZPcpc3+AtB0lObkIKw
eg7CnOkbCWjVIJXEJOVk57CbH8shCA==
=Nxbu
-----END PGP SIGNATURE-----

--rlgfuerx234j7yce--

