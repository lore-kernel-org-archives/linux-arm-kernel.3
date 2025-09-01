Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB53CA1007
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 00:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zJLLBPl4VNz9yAYMPwZYHGVjZjeqC7uH2RLSi9W+zqQ=; b=FOExNz+Lz4K+1X+7B7iMReTRr6
	kXHlDSUHvxolDpkPxBWbXOhIjgEeKyI9B/RRi+8aEPEnrdXIfZV6J7dHK0Fm1xiiZOJ+MHxN1beTX
	Reoo525yEOj2NwXX7XTMG/kXGYALucejoMEnr/B6BoC4UBd/9FagTWyPivOEjFow6SkTJyya4sIt5
	c2wThJHXPZw+etEx+Hs+WuY29FX3srvNMvlAs+kbVLbJ0wBt5CrG7pdWorTQ75s8LCYqwOxH4H3Zc
	TXSk1UQoOmmbcIkghi/EArBB4jB6gKfTdmTaDxGmZHadx3cmP35QW8qwI0bEUJ2QRfwPWQuIqTgh9
	xTKIkcgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utFH5-0000000EZkH-0g28;
	Tue, 02 Sep 2025 00:53:27 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utBzu-0000000DxZ4-0fhr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 21:23:31 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-72290cfcf5eso10689507b3.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 14:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756761809; x=1757366609; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zJLLBPl4VNz9yAYMPwZYHGVjZjeqC7uH2RLSi9W+zqQ=;
        b=MynmSkTP2x8S7Ko6xwN2Li6KrzifIMU/KuQTWRgP6PNVAAPCkxfdDBbjXMzDfVBxTf
         44lGxEHo5sxIJnQeXnAhbTUU6VZmDIT9BE5UasVHZxV5FxMPwoWp7Plat0QavYR1MiNh
         lkH6DoRI6AQTYID4U+R0f7Q/+Y4Dtbkie6r6cWGmU8VBWkxE+sHlXMGqIKmsUP3uCvId
         Xk+LYtDxkjdJtEOg/lxWSbIJimQKgC4LQI0nqxc+3bGtgRSFIZ4DjEkkSbVSHtLHnQ60
         tzr7cP0P2uh9/VCi++o+rcgLxNZoeESZHVpv8x1HaaCZJb8l8SPxeGZCnxexWKxkl4Dq
         RBnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756761809; x=1757366609;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zJLLBPl4VNz9yAYMPwZYHGVjZjeqC7uH2RLSi9W+zqQ=;
        b=gohqQAvrkcsj0ZtY8QKGT/P5BlMl1ZRtuivatAqZXdGyDeGH0+7IdNquVHN0DzSjul
         uQmIN6Fg6S5E0RNHpMzyEbhhYbSn2u8NOTR/rWCKT7Et0dPdinlp8S6Ns3AaL3N79Dt/
         sPaGVg2VsnPEfv45iiGHeVLo/C9UlnD4imDePAEpoLiCDqriktvvTNpapP4FDVyP4DPK
         Pi0bXXXsTHcDU6JDd0VKrByagT7kSELJYQK2gLx4XILqVk8lfL7tsKNcEi3hTEkAw0lz
         /gDQiYV1DrUG3YAVZncwevLqXuKv5C52CcXfK5gR+75YhftLMcMWrq0FPX5qA6l618+q
         qtTA==
X-Forwarded-Encrypted: i=1; AJvYcCURaHnJPoIxEDPywW05wvROqMVHPQ2SP9mP1lD/2WCTBSOcoy1ID6V+l7kIp41KvQUXAotcvXUAkrafUyaTx0/K@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3xS39mFaWrC8Q6qrYCSud931mlgdpSks5He7oHA8yTfD5P8nZ
	ILyc4rHZF31+A8GHdz4Hdr43M5HZiAJTYEl2HnGrv/c4vcslTnf3uUap82O9jVIvBly32/5kxYu
	aWa3+usGuKVVpxnjdFWfkq2lWu+7lMdY=
X-Gm-Gg: ASbGncsj9gIQgdni/d2/4ZKjrg+C/6rOHyYrnHsPcWv/+2s4TV6py8mpeVPgnA5mSCO
	J7Wf658wC48rNovCsLQjg4fcJwDQ6T5ygrKfGVSfjXemPnBW58reZokwuV+JlSh8UV49hbSFb2o
	/4qPDij26dLhlR/G6DErt5Q+Uo0k97Lk3WRNlptM2wiTSbw13rLmkFmCZ54zAOoz/lwfTnfbN+J
	DIlZsZ4DLT7BhjTQ4RSK/Mfkm8mA4z8GSRwTxBnmgAixKxMkpOhqHlSa7IikeCpq5XJ7NdvtZ9o
	SAek
X-Google-Smtp-Source: AGHT+IGE3rFBxr6OKIOB2HLWAalK6Kt/+EH2b8jbuWp5gvaPnEycszMCV8RSO4eFfu21sPRJVd0deskvi9VDjDcxTjA=
X-Received: by 2002:a05:690c:f86:b0:71b:fa04:d16e with SMTP id
 00721157ae682-7227639926fmr122112687b3.16.1756761808624; Mon, 01 Sep 2025
 14:23:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250830214217.74801-1-rosenp@gmail.com> <20250901152352.GG15473@horms.kernel.org>
In-Reply-To: <20250901152352.GG15473@horms.kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 1 Sep 2025 14:23:17 -0700
X-Gm-Features: Ac12FXwOFef9oCXnPcyLPO_JM9qTHhy_twnZqkHsAra85qD1YiOIWo0geE_sIcU
Message-ID: <CAKxU2N__+EEAryXsYr0f1i6B4q4fBmJTVVFYROtg0LZxjMe8fw@mail.gmail.com>
Subject: Re: [PATCH] net: thunder_bgx: use OF loop instead of fwnode
To: Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, Sunil Goutham <sgoutham@marvell.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	"moderated list:ARM/CAVIUM THUNDER NETWORK DRIVER" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_142330_200794_76726D02 
X-CRM114-Status: GOOD (  23.16  )
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

On Mon, Sep 1, 2025 at 8:23=E2=80=AFAM Simon Horman <horms@kernel.org> wrot=
e:
>
> On Sat, Aug 30, 2025 at 02:42:17PM -0700, Rosen Penev wrote:
> > The loop ends up converting fwnode to device_node anyway.
> >
> > While at it, handle return value of of_get_mac_address in case of NVMEM=
.
>
> I think that this part should be a separate patch.
> Possibly targeted at net with a Fixes tag.
I'll split up.
>
> >
> > Simplify while loop iteration.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
>
> ...
>
> > @@ -1514,14 +1510,13 @@ static int bgx_init_of_phy(struct bgx *bgx)
> >       /* We are bailing out, try not to leak device reference counts
> >        * for phy devices we may have already found.
> >        */
> > -     while (lmac) {
> > +     while (lmac--) {
> >               if (bgx->lmac[lmac].phydev) {
> >                       put_device(&bgx->lmac[lmac].phydev->mdio.dev);
> >                       bgx->lmac[lmac].phydev =3D NULL;
> >               }
> > -             lmac--;
> >       }
>
> The update to this look looks correct to me, even without the rest of
> the patch separate. If so, I'm wondering if it should also be a separate
> patch. Again, possibly for net with a Fixes tag.
Maybe not. This can get called while lmac is 0, which is a u8. lmac--
like this will underflow. I'll send it as a separate patch from the
upcoming series targeted at next.
>
> > -     of_node_put(node);
> > +     of_node_put(child);
> >       return -EPROBE_DEFER;
> >  }
>
> ...

