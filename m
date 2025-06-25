Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 206F3C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 20:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1b5d7p5CJABVZyYvwxIcwh6gOqXHYtgClZ331IuOAak=; b=GRBE4UVTDsu4jdvrUmxwmf5yVJ
	jdkm9gN6wIHsZ+azgnHZ37UQHVPHgHOLHvMeB3BnIdOYiS5l/E5u40G5VOTcQ1IdAH/DaZvFB7JGT
	x1M0L0StTuNVk6iIurWvA+yIGO03GiBDAx7Fg8sXGctRXDhgMyEyX0veUg1DhzFDPIfBRMxcgd8Wj
	hk9J6N1vdimHtgS8qIOhnMqbCWz4ZFWxO0GMxzKBlVdGtwQsXeWGEM8IbOTvEXaTCR1kaN+APaD+Q
	NZ0+cgvcxHBZWzXD9C1zF0M7mKFDIDVch2epFXK+xkYJCwIORm5LY83q0ZmOfHZ+kVsz2jhgDHFi0
	68FJqihA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUWMx-00000009o5x-1ewK;
	Wed, 25 Jun 2025 20:05:19 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUSqY-00000009G6N-1U7n
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 16:19:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q6eJ0ZN5f/ScnpJsGOX8OeT1czO4gpzH1aNXM9p2MVAellgks0k7yzG9gEqp/sDiTgWm4EasRvrenxJ/GPjM3dGxaDm+hDRAjgHfpPlQG8u0RppMIpwFFu+XKABohnkXoOF/LYps6tl2VCJUWF99aFQOG63gA2q+T0vDHEEC8h0dZZd+XGUCIa50rJku6K/LakHBG8uL+wK3ji3c19udr6wqaObZ01ccZL7rR0EGYeZpu3jhoMiPSj8tH0SVvTAqcKpi7D9TP9kSu/CXMAQZIGaxoc1SFIkQwKZ4uFxMEudi2cWv4Yw1DI93B2DrWtyZDVWWRXuQzc3klh/64JRObg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1b5d7p5CJABVZyYvwxIcwh6gOqXHYtgClZ331IuOAak=;
 b=VYWy8Zjuh8ctMHLT4h9KCYBvhzoZdLW81/qzim5HDnbBdK59M2lFd2o3AiHtFqHjC5qDk5CC9MNp3eWmiLp2eb6+MwCpvjLpLgS3WuEapH93+ZAOTh2lKuchCW4KJPLLdtRh04J4TeVD5++JGx6EFsOjDLykum9z0j15JXjPcn2+/7dgNLJKU/3e5NXj55V5/IPl//q/FhfFA9MbfGZO00kZzBuAz6khyFeCRPlvn2K6zoDpnL8HjE6EyGqqEg5tZ4gMW7KSQZvOXa9M/mIrGg1Kq49WN9noHcOQJeRlN1ttdvbnnuseDcJRqOe7W7blMZJbDnA68hSSSB3w9WBYIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1b5d7p5CJABVZyYvwxIcwh6gOqXHYtgClZ331IuOAak=;
 b=B4kEu/Hg47BNxQlyYKiIB6yNTZAdPbKbLY8El1WcRETN3humIXcjX3tXS1WuBGDa++JBZN86f7EuXUBRswD8w1vJ+cHJhXCOpXfZ3eUeZRKM+haDuG2d3cY4Q6t7VpmYHexyrdsBkmS6ozvIdhCwFlJmRSEJrhxVTp9Y1a4Kt2Bbo9hmDzKGAZ4jMA0dB6mJMbHR5cc3v0aTEaYARlvYS2bxdddaT5MOfwhf9OpLHZJkJ9g6i9hd0hwaF0SvgcYS0UvzWWVl7JpknC8eAuXmzeNdV9f59f7izPSUytEmoBdNYEIYagqo+tAlxmjQuzoU581tFxjcvDU1b2MRhv8DMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DUZPR04MB10037.eurprd04.prod.outlook.com (2603:10a6:10:4d8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Wed, 25 Jun
 2025 16:19:22 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.015; Wed, 25 Jun 2025
 16:19:22 +0000
From: Frank Li <Frank.Li@nxp.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	linux-pwm@vger.kernel.org (open list:PWM SUBSYSTEM),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/LPC32XX SOC SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v2 1/1] dt-bindings: pwm: convert lpc32xx-pwm.txt to yaml format
Date: Wed, 25 Jun 2025 12:19:08 -0400
Message-Id: <20250625161909.2541315-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR10CA0111.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::28) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DUZPR04MB10037:EE_
X-MS-Office365-Filtering-Correlation-Id: dc282399-58bb-409f-2414-08ddb4040b7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YqyNP9KnOGAw3FSUVShRHnwzNJo1YDeS/v7jTu+9DKY5iLAuJgCCO8vhYq/J?=
 =?us-ascii?Q?SX2pRL6+CwGKETEifJcAbosMs3W0pWYTVmFkj20mQy2hkqKO+xyM6sqgNe1Q?=
 =?us-ascii?Q?/IK6D7ho/nzeZnG39xvZy7y7l6pj18UVLpdUW7Glq8iNlzgpybI54e34XKDv?=
 =?us-ascii?Q?Je5eUYzVuDhE7xKEmsYdhDhaXa2eSc6BVLHrqaILELEvA5cBjafjqoE5Ugv/?=
 =?us-ascii?Q?Xg2W3Ta4goW9vNc7binmX9jEWKEwKvlmg9SCwBlJLP8fKdxzVImU0YAlz5G7?=
 =?us-ascii?Q?o+G7wYt0SU3z5ePi+inwePgl7V1uJQYcuNa2MFTEOxxw0sCCjXQxDORuCncA?=
 =?us-ascii?Q?YB2JEFx9guckOVARjm5ywqww35xyF8h32iE6E7kOEkpq6wvYwWZEzcn8w3IZ?=
 =?us-ascii?Q?ZgHtK0PTmzngz8VE1mEtfrDr/kPE18gJZsFW/hUydVnH6cwuTm3kO3o9NYQn?=
 =?us-ascii?Q?LX23TnJb3gi2fX5Hv5zn3gjjh3BhWQRSlkI1AZUpq456b+KU0uaZm3+Is9OU?=
 =?us-ascii?Q?PFKd/EJvTsdfn3NiZ+NHnEQMP6fX7lV8yX93ftIejphPmrniMV7KMhTwtql0?=
 =?us-ascii?Q?CMYJD5zv4ActyHln2vWLtYk514EYVH4eluKK3rchncxt1iqhozgdn+8jYNIw?=
 =?us-ascii?Q?V4TvSLJNbGR7YRZfZsQV6BxOX3m3UZP4aF0ArJb1CP8eHmW0ZcOlZm3ZoeuO?=
 =?us-ascii?Q?My++hwPgHi/XXIYUS6PbDEtGJmPsYlerql/bv0Zba8d93Jz3rV9Dw0RqjlqT?=
 =?us-ascii?Q?NINxsS6AHYB0Bj8lgZJ+xhnmS4T2Rv+a+CCv/EJRMhHUSh6uDrGQRZcEeKTj?=
 =?us-ascii?Q?RGD0DzXcJIxJoFBbHdcdYfdSIHAHnFtXihtJ59s5zip4b5VswtPYk/g12S6F?=
 =?us-ascii?Q?F9zvrUE7hbWCqf1r7j6oZTKfWem/nq0Am2fzNLrLi+NDRRT9Pzpq04/D7/BG?=
 =?us-ascii?Q?TqDfwSO+Cl1BeAoy2sL2Lt5mMUECmMF88r7JLPIEb0vhM1GpNWI9YA+Fp74A?=
 =?us-ascii?Q?2ROV/um1yuc56XApiuXqJ2NIww/G0F+5aq+gww2oCnvRvGCCrLyJYYMTOJnz?=
 =?us-ascii?Q?d8CMMBFn0anxrNcV/7+UprqPJfUOVw/f5vMOxLXfbt3DC91YUM9+QI56oM4j?=
 =?us-ascii?Q?orkG/RdsaYTU029GtYmbKdmszEl9SEUKzY6uDaXTioXSKbKZaYsZfIIKPeU/?=
 =?us-ascii?Q?Jo25uJZMZiIYp5fK+I0W27kD/rf/fvGanOAMWrI4mKQxUTbMV4He0WxEREHq?=
 =?us-ascii?Q?XStyrMKIAEUViSjYKQ49iHFSQDKnhcLojWBR0eYGP1DKsCAf36YrPuolanox?=
 =?us-ascii?Q?CLe+/zg5h/GwXCE/xqHEIwPOjNi/nyun1u2YTSscIYkZa0ABHNskGkHRWZNQ?=
 =?us-ascii?Q?5zzejqs+VNhu/aDJoMBXvqoeysllLIz6OLWNEhnFAN1HBbhce/sLqFFqZ9Ry?=
 =?us-ascii?Q?bXGK6ONUk90nsWJsSBkwbo8vFfCQf/4hFcMpwPdXCJEHJnrp0RfL8Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8Hm/nUwhtPo5E/v3EQzETGNYfyNBewtdE6xxmJ0eMb9YNu3CJ7ZWYzfMyiH5?=
 =?us-ascii?Q?7DkYTMRWPmkJxFlFFOZZ5DhKtZ+8Tnhr2XJ8SAcoKcpNHmWoor282iyqrbtv?=
 =?us-ascii?Q?HFc+uTq/S8rNlFkL0z8n5PbWzK0QPyii/ZlEuAuE4P0Xh+Lj9gntR8LW8EdB?=
 =?us-ascii?Q?5qXUuu+prhqybF7u1riFFVng3Wawd78hz7SxeMn9hWEszfQ/sUNm/iPOVPqR?=
 =?us-ascii?Q?157kRSlqGnmBlpBfiGKTAVdgr75TPDbpu36uovoXpkezaEY+ogZG55B6lOhY?=
 =?us-ascii?Q?iMOjAjvZS2QeJv/YD3UVKrYCIyk5uGLHiI2UUCs6KMmavtSzVH33AB+laJ0o?=
 =?us-ascii?Q?gBWjIlyFbKcR/UC27WouYTMiBHo73oiqwYA5hrFJ6ERLV/aVxE3qQJ5c7FL0?=
 =?us-ascii?Q?AvJRpT6hRyI/ie7/gCUrjGl7TF4iiOHzHIMH54p/BGU8CxEGR9rgZ9UwF9M8?=
 =?us-ascii?Q?snQm+YvwjCd2hrC/2HBMdZUhlaBIbNUnh5XnrA7HraYgjYWqz3tidxVah/Q8?=
 =?us-ascii?Q?ZHrR+meQEJtk5CVGdX6abwdM3NHSaIEDZucfgWsH88a9d/Z3GzALNWPB+yJ3?=
 =?us-ascii?Q?AZQccloRxb/RtrCDoRIPup3NfeHIbpDO6aMEBCJLnGMPxt13IcGvv0tZ+goS?=
 =?us-ascii?Q?r/rfnuRM+yLAcMpCBeijFHqx+YJwvTkLVyb63Y3+6Qm3j01kuGfl5xM2K+/E?=
 =?us-ascii?Q?TlZBfJLFKXUDM5ll9ar6hUKVYACyBP3NOA6RwH8od7LaKQOYnEnjSu+bt1Kv?=
 =?us-ascii?Q?bv2GclOtNgW5Je1OCbORfXmnB8viNQVLJZ/pfajG2Zx612H+Z1w+7UhWp2AH?=
 =?us-ascii?Q?1bxCA8UsQPcPvrVcCKv212VHS2g2imVSsvkjuMmYVXNpnqdSY2Snl18BQcj5?=
 =?us-ascii?Q?dzGlTzXAT0aeDM7ZkpRk64Bk2hPjZBHZc0HaJJON376/b+GvsMCGhTZEab8n?=
 =?us-ascii?Q?H2aVFxZJ3enPb8fWtTOOqolHSAaffcv0E9wkFTahLuFB9bAH0oH4rtfhBf95?=
 =?us-ascii?Q?00FXDXGTQhcDN2+5uUtK+Nf8+9Dtwwc/eT71G+Icy/Z+NXRjTOgx32r1ziB5?=
 =?us-ascii?Q?qvICt/mECACyuxq6IocmJU0GALkvIT/h4je7Oouxny6vm9gDwGjFTaZhBw/f?=
 =?us-ascii?Q?x+4jSgKEzcd2tHo56deVQQpJ/HsIv2HSUvq+QJRwxUkyvueGyYVE08PCKClK?=
 =?us-ascii?Q?iwxBAbzzLU7w/cN/1ob+ha57ULIIpogCzBT86OhsdQ0kVzv2Y8qsNgmbjY2p?=
 =?us-ascii?Q?EQLXIiYWcK7ZukFWu3Uj6jNfLdiJ7VrdQKw4nj+zh680SfgRNnQuelgIFyyY?=
 =?us-ascii?Q?vHMB5i/P+5dS3UeiMfedyzAU4UafcKVFcXUja02MiydJbSlYABNMiqykXhCt?=
 =?us-ascii?Q?A6pzXeuUysDlEdFj0LVc+YIAz8r6aJ1tAUi2g2kFtA4MaHzm2E8zJcP9pRYn?=
 =?us-ascii?Q?fLOQPPySCF2gu0RQV1pjfRAlokdf1Rwhdl8glprEO6bnCgmb4YTixqa+wvNg?=
 =?us-ascii?Q?iV7t9zgucd1KBf+BurN8hP5NYVAtTohlHY1WOJesu31FqrUefiVZz9osLNGO?=
 =?us-ascii?Q?VZxB90AkJc3JUJSMUNWmeZ+Mt1IpCTSGnJLdjVRO?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc282399-58bb-409f-2414-08ddb4040b7a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 16:19:22.4416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jHzvnuw2Q3QRhzbD4Zl7sVFo45H11YMtrjQUhLaibZ9JgZEQYzDmuc6oNycg3V0lLEHzcuU8g1ztloNcCqUCyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB10037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_091938_405596_EC2E5BFB 
X-CRM114-Status: GOOD (  15.55  )
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

Convert pc32xx-pwm.txt to yaml format.

Additional changes:
- add ref to pwm.yaml
- add clocks
- restrict #pwm-cells to 3

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- allow clocks, there are not clocks for nxp,lpc3220-motor-pwm, so not put
into required.
---
 .../devicetree/bindings/pwm/lpc32xx-pwm.txt   | 17 -------
 .../bindings/pwm/nxp,lpc3220-pwm.yaml         | 44 +++++++++++++++++++
 2 files changed, 44 insertions(+), 17 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pwm/lpc32xx-pwm.txt
 create mode 100644 Documentation/devicetree/bindings/pwm/nxp,lpc3220-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/lpc32xx-pwm.txt b/Documentation/devicetree/bindings/pwm/lpc32xx-pwm.txt
deleted file mode 100644
index 74b5bc5dd19ac..0000000000000
--- a/Documentation/devicetree/bindings/pwm/lpc32xx-pwm.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-LPC32XX PWM controller
-
-Required properties:
-- compatible: should be "nxp,lpc3220-pwm"
-- reg: physical base address and length of the controller's registers
-
-Examples:
-
-pwm@4005c000 {
-	compatible = "nxp,lpc3220-pwm";
-	reg = <0x4005c000 0x4>;
-};
-
-pwm@4005c004 {
-	compatible = "nxp,lpc3220-pwm";
-	reg = <0x4005c004 0x4>;
-};
diff --git a/Documentation/devicetree/bindings/pwm/nxp,lpc3220-pwm.yaml b/Documentation/devicetree/bindings/pwm/nxp,lpc3220-pwm.yaml
new file mode 100644
index 0000000000000..d8ebb0735c96e
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/nxp,lpc3220-pwm.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/nxp,lpc3220-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP LPC32XX PWM controller
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    enum:
+      - nxp,lpc3220-pwm
+      - nxp,lpc3220-motor-pwm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  '#pwm-cells':
+    const: 3
+
+required:
+  - compatible
+  - reg
+  - '#pwm-cells'
+
+allOf:
+  - $ref: pwm.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    pwm@4005c000 {
+        compatible = "nxp,lpc3220-pwm";
+        reg = <0x4005c000 0x4>;
+        #pwm-cells = <3>;
+    };
+
-- 
2.34.1


