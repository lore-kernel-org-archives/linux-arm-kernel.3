Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 632D8EB7ED0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 11:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2YuC/OnaKFRZHAeOxOr7mvqvarnc4U0GLQLi2lIVefM=; b=ZIn44A24/JVYR5esSu7tIZkjSg
	uJ+ZaIFwgKzwDl9yY0/VmBBDcH/S0MRPdXfN0fjHwfKw/zUA32o5+EnBGHPZwK3A0H1vjGm+tcZOY
	SlGrVS9omwVfoFHn4lX8p/VgDZ79GnGHP+z+WUd7FyRZpUTKs8rR4SKIBaVujIc/T2ohYn6dYWhk6
	demL0kv9WQbErIXJrmjqu92HtBwdE7qW46rtPIetcRIkcUVINpBZj5Dk4h2+jlvYlCCmBZBMN9HcG
	d/2hrmbEneHN0Ta6p1bloilC94pfljiN68sm2ykfTdrCYyPdlxjLyKEZcqbaRU9w7Jt5vnoIOtaJo
	1FUk8UbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxkIT-0000000H4hO-2F1h;
	Wed, 04 Mar 2026 11:21:45 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxkIQ-0000000H4dJ-1m4g
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 11:21:43 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=D9hjlXzKVG2X71FV3BpstRaVetpiP5u+X1V6SfM3nxLQpikkvceiWmB03ZD8sTePF0hFrB5sRvMaWFR+TokpTkcYcY0CR9eQOmPHTnSha98yvAjHyuxjkHyR7zptIUTXT/Xm5rWzuVGSbUDw3ZTxsjTWyHfrpiY7Ea5iOf11EghN52H3TmQHVSH8UB7oQhkXIggU8rCkCdwcgWdWh93xeDMEKml3O1plPEP8MQBShP5KVK5BvbljN42fycna6TAvhVmyjwly3ShajOQfH/4IxoB2wpuSOshEK7xO/ob7z6TjPEv/udFI+2mvNZH/omVq/PtbV6rghXb0HptaMM19hQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2YuC/OnaKFRZHAeOxOr7mvqvarnc4U0GLQLi2lIVefM=;
 b=qBP119tf0fC/y3aWMzKlF2ZJ8Hfu8+AOjGjyliCssHt3KHGc8RY7hFcrb6oQQhJ9YxawmUaZegoqzLIwXmjxrjOR/5qKimoHwyKiHSHU+UjuasqpmVkbytEuq5GejcSEcJzfNXgyCovYmI7QDAGagPZiUn0ur9gMsiLBsawP40YcBRDizEwAylp5RbKJCJs/VZVLYELQohHtKsRx4WRroYj46cZHc20QBNHAAzDt1SZzUbB7i6z+eR2f9LcobpgCy++5KaD23/QGsPlEZMt9Enw5tOGwXC8kAXYuo3uGjLlHI1f1f4dTmpkr+3uTj/gbrTLZN4GbkEA3eumVp0xbMg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=softfail (sender ip
 is 52.17.62.50) smtp.rcpttodomain=kernel.org smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2YuC/OnaKFRZHAeOxOr7mvqvarnc4U0GLQLi2lIVefM=;
 b=MVPYxjP3Npl0xwk2AUyQUmXJHLLHL4HrqPsano7aEqNYGIORUDPiXCgt+iC2gvBa//ssGaC4uED0E4cJngAOayVW3tSU68blfdfbRUx44cqNP2k/lUehsUawRZlh46qTm5BCWC3XD/hdJyrTvIB0qrFb2EIMKz20gGh+QufAgTA=
Received: from AS9PR06CA0648.eurprd06.prod.outlook.com (2603:10a6:20b:46f::16)
 by PA6PR04MB11945.eurprd04.prod.outlook.com (2603:10a6:102:51c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 11:21:35 +0000
Received: from AMS0EPF000001A0.eurprd05.prod.outlook.com
 (2603:10a6:20b:46f:cafe::1a) by AS9PR06CA0648.outlook.office365.com
 (2603:10a6:20b:46f::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Wed,
 4 Mar 2026 11:21:32 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 solid-run.com discourages use of 52.17.62.50 as permitted sender)
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS0EPF000001A0.mail.protection.outlook.com (10.167.16.230) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18
 via Frontend Transport; Wed, 4 Mar 2026 11:21:35 +0000
Received: from emails-664026-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-166.eu-west-1.compute.internal [10.20.5.166])
	by mta-outgoing-dlp-141-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id C700F80619;
	Wed,  4 Mar 2026 11:21:34 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Wed Mar  4 11:21:28 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gWlIlis18xouZISQLkWarjfPS+n2jbu/Vw4iZMqgEh9eBX3/wdDBvwfc9yTtKZ2ijRhfPEA57VD0eo2AX8INiQVMdwmBTKgYv6LWaZ3c1m0bHVeq2eatc/F3e3NWNAcg5GXAn+U0Yu1ylGcwTQCQpJRYX+vxjUAIONx2PRVW8mH3cAbMY9qy4W7ZqL6HmiKUt2aa2obT1079zYgfna+yt2DArsfOt/bDV7GcCosRmGSxXdwYSAmZ7LqdGOrM5uWlnga/UAnMNdzjYSQ14XxbVliPOBeSy1eECm5s/VKBwhoP0t62V5bzjVXy1wFKvEE0vxnkq9qtso3HLTaiChrr1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2YuC/OnaKFRZHAeOxOr7mvqvarnc4U0GLQLi2lIVefM=;
 b=ys/EX96xvKt1pQCp50kwpxZc7tmcWrH+PSJOwWh30xUFu4fS0bFRgZx7LJZuQH/2bzlAL5ot+jX0FntkGlB3TUbzzJ67oAV4n2OaZt5I/hAewYwdeFpUFzj6CG93SwbDL0vTo32q1AFKwgsjmeot13pQuEuIGxtX79gy7DFPMOmCWDLzjnaFZy1MsrYjdpDrj+SjaA3V4WKLouCWdg+55S3/xnISTBNPl1ioAuZmlE25v2rF1tzTWOvjsuL/uLVJIRFroWUnibvTDbg0Tt5TlX0qjE6zRPLWdTCVsSSga+CFHdHkGCltzxpe1EIozLJf2hvAcWE+bi4el0VJD9aH+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2YuC/OnaKFRZHAeOxOr7mvqvarnc4U0GLQLi2lIVefM=;
 b=MVPYxjP3Npl0xwk2AUyQUmXJHLLHL4HrqPsano7aEqNYGIORUDPiXCgt+iC2gvBa//ssGaC4uED0E4cJngAOayVW3tSU68blfdfbRUx44cqNP2k/lUehsUawRZlh46qTm5BCWC3XD/hdJyrTvIB0qrFb2EIMKz20gGh+QufAgTA=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by VI2PR04MB10979.eurprd04.prod.outlook.com (2603:10a6:800:277::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 11:21:22 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1%3]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 11:21:22 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Wed, 04 Mar 2026 12:21:16 +0100
Subject: [PATCH v3 4/5] arm64: dts: fsl-lx2162a-sr-som: add crypto & rtc
 aliases, model
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-lx2160-sd-cd-v3-4-dee4523600ef@solid-run.com>
References: <20260304-lx2160-sd-cd-v3-0-dee4523600ef@solid-run.com>
In-Reply-To: <20260304-lx2160-sd-cd-v3-0-dee4523600ef@solid-run.com>
To: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Carlos Song <carlos.song@nxp.com>
Cc: Frank Li <frank.li@nxp.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: FR4P281CA0019.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::16) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PAXPR04MB8749:EE_|VI2PR04MB10979:EE_|AMS0EPF000001A0:EE_|PA6PR04MB11945:EE_
X-MS-Office365-Filtering-Correlation-Id: 274db997-6ca5-4b88-0d7d-08de79e03203
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info-Original: faqq7BtEzNehhASV6hMwKrSkRu/LsAFXldqTGqdhbm36h+1wB8Frm9zCO7YEyFP3aWI9bVrj0NJpWe83hE4EAFuh5epSjQaCw3+Y1jLPD5+ufYjIttkyE+iNBOkIAcitC6yJtvwJ6cxkTzPT7FG3qV3vSrEtbs48bWVxAbUjPhpC1NGLLBmmLZxMlAixHOCxJL696dtjWHHApuAJjXi9y/T3+rK/JBJuZeEQvdtbLWCOpExbhuKa7jIP/3PsL6ZYIOi+PjR1uH5a2C4jRx8QMbUElPqVFAr+HEXn8csILFgsUfgamJGF4AxffG/pRQHBhEPUY/QqXBKgXje4Sout418ztTNuRW48ApOA2RXacfX9QaB5zqCmxj+tx7JKU3KLxUE1FmcriDyodwuiqlTZNoGDvCdtPAT+FDb9hegbrXji8fyZ8+mRnEInlZUXwtKnjFAPa1wZPDYoKCJDZv+p7hN+AJw2JyPHcFTC0DTIBlNezfUa94bFC/9yzfvD673bosbAEXA8yjHBG3orSv8C+GSwV0tYUlkCcJSbdQO7KkRG7LGEH7iJ+ekrQCLfg9k3Dfm80ot7tTcX9SDc+dtgts17tsa3hDZSDZr3mQIlAXFO37oG1WxkL5J7ABr7rYmePpzt+TJvOH4MspriO3hoxy+rMFKZRYiyYCEd7YwAi3KZULmxxScT9HX5sGcDwAWi6or9uAPMxCSLg30BwKm/iWzUwFu8k2qIQnqy5EGZ5qmZyJLLHW03nhS1LSDesUWnH4/qbzPQkJ3Q4EcdplLFHQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10979
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 25ad9e9e48144a66a8af3966e4dac852:solidrun,office365_emails,sent,inline:24fbdaf47b4eead4bec4b5d78012f82e
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF000001A0.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 95d404b5-7033-4043-70e9-08de79e0292d
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|35042699022|14060799003|82310400026|36860700016|1800799024;
X-Microsoft-Antispam-Message-Info: AXKRvCAij6wxlHXACmVP0uGZ6a2lQdrqgh44I6boYA1ZgwIFgdcwilWdtAXx9ArJ2k2pKkIseZYuDPMqZxvL9fzyF0W9YEeHIqmo4ErieERmugDB8PUMw3X8s1Ij0joWpDeqIiLAYKlOQhUpVvs6raRkr+rJnmrsKTLNCUJqRdpb0G3ruFt8m8KJXVWzXNeKA2+Vti9h6X017EnU3sm/OsFYiRYVmEcCvlmaJPF1s1iK3r5bkMLaM3evxe/0m0+cqIZocTuxfKxziYjgLJeejQA9FRD/htGLTQGWxYBT/gCnnQkldoWv/s6zmP5RZu3kPK6jPqizyOz7VRFpTdn16QGpwtVzNkLglIohg2uq/ofhYxHuaC7g8aSCcLkMPIUhdjt0K+0zy3iMqVbzQz3wsyH0OZBJXS4O7Lf//btrH7viKratPNC6OnhxK/rqfkMpJ4+f6Qps8h2qJ/RUH8WKTIOznh3c2E8yPquzIjlLojogZSY5t076YidgF6m3giw4nXrW9ZtltrHcUndR8wMaYlY37FHzJAK4DO5eXy+nqc9KWO44DQOFji7Ar0W559HWv7UTrn+agT2sfM2oJ/RW7xgPYOA8UyalvAJNaS9m/hPk2iDIQA3r8tiW6MNAW69g4CzKNOT4wZuPUEZS+o+IZ+NBrIemcEvLzr9jYiUiouz8os/YDhxDo/LciV29ZPlJdTtZVSVQgOp7gbpprNpAM5qHkGh5mwfZd3krQ0BRwg2TPmvfXMtcJzRrCLTKHdAQ+vQxXQkhpFICxdvMzojq/g==
X-Forefront-Antispam-Report: CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(376014)(35042699022)(14060799003)(82310400026)(36860700016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: qdRf/M2VXtqFmIC4gYxfwLdMzCTD5SFPBhLV3gCU5CbFygNwCiw0a2hgmBa0es9Rd4G64IiaU0aZBgRG3k56QxOBm6Uxva39gOmGMkCnGkkfjWu3/6KWFJ63ODZCO1vkdzD64i9tx5Ded42yklhQiNpjRohJAcRvliQeQ6zNYPM3NCm2FngJqcMjBjKL1FP8PeA8DGeRWuFuXuAg5d+WEH6TdnYxA5CrdbsQRdx7yYSSvZQK/Zf700+KojX0ZmfGa4o36Vq1dQiZHXVmso+x7KwZw7HknmAUEY0o5sPsgM4Ks5rh2ilvGgovewXmz7OR9j6Oz3RI3cFGL757eeFRhX+0239+RUhYNfgwe9QJrKECnWXqHIXmMBJGS4CKYEF0QXzGauNne+zb188fvR/GfzTe1XeQMgBEguBlW0GtBxrg7EdjLPJIgSkQje+yYVBQ
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 11:21:35.0855
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 274db997-6ca5-4b88-0d7d-08de79e03203
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A0.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11945
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_032142_484652_1D66A6CD 
X-CRM114-Status: GOOD (  11.32  )
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

Add aliases for crypto accelerator and rtc ensuring that on-com rtc and
the SoC A72 domain crypto accelerator are assigned first index.

Further set model and compatible strings which are informative but
overridden by actual boards.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/fsl-lx2162a-sr-som.dtsi | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2162a-sr-som.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2162a-sr-som.dtsi
index e1344942eaaee..3ad908d52a18b 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2162a-sr-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2162a-sr-som.dtsi
@@ -5,6 +5,16 @@
 // Copyright 2021 Rabeeh Khoury <rabeeh@solid-run.com>
 // Copyright 2023 Josua Mayer <josua@solid-run.com>
 
+/ {
+	model = "SolidRun LX2162A System on Module";
+	compatible = "solidrun,lx2162a-som", "fsl,lx2160a";
+
+	aliases {
+		crypto = &crypto;
+		rtc0 = &som_rtc;
+	};
+};
+
 &crypto {
 	status = "okay";
 };
@@ -77,7 +87,7 @@ variable_eeprom: eeprom@54 {
 &i2c5 {
 	status = "okay";
 
-	rtc@6f {
+	som_rtc: rtc@6f {
 		compatible = "microchip,mcp7940x";
 		reg = <0x6f>;
 	};

-- 
2.51.0


