Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F1B2CF256C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 04:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TL6d8fasaM9LGCNk00TKi+73cJvKqz51jin8FUDtYy0=; b=MMAiVjdoa9zVgMzsFh+N9O+Hko
	xP3mDBaFc1NN8gv3obxUeQJ5lNk3sMCN4ntK9+ZxJpnd2M/JOsuGXe0t9T6Y2/g7JtwvgcC1SnCR8
	L12v/qrgulZ3HuuinbVrOprJJG/TnxPkf+cRuNBLsFa3dZnmsQseygPk2Zp0sBNTBzq9u1zqhjWvi
	XT27YlrObNlRfz9EPplD3XX1fNyusF/O6ue2XnTF7+xp+5ufQxdaWpq45jODw0PUVH62wIjMCzZqV
	mZpkHLH5eutHaFh69+mINPjwZNYEgi9aTdoJSd32G6FyKeVkAch5lMVxGwlTHQVwq870V+h501pDk
	Bm8kVHjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLZfr-00000001fdC-1evC;
	Wed, 19 Nov 2025 04:20:07 +0000
Received: from mail-westusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c000::1] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLZfo-00000001fck-3h4A
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 04:20:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lMbhfUpxzolohlXCyvxAspyulYi28a7aoSqKMPfGpxsILmJgEDf36NiEJAWaQaMCkEVdyV8VdEEXV1mE+NcMQfGZ0vMs5BZwroY1Jq2uw99AwUF6Q9ymrr97/O8x2/+BGw0KdGVRzeJLa4IjYkmOW2qgfrp224v19cjCFuzjtJm33HQjbO2OxAk5u0WeSCt4Kp4mPZi0j4lKmkEza5DlTjiEbAgE6ARrm2PP6vNzKuQgU2eF2I37yeRR4p5K34yZZ1C+7ax6rK4YyqbkB1d/qmx42XhXYEi8LQDSNq5sO9HQGhevdvS+nsGan82lR3/lkwPDrDjwkLB4Yw4Xq96APQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TL6d8fasaM9LGCNk00TKi+73cJvKqz51jin8FUDtYy0=;
 b=OTOQEGK81SQv1glzQ0s6H7S2kXDGHA2O3JDfzasf02PqbHnrrxN+pXbfZWqNxNftI1lz2zBqIkpySzME/TFB7RX/6uhRp0lj1G/w6LgmsK+KiLgkZPqJT0bbpuSh+VZI/XLaso+Y1vKTqonuSLxm3PmZtNZgRfKncgoSGnKhw/8N3v4qSIhU6F3vFecVJ3KueBKEWMqay+At1jqe1WOwPvfH9ulExlJrdC+vvmLVDNvOb3pSviz6dtYL4GvZap5wdIsvOxUuCXLoPrvkAI16RoQTzZzVHSNp7P5M4f0v/UeTjIJpm+x4Sufa459nCkQNDXFgVPbpvo/j46iTtcpGrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TL6d8fasaM9LGCNk00TKi+73cJvKqz51jin8FUDtYy0=;
 b=F+gB18ziruKS3PUH9fF+1kbGFaUMqS2di8OHFwcrdFm55fIysP4lLJ5nmckxkh+GQGrvXOWiVEzYrXfcLWnSN16zNMQdWSdm6HHeYbeyMrLWQ61RJ/aFChYG2Ubv6H3DibyudNqcevJpzfy1Yae78GyzMaPNF9dVNNJY7haK5+I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 DS7PR01MB7568.prod.exchangelabs.com (2603:10b6:8:73::5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.10; Wed, 19 Nov 2025 04:19:59 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%3]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 04:19:59 +0000
From: Yang Shi <yang@os.amperecomputing.com>
To: ryan.roberts@arm.com,
	dev.jain@arm.com,
	cl@gentwo.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	nathan@kernel.org
Cc: yang@os.amperecomputing.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: pageattr: use untagged address to calclulate page index
Date: Tue, 18 Nov 2025 20:19:45 -0800
Message-ID: <20251119041945.1991527-1-yang@os.amperecomputing.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CYZPR20CA0005.namprd20.prod.outlook.com
 (2603:10b6:930:a2::12) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|DS7PR01MB7568:EE_
X-MS-Office365-Filtering-Correlation-Id: 23c6895d-27aa-49e7-9cf1-08de2722e6e2
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PLrPCDQSWnCBH693q6OvBbwcuaUeow18BavhIXvhoxRKle/pgzbDTyRPbHiF?=
 =?us-ascii?Q?tg2kt6c2GbnrDEVyFtx/QV2T8HZojY++kSkFVBdDf0jK2mscguCguH7bVCKg?=
 =?us-ascii?Q?P1AtwDTNlkrR2ZE5tqipsIHUzW836J+gKI20OXxhA1DXZYJQwUxR1nYeCyvq?=
 =?us-ascii?Q?IaY++6MvY7hmeGIex6T4caqgxN8an0IHhGmQg6Q0/bV3/qou6+SvPhzWBdw9?=
 =?us-ascii?Q?5EVURp+orhdvr2XnCEdEn2gqwaoOuy6a06nZAIGI4Qih05qhb1mvSZYj+WfU?=
 =?us-ascii?Q?38LFi3yL1Bnff1uG7T0gk9deTgcXPoqSLi9xjds6beHTtxwBXvFKabMZ1Fpu?=
 =?us-ascii?Q?aUf8W46Tdram7fjgs4Xxl9kd7ST+SM8GPgrEioW/dN8/+f9yXdKLCMCmkzmE?=
 =?us-ascii?Q?nwbiyfELIHzGuOe9YEmsDpflscZvkzJ/n4jZgvPKqT3fxCVQsICgCFLLOkd5?=
 =?us-ascii?Q?EmcpnbkkzMOwbpb/IKhrjc19zJ3VjXB9CDU3zbFV8XGPvNt3I3idcmILr/21?=
 =?us-ascii?Q?9QcxD4DAgaVEN4me50Nk+9RHZ9sK4nhBLmspu2bxvNACPGkuD9ly7A9rvEd7?=
 =?us-ascii?Q?RNOmKw9jgquQ7tyE9eqcfxYTns2d90R/1ba7Hud4I1wQPemmZPrIaPvcE79n?=
 =?us-ascii?Q?LEbAyuttE/OG7hf6U2GMUuyE1N6KKqTTRexYS0MgqDQq/i+lXBlmSn7yROr4?=
 =?us-ascii?Q?BwtjSPneGlI5D9s1lX2u7tmLtX1wdDRI0orhjqFcxdfSGDhZ4PCqTO+Js+Va?=
 =?us-ascii?Q?0FGrOlLiFxcLqCKrz3hfOrbFTG2+v2ac4bmzrVQIqLyJtn5k9iKlXpRYjAYK?=
 =?us-ascii?Q?WaGCukYEdlCpHBU+FOTu58bf8jn7vkqrMMT8wnOeozdIRWF8GhymkkT5+SAV?=
 =?us-ascii?Q?2h4BGSm2cLxNedpjx6XF8gAtrUlxcCD3k4+TgQhkPzYF8rKFdcXAh4/4C5dD?=
 =?us-ascii?Q?7s223UOPNHpoM8+GQtOEoWJSe/Zpucw//0NFvbE8/MTAMHZHBQhKHQEnv19s?=
 =?us-ascii?Q?xZhliZoozG1CnSqYyxtiA8X5AeOM8aAu/iV0M8YbfOiHISsyfVqcvybDlQ9r?=
 =?us-ascii?Q?XR6hdvUkAi++HdRHS4oD7HbbYzWLMn70ko3lkR7+9VTIpFIcJ8rbNP66Gt2r?=
 =?us-ascii?Q?8AXLO2pnDqNsBB94ExVtcBhVYIf5XPsWo7r+97md8KEiIZfAYei3ailR1cim?=
 =?us-ascii?Q?JdfWsvp80fsW4EUUqI4Y0I9PpyMA78g24VXFLFnYsGuxz4375QGFj3hjk9LQ?=
 =?us-ascii?Q?Ao3jirDMrGreYu+MSKpOD40Ry7Y88rmuG4U4VAj6WA3HZ5wbdrgobbP+AiUW?=
 =?us-ascii?Q?ghC74Hd1/PHi4j8FzG4abRAXf8T3WjJGv1pIQ/xJpVZ50KTpvpHpfWVXWN7P?=
 =?us-ascii?Q?h9wC/qB1mN4JjoiKX+7nJJ6f4VSFMtiJ1KVrhh2X/GqSK+XntUsgs0CkGwVo?=
 =?us-ascii?Q?HqD/x6j45D8oBHAWRUSGDMMFdW38JUOY/YxruvdaxAjOnjh8tzXyQmnL6FE0?=
 =?us-ascii?Q?v5XhnmoCI4qv3G+MeFhdAm7tAHxa9XqLiCS/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3jg3U73r0kX7SJjM50vOi/F/grFJqf1qDGTIvsVxsg9uf/iBicv0xLkhqqQT?=
 =?us-ascii?Q?txMvgzXnnu/LFGpqr7rQYVkOUKxv/zVRdjrdfp2obgEwkxLfWkl+X/C64CcU?=
 =?us-ascii?Q?mz1OA01KXiwNF5n0dfUSIS+gE0Ide9T2ga7viExeZHcwfGfY9owjvs6aqwME?=
 =?us-ascii?Q?1zdyTwo/DiIp1EE3CXg2Tw6raQjcyjg3HQg4eF4m+OVFgv4h/kfsW4iq+JQQ?=
 =?us-ascii?Q?+IDToO1S2n3c4z2pPmBYJunl9W3TXLwVGLrRB+FKIx8x3U8henDLiHat8Vzo?=
 =?us-ascii?Q?XOk4sYNPFzGO4MHg18YPzwVT9Ey6udgaiZb5jHi0VZuuciD940G+ylYSWv1O?=
 =?us-ascii?Q?OgCZibuqjIg5SSvDKHZ5BROV/aFDffzeEIEtA+kpYw8ioMZ9xvlT/WLrTAFa?=
 =?us-ascii?Q?4EJkQD+KvI2vAD+KcxDI7PXkzukYbC5yixC/AaheXXhuUSaDy7pMT+OwoUYl?=
 =?us-ascii?Q?CCMjmAZCdm/cHvpfQ282XfbuN8ZpMMKPHi2NGMQ9TaYfNQTiEF5zBOqpK/CG?=
 =?us-ascii?Q?XyVKXq9uofnyUt/JLaRFBs2e8L7YxLQOzzdL+pd19l/72QfT6YTT3TIq5uQN?=
 =?us-ascii?Q?qxN669T8m/Zhdfc3ZU+7iCW0sBbaq8TYfnz1WrylRN5NMdhsY4xSuhXcD2DS?=
 =?us-ascii?Q?WGkeG4vbGdMgdPHag75SEXcNqTee8tROOHr0/gZcapMr0+N2Ls/s5+bxCINE?=
 =?us-ascii?Q?4nUIU/o4QK0HF+LbBPLD4meMsQSnjKgJBZQ4g/2UKdOqwz+bKbzxkJ13diaa?=
 =?us-ascii?Q?CjVQMD3Cpg2SK6y6mdXpEjpEKG9rZkU/47cZpgA6J3F5NP4GR1Tw3TVVCk6B?=
 =?us-ascii?Q?OURGh9KWU/7tglrAJBVOWQA82SYqacWkEBEJmn1k0VhWTEUuR8TobN8oW9fd?=
 =?us-ascii?Q?KZrNsl3GoFjMZGZq5fWF4vfy49Uif3OZsN135cG37B3zH9NNNUOMDsyTR/t+?=
 =?us-ascii?Q?LxNQRkA2HHs25WGChK/n0BtFcVCYsnzfE8a6WIyqQ5e7njAVllixwqVFGQT5?=
 =?us-ascii?Q?RzT8wNWWPB/+gJIpgs96i09sFkcXQr7Wawo7awi59P7t0ykBW0Nl47IMByHC?=
 =?us-ascii?Q?GwM5sjekh/OClHopkw5VWwcFUFUcpTnk6hb5chczJML64BjEee4EwQ2MuOuH?=
 =?us-ascii?Q?FHStVnJ2EBQqYrgSN65HIjw7vdcwM0c3pvsTyoYL+kQtYbGXe97nv9zibj5D?=
 =?us-ascii?Q?Z9lxxyp/LTI/E9oIngTcybQZTel9RUdeDiJ1FO+6uJ36SRCrkwPiCncu9w2c?=
 =?us-ascii?Q?bmUVhUsQDjD0QLyDAgwQed8Yl7vR7QeBUOjn4zXB63fLDI4/pbzvkW3ydA2U?=
 =?us-ascii?Q?d2sBsM4T2VUtd0DnFTLnkZebmHQzw8/eB88JQkrEHpPygpRcnDRyk5dy/r+y?=
 =?us-ascii?Q?qV/j9ady+0dFwEOh91Nrl4PGWsfzZVdm1zPEzBIW30nUe8breZgnP+0y3YEM?=
 =?us-ascii?Q?eDD/Mlz4GIYogee2j9Y4KHzycrlCTxaG4gVTyOQXnLyG21x7mupiLz4yrySp?=
 =?us-ascii?Q?X/o52nnOFhaZIlvq3MAek5RyDlqY2cn301lW1ejReo9KBGhip/qIcE5smbp0?=
 =?us-ascii?Q?x18CoBw9CsBK8s927EEPWpzvYY2VLwtkXYd5AKkfvw4cL0SzTzu0xJnoAxBj?=
 =?us-ascii?Q?crgOy1yhnkuyp2XKJ4CfiRw=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23c6895d-27aa-49e7-9cf1-08de2722e6e2
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 04:19:59.1082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AJKiI5uXRaAXzmLbLLa1/eioK2yD/8JALTnBwkVKXyUn4dVtWD9493WowIVnzw3CSC5epnJtOYaSl3bu4kn4QAKLr3SYQLd5hGr0Cy9sCek=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR01MB7568
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_202004_958984_C09572A4 
X-CRM114-Status: GOOD (  12.31  )
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

Nathan Chancellor reported the below bug:

[    0.149929] BUG: KASAN: invalid-access in change_memory_common+0x258/0x2d0
[    0.151006] Read of size 8 at addr f96680000268a000 by task swapper/0/1
[    0.152031]
[    0.152274] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.18.0-rc1-00012-g37cb0aab9068 #1 PREEMPT
[    0.152288] Hardware name: linux,dummy-virt (DT)
[    0.152292] Call trace:
[    0.152295]  show_stack+0x18/0x30 (C)
[    0.152309]  dump_stack_lvl+0x60/0x80
[    0.152320]  print_report+0x480/0x498
[    0.152331]  kasan_report+0xac/0xf0
[    0.152343]  kasan_check_range+0x90/0xb0
[    0.152353]  __hwasan_load8_noabort+0x20/0x34
[    0.152364]  change_memory_common+0x258/0x2d0
[    0.152375]  set_memory_ro+0x18/0x24
[    0.152386]  bpf_prog_pack_alloc+0x200/0x2e8
[    0.152397]  bpf_jit_binary_pack_alloc+0x78/0x188
[    0.152409]  bpf_int_jit_compile+0xa4c/0xc74
[    0.152420]  bpf_prog_select_runtime+0x1c0/0x2bc
[    0.152430]  bpf_prepare_filter+0x5a4/0x7c0
[    0.152443]  bpf_prog_create+0xa4/0x100
[    0.152454]  ptp_classifier_init+0x80/0xd0
[    0.152465]  sock_init+0x12c/0x178
[    0.152474]  do_one_initcall+0xa0/0x260
[    0.152484]  kernel_init_freeable+0x2d8/0x358
[    0.152495]  kernel_init+0x20/0x140
[    0.152510]  ret_from_fork+0x10/0x20

It is because the KASAN tagged address was used when calculating the page
index. The untagged address should be used.

Fixes: 37cb0aab9068 ("arm64: mm: make linear mapping permission update more robust for patial range")
Reported-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
---
The fix tag commit is in arm64 tree, but not in Linus's tree yet. So
I'm supposed this patch should be folded into it.

 arch/arm64/mm/pageattr.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index 08ac96b9f846..fe6fdc6249e3 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -183,7 +183,8 @@ static int change_memory_common(unsigned long addr, int numpages,
 	 */
 	if (rodata_full && (pgprot_val(set_mask) == PTE_RDONLY ||
 			    pgprot_val(clear_mask) == PTE_RDONLY)) {
-		unsigned long idx = (start - (unsigned long)area->addr) >> PAGE_SHIFT;
+		unsigned long idx = (start - (unsigned long)kasan_reset_tag(area->addr))
+				    >> PAGE_SHIFT;
 		for (; numpages; idx++, numpages--) {
 			__change_memory_common((u64)page_address(area->pages[idx]),
 					       PAGE_SIZE, set_mask, clear_mask);
-- 
2.47.0


