Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65400CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 14:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vUSDGwFx8GjuzFZSNmRfiS8rW9ICWG/BuiJX+xX0EEY=; b=IN/rF6Vr4xnpR14Njp8yh6b2qS
	hh6Gy+DBp+qhowNs837EniSalncZIBUZz4bdkZUV9xHe0soMlHQSyCERrxfqJO2LIQVtqSiL/F9N2
	YRHF616xKVbBLvs+sThjn/+XRliBjMrQEUeuUo90K1wQljx5VCYRk9TnXHh6mfUCOkTByxM9C+KEa
	h4QZPlRJlqKO9ndZCEIK0TK16O5Tyc7KcKGTGIYVKoRx07phNXCcJygYQ0iRHAGFi/JP6UStbzIhN
	lfagybYPO2i3XTbiZMwQ/dfQGksiODSZHzqnvn3ikIqMgTocK3x62TajWtaWv1ALdt+odTRQDfQTd
	Cz1jkRFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNXCV-00000005l6H-2Ahi;
	Thu, 14 May 2026 14:38:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNXCU-00000005l5v-2ezD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 14:38:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1C3B360138;
	Thu, 14 May 2026 14:38:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CF01C2BCC7;
	Thu, 14 May 2026 14:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778769489;
	bh=giklq2u3G/coCjwWJANCaOkNdgcmN7tUkMYzKD51xjA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=HLgFu0eXNAR4VlrKviHPiWfQ2GDi2CP/VDJPi0+x7WYNnpewyq7YcpR+opdnSnVV0
	 78NMFICDvV9OIFbAKCTJUTA5nYtzug72zZGCTlY+t/ha1EyIZZ0uF+fNimWpfokpYw
	 eLHcnJrQbEbkpIYkelEAmWuccP9Yb+gqcNKt8Kf+3jAB25ai3sHVvTboNb6S24gW32
	 wRjgDaBcyLWuczmEQiwzW/fyQKlz9M2XeNKDngiDGVKNyXPvN2P6s+tXvpm58XRTNn
	 vlPBlfoAMpQErC5xcuyLODoM06RUdBEZcm+Q1WzAraTiwrM/6PUU0+OQ8F5qJNs83t
	 AqqBjeezB5zSQ==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v5 1/3] firmware: smccc: coco: Manage arm-smccc platform
 device and CCA auxiliary drivers
In-Reply-To: <agXL12bNh4gGyK1K@arm.com>
References: <20260514094030.42495-1-aneesh.kumar@kernel.org>
 <20260514094030.42495-2-aneesh.kumar@kernel.org>
 <0c88bcee-65b5-4328-87e6-e1c714c3d1ca@arm.com>
 <2026051420-amusement-drove-73e6@gregkh> <agXL12bNh4gGyK1K@arm.com>
Date: Thu, 14 May 2026 20:08:01 +0530
Message-ID: <yq5ajyt65a5y.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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

Catalin Marinas <catalin.marinas@arm.com> writes:

> On Thu, May 14, 2026 at 02:55:48PM +0200, Greg Kroah-Hartman wrote:
>> On Thu, May 14, 2026 at 12:04:13PM +0100, Suzuki K Poulose wrote:
>> > On 14/05/2026 10:40, Aneesh Kumar K.V (Arm) wrote:
>> > > Make the SMCCC driver responsible for registering the arm-smccc platform
>> > > device and after confirming the relevant SMCCC function IDs, create
>> > > the arm_cca_guest auxiliary device.
>> > > 
>> > 
>> > There are a few changes squashed in to this patch. Please could we
>> > split the patch in the following order ?
>> > 
>> > 1. Add platform device for arm-smccc
>> 
>> Do not make any more "fake" platform devices please.
>> 
>> > 2. Move TRNG to Auxilliary Device - (Even though it is a later patch, move
>> > it before the RSI changes)
>> 
>> No, move it to the faux api please.
>
> So should we end up with:
>
>   /sys/devices/faux/arm-smccc/
>     smccc_trng/
>     arm-rsi-dev/
>       tsm/tsm0
>
>   /sys/class/tsm/tsm0
>     -> ../../devices/faux/arm-smccc/arm-rsi-dev/tsm/tsm0
>
>   /sys/firmware/cca/
>     realm_guest

But we need the ability to autoload different TSM backend drivers based
on the support/availability of these SMCCC function-id ranges. faux
device don't support that.

-aneesh

