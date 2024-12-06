Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5284DE77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 21:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4mzhTxfyer3pXCCutNPdBm4ebsOpNX+qmHb589hpJEA=; b=OvMfW9k2LF8S6kWYzooi27JL+r
	wyWPVknK+YtKMhcWeVMWL1FTZTuEEWLriC2Aailqc/QtSfp+Vdg8rQqYbrqYFlTWnc0xpL7jyR6U+
	GXmiI+5H1tdyFcKsDNf6MbwWZVQwmgGlAjJD5Rtyi/fw1qU+QeFsotrb/F6gPwAdYEKVFj0H1y7p2
	k2dy+piX8UcUGoDrbf1zyy5uJcNCaoHU8vi9ZmLotOZmmRhZFeZe4odYLGnm9Nz6rCQxxP1Sfic/2
	NJb3ayQNi7gJ1pmfALyj9CWnyUhOL4dWkrWql829pRvxzXlIm5Vqm6jZolagc5RDOuALmvlUcwK4b
	ywNumjSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJfR8-00000002jSE-1i8u;
	Fri, 06 Dec 2024 21:00:30 +0000
Received: from mx.ssi.bg ([193.238.174.39])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJfPD-00000002j5e-2EKY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 20:58:33 +0000
Received: from mx.ssi.bg (localhost [127.0.0.1])
	by mx.ssi.bg (Potsfix) with ESMTP id A1A2821D95;
	Fri,  6 Dec 2024 22:58:27 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ssi.bg; h=cc:cc
	:content-type:content-type:date:from:from:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=ssi;
	 bh=4mzhTxfyer3pXCCutNPdBm4ebsOpNX+qmHb589hpJEA=; b=t3UsSFDIjjo9
	9YpFOYo1J/D81iTJz2RzrFXKfmaII/WXesh0Dc5N5on1An9bH1QWb8nB3oGH9Tg2
	fkjTeWyzosNG0cbUqMOXnl2tGM4hYQ0Vcu1rBhT8A4LZDrdq9M5sQQ/RqQ6cnnSj
	c0Bqv5LmmMCWq3vN1LqP+9trPWhMEgY2LVp6DkjdNYfgSVxLdoH/7v2lp0045qYk
	0N+zLxweluiNWZaF98nN4XdK8VIfLEQtOK1+o0AP5utHqlCnK6lWeLGeFp1e9FFO
	u9fteAPfLaSBSl9IundxYpH2Y/9QtA6MlBZ/3hGleSL6YA5NlgnuZKtlTLMQl2To
	wTju1EWyMr6FY9eT5SxiEagKeC8mN+qwDD3e6eay06fnLTjqQur7NKPQaIe2fD6a
	rdOkcJ+jf0moCEVA83RCsajcOJYcDtAqqnvtgyNkCiMD21mS5PkGLpFaNVt/Ks2/
	+/lkEygRzXTllCnvCiZgSyWdAOMpcGauqlbJcBzyFTqw7dqEd1s//YcqSkCch8fB
	BLoPR9dEG+4YKgDcyZCXmsHsmXc0Ax35NkPEvvCBSVIPY2vfrsMcHHfz63FshGaw
	rr11pPRVHEk/KluC97orXlAvJJnCVtGwFl1sVwSGP2ZgfY0hIeRRhp4OKPGFJ+ng
	1lc0gwoEI8v7LIG4fRcDT+rGr46d9Q0=
Received: from ink.ssi.bg (ink.ssi.bg [193.238.174.40])
	by mx.ssi.bg (Potsfix) with ESMTPS;
	Fri,  6 Dec 2024 22:58:26 +0200 (EET)
Received: from ja.ssi.bg (unknown [213.16.62.126])
	by ink.ssi.bg (Postfix) with ESMTPSA id 34E4315F19;
	Fri,  6 Dec 2024 22:58:17 +0200 (EET)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by ja.ssi.bg (8.18.1/8.17.1) with ESMTP id 4B6KwDGo064449;
	Fri, 6 Dec 2024 22:58:14 +0200
Date: Fri, 6 Dec 2024 22:58:13 +0200 (EET)
From: Julian Anastasov <ja@ssi.bg>
To: David Laight <David.Laight@ACULAB.COM>
cc: "'Andrew Morton'" <akpm@linux-foundation.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "'Naresh Kamboju'" <naresh.kamboju@linaro.org>,
        "'Dan Carpenter'" <dan.carpenter@linaro.org>,
        "'pablo@netfilter.org'" <pablo@netfilter.org>,
        "'open list'" <linux-kernel@vger.kernel.org>,
        "'lkft-triage@lists.linaro.org'" <lkft-triage@lists.linaro.org>,
        "'Linux Regressions'" <regressions@lists.linux.dev>,
        "'Linux ARM'" <linux-arm-kernel@lists.infradead.org>,
        "'netfilter-devel@vger.kernel.org'" <netfilter-devel@vger.kernel.org>,
        "'Arnd Bergmann'" <arnd@arndb.de>,
        "'Anders Roxell'" <anders.roxell@linaro.org>,
        "'Johannes Berg'" <johannes.berg@intel.com>,
        "'toke@kernel.org'" <toke@kernel.org>,
        "'Al Viro'" <viro@zeniv.linux.org.uk>,
        "'kernel@jfarr.cc'" <kernel@jfarr.cc>,
        "'kees@kernel.org'" <kees@kernel.org>
Subject: RE: [PATCH net] Fix clamp() of ip_vs_conn_tab on small memory
 systems.
In-Reply-To: <494a4dc2ba2041dfb9f45d86e972b953@AcuMS.aculab.com>
Message-ID: <184af1fd-2bc4-11c1-9319-0ca879e53d99@ssi.bg>
References: <33893212b1cc4a418cec09aeeed0a9fc@AcuMS.aculab.com> <5ec10e7c-d050-dab8-1f1b-d0ca2d922eef@ssi.bg> <2a91ee407ed64d24b82e5fc665971add@AcuMS.aculab.com> <c0a2ee53-f6ff-f4d4-e9ab-6a3bf850bec5@ssi.bg>
 <494a4dc2ba2041dfb9f45d86e972b953@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_125831_741717_3345194C 
X-CRM114-Status: GOOD (  30.25  )
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


	Hello,

On Fri, 6 Dec 2024, David Laight wrote:

> From: Julian Anastasov
> > Sent: 06 December 2024 16:23
> ...
> > 	I'm not sure how much memory we can see in small system,
> > IMHO, problem should not be possible in practice:
> > 
> > - nobody expects 0 from totalram_pages() in the code
> > 
> > - order_base_2(sizeof(struct ip_vs_conn)) is probably 8 on 32-bit
> 
> It is 0x120 bytes on 64bit, so 8 could well be right.

	That is already for 9 :)

> > > Is all stems from order_base_2(totalram_pages()).
> > > order_base_2(n) is 'n > 1 ? ilog2(n - 1) + 1 : 0'.
> > > And the compiler generates two copies of the code that follows
> > > for the 'constant zero' and ilog2() values.
> > > And the 'zero' case compiles clamp(20, 8, 0) which is errored.
> > > Note that it is only executed if totalram_pages() is zero,
> > > but it is always compiled 'just in case'.
> > 
> > 	I'm confused with these compiler issues,
> 
> The compiler is just doing its job.
> Consider this expression:
> 	(x >= 1 ? 2 * x : 1) - 1
> It is likely to get converted to:
> 	(x >= 1 ? 2 * x - 1 : 0)
> to avoid the subtract when x < 1.
> 
> The same thing is happening here.
> order_base_2() has a (condition ? fn() : 0) in it.
> All the +/- constants get moved inside, on 64bit that is +12 -2 -1 -9 = 0.
> Then the clamp() with constants gets moved inside:
> 	(condition ? clamp(27, 8, fn() + 0) : clamp(27, 8, 0 + 0))
> Now, at runtime, we know that 'condition' is true and (fn() >= 8)
> so the first clamp() is valid and the second one never used.
> But this isn't known by the compiler and clamp() detects the invalid
> call and generates a warning.

	I see, such optimizations are beyond my expectations,
I used max_avail var to separate the operations between
different macro calls but in the end they are mixed together...

> > if you
> > think we should go with the patch just decide if it is a
> > net or net-next material. Your change is safer for bad
> > max_avail values but I don't expect to see problem while
> > running without the change, except the building bugs.
> > 
> > 	Also, please use nf/nf-next tag to avoid any
> > confusion with upstreaming...
> 
> I've copied Andrew M - he's taken the minmax.h change into his mm tree.
> This is one of the build breakages.
> 
> It probably only needs to go into next for now (via some route).
> But I can image the minmax.h changes getting backported a bit.

	OK, then can you send v2 with Fixes header, precised comments
and nf tag, it fixes a recent commit, so it can be backported easily...

Regards

--
Julian Anastasov <ja@ssi.bg>


