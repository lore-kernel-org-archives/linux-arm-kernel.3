Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29FB7C55167
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 10:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vb9hWpPzLLmgPeOk6my/OoSrfoPIctJAyics1WhoyJ4=; b=L0aIx5Xr/00Za2rKjtqE4Tl4DU
	mj7liGAcF4dNInEaAh+aLlaot4LZGUo1QTPLfWS7J5z1eOFKk+gkqBdkS1/yERS1RR8M6AedcrcvZ
	3xL6vjC5sWjTlw+z1rN2JDTf8LithnmxL8dD1WdGZKK4eQJbW7kfEydxRsNCeNj5udJLykWRNRQjA
	O4zLCTMBUFerwuEKWMmkJrxpCqxCedwbw8KmXiDjP3N4zS8ve2jXc1z5TvXEWA+4QomIpoScS3iHk
	RB26KiKb/YNchQ4FPaVVC+9CDAToTR03tnoI2QGcEP0f/sLP+6H97L4EOOin4+Jpz3z8/M4xn625C
	b+t8bCYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNy9-0000000ACWS-0Lun;
	Thu, 30 Jul 2026 10:26:29 +0000
Received: from mail-southcentralusazon11011068.outbound.protection.outlook.com ([40.93.194.68] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNx3-0000000ABiV-1U34
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 10:25:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TF5OpiAAvebjxQx/Up6c6SRbI+MfOi/LjIi24t3htgUuemOvedDDBDdYjzdQaZnGWYQNoEnx41Jr1EmrmfGQ7CyXVY2yyV+ZwmcqGl6Ju5JlzVdwEfO/GgRX4VtA9nfacFnwQaX5jao8KturWnaMG60VzoP8fp+EnSVecViNlu5auOhbePdRC0IJNu1o1DQ8fdBL326QQSuBAXKi69i3OPCQT7X14VU5VDf0Hf20zQ4UMZHQQN5AP1ER9ef/e4Cecd0TzgxBmfuoeDwfZmVEB3NjLmggMy4QzUiQ+07LQ4eRd9hhBXz2cascJAyLpq4+9CK6eefgMd0JL+kg61kaiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vb9hWpPzLLmgPeOk6my/OoSrfoPIctJAyics1WhoyJ4=;
 b=rswGZtyGv1uuxa3BVwq/7VLuH+xmtqcMCcZICcrt+k5tJJUb3qS8uOld9dZzE5RjYHkzoXicNFQ+0m7m6M3MHX7kbN9WZbQkw0GrVogLjEfGRn+OM8otaPpYhv44qyKbwu/LyV+m3pDmZ8rnHSOqMH7Ug6iKaicclcVV0XI848gIBdwNeVntqFcQsSTvB9DYO9FYzedywvsJ8FgLIw4Ln73KMYpGEsU7u/jirIFv56iIISYyZ31oGs3Qte5M309pAd89IzLtAcHZspGuiuNA0DtAHbjXGpaLBPmUbLjPoskIIUuFBVDRPCQUPVf35wmOio5rICf28Hd1uF3tGmkyoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vb9hWpPzLLmgPeOk6my/OoSrfoPIctJAyics1WhoyJ4=;
 b=M9GTSvu05SKJdf/xuQTuH3lgHdZSa8GUKGdExlATqJdlT0M9n8c7MV0e63mooCFZRcs+gUwjXZBTSuEBwOYVs5GpJa/ns+N2+fq7pEQD4bQB8pYrc4RU+KtrdUZK7QiJNQ2sGqHAgGrg7LmL7n8p4+TF2RoPq2uzIR/tddoAHb7z8mFCBVUZnwVdH8wDWS/zmGQ17ghkqS37YWfDgBfAtNxmnb5e4CxBvPqyf84XDaoNAUrNJaUVYT1ejnLBTCd5xwNEJK28aAol1MTkEwNmRtGQxdZjdO1PDCLawzQ7SIiMSPXs6YR5Kmnc+mvxviu5c7CXd+rYiCWTU7LudplfVQ==
Received: from BLAPR03CA0129.namprd03.prod.outlook.com (2603:10b6:208:32e::14)
 by IA1PR12MB9064.namprd12.prod.outlook.com (2603:10b6:208:3a8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Thu, 30 Jul
 2026 10:25:13 +0000
Received: from BN3PEPF0000B372.namprd21.prod.outlook.com
 (2603:10b6:208:32e:cafe::f) by BLAPR03CA0129.outlook.office365.com
 (2603:10b6:208:32e::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.13 via Frontend Transport; Thu,
 30 Jul 2026 10:25:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN3PEPF0000B372.mail.protection.outlook.com (10.167.243.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.1 via Frontend Transport; Thu, 30 Jul 2026 10:25:13 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Jul
 2026 03:24:56 -0700
Received: from nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Jul
 2026 03:24:54 -0700
From: Jacky Huang <jackyhuang@nvidia.com>
To: Rob Herring <robh@kernel.org>
CC: <andrew@codeconstruct.com.au>, <joel@jms.id.au>,
	<krzysztof.kozlowski@oss.qualcomm.com>, <conor+dt@kernel.org>,
	<andrew@lunn.ch>, <devicetree@vger.kernel.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH v4 2/2] ARM: dts: aspeed: Add NVIDIA VR-NVL BMC
Date: Thu, 30 Jul 2026 19:24:17 +0900
Message-ID: <20260730102419.1218311-1-jackyhuang@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAL_JsqKx4OEM-asdvs1wUiP3FFObzJHZtNTtqiwtcRhJ5CPRyQ@mail.gmail.com>
References: <20260728085640.1001890-1-jackyhuang@nvidia.com> <20260728085640.1001890-3-jackyhuang@nvidia.com> <20260728143952.GA2121505-robh@kernel.org> <20260729060612.1085870-1-jackyhuang@nvidia.com> <CAL_JsqKx4OEM-asdvs1wUiP3FFObzJHZtNTtqiwtcRhJ5CPRyQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.37]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B372:EE_|IA1PR12MB9064:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e59bb73-e7a5-4e2e-bf2a-08deee24d7c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|82310400026|36860700016|7416014|376014|11063799006|56012099006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Ych+SC6hLxTVsCSmrAZct084vLZaxFR+EhqY2S1JRLLi3747LxjYy6lWPE1VpH+FICjpmKzpico5r8XgviqWqn/IXJXBhvDkPjNFABqtO2JuGMgxxu4iP4b7bfgQmW5jK7EZSyR748C/PE3EUdcOaEJFrZtTJlv2lOhrY54ErpF1rI9tCHYJw0JgAwLu/HDZVv6/prZKYXyUM5d4iMW5kZOHmJa7eLrxruBWFzZUpIJmkHREsM81c/xP1PMIIoNcUaAgdxgk8G41wVqZuMit+WtU23yZYHo87eaxP5vfoeTL6MbXqwf9TA5vf9iRNcf0gC29hfsRLoewdIIB8XM0ZJDQwy/NeYsUj+mw0WxNTx7UTwrSCZzIT1NU/U8cOZGrSJuBaZ0IU2ivEc6rOvHb1e1W0/fzTXuCfDdbR/bunaHY2b5rIk8ScoBm6sK7WVoIydh+B86ahCxZyPlmYMMfWnRYxmiFJ9PbPhO0Sb2WBRwNdtCx/hlJDwgCwGZ+iKFoGafh3iJaowGleF3pFZYRAOgTzzhdW/Ywg/JUR+FWsp5orPT+7ykruO4ghfWFV+0KaDBPYywC6rvgj4bjVmU8B1glVPMtPYej0tloJ6pYo/a4llu/uqGr3SQopjxgkFwuiuxCvvmWOlilX7kcCFrs/Z8of4d3vQ7DaD5SWpgjrerSQk59p9O31BhSfey5W693+FKAHnEbRPH8AGMI+uF2yQ==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(36860700016)(7416014)(376014)(11063799006)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: WRhlkwtUxSaGiHihRhQC9W/7mnHMUMAbIJzKG6D4oLtyLmDpUGGzeHn8mJ6s4LY2B0fP00fNzPkWwZ+yNMgqHxjZPXfWKFbruN9u2sAkQl5SNV0L509f8/mPpJM9b/iAPb0l9rtzQ6E/IKU+ep/fddtXuWJelo5naRQJ9npjG633fSoJPZ18o4Lo+mcuB8C0y5dsslldXfDo5SR84welLTHafooqpsFGxFYeEXKJhVwg5q8zbakyVxIxbJRl7rNg65382fuZpliaTrPOAbCXUkWV2frWlt6p8srCQEoHAleErTj193Kd7z3hseT5ult6wjgkXzg4Vm6wpZpVtnS9iOGsYWBXqWdk5h7ZeDzmWZnzMGZdLsj6VWrFnlkKFg+tHQcFV549RqXDsP5lFJDWDFYLiQU4Fv+2SvzR9OK9cdqMumpLM+N9cXxw/3ZlPwen
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 10:25:13.7331
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e59bb73-e7a5-4e2e-bf2a-08deee24d7c1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B372.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_032521_406951_8B4A4787 
X-CRM114-Status: GOOD (  10.97  )
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

Hi Rob,

On Wed, Jul 29, 2026 at 08:17:40AM -0500, Rob Herring wrote:
> Is the flash part of the SoC package? A board level component
> shouldn't be in the SoC .dtsi file. If there's some components that
> all/most boards happen to use, then those should be a common board
> .dtsi file.

No, it is not part of the AST2600 SoC package. It is a discrete SPI NOR
on the BMC module.

I agree a common board .dtsi would be the better structure. The nodes
are already in aspeed-g6.dtsi today and more than 28 AST2600 board files
extend them. I can help prepare that cleanup if it is wanted.

Thanks,
Jacky

