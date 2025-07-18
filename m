Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68EFFC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 12:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vv5TWpEB6gsRzedrfh2ltipaqB9vueeGyIpbpJfQaY0=; b=f6PmgL1343Jiw60fr6VJ/EhLCg
	BgdtrKTiCAtKpbRlSSmDm6pjYDg4b3eQbcUpt/kodslNgCXgYBVxjsVLcKOea5eseuFcsC8nlJvFi
	WH9MdP/EMvXAIh/R1Fvz3hshPSbSz65tLWWUkJzbeZhcagV3KTn8eaAy3J+soyCW7yFxlr32TaSq6
	zZmQi50cP0rTKM+d9vXkSMp2hDlOzToPHVLyhWKO5+HSD2ujuYCO/093bN6n5Jlp8xbSIplTnewyO
	SIOGTn2QU/vGSCBpHvcz9y7hTFzB9N0fm8S6YEsydJ+AG58Wkonzam490oJneSTl5rjeEpqyorcyK
	RHYV3wvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucjwb-0000000CYDl-0l3E;
	Fri, 18 Jul 2025 12:12:05 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucizM-0000000CP3c-1nMX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 11:10:54 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bk6W943lmz6M4jb;
	Fri, 18 Jul 2025 19:09:25 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id DC339140371;
	Fri, 18 Jul 2025 19:10:43 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 18 Jul
 2025 13:10:43 +0200
Date: Fri, 18 Jul 2025 12:10:42 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Alireza Sanaee <alireza.sanaee@huawei.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<coresight@lists.linaro.org>, <dianders@chromium.org>,
	<james.clark@linaro.org>, <krzk@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-perf-users@vger.kernel.org>,
	<linuxarm@huawei.com>, <mark.rutland@arm.com>, <mike.leach@linaro.org>,
	<robh@kernel.org>, <ruanjinjie@huawei.com>, <saravanak@google.com>,
	<shameerali.kolothum.thodi@huawei.com>, <suzuki.poulose@arm.com>
Subject: Re: [PATCH v3 1/6] of: add infra for finding CPU id from phandle
Message-ID: <20250718121042.00007fe5@huawei.com>
In-Reply-To: <20250718094848.587-2-alireza.sanaee@huawei.com>
References: <20250718094848.587-1-alireza.sanaee@huawei.com>
	<20250718094848.587-2-alireza.sanaee@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100003.china.huawei.com (7.191.160.210) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_041052_609857_C18C3EAB 
X-CRM114-Status: UNSURE (   9.93  )
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

On Fri, 18 Jul 2025 10:48:43 +0100
Alireza Sanaee <alireza.sanaee@huawei.com> wrote:

> Get CPU ID from phandle. Some drivers such as coresight, cti-coresight,
> or arm-dsu use this API for finding CPU node in DT. In particular,
> drivers do this by getting the CPU device_node through a phandle and
> then find the CPU ID using of_cpu_node_to_id(). This commit encapsulates
> CPU node finding and improves readability.
> 
> The API interface takes three parameters, 1) node, 2) pointer to
> pointer of CPU node, 3) CPU node index. API sets the pointer to the CPU
> node and allows the driver to work with the CPU node, for logging
> purposes for instance.
> 
> Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

