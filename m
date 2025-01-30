Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A39C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 19:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AUuu4hqzH6mNtJAivC+Uo5peTqP18ai+56VAExs4m/I=; b=P9fa1W967NqeY+gRc5KNyyRSwP
	TqK4noxgoe+f5ftLEHa3PavW+HKMCQKGH/3qfZeSmZ1M+9V8MwgEBvN1+2sp7tcODauCd9CEtTGjx
	+Wjfs6uuedpwDYMBTsX+qzsbazyUTMzxYFLcuNt6aC9CSZoExRuwv7ChxicJjWbqEebV33C9IYGdg
	1Uj3hvcLhKwVY4w25g9nR0NcOmKDSia4ZsVxAC6fcrQ/lRfydgKlFLNzs/LsK4jwispUYg98s8yEW
	Ln+KeyYCxnIgrvC8yyIxrMWMoCMrM73GwbUFmCSUZ/nDQ4WQ59OqpYsXXHEdgIIVJYz02gzLB/zYw
	/fts5Jxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdZoV-00000009SCv-2GAt;
	Thu, 30 Jan 2025 19:02:55 +0000
Received: from out-176.mta1.migadu.com ([95.215.58.176])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdZnB-00000009S6n-26hC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 19:01:35 +0000
Date: Thu, 30 Jan 2025 19:01:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738263686;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AUuu4hqzH6mNtJAivC+Uo5peTqP18ai+56VAExs4m/I=;
	b=X+8PWTUZ0aZvus/WbWXFkTk6ahWsfRC3S7ZzXvYoi/NOkDMaw8sHMi5KGpYWs82IlAjfUJ
	Ce2Awxbju8tTA4eGDj6ny1bxsuYi39HADtnU/dxxT6ZavAANSdXEVQMQ5Tab4ycP2z+yH6
	xnP1tSOirOUv/DJLt2YotHeASptISog=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Song Liu <song@kernel.org>
Cc: Weinan Liu <wnliu@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Indu Bhagat <indu.bhagat@oracle.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	Ian Rogers <irogers@google.com>, linux-toolchains@vger.kernel.org,
	linux-kernel@vger.kernel.org, live-patching@vger.kernel.org,
	joe.lawrence@redhat.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/8] unwind, arm64: add sframe unwinder for kernel
Message-ID: <Z5vMfxFSIEtPMrMi@google.com>
References: <20250127213310.2496133-1-wnliu@google.com>
 <CAPhsuW4UrhaYKj6pbAC9Cq1ZW+igFrA284nnCFsVdKdOfRpi6w@mail.gmail.com>
 <CAPhsuW7f5--hzr0Y3eb1JNpfNqepJuE92yq3y8dzaL_mQF+U5w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPhsuW7f5--hzr0Y3eb1JNpfNqepJuE92yq3y8dzaL_mQF+U5w@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_110133_850382_28467428 
X-CRM114-Status: GOOD (  13.21  )
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

On Thu, Jan 30, 2025 at 10:34:09AM -0800, Song Liu wrote:
> On Thu, Jan 30, 2025 at 9:59 AM Song Liu <song@kernel.org> wrote:
> >
> > I missed this set before sending my RFC set. If this set works well, we
> > won't need the other set. I will give this one a try.
> 
> I just realized that llvm doesn't support sframe yet. So we (Meta) still
> need some sframe-less approach before llvm supports sframe.
> 
> IIRC, Google also uses llvm to compile the kernel. Weinan, would
> you mind share your thoughts on how we can adopt this before
> llvm supports sframe? (compile arm64 kernel with gcc?)

Hi Song,

the plan is to start the work on adding sframe support to llvm
in parallel to landing these changes upstream. From the initial
assessment it shouldn't be too hard.

Thanks

