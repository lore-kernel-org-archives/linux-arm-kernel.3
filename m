Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C633ECA0FE7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 13:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0m2sWPUfw4WGmrjj0/v5DAm5bIdAsXxUTb9OnKPU3Kg=; b=kek9p3HG2ul+q4s1/V7qNOAztL
	pz4ZITQKIyIcZY4gcQrWSgV3qVyhRYoRQoyzihOc5bRqge7v+hG7OrU4wOwP+RZ+VJsDSS5IqXOGI
	auZiE21cMWqv1ues5BxMU6gSmUjwUTlmo3br9ZZy/esUpVX9eNYy7muoGTyoq3XAK+jgAh12Uy5KO
	l2aJ+jAPvml8VqO0VdZ/IEtv8AizAaFJIh6m+n9kX6NdZqCjrpGAkpySRIxeJn8SLxlsmvuQuWL7v
	PNFbo/izp7kqr74tv/P359iN/HnOhDWmTDFyeHA1kR3LMO+oSNO40gmMoBeAnvQt5RZcVeIh2B6QL
	a/EI+cag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqtoG-0000000C7FQ-1WCS;
	Tue, 26 Aug 2025 13:34:00 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqtPg-0000000C2j0-0m6T
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 13:08:37 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4cB7G21F2Kz6LD9l;
	Tue, 26 Aug 2025 21:06:18 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 3F736140122;
	Tue, 26 Aug 2025 21:08:31 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 26 Aug
 2025 15:08:30 +0200
Date: Tue, 26 Aug 2025 14:08:29 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Yushan Wang <wangyushan12@huawei.com>
CC: <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<robin.murphy@arm.com>, <yangyicong@huawei.com>, <liuyonglong@huawei.com>,
	<wanghuiqiang@huawei.com>, <prime.zeng@hisilicon.com>,
	<hejunhao3@h-partners.com>
Subject: Re: [PATCH v2 6/9] drivers/perf: hisi: Refactor the event
 configuration of L3C PMU
Message-ID: <20250826140829.00002f65@huawei.com>
In-Reply-To: <20250821135049.2010220-7-wangyushan12@huawei.com>
References: <20250821135049.2010220-1-wangyushan12@huawei.com>
	<20250821135049.2010220-7-wangyushan12@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500001.china.huawei.com (7.191.163.213) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_060836_370610_F4ED38FB 
X-CRM114-Status: UNSURE (   8.95  )
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

On Thu, 21 Aug 2025 21:50:46 +0800
Yushan Wang <wangyushan12@huawei.com> wrote:

> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> The event register is configured using hisi_pmu::base directly since
> only one address space is supported for L3C PMU. We need to extend if
> events configuration locates in different address space. In order to
> make preparation for such hardware, extract the event register
> configuration to separate function using hw_perf_event::event_base as
> each event's base address.  Implement a private
> hisi_uncore_ops::get_event_idx() callback for initialize the event_base
> besides get the hardware index.
> 
> No functional changes intended.
> 
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> Signed-off-by: Yushan Wang <wangyushan12@huawei.com>
Acked-by: Jonathan Cameron <jonathan.cameron@huawei.com>

