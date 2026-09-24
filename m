Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 569F9C98314
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 12:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BHmbp6LuwAwTPjNUtGfqxu+9wvUItFCwUEQ7i+tbARU=; b=vUNgTR4BFil5youIRr5Jgvz79z
	K+2yb0a4wtFjj3ma9W/J1zf15OTx4J/onkStG+VYWo39DNPh7HoMGAdW/bRpCJhrAGagDADXdc6ni
	X0Tfkyp9FbPJIUPw2axMVdnYFyeOuORuLMmtlZbQNLPIgs92+NcB4NEYNXDzUtU4sLNKeTbCxzjma
	hRkFQcpsstjMq8NFwdrzXS8O8Xh0XuTATUwkEMqonmt5z1vf6bp3B1MIXF/TZZiwMAVu5YZjHcxZ2
	WL5OeNYrFziFFvoqjZWPud+M920IKxlkYnCbKrcGj4z2y4aoK+JN+DWh7oSeSTaGpDc7o1EhcM7C+
	Qm6XqAjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9iVB-0000000AyF2-1GaU;
	Thu, 24 Sep 2026 12:24:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9iVA-0000000AyEf-1vIV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 12:24:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E523F43C36;
	Thu, 24 Sep 2026 12:24:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77C2D1F000FF;
	Thu, 24 Sep 2026 12:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790252675;
	bh=BHmbp6LuwAwTPjNUtGfqxu+9wvUItFCwUEQ7i+tbARU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=I8Tw7qvKc3yKWkGEDuFrd0+CwiKanTeJPq0VvAsi8ZIrm/3/QqMwvhQzYoU2rMBnJ
	 kQcdT22h0tmLmcW9493F1QEwJWTZ6rMwfQvuSITjJ2W7GSu+Z4QyGlNNP8P3Hfhjvk
	 nsgusBQqUQaNKNV+PqQNbRSSC0KzmbBczR/J60etFZunQ4IY+jbBwz5CRil0l3EbLA
	 m+kkO3kmDwjO5GerIezK9/RjppbaNivGcns1D0dTWGmb+Zm2GTO9fCrdVaA9tYo8y6
	 2C7TPIeMterKjpQMWrIaKwJGFyKyA8b1IByUQLc6BwRXQyjjpIh6/Gae0emTAuccBQ
	 KLBlJXQA6KxQg==
Date: Thu, 24 Sep 2026 13:24:31 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v11 6/7] firmware: smccc: arm-cca-guest: Bind the TSM
 provider to an SMCCC device
Message-ID: <20260924-bustard-of-stimulating-promotion-2e6d7c@sudeepholla>
References: <20260914060511.277948-1-aneesh.kumar@kernel.org>
 <20260914060511.277948-7-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914060511.277948-7-aneesh.kumar@kernel.org>
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

On Mon, Sep 14, 2026 at 11:35:10AM +0530, Aneesh Kumar K.V (Arm) wrote:
> The Arm CCA guest TSM provider currently binds through the arm-cca-dev
> platform device. Like arm-smccc-trng, this device is not an independent
> platform resource; it is a software representation of the RSI firmware
> service discovered through SMCCC.
> 
> Move RSI discovery into the SMCCC firmware driver. When the SMCCC conduit
> is SMC and if RSI ABI version call is supported, create an arm-rsi-dev
> SMCCC device. Convert the Arm CCA guest TSM provider to an SMCCC driver so
> it binds to that discovered RSI service and keeps module autoloading
> through the SMCCC device id table.
> 
> Keep the old arm-cca-dev platform-device registration for now. Userspace
> has used that device as a Realm-guest indicator, so removing it is left to
> a follow-up patch that adds a replacement sysfs ABI.
> 
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---

[...]

>  drivers/firmware/smccc/smccc.c          |  6 ++++

Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>

-- 
Regards,
Sudeep

