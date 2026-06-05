Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 709EACD6E79
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 12:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5RoN9ngqvHdCpUoddEnCEeh8fZSHGeByQdCtjfNZBdU=; b=iph93wENh8o/9IfDZElrcCLxU3
	gOHD2nkmofDY967o3dSuaOOkbkKScg/X8JjQSEKaAEGyQa3TftHKY3qhxfMZnmbpyMBpz0u1xWlmD
	zp0gfw/DJ79/COklM1/rTKTH21CyUGvZF9qlLI3a02mC4n88UKcMfDM3EJ6ltR050bSmpQUkJV74T
	ulx0j61HhC1OwgHH2opa/Tq6Y08+4EY4mGJbMHEyjGMjVNJNNrVFICmLcZidOQrKz5qVQiVI5usPE
	oodcmmS/gIP7lZBwjqTmSUm2wUOOa8gPfql0b1CvHjihBG0oM2foF+7ddByk4Klsrs/qVHAlwvxUl
	A8esh9BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVTOY-00000000b2B-3jca;
	Fri, 05 Jun 2026 12:11:26 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVTOX-00000000b1j-1Sz4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 12:11:26 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-36da151a152so1331369a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 05:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780661484; x=1781266284; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5RoN9ngqvHdCpUoddEnCEeh8fZSHGeByQdCtjfNZBdU=;
        b=qx2Qks/LhW6ryjXHVYVh4K8kex5i1UOueuTTmYRiIA9M64NO2Bq7njZ4r4f++Z4+1x
         WoQfjZhc2NsnxTsuY4B/8qIsyKp/DKNmxrm5yfVplfeJ+w+nUyi51V64pHEdfB6Z2/Ib
         070z8JHewRPO5tcvE0azcHyzazPAikVMSW4b+BIcPko1fBi4kjSkjnw9wG4X76RdJacE
         eJ8Hk4yZD641oRiIK811ZG7pIUuhoMR54QggF1diexXP/0CuqJ2Axuoa0/EFg5M4NDBQ
         Drh5UMDSa/ZccZfhrhtV2l8L50Y8D8NLEfRCHPR6rGUOh2HPkDegGn74UFyZgBqQA1dS
         hQ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780661484; x=1781266284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5RoN9ngqvHdCpUoddEnCEeh8fZSHGeByQdCtjfNZBdU=;
        b=F6pJ6MmP9OsF1aUP2euWr/xQPBRPqZkbF9kj5TNsRPcao8df7+ukCTXyVioDtgf59R
         QYBVRC8qypCiLywRqm9f0o3eCJns12aYx7A6pBRQgCTXrxiKxlsE9VvkBgASN4IVy2RZ
         fK5iIdH8DLrSmXtdJrINxCj+3QKE9qrpSkD90+zqUVnytlz12gxEGPjJ15ARPnMmj8Qy
         fKo1U2OH6fd7F/2RoTCVwIGOdVJVixEBG8jTx4LI52sRu+D0CxY3hdbSRUj4OF47CsET
         SYO7Qon7rbbGFm4z1GQ8FmrsV0ynObqofv0ApzK2xXB/emXF6j7ijzH3Sq+V57O1uTId
         rlbA==
X-Forwarded-Encrypted: i=1; AFNElJ9/T4nJFTDTpZ4GWtoDWQMB7FxZrkcuaPXRtS1disr6WczRakptX/Isvho6ER6weJBXnhSr6nwMuQ/4bNv+OqcH@lists.infradead.org
X-Gm-Message-State: AOJu0YxAeM8UEAoCLCrL5bEQcR2PbthK4d1vDNCswdgF80KHDtbTsU6J
	ZAKAWRUyM/tsRpJnzEwFT9B1sO6ttLvweJo2bSx6JQr56mm9pjOWzXnT
X-Gm-Gg: Acq92OER7EgpmZwmf5LIkhi2XCBBy2qimFpd28OUW877FtzPRMo/UMvKT47E0zmLu4P
	bSP605/UzbjJR5S+pOi9dvSyx4lcNFxB6QaYUP38pNxsBFOmvnaonFNEjeu07xroyfOYe1JmuU6
	OFJsGxtNajWVPoPZ5mYi1GFHV7O/SEH05BfhCMsIBQyWg5+rqa7wPnoO49pbuJgiG6wHDUwRHHQ
	+2NV/M/C609Q/mjoD8DX2wHg+QgutcCC5DCi/RatDpkjWeqOUp0fqg58YlD6yw0YjD535XSyIpt
	9GD/p6w2PuyC3ou4d9aCzGXTYDdRp5nLTRKgFaNcGPDpoco1QY+5Ui4xYqwsxGNo+qLZa8/ugQn
	tkDAd08jtu6X85MLDXw/OZ87FCLI6wxfZlPdA9P7FmRiXfmjvPXDsmLTfh7B7MNAZGUZ1d+RSe0
	pXksYUM8kMnis1xKJ/RaVXAfPv/u/QG30zKz925NdPpBRk7QeM3jwsvjIb2RTCS1UNaYu0v1TvB
	Zu8WSl/cYuNLPDxUe6biS7vvU1D8uIta1AZ+7qqHJqqmUO5IBjhfA==
X-Received: by 2002:a17:90a:d40b:b0:36b:9798:4f6a with SMTP id 98e67ed59e1d1-370eee04b8cmr3336521a91.10.1780661483873;
        Fri, 05 Jun 2026 05:11:23 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.. ([2405:201:2011:e829:4eb5:db6e:9a22:fd31])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6bf903fasm6300497a91.2.2026.06.05.05.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 05:11:23 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: Marek Vasut <marek.vasut@mailbox.org>,
	dri-devel@lists.freedesktop.org
Cc: Liu Ying <victor.liu@nxp.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Peng Fan <peng.fan@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lucas Stach <l.stach@pengutronix.de>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Abel Vesa <abelvesa@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH 00/39] Add i.MX95 DPU/DSI/LVDS support
Date: Fri,  5 Jun 2026 17:41:05 +0530
Message-ID: <20260605121112.27866-1-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251011170213.128907-1-marek.vasut@mailbox.org>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_051125_416160_CCA9DF3D 
X-CRM114-Status: UNSURE (   9.32  )
X-CRM114-Notice: Please train this message.
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

Hi Marek, Liu Ying,=0D
=0D
I brought this series up on the i.MX95 15x15 FRDM (IT6263 LVDS-to-HDMI on=0D
LVDS ch1). It mostly works, but I ran into a few issues around DI routing,=
=0D
LVDS format handling, and DC enable sequencing which needed rework before=0D
HDMI would come up reliably on the board.=0D
=0D
I don't see a v2 of the series and things seem to have been quiet since=0D
November. Are you planning to post an updated version?=0D
=0D
I've accumulated a fair amount of rework while getting this running on the=
=0D
FRDM. If you're not planning a v2, I can clean things up and send one based=
=0D
on the current series.=0D
=0D
Thanks,=0D
Piyush=0D

