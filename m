Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14695D5B16F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 13:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QF/nYVSLTT8AubA2AKelKbfjw2P+3+qJYblna1T2Z9Y=; b=lIUugU7wXQZBd6uPMWFPA4M1cY
	cunVtjAsdo6EiBtPCVHVEIE1xz18lp24cukWnI3YkKalbJuPZew58kdQc5drmEjrdgIq6Mctqj4D9
	yowFLdbF7HrhYiZ6ZPj6BwNkUuSf2mP4gueUUNHOjNkIQRpeeHU4dejDdK5dLeOBflTvr7WBLV0qL
	ge1TaC2qFFfgRum3JO9NExfbSwYx66V68v8g8mQ/PXEJ3Bkr63M6e/dt8Er97HYmuVh8zzMOleG5U
	z6d9wdtqNEfvtLp1e4qxT5OrFpav46CkAU8JGzP8vxI2cX9bg4JGPKGKhOSWIPdBKTUpyHRqY3nHv
	ifVTrvwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV8XT-00000003gSs-3Jiq;
	Mon, 15 Dec 2025 13:22:59 +0000
Received: from mail-westus3azlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c107::1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV8XR-00000003gSU-3iBv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 13:22:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nOJyh1ygFUepp5t2mza0EA+94daUZZfSj0KZhSFyct0y+rp5Oyhp76Lu6zTdYg2r5nsqrh6jeKE9S05sm8tDJ51qB63U/Ri1dWv60Zn6k2nnFo90DrWmDnZGmdCBRcDiaeIREG7vi23WLJxKcGx++PZfTn02SRLgzAbKQLpMe0b1cvjWvodrcGBaxsdQ6NQJAtv2sXKArHkDLW7VIwdQb3vv2SNNOLzDWKTPsl0SdU2ZE7gG508FlEAbNNcFx+NHXdmGubDKxXZlHtHV2IWERl7SijbiKNi4sAGbkH9VlXVHrl/176CIblodkgQVA5P1GVbF52CnRgX3OY+fphfcDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QF/nYVSLTT8AubA2AKelKbfjw2P+3+qJYblna1T2Z9Y=;
 b=IDrCWWWj56xaaXASLUoj1NamNo+ror3e31CodFXng0qGdImOo9SK3lKJSTsccNRvCQYE2LO866K98qj4n4DzPtrojcqGfL3evpQj33YNRInDLEUgrIWecaXH6f3nUii/IScsyk1COzNawbJ+5xjSX1XebSpJz2ZDtwO7dpOjY9mkVpXrhqLByUGQ2OZqbIcd3WE+RPMnDmAxhpSG1qzMsKXv4inQIFXDKH9JfDW9FjsKr+9C86A5PIyLtFBZk7h3YZBzWTrwJ7YfeSGr2EHQTHtlShAjtM1sFYaPuXroeBwRh3zC3qB/Zpm0/luWfWcxsVX9hU/Zmal222tf6b+RqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.phytec.de smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QF/nYVSLTT8AubA2AKelKbfjw2P+3+qJYblna1T2Z9Y=;
 b=YUzZ12lgeEMCtZ3/zjL6g7DtSaJZnc4SN1TvITLVzMHASfi+Co0Wk+/zycn51WVE7f43pTupPHbbsx+MqKFlTKjy9TFnyJ0ob/J58HQZH86iG1w3CHawlYpiWn8FsHRnCm8eymWdC4He0JMeUO7ydwv4/VwVdRMuI6h7Eo2f3yk=
Received: from CH0PR03CA0087.namprd03.prod.outlook.com (2603:10b6:610:cc::32)
 by SN7PR10MB6643.namprd10.prod.outlook.com (2603:10b6:806:2ae::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 13:22:52 +0000
Received: from CH1PEPF0000AD80.namprd04.prod.outlook.com
 (2603:10b6:610:cc:cafe::8e) by CH0PR03CA0087.outlook.office365.com
 (2603:10b6:610:cc::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Mon,
 15 Dec 2025 13:22:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH1PEPF0000AD80.mail.protection.outlook.com (10.167.244.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Mon, 15 Dec 2025 13:22:51 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 15 Dec
 2025 07:22:51 -0600
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 15 Dec
 2025 07:22:51 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 15 Dec 2025 07:22:51 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BFDMppT2423716;
	Mon, 15 Dec 2025 07:22:51 -0600
From: Nishanth Menon <nm@ti.com>
To: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <ggiordano@phytec.com>,
	<d.schultz@phytec.de>, <rogerq@kernel.org>, Wadim Egorov <w.egorov@phytec.de>
CC: Nishanth Menon <nm@ti.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<upstream@lists.phytec.de>
Subject: Re: [PATCH v2 1/3] arm64: dts: ti: k3-am642-phyboard-electra-peb-c-010: Fix icssg-prueth schema warning
Date: Mon, 15 Dec 2025 07:22:49 -0600
Message-ID: <176580496018.1685064.13129316484547928618.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20251127122733.2523367-1-w.egorov@phytec.de>
References: <20251127122733.2523367-1-w.egorov@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD80:EE_|SN7PR10MB6643:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cdb7baf-df54-4682-52a1-08de3bdd0ca3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RDNaeEZMRUV1R2VQRnNzbHRybUZ4SnpiY2xnaDUySk5CaG56ZUhwS3hOakln?=
 =?utf-8?B?cWZWY1AyS0xpc0FNdTRVc1p1T3kzcUl5Qm5WZGtyRHFjQTBqTnJGTlB6STdP?=
 =?utf-8?B?Y1hWOElCdFNrQTBZcVpnbE1DT21OQ2t1bDZRM3NDUmh3MjBxY3dTR2JaSjFD?=
 =?utf-8?B?YTByRmJPUE9hTTdWOFFKOUVyMTU3VFNla3VPV25yQ2RVMHQ2Sm1SUTVOTzJO?=
 =?utf-8?B?ZGZFQ21ubSt3T01HbFUwNDRveFcxbm13Sm45RFF0bnpLVGxzUGllZ1NFdU42?=
 =?utf-8?B?cldCYXp4aWJ3TTh3MFJrVndxbmgxM0RWRjlqL29kNmpURElvMlpXeWJTTUIr?=
 =?utf-8?B?dzd1QUZzVFk1VTYvOTRuOFZOVUIrUVFHektTMDk1YktGTThia1hSTjRvYkpk?=
 =?utf-8?B?VTVVYm1PWGdRMnN3R09GZ0o1Q2hEaG85TDFYUDdkQWVkUUd2TDJGb29HdWRE?=
 =?utf-8?B?aHhKWEp5Qm5Welk1cFJuZWxYU0RlUkRIbGhHdS93cVovWXpGVWhxbS9nRll0?=
 =?utf-8?B?dnFxT1E4TDRITnhVdEZWa3ZaWTVMenY3bGJGdnQvZXVXVTVYQTRzR3NMcGpl?=
 =?utf-8?B?ZnNhZ1c4bC9GZGV6bWM3ZFhKVFJpdmJBNmt5R0hDUGdWYlp5SGkrSTg4VEhH?=
 =?utf-8?B?QW4zT09lZUFUTjNleklxK296TjhjZk9zdldWK1gxa0lKY2NLTXl0bHVYTk9L?=
 =?utf-8?B?ZGZxS2dQa1NxM0JCVEJSR1lPcUpUeXJaOVJ6dGNzN0o0aURnSnlCSmZmWkxH?=
 =?utf-8?B?dlVBUXVRS1Zid3V4V3dzb1RRbWVwa1ZtUVpyamZmVjJ0a09sbWlpVTdkSitn?=
 =?utf-8?B?SHU4S3c4RFZVVXk0aWRNcGdBVUcxa3h6bG12Snp5cHhQVS9EUExmdHpKL0oz?=
 =?utf-8?B?T3pXZkRLdDVhUjZQL0VpaWp3VzZMMjJwakRtbmEwcVZjQnVPNVJENWtTcytJ?=
 =?utf-8?B?R0dHL1A3cCtBT1dsdUJRMlovYW4waGRPVWFGOEZkdE9RMG9ERXdTTXoxS3hO?=
 =?utf-8?B?K2l4MHRBZmo5cGJqZVNsTmIwdjBYcVc5UGxNdXBJVlY3MjFGNFlFRVI5RTNG?=
 =?utf-8?B?QXJ1OE1kTDR6VXMvZmh1WnJXUzFjbEl0UEkrQnk3NTEreE02OWU2M1pBMHNi?=
 =?utf-8?B?dmFzOTJtM2JXMjVzSjZvRk11ZU5kQWdKc2NjN08xcUpSbzBNdjJZdWduMlBE?=
 =?utf-8?B?N3BHUjNQUnVZRXZmdFgxYUVMcjhvRld2VjVWcmxvbHZ3OWFUMGpsZ3pRV3k2?=
 =?utf-8?B?dUhpaXRaWkxzZnJza2F0TjY5N3dhbVNna0JtTVZFNkhXVWYxMzV0dDYvLzM0?=
 =?utf-8?B?Rjg0WTVQZGFYcSsrdXJpUk5ySEczd2NTNXc0K3M4KzNXSjZQWTdCckphSEd5?=
 =?utf-8?B?anpWWVVSSXhzeFRGb2w3cFBVN3BqdWxBVnFDdXZtTTJBR1J3NnpoaHJBTmdw?=
 =?utf-8?B?RllVVHh2STdhbHZLMlYvelZxYTVLNGJBTlh6aHVUMmZkVCs4QUZ3VERoS2E2?=
 =?utf-8?B?UjhENDc3OCtVaXVFMlBQZFUwb3gxK2VGUUIvOGRmS0kwMDBSSkNOemswSlNL?=
 =?utf-8?B?Y1k4M3lLcS9tSEFveVBjd25SbUlGaU1IeHB2UjNvbElSN24vdFlMRGRXci9V?=
 =?utf-8?B?ZEFhWlpuV2ZuUFBRUnFLcFJsRmVuT3Bydk5yWGdrTVVjU01Pb2lBRCtTLzdG?=
 =?utf-8?B?R3RnNUFuc01tQldlbnN0ZEcydkNwN1JuQS90OVBkNzU5WWdxLzc4WkNHck4y?=
 =?utf-8?B?UjhtcUJVelROL0VwWHU1bU5XNi9PZVBuUmc2RER3UGxxbElSVGRNMDk2OVpC?=
 =?utf-8?B?bmxzcUE0VTZjMUZ3VE5HckN4cHphazBPdTV0Z0Q2VHdCWitrYkVlM3pYZk14?=
 =?utf-8?B?U3ZVL0dZSVQxT3JqNEFIWTBUUUxnZ2tOc2FXRWVpV0xKaHBLT2RRVGFPZ0ZG?=
 =?utf-8?B?UFFMeWlKWFVrMXBPOHFCQXY3MitWbTBRRjRpVDJzcGlvZm1kNmE1TTFLb3BV?=
 =?utf-8?B?N3Iydms2Y0RUWHg1OC9BRzMyNTNFYUM4aXlVaVVLV0tldjY0THliWlpOaWJs?=
 =?utf-8?B?NXVsL2IvWDNzRElzSExyckdEK3RBb0RKbEQxZTNMR292aGlRTjFMQTBUekp5?=
 =?utf-8?Q?IasY=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 13:22:51.8051
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cdb7baf-df54-4682-52a1-08de3bdd0ca3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD80.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6643
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_052257_927826_9B093C14 
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

Hi Wadim Egorov,

On Thu, 27 Nov 2025 13:27:31 +0100, Wadim Egorov wrote:
> Reduce length of dma-names and dmas properties for icssg1-ethernet
> node to comply with ti,icssg-prueth schema constraints. The previous
> entries exceeded the allowed count and triggered dtschema warnings
> during validation.
> 
> 

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/3] arm64: dts: ti: k3-am642-phyboard-electra-peb-c-010: Fix icssg-prueth schema warning
      commit: 05bbe52d0be5637dcd3c880348e3688f7ec64eb7
[2/3] arm64: dts: ti: k3-am642-phyboard-electra-x27-gpio1-spi1-uart3: Fix schema warnings
      commit: d876bb9353d87dee0ae620300106e8def189c785
[3/3] arm64: dts: ti: k3-am62-lp-sk-nand: Rename pinctrls to fix schema warnings
      commit: cf5e8adebe77917a4cc95e43e461cdbd857591ce

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource


