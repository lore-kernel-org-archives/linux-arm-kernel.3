Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF23F31E24
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 15:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fkDdxDUbX2HsgaIt26d2ThmX3RrpwAJVbCMDE8hRHvk=; b=pE3IILCQWzHT4xPMU4aAZYi488
	RFoFzfLxI1W4tFZdo8HRciqd6iKmPpK7YNyIghmMyMd6EwbfRFDO8IwdnPBtzCcadh3gWTkOQwr70
	f96hEyI/hpPm6bCudOWcAfbD263/Q56rfC843HAqBMq9VFPAzLN8pJu9VPIl9Iaik7jYreirXb5Wt
	BEUcfIxKc7eHSmm9SvCNjwO0HCkgXTB2NYdFjGlCQvtaXA7lOeANYQD0tmDlrjq7LXZ+1EAXuUwDG
	CkNoPBRBhWRpocgP9YMoRaWxstvza4lGvsa1RfIxjZTbdcOAej1vPDlGQ8ZYyWfpqBgsyvJrjq8+m
	DZbXyJuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAr8e-0000000Amc3-1XV7;
	Thu, 09 Apr 2026 15:17:48 +0000
Received: from mail-westus3azon11010013.outbound.protection.outlook.com ([52.101.201.13] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAr8b-0000000AmbV-2HGA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 15:17:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bYgOOHqrraztSGd7pp6zCg/3LxEhvowhQOY6jEiQWsUD9V3o/wdaliKmd3mPZFULqffpgwYKhNbeoOE4wTtvZSQs3lNrxs3Yei9x8Aoljg7kw0Bxl+v3eZJs2V2hxar5N9a+5gHhyo+GfSRUzxv/JO5jJtiRWp38w6BOisZ5MkBo8WSmJWvv1U1uXW1CNiUGTLyrHwZgPotL1uFTBp6ziSLqqMNuY6UzLZJlcNHoLfZ2FU2aOjlS1bDq+uOhOaQx4K8K96FLrEzp2LnVq09zm2KuqNcqE29Cp1MCNEx8JByJ/N0W3XbfMuttQy2z15i4N+rrf0SCTP/PcfIYSgemgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fkDdxDUbX2HsgaIt26d2ThmX3RrpwAJVbCMDE8hRHvk=;
 b=UPMxTYtuH93PIXZI82M+pjaL+GrNhyOVDNr/g5DIh3Phk9FiHHqHV20SsyXWAmSF25FhoJuQAqZ4rc8nT9j7ni6MN/LS7R7e660nUVpZ/VsCL7+LkYT63iTzbE8+NnYuiX4v52ltcpUoVS+aiLyAwLzNxgqImoobHStSJaU60o7FenWFUUmtNFL4b/zXpek80/l1jvWyL68OjbTWSdQXrVvK7DsyygDPmdEmkXV1qfeZAA/pvKjVap2tLPE4LTpzDnvGEOUU+h8Ury7xv9aoicpVcnvr2QczMJHs76ZbNp1quGlNmb/3K3fJgzlPtX0bs1+WOvLv3vY2DOt43qvPKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fkDdxDUbX2HsgaIt26d2ThmX3RrpwAJVbCMDE8hRHvk=;
 b=bDpM1hLh8FdB1tMpH1YYB4bJXBPHcxuQP5bmtpLkDYfm6+Wi5c592G/KlwfYeNUXfD2tPt/sqSgge67dxHrl9Q67iHBPhSU6vx8D1C2l2dmr4y8byLaURr6tjtf1F7rbHv9eWRjh5PemjVwjVJmmdNi2A/g1DbkHr+ae+6qWR+cqFwdRhii58EeinXpgrqqM8Ol3tNa8jPHWvjbAcsapZ0PuoYjcYaOY8hWj+voYyb0EcU5Ku65QPsT8txVl0wmeijz8nnEjDqG2ZBXB8W+g4TTgNd4KOQ+vQsHki0DnHOU8bCUhvCrBx5xvJhgS+uY3uP/+okgziAdb5pgMK7n+yw==
Received: from BY3PR05CA0059.namprd05.prod.outlook.com (2603:10b6:a03:39b::34)
 by SA1PR22MB4745.namprd22.prod.outlook.com (2603:10b6:806:3cd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Thu, 9 Apr
 2026 15:17:40 +0000
Received: from CO1PEPF000066EC.namprd05.prod.outlook.com
 (2603:10b6:a03:39b:cafe::38) by BY3PR05CA0059.outlook.office365.com
 (2603:10b6:a03:39b::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.40 via Frontend Transport; Thu,
 9 Apr 2026 15:17:39 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=mkerelay1.compute.ge-healthcare.net;
Received: from mkerelay1.compute.ge-healthcare.net (165.85.157.49) by
 CO1PEPF000066EC.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 9 Apr 2026 15:17:39 +0000
Received: from zoo11.fihel.lab.ge-healthcare.net (zoo11.fihel.lab.ge-healthcare.net [10.168.174.93])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with SMTP id BDF6CE57CC;
	Thu,  9 Apr 2026 18:17:36 +0300 (EEST)
Date: Thu, 9 Apr 2026 18:17:36 +0300
From: Brian Ruley <brian.ruley@gehealthcare.com>
To: Will Deacon <will@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>,
	Steve Capper <steve.capper@arm.com>,
	Russell King <rmk+kernel@arm.linux.org.uk>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/arm: pgtable: remove young bit check for
 pte_valid_user
Message-ID: <adfDEMK8EbIjPu3J@zoo11.fihel.lab.ge-healthcare.net>
References: <20260409125446.981747-1-brian.ruley@gehealthcare.com>
 <adewJetUv6wMiz9o@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adewJetUv6wMiz9o@willie-the-truck>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EC:EE_|SA1PR22MB4745:EE_
X-MS-Office365-Filtering-Correlation-Id: 4892cdb2-35b5-4313-cfef-08de964b238c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: m6eABwMTUGNAPPJ9mEylLXwZmLYCBvg7rF0cit6i9LQ+bTX0Im7K4C4V44rn+KY6zpWIku0vxe1zZ3OBBzubbec9u84ApxXAwz+OVnM2xEQ8U4k8P+Lv5nGwQwO0aeFiMUMojrnmVh9hGouAmQpy3KmFXR3y7HX4tzGuvTTewyeLVn6AxP8Iq8Unu4BkL5CCXTok7HeeqK9sIFrgxqu1HfBLImjdbTo4beGOni1VPViIEZtT90K8jnOxAFMbIUtXf7AZfwlkpR9afH6aGkiMYa2tDIhnAdeqe/ym3MOaG/tw2SjTLPlshyZKSaAefibXTZ4PHyj+ME8Db9K7nwR8ofc0i9srf9zNOO0x5b3atbcz07ZSw4G33nOdUpWZT2L7x6fRZjXTQ/6j628A4Dwe/vIPbnU1J4tV4nCHjmbyTlNl9tMXdrtciQ+sPwlk3xUECV/Wng7wCR3ytzM7Yx5lYIYKQq74LGvP/al/VDs3x6tvsgaTA+Dow5YM0nla1nM6paI6lJ7vNTd11oCyUpcbkB9U+rgXoZRqfAVH93IrrgrZc97jRfbdKOr+rAEvXlMCyKwOmIxMEbvsfnocXQXO+dTkqzDgUBKc8HuM3prOa6OHEuyWQv+oyMgGVUcUVUbzHLi4PjzE9kGjTV/a1f8rPFmZXOPUGpYfzu+x2WZRZjtEHWCFUcIwQdhNo6aFgHr1ogN4mWzr+rgMxgCrx8mhqr2oEE388D99kD8EZpYFtBIgV2NtqxjRtfxAg5FRJ2eJFkxlHo0gqLlXzzGcIbOzzA==
X-Forefront-Antispam-Report: CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mkerelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: bzS4duv5TPlifPT9tAT3+FE8pF66ZzbIvsL044tAlhap1k1Ey9NLStjLSz256KoRTHUeuLapFN5RR9p9CHJfujKCMqSwnqSnsUkuTzPfuBJsqFL0sv7B+2Q9ZscnGzGRSMrLgXsYf/6z4mq/nw0jv6xssDBG0DrhXt4tfS0aZWBvY+MlDmMMMuF5ugZzKTQJy3K7uWdvsB/U4DA/qR7rYZUetk0daXUFeocOTDDWtqb47VU6vvg068oFJoYXFMakeZia1DDVeR8T9v6YYD+eIsK/eiW6EPxhP+9pAfA8Zoc7lnoeW6gtlEHZ8CQ5zYncX4iinna+P7BXbxNGcQKKkvd4Ylv6fu72a8NSBM7Qf1Q2h6MaVUJh2rct3tBlG84H2oQn+G9CMwwZZoD/RTbRe7WI8kVCJYmKVqiw6Q6u36kSQftaau+wYmsKUiiQyilv
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 15:17:39.3233
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4892cdb2-35b5-4313-cfef-08de964b238c
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[mkerelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF000066EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR22MB4745
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_081746_333153_5AB28A4C 
X-CRM114-Status: GOOD (  44.19  )
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

On Apr 09, Will Deacon wrote:
> 
> On Thu, Apr 09, 2026 at 03:54:45PM +0300, Brian Ruley wrote:
> > Fixes cache desync, which can cause undefined instruction,
> > translation and permission faults under heavy memory use.
> >
> > This is an old bug introduced in commit 1971188aa196 ("ARM: 7985/1: mm:
> > implement pte_accessible for faulting mappings"), which included a check
> > for the young bit of a PTE. The underlying assumption was that old pages
> > are not cached, therefore, `__sync_icache_dcache' could be skipped
> > entirely.
> >
> > However, under extreme memory pressure, page migrations happen
> > frequently and the assumption of uncached "old" pages does not hold.
> > Especially for systems that do not have swap, the migrated pages are
> > unequivocally marked old. This presents a problem, as it is possible
> > for the original page to be immediately mapped to another VA that
> > happens to share the same cache index in VIPT I-cache (we found this
> > bug on Cortex-A9). Without cache invalidation, the CPU will see the
> > old mapping whose physical page can now be used for a different
> > purpose, as illustrated below:
> >
> >                 Core                      Physical Memory
> >   +-------------------------------+     +------------------+
> >   | TLB                           |     |                  |
> >   |  VA_A 0xb6e6f -> pfn_q        |     | pfn_q: code      |
> >   +-------------------------------+     +------------------+
> >   | I-cache                       |
> >   |  set[VA_A bits] | tag=pfn_q   |
> >   +-------------------------------+
> >
> > migrate (kcompactd):
> >   1. copy pfn_q --> pfn_r
> >   2. free pfn_q
> >   3. pte: VA_a -> pfn_r
> >   4. pte_mkold(pte) --> !young
> >   5. ICIALLUIS skipped (because !young)
> >
> > pfn_src reused (OOM pressure):
> >   pte: VA_B -> pfn_q (different code)
> >
> > bug:
> >                 Core                      Physical Memory
> >   +-------------------------------+     +------------------+
> >   | TLB (empty)                   |     | pfn_r: old code  |
> >   +-------------------------------+     | pfn_q: new code  |
> >   | I-cache                       |     +------------------+
> >   |  set[VA_A bits] | tag=pfn_q   |<--- wrong instructions
> >   +-------------------------------+
> 
> (nit: Do you have pfn_r and pfn_q mixed up in the "Physical Memory" box?)

No, I don't think so. The intent was to show that whatever was copied
from pfn_q is now in pfn_r while the old page (pfn_q) is now mapped to
VA_B with new code/data. Maybe a classic case of poor naming on my part
here. :-)

> 
> > This was verified on ba16-based board (i.MX6Quad/Dual, Cortex-A9) by
> > instrumenting the migration code to track recently migrated pages in a
> > ring buffer and then dumping them in the undefined instruction fault
> > handler. The bug can be triggered with `stress-ng':
> >
> >   stress-ng --vm 4 --vm-bytes 2G --vm-method zero-one --verify
> >
> > Note that the system we tested on has only 2G of memory, so the test
> > triggered the OOM-killer in our case.
> >
> > Fixes: 1971188aa196 ("ARM: 7985/1: mm: implement pte_accessible for faulting mappings")
> > Signed-off-by: Brian Ruley <brian.ruley@gehealthcare.com>
> > ---
> >  arch/arm/include/asm/pgtable.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm/include/asm/pgtable.h b/arch/arm/include/asm/pgtable.h
> > index 6fa9acd6a7f5..e3a5b4a9a65f 100644
> > --- a/arch/arm/include/asm/pgtable.h
> > +++ b/arch/arm/include/asm/pgtable.h
> > @@ -185,7 +185,7 @@ static inline pte_t *pmd_page_vaddr(pmd_t pmd)
> >  #define pte_exec(pte)                (pte_isclear((pte), L_PTE_XN))
> >
> >  #define pte_valid_user(pte)  \
> > -     (pte_valid(pte) && pte_isset((pte), L_PTE_USER) && pte_young(pte))
> > +     (pte_valid(pte) && pte_isset((pte), L_PTE_USER))
> 
> This patch is from twelve years ago, so please forgive me for having
> forgotten all of the details. However, my recollection is that when using
> the classic/!lpae format (as you will be on Cortex-A9), page aging is
> implemented by using invalid (translation faulting) ptes for 'old'
> mappings.
> 
> So in the case you describe, we may well elide the I-cache maintenance,
> but won't we also put down an invalid pte? If we later take a fault
> on that, we should then perform the cache maintenance when installing
> the young entry (via ptep_set_access_flags()). The more interesting part
> is probably when the mapping for 'VA_B' is installed to map 'pfn_q' but,
> again, I would've expected the cache maintenance to happen just prior to
> installing the valid (young) mapping.
> 
> Please can you help me to understand the problem better?
> 
> Will

Hi,

I am, by no means, a domain expert either so I'll be deferring to your
judgement. That said, I believe what you said is correct and the
expectation is that we will later fault and then flush the cache and
fault.

However, in the case I describe, if VA_B is mapped immediately to pfn_q
after it been has unmapped and freed for VA_A, then it's quite possible
that the page is still indexed in the cache. The hypothesis is that if
VA_A and VA_B land in the same I-cache set and VA_A old cache entry
still exists (tagged with pfn_q), then the CPU can fetch stale
instructions because the tag will match. That's one reason why we need
to invalidate the cache, but that will be skipped in the path:

    migrate_pages
     migrate_pages_batch
      migrate_folio_move
       remove_migration_ptes
        remove_migration_pte
         set_pte_at
          set_ptes
           __sync_icache_dcache  (skipped if !young)
            set_pte_ext

And migrated pages are always marked old:

mm/migrate.c=static bool remove_migration_pte(struct folio *folio,
mm/migrate.c:           if (!softleaf_is_migration_young(entry))
mm/migrate.c:                   pte = pte_mkold(pte);

include/linux/leafops.h:
static inline bool softleaf_is_migration_young(softleaf_t entry)
{
        VM_WARN_ON_ONCE(!softleaf_is_migration(entry));

        if (migration_entry_supports_ad())
                return swp_offset(entry) & SWP_MIG_YOUNG;
        /* Keep the old behavior of aging page after migration */
        return false;
}

I might be misunderstanding something, this took us a while to figure
out. But the patch seems to work for us. I hope I explained it a bit
better now.

Best regards,
Brian

