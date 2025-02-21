Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D56DC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 17:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hCjpA7sxXCH//jKd1RfthHO6QnYL0eC+DewN/ptjmKQ=; b=apmv4f0aPeXrBybHsML+ueaQiG
	IaDiO5roQW3/Sw2sMlNSbXI+d/LxOHykVJMjGtI7DQ3qu6J6InNNbuw1d3V+AoIdMxLOp5fSPWMaJ
	/hV/hL2z2HgAxzlnHdnib55kmztqH8YRgaZbw8c7f4RjNsxapIVfsWfw1JGE3g7y8KdRnRqs8CuHE
	pGhO6Fu+MGYD62JXKKFE/ehn+HkRXSwa2LY8FrKQhnpo4yB6t2On+TMjVpRZcIUQtxhKkqlk3l8vp
	d7ppJUd3zpj0iGVZvLov3yK74Z7wLDO8O7YkhdW4AWLHDBpLviskcYWGGlYXhM3VWvB3RnwwANYun
	2uDaXN5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlX0T-00000006OzV-2OCJ;
	Fri, 21 Feb 2025 17:40:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlWys-00000006OjE-189g
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 17:38:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 79C411063;
	Fri, 21 Feb 2025 09:38:47 -0800 (PST)
Received: from [10.163.38.241] (unknown [10.163.38.241])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BE87E3F5A1;
	Fri, 21 Feb 2025 09:38:27 -0800 (PST)
Message-ID: <1ead03ad-5f7c-4f80-a350-61c29fb7e451@arm.com>
Date: Fri, 21 Feb 2025 23:08:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] kselftest/arm64: mte: Skip the hugetlb tests if MTE
 not supported on such mappings
To: Catalin Marinas <catalin.marinas@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>,
 Yang Shi <yang@os.amperecomputing.com>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250221093331.2184245-1-catalin.marinas@arm.com>
 <20250221093331.2184245-3-catalin.marinas@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20250221093331.2184245-3-catalin.marinas@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_093830_351043_0E24AD9D 
X-CRM114-Status: UNSURE (   7.33  )
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



On 21/02/25 3:03 pm, Catalin Marinas wrote:
> While the kselftest was added at the same time with the kernel support
> for MTE on hugetlb mappings, the tests may be run on older kernels. Skip
> the tests if PROT_MTE is not supported on MAP_HUGETLB mappings.
> 
> Fixes: 27879e8cb6b0 ("selftests: arm64: add hugetlb mte tests")
> Cc: Yang Shi <yang@os.amperecomputing.com>
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>

Reviewed-by: Dev Jain <dev.jain@arm.com>


