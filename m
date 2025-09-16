Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB497CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 22:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JPlJSBTsZoqZTJ4A/kE7FkXsDdRC1XrKHkKhWnN7HCY=; b=msyX7t1tNyXtmKmUJNrqgpCxnf
	rHE9L0KSfB8wZtrGRM0PaSfYruONOcslF3i1jflNb5NCZh9CNoPkWFkq5OiIgTgiZ1UV+8NrrNSMx
	eGUmPuJlR4tGWrxDlZiiPRomza/5ptKG43Ac9gx5vJk342uEQDt2KpTUYAxl9AX/HT4XQP3g1kCa6
	FJOdUDgXJSfzS+MGu725TF2BySY4jY7C2RqR1mo8k7ksZm5kxwql5I/WIEifzHuGr4HTKzw6uRcOJ
	+lXPaALGzBJ0z8X0zrbPNzpT0qUYWJBKNYuWoNTAN48YJmEPzGoNteFRY00IuRn3vF1Mj0YU8hIzw
	LcPGOQXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyePw-00000009RM5-1uzf;
	Tue, 16 Sep 2025 22:44:56 +0000
Received: from mail-northcentralusazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c105::5] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyePt-00000009RKo-36kj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 22:44:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IRQoNT47Yq7jEg8ox56AyeYD56MvREkp6ytCSQkiXue7QnQYToBVlKuyK4r/XtADkeQcG9tnpvNZHTIJj7ZSxxJSy6yjSPIEexO637aS+tURrMCG1MKnQ3V0JyjvKBkghL+fk2osJJt/WOsL/sMRKS0jaZomCEy0QoCrDMztem22jHXhQuTzarcEaAjpGw5+Cwvwncp4dpB9GO+/sumKfDmS0MgMZI5IFCNKJtNrQ5GDQMhFYkFW4N46WyWVsWdbsE/Hl6wQFdJ6CHZ8p4R3OzLQOZFaeGBu9E/ej6I1kbY8r/VYl1xCLQdyl+z6d58cdzS47xopATBHgIyYuDkIPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JPlJSBTsZoqZTJ4A/kE7FkXsDdRC1XrKHkKhWnN7HCY=;
 b=fQKJZFH29Oik71Ui8YcvgI/tl7ZyrRxawN8+7dKO33qN8Wb52Uq/y2ruGIE1CDcUxkiPBUcozQm7HIo+W1/gpnt70VPx8NMMbMN8ygqSDk3jqCIZ7du0E0/0wgt3Zo7nnG7MqnIEzNrEL6aeeajZ71x5+7z6Nnj0lwkpn5KP97op9tc55qWQZirSzAk6A8tCX/mC5ruscsRFNsHrSNgZ46aOX6DvXijxEmP734zfTwJ6d7SIJrKHyPNSrRl7trzAE87H470KdUA+v1ZiCJBwv9SBLzXOLOOdvTFRAeQudfDAr0QhtZkslwq+YAViGNYizg8JJ/dbEG5ta9acBgkqMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JPlJSBTsZoqZTJ4A/kE7FkXsDdRC1XrKHkKhWnN7HCY=;
 b=rq90x2VEWVBN3z4GICR2rPJeUiCLRuajcs8dObIdiZ74N8drRi8ta+Dq717Pb6wVVhwW45mREy+kkX7VQvn0wYH7A6G23OrfCSPiIrbT/zelpu98WEst2C5BO3r7jwBxzNRpNOWw8S7Zp9lTgXTqY6KsMRQeywVUmtWda9BfqbM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from BN0PR01MB6862.prod.exchangelabs.com (2603:10b6:408:161::11) by
 BN0PR01MB7117.prod.exchangelabs.com (2603:10b6:408:150::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.22; Tue, 16 Sep 2025 22:44:44 +0000
Received: from BN0PR01MB6862.prod.exchangelabs.com
 ([fe80::8a1e:34a8:2ad9:7f83]) by BN0PR01MB6862.prod.exchangelabs.com
 ([fe80::8a1e:34a8:2ad9:7f83%2]) with mapi id 15.20.9115.018; Tue, 16 Sep 2025
 22:44:44 +0000
From: Carl Worth <carl@os.amperecomputing.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Jie Gan <quic_jiegan@quicinc.com>
Cc: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] coresight: Fix data argument to coresight_enable_helpers
Date: Tue, 16 Sep 2025 15:44:41 -0700
Message-Id: <20250916224441.3008824-1-carl@os.amperecomputing.com>
X-Mailer: git-send-email 2.39.5
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0384.namprd04.prod.outlook.com
 (2603:10b6:303:81::29) To BN0PR01MB6862.prod.exchangelabs.com
 (2603:10b6:408:161::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR01MB6862:EE_|BN0PR01MB7117:EE_
X-MS-Office365-Filtering-Correlation-Id: 885c2d8a-8612-40b9-5aa7-08ddf572a17b
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GTvkA4h/fNiq7sda2oqvTjvD1CkNxhnlo6NZvJJnN3aN+VIhqQXFAMHrx0a6?=
 =?us-ascii?Q?EFrOhh8xneJx3LNgQBxPpH4xbXSMKK+1qtDHdD+teCel6wbJx23hNVos+zj/?=
 =?us-ascii?Q?f7nQI1IiK//8BDHPmBmwx+S/t1Xix0L0pKhi75VhAneERSz1Mphv+fuVprhA?=
 =?us-ascii?Q?0qf9VqGDN53KURko3vWtLKJWgK4eLytna3KmHYGVgOFNi/4YAZ3jBUWXAewq?=
 =?us-ascii?Q?MGSV0xUhA1KDKkUki8cWnhMLlsBPeJU9MVc5FM4qp4d6JBNWmYvoC8nC0UCg?=
 =?us-ascii?Q?hux50U2fzzsVF+43BU9wh9O9MzlB0MNPSc8JYjfVQMfNtXl3VSymw3Q8Hu7P?=
 =?us-ascii?Q?eXdgVSnzcrFa5dzfiELzTru3rqsV0eiIaydTk2BZdD4w+kmj4n7QWG5gKvSB?=
 =?us-ascii?Q?ox3EgUGr8XcXmuUYjp4uIcZg81uzdT1FGYopHpflGMHhr3T1xRzWrWAFy3EB?=
 =?us-ascii?Q?1eiYMf5jJcL3PrlcLbWGqGgSoRU41/rgV7BSpHjND8L5Kw4JLtgY/4E4f/w3?=
 =?us-ascii?Q?Jhn30nkM3Wgojq5FRjAST/gfbfKZ7ckN9icIgKj5Moe2LxXqS8wsb0U1bH0g?=
 =?us-ascii?Q?+1Wv34XN/AsRqO82AIIMomOX7kcUy3orewoHdhG6LXO7uW8Hab08nOdSsCZW?=
 =?us-ascii?Q?iwtgGDJx7QnW9wcwsour4KuWwQ2GHRa/JvEMA2NJIZQBVNHK4MahbPwbq/dJ?=
 =?us-ascii?Q?flJ9SY/J3/imirkTOyQ/dqFbJiNSwFSLV1zixhLck37HKDdC5oOWd6tR/2/o?=
 =?us-ascii?Q?PcvHHTsJLpdaXuMPe/9SFpKqNMDvx5WxkpJDH35H6TQNEBzBckT7P+1eZq+h?=
 =?us-ascii?Q?REKUYgGXDUOx7iKtCuP9DnfpRBURimbRCxdusDCPkUt1V4qRatM5Zri0vs5G?=
 =?us-ascii?Q?TOyClS8qT9dZqww5Tedb8Y+v1ciUyejY39lNR7SlCbyp+1ZHvv7l+TgBHA0q?=
 =?us-ascii?Q?TkId87BhwRbLeyv73kIc9Z3YL2fqychy94FiJlESqKfejui0D4eOOEWp9HxL?=
 =?us-ascii?Q?U+NX5y5BOwcpbcTqL4/KkLkEB5VL6iAcDOAcVSKvsbC+Jpf/+V/ZbcPmoBF4?=
 =?us-ascii?Q?gY14fbKOQo4pi3JIfL778W48nbiGzjJvYM0am8UUndPLaoa7rsMaHr+W0tfb?=
 =?us-ascii?Q?sggnBEFXq6T39CWpTfvYrq38TnzyTKetGffbsPcxSaYs9EpTc7u1Ze4hikjt?=
 =?us-ascii?Q?Iucz40fN8wq33lyvKSyKhYacVMqOu3L60b0N6tT6lP41mzVQ34+zXbN8GdpT?=
 =?us-ascii?Q?v9NNvcVIVYfgHrpCXFOzL5YsC7ix5bgg9KESSFnA0GORGLMZTaC7duLOd5bZ?=
 =?us-ascii?Q?TJ7qQ1WnW0f2Q+oKS52xTJbZL2R/kFaZXRQYFnE50LDXwOG22Akk4PSvMJCS?=
 =?us-ascii?Q?Jk5GCsqw5y6tva+NfexWyNUJRi0/jhEBcQt/cyd8zVbiDD6aOQzOGF/E9ArV?=
 =?us-ascii?Q?BS9Wkd7Gs0K5/6c74L26Zlt2ICrC6xk0yU4nkj0eNwpRqwTLI0GoiA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR01MB6862.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pzMmAZOQI0kFFnHunCf8x5xFFvNRc0nAisyX/7dogcsLOTK1vH2RySEKnTkz?=
 =?us-ascii?Q?KnyE2/ImBt5w5xcG5ELk8JJlKJJ4JroQ6A6fRsSg/vyhiBA7s99IpWYfl32k?=
 =?us-ascii?Q?CWF1i1Slnwo1UWyyREMQ+65D5q2s7HjcWq1ywNCosbeH/v4DuxHgGyEgK7+e?=
 =?us-ascii?Q?GXI5fD+6ouRRIra8YhsZwVz6SJjUN49GM3HdMI1qKm/9g/rNY4NkzpwsGQP1?=
 =?us-ascii?Q?iuX3RwBhsGJrYrIVLh7Pcmtmh/Nd+utVNj1lxxZYk/308mVVjBpML6dy6VZO?=
 =?us-ascii?Q?R6Y3NJc9TPbLzcCXL5EqP0vr2n0mKEoCiz9YD0iGvlIanhSsV+nDhynjEFM7?=
 =?us-ascii?Q?cdIcM9sC42c10Qc9nrt4SQwJ1Y5jjmj25AHfwaDlnkXhV6NDgupr86xRARml?=
 =?us-ascii?Q?djHt/+NHikupEZd20MBQOCiRDa7zy2zRdcQvvHLaiuWsSUOErHqyWtG7kWgr?=
 =?us-ascii?Q?j4BOUEhAgeCPT5ceiorJgRp9QjArrhnZ55EYiKHRz4X9Nl9sOMlZA0S6+yJN?=
 =?us-ascii?Q?g2zPhH+Wj58lEqbG6klyPsueWEEDrMykqZwsi6qrTposiKXliNTZNNqTdd1H?=
 =?us-ascii?Q?7xuS0ROukJIVv4ZMokud7ia8jAhBHfPgzmQClDTctUR3VEqqDPuVHE3z6dbQ?=
 =?us-ascii?Q?uv7VBZFilZoxAEGnks8I3QJ7CPUixh5Rca5f/V1v+TAPk5gDNOdutE1Xhhhy?=
 =?us-ascii?Q?hoQ9+YPclZ7zf9ieAWksASfki979al/fFvsxyf0KzzjwiZB6r6U9bvjlUyLQ?=
 =?us-ascii?Q?3uq6woPDbwyI6IRGkrz8OWe9YHIwhkSefTtA5YLyjoQMBOQwWEFN8g5RJszs?=
 =?us-ascii?Q?1wJBh4txj1hx2tdEYwCmC8ej9CkEaIhPK5BJxbJ1yAutOdPUAN/nwzQajJ5o?=
 =?us-ascii?Q?ZyDfwA8UoxwUulACj7chSuMdauMvlCH4We1iCtRQCZ7pdTmL2bHEMw/C6CaF?=
 =?us-ascii?Q?KjpsPkHH/uT6OOi1Mf2SoYpu9+G6fcEVZx3dAa8zJ7p269bol1MLS8+Cnwjn?=
 =?us-ascii?Q?nPDAfhlRuKsTroZsWFH2+yGKjAsQ3SZCgloCy4MGD0VwOCvH0oyn2VpJH2qB?=
 =?us-ascii?Q?Ts9hpgKajKrmkEilKW33xDg7nuRKW4pJyA7NEU1nvyhlw68krHuuIjbvffDm?=
 =?us-ascii?Q?WARypPjz1yKNfF+8HOAJ+1eyen66cQKeJLkxruqTDlcaVByWdwv5cRmUEUQa?=
 =?us-ascii?Q?tNmSm4xCubI2l9dhRrGCJXlvMyjqhXefqE8y1AgST+OSdH8he2HMi3jTptV+?=
 =?us-ascii?Q?V/bFmKxonfhXi0RPRmBXbqrABcqv1tJI6Uy7zR55Tmt2qj/bqZt8PMOMyEaT?=
 =?us-ascii?Q?D7dhiYFEN/MzBY76Xr6CR4f1/ryz9oMRB9CoCQmrXR569jQv32yr8RdqIxES?=
 =?us-ascii?Q?z1r4mGsUSsMRBkp7vtfnb6ACpjy5SucbJGSx3Mz7fl5opxv0HVZJMgEMhfOK?=
 =?us-ascii?Q?XnjfWvzjJFIn9bK9f6p891MTE1Zhdxt4UqP6DxfcMqIbnpfmYPWluqbEzsRI?=
 =?us-ascii?Q?QqKIdN8U76djwa2xawk79cjmR0wYjkrWVfv+IyQeiD3bqfH2Hf2kK6w1pg5c?=
 =?us-ascii?Q?5bq8CmcqR6gXabGvUlG8WzCHJg/jefIKfJCdEjigWhJgTRi827IeXpGmricC?=
 =?us-ascii?Q?/JO+12neQS0eD1JQhLkQcoI=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 885c2d8a-8612-40b9-5aa7-08ddf572a17b
X-MS-Exchange-CrossTenant-AuthSource: BN0PR01MB6862.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 22:44:44.4725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o+PSh5OBKi4PrY7a/DIJ6oDB4JZF6Co7pE2eWtRqFGR7HUjtc2FpBxJeH70kYfnn3Ukt0wZd/9Pvk3lw1Nru9EyurgXi/4ze0oBReJ8ydyU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR01MB7117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_154453_794572_4D95842F 
X-CRM114-Status: GOOD (  13.17  )
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

In the commit being fixed, coresight_enable_path() was changed to call
coresight_enable_helpers() with a final argument of 'path' rather than
'sink_data'. This was invalid, resulting in derefencing a pointer to
a 'struct coresight_path' as if it were a 'struct perf_output_handle'.

The compiler could not flag the error since there are several layers
of function calls treating the pointer as void*.

Fix to correctly pass the sink_data pointer as the final argument to
coresight_enable_helpers(), exactly as it was before the buggy commit.

Bug can be reproduced with:

$ perf record -e cs_etm//k -C 0-9 dd if=/dev/zero of=/dev/null

Showing an oops as follows:

[   88.696535] Unable to handle kernel paging request at virtual address 000f6e84934ed19e
...
[   88.911293] Call trace:
[   88.913728]  tmc_etr_get_buffer+0x30/0x80 [coresight_tmc] (P)
[   88.919463]  catu_enable_hw+0xbc/0x3d0 [coresight_catu]
[   88.924677]  catu_enable+0x70/0xe0 [coresight_catu]
[   88.929542]  coresight_enable_path+0xb0/0x258 [coresight]

Fixes: 080ee83cc361 ("Coresight: Change functions to accept the coresight_path")
Signed-off-by: Carl Worth <carl@os.amperecomputing.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index fa758cc21827..b1077d73c988 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -510,7 +510,7 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
 		type = csdev->type;
 
 		/* Enable all helpers adjacent to the path first */
-		ret = coresight_enable_helpers(csdev, mode, path);
+		ret = coresight_enable_helpers(csdev, mode, sink_data);
 		if (ret)
 			goto err_disable_path;
 		/*
-- 
2.39.5


