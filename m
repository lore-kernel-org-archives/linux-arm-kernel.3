Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE171D2D11F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 14:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ZI8Bt7/KMKdPs9SV3ne7hN/o57JvvEygen56EnmiE8=; b=wuOw89XlMV/0FANYDv+tma9d12
	aeq738VRWyO9gTk9Z0lhPQOEz5ILD6pervrlWw16GyqhvgfLrnM3kHiulEEEMk8t6yC6WtbNvmfpY
	XjdMvC6AQTIoiET5zmt8o02bl3qelWMAGIFN6Ydx+jTQVVZl6yNt8MNJY+zcS2FwCmGNmb1f0sXJL
	GlqWhgn5R44gazLgRR8k5DPN+pLqWdWl7iCdyKI51ZKxtP+5ibSaXceT4dL1QkQG/qTTbpl8lpt5D
	rvxhYTKN0fdIUzFH0qwAqPvs6gSRzbQg67oFo52BrPKSeVU+XxhRvtbLuoSM4tRgH3SvWOOLDKfVw
	o4S2QANg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vffrA-00000007J2L-0JlK;
	Tue, 13 Jan 2026 14:58:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vffr7-00000007J1x-39wI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 14:58:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA131497;
	Tue, 13 Jan 2026 06:58:41 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6C2B23F632;
	Tue, 13 Jan 2026 06:58:43 -0800 (PST)
Message-ID: <de0e4d8b-c9d2-4493-9379-ec16de0af795@arm.com>
Date: Tue, 13 Jan 2026 14:58:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 17/47] arm_mpam: resctrl: Implement
 resctrl_arch_reset_all_ctrls()
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, gshan@redhat.com, james.morse@arm.com,
 kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev,
 Zeng Heng <zengheng4@huawei.com>
References: <20260112165914.4086692-1-ben.horgan@arm.com>
 <20260112165914.4086692-18-ben.horgan@arm.com>
 <20260113144635.00000755@huawei.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20260113144635.00000755@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_065849_842225_28F1957C 
X-CRM114-Status: GOOD (  12.10  )
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

Hi Jonathan, Zeng,

On 1/13/26 14:46, Jonathan Cameron wrote:
> On Mon, 12 Jan 2026 16:58:44 +0000
> Ben Horgan <ben.horgan@arm.com> wrote:
> 
>> From: James Morse <james.morse@arm.com>
>>
>> We already have a helper for resetting an mpam class and component.  Hook
>> it up to resctrl_arch_reset_all_ctrls() and the domain offline path.
>>
>> Signed-off-by: James Morse <james.morse@arm.com>
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> 
> There was a question from Zhengheng on v2 that doesn't seem to be addressed
> and I'm not seeing a reply on list.  Maybe an email snafu?

Yes, sorry! For some reason I don't get his emails. :( It happened on
the base mpam driver series too. I'll keep a better look at lore and
reply to his v2 query.

> 
> https://lore.kernel.org/all/20260109034506.1176234-1-zengheng4@huawei.com/
> 
> Please +CC zhengheng on future versions if we need them!

Will do. Should be CC'd on this version too. I don't if there is an
email issue with that too.

Thanks,

Ben


