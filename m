Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D689EC53200
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 01:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JKw66HKdsaS/PQV3GJ9p5S0FHALmKAlK3dZMai4BQBA=; b=tg/HbvAoxKfAzCpSVdZH7xLQjL
	J3RAoUjv60D2F3JpxiEV8PsDg5BEI2M3WVmFLHSNUd2lYIDP4D8Ufp56weRnlDS5DVvNtIXT0dJ3Z
	rr1sJZ+yTZRuaqtiBZu+QLjkQsOKIpXQa7yeRwzzpoOkwTQwvU1IwjGxGIR/SJm15mS/JU5PUxNQd
	fSmEGx6CPS2oGViU1vawBPQHbidvskOKgTpAHsI4elJFUA7fd+T8tPMekFTIcPsersBkVB73Xg570
	FcD4+KtYwek6UXn1sHwhCo5OB0F9Hh8tR1Pny42Z/YasAHZICnidMzp+XswsyJGG8aGcIncVUIfWQ
	E0mco7Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woAZy-00000001n1T-3ZVo;
	Mon, 27 Jul 2026 01:56:30 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woAZv-00000001n0x-2TOU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 01:56:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version:
	Content-Type; bh=JKw66HKdsaS/PQV3GJ9p5S0FHALmKAlK3dZMai4BQBA=;
	b=bGEzfBL7fObom6NaaKrvWj4fgGYyHEbEHEJmTjTCYWIJmow0+ivcikei8WjvDd
	Zp+F2mRWB1ynpvR1PNOyV04c6Gg9Nqqij3mnM8IK0alTOe+Um97bUAnqkJE0x0pb
	O7SvSRrBj4P7Kd199O7DgR78pL5X/JVHRs72/6qhnWb68=
Received: from localhost (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgD3n5+uumZqzqzZHw--.61029S2;
	Mon, 27 Jul 2026 09:55:59 +0800 (CST)
From: Lianghong Liu <liulhong617@163.com>
To: linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org,
	ardb@kernel.org,
	Lianghong Liu <liulhong617@163.com>
Subject: Re: [PATCH] arm64: mm: fix accidental linear mapping of no-map reserved memory
Date: Mon, 27 Jul 2026 09:55:58 +0800
Message-Id: <20260727015527.1@liulhong617.163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <aljkLPTfyAbPaT98@willie-the-truck>
References: <20260513010255.3764038-1-liulhong617@163.com> <aljkLPTfyAbPaT98@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PCgvCgD3n5+uumZqzqzZHw--.61029S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ArWrGrW3ZrWUuw1xZw4fXwb_yoW8urWxpw
	s5JFsxKrs5XFn2q348Wa4a934rAw4kCF45XF4YkryqyFZ3CFZ3ZrW0k3WqyFyUZFy8Gr12
	qrWavF17Ga1Yv3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JU-Aw7UUUUU=
X-Originating-IP: [39.170.101.209]
X-CM-SenderInfo: holxzxxrqjliqx6rljoofrz/xtbC+Q8OaGpmuq+bbAAA3+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_185628_407052_86E45F38 
X-CRM114-Status: GOOD (  11.15  )
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

Hi Will,

Thanks for the review. Quick answers to the two open questions.

## What I'm seeing on my system

64K pages (PAGE_SHIFT=16). A no-map reserved region at 0xA2000000 with
size 0x8000 (32 KiB, sub-page). The linear map should skip that hole and
start at 0xA2008000; instead it starts at 0xA2000000 — the whole no-map
region is mapped with PAGE_KERNEL. Debug print in
__create_pgd_mapping_locked():

  create_pgd_mapping: phys 0xa2008000 ...
    after PAGE_MASK align: phys 0xa2000000 - 0xab000000   <- start rounded DOWN into no-map

Cause: for_each_mem_range skips MEMBLOCK_NOMAP regions via
should_skip_region(), but memblock_mark_nomap() splits at byte
boundaries in memblock_isolate_range() (rgn->base = base), so the
*adjacent* region is returned with a sub-page-aligned start/end. That
value then hits
  phys &= PAGE_MASK;
in __create_pgd_mapping_locked(), which rounds the start DOWN and pulls
the mapping back into the no-map page.

So this is a real isolation break, not cosmetic: no-map memory the
firmware asked to leave untouched ends up read/writable in the linear
region.

## On "we might fail to map legitimately mappable pages"

The inward rounding can't lose any page the allocator owns. The buddy
release path uses the exact same inward PFN rounding in
__free_memory_core():
  start_pfn = PFN_UP(start);
  end_pfn   = min(PFN_DOWN(end), max_low_pfn);
  if (start_pfn >= end_pfn) return 0;

So the sub-page sliver at a no-map boundary is never handed to the
allocator and has no struct page backing it — the linear map currently
over-maps bytes the allocator already doesn't manage. The patch just
aligns the linear map to the allocator's own notion of the region, so
no mappable page goes unmapped that isn't already unmapped today.

## On "warn + do nothing"

Happy to add a WARN_ON for a sub-page no-map region adjacent to mappable
memory — useful as a firmware-compat signal — but a warning alone leaves
the no-map memory mapped, so I'd keep the inward rounding with it. If
that reasoning holds I'll send v2 with the WARN added.

Thanks,
Lianghong Liu


