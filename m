Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D05606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 17:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RJ+m+yfa;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=tKqbDw0k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2eiZj4z0YqxczDZhTP4xk2y8uh1O35jeXRePIqjNdtA=; b=RJ+m+yfaJPzsJh
	32Bxp/pDfRigvAAxKC7lJVpl/NkSMEGRsO94xvzlG48ipqahis0FD1mXUDgN5ZSuk1BBxVIIzbJvd
	H/Flff/wPbIzru1IL6ZFgmQKPxHCLjV3gKnPh4TAnCbbqZiUg226OWTKT+RX+5uWAvxgLs7GieeC3
	Ww96AjpH7RDxFrTMQ9zvLX7TeMEJG1uiAwXPXNuleUeBZzKbbGchENUa3xwRExg9e9mFnhRTXJHDC
	Ylw3D9+kGs1JFQHcooWFvUDOugqVgrKTgTAvrJc7bCiWTwZfllpsV/N2Zeo9kXjCk39FEal/Yf0dP
	qkhZp/y9s5EoH73pxXVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMTqk-00000009xcS-3bOr;
	Thu, 29 Oct 2026 17:23:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMTqi-00000009xbO-01DU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 17:23:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BB56B1682;
	Thu, 29 Oct 2026 10:23:28 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 00DB53F59E;
	Thu, 29 Oct 2026 10:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793294611; bh=89SvGZ6WMPqFWYQKrcmNz6K4h0a9xvHSBOWe1Dr2QQU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tKqbDw0kJstskDmn46lt05CuTnjC3aInPTR+oCreDFmV1TDXRixNV7gQs9bvaolno
	 9vloIPpeqvvl/gryOc82+JKTrXA3ps7tBc9lEcHzJokLGtsLKIA/dqPhL2aktd6nV6
	 FD7SXq5tC9XzlvCsLzMdG06RdEwDTzqfLK4CFf50=
From: Catalin Marinas <catalin.marinas@arm.com>
To: will@kernel.org,
	Zhao Gongyi <zhaogongyi@bytedance.com>
Cc: ryan.roberts@arm.com,
	dev.jain@arm.com,
	baolin.wang@linux.alibaba.com,
	lance.yang@linux.dev,
	mark.rutland@arm.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] arm64/mm: restrict transparent contpte mappings to valid PTEs
Date: Thu, 29 Oct 2026 17:23:23 +0000
Message-ID: <179329460319.2444743.17610856580354729996.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <c4c33aaddf5741e125e4130f2220b1892b50aa61.1792756709.git.zhaogongyi@bytedance.com>
References: <c4c33aaddf5741e125e4130f2220b1892b50aa61.1792756709.git.zhaogongyi@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_102336_176327_03FAF659 
X-CRM114-Status: UNSURE (   8.28  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 23 Oct 2026 20:12:33 +0800, Zhao Gongyi wrote:
> The transparent contpte layer treats PTE_CONT as software grouping state.
> When a valid PTE has PTE_CONT set, the contpte helpers may align an
> operation to a CONT_PTE_SIZE block and operate on the whole block. The
> current single-PTE helpers use pte_valid_cont() to identify such groups;
> this is a helper contract, not an architectural restriction on using
> PTE_CONT with present-invalid descriptors. Explicit users such as hugetlb
> manage their contiguous encodings separately.
> 
> [...]

Applied to arm64 (for-next/core), thanks!

[1/1] arm64/mm: restrict transparent contpte mappings to valid PTEs
      https://git.kernel.org/arm64/c/486d396b19e9

