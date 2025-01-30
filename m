Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41FCCC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 06:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=stDkNPxvaXA5kM3k4ZKVJiRRENNzrABmzrqDFpS97qo=; b=CKhgQBWYWmCmwAqoFm15YPOpU3
	ctm1UlyjUIAnqokklgbFHM0ASyB+CoKT+m4O7OeFT71Rg8vI8QicQSkAbQFYYI1C+2OIa5/gpR+qM
	SKuxMe9o1/n9E4CMr6O6W4n0NufJeTRMF/vGgbtTYjPO0MtipPOzX0TQGxz7k5JHD5+0LQMRI6lq9
	Jk9igKe3O8Tw8WP6a91GOK9o+j6RGvGwpVXBs7V5BAfRT68jgFOpPu6xmD4zo4jBUNSy4cjc0px/2
	+beFDr7XOXinVlqV+4O3XV/K4XKLqCN5hu3DfGXJaxFW1GFov25K8nJ/Io9Lu0n9bIKwkXX4gVXre
	sc4Baf3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdO42-00000008JtH-3yti;
	Thu, 30 Jan 2025 06:30:10 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdO2j-00000008JnG-3vBL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 06:28:51 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50U6SalO2255798
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Jan 2025 00:28:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738218517;
	bh=stDkNPxvaXA5kM3k4ZKVJiRRENNzrABmzrqDFpS97qo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=wt4qMB2DK3lk/uYgquHoNk0STrFtJ935abs1QEcLx5+BC0VmaGxqCg1te0I/PRM2V
	 jVrF+7YuqiDzl1ac9HwsZ0pHwjevGy4gS532nCShgP7ba6rJF7WgW7WH4RrC7vEo6s
	 8H6X/di+5HkuOIlIO3FBLyMF7lXLGKVqMcQRb15w=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50U6SaqN029475
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 30 Jan 2025 00:28:36 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 30
 Jan 2025 00:28:36 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 30 Jan 2025 00:28:36 -0600
Received: from [172.24.227.245] (uda0132425.dhcp.ti.com [172.24.227.245])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50U6SXpD062557;
	Thu, 30 Jan 2025 00:28:34 -0600
Message-ID: <178aecf4-b640-4dbd-841b-a8c43e74ece0@ti.com>
Date: Thu, 30 Jan 2025 11:58:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: defconfig: Enable SPI NAND flashes
To: Santhosh Kumar K <s-k6@ti.com>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <krzk@kernel.org>, <p-mantena@ti.com>
References: <20250116035145.370734-1-s-k6@ti.com>
 <c00ae17b-b006-4b28-86e8-e82d1067e7d3@ti.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <c00ae17b-b006-4b28-86e8-e82d1067e7d3@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_222850_026387_73D9AC28 
X-CRM114-Status: UNSURE (   7.97  )
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



On 30/01/25 11:53, Santhosh Kumar K wrote:
> Hi, all,
> 
> On 16/01/25 09:21, Santhosh Kumar K wrote:
>> Add support for SPI NAND flashes on ARM64 boards/EVMs such as:
>>
>> 1. W35N01JW on AM62x LP SK, AM62A7 SK, J721S2 EVM, J784S4 EVM,
>>     J722S EVM, J742S2 EVM
>> 2. W25N01JW on AM62Lx EVM
>>
>> by enabling the MTD_SPI_NAND config as a module.
>>
>> Signed-off-by: Santhosh Kumar K <s-k6@ti.com>
>> ---
> 
> Gentle ping.
> 

This would need to wait till 6.14-rc1 comes out.

-- 
Regards
Vignesh
https://ti.com/opensource


