Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6602CD98F0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 06:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eajvXvr50g1H4LNxkW5m8CPKkkeKdI+ZUSd61mKjtw4=; b=osYjSr41bRsKxxQ46r2j9GQI2g
	q2aVCJi+9ER/A6qgerpP3DiUuRgEOrWMz83pKKQauM6ryaUhyigUsHndkZ9psFetSeL2qHPSeLoro
	SOkU0clEgT67YGZsALd6FmP2WT6yA6Ef/Z0lJJOj00zljuvN5cDu8GGxXAHgPkt6UhhjftY58oDaf
	pP1dhXqZygxLohcXscnxN9iPH6k2xSqdojFZExtidlEzz9ci3GOvtTgTHNjcbGzNEgJsGFaft0fJy
	aaiKrfzgEi6XJwzP1gEdJSSP1dnLgbfMDNMx1afkm0ARLWdUd0T6lVdQ5ZGkDe4VtKOTi7msvfdMj
	LPtgD5cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZk27-0000000GjWb-1zdW;
	Wed, 17 Jun 2026 06:45:55 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZk1z-0000000GjV5-3kLA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 06:45:53 +0000
X-UUID: 2398b8fc6a1811f1aa26b74ffac11d73-20260617
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:cb92b188-edee-4008-960f-da707e1a66de,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:e7bac3a,CLOUDID:ee5f5aae7fb843cb12b433e46f0a2182,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:
	0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2398b8fc6a1811f1aa26b74ffac11d73-20260617
Received: from localhost [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <pengyu@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1400977214; Wed, 17 Jun 2026 14:45:33 +0800
From: Yu Peng <pengyu@kylinos.cn>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	linux-acpi@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [RFC] arm64: early_ioremap fails to map ACPI MADT on 64K pages
Date: Wed, 17 Jun 2026 14:01:10 +0800
Message-Id: <20260617060110.2846851-1-pengyu@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_234552_153674_3C594B04 
X-CRM114-Status: UNSURE (   7.95  )
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

Hi all,=0D
=0D
I hit an early boot failure on an arm64 system built with 64K pages while=0D
parsing the ACPI MADT.=0D
=0D
The failing system reports:=0D
=0D
  PAGE_SIZE: 64K=0D
  MADT physical address: 0x5a7ae018=0D
  MADT length: 0x32094=0D
=0D
The failure happens when acpi_table_parse_madt() calls into early_memremap(=
)=0D
via __acpi_map_table(). The MADT itself is smaller than 256K, but its=0D
placement causes the early mapping to require 5 64K pages:=0D
=0D
  offset within 64K page =3D 0x5a7ae018 & 0xffff =3D 0xe018=0D
  mapped range           =3D PAGE_ALIGN(0xe018 + 0x32094)=0D
                         =3D PAGE_ALIGN(0x400ac)=0D
                         =3D 0x50000=0D
  nrpages                =3D 0x50000 / 0x10000 =3D 5=0D
=0D
On arm64, NR_FIX_BTMAPS is currently derived from a 256K per-slot budget:=0D
=0D
  #define NR_FIX_BTMAPS        (SZ_256K / PAGE_SIZE)=0D
=0D
So for 64K pages, NR_FIX_BTMAPS is 4. The mapping therefore fails the=0D
early_ioremap() check:=0D
=0D
  if (WARN_ON(nrpages > NR_FIX_BTMAPS))=0D
          return NULL;=0D
=0D
After that, MADT parsing fails and the boot continues with symptoms such as=
:=0D
=0D
  ACPI: APIC not present=0D
  missing boot CPU MPIDR, not enabling secondaries=0D
  Kernel panic - not syncing: No interrupt controller found.=0D
=0D
A firmware change can avoid this by placing MADT so that:=0D
=0D
  (madt_phys & 0xffff) + madt_length <=3D SZ_256K=0D
=0D
However, I do not think ACPI requires such placement, so this looks like a=
=0D
kernel-side robustness issue as well, especially on large arm64 systems whe=
re=0D
MADT can grow with CPU topology.=0D
=0D
One possible kernel-side change is to increase the boot-time mapping budget=
 for=0D
CONFIG_ARM64_64K_PAGES, for example using a 512K per-slot budget only in th=
at=0D
configuration. I do not think this should be applied unconditionally to all=
=0D
page sizes, since the arm64 early fixmap code expects the boot-ioremap rang=
e=0D
to stay within one PMD.=0D
=0D
Has anyone seen similar failures on arm64 64K systems?=0D
=0D
Would maintainers prefer treating this as a firmware layout issue, or would=
=0D
increasing the early_ioremap budget for 64K pages be acceptable?=0D
=0D
Thanks,=0D
Yu Peng=0D

