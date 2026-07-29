Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE785C54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 07:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B+khSEQMSChpw3NVSm/yYUm5aInBS3g6tlULYE5PXYc=; b=y8BofC7RQkE0ojwpnQXykUHYnE
	Oi6/eJ4hGQISlewCV4G79JiSIqKTggJ3jLgKIte4veztcTXOM4XlqCVwG7PlnfY1kLE5WbdpTGwnP
	30BJwPoDY6fLAATdq9mlRolvqr17W1hhMGa1ytBDhTq2WV85H7tcUrt3pa8C10fCXbWqaACdH+b9e
	WxvXgFOtZV7NshC5djAGIeipzT7y5FtYr6hC4HrZVysVM1H86/9qDNKTlzXjv+1cx6sNQIcSjg6KN
	Wf8RHe2gZcbaEJDxo1FOPTKsSkyIcZyc2zfrNjeTdmdm3WHnJfUhwWBjVp6fAv6cmJkHrZcC5Pv2I
	cm+OwupA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woyRa-000000075cr-26p1;
	Wed, 29 Jul 2026 07:11:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woyRZ-000000075cl-0AU6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 07:11:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 39AAD44F18
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 07:11:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 212F01F000E9
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 07:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785309068;
	bh=B+khSEQMSChpw3NVSm/yYUm5aInBS3g6tlULYE5PXYc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=eZ5o4w/Bf/q3d2ymEm7yvHn5t2k6KCdbK9EQosumr20lgtnsWc4kLOF9+b/7WBwBJ
	 wkXlA1q2+xStGLWbgGey+CHJPyrNFwSi5gynAfduQuIy387RNcCOXBRxzVIJ9KqxaD
	 0agKnMGJZTXMVi8FBDtqlshepL3gDpEXB0rTfMigH7RY4H4/u0kaRWywZPcD/9MXON
	 rrWEi5m3J+lTNVJ5JDiXXgF0DoM5it7X3IVeNlE12ZUT1mA3s5YtnO0qWMv+3sGkqG
	 C8RGLlq2euZ8COOxWPH+G+OjLpdOvSCCwnj7oIqOsdv0eSF9Ch8/v8sqAVSc5BrU7m
	 xIVQxWrcKw9dg==
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-9309d4ea213so58401285a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 00:11:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrBZ5y0OSmTsR180pIvPbCmNiZZbELKdeaCx2ovoo1pCrNB62I8yOGM3namnbW5UWVJQpLSh9XSz6MwzOtefG5m@lists.infradead.org
X-Gm-Message-State: AOJu0Yyf1sY6UgzWtaXBTpMXc3wARRXYXZDF60gK+xL9wahj9kj1NvIG
	TSLq4qD/hNIgsT6LGp6l4hWvQZ86NxZ1fKLclyEWlkF9ge2D7XVnhQ2eWqmG+aVvyGDSIsHHlu6
	WqrRxpO5MDT/xpIf0upSjqbxdzunaQz4=
X-Received: by 2002:a05:620a:26aa:b0:931:328:fecf with SMTP id
 af79cd13be357-933026acf83mr556175785a.26.1785309067407; Wed, 29 Jul 2026
 00:11:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260715120813.3609949-1-jiangwen6@xiaomi.com>
 <20260715120813.3609949-2-jiangwen6@xiaomi.com> <amiabgyHSz3ZYY5k@willie-the-truck>
 <CAGsJ_4zgFk1iaQWisYMOR4iFxonwDskRt3Gte0cEts1q9hxibA@mail.gmail.com> <3e5d7992-2f5c-4adb-a027-f8d266da40d1@kernel.org>
In-Reply-To: <3e5d7992-2f5c-4adb-a027-f8d266da40d1@kernel.org>
From: Barry Song <baohua@kernel.org>
Date: Wed, 29 Jul 2026 15:10:56 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4x3PO_fXCNch_Ca2hKn7BjgvLzzr+Sdg+devRUCjgfa7g@mail.gmail.com>
X-Gm-Features: AUfX_mwgraeCd_0quLGHIdabjJBuJlJK1eOJ6QyQ_MbqztWAuvAIzHpjSg2PzBU
Message-ID: <CAGsJ_4x3PO_fXCNch_Ca2hKn7BjgvLzzr+Sdg+devRUCjgfa7g@mail.gmail.com>
Subject: Re: [PATCH v7 1/7] arm64/hugetlb: Extend batching of multiple
 CONT_PTE in a single PTE setup
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Will Deacon <will@kernel.org>, Wen Jiang <jiangwenxiaomi@gmail.com>, akpm@linux-foundation.org, 
	catalin.marinas@arm.com, linux-mm@kvack.org, urezki@gmail.com, 
	Xueyuan.chen21@gmail.com, ajd@linux.ibm.com, anshuman.khandual@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	rppt@kernel.org, ryan.roberts@arm.com, dev.jain@arm.com, 
	Wen Jiang <jiangwen6@xiaomi.com>, Leo Yan <leo.yan@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Jul 29, 2026 at 2:46=E2=80=AFPM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
>
> > I agree that coupling hugetlb with vmalloc is not ideal. As I
> > explained to David, this has been an issue for a couple of
> > years and affects multiple architectures since 2021:
> >
> > https://lore.kernel.org/all/fb3ccc73377832ac6708181ec419128a2f98ce36.16=
20795204.git.christophe.leroy@csgroup.eu/
> >
> > where `#ifdef CONFIG_HUGETLB_PAGE` is required by `vmalloc`.
> >
> > So I'd prefer to address it in a separate follow-up patch
> > series.
>
> It's the perfect time to sort that out now :)

OK, looks like I'll be working until at least 1 p.m. again
today and tomorrow. :-)

Best Regards
Barry

