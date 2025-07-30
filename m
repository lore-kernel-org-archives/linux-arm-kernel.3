Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C583C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 18:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/uzhMu8l/+xX8avWPqH5+S+kIt5RrrcqO2P6A1XQnEc=; b=KLJXulZG+cNVCKj9gYn0jkN1Zk
	fFwLnCqsed+CB9uA1dX1U4d6zDbEeFbfZElx9vBPKA2u2JY5VwHEKa3ioACIEPgdQTQpCM6P5VCmZ
	O2d+wqFzUwDXHgGGDt7g2E6hMQLMAbSVRlCfuFxgryhD6lpAGQ23Um8RUGR8o3nfo3HLkn1JlkzMT
	yZ1bBeauwC4KD8Tmqii+yBsQoicxOSg910V5pIHhtk2aWCe6xJcK3EqFg3vRloiz0diZkl7hYOTpn
	4QBU8UT9+W19mhTDxnuVQ5nWe6kQkIYT2/9FYkj24bp8gzliXfDKMzDIsfYO73uj+qW1e7KDdeEqw
	ORbGpWAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhB66-00000002ASN-1T8g;
	Wed, 30 Jul 2025 18:00:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhB3c-00000002A4z-0NYT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 17:57:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A74D71BF7;
	Wed, 30 Jul 2025 10:57:30 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3F7A03F66E;
	Wed, 30 Jul 2025 10:57:38 -0700 (PDT)
Date: Wed, 30 Jul 2025 18:57:36 +0100
From: Leo Yan <leo.yan@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 04/10] coresight: Appropriately disable programming
 clocks
Message-ID: <20250730175736.GD143191@e132581.arm.com>
References: <20250724-arm_cs_fix_clock_v4-v5-0-63f648dae021@arm.com>
 <20250724-arm_cs_fix_clock_v4-v5-4-63f648dae021@arm.com>
 <b3782b8f-8c09-4fb8-bec6-186102cc66a8@sirena.org.uk>
 <f9fb2174-5bc5-4c7b-b74b-8542b4f7cbe0@sirena.org.uk>
 <15370a42-8e92-4f57-9ff2-f283d9fd30bd@arm.com>
 <20250730085637.GB143191@e132581.arm.com>
 <caffdde4-fad4-4462-ba92-84416726a12d@arm.com>
 <20250730105432.GC143191@e132581.arm.com>
 <cd250adb-61e7-414f-bf17-6cc960e44f7b@arm.com>
 <015c39de-001b-4660-bc64-6fd07eff9f18@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <015c39de-001b-4660-bc64-6fd07eff9f18@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_105740_168417_4C1FDE31 
X-CRM114-Status: GOOD (  15.19  )
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

On Wed, Jul 30, 2025 at 12:09:42PM +0100, Mark Brown wrote:
> On Wed, Jul 30, 2025 at 12:01:25PM +0100, Suzuki K Poulose wrote:
> 
> > I would recommend using that and don't force the use of apb_clk/apb
> > for AMBA devices. If the firmware doesn't specify a clock, but does
> > specify the CoreSight components, it knows it better.
> 
> And perhaps more to the point if a currently working system suddenly
> starts requiring additional clocks in it's binding that's an ABI break.

Yes, the change should not break any platforms if the DT binding is
passed correctly. I will update with devm_clk_get_optional_enabled().

Just for the record, I was a bit concerned that the driver might not
report a missing clock after switching to the optional clock API.
After discussed with Rob and Suzuki, I understand this should not be a
problem. Any missing clock issue can be caught by the DT schema static
checker, or a system hang during the development phase would remind
developers to bind clocks properly.

Thanks,
Leo

