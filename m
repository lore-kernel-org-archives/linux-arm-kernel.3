Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44262C83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 09:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CicbBdC208vKhBivE60UBC2n+cr2IO5c+q2qDbrd2Ig=; b=Kh57OTAlJowkWloI2chv+Vdw2/
	BsZg/EQfcSM3yoO3ALB598me81jJ1TqlaVZSxqrfuEP5/5z/i+fvNDAce7PD6/kbGT9Eaheb+/wfH
	42q0MuJx6TCJ+ZjwRiT0Z3yEaKF9qp0zvn72z2BHn/rx3rj5ZQiN03TgIkbvBRCeoKkKfoPl/0a2Q
	2l1wr4HrY1v5kinw9+HEFiH681ee/KwL/Xw0u/QsVpb6vVc5e/IWpHA4K6AVQH0Txdks5+EVVXP5K
	SrDyX57m8xrj6nbIXewbaxTTtJmLNvw8n41ie+PZ0bOA+P180HIOt4kDnqwsg/iHO6KyeP/qdAGSb
	bp/pwLng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYia1-0000000246C-1TBd;
	Mon, 07 Jul 2025 09:56:09 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYiFQ-00000001zri-0rtq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 09:34:54 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bbJsM5F1Wz6L5H5;
	Mon,  7 Jul 2025 17:31:35 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 15D311402F0;
	Mon,  7 Jul 2025 17:34:42 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 7 Jul
 2025 11:34:41 +0200
Date: Mon, 7 Jul 2025 10:34:40 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: James Morse <james.morse@arm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki"
	<rafael@kernel.org>, <sudeep.holla@arm.com>, Rob Herring <robh@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>, Catalin Marinas <catalin.marinas@arm.com>,
	<WillDeaconwill@kernel.org>
Subject: Re: [PATCH v2 1/3] cacheinfo: Set cache 'id' based on DT data
Message-ID: <20250707103440.000048ff@huawei.com>
In-Reply-To: <20250704173826.13025-2-james.morse@arm.com>
References: <20250704173826.13025-1-james.morse@arm.com>
	<20250704173826.13025-2-james.morse@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500003.china.huawei.com (7.191.162.67) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_023452_393618_2175F821 
X-CRM114-Status: GOOD (  14.16  )
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

On Fri, 4 Jul 2025 17:38:24 +0000
James Morse <james.morse@arm.com> wrote:

> From: Rob Herring <robh@kernel.org>
> 
> Use the minimum CPU h/w id of the CPUs associated with the cache for the
> cache 'id'. This will provide a stable id value for a given system. As
> we need to check all possible CPUs, we can't use the shared_cpu_map
> which is just online CPUs. As there's not a cache to CPUs mapping in DT,
> we have to walk all CPU nodes and then walk cache levels.
> 
> The cache_id exposed to user-space has historically been 32 bits, and
> is too late to change. This value is parsed into a u32 by user-space
> libraries such as libvirt:
> https://github.com/libvirt/libvirt/blob/master/src/util/virresctrl.c#L1588
> 
> Give up on assigning cache-id's if a CPU h/w id greater than 32 bits
> is found.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Signed-off-by: Rob Herring <robh@kernel.org>
> [ ben: converted to use the __free cleanup idiom ]
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> [ morse: Add checks to give up if a value larger than 32 bits is seen. ]
> Signed-off-by: James Morse <james.morse@arm.com>

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

