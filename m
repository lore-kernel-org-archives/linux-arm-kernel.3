Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B3ACA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 15:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LwExkX56IomKfzzcVs8YYMVfre8uAO6b9w1m8K7XkEY=; b=AbAgd9GdU7tFMHvXt4/p/j+4To
	+Isdl0CjHf/LZB2Z4lOMlIq9TfjfkuwN9NvBVKmQ9ML+1AIQxyICUZIDwJUPeS/0QgCN/JrOOSU+n
	oUbdNT+wbMOi+8tzk06ROiax0TO6BUGRjQE6NlU1kL8x32mqAcPgXurAzgQiP4kXYpBegTHRQAWf+
	vPx4ZFkn3YYvLGILoCS2kmcxLYZ2vUWu1EuzQwqmFZq37H7Jol9VNBVi2x33oaJEFoNlzuFNwxkmB
	VUDgLVmOQHv/H0rGKRAAyIlKGeytYRupIMBjmaGJ63eoOTB0JLFvdS/t+NWhyxwtChUJnfHx4YrQO
	kXjWCGsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCezQ-0000000BsrJ-12VI;
	Fri, 02 Oct 2026 15:16:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCezM-0000000Bspq-03Q2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 15:15:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 20ECF1476;
	Fri,  2 Oct 2026 08:15:52 -0700 (PDT)
Received: from [10.2.212.14] (eglon.cambridge.arm.com [10.2.212.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 638BE3F85F;
	Fri,  2 Oct 2026 08:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790954155; bh=wxfqMJtn1W7yfkOIWwGDU+cuf258NP+En0EemreTblU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Yl/j+4vjl+68TN7gfciDeWp24lIKIj4Qc/A+khGDSh6B6F+kHmevE+HXub6+tePo7
	 +wkpQ31fwKH83cv9U9vLWqI430U8wNfxoLz8swyamgdjkdCj3Z2asBq9J+MI8uYN5z
	 W6j4WHDsXfnA+Qdw/ZOxlLKlXhXUv2i5thyFyBG0=
Message-ID: <ab39009b-7ce9-4f25-b78f-f24c4bf2a2c8@arm.com>
Date: Fri, 2 Oct 2026 16:15:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/12] arm_mpam: resctrl: Correct check that existing
 class is L3
To: Ben Horgan <ben.horgan@arm.com>
Cc: reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dave.martin@arm.com, andre.przywara@arm.com, Gavin Shan <gshan@redhat.com>
References: <20260917145617.2202986-1-ben.horgan@arm.com>
 <20260917145617.2202986-9-ben.horgan@arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20260917145617.2202986-9-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_081557_116895_2DE37FCD 
X-CRM114-Status: GOOD (  15.07  )
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

Hi Ben,

On 17/09/2026 15:56, Ben Horgan wrote:
> The class used to back mbm_total_bytes can be either at the L3 or the
> memory. If a platform had candidate classes at both the memory and the L3
> then, as the check for whether the existing class is L3 or not in
> counter_update_class() is broken, the class that will be chosen depends on
> which order the classes are considered and so the probe order.

> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index 9d223057953a..b825bd90d4bd 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -1076,7 +1076,7 @@ static void counter_update_class(enum resctrl_event_id evt_id,
>  	struct mpam_class *existing_class = mpam_resctrl_counters[evt_id].class;
>  
>  	if (existing_class) {
> -		if (class->level == 3) {
> +		if (existing_class->level == 3) {
>  			pr_debug("Existing class is L3 - L3 wins\n");
>  			return;
>  		}

Heh, the debug message strong hints at how that was supposed to work!

Reviewed-by: James Morse <james.morse@arm.com>



Thanks,

James

