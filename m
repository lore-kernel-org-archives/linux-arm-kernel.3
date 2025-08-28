Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B4DCA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 17:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vZodg2oIqKMrh2YD8dP1b5EhpMGNxonT/ssrNCzueoM=; b=CCfUozPcdL0jG1TDSSepcbzI24
	uow2DJQEvYw0TA4nLfdlpu/6Y46c1bkQ18taxvJP5ZD2na+TdVlYF8S5soCzWFt/DsL3ET0QLCWTj
	QoLuLwx5csjuMbWssEpUs314zKnm9ceoKWng9ZjewLLsMAnd8N/iKcsRWiSKy88WHsyxFtz4eB0Hm
	vjRcjd/k4Y7NycuktYBHiQZVQ5ZNELEZsR4jEQsx1d135A1KI8ucG7E8/kkxKqm1LFBmxLHjE2Mcy
	2zosxBfnPgMQZmTE7PoX28KZfd9+watrHdTsMB77SVJLpfQI4MYXe5sJ9X7rN4xrC5tnvGn4Nl+VA
	242IJXHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgQW-00000002W6k-2i7G;
	Thu, 28 Aug 2025 17:28:44 +0000
Received: from mail-japaneastazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c405::1] helo=TY3P286CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urdrK-00000001xgp-0V2G
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 14:44:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QpBflNfPwNIbNT71asQsFj5BtspTyvO82VGJjuCGpXwwFJKPB8qUaqKOzcrTLa7vRHsLv13Sy1ii+G9Skph83npGlV66Kz2dS5dWcY0Bvuq0k9N91OuNIhs/NtjqqmXb42sM5CTXEXdSVHpxQsMjfHNICUxCMWZY5rPTFw9WdbHP6YwbJ2I1P65b36NizK4C1S5kpPxHRSsrL3TUuO6L5XkvmpqZu+LUzYbFOFGAq+3wmeLen00cKIxTCbCs/IVtS77r08pifDHzBerZqn0t5j+p9eUx/MovVkluxQgumsfG6Wc93vGoPXPUBfrcIuaKDzJBZkfi694OhXcm1hlVWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vZodg2oIqKMrh2YD8dP1b5EhpMGNxonT/ssrNCzueoM=;
 b=nnKPzZFTI3zxGxloU6vU8svNbiW232LYRxX7sEaiAkhH5Dny7NjZhqT3Gzkxfqr/qoQDFByZSHBDaqoKDfE/dat/NMlQhIoSzY/uck6ZW+CgrMuD7UyuviZEGc9Hvn76bKiwa57U0EdXRWm/nJo57e0wnW5J/gZ48mrHTB4U35buRDGJfg4IZVfkkt4tRAloGk28ddSbtfTQ3lhlaGxBWUCYnfmLuPiRxgIIE2SVd3v9hVP5baQPe1AdDmdApwaP4lJQOQFffTRiLcbBMp3H1N9Upx025QNSteAS9JyqNkMJgnDBYx9Q2TisEKn+xmGetvIDCkI8hVQq8WPXxZY/Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vZodg2oIqKMrh2YD8dP1b5EhpMGNxonT/ssrNCzueoM=;
 b=niWNy3zreG2UTY1hVz1lexSFsnueWo+HVztqpzgnIsdxVK+R77Tyubrj8sZboxEHkh7orpsl/P2mzO34MGBhxDqylumMZZZYxbffabz3ZGwRbysa72+0yintNI8gctl1ouhwB7reqhL0UBWmx6cbO0RD5XNocXwXRZs7XzMAA4w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:10d::7)
 by OSZP286MB1847.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:166::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.13; Thu, 28 Aug
 2025 14:44:04 +0000
Received: from OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 ([fe80::80f1:db56:4a11:3f7a]) by OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 ([fe80::80f1:db56:4a11:3f7a%5]) with mapi id 15.20.9073.017; Thu, 28 Aug 2025
 14:44:04 +0000
From: Koichiro Den <den@valinux.co.jp>
To: linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org,
	tglx@linutronix.de,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] irqchip/gic-v3-its: Fix invalid wait context lockdep report
Date: Thu, 28 Aug 2025 23:44:00 +0900
Message-ID: <20250828144400.1500374-1-den@valinux.co.jp>
X-Mailer: git-send-email 2.48.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0182.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::6) To OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:10d::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3P286MB0979:EE_|OSZP286MB1847:EE_
X-MS-Office365-Filtering-Correlation-Id: 45f0dd66-17dc-46f2-d9f8-08dde64155a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?osdOEj7b1akO+t2JXqCdfHo51QyD+R0/Wl/BDD1oUruzMjtwVQoFgCBzEf6J?=
 =?us-ascii?Q?7/E3GvxMe8gshtopUwd69pXsRUAFyNYhhspx0qqRgCr9mcElR7q9mj8UQRe5?=
 =?us-ascii?Q?lBoRDpy9OqJJkC89jEIP7klAEYNG0id1NEUXjTjVKNM0m26wIlKn3qCh+V3r?=
 =?us-ascii?Q?G7IgiHn+nK8QxTyFJ9f6LlIsEbF5aVP3/D8q1/4OO0Iw3nAkRn6QZe7wLIJ3?=
 =?us-ascii?Q?c9VPZQX0/FoLoNiE2jpGC8myF8RnGOnN5LVpUJi6h600RBvQzQw7f4Q9HR/P?=
 =?us-ascii?Q?JunsRwVbncHTz4zQKFdcooxEfHxhTwaz+8Kbe/pOyqa60bUhOtMwYnKlN5QX?=
 =?us-ascii?Q?dOtBBCUryno9rrw15PHN/tM8QzAYrEk15mjugYHD7yjJZGiQ7cQUzEsdYU7U?=
 =?us-ascii?Q?YLYxGGwYo9kzzAtEbrEkahf4VvtZL37vM7H5U30S3j7zriR0KyGo+k/A9orH?=
 =?us-ascii?Q?m02Ww/uXNMzZ3n3sktitQo74K08mhiXB8OGz6nS+LW3roJESEwURoR7chldQ?=
 =?us-ascii?Q?55lEH81UMBsb/5tgHOMlPaltTkdEDnzCcUxc+uAGIi4LCeeR5gxhZr9PKaJh?=
 =?us-ascii?Q?CGLF84booJhODPlia73Sc5slVRXH5KwK2YX5UuJInvIrSjGUQ6K8vL+riBRS?=
 =?us-ascii?Q?nqLKLh0giUfLpeaXc4iEtSlhh1+qhrVvRLdN5c33Phdi1UTvMLZY3i2SJrxR?=
 =?us-ascii?Q?5E5GzWmhDoZe3IUuz9gug9fIl8ntoQ9PRA9ET88GRiwIEYeAwv72m7IZ7hMJ?=
 =?us-ascii?Q?NsVcGlH0n/EfFkTGZL6EWd/deSE66PYHs0EqOzJumquLRtVSP2yfoHsUBtz7?=
 =?us-ascii?Q?WE24IJt96mZ09aBaT1rvkdNBdFRWwJnPZ0SniLnKnWDrrkJCBIc2FjsKyui2?=
 =?us-ascii?Q?GQQvsKtjYYm3e6cyzOXU3DiWm73fF6aUf0jxGb2mbKDiS0fJ2zl8TgANYAQv?=
 =?us-ascii?Q?dfeoxrIcpsRdAEOMznDa2sLfjBj6eujY0yVkbcfVES5eBdfo7rLfPKJrjQ8L?=
 =?us-ascii?Q?Vshs72MhFth3oaUannw3/EXFZVTUYMlcMJAAUDzkmfIU4WkBM12RMd1XMtFk?=
 =?us-ascii?Q?L6IQgkyxHH1+40O8EdUUzx6RyAHr0Ov0j81zMMRmGdwT6y1qCsTmOByJ7AWY?=
 =?us-ascii?Q?zus51pNvlXylYod/EDQj7mex1SCWoJ1lNPQOnDUP+uQatIPi22npJWhFDMBP?=
 =?us-ascii?Q?W1gS6BCA+/F8NiD6PMK3b64fOr2glzhblcjI8v3i5+/qNhQyMo+O5RwllDUI?=
 =?us-ascii?Q?HejB73XazJ5qtwWO0m7xIeosceUf96P4jz4o+JT9OpPLmp6Cj4BoZ/RuYgGS?=
 =?us-ascii?Q?0IAvmR3O7KPMlvRUwjjTqcn5dK91c+jmrnDheJZO3Va6p56AaY/7LK1XeCPn?=
 =?us-ascii?Q?Wcee5barXK9uYanvjov9hQkbGhYOo2GwNJC7CzzNJSmGOLszyAlc21nXVFQU?=
 =?us-ascii?Q?clTfKu4Nuv0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xDQUBN1Yob5p2mHvNuP8NMkRjM1wu0oj1shPpVk77LyfhZP3vrYPyimk635c?=
 =?us-ascii?Q?yrEC9uNexxf0/etm5q7StCxM5SkaVPbqQL/eQ3wPfwCz/7huDg4mRkbQBKuw?=
 =?us-ascii?Q?p0AakSxg3RiIX3pjgyq10wfYUD9SCb46Oab5ZI+Kn+joxTtEygjyoC80gT+x?=
 =?us-ascii?Q?USoGF1+2HVUyM6SZC1jFjDo8xtIqgofPFLs1rkcs97qde8pnL7syFLnQbTzf?=
 =?us-ascii?Q?50CmZR32Zqm3d40XH52QpRhdTq/IlSn20YlhM5u8BecXhRyjaNA15M8+uaEm?=
 =?us-ascii?Q?avAB9QhFF1p6H57buJZXwlj+qgtosrNpybZ8nddZLuuoHKF6v2cPao8IeHxi?=
 =?us-ascii?Q?VBM+316o45NngWPKozQ3IMMCUzIeh8JN8OYhVCP4p7pKF9Cz7QA8e0nQU6Zq?=
 =?us-ascii?Q?4vlRPzCw+5fKtNLXDgh8w7w3yN/0SAwG+TelYM6oztzTIQta80ro/BnwbxFJ?=
 =?us-ascii?Q?yLaTcWvU3Z10PIDKxezLWh3OlqZpmaLsVTpy/92yZ2RDklP84UINT4xEX0l8?=
 =?us-ascii?Q?BxjCBnXhyWXH1FVFDX6ui+JZutMbUIa50i4rxuPHpxX8f48bGJaJWzFBGngp?=
 =?us-ascii?Q?XDitXO/ZJTNzbGE3+cqf2Z24npETYsLWpf0sBbSAvZA5cQ3dicT6hF8nrHw7?=
 =?us-ascii?Q?g25SxPjmf/hSm2WngRKZH9Cz5RmK4KZDDwkn1rxzhfUaPNPF2MBm3I8uFlHN?=
 =?us-ascii?Q?SsGyDz6JV29Vi9SgcENG3WYHQcR/djyR13khALMRHBoa7PkeYQ7EFwj37UEd?=
 =?us-ascii?Q?/LtrES8KjgVv4dXes6INCJKAW1PdJKHzIIhboNz4TjXQEqAefm5y6zkTt69o?=
 =?us-ascii?Q?+LR7Yila1eEj1Ci9m6kc0tVW3cz2jYuZYsWMXy5hbaOWAP/vniyZ4q+ig78N?=
 =?us-ascii?Q?RGQq0CbmrhEQcc31KFbYRDlUyGZJ0VIGfZbjFiDx4iP07GoHsPLwoP5UMxCT?=
 =?us-ascii?Q?SGvRDwOiE/L60mRh57+PH72Xq9PttMIrsDDmIVQtz76rg947czYM7bRRfKkg?=
 =?us-ascii?Q?lih/7XDZI+ib1sTHFh8lChTBDV5vhDMIsS0BvKw3kXbE6AZnmz43Rjp+P5Ho?=
 =?us-ascii?Q?vacmY1tuB3yklScDzsXXjBRkH48CCcXr1YS5oC/NNHo1hoM3TCpKrvSatC0k?=
 =?us-ascii?Q?bAwDO9gfzjIII+T3Pc00v4lvOAKAifZGUP7d9Hb7Yew5Md6H28nsSvtBqIo+?=
 =?us-ascii?Q?KGAt32mBAxPznx1ceD0wgqK18w2xdX010anjPlE9PMqIOsK8YaKE3/y4jW9+?=
 =?us-ascii?Q?WV65eJB5dyb9kTL5UUemLB3+jGwbCXdJCNAQ9S/h4m2gqXsL7YBM2fZhUQdy?=
 =?us-ascii?Q?gS16RjtvKLxuyy6ASJVBzWgtXJKZBkG7ipUvPMOxcLa94nipYXLKrwwi9Ijg?=
 =?us-ascii?Q?nY3+NzUVU+MIRqngwh4a8jgVGEJik2KNYGicSCg03gN+R2QFmefZtn6+E/71?=
 =?us-ascii?Q?BRkxLAMXtPvkRA/mLawIxTaX4LxLNbm03EqDKt38caStefbLF9ogWYuWMOYJ?=
 =?us-ascii?Q?WaU2axH1ohLRvHE/1JXxnVU7q7QEn0m4oXvdM+8BihUGpETrePe2EgAZhLhh?=
 =?us-ascii?Q?I4PXyNg/7wOR7395+r2K8sWYb2nMAAo2/Nf4jzQmCzidbMXKVPclJ3+cF1EM?=
 =?us-ascii?Q?QHZs+hwoWJgrAHb5JvHowqo=3D?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 45f0dd66-17dc-46f2-d9f8-08dde64155a0
X-MS-Exchange-CrossTenant-AuthSource: OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 14:44:04.2645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gcYbp6mcHOURbtJ9iPgwza19xGIDpuP3efP74Y6M8kpCLGMeWExq9C903OdjSXwcuE1CWOYHeDRaf1b/LxvOtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZP286MB1847
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_074414_340862_8C1CA802 
X-CRM114-Status: GOOD (  17.96  )
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

its_irq_set_vcpu_affinity() always runs under a raw_spin_lock wait
context, so calling kcalloc there is not permitted and RT-unsafe since
___slab_alloc() may acquire a local lock. The below is the actual
lockdep report observed:

  =============================
  [ BUG: Invalid wait context ]
  6.16.0-rc3-irqchip-next-7e28bba92c5c+ #1 Tainted: G S
  -----------------------------
  qemu-system-aar/2129 is trying to lock:
  ffff0085b74f2178 (batched_entropy_u32.lock){..-.}-{3:3}, at: get_random_u32+0x9c/0x708
  other info that might help us debug this:
  context-{5:5}
  6 locks held by qemu-system-aar/2129:
   #0: ffff0000b84a0738 (&vdev->igate){+.+.}-{4:4}, at: vfio_pci_core_ioctl+0x40c/0x748 [vfio_pci_core]
   #1: ffff8000883cef68 (lock#6){+.+.}-{4:4}, at: irq_bypass_register_producer+0x64/0x2f0
   #2: ffff0000ac0df960 (&its->its_lock){+.+.}-{4:4}, at: kvm_vgic_v4_set_forwarding+0x224/0x6f0
   #3: ffff000086dc4718 (&irq->irq_lock#3){....}-{2:2}, at: kvm_vgic_v4_set_forwarding+0x288/0x6f0
   #4: ffff0001356200c8 (&irq_desc_lock_class){-.-.}-{2:2}, at: __irq_get_desc_lock+0xc8/0x158
   #5: ffff00009eae4850 (&dev->event_map.vlpi_lock){....}-{2:2}, at: its_irq_set_vcpu_affinity+0x8c/0x528
  ...
  Call trace:
   show_stack+0x30/0x98 (C)
   dump_stack_lvl+0x9c/0xd0
   dump_stack+0x1c/0x34
   __lock_acquire+0x814/0xb40
   lock_acquire.part.0+0x16c/0x2a8
   lock_acquire+0x8c/0x178
   get_random_u32+0xd4/0x708
   __get_random_u32_below+0x20/0x80
   shuffle_freelist+0x5c/0x1b0
   allocate_slab+0x15c/0x348
   new_slab+0x48/0x80
   ___slab_alloc+0x590/0x8b8
   __slab_alloc.isra.0+0x3c/0x80
   __kmalloc_noprof+0x174/0x520
   its_vlpi_map+0x834/0xce0
   its_irq_set_vcpu_affinity+0x21c/0x528
   irq_set_vcpu_affinity+0x160/0x1b0
   its_map_vlpi+0x90/0x100
   kvm_vgic_v4_set_forwarding+0x3c4/0x6f0
   kvm_arch_irq_bypass_add_producer+0xac/0x108
   __connect+0x138/0x1b0
   irq_bypass_register_producer+0x16c/0x2f0
   vfio_msi_set_vector_signal+0x2c0/0x5a8 [vfio_pci_core]
   vfio_msi_set_block+0x8c/0x120 [vfio_pci_core]
   vfio_pci_set_msi_trigger+0x120/0x3d8 [vfio_pci_core]
  ...

To avoid this, simply pre-allocate vlpi_maps when creating an ITS v4
device with LPIs allocation. The trade-off is some wasted memory
depending on nr_lpis, if none of those LPIs are never upgraded to VLPIs.

An alternative would be to move the vlpi_maps allocation out of
its_map_vlpi() and introduce a two-stage prepare/commit flow, allowing a
caller (KVM in the lockdep splat shown above) to do the allocation
outside irq_set_vcpu_affinity(). However, this would unnecessarily add
complexity.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v2:
- Fix missing kfree(vlpi_maps) on error path
- Fix missing vlpi_maps NULL initialization
- Add prealloc_vlpi_maps to simplify the if condition
- Fix typo in commit message (s/allcation/allocation/)

v1: https://lore.kernel.org/all/20250827073848.1410315-1-den@valinux.co.jp/
---
 drivers/irqchip/irq-gic-v3-its.c | 33 +++++++++++++++++---------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 467cb78435a9..d4dfb738c226 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -1923,19 +1923,10 @@ static int its_vlpi_map(struct irq_data *d, struct its_cmd_info *info)
 	if (!info->map)
 		return -EINVAL;
 
-	if (!its_dev->event_map.vm) {
-		struct its_vlpi_map *maps;
-
-		maps = kcalloc(its_dev->event_map.nr_lpis, sizeof(*maps),
-			       GFP_ATOMIC);
-		if (!maps)
-			return -ENOMEM;
-
+	if (!its_dev->event_map.vm)
 		its_dev->event_map.vm = info->map->vm;
-		its_dev->event_map.vlpi_maps = maps;
-	} else if (its_dev->event_map.vm != info->map->vm) {
+	else if (its_dev->event_map.vm != info->map->vm)
 		return -EINVAL;
-	}
 
 	/* Get our private copy of the mapping information */
 	its_dev->event_map.vlpi_maps[event] = *info->map;
@@ -2010,10 +2001,8 @@ static int its_vlpi_unmap(struct irq_data *d)
 	 * Drop the refcount and make the device available again if
 	 * this was the last VLPI.
 	 */
-	if (!--its_dev->event_map.nr_vlpis) {
+	if (!--its_dev->event_map.nr_vlpis)
 		its_dev->event_map.vm = NULL;
-		kfree(its_dev->event_map.vlpi_maps);
-	}
 
 	return 0;
 }
@@ -3469,6 +3458,8 @@ static struct its_device *its_create_device(struct its_node *its, u32 dev_id,
 {
 	struct its_device *dev;
 	unsigned long *lpi_map = NULL;
+	struct its_vlpi_map *vlpi_maps = NULL;
+	bool prealloc_vlpi_maps = alloc_lpis && is_v4(its);
 	unsigned long flags;
 	u16 *col_map = NULL;
 	void *itt;
@@ -3506,11 +3497,21 @@ static struct its_device *its_create_device(struct its_node *its, u32 dev_id,
 		lpi_base = 0;
 	}
 
-	if (!dev || !itt || !col_map || (!lpi_map && alloc_lpis)) {
+	/*
+	 * Pre-allocate vlpi_maps to avoid slab allocation under the strict
+	 * raw spinlock wait context of irq_set_vcpu_affinity. This could
+	 * waste memory if no vlpi map is ever created.
+	 */
+	if (prealloc_vlpi_maps)
+		vlpi_maps = kcalloc(nr_lpis, sizeof(*vlpi_maps), GFP_KERNEL);
+
+	if (!dev || !itt || !col_map || (!lpi_map && alloc_lpis) ||
+	    (!vlpi_maps && prealloc_vlpi_maps)) {
 		kfree(dev);
 		itt_free_pool(itt, sz);
 		bitmap_free(lpi_map);
 		kfree(col_map);
+		kfree(vlpi_maps);
 		return NULL;
 	}
 
@@ -3524,6 +3525,7 @@ static struct its_device *its_create_device(struct its_node *its, u32 dev_id,
 	dev->event_map.col_map = col_map;
 	dev->event_map.lpi_base = lpi_base;
 	dev->event_map.nr_lpis = nr_lpis;
+	dev->event_map.vlpi_maps = vlpi_maps;
 	raw_spin_lock_init(&dev->event_map.vlpi_lock);
 	dev->device_id = dev_id;
 	INIT_LIST_HEAD(&dev->entry);
@@ -3546,6 +3548,7 @@ static void its_free_device(struct its_device *its_dev)
 	list_del(&its_dev->entry);
 	raw_spin_unlock_irqrestore(&its_dev->its->lock, flags);
 	kfree(its_dev->event_map.col_map);
+	kfree(its_dev->event_map.vlpi_maps);
 	itt_free_pool(its_dev->itt, its_dev->itt_sz);
 	kfree(its_dev);
 }
-- 
2.48.1


