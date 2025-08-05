Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 071E1C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 05:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+VTpc+4yMWsn0h4j0qC+icyeqYURleBo3nXl9IU2OF4=; b=kQpe7dCbjyFxNdoHFvUtxV/g3m
	9hvfs15PjCU64twK6yA5JH3bTeNC63QFJgD5RgiebGqN32hH132lT44t9YM+pztE3ujDeCVYoe7N5
	FZwkUMWxw2WJ0qFskCo3oj1PhAGpRXWpkHIREbqavBvd/YwBxFFXRBD8GIK2b8QaWW9CMHhoVYa/e
	rykDyBhyoUq7gSX/InWzFSuApOuA9bEANKzJdI/os1UnUgHmYPEkpdSM4fV8uooIipMu8SJU1g76q
	urSgGG/l21aB34ppmszJV2TipYKXqDGV8WoJPDz4+Y3UQJSc4DvrePia46QLizkZOvXl05sRdf7bD
	hdh7gGuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujAbP-0000000BpxK-21vf;
	Tue, 05 Aug 2025 05:52:47 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujAYt-0000000BppU-2EvL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 05:50:13 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5755o3L6269191;
	Tue, 5 Aug 2025 00:50:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754373003;
	bh=+VTpc+4yMWsn0h4j0qC+icyeqYURleBo3nXl9IU2OF4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=JTWjNN8tga4OF9jxDBbqtfN4ilgOhDzSsip3w7+sS7Yvkvqeh/bpgVzTDvtwO5kZV
	 FDif0DZ/CKOZLV0ztlSlMYHviTN7Swc7RZVtVDGnBohuugZpgILAVQsJje2M0gQwLD
	 VoUAjQFcNXAnWshIUXG+5lpBnmIViv3CIKJNjnRw=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5755o2lR2071154
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 5 Aug 2025 00:50:02 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 5
 Aug 2025 00:50:02 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 5 Aug 2025 00:50:02 -0500
Received: from [172.24.231.152] (danish-tpc.dhcp.ti.com [172.24.231.152])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5755nvfM1325571;
	Tue, 5 Aug 2025 00:49:58 -0500
Message-ID: <40a7cc6c-363e-4516-847d-9ac6164203ef@ti.com>
Date: Tue, 5 Aug 2025 11:19:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] net: ti: icssg-prueth: Fix emac link speed
 handling
To: Andrew Lunn <andrew@lunn.ch>
CC: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Meghana Malladi
	<m-malladi@ti.com>,
        Himanshu Mittal <h-mittal1@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <netdev@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <srk@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>,
        Roger Quadros <rogerq@kernel.org>
References: <20250801121948.1492261-1-danishanwar@ti.com>
 <be848373-4b7f-4205-b1e4-b08fe161d689@lunn.ch>
Content-Language: en-US
From: MD Danish Anwar <danishanwar@ti.com>
In-Reply-To: <be848373-4b7f-4205-b1e4-b08fe161d689@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_225011_752077_CEF33FAD 
X-CRM114-Status: GOOD (  20.14  )
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

Hi Andrew,

On 04/08/25 10:19 pm, Andrew Lunn wrote:
> On Fri, Aug 01, 2025 at 05:49:48PM +0530, MD Danish Anwar wrote:
>> When link settings are changed emac->speed is populated by
>> emac_adjust_link(). The link speed and other settings are then written into
>> the DRAM. However if both ports are brought down after this and brought up
>> again or if the operating mode is changed and a firmware reload is needed,
>> the DRAM is cleared by icssg_config(). As a result the link settings are
>> lost.
>>
>> Fix this by calling emac_adjust_link() after icssg_config(). This re
>> populates the settings in the DRAM after a new firmware load.
>>
>> Fixes: 9facce84f406 ("net: ti: icssg-prueth: Fix firmware load sequence.")
>> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
>> ---
>> v1 - v2: Added phydev lock before calling emac_adjust_link() as suggested
>> by Andrew Lunn <andrew@lunn.ch>
>> v1 https://lore.kernel.org/all/20250731120812.1606839-1-danishanwar@ti.com/
>>
>>  drivers/net/ethernet/ti/icssg/icssg_prueth.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
>> index 2b973d6e2341..58aec94b7771 100644
>> --- a/drivers/net/ethernet/ti/icssg/icssg_prueth.c
>> +++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
>> @@ -50,6 +50,8 @@
>>  /* CTRLMMR_ICSSG_RGMII_CTRL register bits */
>>  #define ICSSG_CTRL_RGMII_ID_MODE                BIT(24)
>>  
>> +static void emac_adjust_link(struct net_device *ndev);
>> +
>>  static int emac_get_tx_ts(struct prueth_emac *emac,
>>  			  struct emac_tx_ts_response *rsp)
>>  {
>> @@ -229,6 +231,12 @@ static int prueth_emac_common_start(struct prueth *prueth)
>>  		ret = icssg_config(prueth, emac, slice);
>>  		if (ret)
>>  			goto disable_class;
>> +
>> +		if (emac->ndev->phydev) {
>> +			mutex_lock(&emac->ndev->phydev->lock);
>> +			emac_adjust_link(emac->ndev);
>> +			mutex_unlock(&emac->ndev->phydev->lock);
>> +		}
> 
> What about the else case? The link settings are lost, and the MAC does
> not work?
> 

Actually this if else is not needed at all. If phydev == NULL, the
driver would have already returned -ENODEV in emac_phy_connect() and the
device's probe would have failed.

If we have reached this point that means phydev is not null and there is
no need for this check.

I will drop this if check and send a v3.

> 	Andrew

-- 
Thanks and Regards,
Danish


