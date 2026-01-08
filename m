Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5EDCD1D482
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 16:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=THMl9mCy8uKrPnPfTgnNsSDd8y3Djyoylay12612vNU=; b=bAk1TVfMonZ1SuRbmebfXWMcGA
	h3x78PDBaJ3IlYogTAtyDfM6LaRh24MJr07FTvDJugTfiIDpKXdMN2cfVyXhhsO5RSq5PuhbvWx/Q
	Pl5AdLsQ0FFxtMEZbmJIi9ADiexR3kdeMo6HuzR1S/61Vn9ROHsLouEIMsd0u6gN0zuB1ngXVGNMl
	QB4K5gZmoDHGp4b/AGNRRhBY0t/IrqrJrYm4S/qBydl0cnSOBPEFsy5kLwOinTUAAjZzQ+uWOJqVX
	atM1Xk1LiTAn5gNDfgOJSswKjLOrpnV5yLaPg7ALk27qXR4Fz9pIj7bNJc6qkqDBQRRwIgtHXx76D
	VxVepEXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdt60-00000000Bge-2LTM;
	Thu, 08 Jan 2026 16:42:48 +0000
Received: from mail-eastusazhn150120001.outbound.protection.outlook.com ([2a01:111:f403:d900::1] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdt5y-00000000Bef-1Som
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 16:42:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t1gWqDsgVe02c3mLd8voYfTwWOq4mPGPC6GQhijFhOzEw44x1Ss7Z6X7gbbVc8gEPl7/s4IODSStZVhw5K5ADD8g4kWyw4CmiuAgce42tpbpR21LbJd8CTWY0WVRXtTAhxwP02CLw0Cfe21VN/UBgFTt6mS2zzXLxHdQDt2RkgRyN+xofxnhggRg/DPQkq1BiGIXdDWkAPuScpaNy1w0CNBML1yQxQ7riFiNj+EJ8pWnxZeT8ZOLIBhN1BcGEropWZXk3d++YhaHKmvxoNpIAcjvXAQm7400G8Lvufab7DKwi58i+oy2I0dScESDMVxtEE7L7MkazPUQhqBIJkshQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O8gfuI4yVfipe+EUiqlVxwVUFRxmt7HdZweeji8dJVU=;
 b=W0iem1BgH4dyVd7d78VKYafNd5xeJTbIPBCbjlrFt4kYqU1iMFxeFJ99ziRnWTD18YcnwKIKl8lUZNVhJ2ttW5h1cVQz4zSf8iXY0ec+GJpb+Xbxjlkz1bvdhLuWKJIP89REQWZTM5LW5cvZgpIibDVuncT1fDsU9IAB4VAfy7LeUPWJE+DtNQGiarpN7FYESnhEvswhUJkwbVNVQblhF5iM8RtQgYSdPof4VuXfbuuJAJrykG+TPkwlUpMtSZ4nru15hMEptPGIfVGHubH8UynMV1lDHcAXNvB5ObpZpGAA7nC7hBQ1cOuRj5qy34EOZ1JIiy5mV87fcRbepv0Cdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O8gfuI4yVfipe+EUiqlVxwVUFRxmt7HdZweeji8dJVU=;
 b=sCgh/EaQBM+yxs0RQ3iwR+TU74dTTcdnvyaJAM9ulUYLhocJon5AHoY+LGjOz59DPw2vY8zDR0K6Em611bSOZUmh1JDDXxrufoUlRzGfQ3jew3JNKvTnIULfRbCu1sNfIHzyQn3RTEUWi05zV1WFo3RVaYVk5Eu3IRjUQpLdV7I=
Received: from SJ0PR03CA0009.namprd03.prod.outlook.com (2603:10b6:a03:33a::14)
 by IA1PR10MB6123.namprd10.prod.outlook.com (2603:10b6:208:3a9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 16:42:40 +0000
Received: from SJ1PEPF0000231B.namprd03.prod.outlook.com
 (2603:10b6:a03:33a:cafe::b3) by SJ0PR03CA0009.outlook.office365.com
 (2603:10b6:a03:33a::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Thu, 8
 Jan 2026 16:42:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF0000231B.mail.protection.outlook.com (10.167.242.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 8 Jan 2026 16:42:38 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 8 Jan
 2026 10:42:25 -0600
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 8 Jan
 2026 10:42:25 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 8 Jan 2026 10:42:25 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 608GgP4i2677725;
	Thu, 8 Jan 2026 10:42:25 -0600
Date: Thu, 8 Jan 2026 10:42:25 -0600
From: Nishanth Menon <nm@ti.com>
To: Vitor Soares <ivitro@gmail.com>
CC: "Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>,
	"Dhruva Gole" <d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>, Kendall
 Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: ti: k3-am62a7-sk: Disable mmc Schmitt Trigger
Message-ID: <20260108164225.rtjhnkqzhehnji32@bunkhouse>
References: <20260106-topic-am62a-mmc-pinctrl-v6-19-next-v1-1-1190ac29aadb@baylibre.com>
 <49bfb30f71eae0844676e6b545d67739b6d79539.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <49bfb30f71eae0844676e6b545d67739b6d79539.camel@gmail.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231B:EE_|IA1PR10MB6123:EE_
X-MS-Office365-Filtering-Correlation-Id: 10370b15-46be-411e-573c-08de4ed4ef4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|7416014|376014|1800799024|34020700016|34070700014|12100799066;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?scHZpY9V+b4Np8KtXaMyhOFVq0iqA1pty1DOmT/AjhoGDB7gWvob4O+IcX?=
 =?iso-8859-1?Q?oqjTGfwmRy5P863wGsc0Dp4q8hgMQUGKSU5tyZxO8CPD1S3To8UZv446dH?=
 =?iso-8859-1?Q?MbprgBXQgwx8bLLsgav3DTz+6TENky/mDJ0aypZSTtpB5D0Ogdm+RfDX7y?=
 =?iso-8859-1?Q?4X9l/orMvv2iWYv2tnIgK6SDMXXwbRT84I2XMt0CX47AZR7tBJYVaBQbXH?=
 =?iso-8859-1?Q?akESK2jRLZwoQCulM+2Z7NbRTXsa6U6aN5ejWEFBI9dBdeuMsgofdN+qX2?=
 =?iso-8859-1?Q?2Amvo1Oesn3wK/uTKIH5OoH+jKTegjxxBHtwdeynHLonEf/jQsvAB2BrUI?=
 =?iso-8859-1?Q?zUMM7+uA42COudOQRTmQN6b2YE6vWsZ2cEEhvdrRHO0Gqw15tXXj5MgaBl?=
 =?iso-8859-1?Q?VMS/Job+ieK6RyXcDv5jWqjt6aHQBOG8EDJT7R+IFueBi7fVqPrimASTan?=
 =?iso-8859-1?Q?gal+t/v/bBYRiYLRKwLKzp3+yXIBl01cGOAAOkzQJOCLHaCf6FgW781Bgz?=
 =?iso-8859-1?Q?0nTAJrTlKKkxq6a3OAn/NkN8dtehcfu77vPdLWXMibznT2DG7g687HyUcS?=
 =?iso-8859-1?Q?ppuCcOELb6tn6iOx1+xKH9EmZQl4LuL5WMB0EVYjTCPLgDMDNw5plNqDA+?=
 =?iso-8859-1?Q?xb5JQ7x9xIG9zeWLGB10OrPXE9tRYEZ6kz5lhOl8cDMuLA+Ongovi7ARmQ?=
 =?iso-8859-1?Q?82KtenbwiD5S1FZf11xa5uAMRpKCgJZ+zm1vnn8eqvAuPQNGv5rYMrKEQg?=
 =?iso-8859-1?Q?7JV0pBWnZsA/iFWQZ6Zwqsq7q87GBHHA1SSR56Kh1cWw1M9BowvCYcMODS?=
 =?iso-8859-1?Q?LZVXDgioOrHjHrPcpVBUG+x8Wi7cjBfAGeO6rAnIDc5RL5mo1ImxPW/K8p?=
 =?iso-8859-1?Q?7fE0J+kxDk6M8HkedFHCDTbwwTybjK6JhXIFW2q34XCZfvVdL3uamCXg4D?=
 =?iso-8859-1?Q?5FDnijHzZH9AtYzYhw3XSr2i/fu0QEo9YM8mZUu23eNCzHZXkTsYcV+Wew?=
 =?iso-8859-1?Q?yfmmNarNTB0slmROBSW0baHiGkF5mAmvjIgh1d/MDJ0O69SCKAvFW6HkIf?=
 =?iso-8859-1?Q?m2G5OGvUS7mYpZ7BwV6DqjuqyEtQ96XIbJOl3GJiqVBW+0dF5nEC3maURV?=
 =?iso-8859-1?Q?RHQ9f+477d1cAYbqO+pQQOa8YiiHD176Luvu4tOY9wyJVdfoRuY/4wFOsD?=
 =?iso-8859-1?Q?P9joTC9UKkVU3BQwYyOQFsfmA0jFWTrcnINy6YVuIeeioCcGR9PkT1Su+W?=
 =?iso-8859-1?Q?RzFS290eqm+2xBjMZHtvUjgMWSRkuWkX2+69+JJtrZxd/dTwT0zrZAsWMb?=
 =?iso-8859-1?Q?syT3ga05RlabjTFSAWz2RF3jp5iVVV1Ab70Vxtnk7AnOJmR02FSTMbWGPb?=
 =?iso-8859-1?Q?3KbR4oZKmbEc7YdeVeiOY1FocYIi8gTiK4FrgKjAkgzBD9lCI4F3ZwDIdG?=
 =?iso-8859-1?Q?NsEnQSc1meG78VW1enQt6NKVmXRp5iivbgdLoolkziSUipFrDq/gTxF8WC?=
 =?iso-8859-1?Q?HhMYjhOIxWbe5OYv6nfRsW9tcJwoOWWw3u1Pn8YT148Ie8o5Er+GMnUFkd?=
 =?iso-8859-1?Q?tgxYBPFgS6UOjlNYJV/2u8bs3qgcHoq0mEnlK0lNccfrg6y6dWp4GOp5ts?=
 =?iso-8859-1?Q?jmDuMzTh/TPjby5VZ7huX/F8NXwj6Owq36?=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(7416014)(376014)(1800799024)(34020700016)(34070700014)(12100799066);DIR:OUT;SFP:1501;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 16:42:38.6835
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10370b15-46be-411e-573c-08de4ed4ef4a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF0000231B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_084246_390526_A92AA822 
X-CRM114-Status: GOOD (  16.46  )
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

On 14:07-20260108, Vitor Soares wrote:
> On Tue, 2026-01-06 at 17:22 +0100, Markus Schneider-Pargmann (TI.com) wrote:
> > Remove Schmitt Trigger from mmc pins. With Schmitt Trigger enabled
> > u-boot SPL is not able to read u-boot from mmc:
> > 
> >     Trying to boot from MMC2
> >     Error reading cluster
> >     spl_load_image_fat: error reading image u-boot.img, err - -22
> >     Error: -22
> >     SPL: Unsupported Boot Device!
> >     SPL: failed to boot from all boot devices
> >     ### ERROR ### Please RESET the board ###
> > 
> > I bisected this issue between u-boot v2025.10 and v2026.01 and found the
> > devicetree merge to be the problem. At a closer look I found the
> > k3-pinctrl.h changes. Disabling the Schmitt Trigger fixes the u-boot SPL
> > failure to read from mmc.
> > 
> > Fixes: 5b272127884b ("arm64: dts: ti: k3-pinctrl: Enable Schmitt Trigger by
> > default")
> > Signed-off-by: Markus Schneider-Pargmann (TI.com) <msp@baylibre.com>
> > 
> Hi Markus,
> 
> We're seeing a similar issue on Verdin AM62 with U-Boot 2026.01. The
> board has complete SPL boot failure with no output at all.
> 
> This occurs in the same version you bisected (v2026.01 failing).
> Could the Schmitt Trigger changes also affect Verdin AM62?

Side note:

There seem to be multiple issues playing around in U-boot regression.
Please see
https://lore.kernel.org/all/20260108141233.GQ3416603@bill-the-cat/ as
well. There is chunk of discussions on #u-boot irc channel. I'd wait for
U-boot folks to settle things down

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

