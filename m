Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E160CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 09:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8EMp9ioHsauhff6rt3MKJM8xAZeP5pGGXQEnrcrV4V0=; b=rVXkymo3vgBUfkDO8Ap93uCA08
	1cOWyTo1qtn7Di5DDdxDIHt6d8kocBWWtx3Cytj3qxOpYAfo2syFLGMvOYmt1Ms+25nTu6SKeq8sf
	SQIDDhUGGMNUIezxUaIZFCvzVzFcaY8mK+EHJHhew2jflXF5E+OAuPp9HHPrFcv+WerGygB5JBaIr
	+onQK0EABS0APOecVzFkVyuSfmJMSLAK71oPSGcF9QH2kAnfZwWE1BIwtSiggG3k+3MoUnY+vPQoV
	C0OyUMQqMzy2DI2yo6DNdQmwceFQ70hgQpxo3JLbxp2hNbVgsLsfRwoQBAMZqlCnx9jzpTcGV7+JC
	ueEYV0uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCft-00000008IlS-1cPY;
	Thu, 01 Oct 2026 09:01:57 +0000
Received: from mail-norwayeastazon11013000.outbound.protection.outlook.com ([40.107.159.0] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCfq-00000008IkE-3LCy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 09:01:56 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Qm9tmWdK6TImqwIDlH1CxEdRt+/UeHXg7/khrtnoa+f1aoUwb5jycO8D2CIAR6p1UflpAvUWgm+cU177oncP0TSi/HrNx5EQK4DDhnfqLrBDBD/Jagr49iInH27HtwFCDMIub9Kaeh3PW9GLxJi9N9jJ/TP1yglb+QAj++x1y2OLo3x9yR2Ps0qNsoy1SMCMpKHIC51x0F9sjboTMUMV/7bTE+n3G4SPtbF2ZGA6pQonR+NFwO9yJ75ulkYheoA3XSUNXggwgTMHtm3nTdtSliYd3Tsrd30DnbF+4AOETO3BreKoT/QelJAOZpG5HR27j85sbbskZUIEuRVvAxUgeA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8EMp9ioHsauhff6rt3MKJM8xAZeP5pGGXQEnrcrV4V0=;
 b=Y4S57JJ4XFRrBW+sWya2axn6FyDmHo99eS53l/PzJmbglSmKLGMVB5UKpec8xqWSAwb5BQsK8QUmQWZs3Z5QPXOmfwIzpIT7tBX1fL1noibxGTHdK7i1VG3pq56qe6TYztjrB8eGMcDAY4IzZimxPCvadFBFxfrfr+ljT5F1ulmQR9c7Td2/IW7KcuOu0YvjKdekynAmYfqAwdSbVgiSXx0p19nsyyjwZ3qJgl6MAhOnHtUckp099hBD/npJRlq1RQNACJw2jUJ+fGgAkuoadeC1Nn43rgrEFKr636UaMSfBueaTeDF+3HFj+3RXlYQHfq0LFwRV1DkL1X4vJlbn7g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8EMp9ioHsauhff6rt3MKJM8xAZeP5pGGXQEnrcrV4V0=;
 b=CuXwIjVowtzJt/N4h4jDeeQ8PJpGR0x1ULYGUq3ZnBaXpOCDzTunp1PkK4yTC1Gc4Blxi5+QUgTjlBZwp8u++E3mailxTUl1dIy88G5gXz1Vw19ocY8UbMlH78nrs98cQ1ZVMYkAKq3Wq8YolRQqefWCM9Gz8brCUPktQLRRtOk=
Received: from AM0P190CA0016.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::26)
 by GV2PR08MB132880.eurprd08.prod.outlook.com (2603:10a6:150:3b9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Thu, 1 Oct
 2026 09:01:48 +0000
Received: from AM2PEPF00070CF7.eurprd02.prod.outlook.com
 (2603:10a6:208:190:cafe::a9) by AM0P190CA0016.outlook.office365.com
 (2603:10a6:208:190::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Thu, 1
 Oct 2026 09:01:46 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF00070CF7.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Thu, 1 Oct 2026 09:01:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FuO4meA0nwIC2P2QP4E57xpg/UB5ZU3Ap7hOzhXHb4rs1kKslGda/Pnf9R2fYTBVdqt6l/fMOXa/EOOAfWxhFFQQKdyt1v9B6stjjJN31+nWWPMGhmNTqEjtAcwcczGtcqECsJMY2C11hV76efxPrbivUStFiERvWMLX8gOhjE4kktbN0LEJP3kg4paRDoGw3K0a3oaKn9aQClAnaCNn6w4Vr0NvBpZmHuZsMx6Cx4nzHXBkmq0GrLGbBZq3EYL6iNldQNuCqXZFAFY9IUAg3M3X7BXH8yWAnb711rDfoDGFyBRe6eInnl+X5zHUv2pyMbj7BAfzL2yrBHgldT3LxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8EMp9ioHsauhff6rt3MKJM8xAZeP5pGGXQEnrcrV4V0=;
 b=BBOIfl7bkMVt6SGJVgOuzmiyjgOLAwVCuI00yAA22fFNBALywdjyOQbpU/v+nzoH3PqCDqRNhNqDsoPnBoInDPym/V44m/t9BHWgCtk89eL4TQl84dtG1O55EvQjANosj93pe8xIdGO8UY66gPLRDOqgSiw8hahliAZnWg6XtunrjdHUcvYLpPecBs0+CdIq/Xo5s4o65B4pBiuS8Q6ZCKHlWIFNNFqdxCelMIot8jwMjRVO/sbWezT57/qbFsoSDxJQx1L5weT78ihOP85w2AUYPUfaz9Q72HTWnN2cy0VySnMDPi5ngXXOeaXwJCKF12VR2JTVd6SA8bWhYkjZyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8EMp9ioHsauhff6rt3MKJM8xAZeP5pGGXQEnrcrV4V0=;
 b=CuXwIjVowtzJt/N4h4jDeeQ8PJpGR0x1ULYGUq3ZnBaXpOCDzTunp1PkK4yTC1Gc4Blxi5+QUgTjlBZwp8u++E3mailxTUl1dIy88G5gXz1Vw19ocY8UbMlH78nrs98cQ1ZVMYkAKq3Wq8YolRQqefWCM9Gz8brCUPktQLRRtOk=
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI1PR08MB3421.eurprd08.prod.outlook.com (2603:10a6:803:80::16)
 by VI1PR08MB10050.eurprd08.prod.outlook.com (2603:10a6:800:1c4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Thu, 1 Oct
 2026 09:01:05 +0000
Received: from VI1PR08MB3421.eurprd08.prod.outlook.com
 ([fe80::e079:6bd:fbe0:89b4]) by VI1PR08MB3421.eurprd08.prod.outlook.com
 ([fe80::e079:6bd:fbe0:89b4%3]) with mapi id 15.21.0472.012; Thu, 1 Oct 2026
 09:00:39 +0000
Message-ID: <15549877-85ad-49ad-b2f2-843dd506ba0a@arm.com>
Date: Thu, 1 Oct 2026 10:00:37 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/21] arm64: Move overflow sp into SP_EL1 and kernel
 sp into SP_EL0
To: Will Deacon <will@kernel.org>, Linus Walleij <linusw@kernel.org>
References: <20260918161407.2300-1-will@kernel.org>
 <CAD++jL=O30YiraMzpe=wd-s-ZHoiMWkXcr3B_qb_dp3TUk2A7g@mail.gmail.com>
 <ar4KD6FTZzw2Wq6w@willie-the-truck>
From: Muhammad Usama Anjum <usama.anjum@arm.com>
Content-Language: en-US
In-Reply-To: <ar4KD6FTZzw2Wq6w@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR1P264CA0166.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:347::12) To VI1PR08MB3421.eurprd08.prod.outlook.com
 (2603:10a6:803:80::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI1PR08MB3421:EE_|VI1PR08MB10050:EE_|AM2PEPF00070CF7:EE_|GV2PR08MB132880:EE_
X-MS-Office365-Filtering-Correlation-Id: 45b9a402-c4b5-4940-00c8-08df1f9a9eb2
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|23010399003|1800799024|366016|7416014|376014|10067099003|4143699003|56012099006|6133799003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: OfgRN6DmSaEeDi0voHBMZRyp1ADvNEfJpwr5RDaDCUSaPzU9cr1AR3nL2SBVlMBogUP0R2J1J5Wqt9Lq6KnMgfzBdbmf8Fs+8WqSSCNLrcLBe+If9nDZervHI/nRGq6vKcafSrB1wvk/cL/JD38E+m/28U8b40wLWLXW1CHT3kMAoE7oJDqlIy9p9D+IVtbhrf4nAdav6eZweU8NdV95fr9qUQUxWWVduD5pG/LrF2qxaBWtqbEr9da7g5BfW4ztWSnRXTrrP0Fc+ytzeYDS3vdkZ5oPG+t8hTPHTV2friRVWz4eoVsfj9yEKDlqIS4jIA+quFXyeBq6xuUbOw+dSLygXvF4FUjitbIwT1MuO9TiwQ1s6+wJbCbdq+VY3JaJa5FtOnSSs66c9+SPxWmU5ufEu6aJy4iAuXL/D3pqEowo2piUf5sHaUXb5MKRiov7YzUq8iF7o+2YmlOMG7lnQZjzMhDuo0pO7lth4XozcjNUPbeeLNCixQmgolO+Sy34onwVpxOnpxBqyeDzdCRqHpqmeWpWJPbov9CdzaLa3k5//Z3xYUiawO3ItwRt0h84YalvKm/Be4B9K6bokAchbqR19Ios3FxCxauZJNAyK/phsUet4Lzpj/mLbhzaEV1xMKHzEa5aMgRjyOkYrOeUnMUiohdxAjrwndTFDSR48Mg=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3421.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(7416014)(376014)(10067099003)(4143699003)(56012099006)(6133799003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked: sMH8HdWcVWeCa/WxpdoVgCN1VEXyuiEz0Bj4tnvYzxw6F5VKyHtnitHi6fRP5ihPl7nqoRzKuJTe6B9kEKXTDF8zZ6+8qB/0SERPgVVFqjPUsqlfDG8AXZcCPhYa6jMwmye0FpEVlHqENu/4LlalGYlowhPd1ModnUKtRyZnREJ87dSlD2sNqv/u78athzqZTjVkN6Dse9V6hBN5829n0rnJsT3UHEja4KHKyh4wf92t1Xtgjy1wJsK9w5EdgVNX/pj6+D25Q+l2nW2VnyHaVOToGW9x5ZKP73oX9TRx4dEPDwNnECgj8Gjh5RpXrk9vPvg2/y/8dLvQQ9kRkJcUnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10050
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM2PEPF00070CF7.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 18ed55b5-f719-4538-a868-08df1f9a7717
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|14060799003|82310400026|35042699022|36860700016|4143699003|6133799003|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: pY32WEv9EfqQt/0w2oB9njLD/L7dr8XgDIASb6lyJZnu6/9RqyMinVz1ruEpnvLV62mRgD0j7P4NQwMIQEwAafFK4uZPhADw+/VNPZ2MjWSB5s0M0fpaILA/P/TK7JyWRb/+FdPoTv12UM0BaPVqwua5iJXwk3KPGnWGQFgdJlZsbLwzRvecJl0mzdulsTHAAnGYYAeXZFGQQNtEjbQJHQ1oL23slkRyTSy+AhT7g+8kuqDYJGKiOXNrNtspgyp8N7XqYzTy6abb1PhIvTgHIqtrcZ5NaU6qmAK95bvXAq5Kb/4LhSbtK1lihrRK8MbSpUspYRtbzHa2ejCNRz/uHdFOv5wsZ0NGLKFaunX5CW8l6c3Oy4QZg7wwZ5IT9W4cAYcNWKmr0AylUpQFYjVcl+C/NPwJuMiSIxFNfnlvmyYuskXFZK9qgJ8Js7bxjMp1U8bGoppm6+It2HNm2JmFNfQtRehJUfLpBZht2veVl67mzxdNkw0pGKjByHfP64Pu9E/1i/bHivn82nsuJAbAz8zY+/skRh/50oNWGO/lfXU8BPguazGy+1zCZ+WYYDj5FUWadKUa8EC6LE96bC6x9mMuRpmYD0U/MAM2VX9IhoMb6VHNShpEzu7hkeYe1376FXauHLPx8SoGlDRJwIJHs2ZWuer31gZzM/N2KwD5sqNLnfT4JOp9wiDTXa3GoVQUyaHovu/pxF7XcloyH2lAgg==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(14060799003)(82310400026)(35042699022)(36860700016)(4143699003)(6133799003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: bDp//M8Opk5/oLFDT8QCKHBgB1ibxtonMQg53S/iPrhyO0WcmPb7KijARCkerDkX2tqQQXZY39yOQKwq6Ye7PlrMJnhp5b217OE7ufCwWPj0kXdq2HrUtF3XTcu1CCmdnaXPN9031td1P+FrqeekuLEKvcQ7v867H/2khWCxSrc7OnnEiejghSCCFOevLs71B9Tl8DwMrTDVRLia727kJLTMUci/JM+bI9LCC0/CJK65Voxoknkq+/Vm7pDlszmBiQt2VcWp9i8F0vJYsKeDnyxfbGsSfVKv023hPM4Na5NWKEgceUZRXh27f5zwhhT5SkpF0YE6vJ8/QUMDn7BWIbB408ru3OEPwqkJJRFY8zKusQTN3tujGX4LbLf+clh5VA80NJmNkzrZZL93zEWmzxRlKcFkdt8pwpU/UXABekXwzlvCf9bvSMhYzqUS2j6a
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 09:01:45.6884
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45b9a402-c4b5-4940-00c8-08df1f9a9eb2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF00070CF7.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB132880
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_020154_963095_2EAB6878 
X-CRM114-Status: GOOD (  18.05  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, Mostafa Saleh <smostafa@google.com>, usama.anjum@arm.com, Marc Zyngier <maz@kernel.org>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 01/10/2026 8:21 am, Will Deacon wrote:
> On Wed, Sep 30, 2026 at 11:42:51PM +0200, Linus Walleij wrote:
>> On Fri, Sep 18, 2026 at 6:14 PM Will Deacon <will@kernel.org> wrote:
>>
>>> This is version two of the kernel stack juggling patches I previously
>>> posted here:
>>>
>>>   https://lore.kernel.org/r/20260907164247.17223-1-will@kernel.org
>>>
>>> Changes since v1 include:
>>>   * Fixed suspend/resume paths to handle the stack pointers properly
>>>   * Fixed restoration of ptrauth keys on resume
>>>   * Added tags
>>
>> Overall I like what I see, but can we split it in two... like first the patches
>> up to fixing the overflow handling using SP_EL0 and finalize that?
> 
> Yes, that makes sense (and thanks for going through it). The whole thing
> is bisectable, so lemme go through the feedback I've got so far and send
> out a prefix that we could consider merging as preparatory work.

I'll trigger run on this prefix.

> 
>> Hopefully Usama can test just that part and see if it has a lesser
>> performance impact as well.
> 
> I'd like to see those numbers at various points during the series, tbh,
> so we can rule out any stack-protector changes etc.

Sure, I can trigger runs on different points if you can mention which would be
more valuable.

-- 
Thanks,
Usama

