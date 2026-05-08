Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0843ACD342F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 07:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ppCyb+HZ2yDw6Mte7gER5qVxBsgAD8Ob8THrb5lQgZs=; b=Y8a/fW5lgE2KmAUrgX80lyrlLX
	8HrHf9cvwWRvGityaXY296StLr21l/luix4O4114Jsot+xIkgTnzE/q3fzrH3DPk4WvmE4TlNhNIZ
	kd0mHaG+wR1mIROmiTuAfJxrdbUClngtQM8GaslDthqYMzOTKOlmaB5Bw3OZOIqNZeeQXfWhHP/ca
	v7ZhTrT8SQb8FaMqX9vSkhmnVoojkJ0Xql+9OMlzAqqbQwJTtsFS70aba5dxXu/ajA39dLMHNkxBK
	Jox0VqikYpKBjxRiHtN66xff3hWhmcA8GNrfIlN4Zc5L1Fxnpd6n/VFDNv5aYhlKFNc/kPECZi7sR
	2iXnYzgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLG0w-00000005v6x-0wAA;
	Fri, 08 May 2026 07:52:50 +0000
Received: from mail-southcentralusazon11013028.outbound.protection.outlook.com ([40.93.196.28] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLG0t-00000005v6J-3AWF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 07:52:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IfC0UZtXltwiXmQ0nOHBxuNnv5mitYoJn7w0M7UNCMZKsIrgiWqdKJHTBZIgiDnGt5g2YiBVG3vTEtjxOIfa74fVy0aIGafSyyZLOrEVwc6J9ClFT0RFGYfngkjUONOa1cDp3rd37mc9HIqTXBhfHagHWIXe9OHxhDooHb4snndfDwZAmGYDMlojp0GZn1G/SvyJnX6gHH4tEPH0udsrf+A+VsUevgpskfdUsRfJR9ikjCM2OWOi8IRL/FaQd/EK4gt5suDGY0t+Foo/BcquU7/0BY53XM3BnLqgztUlKhYNYJL9hfUucgfOO96qmp6nyVOxK6qXxK/WQCxPgGb43g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ppCyb+HZ2yDw6Mte7gER5qVxBsgAD8Ob8THrb5lQgZs=;
 b=rbfpT/jSCavZmo+BU+fiXLiUajRdvdrJRbH/4trK9atqSMfER4Tj/eqnedYVHENg2ixeZO18MVvaAPvrVjNw7UKNA3mNUHmW64W1U2f+NaIMXzsGVyvdkFm65aBgl3cOWEWjtjCV9rL9H1kGHo8NhMvquY2kBJxt+vE1tkks1fPN+/d9ZeE4tDkovD3+EHmQaJq4/jD1FEA9C771D0FJBXpCHoQRz9V6ZS+L5MMp8lK9WGxLoWvuYyCDowJaRZFt8OPlBHCGynfIHnIcUh/UzSlOte9zF4OrRhd9de3JiZFD1uLby2Hmp/+QkXxNlAwsR0jNWnvACk8xzvkbH4OAJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ppCyb+HZ2yDw6Mte7gER5qVxBsgAD8Ob8THrb5lQgZs=;
 b=LgkP82hXWATmqO6SRTOpfSD8WqUQ2Vw04XP3EIUsc9LzsA23KMchTsb+VHUHCNp+gAhQNzHi8uLn2ams6DFnmQAV+c7+fOc5F4KGFdkJS1HIs2Z6rTyICfu3K5YWPODeSc/SH4o227ir53ooBEL3Sj6ePCEZIie/TCqnbPCPe34oMnB8kVoPNadze/elhc9q7Nnt75MTXLkajfEJzdiBs+5ca6/vMH67GMeHJetjn/7BR3UsOfw70ZWYmKnWCDuRbw9X+WcVKkTHVrdf4xNRu92FjGzkxn8MnEF+8gqgXpPQWQNqTdWTPyc2KuHEuahPbQyqhx/5Xyqgh0n6V8Hiaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by SJ0PR03MB5389.namprd03.prod.outlook.com (2603:10b6:a03:285::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Fri, 8 May
 2026 07:52:42 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%6]) with mapi id 15.20.9891.008; Fri, 8 May 2026
 07:52:41 +0000
From: muhammad.nazim.amirul.nazle.asmade@altera.com
To: dinguyen@kernel.org,
	bp@alien8.de,
	tony.luck@intel.com
Cc: linux-edac@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drivers: altera_edac: Guard SDRAM irq2 retrieval for Arria10 only
Date: Fri,  8 May 2026 00:52:40 -0700
Message-ID: <20260508075240.23638-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
X-Mailer: git-send-email 2.43.7
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0066.namprd03.prod.outlook.com
 (2603:10b6:a03:331::11) To SJ0PR03MB6964.namprd03.prod.outlook.com
 (2603:10b6:a03:432::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6964:EE_|SJ0PR03MB5389:EE_
X-MS-Office365-Filtering-Correlation-Id: 82fa1c5a-4e64-43cb-bc25-08deacd6c80b
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|18002099003|56012099003|55112099003;
X-Microsoft-Antispam-Message-Info: 092a6eLPirnZ4SSWpcYmhaGFaR1rLL8fCEWc8fA7O4gYsQbgbC2Qb+h74JDncbaW+StR3p2fUdAq6PMhuIT1srfpPnbjgyVSmkqwwqv4aFAqNvv8H/5MZRzmvr7nGF+npimsdNVwR6pg/txMCKKaRmt1bMV774ZRTwavL4QqVf2ThPEQabL+NAqv9bkWrCy+teGRmWE9lWpInt7R9F5VV/HVoezjMngSbtIBd2zf3A6qS3k+VD2KDDvJsVuSIJvK+2brlwLUxRfgSbfeNVRH5pTW9YogZy3VxRa98uEPFTCBbL1CAW6fFpvFuutLxrMbACvOsIqo92x4Yw2i0HClSM/B+lKexH16pO4qnHXgu+wxBpx8H0af3pNNLtNdIA8s0jQymVUkJEfDgL67tAVNJuSTxpIDRVXo7omCKaQgGBLbIc28hNuuFLVxBHdgh4BxT+6+WkY8Y9S2EGgu06ZWTXDphdcfgEYLxibiLJmfuFYB5s0OU6DqwwBee9Y8TEzKPi3dlIXB26fSZ76chiJvlwDdRf+Gc3+C+KdRygwibs/M4fTjDZNzxSR84ZyFLA04Gx3idZmqfKcVqw93rJvOYEjB0Gq1Pl1X85AEXdMCMznrwi8NB8pZjA+ppUdR78lSgeq9GfTjJpsSZJnK69/ShHU3OP96xHDYwmtL08vRAt4Lkt9ibTTqSMNTkcW+oYs2
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6964.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(56012099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sjvGo5vj/ttjZYjRE7nzUkJMTdivQR+eD1XqACZyb7cci2X2DRVPRQO0rQF6?=
 =?us-ascii?Q?WyE8X0VV0fbHuQ+NtcBWsvZ/v4w6jjFU/4Ja4nmSWHcDFNGBUHuKM+wa5oPY?=
 =?us-ascii?Q?4GO4MrNExQ1kHdhrWyzVpAcJ9dWI/p8KO4fzcsWdpPA0Ocj5Rw2+v7/Ui8NT?=
 =?us-ascii?Q?vClxD4nVzHEM0AyhgTfl+FjQ1Noht0nwNgHdXZR/HrTy5VQ5fiMICHtM6Imh?=
 =?us-ascii?Q?9rPfRPUVMGmmjPQoD9kTmfpK2gR7Nn8mm8oOYPg+iTpTJhE0SQqXApf3fLds?=
 =?us-ascii?Q?aAqg0E9flpSh+/PdeIwBiKitPiuLkpzLtP31Naq/doOlTxil5/FcTmVr7TJ0?=
 =?us-ascii?Q?nYZCuOkJ7dZjG3YmTHnxOPwyt+NeBHpXSFkpbVzaC4Nzf013bbJiVf46oWt1?=
 =?us-ascii?Q?6HqiKQlDbRgr3GI4MZyknTMwXxtt7uv5wiVpRsLyVsjXQVJQwT3F0s9LRsIF?=
 =?us-ascii?Q?h3AHOseQZ7t/HUCFffprlyRXhW2qFWJ86DOgQVZev0GYuVTcs2HGn+mpQq5+?=
 =?us-ascii?Q?I3g6azWnhR8v4iQREMQ/3RJeN2x+GXJl62j2tpXhn4AzYov+SV/Iu+4QmjZR?=
 =?us-ascii?Q?6HxMHanlGlwXV2c/K0Ud00tZyuHKZJHw9Z9ZCSyCsqt9U8KtGlNArjjMzYoS?=
 =?us-ascii?Q?2t9zSZ419d+RGE8H54NLX4nKafjJG1P7HGei7AxBGAkKPknabaQ4b1kTJxIt?=
 =?us-ascii?Q?IafoXFaOxunsyI8O58pwds23br6jdttxRGD/B+6BRtBsInK5XvSFb+c2kpue?=
 =?us-ascii?Q?8n1TVkKrRkGoXZBRztZeigQHAieby4ALZ9PPTCi7x62A9dTsahwzCzPgaPtV?=
 =?us-ascii?Q?3KC/siYPDZCajpDNLVhSlZJacA1Xd1cpm3bUWOdAOvgiz6Bs+U3A/JNQDfYM?=
 =?us-ascii?Q?+TYtF8/ZSoii8ofZJlSw09AEggiIBE8h2PD6nRzn7A4QprHi7qs4lnvE5f+F?=
 =?us-ascii?Q?dueVHbShXPTjaRzCsi4MbpBUq1CyDuIaICeuFS/9JdVejUkIeDyxwJknYDqQ?=
 =?us-ascii?Q?NRgVZspY8LvhzriJ9FKREPn52MHZjV56qY/uNmTVpgWyP5dmnJ3pJSpMzVb7?=
 =?us-ascii?Q?PNh3Rsp7X4c0uG3afJ9Ajx6Zzd5O1Z2q4QcoIn0EvHja/OHB9E4FJO03iUGN?=
 =?us-ascii?Q?8g3uVAcOW/EDCdqrzlZhJL+0zeu0uxm4PeZ9zgVVoGBy1CSnthXqnhIqDI1x?=
 =?us-ascii?Q?zLo76fhclG2SQ5UdSJ8eAz9Czc1yp5IvGS7Qsf5jmNPhpJ8mMgRgFnymPGBK?=
 =?us-ascii?Q?+zFzkwGiGkHJd0Wxtf8CCvSf5vGPB5/0FekAgdKgeKTpjU43AgwZ2KzCCRS7?=
 =?us-ascii?Q?sc/eUGYKc0LnDgOKnoYEtT55Pdf3FOnpkoz5Xx3wcX+JbriM9x99ex12eFZq?=
 =?us-ascii?Q?9sYITjHQhqmk+h5XYZZvFx1HfXX/cPA11zYF0qs1R4KvLVMgsJBkny8ExZvP?=
 =?us-ascii?Q?bX0BlhU5+EYFRQU2kvVvmUBqL+E9MkmUilmKru9Obs/g3BQA8k3FoUBODExv?=
 =?us-ascii?Q?uH+O53/XveINQsRiOesNAn/5QT6TQoq8KZos2v9QZzmDoNjTyB+pEnor7CAb?=
 =?us-ascii?Q?6QFKmo792EbL+sv22gs+63nR/mquk7PDf3vRNMGAgmR0OJsoWmqTl3wa7Ypp?=
 =?us-ascii?Q?m6TdMnr+BtkX8QOuUrxIilWVAe1LqPC0r5IhCL3KHysRqoqweOn46XSPrn/S?=
 =?us-ascii?Q?1lDI76rJM3CqzErpc+7fUr8XE111y9rrP/lBD0uAAeu/TC9+tf1RARgOqPes?=
 =?us-ascii?Q?G7nwNAq9uXvbsI7cSYpPRXzEFCdhuYVHdnqwyN3u0ttBq5f+CLy6ghr+oIXF?=
X-MS-Exchange-AntiSpam-MessageData-1: 46adkQ/ibsz11g==
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82fa1c5a-4e64-43cb-bc25-08deacd6c80b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6964.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 07:52:41.8008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xPoKooSg6J3+VAR59cmQrGFXsFWyQ5SG2M/Knv7rZlMsr0S8cD/QJj9kLnjEjrpBDrAWPkWKeGxCi5Rcuc+eF6HgE//jq6xf3vJouqKndq36iCwm9kBBLQtHhF2Hap3p8g9On/96yEkG3dZyBSCQVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5389
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_005247_832251_03F52983 
X-CRM114-Status: GOOD (  10.44  )
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

From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>

Guard the irq2 retrieval with an of_machine_is_compatible() check so
that platform_get_irq(pdev, 1) is only called on Arria10 platforms.

Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
Signed-off-by: Niravkumar L Rabara <nirav.rabara@altera.com>
---
 drivers/edac/altera_edac.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
index 4edd2088c2db..b30302198cd4 100644
--- a/drivers/edac/altera_edac.c
+++ b/drivers/edac/altera_edac.c
@@ -348,7 +348,8 @@ static int altr_sdram_probe(struct platform_device *pdev)
 	}
 
 	/* Arria10 has a 2nd IRQ */
-	irq2 = platform_get_irq(pdev, 1);
+	if (of_machine_is_compatible("altr,socfpga-arria10"))
+		irq2 = platform_get_irq(pdev, 1);
 
 	layers[0].type = EDAC_MC_LAYER_CHIP_SELECT;
 	layers[0].size = 1;
-- 
2.43.7


