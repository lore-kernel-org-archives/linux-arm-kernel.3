Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50BC8CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 13:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M0rHqF59dBmsyHONS7wxB3lUXFRUpMtKfIks0Vd+uVY=; b=JKlc3mJvx3bJgsp+3K55QanRdH
	RJCggE0sQqY185P9IQYLac26QS/1uwTxtMfUSBvJ2+EfUF5HB8PVBZxiID7vmmNw9JNpTayslLcRi
	oCoLt56cyx8ad74j5V9/TylRVWnwkWfL+AQnI+7VyT5WToPVT8XZQfceX8WV0D4vqlXhvRvTYAlYC
	bF2dEctpaac6YnOEOGRb7etDHglaioqzA6WZi6qzCHFve5VF3bIMpn4YHc+RQ4PiqQwYcWEokT4uG
	rkVFsaU+AExyzEQ/wsYw1vyAIGcc5s5Oe2itQNIe0ywlqFSqXuYy4SCD0lJKXvPb/LvokcSABmqrS
	OnNK/Y1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNVyO-00000005aB2-2U7O;
	Thu, 14 May 2026 13:19:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNVyM-00000005aA9-2LwT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 13:19:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 33BC81762;
	Thu, 14 May 2026 06:19:21 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C319B3F836;
	Thu, 14 May 2026 06:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778764766; bh=bvjSbqa0p7Z+uEjFQabmmM4Zir3KgH00PehO0lgDGIc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iETmPvYbqiV0N/aiYARhQek+UffSXn79zj5YA9WS4yD+yeXx4mAIhbQsUWLncIpPO
	 20U+Kp8leOgaC+F2cVwMzGr4bHbRjFUf19NWgMoCNYTq+zy9X8lSZliQTSgFNrca1Q
	 cJ3qx4wjhH0T/da+5ac8GRrbWLfexf3/a54Ynmbk=
Date: Thu, 14 May 2026 14:19:19 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v5 1/3] firmware: smccc: coco: Manage arm-smccc platform
 device and CCA auxiliary drivers
Message-ID: <agXL12bNh4gGyK1K@arm.com>
References: <20260514094030.42495-1-aneesh.kumar@kernel.org>
 <20260514094030.42495-2-aneesh.kumar@kernel.org>
 <0c88bcee-65b5-4328-87e6-e1c714c3d1ca@arm.com>
 <2026051420-amusement-drove-73e6@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026051420-amusement-drove-73e6@gregkh>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_061930_715365_F9B3DAD1 
X-CRM114-Status: GOOD (  16.37  )
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

On Thu, May 14, 2026 at 02:55:48PM +0200, Greg Kroah-Hartman wrote:
> On Thu, May 14, 2026 at 12:04:13PM +0100, Suzuki K Poulose wrote:
> > On 14/05/2026 10:40, Aneesh Kumar K.V (Arm) wrote:
> > > Make the SMCCC driver responsible for registering the arm-smccc platform
> > > device and after confirming the relevant SMCCC function IDs, create
> > > the arm_cca_guest auxiliary device.
> > > 
> > 
> > There are a few changes squashed in to this patch. Please could we
> > split the patch in the following order ?
> > 
> > 1. Add platform device for arm-smccc
> 
> Do not make any more "fake" platform devices please.
> 
> > 2. Move TRNG to Auxilliary Device - (Even though it is a later patch, move
> > it before the RSI changes)
> 
> No, move it to the faux api please.

So should we end up with:

  /sys/devices/faux/arm-smccc/
    smccc_trng/
    arm-rsi-dev/
      tsm/tsm0

  /sys/class/tsm/tsm0
    -> ../../devices/faux/arm-smccc/arm-rsi-dev/tsm/tsm0

  /sys/firmware/cca/
    realm_guest

-- 
Catalin

