Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F7ECD4F5E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 12:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b1YV0PHZEUtuM/PBOLAnzg9sm0RWsnbqyb1tvz3fxbg=; b=eSZBobRsv9l4SkYfc1ZrbJS9nV
	DkhnRySRBRkHnpSgAZ55Ku/Ryg7K6wSkMC773G3I7WSHktcUzPEPfFzbv5f8Z42Q4hN4VvIOCopNq
	FqfSIGWV+YuBAOLDsCdTWQt84wuURWPu0qKK3NTBqPc0epAEwM/a2SNu7MPs9M2+6V7Sakn9P9HmC
	UdUcZJj0f5fn8N9KSi82Sv2mpoZEijcJgolQQNoC4S75KUMn64ro8geH14KM+sAfD3gDKJOCafJin
	AxY0gyHE0cqyhK8L+LsDSp+4a5CGM6g+RCsV7ynoyRyZbKuMoz4IxFXS5pqXPwQnGovnXLutF3pOx
	m5im1ZcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ25d-00000007fgy-3QDn;
	Thu, 21 May 2026 12:01:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ25b-00000007fgU-2UUr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 12:01:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 336DD35FA;
	Thu, 21 May 2026 05:01:16 -0700 (PDT)
Received: from [10.57.91.210] (unknown [10.57.91.210])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7FF063F7B4;
	Thu, 21 May 2026 05:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779364881; bh=AKox+I3lfcI7F4Zd1m11OMejg4p8pbjFloWjUNceEro=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=inUFKYNuwBXm2ITxleIMuYo8OlLrBV5ZX56ZvsglK23uoBnzOYxGy9jglFtf9Xwj6
	 iaasWDrS0c/gjMrHsajAiSmp3i935puDPddekm5/K2wexEFlnAwtnKpkMjmDCKW98I
	 lha84eQI3hGwv9GYba3f81qwwMQ6qV5LX6zUEQZA=
Message-ID: <c140c0da-4ad7-48ed-ad83-663ada282b14@arm.com>
Date: Thu, 21 May 2026 14:01:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] kselftest/arm64: Add test for atomic futex uaccess
 with POE
To: Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Joey Gouly <joey.gouly@arm.com>,
 Shuah Khan <shuah@kernel.org>, Will Deacon <will@kernel.org>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20260521-poe_futex-v1-0-1da286b8f9b2@arm.com>
 <20260521-poe_futex-v1-2-1da286b8f9b2@arm.com>
 <8fc7713d-6451-4f05-86cd-df833cedd94b@sirena.org.uk>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <8fc7713d-6451-4f05-86cd-df833cedd94b@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_050123_682951_FCDF9347 
X-CRM114-Status: GOOD (  10.23  )
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

On 21/05/2026 13:22, Mark Brown wrote:
> On Thu, May 21, 2026 at 10:42:31AM +0100, Kevin Brodsky wrote:
>
>> Add a new test to ensure that atomic futex uaccess succeeds on
>> memory mapped with a non-default POIndex/pkey.
>> +	ptr = mmap(NULL, size, PROT_READ | PROT_WRITE,
>> +		   MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
>> +	ASSERT_NE(ptr, MAP_FAILED);
> Doesn't matter while there's only one test but we should probably
> munmap() this when we're done.

Fair enough, I was being lazy :) A pkey_free() is also in order to be
comprehensive, another wrapper to add. I considered using
../../mm/pkey-helpers.h but helpers there aren't implemented inline...
Maybe refactoring for later.

- Kevin

