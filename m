Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65A7EC3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 04:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j88dOx9CKL2iTWNeMcWQlAwWWk3oGkkwgXbvo2MDQ7k=; b=S5DBAJJAtuJPCf4kHsZgGj/sJ2
	cuxI9gVsU48T0JSk1ILLCtvXqM9L++5k2nYl03M8FMgQOj+xxtcWtvE1xaOVvZtLM0UDoah7scw2G
	NWMh1PEDFz2J1bzyuz0vH6cuG9zSjMO2ElZ6Yta92v8EQd1pIDBd2g9aRliC/6ADfSjTkT9ttyY2A
	ElNv3mui7w2Q4a8sDS62scnxxbah2y/dDnS2GMfaXVqDiF/fWYe/7NB0LERnZyTxRhPBO9gZ0gZCe
	UsfJXKnRuy0rT6aUdIjMazPoekMx8d/977mGzrX0YFdBCLXmt+R1el2RrY/AaeVOLs3jh/RkzIH34
	QcslmEDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKrnu-0000000HGB1-1jry;
	Fri, 30 May 2025 04:57:14 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKrl8-0000000HFZz-0KHd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 04:54:23 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54U4sIKc3690307;
	Thu, 29 May 2025 23:54:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748580858;
	bh=j88dOx9CKL2iTWNeMcWQlAwWWk3oGkkwgXbvo2MDQ7k=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=vNVwq3eOt4t6WEFS5juWeGnwJjZ+4uAZsDrhL6U5ZIXMDwL4HfXlpqfilZ3m1hLRY
	 VEgvkEqrgd0vNBvFeOHGdjU2B+LgM+Z33WPh6qKp788/5VJb0BNn0P0XU7ZHYySVWw
	 RCtaY3kdkxDB5NqA8aqSE0KNwUqPvtZlXwFsGaSU=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54U4sI7o578818
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 29 May 2025 23:54:18 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 29
 May 2025 23:54:18 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 29 May 2025 23:54:18 -0500
Received: from localhost (uda0492258.dhcp.ti.com [172.24.227.169])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54U4sHDH2555964;
	Thu, 29 May 2025 23:54:17 -0500
Date: Fri, 30 May 2025 10:24:16 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>
Subject: Re: [PATCH 07/13] arm64: dts: ti: iot2050-common: Remove redundant
 "mcu_cpsw" node status
Message-ID: <29efc4c0-e206-4f1c-a52f-27e5bbcda64b@ti.com>
References: <20250529133443.1252293-1-s-vadapalli@ti.com>
 <20250529133443.1252293-8-s-vadapalli@ti.com>
 <c0fdeecf-4a76-473d-9b66-e547d8fe9d1f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c0fdeecf-4a76-473d-9b66-e547d8fe9d1f@kernel.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_215422_164706_58904025 
X-CRM114-Status: GOOD (  13.37  )
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

On Thu, May 29, 2025 at 03:38:51PM +0200, Krzysztof Kozlowski wrote:
> On 29/05/2025 15:34, Siddharth Vadapalli wrote:
> > Now that the SoC file "k3-am65-mcu.dtsi" disables the "mcu_cpsw" node by
> > default, following the existing convention of disabling nodes in the SoC
> > file, remove the redundant section for disabling the "mcu_cpsw" node.
> 
> It became redundant when you disabled it, so this must be part of that
> commit. Do not create redundant code with some artificial split of one
> logical work.

Sure, I will squash the commits. I tend to split the commits since it is
easier for maintainers to squash commits (if required) than to split them.
Thank you for reviewing the patch.

Regards,
Siddharth.

