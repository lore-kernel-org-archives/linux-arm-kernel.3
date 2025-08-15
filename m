Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A01A2CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 13:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rrpBPcMUcSkcRf/5M+pkJv67KWJzUlOCWHvDXO7Xtmc=; b=Dq8fZCkxGxSAXT7DuwSE+YS3eK
	8MdKxsZeFnaAl/LEOXbR/zuRgMTvrNSwL5YwL9RFiraWx+MBidUpUuzjni15bf/MvKIqIHz9TwsBl
	dggfbRwnIrxpQIwAfkjwb7MZ8+3cHKtYsnSRJjrMz5Lp7lcy6xso3s7HRNzzz6ABDuqjO6NO9D/uq
	zstsoG1zwv6Tae54XwkHDuA2g/xNJv4XdyzIAT8qNPvA0UsdwqX1mybv87CEPiPqPUztEsMT205tI
	vrSAiTGcVjNEvCbKszp15KNPFn9yuxqmIJLgq98ap4d3R3LZQxHLvy93cUmMwH0qmf3pqb54628Vy
	BzCN07vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umumg-00000002cAn-1lpl;
	Fri, 15 Aug 2025 13:47:54 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umsQM-00000002JHO-0vgd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 11:16:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OfwsoMqtmP2EGYy4Ya8e74eZBKNsUcxl1tztlcs62u2WGDrhO1FX9F9ZOtmffWrtamRZlumWbOlMVfPZPT8bIv9R6nynVmNR6TcS4wDncxqY+RUNIkF1hlaoEqe5koaCekQUFFkNDlBRGR6Rf+KmVAF8mVoGFBAHbaL5OySVjP2jBK27tTkc5sWyPVo5DLOsbFj8mD0eRn0BxBa806Lt1dwA39rL6iSs+dtOvhz+mMduKwYIJ3cvgKDe1U6028JgQbSaUtZJw5XswGEnq0+enq4RFMNyIyqzyl2Xrz/i/vkaCTb6kd13N95gWgMrQ+zGd2eqPW9P/knEyqJ7QIZCOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rrpBPcMUcSkcRf/5M+pkJv67KWJzUlOCWHvDXO7Xtmc=;
 b=tysQJYLqdZZTdev1jIH3RZUERNW97TZoZtXMcW/oP0L1K70v/+HJynmmZ8hm81zhruDNlc6A37dTUVY0RlQikNnh9lQ4guv6KKt6Za5JADTZgiTvmRjW7Lw87cf5cM++mFJug9WBGqVNu48NxX7l5RnO19vWlxnnWupAL/NDGf43KwKKwH9w4PLuGyGCFp/dDK/RwMIo6F97f/YzA7lZQbmTV7jhWadaIg0IEdg6R4lHN3OKq153xAztOSUudiVQNskjngv5zBAO+awowDm6AcFc3fgPtHR8j2y5W+BpkcODGA+tGDooC68fUHHI+0qAEouEhnRlrO14XMuSuuD3mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rrpBPcMUcSkcRf/5M+pkJv67KWJzUlOCWHvDXO7Xtmc=;
 b=XN3riOcrap7nHWXrqd85UBqgWpT8wojgF/yzxec+w/9FUWrCkm62mtmh7OMzBx8ROLpRJTmeD0xF+7rqj1ZL7EzoT0139B9AX1YEbbRLRGlHp534W8hIUwMa9/sKRc2gfe0Ui+wIvMIhOmYiRAjMowv2k4z9dLphf7LcgdwdeJuM99HXfLYj0pFCFXM3+cA5PndlNb9x0bkzRtZnKWpY7swzHsnZQFuJwZoGXTjjKd7XqICKNM2DkcJUu/HFe+8f87X73wAU7zIoFewHvActlvWgLjmL5wEm2PfaR/xCjBi+NylE86sscALEMNwQ7o4CNZ7AorN3Vez2awh5F0ASiw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by DBBPR08MB6268.eurprd08.prod.outlook.com (2603:10a6:10:202::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Fri, 15 Aug
 2025 11:16:33 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%4]) with mapi id 15.20.8989.018; Fri, 15 Aug 2025
 11:16:33 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ray Liu <ray.liu@airoha.com>,
	Mark Brown <broonie@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v2 06/13] spi: airoha: fix reading/writing of flashes with more than one plane per lun
Date: Fri, 15 Aug 2025 14:16:12 +0300
Message-ID: <20250815111619.45001-7-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250815111619.45001-1-mikhail.kshevetskiy@iopsys.eu>
References: <20250815111619.45001-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P189CA0020.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::33)
 To GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|DBBPR08MB6268:EE_
X-MS-Office365-Filtering-Correlation-Id: 205263d1-f411-44eb-8786-08dddbed311b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FPco6a8+Nl/Xd5U4d/OI8IB7vTL+961kcB0P0Qk+7j4Vbbhgu8f5HP71G9sy?=
 =?us-ascii?Q?llGPLZn81IDXhClBKvcnJLTEkDXqOPeCONzu/ucYLgrqqC6h0DYUIYiyUB1x?=
 =?us-ascii?Q?ogci1hwex8KAgXMOW9/XBSvK3WSI4yke+eP2ddzs7/8gWDZBK3yP/fHWhRy0?=
 =?us-ascii?Q?ue+stQKldr96nb1DruZYsrx/JW1hG0Rvd8GiD5C4ie1SDuJh/nKUPq3JA/6j?=
 =?us-ascii?Q?0pWNtvBL4MX5isUUeEIImsVefwEAGetxTwbr0H95LVYm1Dad7na95OLeJCTt?=
 =?us-ascii?Q?SDeB7v9XFTNXAr/Qp44r9PsR2CTNO1DqcbuFlFKR454nq/fUs6vICVXRdhgI?=
 =?us-ascii?Q?reCjOwmbH0XsB+kRqcG+0vNSaBnO+lJzVwXsSY8uWNr0hN8rau3VJMpND0sD?=
 =?us-ascii?Q?5yzYZeVjkfdcCWxCywnvwryRFhVX3eu+mp/OptcMSWZ7HfmDgREKzsiuvvTp?=
 =?us-ascii?Q?rwaLFRfT3DQnEAaYgsaArBlq3bV5Fno8kyWFZ/E2iqt7mElB91gR5x9oOj/E?=
 =?us-ascii?Q?E60J9H6SIXukvjMkAcyGxmF9ecz2CvzzSePAp2o9Vxjwca7agy8V1N4Sq6b7?=
 =?us-ascii?Q?BpMKaLfaTUKes4vsHimo3+J7IXdWgF6SUhCMMwb5mj/V3t23a+tq11jFx0MX?=
 =?us-ascii?Q?F8j6C971+s+7bnBEWTHCnd+sHzuG/D1PgA4Hub/JM+9fz18k832C3XgvkSfo?=
 =?us-ascii?Q?+nDdlrhraqWJu1QIslhJpo3mANwfIgtSwR1h57lXxeizkN5JUpUJr+ZA/hGc?=
 =?us-ascii?Q?J1Gc0766T95P6JazQ0yYO0MR/5SqnSGXixRTBKROObemfyT36A7LDyiKl3t+?=
 =?us-ascii?Q?HrDxzqrHvJ0/N50SmojfwAn2nwj9bY6HQZTAHBhIOCvKKSPlqxLb6jFglvbs?=
 =?us-ascii?Q?ETmyK/T+Nyo2OkumI04+RNLGLNwkWmZddmgnl6g/lCrjW4yqEC7kVzH8uF3W?=
 =?us-ascii?Q?kYkENqqHSTBQh1FO3YwVKFL4MNCKxU7RKJvC82X9TPccb2Pd/EUlUI7BjhlM?=
 =?us-ascii?Q?7TmiacsHt7/nqfIvL5polzyDp1FKat1wBj40YeF3peAumqOxjntYU21ZHV8F?=
 =?us-ascii?Q?B++XRnnuhfu8WyC2pgMcYI8zwYiDS5prm9Xodq8S1+3sXKvywBx7JY7yrefs?=
 =?us-ascii?Q?CFrb99Z6Oj7s83I6mVAQQkQj7OitA9V/JBzK1w99JCUzthtWXOEYl9Ommk1q?=
 =?us-ascii?Q?AI7wCg4+tLY8JUnHnNQbUbef33GGIS6DDSvNh7tYYpmyJdPtwffOSB6TwGod?=
 =?us-ascii?Q?6KQDz29ZgJMG5Xo5pVciQ1vL0tkoJEISz7Wxj5cWP1xXAIaMLAuyfo2mtOYU?=
 =?us-ascii?Q?jNzepjEEAARo64VycmZrM5UP7LTMGXz4ew1EFxWI575mJcp+3fAFQV9MGR/9?=
 =?us-ascii?Q?b/Kluo2MzyL/a3P4xXdqYBO3NZKgpTLaPG5XDZbjzpElT7YdIAJdZL6rzQol?=
 =?us-ascii?Q?r4PPUw1NfrUc8DGO6KPt2gBt+vojQfRjN1n6OT38iNvVgyV6npUQlw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vjzX2DdMe/xCqeJMHy0Asz31TGXL/K28qfFTn4K9zKn0JhNroP3yAIb0O6c+?=
 =?us-ascii?Q?UH7xW+81TFphxd9HBkYq8p85n2UjO9P7Z+fLXkagDHNqHjrTVvQ8jYJh7kK9?=
 =?us-ascii?Q?gXKGkFAnRDAbmctsNMfy7411MqCJb9t1Gsy53mBTKFswzgtu0TZi2jhVQudp?=
 =?us-ascii?Q?0ap4ggP/OUw3+P1FKzvxHYvdKyfZ7fV6JFPkyc5FRH+xms5vm9HPxjiAwIF+?=
 =?us-ascii?Q?rzCgqiQcsUWxyYP3kSxxNbpiwpaXMfjPqLB/44WxpQYvUPTaIKrmCGpuV54p?=
 =?us-ascii?Q?MAplcQigOGcojXZIgWQTtgawUekCmYl6HoJi/vG5IDBHseh/rbIuZj2JoUx6?=
 =?us-ascii?Q?eCy2ETe8eoEC7HzdpR/DHoDZlzbd+M+lbctSrve1OZqmdPPICypK/23KTabX?=
 =?us-ascii?Q?iQBia6c/7aQdoCtZdXjWxBsIrIyRVlqchac1vs1Wt4rZlHOpckpMs2oHgkBf?=
 =?us-ascii?Q?1fzWEPIJDpKLPRJoiLvnhurcQSvJKM7nCedfPMGCypkxO6aXXiINlROojE2t?=
 =?us-ascii?Q?0W30LGbSVMglpTguNjxAuyZ0jdE83GWXtiHCXnJ4R7OP52iX8Lbr7xq61Bqj?=
 =?us-ascii?Q?FililQWZhB3PKK6Grd3XGHecoPIIsE/+FY1+JJh6eWxw0YGMixpgmbdKuAZl?=
 =?us-ascii?Q?Q+n7su14ZiXKfPzFOOvZWJGxlxhRKGO/oppRiCj2IqFqUvvKIN7WPQQV3U2v?=
 =?us-ascii?Q?+Ic6/KUCl4l96Fr9z4/schOa+q+er/2W5O0iiFut+XfCXwCmiR/T3XgFGDRD?=
 =?us-ascii?Q?752DlhmnFfVm2cpitHWzGQrHFyLy5uRR1nLi2D397eJlpjLUW6v9TEV4anW/?=
 =?us-ascii?Q?IuY5egWARYXSznvXcnVm/fdv2eRzvBD75lrrxjlif9PkoDAQM13WxE7+Xyb4?=
 =?us-ascii?Q?NwcRnWwEay794oxOPUJ1cHjSNsI0XdUaultZDd2N4yYl9f3282nD5hcjLGDA?=
 =?us-ascii?Q?U9Uj9Lyz3a30vc7Bk/Plzf+LcwPDnB6/rpkn7roW0jEOweG928rg3KYwgA5m?=
 =?us-ascii?Q?PZ+XhQujqTPL4g+G1D0srPhfGbNwBqDo1NARzizIJWi86Y9XSY8TqDQGjdox?=
 =?us-ascii?Q?Mlk6HVOEV4XcMSRSWkQ2N77jwv/bfwLTXRJmpAUk0UivZLoA2hDaJDNr8UTb?=
 =?us-ascii?Q?WnpDe6uzGHzpBKdoMrOHr9mjru8ZtFsv2fnbAsOFmVqRGZxFHzL1y1YwZIDT?=
 =?us-ascii?Q?Ixv6z6dEDxd0RJglQJP2QQH3ssJ/lPrbra4w9Z+4U1gWpakJ9jXBjrDesNHv?=
 =?us-ascii?Q?oEDVm2/nG/CAtYGzoUhOwoRm+maEjmNK1SkM+bpwxhoe325q5LuiVa15PPg6?=
 =?us-ascii?Q?MyR2Qy2/520/VC1UtxxZmS5/yXh0XPNrs5rDoTUzkghnt2lRLF9bQohStxbG?=
 =?us-ascii?Q?e6PP+JqhKMn2UN8kfH3RF2De1W5XDu5wo/sOIfezXsoaeSrKcTDkb/okkUc8?=
 =?us-ascii?Q?RHFTtsbNGaVDH7Eas5JT2XrGmNgQCueTa+lIQ3uj6BYOT0WpxQAZ0go1zolv?=
 =?us-ascii?Q?vS4Xz/Iem00hQLJz9Rowww6TIx757FksprSuD/nbk8KjpvsUlnnTcgemBWTY?=
 =?us-ascii?Q?GUu6uSndCH0Iqn8p9giX/tlV5Ob+smyhiXMqFaQaKwhqmoJxiB2MjxF2ZFYD?=
 =?us-ascii?Q?rw=3D=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 205263d1-f411-44eb-8786-08dddbed311b
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 11:16:33.5759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /308ERLv6N2/G0s1q795CUMRMO3249sfQ9JcLo1Olp8UCpSUQEpd+/kCNjyU5K/aE+EpMXDxofasY5zYyPSZSZi73ZKaJiqnII3kfhFP//U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6268
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_041642_263160_17D75DC8 
X-CRM114-Status: GOOD (  13.29  )
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

Reading UBI on the flash with more than one plane per lun will lead to
the following error:

ubi0: default fastmap WL pool size: 50
ubi0: attaching mtd2
ubi0 error: ubi_add_to_av: two LEBs with same sequence number 403
eraseblock attaching information dump:
        ec       1
        pnum     538
        lnum     0
        scrub    0
        sqnum    403
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    1
        lnum      0
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     403
        hdr_crc   c8418a31
Volume identifier header hexdump:
00000000: 55 42 49 21 01 01 00 00 00 00 00 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  UBI!............................
00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 93 00 00 00 00 00 00 00 00 00 00 00 00 c8 41 8a 31  .............................A.1
ubi0 error: ubi_attach_mtd_dev: failed to attach mtd2, error -22
UBI error: cannot attach mtd2
UBI error: cannot initialize UBI, error -22
UBI init error 22

looking to spi_mem_no_dirmap_read() code we'll see:

	static ssize_t spi_mem_no_dirmap_read(struct spi_mem_dirmap_desc *desc,
					      u64 offs, size_t len, void *buf)
	{
		struct spi_mem_op op = desc->info.op_tmpl;
		int ret;

// --- see here ---
		op.addr.val = desc->info.offset + offs;
//-----------------
		op.data.buf.in = buf;
		op.data.nbytes = len;
		ret = spi_mem_adjust_op_size(desc->mem, &op);
		if (ret)
		return ret;

		ret = spi_mem_exec_op(desc->mem, &op);
		if (ret)
			return ret;

		return op.data.nbytes;
	}

The similar happens for spi_mem_no_dirmap_write(). Thus spi read address should
take in the account the desc->info.offset.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/spi/spi-airoha-snfi.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-airoha-snfi.c b/drivers/spi/spi-airoha-snfi.c
index dbcd9d437077..75e593a6084a 100644
--- a/drivers/spi/spi-airoha-snfi.c
+++ b/drivers/spi/spi-airoha-snfi.c
@@ -721,8 +721,9 @@ static ssize_t airoha_snand_dirmap_read(struct spi_mem_dirmap_desc *desc,
 	if (err)
 		goto error_dma_unmap;
 
-	/* set read addr */
-	err = regmap_write(as_ctrl->regmap_nfi, REG_SPI_NFI_RD_CTL3, 0x0);
+	/* set read addr: zero page offset + descriptor read offset */
+	err = regmap_write(as_ctrl->regmap_nfi, REG_SPI_NFI_RD_CTL3,
+			   desc->info.offset);
 	if (err)
 		goto error_dma_unmap;
 
@@ -866,7 +867,9 @@ static ssize_t airoha_snand_dirmap_write(struct spi_mem_dirmap_desc *desc,
 	if (err)
 		goto error_dma_unmap;
 
-	err = regmap_write(as_ctrl->regmap_nfi, REG_SPI_NFI_PG_CTL2, 0x0);
+	/* set write addr: zero page offset + descriptor write offset */
+	err = regmap_write(as_ctrl->regmap_nfi, REG_SPI_NFI_PG_CTL2,
+			   desc->info.offset);
 	if (err)
 		goto error_dma_unmap;
 
-- 
2.50.1


