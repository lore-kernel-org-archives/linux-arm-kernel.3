Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51EADD1D478
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 17:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UrfwfvAv2HDXKG0WaVq9sLaw+JKFPJ7A3yyPnqRN6xc=; b=cnxrPY9WRIO46od9ePObLi8g+O
	x1QBRQxs5ZvCFBNMNds5uHE5XtsQ8xjocsVYcpjnqh1/jKrs+Pi64ucvZAvm10DwYd99qrcxMWilF
	Wuhu2gCKJcVQ2QFnjyzzQTx+pmn1sCOXHXg7zTSvX+55Q0Hky603+HDEb6vpPeq7NyllCrnqpG0F8
	58OfaSrZ0CyWEBFP6LAiKtsm/c0koy3hOM3SVb21bw6BUNtuaqbgF8K/upaUmbM6MHTvONiDEcN/T
	oUTf2mLNFZ2QWmkHwxaxQTxL5weePKSN5XQ7g8skLiO0pZcCx7KD9wyqzsRM57GhEamGVuyLGeffX
	DhiIds/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtSU-00000000III-3Zfh;
	Thu, 08 Jan 2026 17:06:02 +0000
Received: from mail-southcentralusazlp170130001.outbound.protection.outlook.com ([2a01:111:f403:c10c::1] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtSP-00000000IGJ-4AEh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 17:05:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P5V7+fJ4X7CWNu09qujjiUiDtStFCUJPUqKgR4w+MjunEnJgumU7o+J2Eq6jPokj21ed/mJs4q8Zya1pny+H8YPI9zMx8VdVFSrbmw1BKwwICMGFM0AkoSVaul/BdxglJKSrnjZdsyjuXSaaABV98jlSxGVSWpeKC12mNaiOIOe1Oi4BmH7u+flNrG4uzZo4D7zZxtD2WJxRE4TASEu9OyP1jq3iuKtS89mVabEDYCwvheF8/auTHXpkT6BC0Nvjh3CXkiejJj7mRYfhWixMsv8T7oJDmRj+mC+uO/nv4E4//2y3hbDAbWNQMbjGHFWsxIOO8fcHnyY11BHC6aDx7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UrfwfvAv2HDXKG0WaVq9sLaw+JKFPJ7A3yyPnqRN6xc=;
 b=khP5bx4sC+lE/dkKVJkvj2DX1Oz15Xvw87UWCD92ySuM7WRcV+1B/WnCgsgOo3siXh3D4GjLJC/e4jYBaLhyHNrZ229NOIbTxyNK/IidSV8sFQ+BHzvQj1U9agZNOtfU2cEPm2QGN6/B/54eQpQG+iOj2SnrplEg9NvN+pIstio11O7Xs2PGKOqrfyV5/2DLqGAC3xXjKhyH59TSZruqmNw8lCPmWZcu2MSqh5gg/7dMtppLFGIATiHQGrfsZ91xSnac6bXlfmrFRfJTCx73Lq05rwzACmys3rMxbV5/L5oaI1YXswiUinDR3szwoOnIWBRD/oFvGbuSKpGpH6uAtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UrfwfvAv2HDXKG0WaVq9sLaw+JKFPJ7A3yyPnqRN6xc=;
 b=YfynRAZm6O2ZqC/fZy1lslSHueLU0HlBBDQQltTR33sZ+7EeavebsYo2qNPK7TIUkqmtBK4idkhyUNc9tg67X8hzvDU7zHj+QXNcXYk14B0hBGQbct+HPnUXSfsNmMK9g4AJoTrJVrGky5N3VFLM1Ca/t0I1W6UvwnkRi6ROVGI=
Received: from MW4PR03CA0216.namprd03.prod.outlook.com (2603:10b6:303:b9::11)
 by SJ5PPFA7D84DD83.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7c0) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 17:05:52 +0000
Received: from MWH0EPF000989E6.namprd02.prod.outlook.com
 (2603:10b6:303:b9:cafe::c) by MW4PR03CA0216.outlook.office365.com
 (2603:10b6:303:b9::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.4 via Frontend Transport; Thu, 8
 Jan 2026 17:05:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MWH0EPF000989E6.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 8 Jan 2026 17:05:50 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 8 Jan
 2026 11:05:46 -0600
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 8 Jan
 2026 11:05:45 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 8 Jan 2026 11:05:45 -0600
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 608H5jC22820132;
	Thu, 8 Jan 2026 11:05:45 -0600
Date: Thu, 8 Jan 2026 11:05:45 -0600
From: Bryan Brattlof <bb@ti.com>
To: Kendall Willis <k-willis@ti.com>
CC: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Dhruva
 Gole" <d-gole@ti.com>, <vishalm@ti.com>, <sebin.francis@ti.com>,
	<msp@baylibre.com>, <khilman@baylibre.com>, <a-kaur@ti.com>,
	<s-kochidanadu@ti.com>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/3] arm64: boot: dts: ti: k3-am62l: allow WKUP UART
 wakeup from LPM
Message-ID: <20260108170545.cfez6dvwkft2z3jh@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20260106-wkup-uart-wakeup-v2-0-fb4cbd56c827@ti.com>
 <20260107164504.ehvbfizg7ybbvv2e@bryanbrattlof.com>
 <c7dfe4a3-1bf5-4e50-b4b7-8752aa9ef1f5@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <c7dfe4a3-1bf5-4e50-b4b7-8752aa9ef1f5@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E6:EE_|SJ5PPFA7D84DD83:EE_
X-MS-Office365-Filtering-Correlation-Id: d32eae13-3565-4617-689a-08de4ed82c9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|34020700016|82310400026|36860700013|376014|34070700014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NHpOaGRBUURZMG84ejN3R1NqeUhUanR1SGRIbGFwd1RtOVZJQm1kOHB4dnUx?=
 =?utf-8?B?OWhxZUk4RXRvRll3T3p6SzU1YjBkUTN4c2dCWEp0WSswWDlGRTJua1hUb1RQ?=
 =?utf-8?B?YUg5NGViRlJtbnFrbVFBQ1g1LzdoWFl4dnNvNFNYWlJzSzVITGw2TTR1b2Zn?=
 =?utf-8?B?eEJ0Yy9NMUM3UmxCQkdXKzloc0tiQzhVNDkzQmRYRFNuRVdYWmNUbUVwRUtW?=
 =?utf-8?B?Z0xrbTVKRk16bEpwUWRkbjRmSStscjBZZXhsdFlmRkp0RmZraGVrSlk2c0N1?=
 =?utf-8?B?MDFRZHRoeUc2RHFheHdHeW0ra2p4QmpIMzFSUnE3NjRTZ1F2WEplc2REcEhn?=
 =?utf-8?B?Z1o0Vk9xR3Z3Y1ZkQmFGcGMxL2wxMkswWDBwbmxYM1FZWDd0Mkc1bXVzdXJJ?=
 =?utf-8?B?SUJYNm9aTUFZaDh5Sm55aGpncXIxSzlwdEg2dHd1RENweGZDRTN2dTF2dS90?=
 =?utf-8?B?cGFRMVovK0o5WmRqS0crSVQrMHkvVVk2REdZWllFRnh2eDlQSUlxSklvdEI2?=
 =?utf-8?B?emM2NWl1NWVJbE5PM242QlFpMlFGaXdzVXNSaEYwM1hUODdOR3ZEY2lKam0y?=
 =?utf-8?B?VU5XVlFkbWF6dTdMdzNHNjJwVU1zUXY3UDk4QUhHU2RhcVlnSzNTeUZDRXJU?=
 =?utf-8?B?aUp0aWw0THkxTjZQNUx6TTNsaGFCdFhyNVh5bHIrT0lZZTlobjlXc1FmdkVU?=
 =?utf-8?B?TFMzc0tSbkJDQWVQMHd0STQ3eHU4a04yQXZhb1F6ZCsxSmJiTjBqTVVvSTJn?=
 =?utf-8?B?V2V4WlE4R0k3aFQwZHB6MXpXQ05IMU5Mc3VEZG05VCtuQXBPNnM3b1VGTnBI?=
 =?utf-8?B?VytIY0JUWjBuK29wdkc0dFBJMGY2K1h4TWc3cVZ2T0tkTStKZWdjeVlOd1Ey?=
 =?utf-8?B?eVJkRW9aamJjaFBqUTdiYzRJcm1OS0dKdVA1TXNBRXJTQVpvQUxVVmtkOGNH?=
 =?utf-8?B?Y1VWWllXT3NOTlJWWkZwUkZaTnZwM1dPVzZxVWpSNkMxSzI1bWIxVmRxVWRy?=
 =?utf-8?B?YUZNUGdaV2tCSmVxSkZraS9DUDFvaVB2QW04MDB1UVhZZFZURXVDa1FLVUJ0?=
 =?utf-8?B?TFZZZjBFZytaL1lCamFMSFp2WDFKWTlVRzZOVnRSd0gvRXZYWTA1K0F0QjBR?=
 =?utf-8?B?VzlVSFFWV0xDSjBYQW1pTXltU1U4VTMyVUZJTlpMN0tXQzJxSGlDc1YwL2Qr?=
 =?utf-8?B?aCtJZXVsakxtR0N4THR6T1F4a0NNZ2Q1allBUHc0OUlBcElEQVZjR3lySElB?=
 =?utf-8?B?d09KaHU5UEY1aHVrc3piTTZXU21VRWkxbDlDaGk0V2lmNGxjY3lFVUl3bU9a?=
 =?utf-8?B?TUhkK2hJV2FUai9hTzZxaW40Z3JmcDJ4Nm82SjJsbGs1aHp4OFEwS1BHb2VP?=
 =?utf-8?B?UXZ3SkVjYi8za1ZKWUtTT21zVFNWbjN3WkM1emhMeWdCY1FZK3dicXFDYTJM?=
 =?utf-8?B?Vy9WbzVhYkV3WWJ3WkwzckZScWFnS2RwNXNxaGRMOHZsQWRzYngwRmFNQkFx?=
 =?utf-8?B?aVQ1Rk1PNWdHeGRRc3J6SHk5Wkh6a0dLNE43MUlKWk14MGt1aWVGMWVnUkVI?=
 =?utf-8?B?dDNNTnpRS0JwOHZieGkzbk1ISXV3M202b1dSak96MWdFL2d1aTBYTzMzREVR?=
 =?utf-8?B?UUU0UUNSTExvMkhTcVJFVmxFdFNWVnh5dk15czYvRVpUMElWM2xXTXdnWmEv?=
 =?utf-8?B?S3ZVYlFSZUdrNm5kMWxlbWt3dmc3a3VrOE9OSGsxSTJuRXYrZDFXaHcyTE1z?=
 =?utf-8?B?d3VXWlVGVFMxY3krMHVLcVc1V1N6SUltRG1zN0R0Z1FkNUlZZkd1aTVUQkEz?=
 =?utf-8?B?WkxqRVh1MzcrTzdDRWhudEpZWGRBUnowSzZRMG52dFZrQURvWU9Gdno0QVZZ?=
 =?utf-8?B?OW9yRFlXTlB5OXBEMmZ2VE1TWSt2M3h0dDA0YWt6Y0ROV3dKOUV2TEx3dFFQ?=
 =?utf-8?B?eDRRQkJtZ2tmellsUWcyUnN0UTVjQnM1OXc2bDJnUjc1ZDN0bWtvQlM4QjZ5?=
 =?utf-8?B?bktJdmVWVHBTVUVGNmkrckthTUFRZHR0WlprZ3ppTmV2elh6a2hVbkFzaTBS?=
 =?utf-8?B?RVhzWC9HcmEwb3BNTFlIcHpjK1lmSkpCYXdrQWhmMVpYRE1yRWRkRWk5Z3Rp?=
 =?utf-8?Q?ZeFA=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(34020700016)(82310400026)(36860700013)(376014)(34070700014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 17:05:50.0173
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d32eae13-3565-4617-689a-08de4ed82c9c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989E6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFA7D84DD83
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_090558_032225_81B314B5 
X-CRM114-Status: GOOD (  21.03  )
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

On January  7, 2026 thus sayeth Kendall Willis:
> On 1/7/26 10:45, Bryan Brattlof wrote:
> > On January  6, 2026 thus sayeth Kendall Willis:
> > > K3 TI AM62L SoC supports wakeup from WKUP UART when the SoC is in the
> > > DeepSleep low power mode. To allow wakeup from WKUP UART the target-module
> > > device tree node is enabled. The ti-sysc interconnect target module driver
> > > is used to configure the the SYSCONFIG related registers. In this case,
> > > the interconnect target module node configures the WKUP UART to be able to
> > > wakeup from system suspend. The SYSC register is used to enable wakeup
> > > from system suspend for the WKUP UART. Refer to 14.7.2.5 UART in the
> > > AM62L Techincal Reference Manual for registers referenced [1].
> > > 
> > > Previous TI SoCs configure the WKUP UART to wakeup from system suspend
> > > using the ti-sysc interconnect target module driver. Refer to commit
> > > ce27f7f9e328 ("arm64: dts: ti: k3-am62-wakeup: Configure ti-sysc for
> > > wkup_uart0") for an example of this.
> > 
> > I think I may be confused. What is setting the pinmux for the wkup_uart
> > to allow us to trigger the wake event? It looks like they reset to GPIO
> > pins if not set. Is firmware doing this?
> 
> On AM62L, the WKUP UART pinmux is initially set by TFA so that it is set to
> the UART pins, not GPIO. The target-module node sets the WKUP UART SYSC
> register so that wakeup is enabled.
> 

Nice however should we mark the UART in the board file as reserved for 
TFA or is it free to be used by Linux and only during the low power 
modes after Linux is asleep will it be used by TFA?

~Bryan

