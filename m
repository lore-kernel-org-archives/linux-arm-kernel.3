Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8FF8C44507
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 11:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VE+FVmdnBf1PST0PzHLPmWGcvZRop9k196U3Ptq+c20=; b=byytwBRnzVaEFpDEKxmtI2a5Dy
	/Hi0iZpkVzTqyrK15KdshdtEQ72TUzcPUFfQV2cisDM7+I/czyUHEVX5Dsw7fBac/7INxea5ELWBU
	pwKXlp6ltFgn6uVmWtSeTThg42CJfEAl9GYiapnNh3e+INj6gxPVKNDfV5oIVXRSYSigv4SqEtx4Z
	22mdR9/ni9ubPR4y6Npi/GFJ0ZaEzm0BkVSSH+e4AeGC3smjaJOfg75hTLCPXeTsS5h05c0IcmyFo
	eMUQJE7pN3jBERxIPesob6YyK11zOMqL2L9MFy517vDGW/+Y82FIK6+fagIsdjR2/TMCihIaybj0p
	qz9EyOkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkgeK-0000000292c-0RKe;
	Fri, 17 Jul 2026 11:22:36 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkgeC-000000028xP-3sV0;
	Fri, 17 Jul 2026 11:22:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L983pSUMr9ojuS4AA/T93I4ctPItXipfQbOTchw8HAxJrWcNxd3zqu6dfKDGCVSl3i3BnxlwqvI4BcFI6ur+pq36vyGDca+aJ0HfdIubMLn0wCQKHL67euBjsF6opgkh6oaQmfE3QPygZ5uck3XezqA9hNwO0PoiKSpPvS4U6q7q/dz1hVlRaA1h4QK3fAO6xXTK2xlK7tJtKtVhJT2mp+HXJK+Yy0Eqc4mX0DRF5/0B+yRKd3iYQxRoLGUSaGJcCcGzltEUiLF18hyVnQwbMgAyIbDrFPef98ZCMhcyV9mnOVxG1P57GG8JRMMW09A3iajMTc3nbatN3GMADQ4AiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VE+FVmdnBf1PST0PzHLPmWGcvZRop9k196U3Ptq+c20=;
 b=qod23RHGsRFESy31XutIf7w6igTLc8Pz+++g7pDUGSdRAIsnq/vkkpRrautnzflyvDMpbW798LQsx5RYyWSJ9hKod6oJAIIbrMcHE50odXeBYu5pz0/5N3oVf+j/fOvtUX70WeFivZVrjCSeOovpBstvVDj4lQDjFqmptPbGXq7FGXogtQm2L08qDiXxcS60d5PrUDi8enug21kLrmBKVfrruhpwm7aKndrekeeZ9mDs4st6bONN7UK5vIYHvUyBc+wVjXPRO8XqR0Jbre7nFQirWvXH0S0IoOYrzL2vW5EcHgQBzH/b+ivoY+5pDGpmokvmdxZDSduCBeibIkelpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VE+FVmdnBf1PST0PzHLPmWGcvZRop9k196U3Ptq+c20=;
 b=Q4Obp5g/mz9HNOuIaQ6WlhMIfpwhKoCytNAuTF1eXNEa6viNyMGiBP6enhXC1ERzDpXiMXQqMOB55ei4K/bPkAfUg/R1e0jBsCgBJnHsI1HDBjM4qxCaTstByOJ9YHVLywX/95O9ZpqmRhO1YeNy9FznYOEiqLpBu+iTVGtR10EHmKgt9mDXcCxMD7XTX3cw9HCkzBhoJdQL8DFjfo28MFz16bmm0RBgJR1ZFx2UimkfFiEvRc2qvkLWeYkjrAoRlEb2VWtxrIuCZbI3E7PrtlWaHJ3B9Jbep1MhDITsJRr9VW8RN2BNUwQzskX/KPX/XVC752qZ6ukbMH39M7QjRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by PS1PPF5540628D6.apcprd06.prod.outlook.com (2603:1096:308::24e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Fri, 17 Jul
 2026 11:22:09 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 11:22:09 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Pan Chuang <panchuang@vivo.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Kees Cook <kees@kernel.org>,
	linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 6/7] platform/raspberrypi: Remove redundant dev_err()
Date: Fri, 17 Jul 2026 19:20:44 +0800
Message-Id: <20260717112103.213017-7-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260717112103.213017-1-panchuang@vivo.com>
References: <20260717112103.213017-1-panchuang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0025.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:a::15) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|PS1PPF5540628D6:EE_
X-MS-Office365-Filtering-Correlation-Id: 51f61344-bcb4-4c5d-85df-08dee3f5a42a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|52116014|7416014|1800799024|376014|6133799003|56012099006|11063799006|921020|38350700014|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: N7OnvY6QybFfovsGhIUV8HfniWReqePOQ3rgUkbzxGUKepdCuQn5zF4jfzQwQ57nQbznvnH7Qq17J8gk+ezamAlJm8haK9kaokMtGslVsmE0zo70sRdRRPJPxmYS1pRQMPgtYVnVWzLTYk2S/lRp8WWUyN7h93btqqPgaf95D0v3NVADe788gQAkERYuSIlCjuHC1hlTY+vWbaboTS/egigFb4WtA5W9BwuNySx9//AUTjoNQGCoJg32AyjJ8Oa/pqyWknkswqn5w57xgJWdC8t5H8w5a5k/tS+wD9rzaLS0KsacZYOlqMcmZEIMI0/+7GLQfUifZv0CNVPNkof76hndNRbRl7xd/Qx2/1bz+MzQyBl0O/i0xLT1uc0iAS24OYCKxePJumntDxTszfkb5Mr13kSN0nWnxKeL78gjiDQ6vbS7t48C0oeaJEAj4F4DAI05JBKvTzSckdlK0uhh8kKni7ne259TJzV6X0eTzW/IlDluJ8edJTEKheAmqqaIPvsbwDCb44qNweP6yw0chtS5+FjceazvK9w1vJ1R29+PVP5rhILxuvYUqI/+j2aVd0mWZdhy85uMxV5tvRIUNhmdoc/ZMqKjLBB7k/xS3ZIdwDZDQ0cnO05cBwZRK3ek84sSdPhIv1xMu+3WY52RVhk6W47WVKAgyF7XFw31IwVT9sZbnSFj2DBC5KsLYamGiLgDgR6plPWQJrTvOmNn8as1n0Rc2PBQSZp+t9EBeYK3hYRjUzVBU4ltOg4y1ObP
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(52116014)(7416014)(1800799024)(376014)(6133799003)(56012099006)(11063799006)(921020)(38350700014)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kfGcD3+bJSuHZKQ71rlPbsI2ArVGirAYZdWOWSS2UwPyocEvvxMkE7pxbYQu?=
 =?us-ascii?Q?XXP0/vNCShdiWmX1CNykEcTYmYUqQHTZT4aHaRBCN8WPTM9QPHM8YopnkM2L?=
 =?us-ascii?Q?xVpAiWcI9dXTfrSnuwIEA1ScHnF67PyAE57TU/1c/JkglRLB3UL93VraeRkQ?=
 =?us-ascii?Q?WyUFQU+QB4jOux8Z9ZkN8uIuHmHdwiz0gppkeEEf9eOKqfrKVToNNPsCyvvB?=
 =?us-ascii?Q?3rRG82qFw/kk3fXF/SLt9MwIui+SaAGpYLK0rw42xOxKFH9mngILpvxz7+/Z?=
 =?us-ascii?Q?nFoPgBjWDDB1hhUYs6QCZzVLxJUN0WA+B+/s7mEtYCnvxnVlgcw6IoeqDvV+?=
 =?us-ascii?Q?l1rHbSTrl4o1SFOR8yiidbn2l6z+KV4gsVoPwJfe/CrHtSt01UYa67Iz0Gx5?=
 =?us-ascii?Q?EgpFT+XK6t6lOn9RZ+/1xHHSMkCzoCcVVAEhbqfxaNAqE+ZuAKCE/yKWktQx?=
 =?us-ascii?Q?rZIT8/W48s/1rgG6vVSvMCdyyf3QgSxxQbHRLerd/t3CBhM2yIXwU+7sET9g?=
 =?us-ascii?Q?y1lgWcq0fKd1DjWuDTiiR/b/hPb3UAThCUbexQsYuCWr2+LWIBaZpRhi+QmU?=
 =?us-ascii?Q?E+PhfZfGXW5GRCmdilj59OFLNXpPdtY4YzlM3MIDwshhV39E2Mw8PKQcSUht?=
 =?us-ascii?Q?BrgXFiwbQcXVNpdQ2jORN/XykjjaEZaD2oLXab64NrMSdsza9LdpSZ3ZTUfN?=
 =?us-ascii?Q?I0Rbn+j64HFb84p1lvdA+5lmdn52845WkUVWOG3f39XlXc3otPav1BIoyeL8?=
 =?us-ascii?Q?OGoheIe8IA/6SeU/38Ez6ezvuHWcfmd4bgcK4XmZM5PVGEz49bXL10i7bk/x?=
 =?us-ascii?Q?OWzEfoDeoHx/oncpgQmV3cJTN9ydzVebFrvBfla05OL9siBoB1rZMA8ox/65?=
 =?us-ascii?Q?0cXQ5NwmB74KwvF+Ozz4PDoq5xJp5SQHaYTiOsRMdz3zM3MxkIK9QIOkGZDP?=
 =?us-ascii?Q?pQgOldJjwDfpkrCQFbdmofXyhtq74Cx62hnKNBEKicHKVbNK/+wcagzlyHj0?=
 =?us-ascii?Q?cYkltWd7K0EV2MXeVCjHUbKpbpLyG4a/QRr0iFLAE5B5UC1DJks85K8TW/kt?=
 =?us-ascii?Q?FyWgFyhzeauPQWCBvfyufTb0M3b6ZCWIXVg8Xvt59yNZmUBQWgdIqaiNWIT/?=
 =?us-ascii?Q?JuAD72ZORSGgSH7y9y75bpT4MPukrhJyfYyhM4Ah4BIo/JFHwknFNegjsFea?=
 =?us-ascii?Q?tzsd5pO7uxbkJieoOCGhhxIhcAZesSxGYo2A0PD5zbbSlp44ftHNvZzPH1ts?=
 =?us-ascii?Q?CJYx6ReQKt/aU7oE7nyPEuks7BbnunpnzLzJYLJAjWHnNzj4+K7skDZaAkea?=
 =?us-ascii?Q?ZBorIKkLvv2B4D4UJkSy9uH2AYO9h+XoifzD0oZeAaQfvpYZbwA/5Izbmu8p?=
 =?us-ascii?Q?F617tYAuu0fFkHzR7yxqEw2A99MNBLGMaToZUtoTAOqNzFIknU1g2o1D0qO7?=
 =?us-ascii?Q?VziWLvFG7zBlCTE+d164k/RAoQt3AUfuO8/jU/cFjQDd1yVabghOM2XIzLd6?=
 =?us-ascii?Q?3DXVyRgTa4hjan96XXF2clFtzcGPJl4zHllY285z7kYCLBOOPP+Grfgi4ldV?=
 =?us-ascii?Q?piSvVOFEWFUf/L/ojKrYry0e8+fbbqlO1ZrAGKw7bqkAKcAbqrWdgy+2tmG0?=
 =?us-ascii?Q?+9tGrYySlynRXLXG5vyvh+Io1Y/6lyh4nEPvPcDH5utkSefI7oONffbphuAV?=
 =?us-ascii?Q?OQCBLhwz8SYxKaApgk+XTkbfiBWNKR+2ZHwSatRbmd3ou5gQNyIpYjAkjxav?=
 =?us-ascii?Q?zxoPtcC1eg=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51f61344-bcb4-4c5d-85df-08dee3f5a42a
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 11:22:09.5657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xZGzFVQgYkmXX2JRsi7kVCHnp/5tPCtT7u3/u9KI85HYP+s/vAwn9Dwj+Tn38i+Owlxu/TpXJns7wpjzOWixIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS1PPF5540628D6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_042228_968556_93D1E3D3 
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

Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()"), devm_request_irq() automatically logs
detailed error messages on failure. Remove the now-redundant
driver-specific dev_err() calls.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c b/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
index e78641703252..9490ad88df0f 100644
--- a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
+++ b/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
@@ -257,10 +257,8 @@ static int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state
 
 	err = devm_request_irq(dev, irq, vchiq_doorbell_irq, IRQF_IRQPOLL,
 			       "VCHIQ doorbell", state);
-	if (err) {
-		dev_err(dev, "failed to register irq=%d\n", irq);
+	if (err)
 		return err;
-	}
 
 	/* Send the base address of the slots to VideoCore */
 	channelbase = slot_phys;
-- 
2.34.1


