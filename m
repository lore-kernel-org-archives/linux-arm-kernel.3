Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14535C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 08:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UXqUN5fCLyZCbN7uBG3JtTUMvasjG9uxSeitMnaL8+k=; b=XNIcnJARV4gBcUD1YuA42jb+IA
	Zy98T6ArbUBSteO0/2cY+1DHT0YcHfC7uFoWBMsPXWqFIZmsdxDH/SfCmEAtI2KUeMtENT5VHOMd+
	pAVWegxqzaZnZo/GWcwpcZj5eQzUrlFAeWurD6Sy2lyKqODV2p11O9koxKvpq9xR0tZ0p9A4zgWHR
	wrdZo9jyZpf6xpVY1rQ+XSQ8EPZ2Xo6jUAPPCfJO9QfdmE65erpuaGE0BR2NNL2c2bwgnRkeexC3m
	H86GL8IVYy3rAGWqXyng7tOddE5/gsaCU4KtAkZnayC3r/ZhTTm90gIn78yNjAB0EHCGXb5o/A14h
	fa4jwz+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whjsG-00000001O5Y-27DW;
	Thu, 09 Jul 2026 08:12:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whjsF-00000001O5O-0BJU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 08:12:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 74AA26001A;
	Thu,  9 Jul 2026 08:12:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4A6B1F00ACA;
	Thu,  9 Jul 2026 08:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783584766;
	bh=UXqUN5fCLyZCbN7uBG3JtTUMvasjG9uxSeitMnaL8+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hrD8WIf3qzu0F+NJBla2ORd0jSfnJE21w4csBd2BoRKkRnlvPYCzn382brDiLHOj6
	 87oqQ616n/DJfrnhSBmlb3oG60ugLTh5j1mzNkHmhY6Z8YJpIQASmRLUWTF7A/IodW
	 8nFE30Vmw2Cvzzswm97tz4XI45zKyEi7OXV1OM/bE5sxo33NSZDycJ2dVfiClRdRAX
	 wUQOovmWzLjGgAMNypKyzT6h0W0oBzDFNcjm6xfSbmI40CLXFMgLPj6X3jo8KsO+vW
	 B4wYjrBOf90XL69uOA4QkbnSax4KvdQ1OWVqiyWUMtlH7+Ah+1F2j0EAHYY3lFIYXc
	 B5PWKjlbCSvtw==
Date: Thu, 9 Jul 2026 09:12:37 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v8 1/6] firmware: smccc: Add an Arm SMCCC bus
Message-ID: <20260708-precise-prudent-firefly-17c1ce@sudeepholla>
References: <20260707081351.1680209-1-aneesh.kumar@kernel.org>
 <20260707081351.1680209-2-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707081351.1680209-2-aneesh.kumar@kernel.org>
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

On Tue, Jul 07, 2026 at 01:43:45PM +0530, Aneesh Kumar K.V (Arm) wrote:
> SMCCC-discovered firmware services are currently represented by separate
> platform devices, such as smccc_trng and arm-cca-dev. Those devices do not
> represent independent DT/ACPI-described platform resources; they are
> features of the SMCCC firmware interface.
> 
> Add an Arm SMCCC bus for services discovered through the SMCCC firmware
> interface. The bus provides SMCCC device and driver registration helpers,
> name-based matching, modalias generation, and a sysfs modalias attribute so
> SMCCC service drivers can bind to discovered firmware services and autoload
> as modules.
> 
> Follow-up changes can then register SMCCC firmware services as arm-smccc
> devices instead of creating independent per-feature platform devices.
> 
> Based on arm_ffa code
>

Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>

-- 
Regards,
Sudeep

