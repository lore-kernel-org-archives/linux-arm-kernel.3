Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD1FC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 23:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Type:Subject:From:Cc:To:Message-ID:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9GczHLGBeNFa7c0Jmx7K7//f3RDmSOXEo/E2NDtBRK8=; b=a/KoL2MwqSLBvj3RR7rZ9h7FWw
	JEeOde6NhaSKXKD6gOUWUJFhPN3F+3t2VTpDZbGiBDiywQfvpWNvFmZ4dHfoSmfCXosfoPPyOEMSt
	teZGpCVlv0eE89RS2cd1tURVGyutKhPvnZOPYXgePGF0rs0pnsYWjwph0rVQjbNkPsGzYm/eDa+4I
	hSO53Agh24rYWtVT79d/YEnYIGPiKYQ/eIXViGEafcrUq8Y1VvFm+mVeqoDumWkrQrdERIVodFVJJ
	SHp+IRsEWZ8WfmdH5W0KLVw7P8ddL8DbNABCy9bVndTwgG8+kBenRkxURlejFQ9P7EJIXQfs/w1cU
	040OIxbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujnVx-0000000Govl-2cEC;
	Wed, 06 Aug 2025 23:25:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujnRG-0000000GoYZ-1xVB
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 06 Aug 2025 23:20:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Date:Content-Type:Subject
	:From:Cc:To:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=9GczHLGBeNFa7c0Jmx7K7//f3RDmSOXEo/E2NDtBRK8=; b=a55FCBz1aKFrMdw0tMDzINBpTS
	ck99Y0KOwqFxwA2Io0ZuF8NZUj1xl/ViMd8PEUmGUYpwDDlPRwLE22D3PJJAxSVU+IqJ6fUPIwT+R
	ejPG7/rYEvDFuZb5aH3XWdmlHqBiZk7qGNVvr16F5ukWUXyIk5BPya419XhBo+tRAPtK9XNkEdeGP
	ysIsizNRNRDeSZZdl0hjZaTH4SUbUAqQMNeOHKQY94tnlzVPiMr9CX0l6vt04F1cZOBk48PYGruov
	3ryYhi0LMDPb5rKbdGLozMCnAqy2JO1BWybiA218KQHHrCJXQU0lG5qrCxfSDYWVoLXonMdwlAakh
	RwvSCExg==;
Received: from mail-japanwestazlp170110001.outbound.protection.outlook.com ([2a01:111:f403:c407::1] helo=OS0P286CU010.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujnR7-0000000ETDT-4C8Y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 23:20:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pyXdF3A4zjJ61hTs9hVc5FC5MbDgX+p1PcaD+GYnAGmgp8armvxl4mhf6MvAXA8oIDsgYOqEwRhOTh3WhkvlcJ6hCVWHDD5MkPQ+nUmyJUHWDR1XaSegyYeKawqRlcRthbdV9cyO5OL3Jyk+Aklt3pgpfXzUPEK8v0/z1ewJ2Gtc0HL14ZQfvuIQn6LzhAx8ZjzLfkJ66EdsMg1Y5z6HCEXpYQsRLVzyFncj2vcG9R/kDS7POyrkrEBY8f95WsUpEPqsYbB+/heBBCmvHV36Znf+6vPcAmaMs6P2yMzHL3M4PQoMmzfaTc36sr7/Hd8t+8eiwrW6cbOUVhZvrjX9cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9GczHLGBeNFa7c0Jmx7K7//f3RDmSOXEo/E2NDtBRK8=;
 b=pSGt++q77xioqlU0lJhTCQNOE4CZpt5voU/uXxE6x3f/EzZresiBJ0hTmvlB0SfivAYpr/igfUCAeR2OJBDQ/66El7zot7aOlXc6p3V4xdQBUXCB+yc1rKUoDhxgZxwoghhNd1zKbqRY4/ll8OZHq/d6GXV7wbSn8sOhxfJyDAA+GCaZOVlUqxu6xYVL8WuCTgwECMXYVJ8cN8lg4HnWci50TfSx0voYVmYlS8mtaOWYSqAzXtaqhcoy6hkhhjWCqoEb/CWGkOkBh+bSRzrpGH6GXkqXtS+BjGtTMqUVKpAuunlKyBoS8w84At2BP2ZassjuphKVKwRrpCSiR9Xk2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9GczHLGBeNFa7c0Jmx7K7//f3RDmSOXEo/E2NDtBRK8=;
 b=RGOmcHGJLc0/9imPY5TJ1jKiqTZt5UyJNID2awykakBMjTyQM7xp/5djvGftbKsSw6TkXAKikarlqqJ9JQQ1BVcbdIxgbeZSgepzobGRLBkd6W8cXBP7rRW7KFUCaXUJfAIJWtMaoM9NIwkMx+xnya/4MyNjUxkgIJ4GG6v2nqA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB6910.jpnprd01.prod.outlook.com
 (2603:1096:400:d3::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.16; Wed, 6 Aug
 2025 23:20:27 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 23:20:26 +0000
Message-ID: <8734a4dolh.wl-kuninori.morimoto.gx@renesas.com>
To: Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org
Cc: patches@armlinux.org.uk
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [RESEND][PATCH] arm: mm: fault: use string choices helper
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 6 Aug 2025 23:20:26 +0000
X-ClientProxiedBy: TYCPR01CA0202.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB6910:EE_
X-MS-Office365-Filtering-Correlation-Id: fdb8c251-e606-4eaf-a416-08ddd53fd3bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hL8iE6cccxYrbIpPLjgh2m/bio1wnSsnQ9rYHYpidFFG5IipxXgjYkeI0mNn?=
 =?us-ascii?Q?940b+2YbVjC8clZSy1ySwy52S/j20YiuOwPTosDd7pkGJcKCaf00QXdj/gYh?=
 =?us-ascii?Q?9bcn6G32BqVBrtgufFlWcibvzPUycURn7zk9PwmxDi+5oOgyDRwvBxbHy1eD?=
 =?us-ascii?Q?LuF44XrhH3mUFOe2oesDOD37+R2DiJ6uCngsOG40zQq9kj879gs3S2GvV3EE?=
 =?us-ascii?Q?3AfGzdXyKcWEh3iWuERRB9k+A9tNebEVupnCuICBO+fMHqSNaJMPRIyMiXkX?=
 =?us-ascii?Q?8j0YOSBUQjUspAJVDFfAQdGLq1vBl5E20Gn+Md37AvO7ClQnjzxOJ5NbC7HW?=
 =?us-ascii?Q?dluz9elykB9aqBsH+VVokil2r/TYuaxMF6rAmgW/3RhS+4QiD/luMzgvTCTS?=
 =?us-ascii?Q?GfMSrkxex1zaufmw7+UjkDQ2Nzk+VtpHfRt1k1Sl3nOgKJ/vGPZroUskw6nh?=
 =?us-ascii?Q?zwsTHc6h2p0xHvOrF2THNj48q9G0NQl/OWGNv/d6trnl4+4fsE4EzZdEDGRK?=
 =?us-ascii?Q?MMFMsLgtD0o/qyHNSpyeS2mPP1yOotbQYtaGW/0HkDwPTt2MRDs3njVn3M4e?=
 =?us-ascii?Q?J+lbq10c6qqE7+Vn3DWilEt29Zq5eY9lABmQlpbyUtoDbmAP0wjk+DBMDXYP?=
 =?us-ascii?Q?+KWY+CHC+KDyVx3Xv5jVCnm+VGk4SPnCseUucuzNCAtfzZh2GVJvOjF+hOtU?=
 =?us-ascii?Q?xnZspPjIJEp+b4taiJTSKmX1RfsAuZEQ6vj1uQzg9ha+GJKkEszWXX2BmN/C?=
 =?us-ascii?Q?1qMZ5vIkvYytvrLTIFQ9lJRiYbuopah4fRJ9WMsIF7z7HrDXA4VOnvxrDH3V?=
 =?us-ascii?Q?1DkkSZTx7imu1+3zPfKdaBiKu6xLlm7+QcdczgBWUrzCpB4NuQAVOj/BLF0N?=
 =?us-ascii?Q?U1ANXQ/8dXvYNJ8kKhzi39Rz0TAznVmlOlC0YhqlfACqBa8VtJAjISU0WViM?=
 =?us-ascii?Q?sJ9eOtPkhONgnmJwXTu/QyO4AT/8yZ6kFqJjjOrKQhtUlMCr/SKoadt0hQR2?=
 =?us-ascii?Q?5AQApLU3qtXXyNVtMhW31mbv/FZoAuyyTmSCJUR8qSIcvSHRGOMExO3ytCXY?=
 =?us-ascii?Q?/PWr1fmVFUCpj6dYv3QE6X7d+D0N29bPaa0FGfuT5tkjD6gilO2golM8Eej7?=
 =?us-ascii?Q?rytvoNsfWsWdl/L4E50nJx9kDfLuuL0c6Y2tWTJ8vO33dh4TquP59kzb9nKk?=
 =?us-ascii?Q?nNiAaN7OB+rI3pFdKEaqRxU6oSNQRmdJlkES0N3qJPhz8gHqyAfDEo4zvtej?=
 =?us-ascii?Q?mgVsMRj0vpnjg6lvveJKaxTU/VSn2HoH5l0SR+Wu74FHaC7oPV9+kmzvhc84?=
 =?us-ascii?Q?pgU5S9ExsZxQQsZEwXWcd0sTWvJqxRS2y08gkAz0UVRJfr7a6NFq2z5/PAfa?=
 =?us-ascii?Q?t1wKUEN0zyq/A5AEjtYJ4wSAWMo6zBJJ5ORj/5hu/7BN1Xwo+MAU/kkypszw?=
 =?us-ascii?Q?8qyoBHoO95bBQTPEfVdpRyuH+ireUtZq+DiLhlfM8WnmgLj3pArKAQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fJrwpg0trBKmo1vCsUWbz9Gq6D+9MoymAcI+qXpIk9RjCgDthBB/SPXsVAHz?=
 =?us-ascii?Q?rT/66+y1wFHc3KgPyLSexkn4KmUu5CVKSDt3+w4MAaf1AK/0rwmyr+Kb5xMd?=
 =?us-ascii?Q?1kFFv5Akdh/fW5Lrf9DhEd+DPOnC22C60Mr6+OaZhAYNFjLHwC0KxpNAts5R?=
 =?us-ascii?Q?weFsiEVpcI7ppr+2rwRFQRLjxJOeZ8ymrkFu8CAEp8ZxTwxpMwP0AfidOCcc?=
 =?us-ascii?Q?Eq5wYqmDvzQZvpw+RYtcYqSCcjFETjKnTjmT+P4bahXomtwPV1VQ94+HplC0?=
 =?us-ascii?Q?zxjQ6+dYMYee6/1fz3YK4DugxfpjQzx+dLzbe1zdKD+Qp05ZPXB0mMR5gwW1?=
 =?us-ascii?Q?IMKA4vep7odVFm1m2cyyDzcG6UIV6zzYR9rTor1eqfrmnadsDOLKl8iKB65q?=
 =?us-ascii?Q?hZllqzAGoOEe0LrxxtbCZQkUYcoVfM2z0gO+gJnb0wQN+TEw5ATrsgbIzAd+?=
 =?us-ascii?Q?BG+/tU5hP3Jb8OpbAx/b813z9piRG5Afpaw+oXAVvkfzk4Bv7SiUzVlXZ1mc?=
 =?us-ascii?Q?oc9TrME2YjLvrZaPkRIo2JXFk2BCqFMIJCzVuNguAHbLcc50oC2gX/+jPLhL?=
 =?us-ascii?Q?neyf0y8R6iGQ6Qmk6UJ+sZzGRJxLz9YwifR0QhV/YsKK1Hlk5IlYA94glJJt?=
 =?us-ascii?Q?hviVOTsn1x/FY52C7RxZQYUYt5MG0zgHM5IObD7T9XfW1EzNjBwtauaYYrQY?=
 =?us-ascii?Q?Vp7UyNq3WHXDObb1mylDgdHU0U85Y9kJANULDMU/L9vgoi2was5MBtJNNw2q?=
 =?us-ascii?Q?yDvzZ61c7mK66//O2blEM4PHYKp1xd9esqM2nH8RpRCOwZrIprC4kD34tWbG?=
 =?us-ascii?Q?lQhXeODbbgBzcP/jmWgv4ziKp28JdMLBVaA4cgOZuiuAOUUnJ5EpuQL1CL1w?=
 =?us-ascii?Q?/Y6+i+J7JOdVfao+AKwbq6UWxCw7WqkX1tMkuUPOpyVNEoetfHXaiL/2HZ7o?=
 =?us-ascii?Q?uEYAVigB1kcoZP9oGF5gynQQKvI7yvtfk7mrQPvVoaecCGGFvxN8T8m8HyG6?=
 =?us-ascii?Q?oaM5MbvVVHCizv+7/9uwpH8QRpx/BRK8tt83+0v/DSLrjn273eG9+PRpMBfL?=
 =?us-ascii?Q?pGdQI6TJa4sIYCld9eNuQjcyvOFTpsZDdfuF2ucyq9kdTSyMXmEHh9kIO1SQ?=
 =?us-ascii?Q?KUHaimFjq75PwNCZtcb4laYbN4d1dbggBzjyLZk/NyhXrK5W4YHJ0DhaNEen?=
 =?us-ascii?Q?7XXqJZi9McteUrNKarrJu7B5ebipomdNTbTLA3gTG7qr17PPT6We3xpbDnwD?=
 =?us-ascii?Q?/wvFhIP2Xlled3kLAgXXmJjoKDpUPi1AP2HocTo7ZziiT67i0rCMbC+tgLCm?=
 =?us-ascii?Q?W1m5tmZap9Uf3OtSuperhV9XG9bMb69w2sfeu8AJErUy/tem8AVnA3/fj42I?=
 =?us-ascii?Q?RHMh9I+eBuEPfMr9xLGPpZGYwtKHNelqwH9v6koDWO4cVEVpFVzkNYLoJaai?=
 =?us-ascii?Q?iwA83PvLvWamgy3J8kmldUFsXzgMXCDfJ4jll/MjxiCWsV0+/RKD0A70vnir?=
 =?us-ascii?Q?qPne21HL3F0gSIBI/8VWS1Hg6jSVKdIeYQ4V1y0OZIaT+2SoE0/cg3FXB7aT?=
 =?us-ascii?Q?Hh2YnK3eY1/oXCXCmHPqcpOl7nEPqpnGScMS0oph6TjpdMkNpQlFWkI4NVWX?=
 =?us-ascii?Q?zhIrU3TaWAEywsLJ7S9wsAg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdb8c251-e606-4eaf-a416-08ddd53fd3bb
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 23:20:26.9584
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oqoFm5geDHWcirKS735mMWhXrNMbpSpdHopHGyMdFvp8KRrE+lOnVDMYJprckNVSjRNbr8JnSB+9GTI2NWpF4z51ZgA9YNoOSBl4344NqXPlgdyOXQ3D8fk2b1VWzuOD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB6910
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_002047_057977_29D9CF01 
X-CRM114-Status: UNSURE (   8.74  )
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

We can use string choices helper, let's use it.
It makes one line code.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
KernelVersion: v6.17

 arch/arm/mm/fault.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
index 46169fe42c61..2bc828a1940c 100644
--- a/arch/arm/mm/fault.c
+++ b/arch/arm/mm/fault.c
@@ -135,8 +135,7 @@ static void die_kernel_fault(const char *msg, struct mm_struct *mm,
 	bust_spinlocks(1);
 	pr_alert("8<--- cut here ---\n");
 	pr_alert("Unable to handle kernel %s at virtual address %08lx when %s\n",
-		 msg, addr, fsr & FSR_LNX_PF ? "execute" :
-		 fsr & FSR_WRITE ? "write" : "read");
+		 msg, addr, fsr & FSR_LNX_PF ? "execute" : str_write_read(fsr & FSR_WRITE));
 
 	show_pte(KERN_ALERT, mm, addr);
 	die("Oops", regs, fsr);
-- 
2.43.0


