Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C61D6F9D0C9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 11:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Muchk4/lpEpyusQFoAzupDtSww3MJPJx57QVIOS37fs=; b=hB/EM9z1FxadBFqUO8l1XrcH6n
	9YOHMAqO4ZgfmqrDW1l52Gyk3UUwENizuYNgvb2lovmsW570fLWJ5BAuqNF4cYH5sh6Brr18QhujJ
	7urNOzLAw4HBADkkAaz9d7KxP7/13Y8oXN4/FJemPhafjX2/alS4N6FQeI2++wDX9ksr8wczug3Yu
	EBYV0ofRf0n2/uPl52fAT1HukbagCwGRmEegW/dgqZAAVGp8azAi1L9SSKYvV4QoePjnKrO96iUGx
	H7QNx+AU5nZzAw4mENwV9+rqSnNcV0myMwnKSHcq5Eyo7U/gPDNxyxbwuzEJJnB3g3JzFwvtaiZ+Z
	gnOEkUbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCcH1-0000000HGBg-1Wwf;
	Tue, 14 Apr 2026 11:49:43 +0000
Received: from mail-southcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c10d::3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCcGy-0000000HGBN-2XAf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 11:49:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=unvT2ZAOGQMfux9Wyl0F7m45r8tOGaIccUjrTeIMReNibHAD0Y6ruI88+XplpDsKxEOU+o3ZTMX1FEw3ouI1kmhrEWvp2TaldXHoYIbNDJ4vfDJRcKQhBNqlUpiO+vRl1CuXRwZkrREyM1648Ou/TSBktElvkv1i6sxSsEkKH6khIoMrhniWnGTMFipfZpFVPaRSv4+FzjliuqUS8UtD4nxcZxW/OoFRR4KpbMtq76qK+U8kCZfPgfwBcYmRdfc6lRh+bbDzzgMIP3wVPEwbwn/IIFPEwGKFP0JZbIShWZ7LH1DFvjQmO5Qs4eQv+XHe0OLTATruD2trQQjDsRYglw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Muchk4/lpEpyusQFoAzupDtSww3MJPJx57QVIOS37fs=;
 b=K0MMW5GD4pdDzPFDw5Lps4Q7lBLRLP3tEHv3bmB0xrtNwSI+QcJYDU7zwQ24Y9sr3l04sMFZ7wxSTo1AWjLwatSGfZHQIFuuRggdVNgNHL+9TPvn+R7qMHmK3kJ2HLQcLr4GIyZ8XOA79ZUMeiTSTCPRFByZvHUyYYYZMq4qRcLjig4raBUZjm7xSYwpCxExy74sBCGaBi6AmgH792NVHWOUjA4Hw19LdmxEicheplhgF/WSGiBVF0ONhQaD/ZvEyRQKqtfkc+rWKK4hhWRVD1bzNPso/2Bpy6wOA6wa5W4DIVRetwJNQsS4yf+dwtmwTHexalKXNW5Dgs8X5EG3Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Muchk4/lpEpyusQFoAzupDtSww3MJPJx57QVIOS37fs=;
 b=depPr2lK+K8WHk9v5J7f8b4DJvE9dlL8oUhxjWLoWJkl3Uxphpo4aRQ/B+VSgH1MHCFRU2FgV9TOEo58DPl6AdcdWyu+jP3CRQ1AeWktkRizPk6LOKeTEBdBhsYGfZynhvA/4d6CWyiLOrv1hp5PVGmxMLR3ErcnOjLuQWCxc19kDG1hn/PkDVkh8J013bZYvi0jQ/0cPIWyLIlECBJEb8qQaPypjB85hY37DtnfHeSjFzaDcNUdu2+X5wLSo5mFJCxIXs4y7b7zs0kiy2+h29MFUu8LHop5r+45ScywdEh4ziVEFOFw6e7P7j8/cfhHsMQCiQYe0bZ+vt1mzANy9g==
Received: from BN9PR03CA0661.namprd03.prod.outlook.com (2603:10b6:408:10e::6)
 by CH4PR22MB5802.namprd22.prod.outlook.com (2603:10b6:610:229::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 11:48:44 +0000
Received: from BN3PEPF0000B370.namprd21.prod.outlook.com
 (2603:10b6:408:10e:cafe::8d) by BN9PR03CA0661.outlook.office365.com
 (2603:10b6:408:10e::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Tue,
 14 Apr 2026 11:48:43 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=mkerelay1.compute.ge-healthcare.net;
Received: from mkerelay1.compute.ge-healthcare.net (165.85.157.49) by
 BN3PEPF0000B370.mail.protection.outlook.com (10.167.243.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.0 via Frontend Transport; Tue, 14 Apr 2026 11:48:43 +0000
Received: from zoo11.fihel.lab.ge-healthcare.net (zoo11.fihel.lab.ge-healthcare.net [10.168.174.93])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with SMTP id 3C84A131E4;
	Tue, 14 Apr 2026 14:43:41 +0300 (EEST)
Date: Tue, 14 Apr 2026 14:43:40 +0300
From: Brian Ruley <brian.ruley@gehealthcare.com>
To: Will Deacon <will@kernel.org>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	Steve Capper <steve.capper@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	catalin.marinas@arm.com
Subject: Re: [PATCH] mm/arm: pgtable: remove young bit check for
 pte_valid_user
Message-ID: <ad4obIAQ5vbWsIau@zoo11.fihel.lab.ge-healthcare.net>
References: <20260409125446.981747-1-brian.ruley@gehealthcare.com>
 <adewJetUv6wMiz9o@willie-the-truck>
 <adfDEMK8EbIjPu3J@zoo11.fihel.lab.ge-healthcare.net>
 <adfNN33QIOP3VfDm@shell.armlinux.org.uk>
 <adjYlUk8_JjPivNi@zoo11.fihel.lab.ge-healthcare.net>
 <adzMOdySgMIePcue@willie-the-truck>
 <ad0Ky09tLcFx7JCa@zoo11.fihel.lab.ge-healthcare.net>
 <ad3wRQt7K-QLX8Jw@zoo11.fihel.lab.ge-healthcare.net>
 <ad4gOu83zY-SKijx@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad4gOu83zY-SKijx@willie-the-truck>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B370:EE_|CH4PR22MB5802:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bc38ba8-c982-47d8-15c7-08de9a1bc7a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: DziYxVqzEh1S8x+qFLDsDAII9dEBIYQMBQ6CS+8yCbW7SbdFv9A37AfkRkThX9bo1zCb9xgLJNexxTBmJbCv9yl+9q4bNnM2zr0H8386RZqXxOSrAg9wUQUyVyRpmt6z6DPTSZH/wc4+Gmn099YrAP5CXILcHAf4VOofF4CLIYE/P4TklZKFdF0leRhXVZPVhnOUHft//r99yn0d8q2QqV/0Y0niG2j1DwP9ajnc5KzPP/dU5PZJ1vriqLHWAJ4HRfXsCsXLGjPReKnQQMYMqHrlm1krIWMaCbTT+wOa4VrZPBq0bC7qKh+NQGsIYb4dw2oOwAnyd14m7OisP/OwPja558v++Hbefhsg2kvGLdxcXOdkj/LnVn7GuRsY0SQUbqLgR9nD5nr/0o2uCIHOp8l6qq/lW9aKvfteItToIRAJN1upEX+Rg8u0W52HQSchK+2xHL4A87yhynD+qPjvTdjnRMbuduDwbErKG2nldy3ZrvRD8hMabBncVi6aaJhXBLimC8LOgkNS+TBz41ObqOOukjBKHpa5UNlGFakVSvZC9tQqX4NNy56822RmpSjJlVxtKstG05gy/DnNLUIusq8ihpBHWpzUy+kpOn+EvlIqW/sUiVA2kkvLs3E2TtQDSkCqcUliErJ7MRNxrG17JcPZfzlQIdliYz2y64/oxVv3BgxeKZGnT8iTMspWaz5fhBc8kPx0pWnXK6l+7QKNguVePXnIXZbR0bvbS1YSHPsmQMKhOd7b4nCxDjCs6K9fPuEhCoW9Vpw+MM3CYcHA4g==
X-Forefront-Antispam-Report: CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mkerelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 6NO8aVQZ4ZCEN2maXSeX3Xydfrzx4CBocwWVYnx1rKwXXhv1ZS5tHzoTG8EzlpsAuqWYvz5R0Wu6NZBADeMilE/13YWFdZhFe1umnAIbk/2+HIG3dIltdm3Glh2piQRpQ2H2duUH2op1nbw9fawSaLRsAw/dJWZvH4Xxd49HaKzxez9Dzz1AfrAkdzjM/5Sz1kVTMytq0zaEim9RXJTRgc97PAAZnbwgnk7OhMrBks4PngEhBx7Qj//eNmHhqaLY66mB//vooK/u39esQvIcwkwd1rtRR5ZFyGTcEDbapxgWsH/NJ5M/ntzrr6Zn93s01Sd2ECWlIO/7Anb4e/WPT+9WpViLnL+bq9bS6/ahIE2/Qfims0NeJgvmXWoNpOg+1uBLg9AGFxocAovT3KVY5RbIzEo/LMqm/LQ+t7ZOt0zd1JTen3F54XdszlKVCccw
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 11:48:43.5781
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bc38ba8-c982-47d8-15c7-08de9a1bc7a6
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[mkerelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B370.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR22MB5802
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_044940_668538_6F647993 
X-CRM114-Status: UNSURE (   9.61  )
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

On Apr 14, Will Deacon wrote:
> 
> Red-handed!
> 
> Please send a patch for review (perhaps you can include that snippet in
> the commit message).
> 
> Cheers,
> 
> Will

I sent it as separate patch with a link to this thread, since it's a
different fix.

Thank you for the help in this matter!

BR,
Brian

