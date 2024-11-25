Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 758F8D5808D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 12:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:CC:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gX6RRUkhrXyt1eQce3tICLmtEBTomtuu1MbxPVMLSgA=; b=061GmHxTe9erJmJv8XuZ2Yr1tQ
	zoSRoZ4pCTmFchqH6/CXHzsOy4BDZZtSbsmbAYQ1olOtxCcO9MowjKhQifmzD1dc8UYzjjQHBFzhj
	n7AyA5l9XApvCzEPKmPlLMBhX+MTpshjtwktvJ+6HAiKEG4NcrnXgp3AdV6N0Wd+HWFRiWDIUS/2S
	2QMGR9pAvoSM/hfXt/IgmnpMMyPbbAp2JFTiFJH4nZ2xHaYHY6SyfvoLcMZGS3Oo8IDn1hzP1PDrJ
	2toe82/zv/lTo5TD1qv23vmHH1+Q1PCs0NweoN7TquhCCjl9fpsSfhL9sHCE5JdxUUs+i4rWvhPIq
	Yl9c452w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFY7x-0000000801I-1FGE;
	Mon, 25 Nov 2024 12:23:41 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFY70-00000007zsX-0Gxt;
	Mon, 25 Nov 2024 12:22:43 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4XxlCR4Ctgz10WWS;
	Mon, 25 Nov 2024 20:20:19 +0800 (CST)
Received: from kwepemh100007.china.huawei.com (unknown [7.202.181.92])
	by mail.maildlp.com (Postfix) with ESMTPS id E18401401F0;
	Mon, 25 Nov 2024 20:22:26 +0800 (CST)
Received: from [10.67.111.53] (10.67.111.53) by kwepemh100007.china.huawei.com
 (7.202.181.92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 25 Nov
 2024 20:22:26 +0800
Message-ID: <a8ccbb56-d72c-4752-8ff7-d9166fccb0d0@huawei.com>
Date: Mon, 25 Nov 2024 20:22:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: <zhangkunbo@huawei.com>
CC: <airlied@gmail.com>, <chris.zjh@huawei.com>,
	<dri-devel@lists.freedesktop.org>, <liaochang1@huawei.com>,
	<linux-amlogic@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <maarten.lankhorst@linux.intel.com>,
	<mripard@kernel.org>, <neil.armstrong@linaro.org>, <simona@ffwll.ch>,
	<tzimmermann@suse.de>
References: <20241106024548.1915611-1-zhangkunbo@huawei.com>
Subject: Re: [PATCH] drm/meson: Avoid use-after-free issues with crtc
From: zhangkunbo <zhangkunbo@huawei.com>
In-Reply-To: <20241106024548.1915611-1-zhangkunbo@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.111.53]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemh100007.china.huawei.com (7.202.181.92)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_042242_288714_7D9F4F0C 
X-CRM114-Status: UNSURE (   1.90  )
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

gently ping.


