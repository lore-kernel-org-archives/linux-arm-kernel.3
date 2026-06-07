Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F70DCD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Jun 2026 00:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=frw9AJWgWDh/j09xzMRYZfOiWFITkXUE9Eugw4JvdEk=; b=XHyCa8aZF1IBLmLM6QZ50u/DEo
	0QcFfho9yR1UIFFhGnOvNX+3xyAE1tK69eZM93r6l5/eKfxzoPApu7fkIZ8Pj/IhD+YPbig+xoXoZ
	ZJNw+AGSuzSWRx7QaLfgFREtSiSB0xbrkNrayjOkamMZa4MeHn+yZVTjqSkmmAoZcpfnM/5rEWczR
	FawHu0K/DSbNW7xqUZwpOUgfVxA7amjU8sf9Lo72D9/Up+ddooGRQYxKToRruiQAJcqZMtisZitw/
	SVD1IBzWg46Nsm7ugJfrDmpXGRNZQwEitrv2zuzmEXzQTaXxDClC1Pz0BUEjG7R62ceFh5ho+/KPk
	KtKApjjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW1CT-00000001uRN-2v7v;
	Sun, 07 Jun 2026 00:17:13 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW1CP-00000001uQd-0mQp;
	Sun, 07 Jun 2026 00:17:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TBYJDidMMepf/G7ODpeI5ZltK8OhPb8vBjpKI4o83sRUto02GeD9gWIbfAm9B3P8L1AWbU0Kk+CYaw/pzmFJ0cJZYzjqzKFWY9Uz1My9JOVN3V+u+qz3CtjoD7YR/2xdnZ9LqFaf+6ZhZl5dg3NhrXEU74+VLZ4UigeopF/Vy4B0NrvI2E3zFR0jDn3M/Qkamv/TGtjIfyOLTVFFxZFG69dpvdNdSUp7sFwoAioVxWjLOP95XMuXFt2vyq1EUDvQmJ+XzJnMXU3hNICbi3S3USagcstnMWwISGxlA0/354wa+tZwOD8kzw7Jo7tmlTJeNGXMlcOZnszCdif47tE+wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=frw9AJWgWDh/j09xzMRYZfOiWFITkXUE9Eugw4JvdEk=;
 b=sYxf4cvjLd5i/MaqJkBgsoU5gsZt8BwaGe3/mu+7iX1mAH2KGcrUbnXDqB2LmlkFU+w9VLDkJ1LYREzfsBoqX1x9KKrINgfQ6zJkZ4E52dn4KHVOF6iiT885o1ZhjnScjF/xJYpL1okGveOwFgBdjtwV3DqBFABAj8pL3Fz5s1gzuJJulnNciKZc9xlkQWNLNvfo/d+AqHnhpS/S+VjAz2eenvgwZ4OFBhHstDRSGReu6kMV3F5ZL8khJPhxmFWKmty7sjXhQRuDXyMBYx0OIpHJFl7WG4Rne1GC5gQZQX3EUo5sqFPSZh0dXAzPuq/o2GjcehTKEhlFQ5JEg+98Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=frw9AJWgWDh/j09xzMRYZfOiWFITkXUE9Eugw4JvdEk=;
 b=uIMHoWWkgwvYV4qzA6afaCqIdzYWwy2ZipXruWze8WX+9/pZ8qi6jKhp7dlvtWIY/WrvhCfNj7B55LliUKJwZkR6p/dESLn/ZQYcuGJVv4xr6xBPnEuWbfd+eJn20HO+ph7CgdxMn599OzWlBtuYB7QR/JkMX2WtqVsQsW5JBMoIeqLkaAcOcW9D+LQVHwDcjtnXGJzByZNSrrfcR3Mt5RcOHF0c/m6a/Oi4KjNhLf/MAazB3idCi5LpnPcQ/PNhpRiA26+35riL/ekqeykb9etBTK3MXoZAww28mzDBBlEMNoZMTvEO41hiD9xVwA+o6wTr3NxgxlH46rg7xRA9gA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by MRWPR08MB11707.eurprd08.prod.outlook.com (2603:10a6:501:9b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.11; Sun, 7 Jun 2026
 00:17:02 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0092.007; Sun, 7 Jun 2026
 00:17:02 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Linus Walleij <linusw@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>,
	Markus Gothe <markus.gothe@genexis.eu>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH 00/18] pinctrl: airoha: split driver on shared code and SoC specific drivers, add supporf of en7523
Date: Sun,  7 Jun 2026 03:16:36 +0300
Message-ID: <20260607001654.1439480-1-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF0001DBFE.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::319) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|MRWPR08MB11707:EE_
X-MS-Office365-Filtering-Correlation-Id: baa3d23e-4029-4fa5-d6a2-08dec42a1924
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|18002099003|38350700014|921020|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 7mQOwaiMFRanoTJJEylLy/rfkD0gJHeAuIjUy20RSKlnejSbRRVroEMLTAqqjmW3vQv3QnDam0O46pU1tEjdQPBCloT27XEMTPAXuKczqw2kKcY2ehOUc70QKv/1Dm0tne10YNPuNtJXkOchZBEhp+YpPpP/Hnj6Y5Au2en2q4Bq8Y1AggzKkGtR30qXOIv4j2nfjt+H4Xtdi4szH3zpvGl/YSUT6mO9BUf4toHlVNGSftPcfRPHGKbk7pxIo6ry2YvC4IBdSCciQUwtAEoYQRafgeCKUrU85hMECUU58OU6TMth4VmmADKJd+22j0aEria604UN7CFboHx2mGm6xnvUmQjUczZUP4akt9mJgo4ReHWbtyuQuX3VSRyf0nzEcYfinx6Y5tkJ6xGKqmW5c3T6h+QdmfmY2y4pKru7Fqlu7+IrmmS71wVwFQm9XlnNkT0MkMqg1ajsDuzjRN45NhobcwpVNgomP9K91szmT8SSg8THnRqr5jskC3+hkuU6Hjx2MT/JN2yU6C06dYrRIclhZQlHgkHv8Pik1n1BxHARqbu9O+k5VJ+qbtGJJmjDaTMiJr3JIdeDdP1vqRxXWYYUJ6D5gXmukELXG44xj919k5Sl/ylGIaLJdhvdN958jaqFca1oK0/NcTwG/73W9dGVEymSkAjN2g+XhCRMgjlRNVU2GFr0mXiwYLA12X27I1TCR6oKxe0T6JoixgjeZh8qrm+mjMVPTOcpNVQZKwDg+5qybF5o/2bvQdzqs1CYAfj4q5dqgAQEDHu4PNnC0Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(18002099003)(38350700014)(921020)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Z9AVx6CbxeYiisfHqIzlJWp62mCyrh4OG14sNz1HK3yYtV8FXrndk5YDxxi+?=
 =?us-ascii?Q?sw+vVrtTJJ4gFKab1niB3IT19twpuQ8hGsBse6AoH3PuDwpwX7KySPFZpTXU?=
 =?us-ascii?Q?BhvGXNwJdClfkuWYlqEhQCadxpjZpGZtCvHEAGvWRr/t4D6AkdrSDkNQ0aYA?=
 =?us-ascii?Q?A3VmtxwS8iraMrW2VAXonQ6quqqiuxZngNtJiPX3fTX5z9vZs28vAsB/D967?=
 =?us-ascii?Q?MC5I0wF/Oo+595AQ6+79VTyvm5Pyc3gzXbVe7t242D2TZsSAapVPG3P3KBua?=
 =?us-ascii?Q?nwnuWmnFe41SEyfQddyGVD5RMz9ntsaUAIIc3dGzfPNHhsWvIRrNwcuA0q+2?=
 =?us-ascii?Q?Wxt0six3/mxUBAGZ41Rt/lRxGstklIOr+DITqIF3dxcZ/RNqvLJZ4qfFHuww?=
 =?us-ascii?Q?zXZZY8onzKdOJEU30GGSK+MgQatids7UsicTKjmpjn+uNgRt+c1mkG1d9ywK?=
 =?us-ascii?Q?EjXezIhky5hLwjSaEUAHfE7mI4RZMptimQQnYej0rVwYCckGa1n1GcSgCF9a?=
 =?us-ascii?Q?yFHHYxpkmw34z15drUA9ND1S8RGsDv5XDPN8wFcsVzsFIGr7jZ1UWDAYKsJu?=
 =?us-ascii?Q?PrsPmf6+XKZMxSQ8kqglND+qQQKFoOyinPvE1u+HxkJkUyY9CjQrhM+jVIT7?=
 =?us-ascii?Q?mt5UGIG0SSv5S9YZ/z7epR7mJ1c1UutfaX75UhZ+BZ9JfwNcL9W5fXoyrcDr?=
 =?us-ascii?Q?4o/hS+UCZVnBoYQSDriNjbDMyDRrGdQr54ZXjjk+izsAcnEwvu+DfksLiHK6?=
 =?us-ascii?Q?rBSsR4DPWlTRLK+snyi0xZHdy/JchhvSDTbCPwZvwpZAVMRZZ3br54YyBzxF?=
 =?us-ascii?Q?JMYSGWlZwCN69zei9pftTOA/vdAKDgkEK8kRQWUAP9z0305W6+HH86GlEDUD?=
 =?us-ascii?Q?BRuCsbNL1GFN3n8abAXp4cmmg4JCn8B46q54YyUPi13LT20/b5sX5s1gPjOm?=
 =?us-ascii?Q?o9ljIVXRxvYq0zJDflpU2tuwb5W9Qrl7fxIBfR4Hv7ND+QMO/TueWTQF7NHk?=
 =?us-ascii?Q?VHdQprlxe23fX5NFWDNoviKTiWIZxg5qg6rtTsWCLuubDBjWZpDQyPLzIA+9?=
 =?us-ascii?Q?sI9k+CeWlhSqjjDgSXqg1W3LOYMGaASLR2RXUU0kIM9RgQnWgRttYX+zitXX?=
 =?us-ascii?Q?v6QE53Xcr4PRuf+Egvyx1f5jSFleKiXIhW4iXUoyN+sxJfymNYEiaBWTeWQ7?=
 =?us-ascii?Q?+Ldx7uj06Yki7h8TtOdap/Gwa5XxZ6L6oN6aQhxC1+3qSXozVinYtoeBRDgU?=
 =?us-ascii?Q?sv5h5GjNQOI5dbcwOsaUkACF0rkTEySnH3INqFSPwpscZh8H5Dzd3xs+JTC+?=
 =?us-ascii?Q?PgX962MzWnT8nJ4ZMczljx8vpzUSSHlsJa8Vtw+JtHSZOZk1F5tIq6+vuiOh?=
 =?us-ascii?Q?dd8MRUh2OG5B0Fu8W/RmIikOQoawO/Dl8zpA746Y4Ez6Vmf+2J7NZE3HIqyv?=
 =?us-ascii?Q?naYj7WkdbwVQ162C9i+SFPzJ5JuhrNB6ZKVHPt+4idwepezmG1C2LDJbJs5l?=
 =?us-ascii?Q?nsknUaPZEWJ3obOjt/PBBiUUpJkUyqfurLE3i20EW8XbPtBj0CPSQXWtn9gw?=
 =?us-ascii?Q?Xua9KGZTgCZgidvwnP3WnVwMZitcqlEQkXlxDYXCCVAVZmRVqMk6MkmjXl0n?=
 =?us-ascii?Q?rtYX3vr5JJLSt5Wu5Dh7Ft85Wq0wAV/yDvc2TmifbBT+pyFBYnCOztzlEf2O?=
 =?us-ascii?Q?C6oxU+6A+kZY1EmZy/q7fCIhNq9OXFsG7DYU1ByWryyWmuaYSenA5k5Wsith?=
 =?us-ascii?Q?gSKYMAwBeUyGV5S5Wq9lg1iFut9J3WA=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: baa3d23e-4029-4fa5-d6a2-08dec42a1924
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2026 00:17:02.4841
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lOjozh7170X0fk5NSrjKIu1IR/mTi8pcCI6as8efR8oBgxR5fh1D0Z3t/FJynXoMqEYj5lWg9ptvz3v6t2SE0M3+py3u1iuwDGcH8ozsk5o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR08MB11707
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260606_171710_620740_0527302F 
X-CRM114-Status: UNSURE (   8.62  )
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

This patchset
 * fixes a series of issues
 * split combined driver on common code and several SoC specific drivers
 * adds support of en7523 SoC

The driver split changes are based on Matheus Sampaio Queiroga work.

Mikhail Kshevetskiy (18):
  pinctrl: airoha: an7581: add missed gpio32 pin group
  pinctrl: airoha: an7583: add missed gpio32 pin group
  pinctrl: airoha: an7581: fix misprint in gpio19 pinconf
  pinctrl: airoha: an7583: fix misprint in gpio19 pinconf
  pinctrl: airoha: an7581: fix incorrect led mapping in phy4_led1 pin
    function
  pinctrl: airoha: an7583: fix incorrect led mapping in phy4_led1 pin
    function
  pinctrl: airoha: fix pwm pin function for an7581 and an7583
  pinctrl: airoha: an7583: fix gpio21 pin group
  pinctrl: airoha: an7583: add missed gpio22 pin group
  pinctrl: airoha: an7583: fix phy1_led1 pin function
  pinctrl: airoha: an7583: remove undefined groups from pcm_spi pin
    function
  pinctrl: airoha: move driver to separate directory
  pinctrl: airoha: move common definitions to the separate header
  pinctrl: airoha: split driver on shared code and SoC specific drivers
  pinctrl: airoha: an7581: remove en7581 prefix from variable names
  pinctrl: airoha: an7583: remove an7583 prefix from variable names
  pinctrl: airoha: prepare for en7523 adding
  pinctrl: airoha: add support of en7523 SoC

 drivers/pinctrl/Kconfig                   |    1 +
 drivers/pinctrl/Makefile                  |    1 +
 drivers/pinctrl/airoha/Kconfig            |   38 +
 drivers/pinctrl/airoha/Makefile           |    8 +
 drivers/pinctrl/airoha/airoha-common.h    |  503 ++++
 drivers/pinctrl/airoha/pinctrl-airoha.c   |  720 +++++
 drivers/pinctrl/airoha/pinctrl-an7581.c   | 1148 ++++++++
 drivers/pinctrl/airoha/pinctrl-an7583.c   | 1078 ++++++++
 drivers/pinctrl/airoha/pinctrl-en7523.c   |  850 ++++++
 drivers/pinctrl/mediatek/Kconfig          |   18 +-
 drivers/pinctrl/mediatek/Makefile         |    1 -
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 3030 ---------------------
 12 files changed, 4348 insertions(+), 3048 deletions(-)
 create mode 100644 drivers/pinctrl/airoha/Kconfig
 create mode 100644 drivers/pinctrl/airoha/Makefile
 create mode 100644 drivers/pinctrl/airoha/airoha-common.h
 create mode 100644 drivers/pinctrl/airoha/pinctrl-airoha.c
 create mode 100644 drivers/pinctrl/airoha/pinctrl-an7581.c
 create mode 100644 drivers/pinctrl/airoha/pinctrl-an7583.c
 create mode 100644 drivers/pinctrl/airoha/pinctrl-en7523.c
 delete mode 100644 drivers/pinctrl/mediatek/pinctrl-airoha.c

-- 
2.53.0


