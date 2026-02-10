Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B87D8EA3F2A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 09:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3uwkM0KsGhEaupU65gmEMHgwAyQCXvflIrMhYFriUZs=; b=rBNoGVXcBZqyUhwTpNbVl9+HpN
	vIqCT7hH8fgB1O+bmmlunOC125UaFvUr4VqqYGrAIzOWmo+gRM+HK8lqMkhQ2PZsYFf3N0D5qLg8+
	o8P1GsNrpUXMfN+K5Pnv3GH3te8iMcciOqN/fZZGmgkFrqPd1FzzkleBMbV8VvUpyDRuIEP13cQp/
	9viXiyKUkJ22vO9D5j6yqLxM9C7bcLZdjqVDmu3U+f6j8rLqnpU4Ugvub1lyREOl4jHtXmo1oxO4L
	YmpX7vDU4d01p7Jer7WlEYrBbB/Px7Ewha4XYQ475e62Rx2pgbYAqAWc8jLx4ZEgWflo3sxmr7ujP
	2W/5rM/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpkTT-0000000Gn10-1xYp;
	Tue, 10 Feb 2026 09:56:03 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpkTL-0000000Gmzv-3ryS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 09:55:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L0c8wKstVUqJ6CtQ8YhSthf/2U+WP35zsA4LRmNNujMfTZ5hPBxExsaNgD5Pjjk0YwPd/IR/GEgel2nBeRSdQzXtYNmBk2rxfsvZNvoboPJB3F+Jh1Dew51EMMJbL2cS9OLMDSNDzniZ4Fbrntl9OeYI/+KiQ+5axphyitax+bQa/8qy+avconprL+jQ/2TGgCE6P3U9CCc+cDZuAa6INhtgslI4sYKHOCj0HoyaalHcoEim4cbJRXx7kqdyHLrAPxOoUKE/Ki0mhxKi84YqYvQc8tsUDe7RTTXngBcXs4GMoTztJC/Y1opGvebfqrGmzxamAMGZfsY7LOa16sUjRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3uwkM0KsGhEaupU65gmEMHgwAyQCXvflIrMhYFriUZs=;
 b=lMCTC9i47IolJyLOIylU3XrINqhoLN7YB48cQTRlDRwH1+PK++kxPkDK+H1+8Q77Ti+gXwzKML3jPX3ElpSoHgPNih/RWUeUuihg1ph+6pBBF+cQv0kMXpOOeU2/naI9GDvrMPqLxr49Ui05TF1m7Cm9N60NplvLyp0V1zGd6RXGv3EyKX5nCAKKojaPMiu6Ax18OpoPxJcAMM7kQSZ+c4g9EIH2NbFX0cwVuVJEP8rR3xN1x8qZ3cQajL6OxFUCDG7YF/toHYlFNPkWsZnk3DGGi9g8IB/CE6abjIhXWGTAjGbQ2DNcsUZSEdOOSC9AcElzviGU08R9eJd1RMvsoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3uwkM0KsGhEaupU65gmEMHgwAyQCXvflIrMhYFriUZs=;
 b=PV0SBnoobDeB2jgdBbtL8FxMoLeI2DHl9PFv7zRSvluE1clNAXZsZ1fk/4W6OoGmEasCXZcDVCOdxNP1oO7nIfz01bur/QmK5HbiQxUaNBZmg23Gtl2SIYoYetEEEhTScAGedb239pbtro5LdnUofIu/gZO2jIxNch1B/yVsa3Ss1nf8AcGCoEvoH9bpahmLEvcY8OxNR4gAKZ/IUL27JtUoYVnrTb2b4oOYNQtiphJSwUYXGFe02tkFlErOaaMmxx0bWBAgG/LQfSQBrR/MYyh/QHRPXPVqENUmVKsl1J3gGeb9u+2xRXZZ6SbazzdY4VwDlgXranuZKGiWf5VJEw==
Received: from DU2P250CA0023.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::28)
 by PA1PR10MB8476.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:445::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.17; Tue, 10 Feb
 2026 09:55:46 +0000
Received: from DU2PEPF00028D0F.eurprd03.prod.outlook.com
 (2603:10a6:10:231:cafe::82) by DU2P250CA0023.outlook.office365.com
 (2603:10a6:10:231::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.19 via Frontend Transport; Tue,
 10 Feb 2026 09:55:48 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU2PEPF00028D0F.mail.protection.outlook.com (10.167.242.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 10 Feb 2026 09:55:46 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 10 Feb
 2026 10:57:36 +0100
Received: from [10.48.86.212] (10.48.86.212) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 10 Feb
 2026 10:55:45 +0100
Message-ID: <516036b6-b825-4a29-a48a-5d3af3234968@foss.st.com>
Date: Tue, 10 Feb 2026 10:55:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] dt-bindings: soc: st: document the RISAB firewall
 peripheral
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260209-stm32_risab-v1-0-ef0b2b6a7e0a@foss.st.com>
 <20260209-stm32_risab-v1-1-ef0b2b6a7e0a@foss.st.com>
 <ee9759a6-1779-4891-8716-24c36134198a@kernel.org>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <ee9759a6-1779-4891-8716-24c36134198a@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.212]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0F:EE_|PA1PR10MB8476:EE_
X-MS-Office365-Filtering-Correlation-Id: bae70064-8359-40a6-68f6-08de688a9011
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SjhockZRNlptUFVGM2ZldHFUN25IaUplNTJYUU1NRWpXUDhzRVdmT09seDdz?=
 =?utf-8?B?R09BNSs2L296T0d0QTAxRS9GOUdUc0FRdzlpaEtLVTh5TDFlcXd1MHBzMHVu?=
 =?utf-8?B?emhibUkrSy9YU3Y0TTdFRHlnS2VsTDVoQ21aWkI3Q2l3MU5aSkJVb3NEWlpa?=
 =?utf-8?B?dkhuYlBITXN6cWhWR1VsTWtHeEpFMk93RjdNcTZuUU9uRWg2bEZ5M2tGSnU5?=
 =?utf-8?B?K010cWdUK3JDV3gxOC9pckthYVB6VEZmNjRESnowWkFJUXc4TlVRSDNldEN0?=
 =?utf-8?B?cnFyYUhYN2wwMWZ1VkxJeUtmbU8rUVRpeitKc1Vzd2w5SUMrUTl2b2MxaTk2?=
 =?utf-8?B?aHlHSVdUd1BxS1NLdGZLQXNFNFJydjdabHE3RUVNV2RId3hHQmxlSHNJcEdO?=
 =?utf-8?B?Zy9oeG5XL3ZmQU9YdlIzUzBLV3JOejhGdWg4MlV5WC9JTmI1RE5MeXl3d2tv?=
 =?utf-8?B?Mng4Q2psUnhpMUlwZGpYK3lvMUlVWjJCVWYwM1RKVXM1UnFITXREblpIN0xy?=
 =?utf-8?B?T20ya1pOeGkwTG01bHFkZ2JpU2hPOUgyQmhmNlBEc1BtKzVLRlplNmVPSHFr?=
 =?utf-8?B?R2tCeEs0aFVlMXB2ZmxjM3ZwMHFjMlBvTUx6M1dwTUNkY2cvaS9rSWE2SE1r?=
 =?utf-8?B?ejZqM2RiYllvMmxiWStKYVNpY0ViTXYyV1A0TW1rTFRSNDBLZzlzZVRUdmNK?=
 =?utf-8?B?Lys2Ylc0YjlHR0xSa0gxcGhKWjJTU285TkkvWWxWcEh2SFJkNUh6YXpiTkRk?=
 =?utf-8?B?ZWg1Y0JEOE1BUzBFajRjYjVVbERtOUptRlo2Vkd1Wk1uR2pOdmxQMzV5bTlT?=
 =?utf-8?B?ZGNodzdKQnRKM2txS2VweFdPakx1OWJNYTkzMW0rQmxTbGZnbGFrdzVtTzY1?=
 =?utf-8?B?cU9INkFFb01ObGJ6UVdYNkVlTWNOOU5MZFVXN3gzcUxXb3JwdzZqdWxvSU8x?=
 =?utf-8?B?TFJlLzA5RTFGbmVQZUlYRk9sZ2RsaTJJbFZPUlV6R0svU1V1eVloQ3RqS1hQ?=
 =?utf-8?B?dHRubzJSZ000TExyM3FFNU0rOHZMQWg5SytmKzlpSmZMTHIwdk9MNy9aRTdk?=
 =?utf-8?B?Y2xwS3l2NFB6NjlNVUVxb0I5aEtDRnA1OWxIQTdMN0VxVzRMbFp1eGVMKzh3?=
 =?utf-8?B?Z3VqU01NYUYwa1RZcXBKKy85b3N6ekIrVCtySUNGbFg3RGgySG9aOTMyVEJM?=
 =?utf-8?B?dnExWWM0OE1KdTBaaGhXampoSWJGdTAvblZzQkV0OTJndFpSZkE0RnZseU40?=
 =?utf-8?B?MldhRnBFSWwwVkxEMVR0aTNGdTQ4bG4zNGlLSDd3clpUUDJOeVVyMFAreU5N?=
 =?utf-8?B?UWhIUUozMit4MFR1WkJLNVhSQlI2MHNDVTJEQXppMWdvbUZOQmdLUVZxcnNy?=
 =?utf-8?B?NG51ZVE5dU5YeDV3dG5vRGhncTJXR21nOUhLZmVNd1NUVy9nR0tldEZ6Mk0w?=
 =?utf-8?B?SmJDbnQwSGhwTnJDVzA5eHBQckJiSUNiUEEyek14T0FyREcyMFpna0xvN285?=
 =?utf-8?B?d1J4aC8rSVpPWnNGUytjMm9lNVd6d2FycGdmOHJYdUtjNnRtQTN0T1ZDQkV4?=
 =?utf-8?B?akdmZldFdHIzb0NTRCt5UGdWRThETVREMXBrMHU2TjQvNlB3SWxwSjJzU3gv?=
 =?utf-8?B?ZmErMEpkeTVpSkRXcWJmbGJibkJYTkk0SStUejNLV2dxR1BGMTZNTzI5VmJz?=
 =?utf-8?B?eE9kU2l3V1ZOWlUyWHd6ZDBUSzh6Q1ozWFBPSlFTem5zc0MyWGNYZ0hnSnBH?=
 =?utf-8?B?VXBiZGZFYytlVmxCK1ZMNkcwQVJYaUFhWmFMQmVkbXNNdVU0VVNYMDFVZU50?=
 =?utf-8?B?OWJ3MVpVMldoYWMza2ZaYitRY0tWczdKNkFPdmI5am5YaFZEM3JFM3U3TUNK?=
 =?utf-8?B?cklEZVNmejFYcHRNeE4yTjArdnFFVGptTHVQbXI0ZnVua2ZJUTJ4dGZ6UVRG?=
 =?utf-8?B?NFpmQkpvYmpWaE5sN0hQYm03QUdPVUl3MUpUN1pCUnR1T2I4UUh1WWljWjV3?=
 =?utf-8?B?VEVpVXB5ak1nZmk4RW8rc2ZaNGRCbFlNNm1XL2hxeG1Pc2lXYlZacTVGcnU4?=
 =?utf-8?B?Skx1NG9zSlVUK0tHMEFNRWVINFh6MmRDRVRjSHJWbWNlUFhRb09FZ2w5a0lm?=
 =?utf-8?B?N3hIK1Bud1g1bi80TndueFZVcnNacTlTV1Rhb3U0dzZkWnBWa056NXhGWkF4?=
 =?utf-8?B?cUFJZlJhaEpVdVptRzNkcTJnOE0vZStBblVNbytCKzYzK2N6bVVvcjI5ajB1?=
 =?utf-8?Q?xag0RAcXX2DLDZqiwB2nkszj+VxWaYBG3q5dOLKeNk=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 63kLOq1UgZ3aWZWkA0cBJrDpTGHUZfsdjbb+JGP/6dmEpYRczHjofI3JKXHBm+usVzq4iiTlPKYq1faN0mOu1ovoCsIXwGwfGQZkVjxm4o1N6D25ydPSBZpwwUIPbTnzolcl7bKdEx2H0F+mGISkfMm292aGTE7aGGpn8KsKEpq653hR4bX6b1lbfiEWDDvpyycsExm7ZVMI7R+s3NmgXQdko5EuSvN1WWd1WOiTvEdBhbrH9CP/0KpKrW12xYpGWT0f0ja5Nb1t9eFYdzmH0E8wX4z5z6SL8MLF2CVFFyAuSwyDn8rizufuwocgQGdY8+4pjkHv3f4BODI+Is27YcDG8tYi5qZsGuQ/jD3ErFedZCLr5PehBTycuxLAESVAyGG8yUc9MMwtGS3bHU/VM9nNaeC4xi4W+wRHvnH9U9OIZMtvqVZori+Pd87AlZZ3
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 09:55:46.3853
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bae70064-8359-40a6-68f6-08de688a9011
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D0F.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR10MB8476
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_015556_692154_FC577F02 
X-CRM114-Status: GOOD (  30.66  )
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



On 2/10/26 08:57, Krzysztof Kozlowski wrote:
> On 09/02/2026 15:59, Gatien Chevallier wrote:
>> Add documentation on the RISAB peripheral that is a memory firewall on
> 
> What is RISAB? It's in capitals, so some sort of acronym?
> 

I'll add a small description as well in the commit message to justify
the acronym.

>> the stm32mp2x platforms.
>>
>> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
>> ---
>>   .../bindings/soc/st/st,stm32mp25-risab.yaml        | 74 ++++++++++++++++++++++
> 
> soc is not a dumping ground. Find suitable subsystem for it.
> 

Considering the RISAB filters bus accesses, I guess its place
is next to the RIFSC in drivers/bus. Plus, all stm32 firewalls
would be located at the same spot.

> 
>>   MAINTAINERS                                        |  5 ++
>>   2 files changed, 79 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/soc/st/st,stm32mp25-risab.yaml b/Documentation/devicetree/bindings/soc/st/st,stm32mp25-risab.yaml
>> new file mode 100644
>> index 000000000000..d05a683c594d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/soc/st/st,stm32mp25-risab.yaml
>> @@ -0,0 +1,74 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/soc/st/st,stm32mp25-risab.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: STM32 Resource isolation peripheral unit for address space protection
>> +       (block-based)
> 
> So maybe here would be RISAB explanation... Use proper capital lettes in
> the title (e.g. AP or Chicago style, I don't think we do any preference
> or consistency, especially that most of us including myself don't even
> know the difference).
> 

It is the non-acronym version. Very well, I will change that for V2.

>> +
>> +maintainers:
>> +  - Gatien Chevallier <gatien.chevallier@foss.st.com>
>> +
>> +description:
>> +  The RIF (resource isolation framework) is a comprehensive set of hardware
>> +  blocks designed to enforce and manage isolation of STM32 hardware resources,
>> +  like memory and peripherals. The RISAB peripheral is part of the RIF and is
>> +  used to protect internal RAMs by applying access rights per RISAB fixed-size
>> +  page. Through RISAB registers, a trusted domain, or the domain to whom the
>> +  page configuration has been delegated, assigns memory pages to one or more
>> +  security domains (secure, privilege, compartment).
>> +
>> +properties:
>> +  compatible:
>> +    const: st,stm32mp25-risab
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    items:
>> +      - description: RISAB bus clock
>> +
>> +  memory-region:
>> +    minItems: 1
>> +    maxItems: 32
>> +    description:
>> +      Phandle to nodes describing memory regions to be configured in the RISAB
>> +      by the trusted domain of at least a RISAB page size.
>> +      These regions cannot overlap. A zone must be within st,mem-map range and
>> +      can be represented by one or more pages.
>> +
>> +  st,mem-map:
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    description: Memory address range covered by the RISAB.
>> +    items:
>> +      - description: Memory range base address
>> +      - description: Memory range size
> 
> Why do you need this property if you have memory-region already? This
> also should be part of <reg>, although this mixing with memory-region is
> anyway confusing.
> 

The RISAB is a memory firewall peripheral covering internal RAMs. It is
possible to configure multiple memory regions within these RAMs (done by
the Trusted Domain) with security, privilege and compartment isolation.
This peripheral allow 4kBytes page granularity. Each page can hold
different access rights, with 32 pages at most (hence the maxItems: 32).
That is some information that can be added to the documentation.

Moreover, when a region is delegated to a non-secure privileged
component, this component can configure the privilege level necessary to
access the region.

This property gives me the opportunity to get the memory range covered
by the RISAB. "reg" here is used to access the actual RISAB registers
holding the configuration.

>> +
>> +  st,srwiad:
>> +    description:
>> +      When set, the trusted domain configures the RISAB to allow secure
>> +      read/write data accesses to non-secure blocks and pages. Secure execute
>> +      remains illegal.
>> +    type: boolean
> 
> Shouldn't this be a property of given block from memory-regions, not
> entire RISAB?
> 

It is a global setting for the whole RISAB (in RISAB_CR register) so I
think it's fine keeping it at RISAB level.

>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - st,mem-map
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/st,stm32mp25-rcc.h>
>> +
>> +    risab1: risab@420f0000 {
> 
> Drop unused label.
> 

Ack

Thanks,
Gatien

>> +        compatible = "st,stm32mp25-risab";
>> +        reg = <0x420f0000 0x1000>;
>> +        clocks = <&rcc CK_ICN_LS_MCU>;
>> +        st,mem-map = <0xa000000 0x20000>;
>> +        st,srwiad;
>> +    };
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index e08767323763..b9a1276e94a9 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -25092,6 +25092,11 @@ F:	Documentation/arch/arm/stm32/stm32-dma-mdma-chaining.rst
>>   F:	Documentation/devicetree/bindings/dma/stm32/
>>   F:	drivers/dma/stm32/
>>   
>> +STM32 SoC FIREWALL DRIVERS
> 
> s/SoC/SOC/
> 
> 
> Best regards,
> Krzysztof


