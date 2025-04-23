Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA5CC369D8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 13:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/JumZIUAxGYrtwuczeSXg8m9eHQkSWeCfsEBYrBDGWM=; b=s26W3znjQ5pTToovabAQ1Ye0jh
	hUj2iqxLHCvNm0k8QJCiqjVp9fBXTJEBmpPhwQLZ5oS6V5N+4unWD4eFFaOWmn38gb1lo1RuLqeZ8
	RYbWPjICZiTNJEh7d18jB1Z/aT1cBQ9H558ZsucMbRD7swMvWBf/mo57UXqEKfe2m3KOpGSP2panO
	UU0rT0K48WO0Guuz+L3Mw6p1Hnx+An8TL1O21qnuv9wLo3G8q0d/LgNlw7eKEqi8+fN9i4TmWm5TG
	Eia8k33Nu5I5B73yWZXltAOvm/UAqVz3HFik+H+wKBEuKCWQYcrm0ajzeoPjV3DRdUBtKztxusT6Q
	+vGJUJwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7ZnB-0000000AXCW-2Bwg;
	Wed, 23 Apr 2025 13:05:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Y33-0000000AHMK-1n1o
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 11:13:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E0E2D614C0;
	Wed, 23 Apr 2025 11:13:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62658C4CEE2;
	Wed, 23 Apr 2025 11:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745406828;
	bh=pXCQGX5nUtGpLsWmjOKKvNGQiR+MHDqo+m0Hz0rKI58=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MsvQFAeWQ3RJSr/LAESbdU+ldT3e3CEGD9e+RmMG3zSo9cDmG1xpflrNvKhbTqxrs
	 iVwQqH29spWr6FHI8DMOGTYv48wpkHiqxDklDg/p2w3/OUlbxwMFqC6AoD1UNqSYlE
	 U9PD74S9rFRxMDcO8bj/BjKMy5U9v1t9m8OWL8iNODERBNP9lE7km8Yu0qW/dKQi/6
	 LCjVYsm69ew/hiS35Gx7zutm9Y1sqDhudUVdfC5uLl6lrG1Hq69dD736hGPX7sTVFU
	 v00EQup8WF7H6eY/UMGJBTp29rhLllT7lrCCdnxQYQXUjakTw/VmtVDj7kbhxboGTJ
	 /ObFmfpRDM37w==
Date: Wed, 23 Apr 2025 14:13:40 +0300
From: Mike Rapoport <rppt@kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"Sauerwein, David" <dssauerw@amazon.de>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	David Hildenbrand <david@redhat.com>, Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mike Rapoport <rppt@linux.ibm.com>, Will Deacon <will@kernel.org>,
	kvmarm@lists.cs.columbia.edu, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Ruihan Li <lrh2000@pku.edu.cn>
Subject: Re: [PATCH v3 6/7] mm: Use for_each_valid_pfn() in memory_hotplug
Message-ID: <aAjLZFdz7cE8i9dc@kernel.org>
References: <20250423081828.608422-1-dwmw2@infradead.org>
 <20250423081828.608422-7-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423081828.608422-7-dwmw2@infradead.org>
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

On Wed, Apr 23, 2025 at 08:52:48AM +0100, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  mm/memory_hotplug.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)

-- 
Sincerely yours,
Mike.

