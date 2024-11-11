Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2DC0D2E9E4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 12:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JYAmY7wTk54E05W8q1gkfsk30KbVYXQmEUb8Up6+Vf0=; b=W3y1nqbmQsV7xgmNrVnVxQOG1C
	0lqzxgblE42sEmn1wmzu2e+2UkeEz5i0RlB3wt5xv1Cgqz9DzgOtHjKeJtwKhpGywOEdoJTBv4gtX
	M6F4TBL2toiOBrkHtA8Qjdpe/YiJL78slnmAa7X7EIthwoImkuPNGqEA41zLv7pnAklpDVEl7Hwwr
	Q7goYWDP/HbUznceaV+l3z49tpbCTlPP2l+FqK9MXC9D7g/hWwsj7H3RLmYw1Zpcfmf7Uv2EHEAiA
	zLMIuR6cd/6ZrJAuatOOmBkvRJ7TFR1GCbN8P3vR79pEL7zQv25DQAaDfkL3KzPiEMrlfAXjUVVwl
	fbhEee0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tATWb-0000000Haqp-1Duh;
	Mon, 11 Nov 2024 12:28:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tATUE-0000000HagL-3us4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 12:26:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1C6421F37;
	Mon, 11 Nov 2024 04:26:10 -0800 (PST)
Received: from [10.57.89.175] (unknown [10.57.89.175])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8D87D3F6A8;
	Mon, 11 Nov 2024 04:25:37 -0800 (PST)
Message-ID: <046ce0ae-b4d5-4dbd-ad9d-eb8de1bba1b8@arm.com>
Date: Mon, 11 Nov 2024 12:25:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 00/57] Boot-time page size selection for arm64
Content-Language: en-GB
To: Petr Tesarik <ptesarik@suse.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Ard Biesheuvel <ardb@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 David Hildenbrand <david@redhat.com>, Greg Marsden
 <greg.marsden@oracle.com>, Ivan Ivanov <ivan.ivanov@suse.com>,
 Kalesh Singh <kaleshsingh@google.com>, Marc Zyngier <maz@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <mbrugger@suse.com>,
 Miroslav Benes <mbenes@suse.cz>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
References: <20241014105514.3206191-1-ryan.roberts@arm.com>
 <20241017142752.17f2c816@mordecai.tesarici.cz>
 <aa9a7118-3067-448e-aa34-bbc148c921a2@arm.com>
 <20241111131442.51738a30@mordecai.tesarici.cz>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20241111131442.51738a30@mordecai.tesarici.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_042543_053442_1AC66543 
X-CRM114-Status: GOOD (  19.04  )
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

Hi Petr,

On 11/11/2024 12:14, Petr Tesarik wrote:
> Hi Ryan,
> 
> On Thu, 17 Oct 2024 13:32:43 +0100
> Ryan Roberts <ryan.roberts@arm.com> wrote:
> 
>> [...]
>> I understand that Suse might be able to help with wider performance testing
> 
> Sorry for the delay (vacation, other tasks). Anyway, let me share some
> results with you.

Not at all; thanks for coming back with these results!

> 
> First, I have looked only at 4k pages (constant v. selected at boot
> time) so far.
> 
> Second, the impact of the patch series is much smaller than I expected.
> Most macro-benchmarks (dbench, io-bench) did not see any significant
> slowdown. There appears to be a performance hit of approx. 1-2%, but
> that's within noise, and I can't dedicate my time to running extensive
> tests to find the distribution peak and compare. In short, I suspect a
> slight performance hit, but I cannot quantify it.
> 
> Third, a few micro-benchmarks saw a significant regression.
> 
> Most notably, getenv and getenvT2 tests from libMicro were 18% and 20%
> slower with variable page size. I don't know why, but I'm looking into
> it. The system() library call was also about 18% slower, but that might
> be related.

OK, ouch. I think there are some things we can try to optimize the
implementation further. But I'll wait for your analysis before digging myself.

You probably also saw the conversation with Catalin about the cost vs benefit of
this series. Performance regressions will all need to be considered in the cost
column, of course. So understanding the root cause and trying to reduce the
regression as much as possible will increase chances of getting it accepted
upstream.

Thanks,
Ryan

> 
> The dup() syscall was up to 5% slower (depends on underlying filesystem
> type).
> 
> VMA unmap was slower for some sizes, but the pattern seemed random,
> sometimes giving even better performance with variable page size, so
> this micro-benchmark may be too unstable to draw any conclusions.
> 
> Stay tuned
> Petr T


