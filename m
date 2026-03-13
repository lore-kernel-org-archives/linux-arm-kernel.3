Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 927B0105F7AF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 14:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WsyMjSIw1aGlH7zl3d7PA/un7oBxHUwTK+A4jjGSBEQ=; b=PENk7NMu9G5sg6o3etPxCtSGk2
	UU+HajXuCa2zsuwx5Ivs295xH1gM9fCQmYM7MDt5FVeTBe5qDKvAfbkcP/vxxE032f/TYiDFAN8yK
	PAbaS1n+N2MrR3FsgrRq7iNLoyaqsoPodsRk3NRGQI63Ei0Z7o1TYIOq+JYdxdAw20M6AXiBdsizC
	3ipdmtCsFj6Y78CvyQhDHSOswHPAMUIqHVEOx78VwUQ+cumv8EEKui0Kp88gaPbpY2PHx+rgz8lpS
	tRrkl4/cNNRkrOCU1SMd4bA/zG92Dx0K4T2nSVdK8Jg3BfC1dq9d9GPpeIli6bsGLeg5J9kOGQEuZ
	3Q1DKCiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13O8-00000000MpS-2Ehj;
	Fri, 13 Mar 2026 14:21:16 +0000
Received: from mail-swedencentralazon11023103.outbound.protection.outlook.com ([52.101.83.103] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13O4-00000000Mkx-0U5o
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 14:21:13 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=qGwEInXfNN7GCi6P6qOsqjBG1xkgHKppADfAsVWIaGCGudTtflgAJWOGRUqAP8o+XoqJjrb1Xkd+O1i8aTm4pqkWKEwimyizppyX+7nxa1mbdqyC/X19HsRx/Ydc+F169dIaS7FVjglny0QmswVvAjUkYfVNAX+uwPnnSRU9aqrTYg0TaPGwS+DMOXZukKX762hHgp4O5wBJwVuiCdy4Qp9LLk24Po0qqQib31Ezu3YHbOeHi5ty+8aLxDs/sxrLwxJIWIqUEmjcKK1Sq1nx3Rye9Yx0KmU6ulH0LkPGG0vyCLU8FZQVbMBk3YhIoeynDhS3SHP9N7+mU1Z2MrnnUg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WsyMjSIw1aGlH7zl3d7PA/un7oBxHUwTK+A4jjGSBEQ=;
 b=SUcMVLn3qzm+gjePS9kacjW7OUI6oBVpWKLn5Qlt37YWNaFl5pvmjpAoU/6g4G+97ygtcfnLHmnKC9WSWj9wDqErdCggE1Xxjnd3Tju59EOLT7FRdTWSfGQFPApyidytr9PP6rC5FlvMDnMWRAG0Raqq1fgvtC1x4iNN/rh0rPhPnWLBLdABd+n9+wdokFC2kzGTBk8zRtirGSPfSq489OxDw9Q+RhvO1k1Dpv2Hte+vU4CwO3Fr6A1H1tiXoNpjgYl/5Rv44QcZQItYQRdgtUkSQycDbFj5BObFHiIvoDW8YBAk0G6jsMqsypzKThBelRLPB3q4lLAieDyYvG+PzQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=softfail (sender ip
 is 52.17.62.50) smtp.rcpttodomain=kernel.org smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WsyMjSIw1aGlH7zl3d7PA/un7oBxHUwTK+A4jjGSBEQ=;
 b=Bow/Z3+nooYt+oT5x/opmdc+0vWmodOZxw+UxEwEfBjpjx0advC6eA5JaqMTSuwxQPxLLhmFx6EuGA02Jg/AUWVgiCLmE/wIoNPiI/gx0BTlHRP8KyjdJC/kPOjQiVMLk0QBYwteb4+YDAzl4D6X5sN7tZomSJjo2DOFieXsa/A=
Received: from AS4P251CA0003.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d2::9)
 by AM9PR04MB7521.eurprd04.prod.outlook.com (2603:10a6:20b:2df::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Fri, 13 Mar
 2026 14:20:51 +0000
Received: from AM4PEPF00025F9A.EURPRD83.prod.outlook.com
 (2603:10a6:20b:5d2:cafe::b8) by AS4P251CA0003.outlook.office365.com
 (2603:10a6:20b:5d2::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.30 via Frontend Transport; Fri,
 13 Mar 2026 14:21:04 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 solid-run.com discourages use of 52.17.62.50 as permitted sender)
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM4PEPF00025F9A.mail.protection.outlook.com (10.167.16.9) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.1 via
 Frontend Transport; Fri, 13 Mar 2026 14:21:04 +0000
Received: from emails-1185300-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-17.eu-west-1.compute.internal [10.20.6.17])
	by mta-outgoing-dlp-834-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 014F57FF80;
	Fri, 13 Mar 2026 14:21:04 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Fri Mar 13 14:20:56 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ubBQN3U+1keDRCUsoq+PiZt9s0gjbgKUqbrtV/IuCapOkz+Epmi+vb5Wsr4sXBKRTPGQqIpCrGOCl8JFQ/6vrI4VivcDzCta5YV+uTskVMgKgTDD9vmqgz0VktA9EBsoy//mRucGN7u4T/j8OdmJJZO+FbYrjhMjufLUBvukZg04xtiz8Zx95quo6Q0NyW6x7IZLUfWz3ThmEGv0Y6GlDCbuPW4U8xtly5ilItfb9uLSDWaDKZn5Ji3AE3E4P43lwcKbnpOaGdrM329Ij8h7oZe9wbTjaWAIB2cIZ855BBMCB60e74ASFWO0ghUTxbzXjIypmKT0J003NAUlMqvW/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WsyMjSIw1aGlH7zl3d7PA/un7oBxHUwTK+A4jjGSBEQ=;
 b=WIHwvGFxNbmwQDnAJ8qyiH6RlVgZ4oscluUwB7scA6c3Fjy6hd58KsH7IiqRthzeTX5kfCtXp2o3c2ez0eobiKrSwCIG69kJavYh4r6QJeX7I2fxL/4cwwOYxMgHGTO/vxVjvgAh7ix8NmRAYvZVLdNoq9NTIZ3bOPzaqntvvVu97hqrsrHHQvNZhCkUK3aoeDvIffKUAih25qvDuP/x96dhYY7TCX1LGGCr9OGLnc2tx1G4U//XwG0+4DeQrm4jRrobYCmM0KUHeeFAl5Q8TdoNIr8BGcB5TIpOUgqcOQICiKVBNpgfawRLEaMAcpE1gd3C0KDK6QH2PVltCojktg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WsyMjSIw1aGlH7zl3d7PA/un7oBxHUwTK+A4jjGSBEQ=;
 b=Bow/Z3+nooYt+oT5x/opmdc+0vWmodOZxw+UxEwEfBjpjx0advC6eA5JaqMTSuwxQPxLLhmFx6EuGA02Jg/AUWVgiCLmE/wIoNPiI/gx0BTlHRP8KyjdJC/kPOjQiVMLk0QBYwteb4+YDAzl4D6X5sN7tZomSJjo2DOFieXsa/A=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by AM9PR04MB8355.eurprd04.prod.outlook.com (2603:10a6:20b:3b7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Fri, 13 Mar
 2026 14:20:52 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1%3]) with mapi id 15.20.9700.015; Fri, 13 Mar 2026
 14:20:40 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Fri, 13 Mar 2026 15:20:48 +0100
Subject: [PATCH v4 07/10] arm64: dts: lx2160a: complete pinmux for rcwsr12
 configuration word
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-lx2160-sd-cd-v4-7-aabcf230fbff@solid-run.com>
References: <20260313-lx2160-sd-cd-v4-0-aabcf230fbff@solid-run.com>
In-Reply-To: <20260313-lx2160-sd-cd-v4-0-aabcf230fbff@solid-run.com>
To: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Carlos Song <carlos.song@nxp.com>
Cc: Mikhail Anikin <mikhail.anikin@solid-run.com>, 
 Yazan Shhady <yazan.shhady@solid-run.com>, 
 Rabeeh Khoury <rabeeh@solid-run.com>, Frank Li <frank.li@nxp.com>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: FR4P281CA0020.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::18) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PAXPR04MB8749:EE_|AM9PR04MB8355:EE_|AM4PEPF00025F9A:EE_|AM9PR04MB7521:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cfb7458-2d94-4fc3-331e-08de810bc29f
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original: SV9gYbKpj2Vm8snT7QFEmCXSsXJBdI9SI1m4xxkS9jnI7m2fQXknE7SL0XOxOskoN1bAw3QP2k02mFKI6XyjOq/e48e4faTfjGwQ6Da8nvYLqlfggTAlbXujFmK6ej8Ow3bYhb3az6x2RzcAVuD1FdAQBfOle/3Wq4+8bpfh2rZNhl9ejxgdAdSaBRpWLpgH/0UgaFqfWES+QwAPJTvYjJ4atbshfDoxOS1WIk+QrNAa7XmiC1SCZ9lTBGfkKS4E5zIrux33wb6PFM1upSRNlVLjewA7G48wYDGxePhjOyarg48RaEJFpyeYWyI0JVZErFCwVbjpfjwfaGM1lML78yO8mXTxD2B0wrHLhoMO57EY+Ne0myrKUWSYqgDUYTs7ck+jCsjl2nrRtJKVqPVEQrgGOKb73ZQyxM3+WdpiKobNpad0y1Js4gBS1jRWrEYc1O8dOKzh9j83OA9AF5YNF4kQSWJ4MwzZeV3gCj9ShVGawQ1gKqrl3bvb3c+z0KZF0Inyj9WYK7SPUMv0Aplj/+K9h5bbJVrBjwBRRIfm4Abmo9XFxtG0pWmc6nKFxO14YF33Jt77OReZbErOZ+iRhCLUpsOhm8zcMv4Bg66j8QLl2IQmYbIRIYP0T1m/1o/v3rh0sdrKxd5+zHKxS3hnnM3Qh/VhDyR1bCfWaVIFdTvFnQJneaKA45f0wDY5+3HbI82FUb2hQfK1a89fc45mxdrWW89U1lS6uIcK1sqNtuh/3VEOcmefpk2aayqSwXoOM9LcrpqAY3WiVK0gONiZ+YLf8mpvMvwLIr25PH9YVBU=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked: OhmDAr7Lpb+ejuDHyBxTcsYa3Avp7f/w+WQdKHrsCNg15E7VwYk4E+pFrcxl8xch1iJPrOU7L7+iCOflOlsHKvWSTGedCMlkFMW87vrqf9C+rsYs4wm+/IOdFH1AmsVnp0rTcGaKktjwjdJaryZrIxfc2sufNrNXS51d4NJ75e/ANg/A2FerJ/gC2gD9pWSbuGeSgu2QnRquZ/W6vsTvvve/wJpJJ/N3RwbrS+fLF3wkOw2n7Xn+3mYivyHFwKu1NXcVJSUxRDm0mTQK5sz8hJ1eErI8x9Y2gDuND7nw4A7rggZPaJxXj4MIdVF3U0+npbJm48cm4imqu4KJsd/2TA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8355
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: d9f523543fa54a5cb47772f1bd7f8b58:solidrun,office365_emails,sent,inline:63fc3aa5d97fb79fbbc6fc70877a80c6
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00025F9A.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 339e6458-136a-4fe7-0fdf-08de810bb43b
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|14060799003|35042699022|36860700016|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 12fCUVM/SZFU20xARfUQpoTP2skGZsg9Gg1zHbDU5yFjqS3pwAb1ZyXFuVXEaFdDWE4KACakCTJPeg+vitMiy2wtYmUL/170WGCR5vHwHc22406iCUMfA6Mtf4SQ2ZHhmpjSQBxtn9DB4yWgERAjdhqAM0HckRr9une58CvGmHeDi+Ag5wHSDi/jhqbf57vYRjMNvB+saC4clMr/pg3A1H+fZ2TdW58OncGF00TjzOcfYi5jJHS72CPKaVFmMS/rBpRvWQcjFROOAt3mATT3BtNHkABeLHIMibRiQcmoBW41jKpJ7IPgPhuTRrLwD5rY3NAdinuvSR7Lq7UAX8nEKEm9vpYTBeKSqkzBrRw0Wen731fq9J5b8cymxpbxTfXrZ2Dl75WtADKyXAmDoU1fIRbkE3ncISkDp3WyYFfXsxP6PNRdD90RQZ4mGoQgRp64VqTnHmJcXrKimL1ZebW//fQObjTsUk5Gp5x7vbFJFFvttVWKeF74OF1RpjEKk9aP058YLzpUR6gwEaLhEdZ/qaLJKjoQVnUL3wHNoycNeNlrfmDKt+XdKEFH/Du/eo85btn48t+SfAcH3R5KT6jDSlk2kbCsQ4g1B4sqWNIMXt0YFxYU3Pp//idWXbCbaYgvxiCEdN+k06mrR2cG0R/VLTIDHnzdyrtsnZK1j98ofHPHjmjVN18wIq5QGwqKVxz2HtHFxgSV7+IybqNAtK0+xsL3bUZFSBIOME4rw4pMmK2Jc4OrajpeG465uyN7PHD4CK4lDL7CovVtanF1uD9iNA==
X-Forefront-Antispam-Report: CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(14060799003)(35042699022)(36860700016)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: QUcWLENpu1jgkuhK8o06rBiWnTFkAg8UBXmvLhGtlF0OmaTcv/JSDzt2fZ40yBzJTuVh678dRqRoXB3p5+Fx3czXXrydu2UtXyicxzEHo3rjb3nbRKYN4/KG3GEYCg2UMKcmAiKoIW/hQHO9kmEtJINCHNQu4IkovFaLO1oUtC3k4ISuL88QRTq6qCVvPgLO748IHjyWK6m3igQGI5h+8vdDF64I996GO0cnT2+wcpWRb8uuCfEMP96/fQcD6mRHaWjRq6FCfkMVo/VPukl0CE4IZPxeB36DdVMqJmBhuUntLS1bLfWwywW886g+5/oajbaUQM9kwK2wLZbJUqa/bSXxBDki5Y7YOkPquCAXoGNTaS/eGLd4Mnw3iI0qXu9HmYqNvI2bbIw8jk1E0Q5hg5HZT5YSgehUvurPlSNDjJe3b15E+kKV9JGfP0kyBNLi
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 14:21:04.2022
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cfb7458-2d94-4fc3-331e-08de810bc29f
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00025F9A.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7521
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_072112_191753_3C5E519C 
X-CRM114-Status: UNSURE (   9.29  )
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

Commit 8a1365c7bbc1 ("arm64: dts: lx2160a: add pinmux and i2c gpio to
support bus recovery") introduced pinmux nodes for lx2160 i2c
interfaces, allowing runtime change between i2c and gpio functions
implementing bus recovery.

This can cause unintended side-effects because the dynamic configuration
area where pinmux is modified at runtime reads zero initially, causing
application of the first pinmux node to clear any other bits previously
set during reset configuration.

It is possible for bootloaders to implement a workaround and copy from
the reset values from read-only area to dynamic configuration area,
however bootloader updates should not be required for kernel updates.

Alternatively pinmux in device-tree can be made complete, to cover all
bits of a 32-bit register, not just i2c & gpio functions, e.g. for
RCWSR12 register:

LX2162-CF RCWSR12: 0b0000100000000000 0000000000000110
IIC2_PMUX              |||   |||   || |   |||   |||XXX : I2C/GPIO/CD-WP
IIC3_PMUX              |||   |||   || |   |||   XXX    : I2C/GPIO/CAN/EVT
IIC4_PMUX              |||   |||   || |   |||XXX|||    : I2C/GPIO/CAN/EVT
IIC5_PMUX              |||   |||   || |   XXX   |||    : I2C/GPIO/SDHC-CLK
IIC6_PMUX              |||   |||   || |XXX|||   |||    : I2C/GPIO/SDHC-CLK
XSPI1_A_DATA74_PMUX    |||   |||   XX X   |||   |||    : XSPI/GPIO
XSPI1_A_DATA30_PMUX    |||   |||XXX|| |   |||   |||    : XSPI/GPIO
XSPI1_A_BASE_PMUX      |||   XXX   || |   |||   |||    : XSPI/GPIO
SDHC1_BASE_PMUX        |||XXX|||   || |   |||   |||    : SDHC/GPIO/SPI
SDHC1_DIR_PMUX         XXX   |||   || |   |||   |||    : SDHC/GPIO/SPI
RESERVED             XX|||   |||   || |   |||   |||    :

Add description for all bits of RCWSR12 register, including i2c, gpio,
flextimer, spi, can and sdhc.

Other configuration words, i.e. RCWSR13 & RCWSR14 may be added in the
future for boards setting non-zero values there.

Fixes: 8a1365c7bbc1 ("arm64: dts: lx2160a: add pinmux and i2c gpio to support bus recovery")
Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi | 75 ++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
index 57c0fd02d6c69..4d7800a697d72 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
@@ -1721,6 +1721,7 @@ pinmux_i2crv: pinmux@70010012c {
 			pinctrl-single,register-width = <32>;
 			pinctrl-single,function-mask = <0x7>;
 
+			/* RCWSR12 */
 			i2c1_pins: iic2-i2c-pins {
 				pinctrl-single,bits = <0x0 0x0 0x7>;
 			};
@@ -1729,6 +1730,10 @@ gpio0_31_30_pins: iic2-gpio-pins {
 				pinctrl-single,bits = <0x0 0x1 0x7>;
 			};
 
+			ftm0_ch10_pins: iic2-ftm-pins {
+				pinctrl-single,bits = <0x0 0x2 0x7>;
+			};
+
 			esdhc0_cd_wp_pins: iic2-sdhc-pins {
 				pinctrl-single,bits = <0x0 0x6 0x7>;
 			};
@@ -1741,6 +1746,14 @@ gpio0_29_28_pins: iic3-gpio-pins {
 				pinctrl-single,bits = <0x0 (0x1 << 3) (0x7 << 3)>;
 			};
 
+			can0_pins: iic3-can-pins {
+				pinctrl-single,bits = <0x0 (0x2 << 3) (0x7 << 3)>;
+			};
+
+			event65_pins: iic3-event-pins {
+				pinctrl-single,bits = <0x0 (0x6 << 3) (0x7 << 3)>;
+			};
+
 			i2c3_pins: iic4-i2c-pins {
 				pinctrl-single,bits = <0x0 0x0 (0x7 << 6)>;
 			};
@@ -1749,6 +1762,14 @@ gpio0_27_26_pins: iic4-gpio-pins {
 				pinctrl-single,bits = <0x0 (0x1 << 6) (0x7 << 6)>;
 			};
 
+			can1_pins: iic4-can-pins {
+				pinctrl-single,bits = <0x0 (0x2 << 6) (0x7 << 6)>;
+			};
+
+			event87_pins: iic4-event-pins {
+				pinctrl-single,bits = <0x0 (0x6 << 6) (0x7 << 6)>;
+			};
+
 			i2c4_pins: iic5-i2c-pins {
 				pinctrl-single,bits = <0x0 0x0 (0x7 << 9)>;
 			};
@@ -1757,6 +1778,14 @@ gpio0_25_24_pins: iic5-gpio-pins {
 				pinctrl-single,bits = <0x0 (0x1 << 9) (0x7 << 9)>;
 			};
 
+			esdhc0_clksync_pins: iic5-sdhc-clk-pins {
+				pinctrl-single,bits = <0x0 (0x2 << 9) (0x7 << 9)>;
+			};
+
+			dspi2_miso_mosi_pins: iic5-spi3-pins {
+				pinctrl-single,bits = <0x3 (0x2 << 9) (0x7 << 9)>;
+			};
+
 			i2c5_pins: iic6-i2c-pins {
 				pinctrl-single,bits = <0x0 0x0 (0x7 << 12)>;
 			};
@@ -1765,26 +1794,71 @@ gpio0_23_22_pins: iic6-gpio-pins {
 				pinctrl-single,bits = <0x0 (0x1 << 12) (0x7 << 12)>;
 			};
 
+			esdhc1_clksync_pins: iic6-sdhc-clk-pins {
+				pinctrl-single,bits = <0x0 (0x2 << 12) (0x7 << 12)>;
+			};
+
 			fspi_data74_pins: xspi1-data74-pins {
 				pinctrl-single,bits = <0x0 0x0 (0x7 << 15)>;
 			};
 
+			gpio1_31_28_pins: xspi1-data74-gpio-pins {
+				pinctrl-single,bits = <0x0 0x1 (0x7 << 15)>;
+			};
+
 			fspi_data30_pins: xspi1-data30-pins {
 				pinctrl-single,bits = <0x0 0x0 (0x7 << 18)>;
 			};
 
+			gpio1_27_24_pins: xspi1-data30-gpio-pins {
+				pinctrl-single,bits = <0x0 0x1 (0x7 << 18)>;
+			};
+
 			fspi_dqs_sck_cs10_pins: xspi1-base-pins {
 				pinctrl-single,bits = <0x0 0x0 (0x7 << 21)>;
 			};
 
+			gpio1_23_20_pins: xspi1-base-gpio-pins {
+				pinctrl-single,bits = <0x0 0x1 (0x7 << 21)>;
+			};
+
 			esdhc0_cmd_data30_clk_vsel_pins: sdhc1-base-sdhc-vsel-pins {
 				pinctrl-single,bits = <0x0 0x0 (0x7 << 24)>;
 			};
 
+			gpio0_21_15_pins: sdhc1-base-gpio-pins {
+				pinctrl-single,bits = <0x0 (0x1 << 24) (0x7 << 24)>;
+			};
+
+			dspi0_pins: sdhc1-base-spi1-pins {
+				pinctrl-single,bits = <0x0 (0x2 << 24) (0x7 << 24)>;
+			};
+
+			esdhc0_cmd_data30_clk_dspi2_cs0_pins: sdhc1-base-sdhc-spi3-pins {
+				pinctrl-single,bits = <0x0 (0x3 << 24) (0x7 << 24)>;
+			};
+
+			esdhc0_cmd_data30_clk_data4_pins: sdhc1-base-sdhc-data4-pins {
+				pinctrl-single,bits = <0x0 (0x4 << 24) (0x7 << 24)>;
+			};
+
+			esdhc0_dir_pins: sdhc1-dir-pins {
+				pinctrl-single,bits = <0x0 0x0 (0x7 << 27)>;
+			};
+
 			gpio0_14_12_pins: sdhc1-dir-gpio-pins {
 				pinctrl-single,bits = <0x0 (0x1 << 27) (0x7 << 27)>;
 			};
 
+			dspi2_cs31_pins: sdhc1-dir-spi3-pins {
+				pinctrl-single,bits = <0x0 (0x3 << 27) (0x7 << 27)>;
+			};
+
+			esdhc0_data75_pins: sdhc1-dir-sdhc-pins {
+				pinctrl-single,bits = <0x0 (0x4 << 27) (0x7 << 27)>;
+			};
+
+			/* RCWSR13 */
 			gpio1_18_15_pins: iic8-iic7-gpio-pins {
 				pinctrl-single,bits = <0x4 0x1 0x7>;
 			};
@@ -1793,6 +1867,7 @@ i2c6_i2c7_pins: iic8-iic7-i2c-pins {
 				pinctrl-single,bits = <0x4 0x2 0x7>;
 			};
 
+			/* RCWSR14 */
 			i2c0_pins: iic1-i2c-pins {
 				pinctrl-single,bits = <0x8 0x0 (0x1 << 10)>;
 			};

-- 
2.51.0


