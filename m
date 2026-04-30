Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59BB5FF8873
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 15:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CojsJ4BLa4EOtfncJicQx0+aZe4GlU79Gbh3SDwP26Y=; b=gGvLj0xkP9twZGwh/DAGUegCcO
	cEAY6HoU/EawiTGi8ADfnLPsahXQ2Xycg78J73EfCyR8M1F/uisgVCvHhDg3vqBuv4UuQ2vbpguQF
	c8G7IPXlSXLeIcoEmf1oXE3VR2NvxDgawxirpUjEJljD9weNg3XFEPO1JxnWBprG+huWM4rzzx50B
	Ofc3PzbmhJWs7r+uY/X349sst61A3ymSA06BL5p1iTbxHrMzYbE67hisZ8HYp18Nsqdu592+XoCs0
	jLW+eUmAdQ7kTTVtYrEU07iYi8zMv/TyhcQW3ullvA9yii2vLBYhnA4rfQetbILtKvt23cgjxwhAa
	rAhVXA9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wITQK-00000005evT-23jQ;
	Thu, 30 Apr 2026 15:35:32 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wITQI-00000005euc-0N8B
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 15:35:31 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=svfhMHCI+ARX5ffjc5Vt1jLGvvuDNoh6hVS1ibjdBn0mg1t4YxlQbvktcUgYVfk7SYDl/pHcIoHEqnmT+yotITRkc8ELTFT9DtALPgn+MJPJYEs5uIGdWbhGA6MzJZ93G35xJqvKGqSgmtKRlyDzdba6jKJA/PbaoSAcjSuBRMlibFJLSINyl0NFJ5i6Qj5I0aePKvZcq2T9yGQpr2tLnOc7fWccbZA+mpzlm4RlRNjcrj9Kemsn/j/GG4f4cwoO1Umq/drv5aL631LrsGoHEccheUq/CVuBQOW/eawV3XHRt5mYYDUjOKnm186TaTpRnuv5Fv9W4DdF4MJ5ctXPAA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CojsJ4BLa4EOtfncJicQx0+aZe4GlU79Gbh3SDwP26Y=;
 b=DkZ1RyiEDm2jyVXAAjE2o/JEAYzf4ahyim9h21AKT+bO49MG0GP/Rt40aFGQ4QhzwiPZfiTCfMX/dIcgBPYVOF1dBiL8QAs2XsUc2Rt3ZQfJaD3nbLpbSv02fFbnpfuImaghq9tIZj2ro37xGXOgpdPbj6y50muMyvIanf+shRtZs6aCoQEHy5py6v60spwxgmNkrxCb4/yhYNXjcNAF/NKaA3sePQgOZBsyqaQTUUO3C6rrnwRTjxn81RCSo1b3gpeAuRjlA2MSaO0j+VfKaQIS3iJZWZNqrC8xWkKFMaMB9S/6e4sloVcjhRl3eJPpzta7YX+csrz3phtEQRMBIA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CojsJ4BLa4EOtfncJicQx0+aZe4GlU79Gbh3SDwP26Y=;
 b=N6/E0R8okKtL2IBL3/tHI8Kz5qjPPkdxGncRwJo3FPjy+d5BE3kuJYp1ANhjv+mOc4SHwmsrJdCGxpfFEycj8P0pRR7GfxmpFpTbjNqpF4jFJ9bN+Aosxvv5A8835V6t9cL2wnRmnDc71BZ/5cap6XMPq/IWWQ9u0R3Tz6bxP5U=
Received: from AS4P192CA0023.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5e1::9)
 by PA6PR08MB10768.eurprd08.prod.outlook.com (2603:10a6:102:3d2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 15:35:22 +0000
Received: from AM2PEPF0001C710.eurprd05.prod.outlook.com
 (2603:10a6:20b:5e1:cafe::e) by AS4P192CA0023.outlook.office365.com
 (2603:10a6:20b:5e1::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Thu,
 30 Apr 2026 15:35:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF0001C710.mail.protection.outlook.com (10.167.16.180) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.22
 via Frontend Transport; Thu, 30 Apr 2026 15:35:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PYDG4Eqq6onPJP66WUrApps80e+mWapobkMQz4mCoCAzm8DSz2M1zBWMX7RmD2glwcMJz/lU46vg0NfKfzLShshHKFFix0uFE+stcAybedsuDTPj3TtopAkazod9V95I1HgHI3zICj9V4BZzfG10WIlaACMRyc4C2864+IlF7X/OuWiq3FCsjaBHS+c/KkzkD8LRZj54fiBpJVWdFSwcH9fNKIqqyPQFqeye0Fm5hlfer8xa3LItBR5lQzHTtzcnokLLOuxDMwkLhGw32yKGrMz5ZTO9cUudTnytXBZqASZXFtdB4NWYs8ZC3eeE/YjW9X7/Ppcdsjhrs7MJ6FqkJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CojsJ4BLa4EOtfncJicQx0+aZe4GlU79Gbh3SDwP26Y=;
 b=QFY1l7wnvrmDXBHnXAaX4TqUPgoR3FMQeirKyILlxOlhJmxV/pYj0OW44ObnoFiqBduVBZ4UpuImISbgBF4MjYS9BYPIcMr8B8fsDPFjwJDUnkuRcfsT3qD7nUV5j/KnJFQUBj3Hjeq+9cD+08vKY0YMVCuzbUz+1zCKpTEPyrqjvzUqFHxAmV6ounT/HiEE1qK0Y7ZSvSjAMq5H8w+S5+/YrBMP8uTY+/CRVebdrbAxJIvbajX2DQ9Col/kI9at2TjEx09bgML/vzhRBwny8a8Tyt7UNRJcwBcXw8t0aur4CzjpSy3nbqxriJ6fmffZ7GyU9UVYn/yhpa+8gC2VWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CojsJ4BLa4EOtfncJicQx0+aZe4GlU79Gbh3SDwP26Y=;
 b=N6/E0R8okKtL2IBL3/tHI8Kz5qjPPkdxGncRwJo3FPjy+d5BE3kuJYp1ANhjv+mOc4SHwmsrJdCGxpfFEycj8P0pRR7GfxmpFpTbjNqpF4jFJ9bN+Aosxvv5A8835V6t9cL2wnRmnDc71BZ/5cap6XMPq/IWWQ9u0R3Tz6bxP5U=
Received: from AM6PR08MB3399.eurprd08.prod.outlook.com (2603:10a6:20b:47::18)
 by AM8PR08MB5828.eurprd08.prod.outlook.com (2603:10a6:20b:1df::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 15:34:19 +0000
Received: from AM6PR08MB3399.eurprd08.prod.outlook.com
 ([fe80::59cd:4b6:fceb:3de7]) by AM6PR08MB3399.eurprd08.prod.outlook.com
 ([fe80::59cd:4b6:fceb:3de7%5]) with mapi id 15.20.9846.025; Thu, 30 Apr 2026
 15:34:19 +0000
From: Sascha Bischoff <Sascha.Bischoff@arm.com>
To: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: nd <nd@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Marc Zyngier
	<maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Subject: [PATCH 1/3] irqchip/gic-v5: Move LPI alloc/free into LPI domain
Thread-Topic: [PATCH 1/3] irqchip/gic-v5: Move LPI alloc/free into LPI domain
Thread-Index: AQHc2LbPXVvomoi+T020nCY0AkLbUw==
Date: Thu, 30 Apr 2026 15:34:18 +0000
Message-ID: <20260430153352.3654325-2-sascha.bischoff@arm.com>
References: <20260430153352.3654325-1-sascha.bischoff@arm.com>
In-Reply-To: <20260430153352.3654325-1-sascha.bischoff@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.34.1
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: AM6PR08MB3399:EE_|AM8PR08MB5828:EE_|AM2PEPF0001C710:EE_|PA6PR08MB10768:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a496e7b-065d-415e-7d72-08dea6ce172d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original: FpGLd4ACswHcmNpkB/YJ+vz3Ti2wIBSmOddDiaipkPfBw5xeleDs57EHh+tTx1EfipEdeYaAFuwMcysAehjrMo6Ro5ZGntF9JPT7f7OX8oQRUyzhSbLajJYBwD61EFzesinssjekZRdm6T+8iex+S/0Fli1/+lHuB/mt73BfdtL7MeO9tsMjZ5JOECipAgRWoMk7LbtTnLyE2c9lfUZwJVJBU+VioLYfGaMGkNR4cLv2s0qDFixksSMwHf8dm4u+uZQ9HbhE43IwItYYd2hOQMh7wnZgiEaf+tkxOtCbN68ZWbx/P1yj63TaMrUmqc+HMW+RkDUiOO61fH9FEzjEpu/Bp6CYLVyPAGI6mp2NldRPKzEo4Eydg56uHm6b3dBZeQi7gIBl+rB50+oA3uVOlcOy4ojWDAvBAjSVUNEiHv7OBZkkoEG7nTrJYPEPtjXT2FcnvGN9GLJ6AODaooJ73bDvfP7Ng5lNbIYxNbsne0AlXqZJytn/xA2kEVFuC9IL75M+jKUUV+FtRGvm8UbH3WMIVgGiduPM0VRFCX1H9I5PjMrf7TefD2YBE4hJOkJS7tO9X7Zmrbl/dNzcf7bf0bfWCFpxsPbgAYn+23K4GWtNih6YtkU1w5H2SQPP3TFzObzkt/HLFAeBM3CkI7RO7GRJiJtFO53jciKGJJnu0aXvUufl5FFTe+fnroMvJdBQfx0uzYz9/ZOvmtJgElAAAviLUIQnliT+KpgcZP8jvPM55K/XO+3P6sa/DhGtupLSxw+EUKt5RY5cy8IpZzY0fZtK+uV8INik9jdFesxSgOs=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3399.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: CVZ0dZ4nFx/HXs/Y3BnkgJ/81tnMLkmE7eLJlK/O5o3esrVKfMbkcFOp65Lu402P7ubf0lEP4RoFroMj9L8tzY64GMxKgEUu7lGLuEY8xgbNkpq5kPAu8USXL7DjL9JXvmQOEJ1AD4Oh2N+J9U2vhjq7M82TDc3PNDuXSuO3XBIDgIbYcEnU0J4ODxPp0idGi5/NLcbfWowCk4LMQgVYGGftqA4auiBda6Pyfr5cU7g9JClvwCjU853N+nfH42+0psZEFhH94iNUGusXJSkuOS85vB5e+M8OHN+f/MPryGisNSsVcEL0ufwNr1yVtdeu3uQrheBb6VSmY2p2MZBjOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5828
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM2PEPF0001C710.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8e2cbc14-9eb2-4763-1ec5-08dea6cdf1e0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|14060799003|36860700016|35042699022|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: kQPtsWOHDFU27Pl4DR3R0P+XD3Gfv1a8G4LwHKCPkuIXUgDezTCAKJhMCIQAZJmi8gX2bPaZ+v6xey/FxcbSaqy6Fe2mNUGGnDVHZhDXbBATt+C5PiNKn5D26olbwKKHKMIqtC6KhF+3o5vxCn0UVTFqyFt4fcH3N+TwKZgybRrStAdjueIFdTGNPhwYfMraRGr5lynm8SUY4NYvOdHP1biE17PfCPgAATC8GuU14gL+ghKMwq81MPNQFeBo9DRvJB0xvADxvu6wbzzALfAGGitChkI/Lt0IgICPwdLUx6wL1mVGaag/swgUnbp+gHXIawsescE5kqs2TOrflFHD/ZYYUozYRmeXKD8qq9VqLutBMwBAEf6Ael2D1Iu7fa6RsEGSifUmZCE9H+9gukJMn2tiYLXp5CYA6zVBLiCJBaCGZyx920nmcMw/xG0bJ7xR/kXun6n2jc+ip7aXXAbcNxMOohj4uKTqNeT3W2obS+R64RzwretmJ++w0nBkk4ylgyUO5EHI0gu25uDXy3cbzqKpSezkATJ1UC/KsJRzMmfr2P9mEMWZYcpPLSrjHU4PwrdHDIaL76axFYIrlMPTf/oFFsJmtO4McWm3EiAPy/EpRtSGjEvXHV/delNFPordf5ciN9EQy+senCBgzOmp1z2YFT1MFQFCZi1yQQ8QUJs/l502EzNuD5wDxX+jWDitnoxS0NhwjGB4I89R6pvL+z3R76VOUhTAwCyyLymsHz24SafyVPpynwTqVPD72+f6eBtNyMMkqiwuDspGPG7JGg==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(14060799003)(36860700016)(35042699022)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: UH8Vr8krO7jc2WkPYL6S1Fht+N9Y5oRmtrbBwvW99lHOk9ZPdaZXLDKks1Eop898oqD7imeutOjES5mNSAb0NgBh085tZFoySOtnqrecGwOoe8d21J1s+WpViBg0PYQbGULQtOC0UhBmrrLP4xoutMnVCj6bTg7o+Ra+DaVjPgxY8cPzxNp6itFiwqxG01KOpzkJsqW7oQE9GPg7x9mChXB/hVBPxAhy0tHF4r9GDVhtj0/sEQKhFZ8t/jj1b4ScSjKJ91R/vyhJFBexVY/Xe3g8H2EZFq7NMvcTeJsQuuz+elFkUtlLiNYDHgIxozxKfnLPx2MiPRL27y+9LtU+zNYE9Cr1NgD/WvWpJbuwtQGbKiT/hGMPD7fuEuz7ECac6y8lUx7ro/wW79Zz6UWfENzmolUzgwhY/5VayMcJl0xAiO0/MXdmZVMo1sbbzNE3
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 15:35:21.4585
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a496e7b-065d-415e-7d72-08dea6ce172d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C710.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10768
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_083530_289870_780AC0CD 
X-CRM114-Status: GOOD (  15.26  )
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

Rather than relying on the domains built on top of GICv5's LPI domain
to manage LPI allocations and frees, move that into the LPI domain
itself. This, rightly, ensures that domains other than the LPI itself
have no knowledge of LPI allocations themselves. This not only cleans
up the LPI domain itself, but also the IPI and ITS MSI domains which
build upon it.

While we're at it, drop the helpers wrapping the helpers -
gicv5_alloc_lpi() and gicv5_free_lpi() - and directly use alloc_lpi()
and release_lpi() instead.

Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
---
 drivers/irqchip/irq-gic-v5-its.c   | 14 ++------
 drivers/irqchip/irq-gic-v5.c       | 54 +++++++++++++++---------------
 include/linux/irqchip/arm-gic-v5.h |  3 --
 3 files changed, 29 insertions(+), 42 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-=
its.c
index 36a8d1368f0e4..36d03f82ef684 100644
--- a/drivers/irqchip/irq-gic-v5-its.c
+++ b/drivers/irqchip/irq-gic-v5-its.c
@@ -929,8 +929,8 @@ static void gicv5_its_free_eventid(struct gicv5_its_dev=
 *its_dev, u32 event_id_b
 static int gicv5_its_irq_domain_alloc(struct irq_domain *domain, unsigned =
int virq,
 				      unsigned int nr_irqs, void *arg)
 {
-	u32 device_id, event_id_base, lpi;
 	struct gicv5_its_dev *its_dev;
+	u32 device_id, event_id_base;
 	msi_alloc_info_t *info =3D arg;
 	irq_hw_number_t hwirq;
 	struct irq_data *irqd;
@@ -949,16 +949,8 @@ static int gicv5_its_irq_domain_alloc(struct irq_domai=
n *domain, unsigned int vi
 	device_id =3D its_dev->device_id;
=20
 	for (i =3D 0; i < nr_irqs; i++) {
-		ret =3D gicv5_alloc_lpi();
-		if (ret < 0) {
-			pr_debug("Failed to find free LPI!\n");
-			goto out_free_irqs;
-		}
-		lpi =3D ret;
-
-		ret =3D irq_domain_alloc_irqs_parent(domain, virq + i, 1, &lpi);
+		ret =3D irq_domain_alloc_irqs_parent(domain, virq + i, 1, NULL);
 		if (ret) {
-			gicv5_free_lpi(lpi);
 			goto out_free_irqs;
 		}
=20
@@ -983,7 +975,6 @@ static int gicv5_its_irq_domain_alloc(struct irq_domain=
 *domain, unsigned int vi
 out_free_irqs:
 	while (--i >=3D 0) {
 		irqd =3D irq_domain_get_irq_data(domain, virq + i);
-		gicv5_free_lpi(irqd->parent_data->hwirq);
 		irq_domain_reset_irq_data(irqd);
 		irq_domain_free_irqs_parent(domain, virq + i, 1);
 	}
@@ -1013,7 +1004,6 @@ static void gicv5_its_irq_domain_free(struct irq_doma=
in *domain, unsigned int vi
 	for (i =3D 0; i < nr_irqs; i++) {
 		d =3D irq_domain_get_irq_data(domain, virq + i);
=20
-		gicv5_free_lpi(d->parent_data->hwirq);
 		irq_domain_reset_irq_data(d);
 		irq_domain_free_irqs_parent(domain, virq + i, 1);
 	}
diff --git a/drivers/irqchip/irq-gic-v5.c b/drivers/irqchip/irq-gic-v5.c
index 6b0903be8ebfd..a3c9eaa8ff486 100644
--- a/drivers/irqchip/irq-gic-v5.c
+++ b/drivers/irqchip/irq-gic-v5.c
@@ -59,16 +59,6 @@ static void release_lpi(u32 lpi)
 	ida_free(&lpi_ida, lpi);
 }
=20
-int gicv5_alloc_lpi(void)
-{
-	return alloc_lpi();
-}
-
-void gicv5_free_lpi(u32 lpi)
-{
-	release_lpi(lpi);
-}
-
 static void gicv5_ppi_priority_init(void)
 {
 	write_sysreg_s(REPEAT_BYTE(GICV5_IRQ_PRI_MI), SYS_ICC_PPI_PRIORITYR0_EL1)=
;
@@ -806,18 +796,37 @@ static void gicv5_lpi_config_reset(struct irq_data *d=
)
 	gicv5_lpi_irq_write_pending_state(d, false);
 }
=20
+static void gicv5_irq_lpi_domain_free(struct irq_domain *domain, unsigned =
int virq,
+				      unsigned int nr_irqs)
+{
+	struct irq_data *d;
+
+	if (WARN_ON_ONCE(nr_irqs !=3D 1))
+		return;
+
+	d =3D irq_domain_get_irq_data(domain, virq);
+
+
+	release_lpi(d->hwirq);
+
+	irq_set_handler(virq, NULL);
+	irq_domain_reset_irq_data(d);
+}
+
 static int gicv5_irq_lpi_domain_alloc(struct irq_domain *domain, unsigned =
int virq,
 				      unsigned int nr_irqs, void *arg)
 {
 	irq_hw_number_t hwirq;
 	struct irq_data *irqd;
-	u32 *lpi =3D arg;
 	int ret;
=20
 	if (WARN_ON_ONCE(nr_irqs !=3D 1))
 		return -EINVAL;
=20
-	hwirq =3D *lpi;
+	ret =3D alloc_lpi();
+	if (ret < 0)
+		return ret;
+	hwirq =3D ret;
=20
 	irqd =3D irq_domain_get_irq_data(domain, virq);
=20
@@ -826,8 +835,10 @@ static int gicv5_irq_lpi_domain_alloc(struct irq_domai=
n *domain, unsigned int vi
 	irqd_set_single_target(irqd);
=20
 	ret =3D gicv5_irs_iste_alloc(hwirq);
-	if (ret < 0)
+	if (ret < 0) {
+		release_lpi(hwirq);
 		return ret;
+	}
=20
 	gicv5_hwirq_init(hwirq, GICV5_IRQ_PRI_MI, GICV5_HWIRQ_TYPE_LPI);
 	gicv5_lpi_config_reset(irqd);
@@ -837,7 +848,7 @@ static int gicv5_irq_lpi_domain_alloc(struct irq_domain=
 *domain, unsigned int vi
=20
 static const struct irq_domain_ops gicv5_irq_lpi_domain_ops =3D {
 	.alloc	=3D gicv5_irq_lpi_domain_alloc,
-	.free	=3D gicv5_irq_domain_free,
+	.free	=3D gicv5_irq_lpi_domain_free,
 };
=20
 void __init gicv5_init_lpi_domain(void)
@@ -859,21 +870,12 @@ static int gicv5_irq_ipi_domain_alloc(struct irq_doma=
in *domain, unsigned int vi
 {
 	struct irq_data *irqd;
 	int ret, i;
-	u32 lpi;
=20
 	for (i =3D 0; i < nr_irqs; i++) {
-		ret =3D gicv5_alloc_lpi();
-		if (ret < 0)
+		ret =3D irq_domain_alloc_irqs_parent(domain, virq + i, 1, NULL);
+		if (ret)
 			return ret;
=20
-		lpi =3D ret;
-
-		ret =3D irq_domain_alloc_irqs_parent(domain, virq + i, 1, &lpi);
-		if (ret) {
-			gicv5_free_lpi(lpi);
-			return ret;
-		}
-
 		irqd =3D irq_domain_get_irq_data(domain, virq + i);
=20
 		irq_domain_set_hwirq_and_chip(domain, virq + i, i,
@@ -899,8 +901,6 @@ static void gicv5_irq_ipi_domain_free(struct irq_domain=
 *domain, unsigned int vi
 		if (!d)
 			return;
=20
-		gicv5_free_lpi(d->parent_data->hwirq);
-
 		irq_set_handler(virq + i, NULL);
 		irq_domain_reset_irq_data(d);
 		irq_domain_free_irqs_parent(domain, virq + i, 1);
diff --git a/include/linux/irqchip/arm-gic-v5.h b/include/linux/irqchip/arm=
-gic-v5.h
index 40d2fce682940..f78787e654f4c 100644
--- a/include/linux/irqchip/arm-gic-v5.h
+++ b/include/linux/irqchip/arm-gic-v5.h
@@ -425,9 +425,6 @@ struct gicv5_its_itt_cfg {
 void gicv5_init_lpis(u32 max);
 void gicv5_deinit_lpis(void);
=20
-int gicv5_alloc_lpi(void);
-void gicv5_free_lpi(u32 lpi);
-
 void __init gicv5_its_of_probe(struct device_node *parent);
 void __init gicv5_its_acpi_probe(void);
 #endif
--=20
2.34.1

