Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1473C9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 15:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S0GAQWca0nTL6YLZ9mKHYSD9pSYfXej97OjBgSQA5Aw=; b=t2DKYBR2nOXUaAEugzpoiTHUd2
	8Fq8Hzs88CA62sdRvg06o0CkWj3GLpPoMxcZMf/76iYIk5v88b6qAyQhXH3ap/7jmkvx1Dk8LC5bQ
	rX9TPWIhEWCzshsRaYC/a8SFUlf24O7w+Qe78hYGC3yzwEO2DoYcAk15+OluZQS7+E4HCl+Mb+hQI
	WVmBzd6coTQKJSjU4ltoMyqq9NDHveiwZttAFMhIyM4rhtbuMXaNlWJRLsYoHx0EBRTkdSiVuJPFV
	1km6cyObOMoW/Bnwc1Bteo92xn/AUkJr0CpNUYc803ZuG7YY+9cb7TCpjcC+HFOmcArOdG3JsOcnx
	U3AC/QpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Ob7-00000008dSk-1Sax;
	Wed, 23 Sep 2026 15:09:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Ob5-00000008dS9-1usU
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Sep 2026 15:09:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=S0GAQWca0nTL6YLZ9mKHYSD9pSYfXej97OjBgSQA5Aw=; b=dMQJ7+oaawEQ7hkI4vAFEQyG4t
	NhNvXBcRidIXFYS0hCixD6iG8ZjjiFfXwzXPEN5kO4ag+LiGM99vVPKGWWxcWr7raOBkByYItTqG1
	QdwJjGhGQnhm1cxLLS3K2JxWwBOTXmPLPfqCfkmobJidc4eS8m6kautZilWbGSzm/4U2wNLguHQVo
	rmXLpTJgiVPfwXmm/mZrG+Ofw9sCv2Ok2yrMzFIgOVjsRW36/oEK8y6Gijk2zanCCOXBxPX9DZBY5
	T8qnfR8SEmKCkXdpW40BeABHVqAOKmLmc7tbFgn50gUJ54w8QjP7CM2RVIutMV+cC/+0w8IJ0r0Sp
	SBLElxeg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9Ob1-0000000EuD9-1FJA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 15:09:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E1281713;
	Wed, 23 Sep 2026 08:09:13 -0700 (PDT)
Received: from [192.168.4.158] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4C1963F86F;
	Wed, 23 Sep 2026 08:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790176156; bh=EZhJBNxd5DgdGGLZIF38gcgQvX7YQE1kHz/PRhpXS2w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NhpdT+heQlDj85e3E4DE1+9t2AiiZ3nDyE5kxR/4EC0Q91kUJB62lbUMWUPRRWLu0
	 ilcL3i3GHZMlN7f/wXGTSMRXkHBPZrUBpNgp+klVtXUoevFdSgpUuaGqgEEwS97z+X
	 DC/bh2wmEX1GmqzIXKTwY6fVXi0/pYVORCdB+zZc=
Message-ID: <e2019f1e-8bba-4ac2-b953-a300d5af319e@arm.com>
Date: Wed, 23 Sep 2026 16:09:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 8/8] coco: guest: arm64: Remove dummy CCA platform
 device
Content-Language: en-GB
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
 linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Jason Gunthorpe <jgg@nvidia.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Greg KH <gregkh@linuxfoundation.org>, Jeremy Linton <jeremy.linton@arm.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Sudeep Holla <sudeep.holla@kernel.org>, Will Deacon <will@kernel.org>,
 Steven Price <steven.price@arm.com>, Andre Przywara
 <andre.przywara@arm.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Olivia Mackall <olivia@selenic.com>, Russell King <linux@armlinux.org.uk>,
 Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
References: <20260923140405.1111554-1-aneesh.kumar@kernel.org>
 <20260923140405.1111554-9-aneesh.kumar@kernel.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260923140405.1111554-9-aneesh.kumar@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_160919_826536_EEF0E98C 
X-CRM114-Status: UNSURE (   7.93  )
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

On 23/09/2026 15:04, Aneesh Kumar K.V (Arm) wrote:
> The SMCCC firmware driver now creates the arm_smccc bus and instantiates
> the CCA RSI device once the RSI ABI is discovered. The arm64-specific
> arm-cca-dev platform device stub is therefore no longer needed.
> 
> Userspace now has /sys/firmware/cca/realm_guest as a dedicated CCA Realm
> guest indicator. Remove the dummy arm-cca-dev registration.
> 
> Link: https://lore.kernel.org/all/4a7d84b2-2ec4-4773-a2d5-7b63d5c683cf@arm.com
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>


