Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDFE3606A325
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 12:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wgeZ18cI;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=oTraL4TW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BGYHEZ8/yGpunCTkOYvgRITEqUm5TYbCUQMtVfX6jU0=; b=wgeZ18cIhIFVxy
	hVNHa3D19RCM7fk8m5GRpH5ESzWxOCFl+je0N6y3rRZPTtXsNE7qt6ZQ7g+tbOW5USH8HGjLrGKQa
	vD4HGXVaATawuJKqIq60Hhj/d+32ip/Kvnsl2YyLMnW4Z8xlK0P/IL9wm1Gpgw04iHuuO50mnrLVP
	cD9wlIsAPnrJ/UNDwqR+ztxo1qGJ8NK2o68cIq+2SQhFvP/Vh4v51UzddIc2bnYx1ZwFTGHeLU0If
	EH9FL0M0Q+5LHHgnWPHw45j2YTaGAqKIfI0VqwvupHyznLSvb4bAHCIHST/JyhpjwQO8jXhzFjme0
	0KjuVCKukOKL2Y/aaXYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMlfJ-0000000BfmF-3OhU;
	Fri, 30 Oct 2026 12:25:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMlfG-0000000Bfke-3kq0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 12:25:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C4531682;
	Fri, 30 Oct 2026 05:24:52 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E26493F673;
	Fri, 30 Oct 2026 05:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793363095; bh=eGdbHVu74E1ReCplaksFUR7oTU7Slvjcv5W3BhCgOSQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oTraL4TW6hdj6K6/eVqxzmeVe/O6RS5Hc/k5lTSA7nQwCWgUetERsiwu+MuBGb/M+
	 E5ipFfUb7SrTtrmTnveMAht6d2TA78URXg27fGnLANURPAclKI5Vxoo+8H4TvEnGgB
	 U3+Peb9gGg2q1ZA3QRpkBU3oaq2qWu1g5CGKx7b8=
From: Leonardo Bras <leo.bras@arm.com>
To: Tian Zheng <zhengtian10@huawei.com>
Cc: Leonardo Bras <leo.bras@arm.com>,
	maz@kernel.org,
	oupton@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	corbet@lwn.net,
	pbonzini@redhat.com,
	yuzenghui@huawei.com,
	wangzhou1@hisilicon.com,
	yangjinqian1@huawei.com,
	caijian11@h-partners.com,
	liuyonglong@huawei.com,
	tangchengchang@huawei.com,
	yezhenyu2@huawei.com,
	yubihong@huawei.com,
	linuxarm@huawei.com,
	joey.gouly@arm.com,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	fuad.tabba@linux.dev,
	mark.rutland@arm.com,
	seanjc@google.com,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	skhan@linuxfoundation.org
Subject: Re: [PATCH v5 05/15] KVM: arm64: Harvest stage-2 dirty state into the host folio account
Date: Fri, 30 Oct 2026 12:24:49 +0000
Message-ID: <auSMkdEhLI7k8QbV@LeoBrasDK>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <009b13c6-f618-43fe-8a56-8519d31b239b@huawei.com>
References: <20260929103655.85107-1-zhengtian10@huawei.com> <20260929103655.85107-6-zhengtian10@huawei.com> <at-WceRKAVM2kEnI@LeoBrasDK> <009b13c6-f618-43fe-8a56-8519d31b239b@huawei.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_052459_024729_A811052E 
X-CRM114-Status: GOOD (  34.72  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 29, 2026 at 10:02:10PM +0800, Tian Zheng wrote:
> 
> 
> On 10/27/2026 2:05 AM, Leonardo Bras wrote:
> > Hi Tian,
> > Sorry for the delay in reviewing...
> > 
> > On Tue, Sep 29, 2026 at 06:36:45PM +0800, Tian Zheng wrote:
> > > With VTCR_EL2.HD set, hardware promotes writable-clean descriptors to
> > > writable-dirty without any VM exit, and the only record of the write
> > > is the S2AP[1] bit in the stage-2 PTE. The write never passed through
> > > the host stage-1, and no unmap path reads the bit, so the record dies
> > > with the PTE and reclaim may discard written guest data (silent
> > > corruption).
> > 
> > Sorry, I didn't get what you are trying to achieve here.
> > 
> > On your patch, I see you marking backing pages dirty at wrprotect and unmap
> > walkers, and it's very confusing to me on why you are doing this.
> > 
> > IIUC, what you are trying to do is make sure a page does not lose it's
> > contents in case it is reclaimed by the OS.
> > 
> > IIUC, when a page is reclaimed, it will unmap the S2 PTE, and save it's
> > contents to swap, so when the guest read or write to that page will cause
> > it to fault.
> > 
> > The page can never be just unmaped, as if there was a single write to it,
> > the backing pages should be writable, and the contents need to be saved
> > somewhere.
> > 
> > So, if I was able to understand your suggestion, we don't need to worry
> > about this, and this patch wouldn't be necessary.
> > 
> > Did you hit this issue?
> > Can you please expand on your issue, if I could not describe it above?
> > 
> > Thanks!
> > Leo
> 
> Hi Leo,
> 
> Thanks for the review. I haven't hit this in practice, and based on your
> analysis the patch doesn't look necessary.
> 
> Reclaim only writes back folios whose PG_dirty flag is set; a clean
> folio is simply freed. A stage-2 write never touches the host
> stage-1, so the folio depends entirely on kvm_release_faultin_page()
> at fault-in to be marked as dirty; without it, the page stays clean from
> the host's perspective and reclaim drops the data.
> 

Oh, okay. IIUC it will be enough if PG_dirty flag is set once, right?

While on HAFDBS/HDBSS we will skip the fault for marking them dirty again, 
we always take the first fault for every PTE (or prefault them), so 
PG_dirty should always be set once the page is first wroten to.  


> Your **RFC v1** patch 2 changed that marking from writable to dirty:
> 
> ```
> - kvm_release_faultin_page(kvm, s2vi->page, !!ret, writable);
> + kvm_release_faultin_page(kvm, s2vi->page, !!ret, dirty);
> ```
> 
> During logging, a read fault maps the page as WC: the folio is not
> marked PG_dirty in kvm_s2_fault_map() and hardware promotes the PTE to
> WD on write without any fault, so reclaim frees the page without saving
> it (the folio was treated as clean).

Ah, I see your point.
During dirty-tracking guest reads a page, then HAFDBS promotes it to 
writable without marking it as dirty. Good catch!

But wouldn't a simpler solution be to change the conditions in the fault 
handler, so that it indeed marks it as dirty if dirty-tracking is on, even 
if it's just a read fault? 

Thanks! 
Leo

> 
> Therefore, **HDBSS v5** patch 2 reverted to marking the folio for any
> write-permitting mapping:
> 
> ```
> kvm_release_faultin_page(kvm, s2vi->page, !!ret, writable);
> ```
> 
> Together with the v5 scheme, this makes patch 5 unnecessary:
> 
> - kvm_s2_fault_compute_prot: always set PROT_W when map_writable
> - stage2_set_prot_attr: PROT_W -> DBM unconditionally
> 
> 
> ---------
> 
> On a related note, I'd like to discuss the next version of the DBM
> scheme, following Oliver's suggestion [1].

Just as a note for future readers: on another thread we agreed to wait for 
the discussion to reach a point we are all happy before rebasing 
everything.

