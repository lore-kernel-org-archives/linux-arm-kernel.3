Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7111C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 12:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X+/UmnSp/2pTBPel7rPEF/u4YwIWbuFeQxWg7vJ3fwY=; b=ngSozn3TsxprZS3iebCkeKF1l+
	26PNegzBE5N6JcHUPxEErPQHLewP/862xZKFdJtLT7FJiv1ysUxT3S7k6+YrWgmz/rlenzi3Afg0m
	UyFpYvRyteGovIjlwYujnm3YJju1wW9jWg8oINjDDDwDQuKyjGlLlOJJuVs4eA+DMfILQ+MmvCS1e
	fD4NMEsdYQ5wQuNAxa1M4ZMhrdyMOs8F5S245OhzLdvz+p0/bci1IicdzaP7fnWDBKV6jRVUSxkEy
	zn/tf8qUC2br83r9JwE6R4X/OEWBqecEOnW1J+T166/MzhT/bA7nm3wLN4cNrYaN3ZLhgFV1nTZ/m
	drWjB5yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trc0j-00000002YkN-48n0;
	Mon, 10 Mar 2025 12:13:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trbmu-00000002VHa-3qmq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 11:59:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C61151516;
	Mon, 10 Mar 2025 04:59:27 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E145A3F5A1;
	Mon, 10 Mar 2025 04:59:15 -0700 (PDT)
Date: Mon, 10 Mar 2025 11:59:11 +0000
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Namhyung Kim <namhyung@kernel.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/8] coresight: etm4x: Extract the trace unit
 controlling
Message-ID: <20250310115911.GE9682@e132581.arm.com>
References: <20250310104919.58816-1-leo.yan@arm.com>
 <20250310104919.58816-2-leo.yan@arm.com>
 <bb390d95-7f2b-4327-a809-9e4cdbd1a1bc@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb390d95-7f2b-4327-a809-9e4cdbd1a1bc@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_045916_998602_4561F80C 
X-CRM114-Status: GOOD (  14.34  )
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

Hi Suzuki,

On Mon, Mar 10, 2025 at 10:57:25AM +0000, Suzuki Kuruppassery Poulose wrote:
> Hi Leo
> 
> On 10/03/2025 10:49, Leo Yan wrote:
> > The trace unit is controlled in the ETM hardware enabling and disabling.
> > The sequential changes for support AUX pause and resume will reuse the
> > same operations.
> > 
> > Extract the operations in the etm4_{enable|disable}_trace_unit()
> > functions.  A minor improvement in etm4_enable_trace_unit() is for
> > returning the timeout error to callers.
> > 
> > Signed-off-by: Leo Yan <leo.yan@arm.com>
> 
> fyi, this area of code has changes significantly and will cause
> conflicts, due to the introduction of synchronization after
> each access to the TRCSTATR. Please rebase your next version on
> the coresight next branch to avoid the conflict.

Sure.  Will rebase on CoreSight next branch [1].

Thanks for reminding.

Leo

[1] https://web.git.kernel.org/pub/scm/linux/kernel/git/coresight/linux.git/log/?//h=next

> The changes as such look good to me.
> 
> Suzuki

