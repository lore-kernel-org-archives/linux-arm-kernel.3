Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C749C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 18:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i+EDfhQG2C6YpXlk9G1OOsoM6tGxQ2rQdluVAy3sdS0=; b=zksym4PlHJqrDBLEhSHw6FYeDZ
	2UOLQK8Go+3PIRdRwWBnPGGawDA8deHI6joEVUNR/oS9es7M2lunBfx4WzgtDd6+1LxmO7R1n4xU0
	MhS5eGr13TGPiN9TjArF+gG4WPL4rWOkk/p8ZxFwdjLHEVgjFo78aTxbMECv2To5nw/HwTKpdcUSK
	qoWPTwg/W9c+rt0rNqx8Fxgpzw8Fhq2kz+0045pR2THwAZooAmKHrJdjWcMhejGlL3U9wHC/YKmid
	rLZKwPCFzY/XQOXXvYqwl/bkzfgwV4wa99bWRfMTUddWvAicy8XkazqN3GhgyXwn0rEqmfu8hTH7j
	Mr36hcEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCMin-0000000CwHt-0yU9;
	Tue, 06 May 2025 18:08:49 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCIiV-0000000CCsa-13xW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 13:52:17 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZsKZP1X96z6K8xh;
	Tue,  6 May 2025 21:51:57 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
	by mail.maildlp.com (Postfix) with ESMTPS id 100B31402F3;
	Tue,  6 May 2025 21:52:08 +0800 (CST)
Received: from localhost (10.47.68.20) by frapeml500003.china.huawei.com
 (7.182.85.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 6 May
 2025 15:52:07 +0200
Date: Tue, 6 May 2025 14:52:01 +0100
From: Alireza Sanaee <alireza.sanaee@huawei.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <devicetree@vger.kernel.org>, <robh@kernel.org>,
	<jonathan.cameron@huawei.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linuxarm@huawei.com>,
	<mark.rutland@arm.com>, <shameerali.kolothum.thodi@huawei.com>
Subject: Re: [PATCH v2 6/6] of: of_cpu_phandle_to_id to support SMT threads
Message-ID: <20250506145201.00000f50.alireza.sanaee@huawei.com>
In-Reply-To: <48fd85e7-4940-4bfd-943d-3c9674828a6c@kernel.org>
References: <20250502161300.1411-1-alireza.sanaee@huawei.com>
	<20250502161300.1411-7-alireza.sanaee@huawei.com>
	<20250504-acoustic-skink-of-greatness-1e90ac@kuoka>
	<c2ace0e9-6565-44c3-84eb-555707f84509@kernel.org>
	<20250506112337.00006918.alireza.sanaee@huawei.com>
	<78797f80-bdd6-49ef-b1cf-ffe4dc1dc5f6@kernel.org>
	<20250506143125.00002cae.alireza.sanaee@huawei.com>
	<48fd85e7-4940-4bfd-943d-3c9674828a6c@kernel.org>
Organization: Huawei
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.47.68.20]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
 frapeml500003.china.huawei.com (7.182.85.28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_065215_442041_85DEF96F 
X-CRM114-Status: GOOD (  19.59  )
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

On Tue, 6 May 2025 15:36:05 +0200
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 06/05/2025 15:31, Alireza Sanaee wrote:
> >>>>    
> >>>
> >>> Hi Krzysztof,
> >>>
> >>> There are some existing bindings in which this pattern has been
> >>> used, so I don't think I am changing binding really.
> >>>
> >>> https://www.kernel.org/doc/Documentation/devicetree/bindings/thermal/thermal-zones.yaml#:~:text=cooling%2Ddevice%20%3D%20%3C%26CPU0%203%203%3E%2C%20%3C%26CPU1%203%203%3E%2C    
> >> I do not understand this - it is not cpus phandle. Please respond
> >> to specific comment: how many arguments are allowed by dtschema
> >> for cpus?  
> > 
> > Hi Krzysztof,
> > 
> > If you mean checking
> > here? https://github.com/devicetree-org/dt-schema/blob/e6ea659d2baa30df1ec0fcc4f8354208692489eb/dtschema/schemas/cpu-map.yaml#L110
> > 
> > There is no parameters allowed at this point for cpu phandles in the
> > cpu-map tree. Of course, this is different than what's been
> > implemented in the patchset.  
> Hm, ok, I thought you are adding this for cpu-map, but if not, then
> where are the bindings for this ABI?
> 
> BTW, share your DTS so we can be sure that it is properly validated
> against bindings.

No wait, I am adding this to cpu-map indeed, I meant the code is
different from what's available in the dt-schema, meaning that there is
a mismatch like what you pointed.

Based on your comments, my conjecture is that I will need to include dt
binding anyways.

SMT threads should be represented in the reg array of CPU nodes, and
will need to be addressed via an extra parameter specifying an index in
the reg array. 

There are various places in the kernel where we point to
CPU node using those phandles. Now the first place that we are trying to change is cpu-map for
enabling SMT resource sharing, and that probably means I should update
the binding related to that.

Hope that clarifies.

Thanks,
Alireza

> 
> Best regards,
> Krzysztof


