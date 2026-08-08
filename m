Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8C64C55174
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 07:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rCzgX6JVLx9Ko3n6wKYEJsdgvY6Ca+XBEhJnvXYRW5o=; b=fdP8iis7dTge2xm+fDXOvAb9j7
	83o4UyVuP21GgGhiP18M5AYR1L8OMumfVoFAueV9t6dP92S2oDaU2xUIo6KUyW/TluRozWntSm1d6
	6Dd68KH2vy6xpXco1lSZCqhgv/uc8uMS50Ra2zX7p1RiONgSP7GNMdaMrQBZTqVQwnrQHOQlcaSdQ
	PXsWO8AuCWZzSczI9DA7nqsJPL9ssRj7ARaHq+h+kPWP6PVBUHTB0XscOMyruH+NyBV+LY7XMu+l8
	NzSCZaqa0KbJtDUawh0v62ZPsUYA9Zpm06WG9pi7GBOMOVSkmC8YcvMsS8rt91e4lhFwsZBoPXZF7
	oDGFzbag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsbYK-0000000989a-2kxy;
	Sat, 08 Aug 2026 07:33:08 +0000
Received: from out-189.mta0.migadu.com ([91.218.175.189])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsbYH-0000000989B-0G5V
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 07:33:07 +0000
Message-ID: <f29e9ffc-80bd-4bd0-91a5-22feb081ac60@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786174378;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rCzgX6JVLx9Ko3n6wKYEJsdgvY6Ca+XBEhJnvXYRW5o=;
	b=iovclzJpjR+LMVlQGMDC1PXGZcwCK7PEsPVXonLV3I6GYXXstpcVN2tQErwnvJQubWeZkW
	SeShr/mMhxwjUHw1ENdLhSGDivCiBRGJQ/ejL80ujQs1mOQN9teOlOUsNYf1YkdNDn/vij
	ctovi6HgvbyGlh6y6/v+IOE/V1+36d8=
Date: Sat, 8 Aug 2026 00:32:49 -0700
MIME-Version: 1.0
Subject: Re: [PATCH v8 05/22] RISC-V: Define indirect CSR access helpers
To: Paul Walmsley <pjw@kernel.org>
Cc: Jiri Olsa <jolsa@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Rob Herring <robh@kernel.org>, Anup Patel <anup@brainfault.org>,
 Namhyung Kim <namhyung@kernel.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Ian Rogers <irogers@google.com>,
 Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-perf-users@vger.kernel.org, Conor Dooley <conor@kernel.org>
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com>
 <20260701-counter_delegation-v8-5-7909f863a645@meta.com>
 <1b20aa77-0f0f-08c7-9439-972983adf709@kernel.org>
 <920aee80-5297-4d70-a1ea-616976db7f70@linux.dev>
 <09a1260b-aa91-f993-e81e-0c636cfd7942@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <09a1260b-aa91-f993-e81e-0c636cfd7942@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_003306_156702_1C32A4BA 
X-CRM114-Status: GOOD (  16.02  )
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


On 8/7/26 6:04 PM, Paul Walmsley wrote:
> On Wed, 5 Aug 2026, Atish Patra wrote:
>
>> On 8/4/26 5:39 PM, Paul Walmsley wrote:
>>> On Wed, 1 Jul 2026, Atish Patra wrote:
>>>
>>>> From: Atish Patra <atishp@rivosinc.com>
>>>>
>>>> The indirect CSR requires multiple instructions to read/write CSR.
>>>> Add a few helper functions for ease of usage.
>>>>
>>>> Signed-off-by: Atish Patra <atishp@rivosinc.com>
>>> Thanks.  These macros seem better implemented as static inline functions.
>>> That also nicely aligns the code with what you write in the patch
>>> description.
>> I don't think inlining these macros in the following way will work because of
>> the following reason. It won't build once anything calls it.
>>
>> csr_read()/csr_write() stringify the CSR argument straight into the inline asm
>> template:
> Yes, you're right; I should have caught that.  Too bad, there are multiple
> keyhole CSR index registers in use, otherwise it would have been a
> reasonable thing to do.
>
> What's up with the subsequent followup message?  Looks like a
> cut-and-paste from an LLM.
Oops. Ha ha. LLM agent was parsing the lore and preparing a draft response.
It produced so much garbage that I replied manually. I have no idea what 
prompted
it to send it after I sent the response! Sorry for the spam.
>
> - Paul

