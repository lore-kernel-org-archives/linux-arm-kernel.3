Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CD3CC02199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 12:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fq5C2UpZXs2chSO/JvclF+1SBup+VkqtxAljzA1IgBw=; b=RYsbjuhroVrD/qMkD67iZlEJZw
	9IhYGYl1UzPjR4TmAvs67V5Gazu0M6i8fgrIGDwUG3m3Kmg4GxYzdIivbLEHCtMXPZeFPLNMlCPoK
	D5e8jHfHSN36G8Tftjw+m6WBl8ZbnNzXNze/RpXs/vykgAP6pawS59jPhpGMTlZELYCB+xdi+jAzr
	pp4RUpWq0NZVLWdxFEQ0M3cbYFWV3GhTb058/SNaNmb2Ja/7N9TnHjGype8wxj2ll2CgSS5sMM+2J
	pHJxTZjPAlePWwPKIb7JtbMi4So2cPJ3Ex7aO9yrcbGIEfF1O4nvgx8TERhVzJrfWow2wVdc4W95h
	WyfVoKAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg0nd-00000006Ej3-34Fv;
	Thu, 06 Feb 2025 12:16:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg0Xh-00000006DXx-3pDP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 11:59:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9BBD312FC;
	Thu,  6 Feb 2025 04:00:00 -0800 (PST)
Received: from [192.168.68.112] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A5253F63F;
	Thu,  6 Feb 2025 03:59:35 -0800 (PST)
Message-ID: <b0a6ccd0-205d-42d8-9b98-6efb34c117e4@arm.com>
Date: Thu, 6 Feb 2025 11:59:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 00/16] hugetlb and vmalloc fixes and perf improvements
Content-Language: en-GB
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Muchun Song <muchun.song@linux.dev>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Uladzislau Rezki <urezki@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>, Dev Jain <dev.jain@arm.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 Steve Capper <steve.capper@linaro.org>, Kevin Brodsky
 <kevin.brodsky@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250205151003.88959-1-ryan.roberts@arm.com>
 <20250205235219.3c3a4b968087d1386d708b04@linux-foundation.org>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250205235219.3c3a4b968087d1386d708b04@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_035937_990958_0804BAD3 
X-CRM114-Status: GOOD (  13.61  )
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

On 06/02/2025 07:52, Andrew Morton wrote:
> On Wed,  5 Feb 2025 15:09:40 +0000 Ryan Roberts <ryan.roberts@arm.com> wrote:
> 
>>  I'm guessing that going in
>> through the arm64 tree is the right approach here?
> 
> Seems that way, just from the line counts.
> 
> I suggest two series - one for the four cc:stable patches and one for
> the 6.14 material.  This depends on whether the ARM maintainers want to
> get patches 1-4 into the -stable stream before the 6.14 release.

Thanks Andrew, I'm happy to take this approach assuming Catalin/Will agree.

But to be pedantic for a moment, I nominated patches 1-3 and 13 as candidates
for stable. 1-3 should definitely go via arm64. 13 is a pure mm fix. But later
arm64 patches in the series depend on it being fixed. So I wouldn't want to put
13 in through mm tree if it means 14-16 will be in the arm64 tree without the
fix for a while.

Anyway, 13 doesn't depend on anything before it in the series so I can gather
the fixes in to a series of 4 as you suggest. Then the improvements become a
series of 12. And both can go via arm64?

I'll gather review comments then re-post as 2 series for v2; assuming
Will/Catalin are happy.

Thanks,
Ryan

