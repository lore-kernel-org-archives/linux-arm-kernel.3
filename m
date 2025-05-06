Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FC02C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 12:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qZhL9JyDzcARMICCnnbxyDM7+E56z0uawo1W0pY4Q9w=; b=IUhafhDZfztTqigy4ELMXxPbFu
	gzBeakHJFdpD0AFtQVUd7rOYzuCBov7Gs+6GUaU2Mn+aMexew65n0rz1CzJJ/zSBJCKF2YgKe4DkJ
	oT6+htYcYy/DkBl90N7/+ZuEQQERx2aUlO4tej32bo9RHVexD/G05qYyY4Kvl04Dq4eHJ0qG/VcV8
	9arHYeG4GSrY3D6bI26KjsbTV6oDrzJItMkia/CWZyO2w3zFD/RIhawZ3t6VMqgH/FXeNzh9zgbqF
	kgNCiUV0hICS5L0fwF5CQgIbTikh+Yo1NbLHl0P9NWSR4LW+N3psf+IyvQIEezTiLJdiNhZxPgmxw
	KYETGqsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCHTH-0000000Bvgb-2aks;
	Tue, 06 May 2025 12:32:27 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCFSu-0000000BYbw-1Cg2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 10:23:58 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZsDry1NHHz6M4YD;
	Tue,  6 May 2025 18:19:14 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
	by mail.maildlp.com (Postfix) with ESMTPS id 963BC14011D;
	Tue,  6 May 2025 18:23:43 +0800 (CST)
Received: from localhost (10.47.68.20) by frapeml500003.china.huawei.com
 (7.182.85.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 6 May
 2025 12:23:43 +0200
Date: Tue, 6 May 2025 11:23:37 +0100
From: Alireza Sanaee <alireza.sanaee@huawei.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <devicetree@vger.kernel.org>, <robh@kernel.org>,
	<jonathan.cameron@huawei.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linuxarm@huawei.com>,
	<mark.rutland@arm.com>, <shameerali.kolothum.thodi@huawei.com>
Subject: Re: [PATCH v2 6/6] of: of_cpu_phandle_to_id to support SMT threads
Message-ID: <20250506112337.00006918.alireza.sanaee@huawei.com>
In-Reply-To: <c2ace0e9-6565-44c3-84eb-555707f84509@kernel.org>
References: <20250502161300.1411-1-alireza.sanaee@huawei.com>
	<20250502161300.1411-7-alireza.sanaee@huawei.com>
	<20250504-acoustic-skink-of-greatness-1e90ac@kuoka>
	<c2ace0e9-6565-44c3-84eb-555707f84509@kernel.org>
Organization: Huawei
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.47.68.20]
X-ClientProxiedBy: lhrpeml500012.china.huawei.com (7.191.174.4) To
 frapeml500003.china.huawei.com (7.182.85.28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_032356_467224_F6EFFB62 
X-CRM114-Status: GOOD (  17.46  )
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

On Sun, 4 May 2025 19:52:34 +0200
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 04/05/2025 19:51, Krzysztof Kozlowski wrote:
> >> In the CPU map, there are two cases that only one occurs at at
> >> time. 1) "cpu" = <phandle>
> >>     2) "cpus" = <phandle> <index>
> >>
> >> The first case addresses non-SMTs and the second case addresses
> >> SMTs that the variable must be cpu(s) with an index where we later
> >> look up the reg array with that.
> >>
> >>     core0 {
> >>       thread0 {
> >>         cpus = <&cpu0 0>;  
> > 
> > Not so sure, dtschema says only one item is allowed in the phandle
> > and I do not see here binding change.
> > 
> > Although this wasn't even sent to me, so I'll just ignore your
> > patchset.  
> 
> Ah, there was no binding in the patchset, so that's why I did not get
> it. Makes sense now, but question about missing binding change stays.
> 
> Best regards,
> Krzysztof
> 

Hi Krzysztof,

There are some existing bindings in which this pattern has been
used, so I don't think I am changing binding really.

https://www.kernel.org/doc/Documentation/devicetree/bindings/thermal/thermal-zones.yaml#:~:text=cooling%2Ddevice%20%3D%20%3C%26CPU0%203%203%3E%2C%20%3C%26CPU1%203%203%3E%2C

Would that be good, if I just include the link in the next version?

Thanks,
Alireza

