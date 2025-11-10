Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 385A5CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 17:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VRrMPiScGAkxq2o3CAM6RtgVvc3fZqxcR9AIGzfTzIQ=; b=G7RkvtDPpu+Zz2fwABJRtIb4gL
	OlUn4r6LLQT1QgZkAAuV/vfZgADUAw538/TPJ331dXf2IUO6U9Sp08y69KA9B6edaYb9gwDMyWGlw
	Ql8mDBuIOVzpaW5RaJhm5z6Rg2YmrEJBb/noZM6O2srs228B8G9oQIJAz8rsenDkF2598IeSru0/h
	157kvm6fba1VT+QrfkZ7dBiVtL01c8ELh9w5lnJcX2RMkGAVC00kaKjegcyGpS+5afyQ7FqlIjLc7
	roNV4+i2VgFaj1AMzifzjgHij5toBT4ikmwRKpJJBMFwMaB5O821IPkx6I2fk2gDocPZePWwlGmzK
	/zHcsLQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIVn0-00000005v2s-0P3p;
	Mon, 10 Nov 2025 17:34:50 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIVmy-00000005v1w-0R3X
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 17:34:49 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4d4xcP5p8nzHnH4q;
	Tue, 11 Nov 2025 01:34:29 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 534951400D9;
	Tue, 11 Nov 2025 01:34:45 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Mon, 10 Nov
 2025 17:34:43 +0000
Date: Mon, 10 Nov 2025 17:34:42 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Ben Horgan <ben.horgan@arm.com>
CC: <james.morse@arm.com>, <amitsinght@marvell.com>,
	<baisheng.gao@unisoc.com>, <baolin.wang@linux.alibaba.com>,
	<bobo.shaobowang@huawei.com>, <carl@os.amperecomputing.com>,
	<catalin.marinas@arm.com>, <dakr@kernel.org>, <dave.martin@arm.com>,
	<david@redhat.com>, <dfustini@baylibre.com>, <fenghuay@nvidia.com>,
	<gregkh@linuxfoundation.org>, <gshan@redhat.com>, <guohanjun@huawei.com>,
	<jeremy.linton@arm.com>, <kobak@nvidia.com>, <lcherian@marvell.com>,
	<lenb@kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<lpieralisi@kernel.org>, <peternewman@google.com>, <quic_jiles@quicinc.com>,
	<rafael@kernel.org>, <robh@kernel.org>, <rohit.mathew@arm.com>,
	<scott@os.amperecomputing.com>, <sdonthineni@nvidia.com>,
	<sudeep.holla@arm.com>, <tan.shaopeng@fujitsu.com>, <will@kernel.org>,
	<xhao@linux.alibaba.com>, Fenghua Yu <fenghuay@nvdia.com>
Subject: Re: [PATCH 31/33] arm_mpam: Add helper to reset saved mbwu state
Message-ID: <20251110173442.000053fe@huawei.com>
In-Reply-To: <20251107123450.664001-32-ben.horgan@arm.com>
References: <20251107123450.664001-1-ben.horgan@arm.com>
	<20251107123450.664001-32-ben.horgan@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500011.china.huawei.com (7.191.174.215) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_093448_286824_CF133437 
X-CRM114-Status: UNSURE (   9.20  )
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

On Fri, 7 Nov 2025 12:34:48 +0000
Ben Horgan <ben.horgan@arm.com> wrote:

> From: James Morse <james.morse@arm.com>
> 
> resctrl expects to reset the bandwidth counters when the filesystem
> is mounted.
> 
> To allow this, add a helper that clears the saved mbwu state. Instead
> of cross calling to each CPU that can access the component MSC to
> write to the counter, set a flag that causes it to be zero'd on the
> the next read. This is easily done by forcing a configuration update.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Reviewed-by: Fenghua Yu <fenghuay@nvdia.com>
> Tested-by: Fenghua Yu <fenghuay@nvidia.com>
> Cc: Peter Newman <peternewman@google.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>




