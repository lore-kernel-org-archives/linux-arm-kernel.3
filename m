Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A3C0C98313
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 18:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date
	:References:In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=003ercjFcaqJfW7SbFW3+5C48VHIW6FerHs6DcRYMmw=; b=UtpM+a2AdQ93XIimzp9sMiLHiC
	ic5HsHv0B9dsYyGUd07Tx+nnh8/fFOBa22beJ+ozpFb1HeaaJgfgP+mxInD+jc+g7GmprXDl6QsAP
	F84kNiM7HnBQWedR0wng3OQuDbQV3ppKrhGwEx3XoAcWqs23O4mjd8CcZ23dNRe/LLK0JLeRoIRGh
	iFshhByFS+svtJKj34Q9q1zl9ZMGnYY3aKU1WiOwK6al3mPfNEPVSsHa08S37s1qhzusaIzRstZ34
	OBgU0U2BHgGdsTfn5w0zJjs6jyx0IFoGr3tMPVKW6rFIaDptXJs4bBPZGbN2dE70zn8ngQJNEGTIt
	C/qFx7hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Rqh-00000009Dvw-3G4e;
	Wed, 23 Sep 2026 18:37:43 +0000
Received: from mail-westus2azon11012061.outbound.protection.outlook.com ([52.101.48.61] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9RqP-00000009Dly-2VNd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 18:37:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ozb6WPKUdWSA5a8vslO7VCWvHZbZwBBeDvIipr7mBY02hAWzyNow5S+Ng4l7M0KgiVXhZDB1tmaqjejm58svTSPuiVzLn+0caEMys0O+mIFLxjglOhRdGJmMSa3ikYu9xAVRUPutNGr2v6SOXKB6oHSdbxzNMrGLTFusP6tAG/GykAA0OtXU1pslNEf9UO0pHxyvoyRTRaxti5kdxiv1x/nlgbntokNrOmohvXb8SILvFshBSXBq5AzQT8UNPN/Eidni2C1/bxpJCTHUg1cY0UiZ5dsQ/0ImkFRt9ppu6pEEhRp+/m0K4b/sL9UCSzGX1ZrChR4FRlOM1bPQUEm2Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=003ercjFcaqJfW7SbFW3+5C48VHIW6FerHs6DcRYMmw=;
 b=Shdo2VQyfNlu+JJBbxugNcqMvTG9elXAe+wvxkoYorWvvlMPlwzYeCMqW2KHWNDm5RB7+LUfNNLEJr1EpETskjBqhT83ko70gypF8NqbLecpiBZlBa68zyG6pIoeu1w9HKxCzvjwayWD+xjNQkRwUUE05vu8bKHfU5pGP+sJhHRZ80xegeN252URgBKcH1eDSweZPOnTc4jLXqbyNo+LTmok7uRZmPGg/R67yYwRaP3nYpGECeKHEfTgqU73UCdaqhQdfxUXFfVdeqNWLGfp/pNL4L1y9zwgRw12PfYvGgsr3iuzZo0Vs0xt+dppGjttPuB5hqqb556cHwtn9PAyYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=003ercjFcaqJfW7SbFW3+5C48VHIW6FerHs6DcRYMmw=;
 b=paMPixW1EQCEM0APSd5K9ltLnVRPW/3EVeyHfkr+9uLT2Qi5rHZtfm8iU9KNn3yUtbkz5apZIq2KDvePa1bg9g3lH9YXXy1PYWXhL5zPQrVLfDH4ENoTTzzIu7nxgzzWlERGlaq+eXvOicjGb0kq0d3ZsPdvRMthXx8msFu3t5h2zzAQlkoMw+HH00vfg6JpxkwcWv4qLZ3ws8xabnHnNRSiCPwYkAihaRQH4LOA72mQZ6OeaIZL068Giu4pvqH3iH5nFocRc7EHy4ZuhOEhlIZuRgSVJKTqWWDVmYRRNDxE6kjOV4EH4Rn5kICsKbaUxNCYorwHVM2PLl3qs3AaHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LY0PR12MB325698.namprd12.prod.outlook.com
 (2603:10b6:408:3bb::14) by CH1PR12MB9646.namprd12.prod.outlook.com
 (2603:10b6:610:2af::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.17; Wed, 23 Sep
 2026 18:37:11 +0000
Received: from LY0PR12MB325698.namprd12.prod.outlook.com
 ([fe80::b65f:1548:5b35:e2b5]) by LY0PR12MB325698.namprd12.prod.outlook.com
 ([fe80::b65f:1548:5b35:e2b5%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 18:37:11 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v5 14/15] PCI/ATS: Export pci_enable_pri() and
 pci_reset_pri()
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, jgg@nvidia.com, 
 Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>, joro@8bytes.org, 
 bhelgaas@google.com, praan@google.com, kevin.tian@intel.com, 
 kees@kernel.org, smostafa@google.com, baolu.lu@linux.intel.com, 
 Jean-Philippe Brucker <jpb@kernel.org>, Eric Auger <eric.auger@redhat.com>, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
 skaestle@nvidia.com, mmarrid@nvidia.com, skolothumtho@nvidia.com, 
 bbiber@nvidia.com, harsha.v@oss.qualcomm.com
In-Reply-To: <0eea03fe5d763738aa348c96c9dd18612e8b788f.1789446520.git.nicolinc@nvidia.com>
References: <cover.1789446520.git.nicolinc@nvidia.com>
 <0eea03fe5d763738aa348c96c9dd18612e8b788f.1789446520.git.nicolinc@nvidia.com>
Date: Wed, 23 Sep 2026 15:37:05 -0300
Message-Id: <179018862556.3334538.6665676159150684502.b4-review@b4>
X-Mailer: b4 0.17-dev
X-ClientProxiedBy: MN2PR15CA0047.namprd15.prod.outlook.com
 (2603:10b6:208:237::16) To LY0PR12MB325698.namprd12.prod.outlook.com
 (2603:10b6:408:3bb::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LY0PR12MB325698:EE_|CH1PR12MB9646:EE_
X-MS-Office365-Filtering-Correlation-Id: fcaf002a-5b2e-424f-47eb-08df19a1ad27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|7416014|376014|10067099003|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 9skY0jlhfDhG1+mw9uXUkwmBVWMIG5DRepQxoCRSJi+JB1Zf20SNO/MdihHNJ2PQX5YVZu0xsWkGMKqGmYjVEheoLGDN8Vmb5h+AVn4mqz2vAvNyBVKyCs1Ovpun9SyQmEPl9AxY7PmnGLnsrrQVUkr/tCCHa8bs9W1dklvJhWwZwcXokME2i0TH0mctl5emKPXeozHYWWaK7CKfDU4dO1xoct2BjZD5fVjCaJGwKyiJg85XuwW4fyfWiWMGbLVQNIfQ1RFYfG+VlFBloPfOVEZMTJoeSbp2S2vNJVlsw+CrJkXkZIi/ZS5GBupj+VGvZ1dQ0B9YktfNr4quA+lshS01phVI5lrOHAnwLD1EsEqQCuh3njXdnzeicXROm8UFC8meIsrJsOiK+jvILjf2Mm9t/Tpnlsk5xmw4//gvCng0aXPNdw5LMV9xOQrXqGBgmwZEaEjBezBuy4K2jghEFEBiP3hPOvgJLWaTKtdFb/qXIYSVwMHyIgwvA0hqvOHo3eJvkju1VV45d4/8L5B5Qi0Kyv3+IhzvysAn632T+lzotAfgXt/Q8TJi4WHqXuZIYmFG7qPteOj5xjyJh1N75W5ewON/J+sEBRVch8EAwVmk2ACH1qrDkS5DgqsmJnZOq4ynAc+21RGri12pchBku3kG7zNJs4jJgpDsMrsRTTc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LY0PR12MB325698.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(7416014)(376014)(10067099003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmF3YWdiMkpyZlFJc3pWcGtuZ1gvSzl5OUJTSXZmaEFJdGh3Q0tXeVpxWkdU?=
 =?utf-8?B?MjdTMWQ0ejVOd1RUM3VjYS9RZWtDZDZ1QjMxb3kyRFk0TFArUE9ra1R6Qm5n?=
 =?utf-8?B?OXo3aXdDTGcvYUN5Vit1WnhhbDkvdVJmOWs1WitIaWZzRkJXeGpnVytJbEFo?=
 =?utf-8?B?WFBkRjVuSUJ1YS9lanFNdGQ4cmNkMml6TWNnVVhwaGZPUURocVpJUC8xRndt?=
 =?utf-8?B?YVRoTEJFTmo2UmZiempCT1lvVFlVbGE2OUxZTjhRTU5YU2hob0hIeDJ0T1lw?=
 =?utf-8?B?dmdqNURRaTlvRTJSV0ErTjlIV28vTVJQbFZ3ZU9SR2dPTXdxbFdUNmk5eUQ5?=
 =?utf-8?B?UjY4OHZXMlBRWFhMRW9xZ2hXSlE0NmZNMGxnMzNJaDR6NnloOXpoNG5wbDJx?=
 =?utf-8?B?ZjRqZGRJRTBKSyszU3Z5bFJ0S3Rub0FPMXJBcVBtd3JhYm5xMURtVzgrMGZW?=
 =?utf-8?B?bDdEcjBTNVE1bWhndnh5VDV4NlhuWUFkWi95cExhTmJjZlEycGl1dk05cU13?=
 =?utf-8?B?MUR0b0ZDc3k1d3dyZ3gyZFpTMFFxZXFYTFRROXg0ZVkzYXZ3QWc5WEdHRkpm?=
 =?utf-8?B?SVJ0ZjlYKzloa2lBaDZtWHNKZFkzbUg1b3N2NG9BS21pTEZUVVQrUjZGby9h?=
 =?utf-8?B?M1ZXMUVWRXJncy9QcFVGUFBsMmQ1aVQxcVFiSmhhTkxHamRkOWZmNlA3WXJI?=
 =?utf-8?B?MjJzTldvK0ZpWEtwN0x6cTRTa1RaVlM0UVdVcmNaSVJtcnl1SVpRSDQySVZv?=
 =?utf-8?B?RTVQQU1kV2RzUkdSbjBpZnByeVNaenhCVG52OFJPeUhZU1pJaHhHVFROdUJZ?=
 =?utf-8?B?VTRVU3NHS0hGaG05czM1bXhYcloyWlcyUnE5U1dwQm9NM0xnQkNFQ2tWeEJO?=
 =?utf-8?B?dkgvWElQcWJwbkl0M1hSbzhDZXdDa3JGb2kwcTNCT2xNNlNwM2ZudU5MdDRK?=
 =?utf-8?B?WUhDU3k3MzlRZFZjbjVOU3d5TnZQWU96SkRGcjdTZGdSOTVNQXpzdDBEWTJC?=
 =?utf-8?B?c2cwdklQeGZLZ3V6YUNxUXd0L2pNSVNDbHJJMWExVVByMmo5SnJJeW16VUVn?=
 =?utf-8?B?QmxpVzZ2L1hyUUhNL2tPVXI4SWllZkFWVnk2NXlRUEhnV00zMFBZTkk1STJN?=
 =?utf-8?B?OVNjc3NWUGg0MWtOcm5rRHRxT0RTbTEwdGRRV1k4YVRKY0hkR1E4NGVWN01q?=
 =?utf-8?B?cGhmSmlwdXNLNm1SZW14QU9MalM2emg1RmxPZlp2bE8zcGVaUW1qV09NMXFt?=
 =?utf-8?B?VXJCak9Bd1A1WGxaSFY2TnN1L2dnNlJweVBKdFZuOEs1RUlmQk81RXhUMHFn?=
 =?utf-8?B?alVxWm9BSElkdzBQZzhmVkNkUTl4M3dUbEZnZjFSeEswVzlEZjJJdE9wWGFT?=
 =?utf-8?B?dktTSDkxTGdLRXZPN2h1M0VtcjhMKzhYVm9Ua25jYjRtV1IvUFRHYkxYUEhj?=
 =?utf-8?B?a1k4c0JscWFLYStRMWJrMGJSNVBYMTIrbHY0TjVRUkhZcm1UaTlRQi8rbHdh?=
 =?utf-8?B?alR2QzdrUVJKQTQ3QzlvbWZQUEgxQUh3cmc3b2poQTAxRURUNmRZS2QvWWc3?=
 =?utf-8?B?bExNaW9XNkJKN0ZFV2psTFhVeHJTaktITnJPbSt5Rlg4cFltMGhZZjhGODlj?=
 =?utf-8?B?aDJvNnorUThScDE4REI5ZHFkOFBoUHhWVTR4aHJWNlJ6V2I3N1FPMXNzVXNP?=
 =?utf-8?B?QkVFNytVWU55cUkzalE3UVhyRjIxRDd1SHNja3BYVmRId3RhTmxGdnNiT0h6?=
 =?utf-8?B?SjVXSUVZcWxjSG1HS0RTNlhqWGhJYmlOdGoxU3pUUEdYQ3RVSGlpc0VWcTlL?=
 =?utf-8?B?VVA4ZUFoZDNwQVorZ2ZjcTUrMmMxUE0yZHRpUFNpbFdxN2pxbTZ6NTYxZ0Nl?=
 =?utf-8?B?SEp2bVJhTVloVUVZcjNqK3J6bWx6bXdua20xa203a0hSQTZpQ2draXlPVmpv?=
 =?utf-8?B?Z2cyNzRIRythOUhpYzk2UzB6cmd4MnFMMUd5d3diZ2VacENpV1F6M05JVjJk?=
 =?utf-8?B?NFpsWk8zdm9OK3VwdzRHOEY3RUJUbGZZMXlQZzNacWxzOWcyRXNyYU5VNSth?=
 =?utf-8?B?bXhGRUJoSXhjRzNGTEhURGdpWTkzVFJab1JyR0E2aWZBV1J0U2RacStjOVhr?=
 =?utf-8?B?b0xxU1I2VjU1dEo2aXdwNjhBN2hDRm1vN3U4Q1VyckJFK3NtMEJpdEpYbFlX?=
 =?utf-8?B?bjBtQ1ErTjBJZmJHV3o4VlZQV3NmVFM2QllIdHEyaWhmTFBNMjFwNnZFMldJ?=
 =?utf-8?B?OHRqaWhSOW9PZnpzVGViVDE3bHpkUllqbngyUWEvUlplaDNZTHllcHZHV0dD?=
 =?utf-8?Q?x4/OwBjggv9dAuoO6Y?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcaf002a-5b2e-424f-47eb-08df19a1ad27
X-MS-Exchange-CrossTenant-AuthSource: LY0PR12MB325698.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 18:37:09.5900
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JH50xLETXyq5lBHigIABVj8Y2eeZlEfUemYYKFe8Q2k5hduAZVNBan9F2eJn1UbI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9646
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_113725_809642_E15C753F 
X-CRM114-Status: UNSURE (   5.88  )
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

On Tue, 15 Sep 2026 09:38:26 -0700, Nicolin Chen <nicolinc@nvidia.com> wrote:
> Export pci_enable_pri() and pci_reset_pri() so the SMMUv3 driver, which is
> tristate, can use them from its probe path when built as a module.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

-- 
Jason

