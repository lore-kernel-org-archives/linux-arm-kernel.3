Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C31D9F531CB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 19:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jObOnXozybWQ3WR8NjHaugETmwef5C6VjxGvGmeLlEc=; b=j7qn2y3flda1Z95AEgn5lyYX1n
	hnQsjGAEeOSeTkQSQObeeSnH7HNEONQVenI106htId6pzGLjfLzhIp2eY8vm/kOiVBlm4cD1IOIXj
	TxMILgYnYwZiZ0MGGAqqiS6VnYbNtS48wSximOO1BemHZKyEJ8sk9uXAoM26YAxNNN2TJj10kqxpD
	QT/t64LAbqL7jRdIxw8z0y7YfoiwdUe1WTHbGFPgfMFDNGXe7Ia76oFFLa6cIuvZz8wxs4/pEJj0N
	b8m//PtI4PueeaChtYmsnhdpR3HUbSFX4dyqEewJ6TGyV+kPZ4QnimsFSki56+Ks9j7e9bozWKLLi
	6wiFkG2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCNOV-0000000GKdf-2Kjl;
	Mon, 13 Apr 2026 19:56:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCNOS-0000000GKcp-2BWD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 19:56:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EE1F74424E
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 19:56:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDDB9C2BCB8
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 19:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776110183;
	bh=jObOnXozybWQ3WR8NjHaugETmwef5C6VjxGvGmeLlEc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ndjJELwQ00jfUUu4QE3U7V/TbuRaLlN9kEjgdJZDUuCcEISM/NnLTyLrzcs+K9BJ1
	 fI8nv3O6Mpfy/cpFrC9D/0QZ7ciR8i0hz7mlaGQszBwWozyQ7r5V1HXV/xSCT0Sw7s
	 hkXSuekC19dp6LI0q1XVF/AdBon2kMgJps4F3hdM581LZnENOmhla88LMlNLxWGY8X
	 nkKbtoPr+5s1J64i+d6/sVQWUdflVO8s8AvOf0B4Z+X3isOjwrDjd0ZprEZOpRMD0h
	 5KeGku2mxlOJHfdTerlNkDdw7qCjO5jAK3r2DJYE12+Sa7QkEVZL7nemm4kWTo3oxV
	 NADvmXqffDfUw==
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8a3342d301aso49187746d6.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 12:56:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+NGdaKmVAWBC0MC8cgJqt/wjvCBoAN9miuZewwYqSP3zxhisR4CaYgYkjk0A2dJ0SxPDf3NB1J+KhwgnzDuc6V@lists.infradead.org
X-Gm-Message-State: AOJu0YzriHUnisUBfs+WlM6TnCHmM4QQ7P7cUSETbCFwDsWYFPMH5IOg
	e8+99c4aIRVNBKYf8sKG/jFBChdDhmoU38hAKiQgIUUm/kx1ckG4ke8LRXmrPsGLtawEaMjQiqY
	PApqeZ8XomKF5ml0GZXbYW9fd5l/pfx0=
X-Received: by 2002:a0c:f089:0:b0:89c:3f22:c89e with SMTP id
 6a1803df08f44-8ac861fd45amr198886606d6.24.1776110183171; Mon, 13 Apr 2026
 12:56:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260408025115.27368-1-baohua@kernel.org> <20260408025115.27368-6-baohua@kernel.org>
 <c54e12b0-1a35-48e1-b243-991de246a8ca@arm.com> <CAGsJ_4yL3Y1Sr0MjTd6=ROC0jKf4JkCqNPODMh-m155rUFcS9g@mail.gmail.com>
 <add9XGTYL9sYilqO@milan> <CAGsJ_4xcCjDdFXrbhh1bJW2xT0_mx8T43yNHWCahZ3fBBqU5CQ@mail.gmail.com>
 <1ed24e47-538a-493d-bf37-af76a789ce76@kernel.org>
In-Reply-To: <1ed24e47-538a-493d-bf37-af76a789ce76@kernel.org>
From: Barry Song <baohua@kernel.org>
Date: Tue, 14 Apr 2026 03:56:11 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4wCBeVfyFraj_dRdsUrSNqDG5a8SO9C3=PFRSt04dRvGw@mail.gmail.com>
X-Gm-Features: AQROBzDWhDQICY-Pnn48ck6WscmI_XxZpwQTOCJY4g88d1Mu5VWOkHuK1ofhJd8
Message-ID: <CAGsJ_4wCBeVfyFraj_dRdsUrSNqDG5a8SO9C3=PFRSt04dRvGw@mail.gmail.com>
Subject: Re: [RFC PATCH 5/8] mm/vmalloc: map contiguous pages in batches for
 vmap() if possible
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Uladzislau Rezki <urezki@gmail.com>, Dev Jain <dev.jain@arm.com>, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, 
	will@kernel.org, akpm@linux-foundation.org, linux-kernel@vger.kernel.org, 
	anshuman.khandual@arm.com, ryan.roberts@arm.com, ajd@linux.ibm.com, 
	rppt@kernel.org, Xueyuan.chen21@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_125624_605929_3D961984 
X-CRM114-Status: GOOD (  13.43  )
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

On Tue, Apr 14, 2026 at 3:24=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 4/10/26 03:02, Barry Song wrote:
> > On Thu, Apr 9, 2026 at 6:20=E2=80=AFPM Uladzislau Rezki <urezki@gmail.c=
om> wrote:
> > [...]
> >>>
> >> It would be good if you could combine the work together with Jain.
> >>
> >
> > Sure, thanks! After discussing with Dev Jain, we=E2=80=99ll also
> > support non-compound pages in the next version.
>
> Will there be a v3 or should I review v2?
>
> https://lore.kernel.org/r/20260404084333.55984-1-baohua@kernel.org

Hi David, sorry for the confusion. During development, I
found many more opportunities across vmalloc, ioremap, and
vmap, so I dropped the original approach that only targeted
vmap.
Let me reply there and say that it has been withdrawn.

>
> --
> Cheers,
>
> David

