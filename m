Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB2F9FD8FCE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 16:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uLr4zTLDGkwrjruv8e/X4eqI9ZrGIV9xPpF4lpoRVjI=; b=Zg0doLeDJfilkXjbaPwt8dQ/zC
	Y9LPrDEnJkJwfxrX0FxPR33SgSVGYOBOEJNmo0HraIHJZCQ2DscvNoDfnkno/N3dxnznIfrwCknRD
	AJX+xDMabP4leWrjdfflL2TuDHqP95DBqd5aiZ6uTJ0KF2YEYf57ebFychxk2HqcbqjyKosZ+PTCG
	ZvUfV3NCb4YoqUeU7B1ZnedYrUvk46OAqLpUHSEaKSSA88Q0VZBgGEyqNGJfBT5xoMWdfPOwl/5UU
	z9eACFfyG2vOs46cgipUcN9A1CwnNDOcbJknpA0KkSAGVILJJEjPnOYZEvxmKse9om3v7V9AjlfQG
	PXvzfTTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvdqn-00000006eor-2JaR;
	Thu, 26 Feb 2026 16:04:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvdqm-00000006en7-0UZL
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 26 Feb 2026 16:04:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=uLr4zTLDGkwrjruv8e/X4eqI9ZrGIV9xPpF4lpoRVjI=; b=HWqzHyZQuqD3b6axY1BMGJzyIQ
	HBSG/HO++xiAgyDLpCOxV2ddpZyRh0+ES4oDRs6cMcYAwXCtXPRzWEwFUoHjT8myVwm9TAtp4etP4
	1ix9G8Aezh48iB7mgyenV1ZPHApbfgdJ2uSKemNeZz2t6TZjOnstLhat4rnNx4mEEegEBTOM4KVip
	Vc7VE7UQ0qvMpRfMWZqZbfdGSMBCacWxba7kVtF7+ndb++ci3nMdQ/eobY9oZD1WMDWebqdBk5LAX
	G7Px3PdqKiGixL3625t8WG4WeHCAYNHXxWfUbIaTGHS5hiod0qiMIBzCmHqdXfSv6Bz6DwGDt8CAP
	baXaI0bA==;
Received: from mail-westeuropeazon11013071.outbound.protection.outlook.com ([52.101.72.71] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvdqi-0000000BQ9O-2FZd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 16:04:26 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=tIm9TuoOsreWpsZx6Ebzn4hXRZaBa8M3QY79CW7FScua2aHxrnJOuoAsWYEriUgz9AwE2AJRFl1RfAMxbkUbSaC3pldsfkGllLyOgnLzUQza9ZG7bHaK+vLcMXi5btZF42lZnDTLxfaGAKbyEmW+ZrL9SGbiIe94i8Yxl8USnLsahI5NqVbzLwJ90MRKOsjZzovGT/9hr9wC2aWesbvJ0jZy1ALV6HsY1zyvczGQVWMMEr6ZsTHNWv8XpDjMLeuaZesslcLuIi6d4i+B3M1BIJGO1I6AtbviQGxDTYryNmQ0a/9rqYn9xNabfbwAyu/Lx/a/cyYZ/cW05/Cd0+zIhA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uLr4zTLDGkwrjruv8e/X4eqI9ZrGIV9xPpF4lpoRVjI=;
 b=nShPL/6wgt+s9Hkg2i5rg4XykyWtFFTlMr4NpV/GDl6XCYv9vhg6dkdXQwxBh3gHte0EvD3u6IfQk8aRqfeKTAVBwTPFunFWjnvwJJ8NbnfScy6DFVzPWCp9yk0zC5aRO95Wg6APuyVimuycoj2tE7DYVfcdMym6KDAtKVzcjnQBQjQ3JmtpnkDykJmtU1d/q0ML8mDb7Ok1LlX1HtooBB6aDWelhDbaFj+cDlHBebD0Gth4Vczsv7chZRz4mg26jprqrOwLKP3/tgrKclRVZFNfsF5i+oZuJFZmP02QW4SSTuEcfbSdxJ5ShuXT+vODUZ4B6iiex8U1/MOXHaE9ag==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uLr4zTLDGkwrjruv8e/X4eqI9ZrGIV9xPpF4lpoRVjI=;
 b=nZ6KR69AFlur1Js8Te9LN2oXia8cpHzAQPj/fjhbLnDaAb0lFOaexn57vbPgYDngNc1ihNC3ohbGh93m2SdEIpmQxiOXWTbgihR7eWLiFUpkXjGbggtP3m/dsLMEZC4EOgGWHj2lK93vs7g2lHvp8M/OW8URgYRVRbgNcpG8ZTo=
Received: from CWLP123CA0172.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:19b::7)
 by PAXPR08MB6334.eurprd08.prod.outlook.com (2603:10a6:102:dc::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.17; Thu, 26 Feb
 2026 16:04:17 +0000
Received: from AM4PEPF00027A6C.eurprd04.prod.outlook.com
 (2603:10a6:400:19b:cafe::be) by CWLP123CA0172.outlook.office365.com
 (2603:10a6:400:19b::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.26 via Frontend Transport; Thu,
 26 Feb 2026 16:04:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A6C.mail.protection.outlook.com (10.167.16.90) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Thu, 26 Feb 2026 16:04:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hi6ZphX3JSZlp7BOyxYyggPjTUpUFj/M9SaeOk43wakEUobeW9Q8RaPoTgF/+JsbNMkyjBRIczg4IC5N/TXbx5zvYqdQkj0o5NIPfFqrodPQdZfrEEbRWan7m07j8SBw6CmN/ogwWimCheYtS+7AWo0gieAriHwUXdmHhENhF+ljFv8gb68d7QklII5C8BeJUGEGZO1ypkxz10pnWkdggwzGTv/BaWotVemgScvorS4ZT9la+rk3e1JQQvc/4ohpaJn3rCj2zJk6SYXKk3ZPm8o61h3FTgcO4/uhwxr4Pf7WxeiAmOpEHs53aFqWDW9ZSgxqhsr54rR26LzU5VtiwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uLr4zTLDGkwrjruv8e/X4eqI9ZrGIV9xPpF4lpoRVjI=;
 b=u+SEaurT44TDkASc2xuqNdN3CWzv89CZDfiGIlW8Emy88FzKfczkpnZW1ljfhcZwnOxA0cpbElXOcuo+VDYQjbEIyxSGVLIlse4+/b/fF1SDmGMCUwUiamsW+nHbuzgkc/uD3+SyI5J+5LDFqtfYwvVgoGTXWavpKPgp+n6qawVsYG/4NZErqhlCzKTt1VC8/jb7Nb/pHrlmdnNMTBDf0r5Y08F+rxffB8v0PV5M9m2E6lU1JhZewjLmV0QRCPDkaEHi2yRpEG+06DmD30NOgCnDlOSWNER/ePrXHAzFoxNHKGjTEyI7oItj84X2pjTeR27okVH1XTEe+19bglLhNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uLr4zTLDGkwrjruv8e/X4eqI9ZrGIV9xPpF4lpoRVjI=;
 b=nZ6KR69AFlur1Js8Te9LN2oXia8cpHzAQPj/fjhbLnDaAb0lFOaexn57vbPgYDngNc1ihNC3ohbGh93m2SdEIpmQxiOXWTbgihR7eWLiFUpkXjGbggtP3m/dsLMEZC4EOgGWHj2lK93vs7g2lHvp8M/OW8URgYRVRbgNcpG8ZTo=
Received: from DBAPR08MB5687.eurprd08.prod.outlook.com (2603:10a6:10:1b1::17)
 by PA4PR08MB5950.eurprd08.prod.outlook.com (2603:10a6:102:e0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 16:03:14 +0000
Received: from DBAPR08MB5687.eurprd08.prod.outlook.com
 ([fe80::7d4a:f17a:4cb0:9793]) by DBAPR08MB5687.eurprd08.prod.outlook.com
 ([fe80::7d4a:f17a:4cb0:9793%4]) with mapi id 15.20.9654.013; Thu, 26 Feb 2026
 16:03:14 +0000
From: Sascha Bischoff <Sascha.Bischoff@arm.com>
To: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>
CC: nd <nd@arm.com>, "maz@kernel.org" <maz@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, Joey Gouly
	<Joey.Gouly@arm.com>, Suzuki Poulose <Suzuki.Poulose@arm.com>,
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	Timothy Hayes <Timothy.Hayes@arm.com>, "jonathan.cameron@huawei.com"
	<jonathan.cameron@huawei.com>
Subject: [PATCH v5 30/36] KVM: arm64: gic-v5: Introduce kvm_arm_vgic_v5_ops
 and register them
Thread-Topic: [PATCH v5 30/36] KVM: arm64: gic-v5: Introduce
 kvm_arm_vgic_v5_ops and register them
Thread-Index: AQHcpzlpxCxVIZJnXUuja9LUjiSvXg==
Date: Thu, 26 Feb 2026 16:03:14 +0000
Message-ID: <20260226155515.1164292-31-sascha.bischoff@arm.com>
References: <20260226155515.1164292-1-sascha.bischoff@arm.com>
In-Reply-To: <20260226155515.1164292-1-sascha.bischoff@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.34.1
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: DBAPR08MB5687:EE_|PA4PR08MB5950:EE_|AM4PEPF00027A6C:EE_|PAXPR08MB6334:EE_
X-MS-Office365-Filtering-Correlation-Id: 0faa86ed-0958-41ec-59ad-08de7550b187
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original: /oBKB+ONq+2BEiYqf3xuRNFRnlAnmoPqrqkL+8uDhm+VKIG/wZvNraSWL0MGMCf9evaTsJhNmL6Ezh61McQfX5mtTb7Kc2bWyB5bXG9uvlPcTASMAQXmsBBZDRgPq46O073ckgFAPLiVHmOLDsewBjN9UERUEbOhm0zkxDWI5cLw941U1hedFszCYK8hSLqSSCWvisUwhZZ5kbwe3T3aiPy+9mXVHXKD8G76+hpHVAwRewDj39vWV0P5ajwcAlO4LegEqr9cBNytyRKkVC4xSMBfxRq6FZN7+GyoD4H3E/sszM2YbQAIp6jYaYEpsERDmRN+y431ebsIPqHIxQC766yPviis5zMMm2Ppf/gfwesXUQPoIGwcFuyOhkE30rAkvNbFHdNOysoFaH2WcprrvCp6Z7A2kH8BV4Y42cg82soB9g6roYtW/x0aSzACCPVheZiHGamlnlSJf+peZ8wLiaajhAvQM1hj0j3vR8n6amh6raiA8U9Ptbj9BmMleEjLK1KXwDnAWT7nFhIGMstfcQEM7w333DIyUhzxgZ15OpHIwKAtFTLZ6Qjac1R3nqKpOodlY1f4WTQKkCR2tczaD0Glz8aUaeoCs24zS24REnEBIuquZ1G1YxJgSNSgkRxOBZrRl9IdrZsBuF2XLz6h5rNzH4l7MJLobovXBTFoMunC5Rd+mWgST/eFbr7/ZHCj1cR2gGm9F7Amdkm9tyI3QniUUyxmyDSv+Oy11utxqtbOVrcWtsoMRjxEZdkbOSPhTJ5JyizGG8B3rxpySgasBM0wM2O/uooPA2ugq018H2k=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5687.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5950
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00027A6C.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: de5c0940-5a64-47d6-ed72-08de75508c0c
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700013|35042699022|376014|14060799003;
X-Microsoft-Antispam-Message-Info: GDHLH0p+x4QAyn7wHdplUIC7mEuC8CXGPaLMV537fXbnef6KwLioKAofWjd6STBnqA5KLXsXEvGp/Xyu9GlS5C+XGvfkxUoXr5z7BBa26VYVn64jDnWf/meWB5I+KZ7KZlCER1QDp6savReoBNQCaTbksBs+o5zH/WzPOZzRFlW7A2553nXwIPSaNqyGs0B2ikVnfVSuBlxwf55L2WMFa39WIgMLqXC5jZ1ebaEtaQJUB2qdlfHObCUMK/JlmFcfFtG/7yRbxUjhEcYSi2vKTFXlmf0zYKni2Aonre9gESKeZf4N2Jp7gz4yHDJrx42gjxVl6UEEzJQtiJ6p6BgspD3WyNHYpMAYzA+HtPYHslsciQSQ6JvDG51/apSuo2zUBV2tC1tdit71w5t5o8Q+CCUozpfxOM5/XmMpJe6sxwAsUDbyQMAvpX2XBiK26RkQ0gahKFPSR1u0iGuoYOG6izTE5ZD235wtQ2eRdnw8JYFadE7ZHsLdcbtHHucy1Zw1L509ikkH6SzbVN0XuS27F+n3s2nRsutICjah7MZmm+GmbeVaGHeI/QRsSLS4dclH9I1dmabpu4dNrffXkQ3QRvWO1ZW5Puz9uGs/f/n3bHNybwND6sLj+Sd1kpns9c089Wk94jkevHyqIHAfy7qbclsrUw1mwLTuBLbyoxyvPo+00v6BwtuH/wjaZMuNQMZkv3gmrvpk9CRA8evP76Vy6mqNnThAb7TBuex48mqbm4rk1d/aQ3swDuuFMzziZMFWx3K0azl4WM6aR94FfztUQsve2h7LYixSsiW6E0AoqtVEm5ORUeac9woOeV+6D317J6/T1gd4JqFjTrJrrZA8vw==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(35042699022)(376014)(14060799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 1O2IQeUW6lgVUao5PxUXFenqxo6jS4PtHj7p7brugTFHP5MvRUF/yaIbyFYTco3ndThgAybPzzxjxKhJ/IO6XNZWKzzGZ55gnpUcFPuNmhILk9c4V/38kVNh5Y8G+URYavbyk9rTc7czo+jmdWJu2H5nwIg9e8prER+6jwiOjJzH/iSOibMsKxqa8ExOur+q5v3YHQ7TpMrZr92Lsi4z4nHh74b3gmRaAfQsVDwhr08ThXcxQ/qxVikFcmHB3gWx/8fcinDexxQnf6syLlQ15Z9nm1wGW3Z+4IKcqbPnms09U6Iwxs6SKieVfdY0TmB/F/h0K/wmzCjmyN4kbjugujznRwNmyLtpLtGl+P4XRK7yp/QWxHRB5sHziwZM6JrjF3gGe79Tc36NkVD2rqBSpkSXDp/lfxFC1XgrdRWN8D7oYvLtgj5hZWyyz/4RjHsI
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 16:04:16.8516
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0faa86ed-0958-41ec-59ad-08de7550b187
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A6C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6334
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_160424_650892_29776297 
X-CRM114-Status: UNSURE (   9.83  )
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

Only the KVM_DEV_ARM_VGIC_GRP_CTRL->KVM_DEV_ARM_VGIC_CTRL_INIT op is
currently supported. All other ops are stubbed out.

Co-authored-by: Timothy Hayes <timothy.hayes@arm.com>
Signed-off-by: Timothy Hayes <timothy.hayes@arm.com>
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
---
 arch/arm64/kvm/vgic/vgic-kvm-device.c | 74 +++++++++++++++++++++++++++
 include/linux/kvm_host.h              |  1 +
 2 files changed, 75 insertions(+)

diff --git a/arch/arm64/kvm/vgic/vgic-kvm-device.c b/arch/arm64/kvm/vgic/vg=
ic-kvm-device.c
index b12ba99a423e5..772da54c1518b 100644
--- a/arch/arm64/kvm/vgic/vgic-kvm-device.c
+++ b/arch/arm64/kvm/vgic/vgic-kvm-device.c
@@ -336,6 +336,10 @@ int kvm_register_vgic_device(unsigned long type)
 			break;
 		ret =3D kvm_vgic_register_its_device();
 		break;
+	case KVM_DEV_TYPE_ARM_VGIC_V5:
+		ret =3D kvm_register_device_ops(&kvm_arm_vgic_v5_ops,
+					      KVM_DEV_TYPE_ARM_VGIC_V5);
+		break;
 	}
=20
 	return ret;
@@ -715,3 +719,73 @@ struct kvm_device_ops kvm_arm_vgic_v3_ops =3D {
 	.get_attr =3D vgic_v3_get_attr,
 	.has_attr =3D vgic_v3_has_attr,
 };
+
+static int vgic_v5_set_attr(struct kvm_device *dev,
+			    struct kvm_device_attr *attr)
+{
+	switch (attr->group) {
+	case KVM_DEV_ARM_VGIC_GRP_ADDR:
+	case KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS:
+	case KVM_DEV_ARM_VGIC_GRP_NR_IRQS:
+		return -ENXIO;
+	case KVM_DEV_ARM_VGIC_GRP_CTRL:
+		switch (attr->attr) {
+		case KVM_DEV_ARM_VGIC_CTRL_INIT:
+			return vgic_set_common_attr(dev, attr);
+		default:
+			return -ENXIO;
+		}
+	default:
+		return -ENXIO;
+	}
+
+}
+
+static int vgic_v5_get_attr(struct kvm_device *dev,
+			    struct kvm_device_attr *attr)
+{
+	switch (attr->group) {
+	case KVM_DEV_ARM_VGIC_GRP_ADDR:
+	case KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS:
+	case KVM_DEV_ARM_VGIC_GRP_NR_IRQS:
+		return -ENXIO;
+	case KVM_DEV_ARM_VGIC_GRP_CTRL:
+		switch (attr->attr) {
+		case KVM_DEV_ARM_VGIC_CTRL_INIT:
+			return vgic_get_common_attr(dev, attr);
+		default:
+			return -ENXIO;
+		}
+	default:
+		return -ENXIO;
+	}
+}
+
+static int vgic_v5_has_attr(struct kvm_device *dev,
+			    struct kvm_device_attr *attr)
+{
+	switch (attr->group) {
+	case KVM_DEV_ARM_VGIC_GRP_ADDR:
+	case KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS:
+	case KVM_DEV_ARM_VGIC_GRP_NR_IRQS:
+		return -ENXIO;
+	case KVM_DEV_ARM_VGIC_GRP_CTRL:
+		switch (attr->attr) {
+		case KVM_DEV_ARM_VGIC_CTRL_INIT:
+			return 0;
+		default:
+			return -ENXIO;
+		}
+	default:
+		return -ENXIO;
+	}
+}
+
+struct kvm_device_ops kvm_arm_vgic_v5_ops =3D {
+	.name =3D "kvm-arm-vgic-v5",
+	.create =3D vgic_create,
+	.destroy =3D vgic_destroy,
+	.set_attr =3D vgic_v5_set_attr,
+	.get_attr =3D vgic_v5_get_attr,
+	.has_attr =3D vgic_v5_has_attr,
+};
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index dde605cb894e5..cd81a5af3c3b2 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2384,6 +2384,7 @@ void kvm_unregister_device_ops(u32 type);
 extern struct kvm_device_ops kvm_mpic_ops;
 extern struct kvm_device_ops kvm_arm_vgic_v2_ops;
 extern struct kvm_device_ops kvm_arm_vgic_v3_ops;
+extern struct kvm_device_ops kvm_arm_vgic_v5_ops;
=20
 #ifdef CONFIG_HAVE_KVM_CPU_RELAX_INTERCEPT
=20
--=20
2.34.1

