Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC8DACD8CAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 21:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3vpMP1hC5hnI3ic9GLLuS7TyU3vsp3ngrcD7NPJ4aiA=; b=qIa8NKeT8BQRmpY2tFXxv4PjpL
	828iAUNysSmimG2VsDcjsoGhSB1tWWhqKUGZrbXMdul3o5fpIxr9j3Z4HJoUAKAEIdUy68RQY6zmS
	0gu9uTaPsC0AWhWh3iuTZk30Q9wXpT2+F7ZX90OvyAWm5z/871gsQtlQY8QycFaoBbjDQWaybyb4o
	awK24ji21u1III3UYefEueHfmlOW1i4jFRV5iZc/pBKZGqMTp5sdsv01In3mawEhaHHMk0uzjwNDy
	7GbCjlSp//FVxDAEbwsnBnE7NQp2SEeamKML1P+Arld7eRyOcUllMR78yOnpvI/4fyRuo6GsUGwGi
	Vwf37hLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX47o-00000006Ou5-18av;
	Tue, 09 Jun 2026 21:36:44 +0000
Received: from gentwo.org ([62.72.0.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX47l-00000006Otn-3AnR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 21:36:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1781040999;
	bh=gG7rLy2eP1mY+B71/Mdf6KsX1rRf4FXYjJAwtUdOfdQ=;
	h=From:To:Cc:Subject:Date:From;
	b=Eta3a0uUBl1LvGdCI0DbF2FMOrRo9rzDrUzp82yNsA7o0mBqW6N4V3BAeXHtCe5rx
	 YrzefV+5w7y0H7nu1dpe8XZ86QTLGOYxyRk68zzskQmHkJqYqcOx9kuBU/RsK2m5bf
	 DkJoTpuxHX6XNPxzaZhvNaK9pGNXeIrFUpZyNlhM=
Received: by gentwo.org (Postfix, from userid 1012)
	id D7A48402C4; Tue, 09 Jun 2026 14:36:39 -0700 (PDT)
From: sk@gentwo.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Mike Rapoport <rppt@kernel.org>,
	Dev Jain <dev.jain@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	cl@gentwo.org
Subject: arm64: tlbflush: Reset active_cpu on ASID rollover 
Date: Tue,  9 Jun 2026 14:34:31 -0700
Message-ID: <20260609213615.2788698-1-sk@gentwo.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_143641_857669_5FDA31FB 
X-CRM114-Status: UNSURE (   6.83  )
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


Hi all,

This series is based on arm64: tlbflush: Don't broadcast if mm was only active on local cpu, specifically on commit(s) starting from https://lore.kernel.org/linux-arm-kernel/20260523134710.3827956-1-linu.cherian@arm.com/. 

Changes since the previous posting: 
* Reset active_cpu to ACTIVE_CPU_NONE when a new ASID is assigned after rollover, so we don’t remain stuck in ACTIVE_CPU_MULTIPLE when the workload later settles back to one CPU. 
* Rely on the fact that flush_context() already issues a global TLB flush at ASID assignment after rollover, ensuring there are no stale TLB entries on any CPU. 
* This restores a fresh chance for processes to take the local-only flush fast path after each ASID generation rollover.

Series overview: 
* Patch 1/2: arm64: tlbflush: Reset active_cpu on ASID rollover 
* Patch 2/2: arm64: tlbflush: Don't broadcast if mm was only active on local cpu

Thanks, 
Sayali Kulkarni 
sskulkarni@amperecomputing.com (Ampere)

