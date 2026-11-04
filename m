Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B011606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 11:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qJTg3Dbl;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=FmETS+WD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XZJjulc9eC2Fef615j91pRgqzgY9in4xbBQCdTQZsjs=; b=qJTg3DblKo1GtD
	DYtI+t4ZV2eFq8vs+aZRqf17cqb0UWpRU1C1qP+Phplwle10HHDQn50y0o0Nd+02Wr4pQVJ1PRve6
	gy8w5S4Yl4+BJ/BZFaYZIMVkTaYXrebBVLxf3+hj5eBMm/srA+ahL0I/zXMckebPJcG2ui+rTO0lW
	5zk3pMEx7j4ywTNP303oMMTZAeERL0hDymLCLvRJKMTc4WLspR1Tsuo1bKC6jEVYQwO9IAWHBhT3h
	/unr3hzb2OUEASo+qpXe45RPFUrRArlYU0a9f9FJHoC/fqiWO28xhL82DqzBimA/A63aSRcrGLJE9
	bja9wJ1uXSwFiSiB5n2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOZ1L-0000000589f-0fts;
	Wed, 04 Nov 2026 11:19:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOZ1I-0000000589G-3aim
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 11:19:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C362B1576;
	Wed,  4 Nov 2026 03:19:03 -0800 (PST)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CE4FE3F632;
	Wed,  4 Nov 2026 03:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793791146; bh=+Gg1IlVsuPqoi6TzyejboQL7M1kxWf7eEKSdkYy3a5s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FmETS+WDer/mEeQGarSpt9aR/XDxHyIfvyFacEqy3082LqIMho+elaQYjK8R593Cz
	 vOpawPRQjb5wVQRnlV2ln2h8xIONCSwXdJCiBIXOF1tMYtEej+58eMz8h/UhCO7kOE
	 IYIdz81lAl6tw1nsIzkZyG6iyBKSI6TlRNukN06U=
Message-ID: <33d55cde-9dc1-4d61-8053-f1c1a2e95179@arm.com>
Date: Wed, 4 Nov 2026 11:19:04 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: cacheinfo: Simplify init_cache_level()
To: Thorsten Blum <blum@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261104083632.65715-2-blum@kernel.org>
 <0534c6f4-3bb8-4249-816c-502cf8ccb287@arm.com> <ausSAhn0qRagNcrz@kernel.org>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <ausSAhn0qRagNcrz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_031908_945629_840F139F 
X-CRM114-Status: GOOD (  16.61  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Thorsten,

On 04/11/2026 11:07, Thorsten Blum wrote:
> Hi Ben,
> 
> On Wed, Nov 04, 2026 at 10:32:58AM +0000, Ben Horgan wrote:
>> Hi Thorsten,
>>
>> On 04/11/2026 08:36, Thorsten Blum wrote:
>>> acpi_get_cache_info() already sets fw_level to 0 on failure, so drop the
>>> redundant check and the manual assignment.
>>
>> This doesn't seem to be the case when CONFIG_ACPI_PPTT is not defined. Can the dummy implementation
>> in include/linux/cacheinfo.h be called from init_cache_level()? For the implementation in
> 
> On arm64, ACPI_PPTT is selected when ACPI is enabled. When ACPI is
> disabled, acpi_disabled = 1 and init_cache_level() won't call the stub.

Ok, that's true.

> 
>> drivers/acpi/pptt.c levels is documented as "Number of levels if success." and so would be good to
>> mention what happens in the error case if it needs to be relied on.
> 
> Below the parameter descriptions, it already says:
> 
>   "Errors caused by lack of a PPTT table, or otherwise, return 0
>    indicating we didn't find any cache levels."

Ah yes, I should have read on.

Thanks,

Ben

> 
> Thanks,
> Thorsten


