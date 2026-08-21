Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E7FC5DF89
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 14:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yeUieuDcnzCh6QGnflgI1ey712YajYKz0Q5pu+TC1mw=; b=ncVXCH/GIIm1NzVSfGdGjbAO3w
	Wr3ASgwPcKKR6t169D8EezIpy7JLYiarisbkhCqvyxC7B5W6GmF7awvJtT6uK7QvxAha87eMOAj90
	iJ8YmNX3mJ6RZfN7JwUuneRZA1vzhBLUITdgIqqoktuY6A+/Qic/4jTG/nNyuwKyFz0PEvO8OqbAu
	Ion0jMW4gh3nhc8BBdw6LozhzxOslIal1zCmFsexqSHs/NWiy9iwPXwg3cidol412B1/tzkaBpc9T
	JTDfZ/JTwtYzNRjNjXBdYZ5QnqHk9LkKwD995NpcQYIw9jzBhqa2p+fkuP39H1gYtndAJqCB4PGIG
	HGiZivJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxQh7-0000000DbdP-3D1x;
	Fri, 21 Aug 2026 14:58:09 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxQgr-0000000DbWV-408F
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 14:57:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oyfFczMZVZuj2MJVZGSgET/aJ1bc75zYIv+sKrU7s34ckOwCBQgp0ynfckbVjCUEmwa9ZyP8eFTQKDXjX3aN+OdHP3KuSVAsDc0AftRxzioOJAenTFbxKCGz7myHxEhtSolyfWJZ0ravCys6JkXjLndYFr9+nXraMK01sJJm+P8/lJDmU4L+reByo/CJi0jbbPEVs+5XCT0digOHwsmFvH+kz/rHaDYmTdoOO15kwbbeJmpr/DYMo6Kfw48ngKPnKmcK9FaBXIPap5BqBSv6gQ22rGfdZoi7PyCc6j8hyz+iXnnWKXX7YC7nBIz+p2G1hv8aZGfHdb70NQI0aon6Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yeUieuDcnzCh6QGnflgI1ey712YajYKz0Q5pu+TC1mw=;
 b=htdLOKrJg/AQ3KoUjQP0lBS49khOJG581DZUwj9Y1NwTmvqP/9dU3F/GeJDFLeOxFP12qCXQbVNePPpzGkdZqiQx+nzRb69vNaVIVZzc7YBuAu4mNTZLGyML3+sX+ep7nnyPNT4qt9RpHS2U2xgPVnW4OXRyuG56EtDtnoSSIGnk5kXEOw7aGHTm6EOf66yf+z+x8OQiDeWoK9755KPEoQqrGO512plBWHAW0ihTpViS4ssTzPbaOoXd6loL4odqNe1ZNf4vpa1uir9TBtAuGyIU8eByvAo+tOL3XQynxZOh1ss01dZIlsmGGwfjKIKJASpp2XwRxtzhix3zSr3J/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yeUieuDcnzCh6QGnflgI1ey712YajYKz0Q5pu+TC1mw=;
 b=CELpnvtYI3D2kwkLcVUm2vczGdvN5RgWqwjcS2aP8FGSfIyXC1H6VcL3rCqqwbQZ/PmGHjg9ptJem5w3JJYX0sDKEE5+q2SxcjEbRZ0NTU8qp1H+O/6K2hEXPub5UywfkcvIaVn0pHRcqrVHw8wLBNXBi2obn54uq4bUQ2lITXyFL/9tbSeblV0deepSIeBNyDWhqYFPC6ACSvoq97EFanueGUm/detzRdYcjbcKz6JmB6k8EFvatq4LIJEPsjjgpnvaNzbwfxfTxzqaf6jL3E0fxzaIowvAKjgD2XXi8Nsd4ET2dlm6xFO1bvdwwGRxdsixkFaMtd8FuotIZvbxfw==
Received: from AS4P195CA0044.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:65a::7)
 by DB9PR10MB5139.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:330::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 14:57:43 +0000
Received: from AM4PEPF00027A66.eurprd04.prod.outlook.com
 (2603:10a6:20b:65a:cafe::af) by AS4P195CA0044.outlook.office365.com
 (2603:10a6:20b:65a::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.10 via Frontend Transport; Fri,
 21 Aug 2026 14:57:43 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM4PEPF00027A66.mail.protection.outlook.com (10.167.16.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Fri, 21 Aug 2026 14:57:43 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 17:03:19 +0200
Received: from localhost (10.48.86.251) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 16:57:42 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Date: Fri, 21 Aug 2026 16:57:39 +0200
Subject: [PATCH v2 2/3] ARM: dts: stm32: fix vdda supply for onboard hub on
 stm32mp157c-ev1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260821-usb_fixes_vdda-v1-v2-2-23cc919b59fb@foss.st.com>
References: <20260821-usb_fixes_vdda-v1-v2-0-23cc919b59fb@foss.st.com>
In-Reply-To: <20260821-usb_fixes_vdda-v1-v2-0-23cc919b59fb@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Catalin Popescu
	<catalin.popescu@leica-geosystems.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>, Fabrice Gasnier
	<fabrice.gasnier@foss.st.com>
X-Mailer: b4 0.16.0
X-Originating-IP: [10.48.86.251]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A66:EE_|DB9PR10MB5139:EE_
X-MS-Office365-Filtering-Correlation-Id: ee47aa48-6f78-477b-33ad-08deff948e0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|7416014|376014|23010399003|1800799024|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 3yA9i1wyRWttphOpK+LIL8nHAYMSmPWNt187DP+V6amwe+GmwctFrA8EYXNwygf200w+3YvS00/hCdtHi2PTiSI4U6Qx05/kyxaTqzRT8127qfXnf9SOT9R3t3u6V2PTvifSc/yLFGuoj5QreI6DChfpXHNtVmWWBdG7c16pS4qFnD54ZjCDZ4h6hFypA9r0QPFhpLRFB6Xw5qHMg8GJVql7Rqe+sGmnomHc/OcIF866+zN1pisGvVHEa7uPnMsb28cJdYJlS094lIAkX7v9i77Ku4Fj2lXcIH06FhbU8DSR2xEff4XIriwTSlbin0A/PrHwkaP3CIsfpryN0tc9gCQWlYznkqcqcDtKmCZDkqgUkX/bPnuLX7kzwBJTwyCKnFhzjLjb/7Y+3JrikxqLbjFUEliU8kWaNx/yN2UqFkt4MwhKK6a3IVEp72OaiCFz4H1lC/hmz9C9ww5KGU4fHzi21mE9jBUqtEeiJrtfjXfXx+pcVg74TfwCzt4Hbq2yDAcYxyPZxrM6ln24eEUEs3MgvnPVr3vikidYLS+5l3bQyB2Z+OnWEfjtkwT4NXttSWCXuZkED5CK99OAyKpXFFEnl8xVapZxo3iSKdVjDFNRAfGW6LfCGtVchXQWwIsqfpwSKoeVeUNfCwzqBOioEJ23AW7uub3Q3pUEClY/YK7rA4sQwTXF/SzjuEfWQXGbpRZoCUP5wFxmkOtfeR6UVQ==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(7416014)(376014)(23010399003)(1800799024)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: bFV/CG5Z4WAr59TiLyP9GsiPt7pjB0rSJK1f0W90S7YohQ+ubUdY8YJi5Vj0upF6IF871b1p21iI2T3+tcYwYBd3pWjB5wJewCokYgmfe+GPkdmviBXeyDzHhyIFDdoo5DPOAePpBmbBJjxbiGdChOOZRn399AJnmrw0nkz1NzGtCfvsrknIfOtJzgVYbxnyCF8z/PGRTVX9HSPfwqGcfNtfJBKwZbueOpzcZtnEYou+xEM6DxDBOGYXSYPCLp071JQeuZCKgSHYH34aY+p8WEBv4XoX2ZrW1NMBSAzt4muV3JqUIi4dZ74D5V4+J14jhKbumPKmaBnQPoN0GutjN2xQId+e+7fSASosqn9qJgh4VBT3GrxlhL1KHRKgj0h7Dppktj/0tr2S4I992QF5ahE6YeC+IZ3q8tONH1r3yzEhqsoQ5Prqah6mAtlWf8Z+
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 14:57:43.5782
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee47aa48-6f78-477b-33ad-08deff948e0c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A66.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_075754_018258_F82590EE 
X-CRM114-Status: GOOD (  10.05  )
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

stm32mp157c-ev1 uses Microchip USB2514 HUB. Since vdda supply has been
added, the regulator framework wrongly associates the 'vdda' supply
dedicated to ADC, so the wrong regulator is referenced.
Only the 3v3 regulator is used to supply both the digital and the analog
part of the HUB.

Fixes: 673655f7944f ("usb: misc: onboard_dev: add vdda support for Microchip USB2514")
Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp157c-ev1.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/st/stm32mp157c-ev1.dts b/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
index 0e65a1862eb5..ce014561a8ac 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
@@ -439,6 +439,7 @@ hub@1 {
 		compatible = "usb424,2514";
 		reg = <1>;
 		vdd-supply = <&v3v3>;
+		vdda-supply = <&v3v3>;
 	};
 };
 

-- 
2.43.0


