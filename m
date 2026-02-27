Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58563FD5301
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 07:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jg/MWvT6eGE7HIOirpV8DAZOe25f3+jZkOGNG8MrDVc=; b=2f095OPkBB57ASosVZNAhpusHS
	29gs8aZ2mMBjaEbpFqsUUQOC+d25mhAHdwjmjqSGf1Y2rt6xGLyuHixGGAoqsPzBUgtFTJK9s1/9G
	wW+ogfU9cjDcNmZZL0CdtcfrjQYNUEj2JXAB2gRTrdYpukGjZFzwjA56fT32ov88zJU6iQGlnSvy8
	uUXKMfYxEyoZO+NoHP7h843kzM0+w7pUMnL9D11JAheZ2zetzCUTnep3lHsZ12nQ415/BbGpmoJue
	2KMLTNyb+lRrjKh2j27D/AVEhNWqBJKTz4gNN1jvAwJ3g3wsbOf4OTOQdGK1yZFh9jzYyFO4PQqaQ
	lqVZGF2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvs4o-00000007qyx-2mSz;
	Fri, 27 Feb 2026 07:15:54 +0000
Received: from mail-westus3azhn15012020.outbound.protection.outlook.com ([52.102.149.20] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvs4l-00000007qyY-1RcY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 07:15:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e9XXaiAxR56gg/7vbPvcLbctmvVhfLEvLtrQmHuDZh7zh5auAqRYzejE/0hmVqKNtu1KwSEfQyzmBbNEeCkbjTT4pjGV7tAcg9RzDx4e02/ChelnD3+Oe+Ltm9kneYGYzbdYLa/3iTMg+LBnHtbOJv/ecjxFkxCgAmTGM7Ni+70Mwe12TDMnIrHNXrcENhWTYWSRU0j3zJy1VHdq9ItcR3T5fN/r8sqec2fex3LdLOrchpxUzUN5t+Zds7WClU5J8Y3hqjDPaGzB72FS+syMh1JOQcFr+pUBVflimJhX7Fu/3Tzz9n8+jWIcOztuM+vIc6wVAoMApyTN7AigrgrMrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jg/MWvT6eGE7HIOirpV8DAZOe25f3+jZkOGNG8MrDVc=;
 b=Lml2Z5f/ppK2MbYpu9WKj2P52RZ/XGCquV/lZM/8fkFtmuVkjl1JNGLXr/g4/92TgzF4zD+DWC2bS63k+f+lz9/uFM+Q/YPFgaAY6Bg8md61yF9AEEqAxgF8rvfDGthvtj70iiKZniQNt50UjIXdsXJucIyfFErrLD7vuXkKMN3YAYljTd6UEQcyuuVfavB5HbWqjN6g6yhHg1gib2iLXQ51KRnD1bjvYvX7MPuucJKLi9RziSpiBwTkbH+betzaOnVXyt/FpJNQJubXNZ3wvSUI2rib0tN9Bg0+P6AppM+YF9w2ouYa1nC1G+EeVc9mSbzE4SuQA1XaDA0sT87h7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=gmail.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jg/MWvT6eGE7HIOirpV8DAZOe25f3+jZkOGNG8MrDVc=;
 b=JWBZVzxNEkZuQtV+oIzqZXX0AOESuohua7EtRm2MJpXbWsgnh+sBEVj+KNSDA+U0xMInmNSZsLDsVpU2uF7xiVESrpgfQmfpMyPwQU3+mcEzxzfeltMlw6GEiW5FU0s5CT+2lj+XOrBljuAT+eMiIp1xN33kAxpsXL8frgv45EU=
Received: from SJ0PR13CA0049.namprd13.prod.outlook.com (2603:10b6:a03:2c2::24)
 by CH2PR10MB4214.namprd10.prod.outlook.com (2603:10b6:610:a6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.19; Fri, 27 Feb
 2026 07:15:46 +0000
Received: from SJ1PEPF00001CE7.namprd03.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::a9) by SJ0PR13CA0049.outlook.office365.com
 (2603:10b6:a03:2c2::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Fri,
 27 Feb 2026 07:15:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF00001CE7.mail.protection.outlook.com (10.167.242.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Fri, 27 Feb 2026 07:15:46 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 27 Feb
 2026 01:15:43 -0600
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 27 Feb
 2026 01:15:43 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 27 Feb 2026 01:15:43 -0600
Received: from [10.24.69.13] (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61R7Feu03313304;
	Fri, 27 Feb 2026 01:15:41 -0600
Message-ID: <ef2d207a-dd51-4db0-a909-955d5a38e1f7@ti.com>
Date: Fri, 27 Feb 2026 12:45:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH] arm64: defconfig: Enable DP83TG720 PHY driver
To: Krzysztof Kozlowski <krzk@kernel.org>, <nm@ti.com>
CC: <kristo@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>, <andrew@lunn.ch>,
	<hkallweit1@gmail.com>, "Raghavendra, Vignesh" <vigneshr@ti.com>
References: <20260226185448.2167189-1-m-malladi@ti.com>
 <79e54fc3-9e61-44ff-9919-b1163bda81e5@kernel.org>
Content-Language: en-US
From: Meghana Malladi <m-malladi@ti.com>
In-Reply-To: <79e54fc3-9e61-44ff-9919-b1163bda81e5@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE7:EE_|CH2PR10MB4214:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e1031ef-6a3a-43a5-4951-08de75d00704
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|34020700016|376014|36860700013|12100799066;
X-Microsoft-Antispam-Message-Info: +Hsma0Q6HNlOyLtIfZEXdRuqCE03Olo9ExegLwgCo+qpjwWPt6oLZCq5oF7oa1KlHGo7BNobyCqXt+hL9cy7ggWIoLthUDcEVBjR691qVWcC+fk1IH33A4+Hxkch5Y9GLzGv+KqdLf0gtdqCmpI7VBe0NpM56YBMKGJMm/wxitU5hjT/giF0wMlqOAoBjCeiCHUaurjJmJJEGofzizCrTlQizQMnB40wboUDZOca7XLJpDXNu59eepCPssjLtAhJya24OzWAU3kz6ImwQdfUmQIjVABcEEUDKZyOk7Vf3mkg3U+/eT1+0mHT78+MSgsqwoCsbEkNLPCUS0S1iNoWQFP2/4N6wbKSF6dbvJMrW2yGVjMC4+4Gyk/2/vMzXZ7cVU8zH+q+h4X89CkyZlpYllRyyrOA+rS2PrlSVY2R/cla792PfLBAiKm3GTTm5lQUvDwYS6I4jy22Qz4nPFc67RHoOO1cmwSqc781NKEbP4lP+CBGYrcfskPrOmP2DYIsDyhQmRdTpGl9yZ+FyoRHUaO5yfFTEgDqtnYknnOUVMw0/yjxM2CUmkefb88FfVDvlIEDxGnBNus3iOhLaJjwEL5Kzu9hmx/TbxMNv7iuevLWUdSeS4ZsagSIMVadq3j8zHkLGrUNVNZwhE7TVv14ySyzX4l/LnPCBpInyu8huqbrPeR1oho8h+qmbsnvGAWaldRwswzDzJv55swuUvgYrBLXCtbeBOQobGPk1DXg9womF2KNz08AJZRUaQ6URe2dRDctghXZfuyi1nuAtv0ikeDoN4YouikmYARF7eVqdCQ=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(34020700016)(376014)(36860700013)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: dbpJ7RIwUuSs8r24F5xpNrT4+dU9X9NwcU6i2EL/ZsfvPehm0c/ieEXN6NiAPRB8t8giZbvHjlMS3yNfSD/0+YYSlFn07V6qERpT2vknLeiLID1tRc98CeqoxoRojsGsvMGcKSILAqjPVqKZo35k31fsYorDz90um+yOZMH2IYMb5Ky75LF2XZN0t44Ac9+k/IW6ul2Et6Q6HGNPTl3sfU08uM+ws1F9h0hX+kVPbTgKvlymtGR3YrdMQ/6xKBjN7oaAOFq5wp11l1ktHrsJLMBZwByVpdH94JHBAh61NYK/art6glLHQ+M5Y7IhyDK2ewdbKEUhmMc1Brh4Lfhxtb38lkyundwiLTbQ5nMKCLMJS53obidoregD/xMVHlCw2t66XWxT4sIyofJdOLyizbk9v+IcNeU2RqJ5bXYFtZ4f7UdHVXpDFR64tXPmjmMP
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 07:15:46.3248
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e1031ef-6a3a-43a5-4951-08de75d00704
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4214
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_231551_475056_387B3DB0 
X-CRM114-Status: GOOD (  13.11  )
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



On 2/27/26 12:12, Krzysztof Kozlowski wrote:
> On 26/02/2026 19:54, Meghana Malladi wrote:
>> Enable DP83TG720 PHY driver as a module to support TI's DP83TG720
>> 1000BASE-T1 Automotive Ethernet PHY. This is required for the
>> DP83TG720-IND-SPE-EVM daughter card used with AM642 EVM ICSSG0
>> interface.
> 
> Grepping for DP83TG720 or IND-SPE-EVM gives me no results. Are you sure
> this is the board supported upstream?
> 

Yes, this series adds support adds support for the board: 
https://lore.kernel.org/all/20231212054144.87527-1-o.rempel@pengutronix.de/

>>
>> Signed-off-by: Meghana Malladi <m-malladi@ti.com>
>> ---
>>   arch/arm64/configs/defconfig | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>> index b67d5b1fc45b..3b88df2ca5e1 100644
>> --- a/arch/arm64/configs/defconfig
>> +++ b/arch/arm64/configs/defconfig
>> @@ -420,6 +420,7 @@ CONFIG_REALTEK_PHY=y
>>   CONFIG_ROCKCHIP_PHY=y
>>   CONFIG_DP83867_PHY=y
>>   CONFIG_DP83869_PHY=m
>> +CONFIG_DP83TG720_PHY=m
>>   CONFIG_DP83TD510_PHY=y
>>   CONFIG_VITESSE_PHY=y
>>   CONFIG_XILINX_GMII2RGMII=m
>>
>> base-commit: 4916f2e2f3fc9aef289fcd07949301e5c29094c2
>> prerequisite-patch-id: d9e4c1f3ec36250ae7ce49b720614eef25f9ffd3
> 
> Why do you have dependencies in defconfig?
> 

You're right - the prerequisite-patch-id line shouldn't be in the 
defconfig patch. The defconfig change itself has no code dependencies; 
it simply enables an already-upstream PHY driver as a module. Will fix 
this in v2. Thanks.

> 
> Best regards,
> Krzysztof


