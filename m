Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BDFDC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 18:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qw2kxcgeI74CiAtO0Wk3Ge8irH3lcasW30DQVrbYrdY=; b=KPCLxp78q+4thnCixUzre+TxyJ
	06sTPtWbHBjE7IsQzRfIt/VMfrDlqod2Xdtxo9ZJNYywiHNUc2tE/SWluvMZEzxZ/Vj652L18bE60
	rLXtYoR1h2m3zDiULE0VdbSdIQEIgsUH24cPh8tpbDRLxiVzxKUdkkgNK9d/ZtYs6DRdj6eSyxA0Z
	UbrTpa+7/gUlmX0kFJpcO1NwBXpPKzQ6XLHorfzHK6sTYgQ5Os950KoxHdGhl83KYkOhFi/KrMmRQ
	pCScJUZ5JDeaKUJTosG5+5PD2/M0QpEvAGJTRs9PEqPDplOlAQpcKeELVegRvdXb0i0YNHDR7xob7
	qrpwH+WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCMoc-0000000CwuS-1stb;
	Tue, 06 May 2025 18:14:50 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCJ9m-0000000CIGc-0KNN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 14:20:27 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 546EKLcb540463
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 May 2025 09:20:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746541221;
	bh=qw2kxcgeI74CiAtO0Wk3Ge8irH3lcasW30DQVrbYrdY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Cdvbh9HZGD0YdYS9IAFeVQZBEG3b5TzRxaPdKbiLe20RzCW/WWMZEmgBaUSEwv7B3
	 0AEvpASl8CsgSOY1FFBHqesW1oVfYiHEeR6OL0P1d9oZJjuQnXZpRNGmVcr0c8X3xk
	 2lWlky+ZKuHDDuzS6p3y2BiDYF3kKepegWghOOw0=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 546EKKIH021102
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 May 2025 09:20:20 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 May 2025 09:20:20 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 May 2025 09:20:20 -0500
Received: from [10.249.32.133] ([10.249.32.133])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 546EKJ7e113864;
	Tue, 6 May 2025 09:20:19 -0500
Message-ID: <4492a19c-9544-4240-bca5-00d82c76774f@ti.com>
Date: Tue, 6 May 2025 09:20:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Add global CMA areas for few TI SoCs
To: Jayesh Choudhary <j-choudhary@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <linux-kernel@vger.kernel.org>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <kristo@kernel.org>, <u-kumar1@ti.com>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devarsht@ti.com>,
        <afd@ti.com>
References: <20250424084415.66457-1-j-choudhary@ti.com>
Content-Language: en-US
From: Brandon Brnich <b-brnich@ti.com>
In-Reply-To: <20250424084415.66457-1-j-choudhary@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_072026_217625_EF313F62 
X-CRM114-Status: GOOD (  12.98  )
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

Hi Jayesh

On 4/24/2025 3:44 AM, Jayesh Choudhary wrote:
> Hello All,
> 
> Following AM62* platforms[0], this patches add global CMA reserve area for:
> - J721S2-EVM (1056 MiB)
> - J784S4-EVM (1920 MiB)
> - AM68-SK (1008 MiB)
> - AM69-SK (1904 MiB)
> 
> These SoCs does not have MMU and hence they require contiguous memory
> pool to support various multimedia usecase.

This series will break multimedia support in our tree if accepted. I 
gave a similar response to Devarsh when trying to get CMA carveout 
accepted for AM62p[0]. Essentially, Wave5 still does not have support 
for 48 bit addressing in upstream, so memory allocation still needs to 
happen in 32-bit range. Can we force the memory carveout in this region 
using the alloc-ranges? Devarsh did this with AM62A[1].

Best,
Brandon

[0]: 
https://lore.kernel.org/all/20240614170409.zu4vaatdac4o6w2o@udba0500997/
[1]: https://lore.kernel.org/all/20240613150902.2173582-3-devarsht@ti.com/

> 
> The calculation was done considering H264 codec requirements, dual-display
> supported in each platforms and multicamera use-cases.
> Additional buffer was kept for other peripheral s and to account for
> fragmentation.
> The breakdown is mentioned in each commit message.
> 
> [0]: https://lore.kernel.org/all/20240613150902.2173582-1-devarsht@ti.com/
> 
> Jayesh Choudhary (4):
>    arm64: dts: ti: k3-j721s2-som-p0: Reserve 1056MiB of global CMA
>    arm64: dts: ti: k3-j784s4-j742s2-evm-common: Reserve 1920MiB of global
>      CMA
>    arm64: dts: ti: k3-am68-sk-som: Reserve 1008MiB of global CMA
>    arm64: dts: ti: k3-am69-sk: Reserve 1904MiB of global CMA
> 
>   arch/arm64/boot/dts/ti/k3-am68-sk-som.dtsi              | 8 ++++++++
>   arch/arm64/boot/dts/ti/k3-am69-sk.dts                   | 8 ++++++++
>   arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi            | 8 ++++++++
>   arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi | 8 ++++++++
>   4 files changed, 32 insertions(+)
> 


