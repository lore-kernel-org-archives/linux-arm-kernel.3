Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F407D262B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 05:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rVD6E+5/UjYsRvhIdIc/lxfzxf7Wc55OpzgCp1jyczI=; b=s2m0/PIzq/dWVTK8SvdcKVW46O
	AotE4pkzBN1pX9x0T+WrxwqZUDg4sbkNZcvFHf7P/oRn4yEWXyFzEoM1xRLRzX7gnj/ZDHlcRrm3B
	TGXFB6KppQ8iLDGBjS2wbRkGpPIhTv3cJKp4zAU2ZP935Fk9qrGoBesTKdcVgWXqhWkxGx4Vj1f95
	RnV/RwKd/l2TMCSTp+3ScwoA0setkrU1xWWWOivMtxTnc6TQEM9de5N+fbibnoo5/DTc2UTDHj3Ui
	do8CvBzN45pjkdWVn89o02L5pKv/vDscd4txLenPzn6Hw2r+4Y1nQUwR8ePRwjoBPBOxzAqZ27g1h
	Eh/m33eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viR5a-00000004v0M-0jFj;
	Wed, 21 Jan 2026 05:49:10 +0000
Received: from mail-westusazlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c001::2] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viR5X-00000004uzr-2SRT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 05:49:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P9KLfDWlXQ+OvnZljuREZdmqukS2vioqWtupmk0PoCFcO/LCPqQjXFNS2pEHJF646oiyOl4IdqFH2w+PmWaYA5AMnt6P/s0/foTT+siTEqpYPemVDnurGwniuSpvX3029NaeoTHyPrM8NHNKLuL9R6jGMV33zfNl1Zll8Lh7WFIaJQRQ1bj1rDxjaU1h4rnZqXUxpwzmkO6R+zAG0TAidTqp0t6KhzK/nn2U0IHeiVceIWMBnz074AxNGFqdM+x9+ZQp/l5+M1q1Lwb2F1/LtQuJszdi55th+DilmfVAwg7xZcw1QrHrMZONVtMER4KJOVq6cqqBtJFnenM4xyAOPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rVD6E+5/UjYsRvhIdIc/lxfzxf7Wc55OpzgCp1jyczI=;
 b=VyNUpEXUV6CZU7trmx0eAmtZwQSRxM83Aksk97G/7eH5Ke5N0VLlsajBpi4cJWkOq73qvD4a7mjg+/1VyPsjqiJNnPyPdFP4s6ldHNVT7wQLKR5Un3RqtdiWlRj2myUf70EW0tr2hwhsM59HBGqLb2J0O2DkuYpPdSpotWea8XhmXHZdS0fW89QkwP7FPXJgnDPbmV5588T14vXkGizV9ASDTayzmWCI7IGHXLnE6Y5YLP2KTTMSp+7WzTE5GBEtsywEZ9Rfgxb/UQZ6han56TSlJCtaRXUVB8laxM9zUs8ln4WuPV2kksKn0W86LcpipAQrBfpVSD/igB/rW7jspw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rVD6E+5/UjYsRvhIdIc/lxfzxf7Wc55OpzgCp1jyczI=;
 b=qUW8s4E/YRGZ+Kaxw6kCyOAw5EtOeZR7diZ4ql98trKPA69HRV3S/+dCYpiD3nRs5IrSIZ8rigol4O4zMkRJwXVcgAdTNPab17AKBa7KIuSEC8XGhnaT6SmqFyaql6vrbE/E1D/SRim7GUshFHv16tAwGqe5cQ+h2970lDYvlDM=
Received: from BL6PEPF0001641F.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1004:0:f) by CY8PR10MB6636.namprd10.prod.outlook.com
 (2603:10b6:930:54::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 05:49:03 +0000
Received: from BL6PEPF0001AB52.namprd02.prod.outlook.com
 (2a01:111:f403:f903::3) by BL6PEPF0001641F.outlook.office365.com
 (2603:1036:903:4::a) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Wed,
 21 Jan 2026 05:49:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF0001AB52.mail.protection.outlook.com (10.167.241.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 05:49:02 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 20 Jan
 2026 23:48:55 -0600
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 20 Jan
 2026 23:48:54 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 20 Jan 2026 23:48:54 -0600
Received: from [10.24.73.74] (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60L5moV92473911;
	Tue, 20 Jan 2026 23:48:50 -0600
Message-ID: <aafbe855e5ba4b1409e9ef71bf243e35afb6b76e.camel@ti.com>
Subject: Re: [PATCH] arm64: dts: ti: k3-am62d2-evm: Fix missing RX delay for
 DP83867 PHY
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Hari Prasath <gehariprasath@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
	<kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <bb@ti.com>, <afd@ti.com>, <p-bhagat@ti.com>
CC: <stable@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<srk@ti.com>, <s-vadapalli@ti.com>
Date: Wed, 21 Jan 2026 11:20:10 +0530
In-Reply-To: <d918d66a4fb7ae603eb1b67533fc0ae9cbf062dd.camel@ti.com>
References: <20260120061335.1497832-1-s-vadapalli@ti.com>
		 <6650770b-2e9c-4f9a-8310-1f335ffa69f8@ti.com>
	 <d918d66a4fb7ae603eb1b67533fc0ae9cbf062dd.camel@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB52:EE_|CY8PR10MB6636:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f7ea837-351d-4cdc-ed34-08de58b0c7fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dW1TOFB3bUFrdUo0Z1d0RFJaRWhQVkxFUTg4OFMvVzJhNlFjVzhseUZCcTNp?=
 =?utf-8?B?bkhZWWNFMk9YMS9LamdjTkUvcFlCcmIrbHJ3ZkRBeUx3ZXBtUm9raml0VE1a?=
 =?utf-8?B?eE9HVWRVSW9DR3Q2Tk1hdTlPR3g1czZjSG9jNTlmSXFxK2dmbzhKR2VMZTNM?=
 =?utf-8?B?L1NIaXVvN2pnVWNXaVhHUzNKaENKMjRyMngzRWgzRE1LczlPZUYvT2FxZER4?=
 =?utf-8?B?d2dYcy8xcUU2ZHd3U1hyTHE0YmdmSjYvcEhJcTNwZnFNRUJhMHUzNSs3TjhT?=
 =?utf-8?B?VDh1MG5FMXVlQW85OGxHSWF4ZW1DUUdQLzJsbEtPTVVQVVhTMGIybWpndXUv?=
 =?utf-8?B?bi9jM3FxMlpXcHhhSUlGR1hXQmFidURlbjhjTkdwOE5DOUtQb2owYnhVOEd6?=
 =?utf-8?B?UUxHdU1xcUs0Skp4Wm1kUHk3TFNTQ0UwN0pTL1NmZDNPNUZ5eE5OckV2TVNO?=
 =?utf-8?B?UW83alBQWFpzencrZEdybTVjc0dYdUl0NWtENzhDMUI2Y0tjWjZwWHVweGJ5?=
 =?utf-8?B?NEkyenJiNCtMRlNXK0pBRGIrTFhuSWV6eGxRcTB1TlU5SUpQbVpWejdUckc4?=
 =?utf-8?B?eFBhT0tLd3dGeXRxYU9RNTRKaGxBMDhsQ0VQRnpoVWppQ2VaN0xEeTN3eWJM?=
 =?utf-8?B?Mjl2VkVFZWNFSGdZem1zVGNBV1FEWGxGL2hVMEFTLy8rY2lsTjVrK1FTM0U4?=
 =?utf-8?B?dURJWE9aSUlLWkhsdmNlVElJZGQzNzIzMzd1N2ZaVC9DUVdBL2xYNFFHM1Zh?=
 =?utf-8?B?L0UzUW1uWHlnZ3RYWFdSbHNKMENmbTl5ZzNaRXJvckJEM0lLeDAvemFFWXU1?=
 =?utf-8?B?Z1lkaXFkdjZ5YWNiMVV4eGdpc21LRHczaXlCS3YxTllKZUsyTTBtdkJ1RzV2?=
 =?utf-8?B?MUJFNWJSVnVSTDRrUXBUcDJDS1JWK3p4UGRBcThTQ2FEVGJGNTVCaHNtekU1?=
 =?utf-8?B?Y1pkWklMRmZNdlJRWHFocEh1RHd1ZTNWNStPY0hvUU1MQnQvREM1SXZ2a2xq?=
 =?utf-8?B?cGlqR0VjV0dvaGlrRERkaTZGTjFpTlg1VE5XMjJkT2x4dElidUJ2Q3dYWnFq?=
 =?utf-8?B?VFFZTm0zcmdXZlFKcE1hM05vSCt4YzVrVTU4cEwyZXBsUWgzSllRZUlqbE9K?=
 =?utf-8?B?SDRaSGRYRExvZGwvMG1TU2liWm52VTQ3bCtlNEpsY0VLb3N1cnRSY05hNHkx?=
 =?utf-8?B?clV6bjh3QkRWMTNlRUljN1BRdXk2ZXdaYTYwd2dIZjVXNUF6alQ4TTIvT0Rh?=
 =?utf-8?B?RHhYMVVWV0owN1Fpb0R0Sys0THRuc1BDbmZCeEF0bWJkckdXamRVVXI2MWN2?=
 =?utf-8?B?Wi9qRmFzWGt2dnVGQ1RGcThjdjNRcVhZenNtUEVpSFIyLzhpbGNzRkwwRWxQ?=
 =?utf-8?B?bG9icWRSeTFOYXplcFRRa3dQWExvQzNpLzd3STB5QWR4TUNwTmozazMvR2JF?=
 =?utf-8?B?UW9mQU03dlNsZGZlN0FuOXZITWVOL25tdTdiM1A0L04veFl3dTE0OFdTQ0Rj?=
 =?utf-8?B?SzB0dDNieXZpV29mZDcydklhZHdMbDhsQ2RQZjdsV1M3Z1dSNzVWYTJMdFh2?=
 =?utf-8?B?OEZza2E2S1FycHNtTVRkR0N1MS9jcCtvU0dMamZPSzVrQmZhNzZEYmpDcCtz?=
 =?utf-8?B?aUtMZWIrSEphak5QQURBKzl0RUVsQ2k3M1AwOUVmY3Z6a2pSQ3dvY0lMOTB3?=
 =?utf-8?B?OWNqMlg5TVpvMWhOTFdhODg0S1gyaG9VTWVEUkFVVXFIeUk5dG9YSmJpb28r?=
 =?utf-8?B?TEt1ZnBkeDdTUkUrb3lZdlJ6aTZ5QjF2akZYUzdzU2tDMHpSV1pnTGF2Wmxi?=
 =?utf-8?B?L1JLSjJPNVRhY1ZQSVlGM3M1ZE1pa3lJSlpkd212V0Juc0UxY3lJUWw3clV2?=
 =?utf-8?B?SGZ2WERzQ3lSWVpyU3lQU0pDT1NEdTFRb25lcy9ua1Z2V1hTN2FVdUE3aFZt?=
 =?utf-8?B?VXNaUHBCNnlFaXpZUWhrLzVzYUduQmxETWJwR1RrdUQ0ODJjeVNXZVhuWllt?=
 =?utf-8?B?eUc1SG5icEhtd2NhVmRhT1Qwek5EU2dpUldnWWY0VXRPaXlMV1ZrR254ZjJD?=
 =?utf-8?B?WWIzOWJ2cDBIczg5MkdsRVMxdkxjVmlRVDFtQzFBZFRCeCt0VUJXWnVtakw3?=
 =?utf-8?B?dTQ1aklmWGFlSUx5RFdZclh0L1dnZDYyVGVsZDI0Y3NXT214MTg5VWQ5eUk3?=
 =?utf-8?B?bEFCc1dNajNyWGQ3REJvM0dBYXk0U1lOVzdFZTVhM3ZxV2F6SXZHVU1rREdK?=
 =?utf-8?Q?sqjC8k/Cx3CnrQUsDEcYuOBgeG3X5+QhU7is3DYdUo=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 05:49:02.4538
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f7ea837-351d-4cdc-ed34-08de58b0c7fa
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB52.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6636
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_214907_624615_03BB3357 
X-CRM114-Status: GOOD (  22.84  )
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

On Tue, 2026-01-20 at 18:42 +0530, Siddharth Vadapalli wrote:
> On Tue, 2026-01-20 at 18:33 +0530, Hari Prasath wrote:
> > On 20/01/26 11:43 am, Siddharth Vadapalli wrote:
> > > MAC Ports 1 and 2 of the CPSW3G Ethernet Switch in the AM62D2 SoC are=
=20
> > > both connected to different instances of the DP83867 Ethernet PHY on =
the=20
> > > AM62D2 EVM, with the 'phy-mode' set to 'rgmii-id'. The DP83867 Ethern=
et=20
> > > PHY has to add a 2 nanosecond
> > > ZjQcmQRYFpfptBannerStart
> > > This message was sent from outside of Texas Instruments.
> > > Do not click links or open attachments unless you recognize the sourc=
e=20
> > > of this email and know the content is safe.
> > > Report=C2=A0Suspicious
> > > <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!=20
> > > uRdqXRfPtm07agZk_PPjvDYD9oe_mpoIkkjINUyRhGSu--0mQdy1pi4MPng-=20
> > > ix3RK2L1V3y4DrnTdaCm8zj7QGx0QX2i$>
> > > ZjQcmQRYFpfptBannerEnd
> > >=20
> > > MAC Ports 1 and 2 of the CPSW3G Ethernet Switch in the AM62D2 SoC are=
 both
> > > connected to different instances of the DP83867 Ethernet PHY on the A=
M62D2
> > > EVM, with the 'phy-mode' set to 'rgmii-id'. The DP83867 Ethernet PHY =
has to
> > > add a 2 nanosecond delay on receive (from wire) based on the EVM desi=
gn.
> > >=20
> > > Since the device driver for the DP83867 Ethernet PHY coincidentally a=
ssumes
> > > that the a 2 nanosecond receive delay has to be added in the absence =
of the
> >=20
> > 'the' can be removed here.Verified this claim on default value in the=
=20
> > driver without this DT property.
>=20
> Thank you for pointing this out. While rephrasing the sentence, I forgot =
to
> remove 'the'.
>=20
> >=20
> > Reviewed-by: Hari Prasath Gujulan Elango <gehariprasath@ti.com>
>=20
> Thank you for reviewing the patch. I will fix the commit message and
> include your tag in the v2 patch.

I have posted the v2 patch at:
https://lore.kernel.org/r/20260121054552.1650926-1-s-vadapalli@ti.com

Regards,
Siddharth.

