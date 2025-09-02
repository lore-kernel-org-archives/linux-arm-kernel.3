Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 321DECA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 09:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BEaYaFcRNCB3rYEaAmMXhkNIWrWDCrbSUKBE4BRwTNg=; b=Tb9lcZJP2neW6Jv+qTkAD7RpG1
	nWfrcbVEpZxV0jUwrOkuBHKdV5addKmk7+J+8VNsnX0HEEBERkyC7bZwDy4G9qbP6vqnq07vSIYVB
	45o5J3nsLM3mcRArmg38A4ytB+/BwvpwqonJMOWaak68K3imYVxEtVvJQ4/Xo+4oxKRtsB175AgAh
	sXGPmtmF5JZJ5wKW95LG5Drt+bi3qVhqf5WMl4tsmv8tOk7UlnxY0lzZZ0dDSo7mA8p9dDzaoPPNc
	PI3xFz/F89ZRHphSRqLQ2OFxRGGEtlZdaph0PlKTnJ6UPUJsFWZaOOy722RxVWhMRlPnHHyzkenI8
	9RxuTUnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utNGw-0000000GLp4-47xZ;
	Tue, 02 Sep 2025 09:25:51 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utMkJ-0000000GBis-1Ws3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 08:52:08 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5828q45k2549616;
	Tue, 2 Sep 2025 03:52:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756803124;
	bh=BEaYaFcRNCB3rYEaAmMXhkNIWrWDCrbSUKBE4BRwTNg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=gHGszV8Ho7ppNXMFp7tAIWgS+beKufNbPzy/rCIdm6n3JkdmidpmQsqINz4FUolqS
	 WQ4o+rsRA98cTiTyp9wqORyZrJfdrWLJqys8P7VKCayeimjYA7WKiRongwl85s6Gxb
	 ZvHj/iDw1OBFTgjVfOP11bytEwWgxHx5TxxWObDg=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5828q4Od2158781
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 2 Sep 2025 03:52:04 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 2
 Sep 2025 03:52:03 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 2 Sep 2025 03:52:03 -0500
Received: from localhost (uda0492258.dhcp.ti.com [172.24.231.84])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5828q2iQ3526474;
	Tue, 2 Sep 2025 03:52:03 -0500
Date: Tue, 2 Sep 2025 14:22:02 +0530
From: s-vadapalli <s-vadapalli@ti.com>
To: Paresh Bhagat <p-bhagat@ti.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <khasim@ti.com>, <v-singh1@ti.com>,
        <afd@ti.com>, <bb@ti.com>, <s-vadapalli@ti.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: ti: k3-am62a-main: Fix pinctrl
 properties
Message-ID: <77edd9c0-9bfe-4963-8149-51c819cce022@ti.com>
References: <20250823032304.1085775-1-p-bhagat@ti.com>
 <20250823032304.1085775-2-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250823032304.1085775-2-p-bhagat@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_015207_489255_46FD46AE 
X-CRM114-Status: GOOD (  11.69  )
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

On Sat, Aug 23, 2025 at 08:53:03AM +0530, Paresh Bhagat wrote:
> From: Vibhore Vardhan <vibhore@ti.com>
> 
> Correct reg length to match end address - start address for main

nitpick: s/reg/register

I assume that you are implying "end address - start address" as
subtracting the "start address" from the "end address" to get the
length. This description might not be required given that you are
stating the 'last physical address for the main pad configuration
registers' below. You might rephrase it to indicate that the main pad
configuration register region starts with the
MAIN_PADCFG_CTRL_MMR_CFG0_PADCONFIG0 register having the address of
0x000f4000 and the region ends with the
MAIN_PADCFG_CTRL_MMR_CFG0_PADCONFIG150 register having the address of
0x000f4258, as a result of which, the length of the region is 0x25c
instead of 0x2ac.

> PADCFG registers. The last physical address for the main pad
> configuration registers (MAIN_PADCFG_CTRL_MMR_CFG0_PADCONFIG150) is
> 0x000f4258. Adding 4 bytes gives 0x000f425c, so the size in device
> tree should be defined as 0x25c instead of 0x2ac.
> 
> Reference Docs
> TRM (AM62A) - https://www.ti.com/lit/ug/spruj16b/spruj16b.pdf
> TRM (AM62D) - https://www.ti.com/lit/ug/sprujd4/sprujd4.pdf
> 
> Fixes: 5fc6b1b62639c ("arm64: dts: ti: Introduce AM62A7 family of SoCs")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Vibhore Vardhan <vibhore@ti.com>
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>

[...]

Regards,
Siddharth.

