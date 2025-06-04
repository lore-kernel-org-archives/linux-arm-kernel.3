Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E39E0C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 09:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bq4EZsLahywFgP1f+8VxyYxdSzxk7zu6x4ss6clsEj8=; b=1vAnm5tw+VUgflWHRdVtwANLyE
	CLppnsBmuxk/6eZb+IHsSHz2hOQxS6CN0/zNcebbm8ZaX+zsyQ9rXj4HMp8oO35FZHkMphyl7O696
	lYbtY8NMKQt4F7yZbifryXils2p3odNPbHuQJWpe1pdn9dWYXMUegvM9fCeI3d1oS63ZhUdlzdyLW
	kvAxtRG6Xmp5miIb6QDT3SBq9H1lkRICW0RAuXpDJIzN3wJrkb1pMzfsCTQ4e+KA3ATKUwf+QswwP
	7AGxH2xJUAItKgfDMRF4QyIfafbo3GvvIegJaKmZdH/seCyWwgpXvkPlBKVCtRkfGyFGybQEBxTcI
	dnp8NtxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMko2-0000000D4uz-3JPo;
	Wed, 04 Jun 2025 09:53:10 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMkjw-0000000D4RT-04gk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 09:48:57 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5549mjQp3778763;
	Wed, 4 Jun 2025 04:48:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749030525;
	bh=Bq4EZsLahywFgP1f+8VxyYxdSzxk7zu6x4ss6clsEj8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=XOYNRiYGr17hHOZRZ+Cx1giSNAXcFaNqGIK9Rvk/4iftOBLwP/AQ/sGCjIKoWl226
	 /OaE/4+l1padrWTmhELfMxVCgwP4xmswve3h7QevT8QiGViy39BXFwL+P3WplQjem0
	 +CxJsEdWv8JOrmS8A7d/x1JnuC2bScTubCz7bko0=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5549mj2f4179988
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 4 Jun 2025 04:48:45 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 4
 Jun 2025 04:48:45 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 4 Jun 2025 04:48:44 -0500
Received: from [172.24.227.14] (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.14])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5549mfEG1853766;
	Wed, 4 Jun 2025 04:48:41 -0500
Message-ID: <0c69137d-93ad-4843-8512-9885b9cba452@ti.com>
Date: Wed, 4 Jun 2025 15:18:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm64: dts: ti: k3-j721e-main: Make the "scm_conf"
 node a "simple-bus"
To: Krzysztof Kozlowski <krzk@kernel.org>, <nm@ti.com>, <vigneshr@ti.com>,
        <devicetree@vger.kernel.org>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <s-vadapalli@ti.com>, <rogerq@kernel.org>,
        <afd@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250603095609.33569-1-j-choudhary@ti.com>
 <20250603095609.33569-2-j-choudhary@ti.com>
 <15da3051-c35e-4876-9185-9079493dc66c@kernel.org>
Content-Language: en-US
From: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <15da3051-c35e-4876-9185-9079493dc66c@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_024856_192201_1C8A96A9 
X-CRM114-Status: GOOD (  14.50  )
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

Hello Krzysztof,

On 03/06/25 16:32, Krzysztof Kozlowski wrote:
> On 03/06/2025 11:56, Jayesh Choudhary wrote:
>> The "scm_conf" bus need not be "syscon". Now that we have "pcie*_ctrl"
>> child nodes for "ti,syscon-pcie-ctrl" property in "pcie" nodes, change
>> "scm_conf" node to "simple-bus".
>> Also remove "reg" property as it is not needed by "simple-bus".
> 
> This (possibly) affects all other users of DTS which were expecting this
> ABI. It's not only about forward-compatibility, but other projects.
> 
> Maybe this doe snot matter for you, so explain that in commit msg and
> provide rationale why you are affecting other users.
> 
> 

This should not affect other users of DTS. J784S4 already has this
change and it serves as a validation that DT nodes are compatible
with other projects (for example uboot driver handles it).
Other SoCs are being modified with taking J784S4 as a working reference.

Considering this, do I still need to add something? Or is it okay
since I am not exactly affecting other projects?
Should I add something along the lines of "similar to j784s4...."?


Warm Regards,
Jayesh

> 
> Best regards,
> Krzysztof

