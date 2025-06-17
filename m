Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9E22C71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 00:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Type:Subject:Cc:To:From:Message-ID:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4ybev4RTwO9HThOq6k4LW6h1rFcAk5EaBhpBDs3A9kI=; b=fhKrIkC2CPL5CkP1LcKvdVKl5X
	eq3R2ZYNc/0+zzckfoU/1SyJJSZdWLWL0wlQNnnqn1KqrRCKFDyYBaXgj4qC5SMTFeWFpuyMA44+e
	9ZKybkIO/O+JzUD9Ug4264kTDU9OZaI1VlO1iGqpizlpIRIHVNsmyX6v7Kc0t1G5lAnvyvg1TR5K5
	B/zio9IZKeFAHs0JDJyieemUwQfo8tlnExfy6tV17NWJxhkxmTi01u89NllIXcu/ivuMMfSButfGx
	awzQrcD0BkFxqAM291SazPj4r00hvPL1MfIJcDd5r9Z+Jx/IzG210iK5uIaClzQFGtWs/nHgJS3k4
	a9vnSbxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRJvC-00000005rlY-28Rt;
	Tue, 17 Jun 2025 00:11:26 +0000
Received: from mail-japanwestazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c406::1] helo=OS0P286CU011.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRJqL-00000005rUz-0sGZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 00:06:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GJyCBpMjjCUExWJ8a5IntBfZnwZtaJ89TeK+tLTLnPlWliV3j9V6wRZswfMYdjLUIR8hKggqF3buCmONgyI9ZCUGj9mmolNH4dHULzzlF6NQiqYPEp/L6e/7/yd3W5gIFCqNFOnmut5/Ow+x6YTVeDHhm0nhHLY8YqNElFcHJIllPtFeSxZbJHf8rdJAXRMDnwLeBIIUonV0K2kEazbi2sANHvm6rQlRk8ecBX5e0Viy3PpxZHiBrLDoqCQafX9vWTYwxYAxdKDndlfVdmtIipy7X//GDf4638ps0icCPGVYhaEuu3ag2XmsMcSp6C0VEXOloArtrb2NjDz0hddkYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ybev4RTwO9HThOq6k4LW6h1rFcAk5EaBhpBDs3A9kI=;
 b=RZVmf+6svoxuWMCmu/3aPIVgwefT3o0N3HvgN3AiZ3LxvYLjxbNDQ0i6KG5kcRuRhyfs3+Bv6hB/pZzPxXzNDUZ8ZbrpAkVy0gqmPCiZfvqgolq6pThRC7agOiP3ru2oEcrKZUNCi38W3OsMJR3RCZSgB2EKiUGbi7eyn9LipaVjFD0Dhi7/rJATJOkHyUIapYJK1LK4Izuu1A+8PvUqtMRTm1gBHVmgGiGY06GEE9pPpZjrLJ8HtsOTgVbF32JMLmhSW55XLrBVhYSqXPe2+6Q3tGEm0Zmqw5HUEM6/zaLidDx6C1JI/NRDpxm2jMI+dBTFDnu0TL2orRnYxD7g3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ybev4RTwO9HThOq6k4LW6h1rFcAk5EaBhpBDs3A9kI=;
 b=c6eqr3XdincoPq+7sTYPZF2rQI/J8PBJ1MSnldggpduPtw+8nvuNTvkpEqOJVhN2DaTIeqVtIm0Z0cqL0HkWCIEhehoxlj5ksy3D46NzMyg+ZU1ubKMdybApHPyYi6sE4UqYDYMUqFLqz0HPPUWMJxxGLpUOZ3yuUIFVUuoxNXc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB6804.jpnprd01.prod.outlook.com
 (2603:1096:400:b3::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Tue, 17 Jun
 2025 00:06:17 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 00:06:17 +0000
Message-ID: <87sejznsef.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Ard Biesheuvel <ardb@kernel.org>, Kees Cook <kees@kernel.org>, Russell King <linux@armlinux.org.uk>, Yanjun Yang <yangyj.ee@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Kees Cook <kees@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm: mm: fault: use string choices helper
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 17 Jun 2025 00:06:17 +0000
X-ClientProxiedBy: TY4P286CA0008.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26d::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB6804:EE_
X-MS-Office365-Filtering-Correlation-Id: fd4f2d9b-5c86-4403-8fc2-08ddad32c81a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uWlyoaWKFFTjj42hP5EIHF3t0JfFFTS7DHoZh73iEkuGaycAh9eiEBexFeCD?=
 =?us-ascii?Q?VeeiRFGSYkvBFYYp+/qIB/ktKWgxcru/lleHqI8urSW7S4w/uxt7clFF9UA2?=
 =?us-ascii?Q?M2vefSM/EwqP/W61bFxAsTopUB4aComTBFgcyfVJ3JV51HyJUJPrvTC+4lSP?=
 =?us-ascii?Q?tGnLTezzdY3j8JS7T0EZVTsfaed6RTSo31vU7sSOOgBjcqdVnIF1Tgj616zI?=
 =?us-ascii?Q?f+8HVCVkHO3/+1Jz6aMFbVgE/1ycuByL5T7Glqc8/IpZLT3Vgw7ynUZdj/XE?=
 =?us-ascii?Q?klxjdESlYDRTuXfVFuuDL2tcoSeDHHLHyU0fNbX+w4wIx77eJW3LrJCV+c3Y?=
 =?us-ascii?Q?ErAVY4OiIjuSOyhh/4NeiZ3YCDvsAbuq14oTapXRtf3myy7k+P8IHg2FBMPs?=
 =?us-ascii?Q?DerL58nUMrwRKjdPKgMXBFWYbIJhMvWmQenc6WX69x5pmbaDOfgbWkTpVBsN?=
 =?us-ascii?Q?UcYIlToqfnb/uCZxMxjvzgwnlM0We/82GUt5qCJ4mIKsLhTzYrrN0izL+yG9?=
 =?us-ascii?Q?scAiQ6vYIE+xrEP07/pqYt4+IPQ1r0/nBtfYxz5VYibu2ugLIKaNTnfGcVy9?=
 =?us-ascii?Q?3GAS+mMQeElz/qV0HrkYRRnRvdV59owKFWkADuZuVv7tl6l5bEU5p6kyhI9x?=
 =?us-ascii?Q?viYgXOwFCi6lA6gzf8BOw83LUHtf0Lq3p70d3ojq7giOE43NdEPg5aaqRPHX?=
 =?us-ascii?Q?r6oBN8wjiEAfX3zok90TjUU2dNPgCpXXcpdMKlpK0B+k3d0D9YSPGcVnRoOL?=
 =?us-ascii?Q?M+KrNKBr94mwcfNPhttTPBAn0a/fcO/zLeu1NN8op5DXh1pqvNWynS7jl+sy?=
 =?us-ascii?Q?mIMa5Gy+noDCBx4d0wF7fp/2s3YgK90mG0H0hK3QYSoP0yR/jNfMXrFtGwD2?=
 =?us-ascii?Q?oowOgnbvNybelS8+XesnRqkyuFjpBpsbcRceORU0//xaODs762CfROzv4HHZ?=
 =?us-ascii?Q?+k6TWdpQX+6w+D44MdfQf2APsWFDpsfdCZamewxCc6ubRsyqYHANImmzNAso?=
 =?us-ascii?Q?j+2MG843fO0UWnnRFMu1npIY2xyCdRHUAmVuvcuqiC25YdcYW79cCwceA3Yp?=
 =?us-ascii?Q?m8cg3AWdTqLK4O8M8CQds5G5Y+JonvCdVFpg1Q+z8pIaX0dVN5DMS3btXy8Z?=
 =?us-ascii?Q?q2yI87hggI4+WxgiYJUM201f1mrDGe/BRHdx9NMeY9ZrsXiUCglGkSqwfoOJ?=
 =?us-ascii?Q?qCnbCbGVC3X0RrLqJtAjU41w3zYWTEgk4TVHCqnd61Mj+6KOroCDTYyz+c4f?=
 =?us-ascii?Q?iFX7+k4hH2sO3ZnkNpBTWtVVoVIlBzDl6oskyZC+Q0gadqkNqU+M66yoL8Ww?=
 =?us-ascii?Q?9U8hcVPJRt66YnnDV1bZKZzuDjskzpa43ppFhjPIPie5BxVa+GOVin6s/5u2?=
 =?us-ascii?Q?zEctlIvlc7BgYiMRUPFr7sIy2dIL2y4ktdwifW45PY54AjSlXWqdfOSbBMmH?=
 =?us-ascii?Q?Fr09XdmYoPQV3e/hLWQlGxBUetuOHM7AgLtteiqyXT3x/aUYCcolfg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Gbf+SVEHRmRPFhhsj94MnvFHVmSAycXRyVs010qzmV2oMdNMWIaM2KKjrzFe?=
 =?us-ascii?Q?UZoAAbM5Q0lLgYWuZHhLJLSp6fEkJHO9oFdMPQD95Y+KPLIog2jdSp6UfWew?=
 =?us-ascii?Q?fFNZKOe4Q1zGuEbqp/4F7nkrtgsmyhWaCm4suXZhv+LR/Cul6z0TdZSVWsLe?=
 =?us-ascii?Q?I8ysvTbA4cXiWqnIKMLz+6D+1N0b+X2DmukKaHiQGmo/E7OS+TqpFMugiBDy?=
 =?us-ascii?Q?c96TOVGc013CY4nRdteBOLK9R8nUm+YVc99Pnh7pBv0CoTAsQDoAEgnzvJsh?=
 =?us-ascii?Q?VG/nNlhi+pWd3iMhd8jir+XB8asRpbaDwIPqoNnoCNENi0Ut9eee2zYRgYsY?=
 =?us-ascii?Q?tmol1/bxmtNu5Jcnvztt1Jh7vm9zwsJjro14K8OJi0qAHNihofxfegOjmhC9?=
 =?us-ascii?Q?O7loeYYxe/rGUoe5VWIY20j2SQEmsW7UR2Gs7kr6gN3gD4Qm0wZDtK5BklYC?=
 =?us-ascii?Q?H99DFEmGKSCg6Z5bh74bJeMo1hvSG/WGoURuLqPc0EMejtNnyQjc54RJAg+9?=
 =?us-ascii?Q?V3L3zbftmEEfUMHEPRevkxErvSFJAo0px9TXaVcZNeERXgYmlzn2Odan1XkH?=
 =?us-ascii?Q?+cLY+8xJowPPfduVQYafcMpjTByyRuowNo5H75lb3TUlopUT/s4NBO49T8q/?=
 =?us-ascii?Q?u2goeSQyFhPXW9lepE8R8Yg9kWDWuQZBsyFMqnahY/NBmlC8KOnY7Q9/G/dJ?=
 =?us-ascii?Q?uIwGNQ0mrULmGa5LsM48igomQL+QEW67Cw4AhfEVEjUNeAcJ5m+MpwklKrsy?=
 =?us-ascii?Q?9f+q4Texornj2MtXOrZ9up4OLoxhOElmqWVTm5kpcOwuFo9uOBLM7+rvW+4d?=
 =?us-ascii?Q?BRXWfNdirA34VbWKNI3o0pGNWgcVRZKh/VTF5tyJFA9casLlUyb1aQ+V3yV+?=
 =?us-ascii?Q?qErBcv5vZPpa4HnJ7JIYLLusRe9GRnisUyEFQMpn6NHjZA4jCNsZ8E5mVK0N?=
 =?us-ascii?Q?UK7Bn3gRF0d5Yju8XdaFnW2QGupt2ImFY6d+0BlYnyLnyCUij3iDB3P8N3s9?=
 =?us-ascii?Q?sYE3Vn8MfzmEMQ+9qKR6zCbS7/18fJxVDCd4nBwpfi+K/voiDly1+fKzFwcJ?=
 =?us-ascii?Q?vn4byXCCERtl3RPdbV4poSjU6I3HBf37tCWcnGTZkQAyCCb6G447un6vzb5c?=
 =?us-ascii?Q?DIUQYKKIOK7wdWdSSMgFArxYTBDSTeIaA4AwTZIXUObNHIO2nbr3vfmByFnn?=
 =?us-ascii?Q?DLG3p+D+D0icHAWNJYmyrUO7oQpWhuLmF+am9AmXlPT0uS4QijinJsNtC8Lq?=
 =?us-ascii?Q?BfIFuLf4xGzfw9P0MN8+74BEuk/6+jstnsQKmX8niyXSfLji7PbUdvAdwwuZ?=
 =?us-ascii?Q?xJZFIt9ObiQIJxlnD2jbactSNrqGi6WurTXs+vjY7g/WxTDlvgQca7+jk8Lm?=
 =?us-ascii?Q?q74GpRgMOzJx3OdvPEiOKbYNtNNqhY71INfJ4kMqk7Ru5OByTvHE1Uey90PS?=
 =?us-ascii?Q?uq9PuaBjYeAj5y12OtQLq5UNh+Xvg5J6aMeRhGamsA+GCB2rbTj9RRRlx6oI?=
 =?us-ascii?Q?hXHJR6FSvKNlHQJPqRqX/cTou5aH2fP+7qwOVXDuE5gkNF0xTk/O/f7X6hLH?=
 =?us-ascii?Q?fcBtxPv6E8dXJjPCDxo55OAN6ZMPWeClRgkPGX7/2Ly3V/7L/RVWMypNGiFM?=
 =?us-ascii?Q?nkfRaApWdRKKyRV/vrH3idg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd4f2d9b-5c86-4403-8fc2-08ddad32c81a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 00:06:17.4510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8LaApubNY/9GF+rvS9pg1amkq/Hv+gKld/W0kseX+ocmPHM7fHlIuYG6eHDtcMUQlFFld3n44HHGVcY9OfFZFURCl7NKmZynkgY2gQgDpQkHU9+hA0Jg5CCnE5RES6Gd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6804
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_170625_249883_4FAA1392 
X-CRM114-Status: UNSURE (   8.90  )
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

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm/mm/fault.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
index ab01b51de559..b2d59d260a1f 100644
--- a/arch/arm/mm/fault.c
+++ b/arch/arm/mm/fault.c
@@ -136,7 +136,7 @@ static void die_kernel_fault(const char *msg, struct mm_struct *mm,
 	pr_alert("8<--- cut here ---\n");
 	pr_alert("Unable to handle kernel %s at virtual address %08lx when %s\n",
 		 msg, addr, fsr & FSR_LNX_PF ? "execute" :
-		 fsr & FSR_WRITE ? "write" : "read");
+		 str_write_read(fsr & FSR_WRITE));
 
 	show_pte(KERN_ALERT, mm, addr);
 	die("Oops", regs, fsr);
-- 
2.43.0


