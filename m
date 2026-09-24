Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6025DC98317
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 12:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Z4D6mW0aEnpyPBf4dC7msQIIWgUTmukhQJJUAWvWZk=; b=JZVWlcykiKKN1crSgEIyrAB+Hv
	5d15PU38G5kb6xLIvcFMn0rw8C/QdXuHYO30XwyTnqDwd8/w9k7iNC5ZfM9HGZting5prnMg9Qmph
	Hp4xzLvP0iAiVwbOMHBFTLESojR7MMkp5DMP5BlfYEhuLGSA+fw56D9FCGXosIKjDMKjCZdpS7jTK
	+v3OesY3W+KwWsw5FPh1W2teEu63mEbZ2e9Gne25xcjGeKJIiFQnawW76GYa9wZ8lWA7JHgVgijSP
	YubRI0pCepPZyAV801juk/l8kLwFaIURnd8lovBKbw6JuGsHg4W+VOPqsDIYWqAhXM7xCq4lrYiQt
	lf2UnZOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9iUT-0000000Ay2s-0TQb;
	Thu, 24 Sep 2026 12:23:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9iUR-0000000Ay2F-2UxU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 12:23:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B82EF601EF;
	Thu, 24 Sep 2026 12:23:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 171261F00893;
	Thu, 24 Sep 2026 12:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790252630;
	bh=1Z4D6mW0aEnpyPBf4dC7msQIIWgUTmukhQJJUAWvWZk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HT+0caZLYw8WBs2XyYhJlRZ8XKohmAOA9diHhzvsgaCuEk2h2KGSxkiD/AQ1vjugR
	 a6qjnloAG3cTswYyE8sThczLvua7q5wowko5lNv8yJSksyPs22VT40Jqbtfh3fYoaK
	 EJ83U/33rQf855OqzWaXsaZz7zkdHYU2O3MPClU8UBtT2cMJTg47vB0FQnZJhBsv7h
	 AsiH1EBp+h3eeYWoQKogR/1i6e/K37ncSIXNqFjdTdJuiGTFcvdLwhLzDVyIpw/7y4
	 Lz3KTRPLBcOAE/EVwQjb72l38E4RmwBmcmHm0A26Qb8oKzjloSSEx2FBJU0jzY4Uvv
	 d9plPQ/Bb3r3g==
Date: Thu, 24 Sep 2026 13:23:45 +0100
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
Subject: Re: [PATCH v11 2/7] firmware: hwrng: arm_smccc_trng: Register as an
 SMCCC device
Message-ID: <20260924-optimistic-elusive-bloodhound-a7a93d@sudeepholla>
References: <20260914060511.277948-1-aneesh.kumar@kernel.org>
 <20260914060511.277948-3-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914060511.277948-3-aneesh.kumar@kernel.org>
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

On Mon, Sep 14, 2026 at 11:35:06AM +0530, Aneesh Kumar K.V (Arm) wrote:
> The SMCCC TRNG interface is a firmware-provided SMCCC service rather than a
> standalone platform device. Now that the SMCCC core has an SMCCC bus,
> create an arm-smccc-trng device for the discovered TRNG service and convert
> the hwrng driver to an SMCCC driver.
> 
> The SMCCC id table preserves module autoloading for systems where the TRNG
> driver is built as a module.
> 
> The sysfs device path changes from the old smccc_trng platform-device path
> to an arm-smccc device path. No known userspace dependency on the old path
> was found; a Debian Code Search lookup for the existing platform-device
> name/path did not find any users.
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Tested-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---

[...]

>  drivers/firmware/smccc/smccc.c          | 62 +++++++++++++++++++++----

Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>

-- 
Regards,
Sudeep

