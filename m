Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 920B7CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 05:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1JwAfOvfHWiveHwG3B+VPqzu+ErYo2MF7kqHuEps3qs=; b=u80BNZscTqLW8vEWSMZYckGNXm
	w+Usa5tt+eZOjZkFAjUNJQo1KCGXh0FDG6DY1PVoSPjdjwrQWyqYS6b37OtCTanmQxDJV/lXObCed
	/zuJDVlzPfAsbxygz0enzMB9Au36DrG4Dc/xIj4evvhgDOz/AHwWMqjkM22vg5EpcdGp9sz1e2lnG
	m0u4GLZnEAGVKqk+wMtFt2YP/Zfq35M6+i7qX6JtBuGD3Gs8LSam3/HD0NrfoLjSqIKmSzjc6IXfl
	ryt2LiIAOo2sGaLBzslMknFBGeZX70tXGRNrhSw2yvUzeVvO9wxZWa+9a1xFpdMsC+2PxCeFxmeIO
	qGb55eAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCAAc-00000008GFM-1uEN;
	Fri, 24 Oct 2025 05:16:58 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCAAa-00000008GEb-1U2q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 05:16:57 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-33bb3b235ebso3699769a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 22:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761283015; x=1761887815; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1JwAfOvfHWiveHwG3B+VPqzu+ErYo2MF7kqHuEps3qs=;
        b=YxcyDYZ2U2kEYYkgRtd/AtpBR8KDZRYd/S7tE7wS/Bi0DaBjoTZvTWFDQD/ZEpIIBs
         P4B+oKEid+TEW7fDBJn1on6YQHjgK3+jmTscAfI1UGoIR7ZC7gij1tCTxC8z9M/6n5mZ
         y9ElsiwKvtLJPlr3ODL4yU1xijWPiuXgKUTIK3Ms2d/zlx2FFz2CXkvOWRV0u33HlkM6
         usxZoKOKk/U52skJbQibNu+pUT4A+EYkQ4FYNiL78g0OLgx9QEmfR3QOTHbHjof/d9n3
         C16zIC6DajquOoFeoCOkr+0+pfk/R5VyRo3ntjngy2UhxMlXQFBxpjMEEcXjf3Uu7N0Z
         s/+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761283015; x=1761887815;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1JwAfOvfHWiveHwG3B+VPqzu+ErYo2MF7kqHuEps3qs=;
        b=oMXwJCg1BWN3i06rpuq1CSC29UChg2kYUEstjYTb3NvtToEOliJE6cesI4xWrPpgUs
         0cWRpzU6s3qN+vOaNrjVU2rbkXvX3IwJVwSaaM7Xc/xU/fY37NRLWAk4Ige6pkFIqTCa
         UekMj3nw5rLNLVR0UJ7z2E65lXhMdrTKJwZ59hP8aK/dtjIczp3qhxXS5DoXuAh1lzQU
         VYp47jsUbWKr8TUD8oTyioSFaipT3VjE3IaUB+ybHaqFofxKjR5CL9rCK8C4ofeH1K6v
         wNbTVBhGv+47hyNBV/+/kTWkt6eKKLyImqAushxQrITOJ44rLASalhzrQymLmFg/dkhG
         wIjA==
X-Forwarded-Encrypted: i=1; AJvYcCWjCpU3Yj7SMVaNxdOxuHu2gRaJooHxnikXDtmqqF046qL7qleJzpeCsasYzujaW2kZVQ0eSuHHSWHMcRI9PvsZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxEN2Xy2e6UcoBc6uTgueogl7TO6Nu5n67EZz21HFgU8k53qYtD
	8aZ18jMyF0wPjBkW6dJzCbyN3NoVD+tlNzR2iObwW30UWFxeNYc4D5MwVX1GzdGUUMjerbNCii3
	OPJS8LA==
X-Google-Smtp-Source: AGHT+IFxT94+rQGdQ1s8VDmzk/KuJ8lt96XLnKSdy7VNhFGvy0hrjNSBNuZhWw/inI+IBcmkkRvS1vw5Cn4=
X-Received: from pjob8.prod.google.com ([2002:a17:90a:8c88:b0:33b:51fe:1a7a])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d610:b0:33b:da53:d116
 with SMTP id 98e67ed59e1d1-33fd660fe13mr1382618a91.26.1761283014686; Thu, 23
 Oct 2025 22:16:54 -0700 (PDT)
Date: Fri, 24 Oct 2025 05:16:42 +0000
In-Reply-To: <0bfa4895-727b-407b-90d2-7d54b9bd4910@intel.com>
Mime-Version: 1.0
References: <0bfa4895-727b-407b-90d2-7d54b9bd4910@intel.com>
X-Mailer: git-send-email 2.51.1.851.g4ebd6896fd-goog
Message-ID: <20251024051653.66329-1-kuniyu@google.com>
Subject: Re: [PATCH v1 2/2] epoll: Use __user_write_access_begin() and
 unsafe_put_user() in epoll_put_uevent().
From: Kuniyuki Iwashima <kuniyu@google.com>
To: dave.hansen@intel.com
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, axboe@kernel.dk, bp@alien8.de, 
	brauner@kernel.org, catalin.marinas@arm.com, christophe.leroy@csgroup.eu, 
	dave.hansen@linux.intel.com, edumazet@google.com, hpa@zytor.com, 
	kuni1840@gmail.com, kuniyu@google.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mingo@redhat.com, 
	mpe@ellerman.id.au, npiggin@gmail.com, palmer@dabbelt.com, pjw@kernel.org, 
	tglx@linutronix.de, torvalds@linux-foundation.org, will@kernel.org, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_221656_386065_F3568BBA 
X-CRM114-Status: GOOD (  12.99  )
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

From: Dave Hansen <dave.hansen@intel.com>
Date: Thu, 23 Oct 2025 12:40:59 -0700
> On 10/22/25 17:04, Kuniyuki Iwashima wrote:
> > --- a/include/linux/eventpoll.h
> > +++ b/include/linux/eventpoll.h
> > @@ -82,11 +82,14 @@ static inline struct epoll_event __user *
> >  epoll_put_uevent(__poll_t revents, __u64 data,
> >  		 struct epoll_event __user *uevent)
> >  {
> > -	if (__put_user(revents, &uevent->events) ||
> > -	    __put_user(data, &uevent->data))
> > -		return NULL;
> > -
> > -	return uevent+1;
> > +	__user_write_access_begin(uevent, sizeof(*uevent));
> > +	unsafe_put_user(revents, &uevent->events, efault);
> > +	unsafe_put_user(data, &uevent->data, efault);
> > +	user_access_end();
> > +	return uevent + 1;
> > +efault:
> > +	user_access_end();
> > +	return NULL;
> >  }
> >  #endif
> 
> This makes me nervous. The access_ok() check is quite a distance away.
> I'd kinda want to see some performance numbers before doing this. Is
> removing a single access_ok() even measurable?

I noticed I made a typo in commit message, s/tcp_rr/udp_rr/.

epoll_put_uevent() can be called multiple times in a single
epoll_wait(), and we can see 1.7% more pps on UDP even when
1 thread has 1000 sockets only:

server: $ udp_rr --nolog -6 -F 1000 -T 1 -l 3600
client: $ udp_rr --nolog -6 -F 1000 -T 256 -l 3600 -c -H $SERVER
server: $ nstat > /dev/null; sleep 10; nstat | grep -i udp

Without patch (2 stac/clac):
Udp6InDatagrams                 2205209            0.0

With patch (1 stac/clac):
Udp6InDatagrams                 2242602            0.0

>>> 2242602 / 2205209 * 100
101.6956669413194


I also took a microbenchmark with bpftrace and we can see
more invocations of ep_try_send_events_ns() finish faster,
and 4% more total calls:

$ sudo bpftrace -e '
k:ep_try_send_events { @start[cpu] = nsecs; }
kr:ep_try_send_events {
 if (@start[cpu]) {
    $delay = nsecs - @start[cpu];
    delete(@start[cpu]);
    @ep_try_send_events_ns = hist($delay);
 }
}
END { clear(@start); }' -c 'sleep 10'


Without patch:

@ep_try_send_events_ns:
[256, 512)       2483257 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|
[512, 1K)         850735 |@@@@@@@@@@@@@@@@@                                   |
[1K, 2K)          254027 |@@@@@                                               |
[2K, 4K)           26646 |                                                    |
[4K, 8K)            1358 |                                                    |
[8K, 16K)             66 |                                                    |
[16K, 32K)             3 |                                                    |

With patch:

@ep_try_send_events_ns:
[256, 512)       2844733 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|
[512, 1K)         733956 |@@@@@@@@@@@@@                                       |
[1K, 2K)          166349 |@@@                                                 |
[2K, 4K)           13495 |                                                    |
[4K, 8K)             526 |                                                    |
[8K, 16K)             63 |                                                    |
[16K, 32K)             5 |                                                    |

>>> (2844733 + 733956 + 166349 + 13495 + 526 + 63 + 5) / \
... (2483257 + 850735 + 254027 + 26646 + 1358 + 66 + 3) * 100
103.95551329999347


> 
> Also, even if we go do this, shouldn't __user_write_access_begin() be
> called something more like unsafe_user_write_access_begin()?

Sounds good.

