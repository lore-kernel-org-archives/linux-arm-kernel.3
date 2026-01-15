Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09771D3CCA7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 03:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dEHDhBI4qFLSJe3zHxjBfTF3whDXUB8GmbWHJQRx7lk=; b=QWO7D6Q3lZUraJCYYee2Gp3KI8
	4gZyp8Em4oGh8cjEuntbk1uTNJdQbWGllPC3OLA2gY6n1IowldjFv1EbCGvhMgKmJvPK8Lo1h4seO
	s2Ufs19AxVvlpvGQG0GMKgPQSa8PdkfiOqHYYIucBiISPN9kZe3boLwu1lMcsbNkQtG9kramdW+gE
	PhGtX4+2ryuhzQpOixrU+ytfic2GBF5kHS4fa92IbTkKXV5ne6hBbCmeXjRyzQd3TLUcWx5LG7mU2
	he14cNn1hBpOyvui2AhM6ELvj7ir31CkP+1IxLjUV2N/7QqaAK6j1oi1w6S5biOxcLGCiBHskqq4J
	MTaU5Edw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgDcE-0000000BcSs-1Sdm;
	Thu, 15 Jan 2026 03:01:43 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgDc8-0000000BcNA-12JS;
	Thu, 15 Jan 2026 03:01:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nhMjVBqLSHI1r1+XHQuj1i9NNCU+NSUGNegmQOXEBiELtmXXmxQ5I48JSq1kFbwX3ccaJpTJ+62Q1+hOTyo3lvo3F/+UBSlgahm11AxtU9uXDdeK5+L92uZWh3gs4fcoS0eez7jM5S56bm86KRskfQlGWZqBDN8IlOpuE/HjKllZ9RqIBPZF5hFjgPxhaQehDhlKVM14SEWWhW23s845w6XWLP5dSRiA1lPEFM10DCc2cvi9znCqbwSy9C4tTC9uBTkcQIOkiNB6cnADe9MPy0Vb1iD4cQYjTDxSw6a/nqIG1ZDiXxBsqKNKvDyvccNpHsScqqP6Eey7Ip8aSIysUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dEHDhBI4qFLSJe3zHxjBfTF3whDXUB8GmbWHJQRx7lk=;
 b=hhuRXEr5LXapQcQaxAi/I5Pdmcyl/sXaPCvItTvcolWjYzbMJcCd6SN+iBjC8xq+0ffnA+LO2HIuFig1O2aOYPgHtLgi9tI+xpY3+nauPERMJym927LmFdwr4NxzxkZavBct17zAg7yDif/6+OTE6utIFxycabgEttfY4h/DVAaw9EzQz3rzCokkouoZIJnmfkJY6CQx16V3MRlKBMI2/Dew2svX3+NediiK8uZueI2DOZ8Kq5IS+Vjb7RKN7STF5TsJZxLnl5r5CTswqDxenZN+zGS4gKc3BOpEdEsXZ/kchQLvIbSR4TWhQN9iGeYaJO8v/hXpOrlOvEUCV7D3kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=khadas.com; dmarc=pass action=none header.from=khadas.com;
 dkim=pass header.d=khadas.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=khadas.com;
Received: from PS1PPF62EEA9B1D.apcprd03.prod.outlook.com (2603:1096:308::2da)
 by TYZPR03MB8614.apcprd03.prod.outlook.com (2603:1096:405:af::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 03:01:23 +0000
Received: from PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 ([fe80::af44:7e78:1133:adec]) by PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 ([fe80::af44:7e78:1133:adec%8]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 03:01:23 +0000
From: Nick Xie <nick@khadas.com>
To: neil.armstrong@linaro.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Cc: xianwei.zhao@amlogic.com,
	christianshewitt@gmail.com,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	nick@xieqinick.com,
	Nick Xie <nick@khadas.com>
Subject: [PATCH v3 2/3] arm64: dts: meson-s4-aq222: update compatible string with s805x2
Date: Thu, 15 Jan 2026 11:00:14 +0800
Message-Id: <20260115030015.1334517-3-nick@khadas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260115030015.1334517-1-nick@khadas.com>
References: <20260115030015.1334517-1-nick@khadas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0002.APCP153.PROD.OUTLOOK.COM (2603:1096::12) To
 PS1PPF62EEA9B1D.apcprd03.prod.outlook.com (2603:1096:308::2da)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PS1PPF62EEA9B1D:EE_|TYZPR03MB8614:EE_
X-MS-Office365-Filtering-Correlation-Id: d1d84013-1834-429a-8950-08de53e25d6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NchMuNgACs3rEYksva3jTEEOb2K0bLmQB1yAjnpGESBimzH0QpGnPXT2ISa8?=
 =?us-ascii?Q?Xlask9DetKihe2PnHQHNcL0aCmavy0nbmkXikv4suhcCCMiMedm3iL45UrY6?=
 =?us-ascii?Q?jmNrVy79qDacW8MRsFaTnf1nsci3cwinyCKxHo3qZvxc5USXbVhveJMhzJ0g?=
 =?us-ascii?Q?4NDEe6P0ZNE1jvm2QtUANdszq8yMkG8kSLvUjg/Rzyc++pOORbe2KJOX2RtN?=
 =?us-ascii?Q?q7mabWixADPX9Tr9rNgnwWgArsSURzj+B9gX+FWaiTRC0Sawo8EVv9njyQCP?=
 =?us-ascii?Q?mTkkUc26K2ZL6fuwokcUMYhqFSE7IarUNt29nJ4R7BK5zu7IezpI4Xn/nmy5?=
 =?us-ascii?Q?LmGsuxdGOrYf+9FldwsqyHRGFkVTohlZeneKCfuJevgxb+f8kdk8HElXAdP+?=
 =?us-ascii?Q?LJFX5+RYHZiE3j4zsIgkunLUnYz8bH4OHAOH93qm1OBuCLm2Yncj6G7HJ633?=
 =?us-ascii?Q?l0QIXemxcRlEIws3BJnSE7apC3PaTUwhvPRDBlPt35cZ8bZOM/RXQOCW+6rO?=
 =?us-ascii?Q?Glte/hwzFXYusJeeYiRonnWfhi7MVrREhln/hJO6iEtQSrvhFWGtSulcliJN?=
 =?us-ascii?Q?ijUf+AHK9w+KMHdc+VRsyokYDNTxjYa3QxFMoooXpU//FUntHI0bCfBtYwbm?=
 =?us-ascii?Q?sbgx+QEqNEnUxYR49pCVzLUyTSlXvQUF6CSWNM32j4x2+VZOfWFz1sqt0Tsm?=
 =?us-ascii?Q?12EdV2C28Y8vB3bZdsuoJdAaa6VWb1YNMI00j5zgfzHnEO8FXdX34IQKhKoE?=
 =?us-ascii?Q?dyW3HalPMX0lt+E07ha5BmxPbqAHc0SkZS/ptDtRlbDw2DZvet0SrU4KOYhX?=
 =?us-ascii?Q?1e3ghrgjGfVYe57IRRABbyhjIn4XI+e+Vwe2T4PWnlkEXavs4i5UeAxDXE2N?=
 =?us-ascii?Q?eIWj5Ms1tL8sezCasH+y8v6yZ0IpjNoEtFN1HpY1Bx++UFNO/m822SW4Y/xV?=
 =?us-ascii?Q?uoaDzYJ2JfGWZEQui7XfxX1Mmk/MuGXve/0DwLTej+HP+THkdcrxMeU3gzgx?=
 =?us-ascii?Q?kanfIEZqQa3iza+D/JNnWoBU6fB2Twwbz+YGe82/hvamB6K+ohoqSRuFQyAB?=
 =?us-ascii?Q?nKSU7jy0vT3Bo+ioNHi1lbY4Cs/U0cHmnWo2sPqIxePQ66DYOKcHgMmk6D07?=
 =?us-ascii?Q?mU78g9CewZSByIE4GuzzkJw71bt0rBkwmWXSgDXr2eNHxC7kTtXw2bJvRplg?=
 =?us-ascii?Q?Ry1yfFOK1HgVXZ+AX7yUtnC+pUZTrd4AEFK6mLhuJnjEaUZkYzclbXVotapK?=
 =?us-ascii?Q?2BkfDHsmeIfbQoM/NepqgS/nhqxfDbPbn4tkxzieMvqG9OAJ8QRLuGTi8gDQ?=
 =?us-ascii?Q?LPYog0/dlRaFLaSiivfgXdpOz2PGL+EMo5SsnvLhIriHHCndbQN8fnVWYnlz?=
 =?us-ascii?Q?5muaxX97a689+gvjOk+BV+TieLc32vJLAFr1bn1HaZ5urb4/1PlODpCc6SGM?=
 =?us-ascii?Q?uYhzpgiyIM7qidH/57T2fea6gYageyfb99VridivactlXLfd3WxAst9fJXAD?=
 =?us-ascii?Q?CObI9SBZ4bEGoBk3JJfV/Mhw62rFJGzZJwhyKvQ7FZnAwu2PZrnbNeVXVRrv?=
 =?us-ascii?Q?6zcWOPk95m2pbGDYgaAKMKJVAeWfHIEU5zLtDvmiRqeGhxrcl7vpUTlLLyEu?=
 =?us-ascii?Q?ikhfhV2hMxH6m6dJ98JAYI8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS1PPF62EEA9B1D.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PBpGyID8Q1SxyG1k0fUJti32yd2upAtCEN9SwMkcobu3CnBYveS3q9ofHJRz?=
 =?us-ascii?Q?5ZzH4qxlXUYlqw0TZbEUxptxKGqH10tSj9BhU00b2ZymCwgzDs4rasiXeAGY?=
 =?us-ascii?Q?car18aeR9nkllE/kEGHAaFehwYu2u0ZAKoE2iAr7ZtGJEFRXT6Gn3Sc75wbo?=
 =?us-ascii?Q?TmH6x79RsbjE5M0iCagLwWPO/UJFqd+VPmI3aKECwuEHfoT1pGoFciyBV6to?=
 =?us-ascii?Q?JdT60bZdC4iIQ4sAgSU/1/YA1K3jb/EKTFtuIF4QL0CLaCScaPLwDmfNsRJt?=
 =?us-ascii?Q?C+ftdv2tdy/y1ynFJtd9ce84X5lv2GUKdgMnXBPRe3ykWG+SRQNQG5TqlinQ?=
 =?us-ascii?Q?icn8K+fJnJFLOKOcZhpDP/9LqxGDSysZxRsJZ4JFJViJODuhtr6JVdCwZmEl?=
 =?us-ascii?Q?oGN95UW/AxQYtFUXbQJXbgQ9Xvum3n0Z4JmEdEJRaBCasBIJA+GCONzmB8iX?=
 =?us-ascii?Q?rS1vyvdBWUA6ecHqlITk10eeHx/AUVk6AIFT7fCX5cqx52ATh2xnP3rxnvi9?=
 =?us-ascii?Q?TvgvR+KvbZjTqJLpQF9ttHQHLsXWGvn5wi/StIR0Z9cNq8oi4gJpR6L14YCQ?=
 =?us-ascii?Q?ru6hQ7afSbC6gALYI68e61KpUTxWswP7xX6ZCDPn1+2jD0hQAnHSvavZpbcG?=
 =?us-ascii?Q?TZz7S0FlnxwSkW+vEPhxzR0/l4i6Hq0efvVMXpq3Iwl6eN4Mm2jpX7YUaq7Q?=
 =?us-ascii?Q?sHLLLUadxurxgLrio4SZNJv/ItRnZw7gWLFOpXLq1F8TYs10EgfCjl6tP1VG?=
 =?us-ascii?Q?iSb9BBv/haNAbxxJcumn/Kg6uX/dRS097PA81RbtduVWMSMvBgv/h1HeJcg8?=
 =?us-ascii?Q?H+cianx2YQJ0fgm4OfQtiDqXJ03XMC/FpbYe0rp/9HyMBrQnWWQcZ4/YSsxa?=
 =?us-ascii?Q?Nejpm53VLbKqgphHTk+5BhDBNGvuG1rh7bI/0WEe6nm+t8KZ+IHMoUzFQWVl?=
 =?us-ascii?Q?7tAKJ/FVp0/B7k0HzA19b0kErU9ntDXzBKiyqLYO6KeX5QDlb1PJkQduTpRg?=
 =?us-ascii?Q?GU2kKjG6O2/F7vQEPXE0V9eMPMaZ+4vktbVF/XskQroEp7qwl+xivubV/dY3?=
 =?us-ascii?Q?H9aUfbhl4J22IWqnLfQGSTRyzpO9nhm8R4ZjutCD4wUNPUoE8na4Gl6aoXje?=
 =?us-ascii?Q?Cb4KxXmtNOvri/DPKRslby4t9Pw6v8ZhIsS2N1N7xoWVHj8gDUL8B5l8Sm5X?=
 =?us-ascii?Q?thNk1DbCbyqrHGpC+7GsiH/no+AAnbqBmnhyuCgPmrIcMfsTvaHE9grs2+CN?=
 =?us-ascii?Q?OjM8MT1n0xd/0nUBtMGRzqsASFk4gx5kjAuhix8SNDlIMC3JBTXA9W5H838M?=
 =?us-ascii?Q?Ha/tmsizxyUwnCJKKDIupU2g01oFXktKC3kHtp+OQKQaqoGxKMwt9xpp+nGS?=
 =?us-ascii?Q?Jt621D70FE5ITJ5nfmxusTD5XtRMoqYmwudedT1BWhtsBbF+s120ynWd9CZD?=
 =?us-ascii?Q?6+VaPXv8UcBHMyvGg6K1cN0D7XfWqb9TMiW9OmzJt3xndYZV8bBG9LuI3RxG?=
 =?us-ascii?Q?hqOU/2oulN+ILrJDojQ9bPmernYVTetuA7kaP5iu/GIgqzRVDMfX8s34T4Ky?=
 =?us-ascii?Q?+3Y6YbJVNpNg58fIG85XmZW1PU3Z2176daAyJATKm2OpYL3JEAAddpXhUApz?=
 =?us-ascii?Q?cBudiMr9fw86yVx57P4Epq1kqjD7pn9Jf1LHz46pjnoGsD2QeMt783J0JlcH?=
 =?us-ascii?Q?OGWInr5IiHI26Zw6cVKgIL6Fb71n8ZBgIWvpOdRGZn3OQscu?=
X-OriginatorOrg: khadas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1d84013-1834-429a-8950-08de53e25d6c
X-MS-Exchange-CrossTenant-AuthSource: PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 03:01:23.0182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5LA5yGtdINPl9h47QCUHnJvkePRUZJ9sMHtXuk9UX4Sav8Sgh/J41UuCjFVym+IY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8614
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_190136_292263_398467E1 
X-CRM114-Status: UNSURE (   9.78  )
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

Update the compatible string for the Amlogic AQ222 board to include
the specific SoC compatible "amlogic,s805x2".

This aligns the device tree with the updated bindings which now
differentiate between S4 family members (S805X2 vs S905Y4).

Signed-off-by: Nick Xie <nick@khadas.com>
---
 arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
index 6730c44642d29..0a3f81ea0fb0a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
@@ -9,7 +9,7 @@
 
 / {
 	model = "Amlogic Meson S4 AQ222 Development Board";
-	compatible = "amlogic,aq222", "amlogic,s4";
+	compatible = "amlogic,aq222", "amlogic,s805x2", "amlogic,s4";
 	interrupt-parent = <&gic>;
 	#address-cells = <2>;
 	#size-cells = <2>;
-- 
2.34.1


