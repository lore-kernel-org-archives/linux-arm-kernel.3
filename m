Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF9BFE7716E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 19:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MY4w8h/Y2faTte8A8zuwQmkux3tQ9Zf0xj0qV+I4U4Q=; b=bbt1KFQDB2jCRT6URwfcfFMd4m
	qvjeLhNA/ROUOdEzbaSD/3AN3ZoCFZo7oBpf74WgautDI/iBz2/EBD3tT9fc/2sAVYHm7JzisRUw8
	nB/RJZPte89tc/QgqYzXDW9xL1q6UavLfYr+DEKN8FQLIy0J1ijnRDkQIYJjyLlFK8A6+3BidOFjV
	/5Pw4UhJT6TJb8th7mt6UDXM0WWdQJxyiNl1puAcRLvT/VwhilhAbdXkJEISb+auTEE0PJwh4hLxG
	HhVBCcC0zmR1s/YYpW5qO8J2BKsFPZIdGKHiqlZP1OISgq2thhQQ2O+ECjXs2w7Ks33EdaU51dAhM
	G6zRpZDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJHLn-0000000HBnm-3m03;
	Thu, 05 Dec 2024 19:17:23 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJHKm-0000000HBhH-0Xh2;
	Thu, 05 Dec 2024 19:16:21 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-434a7ee3d60so14774765e9.1;
        Thu, 05 Dec 2024 11:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733426178; x=1734030978; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MY4w8h/Y2faTte8A8zuwQmkux3tQ9Zf0xj0qV+I4U4Q=;
        b=I9STXGcrm1sZ/pduxhBBZDsXGFrE0wF/KKZ0Xe3jm9e3QDADBckett1i7qrmGs0DvY
         WmyZ2QmjZfS9O497N4Tepz7j96WG/sgM4yZ1m7E3e8XwB2O7EwpQGQnlvhXtd+kxh62D
         JLgiqaNVyZOf3M4fWJ1H8LtpBt7oGnvpPy288RVBT1EAQACMSsXzwa/nHEZ78AK7QXyt
         xIGRgT9tT3R9abJ9XHhfI0kkubOYQ7qtvOXBdGVCcopPQildfTGV/LJHJFnduXxlXbEy
         dHxBxFvzueQNSzy0ZUhSKpYiZEUNsIB69a46jFK5dgpNI+nz1rHt5+/i/W9ducJUEsAl
         6bWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733426178; x=1734030978;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MY4w8h/Y2faTte8A8zuwQmkux3tQ9Zf0xj0qV+I4U4Q=;
        b=QD2r4agdAZ6xf9hxpW9c8uyXGXqhHgn1FTKHf14nCV+cEdPEggxRLa8us9asc0ffHZ
         QGwjlU5cQ7RAdM4eKaUX3W3AvHZSuy+qNUp/ovBXIWzltnyk55NwToIEreLae34eAjnB
         zktlDAg2V8twe7nK1UTbfQ0+9otYq12CHNaXfWX1BeD9A/kWL3Hi1wnrWwoJsXgSQPmP
         l2TpbKFgNFYi1eSoKMsF0lJuWovOxsMbBXoAUQJr/GfQqXbyvzjTaXtqfYnn5iJ/uLhZ
         /E3nhPba1SHLE0R6+opmgqzPxVDw7l/Y+j1JzcfgGVLmoV/7x9kfKolXvA9g2aHq2Gyf
         KlyA==
X-Forwarded-Encrypted: i=1; AJvYcCWh9D03NOp5BCwFRr38tvpv0AJdKSlyHlRsAjElu/i9nUmdVjEKZmFX0hhemCjHN85jyinb3cpxeIYhGcB8uYs=@lists.infradead.org, AJvYcCXODqxBO3gSbIws/7TNXjeufUrUzqkS7Op5MOetHpmJkeR0Lo7X+/YoASlKeFzJx+iZhzEfHBuSRAc397G2Qxfh@lists.infradead.org
X-Gm-Message-State: AOJu0YwCZIyqXkpBsdpSYF3rUcrkM2QQpWJSw+veBJ8+U67orY+tKRZZ
	M5djTZpFNCt3LG75PWoWQcdky2LdGYPxgqdTf/1590IKy2m0RaJC
X-Gm-Gg: ASbGncv9BtVCnudAfEJl3ca3EEwO7cXPRBtlq/xqMI4BKt33qHA2e/jRqE9xyTcR8PI
	hV8/VElE2Avqb3p4Jp6jKf53aaokKuPUWOHrG2kmIcMRLL4FimOGiBJyCKkNg7Y4uHhymgteboc
	3RhDpgJF1Wu4GwQ+MtcHE5vcfXc27rae4Z9NhoA4Sevb+31HZOccUZ7qJ5aB5UFlbLvxEbVDz4X
	CtlMss2tXKGXggSmj/2GFxTKufu1yMzhwYvBCORAaTvt8hRgdpwp24ilGLB+ptfTiYjRz5I2dlz
	ATW8WQ==
X-Google-Smtp-Source: AGHT+IHZRbJn+9HtrGJ38A8jyPTzo+TDn7EX7QFEByqYqphbe67U5+K0SKR8aakCPuxnrCyTXLoJ7g==
X-Received: by 2002:a5d:6c66:0:b0:385:e45b:92a2 with SMTP id ffacd0b85a97d-3861bb5c4eamr3657331f8f.7.1733426178337;
        Thu, 05 Dec 2024 11:16:18 -0800 (PST)
Received: from Ansuel-XPS. (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d5280120sm68799815e9.20.2024.12.05.11.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 11:16:17 -0800 (PST)
Message-ID: <6751fc01.7b0a0220.1f425b.5416@mx.google.com>
X-Google-Original-Message-ID: <Z1H7_Z7UsSZ5GEhY@Ansuel-XPS.>
Date: Thu, 5 Dec 2024 20:16:13 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [net-next PATCH v9 3/4] net: dsa: Add Airoha AN8855 5-Port
 Gigabit DSA Switch driver
References: <20241205145142.29278-1-ansuelsmth@gmail.com>
 <20241205145142.29278-4-ansuelsmth@gmail.com>
 <20241205170629.ww7qcvgbqdf5ipcj@skbuf>
 <6751e22d.050a0220.3435c6.57de@mx.google.com>
 <20241205183403.zla5syfzj3yrinwj@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205183403.zla5syfzj3yrinwj@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_111620_170356_5DA738DF 
X-CRM114-Status: GOOD (  41.59  )
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

On Thu, Dec 05, 2024 at 08:34:03PM +0200, Vladimir Oltean wrote:
> On Thu, Dec 05, 2024 at 06:26:01PM +0100, Christian Marangi wrote:
> > Concept looks handy, ideally I can just assign one ID for each port
> > like:
> > port 1 -> FIB 1
> > port 2 -> FIB 1
> > port 3 -> FIB 2
> > 
> > Question:
> > Ports of the same bridge should have the same FIB?
> 
> The answer, as well as many other explanations, is under the "Address
> databases" section of Documentation/networking/dsa/dsa.rst. Please read
> it through before starting to implement anything.
>

Ok sorry, will read.

> > What I need to check is how the switch handle this for learning. Does
> > the switch correctly create FDB entry with the right FIB?
> 
> You're asking me how an8855 behaves? I have no idea, I never interacted
> with it :-|
> 

Noo it wasn't a question for you, it was really to describe a problem
that might be present if the switch doesn't account for that and that I
need to check.

> The idea as far as the DSA API is concerned would be to learn addresses
> in the bridge database (DSA_DB_BRIDGE) that the user port is configured
> for, and not learn any addresses in the port-private database (DSA_DB_PORT).
> 
> > If that's not the case then I think assisted_learning is needed and HW
> > Learn can't be used?
> 
> ds->assisted_learning_on_cpu_port applies, as suggested by its name,
> only on the CPU port. On user ports, address learning should work normally.
> 
> As you will find in the documentation, the CPU port is not like a user
> port, in the sense that it is not configured to service a single address
> database, but all of them. So, source learning on the CPU port will not
> work unless the switch knows which address database should each packet
> be associated with.

Ok so in such case, learning on CPU needs to be disabled and assisted
learning enabled.

> 
> In principle, one way could be to pass, during tagger xmit, the database ID,
> so that the switch knows that it must learn the MAC SA of this packet in
> this FID. I don't have the full image of the Mediatek DSA tag format,
> but if an8855 is anything like mt7530, this option isn't available.
> Thus, like mt7530, it needs to set ds->assisted_learning_on_cpu_port, so
> that software will call port_fdb_add() on the CPU port with the correct
> dsa_db (for the right bridge) as argument. But I don't think that is
> going to pose any sort of issue.
> 

In theory I might have found just this option. Tagger documentation is
totally missing but there are some c and header API that define some
interesting option of the tagger.

It seems the tagger can work in 3 way:
- portmap (what we currently use)
- portid 
- lookup result

Now the last 2 mode seems very interesting.
The naming is very confusing but maybe with portid they refer to the
FIB. I need to check this. If that's the case then it's exactly what we
need. They set an int so it's definetly an ID.

I assume lookup result is to only use FDB to decide where the packet
should go. In this mode no ID or port are defined.

So in short lots of tests to do, maybe this can be handled in the
tagger.

> > (I still need to check if I can assign a default FIB for a port...
> > Currently the STP register are 2 bit for each FIB id, so 16 different
> > FIB are possible)
> > 
> > Also do we have a script for selft tests? I remember there was one back
> > in the days for fdb isolation?
> 
> I don't remember right now, I don't think we do. I'll try to come up
> with something in the following days.

Yes that would be handy.

-- 
	Ansuel

