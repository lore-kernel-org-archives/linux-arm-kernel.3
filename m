Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 415C6C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 08:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZGjrYtBK4Zg+yzb3uvAueO3dnuVX9W9iegXNBKP+x44=; b=D3ZpBHOKwjm1IGPEZnvU1ls50r
	Ha8n1sde86FkgG2/2EejZKA+BSjhTTSz2igzUQvI43MuRuwRcI68uCCMedxD8LtWv1Y+PkLlXFeTm
	hBp3wYDLa4nWfK4Hf0QXfq2o3b9ZNIA1aHVyxHN/jm258XFBDQYPMAprsleOEocjGc+KGYVzvaQtl
	bunqAtS8yOrIz7TOSkE9yoNPQWXIBV0S/QQfkX+9kbNv903foOqpjlyDQahEI66okwWH/RLgTb0vX
	UWxoYDaji1fYRgL0wO+nryAnRNJd0OyERLxKKj6SZjP9tze2WyyibuqaZxEZ74JIb4M8xJD93Ne6H
	04t6qdLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Zec-00000001O32-06Zr;
	Mon, 21 Sep 2026 08:45:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ZeZ-00000001O2Q-3evh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 08:45:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 73804175A;
	Mon, 21 Sep 2026 01:45:31 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0B1333F86C;
	Mon, 21 Sep 2026 01:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789980334; bh=S79PLM7OFJBvhVWmeCH8T7TgIzhYa8hIStDMR5Puddg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I7zoLa2/77OP0m2cDnZ1NU+cNWgCHAC37cl9S1wyRItEP8OQfUqWtyR7V7dLGQQsZ
	 puXncDq/Bhf+H+m2/WCrWsRgdXdh9X7otp2gOSW9g51cArK3sezDGqFrHHbEDFv83S
	 LrkoSzoO5XZvq9nQ0MRX0W+NtR6xZ1VrAcc9Dq10=
Date: Mon, 21 Sep 2026 09:45:30 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
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
	Andre Przywara <andre.przywara@arm.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Subject: Re: [PATCH v12 2/7] firmware: hwrng: arm_smccc_trng: Register as an
 SMCCC device
Message-ID: <arDuqtfrRcBmWRic@arm.com>
References: <20260921053807.354802-1-aneesh.kumar@kernel.org>
 <20260921053807.354802-3-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921053807.354802-3-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_014535_947404_D83A3882 
X-CRM114-Status: GOOD (  14.79  )
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

On Mon, Sep 21, 2026 at 11:08:02AM +0530, Aneesh Kumar K.V (Arm) wrote:
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
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Tested-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  arch/arm/include/asm/archrandom.h       |  2 +-
>  arch/arm64/include/asm/archrandom.h     |  2 +-
>  drivers/char/hw_random/arm_smccc_trng.c | 32 ++++++++-----
>  drivers/firmware/smccc/smccc.c          | 62 +++++++++++++++++++++----
>  4 files changed, 76 insertions(+), 22 deletions(-)

I asked you two times already to cc the hw_random maintainers. Not
adding them again but not merging this stuff without their ack either.
So, up to you.

-- 
Catalin

