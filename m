Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D6E6CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 16:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9KhGrrFwBTnP2q2Y8Fs2ZCS9bR2EKrkVhd5ZnlLaAjk=; b=bZe7+4rEb95xunoizhG+bpJ+xC
	uMijSdEMF7M1r7BDrbTtXe5XSlEiyajaLvoEOp9fLCoEg7CGmnIWL2Hi2UzO6m118da4O/Wvq4vrA
	haocoaKyCg2bMuqajd1VUVm07stk0LJ7T0jDG29kPFRSq4TwK+haxsgbIZ/5bliyF6zfeyLgDbSDA
	ynorbEBEutSkc0leS9/MH9FzfliT2qqrjAQhvYdBaaF5ewifWaOQAz7Qr8ObKvKCOvZCjjtmmMM6o
	jxoPd6BiQZABqDKZO3daWLQGqfOYPfUB+MmZ42y3PA6MJC434RLlsOHbtqtKOhLiVl+BVt0JyCPPB
	iHJbVZ8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us2Iv-00000006S33-3A7p;
	Fri, 29 Aug 2025 16:50:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urzYv-00000005vme-1tLt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 13:54:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7460D1655;
	Fri, 29 Aug 2025 06:54:32 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E15CD3F694;
	Fri, 29 Aug 2025 06:54:34 -0700 (PDT)
Message-ID: <b8af1782-0fb8-4e6e-8895-b229a1c67ebe@arm.com>
Date: Fri, 29 Aug 2025 14:54:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/33] arm_mpam: Merge supported features during
 mpam_enable() into mpam_class
To: James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, fenghuay@nvidia.com,
 baisheng.gao@unisoc.com, Jonathan Cameron <jonathan.cameron@huawei.com>,
 Rob Herring <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>
References: <20250822153048.2287-1-james.morse@arm.com>
 <20250822153048.2287-19-james.morse@arm.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20250822153048.2287-19-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_065441_532957_CB0B35F6 
X-CRM114-Status: GOOD (  12.84  )
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

On 8/22/25 16:29, James Morse wrote:
> To make a decision about whether to expose an mpam class as
> a resctrl resource we need to know its overall supported
> features and properties.
> 
> Once we've probed all the resources, we can walk the tree
> and produce overall values by merging the bitmaps. This
> eliminates features that are only supported by some MSC
> that make up a component or class.
> 
> If bitmap properties are mismatched within a component we
> cannot support the mismatched feature.
> 
> Care has to be taken as vMSC may hold mismatched RIS.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
>  drivers/resctrl/mpam_devices.c  | 215 ++++++++++++++++++++++++++++++++
>  drivers/resctrl/mpam_internal.h |   8 ++
>  2 files changed, 223 insertions(+)

Intricate but, as far as I can tell, all correct.

Reviewed-by: Ben Horgan <ben.horgan@arm.com>

Thanks,

Ben


