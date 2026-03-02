Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 337C9D58E48
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 17:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QaijC/p2L1n1TZ0ZHl3fOCy3J+kOaUlNmbkDRGgocyM=; b=QpoqkSUN+hZCqtR9UeVBcsVG9y
	+RTqtNhzjGSAdoU9kvf1kxxrzZn4n6yTWfDF9YAp6+b8ic7nba7it5YQEcPyiYEbyWvAg62hx3LJc
	naieSS3Gs4Yb5cLVqJNpi/o8Sg0dN0uZz5OLtyDUd9AEByZmWq1DDjI6oywpciU1IUabM4XbIWHGh
	FClWxTRLOlT72unSk+zYQdPuUx7xUPlDAL1Jz5lP8yg4Tn/lK73DlLHfuJGya3u9eRWdQp2P/lRZU
	8QY/4yxnw4CX4W73J0aSpEhijSaMwnjeozK/vgLJCIz3I9dwxPKGH8+t6hT2kfyAcMb10eUDd6p2V
	g+p5yz2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx6ex-0000000DYVe-1lXT;
	Mon, 02 Mar 2026 17:02:19 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx6eu-0000000DYUr-2lj0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 17:02:17 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-439b78b638eso1222700f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 09:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772470934; x=1773075734; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QaijC/p2L1n1TZ0ZHl3fOCy3J+kOaUlNmbkDRGgocyM=;
        b=bP8+EaVTThbRrDd0Xm0nFv1ra2z8aSgJEB2mOIUwklY7G/Ua+yjUx0UIBU2upi9ztB
         wXXnicoiSPXr/VjpkoaLk6SwWmEFjQMdfjqDyRwxBHoE5KBJYI1FpUEygMVShWnNL8Sn
         cvTZIG1V7FBCziWNqoFihcmsAwtk9eEF37NhSJ6J2Bp3MPXgOSsfWAtaKqDTAm9Y2kWC
         DpF/sBr1LQxOHR+7QDP+8LQWCkq6G1FkxkJGBYE72HFg+iXxEVzj2eiNZiCVHpFLhjeX
         /bJsggG1eLQHlegzVIWzztWCaTywnI2RAXsEEfzvdbaxqxxb3H9koAQiFU4cmD9CvWHM
         SrkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772470934; x=1773075734;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QaijC/p2L1n1TZ0ZHl3fOCy3J+kOaUlNmbkDRGgocyM=;
        b=LmJe+HbPJES5vIeibyWS0yaUZndPf9Fhgy/I3FoUZWURg2eZqsXeOVO/XJ7Sl5dGFA
         oxcpT2ZcPqT/3yDy6shJBSOSP64d+4jldmlpwKYjWddYXeFZ49XjO+a6QdiKbJFR1whw
         Lk4Xfzh8okDvKvle43/KxarRYsvl2MsNHeo4ubU0KWyTgNH5P9RSNqjYrciT63iLyYAz
         P+OH50JKPjbNL67T1GuXcRn/KEcw7Q7L0Nb3WuXP/xRo3yp9AxY8mpegN35v0NH5sLo0
         WhqTxZ0mZj0BRqN3bYMXmdK0u0AXPpaJikqEShtp9VJhnunMCuTNfiliI2EUmpVHS3Kw
         cLVA==
X-Forwarded-Encrypted: i=1; AJvYcCWMJw4CX0j3jz6yCefZcyEQHKMTR1ZcKp95NY3pz4pYKN+pkev6wMaxw6mEHF3whfo1sI8FURutXWSq/5DeOF0j@lists.infradead.org
X-Gm-Message-State: AOJu0YwugSLXM1mWu2BC0zKG96gMyg+bIrGthMnephHirKhrY5rCSWgO
	KvUoqDb8juRiqfcihoL7BJzZYCfSXHpMv/+XUX38YsU8R0kjtomvFcIt
X-Gm-Gg: ATEYQzyQIyHbsOgTTPGP/3fRXsyhyI40N9R7gT3om3MmJ6oQsrU9LFixK7GjEebbmmg
	fAQAodXQZv3PkwEjfWkyawISCRKEm7ntGFKmGzgHsxg+7Vr6Ju2Qf4iRDotpIixFC+aDLDgPnxG
	cRsb/vSWMqw8LDuae7DdF0gxDKzjSNxPBnlIpMf3xmfrpoXvE25E1i4CcgUx2KAJEW0Ug01U2j6
	FUF2tiNxrInSK2MK35Cc0Mf3eYn0ZirMLC0wV1JhMKooXgSDdj27X4uEVXk6Njk2aB+0VD1aHYe
	LEhQxhKwvr+vJW5k5gZnC2qYU7inbyYYOA9ZWiqaxn1Ra7I2mboJHa9C/a7spQ5GgDOXdTcvn3O
	ZVS5svKxcbmRldjXTaX+ujBmQoJyhuOF5RKV7oubvTgRk4V2Enwcg1D+yPFI4vhPewijIXsYETU
	ZB77C1TdISPQLzGBTCbDWYba1WVFQnK/e0+v6L2IRANENU6gWyx29OVxBUZ+8xkXMobxQ/eUSqc
	/5l4ap/3eJYRqYqDwMmZWR7JZoa+cjhGWvLP9JwaiPt+muPJ1J4BvYb
X-Received: by 2002:a05:6000:4011:b0:439:b922:8479 with SMTP id ffacd0b85a97d-439b92285dfmr5706628f8f.36.1772470933596;
        Mon, 02 Mar 2026 09:02:13 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439ac9f3e5bsm19606933f8f.37.2026.03.02.09.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 09:02:12 -0800 (PST)
Date: Mon, 2 Mar 2026 18:02:10 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
	festevam@gmail.com, alexander.stein@ew.tq-group.com,
	dario.binacchi@amarulasolutions.com, primoz.fiser@norik.com,
	Markus.Niebel@tq-group.com, y.moog@phytec.de, josua@solid-run.com,
	francesco.dolcini@toradex.com, maudspierings@gocontroll.com,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: freescale: Add support for Variscite
 DART-MX91
Message-ID: <aaXCkswynHreRURk@Lord-Beerus.station>
References: <20260205100125.9095-1-stefano.r@variscite.com>
 <20260205100125.9095-3-stefano.r@variscite.com>
 <aYSzgRRGewX6uSlc@lizhi-Precision-Tower-5810>
 <aaW7EpLmhxk3elmd@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaW7EpLmhxk3elmd@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_090216_724157_847043AB 
X-CRM114-Status: GOOD (  11.80  )
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

Hi Frank

On Mon, Mar 02, 2026 at 11:30:10AM -0500, Frank Li wrote:
> 
> dts part can't apply, please rebase.
> 

Thanks for the feedback.

I rebased the series on top of the current mainline (Linux master tree) and
it applies cleanly on my side.

Could you please let me know which specific tree/branch I should rebase
onto for the DTS changes? I will respin the series accordingly.

Best regards,
Stefano

