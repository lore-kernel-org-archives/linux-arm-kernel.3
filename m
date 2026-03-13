Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04501107BCCD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 16:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XyVi9ie4kjBemkSiAX2WnD6MGaPKy+GHNmKR/i8NVt4=; b=fYV8eijcvVW+RpHVmox+EIfTqq
	OTEosAmDq58KDMPYY5h9u/gby8iwkrmuUoAt8SCa0+MpcxaTsORnv3E/mLo/90259jk09gUAd57Mu
	KSyJGTAmYb/TXNg2ccAqWhhI8zcJi4sX4HVKRgCZRMjiMBsXRsNpupwQj3CqH1x4YFoB5nbAVX1b3
	fc0uPnA6sS12nJlCi5KvH0fLvNESkFPfd+ClSzdblnauZb3h3gJUwfCkyQ1WoaeZiWpa6Na8/j7R3
	J3/RCtq79iovSSR+qvmsKxpdL5M3QCGPk77B3hbipKvQLmL3/Td1oJNVODuaTpUqD/2wyDE4M25Cf
	elCXp91w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w15f3-00000000gUM-49ui;
	Fri, 13 Mar 2026 16:46:54 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w15f2-00000000gU2-1JGb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 16:46:53 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso21896935e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 09:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773420410; x=1774025210; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XyVi9ie4kjBemkSiAX2WnD6MGaPKy+GHNmKR/i8NVt4=;
        b=cuyKGBZjs/Rdg6hZoRfAEAR313+meYMmbBA23Z33zvSrsNKpgtaCUbkpsv3tDsKJiq
         9QOADMXdQ1RK9eV7p6rZ1V7iYHhS/pd3tafA6jBZJvxONi6ZaL3Fsaf70DBT6lupOY04
         nXE/IySv7B9yrwvVs/DfhN2n3TFcaGg91BaDDb757nFA7f1YEZQSz87jTivBAiF+6tNS
         fu4ksprwy84wWRGxY8ut1jyMpxw2RBbfpXaq+lgpNC/q8WMFYREybKd7s/uZ2WjDbpgA
         1QYxBrnNS8Bwjp4ygu4qRvaDU6r5fpN7BG7SoB/7eZGJqUzokMhiE94Z7RzXyuilHtTZ
         j1ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773420410; x=1774025210;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XyVi9ie4kjBemkSiAX2WnD6MGaPKy+GHNmKR/i8NVt4=;
        b=Yc/z1HR6/uPHwknv76UNtPkoKqsWIZMd002oV0kh6xeow+zlTQj+6OHPHHQMeOuPmd
         8ujbGsghmZIeLxntXM6an5gurum0lgxKC9uWXdU8SNJyfHVWXbWl9pBLNxz5izj9YBud
         y9RriBEfJfJACGys/CvgZWdcxg5LJ6ixCwNkGk/xtP6Y5Xwkl9rKJNasi6dbV91R0kDn
         LO11YL59XsJnmLDzrG2sbCU0WYj+xewbZMLSLPypfn8PeWr2HGzm4hfc5yb1PzNCsPiS
         OJjFYvJfB/n5JicvGheGeLEAYNBQlol0hpQ0d3AmFsGAKIPdatwh17CKMJZ0yFKaiqJv
         2Feg==
X-Forwarded-Encrypted: i=1; AJvYcCXDy4SPvHcEAWm1tEJIacm81PKPdfkWzgkJ/tFCaLb7pFJEkl9JJyNQa2h7ocvhkFfycUFSaqViAY0iKfEeKI2x@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6WqxZ1A3FQBPyJtUTw0uG6abpcWG1kOVnii7fkl5/cHJ8P/+c
	COKiq0PuUjNeEohmQdPB1E+6vadxGobTHBuDeLc54snY/iW4f1tO8UM0
X-Gm-Gg: ATEYQzwT+WtUfm5egMmll6SFAmQTSt3qnQGbWr7Zk/zQuHFbWCkmTNKjkoYjoZn65//
	j4SK72nvihAC/48XOZ9Ai4JB1OOrYs2h1nqvpV5X6FgTa7YbG1Gs54HYWB/zYiJCKVCO8ZZeLQx
	oihzRnJnVtE7B74vs6lpt03NSd7yCt4w26qvHRYApnmENyGn2PnU5PJthNjZpISIUHlaVTQV6LZ
	TwKzM2VlkSJvAlKftDnNExWe+q0L2eunYvR34dn1LqN0MMHxVIXT+xQyYAatpHCVTNil//b2rfY
	qSZQ0ECOFY/RomCMiYNRTx59nTNM4KgTbfzQ/3DF8cP+6Xso8HnRV4tC4jWqr+spoYeJqGcj9RN
	u7dyWNIOhqAD+iHqsDGaDLhfMmfY5tqnjYV1mQz13YZ+9ZPE7vWLGqQHNJC9RQRhcyJwATJWJLT
	CV6+m/zjrTNXIRVyMD3GprvTbfa2Sbjk3hKxin+7j1fPIJc30p3LQURylIslSVHYiqdEkVDNgMa
	hgbO4mpV0YzVsJq3sHo3CUuR3hq4VMrYrWnG4s45DZC6g==
X-Received: by 2002:a05:600c:a4b:b0:485:3692:e8f7 with SMTP id 5b1f17b1804b1-48556707ddbmr67083435e9.25.1773420409865;
        Fri, 13 Mar 2026 09:46:49 -0700 (PDT)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4855638cebcsm59182635e9.0.2026.03.13.09.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 09:46:49 -0700 (PDT)
Date: Fri, 13 Mar 2026 17:46:47 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v3 06/11] arm64: dts: freescale: imx8mm-var-som: Update
 WiFi/BT with variants
Message-ID: <abQ_d9fGarNobYdo@Lord-Beerus.station>
References: <cover.1772898346.git.stefano.radaelli21@gmail.com>
 <7c84625f82c562bb9cd2b455465d63a1a25bf19e.1772898346.git.stefano.radaelli21@gmail.com>
 <CAOMZO5C+USp34WQ9ap+N9ha6EgU7JgsYkRsLEW=ZdizbkMQvPA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMZO5C+USp34WQ9ap+N9ha6EgU7JgsYkRsLEW=ZdizbkMQvPA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_094652_377934_614F4852 
X-CRM114-Status: GOOD (  11.70  )
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

Hi Fabio,

On Fri, Mar 13, 2026 at 01:41:02PM -0300, Fabio Estevam wrote:
> 
> One From line is enough.
> 

Yes, that was a mistake on my side. Something in my workflow ended up
adding the "From:" line twice. I will fix it in the next revision.

> 
>  imx8mm-var-som-wifi-brcm-legacy.dtsi is not included anywhere, right?

Correct. It is not included anywhere at the moment.
The Symphony evaluation board uses the IW61x configuration.
The imx8mm-var-som-wifi-brcm-legacy.dtsi file is kept as a separate include
so that carrier boards using the legacy Broadcom-based SOM revision can
include it if needed.

Best Regards,
Stefano

