Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3836D767C3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 10:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jWzAK4DRMOzi/z58HnevXQUOYdKr+tJ7WarNZsTc1VE=; b=x9B+dLea50Vo9BkZHh467RcCIc
	fnKcA7Ibs5mxUzC/6wHOA5Cn2fIQdVN7FGQMkPW5pLWvqN9hm3tO4ssKR8dWvqQaanx6CJic0iEe9
	NYDPfmQ/m3/o9KZxQpiW3UPg+lMhmfpf7bfTsouIuzl4nmCta4cA0qgDSB2MUSUhvze/P5+hN0EiI
	FiyrD5ZK+gGItmZzc9anj1ZvCx/hcKlJVHK7DVC6pn0pYVHYY9u/jNZIrI+/+GF5cGfjLc4J4+VBr
	+xxlzc6t/4JVKpUfyC/hDuuMcVBGYmXvWc/D2MrBeuVRB32VNWkwdVdAd/9rysMLAE4WvH0AoKDas
	2ojxoG9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXiT-0000000A4V7-1nJK;
	Fri, 19 Dec 2025 10:28:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXiQ-0000000A4UX-3OHT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 10:28:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 61753106F;
	Fri, 19 Dec 2025 02:27:58 -0800 (PST)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 34BA43F5CA;
	Fri, 19 Dec 2025 02:28:03 -0800 (PST)
Message-ID: <e9df1140-989f-46e3-8edc-2013e520bfed@arm.com>
Date: Fri, 19 Dec 2025 10:28:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/12] coresight: Add CPU cluster funnel/replicator/tmc
 support
To: Sudeep Holla <sudeep.holla@arm.com>,
 yuanfang zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan <leo.yan@linux.dev>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, kernel@oss.qualcomm.com,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, maulik.shah@oss.qualcomm.com,
 Jie Gan <jie.gan@oss.qualcomm.com>
References: <20251218-cpu_cluster_component_pm-v2-0-2335a6ae62a0@oss.qualcomm.com>
 <20251218-careful-ruby-wildebeest-a8babd@sudeepholla>
 <d0ce8306-84e0-4940-98aa-dbc356d87593@oss.qualcomm.com>
 <20251219-hysterical-sparkling-meerkat-59c5eb@sudeepholla>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20251219-hysterical-sparkling-meerkat-59c5eb@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_022806_889460_D5621462 
X-CRM114-Status: GOOD (  20.01  )
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

On 19/12/2025 10:21, Sudeep Holla wrote:
> On Fri, Dec 19, 2025 at 10:13:14AM +0800, yuanfang zhang wrote:
>>
>>
>> On 12/18/2025 7:33 PM, Sudeep Holla wrote:
>>> On Thu, Dec 18, 2025 at 12:09:40AM -0800, Yuanfang Zhang wrote:
>>>> This patch series adds support for CoreSight components local to CPU clusters,
>>>> including funnel, replicator, and TMC, which reside within CPU cluster power
>>>> domains. These components require special handling due to power domain
>>>> constraints.
>>>>
>>>
>>> Could you clarify why PSCI-based power domains associated with clusters in
>>> domain-idle-states cannot address these requirements, given that PSCI CPU-idle
>>> OSI mode was originally intended to support them? My understanding of this
>>> patch series is that OSI mode is unable to do so, which, if accurate, appears
>>> to be a flaw that should be corrected.
>>
>> It is due to the particular characteristics of the CPU cluster power
>> domain.Runtime PM for CPU devices works little different, it is mostly used
>> to manage hierarchicalCPU topology (PSCI OSI mode) to talk with genpd
>> framework to manage the last CPU handling in cluster.
> 
> That is indeed the intended design. Could you clarify which specific
> characteristics differentiate it here?
> 
>> It doesn’t really send IPI to wakeup CPU device (It don’t have
>> .power_on/.power_off) callback implemented which gets invoked from
>> .runtime_resume callback. This behavior is aligned with the upstream Kernel.
>>
> 
> I am quite lost here. Why is it necessary to wake up the CPU? If I understand
> correctly, all of this complexity is meant to ensure that the cluster power
> domain is enabled before any of the funnel registers are accessed. Is that
> correct?
> 
> If so, and if the cluster domains are already defined as the power domains for
> these funnel devices, then they should be requested to power on automatically
> before any register access occurs. Is that not the case?
> 
> What am I missing in this reasoning?

Exactly, this is what I am too. But then you get the "pre-formated 
standard response" without answering our questions.

Suzuki

