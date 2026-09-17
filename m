Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0356CC982D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 09:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ioXa07PtjjJ6qPIoYQpQfcGqnQ3QAWn8tU96YiSJYWU=; b=Ry8ayDyVOg6Qo/vaWr3D7jfY00
	/PWLP3QsZsLa0UTkCl/6bN2DThFi6WnFl0zyQVkBI7Dtfsm5hobKvHjnpNe0RLBv76U2sbbb/5C/j
	nNDvGPfwkZcwypoSUs6ZXJG5SJ14xnoVr9i6z8XJzOEktZzrSC0VRhvem8RHHdAeOwHw+juW43tao
	Vc6S7pQwRTdh14skij1skhyW4nXZjlxirRpRVZx01kT/6hxhRm5wWw9NUdHs0eUhuS9NQ+0DEr+UB
	WeJSJYlGaOXFDOtyXM5mdZ4Fw7AHvQEe0G8vphcFTxUDY0KwHIJ8IrMwGtrGIksuHGBqzsaZCiYCc
	MNV9fQMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x78rU-0000000B3CC-1wvf;
	Thu, 17 Sep 2026 09:57:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x78rS-0000000B3Bf-0Dsa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 09:56:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 64CA61476;
	Thu, 17 Sep 2026 02:56:53 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2D5AB3F7B4;
	Thu, 17 Sep 2026 02:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789639017; bh=MystT138xR+WElV4qva3izvJ/ENfjI4PQpKKdQVx3Oc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UrIEyXDbpHvb5imXK3xXbqGf5/C6i3JpVnVkFA+MtaiCw5mMgwu8X4D2s4knT/I/m
	 8Vwg8qziKHCebU+u33vXQ8N08svoxwaD7gtz9TagLvJ9oqoHpIMUS7+D8VzxO5+twu
	 Xdhx6ch6nqtHlax2kAvi9DKw0cVUiVRWuJL84ByM=
Date: Thu, 17 Sep 2026 10:56:52 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v11 7/7] coco: guest: arm64: Replace dummy CCA device
 with sysfs ABI
Message-ID: <aqu5ZI6433cV2PDy@arm.com>
References: <20260914060511.277948-1-aneesh.kumar@kernel.org>
 <20260914060511.277948-8-aneesh.kumar@kernel.org>
 <aqp2DRInEhzpEqAc@arm.com>
 <yq5ald911e4o.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5ald911e4o.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_025658_294702_ED0326D2 
X-CRM114-Status: GOOD (  25.27  )
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

On Wed, Sep 16, 2026 at 07:39:59PM +0530, Aneesh Kumar K.V wrote:
> Catalin Marinas <catalin.marinas@arm.com> writes:
> > On Mon, Sep 14, 2026 at 11:35:11AM +0530, Aneesh Kumar K.V (Arm) wrote:
> >> diff --git a/Documentation/ABI/testing/sysfs-firmware-cca b/Documentation/ABI/testing/sysfs-firmware-cca
> >> new file mode 100644
> >> index 000000000000..bf177d636b92
> >> --- /dev/null
> >> +++ b/Documentation/ABI/testing/sysfs-firmware-cca
> >> @@ -0,0 +1,10 @@
> >> +What:		/sys/firmware/cca/realm_guest
> >> +Date:		May 2026
> >> +Contact:	Linux ARM Kernel Mailing list <linux-arm-kernel@lists.infradead.org>
> >> +Description:	Read-only. Indicates whether the kernel is running as an
> >> +		Arm Confidential Compute Architecture (CCA) Realm guest.
> >> +
> >> +		The value is one of:
> >> +
> >> +		0: the kernel is not running as a Realm guest
> >> +		1: the kernel is running as a Realm guest
> >
> > Does this file ever read as 0? It is created only if rsi_present and
> > always reads as 1. That's fine by me but we shouldn't document 0 as a
> > value. More like if present, it always reads 1 and RSI is present.
> >
> 
> For now, that is correct. However, the two checks could diverge if Realm
> guest support is enabled only after additional checks, such as version
> compatibility.
> 
> In that case, is_realm_world() and static_branch_unlikely(&rsi_present)
> could return different results.

They can indeed diverge in either direction but would we ever end up
reporting 0? I also think we should gate realm_sysfs_init() on
is_realm_world() rather than rsi_present. I know it's the same at the
moment but it would read better if we just did:

	if (!is_realm_world())
		return 0;

and realm_guest_show() just return 1.

The file description could be (without any values 0 or 1):

Description:  Read-only. Present only when the kernel is running as an
              Arm Confidential Compute Architecture (CCA) Realm guest, in
              which case it reads 1. If the file does not exist, the kernel
              is not running as a Realm guest.

or something along these lines, no description of value 0 (well, you
could say if "if the file does not exist or reads 0..." but only if we
envisage a use-case for this.

-- 
Catalin

