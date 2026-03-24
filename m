Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEEA6D58CCA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 12:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FYlSIaVXE6oyKGXhaBt+kquYAW+UQwHEZ4RwbjKeZnw=; b=A+cbdp6tL3XEollqavd/Zoa9m1
	TxFM4Z5jiXy53zZnPv8PR3CPxs7xhY4XC210r3DD9j+OQ9KNFDOLjC3ha+bldfI3KVnOqyZQNuLM2
	ZvXtimOPLQb3AK+6+hHzQ7+7sblH7MSEmy5O51WtjSaYO8vkgdsPnIDdEUgDecFExdNC7p72X/d/2
	RohPqJ7NM8Bd7DfLh7/JSbcN0pLoPeS9N1rfy1hFAJ4sP3VDvTnIEWeFv1QGgHE2+Ilxfo4MYvR7a
	eD8eZAO74WyHt3Wcrox+nzTvmf2IOYTpjxYcGSJJWvB7Emw+kRCt7vtmREXkI/fA7LPTEiapVvAFf
	zMOcBUgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w514s-00000001OyY-32hS;
	Tue, 24 Mar 2026 12:41:46 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w514m-00000001OtN-2dnq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 12:41:42 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=mUb1zNjM6RYGLUmht8dQFDAtJ5+cxbtNdNgYhRM4XJKx3hJNZzDy1BIdLKHefz+yiajFyvzbzaPy0yGimV8/siTCRqUOJzkNzfoRTVb4r0MpSKlmKpS0yAcLzHozYCBy9SmEwf8S23hxz7KhfU21UWX2ttqneO4Kydvnyt1xYpHF2nTRXQaBSVL/dEbLBaLZtiVyt5u4I6+iJpwe58m6XiQRMYu5Tu5fHt8sNxrqqPjZVruAKHfrE3qwg0qgf2qaB+CPBvXo/VAZPxm81mE2oWxDPuJgPRXl2LWEwMMAQnGqcp7QKlq6PvjBkV0pStWWcS6E92rFXnVUiB6oyZrd5g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FYlSIaVXE6oyKGXhaBt+kquYAW+UQwHEZ4RwbjKeZnw=;
 b=PmC6rMizd9oojzjo1tlkX6SBYxR1fvdjWjjb74j11HGwBMIxuVN1Sad2dqLpFg14AuTpx1MMleZt184TXon0RoLndqxzo3ijoQrdBl3lWQRdDwsSUnVEVztTyv284yEb9qgj96xiO6lrNP+7S0mm/UXemDF/nprCMubWmstJNvP/o1MvkhTAS9H1EOVxc2b3pU8V1BojC56ZMMumnLa2S2k/ithQjcqn2leNI2AjaVMdjq7NZneY1Dfm9qHmoBIzN9i1vQn0Q+zdsHgd980LiNjMBPqfjrtD88XYlMbiBHmstaQht1tBcHt4h1Md7Vi7ajNLsXDKtm7bGi4wrF5YHg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=kernel.org smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FYlSIaVXE6oyKGXhaBt+kquYAW+UQwHEZ4RwbjKeZnw=;
 b=lhnL4geEGmKtIadkIrV1bLBhdfmxwhWlAyG1Xn365xeIVLGtnxg35GDGBVHpi5HsGQAcPFZB+EJs057oPtV9Qb/Do8GiIbziy+cwEATCfhPhBCbOtiQElF0oE0sr9s9y/huZhxppU572AzraqBjzSXPBGqoqmVyLLwS6Wb5UY78=
Received: from AS4P192CA0023.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5e1::9)
 by DB9PR04MB8284.eurprd04.prod.outlook.com (2603:10a6:10:25e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 12:41:28 +0000
Received: from AMS0EPF000001AC.eurprd05.prod.outlook.com
 (2603:10a6:20b:5e1:cafe::7f) by AS4P192CA0023.outlook.office365.com
 (2603:10a6:20b:5e1::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Tue,
 24 Mar 2026 12:41:33 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS0EPF000001AC.mail.protection.outlook.com (10.167.16.152) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19
 via Frontend Transport; Tue, 24 Mar 2026 12:41:36 +0000
Received: from emails-4305172-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-81.eu-west-1.compute.internal [10.20.6.81])
	by mta-outgoing-dlp-141-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 09ACF8079F;
	Tue, 24 Mar 2026 12:41:36 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Tue Mar 24 12:41:29 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zTESwTTME+rHWopafXH1oiz4kcYf7ZYajnQWC36f+5ntkjraUUShwKHWhpmyNWKOvBm7LQPM0TTEZPsWlaNIQ+avMqvcIo6EQ1v80NCDMOcFEjKK7hbBUfdXYDIZP7stN1hOPUrE7W3rt/k3ybpafWd0gL+xYuCUTr0Gm1aJvnfjBJEGvySPV5jBwyBVWqef8stDcVm0Q5Tffu+7aibuh8cZKuFP8YwSXDIALo/VUxdE2teQDXM/W8wmZjAa0Gur+nSp+wIqaoQNkrrluP9YetsVeOMndLL7kPG6uyXgB4U7TBS8QuWVRi1OXdoGQMQW7pofhQMFrJHCNAbeivzFdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FYlSIaVXE6oyKGXhaBt+kquYAW+UQwHEZ4RwbjKeZnw=;
 b=hvI5U/k4HUBeeTXqX0wxMWLSW6g94umNtOLydcf57bu4h8jIZPSaaQ3JCQA7MuBex/8bYPAD5z4EQXFMAw4OQiYKF/DiaFkMKaL7Of2bqEE3LQpaIjbt5a6lAySQn9Xf9IMbqMVdUMsWH037FP5gxOkLXSWRJCb2U6P+ezvTDqcH2BOq83d3xmT/cMjMsJuOt/HcQ2VJgwAx5n3Mgopjj6YTumPmu1SgYv7asVXgzlzuxttLu5S0usSuHrv49swFq7buoHfOOmSISrjqtUgweR5NdBkU8YS3AT8zr363qVL4SU9OwoLExsmqMSR950DeJCNkXrnO4CGXIEXgNBsfhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FYlSIaVXE6oyKGXhaBt+kquYAW+UQwHEZ4RwbjKeZnw=;
 b=lhnL4geEGmKtIadkIrV1bLBhdfmxwhWlAyG1Xn365xeIVLGtnxg35GDGBVHpi5HsGQAcPFZB+EJs057oPtV9Qb/Do8GiIbziy+cwEATCfhPhBCbOtiQElF0oE0sr9s9y/huZhxppU572AzraqBjzSXPBGqoqmVyLLwS6Wb5UY78=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by DB9PR04MB9722.eurprd04.prod.outlook.com (2603:10a6:10:4c7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 12:41:18 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1%3]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 12:41:02 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Tue, 24 Mar 2026 13:40:59 +0100
Subject: [PATCH v6 05/10] arm64: dts: lx2160a: add sda gpio references for
 i2c bus recovery
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-lx2160-sd-cd-v6-5-8bf207711848@solid-run.com>
References: <20260324-lx2160-sd-cd-v6-0-8bf207711848@solid-run.com>
In-Reply-To: <20260324-lx2160-sd-cd-v6-0-8bf207711848@solid-run.com>
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
X-ClientProxiedBy: FR4P281CA0400.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::20) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PAXPR04MB8749:EE_|DB9PR04MB9722:EE_|AMS0EPF000001AC:EE_|DB9PR04MB8284:EE_
X-MS-Office365-Filtering-Correlation-Id: bc06bdaf-bedf-48fd-3c40-08de89a2affd
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original: nxwEP/m+HT5KIwF0mlU457dqJv98ccxsPnDPAqEP6vf4K+spsJOWN7BUR+5nhbOdA9LhiUqX6UGzKfOqA+r7eXnWkFHoTEZD/GpcRksYFCDS6z+ZQ7V24L2XCfXgnfUDNxLV+wgT6FLvMaONrPuDqqMtU86ap+KiIbqIWnXnP9vqdIcVbLsq2WWzUAKxuqNI8WoQT60qjgFq5WG23B81nJMd+6TAOelDYzb4pUaFtr7kV2YKZJaSz210SDBR6jemcCvouwOZJ7+TcY+YFAEuQmWZdqpQpOQzSp2xVqiXm0JwUKjQaxkgeXi1NZqpIS2QYQzp/BT2wAGLpIkG9IpuKupLQfAgJWXMANsv9WNP74U9kBVQuvw3Pv1x25XgLGVAORAtw4PrCxVcc1uMZ240iE+vYrrq0MS36qz7ExwEgiAmhd4lpbdfLy0AII1pm6MSOGonKBgX6BTXZYwJuqLJ/khW8IwqX9I3sXysXGTfH3DJjeHP7IOjiiesKhEUNLskOBCV7jw6zgPQZbVhtmA3y7Av4j12DpF8anZ/9eCOR1XBZeBCrXfPDDs441bv+C0bcKxpG45uVBcgcnpkjbbaYBBaaQ0RTxjX5jpY7+EOFn46ztwbYSnfvJR8xJugmeG1GLGZ42anLJZwlKxqJMJU3O88aAPqQEIcZCjQdMEehXzw4/c6gkccQ7w3B0h6zh0fFSXx48otIXnsTCANnupSuofjZJSn2+NB5C7f3LXyFgnrvW78XYDvlrIQn0VoIcWjM73n3YR5UybIB4T59ZeOjEkr6H1oaT1lG9ehl4nShvY=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked: bhkpJKZo1kgRLll0n7DAqgdTBpSQGP1LYw5TNGG2WxvfvZQiv3Qp/x7w38Im+ghhYUZeLMlKvH45lgAojWqGYL8gKN8piwWM6h4m/XEX4mQqvg5O3/zOwkfKrJWUCIPKtd9XEVI/esnaicfTdWYxf+VkkwjgiDB35exgRZQJ1xOAl3LMGrbl1KMo7RgkSF+Q7BpYsIq67YXYanqv52BZ693Xw/g4M+BVgLiE5nRcQ98ab1ywVJCJnbLhN5K+Eva4s34gwOlBjFpMOkagw+BRIuN8hzJmMhhxHpiSNEMTs33xKewjG7Ww2pwi3E+Yb7RupzxUnnHDV0kohOUmesAgbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9722
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: f7ba3704f5f949a9a04367fcc499e902:solidrun,office365_emails,sent,inline:b9e026b2ce894d6ae84a8479915fad54
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF000001AC.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 99804e34-294a-4bed-ebce-08de89a29bf2
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|14060799003|35042699022|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 3ATjrx39Xmbg/whjSxShE6yzlRcaSMeXLOKEcMBdQlnyVBKvVdolPqUv/JQj+0DbPXF41qkiC9QmODJz6aiqojB4ExH5wg4y8Z70+LS+sOpH0OalSM7qIOASKOjaXj6XW24q+rfbSQLn697pVAe18C+fRVJUL2b/nWOPA77Q0olyXakdxjfC3Rmnc/CJ0aaBhdKkY2eranoQ9tmNHpUwCuOJwOxrg5vvMkNklQodtDcaiiczLNoo4KlipSRhDjrvZa7rl7KY8Q92eSCYX8nWepTudfKoRaCjKagApcDfu17gmbYeLTrhh/De6rJh/sIYrV+GJZCxaXNt68Hb85M0HR7cY25+cuVicJ+WoS4dvhskLBTDZdqyEUcbRhZg1hZWTD/MX4MKqyuIrGdkij7qJQQyERWZOrEZtC9LZhEz9KQK01f2ZGFHpjdRqOUPgx0TvD5Gn9mkSiAzoxRVxldir3oIT33ljNlWhVZDfkHGmI+1+3O07n9Dl+9WDj/0mNmt6pxMXnl/qk+kTXIB0Luy9KB8RNGk3MXdda8cv0/ifMoA6inA29rmGwFjRNFpxQ8CW0sRwKlIa87S51b0GKtU2rEzZZyjMHk2WwpkNiyaKg12mtqP6vPENZUbW7hPzj1Lba3b8tupB7gbLr10Dii2aFYlQZZl3eg2NIB3M/iErvPUf48mJeG13MB13igMHhYcKGn9sXapVnfuCXRfIy45Gha3AA336ddl0c3jLIeTv4rwi33ZnwHLid91tVFuJi4n0mA6F2s+iCaUGWmqpWQl4w==
X-Forefront-Antispam-Report: CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(14060799003)(35042699022)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 3amtop9dKMxafoVtziDtStZknda/mFALm4xq6rqduQeLyzxOY+BwmcJ/a0VEliCC1cZvoUjoKs0fMUj++Vv7Rtf6MxSxBo6CB0MKfwBEd96hfT391/Tktfg6QtSPIc1PFxSF2a0PE1NCb4T2ux63c0+AC5AFOaGTWw5+rLzXBghNjN2tasKYk38sw8YLM6Q+S3kYcjOQY1FfGiB2A/KKP/hVaTrSembh6+URzMxdUVniFljOxU/RaddSx+xjPej0XMOTwOnkUXob8dja5GRk7p0PlgPRwgE/IXWHw8BguzIjfrY7Usy3hCYUTOa6ZzXoMoFwIwTkBv1UAQ8noq9m6VkoxI4LVe6OqKnE+poMp5Jx1Hu5jkU3nHzckEc/DPejdxSEYWDEmZyGG+zuo/yT4d88THnTw34jQ5t7tbU64vHCygByt0OxXnk/asfP5k1Q
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 12:41:36.2684
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc06bdaf-bedf-48fd-3c40-08de89a2affd
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001AC.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8284
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_054140_819311_F45D0550 
X-CRM114-Status: UNSURE (   8.57  )
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

LX2160A pinmux is done in groups by various length bitfields within
configuration registers.

In particular i2c sda/scl pins are always configured together. Therefore
bus recovery may control both sda and scl.

When pinmux nodes and bus recovery was enabled originally for LX2160,
only the scl-gpios were added to the i2c controller nodes.

Add references to sda-gpios for each i2c controller.

Fixes: 8a1365c7bbc1 ("arm64: dts: lx2160a: add pinmux and i2c gpio to support bus recovery")
Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
index 28500e8873909..53b9c5f1f1935 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
@@ -753,6 +753,7 @@ i2c0: i2c@2000000 {
 			pinctrl-0 = <&i2c0_pins>;
 			pinctrl-1 = <&gpio0_3_2_pins>;
 			scl-gpios = <&gpio0 3 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+			sda-gpios = <&gpio0 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 			status = "disabled";
 		};
 
@@ -769,6 +770,7 @@ i2c1: i2c@2010000 {
 			pinctrl-0 = <&i2c1_pins>;
 			pinctrl-1 = <&gpio0_31_30_pins>;
 			scl-gpios = <&gpio0 31 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+			sda-gpios = <&gpio0 30 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 			status = "disabled";
 		};
 
@@ -785,6 +787,7 @@ i2c2: i2c@2020000 {
 			pinctrl-0 = <&i2c2_pins>;
 			pinctrl-1 = <&gpio0_29_28_pins>;
 			scl-gpios = <&gpio0 29 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+			sda-gpios = <&gpio0 28 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 			status = "disabled";
 		};
 
@@ -801,6 +804,7 @@ i2c3: i2c@2030000 {
 			pinctrl-0 = <&i2c3_pins>;
 			pinctrl-1 = <&gpio0_27_26_pins>;
 			scl-gpios = <&gpio0 27 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+			sda-gpios = <&gpio0 26 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 			status = "disabled";
 		};
 
@@ -817,6 +821,7 @@ i2c4: i2c@2040000 {
 			pinctrl-0 = <&i2c4_pins>;
 			pinctrl-1 = <&gpio0_25_24_pins>;
 			scl-gpios = <&gpio0 25 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+			sda-gpios = <&gpio0 24 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 			status = "disabled";
 		};
 
@@ -833,6 +838,7 @@ i2c5: i2c@2050000 {
 			pinctrl-0 = <&i2c5_pins>;
 			pinctrl-1 = <&gpio0_23_22_pins>;
 			scl-gpios = <&gpio0 23 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+			sda-gpios = <&gpio0 22 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 			status = "disabled";
 		};
 
@@ -849,6 +855,7 @@ i2c6: i2c@2060000 {
 			pinctrl-0 = <&i2c6_i2c7_pins>;
 			pinctrl-1 = <&gpio1_18_15_pins>;
 			scl-gpios = <&gpio1 16 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+			sda-gpios = <&gpio1 15 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 			status = "disabled";
 		};
 
@@ -865,6 +872,7 @@ i2c7: i2c@2070000 {
 			pinctrl-0 = <&i2c6_i2c7_pins>;
 			pinctrl-1 = <&gpio1_18_15_pins>;
 			scl-gpios = <&gpio1 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+			sda-gpios = <&gpio1 17 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 			status = "disabled";
 		};
 

-- 
2.51.0


