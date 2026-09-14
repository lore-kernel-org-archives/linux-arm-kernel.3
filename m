Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91A15C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 14:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xu1OqGjYQFT3tRonu33NS+Q4PI4gNinLU6l0BcDOq4Y=; b=iA3ZmBymGDgPzyXdbiID+nL7Rk
	uy8WkjhP1y9wnGsOr/MYrf6IPyRvY1/tPPZ35KoyOdOngS8Woy8ASFz5ksx9mc9UjxUsv8KbN85/d
	XMAXkfId5at4ykQSBTfC1qwQe64unyWbIU4LRkR0k6Yx00UQ/392ycdo1S/bXevLmte08uGLRo+DA
	2lbmfdJpjiS8YlSQcpzDIgyk+e3gYWugU5D2pUbTPtWLqhG1ZdjrbnSzbvIhps6N8qZhcLoyvT3CS
	ROSMlRXC4Drq+heDdc7VdZhWokpm9+CMJ+Tzotj71NIdYWCEGxc7Yv+PSGsjEdT9XsjkxYuju/zKP
	atWJ0Ixg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x681M-00000004270-0MF3;
	Mon, 14 Sep 2026 14:51:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x681J-00000004269-0pLV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 14:50:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ED021153B;
	Mon, 14 Sep 2026 07:50:51 -0700 (PDT)
Received: from [10.0.128.139] (unknown [10.0.128.139])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 646E33F9A2;
	Mon, 14 Sep 2026 07:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789397455; bh=fDxs3RSMgLMHYM2xJnti/dp16e+QGBfMd1fd6wVbCsM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Fq7v4RIBTyW6Flh4cvLImhdyoMuZXe+QwP6fHOBIcZXAcK1B74ZfU928xjBU/apV0
	 Y3AHQ1ZplqMPJqRTc8XUo+GxwnDEjFAJFtUG57N1UJHTV3vK30CYEyJCXP1QZKc9zz
	 k1RPSf9O1PwTqyptUlSYNVa34PEihESyl2auRgKU=
Message-ID: <db219147-e2b5-43ce-9e14-a01ca65c52c7@arm.com>
Date: Mon, 14 Sep 2026 15:50:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 4/7] arm64: realm: Move Realm memory encryption ops to
 RSI code
Content-Language: en-GB
To: Catalin Marinas <catalin.marinas@arm.com>,
 "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
 Greg KH <gregkh@linuxfoundation.org>, Jeremy Linton <jeremy.linton@arm.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Will Deacon <will@kernel.org>, Steven Price <steven.price@arm.com>,
 Andre Przywara <andre.przywara@arm.com>
References: <20260914060511.277948-1-aneesh.kumar@kernel.org>
 <20260914060511.277948-5-aneesh.kumar@kernel.org> <aqf0lyf6dQRc4eDR@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <aqf0lyf6dQRc4eDR@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_075057_286084_49F8C106 
X-CRM114-Status: GOOD (  10.18  )
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

On 14/09/2026 14:20, Catalin Marinas wrote:
> On Mon, Sep 14, 2026 at 11:35:08AM +0530, Aneesh Kumar K.V (Arm) wrote:
>> Realm memory encryption callbacks are CCA-specific. Keep the Realm callback
>> registration with the RSI initialization code instead of pageattr.c, which
>> only needs to provide the low-level page-attribute transition helper.
>>
>> Export __set_memory_enc_dec() within arm64 so the RSI code can wrap it with
>> the Realm-specific encrypt/decrypt callbacks and warning policy.
> 
> Suzuki commented on v9 I think not to expose this function but I don't
> see a nice way around since we now moved the realm_crypt_ops out of
> pageattr.c (so we'd have to export something out of that file).

Yep, you are right. Thats the conclusion we reached to.

> 
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

Thanks
Suzuki


