Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B754C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 13:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q8lp5UrUp+XdpwqCCx1TxDIQu5ltAd7kTY6JKNYmfio=; b=hY0ERlU2RGae/tRWBV+HgC9Iaa
	zgZi+RCk4rWpD/lNm6WdrVvvzI3RglLJbxHusYALEYCdGjuy1vSVBDFDRqpQD27eopk8GCkKGh3xJ
	MDVyyD+zfPB8FhiTHvsdSUsE4VNCIYbxxfLdpS9iVZtT7fA5Umi+il0Cm3+vDN7f0X5RzoJsVs/VY
	Y3qCPu4UBC4R+fXhDxS6GVCjkBbm8e/CakG9puQvX7RR8xhLvJq5eTQwZlVnIzP4W4OUzTnY9oce1
	KQyip0CQ/ZkQ2m3YCGJZg/ktMUZTFUZPj7yomspcwPj2L0ztZcca9aWB7QeWSfe7qbrev+T1sSKrs
	F9aAelHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9OXi-00000006TyB-0bXg;
	Mon, 28 Apr 2025 13:29:06 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9OBD-00000006LSe-0kuc
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 28 Apr 2025 13:05:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Q8lp5UrUp+XdpwqCCx1TxDIQu5ltAd7kTY6JKNYmfio=; b=F4p8K4X7Wvd1p/zxoqz2lg4cX9
	g+buQgW7LC7Ipq3/UyUq8IBt7KZpvCiSWDT2YYnY60M8eMxYTdIbQmljDlo/ZWME2Vv3kJtT0znCg
	d4wPJfZQEcBDEVXtJfzGu4rvFWA6TTWidT38Q667Ty09e7AEmmlLRpshoWUe7TTGDCpziQsGyakEY
	DioV2vjjvlxfAQnZ9SmQKe+ba/HLibbh5xHn04FJISNV5ZeDh+mNE7MVFjSCHTEI4HL50EoIoWz68
	hdmzmgC6RE+EPgrKds1urPe57FqBsukN+WOue0WM8Du7sMdDpnPqC240sJLP3az4CG7SEDDRyXYQm
	AkIQ/MXw==;
Received: from foss.arm.com ([217.140.110.172])
	by casper.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9OAw-0000000HRCA-15NH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 13:05:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BBF6F1516;
	Mon, 28 Apr 2025 06:05:17 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CD5A63F673;
	Mon, 28 Apr 2025 06:05:23 -0700 (PDT)
Date: Mon, 28 Apr 2025 14:05:19 +0100
From: Leo Yan <leo.yan@arm.com>
To: Mike Leach <mike.leach@linaro.org>
Cc: Yabin Cui <yabinc@google.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	Jie Gan <quic_jiegan@quicinc.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] coresight: trbe: Save/restore state across CPU low power
 state
Message-ID: <20250428130519.GF551819@e132581.arm.com>
References: <20250423230046.1134389-1-yabinc@google.com>
 <731dbb1d-e804-4678-9b8c-40f6395e94a7@arm.com>
 <CALJ9ZPNExud7ZQ-ZgpVtPJHUsAyJv_O-CH8mCa6gUyu1E1T8zg@mail.gmail.com>
 <CAJ9a7VhMJDMbowRuB5zgjQw+UfxP7eumZX1SKF2MJQ2_2NebHA@mail.gmail.com>
 <20250428122408.GD551819@e132581.arm.com>
 <CAJ9a7VjhCRk9BxGvE3ZyyZzq__+A1PpD=oRtFQOcD8BwXKa27Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ9a7VjhCRk9BxGvE3ZyyZzq__+A1PpD=oRtFQOcD8BwXKa27Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_140534_589923_BC8456EF 
X-CRM114-Status: GOOD (  15.92  )
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

On Mon, Apr 28, 2025 at 01:55:29PM +0100, Mike Leach wrote:

[...]

> > > The TRBE PM can follow the model of the ETE / ETMv4 and save and
> > > restore if currently in use.
> >
> > If TRBE PM is registered as a seperate PM notifier, a prominent issue is
> > it cannot promise the depedency between ETE and TRBE when execute CPU
> > power management.  E.g., when entering CPU idle states, ETE should be
> > disabled prior to switch off TRBE, otherwise, it might cause lockup
> > issue in hardware.  If ETE and TRBE register PM notifier separately,
> > we cannot ensure the sequence between ETE and TRBE, this is why we need
> > to do the operations based on CoreSight paths.
> >
> 
> I believe that the architecture requires that if the disabled TRBE
> cannot receive trace then the ETE should regard the trace as having
> been output (A1.4 ETE spec). Incorrect sequencing should only result
> in missing trace, not a core lockup - unless the implementation is not
> compliant.

Thanks for clarification, Mike.

I would prefer to stick with the CoreSight path approach, as this will
help us to resolve the issue in a general way - not just for ETE / TRBE
case, this would be applicable for other types of links and sinks.

Thanks,
Leo

