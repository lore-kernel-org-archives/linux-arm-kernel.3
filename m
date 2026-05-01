Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A22CD3423
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 17:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9YAd4wJdBuwvuhq3A/51ZtTu6jgeC0RYN/Swb2V6zYA=; b=HmVRjb6KAjbD0DaTgY2mXKlm2j
	JX5tWig+dvaL6Tbq/Bf2CGhCuZqQzfjYcmt6haLewtLY677/YJC4DfhL3fNiKTg2AYFvgZ8ZlXkOA
	+hqxIRyAD9uIIeck0I31tH94Vji2nw8TNEJN1yN/0W72V12SEpXlysXerYCRJ49fjEfBv+QlO/XP7
	BXw9cjMLROckgndr5VIZc9/PTRu0m74WaRKI++F+xucH4XWRlI9CT1WjGC/Bvj/2avo8zBgBmUk41
	6N8CI/RXqQnAg9o4C8ccQ4Bgu5fJMJLnNy14Ea4Snnhh5J50cDE1htJeALhbf4ULAIIJZE3vmw1u5
	wrNeBpFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIrv1-00000007We0-0OUU;
	Fri, 01 May 2026 17:44:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIruy-00000007WdJ-2oUv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 17:44:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6BAE344554
	for <linux-arm-kernel@lists.infradead.org>; Fri,  1 May 2026 17:44:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48EE2C4AF09
	for <linux-arm-kernel@lists.infradead.org>; Fri,  1 May 2026 17:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777657487;
	bh=Hl2YiWTcbo74Gxc6IpUU70j+aHuYqyHn+c9GqocmPS0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cokKUJ4cVjTc6Fh+umuWaKXjfGu696YYSrhlsdu275noHQdipmmX0gkSiihTIc2Sl
	 fpYV1mlggK7Yc6cXYI+XurdET3PGISSUYmW2rPT5S58wxIfAaO5cGneYrdxbKBfIlB
	 XZEkY0bHXwj5IHxfWfRQxZg9bVbm6Czf+haANPTe/D+0YAlQo7B5g+S/t38bZMqyZA
	 Hvwafr5cJ0ewDjxPrc13qWWQ0oTeI8rTw7+kBgHhpYucb3owFD/0kIrKesBp3DFJve
	 SXoo+/ZlI3WZftzrouDPSabfXV4IkYxfnkLGV13yzz1iWbpLIbSY4Ytn/c7yT/Hw0B
	 9r576Ai8d9MRA==
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8b45dff1eebso17804536d6.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 May 2026 10:44:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/Kvgg/93X8H8DPaaiuvxrrFzysNo+Rn68dBplSYHtRF6KY3dZ/koUIKjVV8Yc/V4sayG28tz/P2IApP14ugn8P@lists.infradead.org
X-Gm-Message-State: AOJu0Ywl9bJOc/NIx/jYqyjSu7ZIBCgqoE+NRK0RN3WUe2lrBle9pMyM
	nre8foP40EXj41COt0uUdPa5cjiTlkPwqdEV2hvHTqgGS63cuclpC9Xc5TksgVlrOh5H9K+WHxC
	tyB3nSWr7gahBNy6Gi83WfpLcL7tL1ls=
X-Received: by 2002:a05:6214:260a:b0:8ab:4ab9:bb50 with SMTP id
 6a1803df08f44-8b668638bfamr8385726d6.37.1777657486245; Fri, 01 May 2026
 10:44:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260430040427.4672-1-baohua@kernel.org> <afNM-gIqxpyJ6ro7@casper.infradead.org>
 <CAGsJ_4w0qcYmukHqsyRd0jomoyYkJjOt8b-Cgp53BgP-8QQghw@mail.gmail.com> <afS_L-5XeWIldTXA@casper.infradead.org>
In-Reply-To: <afS_L-5XeWIldTXA@casper.infradead.org>
From: Barry Song <baohua@kernel.org>
Date: Sat, 2 May 2026 01:44:34 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4wk=SDtgin+84Ev2TamU-JFfmrg_SUay=-tcYmnFvK6Nw@mail.gmail.com>
X-Gm-Features: AVHnY4L9r5jHmXxuaat24ga_fMfUkn2-2M0MEFhZDB6ITf6AdiWvpvcS2QZoKTw
Message-ID: <CAGsJ_4wk=SDtgin+84Ev2TamU-JFfmrg_SUay=-tcYmnFvK6Nw@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
To: Matthew Wilcox <willy@infradead.org>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, david@kernel.org, 
	ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, 
	surenb@google.com, mhocko@suse.com, jack@suse.cz, pfalcato@suse.de, 
	wanglian@kylinos.cn, chentao@kylinos.cn, lianux.mm@gmail.com, 
	kunwu.chan@gmail.com, liyangouwen1@oppo.com, chrisl@kernel.org, 
	kasong@tencent.com, shikemeng@huaweicloud.com, nphamcs@gmail.com, 
	bhe@redhat.com, youngjun.park@lge.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_104448_735865_27FB056D 
X-CRM114-Status: GOOD (  18.52  )
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

On Fri, May 1, 2026 at 10:57=E2=80=AFPM Matthew Wilcox <willy@infradead.org=
> wrote:
>
> On Fri, May 01, 2026 at 06:49:58AM +0800, Barry Song wrote:
> > 1. There is no deterministic latency for I/O completion. It depends on
> > both the hardware and the software stack (bio/request queues and the
> > block scheduler). Sometimes the latency is short; at other times it can
> > be quite long. In such cases, a high-priority thread performing operati=
ons
> > such as mprotect, unmap, prctl_set_vma, or madvise may be forced to wai=
t
> > for an unpredictable amount of time.
>
> But does that actually happen?  I find it hard to believe that thread A
> unmaps a VMA while thread B is in the middle of taking a page fault in
> that same VMA.  mprotect() and madvise() are more likely to happen, but
> it still seems really unlikely to me.

It doesn=E2=80=99t have to involve unmapping or applying mprotect to
the entire VMA=E2=80=94just a portion of it is sufficient.

BTW, the chain can propagate: a page fault occurs, B wants to write this
VMA, and C (a higher-priority task) wants to write another VMA. D may need
to iterate VMAs under mmap_lock, so B can end up blocking both C and D.

