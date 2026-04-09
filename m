Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38339E9DE5B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 07:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rxRaGky1PDExK5cCBC91gIZwwHEAgwUQ6PW8LpppLKE=; b=4WPd2Q+BOI0wdnYZ9B7hvp2eE+
	898z7SaFIeEOIyZMZZ25sAsVBt6YVmf8se1MHI8U6sxGs0mS7binPF9UgsBwhmXxBFmVjfOgb1NRI
	XhM8i7+ITO9zTsM2fXhb6SObpD5VpdwQh3WZM7CzoCFXjyvQISMffucs/OH2q7Ayq86Sgaq/72OBI
	dRGBHs/F5Q528R8WPzN5mteWzWZIZimwGxvAafnrG5i7ZykYuWaaInrSxxvPIdK73ChU2E3cHUJKh
	+X1wgNhcyGAwLWzey/CTB8R6JhiYG65PUNhE/WsDIuoZgIDoTY0o4/09XQbvEzLO6ldKYhJivAJ+Q
	yiuw4Dlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAk8B-00000009sRg-1fr8;
	Thu, 09 Apr 2026 07:48:51 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAk89-00000009sRJ-15US
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 07:48:50 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-43b949bf4easo271805f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 00:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775720927; x=1776325727; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rxRaGky1PDExK5cCBC91gIZwwHEAgwUQ6PW8LpppLKE=;
        b=EoFaC2SuUXdQ4C2V70w7NZ/p5UfilzLEF0hHHxaL4hrZGr9MIh0zsroMo6KwlC2e9S
         AQrgW73bmJ0sMQrns3yBhgcCst2KQMkzSdPtgdlhDr8g+Dbl2prmlAZZFzKlIzIh3bJC
         xbJnGlSvd4pxkPTpMdytzNUi5xDnCUNsTYBaoIngmXWn/QnnzoAeDBcZwhs1iVFLaj2v
         92pLWlZFwBr7l8vUslM81LkYd3QL1jb2VGqhaNo1NwKGKylch90OGkFQ1+OyN3sT4Qf4
         /2d8DqBKzOpGOnsYdar2kpGl1tD3doBCyvzZ/4nK53Mf7QZPP2HVB2ex9f/pKGq1hV/0
         ZG+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775720927; x=1776325727;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rxRaGky1PDExK5cCBC91gIZwwHEAgwUQ6PW8LpppLKE=;
        b=KW+BVV9RzsYg33NkwDf6Qu+deJGfN/gX/sRHtWAsfGC9CSKKJKu98//tlSmORSht3H
         eHCMCGvw/uF3Nx4dtJBKY4wPh0136ylSlYRqLrEukEfrG3MWTDMEEUanrGDdRjRqgvFJ
         3vU/m8BG+eguRhlcw9ClAv20PbZmk88st2Hx9LmMFMSAmyNk1dsh3j+L7+fV1pe5cOPF
         oO21twVX8hWAMApkYkzcaUwhkpij3ptpDlQVFvGFwQEkDQD1TmVtukJyiSKUdaylDN+3
         mhV7RYr8P8paiNWtfox3liM0ssAoFQ/hYAD3snle3QwSypMvoq9st2YeTj731EpNgOXM
         IKMw==
X-Forwarded-Encrypted: i=1; AJvYcCVgpziUoQo24N6sF+LpYzfr+GJFNncTKeEACHO8fEvkdck6alPbwQd0Uy45F04vxgt4hVWpjDtIKk5PUIZ4rh5H@lists.infradead.org
X-Gm-Message-State: AOJu0YyEpF/FEoORGMyYcg3H75CClRO9YKab51WSbN0s1iYGAFcbpvxZ
	uQpFHMFI7a8Q3LJWD3gK3lzFiQzaKhYP4N63xYn15pSCJVwAmxj67zek
X-Gm-Gg: AeBDiesDnIeDRqT0jZ8WzF1jDKksHkd/ZvoNKcXeF095TiB+anQpJu4VnpVF6DKLMIz
	sEDvaB3fcHKc6GXlObqpaAfJGAzbmL8nfD0ZK8Vh4AbhAS8i5myEN3lK0sQcCvKwL+f61JmdvdW
	tG4f0JBkxCMFtDfCzx75BFmcHI8QALvaS/DxePsKpeGtcCEsQWweCjVdLUkbROQSaCHn4+Tg1iU
	qvbm6EXA71T8g/Wi+tLfyRDnQBfEW01rzkdQqbcFZqJy67GQlsqDM/BTxOSZww9uur2xFE3xJkq
	pxVlRz4eIC5b/OT7HtvFv4CX9qCxV/xM+3Rycsg1lnHCKIiHzmRulGWmOoe4eCjceutQULtSNqe
	PimcV1v/+d5wRCCZP5JOCEaPEv9zcaSKn1V9+p5TjG3Qq1u/iOKtTxMqiOxWESTFfKzrtePBhiQ
	rmkoioSIMUvyRD8P1GP4YN3q70/+ztJytAZrMkoUlUYrjPY9O7wtfC0NmJIBzbefze+TbH2Yugv
	k3qTr23BzkenDVEWnIw/MNpjfEiYVSIS0H7fNjM+wXtytcUibz9HA==
X-Received: by 2002:a05:6000:2506:b0:43d:1598:2d6e with SMTP id ffacd0b85a97d-43d595bbc20mr3631331f8f.20.1775720926997;
        Thu, 09 Apr 2026 00:48:46 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.dsl.teletu.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a6f5bsm59805211f8f.7.2026.04.09.00.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 00:48:46 -0700 (PDT)
Date: Thu, 9 Apr 2026 09:48:44 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Josua Mayer <josua@solid-run.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Primoz Fiser <primoz.fiser@norik.com>
Subject: Re: [PATCH v1 2/3] arm64: dts: freescale: Add support for Variscite
 VAR-SOM-MX91
Message-ID: <addZ3BNYfwIrFBuG@Lord-Beerus.station>
References: <cover.1775669847.git.stefano.r@variscite.com>
 <1ed7e2100e3feb74c9f0006d5b88e1bba1ad4339.1775669847.git.stefano.r@variscite.com>
 <adcdWdTcVR2T2F5c@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adcdWdTcVR2T2F5c@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_004849_311487_AD29B409 
X-CRM114-Status: GOOD (  10.58  )
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

Hi Frank!

On Wed, Apr 08, 2026 at 11:30:33PM -0400, Frank Li wrote:
> 
> what' difference with imx93-var-som ? Can you reuse it?
> 

The imx91-var-som is conceptually similar to imx93-var-som, and I used
it as a reference while preparing this DTS.

However, it cannot be directly reused as there are several hardware
differences between the two platforms, including SoC integration and
peripheral configuration (e.g. pinctrl, and available IPs).

So a separate description is required for imx91.

Best regards,
Stefano

