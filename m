Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F06C1105F7B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 14:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eo9FRxDfjdLF9m9tkXucbpqn8Ab4RcV+Mgm/DjoVgY0=; b=IiFNC6S3GQPgXs0EuniCImW17o
	J8z7ajQtVOW7oq3gdb1dH8/MMiMeLX2h78K2xjju+O7uwjB11AJlT2GZxpWzLzRQQvltrP73mlMe7
	uHYPB5ICv3SQV2yn8k7QnYo9/A2/D7qDMiVhJjMKqEvZ8QH7+0jAyr0afL4WfN2+pO3K7szV/pYRh
	ZKXTtngXYCfetdZlzF/hy6U16WF5FRSt8p+al1APo9PX1GUz0Dq/pxAA2W7VgFdCZjebzyRTVIWbR
	LiEY/tVngrIic6pJsTrS/2SEE0oWkcTgO8EmxW8r8ETNUqmx3KBF66xFaZztme+M/SUZfeW4NnV3S
	n17LqqNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13OI-00000000My7-3Bld;
	Fri, 13 Mar 2026 14:21:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13OA-00000000Mqg-3bUc
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Mar 2026 14:21:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=eo9FRxDfjdLF9m9tkXucbpqn8Ab4RcV+Mgm/DjoVgY0=; b=kGge4IxFL/T3CAlG60xwh9mhqK
	sGuRlj84JLfNXbIUoUd2sNLDDkDrcOBcYqXekXOrgniN6JgdJ8kuu/SITDN+834Twdl4gKzqgveiC
	Uce8mVWxgU42IToJG/cjvbKNev5dPBaSAe5o9mgcZEvb2L2lmOkM0OU42WbAT7rO7lpdzmpsn2HkV
	IPC4MznFbkA0SJ+nGEEpVM+KJjxs8x9krs6vNUnyTtNsKgTVkZVDDZbRoVc3iRDWl9mAsFqt0nmUe
	ldPLYUJtFDjNYP/h7yKxzQK8Tm2l+sC/4fhfO+hmSAWnZjvTS9GUtx2vhoH6/qhDdWQSPDxN0ZcjM
	+UQO/V0Q==;
Received: from mail-westeuropeazon11021123.outbound.protection.outlook.com ([52.101.70.123] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13O1-00000003W9v-3wT9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 14:21:15 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=dcai1OnGd33G6R7H/xHm/qOk4pc3KpLpuhdfzS4UkiFEeuVoypAUZQvlbwhGwdwDYpyPu3lR5jRlviac59VhmSFq8PQrrODTEqnlRK0Z2DP9azOfnbJftBDIidtlQL6aR4p4KyQkxSZpHY4400UaZ21SYPMZ0d9cmCz3N8EWr8VJpmrIthFppuBvrArQPnmNp9QchexLTDJQF4VZGljE9IhEMlxwJWT/c0OIhYE0cqGArOJTcGnPXF2+NrvCvq6OKUMdn4DUVjkYcC/UxJ1YcTMfb2ia0FZ4R5OUq/NszS6wTfJe1+bfq7Q4x085S2z+4UoUXC0XZqhBNtaDW5BBiQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eo9FRxDfjdLF9m9tkXucbpqn8Ab4RcV+Mgm/DjoVgY0=;
 b=Qo32ABlKHohT2Rh4tIBNa5AYkbLUCw9eKUzXyeEK3h+TS1FnL2D2yljkJ2Y4eSMsReBKVkuZSUE8XpisZHk7m39Lxw71Ip2h+QJo3vpAPM+AUD7ZXQ+LIwfM4ZYO9muxVfLBEnJZyC+M+S1VUvW+VbSeJSW7JRM5VNvfptn75Kph+GQ3ixs1Lz8PjW+AAHDD3e6a4/8FZacDaRRqQl606phs8yEv0by9mwRWJXbje/Ga/M07wrBtuwz3iIHTmA4xqjERSArarx8G4KwCx2XtTT0sGePyYQxkDuaRJbQQOzOCrQ189tqHMAp9Um+M3AMhrhWL9S623XBFZPRz4T8mPg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=softfail (sender ip
 is 52.17.62.50) smtp.rcpttodomain=kernel.org smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eo9FRxDfjdLF9m9tkXucbpqn8Ab4RcV+Mgm/DjoVgY0=;
 b=IUXsFUTOdkO4Bnn/zqONZw1ae1vXFlC9Vw82E+wGRd4T9T9JCa0pJvCupUsGnMfO4xCOuKWoqwZ6aXr+quVHi/jMFB0ZjE3ypr595ALF43iYDNmB92MCNmTXicfW7WcC7ct7Asi4Iwf4P76YUcTEXQ9mj1aDapkEDQ2xLGqJmX0=
Received: from AS4P189CA0027.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5db::16)
 by PA1PR04MB10915.eurprd04.prod.outlook.com (2603:10a6:102:492::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Fri, 13 Mar
 2026 14:20:54 +0000
Received: from AM4PEPF00025F9C.EURPRD83.prod.outlook.com
 (2603:10a6:20b:5db:cafe::2b) by AS4P189CA0027.outlook.office365.com
 (2603:10a6:20b:5db::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.28 via Frontend Transport; Fri,
 13 Mar 2026 14:21:03 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 solid-run.com discourages use of 52.17.62.50 as permitted sender)
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM4PEPF00025F9C.mail.protection.outlook.com (10.167.16.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.1
 via Frontend Transport; Fri, 13 Mar 2026 14:21:03 +0000
Received: from emails-1573246-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-180.eu-west-1.compute.internal [10.20.5.180])
	by mta-outgoing-dlp-467-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 5EBCD80CD2;
	Fri, 13 Mar 2026 14:21:02 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Fri Mar 13 14:20:56 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qOdTyPne4uMnk4n2E4p7fjxldZD9/q8HKdJVWs7VLx7jFD1f4wbEqDeXLkNv17s2q7JTLDYXrDwxqLOtM6GXuVLCY+RvIltWqIGVsO3VfJC59nd6YPIrhNUzkgJz7Y7zqn+vlrGq8IAiMh0o9dtdtOILhMgG3b2DRAQfQdYWlsb28rAczLKh+29KY42ZraPlIb8X3fYmgwPYPiSSuVjj5C3XPFw9wBginQZtwF3suEumpCMrtbWhScyWvwAyhSkm4drPvMy3tq+t0I1WXhfFJtK5hG1UgRP6p/Z3Kq7wq3RDyB3H8Tzv5V1ZjhzDbSamSjoEmzh1kA3x9GgeqV0uaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eo9FRxDfjdLF9m9tkXucbpqn8Ab4RcV+Mgm/DjoVgY0=;
 b=eKvgMbtCqbaIOx2iChzUIHd67ftkdRvfGPKflhaCceDVkCm4WWhjSOfpuJcjPq5vhzrShDhQGIOSoSx7dV7nOm7BU8RYgZQKwTyMcMMECifqGvwMefKgR2oMCmnk/UJFahxH2Yud2ZCpVnWE+82tXT8jdEfUXWH619CA3A6hdrDYpDo6YMbsh+9yK4oCFO4Bi2h2b0GLfm2K1P4NPyHB3hOBLi3HGcf1ZPXaKyBRBZihHEtjZhDHX+3pEj/JxHJzvxWqHDU1nyWhsBWVkULBevUVjtoefsmiV5FA6VxA01jiDhctjTrlbi4XOL74jo7osNLlV0jAnid1c29kZrCzWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eo9FRxDfjdLF9m9tkXucbpqn8Ab4RcV+Mgm/DjoVgY0=;
 b=IUXsFUTOdkO4Bnn/zqONZw1ae1vXFlC9Vw82E+wGRd4T9T9JCa0pJvCupUsGnMfO4xCOuKWoqwZ6aXr+quVHi/jMFB0ZjE3ypr595ALF43iYDNmB92MCNmTXicfW7WcC7ct7Asi4Iwf4P76YUcTEXQ9mj1aDapkEDQ2xLGqJmX0=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by AM9PR04MB8355.eurprd04.prod.outlook.com (2603:10a6:20b:3b7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Fri, 13 Mar
 2026 14:20:51 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1%3]) with mapi id 15.20.9700.015; Fri, 13 Mar 2026
 14:20:39 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Fri, 13 Mar 2026 15:20:47 +0100
Subject: [PATCH v4 06/10] arm64: dts: lx2160a: change zeros to hexadecimal
 in pinmux nodes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-lx2160-sd-cd-v4-6-aabcf230fbff@solid-run.com>
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8749:EE_|AM9PR04MB8355:EE_|AM4PEPF00025F9C:EE_|PA1PR04MB10915:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ba3a95c-c4a7-4cc5-9a48-08de810bc1f4
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original: 0qV0HX0n5tMr2DqLE2RYmwfuZj87gbleYkbWF15Qw2oLbiP8Oq6z3moyMJtrYC2Nar1mN4XMGMbS7ujBFNTSVeByH5Gtwx/IO2PArF5JhII7ZgtHiBh1fzaTmXx9X4FwWt5VIQl+ayBEgu5n6C/laNEfzjwAz9jytmdpL1SRH+tuxMbWlTD+lmw/3TnKze2dJWitYot3uQyoZ8AAXzKsBwzjupg6Ia2j3p8QvG4IZtKPTkq/FTquRz5M/A4oJ+5gyLp6h3Tk+DveTPJHhnCtge/c3hbYC2pn957T5bDR/yqHVV3x18zBvvv22icNTZ01BUk46uSsnRBLAnvcLNqrn2el16bfSekKEv8q/+Q75XrfBoUUCPOhzRMRIbj7g+RgHkXQ+y8aaa2hjP4BzWrr1CuH3iq1FlJfBmplzyWZ4dloOVlEiFNsBPd3wGa1HGvyqX43PJj737MfdQ+1iMJILOFUQU6z9vSWYSYnSgpiC6KeLUAVpGrnUk2zbA2BtfN9oMyKA+YuznbQLVOkNckAEBG5YLJ+2LAo2lAB9KN6+YV6it5uWtG/d42Jmm34QpVPbciNM19qk0lCyOpRBLAMI8QXrj7uhCZm3PNAEaXoPVI+hfwmkmYcWFaXTmzQxVn4CN9xu6rDmMhiOLURpqQdbzz+20D4MvpPNNeklC+a26yyE4yUlXksLpQoi8uKHCl8QwnZvXxW+O5+UE7FjhKfSLNBKRGo1QhiqEnlGaB190uf1YMcEbpw0pjqnz34ZGXM95wbu/r+6lLjhdwPeVt1KgX3ic5MQMO5fKD2pLoR8/Q=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked: KxleAt2YPUKwkPKe5AEGBYx3MKPhvG3+4aW2hfB8Jsbv5+xv6cHG27DZ6iWcnXSh9JpNFvn/19bf1q6R2ULQlt9jbm2PwxRh26XyikD2s9USSbkecP8XAn0jWhU94qd9y3XGOLR4mKMixiQemsUcuYz8xYBejDtvYN39Yq2f24oubSyt+uc4NLdFidTFpf8uYqxGxiTT5eCY6DdYQwgcv2+EYH6MC4nH3Iu8I2PU1JJ5/9PBWMdu2KY907x+YV0YEtWTvAb2o10Mj/UttF+KuO5bXmHtLi2ntoYsumVzNj0raQA6zuvg9wnlbfoN8l/Pc22LDDTlw7xQf3W8UYaPXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8355
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: d2733c1f9c5a4d8e9a191932adee56aa:solidrun,office365_emails,sent,inline:63fc3aa5d97fb79fbbc6fc70877a80c6
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00025F9C.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: b0c56d21-d1f5-4a3d-3895-08de810bb3e4
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|14060799003|376014|82310400026|35042699022|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: BKwdxqUiMTFf2PBB4gsV3pJBjIrv8vNzOvxPGTst02tL9yaHA7Q+xi0GbovF8ouciCX8CD700u98ZIBXqWi8T1T8Y7e1DfAnzAzwFwT3f19CC/grZpbcJVGZ46vkg50QxXOqTbofIdMoUjmg+G9nkczeV+wla09YDgDiTjPTwxVFGIgXxPlTZuRD+awM+SCJWh++UCBBM5PyV7cq6zwskXFEIJwCRXy88g+yA2bXe2AUS8a4J+/xbQNVYyjzU084PIuZD7xXfZ+7wAHYFkHrUz5WgMbwEnBVQlrFYpVLZ8ZHlcL4DEJAoYz7i1Xow4f7oN+2PMoN2gR4JXaBhiSFy55lg5VuJr46Cz9dJ7cq5CXqOvL2bTdT+qw4Jmp4kAAeCBXBqW0Yjs7Li2I2JJJpbe/a2UwbDuO/D0YxumpdGqAwhyqJ6j+vn/7IYoBORcKO1vbvKlUhl4Z/dAFwlzAfQ2HUJZr268d3Jiac7vBbeWasNI5CjrNb95uSrZNsr7XRj9Z3ruEJaTwmuEN2ax1QME7vA6HqvaP0E2lF27+17rEMzFrHQA+HYroiC5542iItqCAn1kVO/YLrNOxYjXtbaKspEVZm5PL+gXgTK5Ozakxw0oBbARIAePkM3Bf5OtZPTjU+qoPsFlDYpmRasXrxWbjXVmkOkfOtdqy5qHUKKhYy03NUl0tSVIvtxpMr79NBKY4g0zRwIwHCoPWPNjIPfdcWGIZz8Ple9kDqglWM9ThXPutUV6fLyho2i7KzstS7bKGYr+dW0xbNEbtH2Xgxbw==
X-Forefront-Antispam-Report: CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(14060799003)(376014)(82310400026)(35042699022)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: fi3GlhmOmKODahyAD72opyqflRvJJ2/rCBf5VFOueqMJgU2MaudLGNvdL08l+awnxvpA3L4bOCuzh5AmAnQPNAlMS0/jenY1BPr4Z/W0PmVlQZvuRNakxwCj4RbKkI5lqZQUaCwfcvZyaiqLIBxV77y/SEren/4JXui/wOVprFs5BE9QuDdpgIXx/1doFjZG3AooN3+D4Atg5XeLaPq2JIpQx6p9tyCm/RLopwg2a2gkCN8SruEC5KUs8rK6Rz30HdXeb3pK4zJjGqq3NPhCT/8w/JWYoXePIj2CsgjY1Dm0mBnz6yDQ5vgKh8Wou9zVTAQPwedsbmvdSXG/AzRNDf9lk8YZEvqCT2xsPS8WbEnf0OTuDDx5HIIc470ugBTpD2B9k+mdlvsZTaTKn6a50xYxvBtwLidcuyC19wpCtduZTOTi44J9fy1DxI/2x8vI
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 14:21:03.0852
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ba3a95c-c4a7-4cc5-9a48-08de810bc1f4
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00025F9C.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10915
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_142112_095337_8DD352BD 
X-CRM114-Status: UNSURE (   8.82  )
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

Replace some stray zeros from decimal to hexadecimal format within
pinmux nodes.

No functional change intended.

Fixes: 8a1365c7bbc1 ("arm64: dts: lx2160a: add pinmux and i2c gpio to support bus recovery")
Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
index a7fcfb7339f1d..57c0fd02d6c69 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
@@ -1722,7 +1722,7 @@ pinmux_i2crv: pinmux@70010012c {
 			pinctrl-single,function-mask = <0x7>;
 
 			i2c1_pins: iic2-i2c-pins {
-				pinctrl-single,bits = <0x0 0 0x7>;
+				pinctrl-single,bits = <0x0 0x0 0x7>;
 			};
 
 			gpio0_31_30_pins: iic2-gpio-pins {
@@ -1734,7 +1734,7 @@ esdhc0_cd_wp_pins: iic2-sdhc-pins {
 			};
 
 			i2c2_pins: iic3-i2c-pins {
-				pinctrl-single,bits = <0x0 0 (0x7 << 3)>;
+				pinctrl-single,bits = <0x0 0x0 (0x7 << 3)>;
 			};
 
 			gpio0_29_28_pins: iic3-gpio-pins {
@@ -1742,7 +1742,7 @@ gpio0_29_28_pins: iic3-gpio-pins {
 			};
 
 			i2c3_pins: iic4-i2c-pins {
-				pinctrl-single,bits = <0x0 0 (0x7 << 6)>;
+				pinctrl-single,bits = <0x0 0x0 (0x7 << 6)>;
 			};
 
 			gpio0_27_26_pins: iic4-gpio-pins {
@@ -1750,7 +1750,7 @@ gpio0_27_26_pins: iic4-gpio-pins {
 			};
 
 			i2c4_pins: iic5-i2c-pins {
-				pinctrl-single,bits = <0x0 0 (0x7 << 9)>;
+				pinctrl-single,bits = <0x0 0x0 (0x7 << 9)>;
 			};
 
 			gpio0_25_24_pins: iic5-gpio-pins {
@@ -1758,7 +1758,7 @@ gpio0_25_24_pins: iic5-gpio-pins {
 			};
 
 			i2c5_pins: iic6-i2c-pins {
-				pinctrl-single,bits = <0x0 0 (0x7 << 12)>;
+				pinctrl-single,bits = <0x0 0x0 (0x7 << 12)>;
 			};
 
 			gpio0_23_22_pins: iic6-gpio-pins {

-- 
2.51.0


