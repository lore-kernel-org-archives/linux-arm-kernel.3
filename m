Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CDCDC61DCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 14:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date
	:References:In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OLbJdizQhp4iUjNRAWghT7Eq2vKC3RdUzFllwuApsYQ=; b=wE/shb8hvuhe6vtfcu5Lr2OpSh
	u7vSeIanA8W/ZF2uUYOeedJ7XoSYuAc9SdxA0/OWR/NicA8q4ZU2uTWx6HFPOIDDz7+ltLHRz4nE7
	v1Esc8rfsuoyvy5s5FHkQFuDEn2EbEyFOpJesKk4Edvt2x8LWbc26LYrPy6zmigIIJ4P1zvOVjilF
	pvay/gAoZq1lnwHCXz9eYjjgUO4jW3wUX+ue4kOgFn2gwDkSFmoxLeNEQ3zFlGH7NGkmrn19aK0gp
	eIZ6DsDjnOhi302jfWSSVmVzGoIQYWuZVgVzLc1QS3mYaAH6PP03Li62S7pzahvcESutuQaNKnfhv
	QXf4I4PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzxYV-00000005yyD-3NOJ;
	Fri, 28 Aug 2026 14:27:43 +0000
Received: from mail-westcentralusazon11013017.outbound.protection.outlook.com ([40.93.201.17] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzxYQ-00000005yug-1C8Q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 14:27:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vA9iiSWQfGtPkN+sH2Zwx6ZK6/ESFYc3LmWbLmubsZDrhrQJ/964Rf4TQlopkti13Pb+ZvDaX7Pq3qgCR4AgZK6ZxicCJ+6lGlTr55HnN+ZqGL1tzuSrjO6wUebwWSjRQbNsy/JW5Uc13+CFhyag/xBBb7HeOrMjZzAJ4x25U3YFZAITYXRahFf+1dQeAbfmkBg5utNUNYUVE8gojekhnMLk20/2LGeU8cYz0zfImWG7Pr6Kvqqtml6isA+zqurqjhb8vyBV04OIUG8y20QMVIIN1sUYDSqNKiyF4KNvdazc93lNzJ3dophUQwMrJlM4FuqZBg7K4ZzwsBuzX8eBng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OLbJdizQhp4iUjNRAWghT7Eq2vKC3RdUzFllwuApsYQ=;
 b=yzxr0SujqdNvS9+lG2BB4vs3MSDztW+DJtvU0XS9nQDb4mvOBim3zRqHgTufBwEBw55LrFj/9clJ1ZJtVj8wCmIetVtMD5bS7mt1wh+eSAoX2X7kKhoE/YB9jsVhriOb7u8nCu4Ee72DXJZwOsHuT/eNYHr3UW3nFN2yvYgCBLW8cMaI9uqJ5s4N8aVyh60Opilxc5cpd3WIOREqNDPWCTAXfgouIPDrGgBgcGnsm+9yoVkI+0FK8mhM2LvHO7sAq+AtxPh387+Ryz5SNgJnZAQyuBKixVWjG1Ata1kWcozSDelukjmp/kwq9NMNEhO3y694QTJm8KtlvrGnscQk6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OLbJdizQhp4iUjNRAWghT7Eq2vKC3RdUzFllwuApsYQ=;
 b=Td2WhhiD/0cAZqbq/a4knAIepNIuBg8lLaj914CCQb2NT5uXUmiJ2VZ6+Xwniv6zeOJ3HjPkmWVYR30cgkO6piitvrBHc09FAcTRUosvIHOzCZzEFRap0+r1Ir8MhXu2VcRBCgK6aQHjN8qoqvZ9RF3Y5Qn3nt7mEB6uBL3MfLBLLIYsOvorjdf9Hs57N3QoL4z8g106xPjMWbaXc7wm8ln+kqIdRZmUu2g0hb8P0PAtCeYwNQ+TZ13HVvtpV5baDODiC1ZpkAczlDscLi5d8rRMzFcSSiiUeK1LvAonl0DvRZz9Qk2j4HC+cldZZuEq0zNDceeWkKPZ9rusIzmY5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by BY5PR12MB4275.namprd12.prod.outlook.com (2603:10b6:a03:20a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Fri, 28 Aug
 2026 14:27:29 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 14:27:29 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 2/7] iommu/arm-smmu-v3: Prevent rbtree corruption from
 duplicate streams
From: Jason Gunthorpe <jgg@nvidia.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, will@kernel.org, robin.murphy@arm.com, 
 joro@8bytes.org, jgg@ziepe.ca, nicolinc@nvidia.com, praan@google.com
In-Reply-To: <20260828125409.1921538-3-smostafa@google.com>
References: <20260828125409.1921538-1-smostafa@google.com>
 <20260828125409.1921538-3-smostafa@google.com>
Date: Fri, 28 Aug 2026 11:27:22 -0300
Message-Id: <178792724269.3808739.865362709046819180.b4-review@b4>
X-Mailer: b4 0.17-dev
X-ClientProxiedBy: BN9PR03CA0285.namprd03.prod.outlook.com
 (2603:10b6:408:f5::20) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|BY5PR12MB4275:EE_
X-MS-Office365-Filtering-Correlation-Id: ba89cbe3-2d4f-4753-b366-08df05107be9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|10067099003|11063799006|56012099006|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info: 6N2rXlDtgul3w5eJk3G4DpOONQOa9aXlCAo08wpDbOM+3LxJlxDVijka1YXCk6ct2o+Kj5e+MPIoQdC+2CFQmebGph/rtgE8RgUzSdzrGfxfkTwKIdR946UTQ94RscTfcwz9xz3YnVVOWJ9bvKB1LdngVFZHQXGIIrjdDzVX4F9Hyni49R9Gwzr+fQIw+Kg4aEBDidkMpOClPdGIMiAyt9ANW+9VPYlOXS2MXcjWwL3aNiYOZejm7EGb4JaY7mvTMrX+3ApzfbXnSCP/KJpyavOJGaCypdhAjMj5eZ+RozMuMEcQXv9lCRvsTbXmN7NSHatfnj72G+pqdyrw/E9EWJaxqNh7ndFNOTWNIeZEeyIYpjjW1rGf7e0KGe+1qXZvp1Sq0293giZPYSGpKuBI+rFNl37jS0s7AV8wX1557oMGZM4o65xTpGWk2YkZV+q5Q5qaj1zG0MpTJnlgSxL53PLLRpaDFPnnr7+4jkOBUJSV3WuBMfjMaqiD0Jo6d+2tLZOXcCPrjLO9MewsnjP/Y78kLql3yTCmCkvOvST4k+2WRk9VqhF2/HS7Ve8WmhReV1IFPJ4G7/wGbDObzRLr2FAzrExgZu7XxkxJcXJs5WT9WWyuPAAWEn/F6e6NmDcUy8I1uDn9fqqBOKBJMeCjjBijadZT1BuT2F/2F7Q4O08=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnJXMlI0UnVQTUpUQm9Ub0dUOHRwd01yUlZKTnFNZklaUlN6Z2pjRFMvUm9E?=
 =?utf-8?B?Sk9nc29UVDg3Zlp3SzFIRzIyTUpWSmtOKzk4c1JieGZ6RUxGdWEzd0lLMzNJ?=
 =?utf-8?B?ejlmM1pPUXFlT3FQYVVEakF2TmpONStRRCttbDVHSlYzSWFBbXpHeThGcE1q?=
 =?utf-8?B?SGhXQVJFZTVDSGF1MWpKTzhNZHFRL2tpT2R4VDl3Y0ljU2c2RTRNMDhVdldO?=
 =?utf-8?B?YkxoM0YraFVxeU1qRU4rZG01enZ6OVVEYmsrNm1LRzk2Y3M5VmFKWU54RVV1?=
 =?utf-8?B?cHUwdkhhWHhpelNzZE5MdzdqbjlxckxmcURiVncwWmtHUktDRTJ1bWJBTG8r?=
 =?utf-8?B?ZHVrWGlFc1J1bDNaVzlMSE50NkNHcjJKemJ2Ty9JemprTGtFaEhxa0JaRzA2?=
 =?utf-8?B?cCtDZGdReTJJenNUMXI5OGZUTDF1Yk5Bb2tteHEydDNsVm9nNUkxK3N1SmdR?=
 =?utf-8?B?eXE4N0piMjlGakY5aC9WZXRxVW5GblFXdE9tc2tJOHRQQng1MnVOT2lsNmZt?=
 =?utf-8?B?bmEzU0libEIyRkxnWjBTQnpDMXBvbnZxMFBuUHhUckpzRHVmQ3NkUVFTaUZh?=
 =?utf-8?B?aTNNTDlvd09lMzEyZ240UFdkbHpXNWlVSEwwVENEU3VpSHFvTHBJZWRYSHZ2?=
 =?utf-8?B?OVlIay9hbGxPeXk1N0N0SS81eEZ6VG5aZWp2Wks2eGVHK0RxMHBKSXU3bWlV?=
 =?utf-8?B?bGVzK2EyeVY3ajZLTVhUUWVic0Q0Ukc2WFAzb25lYU94bEIxRi90VUE3TUZw?=
 =?utf-8?B?Z3hlUExpNTd3VHpXN2hvZDFvV201Y2RJdjUzL2oraldFYUR0ZjZzajZxbWla?=
 =?utf-8?B?aG03NGxuWDY2QXVkbENmdmpSaHZnZE9Ob1BrYWpqQkJaVGhVNVRXV2ZaVnZ2?=
 =?utf-8?B?OU42MTN4akhHdk5rTy9uL1dyNXF0S1RHWmN4c0d4V0NQWlhwRnF0cENBVC9Z?=
 =?utf-8?B?RGZ5VjVBZjBsMDlvL2FXcExHVTJYUHMxQ2JSQUFXTUtXNTN2YXR2S3FndGdx?=
 =?utf-8?B?c3hBdW1ubHp5aWszUlhnTWxiR0tubms5ZDJvOWxGb200NXFBRVlCZG5uazlh?=
 =?utf-8?B?dXFWazIxb3hEWGlpVVE5M1d3Y3d2MmtPV2QyV0tISDA4RGlwVGVFOW43ZStE?=
 =?utf-8?B?QVpacFpGbm1sdjhZWjBzQzgrcDkyTThneUhYdVE0UndRMThUc3AwczZqZUJt?=
 =?utf-8?B?WFlmOGI0OGtpTmdTUzQ0UHZmNkJHakZ4akZaeVZrZ3poNHVvYTcyYjlNbGRj?=
 =?utf-8?B?S1puR2hYMDZBT2wxbUpiYkY1U0kxRHAydEE5ZTN0MmVYU3drZFQrV3ZTZmMr?=
 =?utf-8?B?YTBwY2ZYb1hKVVRzc0ozMjVHQS9ldlVDQnZJWWsvTUFpNDlwNDFnYnJkVnBh?=
 =?utf-8?B?cTZ1R0c2RCtYMjA5TGpWeDl3ZXFFc2loTGNuNTRyelpiazhvSHM0NEZMMy9J?=
 =?utf-8?B?VkRrR3hJNDBtU3V2S0JRRUJ4RlNoZkR1V1NZTmw4d1llV2VUVERGVzVpQXhN?=
 =?utf-8?B?RTcrWXBFQ0xNUFNadjFlSGdaZ1VXMnJFcXMwbWdrM3g4VmZkU2cwdDh6S0xW?=
 =?utf-8?B?NzFxUnQxSXJsREl3dzh3WTAwSXBJdGRnZkJESW1XR0RWSUFSNUNmMUdWN3Jt?=
 =?utf-8?B?RGN4TE5PdnNQQldEY2gxU0lOTDVOMUJ6YUJhRGpXbnFLOUZOcmEwNy9XU21l?=
 =?utf-8?B?NzF6ajVoRFloSGpwWVBKZ3R3eXgrVGttL0RzNTFzT0czT2xrc3lacjZFOTFC?=
 =?utf-8?B?ekt1eFBUMWdQbGtVbnhFREcxNTZhc0xVWkFreEJNS2FsMVFiNVZkelJKYWw5?=
 =?utf-8?B?Zi81ZmxXcUZBTHpYcTFsMGQ4YjJQRWd2aUlhdXdpTjIwTE85VjBHczJoTzlT?=
 =?utf-8?B?bG1IWFFHUUJ6Z3ZwWVNpMHVtQm5ydGtFQmFzUUxoaWdXS0Y1a09IZGdmZE5C?=
 =?utf-8?B?U1hPMzdXTFVPT3RBQ0lseVhVUG5Vc0dLd0MxQjhWMGxkTnpqQjlaM1lvMEQ0?=
 =?utf-8?B?T1VDVUhKWVl3MUVLY3JyMmNKeFBheDhKK0dRTHRMZXJWeXRFUDdKd0VvWWtM?=
 =?utf-8?B?RnpkS01BWW1jY2EwbjhwOGdhcE1SSDBOZnFwUXlTT1kzbXRLUkYya0NMVURK?=
 =?utf-8?B?ZHFhN1ZaRHRGVTNDcW0xa29FNVN2UGlOTmJ3RU56blErMFMwZmgyRDZlWkpZ?=
 =?utf-8?B?elI2clVISFc1TDhqYnlxRmJrQmdIQzdESUtwdjRKcHJMZSs2WkN2aE9lZlZI?=
 =?utf-8?B?NThCWkVTVEhnWmduWHVvVG9wTnNtb0lrZExSRUI1cXRSM2pPTXp0azdhTjg0?=
 =?utf-8?Q?eSXFIdp05mfiGhgAwZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba89cbe3-2d4f-4753-b366-08df05107be9
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 14:27:26.8909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mop3ppaV4hIWgIrJXv4kOfCGy0C96QLHLsYhSYj2Yihgs85Vr8FBoktQEWqz84W5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4275
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_072738_328184_158C164B 
X-CRM114-Status: UNSURE (   6.02  )
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

On Fri, 28 Aug 2026 12:53:37 +0000, Mostafa Saleh <smostafa@google.com> wrote:
> In handling PCI devices with duplicate IDs, arm_smmu_insert_master()
> will continue the loop skipping the duplicate sids insertion in the
> rbtree.
> However, in the error path of arm_smmu_insert_master() and in
> arm_smmu_remove_master(), the code loops over all fwspec->num_ids and
> calls rb_erase() unconditionally.
> 
> [...]

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

-- 
Jason

