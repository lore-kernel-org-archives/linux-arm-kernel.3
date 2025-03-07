Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE4AC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 21:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FeEwuvSmJVjOwYwC7OOMZQogVIzR26V0QCyL3wtTDCI=; b=ZLa5D5M0tQeXRfSaBu8voj9pm4
	LCd502hfIQef+UDaL8t57sgkpyp95+F84VA05BOQoXjRvRR+KmNRqwMlo9lmSdSWDJWwJuU3UdWS9
	X4oY46jy31t8PTsl3RevDUJk6WcRUNHwaAsFsJLqgSfE4IDI5MKRxK7rxPrVUG8a5XdFBidGBnycl
	xdex1lKhXCj/qVvy0VVR4yESugS1Ot33YwTNph/aSiDh5+eViFtJIhkZ/MnaknXuf7f6SBwPcrMQ3
	wu/+bcWqxS1rptnVg2Z2BuHO2pCtiybFtVKfJV8Ngp3MVgrB4Mw1rpJYOF7hgv8Mk4jstlwKfXGkC
	iTC8EJgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqewL-0000000FY5q-0Fsh;
	Fri, 07 Mar 2025 21:09:05 +0000
Received: from [198.47.23.235] (helo=lelvem-ot02.ext.ti.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqeui-0000000FXza-0wmI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 21:07:25 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 527L5I3d470773
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 7 Mar 2025 15:05:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741381518;
	bh=FeEwuvSmJVjOwYwC7OOMZQogVIzR26V0QCyL3wtTDCI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=LgtImZ6PWDpbrLsguI0JTTA5qTFisk03bQ6XoaZwwNL9dUhNFXCnY7QzKBuN71GA/
	 77C0ZWpRfnz/hlfoHaHXNSuWfHweGaftqS56xPMsDaV4V9qOt5WxE8aXe106hZXDWc
	 xaKGHLCvK9o8ZoYZSly8DuHg7ugEp/9WedPI16FQ=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 527L5Itd081080
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 7 Mar 2025 15:05:18 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 7
 Mar 2025 15:05:17 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 7 Mar 2025 15:05:17 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 527L5HQl128276;
	Fri, 7 Mar 2025 15:05:17 -0600
Date: Fri, 7 Mar 2025 15:05:17 -0600
From: Nishanth Menon <nm@ti.com>
To: Basharath Hussain Khaja <basharath@couthit.com>
CC: <ssantosh@kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <pratheesh@ti.com>,
        <prajith@ti.com>, <vigneshr@ti.com>, <danishanwar@ti.com>,
        <praneeth@ti.com>, <srk@ti.com>, <rogerq@ti.com>, <afd@ti.com>,
        <krishna@couthit.com>, <pmohan@couthit.com>, <mohan@couthit.com>,
        <parvathi@couthit.com>, Kevin Hilman
	<khilman@baylibre.com>
Subject: Re: [PATCH v2 1/1] soc: ti: PRUSS OCP configuration
Message-ID: <20250307210517.5xjfc6wntcbj3s4k@precision>
References: <20250108125937.10604-1-basharath@couthit.com>
 <20250108125937.10604-2-basharath@couthit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250108125937.10604-2-basharath@couthit.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_130724_417639_7D7643B7 
X-CRM114-Status: GOOD (  10.28  )
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

On 18:29-20250108, Basharath Hussain Khaja wrote:
> From: Roger Quadros <rogerq@ti.com>
> 
> Updates OCP master port configuration to enable memory access outside
> of the PRU-ICSS subsystem.
> 
> This set of changes configures PRUSS_SYSCFG.STANDBY_INIT bit either
> to enable or disable the OCP master ports (applicable only on SoCs
> using OCP interconnect like the OMAP family).
> 
> Signed-off-by: Roger Quadros <rogerq@ti.com>
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
> Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>

On the verge of applying this patch, looking deeper, I noticed
drivers/bus/ti-sysc.c managing the sysc controls. infact, I wonder if
b2745d92bb015cc4454d4195c4ce6e2852db397e ("bus: ti-sysc: Add support
for PRUSS SYSC type") could be merged with this?


Could you say why drivers/bus/ti-sysc.c would'nt be the right solution?

Ccying Kevin if he has any ideas about this.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

