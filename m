Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB58DC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 12:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LADhb2PuqbDwuUerz0inEybQtfmOp4apa5x8P6KI71k=; b=cc43YnS2GvpQuPzWsr/JALGUal
	9nLw/jlDGKEAHPzbuNIcX1me9IU9ndYZ4/OlhGfvCLnYLi1XW3Uh5JWSEwIC8CnyZS/3+2vLBEJzx
	E5GWQlBprcgym5kXbgeTOREVaXuV0DlW489NSh0GIppIvak3AK7Xxj+w+aCJLUHPd559oQPgaUeqI
	jrwBqUH8Qf7Zbsf3zBd86GzBt4jwl1MImOouRQTRASEN/jJdeoCp++ntb4VCGsBEX67SsB4fL9Why
	JoqxPhJG5we7Ul6MzNGgI7rCTE3yxcieHoh7hRR+q5hIzJcq/yoJkeGhNMTU2vGkJgrQyEaSwNIgU
	ZXO3hoLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueBom-00000002Nqf-37SA;
	Tue, 22 Jul 2025 12:10:00 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueBlv-00000002NWR-0Aem
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 12:07:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jmkLqXEOLKqsH/j1H0pm4gFowAjhFW4A4GVnDTa+dtTZvgCbylyM3pW8m8+34kq3Dxre7yen5kBNnzvXN9b9BcaN/sMiIAsGEWG23DzBqyo/GhcYmmxFN72wAB8kYeZOzwZ4Ol6YtsuspHZi4q7BEbizZ8HKeRz+/9m+0vOTb/wufji2QXpMXE8gMVdtdsShKVap631zJmjLWToKxgirhnF8tW3OT/Sw+z/MKBkaWXY7TljOr4G0gUZ1JmFUJZ+A1jah07kfATJTrMul9cl/PjLUAynObno2r3xBvPjJ+uXkQbKoG1/pHB9nItiEeLz3M9fU5fMSEGnADq2LSqepFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LADhb2PuqbDwuUerz0inEybQtfmOp4apa5x8P6KI71k=;
 b=zDQwKcY9O4Wa+S2CCFCYaGhyWBKVat/ZLRtT/mGNaOQ9Pzz5VhhhtiVtVGGcph7lQVsw9ztrnFlA3viBEAAdabVMoI5TZ1SPcxHFk0xkx9COYADezmTiQcBvOgffWga9q+cPLwS4R65uW/94B3/1HO/8VjOS7Cn/kbue4h9pQ9ah5OLwYcHyRB+O2SrTxy/qfsGVpqozW4z3IT1zSiqjfOVGJ/jDSksl3mqFkXL45XcJYOoJVpaUe3e48etlgrYzDI6tNzsa32aG93pFG1pM6vG5KUUJEMJPTQEhGbUxjriDwuEvp6lIw5mJyrS9hFWo9reX/jPQLWg/8qV6e/VL6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYCP301CA0079.JPNP301.PROD.OUTLOOK.COM (2603:1096:405:7b::15)
 by KL1PR06MB6964.apcprd06.prod.outlook.com (2603:1096:820:121::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 12:06:52 +0000
Received: from TY2PEPF0000AB87.apcprd03.prod.outlook.com
 (2603:1096:405:7b:cafe::1c) by TYCP301CA0079.outlook.office365.com
 (2603:1096:405:7b::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Tue,
 22 Jul 2025 12:06:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB87.mail.protection.outlook.com (10.167.253.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.20 via Frontend Transport; Tue, 22 Jul 2025 12:06:51 +0000
Received: from [172.16.64.208] (unknown [172.16.64.208])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id B0E124115DE5;
	Tue, 22 Jul 2025 20:06:49 +0800 (CST)
Message-ID: <ed2b9167-2eb3-412e-9c1c-eba124560e3f@cixtech.com>
Date: Tue, 22 Jul 2025 20:06:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] mailbox: cix: Fix spelling mistake "overlow" ->
 "overflow"
To: Colin Ian King <colin.i.king@gmail.com>,
 Peter Chen <peter.chen@cixtech.com>, Fugang Duan <fugang.duan@cixtech.com>,
 CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250722100214.3792075-1-colin.i.king@gmail.com>
Content-Language: en-US
From: Hans Zhang <hans.zhang@cixtech.com>
In-Reply-To: <20250722100214.3792075-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB87:EE_|KL1PR06MB6964:EE_
X-MS-Office365-Filtering-Correlation-Id: e7844489-bd18-4af5-1037-08ddc9183e5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MXh3N2ppK1VtNTJudnZUeG9sVWNnTXFhSGJDRXNHWFdrZmFKanR2MkduS0Nq?=
 =?utf-8?B?bnpxT1E1OVl1QkhlcDFITTdZKzRPTUtiSlgyb1dJMjRBa0xndFpZSG1WakpU?=
 =?utf-8?B?enJ5aDE0d0FOV3I0aVJRYVJacWs1ZU0va2ZCbWFPY3lvU1ZvakdTMER4Tm9h?=
 =?utf-8?B?VklUMmNIaG0xL1plb20yWWU5SHBsRWVFdG1vMkh0WHlteVJpZUNrV28vM28w?=
 =?utf-8?B?a1RkRytTeW0wZ3YwbktiNG1UNC9tb2hUQ0tpVU9XSmJoZjV6bEhRNENXcWRk?=
 =?utf-8?B?RmZtQ3IyUHA2eTlUTnNFN1JDRC81R2QrbVdra21YUTExVGpBK3p4d3hTN2Rs?=
 =?utf-8?B?b21lNmZyVjA5U2tTb1ppSmwyNmpQVTV5VlRSQUpzY2RJL1RzY2NkUVhWUjhI?=
 =?utf-8?B?b3U0SXZtU1FkOEFZSHZWWS9rTEVGUHpGTURJb2s1WTRzQnYyWTJEUTVvQWNL?=
 =?utf-8?B?dXZNakx3TTQ2Y3JUQlhVMzgzNGQ4Ly9ncSs1VWcycWFRMVdIbVFuUXNHWU5G?=
 =?utf-8?B?TjVRYUpOMTEzejFVMnZLZlhXNFV5STExMVFaQmJEQlB1N1VTZEVEL0hPVGZT?=
 =?utf-8?B?V3VHSk05LzM4Z0ZTTWVCS1ZURC9zMDNwMHBUZTJuRkxDNGl0V28vbFUvRnpR?=
 =?utf-8?B?eGJiSU10NUdjbGRYVkI0R1JIamNqZVFHMmxBTFNZd0NUOVVlUVhXY2taQVVH?=
 =?utf-8?B?OTVnRnBHODMveWtiejRYSm1NcktmcS9hb2s3NVRtb1VXU3ovQTFLME1RWGVJ?=
 =?utf-8?B?ejFjclRJc1RCWk1nOHJYenJDSE9nRmtQQnltQlFYdElVKzQ0VTM1NEVZQkRh?=
 =?utf-8?B?SXB4b3RVMll6bkZxTUZsaXN3U0RldlBrWU1IMjFWU203UktuNHdGc0cyc0hv?=
 =?utf-8?B?NmRlbmpDUHVlS3Q3eWd2TUFOOGErclZxZmQ2bjRUdlhBZzZ3OHhOYzYwN0xi?=
 =?utf-8?B?d3NKeVRRRE93Ymc2VlJ4UkY1dENXaUw3d0U4QVk3VCs2bE8rcnFHMVdnaHRK?=
 =?utf-8?B?aE05TGdTV3JkNlY3UkxnSkI4d1d4RnV2WWVTOVVscVVGRDBPOWxVNzBMU1o4?=
 =?utf-8?B?bFRBdDFsZEZSVndwZXJKVVhhM1JZMnlaTGdpK2FoNDBYWlU1MnlEbEJXRXB6?=
 =?utf-8?B?T2tDM3ZTK3hiVUhVaUx3Tjh3RjFVYjZXc0J3Unhpb1F0UFp6dHRFSUNta2hm?=
 =?utf-8?B?WVVaWkFMNXc4Z3JTM3I0WDdSK2REQlBtY0h6Mk53MWdWSUFBRmRFK0t2WWUw?=
 =?utf-8?B?VVZxWVhKcU55N0EyeHY5UktMeG9iRE96N1JCTWJLNWRLWnpqOUxZTlZRK1R4?=
 =?utf-8?B?WTJSOEtaTVI2eDNJRjFUV2xsVU5kUGhFMEQ1RkkxS0NlcFFBUHVkNzhjTmZ4?=
 =?utf-8?B?RGd5TSs0dENyRFI4Z21KaFRadmxzaHFuTHRWNDFERjZyRUxwOVQySTlubytw?=
 =?utf-8?B?WUJYcG9nS1hlVjZmZDN4QXFoYlBTR1VNRlM4cXhzQkkrb1hna25KT1FyTGtp?=
 =?utf-8?B?Yy81MDB3dzhMcHlFcFd6WWJIZ2ZNN2NTa1YvTm5Ud0dncU51NlVvcWVMdTlm?=
 =?utf-8?B?L2NLaFMzczl0Z2hqay9TbFpqekhYcHhFSnVaUTJOVEpTQnoyL3J6YUF2dTg4?=
 =?utf-8?B?SklEcnduYjA3UnlJTUREQy83N09TMnFmeGJORmJiRU0vT2NGUnlHcUN4SDZK?=
 =?utf-8?B?V0JWOFpuMHRHcVRYMjB6VEdlQjVKUmM1Yk5WUFZLT0VCRWI3OXF4QTVVeHE3?=
 =?utf-8?B?QkxCZmtGTElNV1liYThUSStod2E0M3ZDY1pBdVZ6YXBpbWZaT2ZoaVF1R3hZ?=
 =?utf-8?B?b1lGZW93TnMzODNQRzYvSzQ1emo0dHJQT01jWXkraDVSYkNmaTQyMTdaQWlu?=
 =?utf-8?B?MVRsb2hTMDVwUUpLdzk3YW5qYUJTZUtWYXg0NGRycFFza2QrSkNvSXh3Zytm?=
 =?utf-8?B?RFFNVFdmUkxsOG9UTmZMYkxUQmt0NTJESnBpREJxYlJVbW5kZnZaSExlSkJC?=
 =?utf-8?B?eWpCa0xTODhlQVo2Q3piQnJIeUl3Ry9wdjYrM1phZEE4d2xVTmhMM04xaUpl?=
 =?utf-8?Q?kS96TY?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7053199007);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 12:06:51.0558
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7844489-bd18-4af5-1037-08ddc9183e5b
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB87.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6964
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_050703_088641_47BE42A6 
X-CRM114-Status: GOOD (  14.29  )
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



On 2025/7/22 18:02, Colin Ian King wrote:
> [Some people who received this message don't often get email from colin.i.king@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> EXTERNAL EMAIL
> 
> There is a spelling mistake in a dev_err message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>   drivers/mailbox/cix-mailbox.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mailbox/cix-mailbox.c b/drivers/mailbox/cix-mailbox.c
> index 5bb1416c26a5..443620e8ae37 100644
> --- a/drivers/mailbox/cix-mailbox.c
> +++ b/drivers/mailbox/cix-mailbox.c
> @@ -346,7 +346,7 @@ static void cix_mbox_isr_fifo(struct mbox_chan *chan)
>                  /* FIFO overflow is generated */
>                  if (int_status & CIX_FIFO_OFLOW_INT) {
>                          status = cix_mbox_read(priv, CIX_FIFO_STAS);
> -                       dev_err(priv->dev, "fifo overlow: int_stats %d\n", status);
> +                       dev_err(priv->dev, "fifo overflow: int_stats %d\n", status);
>                          cix_mbox_write(priv, CIX_FIFO_OFLOW_INT, CIX_INT_CLEAR);
>                  }
>          }
> --
> 2.50.0
> 

Reviewed-by: Hans Zhang <hans.zhang@cixtech.com>

Best regards,
Hans

