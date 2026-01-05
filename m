Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF592C2A074
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 03:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ADTHSpRp+uv+dVOZtQkY5yAvdQXOfCFG4kzF4oSxP9Q=; b=h0OZ/gA8L0NpGJC1tYoXJT9xIO
	XjQ4D9iJhk7q2o0i0KcTggwWwNLgVxmCPc3af1VefBbt6MU6xGaaJiLjLlbXumZxA5xPGJ9NmuIxG
	wlR6HTdKMQBgGzEjDewoA1R3TOdiyWbsU1pXV1zI5RDaqNx/mL/Xg+WLXEZHlryHJDwyHtK1YojIk
	kZIx/h9Y20aRsgBdAGuQ4RMdDv+NdURFfBdKT4HYo0XHDHRaTNP/uU7LtqnU7keQ7t04DypNA2sQ3
	eFARZP7Ra2zrn7Z7PouI54IJjQjMEG6PAlAwVoy8hd5ZyhL77NPjzSk3vGTqTnyP5Xe8CIIl5WJ6+
	dUeWqzSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcauh-0000000Af5g-0wRD;
	Mon, 05 Jan 2026 03:05:47 +0000
Received: from mail-swedencentralazon11023117.outbound.protection.outlook.com ([52.101.83.117] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcauf-0000000Af2N-0BmA;
	Mon, 05 Jan 2026 03:05:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IhAhRzymibUkuv57Hejj8Mp4t1ugNmAEJ9e1v9XsGRY26idINRAy93E1qtaDaGLgHRCxdZ59D5GMv5WnxyUzJWSrHvZpLAPsnR7NaL9J8BGez5Uc6EiTmw/1MbNZ2T3NjZ+JCO+x1CSqANtpzYhd3xNmC4JntYJSz2WbET01zFNImYNJgkAkH2IkUVsmwP9wbFd0+gh6yhIyhHw5kMjsAZgK63tGmk65YOP3L68a7lHeO6N2eDeZx84VrTxjimwtyrUThEwMI8/XitssQjm1tAWnN5GtCA+51Pv5J5IIGj6DyVDCS1d744mPysfyBaYzDormuazWVgSEyaxRvdedag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ADTHSpRp+uv+dVOZtQkY5yAvdQXOfCFG4kzF4oSxP9Q=;
 b=LZ+MFimqYbP0L766sRQGnnPDcD9VKJo6T15AqMPmSqGlhvyIuMCAA8zE7YWadTyd/6BVjvPnqMmJK/2R639fdycIrlUq/kWX7uSt8DtLkmIupEkRXObiCdyMb2kXskmtTe0mANUibgJbhDuxlzq3rq09Ux4IC1/LxwH8lKox9O+u+8f8EJZIG6Cy+M9KSA9v8nxmxgtAepRw0GZ3o//gJCfWSUX2K0pJJD/fRhwR6YamjuBNJJVLfZJlGUKK2yOe+/zWUUtOJQ6zDCp0ZkvCPOdiFK8vbQFQ2Dfrh+VSOmMA0gF7brvgE59gZPQGl2/i77wwdIJyUqWwa3GXhFdxww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ADTHSpRp+uv+dVOZtQkY5yAvdQXOfCFG4kzF4oSxP9Q=;
 b=FAPuLBHkKj9SO9OD+8jwRNtKOCYgxCWE3LYKkdI3HqUgFCu6cQoo8tLr2aj2zoTo6hfREe39f35MBsL3J7MeDdw1GZx3FDkXM0UuNXlwTR1h5NMRbIs83MwzzmLoGGb/RzWrarAU5+GxUzQly5wvLFrPPo/aJRqQVVzDoKr2cLHRmNkVCwJKBRbvix4/ZxV9Ss5O65oorlBnzCFNUyMY0nCZVvkKfNEcR8VNdkiExIJbFXDwOYaOmmYnvR4VLjlTkZctUGmhGmSOK+KLo8lBPx/0R5pX62GEvcHfivyJrqIT+cLOIrVz6HOAH4OdtXrFvUkfQuWzjU4sM/zk1yKYqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AS8PR08MB8492.eurprd08.prod.outlook.com (2603:10a6:20b:565::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 03:05:34 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%4]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 03:05:34 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH RESEND v2 2/2] ARM: dts: airoha: en7523: add reset-controller support
Date: Mon,  5 Jan 2026 06:05:19 +0300
Message-ID: <20260105030519.4101456-3-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260105030519.4101456-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260105030519.4101456-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI0P293CA0005.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::19) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AS8PR08MB8492:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b0738f2-3f43-416a-a442-08de4c074b17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kVXtC1UQfDg0IU9w/AM2TTWoGWJpHf78jubC9+SZIxjvSIAT3kTpW8OMQYbF?=
 =?us-ascii?Q?jhito11fWF7gaA2LmWwUAj7QywQGycEJ5GRlWxwdHbK2VloLrnmZYFkkRuzJ?=
 =?us-ascii?Q?el4GMnDub9xWRXPY45hnbnhP5W7/CL3tGbEzyGwvr2ESD6fED7msJxJaktbU?=
 =?us-ascii?Q?ZXAScCI23p7dW2WXOKDvi3QN2ZX2jXCogPMpQdjh/peUAzmX+y2UG/XMUd6k?=
 =?us-ascii?Q?bDNZ8OSi7a4PkkfPr8m/hd7OpCrmyTT/mgt1pociOxGy8ApNPCzxvC/mJR0r?=
 =?us-ascii?Q?LXYu+hTCq7wzJaVWIO+1ekXejGb1Yz5cpjEjXb8jCz0pFd+3nFS4yVmNdopv?=
 =?us-ascii?Q?3dRYy9bWkNZ1mx8mm7t8vbv/rONMGXFt4miUBQQYU5mhNsASuGZwxwtJJOIG?=
 =?us-ascii?Q?GKyYeaYrA7h6eq1oj4Cm1D5ZWTiRnp9qeOOev4ff1RkgCg3fQRrJ3GqRMkOs?=
 =?us-ascii?Q?CI3kMibQ4aqXKxv7Q1hMdQ25WDGp9BYYOSU7nqPbd0CPhtK42IAQ15ZVQnxN?=
 =?us-ascii?Q?88urtWMmyFzgoDJiL3dNTmK5ZnWf+00rk9OdrnBpksgtPpe8pTtqB7SQP8lV?=
 =?us-ascii?Q?Rex4C/xggkxVQFoGHaFKTvSo+jKZ7Ra/ql4Ow0DVSm7UgpdcnJ5S/jTYzkdW?=
 =?us-ascii?Q?0E54as+hRMsmxCIxMBDaAPzLhoDsrTchINPVB4arHBj8Ug532vhMREVQiS+Y?=
 =?us-ascii?Q?LXxSl6Nfsv9agC7zJZD6qFvrVqfqsiupomWLEvFwDVO4i+RaRiGLs4xMuaaz?=
 =?us-ascii?Q?Orw4cI+aRNgZqWa5gvlZpKQqLUuN3nUxylp8iUGnqGw7HmCOUXAFFwBt6gQq?=
 =?us-ascii?Q?9sqJH1hWTR5cDp6Rq8pqyqVtPm8nC2mC8S0OPqTwvezEScJngK03Pkr7/ULY?=
 =?us-ascii?Q?ciSWBLifT0jkbarRtOiiX0OH3+HcNGD+gzn+58UdFygrbzMfEU/j3pCfhR7Y?=
 =?us-ascii?Q?T1s0gx2bjKTmN3vkoJ5NvW9id4OWz6NW2wMfAPADGgpv1kmCdPFP7z1oMUwA?=
 =?us-ascii?Q?+82dA66ZSeDOXs4jpUepQpSwjDCg7GD3VKOCtw9L7KZ+DwHOdsu+8R5BfLZV?=
 =?us-ascii?Q?XvCEHcBGZC5IP42CyvwYz/tolun+p/2ekrg/5F2SaRq2f74A4jwBRy3NEkNC?=
 =?us-ascii?Q?bvBNxG0tZGCKDZkne62LoJk6QVubzAyA4tUtjQ+PEf3ubQbu0e3SYGJuji5l?=
 =?us-ascii?Q?QuJdyd7NXnrDbPZSxnwHXNa9WagnWzE6jddxs66tkpHZb//sF26qMZK92aO9?=
 =?us-ascii?Q?C+EasDWnLfkHBnnBMhqUOaXg3RyD32Vodpjm11rQmvpmdakeSNZmMIwTjPH4?=
 =?us-ascii?Q?8jJXbBOTL0gbMMDe7gLpgdfEAjepPlddJd8cliinpjWwUboOZsm42nFZtYZd?=
 =?us-ascii?Q?4ZIJAlXtCDfmPWqhBHVvUfV7e0aSXp2EPmjsEP9yEV+dsYeEkpFV0Rjj570l?=
 =?us-ascii?Q?S0q3Po7euWipEo4B/y7wS8b0GeCiKNRrj7vJtC/Ys5uyZGezGzYqUIRv8D9e?=
 =?us-ascii?Q?zsedApXICJ+FKt9OHr95S5fpD14AI40S8JPc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Itzb/ZxlFHOBY+tGvajOpLzreBk/XulJ1ovYjoMaiZjSyo9wLVkSnS83Vg8f?=
 =?us-ascii?Q?4I07O5Thbz5kTYsFJ0mBF9orxUi/yfhP6bu5qtiYyO8V7iW1MTzd4JSmfUYh?=
 =?us-ascii?Q?Q+vTxNuG0xUoNC+Z5WXyqnLHr4AbWicpQ5RaoDaM+B0Jq0VAFwXZyrQscrLp?=
 =?us-ascii?Q?h0yYJaTtIg9KibivfpqT5XYf2gLmRmsff1WfRbQpthNAKtllF2VbFUqzVHv1?=
 =?us-ascii?Q?ahOmOOWyGgtT2Hzs10yliXltoGCLiShW8wOmlyzHPDgIATtZTtJXrNpwAyA7?=
 =?us-ascii?Q?VaAahHjEY2eN5LEhu5ochzvGx2yRHESndDg5PDd5HeqTRcbDv2Fm+uXsZKl3?=
 =?us-ascii?Q?UIaA7+h8rYxUym3Luf3qjqF7zwBbmGQU4aN6ik5zfnNMwUjFAyXql1CTveG0?=
 =?us-ascii?Q?SwtMM52tHSrtu448XKLS++xuBhOvpC5yYyjl4lwVMRQ8WoExvY1B5JQkVdie?=
 =?us-ascii?Q?GK2gLtovIFUbl33H52vo+aQXPCCa2Qa4O8Bhlqg9PbERbSGRkZhaVfrqeLMs?=
 =?us-ascii?Q?OWCQlDwS3fV85t7iEwLZKkPcpXmgVZu+1d1+sHm8gIYYsSOBPx5QoR3sJD8R?=
 =?us-ascii?Q?MuVaaj3Ga6kj4oNTteeT9pC7bUOJptWEmSq0wimUp+J/kR/gaKz81keT72C3?=
 =?us-ascii?Q?X0/MzWXTHkPmsKScmW1FLGcOLY0aUevKOzMT+4EBaEDFR4VC5v27HPK51b9m?=
 =?us-ascii?Q?GzwBWEs6IwRuOHu0/+kzNwfOSjKz3btBTAk300gG5rNvLqJrNyCDiIVDrv7C?=
 =?us-ascii?Q?MdT5IwmxjAjkX8mFuSY3GY+5e1Gcn6FLm+zVr2Zz7Esq23aI2Btuqk7h1I+r?=
 =?us-ascii?Q?C/v8SXoT4bRoOuxUM6x6SskvG0DbAi+CVYFfcVYugk1RvxqgbRXS41iHjKn2?=
 =?us-ascii?Q?De9Q2My7XdJwm34scD6YSPcUwzOmKjzW0YCaXrnMtMmwUIK17Lmlvw6XPKhw?=
 =?us-ascii?Q?03B3VnglEe9jq8ZHC0yTCkpd9jE81LRfeD+9vmS998CJfyOkKuxXeZvGUQb7?=
 =?us-ascii?Q?cGb1l/eh9AksBtRie1NIYvK6OeIajEJ42IKMFrtn/Rr5ehHStrwMCVBdWtR8?=
 =?us-ascii?Q?zVZtytHALBO3Rk+UHsMcG74WaJziNGng4nFkacHHbvvyJ0eRTrL+n5gWXapz?=
 =?us-ascii?Q?rsB9AKCnIsKUQDV3aE8CgU4ILoUt3jNnC7kcCAnB9YerKtNZ8FCdofu7pmQ2?=
 =?us-ascii?Q?BM80dRzvz+PK2tM+RKU5wXYqizA+LSulAh0sk6MOtPGGAf+OC070Ki+y3tqT?=
 =?us-ascii?Q?vsgpDJ/Z9CG/7R/W0sDQNbUp7K02EGxx3aojY/haU/zx/SC9GFOjBKykNqBS?=
 =?us-ascii?Q?Ze2aSBYqtbG+1tf+lS/lBytSLvvMZnRfntbvkTob/IclFIBrGecC17PhZjAE?=
 =?us-ascii?Q?zt2aheWFFXqJrdtKBFT6+a32Yr99I4MnOgYTNMBvRC44ABNJtJM+09M3DcAn?=
 =?us-ascii?Q?ihASN5mdm3JvwCdOe6D4YrHyUV+lwWS0rKOO+jq4AhrHQFFCk5RA7S0VkUdr?=
 =?us-ascii?Q?vLQnV/BTv0hbh4LfH7j765XUWRZKiaLUh+mDjgoC/I33x46MgOrSTayu8k59?=
 =?us-ascii?Q?F1aMNxyEpX5/ZAisU87hLuVwUYs4faxskT/mo0jvV7mjQLJcTxb5yaPU2JaJ?=
 =?us-ascii?Q?8vnRilM3AGbsg0RIpBb20BZzW1fTPwWdhuLsVGAdQDw0LTY5RrsftCf/8eZQ?=
 =?us-ascii?Q?C+bF9znObfKq/Wl3ipce40mk/iJVSYEhek5qeZsFa3Uk7YJm7jq+35/qPC3S?=
 =?us-ascii?Q?BnA42Raav05pARi7jAwEksa+1r4F8gA=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b0738f2-3f43-416a-a442-08de4c074b17
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 03:05:34.4096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1B08aaaxbJGbw1iWRT9c1EKlITc8EToocMvBP3tf7wZIWBsVnVcdeN9SptXuylP38OJcv5l1SRek0jY8DFtw64IjSpN72Ua1WvKHoXtzHjY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8492
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_190545_091106_F1CA66D4 
X-CRM114-Status: UNSURE (   9.92  )
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

This patch updates EN7523 dtsi to reflect the reset-controller
support for EN7523 SoC.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm/boot/dts/airoha/en7523.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/airoha/en7523.dtsi b/arch/arm/boot/dts/airoha/en7523.dtsi
index 31191b8d1430..115cc44093ab 100644
--- a/arch/arm/boot/dts/airoha/en7523.dtsi
+++ b/arch/arm/boot/dts/airoha/en7523.dtsi
@@ -4,6 +4,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/clock/en7523-clk.h>
+#include <dt-bindings/reset/airoha,en7523-reset.h>
 
 / {
 	interrupt-parent = <&gic>;
@@ -91,6 +92,7 @@ scu: system-controller@1fa20000 {
 		reg = <0x1fa20000 0x400>,
 		      <0x1fb00000 0x1000>;
 		#clock-cells = <1>;
+		#reset-cells = <1>;
 	};
 
 	gic: interrupt-controller@9000000 {
-- 
2.51.0


