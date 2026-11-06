Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6EBD606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 04:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lDjg6i+e;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=h2NarzBu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/Yx3i1zeQ5pe4eBI/JzCvDsEdxLLepzecCOmB7O2Y5Q=; b=lDjg6i+eexkZu/
	AFaGrZKZGmiLc5+zCwuTkY/lTzCkE4QdyCV2zQFdGmdnRqS4ow2wiUspUHAp0D/nAVoq9I7kR3w5m
	/pJMI/UQcsXFoPnLnCYj82Jw7rmJ2TM56gJ1utINDavkjI90DV/RS5l+O+mFPMLIc/2AdU0lnWiuY
	uvUZxpGNgU/ZmCxbTn4ADR4XNiy0N9E+5HcmoNS3qkelarHLa/WfCn1FsLTS2FICeb+syapd5gV9P
	yr+aOX4KuY773LhoowZdQBajGqBPqyY6pIR9Rq0itKoH2/7SVBHkeRpkWjAUhwh85a77BhWel6Qbg
	Yq/Eld+ct0AE7+Vm4Iqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPBiX-0000000BDjj-37yi;
	Fri, 06 Nov 2026 04:38:21 +0000
Received: from out-188.mta0.migadu.com ([2001:41d0:1004:224b::bc] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPBiU-0000000BDiu-2QgV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 04:38:20 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=/Yx3i1zeQ5pe4eBI/JzCvDsEdxLLepzecCOmB7O2Y5Q=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793939893; v=1; x=1794544693;
 b=h2NarzBu5wSfv3HGLjDaliK2QJozxMk1T8AWSAyQrfXgHTDTPCv+ZGuVrnREakda/ZEx8QA1
 8oHdr4LZFwNJAxqLIVYaUXa8CPvRrYRT1iKnDBFCbx5htEVpTCoeBhb92BY4AQ1xCcuyadvcBnR
 1nSZlm5DlYnhXsdFYvkrWORw=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 9188c1b74d12ac2b;
	Fri, 06 Nov 2026 04:38:13 +0000
X-Mizu-Trace-ID: 9188c1b74d12ac2b
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: songmuchun@bytedance.com
Cc: david@kernel.org,
	maddy@linux.ibm.com,
	rppt@kernel.org,
	akpm@linux-foundation.org,
	lance.yang@linux.dev,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	ritesh.list@gmail.com,
	sshegde@linux.ibm.com,
	osalvador@suse.de,
	qi.zheng@linux.dev,
	muchun.song@linux.dev,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	x86@kernel.org,
	loongarch@lists.linux.dev,
	linux-s390@vger.kernel.org
Subject: Re: [PATCH v2 1/5] powerpc/mm: make vmemmap_populate_compound_pages() static
Date: Fri,  6 Nov 2026 12:38:07 +0800
Message-ID: <20261106043807.32969-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261105061217.13302-2-songmuchun@bytedance.com>
References: <20261105061217.13302-2-songmuchun@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_203819_031507_1BEA0B87 
X-CRM114-Status: UNSURE (   6.04  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Thu, Nov 05, 2026 at 02:12:13PM +0800, Muchun Song wrote:
>vmemmap_populate_compound_pages() is no longer used outside
>radix_pgtable.c.
>
>Make it static and drop the unused dev_pagemap argument from
>its only remaining caller to simplify the code.
>
>Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>Acked-by: Qi Zheng <qi.zheng@linux.dev>
>---

Feel free to add:

Reviewed-by: Lance Yang <lance.yang@linux.dev>

