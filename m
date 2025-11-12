Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED7AACCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 15:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VdaLceC4UrlA7iX67MVInF9YzvUvXUJ+wTS1hTdRhUo=; b=oHBwZ0pYtFeAPS0Jiq9tG319Zh
	KTB9ff3PrPTOYJVLGP5OQi+8jXxzsXqx9MDqfZrgy+NknV3Laao1oZdJkTrgG8UEi5siSJnQX/Qsx
	WdMvcZtAP9HHY0iOZUNRWBiCmWbQP3uexLfVihVlR20Ha0Aa1h3qrVKACTnZvBBFoKziJQKUJuFPj
	8lmnKs8bqHVyY6wXM64vLgY6Sf6BEigJ3oAiERfgxj52G1XS4fvhfamm8NJY/Gzmq3OfqDdIkOfKU
	G/tb+aFcPGadZAXWZR3lgJrVM0AjCuyeexPaTbugMiPNmCb9asod8MYJa0nfSDn9y4kW7dm4veNe9
	SrVyGXPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJD5S-000000095zH-2fww;
	Wed, 12 Nov 2025 15:48:46 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJD5N-000000095ug-3e5E
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 15:48:44 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ACFXw8u1591694;
	Wed, 12 Nov 2025 16:48:34 +0100
Received: from pa4pr04cu001.outbound.protection.outlook.com (mail-francecentralazon11013022.outbound.protection.outlook.com [40.107.162.22])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4acqa79pee-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 12 Nov 2025 16:48:34 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lg4UAKqq0AU3XUXoPJ+LqpYNNZIfpg+TE2Xj2+tqvm1W6vQDF5eRXYYCZNEBkO0aeusc6VmOPHrO9S3F00Lkr1h5oqdkI1pQzi/jCgm2KPhC7OwOKUEdKmtxhe7xHPJ6dvYDbqhsX7X9LPxdoLx+2Dg3IAe+WTVvUflQlxTJydO4jLeESdojuJ5oW7d+9ZKlZgHkdYvxGa5TUqC5GrWWoZZzi82pPChSOaH/cB7+lt1nbFu1rp+E45s6xXCt3lbP9rzKB4CT6UBb/Diet0Ynm/5sgf4E/To+4WVc3ZDOv7ChJgyd3aOVJ2GR6KwXnov+CCBKY2mUZVzwPMrnnd+k4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VdaLceC4UrlA7iX67MVInF9YzvUvXUJ+wTS1hTdRhUo=;
 b=eok6QQFL9CX0jjp8bSnGB7pfK0NDpem0tHDPHDbZKGjkmenL0meAKJTE2kWqeuNjBMr9z7HfLq5IZDSfjv/dcRBzUvqiFbWFKPc64bmgXeTZsM63RtNzaLQHxZ+i3TEjIARAthchmpGdqYyEdVGjGo+0Ws5Ry0VEieBed/dg97DqCXPGhiw/NmPsOg7vrNmXNgHQcQbdIvjyvKjbMCMCjbd66Di0+YajpFcc1ia6Ej6tIj69LF9d1sPESrUpTsNA7iY5S6Mab79l3LgwyehJTbbuzcWq42sZ5nBpt+8T+HrF0IhBTEm25dz3sjHQ5E2cn18nNsFKb9B4pgKKG1vmGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VdaLceC4UrlA7iX67MVInF9YzvUvXUJ+wTS1hTdRhUo=;
 b=aTJnZLfOHLQ6wCdWHvEKJKBGNZ8WSlDQHnlRXLgog66KYL3DTshtjRaYkjeEu8/EXZOK8bjzLdEa+mnyFGCKIoAEYWEu77UAHIxESeN7R9CtI9BiAnhpzp6eJx3yN2JuaVAMLYyS8bQdzL8aSq/yrZc+JfNIyOBQ+FceBeVYk0O4lpj6D1PmXWVtcdBViqeyw7+3CHFAMIKidoKDzK6taVt2ICSBXT2dXnTPxxac6ryH8UogkJlr8I4PhafxD/MJLzghlvXoJu86Uj7QH+wMVXNtdRjRS8rrFvHKPIVPTgg/34xH0pwOkJXm/XZyHBY20twi2hcVyGUFwtRLrKq3vg==
Received: from AM0PR02CA0163.eurprd02.prod.outlook.com (2603:10a6:20b:28d::30)
 by AS2PR10MB7348.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:604::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Wed, 12 Nov
 2025 15:48:32 +0000
Received: from AMS1EPF0000004E.eurprd04.prod.outlook.com
 (2603:10a6:20b:28d:cafe::86) by AM0PR02CA0163.outlook.office365.com
 (2603:10a6:20b:28d::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Wed,
 12 Nov 2025 15:48:32 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS1EPF0000004E.mail.protection.outlook.com (10.167.16.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Wed, 12 Nov 2025 15:48:32 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 12 Nov
 2025 16:48:39 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 12 Nov
 2025 16:48:16 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Wed, 12 Nov 2025 16:48:08 +0100
Subject: [PATCH 05/15] ARM: dts: stm32: Add boot-led for stm32f746-disco
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251112-upstream_add_boot-led_for_stm32_boards-v1-5-50a3a9b339a8@foss.st.com>
References: <20251112-upstream_add_boot-led_for_stm32_boards-v1-0-50a3a9b339a8@foss.st.com>
In-Reply-To: <20251112-upstream_add_boot-led_for_stm32_boards-v1-0-50a3a9b339a8@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000004E:EE_|AS2PR10MB7348:EE_
X-MS-Office365-Filtering-Correlation-Id: f159b725-0178-4ae0-f69f-08de2202ef0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?azcxRnFBeWFhbVRJWkIxTWZWSnJGQVFDOGc1SklDWWlZTGdqbEcxVWdpQkFK?=
 =?utf-8?B?T0Rwa2trdTBkSUx5UmxNNUJxcFAxbGJuR0dvR3lGdUxoR0J0TTEwVmhrTlcy?=
 =?utf-8?B?ZFlZbWpubXFxWjFNMnpPamQ5Rlh3emR6ZTdleGs3Qmdieks3bXB5ZHNKcGRq?=
 =?utf-8?B?cnVBcWxJVk0zNkZLQmZESFozSjJBQjNTekRSZDBkVzJCYXdtVFhGV2NwMkMv?=
 =?utf-8?B?a2hvRHk1WXBBQTJjWEN3c2dpUUFKaEhTZ3puQ0VwZjEvVlJFSmhCVTNXRHll?=
 =?utf-8?B?RzlqU1ZpVEJOeUhLdWQwK25aREhUSEhwWGpBQllXR1hoemNPUC9selFRRm9D?=
 =?utf-8?B?bW8veFh1MGUxTFk3Z0NycTZKSmd2cDg5aUVnVHNHdUQyc3VoaVQrSUFnR3JD?=
 =?utf-8?B?cFFMNTZyTHpVbUdCSmlydnEvL0psNXpVVnlrL0ZlekVMQ3BqdzkyQTVsbHhp?=
 =?utf-8?B?MXVPc2NFUzk4T2poa0RRYU5iU01DelRkTVpTa2htRk5Rc0RQazRLaWdOUVhM?=
 =?utf-8?B?WVBDMGVrVG9kdzZUNnJtamREMktCdUJ4Q3l3U3ptQ28vZzJyM1JZSEtJQzZS?=
 =?utf-8?B?ZzBjU1dVZVVTZ1lIS2xTTDJaRWpwb2grUFJFSHplRzc1QXhHL3IwTjZ5TkNU?=
 =?utf-8?B?OC92SEcwcDVSaHVwTytHenQ4WjNjejM5YmJtSFdIQmhwUGU3U3p2RVVta0ZS?=
 =?utf-8?B?MWpYbTRWWkdWVm1qNklZeTgwajVDMk9OckJGRFlVYUt1ZVgwMFFwajZkQzZN?=
 =?utf-8?B?eUpmWGtXUVU3ODhGRFpvQjhQWjhuL3hiU1J3YW1pZ2JSS2F5ZDAzTlo4Yko1?=
 =?utf-8?B?bWJoazBsbjg2Nis3RWhZdVJiYVFZTnJHbnRVRzBvSCtnU0wzemw5dldobWxw?=
 =?utf-8?B?K2s1dTYwNW5lMXRwV1RicTh5a3VKWUpMN0orRnZ2UDhPVk1JY0IvL3IwcTBz?=
 =?utf-8?B?VWpUeUhiZTZXcGVsTjdpa0FQU1ArQjc2QzlrOGEvZTBDdGRDb2pkOC8rc1NY?=
 =?utf-8?B?OHVvV3M0RmdPd1lnNU5aMXd1UXZ3cElQZ09NQUNNSEtGVVJ4VXhyM3I4YnFC?=
 =?utf-8?B?NEwrdEExam1ZUE90TTdMdjJnMmZoSDI0MEUzOHpZRzdlZ2pacFhkZnRsZmpC?=
 =?utf-8?B?SHRsSE5rUkVlVnU2RktkSjdTYlV3ODFiaUg3bkU1ZEZGSHBHZW9tdE5sdnJi?=
 =?utf-8?B?TUduRWNBMXBVN2xHcWJGdGdOb0pCM2JoTTMvbmhvSmFHSmVoWjE4dXZjT3Jj?=
 =?utf-8?B?Z0xIYnZoTVBQUzRpOFpoKzBVYUh6VGYvK21zN2hpRURTbVJIdTZyUGVRUzBL?=
 =?utf-8?B?ejJROEpCdnU1WXdSTlZYdFEvZGdMM3VKQVB4dmZEUllydUVUSHJLWjRQMCs4?=
 =?utf-8?B?VHBuWEZVZUlUQVIwUjZiUU5MN0RwR1J1dFFOc3dpWDRyYU9SYWxHWkVmelll?=
 =?utf-8?B?VUk2MTkrbzVSQ01DbWpiOGhQbW8vdzEwenlKSkJ1bldUSlh0OTI1TWo4Z0hm?=
 =?utf-8?B?MlhRYW5tV2FYcEY2T05icVhQaytIdm41bThtckpFWnFxNWV6TmowVHI3bjYr?=
 =?utf-8?B?RDlvblFGSzBJS2lZWjdnYVYvQ2RyaEgxRlJtTlBzYmdOcFBRRXVzU2lCVWVX?=
 =?utf-8?B?dm9PSUNHWEs5MnFTaDVvYzBidTlycE5CbDd0RUhzUnV2ZHN2a2V4Qk5HOGlC?=
 =?utf-8?B?Uzl0VHFvamFhMVNEc0hZclJFU2NFNjRHbXU5c211YlNQT0NXOVVKMW5sdTRV?=
 =?utf-8?B?d3ZQK3hsajlYVGRUcEhqdlVzV0RuQTU2UmNoOWpFaG8wNis1VkFuZStjQVhU?=
 =?utf-8?B?TWdsWUJrTlJWOGxEZ29kdS9NZEtwd1hqaWVXcHA4ZGxGZ2RwZHBwWWpMZ1hv?=
 =?utf-8?B?TXJIZ2FrWGN1MGFQSzhnR3YxblZpV0hvRUVmMUtFcytQMkliUmdHTjRzODZx?=
 =?utf-8?B?NzRLMVpDWkxSWndtYXhJVW1KM2NPbm9DQXZoUXpTTEE2STBQbTRPT2FJR3Nt?=
 =?utf-8?B?SnBzRUNqRUJXMitsUU1LOVVxcjNmU091UjF6TFhLL0VqVUNGOHdJMGU3NHRa?=
 =?utf-8?B?UU1LVnRxemt5bXltQ2JlQlhWVEJveU1kQitLeCtjZE9TQ3J5Z3V3NVpiOFk2?=
 =?utf-8?Q?eOG4=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 15:48:32.8382
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f159b725-0178-4ae0-f69f-08de2202ef0f
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000004E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7348
X-Proofpoint-GUID: jLh4GEQriwkSAKNgCetjqCODRldITHFg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDEyOCBTYWx0ZWRfXzRmk39tR7NP3
 MEhreIb7zfmeI7h140Y/V/7/9woG6JPi/BFDqPtOzdlhMntZrxa2j51iK5/F6L500iUXHl56x2I
 m8sHBIXWdth9CJzEK+IA3cBZsDlk4sBYrWkJrLrrAhxOh0iCP88z3qIeug/qboXlsvrpTM0H/4O
 hw6aqUgfJ4ZRCZ/i5j51CX/JnGs0KH+f6jEq2/xa+RHAA7p9LTir2V3g9u7l/l+xLjJ9U4XtgaH
 uaV4RLqgnSSn0LSpqMvlClg4bjGf3BK8Vv2BLBPUvLFEQG2E1cWjzi5Q1LQhVn74EvlvX6PPj82
 sFKau3/726KahLSk8eaSk5kjaqAYnM1Hfr21noaqljnQB9D4iEfGGdjbRveGtIlNp6oTwlQJ/uz
 cIGIzD1LBGboHjX9kjPEWtpuuQjA4A==
X-Proofpoint-ORIG-GUID: jLh4GEQriwkSAKNgCetjqCODRldITHFg
X-Authority-Analysis: v=2.4 cv=VoAuwu2n c=1 sm=1 tr=0 ts=6914ac52 cx=c_pps
 a=y/F8+/pL2OdyMtBIB/S6gw==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=u3cjbNmyGIrWD7u9J0UA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_05,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 impostorscore=0 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_074842_205188_78B1156C 
X-CRM114-Status: GOOD (  10.99  )
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

Add options/u-boot/boot-led property to specify to U-Boot
the LED which indicates a successful boot.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/boot/dts/st/stm32f746-disco.dts | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/st/stm32f746-disco.dts b/arch/arm/boot/dts/st/stm32f746-disco.dts
index 2e6086eea6ed..61ca41ea523e 100644
--- a/arch/arm/boot/dts/st/stm32f746-disco.dts
+++ b/arch/arm/boot/dts/st/stm32f746-disco.dts
@@ -81,7 +81,7 @@ aliases {
 
 	leds {
 		compatible = "gpio-leds";
-		led-usr {
+		led_usr: led-usr {
 			function = LED_FUNCTION_HEARTBEAT;
 			color = <LED_COLOR_ID_GREEN>;
 			gpios = <&gpioi 1 GPIO_ACTIVE_HIGH>;
@@ -99,6 +99,13 @@ button-0 {
 		};
 	};
 
+	options {
+		u-boot {
+			compatible = "u-boot,config";
+			boot-led = <&led_usr>;
+		};
+	};
+
 	usbotg_hs_phy: usb-phy {
 		#phy-cells = <0>;
 		compatible = "usb-nop-xceiv";

-- 
2.43.0


