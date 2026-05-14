Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B27FCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 17:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t6NBCCHPcRlz/X1sbSdp5SPdTzKxR1F4eIZOxXUh7u4=; b=2mi7KLh/g23Vux5ISxnA27HbYb
	S8/0vv9oftjQYALci8E1xIoQ/YupqSCEN5Be7o3A8JuHoL+AOltaFvviIMpxs9Lgkhe8jDc5U/8BX
	ERIqUWE6FOsbDUTrtm53QH5Pp1IC/MrgNLEWzFXBhoPI7mUmEflzoIy0o4IT00EzEJoN/xquE+h/y
	Xuyvf6w2I5iBtPRN7Tq6H1/UMygVMq6c1nvvtOL/Mf2DhPfnylfyeygX5HDC2b2vOlUhMyAq9/+QO
	QY81OGi2BFkYmFUAb/qUkWuWt3m9rtjqygD44cix7bCyrCX5C2AnwXuICzCIIYd1AddQr+0aNpgTr
	VjtBi40w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNZZk-00000006AGH-42WQ;
	Thu, 14 May 2026 17:10:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNZZi-00000006AFA-3Hld
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 17:10:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A320D25DE;
	Thu, 14 May 2026 10:10:11 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DC6C63F836;
	Thu, 14 May 2026 10:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778778616; bh=QIcPCYJhXPs7IX6f0RotHqQm1SVDBkwqA4iJRWyzoSw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rylaXg6T4uAIfiR56zy6O5kwO5eSAcqXi3RA1utMgYam8saAff4YcZFSiSdBoDE6j
	 JHybvRSTp8NUjMkGcHL6uOPDNxE4hjMiszHM7uLsJoXHJ7PesrwH8dm53f9Tl1k6tp
	 R2o33YfHX2KIG3I+fGGySHH6BPvrIFNw1WiGhFbY=
Date: Thu, 14 May 2026 18:10:09 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v5 1/3] firmware: smccc: coco: Manage arm-smccc platform
 device and CCA auxiliary drivers
Message-ID: <agYB8SZUlfXpjkgF@arm.com>
References: <20260514094030.42495-1-aneesh.kumar@kernel.org>
 <20260514094030.42495-2-aneesh.kumar@kernel.org>
 <0c88bcee-65b5-4328-87e6-e1c714c3d1ca@arm.com>
 <2026051420-amusement-drove-73e6@gregkh>
 <agXL12bNh4gGyK1K@arm.com>
 <yq5ajyt65a5y.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5ajyt65a5y.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_101018_862026_EC56BBF1 
X-CRM114-Status: GOOD (  21.33  )
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

On Thu, May 14, 2026 at 08:08:01PM +0530, Aneesh Kumar K.V wrote:
> Catalin Marinas <catalin.marinas@arm.com> writes:
> > On Thu, May 14, 2026 at 02:55:48PM +0200, Greg Kroah-Hartman wrote:
> >> On Thu, May 14, 2026 at 12:04:13PM +0100, Suzuki K Poulose wrote:
> >> > On 14/05/2026 10:40, Aneesh Kumar K.V (Arm) wrote:
> >> > > Make the SMCCC driver responsible for registering the arm-smccc platform
> >> > > device and after confirming the relevant SMCCC function IDs, create
> >> > > the arm_cca_guest auxiliary device.
> >> > > 
> >> > 
> >> > There are a few changes squashed in to this patch. Please could we
> >> > split the patch in the following order ?
> >> > 
> >> > 1. Add platform device for arm-smccc
> >> 
> >> Do not make any more "fake" platform devices please.
> >> 
> >> > 2. Move TRNG to Auxilliary Device - (Even though it is a later patch, move
> >> > it before the RSI changes)
> >> 
> >> No, move it to the faux api please.
> >
> > So should we end up with:
> >
> >   /sys/devices/faux/arm-smccc/
> >     smccc_trng/
> >     arm-rsi-dev/
> >       tsm/tsm0
> >
> >   /sys/class/tsm/tsm0
> >     -> ../../devices/faux/arm-smccc/arm-rsi-dev/tsm/tsm0
> >
> >   /sys/firmware/cca/
> >     realm_guest
> 
> But we need the ability to autoload different TSM backend drivers based
> on the support/availability of these SMCCC function-id ranges. faux
> device don't support that.

It breaks this but can we not have some systemd rule that checks
/sys/firmware/cca/realm_guest and modprobes arm_cca_guest?

Alternatively, we could do a request_module("arm_cca_guest") if
RSI is available when we check it in smccc_devices_init(). Or make it
even fancier with a request_module("arm-smccc-service-...") (some ID
range while arm-cca-guest.c has a corresponding MODULE_ALIAS() for that
SMCCC range.

-- 
Catalin

