Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F67C105F7A6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 14:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D7Y9t++NNOJq3agD5vjYxbV76eAP4kQBlUcc26o3ps0=; b=Kx2J629AHwDWF7Uj6M9dcP+UzQ
	fvMIIXgjsajGsBa3l6meOX1G4VfLZLMlMpj6/l5BkVy7i8Q4RcGriBiTIzTdeFUQdXoUDm6kk9KhD
	JPnYix1vgD0+TWD4mUQhjvBUHsopLar+jO1c2i/++sDKXMLpjeLutIlcnPQEp5Id48l0GuPfVSOfZ
	saV0rLS15BhQMwLGa5kbGAK4UiX0roVXWvBRZTkN7q6t/CPriJx0DDCAcRSP5fYHJEZn2c/DhiBkz
	gV4EDcnxiIkq3wMnh0RAUPd4VY3vHf98oVpCs5gNS8vxH3k0gzh/lP3oSakn+Q+j1qMYp85u4Y6ZJ
	051EhuwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13O8-00000000Mp4-0ySQ;
	Fri, 13 Mar 2026 14:21:16 +0000
Received: from mail-northeuropeazon11022112.outbound.protection.outlook.com ([52.101.66.112] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13O2-00000000Ml7-3Ivt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 14:21:11 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=DUv3mrgZIrRa3lKHVFa1GrrHQLvc43awxN+wPhfW2PWqm7qFdSMjgcGvcDoKZhAo/l3wVbcThrbIR8tP0x71cBMhRFts6uONa8wKvfYG+OcJsXjVxI9yAgSeo3AuPEbKTmGcZoJtm4BZVUxdu/NwkQ8/PgRoYAa4qebkkmBHkD+nh9EsGJnLDGMrWrRtBJSEVdoBpntVgnXY6jCM4/wQpSnv4JfH65JaZpHqMpk5aWnz3EcDbsf6Q5B+ZW8MtMhDh0OeWZTi2VGQJLZE2GJUQ29R9IpjjsKqn8AX7tFc/sen56qDSSYl5zyLQh2bH1VKVmfI8y9gXXPeDAzrwT/RYw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D7Y9t++NNOJq3agD5vjYxbV76eAP4kQBlUcc26o3ps0=;
 b=gtrbGEhDnhr6VJNuLSXPYO/EJRFpqkpzvzw7BCxW1Jqai6Dy0PSJcm0j1o0O5+dO8yB9GEFE4hfpU8XqA92xk6+3Suc1o8htYqN+6BPQNUHGvE8ghAd99pSfSuJJLNkoxNqqkJpshtInbqvOm/1HZ/jb1APuL+w5od+DS7Hg4KoUQBu7bN1ZXWgBzdrGUoYCOOHvkUNfN5JeMKcjEAROd+gBd5GpKgShnDmJ1qDssSmJ8snKyYu0Pyh6xBLd7voWJO+euKouuXaTCNMWRp0vhe12tQPwhAVfPgJbIDTod4XiPV+XatNapxnjRLjG88fQdia7s7mKePM+Xnji7FYNBw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=softfail (sender ip
 is 52.17.62.50) smtp.rcpttodomain=kernel.org smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D7Y9t++NNOJq3agD5vjYxbV76eAP4kQBlUcc26o3ps0=;
 b=ZkqWCGFu0BV1FxEpMyecvLqhOQxUppNQvB1D8W15HgH6XgBCKKXIfyThajQcxOSjx0Ezs14cO/FqnNC/8f4pXSD19qqPdS9eRLg3Ag2tBciJ1VHPzJGdC9m7rQoDgj8rFJbsKakFA/Ua3dW6GiUdVESDStnUJcki0IW4OWzV+Rc=
Received: from AM8P190CA0003.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::8)
 by DB8PR04MB7001.eurprd04.prod.outlook.com (2603:10a6:10:11f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Fri, 13 Mar
 2026 14:21:00 +0000
Received: from AM2PEPF0001C715.eurprd05.prod.outlook.com
 (2603:10a6:20b:219:cafe::ad) by AM8P190CA0003.outlook.office365.com
 (2603:10a6:20b:219::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.30 via Frontend Transport; Fri,
 13 Mar 2026 14:21:07 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 solid-run.com discourages use of 52.17.62.50 as permitted sender)
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM2PEPF0001C715.mail.protection.outlook.com (10.167.16.185) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.17
 via Frontend Transport; Fri, 13 Mar 2026 14:21:04 +0000
Received: from emails-1573246-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-180.eu-west-1.compute.internal [10.20.5.180])
	by mta-outgoing-dlp-670-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 8261980CAF;
	Fri, 13 Mar 2026 14:21:04 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Fri Mar 13 14:20:57 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IdsfKvnJpuxMRfC9rnBx4puvVZQIBA/xb3cMXanSERTDAN5zwP5WUlVG+EErht58neM4qwExOZdlXyUMX2N6+UnMltK8WxImn1wmDVWsR3Q8Tv1y0k7/SLinVTSbtwsNPSBPil43p9Fa7KHOxryvj2KVU86IOOBRjqYl917Nozc7x7V5lTQW8u8yaV0X8e7O0F6q1rVvG2DjxnyJ46r2dgLtz+KsVYv1DmrTeHWyujt7YnyIR2v60Y5VJSgSOxPtn0w0nsWw2Jh+ihieNEchWbpMxl5n+1JjYMYQ/9T9rEYHWle87660CZe1K39KwnCVn1VfZSzzcJgFXEHFg0dquQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D7Y9t++NNOJq3agD5vjYxbV76eAP4kQBlUcc26o3ps0=;
 b=j2bN4P1fcizT1a51yrBAvNlI60YUnXM6DIa72HFeUXaymgh9qCCrLYQDEsbjs7I8XuYXTGVAPga12GhlVQ32CXHG44uoPsPHZzxdK5Q8FKKyUZJmqHA8aj2raL3fHx4mh6n3CEwjvrKd6Ho/Mng/ql4ZARLDxpjJRW2lFkwIKQs0YZA9FHl3KPfFIn19UHGsrrJ6EKTkBqAziIlxMKg8IHGQMopb5fy9A+2zbZlySSmwmhe7UrLGgCipifTmfxwcYQJd/ZWgA1vu2hO5q8YDtNLluMv5Xxf9ZRI7FJKXNHRrpuWO4FirRBmOaU6Dxbz3IU8EgU7eryH/x1S7PH6BOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D7Y9t++NNOJq3agD5vjYxbV76eAP4kQBlUcc26o3ps0=;
 b=ZkqWCGFu0BV1FxEpMyecvLqhOQxUppNQvB1D8W15HgH6XgBCKKXIfyThajQcxOSjx0Ezs14cO/FqnNC/8f4pXSD19qqPdS9eRLg3Ag2tBciJ1VHPzJGdC9m7rQoDgj8rFJbsKakFA/Ua3dW6GiUdVESDStnUJcki0IW4OWzV+Rc=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by AM9PR04MB8355.eurprd04.prod.outlook.com (2603:10a6:20b:3b7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Fri, 13 Mar
 2026 14:20:53 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1%3]) with mapi id 15.20.9700.015; Fri, 13 Mar 2026
 14:20:41 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Fri, 13 Mar 2026 15:20:49 +0100
Subject: [PATCH v4 08/10] arm64: dts: lx2160a-cex7: add rtc alias
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-lx2160-sd-cd-v4-8-aabcf230fbff@solid-run.com>
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8749:EE_|AM9PR04MB8355:EE_|AM2PEPF0001C715:EE_|DB8PR04MB7001:EE_
X-MS-Office365-Filtering-Correlation-Id: ef8b0c7a-9406-4603-75b7-08de810bc2f1
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original: dvOLKWGyIjlQWTU0E538gh4rkXaA4agxgnmx/azyc9mBlYbvDgNHnu9X0DmFj7nEI2sUKjltzCs3bvfS+ePI0YO9SdxIHiXaDjDdc0XZE01Fc6d1k7vub+rbEDfTHtUHmNAeyHPbOWz5Fh9aJEqEh5SnMSUA9P7a9XwdVSkSlLv0hCGKRyMMPKB7dwsPXXMwNZb1b2J/rGCdsDj/nkNOKExFrUGJ3slxjwMHg97RK6inkSPl2pjjRXy5nPzLHjaupLvzv8LbYfLXYWpFRmZlTYBrfdyDdh47C8oc1pK6fd5b9Nx75Lm6kEe8d4eycfr5sb8z6aDt9xEr5s+IsUcjsWrPFQ/RHp7I7ASUZcOhwAD6nQ1DU2T5kFUzUHFRrbGFeUindSZkqYzogUPQgbR1I/JumZ7JgWrYggdqhG5vCPeaJDo6KIx2g/djH+8pFnAVoZax7eQ+RAZBGCH5PmwnAt5WfIhMyDtoizOdPvMG1RvIBYKbNj2rWsaEBMunSitVf2Z5jL76ypwzTlgaZVbjKH3KQp2nJHlEGeq+N91Nv4kVD4/79rgj46ZQx6lFyeq9xZLgAHUa7ucmvrPxwI3J0oPCBgwq0fx3JJWnffVFEB+IYmuEPeUZM5boVsgLKPxnCsFRz8y5iVKwVRZyLX1xA3TZiqDzPFVnaP4f7G3ACgV5e646wfbXdMh1vxph6gjhwoI2FWeH6y6S0X2EFDjVnpvbEuD58gtEA+p3QbksiSxm6LcEiOk3yAGR3sLTPrq+d3CiD38JbUKA5qQ92kwjSXUQCzdor+FQBoLUjhg/VHI=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked: Ocb/N9WQAKhAQRWW6i18jG77I4WPj/4pvKcybs7nFNlSkJkNXOQGFl1qqu4LvWJj7tDEIFzFPaAD6gY11Zt8YgZAwVeqGa2UUbfmHRBa6zeOZrh4xOFLOFm6aw3VPM9x6Aqei7Tl3C8N7GJDafsUjxoM9eA+kr+55fQ7hFKCt538F+hPLH8ZOiYWfoQhiJKgxr1+5YCCUcL1REHogQL2tsFd6rrEpoDR0Q20HCz2IEofiaswnxIyFFOFkGKROvHi/Q7jQ9kXRFBpX2ENYqOKanYABa475rfZhcOYvl3KhWbgedEQYi+xHrf59DpEUOItuBY4pPdWTCaqW5Q+2M65FQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8355
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 35da889a600745fbb57f2b85d4688649:solidrun,office365_emails,sent,inline:63fc3aa5d97fb79fbbc6fc70877a80c6
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM2PEPF0001C715.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: db4f9c3e-12e3-47ee-e6b0-08de810bb49b
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|14060799003|82310400026|35042699022|36860700016|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 7vdweq7tC0hOKR78issBtk8uPftRcIPqGNliAbJWOzIwJ3my05dQIaKkAiWZeUdMzgNvZdgRD9SWZvJF1Yd4rpTfX90WKiclPc+TIR4OwlG27XOy+iN26VfWYVG+0f4vSlJIf9eAFM1MH3JjWsYVAGECLDnDUyiDfgwNv8T7kUd+lmnTxZDV8VBhT8PduqEcNE2d+ftEpA7VKW9IyU1itjDM34FDcgqdjI2eawnQRDiPxwIv3gw3vLEBEiVBQN3Fp4dBGAh5xBN5BInqrUxdDWyQX6oGrbmsLbNPBKfYm6ujtyb0a2WRkoZhLRPi3fJJpbwQolVoyQMIeBsMla+XtzPNxly+tX2mRB1LUA2lm3+GRyE4U4RdLumW72a0MJzz5ssrQeBnPbTqX/Se2CzRjK2EkkyGsk+u2ngdC4bsXk7HKqR22JUwbqzQf6g1CNqbr0tDCB86W6IkThmQbAQpxCbozhGDP+l7pVqZzXL5Ej1kC147ozuxhsKRmp57ZSNmgccwCgNV//JKqX7jwGD3ncJHAxSurEk9z2JaZymRQYC/mSiE9fBEKkMfbnga+DUtNg4yFs0Ze6bXFGUTljboRt3z6nCu+WJcFZSodIngxtRMDzT7MbE4Y+kyp1NQuSeXpo9WCcFFFitmb+iIi/mu7aXaZxN3Y+GQ+heyOHzdIMjzI2zH8+RzsomISEsfpIk5LSP6Bm8Xo9qTA+0RFatuH9n5O+nkYapJqj/JhTXkP6mNHVSWD+Et+IBbB3ggLZ1wxaMm/rVUG87GstVWKWKu3g==
X-Forefront-Antispam-Report: CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(376014)(14060799003)(82310400026)(35042699022)(36860700016)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: jOyA2+V9PlOmIAWR4Oq/O88tOzziDU/WKbwlDrJWBczGn2DE1Ahvxxq+r3eEucHza61/RJ6FWRHVueG7f1zuOASwuMwVgM7NMURyO1eA0TPL7Fu9oQO/5x2l00URD9SXQrBacIURgD32dVhuGJYBqMd4ab3uNOCPeAaYi4DHl5awJpHoQ37+oH+TO0vNT6sC7fTvvbXFTWxEfElW46ddMZAitGDiX1c3Vm8cUyXRZBN+KDfe1VkqPvmqmsCRE4LL5GHtjRQeSymGQOONIzKr7DJvNz4QojdMZR+5MQz6XRCY1TxmFO0ael+bWUG8UwnjrkTe2UO6qzO7VMua7r6RwJOw2Wx189Qy48L0PsWtgGAb0pYmiOBLooYTIO/aYbzNxybOmO5XwvjZQQSwgWR9Vx6vTUOAicxfkYXRQ/3hTrEn2519REFD0/5vOCoSBHOC
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 14:21:04.7421
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef8b0c7a-9406-4603-75b7-08de810bc2f1
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C715.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_072110_839862_D4DA8BDC 
X-CRM114-Status: UNSURE (   9.20  )
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

Add alias for rtc0 ensuring that on-COM RTC is assigned first index.

Note that fsl-lx2160a.dtsi already defines an alias for rtc1 which
implicitly achieved the same result.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi
index 7f6e39e27ce5c..90956ffb8ea9a 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi
@@ -14,6 +14,7 @@ / {
 
 	aliases {
 		crypto = &crypto;
+		rtc0 = &com_rtc;
 	};
 
 	sb_3v3: regulator-sb3v3 {
@@ -154,7 +155,7 @@ &i2c2 {
 &i2c4 {
 	status = "okay";
 
-	rtc@51 {
+	com_rtc: rtc@51 {
 		compatible = "nxp,pcf2129";
 		reg = <0x51>;
 		interrupts-extended = <&gpio2 8 IRQ_TYPE_LEVEL_LOW>;

-- 
2.51.0


