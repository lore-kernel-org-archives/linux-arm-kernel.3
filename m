Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2054CFD45F1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 21:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:To:From:References:Cc:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LeCyiE0NEQNgusKghvMDgS8ozhD6SRGdcmuWjNBT2wo=; b=ZulU5qY89Yj1EqQLFb6FGmf0mI
	oYyiEp9/47aMAq/V6rGPzjvaRu3P2ubJii492dtS0+yK6pdOGGvWFOcjQ1X8hlP7mnUIOWBGXVnDg
	zlEmi4X8TP3iu6OeeAtbfDuUhdpt9FJe9SzGFT3lw/pEBX2KeHbkFDSoctZfpIQQPxZ2/N+u92r0J
	tMFa7+LiIDl1gScc9elQ2heHV1XIAQTHf9oOtsOxhBOVYjb+nJ7vbxMVpkWe1uBlFjWRAT+N3BWvF
	NhXGSEtCZNbX+DMdzA1yykHP//WR6/qRAXd6M/VWVM8KJTpgcQ87fW0g79CdM6rqbKqYSY20cYcTj
	YPbwprAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvM9M-00000004tpR-16aF;
	Wed, 25 Feb 2026 21:10:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvM9J-00000004toa-0SFd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 21:10:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E585515A1;
	Wed, 25 Feb 2026 13:10:17 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A480F3F62B;
	Wed, 25 Feb 2026 13:10:19 -0800 (PST)
Message-ID: <6051a508-1e77-4216-9b41-4b93b21c18c3@arm.com>
Date: Wed, 25 Feb 2026 21:10:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/41] arm_mpam: Add KVM/arm64 and resctrl glue code
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
 zengheng4@huawei.com, linux-doc@vger.kernel.org
References: <20260224175720.2663924-1-ben.horgan@arm.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
To: ben.horgan@arm.com
In-Reply-To: <20260224175720.2663924-1-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_131025_185950_305785C4 
X-CRM114-Status: GOOD (  14.09  )
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



On 2/24/26 17:56, Ben Horgan wrote:
> The main change in this version of the mpam missing pieces series is to
> update the cdp emulation to match the resctrl interface. L2 and L3
> resources can now enable cdp separately. Cdp can't be hidden correctly for
> memory bandwidth allocation, as max per partid can't be emulated with more
> partids, and so we hide this completely when cdp is enabled. There is a little
> restructuring and a few smaller changes.
> 
> Changelogs in patches
> 
> It would be great to get this series merged this cycle. For that we'll need
> more testing and reviewing. Thanks!
> 

There is a small build conflict with resctrl abmc precursors, [1]. The
last patch of that series applies on top of this series and if the abmc
precursors go first that patch should go with this series to fix the
build. Alternatively, if it's obvious ahead of time it can be squashed
into pathc 33 with the other empty resctrl arch hooks.

[1]
https://lore.kernel.org/lkml/20260225201905.3568624-5-ben.horgan@arm.com/


Thanks,

Ben


