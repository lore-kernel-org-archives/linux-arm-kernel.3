Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16329CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 16:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k7yVpDBibw8MgL9pOd0pA+jApF8pwC6p5fo2RE4G194=; b=2SXpycpeWg+zS64ut7lM0oJ3vV
	Fq2qHgSzXMF4c1iq8c2K2IeEvtDuBF2CgyTaFMkLgJQaWFvInoVK2dwibrBkOD77zVoSrpqnu2A2p
	oe1gQQuoZ0+LbmCOv5EtK2pDOAEOU0NhHQTPk3hgGfSE1DDBtiAoSiJhzUSBu67ZSRlpDPeGhxVt0
	GMdr5Ahj33QnC5lbDY6fqa6klCs65alKym/nyIaHCm1Z0mnvPhq2oSN697JJPpQtmTVBUou+I3MwE
	I1RqDjxKBEb/BqWHmYcz4H8xJPcLBATJTq8WatZCRPi1UGxexnEZLlRQLiAP4zW0ssjPhHlhWZ25R
	TFo0pQ2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyYxX-00000008Xpk-40Nx;
	Tue, 16 Sep 2025 16:55:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyYxV-00000008XpF-1YpI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 16:55:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 35FAB113E;
	Tue, 16 Sep 2025 09:55:04 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0C3D13F694;
	Tue, 16 Sep 2025 09:55:11 -0700 (PDT)
Date: Tue, 16 Sep 2025 17:55:10 +0100
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Sean Anderson <sean.anderson@linux.dev>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Linu Cherian <lcherian@marvell.com>, linux-kernel@vger.kernel.org,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	James Clark <james.clark@linaro.org>
Subject: Re: [PATCH v3] coresight: Fix possible deadlock in coresight_panic_cb
Message-ID: <20250916165510.GN12516@e132581.arm.com>
References: <20250912151314.3761026-1-sean.anderson@linux.dev>
 <20250915095820.GH12516@e132581.arm.com>
 <3e618117-96bd-44f3-bede-7cadfe0264dd@linux.dev>
 <20250916160027.GK12516@e132581.arm.com>
 <6fbd24b2-3315-45e6-bff2-2c39e899e8f5@arm.com>
 <20250916163840.GL12516@e132581.arm.com>
 <8f426702-4897-4177-aeae-4fe2b7155fae@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8f426702-4897-4177-aeae-4fe2b7155fae@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_095513_463497_4AB5C9F8 
X-CRM114-Status: GOOD (  14.65  )
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

On Tue, Sep 16, 2025 at 05:42:07PM +0100, Suzuki Kuruppassery Poulose wrote:

[...]

> > > Well, if you are going that far, why not register the notifier from
> > > coresight-core ?
> > 
> > I have thought this but gave up.
> > 
> > When register a panic's notifier, it does not provide an argument for
> > passing a private data. So the code below uses container_of() to convert
> > notifier block pointer to the TMC driver data, as a result, the code is
> > specific to TMC driver.
> 
> notifier_block in csdev ?

csdev is a common structure, some devices may never use the notifier.

This is the reason I thought it is fine to put notifier into TMC's
driver data, as this can meet current requirement perfectly.

Thanks,
Leo

