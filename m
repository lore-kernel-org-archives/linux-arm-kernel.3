Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F839CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 13:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fIi47r/0/YZLhFginrUBqCZIQZuW2WEId1BeEMRjE9E=; b=1WPCZjIzEvpmg+0pHtamyI//5h
	24AmiIy7pMitopX6LU9gFlgKH6YcSU+gPfHcqW2W9xyy5omyyXPyedmvajt0eonmee4DUj+17iNAt
	innkRws8lKPlajlyYxMdWejVfiN4RW7+QPAWWrkl1/MoudY7HyV1frk5hfHMXYoJ12FitGrlm3i1I
	ewVYO8rpWbMH8Q9UbkdmPGHxkFGgzUJt2wF2OF0m55fs4dv8CblW1nbQlQbLZjhd19IVTInWJdfDo
	La1iBcs8sDVsLgrHFIMKAwJtOPX5H0KDqaYNMlPY3irDSyti7CS49MoPjKcsPQ56VWwIHHvmdAQDS
	Uy40DJRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xERQO-00000002Vp4-1ouz;
	Wed, 07 Oct 2026 13:11:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xERQL-00000002Voj-10df
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 13:11:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A2031595;
	Wed,  7 Oct 2026 06:11:01 -0700 (PDT)
Received: from [10.57.10.153] (unknown [10.57.10.153])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9716E3F66F;
	Wed,  7 Oct 2026 06:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791378664; bh=aQPC+Yw1LXnFEbwa2Z4tr5U+8DNSNTgby5HUOWLpEkQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=U9sRHUeuLEhsrHnA+pCnGFP1F7eIFMBxSK4cMcQ48GUMGIU9jmj9OMP/kbwdDtvgD
	 yX/7zMMyJMhwsw5oP8/tPZ4nnTt7cg2CobLtBcpJDqTc9DE6ehnevr3pGfCT/6m1ab
	 T3SxDxXmEdhUeQFi7n2OIlMVc1ZRyxiihQX95zbI=
Message-ID: <f88b3cf5-8312-453a-bbf6-c5cc3e5ac119@arm.com>
Date: Wed, 7 Oct 2026 15:10:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 02/14] KVM: arm64: Disable Steal time accounting for
 protected guests
Content-Language: en-GB
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
 will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
 aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
 joey.gouly@arm.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev,
 gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com,
 alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com,
 lpieralisi@kernel.org, enju.kohei@fujitsu.com, sudeep.holla@arm.com,
 jonathan.cameron@oss.qualcomm.com
References: <20261007073537.2454351-1-suzuki.poulose@arm.com>
 <20261007073537.2454351-3-suzuki.poulose@arm.com>
 <CA+EHjTyb3-QoLa6P-dGXVdMh9E_vO3p8HceH3TH8h8gPJSd1Kw@mail.gmail.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <CA+EHjTyb3-QoLa6P-dGXVdMh9E_vO3p8HceH3TH8h8gPJSd1Kw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_061109_366795_8E3C23F0 
X-CRM114-Status: UNSURE (   8.77  )
X-CRM114-Notice: Please train this message.
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

On 07/10/2026 11:51, Fuad Tabba wrote:
> On Wed, 7 Oct 2026 at 09:35, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>>
>> PVTIME support is advertised by KVM_CAP_STEAL_TIME, which doesn't take into
>> account the kvm instance. Even with that, a VMM could skip the CAP check
>> and proceed to configure the PVTIME as we don't do further check on the
>> DEVICE_CTRL. Tighten this up by passing the KVM instance around wherever
>> possible and catch things early.
>>
>> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
>> Reviewed-by: Gavin Shan <gshan@redhat.com>
>> Tested-by: Gavin Shan <gshan@redhat.com>
>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> 
> Someone beat you to it. This is already in kvmarm/next as a5b0f36a045e :)

Thats fine, thanks for the pointer.

Cheers
Suzuki

> 
> Cheers,
> /fuad


