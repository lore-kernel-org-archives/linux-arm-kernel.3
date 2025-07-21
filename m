Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A84C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 10:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VbZho8yOWDN6soSjVyAy8RHd7AeyfcwvBCoaS+mEQD8=; b=l7vuaVCSvYyk3I8czgZknxrYOw
	a1D4qVutO/a/8rhPxYcXXwTXEHIKwawrxW/D+y6CDzzUPo9mCPwFAUj0L8bHFjf4ao7Yp44xUIoyv
	ZdczswAgmjR7KL8FHHZOmhU7dT/prBVrHcCxNP4/CLq0Wy0gVDOrkUO3dTU+txLJ7iwCHOXlTO53C
	AM7g/VH56LuPy7ur/xWPlxar9f/Iad4ei2TlW9HevHUPnkDoihU0gwWVd+qvyW+RhNZ8XuItZa9gt
	OCOS6robFUhYee4T4THr41uRnLw29sLvwaBt452BsVWPGKFCtOmUnuxc/DH+OLHZdzS6eBb421QzH
	LU2sMgtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udnXf-0000000Gw20-0axF;
	Mon, 21 Jul 2025 10:14:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udmhQ-0000000Gn6p-47cH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 09:20:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 77BF01595;
	Mon, 21 Jul 2025 02:20:38 -0700 (PDT)
Received: from [10.57.30.25] (unknown [10.57.30.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3D7BC3F59E;
	Mon, 21 Jul 2025 02:20:43 -0700 (PDT)
Message-ID: <807d7899-cab4-4449-aba4-645593b1db21@arm.com>
Date: Mon, 21 Jul 2025 10:20:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/10] coresight: Appropriately disable trace bus
 clocks
Content-Language: en-GB
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250627-arm_cs_fix_clock_v4-v4-0-0ce0009c38f8@arm.com>
 <20250627-arm_cs_fix_clock_v4-v4-5-0ce0009c38f8@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250627-arm_cs_fix_clock_v4-v4-5-0ce0009c38f8@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_022045_062415_6438E311 
X-CRM114-Status: GOOD (  12.93  )
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

On 27/06/2025 12:51, Leo Yan wrote:
> Some CoreSight components have trace bus clocks 'atclk' and are enabled
> using clk_prepare_enable().  These clocks are not disabled when modules
> exit.
> 
> As atclk is optional, use devm_clk_get_optional_enabled() to manage it.
> The benefit is the driver model layer can automatically disable and
> release clocks.
> 
> Check the returned value with IS_ERR() to detect errors but leave the
> NULL pointer case if the clock is not found.  And remove the error
> handling codes which are no longer needed.
> 
> Fixes: d1839e687773 ("coresight: etm: retrieve and handle atclk")

I would drop this tag as I don't see what we are fixing ?
If there is indeed something, I would recommend:
  - Call it out in the commit description.
  - Move that as a separate patch, so that it can be
    safely backported without touching all the other drivers.

If you agree with the above, I will drop the "Fixes" tag and
can merge it.

Suzuki


