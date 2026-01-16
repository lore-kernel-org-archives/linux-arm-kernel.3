Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97642D4898C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 11:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zI9eVBWNcLC9W5j8HBnOLZKo0BTvOQC+ZeZou3TihFQ=; b=RmUHrUe7Uhm/LyGab5HB3vyHFf
	D71bhjHT6GeGUK7uYcgXaPAP9IvaAN00hXRUF6YQe6djnXlj9yAbehcYt78UShI7UhQC/IGgN2OWn
	Zz5b4gz2dGRlAYRxZTf1nRhMQ3LLeRxWq7P7zTlc2ozAvW6D/IT3pR346H3XZofrFho+2VRE+Tqa+
	OGRqGHsckUIqgzEGoS4TPpnprhVzchyiAZTunX8Bq9/vAYQpoiJI7Klv7Fw4IRnzuLF9bvffOuvxL
	XL0bZN7stxy1wO52a9jFFGo22u5YCnzlVJLCa3hWnbQWBlikrN6tR7yMpnOuKp8vkcyJUWj0az4OA
	u23o7SHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgiSO-0000000E4tD-2lTO;
	Fri, 16 Jan 2026 11:57:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgiSL-0000000E4sc-3Vu9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 11:57:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 649971515;
	Fri, 16 Jan 2026 03:57:25 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 55D763F694;
	Fri, 16 Jan 2026 03:57:28 -0800 (PST)
Date: Fri, 16 Jan 2026 11:57:25 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ben Horgan <ben.horgan@arm.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
	baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
	dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
	fenghuay@nvidia.com, gshan@redhat.com, james.morse@arm.com,
	jonathan.cameron@huawei.com, kobak@nvidia.com, lcherian@marvell.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	peternewman@google.com, punit.agrawal@oss.qualcomm.com,
	quic_jiles@quicinc.com, reinette.chatre@intel.com,
	rohit.mathew@arm.com, scott@os.amperecomputing.com,
	sdonthineni@nvidia.com, tan.shaopeng@fujitsu.com,
	xhao@linux.alibaba.com, will@kernel.org, corbet@lwn.net,
	maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
	suzuki.poulose@arm.com, kvmarm@lists.linux.dev
Subject: Re: [PATCH v3 02/47] arm_mpam: Use non-atomic bitops when modifying
 feature bitmap
Message-ID: <aWonpc52-BMzcx8Q@arm.com>
References: <20260112165914.4086692-1-ben.horgan@arm.com>
 <20260112165914.4086692-3-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112165914.4086692-3-ben.horgan@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_035733_912468_95ECB70A 
X-CRM114-Status: GOOD (  18.12  )
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

On Mon, Jan 12, 2026 at 04:58:29PM +0000, Ben Horgan wrote:
> In the test__props_mismatch() kunit test we rely on the struct mpam_props
> being packed to ensure memcmp doesn't consider packing. Making it packed
> reduces the alignment of the features bitmap and so breaks a requirement
> for the use of atomics. As we don't rely on the set/clear of these bits
> being atomic, just make them non-atomic.
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since v2:
> Add comment (Jonathan)
> ---
>  drivers/resctrl/mpam_internal.h | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
> index 17cdc3080d58..e8971842b124 100644
> --- a/drivers/resctrl/mpam_internal.h
> +++ b/drivers/resctrl/mpam_internal.h
> @@ -200,8 +200,12 @@ struct mpam_props {
>  } PACKED_FOR_KUNIT;
>  
>  #define mpam_has_feature(_feat, x)	test_bit(_feat, (x)->features)
> -#define mpam_set_feature(_feat, x)	set_bit(_feat, (x)->features)
> -#define mpam_clear_feature(_feat, x)	clear_bit(_feat, (x)->features)
> +/*
> + * The non-atomic get/set operations are used because if struct mpam_props is
> + * packed, the alignment requirements for atomics aren't met.
> + */
> +#define mpam_set_feature(_feat, x)	__set_bit(_feat, (x)->features)
> +#define mpam_clear_feature(_feat, x)	__clear_bit(_feat, (x)->features)

After discussing privately, I can see how test__props_mismatch() can
end up with unaligned atomics on the mmap_props::features array. Happy to
pick it up for 6.19 (probably the first patch as well, though that's
harmless).

Is there a Fixes tag here for future reference?

-- 
Catalin

