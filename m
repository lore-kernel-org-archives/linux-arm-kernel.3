Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5EDCF531F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 06:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BbYYWjaWPD8vfwyb5rcjFoUF7B2BxHq4u0cTDOzlOgo=; b=vIwbnyPjNPaimINLpx1Tk2S6r2
	qmXx+TUsQznl/rcSFSyz0AhFk8LrYB5JF/epaJef9lH5HV8qg3hNPLxEH5ua9KFaXhmASNg63xWlN
	qC1ExepigzpnG4s2dclnN9shxIHH+pXzYgcCaKZWqraS/IdGXxV9r2KmU2zZMmSOuR9G0iC24B/pm
	B566ZeIHMNi010qLQsOmgkcgFc9w6p4zjiT5anpxZCEfG0JDDXFkDmvLpY8Nf7ECdh14lFAVEFJ3t
	uVQ9B9X9CZvp7Vp1H5TpbkjfMNNfGY/uaKyBAc8aDjyezfGkkHXP/Ycei8l4MBjXH1Nl9LCwWwpjy
	ownrnebA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCXGa-0000000GqKL-0ZWV;
	Tue, 14 Apr 2026 06:28:56 +0000
Received: from mail-northcentralusazon11012008.outbound.protection.outlook.com ([40.107.200.8] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCXGX-0000000GqJm-0eTA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 06:28:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cDdIUIxtxwXy18Zlgl9+6xu8p8elGVKPl1gNP3VEKSDndTsLXNtHKjWQjUDq46REyb65UYIdj9nSEm22ybu1M/Ar9XmdcMy5OibwcmxV8ZSd8RfpzwbpS+Pss+wk3m7mFtbqeL048TixghqVgbHm/EoOTUwiwXIW1CMVcDi0z+g2CNY7vze0uUnx0x0/YQoYNDLvWlXS+NTuAYHZR0KMwaLEK+cKnykyihOU/m4lTZ5cEd3g5EV2HfZjOv3OK0oaUvrxAyEKDn9x4TvsUX2Wd68UXWXT37RE+ZxceuEEqaT6xc/dtFTPFSu4F9+9J6NWF3OKmd3XezV4d82KbVU3jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BbYYWjaWPD8vfwyb5rcjFoUF7B2BxHq4u0cTDOzlOgo=;
 b=SIm16ozTTKUCfFPU16DuZ/BCsoTol2gnAF8STExtKYAUMGaiYTz15O0/SEGouiQW5+Yi7AHExDs8KnpjMx+0u9q59Cz7cTrn/Yl4yIVtQ7FRYvFPml3TDpQwtTV4iYwxRiUzXCRc3YckYCB2Ht4twpWsFPg/i6mRmMT8hUVU5vnOo7x0FPeq/b5P6Eme4iayHSQHTf8/2U1skEVXtqGjjcxER4pby0LNnpmJcGAtL7Y++DNC3PKNAqG6baT7CjLv9RS/XuhLQDqeE24Zcpr3yucgL4PNZ+3v5exHI8vIng5ZtXZ02IHHuENBZx7Hv1NAHhQtmIMWjj9UJiMyXYms7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BbYYWjaWPD8vfwyb5rcjFoUF7B2BxHq4u0cTDOzlOgo=;
 b=RxsTvQ4X6gIdPo4vwNSzRqij7HUzbRXgEez5DcB0Gh6Zh2RdNMj9F/8cMRmljsCFAS7wHpTtCu8m2m2W6YIH1rssGg7TQeDOwRvmqb+2dVdBT2V8XDNZcKOoGz74CqLQhaHiefTvLA34D0TaMW1jb2wktpTpeupf36L4xkEEVtKKBIl5aDH3s3B+CNDLo+mjs9J2Q3sxnKEn5jEECjhvgtvGp6AW8AzctOT+j2521zfo4oQL4jALwxyZ6Dd+R9dhKB5RxJ54Fm2rSXwXdGPQPK57pWUjy30KfJwy4PUImH6/qOWen7d3U0P3n3PvANqz+IGCo/dKh5/xN3OeIDzXBg==
Received: from CY8PR11CA0028.namprd11.prod.outlook.com (2603:10b6:930:4a::14)
 by LV3PR22MB4728.namprd22.prod.outlook.com (2603:10b6:408:1d0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.44; Tue, 14 Apr
 2026 06:28:42 +0000
Received: from CY4PEPF0000EE34.namprd05.prod.outlook.com
 (2603:10b6:930:4a:cafe::c2) by CY8PR11CA0028.outlook.office365.com
 (2603:10b6:930:4a::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Tue,
 14 Apr 2026 06:28:42 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay1.compute.ge-healthcare.net;
Received: from atlrelay1.compute.ge-healthcare.net (165.85.157.49) by
 CY4PEPF0000EE34.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Tue, 14 Apr 2026 06:28:41 +0000
Received: from zoo11.fihel.lab.ge-healthcare.net (zoo11.fihel.lab.ge-healthcare.net [10.168.174.93])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with SMTP id 34CA8131E4;
	Tue, 14 Apr 2026 09:28:39 +0300 (EEST)
Date: Tue, 14 Apr 2026 09:28:38 +0300
From: Brian Ruley <brian.ruley@gehealthcare.com>
To: Will Deacon <will@kernel.org>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	Steve Capper <steve.capper@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	catalin.marinas@arm.com
Subject: Re: [PATCH] mm/arm: pgtable: remove young bit check for
 pte_valid_user
Message-ID: <ad3els55xYWLgn4r@zoo11.fihel.lab.ge-healthcare.net>
References: <20260409125446.981747-1-brian.ruley@gehealthcare.com>
 <adewJetUv6wMiz9o@willie-the-truck>
 <adfDEMK8EbIjPu3J@zoo11.fihel.lab.ge-healthcare.net>
 <adfNN33QIOP3VfDm@shell.armlinux.org.uk>
 <adjYlUk8_JjPivNi@zoo11.fihel.lab.ge-healthcare.net>
 <adzMOdySgMIePcue@willie-the-truck>
 <ad0Ky09tLcFx7JCa@zoo11.fihel.lab.ge-healthcare.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad0Ky09tLcFx7JCa@zoo11.fihel.lab.ge-healthcare.net>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE34:EE_|LV3PR22MB4728:EE_
X-MS-Office365-Filtering-Correlation-Id: 567bc41a-d2c6-42f4-adee-08de99ef122f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: MfCSTPKW6huwgDNlLpKVfnpb9zdvTLDNj7whmzVmUdyXjJ99vy/W8VIch7yse5tQYyY4HW+ct3Oag1pcyXRS74MYekId2xmS2hyvAifJssslTt815+PbuGOabVkB2h+U3ll2FjnOdgkEIIuTqHLDKA6I2mJWmK6VYaGvaDayPY9cLWgCwLwqIkiwUDOyqZWTC9tvlc2SLQSp6KzK9hqHHJF2Bs9jzmTJ3Ts7nG+deq8mgXwIABfzVovHGNJ2Q+6L4EjwIdLLCk73cGRfe99yxKQb9fpfgph+14RMtbblQMhxVU53pGa6BOxTeja+QasGAWzZL5SRyH/gn27IEbdwSqaUCdQ/3H2DFaTk5VUk1t/ZAwvGGMimLTbp/AV8RmyZpAdLvl+ipA7z/91AbBEpB2zKZrqwehTjoijHL+xh4HUuENl6D5cuqI8DtpTSVa3kOXb3sbOSAirNA+hJezMaktW/rGHQLFp/uy+wDtET+qZt4RQjoJqLsiB72j8jgS57DrS3vFt273IrcEfwXzdqB5W9lfSNLsea29TrAFHBW136Afjopkxy+Bk1KJlwuX7Em0XN4JIlNThjeD1y/rHtz3BRc5E6uy5fzFCgMxhrN8nZ/SQpZxIYilnsYLLZlqNcy01F+RiA5bM9gZHDCY4uaWj+voXBwpB9iXIUoTClyh5o/QFpKjQ98Yb6AooVJaHWJq1L589jDdiL4kpRez3qYs7VdFMCk/eHAbE0fEEyjoiI72k8FF7ZBXQGa9qibXIELv+DFfZ+LchRdaADez9cmA==
X-Forefront-Antispam-Report: CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: F0HHz+kLMCHoEJkWNG1GvM0dcFzRSU/7Rf4rHS0y9vqWQzroGw76dzoGQWc2c5GcNIhiAc9qR6U5k0WAifEnUEUYtnoXBHLI+Uu+NJjTHussRqBviwTxhdYlsIrPyRRbSkSqgI+sCCfKNSc1hCPC5yGc0k9jISWoKhIR0HDG+30H9+wBLU3oYQX/ttjBcAfZursabUlazmqAF/PaJdOEhSarbak/VXxg9ve2cfwqs9axzlIziqw02/lfqgRGaQeOFtnM5hmAeXSeKf+xd1iCNtJLO2p8XcLeIFZg683YmHoI1Ng1eCuC3OLbIjg85aPeJvzEnJ7YSPN0Ag7zLdMEdbE+5cF9GF/X95qBvnvKOHi2DYmgd6rDy4XBOeWZ6yH+qijg2eiUKTvcz5sbRmatCW1E/i/eTucMl6Cv6ZXwrLSdyZo4qdxEkiwP5icg/9kH
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 06:28:41.2834
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 567bc41a-d2c6-42f4-adee-08de99ef122f
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000EE34.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR22MB4728
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_232853_204975_C55549F4 
X-CRM114-Status: UNSURE (   8.29  )
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

On Apr 13, Brian Ruley wrote:
> 
> Applied the fix and so far so good. We're going to run `stress-ng'
> tests overnight to be sure. In the meanwhile, I'll see if I can add
> some instrumentation to verify this is the bug we're seeing.

No failures in any of our tests. I can confirm that this solved our
problem.

Would you like me to submit the patch or will you guys take care of it?

BR,
Brian

