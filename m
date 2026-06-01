Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D2D4CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 20:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LPdJovlkw4BiJWaR3ZQrXyGhuFCOoZ/QhCpmbwd4qIA=; b=zGSWJPKLT7kQgOUmIpc3KlREU/
	qTDNmuJgpdScdMba+9ch46I6N4uGNurAlxVeE1R2WZPB6gNz2fTcdDWbdxOUllinkhMTOK7J/vtsT
	QU5UKbL482ZMd7LdsjYqzY3khoRnG+xT+mvAK5BEqRSNk+a+1jcOoql6fNx0nFZpKIkmIYg0KgBMi
	2sLQ8t9XC7FrRG32S4ndEb4UghJ1EMPipg16clIJ0zmIa5MSusNEipNqybYJBK4sL7ezuSB3N9Oj9
	G6IL8I1vqXyPEe5q2AEnsc/ztgeg6Zspli20A1Tw+IV0UYlAi8VfP/ek8KXkHfu8pdlzF+M1e+aM5
	3sg0Z32A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU9Vw-0000000Bp2w-05m1;
	Mon, 01 Jun 2026 20:45:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU9Vu-0000000Bp2O-1aOp
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 01 Jun 2026 20:45:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=LPdJovlkw4BiJWaR3ZQrXyGhuFCOoZ/QhCpmbwd4qIA=; b=dVknYB68ervVnn9JBwlwOpGNBt
	CMhGGI/H8i1Yydg04pvJsxKH/KjKAmHSxa18MaKZofnWZnnDKr5M4Kp4oHa82pXBREi+htZ1/megz
	QgOumQtBDK0s/p2J2ApJPLUxVztY9CfoZ4TiTEy8KyzoPDtrh+dvyXD2phBBroyKnRJ7Ktic2JQcI
	w59Np9kf2WsvC+Nch+aKUqT8ZmMXSv18joFiQXKAvZYzjxTFbc3Hisj2NtSdcmjxu5Ym6EUvBT2dC
	R/7BVNVe0huyJuUena/mR34OPeoc5ciEfAvA1X38vLo7CxxtVx8J+xPdfD7c0PZg/HhH2O2OE2RXg
	HfF/iZRg==;
Received: from mail-westcentralusazon11013030.outbound.protection.outlook.com ([40.93.201.30] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU9Vr-00000007ioz-0tX7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 20:45:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lojtGvPhyRER6xTyd7munzzwJwcn8Dz+uqZP5JCITFKzBbZ5idCTKZda5SESUONRPvj+HkflA5optbEcqv5OUUr9uDDlwLgrCZFW7bw6BSUC7E55qMrfNll++2CRYtZbft+vXflI6zIbacqkfQt5zhg1WaWkmFf4MrtKltxTvkqZnpD+DUMGSsibr12sapmMHJifdhJIezx+aNNpFS4cE8+eYJo42O5SjD4r5udM8X5MQZ1ifPxhTsdbDohpoZIVqHGYdJ5xGIU12sZjBNrUxx4YgIBVInpVyDMuxfXGQlKXRu6o+u1eYvO7vUtE9P5YvaTyrhlOPQ05KhEmW9EfQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LPdJovlkw4BiJWaR3ZQrXyGhuFCOoZ/QhCpmbwd4qIA=;
 b=BSfliIlEtd9jAwA+KpFKD5fIgS3QQTHO554zph5m7/CaaXBf9Lr2phpdNWpf8F8rE5eToy6HHZ31YIm8/4LGapSgY9DN4Y/an2D8KIsACBZMdirLaVCCxvqjPXEgpjPQu6TTzzC+U28sJsZLXhE9A8iGUlRrdUcRgAWr5SoBShYQ0Jn8FHBqMwa7kPJuEcYTyAxcAL2q70Ta+5wbT/KPKMz5jXXvq15fZiTSwmNQmBOqcLcpsmpwbabChMLo9tu2qUHCpVr5ZjHffwRdc9+3wj+9r+VooNuROHIXMNutnKqGCydu0t2gt9BIPzFhDTU56IB2Xfxcx6+gP9PKuzpoEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LPdJovlkw4BiJWaR3ZQrXyGhuFCOoZ/QhCpmbwd4qIA=;
 b=ROTKX22BO+zZiIbzBtrnjQYSBceQGoxGip2EUbHdBl3gXNE7GipREE4fNzfqPKVwuPGNvFOO3ETwY3lWvyzfqYVwW02+Wn/7QZ1RG9hwpUmMA6WFNmZULg5zlKPVFdMqoFnefNfRTa8JYtmxDLVjdzIad8RY4YcVFEQlIZ3vA+HfN8sdIsBueKNZ8QNh+FN4wRhPhq148Rd/PTmaL15Z2Kz/iE5qz9npm0y4NfokxE95H9DIU2+/NgRhWwTiwis3kzGgogn+HFP2W4AIHjTP1PxGWTixAyzw8Zbulx//2CCLQXgiAfmRJyJIvZzEfWHTz907rhDVzmRHJYQDi5z3qg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB8768.namprd12.prod.outlook.com (2603:10b6:8:14f::20)
 by SJ0PR12MB5674.namprd12.prod.outlook.com (2603:10b6:a03:42c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Mon, 1 Jun 2026
 20:45:21 +0000
Received: from DS0PR12MB8768.namprd12.prod.outlook.com
 ([fe80::c16b:c351:2fc7:95e5]) by DS0PR12MB8768.namprd12.prod.outlook.com
 ([fe80::c16b:c351:2fc7:95e5%7]) with mapi id 15.21.0048.016; Mon, 1 Jun 2026
 20:45:20 +0000
From: Seth Forshee <sforshee@nvidia.com>
Date: Mon, 01 Jun 2026 15:45:11 -0500
Subject: [PATCH 1/2] firmware: arm_ffa: Honor maximum RX/TX buffer size
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-b4-ffa-rxtx-map-fixes-v1-1-c071b12ae05c@nvidia.com>
References: <20260601-b4-ffa-rxtx-map-fixes-v1-0-c071b12ae05c@nvidia.com>
In-Reply-To: <20260601-b4-ffa-rxtx-map-fixes-v1-0-c071b12ae05c@nvidia.com>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Sebastian Ene <sebastianene@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Seth Forshee <sforshee@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: DS1P222CA0006.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:8:454::17) To DS0PR12MB8768.namprd12.prod.outlook.com
 (2603:10b6:8:14f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB8768:EE_|SJ0PR12MB5674:EE_
X-MS-Office365-Filtering-Correlation-Id: fcb8c184-6045-4007-8a99-08dec01eb269
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|56012099006|5023799004|18002099003|22082099003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: 6AQ9aRBUVha9n/UNl8tezS6O5WefJSvBjPYm5WAEkuAWH2GEcFuTxdO45Byv7bO/5n8Vp1NzKO+L6m6FySoVIeY5rda0qp1R4pC6JVm3KRpeibR6XzIcaAULD9cnMNv+LC/dlBkHD517LGaovdLiw5YKkQoCvGiOYKEATLQVOukYb1xuQ/PIq7Z0Bmv+/IhLbnPe0klqWYdXfw/MKyvSokiBSoszfWKNAqbwPTE1k5MztjY5mnECWO5sORtnNboVpUzKoqzrYT57j+w9+n8DEHYXMLUPoPaLfl9g4YKpT/bBZmJ01tKwMJws/LB93joEA4/OOpAXIyhLgAZCERmjp+lyuw8jWjNGUS5bRBtkOD9G2KWF1le/W6pYZY5emYqs4D+vx0wbFRYXOjNzz3coayFNjTWFMzDxG+lCUR7YH5iMOvEmDqZktEQMakK3C8cTUw4+VBz1nr5bb4pa17eqlHRcg2Y+lGfAFNFAp6ln4ThQDr/x9jGmDIUd0CN1iTRXa5t047uIHFtIlhRNBqY0xGAkvsl7G2mVaTrnAmcz59uouiZfDJ7JoavXomQvif8au4eh9P1DKMlI7rTy5b02PmeeIcslyf0HgVjZ17SohxVv4e9JL8lHoKoQWedIgUNf8ZCrTuixvGNEaH6eIR/Zki9dfHNSha8UeGjpfjiO4qRVaabfBLFUUBHmmDzsl2SY
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB8768.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099006)(5023799004)(18002099003)(22082099003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dEhnTXg2bndodmhKa3VDQTJHRVJxMTc0cW5lU1dVZGNDeEZIcmhuYVdwcWt3?=
 =?utf-8?B?OVc3cE5VZk9HVGE1UFBmQVUvbkthZEttVzZHMUt4TW8rVVZTWFJXd1ZlQU5T?=
 =?utf-8?B?dnRkWHRrVy9acWVkcVp2by9zMHpyZ1ZOdXhRcGlCb05uTmZmb29rQ001dnFM?=
 =?utf-8?B?bWh2ZVF1ZHA2dWVTclF5MCs1a2J4TlJhWlNnYkJCUlN4S2RPWVJRdUZZSUcx?=
 =?utf-8?B?SitMVGd6WTg2eXE2czhwZmlzaXJMcGRiTHdZRkIyU0NxT3JtUEhTWmxLbkwv?=
 =?utf-8?B?d3FMUmJQeG56K0haZEh3QjZXdG1lMFZ1VzNpUlphUW1TaENpKy8vRzB6c3g0?=
 =?utf-8?B?M2FrNG1vUDJRWjFla2JhK0VpWGMvSU4xelQxOXluZFg5U2gvd25ySTUwaTRO?=
 =?utf-8?B?enlKT2xQS24xVjkvelJYNHJwemcyYURqK1N3RzRkemMzOXpldzU2NUZYN054?=
 =?utf-8?B?MU50SHU3cTRWcnQxbWJJOHkyZ0dzUThjR2U3S2s4Ny9ibUE3SitNQnFrV1lL?=
 =?utf-8?B?WGkweGwvSWNBbmQ2NWhYSFozMzBKMUZjYWxZUmNRaEdjcWIyM1VIaGYvUmtT?=
 =?utf-8?B?L0RqRXQrOFhPeTgwYXkvQTVVRW9rL3BSZ2xoYkluTUFLbVBRMlVYb3B3WHlz?=
 =?utf-8?B?M0MrZzUrNHh6dCtlSmk0aStieG9KU05tNnprZVlqQXRFd1BaazNNNTk2SG5a?=
 =?utf-8?B?eGdKbHoxR1pXMFdkYytRK1BrdFNBVlYrMGVtWEU4Ri8xMURXRGpMNFAzQm5y?=
 =?utf-8?B?R01lYkxhUVdyOHphN1VLbkRpbm41N0xtUDVKRk1qVnpUaXdVVkxjK1N5ZE1u?=
 =?utf-8?B?QVIwREk5ZlJQaUJJOEdZSm5RTWY3Sm9OclpSUEtOcUlLZkJtUTJlREZHQTJN?=
 =?utf-8?B?TVU5emxvMlNRLzA2Tjl4SFB1dmhaY3JHaUswcVA4Wm13a1R5QWRaT1N2ZjZ1?=
 =?utf-8?B?eFVCV0VSNkJqTWhyRGtjVERqMnVOYjBEdGxYZ0dwWTYvYVBzTEk1Nkt4S1Z6?=
 =?utf-8?B?aXQrdE9mY0JRdnErWDFDVjcvWnhkZXhFY2FtWDY3Skk2dHlETmw2bFRIclg3?=
 =?utf-8?B?UUQxMy9NWHluaENqK1gwWHlldEtpWjNsK05YZlNYTjd2bzV5c2p5MC9jN0Ey?=
 =?utf-8?B?dFMvSGlIOXdZVWsyeFJBNEdNeHZVK1ZGMm5OWWVkdjhkdURoMk5TdklHOFR4?=
 =?utf-8?B?L0I4aWZyM0RUUjBWT25HZEhKOW96UFVacnB4blBLdlQyVWdDV0h4Z25RL3Mv?=
 =?utf-8?B?c1NLcTllNkFpWkVBMXBGZzYzc0hqNmZJTGx6MnZ6Q01Pb3VLWWtaaWN6REk3?=
 =?utf-8?B?MmdocjQ3Sm42TW5lWFNCdEJHc3FtQ2w3bUw2ekU2cnZBcVNnRjBtbCtXQ2RU?=
 =?utf-8?B?a0tMWk1XdlpadkdIRE9kNXRTaG4rVWg3VWdPZHpkWG5YcTczbmxIS0ZtS0E5?=
 =?utf-8?B?M1YwenVUdGZDUk5henVGOHdEM0pyVDBsNlg5bkVRTVNrRmVHQWQ5SVRlUThV?=
 =?utf-8?B?cWd0N3RTVmJSU1BnWU44bVRSQWIxM2ZmSElEb2Vhc1VGMS81cFlPUVRYTGFy?=
 =?utf-8?B?MVJqNVFFMkxNbHVpWGI2Nnkyb2ZETC9IQ3Awc2ZuWHYvQjFNeEJTR0hyR3hB?=
 =?utf-8?B?SmtNS3lmWDg2V2xkVEorRHpKSDA0UDFmU014Q2J1TUtvaWVHdVl1OXRweVg3?=
 =?utf-8?B?VU5PbmVrdXVwZE9BVFFkWjMxRUNFbVRyTUhBV0h4NDJWblN3dDJyMUtxSmgw?=
 =?utf-8?B?ZFBEZGZwWVNncm45L1BiUXk3bC94VmNiUUhSY3ZOcThSMzFQcTYxL001MXdr?=
 =?utf-8?B?MmoxTUcvL1RqN09hUlErZUY4WmFwWjVqK3ZXajFMOG1KKzBQNzZJUHJjaFBU?=
 =?utf-8?B?NGQrL1RkbHJ6bEhyTHlEN0xiVHNNNXRST0J0WmZNOVJpejBLWnRxQjNBMmFt?=
 =?utf-8?B?Y0ZQOFU2bHNoNFFoRUh2aWUzcS8rTUJvT0JISHBrZlU4VmxWTnZlQlRkNEo0?=
 =?utf-8?B?V0lGT1p6dnZJZ3hSMHBxbEhGVFlMV3NEUW9PQ3hOc1RaS0FsdGlsWTg0cTh4?=
 =?utf-8?B?MElRRnZWNlhGaGd6L1U2bEMvUWVMcmRYc085c0lGU2lRNlc4Q0lHZVBGS1VV?=
 =?utf-8?B?SU5jTUhkcFl0K2t6d1c2eTBaV2dGMnpvQTFXRlN2aVh5NWRSeCtyRlFoVmk1?=
 =?utf-8?B?SnhzVXdBQlEra3hvUEJ6R2VkK29xOC9sSWtEM2s1b3Q0RDJ4UmNGWjdxY28r?=
 =?utf-8?B?YVhYQ25iNUxxeHhQek83UmlWOE9DT09EY1pKaWtJUnplNW9hcmMvdWNoRjVo?=
 =?utf-8?B?TTlNTERWdytncnl3V0w1cDErRHRtSzdFWEt0TnRaMTVHMTV3SVZkdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcb8c184-6045-4007-8a99-08dec01eb269
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB8768.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 20:45:20.9298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Cqc3sIewpRSQIdRs3hPKqWokZSlWC7qoNwFq/x3WETlWoFV9lrT1F/RQhnTx8aRIDcvsXwo7IrDizlY8aXQ+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5674
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_214531_681577_52CE147B 
X-CRM114-Status: GOOD (  15.73  )
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

FFA_FEATURES in v1.2+ supports a maximum RXTX_MAP size. This maximum
size is not checked when page-aligning the RX/TX buffer size, and
FFA_RXTX_MAP may fail when passed a size greater than the maximum.

Decode the maximum buffer size returned from FFA_FEATURES and limit the
buffer size based on this value if it is non-zero (zero indicates no
maximum). Include verification that the max returned by the SPMC is
larger than the minimum, otherwise use the minimum.

While there, also update RXTX_MAP_MIN_BUFSZ() to use FIELD_GET() for
consistency.

Fixes: 83210251fd70 ("firmware: arm_ffa: Use the correct buffer size during RXTX_MAP")
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Seth Forshee <sforshee@nvidia.com>
---
 drivers/firmware/arm_ffa/driver.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index b9f17fda7243..dc45724a29ba 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -32,6 +32,7 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/mm.h>
 #include <linux/mutex.h>
@@ -55,7 +56,9 @@
 	(FIELD_PREP(SENDER_ID_MASK, (s)) | FIELD_PREP(RECEIVER_ID_MASK, (r)))
 
 #define RXTX_MAP_MIN_BUFSZ_MASK	GENMASK(1, 0)
-#define RXTX_MAP_MIN_BUFSZ(x)	((x) & RXTX_MAP_MIN_BUFSZ_MASK)
+#define RXTX_MAP_MAX_BUFSZ_MASK	GENMASK(31, 16)
+#define RXTX_MAP_MIN_BUFSZ(x)	(FIELD_GET(RXTX_MAP_MIN_BUFSZ_MASK, (x)))
+#define RXTX_MAP_MAX_BUFSZ(x)	(FIELD_GET(RXTX_MAP_MAX_BUFSZ_MASK, (x)))
 
 #define FFA_MAX_NOTIFICATIONS		64
 
@@ -2086,11 +2089,13 @@ static void ffa_notifications_setup(void)
 	ffa_notifications_cleanup();
 }
 
+#define FFA_SUPPORTS_RXTX_MAX_BUFSZ(version)	((version) > FFA_VERSION_1_1)
+
 static int __init ffa_init(void)
 {
 	int ret;
 	u32 buf_sz;
-	size_t rxtx_bufsz = SZ_4K;
+	size_t rxtx_bufsz = SZ_4K, rxtx_max_bufsz = 0;
 
 	ret = ffa_transport_init(&invoke_ffa_fn);
 	if (ret)
@@ -2118,9 +2123,29 @@ static int __init ffa_init(void)
 			rxtx_bufsz = SZ_16K;
 		else
 			rxtx_bufsz = SZ_4K;
+
+		if (FFA_SUPPORTS_RXTX_MAX_BUFSZ(drv_info->version)) {
+			rxtx_max_bufsz = (size_t)RXTX_MAP_MAX_BUFSZ(buf_sz) * SZ_4K;
+			if (rxtx_max_bufsz != 0 && rxtx_max_bufsz < rxtx_bufsz) {
+				/*
+				 * Per spec the maximum must be >= the minimum, or
+				 * else zero if there is no size limit. If the SPMC
+				 * violates this constraint, use the minimum as the
+				 * effective maximum.
+				 */
+				rxtx_max_bufsz = rxtx_bufsz;
+			}
+		}
 	}
 
+	/*
+	 * alloc_pages_exact() allocates full pages. Use the full allocated
+	 * space up to the max supported by the SPMC.
+	 */
 	rxtx_bufsz = PAGE_ALIGN(rxtx_bufsz);
+	if (rxtx_max_bufsz)
+		rxtx_bufsz = min(rxtx_bufsz, rxtx_max_bufsz);
+
 	drv_info->rxtx_bufsz = rxtx_bufsz;
 	drv_info->rx_buffer = alloc_pages_exact(rxtx_bufsz, GFP_KERNEL);
 	if (!drv_info->rx_buffer) {

-- 
2.43.0


