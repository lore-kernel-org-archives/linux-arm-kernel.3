Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 927E8C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Aug 2026 05:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dkQIWOOSi9dZ5y0ttPxRnwaYK9TXWapOZX1UUbuCJaA=; b=cscjNJNhpOgPfnKBF2atf5Gvly
	6TpslZfZyfri31NwxLNfhUn74sTJ0uLODATBF27QWO0l9kG/anmq6Dtjr35PA58h1n90OARUpRisY
	PeKJ0VpnMkCZeCKWxGVv9W4FnS8vEd9D+F6b2tpJfDLpbsrcmFmbd0y6wEvxadGqSFLIAmE8/qZ3Q
	5TcW+P5FEakx4RysdIdbG27YEXn5alpQdw6JNjLPWPnywndMBFj3IHvvamHZtC+eqdgV1rYwrTYKJ
	Z+O7fx215Ef5g2PLc1ptrrcFdpUgjbL5ZEd/KHVK1pqWEBmR7gwRF3aEuPnXJTtMGp6jqClCTtkiH
	Pq/oEQaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0C5F-00000006lOZ-2NHz;
	Sat, 29 Aug 2026 05:58:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0C5E-00000006lOT-2wnr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Aug 2026 05:58:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 73BA843CB0;
	Sat, 29 Aug 2026 05:58:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AB491F000E9;
	Sat, 29 Aug 2026 05:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787983108;
	bh=dkQIWOOSi9dZ5y0ttPxRnwaYK9TXWapOZX1UUbuCJaA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=P6DfBeoRGodPEVPTGXHpQLPo5+qSYlVpvByt0WAmHDa7xGmzwW8XdijVdUaKpisvR
	 BtpDH+snGhdGV7Dnq8/py0ERpsoWERnBogLU2PZAfjyAs1v+MYwYt8aCPkl+DmQfGr
	 YMYu1esguiJNg0/0AUc1/LxqA8Nzfi/zFq7gIoJA2phUcMfYQEGQ19+5aa4YOsmYA/
	 Pr21jz/qYDkOhgQQ/5o/EFMk1RLXK8bx0xHc2iIImp69sJRZ1eGAyGJowbi2VUoaje
	 jXXIIhY+opLNsBol1mq6HpDVHJ09Kg2o17Oi5R+/kZ0mGQpOksDbtoaX1L5NleXqQD
	 N1HiWIU4/ZDpQ==
X-Mailer: emacs 31.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v9 3/7] firmware: arm_rmm: Move RSI support out of
 arch/arm64
In-Reply-To: <178794567779.4159892.7755943757427570192.b4-review@b4>
References: <20260805063255.1638614-1-aneesh.kumar@kernel.org>
 <20260805063255.1638614-4-aneesh.kumar@kernel.org>
 <178794567779.4159892.7755943757427570192.b4-review@b4>
Date: Sat, 29 Aug 2026 11:28:19 +0530
Message-ID: <yq5aqzjhtqmc.fsf@kernel.org>
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

Jason Gunthorpe <jgg@nvidia.com> writes:

>> The RSI SMCCC function IDs describe a firmware ABI and are not arm64
>> architecture specific definitions. Follow-up changes need to use them from
>> non-arch code, including drivers/firmware/smccc and the Arm CCA guest
>> driver.
>> 
>> Move the complete Realm Service Interface (RSI) implementation from
>> arch/arm64 to drivers/firmware/arm_rmm. The RSI SMCCC definitions and
>> command helpers are also moved to include/linux so they can be shared by
>> architecture code and firmware or driver code. This also keeps the
>> firmware interface outside architecture code, as requested [1].
>> 
>> [1] https://lore.kernel.org/all/agsNO9cc7H-b0H8L@willie-the-truck
>> 
>> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
>
> The sashiko remarks don't look useful
>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
>
>> [ ... 321 lines skipped ... ]
>> -#include <asm/rsi_smc.h>
>> +#define RSI_PDEV_NAME "arm-cca-dev"
>
> This name shows up on the smccc bus as a device, '-dev' doesn't seem
> to make sense as a device name to me, I'd drop it.
>

I will drop the -dev from the name. The final name is "arm-rsi"

>
> And is this arm-cca or should it be called arm-rsi with a different SMCC device for
> arm-rmi ?
>

We do that in patch 6. This patch deals with only code movement.

+++ b/include/linux/arm-smccc-rsi.h
@@ -8,6 +8,8 @@

 #include <linux/arm-smccc.h>

+#define RSI_DEV_NAME "arm-rsi-dev"
+

-aneesh

