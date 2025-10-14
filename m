Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D15DDCCD183
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 02:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LoP0hjCP0BXRxcakIqO2PxjAL5KyyHdu+ONe2C6Zsy8=; b=BdMtfZtOqTwMqH4aUNreJ2B8OD
	DV+K9tA3gHjHXOf5z1rpdUKNfiEQpjNgYsyb8XBqe8n2i80+BAqgOEKFynyxtFZc6LY/G5hK7ycyR
	+MPV+YW7sBvRz+v+TQlaO7Cdy6kaeycwHFugEy+98nR5YlZLDW+n1MZXUNZRD83JBnLCrj1FvtyCU
	w1dmK8Sv0EZMFYvnke6sBqhxBetDVARw94W8rTlkADPAtPyn8GPu/QZ/2VVKyVgfDW29aSGh2vrJU
	8N08A0HQ+317pU2+XyvKwYQ13teLghF0GGwWM7claXTmyFiol/i8eo3C1YBfbyKwQfiFFUEAH8TBQ
	4M9H7wrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8UqU-0000000Ez2k-28VB;
	Tue, 14 Oct 2025 02:33:02 +0000
Received: from mail-westusazlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c001::2] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8UqR-0000000Ez2L-3cCe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 02:33:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NoJlPMJZ/BhljEs8Aq6t7wa1AbaSURKrhhcIAFxCWvCQSbBixpmT+3wT1C4GLIWKUuEfHXowJ/6Acp5sfgMUmgfOhUEJ9ykVO8mvscTDHNZ0p/dloYquSe0XYnZ604rBMaxy8QpNdljm4M58HknilADAS25DNc5s7GpNelnsmRI2cXpQyr/IsOBX+Nu7xbdi9GJ7QXC0dTdYzoqa1P7baMlZXwh0VBrGxEztOcaCL05mw87HevJh2O8ztpIpCoRKHNE3h5BVesuvf6w0M9SkwO8zp0B+wdHtr/lNfBkFdcPQGh8KMOyLfKQfxxW9yiUFga7veexmhOy+GNAxvl6VjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LoP0hjCP0BXRxcakIqO2PxjAL5KyyHdu+ONe2C6Zsy8=;
 b=yaBHNsP2tOnx2+uSZy6dNJsmD0G1NLXH+HBG0MbV43GYNS4DFvePPNwb3qeIWvYoP8glnGN2Fzq6U31aZsBPsZIIdbfgMPQgBh5yTqMz9BJbzwj3l57u/UIZrUdfgeRGfoq/ams3d0x3+OEGS3db9BFbUJFsQXG6xJBPcmLDTKeNYPW0onV7v3XlHpkYbopOfmBP20rU38+jqHSlW9RBYYJR1+lZvdJjYRl8sjCY//Up/0tsAHHcBKUhnurTBMfuvPqxX9RwpdSFb3WCCtlGDYWady6ojjrWbt/bjX9KcHYgAOKWCOfsZDrx2D29tg7mAcCOfYiYxIrnEUmGuWBwRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LoP0hjCP0BXRxcakIqO2PxjAL5KyyHdu+ONe2C6Zsy8=;
 b=CKUNDiNeA5fH4s1YaXGC+nSzSjVrBTv5uVsxttUuBO8z4eltM14XfG7uC1F20O3wEjSQgCBRA8+E3jgrcfK2u9kbyGpXfoaFl9k3UZV1Gn6YLj0KorvYsIGKcEeBR8dK/sAT9ObavS2K2LFL822yToCBCqC/HLy/SsA6z0vohKI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from PH0PR01MB7975.prod.exchangelabs.com (2603:10b6:510:26d::15) by
 IA4PR01MB9402.prod.exchangelabs.com (2603:10b6:208:55b::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.11; Tue, 14 Oct 2025 02:32:38 +0000
Received: from PH0PR01MB7975.prod.exchangelabs.com
 ([fe80::6926:a627:118e:8050]) by PH0PR01MB7975.prod.exchangelabs.com
 ([fe80::6926:a627:118e:8050%4]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 02:32:37 +0000
From: Huang Shijie <shijie@os.amperecomputing.com>
To: catalin.marinas@arm.com,
	will@kernel.org
Cc: patches@amperecomputing.com,
	cl@linux.com,
	Shubhang@os.amperecomputing.com,
	linux-arm-kernel@lists.infradead.org,
	krzysztof.kozlowski@linaro.org,
	geert+renesas@glider.be,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	peterz@infradead.org,
	Huang Shijie <shijie@os.amperecomputing.com>
Subject: [PATCH] arm64: defconfig: Remove the redundent SCHED_MC/SCHED_SMT
Date: Tue, 14 Oct 2025 10:31:58 +0800
Message-Id: <20251014023158.500932-1-shijie@os.amperecomputing.com>
X-Mailer: git-send-email 2.40.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: KL1PR02CA0030.apcprd02.prod.outlook.com
 (2603:1096:820:d::17) To PH0PR01MB7975.prod.exchangelabs.com
 (2603:10b6:510:26d::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR01MB7975:EE_|IA4PR01MB9402:EE_
X-MS-Office365-Filtering-Correlation-Id: 478644a9-fb71-40da-aabc-08de0ac9f068
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oIBrlpxQ36CA7fkF4BTSd5bVlELVDC6T1C42yYVhu+e0zEmGb+o5wtZGv4VP?=
 =?us-ascii?Q?TQvbW5CwXPUJSfpFWMr+R+/966vBMQI6H0imIzQZurMk1gpeVYyzZ4Bor+GQ?=
 =?us-ascii?Q?oUJ1FJQwEBKYCkYYoCDmpXRhUYIUPSCHFkZwhWt/1iQHoBYM1v0S0wUhc5QW?=
 =?us-ascii?Q?rbXdCEAuI7SRCWJlXAYmWsIN+K5kBT80lPdb/cCYzmn19mspJtyxMqGA5A1R?=
 =?us-ascii?Q?1YeLs8KRxNWOKeN5h92vTriHovgkhRWMdsB0yJrrLs+PzDKjNHJQpEWyMZtc?=
 =?us-ascii?Q?5OVX8AOSMSg7w1uliLlj1qBMC4K+8coMvcSsN4opNogcwBL2csziOmQAY90+?=
 =?us-ascii?Q?fdHyTOxsHPOyerElOJvQBa2KPqgIDFn2rHMQLYAjDqjYx8jAxKNBdhS7EvkB?=
 =?us-ascii?Q?w9LAAvUrm6Oco3W4df04pAM1j6PDtx3f3E8fjTfSzZf7ep2ImFHV6R2idnGZ?=
 =?us-ascii?Q?/m754fm9v2esWPvFptPvHLbxi7BdapxB+c1ghWpGCdeuUwaa0P3Ka5AWNGqC?=
 =?us-ascii?Q?OX4O3ynT0ujo63lFXkLIbyp98rFeUYIRITKx5BuPVxEbpcDbI1dlkDjnEyRK?=
 =?us-ascii?Q?WAuNH+r6WjS7T511gwKFkH7lEeLq0LvWJ3/gDWkOeeMl52AZJk1LeV3kutBS?=
 =?us-ascii?Q?riKyfrd3uzFaFj7WTdCzuu7vQYcLz/ouoXhgbTReQJKS6OuyQtgwfHfiJgs9?=
 =?us-ascii?Q?/bcXOvMJtkZtKZoyCLiqbXb94PmyrEkZAKIovhUI7pi/ZKssdcpAqhejxpw0?=
 =?us-ascii?Q?o7qT/mFxKsfA9vkPIAQThGnbIsj3CV88qnwlPtTQKV6ACA4713kp118SeelX?=
 =?us-ascii?Q?gmZRjkya4XGfrKFqZFUhqnDv7Ia4ul9QdGUt/PgAerORMu7s+052GO6OhgyT?=
 =?us-ascii?Q?67xSsdYEsFF+I8fWSlMQ6bXcFDzBOiK8kcgyliOD1vFCtOgKP8VGgQeXL8By?=
 =?us-ascii?Q?4Uo+SY+dSSgeAH7m6WaYVkAHN5HFA3a8iIxzUaSGkPRO9UEZIntaEm4w9/P1?=
 =?us-ascii?Q?AVtkvMH5D+LVoLf25mknzp0UvtswGuGO9o5hVOqf426jTX8F385evjcRIJY4?=
 =?us-ascii?Q?lh11KA9JyOrIOJSBJ0mWXgTA/Hde5XGOBDuGpydNDYLRSn5628TDudfoEuUM?=
 =?us-ascii?Q?McskQO275R7XnfsAvqBetVWvY9XZZIWc2Ud/U7duzgbMiq6uSRYreTxhfp3w?=
 =?us-ascii?Q?GzMzlTpeiDjEvWwcREkqfJDIPq9BHfpyXSNt7U45+DUboeXpwitzLairHV2A?=
 =?us-ascii?Q?OSBaqzC88mFeJN707W4oQa5kndMq9tBZzecIBLBlZ66/XJncbS/tVropf7sr?=
 =?us-ascii?Q?LwQELyrP+GIm9OVbL2zft+rMBAPgtLSWqPFzGEphvXGgNInmAa00JK8+PGcf?=
 =?us-ascii?Q?5wqrEocZbxxwjn4KRWlVo9x9qu5VTTjM35JgDvyuZKuP4LwfiJJCyaWVpzW1?=
 =?us-ascii?Q?0UxWqZCas7rgo2b6hUT4ofRVkUdM80X2hc8k4YohUd88A4OU7HL6Hymsl1bT?=
 =?us-ascii?Q?q2OPbP6C0PIvkIDGOkCqVBQdB4LIYsePrBke?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR01MB7975.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EwVfRtejwdKYKSSyEHyerfLKA3pesWFCt2HB+0FHQU8l5+4A+tmXvGibgmiF?=
 =?us-ascii?Q?RWlINFss6genP+LY7TmWfGMs6ygytla34Ii+esWnvU6w8azFViEVcaEb5A1U?=
 =?us-ascii?Q?frxRZ6Ag51lSWDzeHXu030MoHF0920OOMZXW5TYoLRlUCjHon0BaL7k4fbGe?=
 =?us-ascii?Q?d0wzDj51q9HP/2hp47ASjRoJRZ4ZmuS1PLszfLwHes50jsXQxnIk5JuQiZ8J?=
 =?us-ascii?Q?H5wbmO4/k2zIeuIGtAS825Lo5a6rhsdTXKH/MrIJt5jj7vITGzzLk0jzUq7X?=
 =?us-ascii?Q?YeiSXwFrSF/M+hIgYrwUsphJiiIIGrFJTp/UBqj9FSXEcPUon7Y3+aMqGV3Q?=
 =?us-ascii?Q?ff257at6z6F2sjQso5Lh3ztq+StsseOMQsjUc7UZzqIhgxxnjGTNqjOX38QW?=
 =?us-ascii?Q?1vkjcTmZOnA/MjJEst52MPY1hTYWINoXomPQ2I1P395sAju9eqstY+YWza8o?=
 =?us-ascii?Q?cwXCigE5HbSnaLJzqmnoZBaT5+5yeY4SIXbLe4BIhyFBJR1QdKW6ZrGF2g09?=
 =?us-ascii?Q?i3amtVZOFdjbmWke08mA2xwpgQ6U9JSLQP7vO1/R6btMA42qXpxzJ41tVi4p?=
 =?us-ascii?Q?AwQNIIZYgqe8sEy5RvTyBxQPs//jrb9GFcpP7kFJJig67r6/wM/Z5uy/l7j5?=
 =?us-ascii?Q?4r7uoXs9OK6uxcMPJXkc5vsinousuDW6hbU666FChHep4OUHMvWf63QPbaau?=
 =?us-ascii?Q?WGy3YZfbYMiJz6A4TkuxxCYf/qlzbX4KWppxC9kbYTHj02dcN5Fi42G9GSy/?=
 =?us-ascii?Q?5ljVMd3bl6woLRtjXSvPvS6Y96OSPlPA+voCTxhGkwd0GWI5c1XTURV6e+B1?=
 =?us-ascii?Q?v/oyEc8WiC8QCAwhb45f0U+RLrSiTqQTWlSzJaF5TYPqpqN7rSVofbq1T1rI?=
 =?us-ascii?Q?4DHadcb9hyrICvt/WEW0FHf2N+owMtnDcOuz8ru+zX3ahNKf/qcB6rRqb5tP?=
 =?us-ascii?Q?ZYv9FK1JzkGze+1hIcWhnX76Oktj12UNM7l17bf11YsX4fDMXQGW2aSOwQ7W?=
 =?us-ascii?Q?K9DZiI2FD1JbaPZY0ZzhmiNnvY175HXBZrT1zb1VVZXbNjOm1gFy0n1MTLjn?=
 =?us-ascii?Q?N/JxGs9rxEJJdQw0pvG1MGIXGKsRSE5gpPvULnKGg7UO+xb5POXC5SvHadIe?=
 =?us-ascii?Q?1g+LP5LJGiUdeGg/Fvj/20PahFDzZE0Lj0POt1FXIyOTQ0flvKQ61YL+YqmV?=
 =?us-ascii?Q?IS/hl7SDGMDaJjo0IdEn/rpNQ+0Ihx1PxOI6nTVy5LRErVtU60noDEtK2FSY?=
 =?us-ascii?Q?/hqzOwDadvf8yUKSpr0XZbFLWUPOr9MCIYuOxCN0KmDjdb1HWwrxIp4m5cKm?=
 =?us-ascii?Q?PKjdZK3A+hDD72jSgFtWE2YlKBSsliBxHdIAFvzzG1SNmgvkefMh8Rn2lsGD?=
 =?us-ascii?Q?dUgOWK/yYRCgrRRKFsBS7lN7uSQbWsE/4SD36a3AMN4J3X1sNYHiY5OF+Mvd?=
 =?us-ascii?Q?8J+neiJPb6JSt+mHfL/8xdEcqJV8Cu+9bJFS+Mc5fOpb4Tet2bqojMULRwWH?=
 =?us-ascii?Q?IURo6nJpjcc7EUEJjXr7/0QdvEIkiJVXWsp0z8+duSEFRk6AK+/ae64eWlsd?=
 =?us-ascii?Q?hYo+XLnTronEB7rb4BdbYWoFillyRg1NpRgpAS0sjC9B64GtvuaR8EIwwp7x?=
 =?us-ascii?Q?FnZtI44p02/3EIQDLsZ7OOg=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 478644a9-fb71-40da-aabc-08de0ac9f068
X-MS-Exchange-CrossTenant-AuthSource: PH0PR01MB7975.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 02:32:37.7306
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gbYCB6uEGn45g9R00nKn0aH8cw9KcsNJTgGQe3aDjgAsmf0qRyzpB119rjP/9zqWvpzvmPTYr6ZfNJJlmd797MBVHDKFfSgTVJ3NkaqS3EzbXLhn8o7Bh+eB7dzL/M2x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR01MB9402
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_193259_992541_4E825FEE 
X-CRM114-Status: UNSURE (   8.12  )
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

The patch "7bd291abe2d sched: Unify the SCHED_{SMT,CLUSTER,MC} Kconfig"
has enabled the SCHED_MC/SCHED_SMT by default for arm64.

So remove the redundent code in defconfig.

Signed-off-by: Huang Shijie <shijie@os.amperecomputing.com>
---
 arch/arm64/configs/defconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e3a2d37bd104..f089ec615b90 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -82,8 +82,6 @@ CONFIG_ARCH_VEXPRESS=y
 CONFIG_ARCH_VISCONTI=y
 CONFIG_ARCH_XGENE=y
 CONFIG_ARCH_ZYNQMP=y
-CONFIG_SCHED_MC=y
-CONFIG_SCHED_SMT=y
 CONFIG_NUMA=y
 CONFIG_XEN=y
 CONFIG_COMPAT=y
-- 
2.40.1


