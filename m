Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2836CC4453A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 02:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ByKU7YUSgII4VuOanfJFeOLMFAkUc/p/V9s9SEvTCcA=; b=vH9wxvrbYzirBAVu/yu4xZocWp
	t6zwWUNPs92wmfUKfIO1keV0snR/D3oEpSw6337jvofUTSVp4M8/9xvOWM63Uu5g6wPTXHJY1B0Qm
	JJbdKvXrlD2DlZrQeG3W9MqgHWLArJAj0YuK+hGOA4qS7YEQwpaE1faMO8DGxY4TQ02Nk3cuvXrLi
	MPD8crOSLoiWGlVOgaceFG5KekM4Uz2jwGFnGzJw71uIc+xBLoLPZgVIc23yJtahgoQ3HGZPN9zoN
	GW8OP7/FtnbrBCU/0J9kYtlGYDrtDYmnfEbnPAyY19hmRw9K4MUmHqVKMM+iWVzorXzOcDwefPG/+
	aJrTUPlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmjHD-0000000DEia-3sU7;
	Thu, 23 Jul 2026 02:35:11 +0000
Received: from mail-japanwestazon11012026.outbound.protection.outlook.com ([40.107.75.26] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmjHB-0000000DEho-0kzT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 02:35:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hq5mWvF9W2e1wBJkTz0+Y+qCDc6DoeiDLCjXYab2xYJMb2+sXPIwEP4wkwf1gckb2Sxj7W39nq3tTMc1ym9hH0L+CxigyfufJODaR4lsKQqhWu0PId1kDrCpHwCOWCKw5f+1XqL9yWleXUpIO4r6nL2iqvIc7e1cWoJS/dvez/BrplcyseIk+DGKz/3JafKBrqwyjoFh63E2J8ebs3EXhSynJPY2sUF9PTp9pY3JhpyQTL9RIKvkTOBybp0k79SolpKVJMRHq3XSIMXhCSqvl6c5rC7uC3wBfy4poyDVcKtm/yyqK4ww2YVyZrGoK0Dg2WI75buEUM1o95+UF9E+zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ByKU7YUSgII4VuOanfJFeOLMFAkUc/p/V9s9SEvTCcA=;
 b=XK5cj4Ui4oeXi2So+KAMpsNHX9GM69CIUfG/mkKBom1eZp1c5pRQKA4mJb5V142cL1l6vTqDTkoIg+5qFFCeDPpXJ1PpYbK8APTCm5qx89rvWen4JgCEsqwUTaZCsdOgMG1Q3Gz019CJAq6mvv3SrNFlYq4dVoNqZlnwYE0iRUW3wqm/YU9mTieFQrbNrpLFryAjK2QebYCid9qVUjmpjKmLxyrL5AQ67U7bWqyHUmxewwo/RkEEOOfV3sr/afKMqPF1cyONXJwGsBvDGzbgMUaTTuG5xpVuxP8WuSUe+l/x+FhtXj6T2R7PgGeCRMAVN4PAJm9y43Kj6+IhtZOKTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ByKU7YUSgII4VuOanfJFeOLMFAkUc/p/V9s9SEvTCcA=;
 b=MEljK1LpM9+XPo7OTuGnHEjeFMycEVSmno6ENVjNSrH50LM32OKL13bTVD1r4VNWZ9ADyDsrO2rOmm6sWtXy0wF4lleXXCfFdLTn6mIN2Jv5vBle9Wg+QMoM3hmnWXIAD2q7egYCxa01cla1JqCiM3AEb9YgbmA0Zaw5qlCy57oThvcci6bHSBsoe6T2nWKwodGxjN17OCAUdEM68IqyG8nO1q+v4o4rg4bJTmY+YUAT9AULYeg0wQCixWdDjkkEo+G1fYvFqAKdK7upnkqM8D8IPL+EIJUGRU1KKmfqzOlhv2FM8u+T4hSgn1AeqTH8VIsJq/4djPzgfZ0BkTAEMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by TYSPR06MB6542.apcprd06.prod.outlook.com (2603:1096:400:481::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 02:34:54 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 02:34:54 +0000
From: Pan Chuang <panchuang@vivo.com>
To: nm@ti.com
Cc: gehariprasath@ti.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	panchuang@vivo.com,
	ssantosh@kernel.org
Subject: Re: [PATCH v2] soc: ti: wkup_m3_ipc: Remove redundant dev_err()
Date: Thu, 23 Jul 2026 10:34:45 +0800
Message-Id: <20260723023445.649478-1-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260722131019.u6cegpas3vl5pewl@vehicular>
References: <20260722131019.u6cegpas3vl5pewl@vehicular>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TP0P295CA0035.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:4::17) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|TYSPR06MB6542:EE_
X-MS-Office365-Filtering-Correlation-Id: 8aff4fd5-6c14-4831-0a68-08dee862faa8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|366016|23010399003|1800799024|11063799006|6133799003|56012099006|18002099003|22082099003|38350700014|10067099003;
X-Microsoft-Antispam-Message-Info: AFsXjYbAKBebdql8UZ++ePYU+mqVZDMriJySxKPNNGjhOSR/VkPO67LdsNm2ZMSJp5QUoHa6JGzPt5MgcAJ5NSaH33LnKDQvOqjVROZmOmYXsXKRoyJpGt/YjkArQlodo2x6p51SsFZpcq6aMLuj8dYkHJ9lCI4q3enpw2UChAdQBsM0SQ56TEDeLqmR5LSnb9HUWMBXQiu/0CEGLt/wv1Syl9q7OgBsLp7ZT3yv83XRNkJAIz7grDay3lfDSmLl9PFdR1h1Cwap8nX668AlVwyPXNeeUkcWgtB/fadBoaFdes7qDpXcN3/DvBu7cXknzBeJM8FAgKWwEmi0GhUETfR3T2qSYRpxM7RQTPgRE5/8yMr0D1s/u8dowGpkVugkWuC7PAQVHer/8VbgIrQ/KamtPWvuhyHLvcsUmy0u9O0qcKW6EVqN42SIyDRbERObiARSrsc19ahT7znmlIhsXAGQB+bo/MqNLfRCWWkbEJ2aFS6+B3W2wfQN0rAnsvTKyNZ4hxFsjNIseEWkVu46oa2XFmSfY9QHKOd0yQEiOSs/Ll7maoRzjn10PuCodmphoKufCdt7iTsXGx19H5DqezZzqiWlH3w5bE3NkEF5w5Z8yoHcpB6uasZvY2Ne2CmmKHuEX0euUOSuGzvlXkcdkt85YHv7FR5Zq2417ec9/w121/JNd2emsfWBcbsf05epQMGhP8/jq2MUK3XAUrlcBQ7Ss6V/tdyOGL+RnZSLp3M=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(23010399003)(1800799024)(11063799006)(6133799003)(56012099006)(18002099003)(22082099003)(38350700014)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmlqMWZNOUczcnZDYm5QeEIzN2FSWHY0V3ltOVlNN2xhZUR0eSs1S3dFT2U0?=
 =?utf-8?B?S1U2OEZnT0tndnRwakZVR3BLa1Z1THA4Z21sV2pxU0g1dkN0QVNQdkNmMWhO?=
 =?utf-8?B?WHk4dTJrRW5qQnQzTStKR3BzaVBsL0czWkRkRTJjOEEwV3VId01YZCtzUHJa?=
 =?utf-8?B?Y3YzVUltamxpWVJwMGdZYldJWEplQnpUZHBkUXhTeUM0QSs0a3F3Q3pzaTYr?=
 =?utf-8?B?bTQ4djZHeTVTU0Y4OUswc2RkZUlnMTZPcS9rZTd4M2cyNm8zTTBzRmxhekNO?=
 =?utf-8?B?VmEzNStVOFFHTzk0U3BZL2FGVzdwM0ZYdkFjVXI0V1BVc0kyb1BsNXo0WEtN?=
 =?utf-8?B?cjRYQkJqMGZYekFhek8raGpXaHBOZWRoczBjOTQvSTJ4QXIwRjZuZlkzUnVL?=
 =?utf-8?B?Ym5WQUZzbkY2ZG9tUElkcnZ1Ky93RjI3QlpXYW4zeFQrMVhaaUZ4ZDlMQVVX?=
 =?utf-8?B?UXBhVXMzYnFxakZQS2pTRU8yaFFCMkQ0WkNYT0ZIK0gwM3A5VXIzazRNNmpi?=
 =?utf-8?B?Uitocmx0OVQzNjJRamw0dE1ZdnRSaUsyRE9hMzBscWIydlhFSnZMY3ZpdUJh?=
 =?utf-8?B?Q2lJSnhPOVhpWTNRUy96NXo2MSsxL3hqemF4S2JTTThxMnpNRmc1em0wSHFu?=
 =?utf-8?B?eDZiZ24wM0F6QzNya3hxbmdsK3JrODJCTDIzbVZZcDdxejBTb3BuU1FaSEtm?=
 =?utf-8?B?bGh3MTM0Ym4rMDBSTktOVlhvcEwyZGpxVjArOEFXaU5HTG9mMlZzRzN3RnpL?=
 =?utf-8?B?N0FCK0o2c1JETGtlbG04d09JdVUyM1doVjl5UFp4OGhkQ1R2c3R3WmsxeHhT?=
 =?utf-8?B?a0N2bnozc0V2ZlpoY3cvUkRvL1g0UzJpd3RzOC9lVGpuOVZON0pDeU1pNS9C?=
 =?utf-8?B?ZE8vNm1raFhLaVdramhSZ05DQnhKR1ZuZFpxd29mSVN1S29MdVFZNVZRelZa?=
 =?utf-8?B?b0luL2JkMi9GK2J5TXJLM1Rub2pDRGpYNzFBaTB3NVl2bkdHQW83M1lGekJp?=
 =?utf-8?B?NnNFek5HWE5QNXFPZmdIajJZTDFZK1lRb3FEM0owYnZ6R1BOVlZ3NzFVbGl4?=
 =?utf-8?B?L054d0hsUjlsNUQvU1pZcnFlSzBUMmEzZCtTY2dZanQxckdsWEpaeGI1UG05?=
 =?utf-8?B?KzlGRmdXOGVWeElRMkdwb0d0L0E0MC9hUEsyK0wvOUl5SXdTSytwa2IyMFVz?=
 =?utf-8?B?V29HOHg2eThZUVlwYUZGb0o0YldQMUlOSmx6bHNLNjFWMjRFWXhIc2lyQUto?=
 =?utf-8?B?NGdnb21iRlR1dzJPVTA1b2l3WjVKVkd6RVBaZDZBZkdDVDZ2YmsvaXdiRFdI?=
 =?utf-8?B?NVA3T056YlI2MG5iZ0ZVZEdhSk93dzc1dUZIUFp6R2pDc3dvaTlIMHRLb3dF?=
 =?utf-8?B?Rm5xZklpQzB1cEt6ajY5cG1HQ1kzSjFHRDV6elJTQUV1SmU3T0JPZ0p2VDhI?=
 =?utf-8?B?OGZIanI2SjBxZTVXTitCZTRSVGZyRDE3am1hZk1RUDJVVTV0TzlldDNnMDd1?=
 =?utf-8?B?UGZUZGtBVTBmK0NKdDQ4K2tyWWdpVlJRRWNCVDBCR3NNNWF6ejFBTGErTTFY?=
 =?utf-8?B?WDczNUloT2ptUDVuL2RnVUxncWZHZjdEb0hoTkNzZDhoQk9MYkdKOHNGbWFT?=
 =?utf-8?B?a09qaFZQUUhEaEV0eDNHSnZlUDRKVWZhdTVJenBERDRkUVBBM0o4TWF6NUZE?=
 =?utf-8?B?d3JaSStkTG0wbk9JY1FNZGcxQUYxNnVCanEzdXI4V2hBU3prRjNiL3p5SmV6?=
 =?utf-8?B?MGEwekJCNEE1ZVRWVzIyZWpHRTg4S2o4TE1Pd3J3eDV0b1JPd2JPQzlQWDZ3?=
 =?utf-8?B?aUFYc00vTkpiVXgxMjd3UlV4cUsycVliOGJlcS96Nzg1QVpVbFBlTXJxd25v?=
 =?utf-8?B?eW1FVmJxRC8xUlVvbVBHYmJRajNkRWRwdnlRMEYzRnk2ZTBjRHUzMFFIRC9s?=
 =?utf-8?B?Q1dlekNmR2xxQnhtVkVNQXc3Vk1hMHdGa29JalErNVUyWEFQQkJJdm83dllB?=
 =?utf-8?B?OTJkWHdYQjN6U2VyZXh6VHNFR3pkRWI1N2VYNXpRU3k2UU55cEpXNUc3Q3pC?=
 =?utf-8?B?SHdGbWRYUGNYTXk0ZVIva2VDVzcvUjBvR2VraURvUm9TdWJ4YWhXRlRvTVhW?=
 =?utf-8?B?ckpzRzZCb3dGa3ZhNHNEZ1Z2OHB2OHpKaHBjZEEzdnJOTHFWekxBN0lWMUZZ?=
 =?utf-8?B?NlJTNG5MWWVNM3pQUkVVbFNxd1NPamlLZTMwTGpBTThZc20xRzBqclVTVTJB?=
 =?utf-8?B?SG11VGlqOEt2eE14YnJLZXNXcWlNTG5FejB4bnN4a1JjbjJYQjM3SGJFY0di?=
 =?utf-8?B?UHRNQ2NjSzA0aHUvajVnZDRnZDYyR3cyeUgySk1sU0pTdnE2d0x0UT09?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aff4fd5-6c14-4831-0a68-08dee862faa8
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 02:34:54.5206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ybs6LHqy2rQ2RjqUguOwEGgkVw08aSbJ/tBx+i5xLIK6eYe0dlzejJCoEfjP4G9CRtmRqkbfH5M7opeXxjZoYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6542
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_193509_222903_F8C86FA7 
X-CRM114-Status: UNSURE (   7.97  )
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


On 2026/7/22 21:10, Nishanth Menon wrote:
> On 10:35-20260722, Pan Chuang wrote:
>> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
>> devm_request_*_irq()"), devm_request_irq() automatically logs
>> detailed error messages on failure. Remove the now-redundant
>> driver-specific dev_err() calls.
>>
>> Signed-off-by: Pan Chuang <panchuang@vivo.com>
>> Reviewed-by: Hari Prasath Gujulan Elango <gehariprasath@ti.com>
>> ---
>
> Did anything change in V2? we don't need to post a v2 purely to pick up
> reviewed-by. B4 will handle it.
>
Sorry – please ignore this. I'll resend a new version without the v2 tag. 


Best Regards,

PanChuang

