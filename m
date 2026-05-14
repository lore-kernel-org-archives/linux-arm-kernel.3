Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6B37CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 13:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ciniWhMqaHBzEEAvHIoUA4YHJCREegB2NQx0fa4iv50=; b=DzI75Ws6jeweTdyHGuhPzXt9nY
	g1o05DQdtkCpplbeVZAWhi0wcol0iaDkqQSXOKq/x/HjEA9ZdvZBqJqF1wnI4TUGVTLbKJj/FTO/I
	i8poe0bdBOuLB6ec3gIZP+vzBTpVBokQHgpWI9E+gwiGnSPgYpYc1kRhRMGkMuh6owt1Ffcfap5Lj
	m+zpfYoTFaP50kUXbdTOu5xTX3pIfMcGzLeN8J3rY+fTP5VWtREMB6rhaDcQh1wSaMP5UMXpXjpeX
	fh5cToBLk7JWzR9kqtS7iB6ckTCUN0BTkrbpi67ntEaS7E0mFQP+G5iZUqkUjOJc47TPVqp/onFAa
	Yzc3Bdsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNWOL-00000005d3i-1Meo;
	Thu, 14 May 2026 13:46:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNWOI-00000005d34-3Qqa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 13:46:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2BFAC165C;
	Thu, 14 May 2026 06:46:11 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5C6FA3F836;
	Thu, 14 May 2026 06:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778766376; bh=reoFd3yclIQ8pFpoHoR4amGrcWXsKilD0ZgHr9xDQ1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IlCsoipmG27OHXyO2x7Mahc0teRGc+fOKzg0ernwpeFsMZVVaAm1SAcl+RJ062da6
	 h+YzhATcW2o4K3k1yzLyfYr/ty+8HZhVgVJhFnMhnFQ1v0snWbgUmKdk0gxQSL2yHK
	 Kh5K6ajqyzwLOfOC0sQakjpIn3XzbDobP3TRkQA4=
Date: Thu, 14 May 2026 14:46:11 +0100
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
Message-ID: <agXSI6PPf4uR7VBL@arm.com>
References: <20260514094030.42495-1-aneesh.kumar@kernel.org>
 <20260514094030.42495-2-aneesh.kumar@kernel.org>
 <0c88bcee-65b5-4328-87e6-e1c714c3d1ca@arm.com>
 <2026051420-amusement-drove-73e6@gregkh>
 <agXL12bNh4gGyK1K@arm.com>
 <2026051445-magician-coffee-962f@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026051445-magician-coffee-962f@gregkh>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_064618_899527_36045A0F 
X-CRM114-Status: GOOD (  19.06  )
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

On Thu, May 14, 2026 at 03:25:34PM +0200, Greg Kroah-Hartman wrote:
> On Thu, May 14, 2026 at 02:19:19PM +0100, Catalin Marinas wrote:
> > On Thu, May 14, 2026 at 02:55:48PM +0200, Greg Kroah-Hartman wrote:
> > > On Thu, May 14, 2026 at 12:04:13PM +0100, Suzuki K Poulose wrote:
> > > > On 14/05/2026 10:40, Aneesh Kumar K.V (Arm) wrote:
> > > > > Make the SMCCC driver responsible for registering the arm-smccc platform
> > > > > device and after confirming the relevant SMCCC function IDs, create
> > > > > the arm_cca_guest auxiliary device.
> > > > > 
> > > > 
> > > > There are a few changes squashed in to this patch. Please could we
> > > > split the patch in the following order ?
> > > > 
> > > > 1. Add platform device for arm-smccc
> > > 
> > > Do not make any more "fake" platform devices please.
> > > 
> > > > 2. Move TRNG to Auxilliary Device - (Even though it is a later patch, move
> > > > it before the RSI changes)
> > > 
> > > No, move it to the faux api please.
> > 
> > So should we end up with:
> > 
> >   /sys/devices/faux/arm-smccc/
> >     smccc_trng/
> >     arm-rsi-dev/
> 
> What types are these child devices?  Also faux ones?

They'd also be faux devices with this structure (in practice they are
firmware interfaces that may be backed by some hardware like in the TRNG
case, though not directly accessible to Linux).

-- 
Catalin

