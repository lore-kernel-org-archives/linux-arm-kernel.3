Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A87781061B03
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 14:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M88k7cV7sQskWlJNqPF05z2MBOWgxEO+gJMDIFjfhvM=; b=kJm1N/3PlqHtL+UimMFXpghhsG
	G1jhHz0YiN4X9Qer0IocERpO3eFaBKTkSPZSqFZv8HgOqSRsR2r2C637iKGWWKEBbJ+Bj86chVnsU
	SEKg6AuaPTprocjL1kdZ4AYOOxsfuzkUsH48mRlcEXxccl3wM6/0KkcgcBm6WDTqi73DyZM+qmO3E
	CDhiDJmdlwlgVbyhXFyHtypL0TDPfBsDS8V8k3/gv3VtqpjLEOjDTNFl9hWooUCzuOKv8XyNEVP/a
	HPDNwCxMqVglBgoSpTOQMppEgFlcwql3qx8HErhWESv7a6i/uhZ4nw9QY+fXAD69/Xhi+yQkOqvr5
	ek4t4b4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Dct-0000000BQ9I-0Zl7;
	Mon, 30 Mar 2026 14:29:59 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Dcr-0000000BQ8i-0W6T
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 14:29:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eECcNTABHpN0gFvFVoUPoZQMbq4drzgY6yg4f98A1GMx8NVLwI/lhiDyvbOZO+g/zrsfoXTGQpouZI4BWMFDa8bD1ONtfeejMz+nMvTlbierM2q+TMFoQz2Vga9ga0waMVK6vSE2vRwW426arKFiy+1uzUVG2lc/YzOZXtv/DdUqBHM5hzIJXskfTn3slLFR9d0x5K8kZxmc4kE3Ukwt/EkkO3WnLlebu/A2WmQCWhbL2O7Q7CqKxPVhSrMu0wqSg3IMHwkXkfqcUVfiV0zhJRtSe7RlsINM+4xt5ZoP/PJ5qjLPdB002so0FA1wwn6DSpeE+NwwCvwvjhJCy8aJFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M88k7cV7sQskWlJNqPF05z2MBOWgxEO+gJMDIFjfhvM=;
 b=m0VjoCEld1e8ToqhIOkHVneqQaVm7oBtt28uE11KBO4nSeEYApEfCJF+/EtYfm0umoA2fA4TPa4xI4jV+pGXh5ZDnY5kebxWlqtKEI+k7PweLpO4zIJ8aLNu02MVdy/8jQNwcj9YNeeW63mf/ETrCkJ2Ej06Hawd/wCPCxmykg9JWVxoqqTXDUZQ8/fcPbYDVFoUyfPK1aTisWgHZMwsrlcjJwGeMCdbBu8MoHehDT10CcSZmQnlTMCbLqwdGANUyMipYBjYeHDb4gjRc4x8dT6IM1WRqf4grYyvkK+BNRMQs/W0sYV5vETb1LT1krqdR3VTD/mFw5aIRThfS52pDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M88k7cV7sQskWlJNqPF05z2MBOWgxEO+gJMDIFjfhvM=;
 b=RZGbiESStzJJcUeXV/c+WGeYdnqrkOaf5l41xqTmN4H4QgP7e5Xaguj+dwebdfbY21bCd5kLa5dUPlyU7DKk24/zVdAEGV6w9xPAo9ERei3tvIl0yK5hG1HjGuW70ELbU8ZWteuNe3nmogdEXZUu3RgmJIqN3f7p75SmkPDtawUnvYD4KXG5Q+2Iy7VRc2WdSfY1M9nksjrhe2rnppgyH5jBwYfvbK6RF6/6p4ZBw6v9PTE1CShOuBAPd3tE/rOxvPCAIu5LjPZGwccYogqZr+q6Bi3jRVPrsTfTDMLZRboOBFZ32PXLpUmP4QyQLEbKKxY4iC3PI0ThIHlHCFguiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB8957.eurprd04.prod.outlook.com (2603:10a6:102:20c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 14:15:11 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 14:15:11 +0000
From: Frank Li <Frank.Li@nxp.com>
To: soc@kernel.org,
	arm@kernel.org
Cc: Frank.Li@nxp.com,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/4] i.MX drivers/soc changes for v7.1
Date: Mon, 30 Mar 2026 10:14:39 -0400
Message-ID: <20260330141444.3789193-4-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330141444.3789193-1-Frank.Li@nxp.com>
References: <20260330141444.3789193-1-Frank.Li@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8PR22CA0023.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::21) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAXPR04MB8957:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b3b9e12-98b6-4f80-0db7-08de8e66c13c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|52116014|1800799024|19092799006|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info: 9Zt36nmGliNAwyFupQonm8Psyw48/7V1VbfC1hfE9ou+3ZI8hgys0XOoO47N3C41mLwXIFj6qp2d4YtxznrnG3JSlaC7fvjd8GT051LWJElrXGiImttanGHZOVZgxGVIVgNvMb0ctohg55/tTWNaKosa0WZaPcC2WX9uXN0EVfRW4GM+AVCTJKoDB8cd7q6k9GthDdg1144ClhZSKzkDn7nYI/5UUF/mORJP/mYaoz/pm47DT8BdJZnOeTz+JDl7vTkWK3JUhKZ5urL4hFdbMDvPBWmXH14hd3pb4pg1u7l4x0J+e48Mg3ud7gZbZYYqLQC6UjcVVntb/IWSG1N2W7o4yUaCbUP53b+beAy3hO482ych683gt0EYsRAcTK72GuDuPQzksQZP+n2nP5xFvdVUUuN3WYD31IQKMbga1+nS2RsGGnz5GRcwO/1cZHn47r/rCsTTKmq7AVV7/FbBZMNPgxHZBhJ68Gsf92AdoTntSCUneRXZzcvrBx3QqcuvB6ufw4sH0nZLikODXnZ+svhSP9HheftlBYSJ2aaKD+jADwfCEvftbeOfxKGHKw48MP7pNlt2cvPvL0Z1G+zGNd/zwkLa83cOZvJZfL/srNAjvPzLaUtHXEpUbSrR5hM4h9628/LwcxKJjUv5NNy/90YqxfRsDfS7bqexQfTI0d2dj891bc0M9jjxbDHFUE7m+Cc+MtXGfY4pWKK04/tKOt2S7LyIFxUYxcjSJHX0qsqMFOa5SeOoqFK+9YcEo0TtBbx0MahQZi5eA4Eqw5gQVCywsAIy44AbHUB3JFURgRY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(19092799006)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OUh+wMUY2KSS+G6KjnCZCzj6K7/nU25t4RJwMfZ98xXk9sMxpdmX/813yLjE?=
 =?us-ascii?Q?096KZ/W8oPjrn4zV6XTlX2OiwHAkLIQS7U92/5sQLvXiYnDKfmZkdV5WlCiJ?=
 =?us-ascii?Q?YKdBX7BlpYGGJ1NGH6b3yPKR3So56Z+5o1ZNqzKuIVhkaIfcnthPBf5rM0jy?=
 =?us-ascii?Q?LSR85n2oJq8Zuj4mR3E8ev8acQgoQ4rQagTbSrcm1XrNxWp+oGzy+igynQVp?=
 =?us-ascii?Q?Q8Biu9B9mG7uK71cbVmuAgVn2XNJApV2kRK+P6NW6k9u+sUL0bqMSgcyBcO/?=
 =?us-ascii?Q?50M2XULWpOIJ88z8rXZ7nAbAoSUQ7mpYJIWHyvJAmOnZ3jXb7nEK9C5KSBic?=
 =?us-ascii?Q?7OfKZXpKffGHCiOOiIr2rW7EgBnTuyRzrQKNLZMaEg2fmMZQEUWZnuHoXnNm?=
 =?us-ascii?Q?7U8BdEFHAFRCWlByCsjJepBpIulH42RI49z/n+JSmT48y859pMfhZBVkjVR5?=
 =?us-ascii?Q?ZJSfeN11HUoS97rx4hkuKL4ouluyW992otGWwFLX8Qp42PwOsMz7pa3Ioe5H?=
 =?us-ascii?Q?Fn8UTHNRxbdwLogPMK3BSUNFY9ZGvYEkV+pSEtybeplh/OzuW/Q0NlIEn5nv?=
 =?us-ascii?Q?Y/TdLKgb23jElLzS37YOu9reH9jYiSBeJMvKGaAFs/Qtj+znpfcxwOpgW9M0?=
 =?us-ascii?Q?4s6pzgpa/BIOcdHTmUAEhY8CJi0ok3z3U/i4VRKoIMvlOACE27DziwfchomL?=
 =?us-ascii?Q?XI5+BwvjRMcAr7OF/IGhuyzpdc8Hct7zlUguN/VSnaFG7CurpLbYVZFoThCO?=
 =?us-ascii?Q?TM5naX12Qatdz+TyIESC6aHPn0M6u9uWHTQIE7ETd3HWOK63mW2V3Lo7s+92?=
 =?us-ascii?Q?QQuoAII0YWpnYAAGL90Uh/RsACbvzAUgZB9d+jiaoBrdNPs92ZgXmfB2znsE?=
 =?us-ascii?Q?Y7kkRXeOzXTZCeq/c7NBEM8bjmo7o2bK2m9dc80U+9q462KqLMtWexzfaMad?=
 =?us-ascii?Q?UHtWlHQthrong07WFFRSc8hpX1WN8Aa7//QUQ9+ohxwr/bHGxrwjwvnWcfSk?=
 =?us-ascii?Q?wGYcMAMoPIy+FOeZDGJpCD5G8GMrzI58aNEweRyw18RQD+MNvYsi1nos0OVm?=
 =?us-ascii?Q?oMUKH9RpWTMY954TC9L8Jq+gg4iS39sAh0Eexr4tXAUCB0LoANMHOuruWHOz?=
 =?us-ascii?Q?tUC/28WIzqqJqia5tT4d4a89ZataeQs7bWjNuShWIER7EiSaeIdtmYSThpdw?=
 =?us-ascii?Q?kI5q4d1yjltaiOz3+lbQ8E4Jc/WKret2Fapn6P/PLlB2PVTA8DeL2uzB/rpV?=
 =?us-ascii?Q?IUeXyC9F0Zlp3amDTVpkTxJJDj6uHA+pwbT1lCu7LjmNhm/ph0xhvm73EDRi?=
 =?us-ascii?Q?Bzl7e5zPtMyKoRgmLLej7EUCCAPvbn3IHc3H3wfJE/Q/LTo4odLlChOIrWdn?=
 =?us-ascii?Q?ONokEOR9NWz4JjHEwXjOVu24KyvAJVvNNqWlY3UmIjlOSq8a0ZLUdKnPsDg1?=
 =?us-ascii?Q?OKudwCHyt60rpndA/ELGfDmZi01KcCxHWI9XkCea1e2kSRlMjr2By1PJOEzr?=
 =?us-ascii?Q?3EW7u3Bejierpjn0qL/zqZFlsoyo8+5uBxc54bUu9H0V7rFnb+KGBUve+jqL?=
 =?us-ascii?Q?+VCZ9Shj0vWcoZ93ih1BW9kAX9+I0yNzXYU1QZERQv9oQCd9vzNOx4HPa5cf?=
 =?us-ascii?Q?NntVDNmRwO1bXGLRLp4TduneVo8s3h2iXi3T+WxTRCwO1xxVNGcP7Wq1i4u3?=
 =?us-ascii?Q?qpxkvT7xSLUFAVEutJQbnGUHHXhXdihY97tar6JeErR2cYSNA2J+11hDaTMQ?=
 =?us-ascii?Q?KklgnwKtmA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b3b9e12-98b6-4f80-0db7-08de8e66c13c
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 14:15:11.6379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ko8L/6xs2c+z8xxupXK9cZOS0868Ctvgox5ISHgxX/xKpA1o2ntq5U2Y8Oc/wtpruCq8KRpEaTM0KbK/9qddfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8957
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_072957_180256_CCC5FBAC 
X-CRM114-Status: UNSURE (   8.51  )
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

From: Frank.Li@nxp.com

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git tags/imx-soc-7.1

for you to fetch changes up to 1b7c834dedf9933447c424bfa01348f9dc3db4d1:

  MAINTAINERS: Add i.MX team to all arm NXP platforms (2026-03-13 11:00:45 -0400)

----------------------------------------------------------------
i.MX SoC update for 7.1:

- Updates MAINTAINERS file to include i.MX team coverage for ARM NXP platforms
- Sets default values for OPACR (Off-Platform Peripheral Access Control
  Register) in the i.MX AIPSTZ bus driver

----------------------------------------------------------------
Alexander Stein (1):
      MAINTAINERS: Add i.MX team to all arm NXP platforms

Shengjiu Wang (1):
      bus: imx-aipstz: set default value for opacr registers

 MAINTAINERS              |  3 +--
 drivers/bus/imx-aipstz.c | 15 +++++++++++++++
 2 files changed, 16 insertions(+), 2 deletions(-)

