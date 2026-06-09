Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99E6ECD8CAE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 05:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3L6bIa8l1lYUanMnCbgKM9ANdQvKG2IfVZom0O9BYJc=; b=Pdqb37VKhOfaAjRcrk9Z/ZOK2T
	AYCS0P7CG+f1G7+1+uMrxSGkCYpeN+/EdkcoEXMnHFHatIMrm9lx05odju3JuRKJ9UqaFUu7bBAP7
	ZOx/DejzmrG8VfUCiRBh9a6I8BtnHzmUg25hZQ5n429trs26h/oVaODnYKg5ENM1PEBRFXChiCT+Z
	aZmMUwGt2Pjh/HgYdocTwEAIquTwLnpjG4sifaSGUh8OtaSszndLcJsW1RPzCoodmGSq/yCQJwjNH
	6zuCfNsTBc/YKhf7QOdmRZPUu9ObcZsM9lZ9BzTtTBAobQcxuISubstolahCV/MfDCIDH4KzBTE4I
	2mDwFiKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWom0-00000004k4z-18tc;
	Tue, 09 Jun 2026 05:13:12 +0000
Received: from mail-southcentralusazon11013052.outbound.protection.outlook.com ([40.93.196.52] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWolw-00000004k4T-1G9J
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 05:13:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qn2qeK1h/8C6QfzOylJSTihTy2n4p/LWAUOeJoEEoI0ON0iHDkeDqPPDSSR4TGj0e6hXLtENnlnMwShjuEyYQbBd3ns4ZEoi+2rfZn7zYbj8nwMP3wWBOFdhA6yGHaammNXo17r2gASSDALzZWGNVkSMv6biD+W2XI0ay+ku9W5lM0x+RA5rKYBc7mLNUXzZ77qScGDvbFiv+tN02oYPfF4rVKswK1vf0K4Z0S5UBJ8n17NYj94698mkdB2AsUXCHgoq5DJMWfQQQaSANQfKWN3zDEnj72uY8/76H9lePETMjcpl5IhTlKj6+NXCHiBz8wkkOo6njxt9UaeCNQCRvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3L6bIa8l1lYUanMnCbgKM9ANdQvKG2IfVZom0O9BYJc=;
 b=gfJX5CcvOC8io7YRbO406jV/0gFGx/ppIvReGB2IKyWplhQ7gvLTA/y0gcIhzoUGJhT//KuRvz2U+S3tUqsh/0hZpPhZgrguAsIdwEhPNAd2k0T2WHMsi6nkv80v2uJLt0gNvrSETe4hR0io+B9bx7eJ1oH/PBU0R08yZ94yIorMqovD0DTa79KSVsxzB87OEbNgcTuNxXvRYz8vhmba5nzhPd4IWAv7J04X4iEI4g80QHMtk1osBXjhXUQnaAt6kR+MAT9jkznUHWtx2e1MOuZr6w89DfGmrAaE6/6cGQwLqUCAk6Rdp3rotcTOv73IKLK2yEwAnRpsD677T6q2ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3L6bIa8l1lYUanMnCbgKM9ANdQvKG2IfVZom0O9BYJc=;
 b=R1sEDDhTW9Eh6YDYdU2Q8ZdpRSQw4C3cPTwg/RupIwfhCOgBlcom2VycBjEP9f4SqYO2TEnYoi9oU2mdxp5pJc2YChCcif1tjvCK3qepEz3z7okXyKI5qGCHY3N1g7hEURge2HIpoAPQ+vT6uHrYqwDkJwMmkFBL/LAhSgR08pQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by SJ0PR12MB6807.namprd12.prod.outlook.com (2603:10b6:a03:479::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Tue, 9 Jun 2026
 05:12:57 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%5]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 05:12:57 +0000
Message-ID: <443b6385-b4c0-4811-b62a-b68998cc6ee2@amd.com>
Date: Tue, 9 Jun 2026 10:42:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] i2c: cadence: Add shutdown handler
To: Ajay Neeli <ajay.neeli@amd.com>, git@amd.com, andi.shyti@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: michal.simek@amd.com, srinivas.goud@amd.com, radhey.shyam.pandey@amd.com
References: <20260430053050.3590173-1-ajay.neeli@amd.com>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <20260430053050.3590173-1-ajay.neeli@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0188.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::11) To CY1PR12MB9697.namprd12.prod.outlook.com
 (2603:10b6:930:107::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR12MB9697:EE_|SJ0PR12MB6807:EE_
X-MS-Office365-Filtering-Correlation-Id: 834ed227-ca17-4027-34bb-08dec5e5c4af
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: gatjEultK1cS2YGKbQcEh3JOsra90Uv751xFCcT3g0avPMagJjt5m3/L33CA3ythpD/SxaqbDf7Vas1ipDa/0WsnjrguLnTFakyvcoDd4Ajv9ls7EVRKaibbWdDfhCzHxGbNOUD5jYLCkErAbV1OPP7BcgIXepP7y0d1dAGzHUvOqk4GexS0fGqbD/AHBn0PNra0ogDSqllTC4t0S8i7j+bgq+szfOEk0+lPZ5EseOn3Gqrsr8lLjj0NODO5Vo6/m3ltAa4gekuOV6AQYtUEnDevYsrqHiqKCg50P+uW3MWDh+suzlAH4e0+pdNvPF3g2XPdCzSfKUVv/8UcfGuApo11kk2Mm6BPggkvA58sfEbPlInziWZi9pF9kzBWBQh9hHHC82vtLGaGEJ8bXUF+4WyGsC9NeV+9oXoke5QUIGVpK/73Zuw9yqMrhfgNYtNKijAIeU9kl8YGsXLHAtJxNhgE5Yn5F4IID4rz7QcsV22KMUjQf31Hb6AisfNH6yA28vRQCDXnQKvYDwJz1oOLfH5R8Zy8h8njU4MiuD86dJIAbxe1f96P1yHYEhebyEpjTzWmTHRXwytR0nQ939MtUHhYhYnq4OZAR/mLOy5lkHcuKmuIIR080rcb3GhGe6u6Wed7X7PHCDW/xDckH5sxFkUhTI3EFJjCBZM8FozrnIlJBNKRIMmOKTTAVtpD7TO1
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmNmT2dnTU9ydjJtdWZpTGxEVXViZ2owbGlzQVd0WFhqRmF3TXlLTVJWUWox?=
 =?utf-8?B?NDFqb0doSmdnRExMUXptWEU5VmZ6UHpEemgyeDdiN0Rad090V3c1QXpmbkhp?=
 =?utf-8?B?MDd2OVB6eEtEQUN2VXpiM0p3OUgvWUZVS2VmTDZ4alRJWEQ2ZmwySGNhcFRH?=
 =?utf-8?B?V1BVT1lsT2VqUGhjSCsvQ3JYR1QzblJMZ2dLN3BxamlhZ2FpaDB5dm82OGQy?=
 =?utf-8?B?cUQ0UzNyWmpZMlVvM1dSTXprMGkwOXRadjhZcWhxeXdoN25uMDAwS3B4c3Zl?=
 =?utf-8?B?Q0xtSzRacTNnckJBMFl5bjNVV3k3RU5FV0hzb29EdUtkb3RmWU9WQmRqRG1y?=
 =?utf-8?B?MnpMMHJPNEhkRzRCWDVvSHZwZy9pc0E2SXo4am5jcjBYakRhbDhVOGxpMHc4?=
 =?utf-8?B?VTRqdEt1VUhoaU9NN3NYUnJoczcxSHRtWk9hWHpWdFBQaUo5SmFXdXJXbTFR?=
 =?utf-8?B?NnRlem4ySUVFN25LczZJOW1tNnlRakMvQURvZGREbzhLN1BUbk9MK0txdG5S?=
 =?utf-8?B?cTkrbWdqcXh2UkF6SGdNTk9CQWl0eDdPYU8rcEJ6SVNWNjJ3NE9kSi95MDV0?=
 =?utf-8?B?UmFwa1I2aFlVUlpHY0g4S09FTllLdUJVMmtVMFZrTmplTml5QldVVFJjb2c5?=
 =?utf-8?B?alpMWUZTTjRWbzRwQlFJTmFuZFM1RmZKRXRkOWx2ZFFGZG1lWFBKdDJkREQ3?=
 =?utf-8?B?cHdYYk42NkhrMy9qTUU0TVVjU0pQS3VyRGh5OG9yRWZMODF4TUVFRHNLaVNu?=
 =?utf-8?B?RVJYQnh2MWtvcFVvVGtacTRhZkZiZWdodU84U3ByTzI0NFJmbDRVSWVXK3Rj?=
 =?utf-8?B?N0VvcXpZZUNNN1h5bStEa05oa052ZDFxdG9mYnhTL0QyN2VRdFRjaGhWWE9q?=
 =?utf-8?B?TTFQb1JPQzh4dG1SVmlvSkNVZTBQZ2hDYk1iOXpyakMySWZCdDZTYTJ4QTZm?=
 =?utf-8?B?Qzg3cmJGbEdlTGpSNHpabE5UQzRVeGdKOW4reklUTUZ0VCtLVmJTTk5sMlFD?=
 =?utf-8?B?NGIvVzc4M3NERXpVczFxeWRXNFd2SmhYR2xSSk1RbDdCMzArNTVDbTFiOXQ4?=
 =?utf-8?B?ZnpxcUx4dlRONGhwRmpXSjl6QlNBTnoyS0txMDh2Uzh5QzdzWnFmUGJzcHU2?=
 =?utf-8?B?bHF0OG9pc1BmNlFhWm94T3RsREQxTmc4OVNUNE5yTjBEVXFHMmt5MDRtU3FW?=
 =?utf-8?B?SUgyTmNBZ05RS2FvTWtMcHhOblRWZ0JiR0phVFhTYlA2QXBjVUF5Qzd2bHYr?=
 =?utf-8?B?Z1cxc1hMeWhpM1lnYnpwV3U5b0R3cHQ5eDBrWEdnK3VMODZaTnJmem9qWVk1?=
 =?utf-8?B?enM4NkUyRCtHWlA4dXdIYzc2Ym5zbTZGRlJoNEUwZkhhRnhubVpCQVZ2YUdl?=
 =?utf-8?B?UDhCcXAzeUhFZFpVc2tWYkN6SzFFQUJqdm0yWkU3L3RRenZBTFJrb1pEQ1o4?=
 =?utf-8?B?NHZoZThLZlJ1OW1OaUtwUnptcGk5cTNwR1BXS0V3enRyaFQ0MlFPRUFCYW5Y?=
 =?utf-8?B?azVnRTVYYXI1OHptSFVkMG1jWkp3NG9LdHJ2dTFwSC9Bdi9BWWlHWmYyOUdZ?=
 =?utf-8?B?d2VtZng5K25rc1hzT01kalduaFZmY2JZSzhDVG5LcFFxYnppZXVGUnErQ3BC?=
 =?utf-8?B?S3FNWHZ6QVM5cDdhbDVGR0hpeFZpQnRiVjhncHlrQjQ3T056a1BPYUplSUkw?=
 =?utf-8?B?dW9IMiszazJmb0I3bXI5ZmxkQkxqSmZSWmZUNHNRNXpDcWNCSzd2REQybUVp?=
 =?utf-8?B?VTByYzZBK2U1SkdlZmRmUHBzNUtjUHIyaUpjb29iTE4zZjVidWJMcXVGTUVh?=
 =?utf-8?B?Ni81UUZsU1diMG9sWlhZMUliZ2prODhBMWhhYXQ5dXQrWnVFQjhId2gzQi9N?=
 =?utf-8?B?ZmQ5UWRpakhzWmVtaGJrOFgyZTJkbHpTekdtTUtlTFlhTzA2cEZaOVl2bVJQ?=
 =?utf-8?B?UzNQSjlmbWhDZlhOZTJNVWw1dFplS05kbFlQNUxEb1JTYUI0VEVmRDdnNE1y?=
 =?utf-8?B?VmlxcndIejYzd1YzVmNBUE1nOVlNN1NUK2tDcDh3WkphRkt1Wm9Db3pKdVZj?=
 =?utf-8?B?UlVWL2pPckJtQnc2R1lqK2g2bE1kT3BzV1NHV010aUg2M0RMdkNNWEh3YjMr?=
 =?utf-8?B?R0JicGlhWS95SG5qSXplUUJ5cmlZb05Ib3JOQ3dPVG9TOXRVenlWV3REaHAv?=
 =?utf-8?B?eGlITVBGYXc2N3R4bThXcnlqYnBPeVNrRUlLa09xOHh1WFBYOTJlblB1MERt?=
 =?utf-8?B?S0JiVUlKOGN3Z3pTU3ArZCtxQTlvMVhQMlA5bWVQQ2VXbWZoSHp1TzB0bUtX?=
 =?utf-8?Q?GKdrsJj7mW7vQTJ5ac?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 834ed227-ca17-4027-34bb-08dec5e5c4af
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 05:12:57.4475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MBKEYbe/zMJB1dXu8wijAvKTHI/he7bvpv/7FA5vulgF9EgE5mhPkIbMdcAHtjuf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6807
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_221308_498239_30BE4604 
X-CRM114-Status: GOOD (  23.30  )
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

> During system reboot or kexec, in-flight I2C transfers can cause
> spurious interrupts or leave the bus in an undefined state. Add a
> shutdown handler that marks the adapter suspended and resets the
> controller, ensuring a clean handoff.
> 
> Signed-off-by: Ajay Neeli <ajay.neeli@amd.com>

Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Thanks!

> ---
> Link: https://lore.kernel.org/linux-i2c/20250730122907.18909-1-ajay.neeli@amd.com/
> 
> Changes v3->v4:
> - Replaced disable_irq() with cdns_i2c_master_reset() to avoid
>    potential deadlocks during shutdown
> - Added pm_runtime_status_suspended() check to skip register access
>    when clocks are disabled
> 
> Changes v2->v3:
> Corrected a typo that caused a build error in v2
> 
> Changes in v1->v2:
> Disable interrupts
> ---
>   drivers/i2c/busses/i2c-cadence.c | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
> index 0fb728ade92e..da8770182a18 100644
> --- a/drivers/i2c/busses/i2c-cadence.c
> +++ b/drivers/i2c/busses/i2c-cadence.c
> @@ -1635,6 +1635,25 @@ static void cdns_i2c_remove(struct platform_device *pdev)
>   	reset_control_assert(id->reset);
>   }
>   
> +/**
> + * cdns_i2c_shutdown - Prepare I2C controller for system shutdown
> + * @pdev:	Handle to the platform device structure
> + *
> + * Mark the adapter as suspended and reset the controller to ensure a clean
> + * handoff during system reboot or kexec.
> + */
> +static void cdns_i2c_shutdown(struct platform_device *pdev)
> +{
> +	struct cdns_i2c *id = platform_get_drvdata(pdev);
> +
> +	/* Mark the adapter as suspended to prevent further I2C transfers */
> +	i2c_mark_adapter_suspended(&id->adap);
> +
> +	/* Reset the controller state if active - clocks are disabled when suspended */
> +	if (!pm_runtime_status_suspended(&pdev->dev))
> +		cdns_i2c_master_reset(&id->adap);
> +}
> +
>   static struct platform_driver cdns_i2c_drv = {
>   	.driver = {
>   		.name  = DRIVER_NAME,
> @@ -1643,6 +1662,7 @@ static struct platform_driver cdns_i2c_drv = {
>   	},
>   	.probe  = cdns_i2c_probe,
>   	.remove = cdns_i2c_remove,
> +	.shutdown = cdns_i2c_shutdown,
>   };
>   
>   module_platform_driver(cdns_i2c_drv);


