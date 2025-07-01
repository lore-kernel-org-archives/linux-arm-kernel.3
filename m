Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74033C8302F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 10:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EF2WJvYtMV9eDOVcZunhubkhdnTMmMeXGzCpAgn97Ec=; b=J123oqN9ExwkrNHdeThF8dtJVU
	qsi+qXeEMZXvbUMGot3yKmg1olaX+QAugv6ZZ7+M4X9temIu5UvqCBH03DRpkH0GJZVa6lUQsDnRQ
	s3eBD5DwmSxxuI9JpUiWCYC+YBkubeoXklo6sGAL4ZT5jwVpTF2UCLCh/enj4xIMYNb8pU3XdJXtO
	Obat4/+QXT18RS3SsW8+1SQWt9d8p7H5qTeUWyN04lbqpyu74wOZsqzdvKPZJHfbnXfIToJx3Z8gF
	9a8gaVZ+e0cSl2O1LcUAwf8OtoCSiyVV9ycaomIeGsWURv8TY7kPEBMxqPAL1Nku8Z2rC9C1nFxom
	kbhg9ZAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWYE6-00000004khH-2w90;
	Tue, 01 Jul 2025 10:28:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWY9u-00000004k3Q-0u3r
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 01 Jul 2025 10:24:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=EF2WJvYtMV9eDOVcZunhubkhdnTMmMeXGzCpAgn97Ec=; b=Nhx/GUG9QSX/RabF+VAvD8GKgb
	IMMluVrreoraGEGEuPCRWZLjxaBMrQ8giNe+c07dNuBJAS/NtcNHUe6gMCcvA6ZHUvGjew3c//akW
	NnwQBdgBcj3t2daPupcnxVbMmqL1v2fxL8mrKH/0CM53nAqDetMBG0h7m4uAJxRK7QidgHio4v92c
	R0JXrOjY1+B0R3OmCwUGHUSGJzGdBN3OvWssfdRrjkRGIPHoTIyxXZO3AcgMekR+Ino9UUMWO8p4S
	Y974DhLJgV9FtDJuoM9fjsgr+IwQqck0ISEAUBpzWJWF11Ddf9FwZaHoybA7Cg9QNQ6BadGlkqWel
	uDp2C73Q==;
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWY9q-000000073of-3orJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 10:24:13 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 561AO1xV3592408;
	Tue, 1 Jul 2025 05:24:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751365441;
	bh=EF2WJvYtMV9eDOVcZunhubkhdnTMmMeXGzCpAgn97Ec=;
	h=Date:Subject:From:To:CC:References:In-Reply-To;
	b=oHLnEtse0IUkMZku6hbfiCdfJhlVvbwHLw+EWtiZ7s1R9lj+Mjbj5MlXPpKBW4WKb
	 BdV8ZW2n9IQMNkwtIdwISHh90FgLpCal/LvT2UUM8DwAKu5ZIFgCizujuPpfN2c0Nu
	 6aoBKk854j0GpMiqDzHOHIcZsitN0njLfMDyLQ2Y=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 561AO1im3991505
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 1 Jul 2025 05:24:01 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 1
 Jul 2025 05:24:01 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 1 Jul 2025 05:24:01 -0500
Received: from [172.24.227.167] (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.167])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 561ANvYS1388403;
	Tue, 1 Jul 2025 05:23:57 -0500
Message-ID: <d8a8293d-2759-4408-b1a7-a2689383b043@ti.com>
Date: Tue, 1 Jul 2025 15:53:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm64: dts: ti: k3-j721e-main: Make the "scm_conf"
 node a "simple-bus"
From: Jayesh Choudhary <j-choudhary@ti.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, <nm@ti.com>, <vigneshr@ti.com>,
        <devicetree@vger.kernel.org>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <s-vadapalli@ti.com>, <rogerq@kernel.org>,
        <afd@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250603095609.33569-1-j-choudhary@ti.com>
 <20250603095609.33569-2-j-choudhary@ti.com>
 <15da3051-c35e-4876-9185-9079493dc66c@kernel.org>
 <0c69137d-93ad-4843-8512-9885b9cba452@ti.com>
Content-Language: en-US
In-Reply-To: <0c69137d-93ad-4843-8512-9885b9cba452@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_112411_321416_16BA7B6E 
X-CRM114-Status: GOOD (  15.51  )
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

On 04/06/25 15:18, Jayesh Choudhary wrote:
> Hello Krzysztof,
> 
> On 03/06/25 16:32, Krzysztof Kozlowski wrote:
>> On 03/06/2025 11:56, Jayesh Choudhary wrote:
>>> The "scm_conf" bus need not be "syscon". Now that we have "pcie*_ctrl"
>>> child nodes for "ti,syscon-pcie-ctrl" property in "pcie" nodes, change
>>> "scm_conf" node to "simple-bus".
>>> Also remove "reg" property as it is not needed by "simple-bus".
>>
>> This (possibly) affects all other users of DTS which were expecting this
>> ABI. It's not only about forward-compatibility, but other projects.
>>
>> Maybe this doe snot matter for you, so explain that in commit msg and
>> provide rationale why you are affecting other users.
>>
>>
> 
> This should not affect other users of DTS. J784S4 already has this
> change and it serves as a validation that DT nodes are compatible
> with other projects (for example uboot driver handles it).
> Other SoCs are being modified with taking J784S4 as a working reference.
> 
> Considering this, do I still need to add something? Or is it okay
> since I am not exactly affecting other projects?
> Should I add something along the lines of "similar to j784s4...."?
> 

Gentle ping on the above comment.

I have checked other projects like Barebox. That supports TI K3 SoC
but only AM62x and AM62L. Nothing in this series affects it.

Warm Regards,
Jayesh


> 
>>
>> Best regards,
>> Krzysztof

