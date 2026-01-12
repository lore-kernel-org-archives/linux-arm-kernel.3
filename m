Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB6E6D25030
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 06:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rv2KDkibwGJzaVRSaPxItP+RjPLwxfJXFZMkcf0A8yA=; b=IjoM86yyNy7GOmygWXIK3NhAih
	DCajSTr1xBRZ0Jt5G7uUeL7v40DXIUlFaZ3YuDlNMGAOfC7njXlo9pNq6MZV0JJ5jBD9n1rcvUi3T
	lvqLvI5/fxixIgSjmjR7jgVtcNukq6IAoPt7YRan9URjUzIJXOQaKsp3thJCy4TE5OuczkZgHrFyK
	/loh88KQ8PyysAOsaZom4RoXypP6ajevjAddMqngBFcKIMymtwd0PsLx4BDWwQLErfB0RzipQg26V
	hzAbzhFEJKKUsJS3xTRx+1K/THhzrhl6gab2GoyC9VKTg7cWsujq1KCqRZy06hKHuZ/c0vLzYh4So
	h8s3cXNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfB0m-00000004o0c-0q54;
	Mon, 12 Jan 2026 06:02:44 +0000
Received: from mail-eastusazon11021086.outbound.protection.outlook.com ([52.101.52.86] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfB0h-00000004nzh-0zZs;
	Mon, 12 Jan 2026 06:02:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w/YNZ5PQSjURQh7GoKFwSKuJotbV3HHiRjNIYGa/4YHlIbUFbX4m7AVqmLyUC1mpLVW7NtzQ9QmWgKmLACkeGIYJLsDTNz88YJXheqglNkXv4s3uKJX1VW3N2CgCbU6U/PEO3INTFYGh9lrpp4G6mwJDohxpdxhYm7dNIoI0x3uDRTya6sx1hOkT7y/swxD6MA7Gdgd+9OmeOezgq6/LWfTqVpSqL+czu5m/mGIXue0jPmY8IeMkU+nCBnMlxAH9DLzZBXLwoM554BvOs7LZLsMJVBE6q2IMQruXSRiHvIT1jUaCwGtHZ3uO7URUxpaS9T7s5D/1pko4ujmPrwBFUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rv2KDkibwGJzaVRSaPxItP+RjPLwxfJXFZMkcf0A8yA=;
 b=bOp/62ld+N2SG+gLoTQhxu3VJB/MHa2eZgih3zrUmdP0zw9aMMyWcF+3xeOyJXfluhzAlV/p2Bxf6WA8hNaRJcOcmJU8xkUA+EKnLBcztYMCpLx7RfRjm/+IHsST/SLak8y5oa2wVrJvzuWGXr02kZ7pA3mEyzZisaPYJ4wfs3Z1FIwzikmzbyKwRKbIVK9pUpayAIkVY8ycHmOPZcL2/0ydh8Uh+0BrfTTKbH5e4k/jNUfSFnGdNbFaLZbCdDvdnd/5yUX0mCmM7MoXiw3UOy998wDR9sWVKdo98KUHyC8vG8u9LWqbGrI65fcDLAtnlNYKjXCelwuQuABZ83vbmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rv2KDkibwGJzaVRSaPxItP+RjPLwxfJXFZMkcf0A8yA=;
 b=lqLoLEeQBjAInBD++JfJYA+1kwmeIeUDI/kcO2MLiNq/4+eh894m16c1Iq23syaL2s9YBnHIEmU+zCCRX0bcXkn4/d1vhY1NmFy/cHzYrKxcSUzfCVNScxwVr5x5Lw3J+PouCFfF6UjFyLFPm5NbMguXTBj+xBcDWTBbj8XJWPtlnW+GPTQptV+dnIAwH1lHgJK5Ie+ZFh1/m47iBRhalL8ywWfsbvfSr8o6G7rt8sVF3ArmFZ8AC4bvzmlPjmcSXNmtTESn2Y/+TLjjzPQ264ZDZy4zvkb0JpZU/xL6goH3ReUI6VukhFOaxWJLVnKlXQgQwGQiSVIkMAra6DsljQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received: from CO6PR18MB4436.namprd18.prod.outlook.com (2603:10b6:303:138::16)
 by SA1PR18MB927427.namprd18.prod.outlook.com (2603:10b6:806:4b5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 06:02:34 +0000
Received: from CO6PR18MB4436.namprd18.prod.outlook.com
 ([fe80::d3e5:42d6:c423:a253]) by CO6PR18MB4436.namprd18.prod.outlook.com
 ([fe80::d3e5:42d6:c423:a253%3]) with mapi id 15.20.9499.003; Mon, 12 Jan 2026
 06:02:33 +0000
Message-ID: <fb0b7c73-767e-4d01-a014-0a28bee228cb@axiado.com>
Date: Sun, 11 Jan 2026 22:02:32 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] MAINTAINERS: Add Axiado AX3000 eMMC PHY driver
To: Tzu-Hao Wei <twei@axiado.com>, SriNavmani A <srinavmani@axiado.com>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org
References: <20260109-axiado-ax3000-add-emmc-phy-driver-support-v1-0-dd43459dbfea@axiado.com>
 <20260109-axiado-ax3000-add-emmc-phy-driver-support-v1-3-dd43459dbfea@axiado.com>
Content-Language: en-US
From: Prasad Bolisetty <pbolisetty@axiado.com>
In-Reply-To: <20260109-axiado-ax3000-add-emmc-phy-driver-support-v1-3-dd43459dbfea@axiado.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0P220CA0005.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::12) To CO6PR18MB4436.namprd18.prod.outlook.com
 (2603:10b6:303:138::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR18MB4436:EE_|SA1PR18MB927427:EE_
X-MS-Office365-Filtering-Correlation-Id: b29fe563-90d5-407c-f7e1-08de51a02da0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|10070799003|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?djE4RERCbUduSEJyc3NPNDVJT3lpOGtRR0xSRUljdm80enRKWXY3QlF5cXVQ?=
 =?utf-8?B?UHZpRG5ReGltRmRPT25qTUdiN2xQRXFSS0p2ZytVcldKbXFHSHJrUUcwY1FS?=
 =?utf-8?B?ZW5LOWpPNkp2S3ZrMlJjNTVocVlSeGg5UXhWY2NYNkxMUVo1RXpPN2NpeWZj?=
 =?utf-8?B?YUFJL3Q4MldiV0RCMTBITjhQYjVwbWhDRG9hT1oxNDh6VGtVWksrZ0Eyayt5?=
 =?utf-8?B?dFdaaGhkbTF3cVFDRVY2bjIreTV5RVh0clpXMUxBZDcxMko4dUI3MUlPZWhl?=
 =?utf-8?B?YlRhWE5pR2VsWmF4WHpxRGFGQjRPWVk5R1hSaVVHQ1l2VnZ6VmlRcGZvUHVI?=
 =?utf-8?B?SEJGV1RGQjdtVzJqWDFnaDBJVzdsTkVEM1N5dXUySk5sNkI2N2libEVXcXgr?=
 =?utf-8?B?S3A3RHJpdnUrYm4wbmRRMWNmZ3VWS0xFaUlsamw0b0FsZkNhbW94dEZhSnZD?=
 =?utf-8?B?bGdWSzNMWnN2V3d6SVpLcjdwTUx5dlg3VytmSE1ESGpiMUNYUlpNWld2NHpC?=
 =?utf-8?B?amNVdTBQSWVtbVpraWJTVDZkUENzeXNxSVJ1SjlySFdBTFdwNEpDSWJ6bndq?=
 =?utf-8?B?cEljRUV2dEVPUTlFMFJpMGF6cVNEdjRWWjkzUzJuTG5PcVdrakZha29ZaWFN?=
 =?utf-8?B?OFQ0aEdmQkMyMC9VQUpORURXYzQ3cjNWNU1SbEYvdUZlWGhNcTlpU2lJTHgv?=
 =?utf-8?B?cnc3eERSZFIycysxb01CVEdydkdYRjdQdUVTOTE5Q3hIS1l5U0p0RHpoT2pQ?=
 =?utf-8?B?Zm5UUnNwQ2tOaitsc01FaEhheFltUXJhV0hjOE5oMWhUK3ZON3JUeSs0bVE2?=
 =?utf-8?B?VEF3MVVtV2llTWdUd1JLVFY0djJuYVppZ2pLOUFleS9VbDF2dGtXb2t3RGRO?=
 =?utf-8?B?Y1Z5b01LT25IL0lIZzAxcFJKbDFzSjVQb2dFUFhsZC9JYUQ1MTVvSnJLUUV4?=
 =?utf-8?B?SElXcnF5QW4zRHN5LzFBU2haejJVM0dORkhHNW5ZVzRaSlJ4TnA5dS9kSkRp?=
 =?utf-8?B?TGdaeWlaMGh3KzUxdjU3dFRHRWdlMWs0UTlITXUxcHVybkg2Qzg1ZERMK1Zr?=
 =?utf-8?B?L2pHWTlKaGlMdzJDRFA4cURmSy9JUC9PbVNlOEFFVmFxVGtjcm1keHduSlRC?=
 =?utf-8?B?V0w4dzdaMDJlQjQ1NW0vaDRHYS9HNUtDMW5POWtRRkNXa2IyVkh4MVo4cjBh?=
 =?utf-8?B?dmIzOVZ6MmdjTUxLWWROclJsZE15ME93aDYzTEpYcVZXNmhmZ0lFcGVHL3Nu?=
 =?utf-8?B?ZzlUVmw5alM4aEw3d0RmYTBETVo2MDBYWnZ2YXR1SjJyZHJ6Vkl3OFlnbEFt?=
 =?utf-8?B?d1ViaE1ja3VnSk1oYmFBMHV1clMva2luei9TM05DUTVVSDdlRi9Ed3ZaQlJR?=
 =?utf-8?B?TXhrTkFyZzcyRjZLUHVIdzEvRXZQZTB1VmVnQzNEQVRaQitmNmFPR01qTlYv?=
 =?utf-8?B?bUduQzRKQXN1WmF4Q3h5L09zSkZzNEZLOVhOanQrNUNrcDlrUVdzOU5yNTE4?=
 =?utf-8?B?NE9CZTltZlNoSzRTOFc2dWJqamxXRk1ZSjZQRG9EbWJ3dVkwc241OGdlYXpH?=
 =?utf-8?B?cEswMldCTWxnQ25zM1pBeTRjUG9rVUZtUWFTT0dSejQyTHduNUl6dTFlK01x?=
 =?utf-8?B?VlE3ZkZkYTdoSmlhMGgwTXZoVjcyM2NNWGR4d29nZCtnRm5JRVBXOGIwY1Bt?=
 =?utf-8?B?eGRqN09sb0U0WXlHQ2FwL3Zna3BscHQzUWFlQW5HMFpsNWxGbmpnY1RXd0pk?=
 =?utf-8?B?dVpnQTJMMGRVZFpiN3ZSSG1BY0dqN0xYWXlsR0RMTlk3d1N6ZEpQNGNUZXZB?=
 =?utf-8?B?SWpnaHZUcG1uakpRRGJ2OWJwMyttSEtGNXB5Q2ZRN2NJeHhhMmQ0TmRhZE1i?=
 =?utf-8?B?ZU9XZFRLdXJnYk5tOXNlTEZFRkpwK3VZbWFGSjV4R25OMWtFc1N6MVQycE8x?=
 =?utf-8?B?NGpuU3NpV25OY3Z5WjM2NXc2azR4RjhJSWJOdEI4TU5LaFJjdGdUQXI0ejgw?=
 =?utf-8?B?b3FZZmFPUDdBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR18MB4436.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGd5Yi9ORFNFUjZkRHlyMFAreG1ndm9mZU4xL1loQTBxWk8yOVZ4SE9tYjNo?=
 =?utf-8?B?S2lsYnpVait0Sm9QeU1WQTNvSytDaStYMytWOWlPbVl4akxuNW5uQnFaS3J6?=
 =?utf-8?B?bVBVckpOL3NMQ0VOL1VMeW5LUzcvRkhidnhLNVRHendnOVdyR0ZUTXZncHVv?=
 =?utf-8?B?blFSRmY3UkJQakJPWUN0V0x4dEZZd3EzKzlDOXFHcUZRR0llQ1NWVmhwaCt1?=
 =?utf-8?B?V09RdlZJeVl4cXhiOVdHajhQR3hETUJCeXlWRjYvVFJRNGx1a09VTGJmUCtn?=
 =?utf-8?B?Z1B2V3NzbHdzbW5LOXJZMzhsZG1GQldDNUdDRjUyWmlaR2NQL0JqOU12akR0?=
 =?utf-8?B?a0FOSzVQVDZRdXVQR1l3ODhsYVdITXpuc1hSTURFbk5ZVjhRSDV4RUplQTdN?=
 =?utf-8?B?OTZqNHdlcHNwK2tvM0pEcWQydXB6NURMdjhOVUVVZmRPSUlzV00zdmRhNXo2?=
 =?utf-8?B?angvd0ZSeHh4RExjVDNSeVhGeW5VZWFkRmxEQ3pIUFM5YW9RbWs4c0lHTFZR?=
 =?utf-8?B?U3IrSVZLajRDb2V1TXM2ZWFzbmEyUXE1b1ZRejNlcURESHZLUHFPSERZRjZt?=
 =?utf-8?B?aWQ4Q0RuN0JqNzdOdUxzUEhqeXAyOWRVNnJuUWYxWlBObHVQMWFXWlVMNzZu?=
 =?utf-8?B?R3h3N2I0WlRHSnl0R2pIckFQRjY2dm1PRElQYVhxdDdEUnZXTUptT2xwZ3Nr?=
 =?utf-8?B?dXpxdkZpZVRkN3R5c05WRE8xWTlKc21DbW1DOEVwQ0ZDdlRvNHllWDl1M2Z4?=
 =?utf-8?B?b1JNejdweE9qQ2Znbk04YTlWa05nU1EyTEdINTB4RUNFYzh5QUtFK3FiRE0x?=
 =?utf-8?B?SDdxQVpjRGxlL0dIazB2Ylg3T05jMFEwNjhSS0hxa0lWd29pVWcyeEVpWjVV?=
 =?utf-8?B?ZW91N3hBTmZhVWhrbVVNZ2dobjhsOFEzbWZYWG43WHZvem81dTN4STY5Zjha?=
 =?utf-8?B?bjVMOWZaUFU4QVYvbkxyRk9qV3krVmNzOXVEcDlMSnBKTDB4bWNGVk1tY0ZU?=
 =?utf-8?B?WTdoUDFtZ3MzejloUmVGaUIyMzc1OTdyNHNsUVlZaGNnaFBOOTQ1NWhPUmk4?=
 =?utf-8?B?OXgyZGo2c3A3T2RlUmFIbGR0M2w4L2lNNEo1TEtDS25xY291T04vS3JFYWhX?=
 =?utf-8?B?b3BPbW1nd3JPcTRqYVBHMGF1bDBtOVYvY0h5L3RRYmN5eTlmbDdIcC9VUmQw?=
 =?utf-8?B?Z1QveUN6ejN3UUZlN0dpQXh4T3pTSWU5d0U3Q21UeE5OMkNTdnIxcXFFOFFy?=
 =?utf-8?B?NHBBUXBEanNZQnduNWlGVEJhSFVSRlE2SjZhV01FcTNOb1lTRmpucVZJcVFR?=
 =?utf-8?B?UDlKOGQvbi84U01IYWtuWldzNTFiV2MwWWxyeWYvdlAyTVVrVG1HdEh4Mmo4?=
 =?utf-8?B?eXhPU28vSHJaVjY1SGFCZU9BUTExNEZlUTlBTzZGcUxUQzNvUTkrYzRRU2Nx?=
 =?utf-8?B?NnI0RU50Q0tuK05lMXBoTmxRaWlzRHR5akJLWm9ZV2V4azJWb1RzWDlIek5N?=
 =?utf-8?B?MXFoSy9OVVd2ejR2bk1JRHBKUHpGaW1Ea1ljNGUrWkFoZ1AvWjhxdFNrVkYr?=
 =?utf-8?B?WEtXbG5TRXNoTzc0UkZwUENVZENrcFJZZEkvaVpyeG5JbDEya1I0VkUrVFdQ?=
 =?utf-8?B?NTRKemxQS3VQUGNpb1d3ZGw4ZDFVVDlld0JiTUhIRGZoVU9qbmZWeG5zaGRx?=
 =?utf-8?B?UGduQlk0NmROdHVuNW03RXY5S2t2NUwzRm5IOGdUbVRyNmJNd29MWnM3OHFC?=
 =?utf-8?B?cHlKU3RWMjNieVZ4QTF6cERpcjc1dHpBL0VESUlQN2Y5SzVxeDFnZ2lmRzVk?=
 =?utf-8?B?bE8zekExTm5NMTRYb2k3cVlGOVpqak5ySndxUHB0bWpDbmRBQ0VnWjdXNDRl?=
 =?utf-8?B?ODY1eTZ0SHV4RVdMWXhkYUpCWmtnVUtiL0hXWFo4ZnNBZ1dwYU9YOXd0ZDJ4?=
 =?utf-8?B?dVlMVjlFWWhySG9HeDBhUHlSQTNvSUpnTXlwRW03N2pya1hSeTIyM3JXUVEz?=
 =?utf-8?B?NWRCaUcxek1FTW96YjU2c1VTRVk4Q1p6NW10aWNZbGV0aWdnTjdqTENTT2p2?=
 =?utf-8?B?YmNhRFFIV2dXNHFKMHR3WWM2eTIxbUNJT0krOFNKZ0pSYzhWL1lxU21CaitK?=
 =?utf-8?B?c1dhVHRUSXRjenU1MlhBcWVWTVVHY1kxZHhlbG1Dd2FobnVGM0xDNzNYbEh2?=
 =?utf-8?B?UDIyeXVQYXVUSXVFRERIMzRVaGFZQUwzUFZ3U3dwWFhwSkpvV3RRL3g5Wm1D?=
 =?utf-8?B?ZmgweklxSy91V2NVb0ovSFpLK2Q1dSt2Q1ZYK1dPZTNVdDdCb2lBQUZpT0p0?=
 =?utf-8?B?YmRoM0JZUWpLRDkyT2ZSV1RIM09VZVJEUHY2SUVndDIwbTJmRlJibGY1aEtw?=
 =?utf-8?Q?BUgJt9+vHs0OTwk+8JnTW0FhUfnMixsCuHxRhuj2u4Nad?=
X-MS-Exchange-AntiSpam-MessageData-1: NoredFj2iDeI6Q==
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b29fe563-90d5-407c-f7e1-08de51a02da0
X-MS-Exchange-CrossTenant-AuthSource: CO6PR18MB4436.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 06:02:33.7122
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dlSP2wuWFMteHOA0b+eytUuashYBBKxJRiJ0u6epZl/6Ja9fq+9DWcdv9XoRamD626J16/67LFUuX30b1K5Fww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR18MB927427
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_220239_509665_3B73FCF9 
X-CRM114-Status: GOOD (  10.85  )
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

On 1/9/2026 1:43 AM, Tzu-Hao Wei wrote:
> Add SriNavmani, Prasad and me as maintainers for Axiado AX3000 eMMC PHY
> driver
>
> Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
> ---
>   MAINTAINERS | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a0dd762f5648b7e4e6fc62560662e43720422e01..6d1af11eb289ffb7c0d8634ac7d8f903aed1799c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4250,6 +4250,16 @@ W:	https://ez.analog.com/linux-software-drivers
>   F:	Documentation/devicetree/bindings/hwmon/adi,axi-fan-control.yaml
>   F:	drivers/hwmon/axi-fan-control.c
>   
> +AXIADO EMMC PHY DRIVER
> +M:	SriNavmani A <srinavmani@axiado.com>
> +M:	Tzu-Hao Wei <twei@axiado.com>
> +M:	Prasad Bolisetty <pbolisetty@axiado.com>
Acked-by: Prasad Bolisetty <pbolisetty@axiado.com>

