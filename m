Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF773C79FA5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 16:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GKdz+k4iljiYAeEMxvsKTFvXrugUbxuOwtv53gwxziM=; b=vpIpjgm4V8nUu+Bbjc3ntWmFrv
	CBVx/Nmod8j6bKI+HU1fgs3NP8NXR61bkQt6PeyEWJ5A8wz0skOe7J178iQbJnQkF7GU8ZeIEAUwl
	E7mtDrgi6LD/mWu26brFzF2Om2M4LnoukrMyec0+AKikhbQRtgczt1E/0Wx0up4Gst6t5mYpS883Z
	JB2fKszrlE4xXXXkFP3fGdOHCrCsX+zSiHwnLLyEZanxwnNIIVDFaivwOUnp/tdaCzPWxjmjq7bS9
	Rma4ARrWE+tjor1mt06gv+Kn2tkTgLWDn+jgGL03JyIptvAaA2thKkQLxA3O1WwjIcUOBBR7IKfzL
	Rsvok1GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcnXi-0000000Bjh3-3DlL;
	Mon, 05 Jan 2026 16:34:54 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcnXf-0000000Bjg9-423V
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 16:34:54 +0000
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dlKcM6dllzJ46Ck;
	Tue,  6 Jan 2026 00:33:39 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 87DB940569;
	Tue,  6 Jan 2026 00:34:40 +0800 (CST)
Received: from localhost (10.126.174.38) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Mon, 5 Jan
 2026 16:34:38 +0000
Date: Mon, 5 Jan 2026 16:34:37 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Ben Horgan <ben.horgan@arm.com>
CC: <amitsinght@marvell.com>, <baisheng.gao@unisoc.com>,
	<baolin.wang@linux.alibaba.com>, <carl@os.amperecomputing.com>,
	<dave.martin@arm.com>, <david@kernel.org>, <dfustini@baylibre.com>,
	<fenghuay@nvidia.com>, <gshan@redhat.com>, <james.morse@arm.com>,
	<kobak@nvidia.com>, <lcherian@marvell.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<peternewman@google.com>, <punit.agrawal@oss.qualcomm.com>,
	<quic_jiles@quicinc.com>, <reinette.chatre@intel.com>,
	<rohit.mathew@arm.com>, <scott@os.amperecomputing.com>,
	<sdonthineni@nvidia.com>, <tan.shaopeng@fujitsu.com>,
	<xhao@linux.alibaba.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<corbet@lwn.net>, <maz@kernel.org>, <oupton@kernel.org>,
	<joey.gouly@arm.com>, <suzuki.poulose@arm.com>, <kvmarm@lists.linux.dev>
Subject: Re: [PATCH v2 03/45] arm_mpam: Use non-atomic bitops when modifying
 feature bitmap
Message-ID: <20260105163305.00002306@huawei.com>
In-Reply-To: <20251219181147.3404071-4-ben.horgan@arm.com>
References: <20251219181147.3404071-1-ben.horgan@arm.com>
	<20251219181147.3404071-4-ben.horgan@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.126.174.38]
X-ClientProxiedBy: lhrpeml500009.china.huawei.com (7.191.174.84) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_083452_144744_557864FB 
X-CRM114-Status: GOOD (  16.83  )
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

On Fri, 19 Dec 2025 18:11:05 +0000
Ben Horgan <ben.horgan@arm.com> wrote:

> In the test__props_mismatch() kunit test we rely on the struct mpam_props
> being packed to ensure memcmp doesn't consider packing. Making it packed
> reduces the alignment of the features bitmap and so breaks a requirement
> for the use of atomics. As we don't rely on the set/clear of these bits
> being atomic, just make them non-atomic.

oh. That's a bit horrible.

Whilst I guess no one is likely to 'upgrade' these it feels odd enough that
I'd be tempted to leave a breadcrumb of a comment next to them on why
they must be the non atomic versions.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

Jonathan


> 
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
>  drivers/resctrl/mpam_internal.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
> index 17cdc3080d58..aaaf31ca9210 100644
> --- a/drivers/resctrl/mpam_internal.h
> +++ b/drivers/resctrl/mpam_internal.h
> @@ -200,8 +200,8 @@ struct mpam_props {
>  } PACKED_FOR_KUNIT;
>  
>  #define mpam_has_feature(_feat, x)	test_bit(_feat, (x)->features)
> -#define mpam_set_feature(_feat, x)	set_bit(_feat, (x)->features)
> -#define mpam_clear_feature(_feat, x)	clear_bit(_feat, (x)->features)
> +#define mpam_set_feature(_feat, x)	__set_bit(_feat, (x)->features)
> +#define mpam_clear_feature(_feat, x)	__clear_bit(_feat, (x)->features)
>  
>  /* The values for MSMON_CFG_MBWU_FLT.RWBW */
>  enum mon_filter_options {


