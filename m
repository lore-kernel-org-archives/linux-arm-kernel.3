Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 494C9FD88DF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 03:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=72OSiPvKpBMnlPHRB6MqItrg00fRyKePcmUrXVqZhQw=; b=ZeAdIEvnU5WWItgdsngZJduHGm
	uT5+DchCXMmwqzZJAwL8tpo3ibmoaflzfpe21iBya3Lv8epX4Q5vx/BDSs7HXxeTNn03mEBqRhs3K
	RYZz7pwz92LpsIvtx2HrLL/miJiFr6eWGnswLZI4z89hkFaD7GAEV0XCjlhLn853z/CLIgeCr7l7x
	NUDqFNokF9GTXBrHecGYVsMF+SRb23VIjEMSlCofZqATbEy1JJT1IZw0o5cIFSl0PkwHFvvYF+RiW
	/57r92R+qpIWspm4xkomX1LMfe08EipduzaehtzGQ7ZbxtUeOsa4iImzORNduAAhoXytGKZ4prHbx
	xSITGaBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w09vp-0000000AaqS-0Voo;
	Wed, 11 Mar 2026 03:08:21 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w09vn-0000000Aaq2-05Mc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 03:08:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rnwFmmfKd7FV+VUn+zLffOtDFOm0GntvvxTcK4ONPItAoT9Vu90yuoQhSqz+iEaS2BdMZKsO4DBkdgubB4fxy2O7aTv1y2V0ri2AEHkV6Ox96kERLdvriw9MT7tZ+Pjwii0MR74L6/8JC/jwFviAnrwVFT5McIIn08RYTtMH+pH4ehY+EYlAxk2aEfoqnlApc6tf3Tr+QaNypPurtIP343LvyFNWkk5kBu77qEPSEWCHeqLrnXDHuMGipC4G/B5XLVW/Ntf5y+ULesqiuhSwISJdsr8dnL8YU0ie5RjlfDq/GnfLd0lNpOsJjFr//6xoZ8Wdg86CBkcK+hfovoWV8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=72OSiPvKpBMnlPHRB6MqItrg00fRyKePcmUrXVqZhQw=;
 b=sZAEYjwC3m5my+8ewXmLNJoOKQhiQHYrfReeD7Qk0qTKZLrfFgaGCDLyO5XzFAEaxU19dGLDSfZlG3d3bGUhM4gGG8sNXTkj6E3+sAKDOuSUt7wtHhuGvLzgUbCt4HncU6W8VJ8J7iGjsL46BwBteMUWT1Kk0tj/eHhygfSPFMvk1UG/iTFPIZGzi7iTzwTMo92mastpk60N0t1AghnxKIYeEjPcNgucKT5oZUXxPpHEYFggBa6v6J1NiEWZItOTGEF2YWH7FSPLZ98kiLnXUQ6pX4BXV32Jp8uqoSZPV0MoGbcCryP+2QcZUuEpSyvLcX7Iu4+HmlzvRLiNgK5mlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR02CA0015.apcprd02.prod.outlook.com (2603:1096:4:194::16)
 by SEYPR06MB6506.apcprd06.prod.outlook.com (2603:1096:101:169::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.24; Wed, 11 Mar
 2026 03:08:11 +0000
Received: from SG2PEPF000B66CC.apcprd03.prod.outlook.com
 (2603:1096:4:194:cafe::91) by SI2PR02CA0015.outlook.office365.com
 (2603:1096:4:194::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.26 via Frontend Transport; Wed,
 11 Mar 2026 03:08:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CC.mail.protection.outlook.com (10.167.240.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 11 Mar 2026 03:08:11 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id AB54F4350703;
	Wed, 11 Mar 2026 11:08:10 +0800 (CST)
Date: Wed, 11 Mar 2026 11:08:09 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: Gary Yang <gary.yang@cixtech.com>
Cc: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<p.zabel@pengutronix.de>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<cix-kernel-upstream@cixtech.com>
Subject: Re: [PATCH v10 3/3] arm64: dts: cix: add support for cix sky1 resets
Message-ID: <abDcmbRtdFsPXHiQ@nchen-desktop>
References: <20260302064407.1914014-1-gary.yang@cixtech.com>
 <20260302064407.1914014-4-gary.yang@cixtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260302064407.1914014-4-gary.yang@cixtech.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CC:EE_|SEYPR06MB6506:EE_
X-MS-Office365-Filtering-Correlation-Id: a7d28ca3-5c1d-406b-e0f6-08de7f1b6db3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 0N4phOkbjgdboawYrMgcSQHEwr8cTqKDAUKCyLMObuOU4mzT060LJjC4p5j4D03N6lkPw9oJAX3TEQjAAsEa1+frCWGrHC7I5P9DoXwHKlhn6k81pVCekfWz4NfrPFR6eviWyy0c8smRs+fxXYSQ/vLIoYpb/c2VYXvPQXsEDFJQm/0p9casWP2Kfvr5LnWjAwOTLG85I3uXW7mCAC+MCUvbBN/jp53546KjDbERlVWnCNb2Aw3xK4xwt2dqMu6RGrnujOBTfwtqww19L40B8KMIU7etHm05lsh4BmvgYRANfJkDdqkiWVhU0mO8+dLcWnx4MqETOFYMZ7TilWptgqlxwjyJfhG7XTXJvc2VbnAYt/0YHaM7C8koMetfV8cj3KcS64GtjSNMnaa3Y4P2+5SNWERJY42hAXepRiscE9dlRqoKYR8d2KI5csLHA9nIr/EzhpTVxL3C9d2OtrwwgePYAQ+LiZT2ZoY9ClLXCOxdzrpSkZTcKPfwXMnTYZKDET+hB5TiAfDYwcfGSERxUiALvzO1GHSprFQTh/y2hBk8B3fCSZg+SZLq6n2QvX5LPFAz0A6a9kKM673Oi5GJpVqEGIr56mnD8epC09j9BoSML7RTrhyQnTlnktWv5XK7IN4l+OQRfTPE/tMxGEyU2STvnpb6gXpxUwbIE0eSD4cDHXaR1MPyFLO64bZkPhiaEGIa5+w4EjM6C5NgS/AWj4pdz2zZhNcEglIe8/vfB2MdYhU221gcJbeVj0HStZkr94GJw/ZT8mOWmA0qtLDoXQ==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Hpa3/F85cZhyibzHtQVD2ZboDdFDOCaFaBbLkAchvbF79UYmHoSo/ou+QC4/T8mgKwB9VZhmt6+r8x3XYu+rkJFmS5LzX9g66I7axnWPpNiOAO3vcbyByw1OxxHnn2NfEYWVO2Q30hZugElPjFIqcujGCZF5p+YryanI+INrw7MfM4hoswd3KRTBzg0dObSLOO3+hiCcws8Tm/HVRNDEPm7ZhbbaaXQReOPuE5nGhcCOiQa1UkQVaRdEdKNKRuz/wg4mHKxX6ZD9hbb+MH0f6yiu771zn8b+2B4jqc0m6cclOZddLhpyWhtLIg2OFnp4dkUgzuj4e6O5bmyetDEPrinCBgbSUgDH/nFulbn7gFwAVT9Wd9JG4pdZmUCnPtaqahJMhH3LMOFEPo3mi4vr2HHV1YF7EtEzGTUCc1kqaIHdPziylFCbTFwNFgj+FsuF
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 03:08:11.2866
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7d28ca3-5c1d-406b-e0f6-08de7f1b6db3
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66CC.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6506
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_200819_063787_68EEFC26 
X-CRM114-Status: GOOD (  15.16  )
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

On 26-03-02 14:44:07, Gary Yang wrote:
> There are two reset conctrollers on Cix Sky1 Soc. One is located in S0
> domain, and the other is located in S5 domain.
> 
> Signed-off-by: Gary Yang <gary.yang@cixtech.com>

Applied, thanks.

Peter
> ---
>  arch/arm64/boot/dts/cix/sky1.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
> index 64b76905cbff..a28b877cced2 100644
> --- a/arch/arm64/boot/dts/cix/sky1.dtsi
> +++ b/arch/arm64/boot/dts/cix/sky1.dtsi
> @@ -348,6 +348,12 @@ i3c1: i3c@4100000 {
>  			status = "disabled";
>  		};
>  
> +		syscon: syscon@4160000 {
> +			compatible = "cix,sky1-system-control", "syscon";
> +			reg = <0x0 0x4160000 0x0 0x100>;
> +			#reset-cells = <1>;
> +		};
> +
>  		iomuxc: pinctrl@4170000 {
>  			compatible = "cix,sky1-pinctrl";
>  			reg = <0x0 0x04170000 0x0 0x1000>;
> @@ -568,6 +574,12 @@ ppi_partition1: interrupt-partition-1 {
>  			};
>  		};
>  
> +		s5_syscon: syscon@16000000 {
> +			compatible = "cix,sky1-s5-system-control", "syscon";
> +			reg = <0x0 0x16000000 0x0 0x1000>;
> +			#reset-cells = <1>;
> +		};
> +
>  		iomuxc_s5: pinctrl@16007000 {
>  			compatible = "cix,sky1-pinctrl-s5";
>  			reg = <0x0 0x16007000 0x0 0x1000>;
> -- 
> 2.49.0
> 

-- 

Best regards,
Peter

