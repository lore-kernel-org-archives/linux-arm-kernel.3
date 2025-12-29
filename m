Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E10FE784BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 01:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6c6xu9/VcxRJsXIXxnKxk/9E/bMKKSAULHIB5SZ3qIg=; b=xecfcRsbGYHQEy4rV3FEdkJ/UH
	0Ry+yAOjlSiPmONymzjJYkjhysDYGwUoyCT+P5Y2GrNe5+4eSrkBj5pJImyW3j4rIdAUwjrZWWZnc
	Be9s62Zryh//RtzJHZ4WrsysQ3QtWfOp+jhsJsZXAV58ycNuwMS3MI+xOWOTxDhNdQER9cJsoFhNX
	xnUz72UjszXf07RxkvwDRLK1sgvI1endNZlEufbwiW5P7GxMfPhatpZhfFuiZES77mkKfqYa7rFuW
	/rcdzqKAOF9tzp0S5i5Pehvc8Zv8CMzGAEC/WibpjvHwCcwmHiNNTafDud2bYl4hDlXbKSRizl/Al
	Ody5kbtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va207-00000003Bfd-3qPp;
	Mon, 29 Dec 2025 01:24:47 +0000
Received: from mail-japaneastazon11023077.outbound.protection.outlook.com ([52.101.127.77] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va205-00000003BfC-2PPU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 01:24:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ttWC3mRMqdP2BHoFV37PFtfPD16U2hllS/Bjt940VNjAtDnpJ+WMjOVhChbKJWdYtQ4glO7EMoeXSEIYOF4XKcqRBxkm5h3vnORSiTKeOOSPj8l99HbslgmIxwQHqJue/aLsO7PK598uyvNpRvBo/XoYMInQIGS0KB0EouGnBrw34Ptb47eI++Wdx9FugUCuEf8ahXPE9Ukcru4Xxw+5zcNBVrqfZUiPeleu1wzMPZONStVlJIlwxWMafWAuwWT1s50OgXbId3ynMdUJgEUfnCq61Rq6ufFf/JZcI+gZ5aiSUYR3DZaIkBGf2Peqou1KNu4S6qYua52NwnmETWW3EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6c6xu9/VcxRJsXIXxnKxk/9E/bMKKSAULHIB5SZ3qIg=;
 b=mFGAO/Y+ZLHGMnO9C/C7ZnO8MXvwNn6lmRBaTYDw/t6EuSFU8mzo3BmjKq3oqAv5drLG5kOrmCHH9iy1e0kuzcB4LDl5n5dAENqc1nxw/hHzPWabblzEYAw/Kk7jRxf8U0Pi3BUpZzLcVXspaXklU33tQNlwB8CDx9imW5iAHLZnz0rFZcL163oVgtYJDssmvu+DY2wPzvyUGj7eoT97rTe+n25ZgZpO/PIi5MyxdyG6POSa3O+9/5zocS5mU/KDzGJTwV7dMmYEwk9dnhb9ag1BWpcYO4Vu8SZ8yASiqrOKxI6+VYwfMiy1ucnAZXna/rvE40fBJba4ZwYDQA6zTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYCP286CA0180.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:3c6::13)
 by KUZPR06MB7964.apcprd06.prod.outlook.com (2603:1096:d10:21::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Mon, 29 Dec
 2025 01:24:34 +0000
Received: from TY2PEPF0000AB86.apcprd03.prod.outlook.com
 (2603:1096:400:3c6:cafe::65) by TYCP286CA0180.outlook.office365.com
 (2603:1096:400:3c6::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.14 via Frontend Transport; Mon,
 29 Dec 2025 01:24:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB86.mail.protection.outlook.com (10.167.253.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Mon, 29 Dec 2025 01:24:33 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 4429040A5A1E;
	Mon, 29 Dec 2025 09:24:32 +0800 (CST)
Date: Mon, 29 Dec 2025 09:24:26 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: Lakshmi S <lakshmicar.2023@gmail.com>
Cc: fugang.duan@cixtech.com, jassisinghbrar@gmail.com,
	cix-kernel-upstream@cixtech.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	trivial@kernel.org
Subject: Re: [PATCH] mailbox: cix: fix typo in error message
Message-ID: <aVHYSvMpM-zcGSZH@nchen-desktop>
References: <20251223120622.4316-1-lakshmicar.2023@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223120622.4316-1-lakshmicar.2023@gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB86:EE_|KUZPR06MB7964:EE_
X-MS-Office365-Filtering-Correlation-Id: 5808521f-26e7-453a-8844-08de467905d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9j4yoy6/mPhT0RkBHvJVz78WlHLZilI3l0sADjjxKXUxvkzm49XK4oi+Vv8e?=
 =?us-ascii?Q?4YDoD8fQrhuZheu9so23OCrkH+u6VYI86FWa7uYphojUgl0KRXzDMhw8oeI5?=
 =?us-ascii?Q?7DFocB7aUWzZU8eeEpbHxSX2A+l5Y4iGtYWRstya0YFqCKsT4wAgJuaduJ5l?=
 =?us-ascii?Q?CiCg7auOiQxE1TUfJyMwcIMZLmKYHgJIhe563CSbDOmkACcdtJhQRxKI83Fg?=
 =?us-ascii?Q?S+U7KSz53UJWkkJA6zq1BMs8w7jM+cgl2ouqIlzz6FIO9Ydigjke+bFkgYap?=
 =?us-ascii?Q?kHCqMFFKd1CCu5GthBYkWoSi/X4TcxyStZxK6dJy/cj+KwwBxZHt2KCU2Zoj?=
 =?us-ascii?Q?bLLqDSyoTykgaoHZJiGcJVVaiX+7eftVvGZU+x0C0wl85VpOfIikbuou8CBG?=
 =?us-ascii?Q?4cg6ZlXTid9C01nOgHHiBqfHuii2hlBr0pp2L0tZ7PVDS8djy0JeaVRoj402?=
 =?us-ascii?Q?KEnOR6Nry2socFOJFzOh16PMMNFR/ezkcLZoOIzSAzec56ErSLYBOtF1zg9N?=
 =?us-ascii?Q?RjvELLj4Miu2BMf5WO6RIYKAzdOmTbU82OOHsSFPbZKViv08QynVGuDHemdH?=
 =?us-ascii?Q?JW6iVTCHTAs4aoq5LCeO8JvcMUR1mZ2cjug0MbtDfKgxv7p6NmhRQb3dOGVl?=
 =?us-ascii?Q?yoH4N9RYXQNpLg8LYsByylbC0/SYrbVsRBIfTxQC6DbLqHxFvGm2Jxyh+IvJ?=
 =?us-ascii?Q?tP+zExPcjWLaymH6wIHgCvFFx6by0WYcrhX8Zk30RUCEAuHwH0BbZYvAXGCG?=
 =?us-ascii?Q?JW6qt3cO+HcxjESy2vmf6GY0UzUuzcQKcOMLjqtEcXE3tBJ1v4wdF1uUYlXe?=
 =?us-ascii?Q?t9U1ByDxCQxEDGK4wsIYrOGW5pOQ88V6MWfp5DS8N4h9XfRSbfohqarsywyC?=
 =?us-ascii?Q?7/fkHlTjeDGxlUpFeZB9hFCCIrYWzG3H5guUqHjd7IGZKyEsuT7t9rp6T+am?=
 =?us-ascii?Q?bPUvAQNg1UXkEXCDkBL/4NcoeiKkDxv5T4mw0KGRrU9a9O46Cvs8VwZfAsVl?=
 =?us-ascii?Q?H1Btx46ZaM8UfhyQ7i8pgUmeONoKXfiyA07OMT/9Qiv7M7LvIJwou+yu8eNi?=
 =?us-ascii?Q?UJby2RTAMKQdBui+sOjQGkTzMYPNNJ329IkTmPvkvJOGdrPnI2wlks36tL43?=
 =?us-ascii?Q?ukEk0WHiH/rQySi91E5dTTpJ7CtJCPTW+3dtfT6bN0uEZo0ITlr2Jylt4iuo?=
 =?us-ascii?Q?c9iUHBWGjZDaORBwe4WFIWehkrtgP7FUqewHR6t3OeSQXcuOJzFZtPIZwnIF?=
 =?us-ascii?Q?i0zVy8INf3V/fcghZew2nrTxp1IcYn6FsZZxlCoa9pdxCA5TM8ztcTBWZ2EV?=
 =?us-ascii?Q?obBZBK9/Yqal4AspKxDfJV09jjvMDdccqULe/5pu618pTSZ/8mRH/hLbpztW?=
 =?us-ascii?Q?XbC2Bpx3bMvUwRpDE2b/KIl/vS08JAT3zMMFiCw7cvtsbNMMN2AAzHDLJ+6c?=
 =?us-ascii?Q?k6MQc4hOnt4dMgNHfu8fkfqDQMD9H5oVjzCybo2dypPOTUIxEL58ZNMxmdo6?=
 =?us-ascii?Q?eaRKFEmL1h2pPUX9vK4vRMXy2kN89yI4J7k0JbUK8HWKtI9zvGz0y+VpTvti?=
 =?us-ascii?Q?UasNdS2uH7p5XRTkGjY=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2025 01:24:33.2595
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5808521f-26e7-453a-8844-08de467905d7
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB86.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUZPR06MB7964
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_172445_617127_31691D0E 
X-CRM114-Status: GOOD (  14.17  )
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

On 25-12-23 17:36:22, Lakshmi S wrote:
> 
> Fix typo "overlow" -> "overflow" in FIFO overflow error message.
> 
> Signed-off-by: Lakshmi S <lakshmicar.2023@gmail.com>
> ---
>  drivers/mailbox/cix-mailbox.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mailbox/cix-mailbox.c b/drivers/mailbox/cix-mailbox.c
> index 5bb1416c26a5..443620e8ae37 100644
> --- a/drivers/mailbox/cix-mailbox.c
> +++ b/drivers/mailbox/cix-mailbox.c
> @@ -346,7 +346,7 @@ static void cix_mbox_isr_fifo(struct mbox_chan *chan)
>                 /* FIFO overflow is generated */
>                 if (int_status & CIX_FIFO_OFLOW_INT) {
>                         status = cix_mbox_read(priv, CIX_FIFO_STAS);
> -                       dev_err(priv->dev, "fifo overlow: int_stats %d\n", status);
> +                       dev_err(priv->dev, "fifo overflow: int_stats %d\n", status);

Reviewed-by: Peter Chen <peter.chen@cixtech.com>

-- 

Best regards,
Peter

