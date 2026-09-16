Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CADE9C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 14:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9wkSkC3ghOPH7GbBKWRGiMYDHI1khZ1B7DAF4kPwM+Y=; b=Lp7Vb6cvjojPKvTlz94+361DT+
	kuH9xBjZdh+TyyQyVROZ0V+u500JMnGj1RfE4lEkAeLQerfWWFrg4FqAY88RrRaoBu6/T5OCpAT5n
	pmoECJ1LuVyE10Rh6NNWVVGJ4Vxk9kdGl/JOyBIHeLoZAdB9nXcsizAoBCwxfZea0IR6gW2GpZXLu
	FJtz1r6/FsWww+iWRIbYYgkAU+pWUvdMb33eVg+ACsz8AFkGT2k6xWNEMl9viyXUhfXoxAqkVIKqb
	P25QjZZbfcvX9TwY0ZrKzfsecyFk+ZXLSKqd5upOFtd5LMfcb5RUGOPyvbdD4aiy3jJBL4pNDH2aD
	P600YRnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6qKx-00000009N3n-3zcP;
	Wed, 16 Sep 2026 14:10:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6qKv-00000009N3K-3DlG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 14:10:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3A509406AC;
	Wed, 16 Sep 2026 14:10:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEC8D1F00899;
	Wed, 16 Sep 2026 14:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789567809;
	bh=9wkSkC3ghOPH7GbBKWRGiMYDHI1khZ1B7DAF4kPwM+Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=C5z2dP/s3qv/3Cdw4aENJeNEDMCznZMWR6yD4F70/z77sFaVzAYu6gL4DaE/I4Ab4
	 Fd8XrSowrTOxKVo1DQEgDfK1154oCdFWuars9hJY5LUiMsIvTGXe/4tzcLwf/Tfgtc
	 jEo942aygEPooDXWirDAtNGgUX+nYSMcdSDvme4G5wGKj/tUOlqS9Qp9cKICaFAkpI
	 BvVcCi8toeL4FmwJklDNGpuRypSaZfLrzNAH0FVoKfewx7rUTVguQ+ejAJMTWxoOMx
	 EJ7gnYJwrGjmKCJq59UQlAg43Wtn6bdAOGBPXz7kU3vipgB+YGbUA+9QA2m1iwSHeF
	 tKU9ynqkCWJ5w==
X-Mailer: emacs 31.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
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
Subject: Re: [PATCH v11 7/7] coco: guest: arm64: Replace dummy CCA device
 with sysfs ABI
In-Reply-To: <aqp2DRInEhzpEqAc@arm.com>
References: <20260914060511.277948-1-aneesh.kumar@kernel.org>
 <20260914060511.277948-8-aneesh.kumar@kernel.org>
 <aqp2DRInEhzpEqAc@arm.com>
Date: Wed, 16 Sep 2026 19:39:59 +0530
Message-ID: <yq5ald911e4o.fsf@kernel.org>
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

> On Mon, Sep 14, 2026 at 11:35:11AM +0530, Aneesh Kumar K.V (Arm) wrote:
>> diff --git a/Documentation/ABI/testing/sysfs-firmware-cca b/Documentation/ABI/testing/sysfs-firmware-cca
>> new file mode 100644
>> index 000000000000..bf177d636b92
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-firmware-cca
>> @@ -0,0 +1,10 @@
>> +What:		/sys/firmware/cca/realm_guest
>> +Date:		May 2026
>> +Contact:	Linux ARM Kernel Mailing list <linux-arm-kernel@lists.infradead.org>
>> +Description:	Read-only. Indicates whether the kernel is running as an
>> +		Arm Confidential Compute Architecture (CCA) Realm guest.
>> +
>> +		The value is one of:
>> +
>> +		0: the kernel is not running as a Realm guest
>> +		1: the kernel is running as a Realm guest
>
> Does this file ever read as 0? It is created only if rsi_present and
> always reads as 1. That's fine by me but we shouldn't document 0 as a
> value. More like if present, it always reads 1 and RSI is present.
>

For now, that is correct. However, the two checks could diverge if Realm
guest support is enabled only after additional checks, such as version
compatibility.

In that case, is_realm_world() and static_branch_unlikely(&rsi_present)
could return different results.

I assume that any error when reading the file, including -ENOENT, can be
treated as indicating that the kernel is not running as a Realm guest.
Do we need to document that?

-aneesh

