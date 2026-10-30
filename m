Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5B3606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 04:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PvRKBkqg;
	dkim=pass (1024-bit key, unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=NJPsdvAy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WwvcOsEObJ8qzzuuobsmrvvwKxGTjF3cc2+TTpbW1e0=; b=PvRKBkqgWQHkXDs26GNt+wSJik
	9CIQ+SQ2wxoO2x/6H8SbmcMwJWwLrF8weUfTdCP8MpfTBkszDGmEvBHSdCRjHSG1mX3D8bmKnQuJl
	UWsyl2glSUPZsPdYFtVWInvHMP4DtVs0XAt5uj0q0k7KzPawAdVOfONKFSoltoWCj8vgqpRbxmL3u
	1hI3tvtJsXIMlhsXw+SoOMrAaN12bqSfulHUs8BKLwhhTE8C/Nw3zlzBmWNVahclC5No73dHzjPrV
	iQ5+8GfYLwt0tCccOB9ZVim+xXdWFG9ghcK2S7iCzLpi9Hrb8ytcmCWFDTtG/qCLVzeLob+NNFmeF
	T+3LAtXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMeNY-0000000AoYt-2PcW;
	Fri, 30 Oct 2026 04:38:12 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMeNV-0000000AoYY-0UeU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 04:38:10 +0000
Received: from kali (unknown [4.213.232.17])
	by linux.microsoft.com (Postfix) with ESMTPSA id B148C20B7166;
	Thu, 29 Oct 2026 21:37:48 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com B148C20B7166
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1793335074;
	bh=WwvcOsEObJ8qzzuuobsmrvvwKxGTjF3cc2+TTpbW1e0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NJPsdvAyMdl07uIfgdrypurLmehiQZeL4zrhUYZxR96TMW5UhWVD/k6TDPncHWr08
	 HBDhGEi+B7G362mYoL0sIW0o2+nYfbIXv9oTWCTovARis9B9tYry7LlUyDoTTX9uPX
	 WKbEfCrsL3+VJgHmXIOzVAcYs4vOqZdpgIkHgEhs=
Date: Thu, 29 Oct 2026 23:37:54 -0500
From: Sahil Chandna <sahilchandna@linux.microsoft.com>
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	bpf@vger.kernel.org, arnd@arndb.de, catalin.marinas@arm.com,
	will@kernel.org, peterz@infradead.org, akpm@linux-foundation.org,
	mark.rutland@arm.com, harisokn@amazon.com, cl@gentwo.org,
	ast@kernel.org, rafael@kernel.org, daniel.lezcano@kernel.org,
	memxor@gmail.com, zhenglifeng1@huawei.com,
	xueshuai@linux.alibaba.com, rdunlap@infradead.org,
	david.laight.linux@gmail.com, broonie@kernel.org,
	boris.ostrovsky@oracle.com, ashok.bhat@arm.com
Subject: Re: [PATCH v16 00/16] barrier: Add
 smp_cond_load_{relaxed,acquire}_timeout()
Message-ID: <auQfIuQdpd2i2IrX@kali>
References: <20261016070837.440748-1-ankur.a.arora@oracle.com>
 <auLHZnaCIajW1kxX@kali>
 <87v76lezeq.fsf@oracle.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v76lezeq.fsf@oracle.com>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_213809_190365_D6E10F4E 
X-CRM114-Status: GOOD (  18.43  )
X-Spam-Score: -2.1 (--)
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

On Thu, Oct 29, 2026 at 12:31:09AM -0700, Ankur Arora wrote:
>
> Sahil Chandna <sahilchandna@linux.microsoft.com> writes:
>
> > On Fri, Oct 16, 2026 at 12:08:21AM -0700, Ankur Arora wrote:
> >> Hi,
> >>
> >> Changes in this version address sashiko comments [17]. The major change
> >> is the change in the exit path in __smp_cond_load_relaxed_timeout()
> >> which allows us to simplify providing ACQUIRE semantics in
> >> smp_cond_load_acquire_timeout():
> >>
> [ ... ]
> >>
> > Hi Ankur,
> >
> > I tested this patch series on an Azure Cobalt 100
> > (neoverse-n2 on 64-vCPU Hyper-V guest (Standard_D64ps_v6),
> > on v7.2.12 + this series + arm64 cpuidle-haltpoll enablement[1]
> >
> > cpuidle-haltpoll loaded with force=1, guest_halt_poll_ns=200000.
> >
> > Baseline: no cpuidle driver(only WFI).
> >
> > Workload: PostgreSQL 16.15/pgbench scale 100, client and server in
> > the same VM over a unix socket, with single run:
> >
> >             with (-S)                         TPC-B-like r/w
> > clients  base TPS  haltpoll lat avg   base TPS   haltpoll  lat avg
> >    2       38658     +89%   52->27us     5299     +86%    378->203us
> >    4       72987     +99%   55->28      10305     +87%    388->208
> >   16      300895     +91%   53->28      42035     +83%    381->208
> >   32      590987     +93%   55->28      78319     +85%    410->221
> >   64      987749      +0%   65->65     130675      +3%    490->474
> >
> > Tested-by: Sahil Chandna <sahilchandna@linux.microsoft.com>
>
> Thanks Sahil. That's very helpful. Btw what's the (-S) option with
> in your first heading?
>
Hi Ankur,

This is the -Select Only option running one statement per transaction,
more info captured in [1] [2].

TPC_B like runs small bank transfer transaction.
> Just to double check: was the VM  created with any special option
> such as kvm-arm.wfe_trap_policy?
>
No, the host in my case is Hyper-V. The cmdline does not have any idle
related parameters.
console=tty1 console=ttyAMA0 earlycon=pl011,0xeffec000 panic=-1
> --
> ankur
>
Regards,
Sahil

[1] https://www.postgresql.org/docs/16/pgbench.html#PGBENCH-OPTION-SELECT-ONLY
[2] https://www.postgresql.org/docs/16/pgbench.html#TRANSACTIONS-AND-SCRIPTS

