Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D936CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 13:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C7jCFBMio8K0Or68UFlDneGQgQYEn3dFY8g5R8vlQ3k=; b=y0KavvrxkZsoC0WqbhFfXaSkfh
	tc/Gd/yA0BmRYFZOgqMpw/D4Kmf9JZtBWGqwEh+9vpGBgqjK6CTLCmCK7sIgcgNfxYlLzcsI8zV2i
	JgNxr9c5GtS2xsZP790eD80Y9HiFzlhF4tr3Wf3nSXDigpp3LeGxg56OTDv0weJZvfnNJ0TnbM4yR
	/zYAvESs5VXcSuz3CmwvE5V/I0qszQg8ha2/hJqZTsfIn7nOfDEs7/gjuKTxkOLx0GSW467LLt+6v
	ufD3tYC1wDAbQHWptESwwHf0hJaQwfWNoUvS054VY52wuZKn52N1SID90dU5xpwfVXfPqd0rJcvCN
	nduwTuKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQQ3k-0000000B09Y-3f24;
	Fri, 22 May 2026 13:37:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQQ3i-0000000B08b-0ytA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 13:37:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D3110445B5
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 13:37:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB15D1F01565
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 13:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779457021;
	bh=C7jCFBMio8K0Or68UFlDneGQgQYEn3dFY8g5R8vlQ3k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=M1Lmx69EaUGXfKI/c4USdBvuLwGQ+/xDCp4Vp2puVY6ZVXRCDmufSHznXa+ntyhXN
	 R03Kuwv1AprVs4yPERWo4NbQ6lZsPmO6iCC/9GUirAMY0+M+mHVmM67vgiOEeQfZjX
	 qH2DVgBBbWmPXsgRifjPILuXvi3SJLcMXcM0wbWNl8qhQGF1QfErk7I7BNcOxwV9vI
	 u01x6beglrUnWbWd7SFgp6j4isuYGa2aNX+AvmEUhYmNcdfuvnZ1//oQzj2LfcTXcS
	 qARUt+2asSCPw+6P5/HdLjtNTDO/B6LGeXnFuulXp+QDrIVZut92w0VUlrkRn2AB2G
	 8trVtwiDj10mg==
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-914b5f85129so71829885a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 06:37:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+6lIyszniOgzFlCvD4L30CGbluXy5Nhep/cuvY6QiUjNrjtGrXWXsYR9MI+cfV/TazTID8XwOfC1x3eHZG1mGM@lists.infradead.org
X-Gm-Message-State: AOJu0Yw86cP/GdD8oCo35ndeVTmFDd0Ct+dF1+heWy5LAogB83rsxbC2
	e9wvZTndqlqnIetopALKwlq1zlQCqg3x1LE9GTpQI5HXQIMKbSJYAw8FFu0wTRTuS6vlJMnlJN3
	Acq9AjXYrm0fhcRnwDS7LE7KzqvHgpk0=
X-Received: by 2002:a05:620a:6504:b0:8cd:b2e9:b964 with SMTP id
 af79cd13be357-914b46c93e1mr518488285a.10.1779457020872; Fri, 22 May 2026
 06:37:00 -0700 (PDT)
MIME-Version: 1.0
References: <ag4kj84EcKqamdB-@casper.infradead.org> <20260522023305.98223-1-baohua@kernel.org>
 <ahBVh4NM2uoyhPNm@casper.infradead.org>
In-Reply-To: <ahBVh4NM2uoyhPNm@casper.infradead.org>
From: Barry Song <baohua@kernel.org>
Date: Fri, 22 May 2026 21:36:47 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zQuJx1reJxgV387Gh0AqWF0KdoFn9KahQ1BNLPRm57TQ@mail.gmail.com>
X-Gm-Features: AVHnY4LaSBeriPtvEQSWcigqMwNrFp0xeuPJ9HmpgpM3WX7gXW9tFi64IFdXgU8
Message-ID: <CAGsJ_4zQuJx1reJxgV387Gh0AqWF0KdoFn9KahQ1BNLPRm57TQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
To: Matthew Wilcox <willy@infradead.org>
Cc: akpm@linux-foundation.org, bhe@redhat.com, chentao@kylinos.cn, 
	chrisl@kernel.org, david@kernel.org, jack@suse.cz, kasong@tencent.com, 
	kunwu.chan@gmail.com, liam@infradead.org, lianux.mm@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	liyangouwen1@oppo.com, ljs@kernel.org, loongarch@lists.linux.dev, 
	mhocko@suse.com, nphamcs@gmail.com, nzzhao@126.com, pfalcato@suse.de, 
	rppt@kernel.org, shikemeng@huaweicloud.com, surenb@google.com, 
	vbabka@kernel.org, wanglian@kylinos.cn, youngjun.park@lge.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_063702_292875_7D8F94F3 
X-CRM114-Status: GOOD (  12.44  )
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

On Fri, May 22, 2026 at 9:09=E2=80=AFPM Matthew Wilcox <willy@infradead.org=
> wrote:
>
> On Fri, May 22, 2026 at 10:33:05AM +0800, Barry Song (Xiaomi) wrote:
> > need to touch `filemap.c` at all (probably because you are already
> > maintaining `filemap.c` perfectly):
>
> I'm going to give you one chance to apologise for that.

Apologies if my wording caused any misunderstanding.
That was not my intention at all.

What I meant is that filemap.c already has a very
solid design.

For memory.c, I had to touch several places for the
blacklist; otherwise, the kernel would hang.

But for filemap.c, I basically didn't need to touch
anything, and preliminary testing shows no issues after
moving it from the whitelist to the blacklist. This is
probably because the current filemap.c design is
already handling some aspects really well.

That is all I meant.

