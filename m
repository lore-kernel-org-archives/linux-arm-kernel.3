Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1588C71135
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Jun 2025 12:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OrHiIb0t9wpSJuepS+AfcwUH5fMFksmaOWZGewePXb0=; b=HvMvrBRGUokkQ0KyFyL6bpGt0X
	Rvsg81wQnc7z3ZKFjCcP/JB7+QwiGcAUlcL2IQ6+XqbJWEDIVBcJdNBN5mZqCzJX/3pE4FkuCTDti
	XXLdcWg/HPFM8BR/VRrU1FgGMAqqZKFeXmBN6IdeR+7jSgIH4JGjnX23mgPUXEWzrf6IBmD5dgOjR
	nKVM3nal802KQonI+9CPzoQWireZbruODnDNk4WBncEzIfwnqmCkQ3BOo0I+PgY3ML0qCHlLdxGDA
	3LCJY8W9zzD4vLhAPaFeq7ptEuNqI6hmHR9kR7+3jbQPQXw2TBjCNnOB+NppGufTDgO8psdzZ5ddM
	Xi2YM1jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQQRO-00000001HJx-2Tpu;
	Sat, 14 Jun 2025 12:56:58 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQQP8-00000001HFD-1Vlg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Jun 2025 12:54:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XzrCQw8oLVu9PgEvG+GDC6YapYYvBWxx+LkBy+kUriqFYnoPc1oOFHZ7IblDfuOswJrXYSERJOxaAExaw8EeEkZ41KZz6c5w5HZV6UNR4h5IDatMNvaXhtCyMEOSxB2v+I15CtVj52kVJv5gYL7H90BaaHoSSURL44dNOAKjycmjoB9Cpp5TaZ/yP0yJzSDQLwP79umCpfWBSEuDoScOAZEOY4jZ+uX+gySzmX0WlGZwItoQRaoCO7IlPZKBGwqX0loQzFJT9nKd52zv2orS6YbAaoMiQFcC4/hST4XoEAgwxZqVEP2/rtVXiJFR6t0HcxLwnhN5OHA/qANcfffTow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OrHiIb0t9wpSJuepS+AfcwUH5fMFksmaOWZGewePXb0=;
 b=DkB/FWvHmU84l/Uh6PGWaGXNof5UMslKhYR+w6sQdQEvOdsjXfyzC3zlfUQ+JK2zu7f990f1FXJE1xBCTfsoj76kn+COTIDQlH8Vp2QXAhoLWWG5C3puEeykCLQASVPYx+kvasM1TEFtJriElK2cYvH7O9hI9yEzhYSPgnLFhjgflNUkkTzJPWfhQmzaW4ryvKTv1XZIxFOojCV+s+VDb1JkdUJW6af3sk1u9Hub1McqiF/xYRgiegrW+iUvZZduh2riyyWp0YYPOpWQhZwgmBskwYCiRGP7xGkcq3j79Mt2exv3I0Kg/DJYNlfhfepnoV0bHHS8OA5t8uIV2dSb1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OrHiIb0t9wpSJuepS+AfcwUH5fMFksmaOWZGewePXb0=;
 b=mhYVUfHCREJgGA4WAJQAv6TrfHPn+kk12eaQOlc4LXfwqL/e3kxiXt75+xrdDciSA0ZRxorb9nnIQhDSPxza1ZUhE7o7V6OXstqUbhU9Y/JxUqAykRZHVPmVMZJq3MgsuhF8l8XnWmq64cDHjaxYDFc46+B9C+e4YeeNGyFiExZHNyBjlPp2++hR5sG8SsfxojWA4PzrnSVc9EKUTLtHj8T19r8Nwd6oaHdVDh5rFnOsJ++1kqfoQMrMZmBvPJsKAafhkx5XPJyqEIDkBRiqmdJWT8xhFz1B2KrEF+sFIZbSgeN2Z/qrnpAZvXArFHnEWlnIqU6c1RyGxiqY0Bjj5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DU4PR04MB10958.eurprd04.prod.outlook.com (2603:10a6:10:581::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Sat, 14 Jun
 2025 12:54:29 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8835.026; Sat, 14 Jun 2025
 12:54:28 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: peter.chen@kernel.org,
	gregkh@linuxfoundation.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.d,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: jun.li@nxp.com,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/3] implement workaround for ERR051725
Date: Sat, 14 Jun 2025 20:56:42 +0800
Message-Id: <20250614125645.207732-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0007.apcprd04.prod.outlook.com
 (2603:1096:4:197::19) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DU4PR04MB10958:EE_
X-MS-Office365-Filtering-Correlation-Id: 712c9107-b91c-4043-51f8-08ddab429951
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xqhEcnoCpGZyBz1oJDiR2toF+ho64tIna75vDk9gKeFXwajALXdesXLK7x4w?=
 =?us-ascii?Q?IR3yZdJQ0QGZBkvcXfhiQfwdJjdZwOOzMluIOdRy6P9/rY/s1RGbyL0eubNL?=
 =?us-ascii?Q?KyT+gJjx7Osn1qf57IuLY+IG7BT0QlZQ/o8YQzHGaqAycFvB1CffJFTguERg?=
 =?us-ascii?Q?jEMH0JT3Nglq9E0rRMuwMfcKOAM0l4QKi6N+6Ot9UXFlGGrmllp2UGTqEEcu?=
 =?us-ascii?Q?Xp5D2Lpujf9PlORRnai1qRCqoFRfU/YFjnduRXvGJcQDhbEK8EC3JTJtQw6s?=
 =?us-ascii?Q?u7W4nvLCoQnRUNq6PmMjswJHz3W3tIZuLw8kXFIpYDB6T4iWbyROc2ddMdu6?=
 =?us-ascii?Q?VAEVBhQXp9+tfafbezHhxxOyZZEjkzzMjEkEU6VQbtXI9n8pPkev4PdS8s8v?=
 =?us-ascii?Q?WUjP+YBlLAdD07kWeXGm7vfEiZ59jmkJODWhV0CRgvkIKTF+iGturYIRnbHM?=
 =?us-ascii?Q?GXrxajpuBuC07RW4vLSuNpNaLin8aCw9e05p0EUbLLvOScxPqBfi3Ic/+sWi?=
 =?us-ascii?Q?/s+WKaTbWvW+SmwQ+eb922oF7Vz1J9d9g1hsYx3KXFhKV65ZFpcwwuLJi+Zj?=
 =?us-ascii?Q?esAJ1LwWGnxyCdZzoCpUZoG3pbYEROT8jzUxx9JsAmt954IawYXqU3w1JXAO?=
 =?us-ascii?Q?v4Bx3UhzKPsXn0jAMYxC5812afr1Ou5GBbhXE6FJ3ex2KqbD5VtJ8oDqpxtE?=
 =?us-ascii?Q?HpRgAa59ivUwt36JmTEqH9AZSNQbTUiwNj6Lua2RQszgX2RUcUvyV5ZwTJ3m?=
 =?us-ascii?Q?3hDhv+fniNseGzfBlNxANEfqLZilcavZyyn2dIpOx99vISl62I1G488a/Jdc?=
 =?us-ascii?Q?12HFVcLqma3fkFlxh6NDFmz9mqLqUodNIVjx6Zj1lml29UfPvrJysoE9HyA3?=
 =?us-ascii?Q?hqy0+u4QNcqclthutICj5egcy3NmXjvfBA9GbaOYwcBTL9iNYR5iITLOgZO0?=
 =?us-ascii?Q?jbP6SZ6UEwg9xt0U/es7sWu2PfTE3lNSC9qdFTk8kfQObks8GjFvRx0N9dL7?=
 =?us-ascii?Q?6JP/b2hhQQROQI8An2QyUwBHSJ2ds7F5/PLdjIpco1VD4+jfftkydv+jKLiw?=
 =?us-ascii?Q?N/5nevrAjzsBThxn7m11AMyBHs2o8eV7im8uV6xjjomJE2AGvXlCH+sez+C5?=
 =?us-ascii?Q?YVvHd9ESG3b/2jgJGvRkSZ38xxRK1PCYxfUbM9uNUYXG9Tz9M70JpjEmFWoE?=
 =?us-ascii?Q?6eL9oOFg3Mnq/zFKUdqC32ZyZCvV7T4ZgsrjyGw7+WHzuJQ3b79GuIyeOOQF?=
 =?us-ascii?Q?4hWk3mNIr7aqkSrrbzIXXAXybuQEG+CvFwTySSJweBYN5yJmiAbwPqan9QdT?=
 =?us-ascii?Q?ZXClafdjFJOtucC+j28W33S/D84kf/tpxeLkAPlAMUv4aI4I96JUKzLmOtku?=
 =?us-ascii?Q?/TsTWLfim5lXL4LKSg9XV/vuHGreDfSUbjJnEMzDLz7PB/K6E/BjiPFnXZbR?=
 =?us-ascii?Q?ZH0gCtz0+zfLSs7/41JBUbQVgUubTxQxzwBdv8Qv5cqOXJdKm1BD4Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aKE/pcxoPa4xGLP++exgXtgDGi1/MIGuh05IJSFayPouubzEOl73lh5BnXaa?=
 =?us-ascii?Q?nJvCqZ60uJPUVf8Ew12dIwcaNuD/tn6umwj0WAZ4kE+crGh5G9UYshJKY4Ff?=
 =?us-ascii?Q?QytOZ6UZ5QuFNIeqp91hdDHDPIHp5qCrXkLDfhBk8bOOk7GXAdoAizE8ikKk?=
 =?us-ascii?Q?swG2Pp0tR9Nu8/cqzHdIl7Xh1mAUQb/p16eMawk8kJbWF0Jv/f8mBYUI0Ear?=
 =?us-ascii?Q?UdGXLTGcDcoqq4BFDH09ih8EFukNoFizhqcrgi2y45+DKV4QLHAMtCQnuEmX?=
 =?us-ascii?Q?B/y9OFhIEU4RvWtQ617ToQ7G959EkrCShPADpoC7yrgWjYa+hKd7dsnTbZxJ?=
 =?us-ascii?Q?asnI2rNQsrXFTdgrKAUIV52MLkRYwOZ1/gamM4P9Ja6/Pgp56n8Sz7yIkiKz?=
 =?us-ascii?Q?oL/ULqdmMehYzYVJwOk5yyW5qMQjzLjUbdEB00Xa0VrUxcEFZ8nf9U8Zdnf+?=
 =?us-ascii?Q?GSpr1Yh/D8zyFutWiNIUL9KnDxmkkdAc3OE+REd7e3O8bndRsaXTYNWx2Wnr?=
 =?us-ascii?Q?TR56/GDk7qjqFFCu+NgzTOsA2eiY74MoCy5CfnQeBqL6JJw/wdsMRv6zcDxQ?=
 =?us-ascii?Q?Mm1nhURJGphSSqIB1j+7xFF2uAW2wHE0N++4naaopWHf7HKxJz3ZZLX6cIXI?=
 =?us-ascii?Q?63owSRkw0MW16au/8WTZhGRHK+AiDvbRcpJ1Nktmv6DXDJK55J+PGaF1kGlh?=
 =?us-ascii?Q?OZuRw9WPZaVhH5cKq1O8Nj8l6zjbgpyG/c+yLbZNHKP2wNC7ArtG3jKB17ZI?=
 =?us-ascii?Q?UJ4ELpWPuLt1pHLQ/LfZoz1jx0KFwh3jLnIb4uPIWknFJfrq322RMLN5hp7W?=
 =?us-ascii?Q?VNU1BGXNkWofv3xhU3g9avKlbwJy0vF0AAN8psOdr7yDIb/9i1jxN12JlACl?=
 =?us-ascii?Q?pQ6sdsvcGZ2zRZn8WKCv4qcSVLiEXuEeckQ53qy/YKXyMxaaoBwp58In+K4y?=
 =?us-ascii?Q?GeWexXyfJRJ6ionvWa2NrXE2NjDX4suBMsuzUJnzHnIi4QDh7wNOmgRz/2YS?=
 =?us-ascii?Q?aqkPJOPZj+4NyDsUlmlPPZyH1tG63e6jc57blr1qNHSJ6WDtA8rEV8PV2/zE?=
 =?us-ascii?Q?wycEH5Pnsrxq9mUZQvw2+xOVzjwy6c3U6usqRW3nT2gO8A5TlVkibbasHxFQ?=
 =?us-ascii?Q?jsSc5AYOKieBD9+JIPYOiflCLopHw+APMlK0THbKrIvjjxlCLHnYC3xIXhGm?=
 =?us-ascii?Q?+dIgv8rhzOsBAJwRvr+dGFcP5ctasKAewQRS5fTulm1BK2nQiJmsw41sShe7?=
 =?us-ascii?Q?Dn6QGbNdLemBGFzh3KTx9uqG0DHgA/DlECNWyVrpMR7V9GHFMQXD1YeFV650?=
 =?us-ascii?Q?tCoeUB+zO+QNzzO5M8O1mnef6mDKprCRGOXM/3YxOrZj+mLLkOAPkCodDn4Z?=
 =?us-ascii?Q?xjNdR5fwJYhrpAERWsh8zqbdqfPNzvt5yRZLb5f8bAU8w7li010bawfJkUnv?=
 =?us-ascii?Q?uQN2N/KmMRMFFNLiI+0Wj4yqffyTcJH08tu48IfoC2lUR2DLOCUhtrU10uPH?=
 =?us-ascii?Q?OtwKVZ9zRbH6j+OPo7jNdIqXlXVQqBJAnyvKjOPwnAGKKYXxAQ9igHMWzCkY?=
 =?us-ascii?Q?2VTV/HeRmzQ8aDVJrqy/1vC1qacLbfBes8zRqKCn?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 712c9107-b91c-4043-51f8-08ddab429951
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2025 12:54:28.8798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bAxPKgnga3ZDDaygN40kfd/0vBbr3bavdZr14JKxhqaCJk1wIZ4Hvqp4DOa7tSX/OjYV7JvA946v3pKh/QqyMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10958
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250614_055438_400342_8C33C640 
X-CRM114-Status: UNSURE (   9.76  )
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

Currently, the USB2.0 phy on some imx7d compliant Soc has below issue.

ERR051725:
USB: With the USB controller configured as device mode, Clearing the RS
bit of USBCMD register fails to cause USB device to be detached

Description
1. USB controller working as high speed device mode with USB gadget
   function enabled
2. Cable plugged into USB host
3. Use case is software-controlled detach from USB device side

The expected result is device side terminations removed, increase in USB
signal amplitude, USB host detect device is detached. But the issue is
that the clear RS bit of USBCMD register cannot cause device detach event.

Workaround
  - Use the below steps to detach from the host:
      write USBCMD.RS = 0b
      write CTRL2[7:6] = 01b
      write CTRL2[8] = 1b
  - As CTRL2[8] is set at detach case, so attach the steps should add clear
    CTRL2[8]:
      write USBCMD.RS = 1b
      write CTRL2[8] = 0b

This will add workaround for it.

Xu Yang (3):
  usb: chipidea: udc: add CI_HDRC_CONTROLLER_PULLUP_EVENT event
  usb: chipidea: imx: add imx_usbmisc_pullup() hook
  usb: chipidea: imx: implement workaround for ERR051725

 drivers/usb/chipidea/ci_hdrc_imx.c |  5 ++++
 drivers/usb/chipidea/ci_hdrc_imx.h |  1 +
 drivers/usb/chipidea/udc.c         |  5 ++++
 drivers/usb/chipidea/usbmisc_imx.c | 39 ++++++++++++++++++++++++++++++
 include/linux/usb/chipidea.h       |  1 +
 5 files changed, 51 insertions(+)

-- 
2.34.1


