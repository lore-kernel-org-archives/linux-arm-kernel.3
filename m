Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2FF8CD13DA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 11:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LL+b4A2XgoZ0Fcy+RMJL/DTlhQ4iLWtzJ6lz/ZOFiOg=; b=Z8N5YU1HjfHS0cWoKeCzDROMi5
	sL+G1uMIXOs6sKQnJr3VVgZbOG8VWjCIiB1lA2ETYpH1Y7r58pvWULja2nZ/o2UZ+E1HcTOawoelv
	Il8DwY1h6v+f/Qf0KZ6rUnzoGTk7V7Mjkh0sLRc1uTj1ND6OlZmdOWRTpHlSdtOoQxoxZrR/rDUch
	wfVvDmoThIS06xDzjdGNvqGVr9K5vDqmHES7sAGmo1RztfpRQk+svmtrtuGIAtkvXFjUxlUTGu0U8
	qbe1njpk3roxIkDv8cfVd5sRXMMbd9B2GlZU80SLCG/FihjBIg9eGAL5h8nFP6/o3Jn8QzhGHNdw+
	dCeQ/ueQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIPFx-00000005HIk-2cQM;
	Thu, 30 Apr 2026 11:08:33 +0000
Received: from mail-westeuropeazon11013037.outbound.protection.outlook.com ([52.101.72.37] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIPEx-00000005G2z-2M5M;
	Thu, 30 Apr 2026 11:07:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lpXFJlwMb4ftUx+HwGKkiZomOTHD4qtLa5cko7Cf9Leypp0fczkt7NtR+Ldq68zUHcnXyHpFfT42BSAq8qj/AkFd7LOWhxe3YzfR09emI8eqVWItn/khwqi7hVdoPeK3KcVRAevEmHzkUNjw6+KO4W33YwoXc3bhm9DAGccakMBQvQ/RsWmUJBVHZjx9boa7vACpQVB0CRWtk9KQbfWZUyFfQUdpb5J7E/K3yotfFyvV0KKBdx3IR6lk3YdBkz9tCcw5GyaDrt+EV+zeT42q9kJdTaoRF8n50RMSlGzLB4V8YSGimGf5gJWe9pijIVcfy6RsGVyCkczTXi/WBK0M0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LL+b4A2XgoZ0Fcy+RMJL/DTlhQ4iLWtzJ6lz/ZOFiOg=;
 b=W34IqzvfqSgzeQf4YOV/pJjqFhF5F4USTbMSEG0n3gjHCFjuqSPHU8/wO7rLFaDswIUEU028VF4AUbCUEXcY4Kok+VZigp6wvR7K9oKNUNkCJkg6pePCSRi8z4/MvkVQGV7ru17Z7Zm3bkyHwWs8ua2cdPr1+LRgb/83sPPLNyM9YVyXu4GcbO73PVG61CI8n++r1ZlXNyAzB23Tua7JdUxL/gV99PiLxmH67OELxrbZr2TQc4hdB5JLL1SgMVAHFNEus5xCVR4Tv4PFs0bXR8z3vGqszvgRI9x26ctjjoNzVXK0mezhfNq5/7BVLc+UejEsDT+GIlO70lNZ7v1/dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LL+b4A2XgoZ0Fcy+RMJL/DTlhQ4iLWtzJ6lz/ZOFiOg=;
 b=RoZX5RZJDxIymNbFgUurosnTRPnIVeYyXBcCtCrXlZ/OYsTsWQoSBCP/6kbaFbVUFU8ReHivsU2vQm2vct0vpqC4dWpwcrpd6ruAMEUYqzyiFeabanVrYcYYU8UgMvu0HZamPYIfvsYx4Bjuf9X55H49lc15Sb/hpRt6SPkWmiWbdnMeiKWKct2f80WosQtM0SBZM5kOnhtdRfbFizFJDd+rPZ9cRfhdfoyQgZX/Y8rWCFp+GtSgz7Dkt77SxRtVA6di6g3hKsN2r4x3axK8Vl777lVAIXfjbSYgpfYhevD+qQ7XnWlJEJKRj8/x8eASFz/qLODrRKSqtlPpULFliw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by VI1PR04MB7182.eurprd04.prod.outlook.com (2603:10a6:800:121::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 11:07:15 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9846.025; Thu, 30 Apr 2026
 11:07:15 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: linux-phy@lists.infradead.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-can@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	spacemit@lists.linux.dev,
	UNGLinuxDriver@microchip.com,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Subject: [PATCH v7 phy-next 11/27] scsi: ufs: qcom: include missing <linux/interrupt.h>
Date: Thu, 30 Apr 2026 14:06:36 +0300
Message-Id: <20260430110652.558622-12-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260430110652.558622-1-vladimir.oltean@nxp.com>
References: <20260430110652.558622-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR10CA0027.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::37) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|VI1PR04MB7182:EE_
X-MS-Office365-Filtering-Correlation-Id: 868d82be-d377-4977-54fa-08dea6a8a32e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|7416014|376014|366016|19092799006|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 3iS/9QXcA5nbbZqmZ0fOIDz1T6g9KSn+4Wq1L6XVn5LRAf413txy8eDdCPHbc+e9k6ryHqhuIRSclqdU0OI+kXUqvTs97g6qiq1+D2UQ6q1IebtZh2xPjXneSlt9+nFpgnluv+4mKgNPGe6fQsO7Y9P+waWgd4YWxYyLziAa6943OmGNmb84nulAXPP9d4LQ0I/IMU1AQ1Sgz3ypcNQ0xtmh0h0OXi0AVHeP7XjWcgRzjAmiySfdp0B/XQfteXKaM2reDlwwTriqzZyp4SmJSYLsytEmmtCmynSwwFMnqEj0QqCHXzWiZu5Owj7wl3JcKHKAiLtCkE85s0YD6w/Q8U8/TmyBv1xmVTPExc2s7uyRsIA/jDpSZT9E/gmr3lARQS1T5OackXLKH6oeB5dcQfF9B5c808YG4blfw6TuHD4hOGFaHtOvEWW2q+8/ANufxSLDY9aDBPUv8P7UD9h4vc1NDJQT/LH/r6y8wvsW1M8ynXoe1PHt5jIa7iONkaWxT0PTPFwELttflHOSX5zTjyGKFpNrybrqVwQkkS96KY7m5RU9QlrVIOkckv8QVIf0dADWB+oxW/UdjS0i5Ljov/KZXLVuiwXDG7180HvV87Jpe2ELunarfqR183NU5R5gs8j7l+6E8qKQLGoWaCu2M/Xk0B0d4NUbR2TYzSDh5GikJnlgvAy0mfP/Ndgy9aL8tmwcdpYOeE68KWkqhdiYIO6mzaApX6CSNmk3VJs5oEU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8585.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(366016)(19092799006)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZMabVl1GkepYr44drqNX8DPEdMBI5O6LKX0xlyagpogjUD5hzidc6Qu3f+ZM?=
 =?us-ascii?Q?KNPMhfZKpRGrbhHLewYYRDvVUQjEedF8eAywll6ca+MDHDDgqtNJEIwpiE3J?=
 =?us-ascii?Q?hZZARA74t/2BOnXGnpuAIU33TYda5rqDi5wARHrLi0W2g2hqwU7ozsJGBkNu?=
 =?us-ascii?Q?YHQjqgVCb6HiXNcsrQ573IS9ZRSyEIbmnZHR04F3F2u5dD734g8ujIJZF3Ny?=
 =?us-ascii?Q?FPpUYmMfRj8tIsYkfrJr1qn5THAllwoevBwt/sSF8O+wLnPMRik/Ca42wI2E?=
 =?us-ascii?Q?U2L/kwJWBQwOqJ3B7AgjpffjvHKFWvonUtGZcMKuSU4iHKmFqrLpptjnHVpB?=
 =?us-ascii?Q?x8IsxpJxG1PkHuOFEl8/y9fg/BY2iDU4cZ6x6r3Kem6KrSJvkHJ3NvsZNk1c?=
 =?us-ascii?Q?VoeIOKkY3ZOniJ2RckW/6CCZAgWyAQcvyfxeoJxgatqY9dCiUFVjZv48aCc6?=
 =?us-ascii?Q?fEOMs11HmdLBMwORaBUQzbHZUNeui0EnzeN4bEJvxxOwMSCrrs86V2wqxBGq?=
 =?us-ascii?Q?m4Ap7jr6acztDUBm+Pqs3+SmEfsGXMuUYnKlFrCepreLgu7eo9zOTW1+Q5lh?=
 =?us-ascii?Q?LrrT8Q3EuZm2P7K+gQpazlQQXa3kLhd/4KIPKIVVv/4hKepfw7K68uM5E6sZ?=
 =?us-ascii?Q?3GnUML6qEho1c5+wI/LD2vDKE3YtYVlLSM7kV2S+oPTmsGYucLUrh9xCAGSQ?=
 =?us-ascii?Q?Gr661mgZg3cBonZNGg2yLlYrJ9Qk8/Q/IYRUj9yM+CfOp9T+uZlBOShEzJhp?=
 =?us-ascii?Q?u5+8wG1o7joN8nK5hqjKLmztgyKTo+FfYo1gqykSPDKn3x7t7XGBr2ln06kD?=
 =?us-ascii?Q?m2avRFxS26VBI8lzjhtM4hP5GImv+fVwN79CM2KihuaRzWfuPbV/HaWeFoDd?=
 =?us-ascii?Q?t1+Llb4120GjlTDeVTX4Lns8A7+4t+2e0Q1XXpqscUJQtZ7Nq5iBDfTKJBTC?=
 =?us-ascii?Q?8J6OKNMYN3/WXGhbuE0mGcDYYnCdmgiPAZSI47Ny+tzxHNPs2h5ExM1HciuR?=
 =?us-ascii?Q?Z739kLXqBahNdKpodI01PS0rFLtRNbf4B1ZlMFI2g9Ba07ZfFM+pJx8tQIhc?=
 =?us-ascii?Q?+AKkmQUeGLbJgUNetrnIw6/6E3pqnt5di4V3wnejGR4LqbmfMVwfp1BHrbAe?=
 =?us-ascii?Q?UgwZSzmWesEwdjua896E/2Zq3c3BZ31kGe6rr5cUM2JkFw2BnR3fNtDg07FG?=
 =?us-ascii?Q?PaBxc1P55hX1btDvxFb/vuxz5ZIHZRi1C/4ilazlzfPz803ZZ/rFg4VJpUda?=
 =?us-ascii?Q?uh977rleN8tC/0ioe2GbA49ZKR+jb77tzAJ4z8GqBPbCkC2gEf5OU7++St+x?=
 =?us-ascii?Q?laRrb3Vv0F/etfHR9JlKdiBomUv4Cf93AOQ4B0EpBJAF7kjvInABpMH40CV+?=
 =?us-ascii?Q?z2BbHdPvgd7blTts+SNwjunGLikUU3sgjKozXjsZbWRV7oKMycfM7Q+ts3pB?=
 =?us-ascii?Q?xqHDgTfARbq+BUNT88XXI0EtPirJXHmTgXEPCrOIny8hBBxlfsPpF4olkLU9?=
 =?us-ascii?Q?z/bwbk+lnDeokE42HBm1ntpJ2/urGoT/LrLPgNuDhzx28zdymYuoHOAGcjpJ?=
 =?us-ascii?Q?IE/uVohm4GRRMTD8InmmVu7O2BB3NJO5IgfLCLNRgR94X7lXBLtXpIW8C4H1?=
 =?us-ascii?Q?J7nW0oBVSDwhxJvO819HRk6qlOdT9wvXp6dUJZ3n/6G+0u6ktNiXS7nOrvyU?=
 =?us-ascii?Q?vWaM6Jr1GsFqY/Ip0AuHPI6xhyC0MNQo260ujlt0F3T/0pgU1YtfXxKeAkfy?=
 =?us-ascii?Q?4DkzgULsY7c6NeqNxnnAU1vgyqIIf37Y9IX94xtNr6t5drfqOM1B?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 868d82be-d377-4977-54fa-08dea6a8a32e
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 11:07:15.6565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xXgGFea6ZlNTdV1Hqqz5AWfl+O6qUYC2/0bHz//+vr76s76G2ThyKMKpoy05BIF7POUg+6ltdhrKhOkNala03A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7182
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_040731_604737_C83E41C7 
X-CRM114-Status: GOOD (  10.84  )
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

This driver uses devm_request_irq() without including <linux/interrupt.h>
by itself, which would lead to build failures if the headers providing
this transitively were to stop providing it.

On aarch64, we can see, using KCFLAGS='-H' make drivers/ufs/host/ufs-qcom.o,
that the inclusion path is:
drivers/ufs/host/ufs-qcom.c
-> include/linux/acpi.h
   -> arch/arm64/include/asm/acpi.h
      -> include/linux/efi.h
         -> include/linux/rtc.h
            -> include/linux/interrupt.h

Whereas on armv7, the situation is quite different. This architecture
has no CONFIG_ACPI symbol, and therefore on it, <linux/acpi.h> does not
include <asm/acpi.h>, and <linux/interrupt.h> is not provided that way.

It is provided, however, through this "fallback" path:

drivers/ufs/host/ufs-qcom.c
-> include/linux/phy/phy.h
   -> include/linux/regulator/consumer.h
      -> include/linux/suspend.h
         -> include/linux/swap.h
            -> include/linux/memcontrol.h
               -> include/linux/writeback.h
                  -> include/linux/interrupt.h

The point is that <linux/phy/phy.h> will stop providing
<linux/regulator/consumer.h>, and this would break the transitive
include chain on armv7.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
---
Cc: Manivannan Sadhasivam <mani@kernel.org>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>

v6->v7: collect tag from Martin
v5->v6: patch is new
---
 drivers/ufs/host/ufs-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 872e4effa60f..c7a02f6ef504 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -10,6 +10,7 @@
 #include <linux/devfreq.h>
 #include <linux/gpio/consumer.h>
 #include <linux/interconnect.h>
+#include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/phy/phy.h>
-- 
2.34.1


