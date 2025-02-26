Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22035C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 13:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AmHLGhl8rDzzLcBuSPNEu5QrR8MKpv9kBujBUA8ejy8=; b=d4Rcr88C03kVOWY/b+ekwfTjDX
	Gcl4l5RF4gBL+AVqKbT/Wu+Kl2VvjmrpbWlQ/8+EjrC5FNRPt70+KgyZmU1GJKQ+rP7RCia6xxm7Z
	tpRkYjzB2Df2UOoTsQfEEfV+oJAI1qqW7AsF9FfBLidFybz69LZAmp/hXJYeKTzwHaAPISTpAF9J4
	tQq0x7PH2sLnmBlRl2M6nE3pLrUkQoDd95DPvmiJOSBw1uFbZ9k+lOJnBPkJgHvEBiWNS78QglLP2
	24djTKMQPWBXFTkX8uHbGEJTU0b8QOKs/lRlhteTXesrj4yw98I48HHlHF2r3MV96ovvubkO2uJUm
	67BsJiig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnHST-00000003uWq-2524;
	Wed, 26 Feb 2025 13:28:17 +0000
Received: from mail-sg2apc01on20700.outbound.protection.outlook.com ([2a01:111:f403:200f::700] helo=APC01-SG2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnH13-00000003lDD-2o50
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 12:59:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jjtMS4k7rgxxMi8ZfpXXI0hZOLC+ZCJN2DSLRLJKSfxVx7kXl76wzEqT+NOxL/HarzRWSlT8Q3sm88sAL3NRIR9Kt0QW6ZLojWPq8AM/G0AkW+N8Ax4MOoQsNX24MgqNiSAqoEbqoestlM8+f8XRzaCdWQtV1MaOQInhfgb8twkqMeuuqPyEKV7nrthmQpTY1OGQXlmlYzcxf09tNjNQUJYD0o8goOjX4yCweVtkB8M4hzrZJKSOKSn2XIHuBMnkHxaYGlk43CfBNG5OMcS6JnIVbwn4911RrIyH1vc08m5Jfrghj65OnuWZCpVh/SnEYSUPljV0WOf2LxS4wiR1/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AmHLGhl8rDzzLcBuSPNEu5QrR8MKpv9kBujBUA8ejy8=;
 b=U0fbGs81nTrRZ7CLRCCmG+nxxRG2CRnq0cIl5UVuC9/LJXAZBK2CHwQOQChM5EV5wPJB1ANrl3exR5a2PrbmbPRoDkHkPB+kHEu60d8Sh5+FRddMn+bOJUkBYovIMQhquRziCavZkuF9yPti0jtTqVMkqjBqx7aMqk/pEmo4Yp82zVJ9nWMprG5BWTpRQPweuu/EZ/bzYz7ifq2U2x5NAYlKkubFDqZy+G0NmA0G9h32mn1ymjUniUeAVStpCr79v0DYdVEtruRCIJcZxaiQdYGaWEvUgYQMZfhD18Yz89AZvmRUWonqohyidBJrgsaSeclrUyr02GVBsh+pNL72EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cixtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AmHLGhl8rDzzLcBuSPNEu5QrR8MKpv9kBujBUA8ejy8=;
 b=lch4rzNw+p0BC+ptCaqyux20oJeQDwNTZbZhsnC1bMIYt/FURtdMgZrJdRZryeEMKBjpizF/+Ac+DR2BqO4TmEjYvVINmXYL0HIprPkEZ7Msl8fAt0IMKN8WvCi6VJ4ny/WG1P0RtR1sx0W4unLvSwRrTG+wII2Ib7pyotfelGjDyV7JmXOuc4CzXJJ6Njx+P31nN9VQ05cBAlFUy4rbUC1GIh0FEAEyy13z9IYG6oOicwJqtZlDLn0/R1b1AdIVjpeY/rdWccskgzERf05KXLYd3eJKuyF8p4YBBpz3jvVuya0ncCsjWRtMTU93DjIlDHTEfYf2eGR06Fn0V2CmHA==
Received: from SG2PR02CA0123.apcprd02.prod.outlook.com (2603:1096:4:188::22)
 by SEYPR06MB5304.apcprd06.prod.outlook.com (2603:1096:101:6b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Wed, 26 Feb
 2025 12:59:41 +0000
Received: from SG1PEPF000082E8.apcprd02.prod.outlook.com
 (2603:1096:4:188:cafe::c0) by SG2PR02CA0123.outlook.office365.com
 (2603:1096:4:188::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.19 via Frontend Transport; Wed,
 26 Feb 2025 12:59:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E8.mail.protection.outlook.com (10.167.240.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8489.16 via Frontend Transport; Wed, 26 Feb 2025 12:59:40 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id BDADE40A5BFC;
	Wed, 26 Feb 2025 20:59:39 +0800 (CST)
Date: Wed, 26 Feb 2025 20:59:38 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com,
	marcin@juszkiewicz.com.pl, Fugang Duan <fugang.duan@cixtech.com>
Subject: Re: [PATCH v2 2/6] dt-bindings: arm: add CIX P1 (SKY1) SoC
Message-ID: <Z78QOoI6x_kW6yvW@nchen-desktop>
References: <20250226012136.854614-1-peter.chen@cixtech.com>
 <20250226012136.854614-3-peter.chen@cixtech.com>
 <f89817fe-22af-460e-9f5c-a3347eba1892@kernel.org>
 <Z77MHGhUF6pPwLww@nchen-desktop>
 <d9556611-cfe7-44fa-8965-bc2b0f870845@kernel.org>
 <Z77sSg_3YC30oYoP@nchen-desktop>
 <816a3601-4ce1-47ef-8ef9-befc39c479c5@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <816a3601-4ce1-47ef-8ef9-befc39c479c5@kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E8:EE_|SEYPR06MB5304:EE_
X-MS-Office365-Filtering-Correlation-Id: 05b4b5cc-7045-44ea-3c16-08dd56656ed3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BISNITyzZ9XsoL6YpJ+UA9+JKgwPF2H6GAEKcAl1TTzkfg0kBkugXcNJXBqv?=
 =?us-ascii?Q?iZkZv0KRvULvy8p40e7pkQCJuxKT4x5EznYsX8UI9ptrdeLEqChNAOk2hQtu?=
 =?us-ascii?Q?u1CixLNBekD8lElPezNV7j1x0KKVpGLYE2J8XQE6pXOJV/PkCsvaoeU9sIQu?=
 =?us-ascii?Q?TNouc8WXgG/xi28Af2SJ7XRjkLAkWBOPUIvPHJFU3kvTNpaCiYkoWnTOal5z?=
 =?us-ascii?Q?8DBWvqwWb1JW6GYeAcjci/2nMkL5rCxwC8lo3iJrQ02l9MpsgZdLZ90Bm5bU?=
 =?us-ascii?Q?NJkStgI/5QZKGKD+fLGfiv68SnxGlzf2wZ0LhIQ6xiRH3BlW1IGMbq/r3RGS?=
 =?us-ascii?Q?Apvw/gtgk3BClvue+q+xL9F9YkpuGzeiTqXct36Nc6uAnzsiJtIBZ9prJaYt?=
 =?us-ascii?Q?k0FF/xitCXxeg0xBKhOA2zO/y9ARI/+5PJsr3gRP2CULBw+jtwZRL6lZEQ3P?=
 =?us-ascii?Q?+RfjlyXjx3Q5lb3UJ89KJEkO0aLswjhNIuR4KPpxUuyOFQak5MwuTiI8wpuy?=
 =?us-ascii?Q?N/Q6/exZPWDMvuTp92vrY7aF1oRL2TgbYAXOoSbykCKQu8O9Z0ZEfVj81sCK?=
 =?us-ascii?Q?5M7txCH/GpLw5Fm8YCS3QfOJjMz9tGD3ghBy+rdI7rpEq5Dt+5jcBTU1PWEx?=
 =?us-ascii?Q?92vj8R1OgB6uTrpOx5EHA9jrvKVdQ/t3YzeEBplzCZqbrGDV1wdncEsr83Sx?=
 =?us-ascii?Q?DrsmEAlZd4RVAbpnLbjPZj4AUUvIO9lDO570jYF8jRRhBYeyHBW7FDsm8b+X?=
 =?us-ascii?Q?ASwiOPaNCiJrDKZOviAdIXnEhtGUXHPmfg3hCA5EH9asgacg/6iXgreq/Y/r?=
 =?us-ascii?Q?wl66R7V6TZOZ9IIRwn9kGJvzV1EUnKCbBFAw/lHjP8KeK3Rm7RajP8svJQ2A?=
 =?us-ascii?Q?n5Ixpk9XIECyzaLK81y1ggiaVVEdQZcGMfwA42ct5uKYQwUe5HZDVLl5LwLz?=
 =?us-ascii?Q?gBFUG1bq6K8Pz/W5G+1fXv4/EYSKWx9C7N9eD+eWDhn8ZrpTeWm9AilPltGo?=
 =?us-ascii?Q?1xp4sHaN/hhUCk3numITrP83daGMCdOiK+BlIwK9l9EE2N8lLp9/w5B2ntDb?=
 =?us-ascii?Q?kZkwW7B1ZFZm9rnoKNe3Z19vbc7TaySjjTBsmPuMap0O4d3eyqYXhdI93QY5?=
 =?us-ascii?Q?6gbyMPyyvF7spxisfBbe2ps6z4UH5atpwXOPblbT6JqpgT+XDlj2WDeclh2m?=
 =?us-ascii?Q?KjNbttI+zbzTsTKkOsPD1veKdGYIrmGxfv7pMCxF6QMBV4RmxXvhMoswFTvz?=
 =?us-ascii?Q?xfRUEXnsbXVz2jP1wNGbLks4WqE2ucClISDxsO2b44jPWKno2UtHxHvwu4yo?=
 =?us-ascii?Q?HBu9MteNXO/+8x+6E+pfRgHGvYQIpBSjDv+0VWsW+TGuDO2nhkDztPYtkBVp?=
 =?us-ascii?Q?gVgrcBiF3wfIgd4TSlkVDW8zocAdHLtoJVD6pS8Tor2QHU27EiV5/j03GTUE?=
 =?us-ascii?Q?K7pIRiAVMrc=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 12:59:40.5626
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05b4b5cc-7045-44ea-3c16-08dd56656ed3
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG1PEPF000082E8.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5304
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_045957_886879_6CD8E543 
X-CRM114-Status: GOOD (  21.39  )
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

On 25-02-26 11:30:38, Krzysztof Kozlowski wrote:
> >>>
> >>> I have checked the review-process again at:
> >>> https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=935897
> >>
> >> This does not matter - that's not a patchwork anyone uses...
> >>
> >>> It seems no one gives any Reviewed-by or Acked-by Tag.
> >>
> >> You were directly addressed! So you got email and what did you do with it?
> >>
> >> And lists received it:
> >> https://lore.kernel.org/all/ac6c4a8b-a6bd-44a9-993b-3b743a172dcc@kernel.org/
> >>
> >
> > I am sorry about that. I checked this email with our IT engineers at
> > office365 administration page, it was not received by Microsoft office365
> > server, we don't know what's the reason.
> 
> 
> That's the only email which did not reach you, I think. 4 or 5 others
> did, so this could mean your system will spam/reject silently anything
> with review tag (or email address).
> 
> If so, your corporate mail system is not suitable for upstream work
> (Microsoft outlook is known of poor quality in that matter and that's
> not the first case people have trouble with Outlook servers) and maybe
> you should switch to b4-relay and other mail boxes.
> 
> >
> > I will put your Reviewed-by tag when sending v3 patch, may I get your
> > Ack for the 1st patch:
> > https://lore.kernel.org/linux-arm-kernel/330a01b7-7285-47fe-abb1-8d5fa71dd240@kernel.org/T/#u
> 
> 
> I'll send it, but I still have doubts Microsoft won't put me in spam :/
> 

Hi Krzysztof,

Do you use kernel.org as your smtp server? It may kernel.org's smtp
server issue, both lore.kernel.org[1] and patchwork.kernel.org[2]
have received your ack for my v2 patch.

But only lore.kernel.org [3] received your reviewed-by Tag for my v1
patch, the patch.kernel.org[4] did not receive it, office365 server
for my company also did not receive it.

Another strange is I did not received [5], but my colleagues in our
upstream mail list (cix-kernel-upstream@cixtech.com) received it, I have
not in that list at that time (now I am at it), but my name is at your
reply to, it seems kernel.org did not send to me.

That's just my suspect, if someone meets the similar issues in future,
it may prove my suspect.


[1] https://lore.kernel.org/linux-arm-kernel/df24ac09-1717-4a91-a710-cf1e46341ca8@kernel.org/
[2] https://patchwork.kernel.org/project/linux-arm-kernel/patch/20250226012136.854614-2-peter.chen@cixtech.com/#26265571
[3] https://lore.kernel.org/all/ac6c4a8b-a6bd-44a9-993b-3b743a172dcc@kernel.org/
[4] https://patchwork.kernel.org/project/linux-arm-kernel/patch/20250220084020.628704-2-peter.chen@cixtech.com/
[5] https://lore.kernel.org/all/f56e9c68-0745-43c1-ae80-e2dc0942ea07@kernel.org/

-- 

Best regards,
Peter

