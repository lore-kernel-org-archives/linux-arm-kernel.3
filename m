Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A908C4452B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 17:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W5lsuJ2TK8ReKuQv41colmY0kKFrt517EXbX/U4o4CA=; b=pyc3N9IjNXXOwhOefiQwgaa0vB
	o9kl9PeAPLJnejetQpMruvHD6qYc+CQz/rKcT+AXgpBkcclzg6/xvdEV5cm7qyNt8SAxATQVRaPTu
	JQxri/sUtCkgOLO2cb+fgJ/RDU48lhgtJw+zqaYtjSzZdBRWpufq36OyZRDUXHvYbeJH5jp1oyJbL
	YXzCzKf5MVHLvoF0LZfikJapDg5AKfvfqWGE+tsO1hFq1fXCsvhxpe3wfbkcAK9bv6VtLgpE8Th0s
	iPXPOBY3tgEEsXUdaMRSbEWfx9pFtOOzSvZaoSr/Cra8f4jZw7vI/TxQ4qXV8/G9sgqw6PDd4miMN
	Oi9Vo/ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmE7M-0000000A2JS-3Q4T;
	Tue, 21 Jul 2026 17:18:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmE7M-0000000A2JJ-0zmG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 17:18:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 024274035E;
	Tue, 21 Jul 2026 17:18:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B5CC1F000E9;
	Tue, 21 Jul 2026 17:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784654335;
	bh=W5lsuJ2TK8ReKuQv41colmY0kKFrt517EXbX/U4o4CA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hxoJfeET3T526QXp00quUEwQiOevzo6VUuI3w8NS/NxwUVkTvuDLoG1eHp50Dde/9
	 /IXu72DL1bn1EWLcboCW5yYfKmHJHvFkEmiTKSD50e5FPZDLYl01J7xvScImtnjYsD
	 JjCFTV9E18oVmDRk6//jVQnQPSKBVwQkz+JZAznrV59NxrElBd+JMBafczgRMx7oLC
	 Xk+QhdT3awjgGop2C8uqzN9chBVanihxeMqzT09p6ffF6d1usfV2yA5oGV6cvQhTGg
	 ijzCa3QHEPFfay0pbdy6BGom8WqI5JNIb1VR1ldOAP+yYr9WQIG3Qp3fDWX6Fy6n4l
	 JLEjIFNb1CxiQ==
From: Will Deacon <will@kernel.org>
To: muchun.song@linux.dev,
	osalvador@suse.de,
	akpm@linux-foundation.org,
	ljs@kernel.org,
	david@kernel.org,
	liam@infradead.org,
	Dev Jain <dev.jain@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	riel@surriel.com,
	vbabka@kernel.org,
	harry@kernel.org,
	jannh@google.com,
	lance.yang@linux.dev,
	kas@kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	apopple@nvidia.com,
	rcampbell@nvidia.com,
	ziy@nvidia.com,
	matthew.brost@intel.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	byungchul@sk.com,
	gourry@gourry.net,
	ying.huang@linux.alibaba.com,
	ak@linux.intel.com,
	nao.horiguchi@gmail.com,
	mel@csn.ul.ie,
	j-nomura@ce.jp.nec.com,
	pfalcato@suse.de,
	tglx@kernel.org,
	dave.hansen@intel.com,
	jpoimboe@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	ryan.roberts@arm.com,
	anshuman.khandual@arm.com
Subject: Re: [PATCH v3 0/6] Fix incorrect access of hugetlb pte entries
Date: Tue, 21 Jul 2026 18:18:38 +0100
Message-ID: <178464737122.1305746.12295190523058911270.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260703114202.365553-1-dev.jain@arm.com>
References: <20260703114202.365553-1-dev.jain@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Fri, 03 Jul 2026 11:41:53 +0000, Dev Jain wrote:
> There are various places which use ptep_get() to get the pte entry
> corresponding to a hugetlb folio. Some arches (like s390) have special
> handling to compute the pteval, so they provide huge_ptep_get(). Use this
> helper consistently.
> 
> Additionally, some code paths may provide huge_ptep_get with an unaligned
> address. This is a problem on arm64 (I checked other arches and it looks
> fine for them), which is fixed in patch 1. The fix is made to be
> to huge_ptep_get() - that is wider churn and we can do that later.
> 
> [...]

Applied first patch to arm64 (for-next/fixes), thanks!

[1/6] arm64: make huge_ptep_get handled unaligned addresses
      https://git.kernel.org/arm64/c/9175a8c7cfe88

I'm hoping Andrew can drop this from the mm tree to avoid a duplicate,
but I didn't hear back yet and I'd like to land the fix.

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

