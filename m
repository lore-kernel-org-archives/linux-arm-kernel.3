Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB3A4CD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 13:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p674zEnWHv8nUzAecGlmwz5Fx3UFXOqGsTZBm8jEkn8=; b=UaNRoluyN1+4dQoIIAKlPpUWox
	8YMvVaiMkyypzRWgBVDGDmAUHaO8sNhWDmwNc8TllB0WFTecnUZ/Fhv282CEBL8HbB8d2XfFpjf0i
	yxhjOAQlqFuyJ8YADlV+SLhcwR6bwiPoK/GGtMLWKW9UoUX3Ko/jeFlUOCwq60BhqiBfPWk/6dpgX
	UusN82cfmbpcE7jN34KEi18u3qbUNWH9oHTdy22XaTqFtcqrKGhDOJUO7rsnv0yOcInbX9GEDp5Pv
	BLb+VnThBjAevFOXzVdkTIULHUjkJSwYZfZdW/BwSEBCBLhz3W+dpXf/I+yV1pWuGcz6RuPZYYu1H
	YAlvBDPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRrPX-00000001zmC-1v25;
	Tue, 26 May 2026 13:01:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRrPU-00000001zlX-39CX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 13:01:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E9E9169C;
	Tue, 26 May 2026 06:01:20 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6F1563F7B4;
	Tue, 26 May 2026 06:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779800485; bh=QpvJy6L0CWjMFpDpW8hAGQht5XAWKU3uc1IdSsCVqqI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p5Dsr0XgPS8sKERaqTqbDerx+Dn5jf/pmbrKN+O+qEDCMgx32IF7d+aOy0yyNZYcH
	 +XwBPVX+lcDnvbKX7Dms7cneX8kxmoejWuL43TPu0moc2NGzHIA6y7Q0YGice4hMx+
	 eCJbFlg5YILwosv9Sj8NQkWWJYc8jsLPEp/mmU1g=
Date: Tue, 26 May 2026 14:01:20 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Zeng Heng <zengheng@huaweicloud.com>
Cc: will@kernel.org, akpm@linux-foundation.org, npiggin@gmail.com,
	aneesh.kumar@kernel.org, peterz@infradead.org,
	linux-kernel@vger.kernel.org, wangkefeng.wang@huawei.com,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	linux-arch@vger.kernel.org, zengheng4@huawei.com,
	sunnanyong@huawei.com, blingxue@tencent.com
Subject: Re: [PATCH] arm64: tlb: Flush walk cache when unsharing PMD tables
Message-ID: <ahWZoD9Ubaxx-GdK@arm.com>
References: <20260521073011.4121277-1-zengheng@huaweicloud.com>
 <177944657885.252010.9796978866224637120.b4-ty@arm.com>
 <f5b7460a-5719-bdb2-c53b-413468857f57@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5b7460a-5719-bdb2-c53b-413468857f57@huaweicloud.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_060128_893915_C3D4435B 
X-CRM114-Status: GOOD (  14.62  )
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

On Mon, May 25, 2026 at 05:20:14PM +0800, Zeng Heng wrote:
> On 2026/5/22 18:42, Catalin Marinas wrote:
> > On Thu, 21 May 2026 15:30:11 +0800, Zeng Heng wrote:
> > > When huge_pmd_unshare() is called to unshare a PMD table, the
> > > tlb_unshare_pmd_ptdesc() function sets tlb->unshared_tables=true
> > > but the aarch64 tlb_flush() only checked tlb->freed_tables to
> > > determine whether to use TLBF_NONE (vae1is, invalidates walk
> > > cache) or TLBF_NOWALKCACHE (vale1is, leaf-only).
> > > 
> > > This caused the stale PMD page table entry to remain in the walk cache
> > > after unshare, potentially leading to incorrect page table walks.
> > > 
> > > [...]
> > Applied to arm64 (for-next/fixes), thanks!
> > 
> > [1/1] arm64: tlb: Flush walk cache when unsharing PMD tables
> >        https://git.kernel.org/arm64/c/c2ff4764e03e
> 
> This original issue was reported by our customer, who also participated
> in the root cause analysis and resolution.
> 
> Could you please help add the below tags:
> 
> Co-developed-by: Xue Xiaowei <blingxue@tencent.com>
> Signed-off-by: Xue Xiaowei <blingxue@tencent.com>
> 
> Thank you in advance.

Too late unfortunately, the pull request went in on Friday. It will be
in the list archives though.

-- 
Catalin

