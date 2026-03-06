Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F27D3F01812
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 09:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MsaLUutgJ3UmM4e205UJkcYmVOJ9bWhh341h2k4vtZY=; b=ZAZB15czjKdas8axwfG1jrIz3M
	o6JFDIzKYE6MoCK6Q6LTIU8HuttbjPgo5+6t4p+BIXadut3TMnHM9WVWBN6Nvc5d85vWuJnJ+3fuv
	nR9SEPduERhgz6Jy/xdhIbuflLwGqGfmd8/GyqJ1+lBq6Z7kO2mQc4gb28ZmdoX9BihhgYS9bB8r5
	GxhrGvWoDMr5/I/verOOj1vasX1YGfHiW3v38uh9ZiQGw0ME7gY4NVdpv/BunTUvZVJ/DyBOnROtl
	UNCTgf9TWsuNsoEptNvNdYjFXhggFeY48k4iEsbT/QUV1soLb7UkONP3Vy6fN7FAPIKF0SOmf6uNJ
	B38HoU6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyRky-00000003ND8-24Bu;
	Fri, 06 Mar 2026 09:46:04 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyRkv-00000003NCQ-0csx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 09:46:03 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=EcGCxzeugWGLBAAkFjoHQdQLbZF4ikbRCcIsCsn3E8Su1ETriQfzIFPuzehUfW+ymUHDALsMaUDABmWu3PSgcygy8IvrhmpUmK/q2lT3Eiz04CD40w0bopXv+90wh9xOR66SzpssomozZwD+N6kEaIBfBxptsOfB6qvqEjNoKEc8fNdzDN8sJuK2HVmEBTwPNuiHT3ezySu/NSDExkr5Ou5QjR8+jWQ2b2xC111WCFxHVpCkgsycoilr7mzsMjhH91+nE0i3y3/+I9O9OMb78YkpX7mB+gZELut+nWIusNJpIzr8jnGAjQ4FIFe+rhrYndnLfh8muDNNK1YIRcGvrg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MsaLUutgJ3UmM4e205UJkcYmVOJ9bWhh341h2k4vtZY=;
 b=MUh779tp+EnSgEvcFVoUrYGpxurZrPNSqRNnV5vwo/JUzdLrMuShH3Lk/Yrz6l2ltPzqSiASao++nVgq/P5voRxqPGZjJ8hvPJUi9BcOKAZiKbn1aSb9fqtJncWhREvoh3wDyVJMQZxdSv9IFBMxSwk7ABY0PGeO0NJOlLEUKQoodKUI05McYYWAryXMoxOGCFDLsEQWX+RNg3FPZat846Hri+UCGt/Wz7bv1UtNO7iOg8LJa2ewmjWVhjpYZm77tpfH8zv4zrfdod0f+Wc+1FAwchzxMj/KUUQUQuRysFpgOwczSuHpZPI9IhZK1dFzU0AOk0aMHuRpkM/YUpAOIQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oss.qualcomm.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MsaLUutgJ3UmM4e205UJkcYmVOJ9bWhh341h2k4vtZY=;
 b=nl6CrUFkwTXpKSDj96i5YXP/8rPlHuoSCRTppMBR0shnYnXatGE6LYHsVSXGLeQ61hxsadHMdTROHewNa0rBc4ISc58Lq7X72JvxNInso2DFziJorvmFQR6micM6NEAr+hlghl5tUoUN15W1dHV/4epXcxQ2584n0L/iwQFEZhM=
Received: from DUZPR01CA0277.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::21) by PAXPR08MB6461.eurprd08.prod.outlook.com
 (2603:10a6:102:153::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Fri, 6 Mar
 2026 09:45:52 +0000
Received: from DU2PEPF0001E9C1.eurprd03.prod.outlook.com
 (2603:10a6:10:4b9:cafe::4) by DUZPR01CA0277.outlook.office365.com
 (2603:10a6:10:4b9::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.19 via Frontend Transport; Fri,
 6 Mar 2026 09:45:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF0001E9C1.mail.protection.outlook.com (10.167.8.70) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.16 via
 Frontend Transport; Fri, 6 Mar 2026 09:45:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q+SQsYmV5cw8dX04uAstAKqM74MUhP5HEN1K1hL6B4SlImqXJGajRUrMtPQy5PAO8yxi38rpdDafygZpNzFtjrnt8Ig2D/5f2Usbj4fGq3+GQlpbQqGstab2oUi6OdhVtEky3x2g4nS4b2RnrT200fLcj/ciTUDXcPc1VZIrKnUAZarzPLHlLvrLV2ebBmAbrcGXR40AhkxKHwDFzsoA5Qi1REB3urkUoEy6GFonRvjiQOLGse4ll0B3rJz+mZlGqhs4cf+fWMyRW0jIhH/8F3Vwf6FrfxsH1bL76rd014Ez83l7EZc2jXYxh4xs+rmkV/wCpeI2ueC4DVrVPfLUgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MsaLUutgJ3UmM4e205UJkcYmVOJ9bWhh341h2k4vtZY=;
 b=JHjfgwOWsDwDExbGSYBxzqLc8uRKfFEXG0BBFq+ARTfcucuICBKg43aqtRYRSDW4gBlA9BasI3XMGVytEaGYMFw/vf4t4qm0k21ouPPZchLcoRLLIwIPlYSaga0/mDWpEiQ/kkIbwK9IE5F5q+jFQfB/m9kbVTQGiY2LN7qb+NfHHPC58grbBD4DhDTTkILcTU5abvDqhgxBVnvKmUAST6OqJI//phomN8XpyBTPaqYxIXf7dDdljyK/WnbuogS9lHeZLNN6kzlCcS6ECt2lTa8RHssBkUWWy0CfOBTG6e9KwPvjNDw8sj2ZBROW5cMyr1uS85W/1+EsL6XTPLrh1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MsaLUutgJ3UmM4e205UJkcYmVOJ9bWhh341h2k4vtZY=;
 b=nl6CrUFkwTXpKSDj96i5YXP/8rPlHuoSCRTppMBR0shnYnXatGE6LYHsVSXGLeQ61hxsadHMdTROHewNa0rBc4ISc58Lq7X72JvxNInso2DFziJorvmFQR6micM6NEAr+hlghl5tUoUN15W1dHV/4epXcxQ2584n0L/iwQFEZhM=
Received: from PAVPR08MB9674.eurprd08.prod.outlook.com (2603:10a6:102:31d::14)
 by AS8PR08MB8468.eurprd08.prod.outlook.com (2603:10a6:20b:566::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 09:44:44 +0000
Received: from PAVPR08MB9674.eurprd08.prod.outlook.com
 ([fe80::6f25:3681:7c97:ea2e]) by PAVPR08MB9674.eurprd08.prod.outlook.com
 ([fe80::6f25:3681:7c97:ea2e%5]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 09:44:43 +0000
From: Mike Leach <Mike.Leach@arm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>, Suzuki Poulose
	<Suzuki.Poulose@arm.com>, James Clark <james.clark@linaro.org>, Alexander
 Shishkin <alexander.shishkin@linux.intel.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, Mao Jinlong
	<jinlong.mao@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
CC: "coresight@lists.linaro.org" <coresight@lists.linaro.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, nd <nd@arm.com>
Subject: RE: [PATCH v13 7/8] coresight: tmc: integrate byte-cntr's sysfs_ops
 with tmc sysfs file_ops
Thread-Topic: [PATCH v13 7/8] coresight: tmc: integrate byte-cntr's sysfs_ops
 with tmc sysfs file_ops
Thread-Index: AQHcpJGaKQoGtO+yOUiTWeHZLPnN0bWhUa2w
Date: Fri, 6 Mar 2026 09:44:43 +0000
Message-ID: <PAVPR08MB967411CF6B2247456F362AC58C7AA@PAVPR08MB9674.eurprd08.prod.outlook.com>
References: <20260223-enable-byte-cntr-for-ctcu-v13-0-9cb44178b250@oss.qualcomm.com>
 <20260223-enable-byte-cntr-for-ctcu-v13-7-9cb44178b250@oss.qualcomm.com>
In-Reply-To: <20260223-enable-byte-cntr-for-ctcu-v13-7-9cb44178b250@oss.qualcomm.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: PAVPR08MB9674:EE_|AS8PR08MB8468:EE_|DU2PEPF0001E9C1:EE_|PAXPR08MB6461:EE_
X-MS-Office365-Filtering-Correlation-Id: e3593df3-1942-4656-bbd4-08de7b65274b
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700021|921020;
X-Microsoft-Antispam-Message-Info-Original: zFSC4Cc43h1W9Vs1pkw5HKkhfLEbElE3MOt9LkdfL2Nss/2+P9SIFu88ko3krsrXtwxcmaBxgVnr9+Z7qA6k8Y//7VC/ty/xBS/AHExYcBkr0SNYACmSBIvkUoVs4JXuGq0vJT0J/RWL5c51KBjSoMu3rgE0FRiP/4bS/TMqUEWodA1rjyS1KCB1J/Lo/NVj3yBX5jJw4VTpeFh23SIEX9HnCQCuLP27UWlsxO6oXw2NOsUpGuqibu4NyNhRdO5lFyvsV208UDj2uUIAOvTukwlIf416+ZFvlfb1CVIZ203OwZHgZOzh+xzOSuy9LB6ATPX+hjxsbAkVIQy+IISPj1pH5qIPkEAurtCRxni7Rb1P7ScRwzLcj4WpC5QLhPOWmCORJLJ7d3X6bOj9bld0imD/3mJ24VSy+rKV27/15LnNhn91ezmc54h8HGwebwwH8AEKx8/wXh3xgAAZFmjkh6etwEnmOBShq2cU8BjMAX9qYU+ucmbS6V45dN2PHHJw75jXqePrql40Axw6xJqYlY3Ezl/5YL0EoN2HC4DicHC4em5jG8oQhsS88DndhSF4wDwNtiArlkKTt8Hf9gXtiFKJUO2Kvbq2YT36MC+/Ry/yr/IVmP8seFe7Kas1PGV3uv35N+Ez9+26R4s/dcs4AZpL37wtw5Ud4TgHisIkIGMZ5t6Sj0n1mvR5t9qa9y0jE4J4Mc+oFBntVTNm4/joiRkwaiM9WZntg55060/7UfdqTsANJkX2ErfNtytJldIwNh45xpsG45z46jaAwVqElnrO+2LPQYHUV2XGj7WiL0VCQJmZy3XRG9ReOuOL5IGe
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR08MB9674.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021)(921020);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: HNLno4DaxVff/Nndi8KEYbn02erwUYT+nAnbYwCoLbwGzsp2Ya5y3tqOVihKSH8OpL9JIxpNzhYQBbNsKLMP7zc73de8QBFeIW2E9cwlUSQQIcuT7xuBGvanOFa7QmwAVdIwyXcKUyyMwjzfoGi/41+wKmsJlBx1RzdHGxaBzDu9Bk7/QsO2Exs4aSX9BnuufmJnnG5unEZgPfz2oGFvRXQDQV46ZsY6rlcaLxtvQ798D+/B962Go1TEQFJW1Hj/UNPP5BTskbGrtBjvuq6gppeoVq8RcjZnM0b8R47oY4UCPZi6AELCDXobA9wee80rOVJwKlRJgh6JpGVcXVxErg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8468
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF0001E9C1.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: cb7fa5fe-8f57-4d92-7ccb-08de7b64fee1
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|82310400026|14060799003|1800799024|36860700016|35042699022|921020|7053199007;
X-Microsoft-Antispam-Message-Info: HmKPlpGN9GiJ1D3GBi0C0zw1g1nn1TKPMqEmGZNYcHdTGDKq2MyYh7jlzDcOjgCRRREv81kQxfK4A44wwCJucNDnBCdogHMum0cFO1mAm0//VGYwearIA0o00+JpdtPCwXSCWrjXfYqPXJgKzpGv7jMhpdh1K0QZOrQ+yPU4VLGKMLXCEhw5YlAlYCw3J14bJZ36oVKm1/odBbpz27Eg2EPY/dSNkXGK9IKO48exYhJhMen8lA5TYwRt5T0MbZyP+CKop5XeqNql6HBqG0e5J04wrmZWYolZG+CshqbDA1eNq9SvWdqU+xM28RJOT3Vu/BqTL44Vt2RJizlc0wJQEezLBg9qa78Mb+GKkNwjygsbrlCKgQ58LBMw7Phdolk4q/D5Z+9oPPFYAAxD9ahBo8AMXIfsP1RE5cHBNAL6zNv6d3uWTxFZMUDCPTmXYg8XIoYgdOi5r35k4DziGpMsEevhffvD8NS/dF5oDb6E/u82U3UC1IlKPuM4ZBv+SbUG3QTZQBO7piVAoqK9xb8us6QFFQXVEaHyr8BGofGKHeGErk4pevgphuy5++dCezpCSWntv2D7UDFDmfJkCyt7fAQkXPk89940mM96x99Uz9ow5ndoRDK9uY58J33JgU/+DQdP3Gmu7Z+GzmHpu8hOlIQqL2KDkKC5x6c3iLog3ukgauVNjPeHQmjV/URxGzm153xzyE4kBRCLtSuu8txjeHwMrz/FnV80nrwBVXc1hiEEW81xNKKdMafrFCh81DMfTxRfIMmALY4zw255w8HDFLtEpJa3Icg2EZEl0O913WD1iBLgivlz6bSsgRc6ANdV
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(14060799003)(1800799024)(36860700016)(35042699022)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: dZ9iP4WY+7lT2Ie+72AqQQmdwq3uZZ1VXEGIOlL59D7XkwPxVPhRLFpREFFzH6Iz6apN8EMtCVxXgJZNIyBh/5AdO/46ZVVr5BqtVEpXPrnl2E9gPMhgGoY2ZgyJWJMDc0N1tmIWVRK0yCWBeRrKA14ckmrzmJWu+dQbJsu84gzQeTEt2fKHX5Yg2d27qEo/mEBVC+46lKssVII7HDOb1OYSi0DUDOzh6VBfD73wY2bVL9kfhZkbmQzR1SEx8mRXAIUKvLpUZvk3vYLTW7/rp4+6W1CM9TV44zi3ZVdW4tBJYjuTl07VZn2UazSuQzmnoXxpXzReDhDthxqjq1Hy2ew4LKJ7RFXSAtUz7TLPmlaR91gBEwEgvqx73NTwskC9/gwlTL1Eebm2/MGMrPaoNauTYaeHB6oV6pyrQt2SwR2pvQ6SLq+A1t+tTQioqmJ5
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 09:45:51.3188
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3593df3-1942-4656-bbd4-08de7b65274b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF0001E9C1.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6461
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_014601_427390_5368AEFA 
X-CRM114-Status: GOOD (  19.10  )
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

DQpIaSwgDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEppZSBHYW4gPGpp
ZS5nYW5Ab3NzLnF1YWxjb21tLmNvbT4NCj4gU2VudDogTW9uZGF5LCBGZWJydWFyeSAyMywgMjAy
NiA2OjU2IEFNDQo+IFRvOiBTdXp1a2kgUG91bG9zZSA8U3V6dWtpLlBvdWxvc2VAYXJtLmNvbT47
IE1pa2UgTGVhY2gNCj4gPE1pa2UuTGVhY2hAYXJtLmNvbT47IEphbWVzIENsYXJrIDxqYW1lcy5j
bGFya0BsaW5hcm8ub3JnPjsgQWxleGFuZGVyDQo+IFNoaXNoa2luIDxhbGV4YW5kZXIuc2hpc2hr
aW5AbGludXguaW50ZWwuY29tPjsgUm9iIEhlcnJpbmcNCj4gPHJvYmhAa2VybmVsLm9yZz47IEty
enlzenRvZiBLb3psb3dza2kgPGtyemsrZHRAa2VybmVsLm9yZz47IENvbm9yIERvb2xleQ0KPiA8
Y29ub3IrZHRAa2VybmVsLm9yZz47IFRpbmd3ZWkgWmhhbmcNCj4gPHRpbmd3ZWkuemhhbmdAb3Nz
LnF1YWxjb21tLmNvbT47IE1hbyBKaW5sb25nDQo+IDxqaW5sb25nLm1hb0Bvc3MucXVhbGNvbW0u
Y29tPjsgQmpvcm4gQW5kZXJzc29uDQo+IDxhbmRlcnNzb25Aa2VybmVsLm9yZz47IEtvbnJhZCBE
eWJjaW8gPGtvbnJhZHliY2lvQGtlcm5lbC5vcmc+DQo+IENjOiBjb3Jlc2lnaHRAbGlzdHMubGlu
YXJvLm9yZzsgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBsaW51eC0NCj4g
a2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGludXgtYXJtLW1zbUB2Z2VyLmtlcm5lbC5vcmc7DQo+
IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBKaWUgR2FuIDxqaWUuZ2FuQG9zcy5xdWFsY29t
bS5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCB2MTMgNy84XSBjb3Jlc2lnaHQ6IHRtYzogaW50ZWdy
YXRlIGJ5dGUtY250cidzIHN5c2ZzX29wcyB3aXRoDQo+IHRtYyBzeXNmcyBmaWxlX29wcw0KPiAN
Cj4gQWRkIGNvZGUgbG9naWMgdG8gaW52b2tlIGJ5dGUtY250cidzIHRtY19zeXNmc19vcHMgaWYg
dGhlIGJ5dGUtY250cg0KPiBpcyBlbmFibGVkLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSmllIEdh
biA8amllLmdhbkBvc3MucXVhbGNvbW0uY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvaHd0cmFjaW5n
L2NvcmVzaWdodC9jb3Jlc2lnaHQtdG1jLWNvcmUuYyB8IDUzDQo+ICsrKysrKysrKysrKysrKysr
KysrKysrLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDUyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNp
Z2h0LXRtYy1jb3JlLmMNCj4gYi9kcml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0
LXRtYy1jb3JlLmMNCj4gaW5kZXggMzJjYTJlYzk5NGRlLi42NDg2YmRhZmRkZGMgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtdG1jLWNvcmUuYw0K
PiArKysgYi9kcml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0LXRtYy1jb3JlLmMN
Cj4gQEAgLTMxLDYgKzMxLDcgQEANCj4gDQo+ICAjaW5jbHVkZSAiY29yZXNpZ2h0LXByaXYuaCIN
Cj4gICNpbmNsdWRlICJjb3Jlc2lnaHQtdG1jLmgiDQo+ICsjaW5jbHVkZSAiY29yZXNpZ2h0LWN0
Y3UuaCINCj4gDQo+ICBERUZJTkVfQ09SRVNJR0hUX0RFVkxJU1QoZXRiX2RldnMsICJ0bWNfZXRi
Iik7DQo+ICBERUZJTkVfQ09SRVNJR0hUX0RFVkxJU1QoZXRmX2RldnMsICJ0bWNfZXRmIik7DQo+
IEBAIC0yMjgsMTUgKzIyOSw0NyBAQCBzdGF0aWMgaW50IHRtY19wcmVwYXJlX2NyYXNoZGF0YShz
dHJ1Y3QNCj4gdG1jX2RydmRhdGEgKmRydmRhdGEpDQo+ICAJcmV0dXJuIDA7DQo+ICB9DQo+IA0K
PiArLyogUmV0dXJuIHRoZSBieXRlLWNudHIncyB0bWNfc3lzZnNfb3BzIGlmIGluIHVzaW5nICov
DQo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHRtY19zeXNmc19vcHMgKnRtY19nZXRfYnl0ZV9jbnRy
X3N5c2ZzX29wcyhzdHJ1Y3QNCj4gdG1jX2RydmRhdGEgKmRydmRhdGEpDQo+ICt7DQo+ICsJc3Ry
dWN0IGN0Y3VfYnl0ZV9jbnRyICpieXRlX2NudHJfZGF0YTsNCj4gKwlzdHJ1Y3QgY3RjdV9kcnZk
YXRhICpjdGN1X2RydmRhdGE7DQo+ICsJc3RydWN0IGNvcmVzaWdodF9kZXZpY2UgKmN0Y3U7DQo+
ICsJaW50IHBvcnQ7DQo+ICsNCj4gKwljdGN1ID0gdG1jX2V0cl9nZXRfY3RjdV9kZXZpY2UoZHJ2
ZGF0YSk7DQo+ICsJaWYgKCFjdGN1KQ0KPiArCQlyZXR1cm4gTlVMTDsNCj4gKw0KPiArCXBvcnQg
PSBjb3Jlc2lnaHRfZ2V0X2luX3BvcnQoZHJ2ZGF0YS0+Y3NkZXYsIGN0Y3UpOw0KPiArCWlmIChw
b3J0IDwgMCkNCj4gKwkJcmV0dXJuIE5VTEw7DQo+ICsNCj4gKwljdGN1X2RydmRhdGEgPSBkZXZf
Z2V0X2RydmRhdGEoY3RjdS0+ZGV2LnBhcmVudCk7DQo+ICsJYnl0ZV9jbnRyX2RhdGEgPSAmY3Rj
dV9kcnZkYXRhLT5ieXRlX2NudHJfZGF0YVtwb3J0XTsNCj4gKwlpZiAoYnl0ZV9jbnRyX2RhdGEg
JiYgYnl0ZV9jbnRyX2RhdGEtPnRocmVzaF92YWwpDQo+ICsJCXJldHVybiBjdGN1X2RydmRhdGEt
PmJ5dGVfY250cl9zeXNmc19vcHM7DQo+ICsNCj4gKwlyZXR1cm4gTlVMTDsNCj4gK30NCj4gKw0K
DQpTaG91bGQgYmUgaW4gYSBDVENVIHNvdXJjZSBmaWxlLCBub3QgcGFydCBvZiB0aGUgY29tbW9u
IHRtYyBjb2RlDQoNCj4gIHN0YXRpYyBpbnQgdG1jX3JlYWRfcHJlcGFyZShzdHJ1Y3QgdG1jX2Ry
dmRhdGEgKmRydmRhdGEpDQo+ICB7DQo+ICsJY29uc3Qgc3RydWN0IHRtY19zeXNmc19vcHMgKmJ5
dGVfY250cl9zeXNmc19vcHM7DQo+ICAJaW50IHJldCA9IDA7DQo+IA0KPiArCWJ5dGVfY250cl9z
eXNmc19vcHMgPSB0bWNfZ2V0X2J5dGVfY250cl9zeXNmc19vcHMoZHJ2ZGF0YSk7DQo+ICsJaWYg
KGJ5dGVfY250cl9zeXNmc19vcHMpIHsNCj4gKwkJcmV0ID0gYnl0ZV9jbnRyX3N5c2ZzX29wcy0+
cmVhZF9wcmVwYXJlKGRydmRhdGEpOw0KPiArCQlnb3RvIG91dDsNCj4gKwl9DQo+ICsNCj4gIAlp
ZiAoZHJ2ZGF0YS0+c3lzZnNfb3BzKQ0KPiAgCQlyZXQgPSBkcnZkYXRhLT5zeXNmc19vcHMtPnJl
YWRfcHJlcGFyZShkcnZkYXRhKTsNCj4gIAllbHNlDQo+ICAJCXJldCA9IC1FSU5WQUw7DQo+IA0K
DQpJIHVuZGVyc3RhbmQgY3RjdSB1c2FnZSBpcyBwZXIgc2Vzc2lvbiAmIHBlciBkZXZpY2UsIGJ1
dCBhdCB0aGUgc3RhcnQgb2YgdGhlIHNlc3Npb24gd291bGQgaXQgbm90IGJlIGJldHRlciB0byBo
YXZlIGEgZnVuY3Rpb24gaW4gdGhlIGN0Y3UgY29kZSB0aGF0IHRha2VzIHRoZSBkcnZkYXRhLT5z
eXNmc19vcHMgYW5kIHN1YnN0aXR1dGVzIHRoZSBjYWxsYmFjayBkaXJlY3RseSwgcmVzdG9yaW5n
IGl0IGF0IHRoZSBlbmQuIA0KDQoNCj4gK291dDoNCj4gIAlpZiAoIXJldCkNCj4gIAkJZGV2X2Ri
ZygmZHJ2ZGF0YS0+Y3NkZXYtPmRldiwgIlRNQyByZWFkIHN0YXJ0XG4iKTsNCj4gDQo+IEBAIC0y
NDUsMTMgKzI3OCwyMSBAQCBzdGF0aWMgaW50IHRtY19yZWFkX3ByZXBhcmUoc3RydWN0IHRtY19k
cnZkYXRhDQo+ICpkcnZkYXRhKQ0KPiANCj4gIHN0YXRpYyBpbnQgdG1jX3JlYWRfdW5wcmVwYXJl
KHN0cnVjdCB0bWNfZHJ2ZGF0YSAqZHJ2ZGF0YSkNCj4gIHsNCj4gKwljb25zdCBzdHJ1Y3QgdG1j
X3N5c2ZzX29wcyAqYnl0ZV9jbnRyX3N5c2ZzX29wczsNCj4gIAlpbnQgcmV0ID0gMDsNCj4gDQo+
ICsJYnl0ZV9jbnRyX3N5c2ZzX29wcyA9IHRtY19nZXRfYnl0ZV9jbnRyX3N5c2ZzX29wcyhkcnZk
YXRhKTsNCj4gKwlpZiAoYnl0ZV9jbnRyX3N5c2ZzX29wcykgew0KPiArCQlyZXQgPSBieXRlX2Nu
dHJfc3lzZnNfb3BzLT5yZWFkX3VucHJlcGFyZShkcnZkYXRhKTsNCj4gKwkJZ290byBvdXQ7DQo+
ICsJfQ0KPiArDQo+ICAJaWYgKGRydmRhdGEtPnN5c2ZzX29wcykNCj4gIAkJcmV0ID0gZHJ2ZGF0
YS0+c3lzZnNfb3BzLT5yZWFkX3VucHJlcGFyZShkcnZkYXRhKTsNCj4gIAllbHNlDQo+ICAJCXJl
dCA9IC1FSU5WQUw7DQo+IA0KDQpBZ2FpbiBvdmVycmlkZSAvIHJlc3RvcmUgb3ZlciB0aGUgc2Vz
c2lvbi4gDQoNClJlZ2FyZHMNCg0KTWlrZQ0KDQo+ICtvdXQ6DQo+ICAJaWYgKCFyZXQpDQo+ICAJ
CWRldl9kYmcoJmRydmRhdGEtPmNzZGV2LT5kZXYsICJUTUMgcmVhZCBlbmRcbiIpOw0KPiANCj4g
QEAgLTI3Nyw2ICszMTgsMTIgQEAgc3RhdGljIGludCB0bWNfb3BlbihzdHJ1Y3QgaW5vZGUgKmlu
b2RlLCBzdHJ1Y3QgZmlsZQ0KPiAqZmlsZSkNCj4gIHN0YXRpYyBzc2l6ZV90IHRtY19nZXRfc3lz
ZnNfdHJhY2Uoc3RydWN0IHRtY19kcnZkYXRhICpkcnZkYXRhLCBsb2ZmX3QgcG9zLA0KPiBzaXpl
X3QgbGVuLA0KPiAgCQkJCSAgIGNoYXIgKipidWZwcCkNCj4gIHsNCj4gKwljb25zdCBzdHJ1Y3Qg
dG1jX3N5c2ZzX29wcyAqYnl0ZV9jbnRyX3N5c2ZzX29wczsNCj4gKw0KPiArCWJ5dGVfY250cl9z
eXNmc19vcHMgPSB0bWNfZ2V0X2J5dGVfY250cl9zeXNmc19vcHMoZHJ2ZGF0YSk7DQo+ICsJaWYg
KGJ5dGVfY250cl9zeXNmc19vcHMpDQo+ICsJCXJldHVybiBieXRlX2NudHJfc3lzZnNfb3BzLT5n
ZXRfdHJhY2VfZGF0YShkcnZkYXRhLCBwb3MsDQo+IGxlbiwgYnVmcHApOw0KPiArDQo+ICAJcmV0
dXJuIGRydmRhdGEtPnN5c2ZzX29wcy0+Z2V0X3RyYWNlX2RhdGEoZHJ2ZGF0YSwgcG9zLCBsZW4s
IGJ1ZnBwKTsNCj4gIH0NCj4gDQo+IEBAIC0yOTcsNyArMzQ0LDExIEBAIHN0YXRpYyBzc2l6ZV90
IHRtY19yZWFkKHN0cnVjdCBmaWxlICpmaWxlLCBjaGFyIF9fdXNlcg0KPiAqZGF0YSwgc2l6ZV90
IGxlbiwNCj4gIAkJcmV0dXJuIC1FRkFVTFQ7DQo+ICAJfQ0KPiANCj4gLQkqcHBvcyArPSBhY3R1
YWw7DQo+ICsJaWYgKGRydmRhdGEtPnJlYWRpbmdfbm9kZSkNCj4gKwkJZHJ2ZGF0YS0+cmVhZGlu
Z19ub2RlLT5wb3MgKz0gYWN0dWFsOw0KPiArCWVsc2UNCj4gKwkJKnBwb3MgKz0gYWN0dWFsOw0K
PiArDQo+ICAJZGV2X2RiZygmZHJ2ZGF0YS0+Y3NkZXYtPmRldiwgIiV6dSBieXRlcyBjb3BpZWRc
biIsIGFjdHVhbCk7DQo+IA0KPiAgCXJldHVybiBhY3R1YWw7DQo+IA0KPiAtLQ0KPiAyLjM0LjEN
Cg0K

