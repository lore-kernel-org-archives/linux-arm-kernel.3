Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53435CD37B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 11:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q6pqf8jLj9kaVKPeXtzyDzH8BozEsJDVbn+1pU0tRJA=; b=d05rfxye8jkpdjNDD8ZeinF3nf
	aQLR7RhDs4A+tpauFsRAu2tqmeWz2vjckWdfblt9kRsOI/CFlhFUqLW/CTJfb3juwNsoyIKjVwpsJ
	92uE6vtWzBDEP8760u3qfDn3NvQeqiiDPzS/E91Fu96GS0E11jPYqoFYusZEysXj/W6xans0Ax8gF
	HzJiP9NBipEQprUaOfg9znLYD+Qugp11C6qAYLaj/Qn5du3pjb1zrYGNyKe/SVAcf85NoH3mIzdwr
	c6FrzEdbS7gEKIcD1ekLMuuJkHt77nmol1ZfzGjsARuK9g0oBC/Ap19qjuXUFUqrg1fXzDXAltC5G
	4Ioxz0TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOfS-0000000DIS0-0BNk;
	Mon, 11 May 2026 11:19:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOfO-0000000DIQs-3Jfb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 11:19:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 21AC41595;
	Mon, 11 May 2026 04:19:11 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B88A73F85F;
	Mon, 11 May 2026 04:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778498356; bh=ozWQ3fOF6yFVeR5A9evTnQARUzjgjv/GHbGPvJHcwHU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VaPKa3o8ELSK/39g+WB5sWUGgG3AIiw7sy4uUe2cx0lULntEI0lpr+Fc6zTyTR4Pw
	 tcuW/XsazM2T+mE+XYO6DbTTibI5Zb8nv1e3GkkPkwx+WKOgUAQuWiYRsdbcICKBIT
	 doS29S3ucOFusc92OBWqUpFAJN8DK73oDpNBBVpo=
Message-ID: <3f51d2a8-e699-4acf-9903-e62e27d2213a@arm.com>
Date: Mon, 11 May 2026 12:19:06 +0100
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v3 1/4] arm_mpam: Fix false positive assert failure during
 mpam_disable()
To: James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, zengheng4@huawei.com
Cc: wangkefeng.wang@huawei.com, xry111@xry111.site, catalin.marinas@arm.com,
 yang@os.amperecomputing.com, reinette.chatre@intel.com, will@kernel.org,
 thuth@redhat.com, mrigendra.chaubey@gmail.com, fenghuay@nvidia.com,
 ahmed.genidi@arm.com
References: <20260508162341.3762549-1-james.morse@arm.com>
 <20260508162341.3762549-2-james.morse@arm.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20260508162341.3762549-2-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_041918_872580_BC8E8257 
X-CRM114-Status: GOOD (  24.23  )
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

Hi James,

On 5/8/26 17:23, James Morse wrote:
> mpam_assert_partid_sizes_fixed() is used to document that the caller
> doesn't expect the discovered PARTID size to change while it is walking
> a list sized by PARTID. Typically the MSC state is not written to until
> all the MSC have been discovered and this value is set.
> 
> However, if discovering the MSC fails and schedules mpam_disable(),
> then the MSC state is written to reset it. In this case the
> discovered PARTID size may be become smaller - but only PARTID 0
> will be used once resctrl_exit() has been called.
> 
> Skip the WARN_ON_ONCE() if mpam_disable_reason has been set.
> 
> Fixes: 3bd04fe7d807bb ("arm_mpam: Extend reset logic to allow devices to be reset at any time")
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
>  drivers/resctrl/mpam_devices.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 41b14344b16f..bef5e9e9e844 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -164,11 +164,17 @@ static void mpam_free_garbage(void)
>  /*
>   * Once mpam is enabled, new requestors cannot further reduce the available
>   * partid. Assert that the size is fixed, and new requestors will be turned
> - * away.
> + * away. This is needed when walking over structures sized by PARTID.
> + *
> + * During mpam_disable() these structures are not fixed, but the MSC state
> + * is still reset using whatever sizes have been discovered so far. As only
> + * PARTID 0 will be used after mpam_disable(), any race would be benign.
> + * Skip the check if a mpam_disable_reason has been set.
>   */
>  static void mpam_assert_partid_sizes_fixed(void)
>  {
> -	WARN_ON_ONCE(!partid_max_published);
> +	if (!mpam_disable_reason)
> +		WARN_ON_ONCE(!partid_max_published);

A little bit nasty to use mpam_disable_reason this way but a simple better way eludes me.

Reviewed-by: Ben Horgan <ben.horgan@arm.com>

Thanks,

Ben


>  }
>  
>  static u32 __mpam_read_reg(struct mpam_msc *msc, u16 reg)


