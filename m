Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E42D29FFA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 08:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eI5Aks8p/qGW9HFMkJeBYiCSRBBx6IXlghuKINHgvU8=; b=nI6X3Wuk6Bkq+I9cYGNLrsYrZ8
	4iqfBovo6OgfR4xl7VOAz15M1lUxefrk4MVBKhD68/IXB1JCQlL/TZb7A2ed3LjtnYa0TPdDBQ4l9
	WVSlaMbpdrBtLYVJtPUyv/A6/jebE/Z9Q3ZEsRbuG0afvlnd/ED8KF6zpiczAiYi16zUnUeBk94L9
	tru2T1411zb3uR9uIQI1Y9Q87EiSrvviD6gi7aG5J9WbkClnr/2Vgkn6TNvNoiYPX/L5kNbaM64n/
	pC9n8s9pDIYsdSXDXbhmMgoii4mCt5Lf8GH30AjwIRjCcwQnU1Dvr7m+eOt9YZZXdGC19xobZwquI
	Cua7wTnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgIMQ-0000000By0Q-2kXE;
	Thu, 15 Jan 2026 08:05:42 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgIMN-0000000Bxzk-3wX9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 08:05:41 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-350fe1f8ea3so262804a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 00:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768464339; x=1769069139; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eI5Aks8p/qGW9HFMkJeBYiCSRBBx6IXlghuKINHgvU8=;
        b=QWaL28tr57H9hATBxXL1idG3iOjt+q39zvrTmLdQkOCDP5yvW5a6GBhNMe7/szjMG9
         WpVkJAT1D0nmIls89YJGwekNaWBXSA9O9FKUkSet6sLzh4U87q1mbCNHf23IshYzflX/
         uM7iMQJsb7waqVD1Klr+nRy98QmwYCUc4QovcIpgcItImWlyJxNAuxvye+LXqHZoxJ1H
         5VZk9xeXmoV3Ud5SSgR0e3EoOZ2NKfvZh7gplxS5TIR0NhF/uaxLct6zMK9wzknzYE2A
         4styQjXaUiZAX4ETq75wVPHi7o7KEWKFiV+Wt1XN72AZ30lnVydTJ4p4RYtbjtCZLNU5
         uTIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768464339; x=1769069139;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eI5Aks8p/qGW9HFMkJeBYiCSRBBx6IXlghuKINHgvU8=;
        b=gRW1VgrthZUUax/yrk4GafQBsmQexwSzMDmw13a0a1uIfJ3kou5fJ8UFlCgrn5/2Q0
         Ry8cTitf7OYGFnmaXKy8QmF9/IPnZQueZ6WAbjGgzpyl/UknqJI4+lxwLdu/gM3DdSNY
         p+3Mm5EVMDN/DJ2WpHUA7XijnKg1OSHqq8rxsaELGAB6eN6VtVVkQGnw2xT2dEvXfk2A
         Zg9r9pPrNsOedxmWfkSaK2tE/f2n8o28pcqYzUq4mRqOFOmu5Cljrz+Lhs88/sbzZxis
         A9uidwwGCT71+6YMVOptO74RNEz+d4QCmP9S/ZtJoIMOTK1rEl6gOcSaOp+ACDQRWnF+
         j7BA==
X-Forwarded-Encrypted: i=1; AJvYcCWlCLGdGOXEEcm7mYPJV1qrI6cnpyjQYvomE7N77c9XjpAZhXrGclHuG41rUYOchM1WaDNFAlSW0djebeV7Sy7h@lists.infradead.org
X-Gm-Message-State: AOJu0Yyx3hdI/dtuj4TwF+eRBawPuSqtNsjrXJys//Z10GVrtL9k7ubp
	e4WQ7SUb6phRJ/EugKdGDT3MIfxuud0S99JnPRoj7npqInGSYzgmMB6oBLQuU+5qAJI3BFDgW2f
	AhPRJxoqZ9DAttXejNE80P2VUlbYaAFc=
X-Gm-Gg: AY/fxX622RVzFYf0t+bm3gQnNjcvAltQOcJvUAORbA7DtGveXpr6D1iWMK+LFnN+IAJ
	cQZ2yl596As524ujXvzESfFjKyoEhNC7s/btQiClUReQ/aZNkfTFTybJJyIrUmVYQ8fvd3y++WG
	8SWoh9SKn+4YuGz2Xp47gDso8M2ojm9W56Th1atpJ58TJvz6PAeZmWEpc2N6x5fMGbNCKpqA0Q+
	r9+DhcchWc/OUNCWJD/P9TVSXYVfjEK1KnK5WflZiYnzNmpgjfucizbTzX7tCf4N4J/zDUJBpIC
	VNL9jzAewJvURA8yX4kG3FFpkbwH
X-Received: by 2002:a17:90b:1d4e:b0:34f:6312:f22c with SMTP id
 98e67ed59e1d1-3510afcbd46mr4909265a91.0.1768464338603; Thu, 15 Jan 2026
 00:05:38 -0800 (PST)
MIME-Version: 1.0
References: <20260115001405.3513440-1-robin.kuo@mediatek.com>
In-Reply-To: <20260115001405.3513440-1-robin.kuo@mediatek.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Thu, 15 Jan 2026 16:04:58 +0800
X-Gm-Features: AZwV_QgPLO0RVfJdVJxqFZ4Y4W_kG-gmBtwevH7JFUpri4EIC-T2EJV0cJ8my68
Message-ID: <CAMgjq7CrKv7QJNFO_vg1_nXA+RSW83mu8X4cMSVd2tfMA==Wew@mail.gmail.com>
Subject: Re: [PATCH 1/1] Restore swap_space attr aviod krn panic
To: robin.kuo@mediatek.com
Cc: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, 
	Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, wsd_upstream@mediatek.com, 
	casper.li@mediatek.com, chinwen.chang@mediatek.com, Andrew.Yang@mediatek.com, 
	Qun-wei.Lin@mediatek.com, oliver.sang@intel.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_000540_018719_A33EF87A 
X-CRM114-Status: GOOD (  26.14  )
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

On Thu, Jan 15, 2026 at 8:14=E2=80=AFAM <robin.kuo@mediatek.com> wrote:
>
> From: "robin.kuo" <robin.kuo@mediatek.com>
>
> Restore swap_space attr avoid krn panic
>
> Commit 8b47299a411a ('mm, swap: mark swap address space ro and add
> context debug check') made the swap address space read-only.
> It may lead to kernel panic if arch_prepare_to_swap returns a failure
> under heavy memory pressure as follows,
>
> el1_abort+0x40/0x64
> el1h_64_sync_handler+0x48/0xcc
> el1h_64_sync+0x84/0x88
> errseq_set+0x4c/0xb8 (P)
> __filemap_set_wb_err+0x20/0xd0
> shrink_folio_list+0xc20/0x11cc
> evict_folios+0x1520/0x1be4
> try_to_shrink_lruvec+0x27c/0x3dc
> shrink_one+0x9c/0x228
> shrink_node+0xb3c/0xeac
> do_try_to_free_pages+0x170/0x4f0
> try_to_free_pages+0x334/0x534
> __alloc_pages_direct_reclaim+0x90/0x158
> __alloc_pages_slowpath+0x334/0x588
> __alloc_frozen_pages_noprof+0x224/0x2fc
> __folio_alloc_noprof+0x14/0x64
> vma_alloc_zeroed_movable_folio+0x34/0x44
> do_pte_missing+0xad4/0x1040
> handle_mm_fault+0x4a4/0x790
> do_page_fault+0x288/0x5f8
> do_translation_fault+0x38/0x54
> do_mem_abort+0x54/0xa8
>
> Restore swap address space as not ro to avoid the panic.

Hi Robin

Thanks very much for the patch! I'm fine with it with some suggestions:

Marking it as RO was intentional to avoid silent unexpected usages of
the swap space, the swap space is hollow now, as all content is now in
the swap table.

For example the one you posted, calling filemap_set_wb_err for the
swap space is meaningless, the error info will be ignored without any
notice.
In the comment for mapping_set_error (wrapper for filemap_set_wb_err):
 * When a writeback error occurs, most filesystems will want to call
 * mapping_set_error to record the error in the mapping so that it can be
 * reported when the application calls fsync(2).

So far there is no fsync for swap or other ways to report mapping
errors to userspace. For example, __end_swap_bio_write will just print
an error log if writetback failed. I went through the code, currently
only arch_prepare_to_swap will cause a call to filemap_set_wb_err.
Swap is not a persistent storage like normal FS, so simply bouncing
the writeback folio back as active is good enough for almost all
cases, like the one in end_swap_bio_write.

Catching potential issues with RO/panic is overkill indeed. So I'm
fine with dropping the RO by default. But perhaps we can keep the RO
attribute at least for VM_DEBUG build? Like this:

diff --git a/mm/swap.h b/mm/swap.h
index eba4c04ad039..307cc71d3635 100644
--- a/mm/swap.h
+++ b/mm/swap.h
@@ -220,7 +220,12 @@ int swap_writeout(struct folio *folio, struct
swap_iocb **swap_plug);
 void __swap_writepage(struct folio *folio, struct swap_iocb **swap_plug);

 /* linux/mm/swap_state.c */
-extern struct address_space swap_space __ro_after_init;
+#ifdef CONFIG_DEBUG_VM
+#define __swap_space_attr __ro_after_init
+#else
+#define __swap_space_attr __read_mostly
+#endif
+extern struct address_space swap_space __swap_space_attr;
 static inline struct address_space *swap_address_space(swp_entry_t entry)
 {
        return &swap_space;
diff --git a/mm/swap_state.c b/mm/swap_state.c
index 3916d144eddc..11273e0ec811 100644
--- a/mm/swap_state.c
+++ b/mm/swap_state.c
@@ -38,7 +38,7 @@ static const struct address_space_operations swap_aops =
=3D {
 };

 /* Set swap_space as read only as swap cache is handled by swap table */
-struct address_space swap_space __ro_after_init =3D {
+struct address_space swap_space __swap_space_attr =3D {
        .a_ops =3D &swap_aops,
 };

---

And as for this particular error marking issue you posted, maybe we
should just drop the handle_write_error I think. That helper was
useful when the filesystems are still using the .writepage interface,
but now all filesystem have switched to .writepages and only swap may
call that helper, which is no longer helpful, as the error info is
completely ignored with no report back to userspace. Maybe we need
something like this:

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 39f0336d9c29..62fe433aac0b 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -477,27 +477,6 @@ static int reclaimer_offset(struct scan_control *sc)
        return PGSTEAL_DIRECT - PGSTEAL_KSWAPD;
 }

-/*
- * We detected a synchronous write error writing a folio out.  Probably
- * -ENOSPC.  We need to propagate that into the address_space for a subseq=
uent
- * fsync(), msync() or close().
- *
- * The tricky part is that after writepage we cannot touch the mapping: no=
thing
- * prevents it from being freed up.  But we have a ref on the folio and on=
ce
- * that folio is locked, the mapping is pinned.
- *
- * We're allowed to run sleeping folio_lock() here because we know
the caller has
- * __GFP_FS.
- */
-static void handle_write_error(struct address_space *mapping,
-                               struct folio *folio, int error)
-{
-       folio_lock(folio);
-       if (folio_mapping(folio) =3D=3D mapping)
-               mapping_set_error(mapping, error);
-       folio_unlock(folio);
-}
-
 static bool skip_throttle_noprogress(pg_data_t *pgdat)
 {
        int reclaimable =3D 0, write_pending =3D 0;
@@ -650,9 +629,10 @@ static pageout_t writeout(struct folio *folio,
struct address_space *mapping,
        else
                res =3D swap_writeout(folio, plug);

-       if (res < 0)
-               handle_write_error(mapping, folio, res);
-       if (res =3D=3D AOP_WRITEPAGE_ACTIVATE) {
+       if (res < 0) {
+               pr_alert_ratelimited("Swap failure of folio (order:
%d, error: %d)\n",
+                                    folio_order(folio), res);
+       } else if (res =3D=3D AOP_WRITEPAGE_ACTIVATE) {
                folio_clear_reclaim(folio);
                return PAGE_ACTIVATE;
        }

