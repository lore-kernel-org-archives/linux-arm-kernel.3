Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 149B0D63954
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 14:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SmGRAQNzr9IbhEOimZwTw8lIUi3ybRW4Cu3nzQgFFX8=; b=YA7acc0WbRB4ZN8PqfJaiAT9dj
	sz8gM0yl9+lYMqDvfK7M5pc9qJ3VSwZ/adtPstQj6rZD2hZM8OMbSmUYnPCA1hgs1XUh4Iarb9SY1
	K20302/YjWmXh5vtAzTJTkiSkcOMv64O4bmP5ZAnhLwb+5ovEU1UygHpvm9Ix2ns6wU0GYpg4Ja2V
	uHCYr/ZHSTXAecSnEPb7+JWjm4/stk578WDVi77K2WC8F1ZurcUSWxcm3VPkSIM5JztVPsOPrIv2k
	oET33iggGXqLwgpBcQj7MvX8Ivm5rkfmdVtPd9EfBFnqyg4C4SRHCu71FxaIVF4wmcbJxIGEMLUe7
	5Ll1dkrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDlxS-0000000FaAq-2smT;
	Wed, 20 Nov 2024 14:45:30 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDlwW-0000000Fa40-1sXr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 14:44:34 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4AKEiSh54137450
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 20 Nov 2024 08:44:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1732113868;
	bh=SmGRAQNzr9IbhEOimZwTw8lIUi3ybRW4Cu3nzQgFFX8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=fIfp9bWkeIRSAsrfQv74AZsEIHLWPZfK+OJ2om1FYn5//e7jYRu/zl5D/Q/G96TWF
	 uRnpksVkY2gLoy4hijKqUw6oRCsPvpenq8mr5Wedb6UXlWQH4FJpVEei/tcM3yJzgL
	 AANTEPNi/JNok7RkBsb8QtvRHlHDDlNutSvx/DkA=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4AKEiSfU092708
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 20 Nov 2024 08:44:28 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 20
 Nov 2024 08:44:28 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 20 Nov 2024 08:44:28 -0600
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4AKEiSBc009121;
	Wed, 20 Nov 2024 08:44:28 -0600
Date: Wed, 20 Nov 2024 08:44:28 -0600
From: Bryan Brattlof <bb@ti.com>
To: Andrew Davis <afd@ti.com>
CC: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] arm64: dts: ti: k3-am62l: add initial infrastructure
Message-ID: <20241120144428.xp5lscjl652qexd2@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20241117-am62lx-v1-0-4e71e42d781d@ti.com>
 <20241117-am62lx-v1-1-4e71e42d781d@ti.com>
 <19223ad9-1f92-4688-9efd-b6aadb250d9d@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <19223ad9-1f92-4688-9efd-b6aadb250d9d@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_064432_846182_B7630E77 
X-CRM114-Status: GOOD (  13.53  )
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

On November 18, 2024 thus sayeth Andrew Davis:
> On 11/17/24 11:34 PM, Bryan Brattlof wrote:
> > From: Vignesh Raghavendra <vigneshr@ti.com>
> > 
> > Add the initial infrastructure needed for the AM62L. All of which can be
> > found in the Technical Reference Manual (TRM) located here:
> > 
> >      https://www.ti.com/lit/ug/sprujb4/sprujb4.pdf
> 
> We usually use the non-direct links, that way they can be updated
> to the latest, so here and everywhere below:
> 
> https://www.ti.com/lit/pdf/sprujb4
> 
> Also might be good to get the TRM folks to now drop the
> "Confidential NDA" watermarks..
> 

That's a good point. I'll use the non-direct link

..

> > +		 cbass_wakeup:  bus@43000000 {
> 
> Some odd whitespace indent here and below in this node.
> 

Nice! I'll fix this up in the next revision

~Bryan

