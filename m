Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F1EC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 09:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ruq63O1ZHy3gynEQ791pfwWnaKmV9hfjYcQ9SkilbFE=; b=Ua9jw2K0U3gKcmNbW8BctUOcvB
	uYDkG+SpX++2dx/sKM89A5nGIyfWQwfH5Ft/j6M6Ri2r1Z3w/CYYBQYMjqILXx1UAZdriLG52nF8C
	iiGIF8UIBfv2QrXo5pLxt4PFRuRSNh7QoBTd5IhPws1i1YfFI4cu4dGq4O7xBpWqZNPG+5bZK5su4
	tzvXX2JFlhsy87Nt4UoXGrMUgQG5uonlqMJS3vUATYGcVnreitLBWBjNJ9ksI9X0CS6SRoRqqcK+k
	dfIt3USfqCM+UJB8wLTnhtLLTI1GjY0h64A7avII+2hVXOjJ8GrOcNwYWBLEspjvsH9KGnafzOle9
	eYlSTgtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txjso-0000000Ac2k-2tWp;
	Thu, 27 Mar 2025 09:50:42 +0000
Received: from mail-tyzapc01on20729.outbound.protection.outlook.com ([2a01:111:f403:2011::729] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txjpd-0000000Abgq-0hyo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 09:47:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kOxbAs8SxEF1VSpcV3R/EDJDFf+NORPO+uzv7yT4sWVsMob3M/exAuQmr4clMALNoimVElf19osOEU2u72n/ucIOPqvwc49X7kQM4/O+gtibwpRsIaonY0YqTfuKPiGvCl2Ix1WZrLTWjR13bwgIfTA1iH8Xez4sRyMikf8COHEozoxqdsNi4yKa02tkfZIYa1weFEs/UqEMVTzA+Bxwu4ID0JZFyjWKuTrk7IFh6HG47OIOv8s0lt217nYIe2vSt/UZlhej9qBjIt3lD7n+qbW9/OrapMtrPf59fr22lzeBAuivjza1y9AbkOs0Je8YTt+9OeMMp0yfuuctMG6UNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ruq63O1ZHy3gynEQ791pfwWnaKmV9hfjYcQ9SkilbFE=;
 b=V7tRHB9DSlh2+Zl6Nh0rAqm7UV1e2a8/cnbXw6kf7YQ+SVwZBpCTsg9/qgf6/M9FTPIlUX9EHSgIpyacf/HaawAo9vuRGprV77EQ2dAY0O8XjcHVjKI1flY4bG2fGySRk/jxFG3+XjHVbTONxFSMg33QqQlhSatGJMS6826RYtPT7/goG687IT12dbOt8u1zvMJIql+hXJrIAIF2RNwzm76glUOthCtehvrQl7O9+XTjCJIVQaivYHaSJDkF9Mw6BIaIWjoiWeIe3rnwROzJBUP/bUBU2v+D5gaJhSE+FnU6ov0tSbVoStCb61ZmYCUNtCSSpo1mR8VKWuXelO24Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR02CA0039.apcprd02.prod.outlook.com (2603:1096:300:59::27)
 by SEZPR06MB6140.apcprd06.prod.outlook.com (2603:1096:101:f0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 09:47:15 +0000
Received: from HK3PEPF0000021F.apcprd03.prod.outlook.com
 (2603:1096:300:59:cafe::81) by PS2PR02CA0039.outlook.office365.com
 (2603:1096:300:59::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.43 via Frontend Transport; Thu,
 27 Mar 2025 09:47:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 HK3PEPF0000021F.mail.protection.outlook.com (10.167.8.41) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.20 via Frontend Transport; Thu, 27 Mar 2025 09:47:14 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 4C15A4160CA0;
	Thu, 27 Mar 2025 17:47:13 +0800 (CST)
Date: Thu, 27 Mar 2025 17:47:12 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, soc@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, catalin.marinas@arm.com,
	will@kernel.org, arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com,
	marcin@juszkiewicz.com.pl, kajetan.puchalski@arm.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Fugang Duan <fugang.duan@cixtech.com>
Subject: Re: [PATCH v5 5/6] arm64: dts: cix: add initial CIX P1(SKY1) dts
 support
Message-ID: <Z-UeoIe4CPD3LwJv@nchen-desktop>
References: <20250324062420.360289-1-peter.chen@cixtech.com>
 <20250324062420.360289-6-peter.chen@cixtech.com>
 <865xjxmlgl.wl-maz@kernel.org>
 <Z-Nz0DU441Wwj1i4@nchen-desktop>
 <861pukm9yd.wl-maz@kernel.org>
 <Z-Tz1moMNozx23k6@nchen-desktop>
 <e43b1a00-b221-413b-a36a-3a65e17f800f@kernel.org>
 <Z-UNufwSNmZreKya@nchen-desktop>
 <b2e1da92-0dfe-42c6-9f36-32486b768220@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b2e1da92-0dfe-42c6-9f36-32486b768220@kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021F:EE_|SEZPR06MB6140:EE_
X-MS-Office365-Filtering-Correlation-Id: 78bfbb01-c765-46cf-ad43-08dd6d145ab3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2f/tSXcshgn60z7ZqVfZGtgmR8H7ji3cWBaCEYWRnH1NvC6znaG9CB5Kn/h3?=
 =?us-ascii?Q?Fg2l5Xg0tZws4qpJEH5grA+8y6OA8uV8b4ekIo4yvKWKok8v8rBGubUktpr7?=
 =?us-ascii?Q?lxgupfAYYglGxdkzWe6fFUmTsuo5x9Hn2qdnTPCmvQfUNMSF4akdnrve6sa2?=
 =?us-ascii?Q?i0IM7xLe6h6mST6oBPPAoM0csJs9oStBPM2qqivKlfTKgeWe+3UepNwlVRgf?=
 =?us-ascii?Q?U1naQcOoxooE4B3vMLMy0a5EJ4wnDIR+FUDvXj+DAp6NecpjrEChKDOVQdVX?=
 =?us-ascii?Q?TOF/QmZXY9/W8Oz+DBsjbdte/Rck67TMt75+ixja4jr60Niv2Lvz/tm5zl70?=
 =?us-ascii?Q?zIxI5tE3GQd/3bgjSEhTuv1rbBxliWgFnRz2lSWrxI8CnVBkh14oXCW/2RuX?=
 =?us-ascii?Q?cjCPZUH5MzkjGoHrEcbMfQdhvgML0aZdWo8q4K67CHvZXDs0Xbwi7YbscqD9?=
 =?us-ascii?Q?0I/RpE/k2v0s4pUlMGThshCC+4zfO7O4l8AkXYtHMP1pv0DKgcHP7YsB/nUj?=
 =?us-ascii?Q?Vxp/vw1SfFMPx1K+vJF03GV8J0nFeP6Dj2fQXHhWjI81u1KBqu8p3uw+w3BA?=
 =?us-ascii?Q?DiZ9jjkj5edWk+PaSyudDm36RCETZIoPLXXYkm+C6T+ymE/4CSygCjdVKAXG?=
 =?us-ascii?Q?BV7xCaIn3NwVGk+L3g/rekcQLVDOxBZqbyqg4biPZDUkrL1Grc4FSZyEDNoP?=
 =?us-ascii?Q?DM5AP20IPo06ZKHTSnFGH8xeV5snoEHuQxYyPYsfJ8YxyR5vdzFM06K5UOU0?=
 =?us-ascii?Q?1LvTKyTTvOJF+1ODMnF2N443q23gBTauoZeUSEZAnMsvLmKR3SPOoSIS0Qwd?=
 =?us-ascii?Q?zoPr8YEc5kSEu2kmrPeOtov8PRTuzkk64Vsn7bIy+yBV/PP/DD9LNAbLXkwE?=
 =?us-ascii?Q?VKeeNRhX1XFYjnaFHGtt0gu5a5UbzfZkaxACLt1zZf64mtIq3Yxjzf0SLWn0?=
 =?us-ascii?Q?Wb/ADOEcU5/0lLOubfrOTSFTbVtgavSHz1cwy2vhNTYPtiRwzndAvM9Ah4SZ?=
 =?us-ascii?Q?g0qF8flrdaCeKos42sjgZXPaBQ/vdDf3i9RFaMMQBOt/3nqDh6S45Of4qAZG?=
 =?us-ascii?Q?OUQS8gWsUmxTpx6hO7kzqHbBd8YfrhMsQAWZGYKrKjipvNlMjthv6eYPRigl?=
 =?us-ascii?Q?YlqVlD9d1ZaDlf3r505i+2/NDydF/qSoRKEyWi0xvAZmg3I3BIl47bJGVxAT?=
 =?us-ascii?Q?739CQXV7Oa1jTqi+ce6HGs45b83kUUoHMUV4ASw/bqiyLVQqQn33mH8IXzIX?=
 =?us-ascii?Q?D21EPLmtroVOPnBy9kAFP+SiCXE1IGzRJKD2lybPze0JEI7pkl8xuiW2S4WJ?=
 =?us-ascii?Q?Xfm9T+fzgjDvkfwz8BtjA+UXsY1kgotMZSaml5OrUlp6ATQ0B4+L00b0amBX?=
 =?us-ascii?Q?dHGv9BVNKwQa3Rz7VMi0DU+pFjd0Z4IFDIpwmrNLSkFYlykjpy/tHmr1nqk/?=
 =?us-ascii?Q?Q2SP4nNY+XGDxToptKaXbvfR9S5EZVTYBq35garQ4d5q6kavEEBFi9Fe2cje?=
 =?us-ascii?Q?AdlGHmiwiMvXl4I=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7416014);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 09:47:14.2476
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78bfbb01-c765-46cf-ad43-08dd6d145ab3
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: HK3PEPF0000021F.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_024725_207885_9ADA1D6F 
X-CRM114-Status: GOOD (  29.65  )
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

On 25-03-27 09:40:10, Krzysztof Kozlowski wrote:
> EXTERNAL EMAIL
> 
> On 27/03/2025 09:35, Peter Chen wrote:
> > On 25-03-27 08:16:33, Krzysztof Kozlowski wrote:
> >>>>
> >>>> No, you are deliberately choosing to make this platform useless.
> >>>>
> >>>> That's a bit sad, and a waste of everybody's time.
> >>>>
> >>>
> >>> Hi Marc,
> >>>
> >>> Thanks for your interesting of our platform, and your comments
> >>> help us a lot. But I don't think it wastes reviewers and maintainers
> >>> time, a clean patch set saves everyone's time during upstream process.
> >>>
> >>> For how to organize the patch set for SoC, Krzysztof gave good summary
> >>> at [1]. We are going on upstream [2], this patch set is just a start
> >>> and base but not like you said for marketing purpose.
> >>
> >>
> >> I do not think I suggested in [1] to ever send new SoC containing only
> >> CPUs and interrupt controller, without even serial. My instruction [1]
> >> was how to organize it. The DTS can be even fully complete, see the
> >> upstreaming example I have been using all the time - Qualcomm SM8650:
> >>
> >> https://lore.kernel.org/all/20231124-topic-sm8650-upstream-dt-v4-0-e402e73cc5f0@linaro.org/
> >>
> >> Entire SoC sent to mailing list on the day one of public release of that
> >> flagship Qualcomm SoC. The SoC DTSI and board DTS have almost complete
> >> picture, except few trickier pieces... but it even has full display and
> >> GPU! Plus, as I explained on my email on samsung-soc, that DTS/DTSI
> >> patchset references all other bindings with their state, so SoC
> >> maintainers can understand what is the overall progress and what will be
> >> the result in DT schema checks, if they apply the patchset.
> >>
> >
> > Hi Krzysztof,
> >
> > Like I said in this thread before, without this initial support,
> > we can't even add mailbox binding that the dt_binding_check will
> > report warnings/errors [1], the reason is "cix" has not existed
> > at vendor-prefixes binding. How we handle this dependency?
> 
> Not different than all other SoCs. There is no dependency, you just send
> your patch and tell where the bindings are. Just like I asked in the [1]
> you linked on samsung-soc. Just like all Qualcomm upstreaming goes, e.g.
> SM8650 I linked here.
> 
> Just like maintainer-soc profiles are explaining. I told you to read
> them on IRC.
> 
> Your way is contradictory to three sources describing process and two of
> these sources - my samsung-soc posting and maintainers-soc-clean-dts
> profile - are known to you.
> 
> >
> > I thought we need to move one step and step before, and keep clean
> > and avoid warning and error for every submission, but it seems not
> > the way you prefer.
> 
> No, from where did you get such impression? Maintainers-soc-clean-dts
> explicitly covers this case and I WROTE IT, so how can I prefer
> something else?
> 

Krzysztof, I did not mean soc dts, I mean the mailbox binding checking
warning which depends on this patch set.

https://lore.kernel.org/lkml/174290730775.1655008.14031380406017771195.robh@kernel.org/

-- 

Best regards,
Peter

