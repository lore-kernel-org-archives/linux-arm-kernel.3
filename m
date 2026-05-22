Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C84CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 21:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C1JkI15vgeu08xV//dtK9AYlWM5a5o5EUbaFA14ty+I=; b=BokVzcWUp/HRBaDM68o86ZJf7K
	U0I2rHzODGVt/JmKNkPiUkjBLzIIDmwLqwWPaJNgQA6kxc89uyG2CEDOtRa8Se+akFZrm4u5VCc9Y
	W/Kxwwu/kug1CxM6rCSl630Gr6iWNCQooT9d/rTqmudwLDLzv4TsYstKRkk8nb+jp1lX+giFsFyi3
	at5bo5NUlSsEGQKgTQF4L/JFFbFKCMkaEvJbc4MjvzOP0lREKXLhmDc6SRpVliIJJvr3jxaU79j98
	PkFVwC6MKybBPy4jqOPMGjOxYNBkkwNGn4urEq8EJoS8y56yyinexrH7g3UATE33zhd2r+UH0qdXu
	5TPhiaTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQXSj-0000000Bzr4-1L4F;
	Fri, 22 May 2026 21:31:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQXSg-0000000BzqC-3dIt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 21:31:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3ABA5445C6
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 21:31:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 228F41F0155F
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 21:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779485478;
	bh=C1JkI15vgeu08xV//dtK9AYlWM5a5o5EUbaFA14ty+I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=BZkBhq1dEMkxCJHLGd9hHIZUnfovj2cBcOHoma7ZqB1sV0+I2O6Ds5hTpwlWo4Mft
	 6cZWdkrBC8UapaBAwm7wTsgf6f8+bsxbXBKEVD6N264a0/eS6r2rdb08YfLVaVXRFl
	 DCfthOwfboPEVZicSPecr1WRFLBuk1+P+LgQEe3wX84so6iEX2i0ZTBrRDglX2hSFx
	 U8IUrYW8hVgwjP8B7VfqK2I0t+/0+rbDVSJLqQ9PbEvde4WIlEtliG3txUqHXy/bwe
	 ykb+eAMoCx2v1OrYATTHe26u6dEHYIyLuKR8dX7rGXbs6//A4IoVMdKRjJahE4F5l7
	 5hZy1XYN8h40Q==
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-50fb8e9a4edso92197651cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 14:31:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/zo09r0roOugtD9JVbwIQImB3E+VXvpWGfo8OqWn+BoA5Eq+d5AbwraLE/q1KYSCUJnz9ZFvQ2gIIOWgrbep6B@lists.infradead.org
X-Gm-Message-State: AOJu0YwIzUTyfJm9ZmKg7tI64ZkbtkfwIDLwpEzTUDd2+BLc0OsboutP
	xkPes+C3JvHuh851ubCa33ilrnACHisBbA+HMvPq2D5ZOjzp1WwTIif+30QqPeef+dfYy4FDFd8
	COC2vHuOLqIs+NSaNTPbqWlwgz0ts5q8=
X-Received: by 2002:a05:620a:372a:b0:914:c100:6a0f with SMTP id
 af79cd13be357-914c10072a4mr332092285a.23.1779485477280; Fri, 22 May 2026
 14:31:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAGsJ_4zqLfdWoTH9s7FFaqWWj0mESfikYgr7=GcV64qcuXrPxA@mail.gmail.com>
 <CAJuCfpE0WQrB3zJp9qn3jvn5DthS=ttpX7gJJvyEhA_BJGrp5g@mail.gmail.com>
 <CAGsJ_4zgeE3ebEJ+j7GJFzWVoVYHeiOn4dOoOsmWCLA6s=oECQ@mail.gmail.com>
 <5zdaa5uv5oj27q3taopl3amops57ouxgyfsdveudz4ovmbdw7z@6lwrlyvmhcp2>
 <CAGsJ_4yKxg1QugcsJi3WD0KVGJKe-zXycgm5D6cRi9vWtNcpDQ@mail.gmail.com>
 <ag4h87CBd-gph9zX@casper.infradead.org> <CAGsJ_4zA8afu0xXy0WS+tMe-eesDX1W6UBmfAsuouUpcAgK8JQ@mail.gmail.com>
 <ag4kj84EcKqamdB-@casper.infradead.org> <3be9475b-0e8a-4df8-a130-4262f993973d@kernel.org>
 <CAGsJ_4xC5LdhuoWV1=tK-RZ5rkjc8aOKOkmb1L_8BG_3gtJhDg@mail.gmail.com> <ahB6QyHgYq8ksj65@lucifer>
In-Reply-To: <ahB6QyHgYq8ksj65@lucifer>
From: Barry Song <baohua@kernel.org>
Date: Sat, 23 May 2026 05:31:05 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zxLvZ01i19vdo0xA47T1hxa1VRYvxLmiDhy5q1GDKPRg@mail.gmail.com>
X-Gm-Features: AVHnY4IqrepDwpGO5qDQsSaxTVFULk1Thk0Uu8QgQ0mfUUrDDRbDPxaWPMcP1VU
Message-ID: <CAGsJ_4zxLvZ01i19vdo0xA47T1hxa1VRYvxLmiDhy5q1GDKPRg@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org, 
	linux-mm@kvack.org, vbabka@kernel.org, rppt@kernel.org, mhocko@suse.com, 
	jack@suse.cz, pfalcato@suse.de, wanglian@kylinos.cn, chentao@kylinos.cn, 
	lianux.mm@gmail.com, kunwu.chan@gmail.com, liyangouwen1@oppo.com, 
	chrisl@kernel.org, kasong@tencent.com, shikemeng@huaweicloud.com, 
	nphamcs@gmail.com, bhe@redhat.com, youngjun.park@lge.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	Nanzhe Zhao <nzzhao@126.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_143118_939771_2AB89914 
X-CRM114-Status: GOOD (  20.32  )
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

>
> Again this is making me want to sit outside and sip on some lemonade and
> ice :)
>
> Yes - android processes are aggressively multi-threaded, sure of course.
>
> The missing bit here is the forking - what, where, why, when?
>

I really want to know the what, where, why, and when
as well. But since most applications are not
open-source, it is basically a black hole for anyone
other than the owners of those apps.

Let me try to do more investigation to understand what
is going on, although it is really hard.
To be honest, I would rather the Android framework
completely prohibit apps from calling fork(), if
possible.

> And then you say zygote is sometimes multi-threaded but sometimes
> single-threaded, which is adding a whole bunch of confusion on top of all
> that.
>
> I don't find these stack trace dumps all that useful (though thanks of
> course for taking the time to gather them), I think we'd be better off with
> specific data on forking, in some _concise_ _summarised_ form, ideally with
> numbers.
>
> There's such a thing as too much information :))

This trace shows PF I/O in one thread overlapping
with a fork() call in another thread.
But as I explained, I really do not know what kind of
user behavior is behind it.

>
> Anyway, again, please let's see a new _RFC_ with the approach proposed by
> Suren, with some _succinct_ data demonstrating _exactly_ what the problem
> is, so we can make some headway here.

Okay, sure. Thanks for your patience.

>
> And now I'm off for a cornetto! :)

Sounds good :) Enjoy your cornetto!

Best Regards
Barry

