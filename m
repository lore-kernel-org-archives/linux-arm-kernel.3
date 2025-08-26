Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4158ACA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 13:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JM/Ekttc/QGK5Q7dTAm7FoE1Xm5dUqyHKYZqY3T/pug=; b=K1OAwf7fJUltsZFSCgXHN+bAMI
	TrKgtjc5CDQM0C4DgLup7BkRvVX9GI7xnXdAm2PamgZXMD7+BYDHwzzqxcjLthZOP2PvEoWOz4UG7
	4HGorTLpeh8gmWyNJllbbrONvmGaTD+rR+toZantMJgZuUEfSiQkgOYRFEWUWMoP59KLdkghZnSJ0
	MebvabDj9eis+h3aLgCE666OFGZHj83sEJ07iLDiqjzyWwXJit19kuIqItpm59ZyiEfZGIunhJV+O
	OxkeOdxmSgp0BsJYenk3Yxd7dTUkWI8a5NnRgqhDkX5uII37E6w/z1Jl067sTtsL7e/bgbzfwyKTH
	LmvZVvbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqtdW-0000000C5IS-2n9A;
	Tue, 26 Aug 2025 13:22:54 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqtOS-0000000C2Qy-0CmU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 13:07:21 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4cB7DZ3vGBz6LD9l;
	Tue, 26 Aug 2025 21:05:02 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 8712F1404FE;
	Tue, 26 Aug 2025 21:07:18 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 26 Aug
 2025 15:07:17 +0200
Date: Tue, 26 Aug 2025 14:07:16 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Yushan Wang <wangyushan12@huawei.com>
CC: <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<robin.murphy@arm.com>, <yangyicong@huawei.com>, <liuyonglong@huawei.com>,
	<wanghuiqiang@huawei.com>, <prime.zeng@hisilicon.com>,
	<hejunhao3@h-partners.com>
Subject: Re: [PATCH v2 5/9] drivers/perf: hisi: Extend the field of tt_core
Message-ID: <20250826140716.000079ba@huawei.com>
In-Reply-To: <20250821135049.2010220-6-wangyushan12@huawei.com>
References: <20250821135049.2010220-1-wangyushan12@huawei.com>
	<20250821135049.2010220-6-wangyushan12@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500001.china.huawei.com (7.191.163.213) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_060720_233232_D4A039FC 
X-CRM114-Status: UNSURE (   7.25  )
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

On Thu, 21 Aug 2025 21:50:45 +0800
Yushan Wang <wangyushan12@huawei.com> wrote:

> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> Currently the tt_core's using config1's bit [7, 0] and can not be
> extended. For some platforms there's more the 8 CPUs sharing the
> L3 cache. So make tt_core use config2's bit [15, 0] and the remaining
> bits in config2 is reserved for extension.
> 
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> Signed-off-by: Yushan Wang <wangyushan12@huawei.com>
Acked-by: Jonathan Cameron <jonathan.cameron@huawei.com>

