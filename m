Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC16DCA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 15:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PmtZy4P0Z5BcCsBas0dqYDpN83VxKr2GOrIgsIG75Yg=; b=HxY4aHN8VUsQ9kBT9iGNIPeGZ0
	tc8l+0aHVKIc24Sx+nP9GlYn9W8hB2aC6HSUNnSsVkUbDTPh0sbRVJsB/sYy5hPjo8AwfdNuywFl8
	Ge0P13XN5o5UqHbKINFRDTfDv9C0+YtupysXuFlNcW58b99KX1obhVUDmdR6U7vOFfkAhl7uHjynh
	H+ctqfqApiXXlEYgQ7c1zJMiYIEO+HHk+q6KxIONwqT+i07fUzp2OvqSSauetSwFG7WnRx68P61nq
	VFu8mnwGQ29M0ZJHAhhovCJcHV/MZU4Rug1OZlNrCAFHL44/3TspSqLX8m8mlDokF+sAk6RlUwBI8
	2m6p1WpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCf1H-0000000BtEn-3Cp9;
	Fri, 02 Oct 2026 15:17:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCf1E-0000000BtDz-22VN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 15:17:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E90A5143D;
	Fri,  2 Oct 2026 08:17:46 -0700 (PDT)
Received: from [10.2.212.14] (eglon.cambridge.arm.com [10.2.212.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3BF153F85F;
	Fri,  2 Oct 2026 08:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790954270; bh=4/fl//FzQwWFZWipdtig+n4zBqLbuWVE2d0wceY0kSQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vZKgAgXcUAeGhpzelqjlTDkjiRiHifpYKdaWEwV89WXwe6Q/u95WZTSGjtY6J2NaN
	 fERGN4oIlA6Hdju+yxDSisAuLRFSAkMTux+wayOVOasnFwpIKwQBc2yIYr2P7MTRa3
	 0mcgVeDwHTpVWJm9mdbqaDDnvLsXNMyH4xWzZweM=
Message-ID: <71c0021a-1438-416d-9d72-988b8ea3eef7@arm.com>
Date: Fri, 2 Oct 2026 16:17:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/12] arm_mpam: resctrl: Make read_mon_cdp_safe() self
 consistent
To: Ben Horgan <ben.horgan@arm.com>
Cc: reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dave.martin@arm.com, andre.przywara@arm.com, Gavin Shan <gshan@redhat.com>
References: <20260917145617.2202986-1-ben.horgan@arm.com>
 <20260917145617.2202986-10-ben.horgan@arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20260917145617.2202986-10-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_081752_633572_90F48727 
X-CRM114-Status: GOOD (  17.39  )
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
> When read_mon_cdp_safe() is called with cdp_enabled equal to false then the
> reading returned in val is the sum of the monitor values for the given
> component. However, when cdp_enabled equal to true it is again the sum of
> the monitor values but with the initial value of val also added. Both
> resctrl_arch_cntr_read() and resctrl_arch_rmid_read() call
> read_mon_cdp_safe() and are documented to return the val directly without
> consideration of the older value.
> 
>  The val is always zeroed before read_mon_cdp_safe() is called except in
>  __check_limbo() and __l3_mon_event_count_sum() but the latter is not
>  relevant on MPAM systems.  The extra accumulation in __check_limbo() means
>  when there are multiple RMIDs in limbo some of them may be marked dirty
>  when they are already clean.
Weird indenting - I'll fix that.


> Change the cdp_enabled equals true case to match the false case and the
> documentation of the resctrl arch hooks.

Nothing about the documentation of the resctrl arch hooks here...
I'll drop this part of the commit message.


> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index b825bd90d4bd..321741a702fe 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -497,7 +497,7 @@ static int read_mon_cdp_safe(struct mpam_resctrl_mon *mon, struct mpam_component
>  		if (err)
>  			return err;
>  
> -		*val += code_val + data_val;
> +		*val = code_val + data_val;
>  		return 0;
>  	}

I mistakenly thought mpam_msmon_read() was summing, so did the same here. But its not.

Reviewed-by: James Morse <james.morse@arm.com>


Thanks,

James




