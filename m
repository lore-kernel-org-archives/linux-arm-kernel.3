Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE3CD711C9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 17:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K82r1s3WallUAKq8xTbVEjB6g6JIYaNpg7uvLlAPkQw=; b=SbWLv9oSAitEfCw3Xn3LL9EyrI
	pJgIyZ/GZqnvI4M6424fYfKWx3CjTJRmJqLflSFd/It4AdlynP82m9iu/mPdhQlBWG+0mW61Wglxs
	jLvcFK7KrdW34LV+D9YZeRCdHCxisOyhSsDpilOpDIddhOibiWCWMwyeOsXyCIbLoI5LXArUc3UD6
	62rXblY4wNcvDLwbvueZ0hCVNlLk6mT+P8d8BCf4/1xC3vZZcKMwPPmKNJ0ibM1m7Ma7twe1jmaQ6
	0nRkSdNA3axFSNmQIWkKSoOtcopRcmuXTsE5IDN7s+jdUsbAzEPIowolsVxhaRUgcsV5M2fbUIO/s
	AQOiNA8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDoSB-0000000FvAY-42Oe;
	Wed, 20 Nov 2024 17:25:23 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDoQg-0000000Fuuj-1aZR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 17:23:51 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2ea499f264fso921212a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Nov 2024 09:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732123429; x=1732728229; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K82r1s3WallUAKq8xTbVEjB6g6JIYaNpg7uvLlAPkQw=;
        b=cDcEuMch1sepgk//gghVv/5FFKk6I9BpsH+ZBMzS6JS5YDVTwdO8M/MlCC+x6fx3am
         WPeUcpuAADL8moK3vZaRCVae2tujidt1c+j+xxiV6O6JUfFEZj3wVRYrxap8yobUVLHq
         1xN2p8TqItfgmN2oiKhUt2n1BCtfz/3KI75oUWdt6Iq2wrWJ1bC6v1tPirdP9OfB9TtZ
         n3S2xz+n+sJtGoGS3INWcZBF73+bHh6xYkA13yCdmFROSug0rmuNMJ7Kt/rPlCOUdxk7
         /Kx3PjXsxUIftiHP2YE5s3d7LtmTbYO+p0/vZhZSjdnEh/oG11WVwZDEdKyfcprOjfBz
         5DNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732123429; x=1732728229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K82r1s3WallUAKq8xTbVEjB6g6JIYaNpg7uvLlAPkQw=;
        b=XHOt7FwLZfqeD548SQCat0EkM1E6wm4L2QUB6H7HbO2T2WTLhg3skLVB6uDTbz3xQB
         kGW+MgZkg3yBDYS1Grw1LJW/LS9AuCPOvHNHJMhndFq2ha/JvazYPjC12v3kaP8Vx+fj
         GjtcFORAoEI6WCWFZu5Mc9q5LnTqxiLOCu1oktAErkRbl3UO6vR5MpJpnh82IMw2Du9A
         KzE0iQ3P3/8wn7DyzMCBPJ+eKkqYNW50uHl8fHkeQptamg/mGp5nx22n40C4RAcJ30KR
         RhmGjI4ixVvPZsz9TkdZcJffbDNAlq6dQQje10u/1yDgdn9/x6z9jtffw7OWxyYKCsJX
         ZPRg==
X-Forwarded-Encrypted: i=1; AJvYcCX9lIb1J1wr52AHJkwW/iMtT4U0iAvpagFWgLMJZYsTu5WUJtluH7rGxPTX/GmR3US9ed/m1AlPMluCXXWMNhLW@lists.infradead.org
X-Gm-Message-State: AOJu0YxzvrhHs4GeNi99B2gUMjEhaIytF37OTgM22Lx6IbgLiMWqKLLE
	iHAqPNuLvSYqZdFXLUmM08o78JyiKOIDAJAdKQiVzqgmrLX1Tk6hoW4fBTIE3KwUz6I0+6D5zFm
	9pleh3cN885EzuQ7GBiHFrdwr+Q0=
X-Google-Smtp-Source: AGHT+IHP7MwwbUafLVgAIa430YYzk55icxxelHryoONobsnY3WSgX4XWdMcnoyaJxl1EXEi6b8slsuO4SxdmbK2qy18=
X-Received: by 2002:a17:90a:ae0e:b0:2ea:9f3a:7d9 with SMTP id
 98e67ed59e1d1-2eaebd1a85emr235585a91.3.1732123429227; Wed, 20 Nov 2024
 09:23:49 -0800 (PST)
MIME-Version: 1.0
References: <20241028010818.2487581-1-andrii@kernel.org> <CAEf4BzYPajbgyvcvm7z1EiPgkee1D1r=a8gaqxzd7k13gh9Uzw@mail.gmail.com>
 <CAEf4Bza=pwrZvd+3dz-a7eiAQMk9rwBDO1Kk_iwXSCM70CAARw@mail.gmail.com>
 <CAEf4BzbiZT5mZrQp3EDY688PzAnLV5DrqGQdx6Pzo6oGZ2KCXQ@mail.gmail.com>
 <20241120154323.GA24774@noisy.programming.kicks-ass.net> <Zz4IQaF9CCfjS28S@gmail.com>
In-Reply-To: <Zz4IQaF9CCfjS28S@gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 20 Nov 2024 09:23:36 -0800
Message-ID: <CAEf4BzYR44BgfAjKAvppmyG_hjojBL7XZe75C0qBTPoE7WXzHg@mail.gmail.com>
Subject: Re: [PATCH v4 tip/perf/core 0/4] uprobes,mm: speculative lockless
 VMA-to-uprobe lookup
To: Ingo Molnar <mingo@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	linux-trace-kernel@vger.kernel.org, linux-mm@kvack.org, 
	akpm@linux-foundation.org, oleg@redhat.com, rostedt@goodmis.org, 
	mhiramat@kernel.org, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	jolsa@kernel.org, paulmck@kernel.org, willy@infradead.org, surenb@google.com, 
	mjguzik@gmail.com, brauner@kernel.org, jannh@google.com, mhocko@kernel.org, 
	Andrii Nakryiko <andrii@kernel.org>, vbabka@suse.cz, shakeel.butt@linux.dev, 
	hannes@cmpxchg.org, Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, 
	david@redhat.com, arnd@arndb.de, richard.weiyang@gmail.com, 
	zhangpeng.00@bytedance.com, linmiaohe@huawei.com, viro@zeniv.linux.org.uk, 
	hca@linux.ibm.com, Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Kernel Team <kernel-team@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_092350_416073_D3C0738E 
X-CRM114-Status: GOOD (  23.76  )
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

On Wed, Nov 20, 2024 at 8:03=E2=80=AFAM Ingo Molnar <mingo@kernel.org> wrot=
e:
>
>
> * Peter Zijlstra <peterz@infradead.org> wrote:
>
> > On Wed, Nov 20, 2024 at 07:40:15AM -0800, Andrii Nakryiko wrote:
> > > Linus,
> > >
> > > I'm not sure what's going on here, this patch set seems to be in some
> > > sort of "ignore list" on Peter's side with no indication on its
> > > destiny.
> >
> > *sigh* it is not, but my inbox is like drinking from a firehose :/
>
> And I've been considering that particular series WIP for two reasons:
>
>  1) Oleg was still unconvinced about patch 5/5 in the v2 discussion.
>     Upon re-reading it I think he might have come around and has agreed
>     to the current approach - but sending a v3 & not seeing Oleg object
>     would ascertain that.

Is this about Liao's siglock patch set? We are at v4 (!) already (see
[0]) with Oleg's Acked-by added.

>
>  2) There was a build failure reported against -v2 at:
>
>        https://lore.kernel.org/all/202410050745.2Nuvusy4-lkp@intel.com/t.=
mbox.gz
>
>     We cannot and will not merge patches with build failures.

This one is about this patch set (speculative uprobe lookup), right?
It is already at v4 ([1]), while you are mentioning v2 as the reason
for this to not yet be applied. Those build failures were fixed *a
long time ago*, v4 itself has been sitting idle for almost a month
(since Oct 27). If there are any other problems, do bring them up,
don't wait for weeks.

>
> Andrii did get some other uprobes scalability work merged in v6.13:
>
>     - Switch to RCU Tasks Trace flavor for better performance (Andrii Nak=
ryiko)
>
>     - Massively increase uretprobe SMP scalability by SRCU-protecting
>       the uretprobe lifetime (Andrii Nakryiko)
>
> So we've certainly not been ignoring his patches, to the contrary ...

Yes, and as I mentioned, this one is a) ready, reviewed, tested and b)
complements the other work you mention. It removes mmap_lock which
limits scalability of the rest of the work. Is there some rule that I
get to land only two patch sets in a single release?

>
> Thanks,
>
>         Ingo


[0] https://lore.kernel.org/linux-trace-kernel/20241022073141.3291245-1-lia=
ochang1@huawei.com/
[1] https://lore.kernel.org/linux-trace-kernel/20241028010818.2487581-1-and=
rii@kernel.org/
[2] https://lore.kernel.org/linux-trace-kernel/CAEf4BzYPajbgyvcvm7z1EiPgkee=
1D1r=3Da8gaqxzd7k13gh9Uzw@mail.gmail.com/
[3] https://lore.kernel.org/linux-trace-kernel/CAEf4Bza=3DpwrZvd+3dz-a7eiAQ=
Mk9rwBDO1Kk_iwXSCM70CAARw@mail.gmail.com/

