Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E040FC55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 22:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=m+/qsu2h8mFyIi/7JgCdoyWno15I3Zci2uueWZNxiW0=; b=SlZMcT3jVu6mi+gMvZZ5vii/ew
	CFu4lUWgzACdbWZ9aK35h5aFqvEG6GZ0TM2wrKtmqo7uOF+bP7VdjnIRyB7Mo3Qo/Q5Slc8a+p7Yp
	MIqKU6HvRjc5xc2YrahldnsAhFl2r0oB+IYEHlZNDnpkB9j+as0+Tn8lFyaljtWzI9LOsz44t52Q4
	1Sd3NBWhKeLWaGN+ZL4hgjGInGRRxjzgpu+Ogx8J/a76I6xeudoAp5l61PFCQp8HZuyblGjR31tAU
	Lv2VcWuh20gCg9Wn1oEYpXQbmzWnrZ81Kg2r5qsjNtJUJvgKriXszPHWr/TFKxWJvNTL4HZO0q6sW
	4OJpWZbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr1YD-00000000dIj-1kfd;
	Mon, 03 Aug 2026 22:54:29 +0000
Received: from mail-northeuropeazon11010012.outbound.protection.outlook.com ([52.101.84.12] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr1YB-00000000dHx-0CvA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 22:54:28 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Btb6D/X/Avdz7JZEWLJEAcUYcC6lScgvEvCmP/S/bgI25T1aVEONXRDPOWXmF5ieFW7xLg2uIvBiID6qYvslHjNYlTqZOrPDs7hOyTrrqK/VQkGh0rv1lKPr8s4lT9t2Ry5FA1URNc67iJoRdfs1teR8uw+FF0jG5xm2leOw0pO8rT2T6SBGaRw9ZEjILS69ObVQS9Tk8+vhfwhLTenXqRPa+c0ut0skto/yb0mhbtl/SgR0cLzD8Ia3Yavgu6rvXnbnAqc3tsBsPlBScC8nnkPFYOToX7RGHSIkbfixoBw/GFHti1MMQjMjrofdG0t98VQHIXDSUrcSC0P5MkHeMg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m+/qsu2h8mFyIi/7JgCdoyWno15I3Zci2uueWZNxiW0=;
 b=WmGyRtw1bYrNPgybEa4g63PSbEs8OegWsdYaiA9a1g6Q+U5QhBcHvCZtlI4lOiaN+4CUgdR8RDoyZhQT5GIMIIhjx4uCp8yvRTzG5KboDp7ao2HMA8b9ZXBgi4hqNQ7xz/CJbruj+f7Pmz4Wa5y4pc3aoCM91FabE+MqXV6tIxgMth/XIJO81N1cK1DJKIuQ+IcyMqIL9MsRtq7n9wc4eqeY6r++f9M2CYteLdoh1rE/DT5kuYftO5n9PgH4NI1cNeadx4xo5GEW8P3abYhKBzWOw6O5/rUcACHZSGtwtXBmggrkJMeDeF9jigtvukvHYYdY3h6HZl7eA2rSvh525w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m+/qsu2h8mFyIi/7JgCdoyWno15I3Zci2uueWZNxiW0=;
 b=J4pBPRWOonx2GDsaqL+l8pAOiB1+mGsIk41XcnwM3huH8T5QqtBA1tTL8li1ja5f2Cds4qwvmi3SfRL4HGnmtRfeeuLNr9Ry1neaq0Dry6msyvLc89Xbuvoqm/OHgksh/WFXmTxcfIBC3PkIn+Sefx3T/yy5doi36F53ZEKUCxo=
Received: from DUZPR01CA0029.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::18) by VI0PR08MB11429.eurprd08.prod.outlook.com
 (2603:10a6:800:2fc::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 22:54:18 +0000
Received: from DB1PEPF00050A01.eurprd03.prod.outlook.com
 (2603:10a6:10:46b:cafe::19) by DUZPR01CA0029.outlook.office365.com
 (2603:10a6:10:46b::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.18 via Frontend Transport; Mon, 3
 Aug 2026 22:54:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF00050A01.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.5
 via Frontend Transport; Mon, 3 Aug 2026 22:54:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y91wVFri749Ijxl0t7SxFk0JNWnAmrgCDx3+w+wA86OixfiuKFtvNvU87gkecCvFaGjQK8/jAjpAOk8DrWQv5lz/i/iOrzFst9v2qQ3x35nAq8PS9/riWs0+q18cEXNaaRdzHh0184jkgAbEzLAA+pMW0HYber+zovKlQA3YO4mmGIhxGZ7e7pNSMAg3mFlGTtAdI10Q3RupRnk7LRyPPPGD+MTwEDx62M8ab3XNT+fSed/Ymyj/iunnLnMIfjZNTiVZD0PuGdrAX1X/fvUb2u8U/p9hEuoqqnKG8Um7olTTkb2wc25eV7POQ0P944JsJpnKz4DiHAJeUN6QV6LHOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m+/qsu2h8mFyIi/7JgCdoyWno15I3Zci2uueWZNxiW0=;
 b=dVA/ilIqxr1nipuE22LBGm+1lo4Hc6Uc84tMmV/JLiouAcQdRXc98dxhiTv/lR+ryjdJ9c0Tweu9/K9yMIAFQtywYhf8qR+6xxhPWi++Eo2+SCPsBeH14S0lwWe/nbDqMBGW415NXzSN4LuKxi8BG238WzHI3PFxrCrsytT6zyYdPrta/MqOm9+7sMxt6gfmxgU2gMRUyAsoa5UpWqEhM9eE0XbMnN5KGMrLjalPoQPv86fe76J2oaFgkx/nQ9aIP43pWt2mSCIKKSE6Zib5mYODJUl3OhxERiXgYzyv1LTzrdIscx8U4j5tcgC04mQ+z9PCGmULYFUrLE0ZVj6FZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m+/qsu2h8mFyIi/7JgCdoyWno15I3Zci2uueWZNxiW0=;
 b=J4pBPRWOonx2GDsaqL+l8pAOiB1+mGsIk41XcnwM3huH8T5QqtBA1tTL8li1ja5f2Cds4qwvmi3SfRL4HGnmtRfeeuLNr9Ry1neaq0Dry6msyvLc89Xbuvoqm/OHgksh/WFXmTxcfIBC3PkIn+Sefx3T/yy5doi36F53ZEKUCxo=
Received: from DB9PR08MB8651.eurprd08.prod.outlook.com (2603:10a6:10:3d1::9)
 by AS4PR08MB7503.eurprd08.prod.outlook.com (2603:10a6:20b:4e7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 22:53:45 +0000
Received: from DB9PR08MB8651.eurprd08.prod.outlook.com
 ([fe80::8fb8:7cf9:49c4:6f90]) by DB9PR08MB8651.eurprd08.prod.outlook.com
 ([fe80::8fb8:7cf9:49c4:6f90%4]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 22:53:45 +0000
From: Fayssal Benmlih <Fayssal.Benmlih@arm.com>
To: Cristian Marussi <Cristian.Marussi@arm.com>
CC: "arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>, "d-gole@ti.com"
	<d-gole@ti.com>, "david@kernel.org" <david@kernel.org>, Elif Topuz
	<Elif.Topuz@arm.com>, "etienne.carriere@st.com" <etienne.carriere@st.com>,
	"f.fainelli@gmail.com" <f.fainelli@gmail.com>, "james.quinlan@broadcom.com"
	<james.quinlan@broadcom.com>, "jic23@kernel.org" <jic23@kernel.org>,
	"kas@kernel.org" <kas@kernel.org>, "kernel-team@meta.com"
	<kernel-team@meta.com>, "leitao@kernel.org" <leitao@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Lukasz Luba <Lukasz.Luba@arm.com>,
	"michal.simek@amd.com" <michal.simek@amd.com>, "peng.fan@oss.nxp.com"
	<peng.fan@oss.nxp.com>, Philip Radford <Philip.Radford@arm.com>,
	"puranjay@kernel.org" <puranjay@kernel.org>, Souvik Chakravarty
	<Souvik.Chakravarty@arm.com>, "sudeep.holla@kernel.org"
	<sudeep.holla@kernel.org>, "usama.arif@linux.dev" <usama.arif@linux.dev>,
	"vincent.guittot@linaro.org" <vincent.guittot@linaro.org>
Subject: Re: [PATCH v7 07/23] firmware: arm_scmi: Add support to parse SHMTIs
 areas
Thread-Topic: [PATCH v7 07/23] firmware: arm_scmi: Add support to parse SHMTIs
 areas
Thread-Index: AQHdI5rwZSdYeEeXhUi4P5B2SwBwxw==
Date: Mon, 3 Aug 2026 22:53:45 +0000
Message-ID: <A88E25CA-4474-4937-9CCE-DAA62D481E92@contoso.com>
In-Reply-To: <<20260802145618.1952804-8-cristian.marussi@arm.com>>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: DB9PR08MB8651:EE_|AS4PR08MB7503:EE_|DB1PEPF00050A01:EE_|VI0PR08MB11429:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e1c3179-9607-41dc-9c62-08def1b22673
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|38070700021|18002099003|22082099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info-Original: U6m7Ppo83bt2Xq1uX2qR1HfYcodDzn103bHRHfZJcIXcDQDeD+Ekh9KBbxaDiOQCzPNa8Bl0DzlbvJgqQRCD/7FEGWG8lZiQsj5s1XmTTLUgeaLa+4fVuVMz7lkdqyzp6VPvBTkT8wogZw9s9uvZO/jgRqVCmEWnC6OiemjNaTGZO4pwY+BIi9fvXGb0mXJg/ybYrPfre40OJJ7/2ys/9GwkXl+arcp4QiOOUPvJJmCevGjxvww42eEUEPiiKTf1w1strixaO8lBHRcZ1MlGb9l1uF5R21enqwM09whteYiWh9KVqKnE/Z6TW8Ks38lRcMNeGoNGuu7nAXfOxF7SrtMfpMBiD5gBZFEJZYY0Oiiq2v1UWjIGejeKc3obmOmwd+OSqC1495HHx8tZ8X6OTpqg7Q0RR6oqM9NHB59YTFiKsKWCSeBLTvAn55LVhW7LGe6VOoTnEWYUVeiuKaTGR76DTAo3FaO3fF7Z8d0TPdYQqUtFDEHAVLpTRK6FR7+Ha/KRQ+QehAeF1dRQpuvjpazGspvo1UQDXwoyM/mLRDex7B8vbb/+t3C2A4M2l2CFOO2wx/RjZIdOZYQAvrFcMidNHSpYz9gP2KBDYVqzlIDnFxqAmn2KWfEGQqHKj7tYzX03HDmI4lpHlYK0NiR3acF1ABlvJKHnWvOGHQugLkPQxPkAvpJuXGDWcqx3Yr2kyacjFqbsHdigroGx70EvJaxJbaTUkRpq+Yqqm1BS4Eg=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB8651.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(38070700021)(18002099003)(22082099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <1FE7B4B3F1CE804C892CC7102DB8338A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: UXQ4l9LfA19yeg4hq0qXUA0OfOz/Ik3ZRrldSeTmGWW90NKzCEHmIxrTSbobQJgqW78bQB2d5HNRyQ3hcgAkReWl17/eLOm/e5dOKznCaRbzYAe79oSCW/LWVahny4caSSX15VyaXQY3/Aqz0dDk+2GuYk/hSvbIlW/8ijKdt5GTYmj5wdkaFhSJzMrW87gvMdj539zZ40UUhsHQbNwE2PZKnm+whQmylkyB8jP7DmMc2x4GoamPwFp7cuj3VQ+vg8Xn1BID7N7916eB1F5pxKlvxjrwro7l4Bg7ACVXdpuc9KRNd12ZC41u/TN2ULDsKDnhL1YsnYELTHgP8Q9NGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7503
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF00050A01.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 44a5bce1-eb42-4461-2784-08def1b212fd
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|14060799003|23010399003|36860700016|35042699022|1800799024|82310400026|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: U3642ZDoudQPVARBjmPKgWCVmNCOUPY/s0XK3g9y6AmIA47ixKjWlbwlBcBwlLfeUddwn0MEvw+6xQUTMr8C4QGsp3timGSZxWIw6sGt1RzzvkKhJO0naaqufPinipyw18ygEb6FJB7u8qXfuwB2gVzZ8DUCXTLiu/4bkoHqL1LXdouzSH1Ta1ZDMj+G0TsH8xU7R8RG+Q0YYaVYRwLhQ/AHF59Qf3lIX6wYDeMnxLp+WYFHW7NXn8lkJeIFp0gOGc0ljQMjdJlz68Ph5TSVjdvu/YhQXaXkUgZeQuZtXP/e5IOHs1aPnfkwy9gtpsDfEG4NLMoc2CiYGiWbUbKbErMnQ4LcXLXJr9/V/804lx2v49j6P45tPlR/Kkkg6ZrT/WQFvEPRDvdLCEVrdleorESVFs5CZ3e+5SZhmJG3w3gtWTFha2Gw8TnRraJcZgu5nz61XdfAq5Xe3N6EJS5fnyvmv7hpZS0r4gDfVsPrSNGoXgHIuHDEXgAsEEy0viW1F7Xwn0wjyzYrLN2TLdyZYsdPV7Z0DhfBWyUKpWVqPTSRzZmIiWIzjN9t4GnX/Bcb8mya+z+H0AWcOPlMc6xwOBroRut89pv8VWgUFe+codY/R2iItHoENv3G4vXs5TNfDlOPHEOifuK//TZJFF10/u8J5AnmdDac9/Pg+cPk9+2ynKYx3ud2XjTUU5r1zNy64lUezr+booVxUJxaSg2u4Q==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(14060799003)(23010399003)(36860700016)(35042699022)(1800799024)(82310400026)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Qq3EDxHzi9Wz0lLzv+tesmpLIa6a2lsfB2J+AFQ0I585GqTazAW4jjPctYbIC3cDSkWTd9Ohk+D7bG3ORDy/jG1EDyyDveZJtr5qXX4la90GLwHCmgwRWCzzB9EVMzAiX+hyIN3gEWy2WSu4w0g4jNnTcuvW1AqEgwSpLDO4l2/sX8K6yqElAgdfIP7eFcjoVcncRBeBd97nb2bxqFMX95YS/VzKzuJe6wI5liGv4GhRYy239nYxBFQudzpwsdIguqfw5mnsru4o7FqIGGD05YEKkVyOA5CpY6WKfYogp4WFw/AzXhhQQ3bs+nxHaP3PtXziK8wybgdJT2+AXsUJw2HfbCfEzTGuhdCXmfi6aBqg2EPCpvkZmdGeray1J0S1ouQNnDLEPk4WWkH4rsRYGmUBm/OPEON2KIS0o9hvJPhQYXrkp5HsHQvGFV5erJYn
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 22:54:18.3775
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e1c3179-9607-41dc-9c62-08def1b22673
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF00050A01.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11429
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_155427_226886_8FE74A59 
X-CRM114-Status: GOOD (  13.46  )
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

SGkgQ3Jpc3RpYW4sDQoNCkkgZm91bmQgdHdvIFVVSUQgZGF0YWJhc2UgaXNzdWVzIHRoYXQgYXBw
ZWFyIHRvIGJlIGJsb2NrZXJzLg0KDQo+IAlpZiAodGktPmluZm8ubnVtX3V1aWRzICsgU0NNSV9V
VUlEX0RCX1RIUkVTSCA+PSB0aS0+dXVpZHNfbGVuKSB7DQo+IAkJdXVpZF90ICoqdXVpZHMsICoq
b2xkX3V1aWRzOw0KPg0KPiAJCXV1aWRzID0ga2NhbGxvYyh0aS0+dXVpZHNfbGVuICogMiwgc2l6
ZW9mKCp1dWlkcyksDQo+IAkJCQlHRlBfS0VSTkVMKTsNCj4gCQlpZiAoIXV1aWRzKQ0KPiAJCQly
ZXR1cm4gLUVOT01FTTsNCj4NCj4gCQkvKiBDb3B5L21vdmUgb2xkIGFsbG9jYXRlZCBVVUlEcyAq
Lw0KPiAJCWZvciAoaW50IGkgPSAwOyBpIDwgdGktPmluZm8ubnVtX3V1aWRzOyBpKyspDQo+IAkJ
CXV1aWRfY29weSh1dWlkc1tpXSwgdGktPmluZm8udXVpZHNbaV0pOw0KDQp1dWlkcyBpcyBhIG5l
d2x5IGFsbG9jYXRlZCBhbmQgemVyb2VkIGFycmF5IG9mIHV1aWRfdCBwb2ludGVycywgc28NCnV1
aWRzW2ldIGlzIE5VTEwgaGVyZS4gdXVpZF9jb3B5KCkgdGhlcmVmb3JlIGNvcGllcyBpbnRvIGEg
TlVMTA0KZGVzdGluYXRpb24gd2hlbiB0aGUgZGF0YWJhc2UgZ3Jvd3Mgd2l0aCBleGlzdGluZyBl
bnRyaWVzLg0KDQpUaGUgZGF0YWJhc2Ugc3RvcmVzIHBvaW50ZXJzIHRvIFVVSURzIG93bmVkIGJ5
IHRlbGVtZXRyeV91dWlkIG9iamVjdHMsIHNvDQpzaG91bGQgdGhpcyBpbnN0ZWFkIGNvcHkgdGhl
IHBvaW50ZXJzIHRoZW1zZWx2ZXMsIGZvciBleGFtcGxlOg0KDQoJdXVpZHNbaV0gPSB0aS0+aW5m
by51dWlkc1tpXTsNCg0Kb3IgdXNlIGFuIGFwcHJvcHJpYXRlbHkgc2l6ZWQgbWVtY3B5KCkgb2Yg
dGhlIHBvaW50ZXIgYXJyYXk/DQoNCj4gCXRpLT51dWlkc19sZW4gPSB0aS0+bnVtX3NobXRpICog
MjsNCj4gCXRpLT5pbmZvLnV1aWRzID0ga2NhbGxvYyh0aS0+dXVpZHNfbGVuLA0KPiAJCQkJIHNp
emVvZigqdGktPmluZm8udXVpZHMpLA0KPiAJCQkJIEdGUF9LRVJORUwpOw0KDQpBIHZhbGlkIGlt
cGxlbWVudGF0aW9uIGNhbiBoYXZlIHplcm8gU0hNVElzIHdoaWxlIGV4cG9zaW5nIGZhc3QtY2hh
bm5lbCBvcg0Kbm90aWZpY2F0aW9uLW9ubHkgREVzLiBJbiB0aGF0IGNhc2UgdXVpZHNfbGVuIGlz
IHplcm8uDQoNClByaW1hcnkgVVVJRCBjcmVhdGlvbiB0aGVuIGVudGVycyB0aGUgcmVzaXplIHBh
dGgsIGRvdWJsZXMgemVybyB0byB6ZXJvLA0KYW5kIGV2ZW50dWFsbHkgd3JpdGVzIHRoZSBwcmlt
YXJ5IFVVSUQgcG9pbnRlciB0aHJvdWdoIGEgemVyby1zaXplDQphbGxvY2F0aW9uLg0KDQpQbGVh
c2UgZ2l2ZSB0aGUgVVVJRCBkYXRhYmFzZSBhIG5vbnplcm8gbWluaW11bSBpbml0aWFsIGNhcGFj
aXR5IGFuZCB1c2UNCmNoZWNrZWQgZ3Jvd3RoIHNvIHRoYXQgemVybyBjYW5ub3QgcmVtYWluIHpl
cm8uDQoNCj4gc3RhdGljIHZvaWQgc2NtaV90ZWxlbWV0cnlfbGluZV9wdXQoc3RydWN0IHRlbGVt
ZXRyeV9saW5lICpsaW5lLA0KPiAJCQkJICAgIHZvaWQgKmJsb2IpDQo+IHsNCj4gCWlmIChyZWZj
b3VudF9kZWNfYW5kX3Rlc3QoJmxpbmUtPnVzZXJzKSkgew0KPiAJCXhhX2VyYXNlKGxpbmUtPnhh
X2xpbmVzLA0KPiAJCQkgKHVuc2lnbmVkIGxvbmcpbGluZS0+cGF5bGQpOw0KPiAJCWtmcmVlKGJs
b2IpOw0KPiAJfQ0KPiB9DQoNCkxvb2t1cHMgYW5kIHJlZmNvdW50IGluY3JlbWVudHMgYXJlIHNl
cmlhbGl6ZWQgdXNpbmcgbGluZXNfbXR4LCBidXQgdGhpcw0KZmluYWwgZGVjcmVtZW50LCBYQXJy
YXkgZXJhc2UgYW5kIGZyZWUgYXJlIG5vdCBwZXJmb3JtZWQgdW5kZXIgdGhlIHNhbWUNCmxvY2su
DQoNCkEgY29uY3VycmVudCBnZXQtb3ItY3JlYXRlIG9wZXJhdGlvbiBjYW4gbG9hZCB0aGUgZW50
cnkgd2hpbGUgYW5vdGhlcg0KdGhyZWFkIGRlY3JlbWVudHMgdGhlIHJlZmNvdW50IHRvIHplcm8g
YW5kIGZyZWVzIGl0LiBQbGVhc2Ugc2VyaWFsaXplIHRoZQ0KZmluYWwgcHV0IHdpdGggbG9va3Vw
L2NyZWF0aW9uLCBvciB1c2UgYSBsaWZldGltZSBzY2hlbWUgc3VjaCBhcw0KcmVmY291bnRfaW5j
X25vdF96ZXJvKCkgd2l0aCBhcHByb3ByaWF0ZSBYQXJyYXkvUkNVIHByb3RlY3Rpb24uDQoNClRo
YW5rcywNCkZhecOnYWwNCg0KDQo=

