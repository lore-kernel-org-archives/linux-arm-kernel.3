Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A47D711A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 14:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V5tRs5SDxCA6uVSrjq3npJTWFM0ZTaUuFsUk1yMWVPU=; b=dtM+QYNYyTnSQ5eK/8Ctta+qX5
	nFCcNBdzIN9ePN23bWVkSXjobbccWUevRIAr2LFCkKC7SPDKsgtyHMnmYoonmKShSFqwpWw8Qqjwl
	pmqli7/9WmOlYvYZO53Q3ZTyyVuNKn+/V9Pg3K90Bdf2GlwiPZMe80cJGIeEGVIWZRlnYWm/aHpbZ
	vGsW2rAZQLwJ2vrc2HiA6zHZHb4jwXVB1AxDbWsOPMh+0BvOkKxp0piiuPM/TBufpZAqRK9znCuPD
	hFKc3kegRpnfO5um1tAIUVIFyYD3uOHWgV7mXh5jrw76Gp97ADQUleTtVQgHoCdM+SvJGSu4NxJ3V
	c9/5RJjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDmAY-0000000FcYQ-0eou;
	Wed, 20 Nov 2024 14:59:02 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDm9b-0000000FcMu-3B8T
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 14:58:04 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2ea6f821decso1907418a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Nov 2024 06:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732114683; x=1732719483; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V5tRs5SDxCA6uVSrjq3npJTWFM0ZTaUuFsUk1yMWVPU=;
        b=h7sBy7KvWBiRaojkqOMWj7aksAC37pz8KiXwqh9XtjcoVZMqfQ0Lj1OPn07VGVJ4Ic
         ldYPAJd2GNMMDokmpJEsY4ruzcuCY+nWytpqkpQ2sA60Yv4ZjmqZBlvfTab4KcbsxJhn
         NSTMIm/mPA2sJuKZcpZ9d0vbUt+3iSMOcHnFd8qVbmX3JhtWj0Tb8QgCZDrpo+p0vk08
         9UK1n7JDi26PVLnejy5XeGDsnfbTnN8FF6NoLOhnpL/G0X564iRbc6oj05OoHqW2Q/X/
         nPq0YztdI662ILFs1vlwtwUBljnwrs8MUxT5Tr5OqtyVWJyvNnvoTRi2pFX/00RNuFzD
         GDCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732114683; x=1732719483;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V5tRs5SDxCA6uVSrjq3npJTWFM0ZTaUuFsUk1yMWVPU=;
        b=lml3Ue738i49vjKMREP1Lm/yYB83P5tM+RIzA/KC5Xsa3ypcBBClhSHfATwvC/6/EA
         +irqoHnexMpRphkkDwmbSCSkjv5RhKM4U3D+J3Oj7X3opOy3XePZ3kpQ6z0mhYcgKy0/
         OHHJHZxnyG0s7rawT+iVo6WZ/tz9GvJLuxrmh7fXUUfIEiQDIlRo37h+IsvBS2MzNung
         kMkAq8pjysRjQ6Brawimini75t89e4CWXZciZbtCa5UBpJ964IN3q7MnZyIzmzizVODs
         vG9kAt/dcGvvc+CLZRmWe/lJN8tgvZnGoGMwew7hINYbkrXE7EiZ0HMamw1ejEB36hpn
         v1VA==
X-Forwarded-Encrypted: i=1; AJvYcCUmw1U9ImujqoD/d00PENmUxRN7OE/nnsn9TeEaDM4DuMUEA1kG7nWNB/iqoG5KppFgNq32PZI1ZDP4aJs19K+E@lists.infradead.org
X-Gm-Message-State: AOJu0YxJrQDCe+sdwGG7GZMoDMq2+4PeHZW6coYxnkbOLaFmnt5c3RMm
	vt8QT2P+KWkhphXnL3/Zkq7YuxDKvdQ35Y67Kk2OoISg1yOrPPmHovxSzw==
X-Google-Smtp-Source: AGHT+IFV7iRAEgSa8oH8+7AoTvx0uOegkgCNlN1vBcrbCPN/pmNqJi3DO6BRx8wXmhFSKq6G9fmCIQ==
X-Received: by 2002:a17:90b:4d0a:b0:2ea:94a1:f653 with SMTP id 98e67ed59e1d1-2eaca7ddfd1mr3149652a91.31.1732114682861;
        Wed, 20 Nov 2024 06:58:02 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ead02ea238sm1404275a91.10.2024.11.20.06.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 06:58:02 -0800 (PST)
Date: Wed, 20 Nov 2024 06:58:01 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: Lars Povlsen <lars.povlsen@microchip.com>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	UNGLinuxDriver@microchip.com, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH] net: microchip: vcap: Add typegroup table
 terminators in kunit tests
Message-ID: <24a5975e-a022-4bf4-a2ec-76012f977806@roeck-us.net>
References: <20241119213202.2884639-1-linux@roeck-us.net>
 <20241120105202.cvmhyfzvaz6bdkfd@DEN-DL-M70577>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241120105202.cvmhyfzvaz6bdkfd@DEN-DL-M70577>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_065803_794356_17642B3F 
X-CRM114-Status: GOOD (  16.69  )
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

On Wed, Nov 20, 2024 at 10:52:02AM +0000, Daniel Machon wrote:
> Hi Guenter,
> 
> > Comments in the code state that "A typegroup table ends with an all-zero
> > terminator". Add the missing terminators.
> > 
> > Some of the typegroups did have a terminator of ".offset = 0, .width = 0,
> > .value = 0,". Replace those terminators with "{ }" (no trailing ',') for
> > consistency and to excplicitly state "this is a terminator".
> > 
> > Fixes: 67d637516fa9 ("net: microchip: sparx5: Adding KUNIT test for the VCAP API")
> > Cc: Steen Hegelund <steen.hegelund@microchip.com>
> > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> > ---
> > resend: forgot to copy netdev@.
> 
> You are missing the target tree in the subject - in this case it should be
> 'net'

Sorry, I seem to be missing something. The subject starts with
"net: microchip: vcap: Add ...". How should it look like instead ?

Thanks,
Guenter

