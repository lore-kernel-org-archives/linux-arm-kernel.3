Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF34D0EE0D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 17:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PLo5aywFjTXSQv3nvb08ro0yKuqd+UtJdtebi0hWe6g=; b=no/EHtqvdJ6ZVCT8VfOTSgPOUn
	gTsZHv7yTMo6qPNng0hLeguhqVz7Htp3doT56Anw62JtL4YdNAWJjLn/7wAhKO7WqiMc/45TO3Z2S
	o7j6KhDVoxuah25Su6G02WZbHHyozmGdgn3qpgPwrDmMQbamPAGX0pCBpRet8iTH9KlW5iaAIDF1l
	naHLsT5gvkTB/NpW1LNT8RhV0YVhIp/DscqZNlk02WjDYcM6iRGwAIogRcmSnSvVeGlwdiUigm0Rv
	JlEODE3HNKH+GBLYFaWzLOdqwQFsAEvSlrrmJTvxufHXWkzCOcWYESAj5ZI8sxsy9X7Tr+ELCv0tm
	TySHe+9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNx0Z-0000000Dg37-0h5x;
	Tue, 25 Nov 2025 17:39:19 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNx0W-0000000Dg2W-12fC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 17:39:17 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-64088c6b309so9444510a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Nov 2025 09:39:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764092354; x=1764697154; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PLo5aywFjTXSQv3nvb08ro0yKuqd+UtJdtebi0hWe6g=;
        b=ldrhz+aMtvdTw1B/F99b807dfpb+ZhawafNWe9l3l5gmXkjfrk2SXMVl1hFOdwVqaE
         WBD5kj6lA5R3Gl1tq79xisCR3tvcg1zeC7mlxw7l6nC4zs1HWM3Zxwh9L/4F5nCSvCf7
         z/gKO8LHIdG2+xRj/3jQKuIKUSE60YII9cL7C7jdVMxUSJFdSg6jD12ZLrfjkWTllPZ7
         UhMTdFdo2gShJ/4gCKng6IzOjk7miVHpAglec0koZYLyKQ6bg6dgnk3zGrxShFAwqurP
         /GiPg6U+uF1dugfb8YRiKKhwTNmszSl+OYpRZ141dYsiPH5P8aNqA78t00SHEtkdxvma
         VBBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764092354; x=1764697154;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PLo5aywFjTXSQv3nvb08ro0yKuqd+UtJdtebi0hWe6g=;
        b=kXdHyItOMDovWJhJGc3iXWF5cHiGba4OGK+D59of1QBXfuOSDO1FK3btyQKq85SUAR
         Am43Cidb8xmA8dkEZGCewEyZNGpTXe17b6tHIlRw9Xo/uM4RqBX06JiIIcJ6anzU/My1
         UCqYY2+Ph5umdNBGZUwP6TugZaibtAsV70A3Lc8IK3/fkiq5/79fdyog1RHvX4LsSvH7
         OhJPYgTElRUatxevH+BUe4WeXu36nHFHduecXyTb75/YYkveyd3Y6MbyAoh4oioURiGO
         i2rhH3vtnu/yaldMOeUU3MyKD3gLxr9TVMiNTxtOURbSoBpbBshA6hRZC1r3TrchSjfp
         pajw==
X-Forwarded-Encrypted: i=1; AJvYcCXhfVohsXghy7bN4ktLOsCUI8zx+OtVMRxK35GEk07MElPbuAWGb0Zjs3Rt91wAYcYJgQlC5hhz2lgDYBlQSO8Y@lists.infradead.org
X-Gm-Message-State: AOJu0YzfBbKsnkBq0m4/2lszz8GI0zOo9r+dBHOkyPDHxHHA6fwfpExu
	ObrfNzkZ9+iPQ5JU00FHBf4tJiVYaSl0Vu/xa6UX3QJtYVEUySiNAbcUv5+FGXaUsQqTJ1DVCIh
	X0SlW5ZSsLqmRN9MlN9JYj+YlWmb7+i0=
X-Gm-Gg: ASbGncvLdFh414ecvkF6KuDnj6LKAGiNdgwNfZadK6pgbtjVNF3grETubKG1jb/k2q5
	7AJOQiTpQc+TalgBJiTxzGFHO0grXfV5L+5d5d6+qcXl6fc6/KvfdQqJmjPGeSzrTTBYhl15VxA
	kCQCbtCHFLViDM1+0Zo39s9nDFc4l/WWh5mBTIa8CWzCR+go7wtFqoZnadqdI9tKDnCRiYVGjMU
	urU/Zj035oLhJDZ0e7/PsnTsv5T0lXQc0++8+WZ1BBrHotSvgiYPogUwdeDWxnHFnkOHzouG7Dh
	crrtQ+XHL6M8zsJJtHUDhX2HY7c=
X-Google-Smtp-Source: AGHT+IGl0uAb18fsjV78ScdhdmsexuDhZTVBMIVIE0mSYI1A/3YBXhMw4U/QXxd3ivuAoH0mgxxoss3lhAwCNVVGKy4=
X-Received: by 2002:a05:6402:5213:b0:643:8183:7912 with SMTP id
 4fb4d7f45d1cf-64555b9a93emr12808906a12.9.1764092353665; Tue, 25 Nov 2025
 09:39:13 -0800 (PST)
MIME-Version: 1.0
References: <cover.1763976541.git.baolin.wang@linux.alibaba.com> <CAGsJ_4wNiKfKpTPKUNim6-X=KiMxhp_9sPh+hkh8gB8AR2ue7g@mail.gmail.com>
In-Reply-To: <CAGsJ_4wNiKfKpTPKUNim6-X=KiMxhp_9sPh+hkh8gB8AR2ue7g@mail.gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Wed, 26 Nov 2025 01:38:37 +0800
X-Gm-Features: AWmQ_bkX3LENYgmlshIWTNXHI_rEPkBbJuc2ZxmMYxnOrxDwU11PVyntCGgYSDM
Message-ID: <CAMgjq7BJ0uHCWoZgum+19dk=_tgkT1vLu0Qs=4dFEe0go1UTRA@mail.gmail.com>
Subject: Re: [PATCH 0/2] support batched checks of the references for large folios
To: Barry Song <21cnbao@gmail.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org, 
	david@kernel.org, catalin.marinas@arm.com, will@kernel.org, 
	lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, Liam.Howlett@oracle.com, 
	vbabka@suse.cz, rppt@kernel.org, surenb@google.com, mhocko@suse.com, 
	riel@surriel.com, harry.yoo@oracle.com, jannh@google.com, willy@infradead.org, 
	Chris Li <chrisl@kernel.org>, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_093916_311179_C5498878 
X-CRM114-Status: GOOD (  19.65  )
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

On Tue, Nov 25, 2025 at 6:15=E2=80=AFPM Barry Song <21cnbao@gmail.com> wrot=
e:
>
> Hi Baolin,
>
> On Tue, Nov 25, 2025 at 8:57=E2=80=AFAM Baolin Wang
> <baolin.wang@linux.alibaba.com> wrote:
> >
> > Currently, folio_referenced_one() always checks the young flag for each=
 PTE
> > sequentially, which is inefficient for large folios. This inefficiency =
is
> > especially noticeable when reclaiming clean file-backed large folios, w=
here
> > folio_referenced() is observed as a significant performance hotspot.
> >
> > Moreover, on Arm architecture, which supports contiguous PTEs, there is=
 already
> > an optimization to clear the young flags for PTEs within a contiguous r=
ange.
> > However, this is not sufficient. We can extend this to perform batched =
operations
> > for the entire large folio (which might exceed the contiguous range: CO=
NT_PTE_SIZE).
> >
> > By supporting batched checking of the young flags and flushing TLB entr=
ies,
> > I observed a 33% performance improvement in my file-backed folios recla=
im tests.
>
> nice!
>
> >
> > BTW, I still noticed a hotspot in try_to_unmap() in my test. Hope Barry=
 can
> > resend the optimization patch for try_to_unmap() [1].
>
> Thanks for waking me up. Yes, it's still on my list=E2=80=94I've just had=
 a lot of
> non-technical issues come up that seriously slowed my progress. Sorry for
> the delay.
>
> And I suppose we also need that for try_to_migrate().
>
> >
> > [1] https://lore.kernel.org/all/20250513084620.58231-1-21cnbao@gmail.co=
m/

Hi Barry, Baolin.

About the try_to_unmap part, I also noticed that patch and the comment
issue "We only support batched swap_duplicate() for unmapping" in that
patch. I guess one reason is add_swap_count_continuation right? That
limitation will be killed by swap table phase 3:

It can be previewed here:
https://lore.kernel.org/linux-mm/20250514201729.48420-28-ryncsn@gmail.com/

And I think we will be able to handle that much easier by then. Sorry
that it is taking a while to land upstream though.

