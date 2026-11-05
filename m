Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296BA606A329
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 12:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EQotJC2P;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=jHQeGkBo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/NsG0cyMzXROSstgbjVKXoEsL+g2CwtLRSNxnglyzKA=; b=EQotJC2PMMJA1z
	CukqUGy/nDgO8cvBTvGHkMZkX9Mjp6fphihD1GalwGDJdAfDTTb6wDCaZG+suEVLRiy1D0OuyoKIh
	uCHQiZr7Mv1f81ei+3rijbdttDZvVf1bN3wH/ACfRGAUqgLxp7SB3DrmpW7Mysag2h2Fr7iTEQxBQ
	BvsDsjL5QGnyHraxy6KknB1QMwTbmBQY0V5e2gnEqnW1mCxJr7H+mFlnNGDQeOvc85K+g2F5FuLRC
	muWoQSlochKu5BO2cIHy6ADmQGCcRfZhWLfxsT1MJZsUe8tS37qzJd7a6yF8iGRxehJUmt6yzSGGN
	2jzDMxBNusSH6WEuaNoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwhi-00000008ytx-25oh;
	Thu, 05 Nov 2026 12:36:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwhd-00000008ysU-2RoM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 12:36:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF0331E8D;
	Thu,  5 Nov 2026 04:36:21 -0800 (PST)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 978DF3F673;
	Thu,  5 Nov 2026 04:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793882184; bh=Xy2a35D5lFs3xumDyQSNHeQOf3ovIJScDgtK1Ak0u04=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jHQeGkBozT/P4vps+KO9ztDP0/y2NBmMxgQj1XLDVLrgzbghOtq+A4YxSebRD114v
	 RaJDs7jmao2mC0baEwZGDmyQFlADuqFH5RLPwGmr+9yleq0uPMQig6k3EKtZF7sgzh
	 4hED0g3Z2l1Tf+AlvvQnAw+9ZkTlntjqurTZEDpM=
Message-ID: <6fb4ce7c-c173-4e86-8f8b-9bbc53751d8c@arm.com>
Date: Thu, 5 Nov 2026 12:36:19 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/40] arm64: mpam: Context switch the MPAM registers
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, gshan@redhat.com, james.morse@arm.com,
 jonathan.cameron@huawei.com, kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev,
 zengheng4@huawei.com, linux-doc@vger.kernel.org,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20260313144617.3420416-1-ben.horgan@arm.com>
 <20260313144617.3420416-7-ben.horgan@arm.com>
 <145b3c09-ff33-4fd7-935a-fa4f4c3c07b2@huawei.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <145b3c09-ff33-4fd7-935a-fa4f4c3c07b2@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_043625_667230_4C9881C1 
X-CRM114-Status: GOOD (  11.92  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jinjie,

On 05/11/2026 12:20, Jinjie Ruan wrote:
> 
> 
> 在 2026/3/13 22:45, Ben Horgan 写道:

> 
> Hi, everyone,
> 
> We found a problem as below:
> 
> In an offline/online co-located setup, MPAM gives the offline group a
> smaller MBW share, a softirq serving an online service runs with the
> PARTID of the throttled offline task it interrupted and is throttled
> with it -- a priority inversion.
> 
> Is this a known limitation?

Yes. The initial MPAM support was introduced with the userspace and kernel PARTID changing in
lockstep so that it matched the standard x86 setup. This left the way open for a generic resctrl way
to express that they may be different.

> 
> I see the following patchset uses a separate closid for kernel.
> 
> https://lore.kernel.org/all/cover.1790867441.git.babu.moger@amd.com/
> 
MPAM should be able to work with that as outlined by Reinette [1].

[1] https://lore.kernel.org/lkml/2ab556af-095b-422b-9396-f845c6fd0342@intel.com/

Thanks,

Ben

