Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C2ED6D220
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 13:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t0gZD58BAbqyaA/YEMGcDBCApArJPWDZA2VgRvtsllg=; b=d32EPezEhVQHpseogztSUv4ckp
	ixWHaM/eEtj7+wuIdvr5Op4iq7flkDYQamQTMJFZDepAwrMuy/VCREItOQiAGBJy6S7ToO/kKTbmb
	Fhl+3uAcLymK5nqpVm/xv5ZdkOP/C2DGAgm518JcHYJHW5B+/UL5w/zXjVoMOTZcXVrysRsHs9h3R
	HtzYW9YFwDElT0IJX4l3BYCbAEMPTKy5Em+n43/fj+/mMEpDURvwI8UbzBrokicSwflmJS0UyFoqB
	w+3xPgEr2lgWbwd3eXCaDlo/Ca7ggPsU3zoOz3EzP6Wm6AjIZ1+D/CRSmd9YRqnpxnFIUw+CwH6K/
	3/lyU04A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWEI0-00000008Yk9-219R;
	Thu, 18 Dec 2025 13:43:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWEHx-00000008YjI-3Zqf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 13:43:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 71BD6FEC;
	Thu, 18 Dec 2025 05:43:19 -0800 (PST)
Received: from e134710.manchester.arm.com (e134710.arm.com [10.33.10.82])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A45493F73F;
	Thu, 18 Dec 2025 05:43:24 -0800 (PST)
From: Ahmed Tiba <ahmed.tiba@arm.com>
To: will@kernel.org
Cc: linux-acpi@vger.kernel.org,
	devicetree@vger.kernel.org,
	tony.luck@intel.com,
	bp@alien8.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org,
	rafael@kernel.org,
	linux-doc@vger.kernel.org,
	Dmitry.Lamerov@arm.com,
	Michael.Zhao2@arm.com,
	Ahmed.Tiba@arm.com
Subject: Re: [PATCH 11/12] ras: add DeviceTree estatus provider driver
Date: Thu, 18 Dec 2025 13:42:47 +0000
Message-ID: <20251218134311.2309421-1-ahmed.tiba@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aUPv5UfBByVoLbRV@willie-the-truck>
References: <aUPv5UfBByVoLbRV@willie-the-truck>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_054329_935513_C47E132A 
X-CRM114-Status: GOOD (  18.19  )
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

On Thu, 18 Dec 2025 12:13:25PM +0000, Will Deacon wrote:
>> Introduce a platform driver that maps the CPER status block described
>> in DeviceTree, feeds it into the estatus core and handles either IRQ- or
>> poll-driven notifications. Arm64 gains a FIX_ESTATUS_IRQ slot so the
>> driver can safely map the shared buffer while copying records.
>>
>> Signed-off-by: Ahmed Tiba <ahmed.tiba@arm.com>
>> ---
>>  MAINTAINERS                     |   1 +
>>  arch/arm64/include/asm/fixmap.h |   5 +
>>  drivers/ras/Kconfig             |  14 ++
>>  drivers/ras/Makefile            |   1 +
>>  drivers/ras/estatus-dt.c        | 318 ++++++++++++++++++++++++++++++++
>>  include/linux/estatus.h         |   3 +-
>>  6 files changed, 341 insertions(+), 1 deletion(-)
>>  create mode 100644 drivers/ras/estatus-dt.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 6b2ef2ddc0c7..5567d5e82053 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -21761,6 +21761,7 @@ RAS ERROR STATUS
>>  M:   Ahmed Tiba <ahmed.tiba@arm.com>
>>  S:   Maintained
>>  F:   Documentation/devicetree/bindings/ras/arm,ras-ffh.yaml
>> +F:   drivers/ras/estatus-dt.c
>>  F:   drivers/firmware/efi/estatus.c
>>  F:   include/linux/estatus.h
>> 
>> diff --git a/arch/arm64/include/asm/fixmap.h b/arch/arm64/include/asm/fixmap.h
>> index 65555284446e..85ffba87bab9 100644
>> --- a/arch/arm64/include/asm/fixmap.h
>> +++ b/arch/arm64/include/asm/fixmap.h
>> @@ -64,6 +64,11 @@ enum fixed_addresses {
>>  #endif
>>  #endif /* CONFIG_ACPI_APEI_GHES */
>> 
>> +#ifdef CONFIG_RAS_ESTATUS_DT
>> +     /* Used for ESTATUS mapping from assorted contexts */
>> +     FIX_ESTATUS_IRQ,
>> +#endif /* CONFIG_RAS_ESTATUS_DT */
>
> Why do we need this in addition to the four existing GHES slots? The DT
> code doesn't use it and I was assuming that the ACPI code would continue
> to use the existing irq; is that not the case?


We still need a dedicated slot when only the DT provider is built.
All four GHES slots are defined as part of the ACPI implementation,
so they are not present in a DT-only configuration.

The estatus core always requests a fixmap index from each provider
before copying a CPER record. As a result, the DT driver must supply
its own slot to return a valid enum value to satisfy the common code.

The ACPI/GHES path continues to use the existing four slots exactly as
before. This change simply ensures that the DT provider does not depend
on ACPI being enabled solely to satisfy the estatus core interface.

Best regards,
Ahmed

