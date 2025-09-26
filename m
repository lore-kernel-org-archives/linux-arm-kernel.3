Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB2CECAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 16:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pXZMnjw+Sy9OuF5bFWxCBJB/q1PalvTkN3dKPnTWL5s=; b=XQqweeqrbtkDH9HBn9o/n39APQ
	lplqscJ0vPJlOAjAB1G9Irooo9AqLpvWOyC/Fb9ZGhkTh1M5ifNmja+Utj/v3LLvCxdmf5P8Qu3iz
	DN7qOwgNiu7qXnuTUl0KXPukgrsAuTRagmZzYEsoOr6bA9/lAziLouaDhRQCouUx3Sxko2FAPYk76
	GnMXNvv6X5S0b5WxNPX8yohSbpwYuV0XBNJeyjyhPPNE7wkDSScy2PY3eOeB4Ek9rvSNs+4jRun8m
	U5ksDJFR60MRoUQBfHrE7o1M/8XMbBu/H2XKGsvAk/aZnV3+qKm+aLb1xS1kikPAHEEQMa+Hdr2pA
	RH/BHvXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2BKY-00000002rxR-3pbn;
	Fri, 26 Sep 2025 16:29:58 +0000
Received: from gentwo.org ([62.72.0.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2BKW-00000002rvt-2Afb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 16:29:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1758904194;
	bh=pXZMnjw+Sy9OuF5bFWxCBJB/q1PalvTkN3dKPnTWL5s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=skDDhUwpJ28QhFf/DSEnPG5i/j3L4lkVN7HJLxmnX4uQxrTIFaawx6ZJ0RYaqdB8P
	 TX2qnBt3jCnEEZntTEo9pqbumFSpzucw40GmAk3mt2XUuX0BlDUT7m+kowp6/xsUBs
	 Vt5Gf6ITs6DFEN4o42ynwJyrLtOXnNVSwUntSpBs=
Received: by gentwo.org (Postfix, from userid 1003)
	id C2062402AD; Fri, 26 Sep 2025 09:29:54 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id C0E204028E;
	Fri, 26 Sep 2025 09:29:54 -0700 (PDT)
Date: Fri, 26 Sep 2025 09:29:54 -0700 (PDT)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: Yang Shi <yang@os.amperecomputing.com>
cc: muchun.song@linux.dev, osalvador@suse.de, david@redhat.com, 
    akpm@linux-foundation.org, catalin.marinas@arm.com, will@kernel.org, 
    carl@os.amperecomputing.com, linux-mm@kvack.org, 
    linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: hugetlb: avoid soft lockup when mprotect with
 PROT_MTE
In-Reply-To: <20250926162034.1785899-1-yang@os.amperecomputing.com>
Message-ID: <1038c7c7-81d6-f273-6fa1-93eb7206d5ed@gentwo.org>
References: <20250926162034.1785899-1-yang@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_092956_589324_2A959262 
X-CRM114-Status: UNSURE (   8.72  )
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

On Fri, 26 Sep 2025, Yang Shi wrote:

> When calling mprotect() with PROT_MTE, kernel will initialize MTE tags
> for every single page in the affected area. Soft lockup was observed
> when doing this for large HugeTLB memory area in our customer's workload
> (~300GB memory):

AFAICT this is a bug fix. The hugetlb path should be doing a
cond_resched() like the base page code does.

It is not MTE specific. If other processing takes a long time in the loop
(setting up terabyte size mappings for hugetlb for example) then the
softlockup could also be triggered on non MTE workloads.

Reviewed-by: Christoph Lameter (Ampere) <cl@gentwo.org>


