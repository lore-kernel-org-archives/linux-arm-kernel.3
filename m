Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 384A0CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 16:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HmAxgL0dGy3jrMkGflVyD22w2uiWDtOAtpDFoRWp8V8=; b=H7yefIZi8vOexpUSTE+7eJh75u
	+nxmeUZislWLlw1XOI5KCNMVT6Yn4ibobFChRgY/mWyW7K0FdwehEGHIUA7UPV3AZqA7Mq5I8OBxz
	AkZ7eKpROu7FJ0pBsyqe5/H2+H1wAsxfB7hvyXSS3DRwo8VJbakryUQv4aIUm4H1mf7aZtYCAmzI3
	75o14zRr6UKYrmL59pduOd9J46t/5HVTw1WgS60nMPxzZk7+GopMlakO035zHnP8cVVQBnha8+FNQ
	wh7Y1sfPb0CR0NMubIDyaoyhmG6pExhor5XkeJRl1I3MWs1NQvruS0ftPno8PaHCbGa5KT0StaBsi
	9dJIWQZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7GOD-000000090Vt-0Bhk;
	Fri, 10 Oct 2025 16:54:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7GOB-000000090Ui-1C0F
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 16:54:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D20B31596;
	Fri, 10 Oct 2025 09:54:34 -0700 (PDT)
Received: from [10.1.197.69] (eglon.cambridge.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D3C033F66E;
	Fri, 10 Oct 2025 09:54:35 -0700 (PDT)
Message-ID: <ddf9b382-f760-4a9b-9f88-f215ef4b7930@arm.com>
Date: Fri, 10 Oct 2025 17:54:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 29/29] arm_mpam: Add kunit tests for props_mismatch()
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
 <20250910204309.20751-30-james.morse@arm.com>
 <2ed1be84-5097-488d-b8ce-7abebf5b9a7e@arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <2ed1be84-5097-488d-b8ce-7abebf5b9a7e@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_095443_366350_CF7D65DB 
X-CRM114-Status: UNSURE (   9.46  )
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

On 12/09/2025 17:01, Ben Horgan wrote:
> On 9/10/25 21:43, James Morse wrote:
>> When features are mismatched between MSC the way features are combined
>> to the class determines whether resctrl can support this SoC.
>>
>> Add some tests to illustrate the sort of thing that is expected to
>> work, and those that must be removed.


> Looks good to me, I checked the tests for v1. I agree with Jonathan that
> you could make RESET_FAKE_HIEARCHY() a function now that you've changed
> to use globals.
> 
> Reviewed-by: Ben Horgan <ben.horgan@arm.com>


Thanks!

James

