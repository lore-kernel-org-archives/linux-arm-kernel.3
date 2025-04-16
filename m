Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD10C369BD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 12:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C+BUdbNu2ogqSwBdGvb9VogReaCcne2HM3cP2/uSto4=; b=tpd03+Ik2y2olY
	TDUg87PWdrs+AqwLnsn1bWmEWljGHZu2pUE08cngyf+cPvGwRqAY8sXDVbiFL1z0S3XItxwzt9D/a
	GBQnE8EXz3wqPEqCUe2PpSPgmbgUejSrEsDrLsJvRnPEOD5uyXico7ucd315BrQ8FPDJKFG7LBd4e
	XP7JWx4lkDhqItKciRHM9HSFNTGjmelxa7Gmovksq/7ZnoZzvgjPsSir9jxm+TLqosmr+EQo+7UPY
	HwM0NkoVzS/pQ8dPL8iRKwkIVREefI3ysgG01+zSF4gbVdwrlUacgxUeOMbUrnnGaP4Lqb8s9G56f
	svSYIu1JggI/sRJEF5Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u51lo-00000009UbW-0zGU;
	Wed, 16 Apr 2025 12:21:36 +0000
Received: from server.wki.vra.mybluehostin.me ([162.240.238.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u51Uo-00000009Qmz-42E5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 12:04:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=C+BUdbNu2ogqSwBdGvb9VogReaCcne2HM3cP2/uSto4=; b=S0yXEdAx0AP0GBpAOdQQlzocSe
	SvaO2kc48XVnolknlLgy5oAUdFWGtCIrYMLcY6JpXIJX1N8TyNE6RpUTnGDwfm63v2rw4HcLdFjvk
	GT5vbmVIaebvybTuLeHWhHyvZYLIc8xqwGGbw4KeDPwEk8ibctxSBv3UpU/TMTxQRBRkfOj16GAfO
	yKk6BAG5HDRvLX3thFqAgMQKGU6MhqaoL7WudEOrl86zpMYyGmJoLNqUxpX+cMMZxGsvB8vA4ebpz
	5y11F7gEhtldOhFmU8112tT7pQLmkWkphdhE0KrC9F4cW0TrIvbWZtOADnf2rE0e6khKH9KUX+/XN
	4YYz+/xQ==;
Received: from [122.175.9.182] (port=43055 helo=zimbra.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1u51Uk-000000006vU-2zvY;
	Wed, 16 Apr 2025 17:33:59 +0530
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id 5A4611781A82;
	Wed, 16 Apr 2025 17:33:51 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 3A604178247C;
	Wed, 16 Apr 2025 17:33:51 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id hCcSTaFJEKlc; Wed, 16 Apr 2025 17:33:51 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 0520E1781A82;
	Wed, 16 Apr 2025 17:33:51 +0530 (IST)
Date: Wed, 16 Apr 2025 17:33:50 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: horms <horms@kernel.org>
Message-ID: <2114025245.1081083.1744805030927.JavaMail.zimbra@couthit.local>
In-Reply-To: <20250415201552.GJ395307@horms.kernel.org>
References: <20250414113458.1913823-1-parvathi@couthit.com> <20250414140751.1916719-12-parvathi@couthit.com> <20250415201552.GJ395307@horms.kernel.org>
Subject: Re: [PATCH net-next v5 11/11] net: ti: prueth: Adds PTP OC Support
 for AM335x and AM437x
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.10.10.103]
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - FF113 (Linux)/8.8.15_GA_3968)
Thread-Topic: prueth: Adds PTP OC Support for AM335x and AM437x
Thread-Index: nmUgxGmbBkjbq4ZS0FAvjySn6J19/A==
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.wki.vra.mybluehostin.me
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - couthit.com
X-Get-Message-Sender-Via: server.wki.vra.mybluehostin.me: authenticated_id: smtp@couthit.com
X-Authenticated-Sender: server.wki.vra.mybluehostin.me: smtp@couthit.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_050403_021953_80339D39 
X-CRM114-Status: GOOD (  12.27  )
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
Cc: nm <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, tony <tony@atomide.com>, edumazet <edumazet@google.com>, glaroque <glaroque@baylibre.com>, pmohan <pmohan@couthit.com>, diogo ivo <diogo.ivo@siemens.com>, robh <robh@kernel.org>, javier carrasco cruz <javier.carrasco.cruz@gmail.com>, praneeth <praneeth@ti.com>, m-karicheri2 <m-karicheri2@ti.com>, basharath <basharath@couthit.com>, kuba <kuba@kernel.org>, pabeni <pabeni@redhat.com>, richardcochran <richardcochran@gmail.com>, devicetree <devicetree@vger.kernel.org>, conor+dt <conor+dt@kernel.org>, schnelle <schnelle@linux.ibm.com>, mohan <mohan@couthit.com>, s hauer <s.hauer@pengutronix.de>, Prajith Jayarajan <prajith@ti.com>, rogerq <rogerq@kernel.org>, jacob e keller <jacob.e.keller@intel.com>, ssantosh <ssantosh@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, rogerq <rogerq@ti.com>, srk <srk@ti.com>, pratheesh <pratheesh@ti.com>, m-malladi <m-malladi@ti.com>, netdev <netdev@vger.kernel.org>, rdunlap <rdunlap@infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, danishanwar <danishanwar@ti.com>, afd <afd@ti.com>, andrew+netdev <andrew+netdev@lunn.ch>, parvathi <parvathi@couthit.com>, krishna <krishna@couthit.com>, krzk+dt <krzk+dt@kernel.org>, davem <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

> On Mon, Apr 14, 2025 at 07:37:51PM +0530, Parvathi Pudi wrote:
>> From: Roger Quadros <rogerq@ti.com>
>> 
>> PRU-ICSS IEP module, which is capable of timestamping RX and
>> TX packets at HW level, is used for time synchronization by PTP4L.
>> 
>> This change includes interaction between firmware/driver and user
>> application (ptp4l) with required packet timestamps.
>> 
>> RX SOF timestamp comes along with packet and firmware will rise
>> interrupt with TX SOF timestamp after pushing the packet on to the wire.
>> 
>> IEP driver available in upstream linux as part of ICSSG assumes 64-bit
>> timestamp value from firmware.
>> 
>> Enhanced the IEP driver to support the legacy 32-bit timestamp
>> conversion to 64-bit timestamp by using 2 fields as below:
>> - 32-bit HW timestamp from SOF event in ns
>> - Seconds value maintained in driver.
>> 
>> Currently ordinary clock (OC) configuration has been validated with
>> Linux ptp4l.
>> 
>> Signed-off-by: Roger Quadros <rogerq@ti.com>
>> Signed-off-by: Andrew F. Davis <afd@ti.com>
>> Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>
>> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
> 
> ...
> 
>> diff --git a/drivers/net/ethernet/ti/icssg/icss_iep.h
>> b/drivers/net/ethernet/ti/icssg/icss_iep.h
>> index 0bdca0155abd..437153350197 100644
>> --- a/drivers/net/ethernet/ti/icssg/icss_iep.h
>> +++ b/drivers/net/ethernet/ti/icssg/icss_iep.h
>> @@ -47,6 +47,11 @@ enum {
>>  	ICSS_IEP_MAX_REGS,
>>  };
>>  
>> +enum iep_revision {
>> +	IEP_REV_V1_0 = 0,
>> +	IEP_REV_V2_1
>> +};
>> +
>>  /**
>>   * struct icss_iep_plat_data - Plat data to handle SoC variants
>>   * @config: Regmap configuration data
>> @@ -57,11 +62,13 @@ struct icss_iep_plat_data {
>>  	const struct regmap_config *config;
>>  	u32 reg_offs[ICSS_IEP_MAX_REGS];
>>  	u32 flags;
>> +	enum iep_revision iep_rev;
>>  };
> 
> Please add iep_rev to the Kernel doc for struct icss_iep_plat_data.
> 
> Flagged by ./scripts/kernel-doc -none
> 

Sure, we will update the documentation in the next version.

> ...
> 
>> diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth.h
>> b/drivers/net/ethernet/ti/icssm/icssm_prueth.h
> 
> ...
> 
>> @@ -337,6 +343,7 @@ enum pruss_device {
>>  struct prueth_private_data {
>>  	enum pruss_device driver_data;
>>  	const struct prueth_firmware fw_pru[PRUSS_NUM_PRUS];
>> +	enum fw_revision fw_rev;
>>  	bool support_lre;
>>  	bool support_switch;
>>  };
> 
> And, likewise, please add fw_rev to the Kernel doc for struct
> prueth_private_data.
> 

Sure, we will add fw_rev to the Kernel doc in the next version.


Thanks and Regards,
Parvathi.

