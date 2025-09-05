Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9E26CA1010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 15:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MA2wHjaUiY1ZjNuNXaX0xG/UCNsIcp3FyP3ke3zSsHI=; b=YWP7kDohJ0ferE+l/b58uWrRdk
	kU+eWGRaV4M87VJ8DDkJ7IMQFRYLjSLaX1uIaroiflCfLUbziD7HBIgHA8RisRr7ceBbLjEkuHfo0
	p8YUOBgKhtum4qFY9t4OdEAwC+nHx8xJp1N+XQFW+VMx5GMt2MuwSx/g82PAKQ9Ug2gRf23kQJ4GC
	x4XTZlxT3fKzSCYJ2sV+CmRwpjvMMYZZsU9rUrJwGRDQVxxYW7xjFtifBz6BDPuTCP9k4jp0T2eIw
	kzKu7KDbAuGqzDq5815z+qsMh3/4oh+R1mHExZQ6rmZpnw7f9AKzIJJt7Aiqiw/sQuMuGupmZ3we3
	1GJiviFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuYgw-00000002sw9-0z7E;
	Fri, 05 Sep 2025 15:49:34 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuV7U-00000001Xe7-0vnP;
	Fri, 05 Sep 2025 12:00:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wUDO5DAGWSTivAxA3bp9/IrFNEe7Pqwjef3bC1v/WPyIByGmMMWd1y7HcBkQ3LgmUWu2gDnxmWKE5d2ulZKpXZykRj2pM0VlNpRw2gs/d26DgrA9lixcXsqnjBtFOSXsGV2Sf4sz74XetgSCKc3w/OqZxBvZSsEmc8qkHGpL5t8BzQ09B1lpOlo+FkoDWniV+gEZ03n39oB1gEQZw6+s7h1EJ920qPn2tM1c4ThC/jO9fYKgS5gLSICFY5/Kii/ZEbfp7VsPXPqACldx95ZFSz9+7c6x66FII6kJzwdjD3yXaWEme29PPo0/4Ckz8Ft9CJhcJFnRrm8VlZKS5nDIKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MA2wHjaUiY1ZjNuNXaX0xG/UCNsIcp3FyP3ke3zSsHI=;
 b=qPxfWI9rN3vGTBSSnPNv9K6XVhiooQcyHlBLabml0OtvIL/6RBD6iZSmmyl0Kc0VtswP+M9XpUYY2ppfWS0178wpk5mcEvTRZAb45RMlgH4yg49w3F9EL09hoLsU/TeX0u0u86xHl6n8lOFTFx9WPo9RYgJvq/wvtwknu2wHbkm1dRC7KC1YPPE0eYn5zfJjFZfuShro+4xtXvNxHcgP0gw2um1cdezezHjVpWLNPcL1jsxJnlw886CTqa++BPL/Kdhrwl3dGPwGGkEz/yuO1qUhNk/deQ2yB2XkE0KrlzAWP6wlC4pKdC+0Bz3crArxBPLv5gYAhUEHIJQCujXmHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MA2wHjaUiY1ZjNuNXaX0xG/UCNsIcp3FyP3ke3zSsHI=;
 b=FVJKBGbE4ZUK6PFJ6yQj465Iev1byfcgXADuKl1hw8PJEGvuWVh9cGDUY8kyBoM3HtCHjwv78YGaonbCqrHyn6rsjXudv5rvD+sivTxMc/QTiPdpoZC8nuhu22GKDyvR+AnYz00glCtgRgyDfhyjUFVLRH0jHnORWwQO/IV6GsnVF6ceIeUSpIPIOCnSU64JcuUaWOryJlnGrW3elc8qoDFiLj5VESWwCUuf6yOIV08Si6UHqmHmf7BwyavoI92kwSH0SoAxho4MEOX5ABnrq3mliIZq8z5NzLQIHUrDLC4aYuEt7MPaZe9H/9SNRwvR7qTVXGex5AsMOcSqJG6fUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU7PR04MB11162.eurprd04.prod.outlook.com (2603:10a6:10:5b3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Fri, 5 Sep
 2025 12:00:30 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.9094.018; Fri, 5 Sep 2025
 12:00:30 +0000
Date: Fri, 5 Sep 2025 21:11:48 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Peng Fan <peng.fan@nxp.com>, Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aswath Govindraju <a-govindraju@ti.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>,
	Haibo Chen <haibo.chen@nxp.com>, linux-can@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 1/9] dt-bindings: phy: ti,tcan104x-can: Document NXP
 TJA105X/1048
Message-ID: <20250905131148.GA19427@nxa18884-linux.ap.freescale.net>
References: <20250904-can-v5-0-23d8129b5e5d@nxp.com>
 <20250904-can-v5-1-23d8129b5e5d@nxp.com>
 <20250905-elite-enthusiastic-zebu-fec55c@kuoka>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905-elite-enthusiastic-zebu-fec55c@kuoka>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR01CA0044.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::8) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU7PR04MB11162:EE_
X-MS-Office365-Filtering-Correlation-Id: 698ab3ae-572e-411e-7f06-08ddec73cf7d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|7416014|366016|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aJTS3AOjUFIaV+HXvONtC+VQCjjx9noETYkknF5baLEaW0eI5nSRN/9mooIo?=
 =?us-ascii?Q?9qON2zZ1ydKc+d9NZr9Lqq7/dWeSIyG1iBqucP5YuRIves88ntChrSIndc1p?=
 =?us-ascii?Q?wFwuKvDLhW/bfaFdo03WGk569fL7r6SINxbbmxr1qScypModIP6hxj6de07L?=
 =?us-ascii?Q?hEysFurR70uv7p7SMqGsR3whm7l4v1r5V0MW3x6E8mhCzY+ETCCcycpO02Bx?=
 =?us-ascii?Q?8U02fdkap7qbnT9DVirAbWuqxfaZWr2GF5abzC56fCqX2PbCMj0fUtAhDCED?=
 =?us-ascii?Q?BnFPC74agx92su7TGs97Is5dRMu9zP5kCzDRzi9z6xXpUOPEA1utJqvTOck/?=
 =?us-ascii?Q?f9mP6EyLSoxEZxxka1F/6v8tEfzCUJDb/BWRmf1BpL1R7fwm5BoTU580Exh/?=
 =?us-ascii?Q?GL+w+EXaS3Hhawv30dyXhfwsQTA9RDoQARXf4j0QmWutFi+MTEq41hjQ35IM?=
 =?us-ascii?Q?+0CtphgJEvkKHxgnCZCGmKboffM/eaIo0wURaiEwfrfQ7PXnfBZzWJN4z0Pl?=
 =?us-ascii?Q?bQ11dDswgv4r4k+GHl9NmKs3DkqIj12FrdYKtCkFtC4bR8iVJfQY0dbcmryH?=
 =?us-ascii?Q?c99QwMI59DluKjD5EQxH95MMd/jO09Kv6sw0d6zz3wlJEBsaJme07jC+u0cl?=
 =?us-ascii?Q?MtAmF0YdYoHrxPaSv5DMYY8Ducw6xtmxue2F0sQRXJjyaGsSlj1NuFJ/QS2/?=
 =?us-ascii?Q?ftgjzurNmMuahgnxwikVWEAT1Zq9oqnhjtQCATaBa8U5mxs4vW/Nfe5TS65u?=
 =?us-ascii?Q?2ZOxbcdTleg7JjJzMG7OVpOQJ4E5Mp3ZX8DmLt60OrrEH/SCKTHaAwLcZYx4?=
 =?us-ascii?Q?XMRfEFKY4w95viXX/QeYKcavr/66vzHqnahLknNo638ZEs4yi3cfLSaIm0JJ?=
 =?us-ascii?Q?6COB+ISBTqhS6A0ddnN/m2Cw/LISwB0k/gukihZ7bjPetxyL12Gb2xv78Siz?=
 =?us-ascii?Q?DcObO2I9bGND/t4Ys9hmxA5VRBYaSfoPtR4DiEOnFFA8UQJ3NOM0k5zBx0jS?=
 =?us-ascii?Q?adF+o/w9H+F/14ma6iZc3uEbjseC+yKRB+KzQtouWCTJkgdVIBGS6+FY8qNL?=
 =?us-ascii?Q?pfsNZQjkrlI8YpOWGXwPVWnreudEg4X7E0HEaAF6BYBbbz6S3a79RGn9qFFj?=
 =?us-ascii?Q?YVMhv3cnkqmTrnK8GCxd05j1U3VEfEBpo/1letVQ8CAvdZOhMWoDagYqd3LS?=
 =?us-ascii?Q?0HHV7NZ/H9N7rugZxJIp7xL6+mUaXT1BhOdrXBx/Ia3ZHCB34WD63AL0FtBx?=
 =?us-ascii?Q?6IliPQzLGgMYxfZNwpTe9MhHVPYbKIBe/5O4BNfMhcbpldREAhCO+Cr1SOHp?=
 =?us-ascii?Q?atX5IflFDzgH9mDmWuaLpmtPHBqY3RMS99jGnrRnsALtkffpi/b1zqXv8fYA?=
 =?us-ascii?Q?OBa7aA/TfGzkBSYy2+C6rg7zqh/3efY2/IYMP0iWL67TbZ3TidQLkPetYy8j?=
 =?us-ascii?Q?5jQtIjaX476feHMk/iSIDN8OEUImME2ZaeYgoDYmdkXte2zBe90R0Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qdpfxItIG/J6/u0IxJMU+mgcg9XPk5uJo+FdsQlSVs9/NpPfuWxSpO83m1Vt?=
 =?us-ascii?Q?l0SQ9pclDH+IHvlDBY1WF9Kw523zsmdCQw0MIGrHCfXrK+NUHtaLmbVirvV8?=
 =?us-ascii?Q?AadXdhk9tW6S7jFopqZ/WLMoKrC7Pa8kk2+BUr7n5scdv1F4xkdCetLcNN+U?=
 =?us-ascii?Q?fhE7DYVR2MUePVgkiOMpfmuH26eweKONkMBP7EX78Df/KQrgTHc21g3EThlL?=
 =?us-ascii?Q?8dcWMWeTDlHIMsVpW8ZHFe425dwLH5mmdrtdPRiLG2eFPf9/onBE2up5wqlp?=
 =?us-ascii?Q?KyWSLYS+8TobFduM0EpXxitCc15qScRwnj+omZZJ6w5u85m9zsptB9eRg+vn?=
 =?us-ascii?Q?iFipNuBnf33jY8WGu2BFGq1zT58cOzdMp2Ir0RJebGYOfSrTW6bMFL1nj1MS?=
 =?us-ascii?Q?NuTa2vkaIyfkH23vwCfGzW9Bye4GPo1eAwgSUN+/v6HK53s9Ee/sD3CIkCLI?=
 =?us-ascii?Q?XouTJ55mKnCo9eAbNCaPyRgTXi6Y3+jzdEa5cCfLKX3vnhdtnq0BRiNMZ8Je?=
 =?us-ascii?Q?loYlXIfAf+mfRx6mSGRdlskpZ14VO4WxsLasf5DEkhZmouKG9fGLzycYXUOs?=
 =?us-ascii?Q?hVe1ic9F2C4DjYuqlWk/evpFny/Z/4/3lpEPGOLECPg/m9F5O8hyTHnavuJ2?=
 =?us-ascii?Q?Sz+3CAuQ1gp2M0Jl3iseF7oazRA2kfxpoQM31OEyw3M+yQJZiXv9KC/G9BEV?=
 =?us-ascii?Q?OCIuibn6ZsI39lIi+Y3rEy4aJl5CA2nX5t+ophoXBcLXy54QGBgnAHlcYwaJ?=
 =?us-ascii?Q?Qu0Y1RXS7MNXz2SSGQ5luEgB8OB0/j6Tjo7LnmNSmdf/ebrzpjMEzcPgwlrD?=
 =?us-ascii?Q?5d/YfIzJdQZjx7SOGycLcWKyLpP5GkjhgTPjtOhwOivPL9HK2uvCI03Fnofo?=
 =?us-ascii?Q?uh85kP8+PIftrGMVlLJh1ytG7oFfF9KXccG0DFJKRMVk01vj5AnxOtwwYnFM?=
 =?us-ascii?Q?XxL8uXOO47fefTSqq9b1lpA5ecU9wAKp8b0p6wbLS8CIKUv8GTZF6SSfG6v+?=
 =?us-ascii?Q?55Nuvc30pE/H5zjJRTnMdoGCqXJsNwqiuAM6/yd/Hba7zOCY2mL77J96+7V1?=
 =?us-ascii?Q?do4luZDGi+bfSbE8rWm7GmK9ewqJzWCnE8S8CK8wI23p9m7bckkRkevUgYTq?=
 =?us-ascii?Q?c/42v0QLC7GQ8Q8CxeAywNpTYShhUg2Em605c8q6HwunVhXWjPR0EvEP+JrI?=
 =?us-ascii?Q?X5IyEZyAVkNhg0egbrtu0Vc3rBvswinLov+gumECG6JCF5I6y6zqL+ueyE4i?=
 =?us-ascii?Q?x9B+bZC/RZSOTh4xqhVh13sevE19vGukvcDskVIhzmk9zMpavWFzCpteuURM?=
 =?us-ascii?Q?Lr800lezBda+IbPlf/y1XR8o3f1vqONRh22XFbWYGSmim14/IA5z5TW/wiTD?=
 =?us-ascii?Q?ItDUUS84nXlU3wWwd+0Lj7hx2YfNZE+mficmzGAwasBUgL5wDIFNO6HEJiEO?=
 =?us-ascii?Q?NYf21iHuVFg5c8MGS5A8r8/mirhI36JJnsC+IrLV/ACpkozeS3ouNDiHlA5/?=
 =?us-ascii?Q?PHcV4SEpJGXHPdtOlwt4tZeU+CTsac5K7z70rhI7AY+GOMYA2ohBrcJhvXy5?=
 =?us-ascii?Q?cdahOFHqjqpkXR/b3AqwnUZuz85Q0HIXirTiC/fa?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 698ab3ae-572e-411e-7f06-08ddec73cf7d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 12:00:30.6311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lm4yHzRramhMFJEhpAHfHB3A+WmLKvmzRJedXb08ZC15FdGWMAzXoINbggm6LjfJp+6uemvboXBdsbAMWqgryg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PR04MB11162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_050044_269032_4BCDF1C2 
X-CRM114-Status: UNSURE (   9.57  )
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

Hi Krzysztof,

On Fri, Sep 05, 2025 at 09:52:19AM +0200, Krzysztof Kozlowski wrote:
>On Thu, Sep 04, 2025 at 04:36:44PM +0800, Peng Fan wrote:
>> The TJA1048 is a dual high-speed CAN transceiver with sleep mode supported
>> and no EN pin.
>> 
[snip]
>>  
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: nxp,tja1048
>> +    then:
>> +      properties:
>> +        '#phy-cells':
>> +          const: 1
>> +        enable-gpios: false
>> +        silent-gpios: false
>> +        standby-gpios:
>> +          minItems: 2
>> +    else:
>> +      properties:
>> +        '#phy-cells':
>> +          const: 0
>> +        standby-gpios:
>> +          maxItems: 1
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          enum:
>> +            - nxp,tja1051
>> +            - nxp,tja1057
>> +    then:
>> +      properties:
>> +        silent-gpios: true
>> +    else:
>> +      properties:
>> +        silent-gpios: false
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: nxp,tja1051
>
>This is here and in if earlier. Just keep in only one place. Also
>earlier else also touches standby-gpios, so you basically have it in
>multiple places.
>
>Just define if:then:, without any else:, for each variant.

Thanks for your suggestions. This is cleaner and easier to read.

Does something as below looks good to you?

allOf:
  - if:
      properties:
        compatible:
          enum:
            - nxp,tjr1443
            - ti,tcan1042
            - ti,tcan1043
    then:
      properties:
        '#phy-cells':
          const: 0
        silent-gpios: false
        standby-gpios:
          maxItems: 1

  - if:
      properties:
        compatible:
          contains:
            const: nxp,tja1048
    then:
      properties:
        '#phy-cells':
          const: 1
        enable-gpios: false
        silent-gpios: false
        standby-gpios:
          minItems: 2

  - if:
      properties:
        compatible:
          contains:
            const: nxp,tja1051
    then:
      properties:
        silent-gpios: true
        standby-gpios: false
        '#phy-cells':
          const: 0

  - if:
      properties:
        compatible:
          contains:
            const: nxp,tja1057
    then:
      properties:
        enable-gpios: false
        silent-gpios: true
        standby-gpios: false
        '#phy-cells':
          const: 0

Thanks,
Peng

