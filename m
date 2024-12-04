Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A053E7716F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 23:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aj9graMXGsBoC4IL7er4ah2Xyl37vVo+7FWav4/gUuk=; b=fpKEy1HFeIisKs04p0rCZvTMmq
	Qt5wQvBDccYaerfNQXE407kVZ2PJaKkiBz4fpY9oNHsYb43yz1yTOtRIcm1MrGI0tcya4e59mUG7z
	AnGcMJ+CmiCIjVW+RdxBB+QV67LeGO+pE6HZBEcIyYn40i9wMo6CFVBNpHZ+l53Ae37NitMFc09/5
	X2gMfHMHimWxBrQeFHkR2OGHPT8DbrG2RdD30NDAFRFs0Cf9LdTeW8UyVWb65JlLSWEjM9+TLsBaf
	FyxQA2tOV9026G9PLiUsa9Orzea6eS7Q2A8y29nxyqqm7NpKRCm6LemMcnE2ku+4ZmdpyMntI5aAy
	3mGZtw3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIyqn-0000000EAZH-19kD;
	Wed, 04 Dec 2024 23:32:09 +0000
Received: from mail-db5eur02on20625.outbound.protection.outlook.com ([2a01:111:f403:2608::625] helo=EUR02-DB5-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIylK-0000000E8vR-1MnZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 23:26:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K/mfMuOFCrDYsxNE9W1yqAjR/Zb2wqkl73891KJMjG11j/5GsFag/yZyl/BkVrp/91JanNcaR+SxA6s+YSE820LTAsyJdCA4583QmUF0wB0KZBykPWfTcPuFY6xQzlfQUn26Pyur8iEEONvrOjhOQGSebjQpvh3wOHn0sqcHS0hWb4DMDZgxBWJJ/19UZggttij3pJL8J78i+r/2oNqufMryg65MRj+7YEq6Yy+rfKQbSTjl9fJX/rxKUhp5t7+/fWkir54bO/LmnOt7w8Hd62Zk5YfVxE6x2FfucQH7y93fs0Ywid1jbx2wzt8f4MN9828CPAi2dsdL6eNqBTzm1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aj9graMXGsBoC4IL7er4ah2Xyl37vVo+7FWav4/gUuk=;
 b=l1SkPi/E1H15EY+hBgezoxwLobonEnzsC18CXKpDKBZ7XC3wsYpj9te5zfbFN5gG+shQC3cAWQfUghvuh9vlHHeE+gENxaZ36sgALJIOX3TH8L9nMxoZoJNCgSwSlAiGIajsnx6nV7ahhMgJqn4ujuzPVh9V0cpROZ59JNxLv3i1tBQJwYftRT1dH0+oKGGSMkI09gSdBeeARnL47X3Mja1DuN6RN+hRpENOCuy+JXfwJoWKnOShmo0KTZQ8KjooplAyPN7tfwJcNU9qQZGbXp1EgwTeYiru74k467+JcMepGIs/p0Mp3cIqbfoBGQkmzpHIN3iaW/9BbU64pkOnIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aj9graMXGsBoC4IL7er4ah2Xyl37vVo+7FWav4/gUuk=;
 b=c1OrDomK8m3iv7ncZvZyD9oEmb7H5Ohjf0k0fBDzq1gABAKFU13wstHBbcYW6fHrNRbVY8Cns2GxpCFAWUihi7emdaLkwRWebQONu0GYZ/I/+1jfIg4MR2vIVmfDgvPZplCoRAtexsg5pkDudqn0oLFkEaMavkn17QtwMSbkvYWyYhOO67WWWWkTiLQ9HdzN2pnM+PEitqrg41lX8l7TuKvWGLvPoMtsA5KsAQ8DpenVyLJKuOXtfcdQLWwYdSkyNRlwsu66ZX67LRqaSyt5KeX1SVISW2j3gUFp5O02MgWg5TV9jngmsswfgzrsQVs8WZj/HZr1WGnOVlyp8FeSxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU4PR04MB11006.eurprd04.prod.outlook.com (2603:10a6:10:58a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Wed, 4 Dec
 2024 23:26:27 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8230.010; Wed, 4 Dec 2024
 23:26:27 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 04 Dec 2024 18:25:53 -0500
Subject: [PATCH v10 3/7] PCI: endpoint: pci-ep-msi: Add MSI address/data
 pair mutable check
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-ep-msi-v10-3-87c378dbcd6d@nxp.com>
References: <20241204-ep-msi-v10-0-87c378dbcd6d@nxp.com>
In-Reply-To: <20241204-ep-msi-v10-0-87c378dbcd6d@nxp.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Anup Patel <apatel@ventanamicro.com>, 
 Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
 imx@lists.linux.dev, Niklas Cassel <cassel@kernel.org>, dlemoal@kernel.org, 
 jdmason@kudzu.us, linux-arm-kernel@lists.infradead.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733354769; l=1552;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=KBig+EizkbOsM7GH8GEr11XjaV4NgLu98GEXwecGT00=;
 b=sn9M8HcPxQyXDjCF2IOqes4/02ZuyOuaN7xETANuysykGF1rcnHJq5o8KTX3piZjOrIPcEctF
 vetFMAuPtHDBNKbJKLyVV5QoVCPQt23OMp+vQXUbtCWX0NaNRkPXHNk
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR05CA0031.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::6) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU4PR04MB11006:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a48ec29-f3d7-4ee2-9c01-08dd14bb134e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TVlkNkNZTHI0OXNMTG1sQXdmWmVJNGwrZXZock1ETWxta2JaWXBxY2NGcUVs?=
 =?utf-8?B?ZnRxdFpBc2llZTkzL3dzVnFNTnh0SDdDdmF5ZXFObEx2REE3NnQ5T0FkNDZX?=
 =?utf-8?B?Y0JSQ2NJK3BEbkpKelY3SlhXRkdSWUMyUVF1SGh1dWp2a1dZK083SWR0enpn?=
 =?utf-8?B?bXRPVjVEc3ZZNW8xYXNybkhSU0dDbEY3RXUrRHY5eUxxTVNiNzZMS2lLWmhh?=
 =?utf-8?B?SVhDWVVwd1VpTjY1cHpJaEt2dXR4V2hFWU12QUtseGN6UmJ4M1loV2VtQVM2?=
 =?utf-8?B?TU5wV1Ntam9naHg1K1Vmd2xrS2EwWmlqRnBLckdSczcwanZCMnpldFJtNVVY?=
 =?utf-8?B?Qi9tdGU1dXExUmhVclZHNGxwaytiQXFLSUtlaGVOMjZlbzlEVzFBYURvMk50?=
 =?utf-8?B?R3UxS2tQTnp0d1pLM2ZpWlQrYlVUbEI5cDB4WHFuNW1rVEQyRzd6MXZpNXlw?=
 =?utf-8?B?dnM3MUFrbk1pTXo5azhsRS84ZzBYa3JxY2gzV3lZRGFRaU03cnlDalk1bm5P?=
 =?utf-8?B?T3B6S09tcEhLQ2lZeVBsWVZwTlM5Q2tUcE0vTExlc2kyNFNQUDFuYUY3VVV6?=
 =?utf-8?B?bTQ0cU44OW1ScUM4dFVoSnZBT3JDNHJYNmZ1Z1RjaHBDS3VZdVhkVXNJMS9w?=
 =?utf-8?B?Y05VSFIwaGN0UE9zbG90TXFKdW9XNnIwZWNHRnErT0VMd2VPcVlvcTJpMWkz?=
 =?utf-8?B?c1VWcHRzMEtmVmVRZW9rQXlZQkh0azVvVmlWaVBxVDZhWkNMMkEwV2JDMzFB?=
 =?utf-8?B?cWlIZndiajhTU2NtUGFlVVVpcWxHM2VPbDc3RUN0Qkt3RnA1Vjl3WXZldFFS?=
 =?utf-8?B?VVhDMmkrMzlOTzM3VGxxbWhXZFoxZ2xWemF6Qm9yOTRXK25FK1hHMDhrT3BN?=
 =?utf-8?B?dVp4NEJzVWlkRWV5cWJydmFDaXVLbFZZaXhOSHRBWnhGK29xTEN4Rmc4clBT?=
 =?utf-8?B?LzNYUGgrZHR1MlhublptbmxxQk5xd0xrK25zMlNYUzFNTGJ5WTl2Q0gyanM1?=
 =?utf-8?B?VHBBdVY3NEpOZS9HZ0V3QzYrZ01sdksyRmIwZjZ1R2pLa2txWnY4MFhoQmZG?=
 =?utf-8?B?cG0xZm42bENzV3k3VGZ1UHU5SXEzcCswT0lkRDE1SXN2RENkYWdqR2wyeC95?=
 =?utf-8?B?amg0OG5Vb2JjaERWRktrTUNsRDdwQkppRmMzSmJkbnNoeEVsUU1YU2NBWDcy?=
 =?utf-8?B?WmZzSk9rUHBwSElrOFRaSHBEaGs0U2hCS1F2ZmdMaHNmL2dlL2pXcGRQbXVz?=
 =?utf-8?B?aU1YNElHUUxmWENYNXNad2FGcVNZbWpVd2d6L0JJYU5Rak1hNjJFZFk0MFN4?=
 =?utf-8?B?ZTdRR0NzS3VVUXAxYVI3UEc0VUVUT1RrUjZxYlI0STRGT3RSLzg4c2hmcUk5?=
 =?utf-8?B?MTd0dkpudHJFSjlkcXE1OWlUaHIrWS9mb3R2UU52bzcraEpPWVJFMnp4a1Rv?=
 =?utf-8?B?N2tPQ0lJTjNiK000N01oZm85bE1YenhPVjFncGE1eHdURStvYms4eTA1cDlR?=
 =?utf-8?B?bDI3SG5UR0ZzRTlDQldaRFRxQVYzRkoySWhrMnRwUFJPMnFtR3h4ejF6bjFP?=
 =?utf-8?B?SlNiNG1hRXlIb0pzdWZDa0tnUmU2T05udjlUUjFpblRONWVONCt4Q1ZOcmVG?=
 =?utf-8?B?VVBMQXVNVkN3d085K2FnZFd0dVRZMWx6NE0yN0E3dEN5NzBYSnVJMnlJQ0hy?=
 =?utf-8?B?YkM1eTBwcG5BZkIyREVZa3I3N056dmliU3U4YW5iWG0vTG8zU2pGbWYweGRR?=
 =?utf-8?B?Nk4xR2hmcng4UHRWTTRZWXViNnFqaVB5enhDSm1pOThHR0RMWTlUL1lVTFdM?=
 =?utf-8?B?c1VlMkJzdktpUWs5dWI0N2FFdXEyVmNocndyVjdjVFcvektUWkFNUit1bUVY?=
 =?utf-8?B?cWFGSi9yUUNOaDByY2g4bDRWSmJnR01wNEtJS2hMUDNOcjZrZGVCbzJoZ0RP?=
 =?utf-8?Q?eWpslXuGryE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlR3anV6SzR5UmRZSzl2dm9GNzBHajM1aTRQdG1VNGQ5TFRZcmhXM1M2dHNN?=
 =?utf-8?B?bE4zcG95REhBeXEweFJ2SVowcnVCaFBIK2cwd21sVzJFeHM3UHJZYmRJaFB5?=
 =?utf-8?B?NTFGd05Oc1RYenQ4dzlpWGJ2QWZCQ1dZK2hra0lHNGRVd0JwdW1WT0RQVlVY?=
 =?utf-8?B?K0grdWgwd0ZkRWhFTFVIL1BnN0pSeUlqSlhxY3MzRW9SZDVDMW1JcnRiR01M?=
 =?utf-8?B?bU1KcTliTkNTSWpHVUVRUFY3MlUwNjBBK2g4dFA2Q2IyZ3VNR2xWM3d0cnpn?=
 =?utf-8?B?b1hVeDZMaTkyQXhYZnF3QTByR1NZa2ptTWMvR0dKdjhvR21wamJhanFhaTdE?=
 =?utf-8?B?VW9WYXhPQy94d0IzbUZkbXFla3NxcURyMDYrWDFXSmswU3hRVzQyWnZRMHF4?=
 =?utf-8?B?bXJWb3BpbDJJQkIyVlozOUlVL2xXNklOUG9GTDYzYytjWTkrMkRUZXpIYUhS?=
 =?utf-8?B?SUpBeUU4c3FHTHBnT3hKREVJM0hTTVcreDBMNnJKOGJOeFVYVDJtTVkyNFJI?=
 =?utf-8?B?OElxQ2hJMm8veUgwSFNzcUFJYUdTdHQvR2J2OG10ZVlIL1VlMWtjN21PdTBX?=
 =?utf-8?B?NHgrOGhibGlyY243SU9DNGZ0MUZtYlVVSXMrM2kyeFRoVUQxbzJYakVqTSsz?=
 =?utf-8?B?eWVCUnZ3a0VRM2dlM1ZGUU5IMllFTkkvcVpDeGpEZ3h5cFhlWHlpdFNPb1FD?=
 =?utf-8?B?Vi9aTkdxOHhUNTdrWkZjVkp6Ryt5UDVTby9mU1d6c2dhM2xGMUdDTlhTUzFX?=
 =?utf-8?B?VVREWHR3QnAxYWE1N2pOOVdHaE04bzhHU0FMVkpBVXQwZWJQSWthMnZZWUti?=
 =?utf-8?B?bkhiMk1TMmN1NXFSdURCbnh4aDJjMzZnblViRGdXejcyTjRPU0dsSlNjeTY1?=
 =?utf-8?B?N3hvc01tTm94TWpzejcvK2VYcXAwSUppTFJveURHS216UWRGT3E3eXZBSm9j?=
 =?utf-8?B?KzFSeWVCWnJialNpeE1pOWVidy82bUkwTU1aelN0eXN5UWtOYWd0OEM5OTU5?=
 =?utf-8?B?R3ZrRDRWNWo4QzVZTEM1YUFGdUU2ckRJdU1BeWxnUXlFd3B6eGVlSExoWmZW?=
 =?utf-8?B?SDNUV3JCQmF4c3lmRUpUZFU2ODlxckZXNEtFTVA1WG9ZSDNPTWd3Z2RxcXdw?=
 =?utf-8?B?UXJiOGNIdjFnRnc3bW1SZjNwZDlPZGJNZ2F6QmE1NVRWaVRmb0wxMXI1MFZr?=
 =?utf-8?B?NEZnYU1LYW1LZmVXdjdUb0xKdzJ3VWlaU09hd1VDaDY0QU1KUk9GbHVIUkFL?=
 =?utf-8?B?SUt3K293Q3JNK2hUUDdoMlRhbjNiR3VFZHhUcS9mUm92YzZ1MnI4aFlPN1o3?=
 =?utf-8?B?U3I3U2VLUUFEYW5EVjg0WXZHWjdiZURyMlQ0ckI2SEhPWUFWK2JJUmh2eDh0?=
 =?utf-8?B?aTZ3b0VYSWh2aVFzeHROTktrUUx5TmZzNHp1U2MyVTVPTjh6RnJPZGRkeldt?=
 =?utf-8?B?cHFyWHE1S1hmZUdPZFpESEorcDl5K2lUKzd4dUZrTkt5Q1ZwTE1EcGtlQTc5?=
 =?utf-8?B?UVN3WHo4enphNVdKU256TGp3Um9QZkw3eFdOOExOeEQ2WHU2ZFVjU3crRkFT?=
 =?utf-8?B?VnNrT213OC83MTNUL25GNHFBNFNMTHNWdkVPTVlPZEcrSHVGdjVTc1I2d1I3?=
 =?utf-8?B?S0dsS282TW9KbmkrVzdHMURLNDhQS01qcVlwUGxueDd2eTd3ZkNVWWU1Z2Nu?=
 =?utf-8?B?YXY4R2FTdkJHVUlmWnJJRjNaYytPVDgwNDFncnhvNXByTm15QTJGMUJ1Zkc3?=
 =?utf-8?B?c2kxZy9INStvU3FZMkM1eVRmUGFCNjFSdld5WjhrNEFmZXpiZUQ2WlJYNFQ4?=
 =?utf-8?B?Q09ScmR1ZFdic2ZtQ0Y5Ry9nM20vZFhHWTlFZW5RZ2lOanZaNjNVc21WYzlj?=
 =?utf-8?B?Y2FxWTl1MEFNVzRTRTZWSzlEeW9hdHROVjBxTXFZd0FBaEkwbzF6cjZETWF2?=
 =?utf-8?B?M2FGQ3hNYXJ5anBZaWhKTjdtRThpbTRLVWg3TDdsdGE4OXVRTERaeGZ5WEdj?=
 =?utf-8?B?bm93bm81WUpMVk1uOGt5T2hFZmo5b2VJS0EwVjJ4OXFCSWZLaE10TEtmMThu?=
 =?utf-8?B?cUFpUXYzVk9qTlA0K2h1akw2d2dRcG1pWlVWaXFtejJoUzlub0FFQVQ1dFNa?=
 =?utf-8?Q?Dw/cpu0qh3QzPdPYny7t6pGl1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a48ec29-f3d7-4ee2-9c01-08dd14bb134e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 23:26:27.2807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EjTwG4lY5Xa2uJvcGeNwXJ5VeDsSQ+6I2kF3ECuTG8kq8YgaE7/NeJKznhktkPuOYlfnTMW9y+VEcueEgh5jDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11006
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_152630_369075_1258FD85 
X-CRM114-Status: GOOD (  11.80  )
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

Some MSI controller change address/data pair when irq_set_affinity().
Current PCI endpoint can't support this type MSI controller. So add flag
MSI_FLAG_MUTABLE in include/linux/msi.h and check it when allocate
doorbell.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change from v9 to v10
- new patch
---
 drivers/pci/endpoint/pci-ep-msi.c | 8 ++++++++
 include/linux/msi.h               | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/drivers/pci/endpoint/pci-ep-msi.c b/drivers/pci/endpoint/pci-ep-msi.c
index b0a91fde202f3..c4a4f211cb27d 100644
--- a/drivers/pci/endpoint/pci-ep-msi.c
+++ b/drivers/pci/endpoint/pci-ep-msi.c
@@ -107,6 +107,14 @@ int pci_epf_alloc_doorbell(struct pci_epf *epf, u16 num_db)
 		return -EINVAL;
 	}
 
+	if (!dom->msi_parent_ops)
+		return -EINVAL;
+
+	if (dom->msi_parent_ops->supported_flags & MSI_FLAG_MUTABLE) {
+		dev_err(dev, "Can't support mutable address/data pair MSI controller\n");
+		return -EINVAL;
+	}
+
 	dev_set_msi_domain(dev, dom);
 
 	msg = kcalloc(num_db, sizeof(struct pci_epf_doorbell_msg), GFP_KERNEL);
diff --git a/include/linux/msi.h b/include/linux/msi.h
index b10093c4d00ea..e404e0a01692a 100644
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -556,6 +556,8 @@ enum {
 	MSI_FLAG_PCI_MSIX_ALLOC_DYN	= (1 << 20),
 	/* PCI MSIs cannot be steered separately to CPU cores */
 	MSI_FLAG_NO_AFFINITY		= (1 << 21),
+	/* Address and data pair is mutable when irq_set_affinity() */
+	MSI_FLAG_MUTABLE		= (1 << 22),
 };
 
 /**

-- 
2.34.1


