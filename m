Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE21DCA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 10:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gRrOX+lH79lbk3CMWLiPCWajedhgVBao1TTFuyFRYcw=; b=c5mnbDWBKbaatzE8bOFbVG1RJo
	XNjxHZVVIIwbKPtf8kp4kU/BMXviSsG+N8B4O3Sefm318NjS+6xnsfblSmtYqw+Ckr89NE8SKxQ1M
	dgD09P8Yn+tMSelFbfBxYyJUf1cPZPF/TfJzUGPiAAqyDDJHi6VTl7qnT9zwcWpBo/DLc16JAM4We
	AmocJKhr7yk2SpZaNuofd1YRWC7Sf76AWUSFemvIXVPW7oSYmSDmhjzV9N20OuPTGZSxCHw0VrU1X
	p1O1yfhWHYKscnP9RANVAAZVMzYO39/bv4B7AWWM/vXfeRENW4R6RYiq7TZKkZ0fFlnhSoS3vlXOu
	Cyv/OqNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyp18-0000000AtaM-2IzR;
	Wed, 17 Sep 2025 10:04:02 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyp15-0000000AtZJ-3MCK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 10:04:01 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-45de185c04aso7463195e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 03:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758103438; x=1758708238; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gRrOX+lH79lbk3CMWLiPCWajedhgVBao1TTFuyFRYcw=;
        b=Tunk/izto7i6n3i6nHWzVPdrn8m/FDR7+aNCl34OO2+Bts22P7iakbvpvFOyKkKCkW
         zYjO7sdmElaXUtJJ1McjxX2T7cZXE/MGJIRKNpeatvTv5T3GyNDm/sSXl7M8nOpQ8HgY
         K1yac+FCxYbwxKYYnFFDAIFXD73i+jHKZg3JF4qgmerbctggRBTfkJRRwPTOiPFHvN82
         u140wkqNk0GbzQLe/RO5cidi+XzsxsQLxZkSVlZk7wgbVe0dap5F/2gR8NIJM7bkKNrZ
         DmdFGw7/NqEYbcmiimZjMK9y+eNgIxj+7BjXuXSlHk5WEngiHUTa9RDsOttbwcKkqknT
         8soA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758103438; x=1758708238;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gRrOX+lH79lbk3CMWLiPCWajedhgVBao1TTFuyFRYcw=;
        b=KnNNzpQrLF7B+8FS2kwrIJA3rrULs/Ba+aM2eWlTC+oAvJoVopUZN/ZfjWTqs06Cr5
         FoMcoz6X9I0RzQx2m8joD0NVs+TE00m5EnAbi1CCUIjXmbsCUccgD3uGPD/hPbFVYQdt
         gu6m9S2OkqkZX4EaJkBOjjkt8/LoVg6xc16QikCmBDw4l8D7JF62MVtwmWXUb7J/6EVC
         uIDbSOtsUQC40ehLgFZ3dtuIKj/xtYgODD44tqTy8KGJi8HoSOG6+elBR9cmxiT0HWro
         gFKZdH3Wc9U0mc9tED4o7TGVPub0ahDc8TRqKBRy3Fz278BwAETFasvlfK0a8KVM4eCw
         fpMg==
X-Forwarded-Encrypted: i=1; AJvYcCUJ4iR8iStmAxv58/t2zDGxg17XN8PO/vlKX1VDZIGF04M+cE6djWXg1DwP6LQS+XtTn/UY0ktX6Yb4poVJm01U@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/aTr0yGfEYvRB5NcPmzlUYj3smMopo2MD8PBMHBkyBkwH6hhR
	6UUdNLhbD8Jc8k7IbAqmD7jIE/8vkZ4t/aF5uvUaNi/+NHdOzsWQbviG
X-Gm-Gg: ASbGncu2E7Ba5y1zboJflOvp1loAklkJmumclts2Z9PtIfryt83orsGEeI4yPLLpoxC
	j0eInifyzhtU7thRAP00ro3TUdMC7YaoFEULqB/9457ycH1KhG3FarWrUO/iBmAlzy0rUwvpiuA
	xt7cb11iJOQLqjTrsUmMXUMRCF9V6wLDKdUz0tyCauJDWApEkPzB5dULibPhvobDpQOeSKkitmh
	kO89w6ZFloDZCyUAHWuQB/TS4gKfzAry2Pkbzfo37d7qUrY2lyLyu+y+8ys/quHgPawL4OEVp8y
	g/AJUva4ihAGq55OouLmdrajG8QzwtpNk051TZvuyIqVTe7RviZRPAJtMLM3CNpDC4VNyI11P24
	6UoDkiax47YcGndk=
X-Google-Smtp-Source: AGHT+IHLOG5YdNiWrI2g4iNSNygtK8lUMOKb4aBkIX2ORgpQKWdmRgP7R0dl64oEM0ngNwVEe1oh8Q==
X-Received: by 2002:a05:600c:648a:b0:45f:27f4:47bc with SMTP id 5b1f17b1804b1-462074c52f0mr6761615e9.7.1758103437696;
        Wed, 17 Sep 2025 03:03:57 -0700 (PDT)
Received: from skbuf ([2a02:2f04:d005:3b00:8bcc:b603:fee7:a273])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46139e87614sm31032865e9.23.2025.09.17.03.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 03:03:57 -0700 (PDT)
Date: Wed, 17 Sep 2025 13:03:53 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [net-next PATCH v18 4/8] net: dsa: tag_mtk: add Airoha variant
 usage of this TAG
Message-ID: <20250917100353.dbjeh5eibkqdpz75@skbuf>
References: <20250915104545.1742-1-ansuelsmth@gmail.com>
 <20250915104545.1742-1-ansuelsmth@gmail.com>
 <20250915104545.1742-5-ansuelsmth@gmail.com>
 <20250915104545.1742-5-ansuelsmth@gmail.com>
 <20250917093541.laeswsgzunu3avzp@skbuf>
 <68ca827c.050a0220.11f9b4.a3f0@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68ca827c.050a0220.11f9b4.a3f0@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_030359_851428_07C324EF 
X-CRM114-Status: GOOD (  15.47  )
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

On Wed, Sep 17, 2025 at 11:42:13AM +0200, Christian Marangi wrote:
> On Wed, Sep 17, 2025 at 12:35:41PM +0300, Vladimir Oltean wrote:
> > Unless the few tens of bytes saved matter on OpenWRT, I think this is
> > overkill (and you went too far with my previous suggestion).
> > Two Kconfig options are unnecessary from a maintainance point of view
> > (and config NET_DSA_AN8855 isn't even selecting the correct one!).
> > I suggest you register both tag drivers as part of CONFIG_NET_DSA_TAG_MTK,
> > at least until the differences increase to justify a new option.
> >
> 
> Ok, was following the pattern done by the other. Will drop the
> additional kconfig.

tag_ocelot.c is another example which registers 2 taggers under the same
Kconfig option.

