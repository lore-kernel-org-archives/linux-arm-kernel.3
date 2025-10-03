Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE71ECAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 18:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4eHHzocHHtz2wCKBm3r2zI/nINuL5/9x64rUy0eAOAs=; b=fMoLONaO51frD/+PN8TrYdy9N6
	xTUFKEr+Oi43LWWj+m30Alaox5sFObBEZ5ZB5pROuH0Sx4jY0FYqmyrRvuvoOSOL086Kz3RZcGcMU
	tftIQN246W3DqwzMCM0X10yoOKjXv+tlBvqmGwe96/piL/seSMk02gH6bJnba0D9fkbJwiCZ4t1Nx
	nq0y2Ju13TbzYlVIN4UNbuFdmWjA82TKmdmrcJeuwxrTAn7aXbSe0AFaIscbtJPSUqZ2+5/GLxlye
	IsESoomuHku8+8uEgStSBB1RLgXpY439Qkw+VgTvjIdKjw+Jyn1bEIkQAc+FXHayOdHIPye+q8lhZ
	bS+xMH8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4k8L-0000000CtlF-3jGz;
	Fri, 03 Oct 2025 18:03:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4k8J-0000000CtkM-3L37
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 18:03:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 62E061596;
	Fri,  3 Oct 2025 11:03:46 -0700 (PDT)
Received: from [10.1.197.69] (eglon.cambridge.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F2DA63F5A1;
	Fri,  3 Oct 2025 11:03:48 -0700 (PDT)
Message-ID: <85bef7bc-42c9-4a27-b74e-35fbbae4b39b@arm.com>
Date: Fri, 3 Oct 2025 19:03:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 19/29] arm_mpam: Use a static key to indicate when mpam
 is enabled
To: Ben Horgan <ben.horgan@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org
Cc: D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 fenghuay@nvidia.com, baisheng.gao@unisoc.com,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Rob Herring
 <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>
References: <20250910204309.20751-1-james.morse@arm.com>
 <20250910204309.20751-20-james.morse@arm.com>
 <7b72615a-a1a5-4945-9199-d30b7caee70b@arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <7b72615a-a1a5-4945-9199-d30b7caee70b@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_110355_878582_701EC734 
X-CRM114-Status: UNSURE (   9.07  )
X-CRM114-Notice: Please train this message.
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

On 12/09/2025 15:42, Ben Horgan wrote:
> On 9/10/25 21:42, James Morse wrote:
>> Once all the MSC have been probed, the system wide usable number of
>> PARTID is known and the configuration arrays can be allocated.
>>
>> After this point, checking all the MSC have been probed is pointless,
>> and the cpuhp callbacks should restore the configuration, instead of
>> just resetting the MSC.
>>
>> Add a static key to enable this behaviour. This will also allow MPAM
>> to be disabled in repsonse to an error, and the architecture code to
>> enable/disable the context switch of the MPAM system registers.

> Reviewed-by: Ben Horgan <ben.horgan@arm.com>

Thanks!

James

