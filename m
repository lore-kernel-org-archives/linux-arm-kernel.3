Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C44C3ABB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 05:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GVWqOyM1jLbgxNas2JHxDIwIJT1L8VV5PWaYw33jupk=; b=pASt5eNRzn0MEQJNuW/5RJTrF8
	m+XzvK9hfTn4EzVD9b719AT8YvZlLZ+mg/e1xIeztohPtFV7nYwJGmT2AE6GQHFaVoRMdXvG2ZhX7
	iCmScFl9MSkl1DCNpD0PMyLtZTTy12b4B5qXNKyPa2jJSEhKKxD+c4K2vnneMaY8nkXGT/rZhWevs
	rDbp5kU3foGZybXcWGFqxKrHaIu+xw19LqAWhupNy3lhj7039PysEtOGmZQRFwbK687Wi31BetSWZ
	yYNHGwRrhFr8Zblqrv5AlLb6QWwDPmo9mYgtYhhBwHNxEYherz+aFaxCwwMrXXxVxWD5rmzVc5LsL
	xRKmoJ7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCXZa-0000000EI0D-13SC;
	Wed, 07 May 2025 05:44:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCXVG-0000000EHc0-09Yv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 05:39:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 922062F;
	Tue,  6 May 2025 22:39:21 -0700 (PDT)
Received: from [192.168.0.12] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 949C13F673;
	Tue,  6 May 2025 22:39:27 -0700 (PDT)
Message-ID: <b6774c27-0628-46d8-a186-bfd378ee538f@arm.com>
Date: Wed, 7 May 2025 11:09:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 9/9] coresight: Refactor runtime PM
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20250423151726.372561-1-leo.yan@arm.com>
 <20250423151726.372561-10-leo.yan@arm.com>
 <0ebbc509-9e17-4b93-9a72-b9e7cc03637e@arm.com>
 <20250506101604.GD177796@e132581.arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250506101604.GD177796@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_223934_134402_4DAFBCCD 
X-CRM114-Status: GOOD (  13.75  )
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



On 5/6/25 15:46, Leo Yan wrote:
> On Fri, May 02, 2025 at 02:15:49PM +0530, Anshuman Khandual wrote:
>>
>> On 4/23/25 20:47, Leo Yan wrote:
>>> The validation for driver data pointers and clock pointers are redundant
>>> in the runtime PM callbacks.  After a driver's probing, its driver data
>>> and clocks have been initialized successfully, this ensures it is safe
>>> to access driver data and clocks in the runtime PM callbacks.  A corner
>>> case is a clock pointer is NULL, in this case, the clock core layer can
>>> handle it properly.  So remove these redundant checking.
>>>
>>> In runtime resume, respect values returned from clock function and add
>>> error handling.
>>
>> Although not checking drvdata and drvdata->apb_clk does make sense, but
>> why change the semantics on the resume paths as well, which now returns
>> stored error value from clk_prepare_enable().
> 
> Let us assume if a clock fails to enable during the resume flow, with
> current code, we miss a chance to detect issues in the first place.
> 
> I understand the clock enabling failures are rare, but propagating an
> error in the resume callbacks would help identify potential issues.
> 
> It seems to me that this patch does not change the semantics of the
> resume paths.  It enhances the resume flow for early error reporting.

Alright, fair enough.

