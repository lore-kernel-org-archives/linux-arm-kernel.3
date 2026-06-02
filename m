Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC9ECCD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 16:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kbjpQDm/DGPTLVu7IFyC0C1MwQhVT8UH1Mpf7XUTfUw=; b=4c+5FN7+JvqTr5A/seT70tkZwj
	O2EYSK0TsrQYkgRu6f8wYPNXuJcDN6bIxCCc1YSN1tVUXMGXUqjCnrjefQHBjDEenwNSXS7eyy+Kx
	eCD8Wxue91EUieLtZR1kMW/A5y0H2TZafhm2v6Hare3IO3+vc/MN+Uv7ni42ozeRr/zifQaN0USh6
	ISBFYP2qun7Q8xavwdrWKl7emMcZbySRytNA/y0Cm3ESLdyYqZJvXga5uSgB0ntrvSIpPu8v6SdKz
	jSwrcJz0V28Z/P/cyUy7Tn5oAtlEym3zSqz88QzHbnYYnvMKJD69NPDz0TR+HAt+r9UlaLO+uCrfj
	LZPsrK8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUSRs-0000000DViK-2SkJ;
	Tue, 02 Jun 2026 16:58:40 +0000
Received: from mail-northeuropeazon11012047.outbound.protection.outlook.com ([52.101.66.47] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUSRp-0000000DVhX-306m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 16:58:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iq9rbvjj7M49dxZS9QBDYIvSi2v/rXpN98qZ48g3CwN+AiuQiQ8l1puBg7SHbAjpO8CRZ19HIB1fXxj3iRl9ETQGWurlPVsUOS8+0f63RZQAUwpZ+U+3q3K9fDh1cyjAYeXvdGwb/ljQ63WOEXu0hE57GTquqn/jYhZ/fA5eDNv4GEDcNffcV+ymX4nVnqvvsbK6zv/fOAciZxKv/eDHyuYCjO/65KxWiNHVP0XbwFiqIob9cO7Flf+uj9PV9qeE7ayrp01nH0bdbnV8ud0F9F+q2kXI339pSkUH/4sWX1oGImGks8yjyvRbB7hW/8j+9q3jbL6lES6VQpJ2/Etq2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kbjpQDm/DGPTLVu7IFyC0C1MwQhVT8UH1Mpf7XUTfUw=;
 b=NdXWVW9JUdIhYgq0zsACPb4UM6FozdkW1YNBjRQeSvO3TReEbf35MhUnwZKDgYC8pucRB/AduaFh/4vuItw3CNFByOy9HKzRmu+lBJGv4C0uLwwOVzNaGvpg1Z5VxCYD93dqv+wlWv8rcbPvo3qM3hwOyEDFEzGDQtM45ddyayk+z7bM3XX7jl0sUlrEe9mbkMGBzCISVfYLKCvwWBzQZiFzQwzNlm8FTn5Eu+jDTzoow8mnb+3klZORIAIfMkCDQuoHxHSFEBYN3qgl0JBRKn3SLpWSDCEELodhncsgcPuNFUAmLsBoJYwt0+fKPEwVqotRP5dpWx2y9DJZNLS+wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kbjpQDm/DGPTLVu7IFyC0C1MwQhVT8UH1Mpf7XUTfUw=;
 b=RrjvwE/EPOva1VyBKjyzXQtCfv8Qe1gp0NfBvsueQjwH0tPJRG2+JL93U0iXk2+QfiYPne1spdcs4kZZcUzpI706m9wTLbGlUt3tjWCactQ+tzkZ7808MZfurrMPSyUtyUbzDD7CugLPsqBdn8c8HBjkEHkODYrchjsQX2uBvb5Nqgm+6wV2uoDKbjPch1MdO0ypTAJgJmZNqlVRDzNm7uoWaCYdelKFYekkh103J3e0XPiakeoF9A2LmY4eAaOxAQCAff4DnV3KBE7FjfcUOw/qq4h5ha5kpdb0LOQEXw5DmHQg+C0z7dvOUdV3ha2vt1kuaWXuVp93llTfC2kcDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AMDPR04MB11679.eurprd04.prod.outlook.com (2603:10a6:20b:716::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 16:58:34 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 16:58:34 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] arm64: dts: tqma8mpql-mba8mpxl: configure sai clock in audio codec as well
Date: Tue,  2 Jun 2026 12:58:26 -0400
Message-ID: <178041830821.3301470.10155371205174005726.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602093331.1698756-1-alexander.stein@ew.tq-group.com>
References: <20260602093331.1698756-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR02CA0054.namprd02.prod.outlook.com
 (2603:10b6:510:2da::14) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AMDPR04MB11679:EE_
X-MS-Office365-Filtering-Correlation-Id: ed3d43b7-8d17-417c-432a-08dec0c82e5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|7416014|1800799024|376014|6133799003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: M/iIJkfAIThBpwt69VTe1XqwOmaDOWqeqJDB5vvqqHVxp8A3VfsleT2pcyHuv272NIluF1LASD2GuVTFH8AoIyow10qOJzhfmxHDX+cEt3RDKGajB9X+VISdMNhc1+FZ5hVFs32ofIPEKnX+mtlkgWwf+MifxQbBA7tW8QOo7KA6frfUBxN6ALvCHJBDw01WjB1qUMPZeDLYYzt4nGZii228+meBERVahZGCxZvvmAagBYL02sZExQ399rgBYsIMcghnfB3Fv7r+yikrC421ldOoKCzvi4SH+j1bf4SnY6fNrQ6D0F+Qpiqe6KYrE7RkLFocXHj+SegZIh/AHiFGMktZlxa1mDVQkhxrr8ZHEgaI0OvBh0YfXkNg5RAqBCL+9PZahJkdd2P8f5vlPlwRXZnSn+1WvQS4XhNkKcoIjy1JmlB2PLvRyxTmndgEdm8jO7pUk90hlJLklcymrpsBjEpw/lN3yv3SKLvQJMJYGdKWyAr2lYDwyaChXT92784hCNvVttoCpRLy9eJXl4enDOkAx4b8mAQISYIvvmp7aBGDeKtNX9luTCjCxeGZyhdqFIl9EVM5DH/nmODJOBYMm5kt23pXPrGYLF4d9wX4KH59MTbKmjfhJvkvIOs4qrq4p7xC5X2jwSw2bGytEqMGqgIjjyoufcmJyq6NsepYpXoPEL9RUuKq1p8o34kj7T5u
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(7416014)(1800799024)(376014)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UTRvVGhaN3JMK0Z5REd0NFBtMEllTEdpNVJCTVVTeWFralFrTVh6bXhORU9T?=
 =?utf-8?B?Z1NLV0F2Q1BtbnQvM2t1ZWpBQm8zUWREc3pDY1ROb2lwV2xhUjllSXR6Ympu?=
 =?utf-8?B?YTIyeEhTeHdlZ0NFbENTbGtHZTMwRWhXLzVFdnNsb1ZkTElndFlKZ2FhNjBn?=
 =?utf-8?B?amJESFRacjVoclZ2NVNiM2gxZWFlQi9ZV2d0dUU2WnhWNFdCNzIxWHVhSFVZ?=
 =?utf-8?B?RnBsQlB1WFNPQnhxWHFIMWJHSzM3WWhCM0gxRGRSdFhZWVdyQzk1VHB0MU9Q?=
 =?utf-8?B?YWwvMlZWWnJrZitnTldYZ2NLZlZzaUsyalJZcjJDaC8xTWZYVUM1SXRPeE41?=
 =?utf-8?B?OVlRMThmZ1BuT0I3NUt0N2NRMHVlaFN5RnZHRXBxT1JMcVE4Y3UxRW1ST3RX?=
 =?utf-8?B?RExCSEl3dnpEUVc5ZnZCREpNMEVUKyt2dENSTndLS2NzMkpwQmhSZTJSMkZG?=
 =?utf-8?B?VkE1WmRqWUxMTEJqOVZxZ002UkNYTVlmbS9DZ1dXZ3JzemdOcFZoZnRjbmNQ?=
 =?utf-8?B?QnRYZVlvV3dUNnRwRDBKcnVVdVc5TUloS0tXSVI4cVZKdkdiUlo2elZjYTVt?=
 =?utf-8?B?RE85c1ZsZUlUWEp6WHQ3SVc5MzVDbjhiWW0ySWd5NmVwWHF0eDJRNTQzZU1P?=
 =?utf-8?B?NE1kQlRlOThBV1hLWTBQOXczRmVjdDJYKzE3MTdJOW4wd2QrM256b3NwL3pJ?=
 =?utf-8?B?dzBmUmdieTlwcklZSTZKTi8wZWZLVGZ0Q2V5ZkFPMzdGbGwxR1hRcktJc0NG?=
 =?utf-8?B?RW9zVGdnMmQ2cEdkcnhJOUUvNEwvN1RSWHpVMElZOXV4SGFZeng1b2JudERi?=
 =?utf-8?B?L2lkbm5zNVNJOUl3U0xESjVudHhsYU9KSDJhV0M4NmtSTi84MDJJUGhKdVcx?=
 =?utf-8?B?Qjl4RHB2WWlrK1hxSVBUSVdXOXgzU29QNFA0cXZ1RTdDMGdrNWVGU1poeWF4?=
 =?utf-8?B?Z3VyMG1GbU44YVNEeEZGL0RaTUtjdnI2WUNLWmtzeVh5US9kM0ZnTU1aTmJZ?=
 =?utf-8?B?SDZISFkyM3Q3WU9vdCswajVKUG1kbTNob2RPdHV6K3pjSVA5cytaTXlkU1FP?=
 =?utf-8?B?Vlp2ZkR2VVE1MEJxeGVrSWpURDB3REM4aVpVNDNPR2UybDAyR3ZFMENaVGFM?=
 =?utf-8?B?K00ra2tQLzc2TDEyOGhpWkhNSXBWK0oyVFA3RThZZmx4cDJIN2Vzb09PTWxU?=
 =?utf-8?B?YXlLSmkvU2NBdnQ2eFVtUjhaWTdiWnhxWnJLdThyblJBMDlrOVVSRFlkaits?=
 =?utf-8?B?TzgwMCtjcStaa1VNOFlXVy9kTFJFczhhdFoyMGo0alk2czF1ek56cC9tL1hG?=
 =?utf-8?B?WU9TdTloSXNiYzFpOFp3RmtlUkQvcnpMRkpmT3N6MDhpN2FXRTdqanpMWW4v?=
 =?utf-8?B?THNMalByUDUxS0RYK0EwNHRvN1ZTbzdpUTFueEtqd29TZ29wdUhtbVF6dktX?=
 =?utf-8?B?d254cHJIQnJGWGwyNkZvcjlnQXNURUxKMzdzRWJoZkZudGxQeU0vbW9XbEFP?=
 =?utf-8?B?Sy9BZVZZTVhDTS9MR0ZraDdxanF3WHNiaXR6cUpmRWJJRGROSEMyYnV2NU5S?=
 =?utf-8?B?bDVmL25STDNuTm1JWXR2eDJ1dGFtNU9IdXh6WUpZOVBlcHduY3RBam5OSDFC?=
 =?utf-8?B?T0VYd1F2SDdGYUdIeGZBYlN3aHdHZDQzK3hOeUJlT2FkSHNINDh5eTVWc1Fz?=
 =?utf-8?B?UHVTRUNmejZBWXVKckxZbnRTRElZTEJZV0NROHp3bWJyczJ6eFFOMW1sY3BQ?=
 =?utf-8?B?NFNyT2NPa3BWcWZIdW9PVjVDMkZYZHZLSzRmTFBsR2xMOC9haFR0SzY4ejFo?=
 =?utf-8?B?M2RBTWRIMW0wMXFBSzgzRE8vZ3Q1SllIelU4ajZ6R3hhNXZ4NEovcVA5dWtu?=
 =?utf-8?B?eHZ1Tk1wMFdHSG9maXNWVjNEc0xuZkt5clF4UzFlczAvVzNzVDM4UjFiK0k2?=
 =?utf-8?B?TFNoYWRsdHRRbnVTaHMvWlMwS2lqeHdMV0hWRnBZNmRiUHR6aEFnZ2owSitv?=
 =?utf-8?B?eEM0ajExa1JzMS9odGgrYTM1ZkEyQjRmKzFkeGVrMmplWGtIK2lYVk0wWWRl?=
 =?utf-8?B?MEdSLzkvWk1ud3FUdG91ZG5FTUt4OGhNZ0FaVTBqUXVXZTlVNlVCODZ1N2pi?=
 =?utf-8?B?ZW9wZFJJOGtoTTJzRTM0LzlUK2M0WTlkclRNWEtEamxwQzNGbnJzVjJTV2JL?=
 =?utf-8?B?VGwvM1hSNmJNYlRaUkZhZEc2clMzbU9nWDF3aFdoWXNIbkd4NFpsYkJtVXRm?=
 =?utf-8?B?azF3a0gzR1YzNEdZalJwVkdELzZQVms0M3c1aDROS29lMWdvanR5d0NHUGpr?=
 =?utf-8?B?QWRHOXoySTVsaXJDc1M5a3c3ekpoTXF3QkV2alFLV1MrdTlHWVN6WFRqVk53?=
 =?utf-8?Q?bDOIr0hNbwmQhFeo=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed3d43b7-8d17-417c-432a-08dec0c82e5e
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 16:58:33.9554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QvEoDZLXB2YUgqexmdiUTZEmFrMBTTWVyKvq6IEvVkYx32ZvolhjIaIk3Mkif3XFK2Z7udNdKoXuPYvGKQHEqv8nvOr6q5asZ3HRHrlJ0+pumqjYY52BirXY0MAfE+IZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB11679
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_095837_755894_3F74ACA1 
X-CRM114-Status: UNSURE (   8.73  )
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

From: Frank Li <Frank.Li@nxp.com>


On Tue, 02 Jun 2026 11:33:30 +0200, Alexander Stein wrote:
> With deferrable card binding the sound card driver tries to
> get the mclk configuration before it is setup in sai3 node.
> Fix this by setting the sai clock config for the audio codec as well.

Applied, thanks!

[1/1] arm64: dts: tqma8mpql-mba8mpxl: configure sai clock in audio codec as well
      commit: 639befd1dcc566e11686b28cc943845c633260ed

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

