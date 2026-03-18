Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE6BF103E162
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 10:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YL7pvZp59Pe1nW2NYzvHDNhH9ud22MdF0vy7DYMTjBY=; b=nU3oaGus3bWqFhkyxoQtxJxq2z
	/VEgpUr6JL+pu0Cw3zYYhzHkzbPtFk1EwCCisYL3wGGkrAEUUn7F+O4Ka+7f4Ds3bX6X4EhcA4qd/
	EESI8SEOyhSfvlezQgsVVYByMzuV29FNkpIUSRBNs8N3F+3FA/3fu/UBhTonan5rSU8AJEniq148f
	wA+TsJoNFpPsB8ZPzbE74kLcXwMydVLa6Y5zZf8ktPWU4a75rYY9gdlUA0UpjCd+G1oz5N6+IpGoa
	6OeKrwL47Hc1SmLqk6rlqrIcq5iibkvTS+tNTGNnSFWm79455HfA3mMypontf6EebFL8PW0F2dXHc
	/+bHTAMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ocL-00000008FXg-25Kf;
	Wed, 18 Mar 2026 10:59:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ocI-00000008FWX-2F60
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 10:59:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E494444767;
	Wed, 18 Mar 2026 10:59:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4541BC2BCB9;
	Wed, 18 Mar 2026 10:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773831543;
	bh=eXHAfMqh6RkD93DEJUVdAwdOv0hR8c1CLNcm1BQYW+k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F6uE4wnFoYpsxRBiKT/PjPuXliQ4seo8S9062AZ7tk37rf3ZX++agKVae57LX+29I
	 yOZFWkz8+D78t+J+kBeYs9Qs2oAecfpTnD+o1T2HG0HpEjZo810U5evd+qliij5IiW
	 IgYK3nOftqn6sOZlY2YDSpVWlBfQ8TEo4vTV4YniZHRCKn43nBCEaPD8oZfh0eyMZ+
	 QGWYVHomaz+gh+eL5gKQAhKHGEpiUT2Io7PAeJF3RBHLzyCpPPWb8FuXF0KgA94nWR
	 GlEeCRmq1FL9VNkiAAH6yRt6OeunWDVw1taBsLaZn/I5l4CSyZG2rax4i3zH87YD7F
	 F+nbWE7Og683g==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Potapenko <glider@google.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Andreas Larsson <andreas@gaisler.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Brendan Jackman <jackmanb@google.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christian Brauner <brauner@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@kernel.org>,
	Dmitry Vyukov <dvyukov@google.com>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jan Kara <jack@suse.cz>,
	Johannes Weiner <hannes@cmpxchg.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Marco Elver <elver@google.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Rob Herring <robh@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Saravana Kannan <saravanak@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Will Deacon <will@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	devicetree@vger.kernel.org,
	iommu@lists.linux.dev,
	kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org,
	linux-efi@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-trace-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH 2/8] powerpc: opal-core: pair alloc_pages_exact() with free_pages_exact()
Date: Wed, 18 Mar 2026 12:58:21 +0200
Message-ID: <20260318105827.1358927-3-rppt@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260318105827.1358927-1-rppt@kernel.org>
References: <20260318105827.1358927-1-rppt@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_035911_309873_25E799A5 
X-CRM114-Status: GOOD (  14.26  )
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

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

opal-core allocates buffers with alloc_pages_exact(), but then
marks them as reserved and frees using free_reserved_area().

This is completely unnecessary and the pages allocated with
alloc_pages_exact() can be naturally freed with free_pages_exact().

Replace freeing of memory in opalcore_cleanup() with
free_pages_exact() and simplify allocation code so that it won't mark
allocated pages as reserved.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/powerpc/platforms/powernv/opal-core.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/opal-core.c b/arch/powerpc/platforms/powernv/opal-core.c
index e76e462f55f6..abd99ddbf21f 100644
--- a/arch/powerpc/platforms/powernv/opal-core.c
+++ b/arch/powerpc/platforms/powernv/opal-core.c
@@ -303,7 +303,6 @@ static int __init create_opalcore(void)
 	struct device_node *dn;
 	struct opalcore *new;
 	loff_t opalcore_off;
-	struct page *page;
 	Elf64_Phdr *phdr;
 	Elf64_Ehdr *elf;
 	int i, ret;
@@ -329,9 +328,6 @@ static int __init create_opalcore(void)
 		return -ENOMEM;
 	}
 	count = oc_conf->opalcorebuf_sz / PAGE_SIZE;
-	page = virt_to_page(oc_conf->opalcorebuf);
-	for (i = 0; i < count; i++)
-		mark_page_reserved(page + i);
 
 	pr_debug("opalcorebuf = 0x%llx\n", (u64)oc_conf->opalcorebuf);
 
@@ -437,10 +433,7 @@ static void opalcore_cleanup(void)
 
 	/* free the buffer used for setting up OPAL core */
 	if (oc_conf->opalcorebuf) {
-		void *end = (void *)((u64)oc_conf->opalcorebuf +
-				     oc_conf->opalcorebuf_sz);
-
-		free_reserved_area(oc_conf->opalcorebuf, end, -1, NULL);
+		free_pages_exact(oc_conf->opalcorebuf, oc_conf->opalcorebuf_sz);
 		oc_conf->opalcorebuf = NULL;
 		oc_conf->opalcorebuf_sz = 0;
 	}
-- 
2.51.0


