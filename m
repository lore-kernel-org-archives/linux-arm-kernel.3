Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F9CCD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 11:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	Message-Id:Content-Transfer-Encoding:Content-Type:Subject:Date:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9AqqUjFSgl9zOmmkeX7H2z9IxjyyxSSFdcMxSsFztVo=; b=DoL8naE8Agoicn9NPVkzjAAILW
	ckELv3a3xqmuDtlJ2yBPwZ0aZNMdSIjIFy/dh6bikVRcASR+EqfVfuhLR531nzPR9qagrakEhqlSQ
	GcSusFnyARuYuP2b7nS5X9CUkS8tO7JMTeO//uuwMRBBM+0tJV/Y9Sbu2g4mRUPVwo+vR/ESqRXWX
	YJsAjNrOwcr/vKZ7yl82nkPOqcObmoEM1ezYoxM0hXxelTHfYNOBq4o/sZuQFNL3ViExng6Y/kwWc
	l8Z+DHCyaQI6PPIxs6VRD4nXqmbF2nKd9QsJAjyNdI5yPOXZfZaMRXREG+4CSZD1i1ZZk+LxRZ4ef
	mhptqLaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXHNi-00000007Z2M-00up;
	Wed, 10 Jun 2026 11:46:02 +0000
Received: from mail-northeuropeazon11020090.outbound.protection.outlook.com ([52.101.84.90] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXHNe-00000007Yzm-3cL6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 11:46:00 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=F64GKpMmK2mPgl8qnxLzbK4YPZBugn6fpEImVqeP2mUId4p0tzawiR5pOotP4ybMppHpxc9H7kr6MOQIWkhkjHemW4fpdTdjZpycXRHrAaddzUPRq5aVVidrTZfg0ve03SMLTqaQw4CAspws3N6w/tN0ztL0CbHqq7HBxrJ69D2FpELuM4Lh2tmVRKTxzinKGAapxu2fHLv3ejxXAcT9Ekf+WWg7Tw/q+IMfr6VARa4Ifycxcb208TEGYuKLMJBWZs1NvZtiZPPTO6pPsZupEx8CKMeF/brhScN9IN3nel1ZkNTc1GsHSXA107rVYfMex7Wc3zjmuhDo+j7x83cR9A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9AqqUjFSgl9zOmmkeX7H2z9IxjyyxSSFdcMxSsFztVo=;
 b=J4CAkPzSZ7pVrJ64uA8xmSp2ChHYejEcRcpPAPwPCN0+O+RuuhFo7j1k4WPOMK9wM4Jq84///KDGi/FmCMwOYWNnU1/a1pY2Pg4tkwCMl2RNQYbQqk9qFyGHh2JqvrDq/VOZn9sE+KhkcE4887+hiO6g5xhWgUjEPtKVnSBy19F0UiJ/sC0BJUmEBohbsazFUY3yMopP1uPrNAYEVP2OK5hwXqS/l/MajP38gKRFM7R25OFt+wx6f5AfG5Zq0YL6w1Y0P3zQGhW9Z4fH+CyqYymCU8xi/LzGft7vcKml68OS2357x7RXcy2jjzbvze3Mi9CwRr+GAKp+TL2NUkIGlg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=arndb.de smtp.mailfrom=solid-run.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=solid-run.com] dkim=[1,1,header.d=solid-run.com]
 dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9AqqUjFSgl9zOmmkeX7H2z9IxjyyxSSFdcMxSsFztVo=;
 b=tC4HZGHnJksnJy45ew0LKURDKoGEn6KkoRYMUEv16I1QzRDQJnmn7XOMKVTndVMA8CpMRqp7JhFlW0TEiTVHCZzmay4+dmKlkzlVvfiwhOijbAopDr5x6ibBg6fpTS7mEGXkHF+o4FVOLJ2zI5gtbAu/ddScf7aufdinU67BHpf8/5GNb1Pm+k81gkk1Gv/bgGWi9MaH/pRFwxGUeoaUHz6BpuG2K7kYnDIbxqURXVqGLNMEBXLiYPlNDeMxeHAo4bPdNR3bSumiHZJp/KGpJM/tm+6fCmZPttqg3sB0Ou9MFpJcLwRVE6lkTsaDIzwjTvzVZjrW9hAdXgSazqP9Tw==
Received: from CWLP265CA0402.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d6::12)
 by PA1PR04MB11506.eurprd04.prod.outlook.com (2603:10a6:102:4df::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Wed, 10 Jun
 2026 11:45:46 +0000
Received: from AM4PEPF00027A63.eurprd04.prod.outlook.com
 (2603:10a6:400:1d6:cafe::d7) by CWLP265CA0402.outlook.office365.com
 (2603:10a6:400:1d6::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.10 via Frontend Transport; Wed,
 10 Jun 2026 11:45:46 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM4PEPF00027A63.mail.protection.outlook.com (10.167.16.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.7
 via Frontend Transport; Wed, 10 Jun 2026 11:45:46 +0000
Received: from emails-6124461-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-195.eu-west-1.compute.internal [10.20.6.195])
	by mta-outgoing-dlp-305-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 1DCAA7FFEB;
	Wed, 10 Jun 2026 11:45:46 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Wed Jun 10 11:45:37 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dx2Bi+zLHnH9+da88v8zJfnae1ZyZ8DZE7aEqE83PX4uSBWRSsr1V+3Gy5WTAC6SBlSCpTmCa7bK86/38fctVkdA/8OSe6znOtuysII+4Ot1KaYZM/XQGSbifuOY4g0xUjx+bHlUZb11FBM7MVkHcC8SlEYYsW/nZE0Kmwo014GLhASCLbDkhTvvaPeZMMsuKB9LeWecpyrC/4XcxKwrtHZQAjLT92Ib8tFBWJIPE5FFzzg7HbOE0Ee1mzvaeG1xvNSoqKEJsL5E9fu0LvP3kKL6fGE1U1qKeCR+mXq4EPaOhscIztXw+80td3x4Lk19DbkK2pQJNmpIJ0BLXxhHag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9AqqUjFSgl9zOmmkeX7H2z9IxjyyxSSFdcMxSsFztVo=;
 b=yrv3hjX/3c1IQB6r/VNkpghBDpgOnO8Lt+KZUb45NZHuDNdiI/RovQaaZPBPo4DUOVOIY/PwVdBeYtGB5sqSGn5WeBsFT4EpP9AZUdal7awPx9CzM60alGZ9WQ6ylxrQQx58LpD+ZMVFKAUhLUls1yB968LXC8zAAdczUP2GK0hD/EcHmHdKQmTg78NFXUdGfG5F2Wpe9CHTLVuxbLJQLAxdjKv9kbTH4kp6dPb3dg0+zuIwxAr+X11ZxNdzYXLCjcw8XGF7YfWFjCh2qFB1VBdSq9eLfiX1zoFBhTHXFc04auimj+cab/TnwAOfsRqr6P7yUDLhzrhWQsOS0ZrlTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9AqqUjFSgl9zOmmkeX7H2z9IxjyyxSSFdcMxSsFztVo=;
 b=tC4HZGHnJksnJy45ew0LKURDKoGEn6KkoRYMUEv16I1QzRDQJnmn7XOMKVTndVMA8CpMRqp7JhFlW0TEiTVHCZzmay4+dmKlkzlVvfiwhOijbAopDr5x6ibBg6fpTS7mEGXkHF+o4FVOLJ2zI5gtbAu/ddScf7aufdinU67BHpf8/5GNb1Pm+k81gkk1Gv/bgGWi9MaH/pRFwxGUeoaUHz6BpuG2K7kYnDIbxqURXVqGLNMEBXLiYPlNDeMxeHAo4bPdNR3bSumiHZJp/KGpJM/tm+6fCmZPttqg3sB0Ou9MFpJcLwRVE6lkTsaDIzwjTvzVZjrW9hAdXgSazqP9Tw==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from PAXPR04MB8813.eurprd04.prod.outlook.com (2603:10a6:102:20c::24)
 by AS8PR04MB8977.eurprd04.prod.outlook.com (2603:10a6:20b:42c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Wed, 10 Jun
 2026 11:45:35 +0000
Received: from PAXPR04MB8813.eurprd04.prod.outlook.com
 ([fe80::4c11:9f48:de3e:a67f]) by PAXPR04MB8813.eurprd04.prod.outlook.com
 ([fe80::4c11:9f48:de3e:a67f%4]) with mapi id 15.21.0092.014; Wed, 10 Jun 2026
 11:45:34 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Wed, 10 Jun 2026 13:45:23 +0200
Subject: [PATCH] arm64: dts: lx2160a-rev2: avoid 32-bit pcie window system
 ram overlap
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-lx2160-pcie-fix-ranges-32bit-v1-1-98086fc5fb6b@solid-run.com>
X-B4-Tracking: v=1; b=H4sIAFJOKWoC/x3MSQqAMAxA0auUrA2kVetwFXHhEDUgWloRQby71
 eWHx78hsBcOUKsbPJ8SZN9i6ETBsHTbzChjbDBkLFlNuF5GW0I3COMkF/oPBUxNLwdSacu8IM6
 qfIK4cJ6j+fdN+zwv3bmX1W4AAAA=
X-Change-ID: 20260610-lx2160-pcie-fix-ranges-32bit-0868570e495f
To: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
 Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: FR2P281CA0063.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::19) To PAXPR04MB8813.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::24)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PAXPR04MB8813:EE_|AS8PR04MB8977:EE_|AM4PEPF00027A63:EE_|PA1PR04MB11506:EE_
X-MS-Office365-Filtering-Correlation-Id: a9111d51-81fb-4ce6-e7aa-08dec6e5cf83
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|52116014|18002099003|38350700014|56012099006;
X-Microsoft-Antispam-Message-Info-Original: vItWBnyASUd7BqYgs0oRDp68cwHcbQSRsxUbZ4nrJb+hsKKr4t94XBIPpb1/3aTVo7x23yIDRG0fvYbKz7fqsH4KgThp7EUN9SzDfCL0vnSQGd7qvca99Jwhh/1k8SwqyeoXhlrGISYVeU3Yd7kmVrQBa7tfiUKYIqEonQXMR615XiOcBCJlEZggc4M9jWgva/UfOZKhK6YVFPx+uH0K50ts2lsL4A5z6RgxZINe9LdxWrFeNt8fcAPVbzWOylsGYvT0R+O9GZapycBAF8U9EKjFiSWEtUUWVcJEkklUhHAnmsydwF6GrZmK5R9oW/oET5YydJnHwRYGfpQQ91LXwhWtnDKDQKI2K/Nr9K69LaYRC/QgKRdS1Yj8fJOqQIl6iqXIpej3xUkrrIrMxB6V8th5rX03bEsSqNcaUypDN0IKwvxG4F6mp7n5hQspHVn2Xh4OkwwuvM7scI2sOlq0Qc1rcZXJjdkZ4n4MaLMHPOcn+1lLtcO/inZxuokzz+G1kcYYzmz3gp84nVSeEUI8X9qTwuIXqUuZoOvOzJ3rARdUk5Gbd5oxw0RA47ypGPkctJPxwRIn+3fSLfJkVL6shtUwUw7dx+co5pFIBT2yDvX2qlDERjnfsONqEjQ6BYrZD6QoV5DVubBGr+46T5Mn4U/f+tZc0OrzJq6nPvTgyycR0YV18Jb9p/471h8GhLkHDK6k/XudCDxRP9XToQ07HZw260pNWEvc0c0QIxlL9D5C01I+MSB+Xd97YfI/ZhXW
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8813.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(52116014)(18002099003)(38350700014)(56012099006);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked: sprGWXXMD95agIF5ukSvsR/78wt1ALVzEhEzyofCAI2J/zkReSxSpe60eT7AsU4XCQDyHI8aIDNRXS92mSzHqXokwjQwPVIi6rRERdrT5l/eQyUkCUIbLHH6MGvsETw9QGf/2IViQMkm+gBsPqLfm62ffAq4foBRe/IqexB8pz+cAKaUi0vEqCBdPPTPV1AWiiZsP8OeAVQ9ulhLIIM1CiE8TfenS1bDLGQb3RRr0k2LGtSkP/hb5CxBRoBzvAuEq7Knew/Ur/jeaOhVi6euyUh9AcV+6F4m+qivfBCJqjCzfAaP6FEltFZVDBx3nBt0qCRzbcz7s1XKPLEOKvmgRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8977
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-7.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 31adadc390aa4b25a226cd26126eb5b5:solidrun,office365_emails,sent,inline:a41bf6707d170c0a63bddbe0b5c1ea23
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00027A63.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: d1b98c96-b1f9-42ad-5893-08dec6e5c86c
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|14060799003|1800799024|36860700016|376014|35042699022|82310400026|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: lZBe5awcF5HCJKdRgn8lDaF5v98bxehUDahCnkg4Y4nrGp9czyGlWhlhsa/QnMdUs9sfR/MlgrJgUb2J2zxcjrIWtHaLJcr3clps/pVs5CFj9+kKhwbDYMneKXnfgmKxt4LgsbU1+YrtgwBrycTadtZJqT7EHHpMll5Rt76/SwVAiRfd7BtPrFxQRnIyFfsaQKueP7s37Zv8Cv6iK9lYfuRvUa0bfV7IItuG/rsgX+IeMXQY+X/FpT/qhK8cWev7upQnVmah/O2+LDMehFclRvhbcOeAz6rIB/8qSsMMT12jUDsGgb7xKZH9yb4iatc8XtDg8R/iaXGIoCufXD4W6XcEI/j588m8gco9O8wy1spFmXgTf2lFtF1HJLh/W7PzkBHthdcdwpJEx2Uc6wrXVihcc+0io3My6gj/X4b7R4PhGQt/e5h1p7GL9Bt46c4fmztRnbUOfXbK5ctQyuf3b4w9rd38qz28TeJEXhXRTyUb1pjqKf6lolWKgkf1XyUzoN03lD5HzA0Q2ReVU+l9HPTZ53ldt2HKeeW3WymIYITEfd7Piw2mqy0GbBOr9Wg0Fi1OWDQt1IOJ+wTmdemEyzX4sXZMCUgT4WK/uzKYXE0/n9zM49Ia3pWqeLFJWyg+0zYMtUsUxvTTgjo1HRFhsp7dxmqtbJX2uc9zQq8MWjsWix8/wszqAICxJmg1rL9EyDIK9U1BTDQvGyaqCP/ZNuv70x/i33lmOYtsgntRqKY=
X-Forefront-Antispam-Report: CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(23010399003)(14060799003)(1800799024)(36860700016)(376014)(35042699022)(82310400026)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: yVnKLhox6Ih3EA2PmZXmkhYLyR/oU+HA0zmoDCzYkRWqx3HPOQR2jtx/Sd/9QGXZBlPaUUgOr1Q+EIgtwf04vzIE2PWhLMsL4rZ4/2xYy9xlRVAlMUKArjTYrkHyq2q9r/eoziIvGgJW4o8tV6yIP2DUJjbAEAYgK1ckMh5Q3MbJvXSJKD2yo3MBZDk/vsbQc8tCUQwoZIjQnw/bDSaqTBWBRckXFznyB/CSGAvXcpmZpBgT5MBEODKHH00adm4vfhjubYxp4KD+J/z6cOrkfveRFYo+xr796va9on3gPDZaXSeQpcjypCcziYo0EKrluwe3JWuxDKWB80XnVAF5NZTNkDP/YhEw6Gfjjeb+Up/3xXfxSyKh+Gdv2JHi/KJmq03H7B+JonWDE/swtoY6PGfkFIvXDkrFoFPVRojxWkoM49d/gsYamBPJbabsp7xa
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 11:45:46.3540
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9111d51-81fb-4ce6-e7aa-08dec6e5cf83
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A63.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11506
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_044559_070663_6EA2F342 
X-CRM114-Status: GOOD (  10.06  )
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

A 3GB non-prefetchable PCIe bus window can overlap with inbound DMA
addresses for low system RAM, so DMA transactions may be routed to a BAR
on the same host bridge instead of memory.

Change the 32-bit non-prefetchable PCIe window back from 3GB to 1GB on all
controllers, avoiding that overlap while keeping the added 64-bit
prefetchable region.

This partially reverts commit 9ed301397090 ("arm64: dts: lx2160a-rev2:
extend 32-bit and add 64-bit pci regions").

Fixes: 9ed301397090 ("arm64: dts: lx2160a-rev2: extend 32-bit and add 64-bit pci regions")
Reported-by: Arnd Bergmann <arnd@arndb.de>
Closes: https://lore.kernel.org/r/9e6326f6-dad1-4169-a63c-e62ee5b341f2@app.fastmail.com
Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/fsl-lx2160a-rev2.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rev2.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a-rev2.dtsi
index 3570399f9b21c..3d2637fee2d35 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rev2.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-rev2.dtsi
@@ -17,7 +17,7 @@ &pcie1 {
 	ranges = /* 16-Bit IO Window */
 		 <0x81000000 0x00 0x00000000 0x80 0x00010000 0x00 0x00010000>,
 		 /* 32-Bit - non-prefetchable */
-		 <0x82000000 0x00 0x40000000 0x80 0x40000000 0x00 0xc0000000>,
+		 <0x82000000 0x00 0x40000000 0x80 0x40000000 0x00 0x40000000>,
 		 /* 64-Bit - prefetchable - 16GB */
 		 <0xC3000000 0x84 0x00000000 0x84 0x00000000 0x04 0x00000000>;
 
@@ -37,7 +37,7 @@ &pcie2 {
 	ranges = /* 16-Bit IO Window */
 		 <0x81000000 0x00 0x00000000 0x88 0x00010000 0x00 0x00010000>,
 		 /* 32-Bit - non-prefetchable */
-		 <0x82000000 0x00 0x40000000 0x88 0x40000000 0x00 0xc0000000>,
+		 <0x82000000 0x00 0x40000000 0x88 0x40000000 0x00 0x40000000>,
 		 /* 64-Bit - prefetchable - 16GB */
 		 <0xC3000000 0x8c 0x00000000 0x8c 0x00000000 0x04 0x00000000>;
 
@@ -57,7 +57,7 @@ &pcie3 {
 	ranges = /* 16-Bit IO Window */
 		 <0x81000000 0x00 0x00000000 0x90 0x00010000 0x00 0x00010000>,
 		 /* 32-Bit - non-prefetchable */
-		 <0x82000000 0x00 0x40000000 0x90 0x40000000 0x00 0xc0000000>,
+		 <0x82000000 0x00 0x40000000 0x90 0x40000000 0x00 0x40000000>,
 		 /* 64-Bit - prefetchable - 16GB */
 		 <0xC3000000 0x94 0x00000000 0x94 0x00000000 0x04 0x00000000>;
 
@@ -78,7 +78,7 @@ &pcie4 {
 	ranges = /* 16-Bit IO Window */
 		 <0x81000000 0x00 0x00000000 0x98 0x00010000 0x00 0x00010000>,
 		 /* 32-Bit - non-prefetchable */
-		 <0x82000000 0x00 0x40000000 0x98 0x40000000 0x00 0xc0000000>,
+		 <0x82000000 0x00 0x40000000 0x98 0x40000000 0x00 0x40000000>,
 		 /* 64-Bit - prefetchable - 16GB */
 		 <0xC3000000 0x9c 0x00000000 0x9c 0x00000000 0x04 0x00000000>;
 
@@ -98,7 +98,7 @@ &pcie5 {
 	ranges = /* 16-Bit IO Window */
 		 <0x81000000 0x00 0x00000000 0xa0 0x00010000 0x00 0x00010000>,
 		 /* 32-Bit - non-prefetchable */
-		 <0x82000000 0x00 0x40000000 0xa0 0x40000000 0x00 0xc0000000>,
+		 <0x82000000 0x00 0x40000000 0xa0 0x40000000 0x00 0x40000000>,
 		 /* 64-Bit - prefetchable - 16GB */
 		 <0xC3000000 0xa4 0x00000000 0xa4 0x00000000 0x04 0x00000000>;
 
@@ -118,7 +118,7 @@ &pcie6 {
 	ranges = /* 16-Bit IO Window */
 		 <0x81000000 0x00 0x00000000 0xa8 0x00010000 0x00 0x00010000>,
 		 /* 32-Bit - non-prefetchable */
-		 <0x82000000 0x00 0x40000000 0xa8 0x40000000 0x00 0xc0000000>,
+		 <0x82000000 0x00 0x40000000 0xa8 0x40000000 0x00 0x40000000>,
 		 /* 64-Bit - prefetchable - 16GB */
 		 <0xC3000000 0xac 0x00000000 0xac 0x00000000 0x04 0x00000000>;
 

---
base-commit: c10cfc952215644956284a42fa7b7860dfbcb5f5
change-id: 20260610-lx2160-pcie-fix-ranges-32bit-0868570e495f

Best regards,
-- 
Josua Mayer <josua@solid-run.com>


