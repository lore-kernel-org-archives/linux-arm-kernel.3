Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F9F5C02196
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 15:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7cXNqLxMlULBvs/VEbdMrugBVf2tfrg1LcLQRcSc95s=; b=YX2k+NlBHB7bZOAZ3R+Oe+lFOU
	86OWIz5xzFltV04qiDthpoI3UGW9P1ABhlF2RkFRf2avRkD4SerWI1UT8lWjsH6IrWl81AeY5nMjX
	6eLcdeAkyQ+/A+H8tmDawljmNpdu4N0D77IVSRhBP2eQDMyqArciPXmDUnwgP2+SVxFUWPqTidknd
	R1+63lXyiP86MIXElxlkyng43aHIm0uNSr3XflHYmbsO1fnMBoJMqDsxejV1uWqKDB8a3BX1WDBsV
	QTYujNdf4lQJnX2M5H1eTFX5fis6tgJh34SZXYNVyhKNP5X9xD4bt8jSjBmO7Hr6ZqAos86l+Pe5X
	sDoBhzYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfKYd-00000000lwk-01Fz;
	Tue, 04 Feb 2025 15:09:47 +0000
Received: from out-174.mta1.migadu.com ([95.215.58.174])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfKXG-00000000lgn-2seF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 15:08:25 +0000
Date: Tue, 4 Feb 2025 07:08:11 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738681698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7cXNqLxMlULBvs/VEbdMrugBVf2tfrg1LcLQRcSc95s=;
	b=wTlPobc2RG3aLZEY6tCJL0R/bQ5JLhm7Ph9lBuwv52CZlBP3GSiDpoNP2EzbXuEiZXUSOW
	DwGvZFQ2YZBLuCnTrSKAaCm/6tGx0EIsYR555/Y4VL3ZysiAaAuoUUyWAapyp7uXDWSn+D
	uG3eqvES0nyUKDyro+KvOfkxuCkpzhM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Wei-Lin Chang <r09922117@csie.ntu.edu.tw>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Dmytro Terletskyi <Dmytro_Terletskyi@epam.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH v2 0/3] KVM/arm64: timer fixes for 6.14
Message-ID: <Z6ItW1ziOWy7LsMc@linux.dev>
References: <20250204110050.150560-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204110050.150560-1-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_070823_866999_F9557CAC 
X-CRM114-Status: GOOD (  11.78  )
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

On Tue, Feb 04, 2025 at 11:00:47AM +0000, Marc Zyngier wrote:
> It's been recently pointed out that the NV timer code that is
> (hopefully) on its way upstream is marginally sub-optimal (read:
> terminally broken). This short series attempts to fix things:
> 
> - Correctly arm a background timer in all situations
> 
> - Avoid corrupting the EL2 state by shoving the EL1 state into it, and
>   simplify the handling of emulated timers
> 
> - Drop the weird HV timer offset dance dance on E2H switch that never
>   happens and make HV timer correctly UNDEF on E2H==0.
> 
> Thanks to Volodymyr Babchuk and Wei-Lin Chang for their help.
> 
> Patches on top of kvmarm/fixes, and merged back on top of my
> kvm-arm64/nv-next branch.

Reviewed-by: Oliver Upton <oliver.upton@linux.dev>

-- 
Thanks,
Oliver

