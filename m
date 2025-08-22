Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF6FCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 09:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iv3t8qmzbDydYifsD/57ErrI25TQdHA3hw8wwHIlhmw=; b=L1mHUK7YJgWg9llAk0lv6YonAl
	gMrrojuq2z+1LCBbY0cBuW/aV5t0Ns8A3yhXc4tZoAvnnaU8Xc1PtmOTqoO/vqHA6az4safAhZzkD
	afBZXguSLQkkjVWIdBmGNJ1f3/xTR+QEOipmLOUN+HdTVelw3FtOO2CcsJnVIVqHdthX/VVGVX9Hj
	pLddJWqFSov0jiFZAQWHyHpIcgwr1ox0RYfQ6LBU9tMgsQ+2V3JNiOKyB9vrCc2sxvCsEuz8o7ka4
	bNqrATsd364njrW3yaRNJKlD2MRwvHiG8PDVhPQU06tWq11GtSoZLNxvQZ+5CS/0kF/uzqZap87Oa
	s49iseAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upkfk-00000004VI6-2m26;
	Sat, 23 Aug 2025 09:36:28 +0000
Received: from mail-sn1nam02on20631.outbound.protection.outlook.com ([2a01:111:f403:2406::631] helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upYXE-00000003Rjb-3U0s
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 20:38:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gp15KQaOTYD2lF+oCxss9zK5n9P7swqtR2iUHXpqTTeaW1kVNWr4gxzLQMBd7zxpbY1Fpoy5Jww0mPdw7N/0gkK5TMSATSR9uP0MvAXZpNIhDK7kqNIsp+6eVnAGTWiUFDTlWG8m28ECHn4wG4roj5+H99FeRSjiKQN1t3kKQdNhXnzUjaRUlh/5/Vy176fG4cyt7jepLBNhM82tskbM0FUHVHyWXcbcqB92FZ22bvlWTFLOYMrQnses/HDc1T+6okgc545dfLdSp1Q6m5TD+oh104lrAOAnwuPBXXvmKN4CvMwBPDyawxayppqYU4IMFgQWxMzTOx+tVppnbbWY8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iv3t8qmzbDydYifsD/57ErrI25TQdHA3hw8wwHIlhmw=;
 b=DplKQcT0f6eUeeNzr228fGxMDsqArGuSiOscMPNc5BqIXVrkeLbucyK1dTWl9UeVNfkxkJFgHmOsA07PzvZbi5PuxVEtFvWbQeOHaRqIBEagF8pgsf5aARUhgEyUirRphWZvkZtjvle2gIz6q67yBza/HKOhYRa4DM2JW2AYJXWkdITI/dfwOLn2U+uFZujBERXeC927lI2UMW/hlrJDs42EfR7x4HLYirBw0UGKyy2bJWIBLIcgFvUAEWfsW1aq7Y4+Mgd/2lZqsTA/THtqtVnnP58FT82uaO4kTLK8XzeQYjQWwbvK9eS9CEIS8Md9WjsdV5VYb8dx+qX9p04QvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iv3t8qmzbDydYifsD/57ErrI25TQdHA3hw8wwHIlhmw=;
 b=SByH/lwzEEhI1vxkYMGDEQrzWvWQeO9WHtXhIIi8DX+ZwWolq3128SCo+ng1mmxpTejypoHzuLWrQkaWJ7dIzIhMI9hoian+GV+tY3fKJqP3SS3p1CdOyMYkQiVOReiPL9TlJncqxrP9t/t5xVbMrI8wJGS74btVGtK/Mo201g6MDX1RWUKJWeMdaNWLpUX6l0lN11uQ3V35SVL92yus271LqfJHFI67uSuI2E9gz18/dEVwFAf6z1eKMuD2ZqTF6q9+WQQ7Izaot6TPfG6h5DNk9zSoqOFozNKxxDRq+oCaH2V5xHOibI9iE1Y8WknpneFGg33ZnhE+9Mtas/L/Mg==
Received: from DM6PR11CA0006.namprd11.prod.outlook.com (2603:10b6:5:190::19)
 by IA1PR12MB7687.namprd12.prod.outlook.com (2603:10b6:208:421::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.17; Fri, 22 Aug
 2025 20:38:37 +0000
Received: from DS1PEPF00017092.namprd03.prod.outlook.com
 (2603:10b6:5:190:cafe::51) by DM6PR11CA0006.outlook.office365.com
 (2603:10b6:5:190::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.19 via Frontend Transport; Fri,
 22 Aug 2025 20:38:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS1PEPF00017092.mail.protection.outlook.com (10.167.17.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.8 via Frontend Transport; Fri, 22 Aug 2025 20:38:36 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 22 Aug
 2025 13:38:21 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 22 Aug
 2025 13:38:21 -0700
Received: from dondevbox.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Fri, 22 Aug 2025 13:38:20 -0700
From: Donald Shannon <donalds@nvidia.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<donalds@nvidia.com>
CC: <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>, <etanous@nvidia.com>, Conor Dooley
	<conor.dooley@microchip.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: aspeed: Add NVIDIA VR144NVL board
Date: Fri, 22 Aug 2025 13:38:17 -0700
Message-ID: <20250822203818.4062595-2-donalds@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250822203818.4062595-1-donalds@nvidia.com>
References: <20250822203818.4062595-1-donalds@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017092:EE_|IA1PR12MB7687:EE_
X-MS-Office365-Filtering-Correlation-Id: 346f5b9e-870e-47b6-b713-08dde1bbdec3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|7416014|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ThCyFWHo6KGhM8yP5UKmALBvQwctWIjy71l+o+xOqUJ/nk2xvXaPEzhvroHv?=
 =?us-ascii?Q?2JZ5m+d9b2jf+3eQGaiEvMCWYkOB3w46U7/3ibQgO7ypM+VNLgaSJ3NcoD+M?=
 =?us-ascii?Q?MvUkWWlwnsTJfX/KIysfHMBXmZQEoFR29LXuOLO8taJ3wPvgOVHRQRrRvoPv?=
 =?us-ascii?Q?74Cl75WAD4D6Tigc+mWretiFsYJ1h7iXu+zI644Tk9TFfqbl/AfLjOHN57Wb?=
 =?us-ascii?Q?/5pJksWmio8fU8Sux9iHBw49/1EsaL5tF+2ei96/gopQLuiDJxfHYeNvHKCa?=
 =?us-ascii?Q?n7f00ZgOeqtxX5A1st6KndTjjs31Ecb1/v2ocog+3rXmUKGt0Gf8Mu2QlqoF?=
 =?us-ascii?Q?XQNHAQ3/SqjX4XA3Ltt83oKqKDpLMVQ0Q6/fKDMUK2eMIuK7C2zlFPYlXXuY?=
 =?us-ascii?Q?/GNAFe2DMjY1qahndTOa5tbwjZh8KRcUqIWhBqgGu4KCn9no+4TOXuTGNkki?=
 =?us-ascii?Q?QeFqEPp5bks5ig9SGycVO6t7CK00e97jF3ZTV5kcMrv7K7VcM2xL8jdCC7wy?=
 =?us-ascii?Q?IWHSj5rQVjtJnwRDHPp3KB6npTjn+e5rXa/TgoL18EWFdy/6KkH2iNZ7ERVC?=
 =?us-ascii?Q?2+k9ZKPHlR9f4sNyFxX/ffZ+IO+kZSwEqUfeopOumHOPQntCO0GqaMQAL/g8?=
 =?us-ascii?Q?+/n+WvvZ6luQzdN7EWv0Duz7YYvBHRok1kdBiTm80lfszAgXC/OeD+de/bhZ?=
 =?us-ascii?Q?yzyrECOQqKBGE8aCB3JvJ7uJtojbuZHnwZg5ekIYkBHdpYFm/fIQ7UDHEcxD?=
 =?us-ascii?Q?N9vqeeABZU6PbMnNXPWqeSma8ehZ6tVpR0I4rfrxWLh9utSpjMi4LFdmHr3y?=
 =?us-ascii?Q?3OPY6llp9OGQU0d6A/CwOmZTJkjU0q5gPWdV701jnTe5WgwbHR0iVNhxeSuV?=
 =?us-ascii?Q?SBrvx69bsRsbQVlsWCZy/mpo4xND10AFUgRcSgXU0YZiZzBzTJEYg/qkjoBk?=
 =?us-ascii?Q?ilsyR+1Nqt1dfTKGGPOsMF2FqxJbcQUr/Fzy3sS6TPjgncJoVtDr7ftWk1qm?=
 =?us-ascii?Q?gfEN4/H0bIJ1LM8QxuQ5bRsSH0djfAKg/eiR5H39zf1CynSnlNCwRlvOHMFL?=
 =?us-ascii?Q?3Gc7u2LhftMsxFZ8Br8qse0K81MUezJfNdHK0SOG+qEKazp/8bdwAfcB6BRs?=
 =?us-ascii?Q?LgdMVumZWJjemX2P7Mf48fNKfDjhNLiZI7spTsHz9EfFAdu6FdNHW1lSPAvc?=
 =?us-ascii?Q?Nx9IbGiLpsJ1aKRWhkOHT6Jj+SUlABD7dG2Lj34br8U0ZQzmstPasZOFsUAp?=
 =?us-ascii?Q?iOUcsd/g+st4FjuVzZ3IhjdaxYdm2sVMb7xch0adtD2/zMlADBy0dDiUFK6w?=
 =?us-ascii?Q?WeEyKOFJjVbFPz5pHcwwKXtXbCeMnkjiZF0+pZRLGHjCz7e0LKCx0ZnSul9p?=
 =?us-ascii?Q?cAnC++wmMFy9T1EvIzJ7Y3CI1wUI4IAZXSmV7JPaUjUdLaLvQeJqrF3/tHrP?=
 =?us-ascii?Q?I6oQwgkEX3XCb9mFs538le62NXryYLAv9A18ExFmh3gXJooui7dsuGccMH51?=
 =?us-ascii?Q?EXFk7zqmShWMKP2KAnQxsV0kvI6pujzegZ+C?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(7416014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 20:38:36.7098
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 346f5b9e-870e-47b6-b713-08dde1bbdec3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017092.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7687
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_133852_872843_A5C79073 
X-CRM114-Status: UNSURE (   7.52  )
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

This is an Aspeed AST2600 based BMC board for the NVIDIA VR144NVL
platform.

Reference to Ast2600 SOC [1].
Reference to DC-SCM Spec [2].

Link: https://www.aspeedtech.com/server_ast2600/ [1]
Link: https://www.opencompute.org/w/index.php?title=Server/MHS/DC-SCM-Specs-and-Designs [2]

Signed-off-by: Donald Shannon <donalds@nvidia.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes v1 -> v2:
  - Received Acked-by from Conor Dooley
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index b3c9d3310d57..11e17e9ef15f 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -103,6 +103,7 @@ properties:
               - inventec,transformer-bmc
               - jabil,rbp-bmc
               - nvidia,gb200nvl-bmc
+              - nvidia,vr144nvl-bmc
               - qcom,dc-scm-v1-bmc
               - quanta,s6q-bmc
               - ufispace,ncplite-bmc
-- 
2.43.0


