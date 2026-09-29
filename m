Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A17A2CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 09:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yVeHQ0WAriz76dL1hysd44dqzM4X8EtO0BJ7xNzSj4A=; b=pfnGBLDSMwcMH++JY/HgskI/IT
	GX4oqj53qh34hgoMga3sLEfjb0OV73Wqcqch2A7UHd+01SmDGUfUEXNpKNeIc5fwDFVq+xIW+8w7B
	1oich3psRg46N+gU6QzRws1/EGLf3Ls5mMc4+IXYXPpGdqHFutM/gBglFitFFhTcZ7TtygkyrNUja
	CyT06vRAoRwFIABI16Nd69cKfFiYko8vntErd4EO4+N108VcYqHyl3U274wO/5z6IopMY7eQuqgnK
	nbqtqlh1rtxGAtICwovH8D+TgNURgpsP1wfMrRNQT6D40euFTT9LVumZB0TNearraCgSjUjG5fcya
	9vyem0YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTmw-00000002vUX-1crW;
	Tue, 29 Sep 2026 09:06:14 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTmt-00000002vU5-0lzg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 09:06:12 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49ffb83bf7aso23567755e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 02:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790672769; x=1791277569; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yVeHQ0WAriz76dL1hysd44dqzM4X8EtO0BJ7xNzSj4A=;
        b=fL40VWopZgNMWfcmE3M/zJP2CAczaLUIT//KSVxZjKyFi+Y/h0mgrCUJTrlj6RLrwE
         uBUfAivurZak8K5cLqXa67QiRnMVm3Ql5x3ssGb0QKF0KiOa6LHvjrEgjR63hYi0BK2t
         s7b5AWEkVtC8JyBAeF1gDoHcDt22iHVkCxa9erQXrIqIgM8dnKtxcsyXXwt6qvnjPT5U
         dhB71tsKB9n9ILBaJ5U1aLvkEsKf3adnSUJLs37POj5nPe84NA5eyhDk4bpGNHQDo6BG
         VI/ycDK9G+tCWDAKznBb7so/LrPnoi+wty8DRLPuPKIx7jAAy9oLuZw4PiW42vgZuJD0
         bblA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790672769; x=1791277569;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yVeHQ0WAriz76dL1hysd44dqzM4X8EtO0BJ7xNzSj4A=;
        b=FnC09cEVU4C5djb7zkIT1kIRfbJsjOxt3icT+ArVRza2alzQYvi3SRAluXVmfz8Fa9
         Dd38bj/8IJ4Tg6AFCqsF3HpbXI3lyobBLoW2LU0k7k1pwPdzJCI4CgPYXT7EURobo8WK
         F05z9Ma/KO0FvD9yiRfe4XTVTfty90yYCbtub9I1L3l2yt8cP78L64zWadoDJ2e4Bpsf
         BKO1KwoXv+Tcj/IFEMABn3MmX6MdUqBn+AQVhp10B9O/6+/3mBAKQdhytPdLNyTA0ZYY
         Wo17WjLA97S13ybaBUvfBupIuRncXiUEwONt6U2bqsMtPwTczS1Zt1FtXiY4ZS4fty6v
         R2XA==
X-Forwarded-Encrypted: i=1; AKwUvBxuMDGzOaptybW68D38FOT27Ewz5UumzGVlaZlZ0MF+pNqU2WVFDrD2o07gaI3lFMmjWZDRoFn2+IOSsB+CyuBt@lists.infradead.org
X-Gm-Message-State: AFuF++nerdNwRR2XhwBpfpJeBwnC4TIEiwe4slINd42IpsMXK/qzYCrG
	HLW0PeZLfY4TYcTVyDpXHPHhCyBaJhn1ZhC+lKha2W4h0qvAa+6uiot6
X-Gm-Gg: AYBFou0aAWHNoIIqKK4BmwReP88KayYWsWicLlr2F3SbvgiLuz1UqVg2mx0DEMDmVpD
	TImg9msSVwleZip6ZhfafUHwffPn0w28X6pwpTYOA3BZsKSSEimxs/S8B3I6+TGNaNOmbTgJHyK
	jum654Hg6Fkm9u96LKPjZdVJv1OyP8mc093FfVZlhjo/pI3v0ndBWYFBNn2XdNs7QFmOZssFVWb
	2BTPDRZJMjdxTiYCK36YNecMVzAl0I3MQA9F21/W7rz5zYr7J3T16G+69ZQdYPKD/4IZL3M9NKq
	cunV4KvGgu2GOz+rN6qrsT/G6Ims3ri6BQgakZPS7EkW9uWIJNr1FM5POcFbkrcxGOGds84F36j
	lx7cYCRCThvOWdVi1ia9RUB2tpCrBk/JWAYcUaNa7QLqdvsBOQDsOYfKexWoLO7aaxzfUB5Ean6
	LN5OOQFqdYM1atlyTIiNQi9Q0rpHR7/dtDW+UJWTenSBhszPMxjK1+zC2NF+VpabTGH2EGE1XVB
	dofiPlJtMsTrAQIYYncieFwgAP0Yqpb8fQq4eMySRzu6K8LoGMVWzGn0v4r9T3lnOOLYeGFmg/d
	CHDEy66fUX0FCq2CeZBrFgMPmr5P
X-Received: by 2002:a05:600c:314f:b0:49f:e4ca:e09 with SMTP id 5b1f17b1804b1-49fe66ca9e5mr261828235e9.3.1790672768454;
        Tue, 29 Sep 2026 02:06:08 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00d0ea7c0sm65937205e9.11.2026.09.29.02.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:06:07 -0700 (PDT)
Date: Tue, 29 Sep 2026 11:06:05 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Joseph Guo <qijian.guo@nxp.com>, Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>, netdev@vger.kernel.org
Subject: Re: [PATCH v3 01/12] dt-bindings: arm: fsl: Document Variscite
 i.MX6UL boards
Message-ID: <art_faJ7Zx5CaWfW@Lord-Beerus.station>
References: <cover.1790512621.git.stefano.r@variscite.com>
 <a4e262cfb08153c23c80cd3098a684816993f1e9.1790512621.git.stefano.r@variscite.com>
 <20260929-logical-fanatic-quail-2ff20b@quoll>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260929-logical-fanatic-quail-2ff20b@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_020611_239755_A8DAB5A6 
X-CRM114-Status: GOOD (  15.80  )
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

On Tue, Sep 29, 2026 at 10:49:08AM +0200, Krzysztof Kozlowski wrote:
> On Sun, Sep 27, 2026 at 02:46:16PM +0200, Stefano Radaelli wrote:
> >  
> > -      - description: i.MX6UL Variscite VAR-SOM-6UL Boards
> > -        items:
> > -          - const: variscite,mx6ulconcerto
> > -          - const: variscite,var-som-imx6ul
> > -          - const: fsl,imx6ul
> > +      - description: i.MX6UL Variscite VAR-SOM-6UL and DART-6UL Boards
> > +        oneOf:
> 
> Please do not introduce own style.
> 
> > +          - items:
> > +              - enum:
> > +                  - variscite,mx6ulconcerto
> > +                  - variscite,var-som-imx6ul-emmc-sd-card-wm8731-concerto-board
> 
> "board" is redundant
> 

Thank you for the review.
I will keep the existing Concerto binding entries separate, use the
surrounding items/enum style, and drop the redundant -board suffix.

> Also, look at other examples here, like Toradex. The actual variant
> should be the last.
> 

Could you clarify what you mean by “the actual variant should be the last”?
For a board with eMMC, SD card and WM8731 mounted on SOM, would you prefer
variscite,var-som-imx6ul-emmc-sd-card-wm8731-concerto or
variscite,var-som-imx6ul-concerto-emmc-sd-card-wm8731?
I had used the former ordering following examples such as
toradex,colibri-imx6ull-emmc-aster. (som - som variants - carrier)

Thank you!
Best Regards,
Stefano

