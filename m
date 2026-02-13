Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF972EF48CC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 05:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hcm5N/FNl39nu4tcKBsHTHKuYwpRADdhLeVO76g9J1Q=; b=l+dyzm+qlKc6D0RwAXcv+5romX
	GhPQjm+wAOjWKRI6wUn4+tpaDGKNHy/3FhBxGmZi3t1XTwnQ//pgbPWJiUthiMtTA3b9ICV7ppx31
	EbobFIRV7RONoMErUeNvEE1XQEJcNmytBjK9oqqxqMaEBazNynoEtO5KZ9pxwNAwzwUmE9IwpXurq
	ouqpfVhIHpOWS2JcPAHO3tXgtFdHSOfGZCRkgaOHMUsk/nKI9nvWG+ntUqgkPlR7Pln5V/g2rNdLt
	Zl0RpnSWJondaAWKFaUnEI1RmHbpayQ3f6xJX/CEPOuycBN5MvvSeYBqaeOMJsjxd7bfvfdrjXekl
	KsknCRtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqlag-000000030PB-2XW0;
	Fri, 13 Feb 2026 05:19:42 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqlae-000000030Oq-1a4M
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Feb 2026 05:19:41 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-8cb40149037so51708685a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Feb 2026 21:19:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770959978; cv=none;
        d=google.com; s=arc-20240605;
        b=SxHdDHujXIPNgDdpZpF77GgO0rHc5B8t4Y49nQ6Z5INaTUfRgQTQTrULxsoz88scpj
         8jYUE0s6yecKqemL8sHcdc4/5seOruURhWehocjYebnv+Uo1pX2EdQmA+gPr7Kt3aiXd
         W4834APyqikfNkfLhyc50f4SnRDvVYHamFzaOxjQ0ro7bN3brtKEwDupAE+IIgmgDXon
         J1sdXYfgQVz9Bq3Ny2916uJFAwqvkBLyibhCy/i0ar2zYDSxd46FxkozQJIWq85aPlKX
         bKb9tGFdA/w/z67HzyseXKw2iITM5ngA314LrUhINbGrL6UxA4GnwORkKAIsbfElcDDu
         D4pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hcm5N/FNl39nu4tcKBsHTHKuYwpRADdhLeVO76g9J1Q=;
        fh=6dc5OxROSM+6uR1vpfAMYjVy6QWCirZ9W7zA+S2T2hQ=;
        b=eCEN6EO4I5jEOXz5lnhyTe6+lhftK95K3aKNklVKlkvTCbRhY9Arb3Vc4mUYaJ15OW
         eRLt9u5lnsAa/Yi9fU3F8RTvifjIBVbWkj8wGevDJlPWmu1Jz6bF+OHM0Jj7BNqnRTwz
         wY8lRj1Hu/dSXDJd+QYx3MRYALjvU/szGJKOv7wTTJGszsP10gcEqQhAbFAmKo8ea5bz
         CtJ8VXNgZwS8oMkV2SEn+eYJjyeyu/6wA5DoMGh078EI7ZfWRJuG6mj2opEt6toqFWWf
         MaXutTSNfCk3bqEzwOQXMFlHQ9o9sFHcYdYK8EziHlJs57kxQpyD8ze826MK1eEOn1Ue
         oc0g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770959978; x=1771564778; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hcm5N/FNl39nu4tcKBsHTHKuYwpRADdhLeVO76g9J1Q=;
        b=Cn5S2fXE+4lwGBxS9ew3tgt5nIjIbhnhcT+UqFcFuGF6wck3iKJaD+TB+6xg/ccxGc
         C5fNpe/kMZasAJ91c3+BPkEC2Rj8N3AQqxV00P+BU9iSl9bXRJk8BasycnV4uuX6RXzh
         9gHh4c+r8DDe/QuRgR4PXkC9g3tO1c/dMaoUdYw50dzdNsa/2bUtTd+4QCiqjn1HC33T
         P9bJY4p1deF0nkgKyLa5y1hz0Bv4nNp3qjVZW+J3/u3siYdGOVDpbEa931ULY7W7hfNo
         ydSEQA6SRyUy1TTd4WpHqFjc2Kw/c2tNpgUfWVvOPIs0ZXGZDmU4hCjqSBphbILHU+Js
         Ub2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770959978; x=1771564778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hcm5N/FNl39nu4tcKBsHTHKuYwpRADdhLeVO76g9J1Q=;
        b=WrhNpmbAMad2JoUHoHOY1lj7k9qqQLZyPe/ZjP9Oe1Lo77ZkqMTK/SWgbB41g2iHgo
         OzZIJzrw2kInRuDh2GcSTv9t8BZvSO4ysr12/QKW84GaqUvHmvKn7/ArCM0DycVtx6iU
         6q9LJU8iulECq0AfJn9k543D8c3rN/4kNWFpxcAukbP3bcrBLqRQFga9dCqXdnqn761g
         WU51Q9bolpipWjJ/nhiCPrFKSS4veQcJyr5iZR9eff3XFpX5sF/HEoqgc4bXeWm1y7M1
         orJXRwzxTNo5I6iGmxv+xt0zriqiiyKgkl/Kp+TlLHZIeNMNJfs6kaOBPoYN23GZz0k0
         3HXw==
X-Forwarded-Encrypted: i=1; AJvYcCWIvrQWWfKRG1Uoeb2plrUSNCoDDO3dDWKjzO9S6/WBXQVp3CXf+GDimDvY9OIextQxbSwKVWdas+gY3tD5C8jr@lists.infradead.org
X-Gm-Message-State: AOJu0YwtphQTSEkPzRZMgQdID8urisjXM4Nw6ZhPf25z4h0jBXm4GOP4
	YiPfPZu1TMO35c3lAU8fjdi2jE6fX8Ow/WmYWVOVyFZx1mZWI4K18XHlNkStR1SAZm3JCeqRu7z
	B4wVebuLfIyYG2vxSiBPSuyC119WHowk=
X-Gm-Gg: AZuq6aKkqeingClyoz94hVYCOLq4chiyBwKdl5nR4g/2vn/DYS2r5nmIB5kwmQnRyGm
	jMd95QF101+u5cNjHjNzpAJtefSasrqpVPvanISGEe2ApG4RkVyIE9/knGbhkPqtbrXmbtim24S
	oiXmCog/Q3s3/hAaYpDP9m2fz335f02GgcWWIkRvAo7rG3sO4qlqaLjU3UC8dNdxNohG03B4IFk
	sRv+MpgOt5xT4o/1BbF2c91WVAUzmu/8CkXJvSwKS49khXvq/mksP0INavd1ZS7JN5UrrTK3AzS
	JZHrdA==
X-Received: by 2002:a05:620a:318a:b0:8c0:cbd8:20b0 with SMTP id
 af79cd13be357-8cb422bef85mr69698085a.34.1770959978020; Thu, 12 Feb 2026
 21:19:38 -0800 (PST)
MIME-Version: 1.0
References: <cover.1766631066.git.baolin.wang@linux.alibaba.com>
 <142919ac14d3cf70cba370808d85debe089df7b4.1766631066.git.baolin.wang@linux.alibaba.com>
 <46d0b6bf-db7e-418f-a497-983db4d4d786@kernel.org> <ddedb72a-d24f-48bc-88b2-f6f99f3d45ad@linux.alibaba.com>
In-Reply-To: <ddedb72a-d24f-48bc-88b2-f6f99f3d45ad@linux.alibaba.com>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 13 Feb 2026 13:19:26 +0800
X-Gm-Features: AZwV_QjOrB3mhYeaOWb88OQxVXS_adocoCi0wTeW_g2al2n0WylFx5HY55y2R0Y
Message-ID: <CAGsJ_4xqtksoCwjLp-7Kvg5=LyqH+=aGWDWi8jRp8J0c-QiSwA@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] mm: rmap: support batched unmapping for file large folios
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, akpm@linux-foundation.org, catalin.marinas@arm.com, 
	will@kernel.org, lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, 
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, riel@surriel.com, harry.yoo@oracle.com, jannh@google.com, 
	willy@infradead.org, dev.jain@arm.com, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_211940_424943_41AFE67A 
X-CRM114-Status: GOOD (  21.68  )
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

On Mon, Feb 9, 2026 at 5:43=E2=80=AFPM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
[...]
> >> ---
> >>   mm/rmap.c | 7 ++++---
> >>   1 file changed, 4 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/mm/rmap.c b/mm/rmap.c
> >> index 985ab0b085ba..e1d16003c514 100644
> >> --- a/mm/rmap.c
> >> +++ b/mm/rmap.c
> >> @@ -1863,9 +1863,10 @@ static inline unsigned int
> >> folio_unmap_pte_batch(struct folio *folio,
> >>       end_addr =3D pmd_addr_end(addr, vma->vm_end);
> >>       max_nr =3D (end_addr - addr) >> PAGE_SHIFT;
> >> -    /* We only support lazyfree batching for now ... */
> >> -    if (!folio_test_anon(folio) || folio_test_swapbacked(folio))
> >> +    /* We only support lazyfree or file folios batching for now ... *=
/
> >> +    if (folio_test_anon(folio) && folio_test_swapbacked(folio))
> >>           return 1;
> >
> > Right, the anon folio handling would require a bit more work in the
> >
> >
> >      } else if (folio_test_anon(folio)) {
> >
> > branch.
> >
> > Do you intend to tackle that one as well?
>  >> I'll reply to the fixup.
>
> I'm not sure whether Barry has time to continue this work. If he does
> not, I can take over. Barry?

I expect to have some availability after April 1st.
In the meantime, please feel free to send along any patches
if you and Dev would like to move forward before then :-)

Best regards
Barry

