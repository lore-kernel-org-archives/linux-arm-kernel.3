Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC19CF01834
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 13:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2dU6uAttqGbwle1Rl1xEwz9fCjbNK22DordyQHM3n5U=; b=rgxrbHUUrukDSnMZe/FprzXHs6
	hfbytJWB0gQW11fl5KVfxB2AnRNPdI/xB8QRz4wehyIj0zSMTjfQGjovvdFtKEXrLG0KNMP4rA8dG
	XTD03Qmp5KIRKOwhD8mSPX6XvbHYORLxXTGxbc7kW9l3UGyQGjbnh8Wgvpt6MJTSmYawhyNA0QnYt
	Hgd8cjVD30YaC7O3JLLYiIZG0IHpfnwe9hGbMv62/sqTKnVb/Nkohdt0n0l11tl7ks+U/LRfxdeoo
	lOoYiNwZREtaU06p8o7DQu1WVtkm/RSeOStGpb/rWTR+Q37GIP5Iyq3cAyC2dMLAtQ8PdVyDR9stt
	qwHVbkCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyV6q-00000003jXK-2FW6;
	Fri, 06 Mar 2026 13:20:52 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyV6o-00000003jVh-0AoF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 13:20:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sYxy1PR2TZ9xVoMuEYMhPU5Lu2tnROQTtrDb3nT5qqUP/vm9S0uHiyhTgNC3t/Vsdxhv2ELYHEU2pNR0siwJhRGIYQvz/qBnQJRc+i/tAnjx+ke+YiFxTVPzWDpk/1t0DcEtFNAfo/6gWOn5w1dkQyD7FA7pw3VomvBlg/0Xqdw1TqEExfebewc960Lqoi7auXW7Ge2lY8l6dWt/6ypFHa9S8JeHUFIn65wHlPYSxK0aa/+aFxbXBwErjg7zvsn3CPpTBoyrLaqW5Yzbfl3KJ0dKACE9AJaE+ES8XypDbA8UsPr77pHSsrAHFCiCHTfBV1kJQtX6GcnTSZR+WNM5Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2dU6uAttqGbwle1Rl1xEwz9fCjbNK22DordyQHM3n5U=;
 b=U379763l42n1NvfUlcyvFkIx9x4dj7fEgtfr/V8ho6/ry42wzJkyWYYEMwGVh3mIBUVOZzJCWPYQE/wdzcsKUz1SnKTxVsb5ybA4x3Kb9Yotn/D1SgfUEUicMf6Ub7jW4h7T6nB4VLrf/QpnYWWjFfJyrBWaZVCNshGxZxgz+3RqlAoouezl/GtgRUukqmL41xnFbRoKacmYj8txQX70zZkdLZU6GLRpDrstd9gYntzy1CwnSgLOewQUkpL14oZCi6cRhgxdjyQUmQ0NyoCFwBynKT4jKBgc40rBa1qTmywjaDw3VvkC5NF6DEuEa3vIx5KxnPrCb4B/2W/2UGPaCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2dU6uAttqGbwle1Rl1xEwz9fCjbNK22DordyQHM3n5U=;
 b=to8tsIPjpCHHyEJmRj68T2tFC++7gzMcpSRkzk/FUj2qMjn8wsYrKi+Sf4Wh5YkiuO/RCTs0cPSTWagEAsqXiuA8IbB3bUS0aKfryWML8FNWj5MfaX5tU6fYwv7pWnlcJY9vQulcxNdBLG7la+mwoHK45UVyt5CXVEgX6y1ow7eRzDUsJbBFcQc8goBC+O0FhYhPVA6QclcMIyk2YYBtIVoRXHzhdL6lJo1Pxah3PdrWAWxQxUx0Dprq1lvu7cdS+q8TU4r0MbeVLxjtFTqiGT3x5t2j8ZK5mPYcjhZNUoXBFd/Ew2BzFf+LhEnU5sbcM4OtGy+OikywZ6H9ROImgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com (2603:10a6:10:5b3::14)
 by VE1PR04MB7422.eurprd04.prod.outlook.com (2603:10a6:800:1af::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 13:20:43 +0000
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::93f5:4ff3:2f4c:183a]) by DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::93f5:4ff3:2f4c:183a%6]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 13:20:43 +0000
From: florin.leotescu@oss.nxp.com
To: Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: daniel.baluta@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	festevam@gmail.com,
	Florin Leotescu <florin.leotescu@nxp.com>
Subject: [RFC PATCH 1/1] hwmon: emc2305: Set max PWM state during shutdown
Date: Fri,  6 Mar 2026 15:34:39 +0200
Message-Id: <20260306133439.564033-2-florin.leotescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260306133439.564033-1-florin.leotescu@oss.nxp.com>
References: <20260306133439.564033-1-florin.leotescu@oss.nxp.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P192CA0039.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:658::20) To DU7PR04MB11163.eurprd04.prod.outlook.com
 (2603:10a6:10:5b3::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PR04MB11163:EE_|VE1PR04MB7422:EE_
X-MS-Office365-Filtering-Correlation-Id: e9118bf1-c142-47bd-8a33-08de7b832b34
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|19092799006;
X-Microsoft-Antispam-Message-Info: 7qtmiQgXUREvrqEA8pkPuHEWolA5HksWOUlYMXtGYC97gIt8Mu3hp1zoNVY58bhS4id/rXgYTeYQclvpQUkRvvGTUVlYLGsEsWHGkmRS/q86uUSzWEXE6vEGjG/ploriNSK/c76vwG8aAOrCztRDpPVDfPxwMZAxRcoRKPHjwLyerC03zbuT2qEfDQWPRz87f8CCY1AimEW6JdEJq5sSkvKqtFAYw/kFfHeaU8RiOTpylXTin+4f6KUwIh8wDe95TORVjlGKyHSFZ1C79LyriDSjYK+uRtlndw9O47QCyOtlNuPfk+Ot7ljKIv94J4g8LfzCCMS/Flzh72a2umVFgQvJl75ZisaYeWiQYhuj9GCNFrBkcW+KqKgy6HtzV8kVQ7s2W44D0j3QWfqg2upVKH2lIdb1lBUwJtaddnxp7qcqRt8IXNIDfO1nDi2VLhAD6uJNcmAHmg2Yd29EMYsEYcdfz9va/WyVKjstk99eYSSk7Tr1n5QLyrwJwmORlQeL7ONympNw5Xoe5mBD90TAIXaVRZx83ExLsWmT2XPNZJklOljCp33uvA9EXBUr2uNFwntr6gVKuK+YUFvNu4GL97GhAnBvrdWLHTIwuwIkmcfdc/WmwB1cbRAKoZmLeZixlkH9h+EQLyStQSrMkKIP8CQEDoGSldoLXLnySzddYFHwa5rrL6sd7JDucJEpJ2l7MmHcOcs8VtnqoJSOZBFaN2NPW9CbeDI3q3AG7ZFY5J4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PR04MB11163.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(19092799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?62ztQXnqAL1yM2NjAjNff8DalXbO8RzIKdoW8rRAFzcPshGkM8oRW7DbNZ?=
 =?iso-8859-1?Q?cUIYMABvIqvp4B14ckh7WdkRuqNA5UFmfGsTZeWqJw+Dc4qyaXLEl+NakP?=
 =?iso-8859-1?Q?PbIRvEE1N9QpQlrsEarOMyHzsM1XM5pK+5MP5xVobG9K0sl/diiE1iI79s?=
 =?iso-8859-1?Q?mE4BpiflvsBE1R586VZ65YeBp55wcYSKV8+opiiJnxWYUO5+Byzw9fh2/c?=
 =?iso-8859-1?Q?kqG/1iSZ2JWhv8hcbN5oXPKE0n/3OA8fuXT8SlsNf2IneDbOovaor8RP/1?=
 =?iso-8859-1?Q?ecSOAqywGjgTbAmNTXS4L9NMnvEoHLX9EypMJgk10ejQBlsWOwCHtJ/UdP?=
 =?iso-8859-1?Q?auMiVC7ODZ4XtM6iPUL+LhQxeh1Es1KjIt6oIpZsdWOpB6/uYq+EJZ3ND+?=
 =?iso-8859-1?Q?pBIDsbk6dUenjxEAPPDlk1kKCcw+oIWCnJLPRuVMM+qPUqVrl3eVhxzR+u?=
 =?iso-8859-1?Q?5tDnEUQVCj4sf7mEMo5b80aqSELN2MLeG9JAjJx44DTU0z/UpTdMLXl5DP?=
 =?iso-8859-1?Q?wu12xUwXd3F+qqe0UEypicNb55T5+5MTpDD2Vl/XuF/Hr5Zwl5S5kl8CKW?=
 =?iso-8859-1?Q?0RieNnMfoiQ24v+LWK4cgjltwxRpkchTV9FUVod2HqjmtsLgcL+rDiTBJD?=
 =?iso-8859-1?Q?w4AcT/RlMmbQyYj0o7EGkKVzkE/PfODPFnhGQb8/KYYyg4rHsz6hnaUYHE?=
 =?iso-8859-1?Q?4u7gRR+mHQOd7MZqFtb/NMNuXt/0z3iWnMr3dqwGxCduyJN2wKx8t33Juc?=
 =?iso-8859-1?Q?PjjzpGWRsi90x6x9N2FVIddj9ZSk/1fW8QZmoMc+mZVmEBuf9FNSCnPYJg?=
 =?iso-8859-1?Q?NibDiXbkk9ZdWIp9WFL7zFxI46zo6oQ98tjBsTasa5XROD4a6AgJVxjwV0?=
 =?iso-8859-1?Q?Gx+0iBFTUh4cfsrpnRCxicGMQMC9BYu4zbzp+9BQKeqGL6YBTop81Jwwp5?=
 =?iso-8859-1?Q?cCftfC3yYUBxau3rtT5EJvz1TgyqPpgB4asRmt2yDZk264WiQUkAGFgW6P?=
 =?iso-8859-1?Q?k/PNHWCXmLlqGVOrUEoy1ek7fl3kLSGWDqvoFlmqyzF5DKDSa5AYg91PbU?=
 =?iso-8859-1?Q?l/iKZGnzL80rMWFUAjJ80e3ZALpKitEinlMrQxO+Xr0ZJ5dsrMR8aORnL0?=
 =?iso-8859-1?Q?IxXQbSAMdEQ7Mar8SX33BgpD0y6NuJzaxqDMOrDRAqLu0G7HLKbIcXZpXJ?=
 =?iso-8859-1?Q?D0eTQ2ENFMbCCjotoXsVrXhmMolg80vG8PG5oJai6HtfDwcZtmbXZhFGbL?=
 =?iso-8859-1?Q?gv/RdT77m+yAv6hpTW11VHe8/38VBE/8D1bGvUlW9+RZl4qfIo7YXbyk5O?=
 =?iso-8859-1?Q?2gf3Z3prCOUlfVoatRHMxpwcPeK8IsOhtrbl8CD+HqYpQurD7qJumS5c48?=
 =?iso-8859-1?Q?DjL/9PzzFa7VGEMAjebPtUUmlo8yDGlBuJTXOlr/EbxiEaKLadxkURZvax?=
 =?iso-8859-1?Q?cC1od7b+fiMvbql/VSYGdFZ0yljaQ0l1fXrqJMIj45N4Hc/emm7tHnViV2?=
 =?iso-8859-1?Q?5C+BjC4pEkM5OhyOwastFD5X3/oWhlJc8LdRwd1Ez1WkwsmHBnQ8RQJFOU?=
 =?iso-8859-1?Q?bKFjSdSznt39RxM9sdE4iU4ijIcgrisIUxCloQQfnfrWYrPRC/olEBuHOS?=
 =?iso-8859-1?Q?pYiUHJ/KqMrkp0/F6EDfKnR6why1LzgTugopvtxV/u8IQ6X5OzD9bZNJCb?=
 =?iso-8859-1?Q?el++/WyW/c823nJBneTXQialp4bj/NZGXnWsfgaVOZFJE3XeTRfCjRij6p?=
 =?iso-8859-1?Q?MZJXmjWShypWX2EfBouKpiLgCkU14IC2kcdTDl7WHpZfVKOTpXJhLGpd6W?=
 =?iso-8859-1?Q?fZlXk13Zyg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9118bf1-c142-47bd-8a33-08de7b832b34
X-MS-Exchange-CrossTenant-AuthSource: DU7PR04MB11163.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 13:20:43.0573
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /DggNiKb22OwY79GmeHH//gQ2n+PgaliIav0cARMB2LQh/nthT0QdwfhG7U2Bx+e16GyBoiA3lQ8n0yvpa3iIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7422
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_052050_099688_9954CDF5 
X-CRM114-Status: GOOD (  13.93  )
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

From: Florin Leotescu <florin.leotescu@nxp.com>

Some platforms rely on Linux to leave the EMC2305 fan controller in a
safe fan state before the system restart handoff.

If a soft reboot is initiated, the controller may retain the last PWM
duty cycle written by the kernel until another software stage
reconfigures it. On systems where no later stage immediately takes over
fan control, this may leave the fans running below a desired fail-safe
level.

Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>
---
 drivers/hwmon/emc2305.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/hwmon/emc2305.c b/drivers/hwmon/emc2305.c
index 64b213e1451e..d631d972c40e 100644
--- a/drivers/hwmon/emc2305.c
+++ b/drivers/hwmon/emc2305.c
@@ -714,6 +714,20 @@ static int emc2305_probe(struct i2c_client *client)
 	return 0;
 }
 
+static void emc2305_shutdown(struct i2c_client *client)
+{
+	int i;
+	int ret;
+	struct emc2305_data *data = i2c_get_clientdata(client);
+
+	for (i = 0; i < data->pwm_num; i++) {
+		ret = i2c_smbus_write_byte_data(client, EMC2305_REG_FAN_DRIVE(i), EMC2305_FAN_MAX);
+		if (ret < 0)
+			dev_warn(&client->dev,
+				 "Failed to set max PWM on for ch %d during shudown", i);
+	}
+}
+
 static const struct of_device_id of_emc2305_match_table[] = {
 	{ .compatible = "microchip,emc2305", },
 	{},
@@ -726,6 +740,7 @@ static struct i2c_driver emc2305_driver = {
 		.of_match_table = of_emc2305_match_table,
 	},
 	.probe = emc2305_probe,
+	.shutdown = emc2305_shutdown,
 	.id_table = emc2305_ids,
 };
 
-- 
2.34.1


