Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A1D6CA100F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 17:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q63S/pzCmgYAeiItkbGNfFpVxfO9EDvNlnRPsm8kCck=; b=epeJA6ij0KlFBffAmNwkQTffr0
	YROKpwBOwaYOzxjCaUC471N3aE4Qw2MgbpoA63DbyIWR6YvLeiy9rB2yKri9wJ0ONYDL9a1T/JAsX
	IavjZegFlsg8eaqpYthJuLOtJ7AC19B+ViM5a2n87UeGV+YmLftNtqCMoeeI2yZ59qcnb9BTo27Vc
	5CO8actxbL8jEwDgNO86BR+pa6xl2/8fiAFWl+bZxHTHlllgUanvmPy71lOa+wSjpT+lvPO/O5KCK
	z30Mj6U2tgxGBGLynUwO/D8M1Y9G/ax5FeJpxoVw4HAczTu8q+vnwmKnRYshFoihZaMgVJNQ0cH0G
	dh/eMV4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0kO1-0000000B8EY-0gI1;
	Mon, 22 Sep 2025 17:31:37 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0kNy-0000000B8DW-2AS5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 17:31:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sLjQgwHWhXkemODq5n8UFjgplIwlClZh6JcZx1SpyQ9IiL2LOB7nNzo4p+t2OB7mbz/J3jubiggblPhbCB6w/WUydJLIIk8MPyoyS3d6dCpnkQHsck4lCKou0uBapGtZXnXXayzIAEmJtsx9xPT0VTFiFvhGa+TSleYIsJTeoNnW+vgr4jJ+PuSaJC9HlyNeztNXEKgaZxw4nFa2FYcHFDhy6hfkzczHN1LeC2qarc2xyx2eqUz5Z0fZaAFkgM/wlxOldV1JvI2itDRmqRWwW6HXgr0NAbMMkbroPoRVB7AvWzNSPOU6gQZwWw1rlKUBJBO1UsOITDVggMJur53OzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q63S/pzCmgYAeiItkbGNfFpVxfO9EDvNlnRPsm8kCck=;
 b=wmiwGR647B0zcXnLKgeO6DF7fAbqKttl6sA0JD5Ic26SC7A7cgmKF222pVaSZb1SXx7YZ3O1VsCNtSqgJ1FwT1p9nZdApwHuWROxN8nOdYr/MOeFEQ3ntDT0tAn7le9TEygzcRwsm9QiErRziztx3bWOH1JW/2UDu/Y/ag1M68gXCNAhmZOQ0ELIdbd8Yv1RH7mR2zSoTZKFpa+WMfAnc8ymxkNLJweSKBDNd+ktnHG9AZkywO5+GNvNuklMYE+qttWicU3QKRavcva66jHaHCRNbP9KxSiU4D1Djlxwfm1lv6o0CGZrDtcsYW40IqUxDD2Mwm34gmUYEOLWOpzgOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q63S/pzCmgYAeiItkbGNfFpVxfO9EDvNlnRPsm8kCck=;
 b=PyOYK9sjepL1l6yphU0bsPvw1Wc8Em5o30TpBIhMl6gWjo19sNe1VHZwQ3dwV9d+O0bsHPE2Y2LGCo+OCSHdw53mySafiYTN3+oQPX+7OHB7ZrxVT6ak7Sl1vroTqCYpLWOha+TfEUDJ91KxO1ACRrXGnfnM6WpgTtMHLEcmr6E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from BN0PR01MB6862.prod.exchangelabs.com (2603:10b6:408:161::11) by
 SA3PR01MB7917.prod.exchangelabs.com (2603:10b6:806:314::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.20; Mon, 22 Sep 2025 17:31:28 +0000
Received: from BN0PR01MB6862.prod.exchangelabs.com
 ([fe80::8a1e:34a8:2ad9:7f83]) by BN0PR01MB6862.prod.exchangelabs.com
 ([fe80::8a1e:34a8:2ad9:7f83%2]) with mapi id 15.20.9137.015; Mon, 22 Sep 2025
 17:31:28 +0000
From: Carl Worth <carl@os.amperecomputing.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, James Clark
 <james.clark@linaro.org>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Jie Gan <jie.gan@oss.qualcomm.com>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 1/3] coresight: tmc: add the handle of the event to
 the path
In-Reply-To: <20250922-fix_helper_data-v1-1-905e8115a24e@oss.qualcomm.com>
References: <20250922-fix_helper_data-v1-0-905e8115a24e@oss.qualcomm.com>
 <20250922-fix_helper_data-v1-1-905e8115a24e@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 10:31:17 -0700
Message-ID: <874isuo0m2.fsf@rasp.cworth.amperemail.amperecomputing.com>
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0182.namprd04.prod.outlook.com
 (2603:10b6:303:86::7) To BN0PR01MB6862.prod.exchangelabs.com
 (2603:10b6:408:161::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR01MB6862:EE_|SA3PR01MB7917:EE_
X-MS-Office365-Filtering-Correlation-Id: 88ce0df3-5c01-4978-b71e-08ddf9fddcdc
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|1800799024|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BywBKag54E7GoVc1R3CuGl6+Y3RtrmFZGtz149scBrDwXqlbDg40uJOj+KuR?=
 =?us-ascii?Q?KacIYwGKAvYh8azUjC/T5ACHdruB8/7Yu/j4J/UTS2u9WmdqySpXKEHXuviF?=
 =?us-ascii?Q?hwdObOIrfNk2f6Z2yoa4U6SFYjihz+1rbdFCSGNJKVfCunHaplMkdjtGL+hG?=
 =?us-ascii?Q?QkAtmPuE7aS9vIWo/7G6dBtH7vssXVjM4Ljqkkj+pXZr4fqgxeRmLWj64PMW?=
 =?us-ascii?Q?SCROm0DHbuXM8n06HpO2Cdj6+5UrWW35/wnpxiyoSTeVutY0bM/NJxWMQF6Q?=
 =?us-ascii?Q?HwC/4syQPb2Cvlndl7myZmRyxSOCyGoVXyTHdqrA9d9OaPeKDtpE316tgy0f?=
 =?us-ascii?Q?3BlyAP57uUojdJ0YqIPB8+HbR4RYN3gct/WrMwUZJ+615ekVXbKmB2P4TEIs?=
 =?us-ascii?Q?yRgsFRrQFSvMg8Q2dT1MuLF8UnRrRDSryAPs5XuCrBsZKZmtOei9P31rfAII?=
 =?us-ascii?Q?pGlAnm+RTphuqm3JfMhy0CBs/VMIqb3w6Nb8brmHoWllGLZAAbpFNwNh9cBX?=
 =?us-ascii?Q?HowDBWyG5EFAKpVqACO4JPFvJeo8e90IUof3bNJEWjCESYNSpAQJxP9T/F4F?=
 =?us-ascii?Q?KT7A9bDo7nLDI5EgLB4FBw6UvoDAkVoXDoP9G15qlEsRhwVvCI1cpdaCbWWT?=
 =?us-ascii?Q?GWc/p3O3JinXTQtVzMFYyj7pdxFJQJRU2sTC12Fpml4cWA59HKK3vRzWBLvu?=
 =?us-ascii?Q?Dx4A2fec2YaoQc0APUUYfmv52E/AtMMLSc6OqiOqJMhmSZBegAfAo4IBmG1H?=
 =?us-ascii?Q?stFQHn2aU+8Uv4TmvTUgwgGM9+Hbll87ScDrb7jaDd0nfMUNOBgTYswxckNP?=
 =?us-ascii?Q?goVIZrkGuCJ7n0DdcapJf66IW3HAFDbZcxusmpikzKjYcxUzLTbOEt7V1o9r?=
 =?us-ascii?Q?sByzm7RNVhNItXxRSJGAvSYX3pwHpIRpWv4MXfnCmwGTa4GkhzS9FyTfhDzL?=
 =?us-ascii?Q?H3k0xZAffjz9Azf1XFKIXrW/C/SIWWiUWtI3Qlg3ZK29+1wnumQT+WiJF2kT?=
 =?us-ascii?Q?0GZzcpDoZtAXrU0UEnX8LlB4KUnGJ7FzI1kR6YZilGzdmJX0nxoMVodG5GX4?=
 =?us-ascii?Q?EdUWBbq3H8Vkb8fLZIM4yJlvByhufRD3JCnpdigAdVbkBcdn3VdMrlLTsQVW?=
 =?us-ascii?Q?x6qsM71T/mQN90KTB31YXqFa0eJYE1IxLDAUbiFHsaSDZ7OalXTMUgfMoljp?=
 =?us-ascii?Q?lDvEOTx5IzSDO5o02maj8ybjgnvM+TnqzxJeiFoAeYEXu3Fq8wbIrdcM8OJc?=
 =?us-ascii?Q?xotTKEdPTQ51yfAWIjIULZKa29DOZJVs92aD4WaiU3Cw94NlI3+Z3hlAHPPC?=
 =?us-ascii?Q?vj9AybWpozyWoIFflVsuT40vdGkg1HRowV1xb8jtjtZenu23HG968LZWArH3?=
 =?us-ascii?Q?FGpUEzUW3cMp9QfeMnfb/JIgTHAlejhsKlD411tSs9DXsjx1cQImwQI6QXOX?=
 =?us-ascii?Q?PQvxzg2oIT32Le/cq9u7kv4bkp0PfA2xBa3rVTlDadSm78cHYZxLdQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR01MB6862.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IzEhRClpFnkS8aEu21ZyVlYb5HQ+aw0+7vnqZwzJFatpw6DkEaqScuqpupsX?=
 =?us-ascii?Q?zs3tFTBXvVW03kI8SZxQuCInjatVKDlE72+Si+uSO/V03k3m7DVRSyCoyHyk?=
 =?us-ascii?Q?2j5zYYgB/HrXz26dujwNyGMeJwoxWG+fxL207lih6yPrlMEF8isKPLu2DT5u?=
 =?us-ascii?Q?sUR2qnor9c4pXhRIolgbKUBAFVcJ8X6r9VPm94Ig+oR/RygpN2dohmva367i?=
 =?us-ascii?Q?O3hX24MhxaRRiXn1NXjVZF/OdufGRlClOV4tNmUTksdNbWnBgXaFp0EjK1sb?=
 =?us-ascii?Q?wRX2fwhfNqN8q9yG5rHMF1lmVd2q6DBCfLmqhw+cKNjcjo9Tk6ntI/OKdOaS?=
 =?us-ascii?Q?GaYkO7M6kQIHKoy3lVVNEK6n7Qo7uUvy8f2Vfp/O0NPQpQLnSmFUTsvldpku?=
 =?us-ascii?Q?glIcXs198voW9YuV4S4oTAg0qmqMcwT3UadCY7cMFa5zt+TtY0pHNDU+z4jW?=
 =?us-ascii?Q?2yKUPNap78u97qMEJuyUE1WH+GrhMVZ2dZ7EaoG3NczQzGW9lKAh1LjVdUEH?=
 =?us-ascii?Q?sfas442+0Hk+dcUSmNuD17SDJaIARWklJcDXlbOIQatN8UJTegeOXwnPBogi?=
 =?us-ascii?Q?WYZyIZ6uiF9l51e/qyQ4Ie6pG1RJwFqiRxSxbDepDz3ccm6Una8CULTL3jMm?=
 =?us-ascii?Q?0Nm9dlklHu1wWd/diwMxwBsSJPZYIHhwWCn3xc/iPPpj6yE/LerUMeQvQ0Lb?=
 =?us-ascii?Q?q4Pz/Cw3yEccYlNjOAVfGpn7DmxnVqcB+XKe0vidBBEn62TrRSekWta44nUU?=
 =?us-ascii?Q?TPxw9TbAOu2zFaYZM5MdZO0Wpic/UXguBrpK7BFLN8LkyZHoAArlcTO6Pbsm?=
 =?us-ascii?Q?iDkdgYZbGM6GnDkwh3JMXIIADqJljd0pMtvTByaESBz1DAlyX82ng64fr6Nv?=
 =?us-ascii?Q?6uSHvYFY/wnkkMbFWYCjo6ROj8IkQXG0rJ8BbBg+T4PmGFyo9RRzjS43gunL?=
 =?us-ascii?Q?u4YvdxGPl3y2UBquAAzAxn56+Lk9o1Y7UI5ClosmrtLdC+EK7gdRz3WES1XA?=
 =?us-ascii?Q?sifbFus/w3mADERIkLOHDAHoeY3hns5453+xqcpv6/HnkBIPs9MQERkDu7Wx?=
 =?us-ascii?Q?+MOi5pj4Ht6VQhWJKZATkhd83D3SlRdnEj95D43kCbrQIjAEzh+gS5KuMrsu?=
 =?us-ascii?Q?7J5X/uisLbpiPfQLoZ7AL84BINdGHFWyBSb2B4JWaB7C+zf7GoNGXYuR3yzR?=
 =?us-ascii?Q?nfTTiKqah7vju/c1tLa0GePt21uRGaycMws2dQ3QIr0hQN0Q61Gtwi81hvc1?=
 =?us-ascii?Q?XPhvrK9bVj3DHtz9txHdaPLi9JjRruZJ7w6Ef1ZubcseA50IZSVxMOU8TJgJ?=
 =?us-ascii?Q?FjYQoQiLonI1BxFmr/8NW25XKu0g5QhiwxQOzRUZW0wxMVA16NkoUx5hm41V?=
 =?us-ascii?Q?v1gwu2qHVxJDWD2pd90+k562ZzpRh25G0E3qHGQ8hdIKqwMNRqSIBURz1BxF?=
 =?us-ascii?Q?/4/uvCYBO2SS3uMDELxt3F0q6rpQ87v4FqiRgwh+3R9b4DINpO0rWDobE96B?=
 =?us-ascii?Q?HJiiXFxnsozqOlj36uikrag99b6FITBBb0pUu6YHpXLgjFmnPUit4rD7JtJh?=
 =?us-ascii?Q?WS0C2cnBN5I0/XHoeK09QIgFIZ6miJzF4e6xBRyl8Siw2ydr+YIqSJLhVRJu?=
 =?us-ascii?Q?OPIpN+OllUEOafL61y0Nqzw=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88ce0df3-5c01-4978-b71e-08ddf9fddcdc
X-MS-Exchange-CrossTenant-AuthSource: BN0PR01MB6862.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 17:31:28.5634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F+jSv6F8akhLAIm2EdQHuW/TooBuSUWDbRtax4Kc0peIcgwGcdbxMrnZI80dHftkN40/4akZYmsPJ9jTmJjt3rStgLD/zAfBI93a05Sye/M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR01MB7917
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_103134_559103_E00B3BDF 
X-CRM114-Status: GOOD (  16.22  )
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

Jie Gan <jie.gan@oss.qualcomm.com> writes:
> From: Carl Worth <carl@os.amperecomputing.com>
>
> The handle is essential for retrieving the AUX_EVENT of each CPU and is
> required in perf mode. It has been added to the coresight_path so that
> dependent devices can access it from the path when needed.

I'd still like to have the original command I used to trigger the bug in
the commit message. I really like having reproduction steps captured in
commit messages when I look back at commits in the future. So, that was:

	 perf record -e cs_etm//k -C 0-9 dd if=/dev/zero of=/dev/null

>  /**
>   * struct coresight_path - data needed by enable/disable path
> - * @path_list:              path from source to sink.
> - * @trace_id:          trace_id of the whole path.
> + * @path_list:			path from source to sink.
> + * @trace_id:			trace_id of the whole path.
> + * struct perf_output_handle:	handle of the aux_event.
>   */

Fixing to "@handle" was mentioned in another comment already.

Something about the above still feels a little off to me. It feels like
we're throwing new data into a structure just because it happens to be
conveniently at hand for the code paths we're needing, and not because
it really _belongs_ there.

Or, maybe it's the right place for it, and the cause of my concern is
that "path" is an overly-narrow name in struct coresight_path?

But if a renaming of this structure would improve the code, I'd also be
fine with that happening in a subsequent commit, so I won't try to hold
up the current series based on that.

-Carl

