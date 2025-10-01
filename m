Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B96CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 10:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UYdxBV+94zA32DysCLFBKsalzqZRzMhjxb0wxmqa7s4=; b=zlMINAfjzL6v92X2XflW8xdFqy
	I5l15lrl66bdLcBm7j2bjbuaCq5C7o6p4hyv9vhVHmXzoS+PHQNZb96HiBXtp6AKnilRzL4QyjEY0
	6xPtOoDeXQhRetC8yKRyrpDK7rQa4fuhEAl/Ls0UDM8oUphPlvhESWHL17ik3nqCr8Lb2M6SJrdHT
	Vl5ajnfAOp0ZLICSDdxoQjpHDQ9TT3E1zTlnKK+5kwhPAhIZL7QD59KBp3dfmWQf+M/bV5MlxhgHG
	Wv5mQf38oO+vuNxlHoLAaDkZT53QSotGh5sRwUuawVoRxbHylboadhM2l3VjTwfTsBXeykQ4hEWtc
	58YQcBbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3uTe-00000007IIu-2rxO;
	Wed, 01 Oct 2025 10:54:30 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3uTb-00000007IHq-2E2s
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 10:54:29 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 591AsHEv3111395;
	Wed, 1 Oct 2025 05:54:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759316057;
	bh=UYdxBV+94zA32DysCLFBKsalzqZRzMhjxb0wxmqa7s4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=fZz5QBblX+c4TKgL0/CJxr6HPdTftxvkONJ2Fqj0ceZTEvUYMzt4SwyI5djQdfTCn
	 KuSu3Td7ukii5E4y7T+g8FoyW37HJIt562gD4oJ1OlmfYtZBlfFcYJN+5WkTQILaKz
	 Vj6JU2YLFimotW3XjP8xeRUbCjwsFunu7EB4gEIM=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 591AsGCd2811532
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 1 Oct 2025 05:54:16 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 1
 Oct 2025 05:54:16 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 1 Oct 2025 05:54:16 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 591AsGAW205422;
	Wed, 1 Oct 2025 05:54:16 -0500
Date: Wed, 1 Oct 2025 05:54:16 -0500
From: Nishanth Menon <nm@ti.com>
To: Jacob Keller <jacob.e.keller@intel.com>
CC: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        Paolo
 Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
        Eric Dumazet
	<edumazet@google.com>,
        "David S. Miller" <davem@davemloft.net>,
        Andrew Lunn
	<andrew+netdev@lunn.ch>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Simon
 Horman <horms@kernel.org>,
        Siddharth Vadapalli <s-vadapalli@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>
Subject: Re: [PATCH V2 3/3] net: ethernet: ti: Remove IS_ERR_OR_NULL checks
 for knav_dma_open_channel
Message-ID: <20251001105416.frbebh5ws2rnxquu@quality>
References: <20250930121609.158419-1-nm@ti.com>
 <20250930121609.158419-4-nm@ti.com>
 <0cae855b-e842-47a1-9aaf-b2a297ec32d6@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <0cae855b-e842-47a1-9aaf-b2a297ec32d6@intel.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_035427_734959_B7C1976E 
X-CRM114-Status: GOOD (  16.46  )
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

On 16:59-20250930, Jacob Keller wrote:
> 
> 
> On 9/30/2025 5:16 AM, Nishanth Menon wrote:
> > knav_dma_open_channel now only returns NULL on failure instead of error
> > pointers. Replace IS_ERR_OR_NULL checks with simple NULL checks.
> > 
> > Suggested-by: Simon Horman <horms@kernel.org>
> > Signed-off-by: Nishanth Menon <nm@ti.com>
> > ---
> > Changes in V2:
> > * renewed version
> > * Dropped the fixes since code refactoring was involved.
> > 
> 
> Whats the justification for splitting this apart from patch 1 of 3?
> 
> It seems like we ought to just do all this in a single patch. I don't
> see the value in splitting this apart into 3 patches, unless someone
> else on the list thinks it is valuable.

The only reason I have done that is to ensure the patches are
bisectable. at patch #1, we are still returning -EINVAL, the driver
should still function when we switch the return over to NULL.

[...]

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

