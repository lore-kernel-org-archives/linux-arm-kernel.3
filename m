Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A6C7CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 16:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1lQPtFQmLmegB0hlwYo1inxC4c6Y5ELU/rPXUSo965I=; b=AtiMHxtXh6fci9sJ1CTZ1wGgq1
	nU3+6Twn3YUD99s5HcwgGpCG0X6C7JsJ18RUg7rUpT3QqdVshuj82iWy7/D9yHz0ePsIto1tLvpnz
	Y+OWwMiHyPydGnzH3xsHxRdZp0nAiAnz3HLQs/d6i/JBEhE/DUxoIDKUi1wJWaHNXrPdNSWS7ABac
	QkGhzPqBY+swOa29sj3l9xqaavNkUf192DjAWV1/3TIX3qQGu6dtKJtfSCwmLPDfiw50y1uoZVBFl
	d+RDkG8om6WloJMssaLclnGzEnVLlPDI756TErN4/hAPI+1L/sG2ETPLG6qfoMkMfz2wajb578HX5
	k+73nOUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyYrT-00000008We4-1osM;
	Tue, 16 Sep 2025 16:48:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyYrR-00000008WdQ-2DWk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 16:48:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5DF5B113E;
	Tue, 16 Sep 2025 09:48:48 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 331993F673;
	Tue, 16 Sep 2025 09:48:56 -0700 (PDT)
Date: Tue, 16 Sep 2025 17:48:54 +0100
From: Leo Yan <leo.yan@arm.com>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Linu Cherian <lcherian@marvell.com>, linux-kernel@vger.kernel.org,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	James Clark <james.clark@linaro.org>
Subject: Re: [PATCH v3] coresight: Fix possible deadlock in coresight_panic_cb
Message-ID: <20250916164854.GM12516@e132581.arm.com>
References: <20250912151314.3761026-1-sean.anderson@linux.dev>
 <20250915095820.GH12516@e132581.arm.com>
 <3e618117-96bd-44f3-bede-7cadfe0264dd@linux.dev>
 <20250916160027.GK12516@e132581.arm.com>
 <a35e2d54-f1f5-4ae4-9daa-ae1f3a8a302b@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a35e2d54-f1f5-4ae4-9daa-ae1f3a8a302b@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_094857_607801_312143E8 
X-CRM114-Status: GOOD (  10.51  )
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

On Tue, Sep 16, 2025 at 12:14:40PM -0400, Sean Anderson wrote:

[...]

> > Could you check if the drafted patch below looks good to you? If so, I
> 
> As stated above I disagree with a half-hearted removal. If you want to do that,
> then I will resend v2 done with an rcu list and you can make your own follow-up.

It is fine to disagree, but please don't resend v2 :)

We have plan to refactor locking in CoreSight driver, I will try my
best to avoid adding new lock unless with a strong reason.

Thanks,
Leo

