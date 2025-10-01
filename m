Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8CBBCCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 16:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iTpxZ9ru9UqyaX58xqLKVwXiK/FxAvZ1ncan5yozrCE=; b=LmHGjOTO9Y0yFj9wGgZbrrYzB3
	+jI7V2GaktwijqHE1ylbdhdu2jYLoSLmwStPPdjKNKO919wlWtQDtVurJi38gmrY+VFXWqsO0jHlo
	KytK2mXKsyYC2Slzs82JrRQTM7nBtZe7BJYTD681aj8XtIl/Rs6maBBP8UEaVBzoBDTW5hfsa6San
	KCkcn1oCMFel2ch6eMCjQZ6upChvP/fvOkqPekdbYu5BGQPYFVD0DYr5YspPKWnvzAQjhmVQ40WuD
	Wu2b+MjKwlGXMJHibgy2wxH3o+oTpzqZk3MOohr2L2h/ojvTJ8CkjMNKhBP2RSIYHTGt3ZXDaMd8R
	Sfag0Kdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v409s-00000008b4A-0Vj0;
	Wed, 01 Oct 2025 16:58:28 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v409p-00000008b3T-0PeL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 16:58:26 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 591Gw9c32711373;
	Wed, 1 Oct 2025 11:58:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759337889;
	bh=iTpxZ9ru9UqyaX58xqLKVwXiK/FxAvZ1ncan5yozrCE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=SmoPHkHxXUqEl/EwoZySTE7UaA5+k0GAB3wrOylYlxn69j3OzA7l6IlUGVLc5XFES
	 Jszshhl8wf4NYbiTKCKVqoTR8+MLc/YsSHMtNEerFg/19hkZSuhUl2iR2rXjPuDi5t
	 y3Dk02COdGubZzcEfoaybF42eWTUZOgRub8ekgxg=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 591Gw95r615388
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 1 Oct 2025 11:58:09 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 1
 Oct 2025 11:58:08 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 1 Oct 2025 11:58:08 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 591Gw85r861915;
	Wed, 1 Oct 2025 11:58:08 -0500
Date: Wed, 1 Oct 2025 11:58:08 -0500
From: Nishanth Menon <nm@ti.com>
To: Simon Horman <horms@kernel.org>
CC: Jacob Keller <jacob.e.keller@intel.com>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>,
        Paolo Abeni <pabeni@redhat.com>, Jakub
 Kicinski <kuba@kernel.org>,
        Eric Dumazet <edumazet@google.com>,
        "David S.
 Miller" <davem@davemloft.net>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        Santosh
 Shilimkar <ssantosh@kernel.org>,
        Siddharth Vadapalli <s-vadapalli@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>
Subject: Re: [PATCH V2 3/3] net: ethernet: ti: Remove IS_ERR_OR_NULL checks
 for knav_dma_open_channel
Message-ID: <20251001165808.lnatvc224dpewpe7@unscathed>
References: <20250930121609.158419-1-nm@ti.com>
 <20250930121609.158419-4-nm@ti.com>
 <0cae855b-e842-47a1-9aaf-b2a297ec32d6@intel.com>
 <20251001105416.frbebh5ws2rnxquu@quality>
 <aN1Pwh3B8xhEoQmh@horms.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aN1Pwh3B8xhEoQmh@horms.kernel.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_095825_394267_FEC9F97F 
X-CRM114-Status: GOOD (  24.59  )
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

On 16:58-20251001, Simon Horman wrote:
> On Wed, Oct 01, 2025 at 05:54:16AM -0500, Nishanth Menon wrote:
> > On 16:59-20250930, Jacob Keller wrote:
> > > 
> > > 
> > > On 9/30/2025 5:16 AM, Nishanth Menon wrote:
> > > > knav_dma_open_channel now only returns NULL on failure instead of error
> > > > pointers. Replace IS_ERR_OR_NULL checks with simple NULL checks.
> > > > 
> > > > Suggested-by: Simon Horman <horms@kernel.org>
> > > > Signed-off-by: Nishanth Menon <nm@ti.com>
> > > > ---
> > > > Changes in V2:
> > > > * renewed version
> > > > * Dropped the fixes since code refactoring was involved.
> > > > 
> > > 
> > > Whats the justification for splitting this apart from patch 1 of 3?
> > > 
> > > It seems like we ought to just do all this in a single patch. I don't
> > > see the value in splitting this apart into 3 patches, unless someone
> > > else on the list thinks it is valuable.
> > 
> > The only reason I have done that is to ensure the patches are
> > bisectable. at patch #1, we are still returning -EINVAL, the driver
> > should still function when we switch the return over to NULL.
> 
> Maybe we can simplify things and squash all three patches into one.
> They seem inter-related.

I have no issues as the SoC driver maintainer.. just need direction on
logistics: I will need either the network maintainers to agree to take
it in OR with their ack, I can queue it up.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

