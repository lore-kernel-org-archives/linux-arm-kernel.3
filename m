Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0927ACCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 17:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RmvcaiH1tVwuPO3wp5wOaIz+xlxUZBeLwSdfr2/G5BQ=; b=B1EiAGuabuVXa6/9llCDinL9b8
	bnskZOZ+icjfKkKiS6J+9F3lgm1qWivmqpcqwNkG2JX9io7eKBiAROFsfIRzdAyQ2P/TWJynIqoTg
	GU7WKjoib1rH4kmxdETkdk77fy55DYVpvQNHVijMbvMKmf9F0L+FfitlyTyewKJ5+DiLixZdJY6Tu
	Pe6DPGf4fTAaElWAzWxB4uw0NXA1x2EtexUZRZ2n4M+M28G99pgnDN7RbqOY/J7UMSLO1mPUaXCzN
	bsvWduOSrzdcp+8NMlX83KUxcvBZK3BpnGJ9qAfR+Gi/CE9SPMCP9VAWvNdqeFs2Jm+JDbcDdaZLu
	DzfJ3cZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIVlO-00000005uSW-0iMv;
	Mon, 10 Nov 2025 17:33:10 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIVlL-00000005uS8-3xJs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 17:33:09 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4d4xZ84c61zJ46bj;
	Tue, 11 Nov 2025 01:32:32 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 3540314027A;
	Tue, 11 Nov 2025 01:33:02 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Mon, 10 Nov
 2025 17:33:00 +0000
Date: Mon, 10 Nov 2025 17:32:59 +0000
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
	<xhao@linux.alibaba.com>, Zeng Heng <zengheng4@huawei.com>
Subject: Re: [PATCH 28/33] arm_mpam: Consider overflow in bandwidth counter
 state
Message-ID: <20251110173259.00002c88@huawei.com>
In-Reply-To: <20251107123450.664001-29-ben.horgan@arm.com>
References: <20251107123450.664001-1-ben.horgan@arm.com>
	<20251107123450.664001-29-ben.horgan@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500011.china.huawei.com (7.191.174.215) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_093308_128154_FB721981 
X-CRM114-Status: UNSURE (   9.01  )
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

On Fri, 7 Nov 2025 12:34:45 +0000
Ben Horgan <ben.horgan@arm.com> wrote:

> Use the overflow status bit to track overflow on each bandwidth counter
> read and add the counter size to the correction when overflow is detected.
> 
> This assumes that only a single overflow has occurred since the last read
> of the counter. Overflow interrupts, on hardware that supports them could
> be used to remove this limitation.
> 
> Cc: Zeng Heng <zengheng4@huawei.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>


