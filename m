Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B5CC982D7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 15:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IWeI/oFwpL3on1m4ks0olJgkQ/gme5VXb3QYQOKaQ1s=; b=sWh9R49gXRqswNNNgLe+hcJLTT
	WchQg9NTTRyBvXi6hleDoGZUY2qfKsvh6kxXCiexgQGqTUOFnF4yOjv0zzBka8pRFRRQ2ODb5sZ0E
	CCpyoXyMclGXxcolHu7zx0/bBDLx6AMedXcuJZGrG3awACmH37HtipN8GbMZUZDWdvVIsyMv+Bw4V
	vmkJrcyGMSE9F110DcgnSOubwqonotmyEi7X9HTptQmxlmTjt4buhnUYXFQnp/XMrFJjzcSF5bNHd
	OTO9bAyJlr1oXo5Pynkv2vrS0nLL/ZPwiTkEpr2S8m4eFT5h6OMGveXyGgXTard93eFQLMy18MAoc
	89CUlOPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgm6V-0000000EOkd-0lhQ;
	Fri, 16 Jan 2026 15:51:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgm6R-0000000EOkD-1dxE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 15:51:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8922B1515;
	Fri, 16 Jan 2026 07:51:03 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6DC563F59E;
	Fri, 16 Jan 2026 07:51:05 -0800 (PST)
Date: Fri, 16 Jan 2026 15:51:02 +0000
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
Message-ID: <aWpeZrgvSn2ab4VG@arm.com>
References: <20260112165914.4086692-1-ben.horgan@arm.com>
 <20260112165914.4086692-3-ben.horgan@arm.com>
 <aWonpc52-BMzcx8Q@arm.com>
 <b192241e-1b34-4d6c-bbb4-b53cdd98526f@arm.com>
 <c1dcc2a6-ca11-49e7-b7cd-d2ec70fed7f1@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c1dcc2a6-ca11-49e7-b7cd-d2ec70fed7f1@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_075111_544700_4F847B49 
X-CRM114-Status: GOOD (  22.76  )
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

On Fri, Jan 16, 2026 at 12:12:53PM +0000, Ben Horgan wrote:
> On 1/16/26 12:02, Ben Horgan wrote:
> > On 1/16/26 11:57, Catalin Marinas wrote:
> >> On Mon, Jan 12, 2026 at 04:58:29PM +0000, Ben Horgan wrote:
> >>> In the test__props_mismatch() kunit test we rely on the struct mpam_props
> >>> being packed to ensure memcmp doesn't consider packing. Making it packed
> >>> reduces the alignment of the features bitmap and so breaks a requirement
> >>> for the use of atomics. As we don't rely on the set/clear of these bits
> >>> being atomic, just make them non-atomic.
> >>>
> >>> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> >>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> >>> ---
> >>> Changes since v2:
> >>> Add comment (Jonathan)
> >>> ---
> >>>  drivers/resctrl/mpam_internal.h | 8 ++++++--
> >>>  1 file changed, 6 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
> >>> index 17cdc3080d58..e8971842b124 100644
> >>> --- a/drivers/resctrl/mpam_internal.h
> >>> +++ b/drivers/resctrl/mpam_internal.h
> >>> @@ -200,8 +200,12 @@ struct mpam_props {
> >>>  } PACKED_FOR_KUNIT;
> >>>  
> >>>  #define mpam_has_feature(_feat, x)	test_bit(_feat, (x)->features)
> >>> -#define mpam_set_feature(_feat, x)	set_bit(_feat, (x)->features)
> >>> -#define mpam_clear_feature(_feat, x)	clear_bit(_feat, (x)->features)
> >>> +/*
> >>> + * The non-atomic get/set operations are used because if struct mpam_props is
> >>> + * packed, the alignment requirements for atomics aren't met.
> >>> + */
> >>> +#define mpam_set_feature(_feat, x)	__set_bit(_feat, (x)->features)
> >>> +#define mpam_clear_feature(_feat, x)	__clear_bit(_feat, (x)->features)
> >>
> >> After discussing privately, I can see how test__props_mismatch() can
> >> end up with unaligned atomics on the mmap_props::features array. Happy to
> >> pick it up for 6.19 (probably the first patch as well, though that's
> >> harmless).
> > 
> > Yes please.
> > 
> >>
> >> Is there a Fixes tag here for future reference?
> >>
> > 
> > Yes, the mpam_set/clear macros were introduced in
> 
> The mpam_set_clear() actually comes after in:
> c10ca83a7783 arm_mpam: Merge supported features during mpam_enable() into mpam_class
> but I think the fixes below is still the correct one as it is where we could 
> first start seeing the problem.
> > 
> > Fixes: 8c90dc68a5de ("arm_mpam: Probe the hardware features resctrl supports")

Yes, I left the original as that's the one first introducing the atomic
bitops on this structure.

-- 
Catalin

