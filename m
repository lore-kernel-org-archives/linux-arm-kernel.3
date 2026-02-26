Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38625FCE090
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 13:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wDWOFxzdREWKnUMCI6CQ45R8fG30bqGpAobXOl9tOck=; b=agghuk8woBYcVI0uTUMvEYQUa8
	N2j+qRiFo4fHszqJiNIxrRnAebuZEWV7j7lDQqMH8kn++wt7TaQMiz6MMWzU1mTJw9VfuzVu3vOIr
	hRFJGIqxiPSYqCF9nCXxGqAnQGcw3jUhaCOoBfltQXW2t9/E0Q4TaaGTXi7iN837iA3rhqB+6bjsW
	a9+lpvKfXLlcieViZPlpsRJoh2w5xUUWL5tfaCHrzdQEkkgqXMdM93tgXoXQbiLpUjmTQVkTPwyW0
	rUxm1B2XF6+qDJyzyQA8UMvwK0Sgn5lBUkO2umCYXiWoh4qcnxj3TDMFHJaabPlz+R6v4NmRARJ+V
	SJc8QWMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvbpX-00000006Gnh-3lyZ;
	Thu, 26 Feb 2026 13:55:03 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvbpV-00000006Gmc-3dKf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 13:55:03 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=A2Mco6JU1P4tY06KFf0x/UPQlBQDmE8k3UHHQW9pSoXq81tMFIbxMB8bTN9wS+HhsPKGUS7j87bNJzU08878KybHY6SbcN2LGfUioG06FWtyURqcpiVrt+tk6CsMx8czyikg+LdPQoOm8a77LgiMPLyOjDHoM6MMHNWUFtOM48s9mtoq+GwQK9porY4Ek7I07/yyMgvuV7jvAg2ttFoPdnpKs6sOhTLHfaMSjQzUPg5mrzTBukoAlfIA+MSKK+78Qn8ctf3Lk5tbrC378GbTt++nLeCKQ+DOdIyyUDZ9m8/rJahiKPzWD78yfLR++NiuuHz7G+Dte25bIm9ut4hSwQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wDWOFxzdREWKnUMCI6CQ45R8fG30bqGpAobXOl9tOck=;
 b=TWgjxJ3xzwr7B3hrR4tPYig7qUPuxETKb/uRCKyEIH2we3/xW48GdmstVcYVkD4MtaRpd/Xfwrahp2Eg/VnNQniVbK2hQGUoHpByk9u2VwswHG3V78W1xg1KRqn9ZW63uQcKLnjL01Du4Js0MQE3595DfiGWQORgekYNSx/oq3J+NhUkBkms2+bIepjAIssW2YEA0sXAg9qQtfr/pWqw4+ylaz5PRNUXJYZ+9UCER3RpzcOwP+767uK37YCVAK7c75XAPgBgUewbcfxFzZENbYWpvE35yBbg+NjQ4wsRrom+gn0s+7lj1v0MrYnbFZqZrNLHxYahoLCwmQ1w41yrfQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wDWOFxzdREWKnUMCI6CQ45R8fG30bqGpAobXOl9tOck=;
 b=DKlquQEE0hPdkFxwbhmT54WA/6iFXnWTEKwiHPAjwcYccXT9kstHnaFT27qVUzr2z1ccrCRRAh4yxtjZdm54CpjVp3i2Zx3nGUHxt/hpzA7Dn4WPbfOFwRAaGZYAecVg1cql6aZr6jDsZam279bq7pfskH+C4Jhq0HcSKqz85ek=
Received: from AS4P195CA0010.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:5e2::20)
 by FRZPR08MB11164.eurprd08.prod.outlook.com (2603:10a6:d10:13c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Thu, 26 Feb
 2026 13:54:55 +0000
Received: from AMS1EPF00000048.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e2:cafe::76) by AS4P195CA0010.outlook.office365.com
 (2603:10a6:20b:5e2::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.26 via Frontend Transport; Thu,
 26 Feb 2026 13:54:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000048.mail.protection.outlook.com (10.167.16.132) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Thu, 26 Feb 2026 13:54:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LmTZzVLKxfwMP+KltB7fGIjiiJnZht3/QvHAn90MkBFe+kLXalgn4WkbA35V/sZ0nDG68OHCdbTGxt1D8RAMPfcbxhxSQ/UAde4hnTaAkTaZVv5+WM6zR1uxWMAhKhbz8NsheWnHEz+LvxNxyeOVnXZOjYOZyCjgeS2TVdgm3ugg4W2kGP/WxaWGSHcdzl0u5r8aYsJpXnaDLPEW1gkJKDJDGHbL/oJiNKjIM8UASE+n8JkJoTkd9UhnR/8qrjiLr8HJ5wq9hB9BgNCMQwGmp/p15N1IfD0IXGTiyFUpge6P3QxE2+LX6+Pf/EaxCEXcyoOWeU232IpGszgAwoupSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wDWOFxzdREWKnUMCI6CQ45R8fG30bqGpAobXOl9tOck=;
 b=iEUcZWHErL8CPn2ZIGf/r+HOXkYE7U21yT9I1ensR6raY2S/viKwKnqzVRERGfq/vE2Y9QM4/owWz0pWmPNz5Gn45PgFaHNoFK/FLtywimPg4Uj/R25AWFlcLaOwSQV+V+ZJCHsbxl3mdTwmBWg4SxalpzCcD9BpbXF+Px6F1bcciAzcv5JPO6SaOb7yGE0cHQlvtHXrHrnitjbOG9Liz22+rcojTX/+QZcDaMceSeyYSB9gbyGlux2bcsgGiiw+raRc0/06yYxO/SIm2NGyyPfPObccoY0RzO45UDYUfqmVokpRM77TpHk+fq3066Ry4r/do6gDZvulTq00BQRzqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wDWOFxzdREWKnUMCI6CQ45R8fG30bqGpAobXOl9tOck=;
 b=DKlquQEE0hPdkFxwbhmT54WA/6iFXnWTEKwiHPAjwcYccXT9kstHnaFT27qVUzr2z1ccrCRRAh4yxtjZdm54CpjVp3i2Zx3nGUHxt/hpzA7Dn4WPbfOFwRAaGZYAecVg1cql6aZr6jDsZam279bq7pfskH+C4Jhq0HcSKqz85ek=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by DB9PR08MB11312.eurprd08.prod.outlook.com
 (2603:10a6:10:608::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 13:53:52 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::8c9b:58d2:2080:eb98]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::8c9b:58d2:2080:eb98%3]) with mapi id 15.20.9654.014; Thu, 26 Feb 2026
 13:53:52 +0000
Date: Thu, 26 Feb 2026 13:53:49 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org, catalin.marinas@arm.com,
	will@kernel.org, maz@kernel.org, oupton@kernel.org,
	miko.lenczewski@arm.com, kevin.brodsky@arm.com, broonie@kernel.org,
	ardb@kernel.org, lpieralisi@kernel.org, joey.gouly@arm.com,
	yuzenghui@huawei.com
Subject: Re: [PATCH v14 7/8] KVM: arm64: use CASLT instruction for swapping
 guest descriptor
Message-ID: <aaBQbXnwKkAbIcAt@e129823.arm.com>
References: <20260225182708.3225211-1-yeoreum.yun@arm.com>
 <20260225182708.3225211-8-yeoreum.yun@arm.com>
 <afa3974d-0dc1-4472-ad3d-dbfa078bc9ed@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afa3974d-0dc1-4472-ad3d-dbfa078bc9ed@arm.com>
X-ClientProxiedBy: LO4P123CA0518.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::11) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GV1PR08MB10521:EE_|DB9PR08MB11312:EE_|AMS1EPF00000048:EE_|FRZPR08MB11164:EE_
X-MS-Office365-Filtering-Correlation-Id: fda4cc92-46f9-4297-001d-08de753e9f16
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original: Y+PeB728jX86C7E68EGpuUrcHhWdT4Vj7LYj2Ltn88U0IxxCUZ0fUMkz7tyL9CumXLIENDK+LWmNyHXbDzN6S/mbxMehWveR5iUxtAEgTm5opsgglUztpZ2kR4KXD388qUFtk4sEZumQMl+B2RxIgDurftyR5RJHGU/HDUAaNK+P+lHEUZGh2sJ4aEcV91vdLZ2VQIj0WQiWUraOF02RxCPbFb0YiK8V56DUFaUzol4zG+UDk/PLM2SgnsSnsDofCNe1UAALB1H+EP1dt5KHsIxnvNrlGgnNIhKyJlaJsjiUKR7yafUIYZwLjgaNE0JlsPGoYa8lj96D0mkQjDA9J6cbf/o5j/uawjbCURfC6fEvEnpSOh8OeUmO/B3QlZrMgmGQGLGtoot7b4fRV/+qfgZmjR3VgXBIfcM0nF9OCzFwHcj2uAjSXYe4JaUFEj2NtooQOwmkfmsL8B9+aoBhrc7A61m3eN+8Q46ug+8kyURAjuYgeJ6Dfz9eYJveZvXzBOd7NHzXmedH7VQWTmxs1oS/M2ELEDXKfIJA4Y7O9LzfF1CyTTktPNmjoJmETbvCq9VRgC7Lez5WGrGhxK3F2bMgl4s5FbremXrU4yDGFXszb7pn9QCAtjQdyBzJDSmDczuRm4XxrjmFJzBlA70q71ZS++QSRdFCfusgmRVBBafHQUY1GbitAXSjb8dxg0b2InTvUtYmYNIo6nACasOGkOmq6qPfSX2kbv6hmY02YnE=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB11312
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF00000048.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 27385ae1-eded-4810-fb3f-08de753e79cc
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|35042699022|7416014|1800799024|14060799003|376014;
X-Microsoft-Antispam-Message-Info: hmbNZbk0r8NL61u2Dw6CX9j9Wb16qQYSqcWafhT6egTfTPd8tKj1NF5QmDFMNLbuyuicTIZ3/l0nyPnIMEvUki7bEw2jQt7g0r420DBInVhNW0pztPDynz25u2lRnNTD6f1gKPP3puIO2anh8hrpmxPpNTORk3O7+Z9s/ZuIMr1wgvTi5z1Lar811APFmugJEzA2iFmkopkWtHMWsXzosvWBE2oOKC5xr+pr4E4A+bzfRQ9+IYEu/9lSSxNmK5ydM7e1UzgTUonXSRBVv5lXz21hy4lBJKkglw/xcrclf0iQWcuJJXFg05R3msMejJb412KFSpO4312NdIdmP73fXy8tG1CvATWcVae94O0Ldz+MRkK2THuLHIZLfDq10KmIV6onH23y73ujKXEdqxDcgWoF+Lw0QBqYr/g43fGJ9aVCi+dd170imiNr7h2fJR1uvI0FVU3DF4+6lkIVaGpQFWDMPTJ0b1+zWHyALlP/J9T/3VKOCw+zp4KJo6HxIXEa/6a78sRX4W3RCRpdbNdSbgTsmAPso8gFSYP7fBoXiSqMd8i8vI391wsHWe2LB1g2Eogxz+GyN6L/pz9XYw3Hbkp14I28y7EZpTvb8cBcSEy8jRDSX1gi2tBDmYCXmHfPSrmhFHU07+vgrL4pi4KHz+0EqLSZnMkn+8yLZeMNodFAcAaA9jKtZEZNdA8wmaB4TqY8v4TbtGcQQRGNn2iBe06qj/aUV37kmlnsb+BHXZJ0O1N00UYXmU99lx1V2LlueAhHhJWMOp/1KXQyHm+jSrdYH1QRn2wF4mbXvY6U8tOoiyOpPUIxYKk57rz/bOstV5MKOgnA1Sebyr2E5eaVlg==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(35042699022)(7416014)(1800799024)(14060799003)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: RSFWlrA62hu2rAClBtlleX68RwpTpnWMUAyspSqU/5g+211TKMjI50Xcl7PtA0ESssY3LCrhxZKMgyPLnyBePZqr9YJed4H44R0fsZxgWvx1/rm9bvvXDAZx6jueUH/FxohmAvTUuAg2iGONOF3k0veDem0SawBvU/uNgKPmkD0l5T2QVkMB+53uR8Xd8zdkhH6/hvR8ZzOxN20RMOkW8OmXWR/qcMjuRwCKqOM/YJ1ByWrn9/eZT7E9+1WtNqXTxoR0CFYcvYE/U1en5M0pe+3fYsCCc8EgjFsM/IJEHzKWEhyvqqESk4vmG9XrudXdITpTds8hmSy8dq3sClC0C7ngn5WXlPS8w7A2a2qO9FWmAyWoUVXS3Vvf4t5zj381L4OpVWT6Ws0QhFTQSn04/aP0MPJT4jdnDezQ+9ZQA7u547y/FMovD8H4Vi7TxHpj
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 13:54:54.9678
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fda4cc92-46f9-4297-001d-08de753e9f16
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000048.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR08MB11164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_055502_051040_427A4F21 
X-CRM114-Status: GOOD (  19.32  )
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

Hi Suzuki,

> On 25/02/2026 18:27, Yeoreum Yun wrote:
> > Use the CASLT instruction to swap the guest descriptor when FEAT_LSUI
> > is enabled, avoiding the need to clear the PAN bit.
> >
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > ---
> >   arch/arm64/include/asm/cpucaps.h |  2 ++
> >   arch/arm64/include/asm/futex.h   | 17 +----------------
> >   arch/arm64/include/asm/lsui.h    | 27 +++++++++++++++++++++++++++
> >   arch/arm64/kvm/at.c              | 30 +++++++++++++++++++++++++++++-
> >   4 files changed, 59 insertions(+), 17 deletions(-)
> >   create mode 100644 arch/arm64/include/asm/lsui.h
> >
> > diff --git a/arch/arm64/include/asm/cpucaps.h b/arch/arm64/include/asm/cpucaps.h
> > index 177c691914f8..6e3da333442e 100644
> > --- a/arch/arm64/include/asm/cpucaps.h
> > +++ b/arch/arm64/include/asm/cpucaps.h
> > @@ -71,6 +71,8 @@ cpucap_is_possible(const unsigned int cap)
> >   		return true;
> >   	case ARM64_HAS_PMUV3:
> >   		return IS_ENABLED(CONFIG_HW_PERF_EVENTS);
> > +	case ARM64_HAS_LSUI:
> > +		return IS_ENABLED(CONFIG_ARM64_LSUI);
> >   	}
> >   	return true;
> > diff --git a/arch/arm64/include/asm/futex.h b/arch/arm64/include/asm/futex.h
> > index b579e9d0964d..6779c4ad927f 100644
> > --- a/arch/arm64/include/asm/futex.h
> > +++ b/arch/arm64/include/asm/futex.h
> > @@ -7,11 +7,9 @@
> >   #include <linux/futex.h>
> >   #include <linux/uaccess.h>
> > -#include <linux/stringify.h>
> > -#include <asm/alternative.h>
> > -#include <asm/alternative-macros.h>
> >   #include <asm/errno.h>
> > +#include <asm/lsui.h>
> >   #define FUTEX_MAX_LOOPS	128 /* What's the largest number you can think of? */
> > @@ -91,8 +89,6 @@ __llsc_futex_cmpxchg(u32 __user *uaddr, u32 oldval, u32 newval, u32 *oval)
> >   #ifdef CONFIG_ARM64_LSUI
> > -#define __LSUI_PREAMBLE	".arch_extension lsui\n"
> > -
> >   #define LSUI_FUTEX_ATOMIC_OP(op, asm_op)				\
> >   static __always_inline int						\
> >   __lsui_futex_atomic_##op(int oparg, u32 __user *uaddr, int *oval)	\
> > @@ -235,17 +231,6 @@ __lsui_futex_cmpxchg(u32 __user *uaddr, u32 oldval, u32 newval, u32 *oval)
> >   {
> >   	return __lsui_cmpxchg32(uaddr, oldval, newval, oval);
> >   }
> > -
> > -#define __lsui_llsc_body(op, ...)					\
> > -({									\
> > -	alternative_has_cap_unlikely(ARM64_HAS_LSUI) ?			\
> > -		__lsui_##op(__VA_ARGS__) : __llsc_##op(__VA_ARGS__);	\
> > -})
> > -
> > -#else	/* CONFIG_ARM64_LSUI */
> > -
> > -#define __lsui_llsc_body(op, ...)	__llsc_##op(__VA_ARGS__)
> > -
> >   #endif	/* CONFIG_ARM64_LSUI */
> > diff --git a/arch/arm64/include/asm/lsui.h b/arch/arm64/include/asm/lsui.h
> > new file mode 100644
> > index 000000000000..8f0d81953eb6
> > --- /dev/null
> > +++ b/arch/arm64/include/asm/lsui.h
> > @@ -0,0 +1,27 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef __ASM_LSUI_H
> > +#define __ASM_LSUI_H
> > +
> > +#include <linux/compiler_types.h>
> > +#include <linux/stringify.h>
> > +#include <asm/alternative.h>
> > +#include <asm/alternative-macros.h>
> > +#include <asm/cpucaps.h>
> > +
> > +#define __LSUI_PREAMBLE	".arch_extension lsui\n"
> > +
> > +#ifdef CONFIG_ARM64_LSUI
> > +
> > +#define __lsui_llsc_body(op, ...)					\
> > +({									\
> > +	alternative_has_cap_unlikely(ARM64_HAS_LSUI) ?			\
> > +		__lsui_##op(__VA_ARGS__) : __llsc_##op(__VA_ARGS__);	\
> > +})
> > +
> > +#else	/* CONFIG_ARM64_LSUI */
> > +
> > +#define __lsui_llsc_body(op, ...)	__llsc_##op(__VA_ARGS__)
> > +
> > +#endif	/* CONFIG_ARM64_LSUI */
> > +
> > +#endif	/* __ASM_LSUI_H */
> > diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
> > index 885bd5bb2f41..fd3c5749e853 100644
> > --- a/arch/arm64/kvm/at.c
> > +++ b/arch/arm64/kvm/at.c
> > @@ -9,6 +9,7 @@
> >   #include <asm/esr.h>
> >   #include <asm/kvm_hyp.h>
> >   #include <asm/kvm_mmu.h>
> > +#include <asm/lsui.h>
> >   static void fail_s1_walk(struct s1_walk_result *wr, u8 fst, bool s1ptw)
> >   {
> > @@ -1704,6 +1705,31 @@ int __kvm_find_s1_desc_level(struct kvm_vcpu *vcpu, u64 va, u64 ipa, int *level)
> >   	}
> >   }
> > +static int __lsui_swap_desc(u64 __user *ptep, u64 old, u64 new)
> > +{
> > +	u64 tmp = old;
> > +	int ret = 0;
> > +
> > +	uaccess_ttbr0_enable();
> > +
> > +	asm volatile(__LSUI_PREAMBLE
> > +		     "1: caslt	%[old], %[new], %[addr]\n"
> > +		     "2:\n"
> > +		     _ASM_EXTABLE_UACCESS_ERR(1b, 2b, %w[ret])
> > +		     : [old] "+r" (old), [addr] "+Q" (*ptep), [ret] "+r" (ret)
> > +		     : [new] "r" (new)
> > +		     : "memory");
> > +
> > +	uaccess_ttbr0_disable();
> > +
> > +	if (ret)
> > +		return ret;
> > +	if (tmp != old)
> > +		return -EAGAIN;
> > +
> > +	return ret;
> > +}
> > +
> >   static int __lse_swap_desc(u64 __user *ptep, u64 old, u64 new)
> >   {
> >   	u64 tmp = old;
> > @@ -1779,7 +1805,9 @@ int __kvm_at_swap_desc(struct kvm *kvm, gpa_t ipa, u64 old, u64 new)
> >   		return -EPERM;
> >   	ptep = (u64 __user *)hva + offset;
> > -	if (cpus_have_final_cap(ARM64_HAS_LSE_ATOMICS))
> > +	if (cpucap_is_possible(ARM64_HAS_LSUI) && cpus_have_final_cap(ARM64_HAS_LSUI))
>
> minor nit:
>
> You don't need the cpucap_is_possible() as it is already checked via
> cpus_have_final_cap()->alternative_has_cap_unlikely()

Right. It seems a little bit of redundant.
I'll remove it.

Thanks!

--
Sincerely,
Yeoreum Yun

