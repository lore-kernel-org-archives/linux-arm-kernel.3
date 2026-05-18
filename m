Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82342CD4F4A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 19:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qcXdRJ1bIJpPlr+9xrmlWsiqzrtrhOSxHFXsLSR6g+Y=; b=FCrnhzGBXZIQXAIxhPZCo7ixHT
	e7gxe5ALaze1TdwoZFwkjmjZ3T44PGLZ12323gnmdDUFWcMgprTe/CiljQggVnC/IqJbkIiaf3r8w
	JWqbUgU0NVJAUwtxo3f/h7UrUdnPyYKBIVmKJvJsvlq3E1Egd7b3f147EHPM/3buCqDUizM5kZIwH
	r6XKObt48GyGvJPyuS6L7L/krXF3rLIySMFvO+FLm5jofGnQrb0DzrgHwks5EAIquLfkGgoLYPgCq
	itgjPX3EbX6ZottnnQlP+UJieKFc9l4q8P+jYxZEyEMYo+HFvFIMJJEBoYvUOzxpNx1IJC1dVLYf0
	LyLQKx3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP3fT-0000000GgbT-1r5w;
	Mon, 18 May 2026 19:30:23 +0000
Received: from mail-westcentralusazon11023134.outbound.protection.outlook.com ([40.93.201.134] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP3fQ-0000000Ggak-2ziW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 19:30:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d0v3Tya78Z4/fx0/eW1uwTZHA5GNWA9ZdyYLFOAzp0sSb9kOoKjMpcwQ1W6dENDHJSprFO8lIRY3yCQe83LG1ExOk00nLAW5MAfRr+8skxOx1nlj9inVzqV/ajs/suk39iur/6uwijRjyHBpm/XggHQak9WDA2lRtFNhXU8XRxN6UkSk8NdONnRuRkw7QJxWP4cgGPikCZQXQ73NewJa4JZxvjaHswbcen8CFx0cP7J44VqZU6qh2xOh6gMglGqXTmlcvt2E3CPZqkfNvUMyuQmceeAuQyVDoo5L0tRIHepdbV/FRUr9iEcDhwNOkavZjqkfVpSL7wq8MlWxTL3cOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qcXdRJ1bIJpPlr+9xrmlWsiqzrtrhOSxHFXsLSR6g+Y=;
 b=K4a+yJyIg+wopAQ1dA4/S63nS2Cv6V51yXbo1e3eog1pbzjtrc6XxWEkncThAy/P1wgvN5A8Tio0KbEedtqZDQeLSebBEqAwhRC9kn7j6WGsgKVnXDWBqF+zmB1jlC5QBceEHscxWlD6DnUaYbYWePeiLEdMpHzPA7g7ZhXKEff3sCIBD5RrdNJrXRUbLopcnsgwxQPSXdZRVPpg+ymz5jqCnIIZkdIyJIC1PA4Jp/r+AoVNlOY0pAcMLL7o+8RxFLxi2GpVtCfZ9ZCry4QvJ58pjKJM9nxmXVAEKan+GPvYCtKhcRT9nY1c32VS6gp5uRZZ2ZTRIYsvZQtcW7VAIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qcXdRJ1bIJpPlr+9xrmlWsiqzrtrhOSxHFXsLSR6g+Y=;
 b=GytBHJN27uVTT3L6ICQr8nqraaIGPyqCo++Rda9uGQFy/XnZ8bjT2NLW8h2u+93je8eFsOFFFy2yiq2oq3Q0eDFBmO7IdF/TSfd7Z4L2WLuKhnNkHMfeXI5yjZJkxK9tk0belUjqfCPAUME8oq/mPAbKIVZrupYt0uhnY8CgJ4E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from BN3PR01MB9212.prod.exchangelabs.com (2603:10b6:408:2cb::8) by
 PH7PR01MB7728.prod.exchangelabs.com (2603:10b6:510:1d8::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.22; Mon, 18 May 2026 19:30:13 +0000
Received: from BN3PR01MB9212.prod.exchangelabs.com
 ([fe80::44f3:1050:dce8:1ea9]) by BN3PR01MB9212.prod.exchangelabs.com
 ([fe80::44f3:1050:dce8:1ea9%6]) with mapi id 15.21.0025.023; Mon, 18 May 2026
 19:30:12 +0000
From: Adam Young <admiyo@os.amperecomputing.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	linux-acpi@vger.kernel.org,
	Andi Shyti <andi.shyti@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Huisong Li <lihuisong@huawei.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v02] mailbox: pcc: report errors for PCC clients
Date: Mon, 18 May 2026 15:30:06 -0400
Message-ID: <20260518193006.27425-1-admiyo@os.amperecomputing.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CYZPR05CA0030.namprd05.prod.outlook.com
 (2603:10b6:930:a3::18) To BN3PR01MB9212.prod.exchangelabs.com
 (2603:10b6:408:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PR01MB9212:EE_|PH7PR01MB7728:EE_
X-MS-Office365-Filtering-Correlation-Id: 62dfeaf2-e729-47b0-e7ca-08deb513e0df
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|7416014|55112099003|56012099003|11063799003|18002099003;
X-Microsoft-Antispam-Message-Info: OrGhRZjSs3tUBhzcKEeMtQH0oEiPDq8ClccJiC8nfo1EzlPlpVwVdCN22eX0WgCT+RhtYK0f7SGadFVsR6MJcCtczpVUI+cNEwn+r/HCJ48djDk/ltiNQx/u+0CMnsxHW/aCK+V8M2/H0SV5s0bBv69Jz3rhKOkBwMTsD92Ca/aLmtAdZuOvIBBKJvKVXjJpVT8iJ5dy66e0arvOL41f2/lQhANY6vU+XdS0jwed/KrWpH5D8Ht7lg9/jn5R9j9tl/ffeRjt8d6cBs3xyn5sWtCnTLpk9EALewc1hiO1pyRimeFe5Bq09LG+iZ8FjA4XFNA+JL6waoZzADvzrv4QGBKkxdviCewUAmWfTf9rWOnV+LFuIqoUSPdqgMXRdNwteGEEsfj5nBCk4U5SfqXa0tF/a2pJJ1mx04q/KqAHkLDoopz2sXrS61jv+4Qf6SXbHUN761en3hKSmp6PbyF81Rzw+MHd2zOjwYOmmd6GXySFsSBYM06/8mdrTpkTo5EnemaZ6DQe/ZwxQyI7ibv3sQDdq4XRbswOwDJYvKD8qXUWVbBlsDB+0RaG9tPO/hJDYl9jO52ZSkpWuhLNwBU4Ay16wbc5Y8qtPhz9x6MqmDkxt0XC5dvA2ic0WqOZrjjQOarABpazAGg/aFKGbj/VbRGe6dilJ/3xJTZeFe52+AS/4zOGFy4HWzQiF6MrwkiN
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN3PR01MB9212.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(7416014)(55112099003)(56012099003)(11063799003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oS+6hIU2GIbxycBPqYxcFZ7z4B0msrOEyj2bgj69s65A1jwvo4GOpJeZXusP?=
 =?us-ascii?Q?xM8fjUstsEggnzDFfsVOhA8usvCQSFgfyMu1JWDOXcew/WDKUredD0Bzkb0r?=
 =?us-ascii?Q?bRQeaKDa1cvRNbjskXBqkGfu9NkAyiQY/rIzjECcZK3fI8SSn+rladHHEKQ4?=
 =?us-ascii?Q?JejuaJ1qOsvWbRarto3wMFv18olbxPMVQse4qFRYWdDgE3/h7sO+HZ5q1wXD?=
 =?us-ascii?Q?f5DLny876Jl1ZF1IUoQ8tR+PE64XYNA/MBSj+fVW6M916dwKBdPoWuYhbuvR?=
 =?us-ascii?Q?0VGvTrbmlTicKpdL6EFY85ZVj2Q+fWm4tFHa2N6P4VJr7raMuGgPD90V1Qlc?=
 =?us-ascii?Q?YnUYB0BSi/mHddotunqMRoYTq63sPsCKlTwGzTvJONYFfeh9OlhGacFx6dy7?=
 =?us-ascii?Q?/7Skhojty9VOWUuhwaljh8Gc6K6f1GjSJEeOd8gAfSyq9WcIUiFFdy9Qo0wP?=
 =?us-ascii?Q?yaNbxfo8jy/pwM3eYReawxSwLLrwzXFgeTwzNOlmFAL30YI/gXMyEtcElqpl?=
 =?us-ascii?Q?5tf5XdwJybkYm/6gQt0dr2IaO2Wm2hKldUNjMkUk/GGNLj9cQ41LGJk8nsxk?=
 =?us-ascii?Q?2pn+mfIFRa0xMBsZxLVNozzSbsFYGJE6+MR45x6W6Wa1VJt2DzXS4b5ILwko?=
 =?us-ascii?Q?inSfEjLYr5dT6s+X4154hVY5EujzR1+9ZdUYFaTKiclBTdwreckgV2Oybu09?=
 =?us-ascii?Q?TLM+laRvY1X22LQdc03nFZH+BzyuXKugC1QlYowXD4OrGCIi/0OGQlsOHaaU?=
 =?us-ascii?Q?4yRYrooIQPSEhZEhNn46cmfw/IuMwhH6fvg3SqCJVPwhxZs+53MGckqA6/c6?=
 =?us-ascii?Q?BlLtK7MGWQZ9SWlcqrvKC4GthxWM2QxzgosTO6SUaqM1tZbOVIEL4owH8Tii?=
 =?us-ascii?Q?42r62y0wPXG7bEKU0n/DzBncWlAepCk244bPWbAnvDlk8EYi4OyW3JHHn83h?=
 =?us-ascii?Q?LHLjR+G9+K+wwHpuXrkx0Eo5UvUGOd90GxPNzwKHcNzhuQcEzsSzB2m1NMep?=
 =?us-ascii?Q?u92s+QNbvuhLo4QFisYWAqNyAecgVZe0EcOdqiFfJKb9WVVnL6dxX3ReOJLR?=
 =?us-ascii?Q?Rp9I/sL/Bs+nYi0N5REAfQj1/KD2G55AVR+hrdVEirdtxSs7ESRnNObQmMh/?=
 =?us-ascii?Q?NLlWjQeY9sDCCzbk1WVUQ720LMWj3ohImiju5jOJAFz0q5MPVYdTAFjcEgKY?=
 =?us-ascii?Q?7uJ3iGjgnUd6ejk/IbSOnuDdJ+lfZbex9NhQGD3ySb1AVwoAls5vbDvl+b0Q?=
 =?us-ascii?Q?x/pDZGRIBmmmUr6qJ63WCHgRvsv3CtukJt1Pd8lZz2stxlhDJOxvaTwA44Vt?=
 =?us-ascii?Q?NciM2GTTUfuzb0kcEvhWkpuft6cVuBITTudO3bPWzEey6+DD28SFErxAswV6?=
 =?us-ascii?Q?rf9cbtR2GChxIOizbZZQbLNQsO3vYjK/NZClPO2g1uAg0mhcNpwkPzwG2swJ?=
 =?us-ascii?Q?x+Q3omLonro234rRzx3qyVxU1FuxjomEW8mP94DQHYfioNJo0veq4fmh2+eT?=
 =?us-ascii?Q?c7Fa6kvzPhRIDHOa+A3Jtx+ZRi0UIHfUApPkK4sNAvA2oNyv+iPc4HnPC07H?=
 =?us-ascii?Q?R0VY/tNPQJ1n48BZ/SLCx6Mzq0aXTXycIwlJ8DR1df8Wa1yiGFVfO5uLGpfv?=
 =?us-ascii?Q?WSNkiI5f9RdUtxwopGYYlimR+PDiV5UF2DLNFB/tMOoSoGa4v0mghPpnBf1L?=
 =?us-ascii?Q?HdbAnkfPS6u6WxDEd/Gak+DnsqWrCRDF0+/eqWe4sW4Kb/EwzFGIVpS1yehQ?=
 =?us-ascii?Q?GzJGirfIiYu6xKhiEE8Wv9B2wi2yBu5lXZep8Yjd/LIZ18tduYmlJNIoTDT1?=
X-MS-Exchange-AntiSpam-MessageData-1: woEQNIW/ydPj8uLQC9ubZp69EgwUW3tb/AUWRNablIhoZT8sYH3TRgbj
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62dfeaf2-e729-47b0-e7ca-08deb513e0df
X-MS-Exchange-CrossTenant-AuthSource: BN3PR01MB9212.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 19:30:12.0568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oq+itG0xJlJvun00+4ER/6US7CQ7m5U8EFHpAb+Be1Ja6YW0i/Ip3HJKzTB/zr1G4MXnAH1IkEbVD7qUU/FPlqhxwck8wMl8PI19cVkD0+4MjnjZepjjxnLwMPycF9l1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR01MB7728
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_123020_769019_D882057A 
X-CRM114-Status: GOOD (  16.16  )
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

The tx_done callback function has a return code (rc) parameter
that the tx_done callback can use to determine how to handle an error.
However the IRQ handler was not setting that value if there is an error.

The following clients are affected:

drivers/acpi/cppc_acpi.c
drivers/i2c/busses/i2c-xgene-slimpro.c
drivers/hwmon/xgene-hwmon.c
drivers/soc/hisilicon/kunpeng_hccs.c
drivers/devfreq/hisi_uncore_freq.c

All of these only use the error code to report, so they
are expecting an error code to come thorugh, but they
do not modify behavior based on this code.

In the case of an error code in the IRQ, the handler was returning
IRQ_NONE which is not correct:  the IRQ handler was matched
to the IRQ.  This mean that multiple error codes returned from
a PCC triggered interrupt would end up disabling the device.

In addition, if the error code IRQ was coming from a Type4 Device that was
expecting an IRQ response, that device would then be hung.

Fixes: c45ded7e1135 ("mailbox: pcc: Add support for PCCT extended PCC subspaces(type 3/4)")
Signed-off-by: Adam Young <admiyo@os.amperecomputing.com>

---
---
 drivers/mailbox/pcc.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/mailbox/pcc.c b/drivers/mailbox/pcc.c
index 636879ae1db7..16b9ce087b9e 100644
--- a/drivers/mailbox/pcc.c
+++ b/drivers/mailbox/pcc.c
@@ -314,6 +314,7 @@ static irqreturn_t pcc_mbox_irq(int irq, void *p)
 {
 	struct pcc_chan_info *pchan;
 	struct mbox_chan *chan = p;
+	int rc;
 
 	pchan = chan->con_priv;
 
@@ -327,8 +328,7 @@ static irqreturn_t pcc_mbox_irq(int irq, void *p)
 	if (!pcc_mbox_cmd_complete_check(pchan))
 		return IRQ_NONE;
 
-	if (pcc_mbox_error_check_and_clear(pchan))
-		return IRQ_NONE;
+	rc = pcc_mbox_error_check_and_clear(pchan);
 
 	/*
 	 * Clear this flag after updating interrupt ack register and just
@@ -337,8 +337,9 @@ static irqreturn_t pcc_mbox_irq(int irq, void *p)
 	 * required to avoid any possible race in updatation of this flag.
 	 */
 	pchan->chan_in_use = false;
-	mbox_chan_received_data(chan, NULL);
-	mbox_chan_txdone(chan, 0);
+	if (!rc)
+		mbox_chan_received_data(chan, NULL);
+	mbox_chan_txdone(chan, rc);
 
 	pcc_chan_acknowledge(pchan);
 
-- 
2.43.0


