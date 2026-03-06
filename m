Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDEFBF51410
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 07:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JWSEPIAcJ9Qaj5B2pLWTsD+DAe2yzx5ApoAcg92byBY=; b=oSqdOvh/t0QMeQuCJSI5hz2K8g
	dQ9rP2XLW18yAAJ7Ca4dfYp9+CuvwSIcstD9XtGI7Pbnd4BloJBtzr+P6gxhELENJl/CGgxoTj6I6
	umzl/uwJ0rlJm279wEN/k6XYgi0dxWD2K4XckdsE+e4c6gg7LnbV+LVsNJhEPQLxBnfjaADyiVa/p
	hooC+MtC5cKnEI2ainObpKcG8tVkq5x/FTDpcWpwak0GmcxUX9M5XzyKj/me7TT8KM7JqeAZL2xt4
	Zv6p4AODPkBoGUjBneZJDJp0IysFCJZCHYE8h3qQzom+LPij/4Q//oFvizu9HinwoWglWRYwwcHun
	AlbjSVkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyPBX-000000037OJ-3tij;
	Fri, 06 Mar 2026 07:01:19 +0000
Received: from mail-francecentralazon11013008.outbound.protection.outlook.com ([40.107.162.8] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyPBV-000000037Ny-1OAa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 07:01:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jYIJUpoMykOm3f4HK4R0C/OP0aFF9yHBPdtPV1KvGvdpaORHeeW1qEjq1a/0VcphYExRo/wj7nUvV/t9NapJRdjtJ14RxCDGs/MQlqCdkRYiHT3MBsV4AFirP9PGF9DWOU4NBGnOuP1zpWy9xT8WN4PvkdssmDOxpVPQoaoIWYTozHH80u8lTny7kYswtYvclj2D/W7AygW5OqivA92iQzNmJjBvS1AlUjOD1wvypOvTV6sO++W9/grhJoZovlsKBWiHFnpKVSf0JfqsJC4qBGenL0KhmSTJpzfgNeeFw3/dULhJxxAd6vAZ+eDFwXaYkL5Gi2spw8e2ZaGq9NUhkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JWSEPIAcJ9Qaj5B2pLWTsD+DAe2yzx5ApoAcg92byBY=;
 b=KfxSlk+ze0RTw5/5Ad6MFxJyaQHyW2NSigDttvfsgPIIsWZVWPyhzdw+S+3X16qKVGEsiyFTPYDSId6O9YpLrfKIQsaZ8YSgjAh1Di/zhevgCIGh5FKjPpplDhmhtU70nhXnCx4/fN6O9auAECB5ODGvTQQNQYhmG+MGvm+IG+RkLnRpbGUZmc6YV7riP//cVPZLaoDjEZFcoFeLax2M+YR5g4Btc3MeZW1tIZYeulyo8blrSeTehiJMEmXC7YeK4x1aUCeUCzQu22wibXOYjMk1vBsZXD8AGp22+rr5KGEasyGj736w4o33ZtIPIfG2idNNUiA6dd4Azmg0bdjy4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JWSEPIAcJ9Qaj5B2pLWTsD+DAe2yzx5ApoAcg92byBY=;
 b=YtbCp9ZbZfMxz+eNrYSNCtH05c+XSUfmUmdMKF7iznAs6nfLhmhK0ZeD5noYmGd0GgfQE7RtzjmW57vetD0JX5XbXBf5WS+rzXtvRWUg1P4FaGbD78HtHRlQq3oiNbuHeyuKUU7/WESm7LXuNJNt/UbWntBxBW91gQD6Ihv4KjMHzxGXQ43RfGycrrNvWoYUCaiqwlxg7ue9DptouQQZtUqeTrNAxJpvfZ9SwnuLxR9GPVybQtTdNjRKj0cBwlCg/MdAW4wRm1ZZD1LN2uFT0ZiVh/rbRq40ffdsXOCeU4aqS4zIwMqgpZ64CIkYob6I+19eVL9ugCgVAAkHpPftUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by AS5PR04MB11441.eurprd04.prod.outlook.com (2603:10a6:20b:6c4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Fri, 6 Mar
 2026 07:00:51 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed%3]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 07:00:51 +0000
From: ming.qian@oss.nxp.com
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	nicolas@ndufresne.ca,
	sebastian.fricke@collabora.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	Frank.li@nxp.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] media: amphion: Fix race between m2m job_abort and device_run
Date: Fri,  6 Mar 2026 14:59:50 +0800
Message-ID: <20260306065951.837-1-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0028.apcprd02.prod.outlook.com
 (2603:1096:4:195::8) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|AS5PR04MB11441:EE_
X-MS-Office365-Filtering-Correlation-Id: 808e0ea0-2929-41da-5cd4-08de7b4e1a25
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|52116014|376014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: WYrDx06wSt8p9F73tOUO9eZZs4X+zpis/wJIJ/x2iM9T52sht9x3q61o0u1XEQnoUrv3K8LTtZGvEcXNPUzdXNKCUFCe563kAv9PfnWP/KzhGw/tOAIIZzmxd4MAQrq4tSbtU/wQJQH1sVue2H3x5aNFiruL++qreUm2KTF1qpNvDtkPy5MVEGmVGq7fmfG6jjxxlkwvWgrSEbHu90PE14274tyWaL6p8zQdc8kFKexonGyoeZDKF5YnPInisg+ATUKfF4RSAuhjIrQei0O5jVbVnPtD69Uk46upQZrp14mcLZ3ds5KhN3jmU0zc8+aK3XcbVAcYuBDtvhapbhCqsi+jjxIx0VPz/ANUuoZiBTjIPWLIGJVCGQSEc+JM5hIh+0ru6Uh1pCy/VIgbTk0LCd9CYKxwdbXYRiDDXQRK8mFPA6j4tqFW9g4KSuT57dXkMILNQO/e1O5hf6Pm1TwFYZNQH7Do5tajxQY4GCyblyVlIl6ZaCvIHyRRDTXTnyfyI2d/9q+3g/pWvQto2X28wSMrIYsHqXbKTTxe/cBrlxyBf+9ZFNz6Nq1TupUMUYNXr0WWMWIwk2hxlk+DXsM2pmIU5S14uK+Xk86p3U8Od4VJPLrjaJAkr7XCy8mo4loAGj6RMGg9D6xmM7rvswIG1ch3/Wd+s+QJ1NO2OU5g4U9Dy+nLz+7dW1MhTnjgYTUSHkykWc3NrgzhP+wbvCiOPzW1d7y4g8k2dL/dkyQt1TNvTT+00fEKrWVNoekrn/UHhkvbkv8/ye1e1k1oWCCt+JmvvaLtdWZs4oNH6Ch1p+Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MXFfpJ1NRYXk6XmPs4oP5W+i6yJ/N5avKnkvTRxn20xx7ecO/keLX88lPsnd?=
 =?us-ascii?Q?mCIJmR4RqeIDhwv3CyWN2TA831z/5vJTU6f4r9Q3NennA/kauXePzTjZtRhI?=
 =?us-ascii?Q?3j8agEXyw24XWlZakvw5pBSjWtABKJ+iFrrNXu+tD39BbnuR5wOr4v/qwn7E?=
 =?us-ascii?Q?yM4ZKBegcAZXEwQOH1DZviWsIdgQ6u3KYTp4yt+Alt3Pk3YDsFFq2dmEE8pG?=
 =?us-ascii?Q?M5RUHrBhMKlWrtxCedx/EqFQjlAFutWxaRUhhQi3mdd3n4pyVJfwov5pFd7s?=
 =?us-ascii?Q?IoDc+Za9eozhSkRwJLkEe0xJDDIZ0RXDb0my6t/6CHX4W65Pzr/2pgDTE0N9?=
 =?us-ascii?Q?/iBFRsM8EqEOSS3A+Mm5L8YOqj6gSnD4e3lFUY5mRo6R9aJfS8+mSLrVA5pp?=
 =?us-ascii?Q?Wmi9OvPohohnzKpU+jNciUMkVnJXAdKLRfb/WeEJb0UulotNnDieZd6SdK6V?=
 =?us-ascii?Q?t7h6JS9Lv9ShUNSCW2aOP4nJXeIq8H6c/GXu5vZmsxw4f6rFRzqKWNuJZl3v?=
 =?us-ascii?Q?julzFs0plkCqhnr0alVKmzpeWj+ihuFB8m9VKMFBJYjpCfBQNjdgmrC2pJhg?=
 =?us-ascii?Q?bZQTsWgDTVPUNDBNPEnF+FspM441Ityk8tB4+uGjXnUZ6A9pXAZGU5D68BPs?=
 =?us-ascii?Q?5wyf4xafXSiZOXxcV2VKA3tRQ4+0LfJ4H5Po3wRVfucVbIYkhvuXGJfPT9Xb?=
 =?us-ascii?Q?bvsIqFXRuDx831mrraTmOE6MjbUV+KP8nhY7czV3D7/iUa/JTeZcziDQ0ISl?=
 =?us-ascii?Q?EcetOn9YzdxKzqMwflIy7XQE3z7bH07cQ09p8mmCZbwCpAwelIv/7iHKlsEB?=
 =?us-ascii?Q?JokZOmoa96L3d0y9jHNMjEL6Z+uMm6qUMkDI8vGu8ijoq231UysqbsyF5Ioh?=
 =?us-ascii?Q?NqKKzo4Wec5UmUV1sF8C9rWFnxOyA6ctqwsgtuB/EfUye/rgnKV+LwBe4PH4?=
 =?us-ascii?Q?nXUmeyPSVLH94n/frb1+IK2IRLdx7ydJhbZZGVEs0ru7xBR+Jv7639MtfJUn?=
 =?us-ascii?Q?0TR9uOoYQlipqlrYC9NIoSSDzPJHO4NtkMGHDNYYDRr5b/Kj/0BR5lReiZgK?=
 =?us-ascii?Q?HB7L9c7Vpw3V88Uh/kHCd0EEsGwRJ+vjnxub5eyFF5ggMCjjRoT/5ndOLige?=
 =?us-ascii?Q?s0JIReZFaFovp1Z7otH6OQ2L05M2aC0Dmg4sn3TDA7wTQjCJo6p0PoJys0Yk?=
 =?us-ascii?Q?1ycFRUU+DJk5RE032D4ulJB+ez2YLUwLP60xBSB93/PeZ1A/K11/4dhDrYCj?=
 =?us-ascii?Q?fbaMZxwI82Qa25gJ2L2UU+xmvAJnytOSxLrIYwR+vRL6kvwEqYPiFXvjbzNn?=
 =?us-ascii?Q?x3fIWpTW5nRVQQJqqwesyLRATA2V9Y1Csr/vZjFRHzMZwFhqAr2V8+cyjxdJ?=
 =?us-ascii?Q?Q4S9BoRR3fgtGdNHhq9OInlVvmgxcRtgufMmVQqtM+cP9fRRgvRWRGkcI6FH?=
 =?us-ascii?Q?mKT5yR21ALQkvIxxbKuFRF84F9QvH507QQyn//B54kaEmqpdvxXXfUsPe0T3?=
 =?us-ascii?Q?buzlVw3DwQESagRolAZa9hmxG6f0IfAj9KXLZvxtYrVCIs2we3IAVCsEaHo0?=
 =?us-ascii?Q?VBCO+OjglGkgFR7BKmXpbZa2gGs/GKsdj0T90zwvHrZg7kDSNzOLjW67Fco/?=
 =?us-ascii?Q?NAVN2VLadA5bJJLXO/z5nbxpkPDoDKD9aEqCqrHbVVONxlIttF+1x04uWJbQ?=
 =?us-ascii?Q?5RHYB4IneIfKyBMrvIfR8l0Oi1Qv4rfn6xEtjjCUJtSeS7RwnPn/JIFAd6TW?=
 =?us-ascii?Q?NKSzlMMaGw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 808e0ea0-2929-41da-5cd4-08de7b4e1a25
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 07:00:51.4914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z3Qxxh4hVJuqk4jbLBKyx4hly+mOF+avYx5gs0sIvfsK2DsmnFLy9Dp6EaDMuHdETs0R5jdRdQiBKYfhDzN8JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB11441
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_230117_379152_F0B12351 
X-CRM114-Status: GOOD (  11.56  )
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

From: Ming Qian <ming.qian@oss.nxp.com>

Fix kernel panic caused by race condition where v4l2_m2m_ctx_release()
frees m2m_ctx while v4l2_m2m_try_run() is about to call device_run
with the same context.

Race sequence:
  v4l2_m2m_try_run():           v4l2_m2m_ctx_release():
    lock/unlock                   v4l2_m2m_cancel_job()
                                    job_abort()
                                      v4l2_m2m_job_finish()
                                  kfree(m2m_ctx)  <- frees ctx
    device_run()  <- use-after-free crash at 0x538

Crash trace:
  Unable to handle kernel read from unreadable memory at virtual address
  0000000000000538
  v4l2_m2m_try_run+0x78/0x138
  v4l2_m2m_device_run_work+0x14/0x20

The amphion vpu driver does not rely on the m2m framework's device_run
callback to perform encode/decode operations.

Fix the race by preventing m2m framework job scheduling entirely:
- Add job_ready callback returning 0 (no jobs ready for m2m framework)
- Remove job_abort callback to avoid the race condition

Fixes: 3cd084519c6f ("media: amphion: add vpu v4l2 m2m support")
Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
 drivers/media/platform/amphion/vpu_v4l2.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/amphion/vpu_v4l2.c b/drivers/media/platform/amphion/vpu_v4l2.c
index 64fc88d89ccc..7cccc994fc50 100644
--- a/drivers/media/platform/amphion/vpu_v4l2.c
+++ b/drivers/media/platform/amphion/vpu_v4l2.c
@@ -447,17 +447,14 @@ static void vpu_m2m_device_run(void *priv)
 {
 }
 
-static void vpu_m2m_job_abort(void *priv)
+static int vpu_m2m_job_ready(void *priv)
 {
-	struct vpu_inst *inst = priv;
-	struct v4l2_m2m_ctx *m2m_ctx = inst->fh.m2m_ctx;
-
-	v4l2_m2m_job_finish(m2m_ctx->m2m_dev, m2m_ctx);
+	return 0;
 }
 
 static const struct v4l2_m2m_ops vpu_m2m_ops = {
 	.device_run = vpu_m2m_device_run,
-	.job_abort = vpu_m2m_job_abort
+	.job_ready = vpu_m2m_job_ready,
 };
 
 static int vpu_vb2_queue_setup(struct vb2_queue *vq,

base-commit: f505e978d1a0442adbbde48aed38c084ddea6d6e
prerequisite-patch-id: 0000000000000000000000000000000000000000
-- 
2.52.0


