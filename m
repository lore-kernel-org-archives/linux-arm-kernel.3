Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A29EA4E07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 14:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	Message-Id:Content-Transfer-Encoding:Content-Type:Subject:Date:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ebMFLcRR2BijqRx/a1fW5gtsUt6hxUsHtPGiq0bM8yk=; b=LNMjb3CDBvWeruDhhf8Ru+uPEQ
	tMgWHZ7yq+NztvdOAz4Ew0vgzqmEB5u3qAg25sEbjP6l5V1gMNizOFms994tLNJiaDnmeiC5vQkas
	0Gf+kpclUdFp7ssd5Ulsd5PEdueW+OkwdJIi7q3G0PhaieHKtARedTXuzCvy++BSnxnWO7RPxudAN
	TAlPdYhkaX5GMk7rn992WD+Q9M7aJTqj7GXZ3HNcYtWuNizoI9fGOLtW5bzDwCHyz9gbXm1T+tRjZ
	zLy7EbPDrF5Wp2IaNWl/0ac6o8cbiihr1hlw+iB3PTb4oRzsePEI26KwNRsM31fwtTE0E8WWa2ktI
	jbEbiHyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx4NS-0000000DFKY-0Sxn;
	Mon, 02 Mar 2026 14:36:06 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx4NP-0000000DFJr-1DK8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 14:36:05 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=vyQN1NHOSmDCD5JDxfXpaK+IfK5EsoqV4JwWUISKrxJ3EQcXC5dHVc++cqCBJrW2JJpETPkstnimR7ZG5U2zAU2sXgafUn6H49oHwbZeTsMVm7K0kZneE8Z8H1iwpB3IC+n0Kim8QE7dAI3JbiinY97rgvqw6d1jU06RHXXb2mjnnYXm/9XmDq9Ch2sIjlKmJttaAcoWbSRHweYKTsm0pqnyksALHKPmAoM1tjnH/Omj/oyjxAYxP7PH5IQw0Fj/rxA0HrV8QN7b7NSPHWofFotyhp6GLpITeBDcerCF+f6ZAUSXYYFSqahG/cTSPUQF+1qwJmbPCW+LnKquHPXKNA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ebMFLcRR2BijqRx/a1fW5gtsUt6hxUsHtPGiq0bM8yk=;
 b=ZRJvAu7OP24LBFNaQDUbFnpm3mNG1bCWiugXD7KOL0/pskoWbOfEmxiq7qVQMEa/WjXPwfxh8B01MU4Hg2sfHMIBlInvy74ndc+SCE7OjyXgqDMHrJ/eOoknPtblQNP0EHoY302Dlpik3vecCEOMNrG/uINUkfclSKQYocAD3V3W4k0MyImrbhMgoh+qfaPx/57EqxE8y32MVVMsmFV7YZPpSkb/UoJU1o3TpjCDUArzzXQGTQV24PBGgISzjMtC0a7EMVWGhjFkyI8p5+012A6cWK1kCFKZE7yi9ifs0L2YaIwTtg80o1sftDsQtEMHD0GFBW3uT8MF51M3jHxhZg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=softfail (sender ip
 is 52.17.62.50) smtp.rcpttodomain=kernel.org smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ebMFLcRR2BijqRx/a1fW5gtsUt6hxUsHtPGiq0bM8yk=;
 b=OXUi8jNkioABGuKKroC6r5AFrTmC3hsycmh0H8iaPzQaIcd7mgTKbXTVdp1cWxBTp4/6OKVYbPxhWarO7dh64R3Vqj1OpPT2v+poJSqOnmde2t1MhGkvhLqjvKByPtq44zDu+d2czcXkNdatvOuDwsyC2vI4UZTesKaY0+YOpOs=
Received: from DU2PR04CA0153.eurprd04.prod.outlook.com (2603:10a6:10:2b0::8)
 by AM8PR04MB7827.eurprd04.prod.outlook.com (2603:10a6:20b:247::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 14:35:55 +0000
Received: from DB1PEPF000509E4.eurprd03.prod.outlook.com
 (2603:10a6:10:2b0:cafe::bc) by DU2PR04CA0153.outlook.office365.com
 (2603:10a6:10:2b0::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.20 via Frontend Transport; Mon,
 2 Mar 2026 14:35:51 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 solid-run.com discourages use of 52.17.62.50 as permitted sender)
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB1PEPF000509E4.mail.protection.outlook.com (10.167.242.54) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Mon, 2 Mar 2026 14:35:55 +0000
Received: from emails-9223048-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-166.eu-west-1.compute.internal [10.20.5.166])
	by mta-outgoing-dlp-141-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 934D77FFE4;
	Mon,  2 Mar 2026 14:35:55 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Mon Mar  2 14:35:48 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vcw5RWAL0QjqAgUqXRm0jt25r6Dk6q7XrRjSPblQe4r9w/3IPOsSQwDPK+hauIjMQ1ZFaWbZD0S5AGVedOLQfAiQl5z2c5USokuEkxSfPAhg4XcQIxn5K39OeHv5VHfU0ExygEhEQ/Cys7cRsDEr0tVjavP0sGs9Wp9iNacgGghAjgU5G0YJRuLA+5J528m6+/5UH51stIzYSN+KYg2TkRGBVGUrCweQYyW2DwyZQAjM3kOjOrBN2H2ZYYeNgynJ3IdtqGTEPPis53AZB3uUi5+ncBvpujZMvo5s98Av9rdCqkY0G7Buco44l8u1uj1DzaRfKzZQoNKhYmwyVRG2Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ebMFLcRR2BijqRx/a1fW5gtsUt6hxUsHtPGiq0bM8yk=;
 b=MhJzSgXzMPn7QeBDJMKMjVtZGyxuAmmyAUsQwtbMAwgQ5O3e7GEEUwZiFO//fTTOjqAjn+aI4q0Oz45ri4vvFZ4WJmUNSc6Os9N+BnIjQm6sn2KtRnQpdRmiryR4JrpYptufVuPYTYvB9Rmyve44UmYKzaC2LbXQDN8TxgJaomrgF4+PAhWwE0kiLjuC7KvsEyh3pl54RHbIRkXssHnfVJEywxpO6ucn7wSISF9gzYblc32xHBdxmU2W/NgMb9ZJhPzEmUX/ojrC/h6mB7Cw5q0XS9KoVqzXZRNCbS0Fn1ChxgJOL6ZxvJbVtEb+H640MjQPmMe6r4QrXvxuwfqRwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ebMFLcRR2BijqRx/a1fW5gtsUt6hxUsHtPGiq0bM8yk=;
 b=OXUi8jNkioABGuKKroC6r5AFrTmC3hsycmh0H8iaPzQaIcd7mgTKbXTVdp1cWxBTp4/6OKVYbPxhWarO7dh64R3Vqj1OpPT2v+poJSqOnmde2t1MhGkvhLqjvKByPtq44zDu+d2czcXkNdatvOuDwsyC2vI4UZTesKaY0+YOpOs=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by PAWPR04MB9936.eurprd04.prod.outlook.com (2603:10a6:102:38b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 14:35:45 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1%3]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 14:35:45 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Mon, 02 Mar 2026 15:35:37 +0100
Subject: [PATCH v4] arm64: dts: lx2160a: extend 32-bit, and add 16 & 64-bit
 pci regions
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-lx2160-pci-v4-1-30a30dc47ec6@solid-run.com>
X-B4-Tracking: v=1; b=H4sIADigpWkC/23NsQ7CIBCA4VcxzGI4oEdx0rg4OrgZB6FUSbQ1o
 I2m6btLSIzWON5dvv96El3wLpL5pCfBdT76tkmDnE6IPR2ao6O+SjPhjEsGUNLzgwMyerWeSlM
 Z0OiKshYkgWtwtX/k2I5sltvVmuzT+uTjrQ3P/KKDfMw1weG71gEFKlAJxcpaOYOL2J59RcO9m
 dn2klMd/3DJ9YjzxMFoWSiskKP4x8WbF0wzNeIicWMQrZVgylr/8mEYXv5kXs4tAQAA
X-Change-ID: 20240118-lx2160-pci-4bdb196e58f3
To: Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: Yazan Shhady <yazan.shhady@solid-run.com>, 
 Jon Nettleton <jon@solid-run.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: FR4P281CA0031.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::15) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PAXPR04MB8749:EE_|PAWPR04MB9936:EE_|DB1PEPF000509E4:EE_|AM8PR04MB7827:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e4d7755-554d-4d4c-18f8-08de78690367
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info-Original: 9/D9e02k3AKr1Dq7ArNR6bTEfw4vckft3POo7PNSsfAuFGi/h4LZOY8QYLWAhFsDLbawiE3niFiHMB8d6Gvbd/5o+jtGIS+hrb+RB+J25Zi1Or5JLVM4oIGoIVH7NHhiZbvr5/8+8jG6H5Hf6vkselNDpaMGe37rdcrct9dqoFk/aFVUjpXu4MW81g7JfMyNbyNlglqaI40wc8IhlaQfY+cQDKb3kX/zc7btntGw6bT8Km98qFyTyD5tXqsT7Ty8d1QJWwWb8uN6CJnBwPdWZc3iGimeEG5nrQiG9c3wW39zVnRrQ7Aw6d8ArOu1DB5uyM36CDvqB0Yd6A5rx0NUqsk9DBP4wzOwRkNV7oInQgVA1NR4TTUdUfZxRjZ1E6OvFlIwmNQb0TUOYLvYVet9beGtJQqfmoMorZeGdtE1IMZ5nZ9U2NkHbVbyr2Veilm+0tQ5gvj2/Vz9I2DFQPV8ckpYC7580X7QbJZrIRZb8+UXdrzQmCmsfJzf97uHoLi4BTvScgcYZuRU542gBmYJlyjIN8fTPgEDzi7+3T4+qAH5KizlF9X1oemj7N6PlYjKdQx1cQIS4PqecmnukBY0Qjy0pgCUAlTTFKtluFOfJMkLyDTGXUJnlAU/2UwDfF8XG9S8Ngyl6D4PXEpJPdYJgnWGpuerxOFYBNiKixsE44eN0ToAhEWfIDjwu9v9TW9l5+/N0Fp5kJvJh72URuFLcxOLBZ9THFj3+JNVyn5idCz2LxpuScVc5DuQKLDxMCBibX8x8sEmbMwh+35CWvwScudg6GiqtKEi7KL9iovYG4o=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9936
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 89e18fb82c5a429cae4c296d5f3b93f1:solidrun,office365_emails,sent,inline:6d23539786243f1fd58b5a96b214b980
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509E4.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: ccc5f9dd-3917-4fb9-7f17-08de7868fcf3
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|35042699022|7416014|376014|14060799003|36860700013;
X-Microsoft-Antispam-Message-Info: 2tFKJ8dP0mXSXLlJkhzmk9/M8r2zaban88ri+IOkJGOI9CWLS6fHZ+c2k37zpnWrMWEr7SVgp7+R4dQ/4ThiIuJ4MW2BpFf5BHdHDXqC+f1TnjPbdpqztxeI4/C9aQ13lFSWAQzwTC3cOhbzI2Uo4LSdGPpPWOrP8esJMQ/HJM+sWHbayxUJlZI423ZThEyGBD1z5Ol74wzojxMJlGHb6PkLP3cpirN28oQHIi0GsYsGHQSD4vPuSYlVtGld+0JtQ7NEovboo0yefgLtHo3K/Siv1gkofmbNvS01CioyxR6V9d6HPUfDF4n5x9d4kNVQEnipZGEwxArhtYgG2TY17g9tAXQnYFLazAB1PsYLoHlIEGBFsukyeUKiMdHWy/XMF+QuItzFG0qnnm2KgB1MiGoXaCYc5EQa9f+yQD61zDnAmVfXc3QR7tIPk/Ww/qXYVbOCGDlAzjjGBSbc5UqvYEVdgUlo2tmjtziocEQANHaJFKsP6PErwoXuM7DmBRIQwkS1iu32qNkbyvnlQZmI0WCCdgtfBrMJhQbkt1nAehqobHcXxc53cIL4BX6Moa1z11JsguG4WH8yu1ggXEeWRs9vag6LAbx7psp4gb6640sKiGrjuqVE7VmheVyeZKcCtAuDI2r/kb6s8a5JP27xuF94JEJEa6QzMQDFcmy3Yentm2U1I9voTGYG7pixaAgN3ZgeI8XIIxUktoInsR6CAj+Ft0Vb4KjfI5Ma8VO8NzewkYxdmmXJRitib+v9BF9Dtu5JsR7oU76YLoGh56WYGhESzUjczVWhEOW0pNzfZ9FbguiCiY1LAloLSAXTSAW3CUXDJxjDjtAD2rVcVRg8MA==
X-Forefront-Antispam-Report: CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(35042699022)(7416014)(376014)(14060799003)(36860700013);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Q0CVG8beju9mLBxSStE6iJcN+9luu40Y2ufMQzdOcQ83r1PFcuOpgvlfFQ+ehnJzb53UMeiU2dLrlER510cHVcsOM/mVSYK7trrQ1BJjgx6aKreNJUcPmk75V28pRAeJGMqJ9qXb64MHgsBARD9NkKsHxZG6YOHZRzNLWhXJ5NSI+zsW5EE8UJDlix83npnYuQ4Lcfnd11AiJSfulH3PNbbkJ66cWlwE49QOSZzLjFkYh1L3XQ4gJz23JjaQykEzMylko/S1xGVRZnSnl5SJivdPmLvBjTSLHRikP0DosU/ApKFYOW8b2duPleE0PK1gN6hIUOf23uTgmhl64FhUvp3uTdc4/f7V4TjpPUYMeH3ITmFJHRdy6aZl56bqTybL+Hp+4Ic4Wr6vMtyXY5gnvk6I9E7r+yvUdi9Lc6wTwdR54HzeSIaMCL4G15fVOXgP
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 14:35:55.6742
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e4d7755-554d-4d4c-18f8-08de78690367
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E4.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7827
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_063603_512630_8F49CB61 
X-CRM114-Status: UNSURE (   9.08  )
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

LX2160 SoC pci-e controller supports 64-bit memory regions up to 16GB,
32-bit regions up to 3GB and 16-bit regions up to 64k.

For each pci-e controller:
- extend the existing 32-bit regions to 3GB size
- add 16-bit region
- add 64-bit region
See [1] amd [2] for boot messages showing ranges before and after.

The 64-bit area flags are very particular:
- IORESOURCE_AUTO: ensures of_bus_pci_get_flags sets prefetch flag
  (avoids "Memory resource size exceeds max for 32 bits" error during
   boot, generated by pci_parse_request_of_pci_ranges)
- IORESOURCE_SYSRAM_DRIVER_MANAGED: ensures IORESOURCE_MEM flag is not
  cleared, as required by devm_of_pci_get_host_bridge_resources to print
  correct resource type during boot:
  MEM 0xa700000000..0xa7ffffffff -> 0xa700000000 (with this flag)
  err 0xa700000000..0xa7ffffffff -> 0xa700000000 (without)
- IORESOURCE_MEM_64: pci address space is 64-bit
- IORESOURCE_PREFETCH: is prefetchable
- IORESOURCE_MEM: is memory (set implicitly when omitted in dts)

IORESOURCE_BUSY is dropped since it has no effect when specified in dts.

The 16GB 64-bit area is split into 4 pieces because the layerscape pcie
driver fails to program atu for larger ranges [3].

The range for 16-bit io window was defined by Jon Nettleton, and
includes flag IORESOURCE_EXT_TYPE_BITS to support multiport io cards.

Similar memory allocation with similar flags was tested with UEFI and ACPI
on pcie3 and pcie5.

This specific set of ranges was tested with nxp bsp versions lsdk-21.08,
ls-5.15.71-2.2.0, ls-6.6.52-2.2.0, Debian 13 (v6.12.41), mainline v7.0-rc2,
using u-boot:
- pcie5 with a Radeon Pro WX2100 with Gnome Desktop
- pcie3 with an ADATA NVME

This fixes allocation of large, and 64-bit BARs as requested by many pci
cards - especially graphics processors or AI accelerators, e.g.:

[    2.941187] pci 0000:01:00.0: BAR 0: no space for [mem size 0x200000000 64bit pref]
[    2.948834] pci 0000:01:00.0: BAR 0: failed to assign [mem size 0x200000000 64bit pref]

[1] example of new allocations (pcie5):
[    1.716942] layerscape-pcie 3800000.pcie: host bridge /soc/pcie@3800000 ranges:
[    1.724261] layerscape-pcie 3800000.pcie:      MEM 0xa700000000..0xa7ffffffff -> 0xa700000000
[    1.732795] layerscape-pcie 3800000.pcie:      MEM 0xa600000000..0xa6ffffffff -> 0xa600000000
[    1.741325] layerscape-pcie 3800000.pcie:      MEM 0xa500000000..0xa5ffffffff -> 0xa500000000
[    1.749861] layerscape-pcie 3800000.pcie:      MEM 0xa400000000..0xa4ffffffff -> 0xa400000000
[    1.758389] layerscape-pcie 3800000.pcie:      MEM 0xa040000000..0xa0ffffffff -> 0x0040000000
[    1.766915] layerscape-pcie 3800000.pcie:       IO 0xa010000000..0xa01000ffff -> 0x0000000000
[    1.776141] layerscape-pcie 3800000.pcie: iATU: unroll F, 256 ob, 24 ib, align 4K, limit 4G
[    1.880382] layerscape-pcie 3800000.pcie: PCIe Gen.3 x8 link up
[    1.886349] layerscape-pcie 3800000.pcie: PCI host bridge to bus 0001:00
[    1.893046] pci_bus 0001:00: root bus resource [bus 00-ff]
[    1.898525] pci_bus 0001:00: root bus resource [mem 0xa700000000-0xa7ffffffff pref]
[    1.906174] pci_bus 0001:00: root bus resource [mem 0xa600000000-0xa6ffffffff pref]
[    1.913822] pci_bus 0001:00: root bus resource [mem 0xa500000000-0xa5ffffffff pref]
[    1.921471] pci_bus 0001:00: root bus resource [mem 0xa400000000-0xa4ffffffff pref]
[    1.929120] pci_bus 0001:00: root bus resource [mem 0xa040000000-0xa0ffffffff] (bus address [0x40000000-0xffffffff])
[    1.939633] pci_bus 0001:00: root bus resource [io  0x0000-0xffff]
[    1.945824] pci 0001:00:00.0: [1957:8d80] type 01 class 0x060400 PCIe Root Port
[    1.953146] pci 0001:00:00.0: PCI bridge to [bus 01-ff]
[    1.958369] pci 0001:00:00.0:   bridge window [io  0x1000-0x1fff]
[    1.964456] pci 0001:00:00.0:   bridge window [mem 0xa040000000-0xa0502fffff]

[2] example of previous allocations (pcie5):
[    1.716744] layerscape-pcie 3800000.pcie: host bridge /soc/pcie@3800000 ranges:
[    1.724060] layerscape-pcie 3800000.pcie:      MEM 0xa040000000..0xa07fffffff -> 0x0040000000
[    1.733277] layerscape-pcie 3800000.pcie: iATU: unroll F, 256 ob, 24 ib, align 4K, limit 4G
[    1.836220] layerscape-pcie 3800000.pcie: PCIe Gen.3 x8 link up
[    1.842186] layerscape-pcie 3800000.pcie: PCI host bridge to bus 0001:00
[    1.848883] pci_bus 0001:00: root bus resource [bus 00-ff]
[    1.854363] pci_bus 0001:00: root bus resource [mem 0xa040000000-0xa07fffffff] (bus address [0x40000000-0x7fffffff])
[    1.864892] pci 0001:00:00.0: [1957:8d80] type 01 class 0x060400 PCIe Root Port
[    1.872216] pci 0001:00:00.0: PCI bridge to [bus 01-ff]
[    1.877438] pci 0001:00:00.0:   bridge window [io  0x1000-0x1fff]
[    1.883526] pci 0001:00:00.0:   bridge window [mem 0xa040000000-0xa0502fffff]

[3] error programming atu beyond 4GB:
[    1.716762] layerscape-pcie 3800000.pcie: host bridge /soc/pcie@3800000 ranges:
[    1.724080] layerscape-pcie 3800000.pcie:      MEM 0xa400000000..0xa7ffffffff -> 0xa400000000
[    1.732615] layerscape-pcie 3800000.pcie:      MEM 0xa040000000..0xa0ffffffff -> 0x0040000000
[    1.741142] layerscape-pcie 3800000.pcie:       IO 0xa010000000..0xa01000ffff -> 0x0000000000
[    1.750379] layerscape-pcie 3800000.pcie: iATU: unroll F, 256 ob, 24 ib, align 4K, limit 4G
[    1.759089] layerscape-pcie 3800000.pcie: Failed to set MEM range [mem 0xa400000000-0xa7ffffffff flags 0x2200]
[    1.769089] layerscape-pcie 3800000.pcie: probe with driver layerscape-pcie failed with error -22

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
Changes in v4
- dropped accidentally added empty line at top of file:
- actually drop RFC prefix
- rebased on v7.0-rc1 and re-tested on v7.0-rc2
- Link to v3: https://lore.kernel.org/r/20250907-lx2160-pci-v3-1-bb66cc41b8f9@solid-run.com

Changes in v3:
- dropped rfc label
- adjusted flags
- split 16GB area into 4x4GB sections.
- enhance commit description with details explanation
- Link to v2: https://lore.kernel.org/r/20240429-lx2160-pci-v2-1-1b94576d6263@solid-run.com

Changes in v2:
- adjusted flags to fix several errors during probe and bar allocation
- explicitly tested with 2 pci cards on Debian (Linux 6.1)
- still rfc because a limitation in designware pci driver
- Link to v1: https://lore.kernel.org/r/20240321-lx2160-pci-v1-1-3673708f7eb6@solid-run.com
---
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi | 42 ++++++++++++++++++++++----
 1 file changed, 36 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
index 853b01452813a..5b48de0c853a8 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
@@ -1185,7 +1185,12 @@ pcie1: pcie@3400000 {
 			apio-wins = <8>;
 			ppio-wins = <8>;
 			bus-range = <0x0 0xff>;
-			ranges = <0x82000000 0x0 0x40000000 0x80 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
+			ranges = <0x42102200 0x87 0x00000000 0x87 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x42102200 0x86 0x00000000 0x86 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x42102200 0x85 0x00000000 0x85 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x42102200 0x84 0x00000000 0x84 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x02000200 0x00 0x40000000 0x80 0x40000000 0x00 0xc0000000>, /* 32-Bit - non-prefetchable */
+				 <0x01200100 0x00 0x00000000 0x80 0x10000000 0x00 0x00010000>; /* 16-Bit IO Window */
 			msi-parent = <&its 0>;
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 7>;
@@ -1213,7 +1218,12 @@ pcie2: pcie@3500000 {
 			apio-wins = <8>;
 			ppio-wins = <8>;
 			bus-range = <0x0 0xff>;
-			ranges = <0x82000000 0x0 0x40000000 0x88 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
+			ranges = <0x42102200 0x8f 0x00000000 0x8f 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x42102200 0x8e 0x00000000 0x8e 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x42102200 0x8d 0x00000000 0x8d 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x42102200 0x8c 0x00000000 0x8c 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x02000200 0x00 0x40000000 0x88 0x40000000 0x00 0xc0000000>, /* 32-Bit - non-prefetchable */
+				 <0x01200100 0x00 0x00000000 0x88 0x10000000 0x00 0x00010000>; /* 16-Bit IO Window */
 			msi-parent = <&its 0>;
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 7>;
@@ -1241,7 +1251,12 @@ pcie3: pcie@3600000 {
 			apio-wins = <256>;
 			ppio-wins = <24>;
 			bus-range = <0x0 0xff>;
-			ranges = <0x82000000 0x0 0x40000000 0x90 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
+			ranges = <0x42102200 0x97 0x00000000 0x97 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x42102200 0x96 0x00000000 0x96 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x42102200 0x95 0x00000000 0x95 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x42102200 0x94 0x00000000 0x94 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x02000200 0x00 0x40000000 0x90 0x40000000 0x00 0xc0000000>, /* 32-Bit - non-prefetchable */
+				 <0x01200100 0x00 0x00000000 0x90 0x10000000 0x00 0x00010000>; /* 16-Bit IO Window */
 			msi-parent = <&its 0>;
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 7>;
@@ -1269,7 +1284,12 @@ pcie4: pcie@3700000 {
 			apio-wins = <8>;
 			ppio-wins = <8>;
 			bus-range = <0x0 0xff>;
-			ranges = <0x82000000 0x0 0x40000000 0x98 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
+			ranges = <0x42102200 0x9f 0x00000000 0x9f 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x42102200 0x9e 0x00000000 0x9e 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x42102200 0x9d 0x00000000 0x9d 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x42102200 0x9c 0x00000000 0x9c 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x02000200 0x00 0x40000000 0x98 0x40000000 0x00 0xc0000000>, /* 32-Bit - non-prefetchable */
+				 <0x01200100 0x00 0x00000000 0x98 0x10000000 0x00 0x00010000>; /* 16-Bit IO Window */
 			msi-parent = <&its 0>;
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 7>;
@@ -1297,7 +1317,12 @@ pcie5: pcie@3800000 {
 			apio-wins = <256>;
 			ppio-wins = <24>;
 			bus-range = <0x0 0xff>;
-			ranges = <0x82000000 0x0 0x40000000 0xa0 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
+			ranges = <0x42102200 0xa7 0x00000000 0xa7 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x42102200 0xa6 0x00000000 0xa6 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x42102200 0xa5 0x00000000 0xa5 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x42102200 0xa4 0x00000000 0xa4 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x02000200 0x00 0x40000000 0xa0 0x40000000 0x00 0xc0000000>, /* 32-Bit - non-prefetchable */
+				 <0x01200100 0x00 0x00000000 0xa0 0x10000000 0x00 0x00010000>; /* 16-Bit IO Window */
 			msi-parent = <&its 0>;
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 7>;
@@ -1325,7 +1350,12 @@ pcie6: pcie@3900000 {
 			apio-wins = <8>;
 			ppio-wins = <8>;
 			bus-range = <0x0 0xff>;
-			ranges = <0x82000000 0x0 0x40000000 0xa8 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
+			ranges = <0x42102200 0xaf 0x00000000 0xaf 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x42102200 0xae 0x00000000 0xae 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x42102200 0xad 0x00000000 0xad 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x42102200 0xac 0x00000000 0xac 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x02000200 0x00 0x40000000 0xa8 0x40000000 0x00 0xc0000000>, /* 32-Bit - non-prefetchable */
+				 <0x01200100 0x00 0x00000000 0xa8 0x10000000 0x00 0x00010000>; /* 16-Bit IO Window */
 			msi-parent = <&its 0>;
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 7>;

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20240118-lx2160-pci-4bdb196e58f3

Best regards,
-- 
Josua Mayer <josua@solid-run.com>


