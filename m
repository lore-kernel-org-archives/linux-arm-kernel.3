Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB179C61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 04:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d1d38w1Imrmh3Pi3ni2I/umfUi6bMxTp9ma4T10tvRI=; b=DK+gV09gvcAdjh9IXkaoubOnBH
	3hA0wI5KKyBVX84/b1Jw/aE8W6PA2zMvp5P0QsCSYXW9cqvz2r5mmyuVlFCgawOt2Ab9+FWmBSjRZ
	5VlJkR9KhZAM0NLi3mTjZrdjrcD7a0bjvD3uolfNOtxzUt0l1aBZLoQY7hVWQqOW2q1TFaB1oYoRJ
	LtVZ9FQLyGYRNLXLKFOjGMvZZj3WSljr/JPYGjfOmPx40flOn+Kvf1iH7OfL1Ulu+j+pU048YpRlF
	9BpmJmRVdgZylRcgwrrym9QzoypNhYgrfYzuOCoNzRhOoHOqO33u1jYhsbwTgrm3ZZ6ZYX6D+7Qou
	TTO0H3mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPw2w-0000000FIyT-0Zp4;
	Fri, 13 Jun 2025 04:29:42 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPw0i-0000000FIhG-1Ryj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 04:27:25 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55D4RGGb1874765;
	Thu, 12 Jun 2025 23:27:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749788836;
	bh=d1d38w1Imrmh3Pi3ni2I/umfUi6bMxTp9ma4T10tvRI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=K61t750IEZD5XZ6kBse6w2Sw8IqkvwHHQQXNxndVgo2ZH25TKXNixas4EfJLlk4ga
	 MpF8jIOniPO7EhKOSY/zez6J6c4FCKL7NfkYSHDDfv0GUwT9tSnSvYYDM8qjppALgV
	 lVFIOdZcCyM4cjxzj+zSp+zXymMm/Ph30+3MKvug=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55D4RG7i3153743
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 12 Jun 2025 23:27:16 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 12
 Jun 2025 23:27:16 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 12 Jun 2025 23:27:16 -0500
Received: from [10.24.69.25] (danish-tpc.dhcp.ti.com [10.24.69.25])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55D4RBk53185800;
	Thu, 12 Jun 2025 23:27:12 -0500
Message-ID: <5cb496cc-7b0e-471b-8698-10d26f973cc5@ti.com>
Date: Fri, 13 Jun 2025 09:57:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: ti: icssg-prueth: Read firmware-names from
 device tree
To: Jakub Kicinski <kuba@kernel.org>
CC: Meghana Malladi <m-malladi@ti.com>, Paolo Abeni <pabeni@redhat.com>,
        Eric
 Dumazet <edumazet@google.com>,
        "David S. Miller" <davem@davemloft.net>,
        Andrew Lunn <andrew+netdev@lunn.ch>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Roger Quadros
	<rogerq@kernel.org>
References: <20250610052501.3444441-1-danishanwar@ti.com>
 <20250611170211.7398b083@kernel.org>
 <03555d09-e506-4f48-a073-b06b63e1af4a@ti.com>
 <20250612073708.69902ffc@kernel.org>
Content-Language: en-US
From: MD Danish Anwar <danishanwar@ti.com>
In-Reply-To: <20250612073708.69902ffc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_212724_556438_44E22FEE 
X-CRM114-Status: GOOD (  11.14  )
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



On 12/06/25 8:07 pm, Jakub Kicinski wrote:
> On Thu, 12 Jun 2025 10:49:17 +0530 MD Danish Anwar wrote:
>>> You seem to be deleting the old constants. Is there no need to keep
>>> backward compatibility with DT blobs which don't have the firmware-name
>>> properties ?  
>>
>> ICSSG-PRUETH driver is only supported by AM65x and AM64x and both the
>> DTs have the firmware name property. So I don't think there is any need
>> to maintain the older hard coded values.
>>
>> AM65x -
>> https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/tree/arch/arm64/boot/dts/ti/k3-am654-icssg2.dtso#n28:~:text=pru2_1%3E%2C%20%3C%26rtu2_1%3E%2C%20%3C%26tx_pru2_1%3E%3B-,firmware%2Dname,-%3D%20%22ti%2Dpruss/am65x
>>
>> AM64x -
>> https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/tree/arch/arm64/boot/dts/ti/k3-am642-evm.dts#:~:text=tx_pru1_1%3E%3B-,firmware%2Dname,-%3D%20%22ti%2Dpruss
>>
>> Let me know if this is okay.
> 
> IDK much about embedded but what you say sounds convincing to me :)
> Just also add that paragraph to the commit msg? (without the links)

Sure. Will send out v2 soon with these changes to commit msg.

-- 
Thanks and Regards,
Danish

