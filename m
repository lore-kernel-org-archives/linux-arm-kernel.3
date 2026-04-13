Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 778FEEBFD3B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 11:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ACHyeCz3q0L02P9iJcdr/1GrS5P6Wz/dHH0R9LKf1Ws=; b=cJ5vA51eR1tZf6YETz84hwlBsF
	S0I0Za1ctRbbXNKfYgfv3xjUQSzrNKfDNtLUFpo8zSCxqqCesbawuvGeUXkID7DnzRt3mkwdH58ws
	vTU4057V1XyNp1e5CLfKvhEzu2kVjdYQiUv2x+WZsMfpr7p74Ahq196si+0jXRyA6zJwhj+vvYdsf
	IM4MoIaLhWFeiLdnKu+7rx7r0/M4UztSelL96zBSDH09pgB6S0KzKMdyMMj9goy2pb+GSOmAZQofx
	vp3Y+mv/njeiYVb7Xo4h3/PP4IUSDOtFl1tEq+VXWvukz2EuNjpBm2VGE8zkIXGkaZxI6H02h/Kr+
	M0f4qrwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCFIu-0000000FYyO-1ULz;
	Mon, 13 Apr 2026 11:18:08 +0000
Received: from mail-westus3azlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c107::1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCFIr-0000000FYxS-0OW4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 11:18:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PdaD4W9vZ0xv0wQ+KtPbDlCjpaUxMnVmncqmJ/4dPAxcMRQL3fZQa+zD0zgPLnJN+fUgxaVLIg5+gLAgjHzPh9Odeq5SPS4gwSxFBgC8aVzBmd85e1cvK01Ds5XRiEBB5vkouTgdVuCThFVk/j/31BeK3ZVp77oMPQUlQmDxISA8lFPQBEF1Td48eyXnY+kavFWnUEL+w0O6MY/jVdTvzC10PXkOhswcyf1We17QXgRfQ7l4Szr89Gk/BTw05M3CzgjAVuZp1J181B7k2uehhP/5Ryt++n7imhLbGWOWmkR/2obC8AVNc1ArX0dkpWYDkVp5hE/BD5nAkY+xT166sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ACHyeCz3q0L02P9iJcdr/1GrS5P6Wz/dHH0R9LKf1Ws=;
 b=WV9NPpRA44r8SGv8xaOExnN8W1S2IfjZBNg1DM7XO++SOlx64xHBkjOmD7GRCkD8HACSzxpbJcI1YBGq5vi5FkJc6v+K2X8Yz7vg3bDxeuIBhRjwCmSLlcL7lb0y7EadNQsMdeVxDb398bVPRunAvxsUIgN8M+yh49gYDE/iUex3w/mA4EUU7GwLb4EcMaunQKuVV4HFZvbaxB78N+Emx/4E252H8j6oVLlLNOPAX1BqDZ5XuvAd8W5sS/SwwdOzV+o4ba9kQhVr1kIInbgmPtLxIHJNUUcb2TxsSHMBgnW2TUnT9K3QajBe6Fmm0DYYBApsGjoYvao5LTUv6GgNSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ACHyeCz3q0L02P9iJcdr/1GrS5P6Wz/dHH0R9LKf1Ws=;
 b=K7eHrx6pW2qPYMO9KCRr49utqciIU7abanCw7aUr8T5KDBsVOohSRYXpkDadkrYwAnqjgV/5k7y+1fJ0ah0MRU+Pv+CzUVKRVLUJLeHu5rM6WRxmlpKUvQSDVMlOX7OgB4iKyUE+9tk6Wyy1KZOeq6Ixd5L30AM10NyksaQYpTxGX0jD5A3SRcMlrxuGBPfQi5MbrnxSWsuySueOk6MH2vOcTG6LhNsiFC/IHCn43Gkj8phlSOSWrfWvgZoAHKSvCtjJr3Jw1mC98nbiz/e0QCF3o6PPGL4L26myPbCR+gllPEiE6+JI1YCghm8FouhpGktBiPSmKsGn4xrc99cTzg==
Received: from BLAPR05CA0017.namprd05.prod.outlook.com (2603:10b6:208:36e::29)
 by LV3PR22MB5869.namprd22.prod.outlook.com (2603:10b6:408:271::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 11:18:00 +0000
Received: from BL02EPF00021F6D.namprd02.prod.outlook.com
 (2603:10b6:208:36e:cafe::fa) by BLAPR05CA0017.outlook.office365.com
 (2603:10b6:208:36e::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Mon,
 13 Apr 2026 11:17:59 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=mkerelay2.compute.ge-healthcare.net;
Received: from mkerelay2.compute.ge-healthcare.net (165.85.157.49) by
 BL02EPF00021F6D.mail.protection.outlook.com (10.167.249.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Mon, 13 Apr 2026 11:17:59 +0000
Received: from zoo11.fihel.lab.ge-healthcare.net (zoo11.fihel.lab.ge-healthcare.net [10.168.174.93])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with SMTP id C8602131E4;
	Mon, 13 Apr 2026 14:17:56 +0300 (EEST)
Date: Mon, 13 Apr 2026 14:17:56 +0300
From: Brian Ruley <brian.ruley@gehealthcare.com>
To: Will Deacon <will@kernel.org>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	Steve Capper <steve.capper@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	catalin.marinas@arm.com
Subject: Re: [PATCH] mm/arm: pgtable: remove young bit check for
 pte_valid_user
Message-ID: <adzQ5Dvof274_o6J@zoo11.fihel.lab.ge-healthcare.net>
References: <20260409125446.981747-1-brian.ruley@gehealthcare.com>
 <adewJetUv6wMiz9o@willie-the-truck>
 <adfDEMK8EbIjPu3J@zoo11.fihel.lab.ge-healthcare.net>
 <adfNN33QIOP3VfDm@shell.armlinux.org.uk>
 <adjYlUk8_JjPivNi@zoo11.fihel.lab.ge-healthcare.net>
 <adzMOdySgMIePcue@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adzMOdySgMIePcue@willie-the-truck>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6D:EE_|LV3PR22MB5869:EE_
X-MS-Office365-Filtering-Correlation-Id: cc302593-5d86-4b08-d447-08de994e51f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|13003099007|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: AOvIe9U7g9DzfT+7loGaXDZAw8DCGcsRaERIw+hMNAiVN2o3piWpQsC0tg0VTiNNk9UMQZeIz0GGvpJoaVpKz/wBiOomjdoY7QeJMuNU4iZAjB9LuoINkHsLtuWKOJFYDXtYZ7g5R/7TcB59MZwOV21uLCvu6CymPrMfuZnhUli5AJ0ZwxhRTLwvWrkrqQpyoihm922aTWl1DdI0yYEK+/rdmNkCQpeVIGQB4GkOIiSpNJfKF8nhwX4v4CrMwJhzrZ53oGSKRc5CD3XTlk+rghxfvxtJxu+4U5m0WCRzr6izdzDz2ykpDYKlSdbOEHuWHA9AxtjmBXzejJaLsQaBlZUCsat7eyhXz6Ub+z5T9+84qlBYNiKvQS2GfAbR0xWzmruYak2c5QWIa6CdiMMQNqjPQgHE30XxmYLpfjooSmmvhYMzonyVFjRg3xqXBN0tI1kWmVWcZ6AmvxddeGtO1u0rAJJBBoVUAvhZ932gjjQ3dUJrnPa02j96xg/3jljU+91nIeJ3c+NkdvIjnTtJFbhmx538bioV7o9LX8RXfjEUcHF/1tNfdjIJtSnu5sBjDlHMC2/9kDIPdHNhD3REAysU2clenQcoQoYViT4OkBSQA8zlyNt8cr8ck88pNvXifIOdGXugtg6fMoppGG2MgpmgN9qzBx46+BQai879eC5war6HpgRTtPUNlM/IY59eLTGvsQJsQsnISVYw46thbJ1Q27ygN8qwbZj8YNg3xWa4iOv4cAO5TXlmeEZCoDXFLPqLTuv3DgTa63PtDq27TQ==
X-Forefront-Antispam-Report: CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mkerelay2.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(13003099007)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: gVOlQa03LoYM6LvIcqMfORPvES1/MbvMV744dHk++XFOaWgxYzo2/fRKAkVReKSjoFcVa25BKjCzx7KHoRGVk/65HoZJZVcXqoTs6l1/JK+47Gxlb+Md/gKuyEr8UQrUJOYAvv2BAXQbF0TbDEdLkd/WNeSLDxqIpNzTljlAvueBMPK8UFcDDXkMV1xg5HT24eqetfzzNDrtxko+s0/J8FAfU4LsPmib1bwV3TYpQXpq5g1Tze7K+DLjXB7RQETobO9gOjT6OBBaOHD2ZyeHjgrDpDlaYxirUIsHhBu+lO18wvKfZOZU0LUW8sfcj0JcWIAmozt+qVmt8/NK/T2W4A2vSD1jSYOhiSncoWo7P1j58yyB5OUAy/IN0gomjIZ8snQIj5yyjp+Mwz+Tk3lQLS0+j/FGKqdi1vLc7pWb8bpD94zecWeEn+cTFtF6RvHf
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 11:17:59.2462
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc302593-5d86-4b08-d447-08de994e51f4
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[mkerelay2.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL02EPF00021F6D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR22MB5869
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_041805_145320_826D4553 
X-CRM114-Status: GOOD (  42.98  )
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

On Apr 13, Will Deacon wrote:
> 
> On Fri, Apr 10, 2026 at 02:01:41PM +0300, Brian Ruley wrote:
> > On Apr 09, Russell King (Oracle) wrote:
> > >
> > > On Thu, Apr 09, 2026 at 06:17:36PM +0300, Brian Ruley wrote:
> > > > However, in the case I describe, if VA_B is mapped immediately to pfn_q
> > > > after it been has unmapped and freed for VA_A, then it's quite possible
> > > > that the page is still indexed in the cache.
> > >
> > > True.
> > >
> > > > The hypothesis is that if
> > > > VA_A and VA_B land in the same I-cache set and VA_A old cache entry
> > > > still exists (tagged with pfn_q), then the CPU can fetch stale
> > > > instructions because the tag will match. That's one reason why we need
> > > > to invalidate the cache, but that will be skipped in the path:
> > > >
> > > >     migrate_pages
> > > >      migrate_pages_batch
> > > >       migrate_folio_move
> > > >        remove_migration_ptes
> > > >         remove_migration_pte
> > > >          set_pte_at
> > > >           set_ptes
> > > >            __sync_icache_dcache  (skipped if !young)
> > > >             set_pte_ext
> > >
> > > In this case, if the old PTE was marked !young, then the new PTE will
> > > have:
> > >         pte = pte_mkold(pte);
> > >
> > > on it, which marks it !young. As you say, __sync_icache_dcache() will
> > > be skipped. While a PTE entry will be set for the kernel, the code in
> > > set_pte_ext() will *not* establish a hardware PTE entry. For the
> > > 2-level pte code:
> > >
> > >         tst     r1, #L_PTE_YOUNG        @ <- results in Z being set
> > >         tstne   r1, #L_PTE_VALID        @ <- not executed
> > >         eorne   r1, r1, #L_PTE_NONE     @ <- not executed
> > >         tstne   r1, #L_PTE_NONE         @ <- not executed
> > >         moveq   r3, #0                  @ <- hardware PTE value
> > >  ARM(   str     r3, [r0, #2048]! )      @ <- writes hardware PTE
> > >
> > > So, for a !young PTE, the hardware PTE entry is written as zero,
> > > which means accesses should fault, which will then cause the PTE to
> > > be marked young.
> > >
> > > For the 3-level case, the L_PTE_YOUNG bit corresponds with the AF bit
> > > in the PTE, and there aren't split Linux / hardware PTE entries. AF
> > > being clear should result in a page fault being generated for the
> > > kernel to handle making the PTE young.
> > >
> > > In both of these cases, set_ptes() will need to be called with the
> > > updated PTE which will now be marked young, and that will result in
> > > the I-cache being flushed.
> >
> > Hi Russell,
> >
> > Thank you for the clarification, this is very educational for me.
> > I understand your scepticism, and I can't explain what's going on based
> > on what you replied. However, I do honestly believe there is a problem
> > here. I'll share the exact testing details and the instrumentation
> > we added that convinced us to reach out at the end. One idea we also
> > had was that could cache aliasing be happening here.
> 
> I thought a bit more about this over the weekend and started to wonder
> if there's a potential race where multiple CPUs try to write the same
> PTE and don't synchronise properly on the cache-maintenance.
> 
> In particular, PG_dcache_clean is manipulated with a test_and_set_bit()
> operation _before_ the cache maintenance is performed, so there's a
> small window where the flag is set but the page is _not_ clean. I don't
> think that matters with regards to invalid migration entries, but
> perhaps the migration just means that we end up putting down a bunch of
> 'old' entries and are then more likely to see concurrent faults trying
> to make the thing young again, potentially hitting this race.
> 
> Looking at arm64 this morning, I noticed that we split the flag
> manipulation so that it's set with a set_bit() after the maintenance has
> been performed. Git then points to 588a513d3425 ("arm64: Fix race
> condition on PG_dcache_clean in __sync_icache_dcache()") which seems to
> talk about the same race. In fact, the mailing list posting:
> 
>   https://lore.kernel.org/all/20210514095001.13236-1-catalin.marinas@arm.com/
> 
> points out that arch/arm/ is also affected but we forgot to CC Russell
> because I think this all came out of the MTE-enablement work [1] and it
> sounds like Catalin was trying to fix it in the core mprotect() code.
> 
> Brian, can you try something like 588a513d3425?
> 
> Will
> 
> [1] https://lore.kernel.org/all/YJGHApOCXl811VK3@arm.com/

I'll try it, thanks.  

Best regards,
Brian

