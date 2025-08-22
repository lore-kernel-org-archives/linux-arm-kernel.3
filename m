Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FECECA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 14:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ujy6fTPs0OX/0qWOLBZ3jxfxJPwAjlM4FjiBE7TUlMo=; b=15QnbqG+b7eNEWShoBs99exeTP
	W5McRg5KFuSQZM2BclgDuuidJNvYWmNKZIgEK+/81K39dkUZISDu+/gyYwCrxIk8Dof/JaqI8nPbD
	sVwNGnI/7da3POpRjSnpBs2gpDomO1HvSfzKBbpb1pPn2rR4t3nsuH53VMDbT/onTw+/Xk4O7n7aF
	ecmei9R2ifl+FqIN5ekawt57Yp29/ITmeRbWjM9UtVSEiPqIyBPtof5yhTrY6t2CfJ9zE5b47N/x4
	G4uhvVQr6TO/U0iqmdjjQQk+eVhZe2YxGHuM5VMtXzyFbRPnhj+B93DfWj2yScrI8P09utFWXbjQ4
	7BSKk0hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upSd3-00000002nLC-1oss;
	Fri, 22 Aug 2025 14:20:29 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upNO2-00000001yEY-0MMg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 08:44:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fx7Bb3mffGwDpepqVzgmyVZpBfR9wIqm6ObGgxXzXTX4KPJL8a7pK5KjZKJZRoAWJSyNETi9CdCZu+OwlpVkmvf0X2Q8SbMlVzIHWQ8oVvfNVuSVAtco1KLthby1NjboKmk0wFL4Zfn0hLvRhyBaf2luV1uhHXTfpJ6OtTQZobyGi7UbSGcWYpkSdLZgwz1C758nKrfqY/NwSxj8IHY103pFuftf/QlI1CyGh+LBmQaJT1dWpaT/AvwOfHbJcL5sZ8x8DUUTUCJjdxVr0yduTE4A5bfnhPnkvYz83GFRUIZLyfuimimsX4CY6TKA/Mm3WiXOIaTTwXyHT3NxGio6sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ujy6fTPs0OX/0qWOLBZ3jxfxJPwAjlM4FjiBE7TUlMo=;
 b=hEYNkLfyY0YnHsFcavuoWK8IEynKwr6jizao6hG/xeyyoXwpYyvOm09reBPOfWO77utt8cY8WTLhrDldi50z32m/v026vSed3sl1nB35EzNThvvc2UOXB1eOUMwV8lU0gP/8N27rlrStx+K9P5lX7lo8mgfHXIQYgciQN66Pa62m0T7sx2joUnmHu6ayncMB+jkUfAn3+WFdotkLndZK7rpOYzqETtG+IUfCJq+J4sKQdD977t7rdLw1G468kPEzZJsQvMpjZCo6OONrYUofeo4RzDnLY3/FJMfyT/bWw8Kb8ptf5t+M7Upr+4wzr9Tf+367LguHqqNC57NmXni7jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ujy6fTPs0OX/0qWOLBZ3jxfxJPwAjlM4FjiBE7TUlMo=;
 b=LiWPml4ed5ySnA0pghqViaQtXx6Upd++Ms2I6wNYDYW3yZDl78G3GimYsMxaYyojO2oq+KHoDX4hRJ2aE6J6d+nFXB3oQMCM5njKK+txi0j5acUVWCbvcgCMWXeEM+SgGfjA+FFFQNgB/4mTurPZ+LyZTIJNiCtTQVOoqx05vqKQF5pFvQoga2rxatm+FJdbpYc4XYyawuwIA4RoTJQ6f/7MW6w03nps/MxOtJzShGeNdqkY/LdNrbkoD9tLvrAF+hHG0l4V0K1jnYAM7LayPXuHgRxT1oLc5zVFQIYyrthiUPRTeSueCahjZBc4z9sdQ61Yl3lfRB2cigHrjLUIOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com (2603:10a6:20b:42c::19)
 by PA4PR04MB7630.eurprd04.prod.outlook.com (2603:10a6:102:ec::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Fri, 22 Aug
 2025 08:44:29 +0000
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86]) by AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86%4]) with mapi id 15.20.9052.014; Fri, 22 Aug 2025
 08:44:29 +0000
From: Richard Zhu <hongxing.zhu@nxp.com>
To: frank.li@nxp.com,
	jingoohan1@gmail.com,
	l.stach@pengutronix.de,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/6] Add quirks to proceed PME handshake in DWC PM
Date: Fri, 22 Aug 2025 16:43:35 +0800
Message-Id: <20250822084341.3160738-1-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0047.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::15) To AS8PR04MB8833.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8833:EE_|PA4PR04MB7630:EE_
X-MS-Office365-Filtering-Correlation-Id: 41e88709-7134-41f0-8c06-08dde1581b35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|19092799006|52116014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uUF46IkiRmBdUgPNKpJS8JdaacarpPTlmiZdur6xDAw7pjAxMoYzQjfGnOUB?=
 =?us-ascii?Q?7Odhz2sMcDnFnovEE2eGuV8/TUgExVQ7QzEKAC6BRIxRxg6Wr8A6rUw5k2Ho?=
 =?us-ascii?Q?y/1scLIWerXDm/teDA2N7+/HgNqV5l+qB8ccXAZqp6s+JFIGCRAgzwK+CZtm?=
 =?us-ascii?Q?mI3Zwts5rWN+k2HZaUudTLGSk6B3WHlxTxX0cMGyVlrydU3Ecbzs5t0tXU4w?=
 =?us-ascii?Q?culh0Ht1Lc8y91dSq33ZSSVSwN6ZgAVph40/REyyz/S1CJf/GscD45nnAw7s?=
 =?us-ascii?Q?4c+cN6wFum+DV8qTqQCOR2rwJLDXn5uUGwsiimVC3umA8HGc8k9+oEjJNgGj?=
 =?us-ascii?Q?xLPN473SeiTjKLowalzZ+ffKD91ZaAKo6veBnnzZgCV1Lw9asu3j5v0lLE7A?=
 =?us-ascii?Q?B4KONIwPuUWgY0ObJpgraovVilWIo+8Wnant9fNxegzV9DChfZRPdPvsK2Nm?=
 =?us-ascii?Q?zpTsCtb01Qvu58XzfJUxPhTn80ULoqGeJXD+UBN4vec9Ypb0RcTwruw9W2Rj?=
 =?us-ascii?Q?RN0fxqPAAf/6szMNmkmc9BL2QrvUZ1RGK0cSd7rZ81SSZrBDjXj6XfP8Pu/S?=
 =?us-ascii?Q?9127XylJavBEM6C0VcO8aelok395clAumPlIWu3JPS0W6c1QgaSywOrQ6yWd?=
 =?us-ascii?Q?hvIZ5+bBDjtYqukwkPcj8DBIVgEHGCOq1ie9x5+pLfjEe214NZK3vYG3ia1O?=
 =?us-ascii?Q?v9GOD8NOhJRrIjb4GeRx406oNed188AjOWmBpKehX+4esDaYuKkDMcaParxs?=
 =?us-ascii?Q?51UdrqWB/SqLn1rGOyh5BH845mZjosHPr1jcxU4v4bSS7HRYe9jpOarMWLyU?=
 =?us-ascii?Q?aY3Ll+/DjNzi64+npIP+uzI0LMpDi7vgIhm+QvVATO+lsrDccmobkD8aJioB?=
 =?us-ascii?Q?CyycQEwTpvSnbHGeruXfILbGSOqMrsKcOCWoTy705lkavoGrOuDnzpNl1EIv?=
 =?us-ascii?Q?Z0L6byRBpkDdq8XQzjMQv/Ygx8J7+vrmVSMRIcTdMkLuiBezOqGBedP7vDwT?=
 =?us-ascii?Q?WHmibpIXiW4EU7Vq3NYcz8Ac2dDzXjBVix4xmQ4/T+tcFd7fIBZ4Y3Zsegnh?=
 =?us-ascii?Q?0Wvh/gSjG3ZaCVjf6Sg/U6xYmpwZLQNkio11hyTT8VU4nfXLczHTvJCw7Eun?=
 =?us-ascii?Q?iYEQEKsxLTXlYnbn3cDR7kzzHr06C5kjK8PfpBe0m7QmiwURCbopOlKWuPWU?=
 =?us-ascii?Q?OjwEJyV5wVpFYPWoElJIgDdVu7RJJTE66MPpfDnWCCZpYLFsJF3Cf80YX9/r?=
 =?us-ascii?Q?JKK6CdwdngjaDvwWSdHnWlw0xZNwO9fKLA3/+VkH6Dv5AeGjewT7/aLDUCHJ?=
 =?us-ascii?Q?bvR5vOC8FGFGOXikmBVT6u1fGpjChLnrngIx/Oixpho+p5VnxP0jIGKwATl/?=
 =?us-ascii?Q?QHY1oxnxfNIGsSfEeVmYUzDVkZTsj+L5c47eWWrMaF3zxYqJRNluCRECCXBs?=
 =?us-ascii?Q?30lcb9CkgvzklQ81TG4qM58bqlP1hhOvOVoflr449IbRGuCNwMnZXw8UPKUC?=
 =?us-ascii?Q?vc9qJdLESP0EnIDFgv3V52jRX9Rn/RQA+/iN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8833.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(19092799006)(52116014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NiyhFSQ67VXSm5U8Rqsn1fKIU174EDO8+uzwgSPT9d0nNWCtHUz09BsjVXKd?=
 =?us-ascii?Q?O7xC98GNKQHlmiOKjDKomGaftJzKsM8xdq4sAs+GCHENz5L7mnyngUn5Dr8t?=
 =?us-ascii?Q?q0j7cwmSSZ6kzJG13lcAzwf9X6vmxDaTBRbIvL5qMpBNcylC7oLEvNeuBYCs?=
 =?us-ascii?Q?dDhYBdpkMNUpUQ0YGbJZXTtiWGyO+ui5cbkRKSXtTlB/ri83jzA++ymr/ElC?=
 =?us-ascii?Q?DZpj5oxwanpTkbDJLtRKaq4bETv39OK1RJFXp2uefh2j/Md4gQikp1h2Lhm0?=
 =?us-ascii?Q?+TD8UBCBWf2HiD7rsXfZE9FfMYaDMnPwTOgrqv9GmayIMnlZsICC0v0U8rrR?=
 =?us-ascii?Q?Yeemf2ZTwoC4AGqJ2+n0xoq4Hm/FlDZJ2/faTIJ4KkJjnBhcJQ69+7RMUMJk?=
 =?us-ascii?Q?uq0igCppaphFGxzyUFKqeSL+soYkJifllUTiC2jbhd6yw4ewDx6WVk6GOMH6?=
 =?us-ascii?Q?o2wq/snNx7wkmeIcs8zRHmOVOqGKARsGLzhJHBY7jA7RTkDnlKFrtqBxkyTU?=
 =?us-ascii?Q?MsFv7MzW0ZlBUOVeqSUWvAQUpX+oFkqT8L8PYl1myuYevyZec/nONX1bbOMk?=
 =?us-ascii?Q?u/9Yk6dePqgaZ/7YlenS3dMZhPVSKAG+hPNR7pLJTrFU5X1y4fFJF0ADwLfg?=
 =?us-ascii?Q?DKzgbP/neG5OMkJCJ4EVCx4SNIoPLO9v3wwgbhZ0J27J1mHgG9phXLQZ97GK?=
 =?us-ascii?Q?d3PoDZfn8xY+byQXbv6cLB3wzY8GdDeluxfIa0VOuLTf9JPBgEwC4ukCHZ78?=
 =?us-ascii?Q?vFNaREWpA1raRZBewguQxvE0xISu1tYOwiMRaf28T3mm9yviBMMeKZSIXTLQ?=
 =?us-ascii?Q?8prd6cv5eT7Yu5wSbirVPCu/uENM9fkJKN28ZriGavPt4zeBjoyc+ayiRIq9?=
 =?us-ascii?Q?KfG86prilUJIORSFLxUpHYx1NOyz6B/TCYq7oTOYF4d9sznOMwW+N8yb0fXC?=
 =?us-ascii?Q?HyK8rBcEGPZ50Vqllkq+tmSPIZeRV33ibPLh28DZSeHBu15gcIYkKCQpAHoi?=
 =?us-ascii?Q?zoSB0VdmOZPOuBTWva7OY/wyJrOO8SqDEU6t/H4Vn/HRxKpWMd2kB5KIBPXe?=
 =?us-ascii?Q?WGxksG9oCyMxc10gjzbQY2uT8lI/VwoDobxGLdRMIajor2lkDcYbScX54L0G?=
 =?us-ascii?Q?oRtscQVYmSiEdA7NW9NaOzHnW9QiZiQ0J1cL07wa48wF7M8gxWbEuVDSqWzX?=
 =?us-ascii?Q?jx7ad4WbI3nbjbhM7bJs8PGQxmGA2M8TRji0hXaR2oAVBnBM1tiIr7duoCNw?=
 =?us-ascii?Q?adPyR/mLH2zIB5pHaCyGFF0bFZQPyOwCHZnnYHwjyXSQzocLaLICMEyn5ji4?=
 =?us-ascii?Q?bBPXGI5NiBm0FN+Zun5dHpb4mxySvmJeUxpJIb+xZCynur7LI9FjahPu3pJZ?=
 =?us-ascii?Q?3j49246korVZG6TdRHz7XTKk4OMgcjIQyL2wmqigWx/T+yiwJWkT7+z7TUV1?=
 =?us-ascii?Q?3/wyZwE1PjuSH6gA/y25TEppsYtUZDFf1CoYqhgfHas/gnXc0wrXbHscNu8v?=
 =?us-ascii?Q?KLRGuQXytYA4ZQDU7HwWzqHsHbV6q3/skhJ/M3/mmOv7rNwyyG5y3QCmoj/o?=
 =?us-ascii?Q?4CAsuMWBGq0jRqOY/Ks8tbanmFNdyLLnAgoCQxac?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41e88709-7134-41f0-8c06-08dde1581b35
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8833.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 08:44:28.8911
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bj3Prljtpli4Kl/ma0oBbeT9yrGJfln5c+ytYgSsxqW7T2zJ+ljb+MiEEL9lzTQE9oLRxAkCXVELWpPEjk44oQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7630
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_014438_125884_96AB6F16 
X-CRM114-Status: GOOD (  13.08  )
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

Refer to PCIe r6.0, sec 5.2, fig 5-1 Link Power Management State Flow
Diagram. Both L0 and L2/L3 Ready can be transferred to LDn directly.

It's harmless to let dw_pcie_suspend_noirq() proceed suspend after the
PME_Turn_Off is sent out, whatever the LTSSM state is in L2 or L3 after
a recommended 10ms max wait refer to PCIe r6.0, sec 5.3.3.2.1 PME
Synchronization.

The LTSSM states of i.MX6QP PCIe is inaccessible after the PME_Turn_Off
is kicked off. To handle this case, don't poll L2 state and add one max
10ms delay if QUIRK_NOL2POLL_IN_PM flag is existing in suspend.

Main changes in v4:
- Add one patch[1/6] to remove the L1SS check during L2 entry.
- Update the code comments of 2/6 patch and commit description of 6/6 patch.
- Add background to 5/6 to describe why skip PME_Turn_off message when no
endpoint device is connected.
v3:https://patchwork.kernel.org/project/linux-pci/cover/20250818073205.1412507-1-hongxing.zhu@nxp.com/

Main changes in v3:
- Adjust the patch sequence to avoid the build break.
- Update the commit message.
v2:https://patchwork.kernel.org/project/linux-pci/cover/20250618024116.3704579-1-hongxing.zhu@nxp.com/

Main changes in v2:
Add the following two patches.
- Skip PME_Turn_Off message if there is no endpoint connected.
- Don't return error when wait for link up.
v1:https://patchwork.kernel.org/project/linux-pci/cover/20250408065221.1941928-1-hongxing.zhu@nxp.com/
drivers/pci/controller/dwc/pcie-designware-host.c

[PATCH v4 1/6] PCI: dwc: Remove the L1SS check before putting the
[PATCH v4 2/6] PCI: dwc: Don't poll L2 if QUIRK_NOL2POLL_IN_PM is
[PATCH v4 3/6] PCI: imx6: Don't poll LTSSM state of i.MX6QP PCIe in
[PATCH v4 4/6] PCI: imx6: Don't poll LTSSM state of i.MX7D PCIe in PM
[PATCH v4 5/6] PCI: dwc: Skip PME_Turn_Off message if there is no
[PATCH v4 6/6] PCI: dwc: Don't return error when wait for link up in

drivers/pci/controller/dwc/pci-imx6.c             |  4 ++++
drivers/pci/controller/dwc/pcie-designware-host.c | 61 +++++++++++++++++++++++++++++++++++--------------------------
drivers/pci/controller/dwc/pcie-designware.h      |  4 ++++
3 files changed, 43 insertions(+), 26 deletions(-)


