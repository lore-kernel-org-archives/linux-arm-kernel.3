Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B45CF8861
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 15:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W+w9uzAPuUadr/2vcu3RjzEbTIq1CSq9medNjoIyd0c=; b=k9EdcxUSeuT9NiaRqDf5abJT4i
	yvFzDCALK9vShg2cTrJYloEC7jR3z22PJehI53BpJ80atFo3GfgOGchThaCbrfWupRyRCVROFOLo7
	Wrgus8u0qDNFXRBTDqHxXEpfZx1GUEaYSuHD+M+Q7x9bbyYoqeCB2gMdWJrxvO2w+H+fHjU+Ntvs6
	63dw6+VMXbsvGtYfJJ1QfxW2ayEvGGrvNHmoc3f8BN8uqqBmAAuVmmirXc6hvYk4nn5cOPlONGI2a
	xHMQE2FcLq9IBqlS3R9WRbJhyp7SgX5mjCzLAi4eY0CQj3CNJ5nMODMy7B9y+Bs2MoXZWf83dU61k
	iht0UAEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM6Qc-00000006u57-3r9L;
	Thu, 20 Nov 2025 15:18:34 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM6QZ-00000006u4W-1uQU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 15:18:33 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id ED2D2C111B0;
	Thu, 20 Nov 2025 15:18:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2C8EC6068C;
	Thu, 20 Nov 2025 15:18:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1371810371C4F;
	Thu, 20 Nov 2025 16:18:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763651902; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=W+w9uzAPuUadr/2vcu3RjzEbTIq1CSq9medNjoIyd0c=;
	b=l9S42diO51gPGUNuhEnHQSnWSxeL7UtQyzWf+pSUkD1kHEiJLJ2pxLkp7FW9teyxIjXeM7
	GjWKcU9mPtqPUARnLTB3ODK0eZk1VkcUWYggdmpPLYWEwWavemElCdfRIimMfNBGkrc44R
	GfJd21OqCv3vIdx3ElchM3qWyG5kH3MY8B17grroqx8eE6LefdKu7NWY2NY9qgsXmOufzK
	SPI/OvH7FwMVdEIafwEKK2MLS+gq44ozi4hBBVG84S8XT/UIoO2PlY0dPj4Mx0IwzrYzDc
	aCTBmsdZC7uM6gAaoQzZlnJlVWbMcQ7lEVSNmdFhnJRosCsGAmk0OA+xXUyoPw==
Message-ID: <2fbd40ed-40e6-4ba2-b914-1f6d2d26dc85@bootlin.com>
Date: Thu, 20 Nov 2025 16:18:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v17 03/15] net: phy: Introduce PHY ports
 representation
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>,
 =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 =?UTF-8?Q?Nicol=C3=B2_Veronese?= <nicveronese@gmail.com>,
 Simon Horman <horms@kernel.org>, mwojtas@chromium.org,
 Antoine Tenart <atenart@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Daniel Golle <daniel@makrotopia.org>,
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>
References: <20251119195920.442860-1-maxime.chevallier@bootlin.com>
 <20251119195920.442860-4-maxime.chevallier@bootlin.com>
 <20251119195400.1bf0cc68@kernel.org>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20251119195400.1bf0cc68@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_071831_744788_A7CDD4AE 
X-CRM114-Status: UNSURE (   9.85  )
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



On 20/11/2025 04:54, Jakub Kicinski wrote:
> On Wed, 19 Nov 2025 20:59:04 +0100 Maxime Chevallier wrote:
>> diff --git a/net/ethtool/common.c b/net/ethtool/common.c
>> index 2f4b70f104e8..8216e4ada58e 100644
>> --- a/net/ethtool/common.c
>> +++ b/net/ethtool/common.c
>> @@ -460,6 +460,21 @@ const struct link_mode_info link_mode_params[] = {
>>  static_assert(ARRAY_SIZE(link_mode_params) == __ETHTOOL_LINK_MODE_MASK_NBITS);
>>  EXPORT_SYMBOL_GPL(link_mode_params);
>>  
>> +const char ethtool_link_medium_names[][ETH_GSTRING_LEN] = {
>> +	[ETHTOOL_LINK_MEDIUM_BASET] = "BaseT",
>> +	[ETHTOOL_LINK_MEDIUM_BASEK] = "BaseK",
>> +	[ETHTOOL_LINK_MEDIUM_BASES] = "BaseS",
>> +	[ETHTOOL_LINK_MEDIUM_BASEC] = "BaseC",
>> +	[ETHTOOL_LINK_MEDIUM_BASEL] = "BaseL",
>> +	[ETHTOOL_LINK_MEDIUM_BASED] = "BaseD",
>> +	[ETHTOOL_LINK_MEDIUM_BASEE] = "BaseE",
>> +	[ETHTOOL_LINK_MEDIUM_BASEF] = "BaseF",
>> +	[ETHTOOL_LINK_MEDIUM_BASEV] = "BaseV",
>> +	[ETHTOOL_LINK_MEDIUM_BASEMLD] = "BaseMLD",
>> +	[ETHTOOL_LINK_MEDIUM_NONE] = "None",
>> +};
>> +static_assert(ARRAY_SIZE(ethtool_link_medium_names) == __ETHTOOL_LINK_MEDIUM_LAST);
> 
> Thanks for reshuffling things, this one needs a static tho:
> 
> net/ethtool/common.c:463:12: warning: symbol 'ethtool_link_medium_names' was not declared. Should it be static?

Ok I figured that I didn't have sparse installed locally, so the
local NIPA build "build_allmodconfig_warn" didn't go through.

That's fixed now, hopefully even less bugs next time !

Maxime


