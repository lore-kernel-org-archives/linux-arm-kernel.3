Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83139CA5FB1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 13:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4vHh8MmN5f2Z9XIEwQh0PcQ24VZUdkZZXQMWG9k82N0=; b=l8QE4XyVh0mkj0Rs5razBZft/l
	uBOZmvnaGI8mw2ahcUzKETmpkFAzqzBO1Cq1/N8X48JbTIXpFA5bthsIVFSXcT5r2YLY4+lyTK39Y
	9d45vZLUKeu1bC/TkfTyRMEBqeyeVHT06pBHT2o+33Q6eO5hf/RZgMuzsi7bzfdJwzaivodpRE/Mk
	AItjAAVJfcMcoF8OZOc4T8DKcyr3ml7ioYa8c331PTjc8Bwjz4/UE8zEeyPvfSXglLOJjVbLSy2fB
	PzPSU27KmijUhb2v0DUoJBPxBzaoaPK1/QVBA7eVeLWEs0yEvPk7dV307VzTeb7rDrJbaZembAXiH
	oHFo4Lfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBtxL-000000065Cn-1ECU;
	Wed, 30 Sep 2026 13:02:43 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBtxH-000000065Bd-2EBA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 13:02:41 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-3a02551822eso1301266a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 06:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=embeddedlinux.blog; s=google; t=1790773357; x=1791378157; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4vHh8MmN5f2Z9XIEwQh0PcQ24VZUdkZZXQMWG9k82N0=;
        b=z79RP5ZjGZthfwWjMmgFQrz6bIpO8tPz/pvsoTAMb2gDsfpMdpDG9EIbaDM+g2bKAQ
         izyiOux8WxtLNPaq4ule7k/t9KLBMhMiI15fuuNm1H+iA1ofg/Yi7om3SSdkgTm1o5EU
         Ab/eM/AOoA/6qbiAd1Y8Oouan8d5IKwVpsS00jywDLHHN/cbLL2jdsW+Q61546ZAogMg
         g9EdA9WYd1VzKubDGPzvoRARD4qkuPYrw9rFXaUq/DD8FfZGtt/7/w9Ss6FXrAQdY1ci
         qo8uVSithi5wf3lJ7h9hvboEUCuYlEWMcHjk21M7P3L/zgD93v+NusqFpfc+IyQF2m8E
         NAow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790773357; x=1791378157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4vHh8MmN5f2Z9XIEwQh0PcQ24VZUdkZZXQMWG9k82N0=;
        b=yTAsepYQmvPJjasGDe/MlyFNC7j15/7mZCRzP4w/E/MiIAdrgvumapj0vG6Jt87Wzv
         fRMxfWOADwXogQg8XUTQE2XEmjtJouWMr0MeU4K525l+uCNdig05gbcLOCkYU6ssp5G7
         yYh5bUzUogpgUc0rni4Uz7apnLO2fri+0YnJWNA2yfyqQf3YIDM1GxdoXwtzwJ6IBPoN
         I4frLcgvnkI3kEauHbeAlgXtkrhBu5dk9Tko7Zy2NzIV/c6mnzmahs8D1OtPbYOK0/Uv
         0DFozVR42ImXn+UuO7bj+XlQPrKG3Ce/zigiVFhhuyvEQhJd/oIF/4qrqbfWL3zI8XyK
         9B1Q==
X-Forwarded-Encrypted: i=1; AKwUvBxakvu4QSgVOpPrSRWc9VG1nGyVkcbBijsE1dmyAo/E9F4rSOv2YoSd4p8vmsj4WUUD6L9LXwGdhZ+6AGn/f0Vv@lists.infradead.org
X-Gm-Message-State: AFq9FYL0uHNJLepEpLvIYc0//qxQl2SPqUtrBdepo3tUegeidZ+y1bvq
	cNUuvt2fzGlppGyx6KMv0kG3BzN+lOIHXVNJAMjpxz76QTah4WxwhmdyQpEAVZXaXn/u
X-Gm-Gg: AYBFou3dxy38d/GikqDYugySxHak5RDUYh2KhizCG9U+qThQJuojFR5goK1tq9cI9TW
	eaeZv6loVcBK2zPq9ZIrdEvg78DccZ8hZpM8Z+U6g5fUs2zjGsj6Ho0xrsidZgq1QFzmzjwYFW7
	EiGxxWUNsgdvZWpnL5da1z+w6LbXaeq+2WNJZylAh8CdDMg+qFY2/yQwIeuEm6Cvm4L6JPPZ3ro
	VOCB9m2HCQlDemCoMqWZ4TmTKd9RdGKYN81ri4EoYYuT2xcK7Nd8Rllza6qN9AyhaXPst7kzxUR
	f3X0kxM6AxbZCOukSv9XhN6XFHh0U7iiLWHzdmZW0r1tE32UIoXLnbacMc5YQpXab00f+52Qisk
	UrnlkHwFYrXwNhvaEACOQBJC+lq41ulxxJOAejVdbTDw6b5ylwXPQwFkbxz9aH59XuyWQTZBRoy
	AhIj3oTomAMcp/qtRIodgO+ZLamzjan1UOzGlZ3QROCe8yMHZViI0hEHUDMhtajwPjPWao2XZQV
	B10l+8N
X-Received: by 2002:a17:90b:5343:b0:3a0:25f0:d89f with SMTP id 98e67ed59e1d1-3a4d18e3b8dmr775583a91.54.1790773356655;
        Wed, 30 Sep 2026 06:02:36 -0700 (PDT)
Received: from ltu.. ([171.245.4.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7dab424e8sm853583a12.32.2026.09.30.06.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 06:02:34 -0700 (PDT)
From: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
To: Wilken Gottwalt <wilken.gottwalt@posteo.net>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andre Przywara <andre.przywara@arm.com>,
	Bastian Germann <bage@debian.org>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] riscv: dts: allwinner: d1-t113: Add the hardware spinlock
Date: Wed, 30 Sep 2026 20:02:21 +0700
Message-Id: <20260930130221.129529-1-tien.nguyenminh@embeddedlinux.blog>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260927132707.5f484946@posteo.net>
References: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog> <20260927025626.69614-4-tien.nguyenminh@embeddedlinux.blog> <20260927132707.5f484946@posteo.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_060239_577226_6807E719 
X-CRM114-Status: GOOD (  16.02  )
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

Hi Wilken,

> Wouldn't it make more sense to add the "allwinner,sun20i-d1-hwspinlock" line to
> the driver in the sun6i_hwspinlock_ids struct, drop
> "allwinner,sun6i-a31-hwspinlock" here in the D1 device tree and update the yaml
> file accordingly?

Thanks for looking at it. Bjorn hasn't replied yet, so I looked a bit
more at the naming. I'd like to keep the A31 fallback: it's the usual
pattern, other blocks in this dtsi do the same (timer, I2S, LED
controller), and Conor already acked the binding in 2/3. If Bjorn
prefers a driver entry instead, I'm fine to change it.

> Oh, and I may be able to test it against the D1, I own a Sipeed Nezha.

That would be great. You don't need FreeRTOS for it: I tested with a
small Linux module that takes each lock and checks the status
register. I can clean it up for the single-core D1 and send it.

Thanks,
Tien

