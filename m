Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C0DBC5516F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 03:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ES8hMRYYkWIjnBvrrzOdeSJ3TUh6KNJ3DdQ8rppcN9c=; b=zzXranfL1waNQ5h4puPYUd+sK+
	M6w/aXGyX7PfNuMKOMoY/ciOaJvYbaMR303GNvT+l8Rp0oa33Gf/mCt2kd9j/UhA2fLG3mJacIMmH
	mulLtvhE/NcOzX+D6d2gSeCRFH2O6wXRil3SC18wq6le5bS+7xIYtu0gkEEIFNXCW+9Y5WzHNa2+Q
	Lk38CIjB90ZBcLcPGAxCuwrAPZSQYfmTdz8lhhjVBw19MLZAgtlUumksEfZwCfkQ0kWI7ylqwpv6u
	cUhtxQETdBT5uC9mujbqNLAIHMXR2dYhQZfftzTm0+u7GMMnFWMFaRAZ2sGT/s4noI9OGxt8A7gT9
	I4Ie03iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpeLo-0000000BiN1-43vv;
	Fri, 31 Jul 2026 03:56:00 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpeLh-0000000BiHx-2aet
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 03:55:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lXnKURBRysczz4PECDr2mlJGn47dmvYvKQO2/liSOMhTguMX64VnPkJSePDt9AJ2JGEdiKqrBkANX+yMK1C6y4CpjkkcWCwupgqiosmOmBAo+PENc3NmkzhtD45nJR14SGArRfhCxLJbBdgojtwCWNB4T4Zdalaaw6lG0tcmvzMbdMl9QtLmgguXBkEw0XmMiv8WXcPfYOVHeIuUiA9bvsHdTy185BIE9zzA1+LdnBBRAeglm0tXFERlwbV3K3ijY/2qS3pbUQ6zZjeYPk70q4F8LeTAahd8YRRv+kvnUS0kYXpUiDeCOf3qnbhTMBxeykufWQiYljidS4sRKiANQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ES8hMRYYkWIjnBvrrzOdeSJ3TUh6KNJ3DdQ8rppcN9c=;
 b=Z/vVPIQtZKbUveddFNNZp4ZuluLoDM+P1E9TQK3kwJm5vGBZ31Ji6dRXG/tN1u19xzdc01awhVIVg+LImYpLAZ4CL3zZVa5SzbdJXXgmxNhx9F3nGCwcsoPfQ7yAzIFd2LmpEDbf+Ub1FccrCBdwR+Jya56LU29jhacglUhao9jpg+S+woxzdNHaR4y3bKBC98bMwjq3PUdG7/hzkLnN/7wSIZeTXM2K9jmni66ysME8egsw9xZnPDHj7PxzbXgprpFQ8LU78p8hZ50SxMaxrMRW6SXp0lY3fIph4vHY+dCFC9WVw4f8t/2DTtR3xMbtJJ2qzNrgksd7MF1GILfxEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ES8hMRYYkWIjnBvrrzOdeSJ3TUh6KNJ3DdQ8rppcN9c=;
 b=mZQe5hZj4j8isXblN08LFLLbncSZ9MsfJIhpBgSaVFQRv/4d16h77mOk/Bt6XH8uME9Ep6+K5spOZ4k8sGn+OquVIw40HWVKw/xwJUJeV+ZMCic6NTtfUjKlmkNjXvoWLWRg1C+HhBEEtpHDACDl/6F/aXTDuoYOCuWnYafIbNI0Rnq/qKPoTr52wN+X4lax6hiqPJyHKymG9ZPtaQQybihHXpTrYgeX7uohVKuU8ETyE+6JuEucpfYdFd6JiD3UcInZJHGdAjUSz7fz2WNYtnBohDQXl9c++alqO0L9cSLjiQ+99sHXeaaEqW94Z5VVa5IExGNIz9aQJq36eGexBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by TYNPR06MB8782.apcprd06.prod.outlook.com (2603:1096:405:3c5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 03:55:27 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0245.012; Fri, 31 Jul 2026
 03:55:27 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Al Cooper <alcooperx@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
	linux-usb@vger.kernel.org (open list:BROADCOM BRCMSTB USB PIN MAP DRIVER),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM MAILING LIST)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH 07/11] usb: misc: Remove redundant dev_err()/dev_err_probe()
Date: Fri, 31 Jul 2026 11:54:41 +0800
Message-Id: <20260731035448.252289-8-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260731035448.252289-1-panchuang@vivo.com>
References: <20260731035448.252289-1-panchuang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0115.jpnprd01.prod.outlook.com
 (2603:1096:405:379::17) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|TYNPR06MB8782:EE_
X-MS-Office365-Filtering-Correlation-Id: b9ff5354-d0b9-45ea-3523-08deeeb78ea1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|23010399003|366016|1800799024|38350700014|6133799003|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: ITan9e6/5USk7d8tqkD+VHg6NlWGLWhYYz/QUKCiin4LYCSx+I/Z5oSZo/920spUakm+9+8+7gJLXrmH+apcTBRNcbpdAJcPiLxhoL2qGO+iaZAd1K9m7XdinUu/YUauag+I+krBQ+b9/pBNwWaRq8VZ5ozQ0CFCB/LcQhKzWZN+1v5S00BB1Q0rcbhkup7/HiFQT5Ed7039a2nm5yn13vEJlnFwn0Tiq582/RK//uNnahxH7rnf9EVrFvqQ/8dgiiVBtY/xJbxnA8h5efdbd5yVW3WcLp0RvYkex7mK5U2R2gDJD2gsFlInpCt4ihVfGN2Zd8e1Yn2fyh5O20/PhwL+xmOzNFsIygbyydhoIznkMQrcn5ZPYqy539MXWJjxz5Waafxgr7i+i1nTpT4x5m7H6b4HBG33T6eOxQQzo+WWjPdVNWv4N9JB2v495/GSHkWjlW8jdDe7goT40TrsRK+SzVYPITKGjEeEJR+us7q7ZBflK37rCSTbHxr32i9UWPEw1ajDcKke96lk3khTY4lrW5xhaAl9Fzqkt015WEbt3vS5IQWwZrhM/aQeF7zQG6+11z/M6Q7qUv+yOMIiPUPPYHeyOtnSC8JFEs6iy7X309nnVLxxR4o4whgZSU56jT/xbMrrwjATmkAPoDIGzCFCikuJ5uTpjfnX6aoF8zaWt3SsR8vCyshofGiFfjNS/SV4ds4oeXdqLuXJcinHnyg0dIQHsZTklCEw/14gnNU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(23010399003)(366016)(1800799024)(38350700014)(6133799003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ek4iKwidQhL4O7sYAaURroaB47VZbmllgrDKC39jLD8jt35Da9ujMZeBEHW9?=
 =?us-ascii?Q?j90BDY20UzIXit5U5jZveX/AF4g7C2ZFsXYfm6jaaLof45l77cBk3mkyqFV4?=
 =?us-ascii?Q?UNqIvXbKOKuInVyMW93fvlY5J7NkxL0X6hz/hCxGEVqfz4fRDl1EuUTxLHFI?=
 =?us-ascii?Q?UfmR8pPyAbqA+fF8uc19vzjrZbeExl7b0ErcgEVyeEwPrH/F54zkIJtTCzZO?=
 =?us-ascii?Q?EDF/1rg4nPrCl810DVA+azg0WiyEqkUkbReER7ED1NDYZahV/gryrSYPIvkT?=
 =?us-ascii?Q?T5mYqhTP+kpbec6BhiDP0Rua20WJyKH7+ze5UOi+rpJbWQEgVQoPKBTzLcKs?=
 =?us-ascii?Q?5XuWiVioctvlS/Tv4+aymFdGohN04C1paffr6Sck8VDuf+heyLw74yVfOsST?=
 =?us-ascii?Q?NAEa0NV7Y/zC84K99hpSej3LwlQFH6BEyt5eHWxz2H7orZmDVeqSFdqcoBfp?=
 =?us-ascii?Q?LWJTzvXkleCd8ZEIC+7MXSCHm3wRquvWdVnc/kM9elTjaNYrQI75OhOoixAX?=
 =?us-ascii?Q?/D1aLUZy8lQMegx3GzYkJWdYswAV/6X8NJG1qOVz0U+LXun3xlPn4d15C9Le?=
 =?us-ascii?Q?okPQ+6ahJlMighHowVbGL83+e89Gl6GCUeoqcGLHjpI+JgP37qhlYKzYdNcO?=
 =?us-ascii?Q?ecttLBbs8H+R/lXH5gu4IKeOfH1vTJNV1xvj7O2i5SZpxnNw1uDFXiUAwJDr?=
 =?us-ascii?Q?ZKf/M3HoEfRehWKtnaa2z0G25bUMNkZoa+1TwGeAUqQmTyYVgxhku1L8z7dM?=
 =?us-ascii?Q?7AbQKNtWqPBl9VFybbFeIWy7ZOfCzo5XkcySEvFnRoq2ELn1u2PLjhKNzyJ5?=
 =?us-ascii?Q?+iNLFz1BejCHHNNuIVknMQCDr/3iGxcgC9JplVdmtrQzSRwfg1gmzqK9hgWc?=
 =?us-ascii?Q?dpGiNwZZY2F6gDt9iMw7/NILMOvKAO1XkLzsKwvb2U7y8unCVyHGRzI4HFlD?=
 =?us-ascii?Q?GCBaTxgkhcySfNwO6j1xP0ubFQ7nK1l7vQkUJ96KNm841RYBuF4L4Q3GYN53?=
 =?us-ascii?Q?H0J7vkK36MwD6LlDSDgOjb7iJVg0mCgbLyleGX4M8auZaDkChbRzWcgQxpGF?=
 =?us-ascii?Q?4LHN+8Xhk3EO90y2SdIOY5qYrQCxYcuYa/nq9INTXPv8mXxfaUVdD+AtBlb1?=
 =?us-ascii?Q?20DyMMH+D+9wSGnSiujpjD+33d3Wm1Ql7EXw5It/v8VnAoDdAXAmni+wyqCs?=
 =?us-ascii?Q?R65QN7DpCNOY6mJ1E05THYJKPj4FlNRwYoNracmAKYGD5lMELXfXZOUvbS5R?=
 =?us-ascii?Q?SoySOzovr2YQkdngE9XSDqcYti4UN+1oywAfe7YWmP3hR4S+xEbFjaRiX553?=
 =?us-ascii?Q?xJBqcoa3bI2nVIMn3bZWiT/EPLhR6k8AjbtKXST1uwB7B6SKTY5Sb+gwEYcb?=
 =?us-ascii?Q?7jxQFXjIsYOPLNI9cMinmgALGJxB7p9PONi+rM/NASXbB23ZmKA1W6uLJacv?=
 =?us-ascii?Q?yzlEOWKfETiZHduTkHMR2GUViamXQtkSiYSSosHYrbAcSnWbiSm0bfuOxUu6?=
 =?us-ascii?Q?OPyAO/Lgl9ok+R673utVgA38CDyyUAklt2AKfDy15wX+ugi12Zc5Ur2kFF9q?=
 =?us-ascii?Q?wnWOIj7yr6kFstn9AQdXKSjMW8nlG4dX0pcxg5eOSwbx45ZoIJ71f4LEh+4S?=
 =?us-ascii?Q?hHAsEBRn1EjTxrElFUHIQH5TfxcJV+8LJxU6g1SqoX4xIySpk1vsrBXMal2o?=
 =?us-ascii?Q?5f7EDVYTQdGDnoF+rqLamf9FAPnaD5QXH/GqAhg+0BCkJ9LUDUHk6TDEf6RN?=
 =?us-ascii?Q?FlnuftDQqA=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9ff5354-d0b9-45ea-3523-08deeeb78ea1
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 03:55:27.4469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8c2iRBfWH2wkd5Klm7wNoOstyI6ohKL/XcPe79FXTzpWNih74qvxzEFg2CRg2K9iFlpRBFz9CahXAC14nvDAgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYNPR06MB8782
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_205553_659065_9A07A533 
X-CRM114-Status: GOOD (  11.26  )
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
devm_request_*_irq()"),
devm_request_irq() and devm_request_threaded_irq() automatically log
detailed error messages on failure. Remove the now-redundant
driver-specific dev_err() and dev_err_probe() calls.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/usb/misc/brcmstb-usb-pinmap.c | 9 ++-------
 drivers/usb/misc/qcom_eud.c           | 2 +-
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/misc/brcmstb-usb-pinmap.c b/drivers/usb/misc/brcmstb-usb-pinmap.c
index 1ce885e4184c..d8e9c80a9c2e 100644
--- a/drivers/usb/misc/brcmstb-usb-pinmap.c
+++ b/drivers/usb/misc/brcmstb-usb-pinmap.c
@@ -299,10 +299,8 @@ static int __init brcmstb_usb_pinmap_probe(struct platform_device *pdev)
 				       brcmstb_usb_pinmap_ovr_isr,
 				       IRQF_TRIGGER_RISING,
 				       pdev->name, pdata);
-		if (err < 0) {
-			dev_err(&pdev->dev, "Error requesting IRQ\n");
+		if (err < 0)
 			return err;
-		}
 	}
 
 	for (x = 0, pin = pdata->in_pins; x < pdata->in_count; x++, pin++) {
@@ -317,11 +315,8 @@ static int __init brcmstb_usb_pinmap_probe(struct platform_device *pdev)
 				       IRQF_SHARED | IRQF_TRIGGER_RISING |
 				       IRQF_TRIGGER_FALLING,
 				       pdev->name, pin);
-		if (err < 0) {
-			dev_err(&pdev->dev, "Error requesting IRQ for %s pin\n",
-				pin->name);
+		if (err < 0)
 			return err;
-		}
 	}
 
 	dev_dbg(&pdev->dev, "Driver probe succeeded\n");
diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 926419ca560f..a7b9ed4ac071 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -225,7 +225,7 @@ static int eud_probe(struct platform_device *pdev)
 	ret = devm_request_threaded_irq(&pdev->dev, chip->irq, handle_eud_irq,
 			handle_eud_irq_thread, IRQF_ONESHOT, NULL, chip);
 	if (ret)
-		return dev_err_probe(chip->dev, ret, "failed to allocate irq\n");
+		return ret;
 
 	enable_irq_wake(chip->irq);
 
-- 
2.34.1


