Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08767CD3426
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 15:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SiF4i7SeB+vqQpOzTdzc7LyjPQDII4G9BWeiAEqxhGE=; b=25IbhnQ0l76oFnijSHfWEOXJRU
	SkvMsIah1XghKurbmeufOrtMauTSpoQ0/BmpDASrbgHJ9vge1jQ5i3p/Ut3wkEOkGefhbMtnI57f/
	M1YmHKu0cmz7h4k5yCiBz828GDz6ayuql4Jv1aGeLoB65Yuu6AIo15MCZXzybCJSdD/g9uTZ2Xwz2
	lgHGfRh93I4+g/VoZzsFXATLylTU14mWyp4BAsc0dDUL1De6fjNGovCcwROZKHMcFHm7BTpG1xGTd
	Ev7PgCoxT7rooBprMYESbGDlQM2JUVDnW7fYUYJAphDsV9+iLNbVmFnRjN3f7OddMsn1vaSSclZfl
	rwsTQP/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIqAB-00000007N3b-25ua;
	Fri, 01 May 2026 15:52:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIqAA-00000007N3R-0zpE;
	Fri, 01 May 2026 15:52:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5DF83600AE;
	Fri,  1 May 2026 15:52:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 578D9C2BCB4;
	Fri,  1 May 2026 15:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777650741;
	bh=CmRbcbTi+OjVPZtnCXwufH2SPkRkS5oJkc2YfZ1djM0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IVDd9j10pzEBSdRC4+QeFj4BgrGtGegXqADT53FcQUjMhslsOR/0b8M/SeBRUjbiL
	 U2fYt86IaWaPqn4mV1onqa61I1SUk7HLNDW/omvLoBf0BH4n82Nt8SShUszHOEgWX+
	 Yg2s+/jyz3VDnqKEVso8YuKRhMIWmw5AZKuu313vA5DlmyJ/Rx3fmNczFEGG/bRD5C
	 eqUXB71O0/nCiiPJ8qZcNkawkQKohpdSSJ4uA0FZNvaLfCO6RUdrocyE/W1A7fSAIz
	 Hbt9kjA297YFDx/3kqUo5yAmQtYP02v7yShDf43ds+6qzWhvd82x48N7/jTN1fhgjc
	 65/sBiyDMsG6w==
Date: Fri, 1 May 2026 16:52:12 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: "Barry Song (Xiaomi)" <baohua@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>, akpm@linux-foundation.org, 
	linux-mm@kvack.org, david@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, jack@suse.cz, 
	pfalcato@suse.de, wanglian@kylinos.cn, chentao@kylinos.cn, lianux.mm@gmail.com, 
	kunwu.chan@gmail.com, liyangouwen1@oppo.com, chrisl@kernel.org, kasong@tencent.com, 
	shikemeng@huaweicloud.com, nphamcs@gmail.com, bhe@redhat.com, youngjun.park@lge.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
Message-ID: <afTKsSj0i-ZkRZN5@lucifer>
References: <20260430040427.4672-1-baohua@kernel.org>
 <afNM-gIqxpyJ6ro7@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afNM-gIqxpyJ6ro7@casper.infradead.org>
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

On Thu, Apr 30, 2026 at 01:37:14PM +0100, Matthew Wilcox wrote:
> On Thu, Apr 30, 2026 at 12:04:22PM +0800, Barry Song (Xiaomi) wrote:
> > (1) If we need to wait for I/O completion, we still drop the per-VMA lock, as
> > current page fault handling already does. Holding it for too long may introduce
> > various priority inversion issues on mobile devices. After I/O completes, we
> > retry the page fault with the per-VMA lock, rather than falling back to
> > mmap_lock.
>
> You're going to have to do better than that.  You know I hate the
> additional complexity you're adding.  You need to explain why my idea of
> ripping out all the complexity now that we have per-VMA locks doesn't
> work.

After a brief eyeball I share Matthew's assessment, I really don't like this
series, it's piling on complexity for what seem like niche cases.

We already have enough weirdness in fault code honestly.

Let's maybe discuss at LSF if you're attending?

I will try to have a more thorough look through when I get a chance.

Thanks, Lorenzo

