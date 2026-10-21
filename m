Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C30606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 21:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a5rSRAPU;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=fweO644a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4wmdHTAA1AuKVW6+MMratQ3OvnpQ7OBK1Rv6piTCmyQ=; b=a5rSRAPUCXemP7TdVXQl5ZuUNG
	K985mRD9FTYHu6wz2NSEME/q1KE0ioTbpL+JYYs6gN/31aaxawGHoVqlPcNOndXWEeRn/r+o34d5d
	tfZYrr/p+xAab8ve18EEfZXjl2PISZYWve+8UuG91yjGVfjLvZeU4+S0Oer0YHNa1/3Pl7AzZuPrT
	dWbza9n0bMfDxUCthkUwvc4F8Ld2Py4oTe/M5xRh9nuZ/LTpkVIhEunuhOTG9lAElCol2OEFe15/Q
	yZqTOLwlpp7XStFpocrt+K23XjMXVoR7W4QP2UARzWqp8ShiOlMq8QWFtTBaH+s2muRq9WPf3NhTJ
	7saag0LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJdqZ-0000000Cva7-3OXC;
	Wed, 21 Oct 2026 21:27:43 +0000
Received: from mail-pg1-x545.google.com ([2607:f8b0:4864:20::545])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJdqW-0000000CvZO-3W4B
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 21:27:42 +0000
Received: by mail-pg1-x545.google.com with SMTP id 41be03b00d2f7-cc1ca15334cso1194016a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 14:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792618059; x=1793222859; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4wmdHTAA1AuKVW6+MMratQ3OvnpQ7OBK1Rv6piTCmyQ=;
        b=fweO644ac/MRm+jaxi7ij4yVsDDU2uulyRAU9GG8s5YuTZYWv8vNdwGvEheyR1itAm
         dbwrr8KeVGY3Gf9K4bmAVk0AScHB5P7kKj3dnWlO+PsmZ/jrJglKq3jMM99HTCSIOSlO
         JIq/IJTSX76yrX/JOjDuMNZa/yM0PAYHpIY3pPKd2iLn627fI44rJ1FNlGju9Wy1sYFs
         nCT28+VXK2TeaCs/oNIIk2GWIIHjou5rsA/hhY0jEzG95lhxwzo++nQydAXNCD7VY0Va
         M1Yzp8b+KTmqH5F3r0vXcK7IbB2H+TgZm9JR64+aRRIfU9JnA8/O10FtTjbyVJChB0AL
         AHYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792618059; x=1793222859;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4wmdHTAA1AuKVW6+MMratQ3OvnpQ7OBK1Rv6piTCmyQ=;
        b=xMrFACBJNgHc21VgwDj3Gcv//K0HJn8IrpZuBH0HaVOyjnYfrfFOOmfad2Ja5GMV5e
         pdu017bmbrKQgMGy8iPJ02lS7n+Fv62/o7FhbESv0kdxe7lQ3lIV26Ah0tBKojbH/L/3
         EX5X2EkWxT3nb/N19v3grTruVNC2z+FTtA+vOumE2dyhAvERufVjEKBmJj2HVUErVtWf
         gLicOYKqoi2Q0R4mh7DdfCp0SQ1de5xmDaGS9KTaAZqMqkYtuhnW7eKkzQDNwIv8WOTx
         aSAFdzOy6sWY5BqecJQI7ouQzzkEaenOJR3pu/5sKO5EoR/cvCIxRJNpx4eoXW+tlUGU
         s8Mw==
X-Forwarded-Encrypted: i=1; AKwUvBw31j5FkJblBqBoFecqac0u6nSaNR8tGOZgvjMqmD05VVOv3kt95pYneTR+WAxSNOaqvpZBpzKqHtwgExy+SFL4@lists.infradead.org
X-Gm-Message-State: AFq9FYJ4y33mrlaP3457FhnrQu/GC6P4E9utvXJXXYtzlm3G5UBdL0ns
	bKTAgY2eyUUvlbyqWaF9cp48FVg962LA0m+D8pQshOHK1He3zKsOeS8ONqK/bMWE6gjOkcIARLw
	HQdCIpeFVHCJesq6vcwMEow==
X-Received: from pjboj12.prod.google.com ([2002:a17:90b:4d8c:b0:3a8:645b:da8e])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:35c7:b0:3ab:e588:c29b with SMTP id 98e67ed59e1d1-3ad86dcac60mr3082798a91.5.1792618059129;
 Wed, 21 Oct 2026 14:27:39 -0700 (PDT)
Date: Wed, 21 Oct 2026 21:27:37 +0000
In-Reply-To: <491B482A-8177-447A-8CDB-AF83C13A5DEE@linux.dev>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <491B482A-8177-447A-8CDB-AF83C13A5DEE@linux.dev>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261021212738.321547-1-jthoughton@google.com>
Subject: Re: [PATCH v2 01/20] hugetlb: Don't restore vmemmap of non-HVOed
 folios on bulk restore error
From: James Houghton <jthoughton@google.com>
To: muchun.song@linux.dev
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, david@kernel.org, 
	fvdl@google.com, jthoughton@google.com, linu.cherian@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, mark.rutland@arm.com, nikos.nikoleris@arm.com, 
	osalvador@suse.de, rientjes@google.com, ryan.roberts@arm.com, 
	sunnanyong@huawei.com, will@kernel.org, yuzhao@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_142740_882317_61F3C3F6 
X-CRM114-Status: GOOD (  22.91  )
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-21.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 21, 2026 at 2:33=E2=80=AFAM Muchun Song <muchun.song@linux.dev>=
 wrote:
> > On Oct 3, 2026, at 08:21, James Houghton <jthoughton@google.com> wrote:
> > diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> > index a1b51251103b..4dac7ed1df57 100644
> > --- a/mm/hugetlb.c
> > +++ b/mm/hugetlb.c
> > @@ -1613,9 +1613,14 @@ static void bulk_vmemmap_restore_error(struct hs=
tate *h,
> >               * page is made a surplus page and removed from the list.
> >               * If are able to restore vmemmap and free one hugetlb pag=
e, we
> >               * quit processing the list to retry the bulk operation.
> > +             *
> > +             * Folios whose vmemmap was never optimized (e.g. because =
HVO
> > +             * failed when they were allocated) can be freed right awa=
y;
> > +             * remove_hugetlb_folio() has already cleared their hugetl=
b flag.
>
> Since you mentioned the hugetlb flag is cleared. So it's unnecessary to c=
lear it again.
>
> >               */
> >               list_for_each_entry_safe(folio, t_folio, folio_list, lru)
> > -                     if (hugetlb_vmemmap_restore_folio(h, folio)) {
> > +                     if (folio_test_hugetlb_vmemmap_optimized(folio) &=
&
> > +                         hugetlb_vmemmap_restore_folio(h, folio)) {
> >                               list_del(&folio->lru);
> >                               spin_lock_irq(&hugetlb_lock);
> >                               add_hugetlb_folio(h, folio, true);
>
> Something like following:
>
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 6a011b627986..1ab3e61f4704 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -1616,21 +1616,31 @@ static void bulk_vmemmap_restore_error(struct hst=
ate *h,
>                  * If are able to restore vmemmap and free one hugetlb pa=
ge, we
>                  * quit processing the list to retry the bulk operation.
>                  */
> -               list_for_each_entry_safe(folio, t_folio, folio_list, lru)
> -                       if (hugetlb_vmemmap_restore_folio(h, folio)) {
> -                               list_del(&folio->lru);
> +               list_for_each_entry_safe(folio, t_folio, folio_list, lru)=
 {
> +                       list_del(&folio->lru);
> +
> +                       /*
> +                        * remove_hugetlb_folio() already cleared the hug=
etlb flag
> +                        * for folios whose vmemmap was not optimized, so=
 they can
> +                        * be freed without restoring vmemmap.
> +                        */
> +                       if (folio_test_hugetlb(folio) &&
> +                           hugetlb_vmemmap_restore_folio(h, folio)) {
>                                 spin_lock_irq(&hugetlb_lock);
>                                 add_hugetlb_folio(h, folio, true);
>                                 spin_unlock_irq(&hugetlb_lock);
> -                       } else {
> -                               list_del(&folio->lru);
> +                               continue;
> +                       }
> +
> +                       if (folio_test_hugetlb(folio)) {
>                                 spin_lock_irq(&hugetlb_lock);
>                                 __folio_clear_hugetlb(folio);
>                                 spin_unlock_irq(&hugetlb_lock);
> -                               update_and_free_hugetlb_folio(h, folio, f=
alse);
> -                               cond_resched();
> -                               break;
>                         }
> +                       update_and_free_hugetlb_folio(h, folio, false);
> +                       cond_resched();
> +                       break;
> +               }
>         }
>  }

Thanks, Muchun. :) I think it's slightly easier to read without the second
folio_test_hugetlb(), like this:

	list_for_each_entry_safe(folio, t_folio, folio_list, lru) {
		list_del(&folio->lru);
		/*
		 * remove_hugetlb_folio() already cleared the hugetlb flag
		 * for folios whose vmemmap was not optimized, so they can
		 * be freed without restoring vmemmap.
		 */
		if (folio_test_hugetlb(folio)) {
			if (hugetlb_vmemmap_restore_folio(h, folio)) {
				spin_lock_irq(&hugetlb_lock);
				add_hugetlb_folio(h, folio, true);
				spin_unlock_irq(&hugetlb_lock);
				continue;
			}
			spin_lock_irq(&hugetlb_lock);
			__folio_clear_hugetlb(folio);
			spin_unlock_irq(&hugetlb_lock);
		}
		update_and_free_hugetlb_folio(h, folio, false);
		cond_resched();
		break;
	}

Applied this in the v3.

