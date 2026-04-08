Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2876F10F996B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 18:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3R0AkKnUcwzf63F5Ob2iyaxFS/vZ6orDhpxrsMqspT0=; b=Y0PsRovrha95y5IYeo98oU3UCt
	FTTNIYmG/TI8y01YVCpzu7Hcvdrt3t15wGvX0tSoK+6+K/Wn6MlgfyfAWaRF+3CoEFYLoZ4W/nRPL
	q6EBGxBDT1iiqV0QYO1yBnnnl19HFaaOyX+vZiEIY/XRLEiljFgumT7MNgiQwMAOTebQWua7zLoos
	msAkbsbU34xUPV1otngvrnYlVcDP6Bq+S/aTMAi8lKeee/KE3WaVjg+saIW3EUVi2iM1XaT0vH3je
	ICVwHIHsiYRm3oiKzQzvMnW+tIq+1SV2EKT4SiqSLYPbVAa6KPOpwTJpXEHyscWKiJJsiAAVZfF+g
	z44tBq3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAXnw-00000009GRb-2zQ0;
	Wed, 08 Apr 2026 18:39:08 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAXnu-00000009GQH-1z72
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 18:39:07 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=DuWd2L9dJslkoXgspSHsp/lSFLt65MCavcBhCtYpCvQ/uJQE1JsF8KCXm0bGsfU/bTyA4A1gK/X5BYuzR9wslk7ONH3EwypPQ9STdEfjEY0d0i3GTlUawRZ0GMnogIMtOHo/4cczq6LggQzh5LyKAvAqBjKwX3oTYkk+RNYbqW9B0JBRawlqlUD8th5YYL3iFc+It+RVoqhRFC9y9Yxd4WcqDSIc9mWGZPXK1IQFV4IoqtPkQWAdJIbOAEwmCPudzn89P1B6Tik6wnPe4yjfNYlvi1BNr6LkhTg2Qg9Hm6jFX6Or3eKaHsFymAR9jktMQQ/D9hhElKZmmBZ/qWl5Ag==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3R0AkKnUcwzf63F5Ob2iyaxFS/vZ6orDhpxrsMqspT0=;
 b=VlPE4SAfuerXFIRKAeOyX49f5H5rWMwtZcI72AqSaxn2eeaxWJD6zR+e58Ll78zNY41SusdTFVQ71UarL4ZIMxI3mhLeIwwtiwuLuack078iRsDR0mmDxb2RdJFC4dOKbuEVwsIf+zg1MdwWmhoeW5T7ah4U8huwzI2pJ73ucQ/MqtS9XSfE0ZK5OVxqrFZCX7N0untFOmW1hGlwnirpSzxpAUe4lnBqC7H/nZpFhxt9olhgJw4KfqmX0VBGl5aqPe3w5gf3461zYEQFmuFMZWhKFDYAnNRFa2OBqy44gBlqSFzpt8/EOEMf7cMKFkJS+/AD/dN/gL08c2MgWp6WaA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=solid-run.com] dkim=[1,1,header.d=solid-run.com]
 dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3R0AkKnUcwzf63F5Ob2iyaxFS/vZ6orDhpxrsMqspT0=;
 b=PO3mQssUGrrnnY6ZEu5XaDnfgEd81MrylOuAoboDkf7c5aHV5G9Q6dJpmI6jJQYhy+BmhQ3hLjSsgfFxRKpfcG2bxwxoVFzclX0JWZc5kJ/rQPOi5iI5uO9nu6072MkWvMc4W1RPpR9AYRN8tOiEPqaNA25EBdH46U6QrnYHrFwIhuePDF9ys9Yq1iJS02PgblEesLcuJ3l3PI2Q5pIxQm7lCBONlsfV39PN1w3/tvrQw28xcXi/m1JD6PVzC6jypD88JHfB0cw5ZR3NK99NfYVcXZTcscOvplFi22e93X6/gAI/5KAL27CWZRYnHcyVo+PWX7NXxrZI4ufw78jdCw==
Received: from DU2PR04CA0013.eurprd04.prod.outlook.com (2603:10a6:10:3b::18)
 by VE1PR04MB7438.eurprd04.prod.outlook.com (2603:10a6:800:1a0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 8 Apr
 2026 18:38:59 +0000
Received: from DB1PEPF00039231.eurprd03.prod.outlook.com
 (2603:10a6:10:3b:cafe::61) by DU2PR04CA0013.outlook.office365.com
 (2603:10a6:10:3b::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.35 via Frontend Transport; Wed,
 8 Apr 2026 18:38:58 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB1PEPF00039231.mail.protection.outlook.com (10.167.8.104) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.21
 via Frontend Transport; Wed, 8 Apr 2026 18:38:58 +0000
Received: from emails-5537710-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-77.eu-west-1.compute.internal [10.20.5.77])
	by mta-outgoing-dlp-670-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id A961D80C71;
	Wed,  8 Apr 2026 18:38:58 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Wed Apr  8 18:38:48 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EAnLmwozeBj5qqLKXRgW/Xll22D8MEeqNYKLDRLiV4YtqOvB1NyNZueIOVaHquaqdlXXxXsnLoLSjrvOQ93yQQGQT1Qy46pxg+SkJ2JglCGgI3twJR6EH3JZkEGr8bAWNER2Zrxdcdj/7Pa07ycK+CodrgnC+oGCmR/cAMgItb8b/PdK750z6n4u49NsYC4APazfrW0P7ZbT8BL9cndLNLWZiUBNj45feqpzbX1FFLi2KMGtKMrc1HIQzqtRELhuqAcQa7AeWW/2IbI87yKMDbaPCs0Tz4v6Yf4lyzuGt+XwOexeo41DkNxqIVtwisHpNAr9otRa9KNpqwkV2eIlxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3R0AkKnUcwzf63F5Ob2iyaxFS/vZ6orDhpxrsMqspT0=;
 b=mVNo1p/NvGD3FX7ynVwdfJwGViyxfDJFc4IA9PnMr+J5GXMVhTLb2zG6gFj9eH7jQToyRyNRhqq49VynDQnqqCbS2JL2ug7sY7uBmHlhn/U6ZntdlRFUd7O0X4VUwkzpTfIO5s4W1ZW36RoRYBQfTiQCE6tY7bgg9eP42YNz6iKwWWzzr0FV/i5zX3oRSx3shdGucPNcYA0ptF6noi8IsTcR38wIXsVo7qxdWfPZadBC5icQ+GNwE/O7XiBNn36Io+AizFwnYmkMuSNZVk+80rHqzERJYRpuzIxxydynwsjNUVVGjBGFQ6wzpJEaBZITqujeeWm0lfn4QqZPocReeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3R0AkKnUcwzf63F5Ob2iyaxFS/vZ6orDhpxrsMqspT0=;
 b=PO3mQssUGrrnnY6ZEu5XaDnfgEd81MrylOuAoboDkf7c5aHV5G9Q6dJpmI6jJQYhy+BmhQ3hLjSsgfFxRKpfcG2bxwxoVFzclX0JWZc5kJ/rQPOi5iI5uO9nu6072MkWvMc4W1RPpR9AYRN8tOiEPqaNA25EBdH46U6QrnYHrFwIhuePDF9ys9Yq1iJS02PgblEesLcuJ3l3PI2Q5pIxQm7lCBONlsfV39PN1w3/tvrQw28xcXi/m1JD6PVzC6jypD88JHfB0cw5ZR3NK99NfYVcXZTcscOvplFi22e93X6/gAI/5KAL27CWZRYnHcyVo+PWX7NXxrZI4ufw78jdCw==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24) by OSKPR04MB11391.eurprd04.prod.outlook.com
 (2603:10a6:e10:99::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 8 Apr
 2026 18:38:45 +0000
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b]) by GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b%6]) with mapi id 15.20.9769.016; Wed, 8 Apr 2026
 18:38:45 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Wed, 08 Apr 2026 20:38:36 +0200
Subject: [PATCH 1/2] dt-bindings: arm: fsl: Add SolidRun i.MX8DXL SoM and
 HummingBoard
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260408-imx8dxl-sr-som-v1-1-ce5a39acd713@solid-run.com>
References: <20260408-imx8dxl-sr-som-v1-0-ce5a39acd713@solid-run.com>
In-Reply-To: <20260408-imx8dxl-sr-som-v1-0-ce5a39acd713@solid-run.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Yazan Shhady <yazan.shhady@solid-run.com>, 
 Mikhail Anikin <mikhail.anikin@solid-run.com>, 
 Alexander Dahl <ada@thorsis.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: FR4P281CA0413.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d0::14) To GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GVXPR04MB12057:EE_|OSKPR04MB11391:EE_|DB1PEPF00039231:EE_|VE1PR04MB7438:EE_
X-MS-Office365-Filtering-Correlation-Id: c497ec63-39c4-4dfb-3bb1-08de959e18e7
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|18002099003|56012099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info-Original: zULoBSXJW5SLT3hjfj+I/e9ctlr11GjaY8z9zuQcAhb7ederwP6R8RjzbKX6WI5d1DiUU0ybVBK29L7sCvyjkqPHCfF6ASkoTvSw694pa5TFs8VMhV9BxQ8GTtDJHCYzVXZ2/MEh1Bl+Fl5ivQq/ta6Wbq07r+LOCaJS/J9wH/RivXFThqhq7mw7mgfUqq/xnL5ks1A7PakPMuB3bK2sjX79QZ84ZZOGVAr5YjRjkMT8ZMwQbFbsonoXXHUOzRwzFw3tzirv8+ZZrE1LXogNKQqNhi0vBM5mSvC3xvk/XafsF+7lnK+khU5YwjYWE+t6CiZdAIWMy00g+d9muQF/OoJSX4riEV6ZuO72pTpbIMpcJQNhNc/JUOuO0eb229tFcMA7czA+P3u3xuPC1G2fEAWRgL3qUIDhuycutERVSMhmMD3qua1VSEByumU1WJo+gAWQyGBw63mKszXuPsFQNmSgmcUlGY3DtOIrpdKJBI0qM5whOGsuwZ3s0jV+m93+N2c2JfPUj34xLc2z2Ht8+4qy3Q4UD0P9nLVGHdg3HHBjYjHLAl7uDBUgHPdYqmMIjaF3LKEQj5pn2F8pxB9hYpmtrhvtTK1QVD/JLDYF1oRHf/8ct+sFwdOFXPTMMZIXVLNPRHH6v0Wy8Y4ssZ/qSnRxQEHqlx8s6FQbYYhQRkyA1yAHW+RzPzyzIr+8N2gIJ1faDWt06g1ecBjWWSl7zNT2U9D999DOFC02U9esNfyAr1guo7sp03TnG+E93CfBbBCDQE8NrLcOgNP2jUrwystVrfzEyQfXPSnqgaO3Pr0=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12057.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(18002099003)(56012099003)(22082099003)(38350700014);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked: wF0XoLL52t+kiavEVNWHZT5hs+3dl7EPiXkALHPEpnguOJJLYgZ22ChjoahoBGYRFLr/P/wFgLOSO+A6sl9klq+TnZ7hNMHQ2GUVplcBvrjLtKQAn+Q9qOwQPIvNg1kNQzAfL55S0cFZU/sJ9iOqt95GVhjUzcbb2xXEEQYDsbGga5pdbQSPfWBSkBvSxmFKqCCL/7KXfeNAW8C2oMYM0GlNafUXZKWHeg9pM5p7KCaX0iHFF0hosRFYOW8L3R4ADc8nMNe9lqBJmq8Dp1rvXIjo8wJC9hfXlcYRHr5rOoatbUyZM0V0px0tPLd2sNRYj1/qh19Cag3k82dBNSNy3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSKPR04MB11391
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: eb9b7d5f9afd4b318b1320031c17f6b7:solidrun,office365_emails,sent,inline:8816a70946a0cdd47e43465ef0b43aca
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF00039231.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 51639a61-c671-449e-76f7-08de959e1106
X-Microsoft-Antispam: BCL:0;ARA:13230040|14060799003|7416014|376014|35042699022|36860700016|1800799024|82310400026|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: YPdRUpEZvnHK1KpuR2fiejsMYzfjQFw6n9xwzpumuwMP9x+5vp8IoNX8FlMeyLMJlvZkZ79RSLmn6unRIaHUzlDKXcQe7jkiR1jvesyC5dllruNBGmnkGKILP8ESvyfIhmzWy8IbCw3KiCyDIzvZ69xCK30ChVCYYjQ4UZWxPw3DWt9ue2jKg2paZeDiNSEmcr0XjbBkpa0QFebqhuY4y18iwmOTCbaRUJhU8t7mPdit+qOxpn/tEdBMUGKStmSuK+CfDLZ0gOe793XdD7KnP0kN81ONLLdorV7nFGdDryb0lIXnR4bSjJZ+XosWFSqO4eOztdClHO+1lAYN1VrcHpOPSGQJ3XbV6QoUaBBppatd5LpT296Y/Z/QodswZfbhTQ/c+cmZ3lUkdSitW35nSgOAQAEWVXNEQz0/+Ya5vXPeNYdvprBOjrbLj2kjEf96DBZ2F7spZpo3BR51jzZVrMLc4ekc31kFSMQ5yDzGJqUpjT9XTM1O8S5MioG/3qlS5M3Q1+J9UnK+WK6ilt6CtUFZHn6Eadd+qPuoWSlKiC6AMR1AHZMZ9jzWXl3m4RjJQF7iGaIlqlh5JU8XKZi1EbNqCUGimbpLSwUbpiGR2bNvZAj76kS/lugTbyvP4gxH5NDASTrMFdpeqmuwbBieNubb6OTAkdk+pINQJ7r9HZJdaPHrfD2wy0wmFiQkL5+Wdmwf/eZJFJSgpICYFeFhHUOuAn7dl9D84yB4gBFGZDUGqhF6WK/5WZGLytqYEY3abFYLmVD4AJAzPM+Fbv3Ssw==
X-Forefront-Antispam-Report: CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(14060799003)(7416014)(376014)(35042699022)(36860700016)(1800799024)(82310400026)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: V9nq7y6dfk7ajo5TpCMH2QVK/vAoIcXTP0tiNVSkhqQ9EY8aTXfko4yL9ubFMjkcpxFXhLJv4yccc6wfrluXQbd8NKLu3hYAveMLGcWCv9COZVjQgbRpHT3HDnxfDjzcQKwD9J45NmUuXmj8FLI/y9nFx4SuTgKmMB8okMWUZ5rpz9zt2+ry3tpSnsB1sRPWMNRrmAVELY0lhHYuVFhl287OMWz5og2yfI/mUyUjkCpTnfB6iiv6P86uaHk3Xy58lIpl/CEmzSM4llbKK51uRbvl3xLO5DBJ4gv2kkTm9BaSgzmxG2HN3kgk/7Vn3X5I+A8ILtMsuEwcBXY127EVREVqTP4HDBfTqCk3mCsKpjTBcWl/+BhJLm/RlRxYZ9wYKGej1j5HAXiKB1SiPSULVQSWvG7BOpkV26T9/sHsRyS1CrRSuUoF5npObwvyq9dC
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 18:38:58.7944
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c497ec63-39c4-4dfb-3bb1-08de959e18e7
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF00039231.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7438
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_113906_516215_AE1CBB1C 
X-CRM114-Status: UNSURE (   7.96  )
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

Add binding for the SolidRun i.MX8DXL based System on Module, and the
reference HummingBoard Telematics.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 5716d701292cf..c7a885159318f 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1376,6 +1376,13 @@ properties:
               - fsl,imx8dxl-evk           # i.MX8DXL EVK Board
           - const: fsl,imx8dxl
 
+      - description: SolidRun i.MX8DXL SoM based boards
+        items:
+          - enum:
+              - solidrun,imx8dxl-hummingboard-telematics # SolidRun i.MX8DXL SoM EVK Board
+          - const: solidrun,imx8dxl-sr-som
+          - const: fsl,imx8dxl
+
       - description: i.MX8QXP/i.MX8DX Boards with Toradex Colibri iMX8X Modules
         items:
           - enum:

-- 
2.51.0


