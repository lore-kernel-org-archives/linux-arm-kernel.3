Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 236BEC56205
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 15:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2sen4rUQ02mp1eQb0BatJNlEZOouuwz1/74UC5nlKG4=; b=VRIg8XI3AsJ3L2qNtOmBoeduL/
	ZEkaKmSqbZne3S+A7CxbhVIxa9X3X1dxTYZkIenXEn2DxQKuTVAuRkRmrBbH/CEYLkW2DuiatZ93t
	St6cmlFQd03P3Gk22r+GYflCZnZMyXwkI53FxnXaWXexQ3YsgddEZGZUQin2xGrL5yl4Tw755Vz/m
	gf38UFm5/NqgzujpQnhDwkIeyx7JYleD7r/BDj2QuPeryK+3GRE5jSuatUu39SIKRCRcns8GmhWQq
	I/QUtmenEzuY7hfX3KrgMYR8PKrDhLFsd+2kmURmL1vm+4BlQ1zZwsjtNskdOXpYD+wCRVHOfQt+u
	0Tr7F8vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws0BG-000000067LE-01d3;
	Thu, 06 Aug 2026 15:38:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws0BD-000000067KP-0PGc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 15:38:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ABC36153B;
	Thu,  6 Aug 2026 08:38:37 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0CEEB3F632;
	Thu,  6 Aug 2026 08:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786030721; bh=HkLd7vLJFCtccjkU6wFw/hXH3/rpNOn5YATvCZNVC+A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CFPIzaNY91u1RSDpvqJJ7p/ocphehLxg9n9kmE7Ly9JxhpAaQr2tu0N5Lk7gLMghr
	 cHiD9Fyeh5iX8Pm4iDItyJoEwVg4WrcKysZMdylN5SJWI9evy4nGvusdMnGqNSy377
	 mBcX9+hP8wlyHCd2ex+1lUttkfMhcp+VQdc77TkY=
Message-ID: <51f5d369-9491-49cb-957a-dd70ad42ecd6@arm.com>
Date: Thu, 6 Aug 2026 17:38:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] arm_mpam: Fix a NULL pointer dereference on
 unbinding after an error interrupt
To: Ben Horgan <ben.horgan@arm.com>
Cc: james.morse@arm.com, reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dave.martin@arm.com, will@kernel.org, catalin.marinas@kernel.org
References: <20260806144631.2502918-1-ben.horgan@arm.com>
 <20260806144631.2502918-2-ben.horgan@arm.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260806144631.2502918-2-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_083847_191162_482AB7CC 
X-CRM114-Status: GOOD (  17.89  )
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

Hi,

On 8/6/26 16:46, Ben Horgan wrote:
> If a user unbinds an MSC after mpam_disable() has been run in response
> to an error interrupt then a dereference of a NULL pointer occurs as
> mpam_disable() sets the drvdata to NULL. Add an early return to the driver
> remove callback to avoid this.

Yes, I added a very similar patch to my stack yesterday, in response to 
a Sashiko complaint.
However I was still calling mpam_free_garbage() at the end, to me it 
looks like this is not depending on any MSC?

Cheers,
Andre

> Fixes: f04046f2577a ("arm_mpam: Add probe/remove for mpam msc driver and kbuild boiler plate")
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
>   drivers/resctrl/mpam_devices.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 2f09f4b78bd3..bc6cc0b5c96b 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -2025,6 +2025,9 @@ static void mpam_msc_drv_remove(struct platform_device *pdev)
>   {
>   	struct mpam_msc *msc = platform_get_drvdata(pdev);
>   
> +	if (!msc)
> +		return;
> +
>   	mutex_lock(&mpam_list_lock);
>   	mpam_msc_destroy(msc);
>   	mutex_unlock(&mpam_list_lock);


