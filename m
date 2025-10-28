Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94862CCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 21:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=e/Y1W31NfCvbQutoCV7/vpSp31y3fdqnUiQ6y5E6VJE=; b=VRnlKCvvmliziggnOVD26/N7FU
	iDLu88fZ0ufcX4+tfrOXBrxgaQmSa3hZNmx+k2bVTL5/2M+i68WljbybQiOQAhb44qlbgM0fsjz5w
	jg8zmp660nfx3b7S70QrhTE2/1+KTLHqNn9vHpWZiZjX7BRrK30lYCFRwrIKyCawd5tf+i6K5KCn6
	Bjtx5e3rB0N30aS7Bsg9Myzh88SIbR/HhEJPZwHX4VB6w56hHecGXi3robjJ3veOA2g1ttEO/4nft
	uclkNeVp82KitBaltandl1/gYaKQToWZ/iWnTQh3D1KDvtbjvlCM7BUdnRH837aowO88DkgUhdOQS
	rqDB7Vhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDrNk-0000000GhhT-1vDR;
	Tue, 28 Oct 2025 21:37:32 +0000
Received: from mail-westus3azlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c107::1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDrNh-0000000Ghgp-1AfD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 21:37:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EGWRf9fIu8tk7gOO/owNpurmsTkTa8gYGLM6PCl9YTJnIVCUDoIUQwye5yoQvI3uI1YuxA53GQIaPpqkpQso09SVQ6anBIIHe0Vtr15TNl7wzXB66W0oDFKzKHI6zpEiae4EOVpCjXhLmbl1CHxh4dzI64i9QhlrUTQoOSjlWf2QloGyU9iwbLW2ZpL3Ocht+a7i+aD8rLg7vf/sIwag/noQ9x6+QXzzV5MqVcy/LzrQVuQfjorH2k7sQB+m9p1Z75D+3KTQ22feswHiZ56Sy3PpLf1bUiSr+XRJiWMUJmGEdSSS4a30SGxZHOsHtXaIn6FSrHp9tyh5w+GhN3g03w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e/Y1W31NfCvbQutoCV7/vpSp31y3fdqnUiQ6y5E6VJE=;
 b=jSn7c+GLtWIWT4XDq/RdeSodC4a/eMwijS/PKBFMCuar40NRcp9KWiMv1NY8Vy2Xr7seqnmo2E4b2I8aLCbID1uh1sfZmtkPObPE17tvU1hyRlX6mk7TOhY1eOcibRBc4lLvJdZ9zGaLxUPROHp++2AXb8bhOlPtaKB4LvG8PRmJMiAVBZaVe134GMTSaaZqGWW784anj5QiYmA83y0oKPzaB9BtlRFmVTNDZ/I969L6iLwdEfuqIkadF1FvKtZUVkaQlS+2fKxX1i1DEj/lNVu+h5eDSZlvzpeK3MM+I4ml2UDSGXVeUF4TJkAXSDgY5u5MFczk6ncOlO7C8V/G1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e/Y1W31NfCvbQutoCV7/vpSp31y3fdqnUiQ6y5E6VJE=;
 b=mDU01qTttW0Z9j/kYx+cuWXHJr+q8guKaSNL+LB2z8G6FKUMLTmXfexjeIqrPHVt+bsPSkzG6mmZhv6kbCQBqzxU6rsgGhCMVOidzFeB1Vy6VRp5tBOPzviwTpdEGTakJAoaInzFr2P5M0GC3v2FK1xKGmCO3LMmJU/A3GgtBrw=
Received: from CH5PR02CA0002.namprd02.prod.outlook.com (2603:10b6:610:1ed::14)
 by SA1PR10MB6341.namprd10.prod.outlook.com (2603:10b6:806:254::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Tue, 28 Oct
 2025 21:37:23 +0000
Received: from CH2PEPF000000A0.namprd02.prod.outlook.com
 (2603:10b6:610:1ed:cafe::7f) by CH5PR02CA0002.outlook.office365.com
 (2603:10b6:610:1ed::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.12 via Frontend Transport; Tue,
 28 Oct 2025 21:37:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH2PEPF000000A0.mail.protection.outlook.com (10.167.244.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Tue, 28 Oct 2025 21:37:23 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Oct
 2025 16:37:20 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Oct
 2025 16:37:20 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 28 Oct 2025 16:37:20 -0500
Received: from localhost (ula0502350.dhcp.ti.com [172.24.233.249])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59SLbJo32949068;
	Tue, 28 Oct 2025 16:37:19 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<khasim@ti.com>, <v-singh1@ti.com>, <afd@ti.com>, <bb@ti.com>,
	<s-ramamoorthy@ti.com>
Subject: [PATCH v2 0/2] Add PMIC support for AM62D
Date: Wed, 29 Oct 2025 03:06:43 +0530
Message-ID: <20251028213645.437957-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF000000A0:EE_|SA1PR10MB6341:EE_
X-MS-Office365-Filtering-Correlation-Id: b7cff15d-47a3-41d7-d086-08de166a2e66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013|34070700014|34020700016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z3IvR0xkbVhEdFg2eldWVmpST2paSkEyU0VKckdOVFlYR1UrYzlTMHI4bGhv?=
 =?utf-8?B?VFk5Y3hlbm9XMWdObThtVWMwWHNQQzlJdmhmZnJLcTA1aUc4SmdyMVFNWjlK?=
 =?utf-8?B?SWEvQmdXVE82eXl4SDY4YnB5TVl5eEt5V2hudWdjdGZvdTJOUUJHZHYzWDlz?=
 =?utf-8?B?Zkc5ZmFvaGRLRFhmNTlwcDI2aGw4NWhPU2RVZ09hMEtGQUhTTDg2cmVjcFNG?=
 =?utf-8?B?SGJFbzZDTGdwOXliUTlLampVM2VqK0Y2QUE3VHJtcW1SbXF6ZGNoWkcyVDVk?=
 =?utf-8?B?WDJWV2tnUWlpM3BBc3N0b0xJZDA1bHdlTDhkK1VRTzZiVG9VMHEwSDgwMWdS?=
 =?utf-8?B?dkpxMXQ1RUIwMng3YzErSWdVY2lNN0l4WGtzbTA0S1ZLTmR6MEYxa25DQmJu?=
 =?utf-8?B?emI3SUV6Ny9LZzVPT3l0Q0NybmZWNUFvenpwcEl5VFh3YVpvblJSRUJhL1Rp?=
 =?utf-8?B?NCtNRi80c0VzN1gxUzI2YTA0ZjMrcjU3emVraGxXWXJPVzlGNHpLYktrc2VE?=
 =?utf-8?B?M2Uxdk0xbllKZG1rUDdFbHZrOHRwOHRvWmNCYVdZRHh1UTFZc0wwSGVMbFlw?=
 =?utf-8?B?R0JCZzhCeENWWVp4TmtFNFZGWTZNTDNUVERBUEprYlgwK3RGTjV0clFmUTZS?=
 =?utf-8?B?bVJCZXJrRXMzS2ZzQUU5eU92YUw5SDRHNnhpTk9lYWx1K21MTlFTT1psb3dM?=
 =?utf-8?B?QTVXL2hWWUF4VExjdDIzODEyNmV6Z01wNEw4Z0gyN0d4V2Y2aCt5SnN5K3lL?=
 =?utf-8?B?cVZoODk1S2l1UHR1N3hRajdvOERjWCtTU0syNTVOMjFOeVZoenQzZGpoSm9D?=
 =?utf-8?B?NnhWV3doc1NpcUxuVjNKWXlpbjFYeDV5eGUyMEJWRVgzRlN5cHMrWGw0MWJW?=
 =?utf-8?B?T1Zza1kxTmxLRmhlOUNTeko4SS95ZmZFNk9zK1h1UTRBbTFqMXFCR3UybEdM?=
 =?utf-8?B?bDExaXR1djBURjhwMHhHWnBUMWt1bjdXZzh4WllTYVorclI2ajVYZGhBejRl?=
 =?utf-8?B?UWxXY3B5K21sVU1UY2hWNEZiRnBBeitOeUhhd0F2TjFNWFgzY05hUE9zblhx?=
 =?utf-8?B?T0MrcXA1VjZwUDFOVVR3MWxqcW5rVVF2K1lscFNpaHZjSnVrMi9QVUc2R01Q?=
 =?utf-8?B?dW9FdVpoK1QvczVEUVdidVNRaVNhdm1venNYUFBzbHRDbjQ0SzVJWDJmQXVB?=
 =?utf-8?B?VWd5c1p3VWpPMU0rSGJFZ1hMVDVhSmtWdTJUYWJBZUdpTjNkdHd1N0NuV1Jt?=
 =?utf-8?B?WnNTNzByL3R3SDVtYnhjUnlKay9qYUdKeGhMMEErT3FOaFlMMVVsZE00S0d6?=
 =?utf-8?B?RFBwL3dTa0hEUWFTVHJSL1c3V0QrRnRvaGZlVzgzbjFyV1Y5ZzhodlVRZEdB?=
 =?utf-8?B?VFdhQWhWMURZeGVHYXF4aUtUUXVONXdOYVhtTTJuWlh4RFZ4aitlQ3NDN0Q2?=
 =?utf-8?B?MmdPU1R0bzI4amZiNEtpTG5pUG1xV1hHZlJUOUtWMXdqaG1JeHE4RU1nWlpE?=
 =?utf-8?B?bDVOMnVrNmNxT2Ewa3Q4RWNzd3NCTmJPWlhHWEhweWFuWXNjNFVsakUveDR0?=
 =?utf-8?B?VnhzVFgrNDcwYkhBa0RJN0hJMmhHek9MMnN2STBjbjJRKzBwdEJ2T21TU2dE?=
 =?utf-8?B?SjJxVTFSL01DYmR4bHdyM2pRRG5jTEpDeHJrU2syc1lhQTVINjZTUzBQL0FE?=
 =?utf-8?B?K1A5SDE2cCt1UHM2RVZGN1FwcjRvMjNudTdzbjdkemxBNllHNHpFWHhEMWFO?=
 =?utf-8?B?OGlBbmFnT0JvL01XRnJNSW9ka2czdzZlWlIyUkk1bS9kWlJwZW1IeEJxM1lp?=
 =?utf-8?B?SUsvK0NxUTYwOXBVNVJ4TTdMaERQVEp0NkhSSnZRY3hNdFhvZ3ZiSHN1YkZK?=
 =?utf-8?B?SndkT2xxZlcvZlUrbGs0a0Jtd0NhNGl2Z1dXZGxlc3UxREx1QmYwTi8vOUpu?=
 =?utf-8?B?amhFV01SMzNUV29VWUZqN2YyQ0RCVHNjZ05BYkZIRHlucys1ODZXRWpoUzZ0?=
 =?utf-8?Q?5luV4d04aU1/GSaQg3aOVkrOCOGJgM=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(34070700014)(34020700016);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 21:37:23.1680
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7cff15d-47a3-41d7-d086-08de166a2e66
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF000000A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6341
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_143729_344269_24274D8B 
X-CRM114-Status: UNSURE (   9.89  )
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

This series adds PMIC support for the AM62D2-EVM.

The first patch corrects the PMIC pad configuration by wiring the 
PMIC’s INT pin to the SoC’s EXTINTn input.
The second patch enables the TPS65224 PMIC on the wakeup I2C0 bus.

Boot logs
https://gist.github.com/paresh-bhagat12/11dee1b07be3019d5f92f893fa11229d

Datasheet - https://www.ti.com/lit/ug/sprujd4/sprujd4.pdf
Schematics - https://www.ti.com/lit/zip/sprcal5

TPS65224 Datasheet - https://www.ti.com/lit/ds/symlink/tps65222-q1.pdf

This also depends on this patch
https://lore.kernel.org/all/20251028210153.420473-1-p-bhagat@ti.com/

Change log
	v1->v2: rebase to latest tag and added cc stable@vger.kernel.org

v1->https://lore.kernel.org/all/20250919032806.707926-1-p-bhagat@ti.com/

Paresh Bhagat (2):
  arm64: dts: ti: k3-am62d2-evm: Fix PMIC padconfig
  arm64: dts: ti: k3-am62d2-evm: Enable PMIC

 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts | 93 +++++++++++++++++++++++-
 1 file changed, 92 insertions(+), 1 deletion(-)

-- 
2.34.1


