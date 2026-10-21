Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194E8606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 09:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lRFDIgs1;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=mIVZebeJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jr7HnwUIiu7FdL/RBzGWRsmL/DGvW3qYiYRJage31n4=; b=lRFDIgs1qIhDzeuv3ITcJyoAEh
	wcVHyHl0FMwMg8O2d4HciE0YXFdf5LhM55N+8Z7DG/3Y8y8pkeEm71nlVfeqvlb2tR+3oN45wFXUQ
	v5S+EzfhgvHY+jiYx7QsrpoP8kH6QZIxpvpkHDdqFO+p/JyjsofJfe7AcMspfDWlyGzVgmq9gG5sp
	29si8kxosYriTuMcQxSSAEpFWB0fZnJsPJx/MfY2rWEg4d+RYYsJapF8Hv7TTZ6B8HUwg4aLI3KHX
	r0cEAJGkfCPcyLuLHZNS4v3/TAyP4F1gMeUAoO/3rNYeKVgimsP+WvFrHkcJ2hVCRjXhcx9vK0naD
	p9Wu36wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJSh8-0000000BUve-44pA;
	Wed, 21 Oct 2026 09:33:14 +0000
Received: from out-168.mta1.migadu.com ([95.215.58.168] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJSh6-0000000BUtr-1V6r
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 09:33:14 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=dR+VfLDHueVtZzyRT3cCSn71Vr7MLkcSNP5OUCJWM8A=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792575187; v=1; x=1793179987;
 b=mIVZebeJDheysgRfBLQ5IYp9YqVkwZieb9MhPYSmKwSMHOcH/yx93Iq8oES6Xap5rYT+13qG
 yGIsquauM1c7o+8BMiBIrGKBG0B44BN0ij0dcuL9yskE7+Boo8Wr6HcV4caGA6hDiut3Khw8eVe
 B71aq7l/zBLTa9fvZH75Q6vE=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by mta12.migadu.com with ESMTPS id 0674a95a7bee71c4;
	Wed, 21 Oct 2026 09:33:06 +0000
X-Mizu-Trace-ID: 0674a95a7bee71c4
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH v2 01/20] hugetlb: Don't restore vmemmap of non-HVOed
 folios on bulk restore error
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261003002123.505555-2-jthoughton@google.com>
Date: Wed, 21 Oct 2026 17:32:49 +0800
Cc: Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Nikos Nikoleris <nikos.nikoleris@arm.com>,
 Linu Cherian <linu.cherian@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 David Hildenbrand <david@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>,
 Nanyong Sun <sunnanyong@huawei.com>,
 Yu Zhao <yuzhao@google.com>,
 Frank van der Linden <fvdl@google.com>,
 David Rientjes <rientjes@google.com>,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <491B482A-8177-447A-8CDB-AF83C13A5DEE@linux.dev>
References: <20261003002123.505555-1-jthoughton@google.com>
 <20261003002123.505555-2-jthoughton@google.com>
To: James Houghton <jthoughton@google.com>
X-Mailer: Apple Mail (2.3901.100.1.1.12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_023312_714547_F6FB2A1A 
X-CRM114-Status: GOOD (  29.61  )
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
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



> On Oct 3, 2026, at 08:21, James Houghton <jthoughton@google.com> =
wrote:
>=20
> When hugetlb_vmemmap_restore_folios() fails, it stops processing the
> list, so folio_list may still contain folios that were never vmemmap
> optimized, e.g. because HVO failed when they were allocated. Their
> hugetlb flag has already been cleared by remove_hugetlb_folio().
>=20
> If no folios could be restored, bulk_vmemmap_restore_error() then =
calls
> hugetlb_vmemmap_restore_folio() on every folio left on folio_list,
> including those, which trips the !folio_test_hugetlb() check in
> __hugetlb_vmemmap_restore_folio():
>=20
>  page dumped because: =
VM_WARN_ON_ONCE_FOLIO(!folio_test_hugetlb(folio))
>  WARNING: mm/hugetlb_vmemmap.c:503 at =
__hugetlb_vmemmap_restore_folio+0x270/0x300
>  ...
>   __hugetlb_vmemmap_restore_folio+0x270/0x300 (P)
>   hugetlb_vmemmap_restore_folio+0x1c/0x30
>   update_and_free_pages_bulk+0x2c0/0x368
>   __nr_hugepages_store_common+0x2e8/0x3f0
>=20
> Otherwise this is benign: the restore is a no-op returning success for
> non-optimized folios, which are then freed as intended.

Good catch.

>=20
> Skip the restore for folios that are not vmemmap optimized; they can =
be
> freed right away.
>=20
> This is very unlikely to happen without fault injection, as it =
requires
> both HVO and a subsequent vmemmap restore to fail.
>=20
> Fixes: cfb8c75099db ("hugetlb: perform vmemmap restoration on a list =
of pages")
> Assisted-by: LLM
> Signed-off-by: James Houghton <jthoughton@google.com>
> ---
> mm/hugetlb.c | 7 ++++++-
> 1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index a1b51251103b..4dac7ed1df57 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -1613,9 +1613,14 @@ static void bulk_vmemmap_restore_error(struct =
hstate *h,
> 		* page is made a surplus page and removed from the list.
> 		* If are able to restore vmemmap and free one hugetlb =
page, we
> 		* quit processing the list to retry the bulk operation.
> + 		*
> + 		* Folios whose vmemmap was never optimized (e.g. because =
HVO
> + 		* failed when they were allocated) can be freed right =
away;
> + 		* remove_hugetlb_folio() has already cleared their =
hugetlb flag.

Since you mentioned the hugetlb flag is cleared. So it's unnecessary to =
clear it again.

> 		*/
> 		list_for_each_entry_safe(folio, t_folio, folio_list, =
lru)
> - 			if (hugetlb_vmemmap_restore_folio(h, folio)) {
> + 			if (folio_test_hugetlb_vmemmap_optimized(folio) =
&&
> + 			    hugetlb_vmemmap_restore_folio(h, folio)) {
> 				list_del(&folio->lru);
> 				spin_lock_irq(&hugetlb_lock);
> 				add_hugetlb_folio(h, folio, true);

Something like following:

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 6a011b627986..1ab3e61f4704 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -1616,21 +1616,31 @@ static void bulk_vmemmap_restore_error(struct =
hstate *h,
                 * If are able to restore vmemmap and free one hugetlb =
page, we
                 * quit processing the list to retry the bulk operation.
                 */
-               list_for_each_entry_safe(folio, t_folio, folio_list, =
lru)
-                       if (hugetlb_vmemmap_restore_folio(h, folio)) {
-                               list_del(&folio->lru);
+               list_for_each_entry_safe(folio, t_folio, folio_list, =
lru) {
+                       list_del(&folio->lru);
+
+                       /*
+                        * remove_hugetlb_folio() already cleared the =
hugetlb flag
+                        * for folios whose vmemmap was not optimized, =
so they can
+                        * be freed without restoring vmemmap.
+                        */
+                       if (folio_test_hugetlb(folio) &&
+                           hugetlb_vmemmap_restore_folio(h, folio)) {
                                spin_lock_irq(&hugetlb_lock);
                                add_hugetlb_folio(h, folio, true);
                                spin_unlock_irq(&hugetlb_lock);
-                       } else {
-                               list_del(&folio->lru);
+                               continue;
+                       }
+
+                       if (folio_test_hugetlb(folio)) {
                                spin_lock_irq(&hugetlb_lock);
                                __folio_clear_hugetlb(folio);
                                spin_unlock_irq(&hugetlb_lock);
-                               update_and_free_hugetlb_folio(h, folio, =
false);
-                               cond_resched();
-                               break;
                        }
+                       update_and_free_hugetlb_folio(h, folio, false);
+                       cond_resched();
+                       break;
+               }
        }
 }

Thanks,
Muchun

> --=20
> 2.56.0.rc1.315.gc6ed9934b7-goog
>=20


