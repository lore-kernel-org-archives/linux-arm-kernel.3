Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88213606A321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 11:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FK0/bnFL;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=lhbs403c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EV9q3xMYUg7eyUdptCPQkT+NInqEVi2Bft0i/3u9pWc=; b=FK0/bnFLnmr7vj
	tqNmcBQt+BafSK8zZ5e7MNYdK3H75zrTrcI5D0rIWe8om4jgqyhP2VfbvsFHHMVQbLCCGdQH83uaB
	DyM++JU9uOKdN8dIrFG43iO5QybGv6wB1kHKc1fAJNpbJkQ8pz8+Vr6Kth/M5DmarlkoiaHGK5e4c
	IGP1BT7sGPLDcC3XpIsdl+K3O8xshBI8ly9MhyAFm/ai15zpg4nUmj3vf1rTu80QvZE58Bc69m5kk
	zw07M29kUcb2bCUzC3EmQf2gYWN8/Jj9NA7JGqIjph2nGVB+2VSapofILr6FDtK3ri3Xrba0jfOuI
	yfzbIq3zq/dGGj2pbaoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMl8e-0000000BbJy-2RYe;
	Fri, 30 Oct 2026 11:51:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMl8d-0000000BbJa-05P7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 11:51:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2A79E1682;
	Fri, 30 Oct 2026 04:51:10 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A3AE73F7B4;
	Fri, 30 Oct 2026 04:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793361073; bh=Mc3ZxWgjpeC+0tTsnex0ZyBfJ8y4oR4Ncako7tOwxzw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lhbs403ceP0i6J8ZnKQpDhpeznmarJmBUeflvdmtHnlB2nPAIKDzzcVGkjSj9dQ7W
	 vtYBO7rtqa2fVQpvzW5QK31u40tMnW4Jc2IGyVrESGNTwnIebruQEJnQGn+OPTDhPw
	 Gf2ge37yfRyKGQJ5KxdYYDrHf/8gyFWRm3p7HOp4=
From: Leonardo Bras <leo.bras@arm.com>
To: Tian Zheng <zhengtian10@huawei.com>
Cc: Leonardo Bras <leo.bras@arm.com>,
	liuyonglong <liuyonglong@huawei.com>,
	Oliver Upton <oupton@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Zhou Wang <wangzhou1@hisilicon.com>
Subject: Re: [RFC PATCH 5/5] KVM: arm64: Enable HAFDBS for guests not on migration
Date: Fri, 30 Oct 2026 11:51:08 +0000
Message-ID: <auSErGzYpiTxgsgb@LeoBrasDK>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <b8f76a0a-8b1e-4167-81cc-b3a4ee79fb6b@huawei.com>
References: <aqsl1_IqnV2r8kUL@kernel.org> <aqvt2gnlBZeNsaf4@LeoBrasDK> <as-mH36YSMxAosND@LeoBrasDK> <3e464bef-8dfe-44a3-afea-3c276ae87cd8@huawei.com> <attMtUqxNsuPooix@LeoBrasDK> <8eaaba87-7881-49c4-a76a-51dec2f29ffc@huawei.com> <auCPEQmnFwWldTaM@LeoBrasDK> <52945586-8c5c-4991-bd92-fe02aaf79fbe@huawei.com> <auM0CWJTPzYUTknh@LeoBrasDK> <b8f76a0a-8b1e-4167-81cc-b3a4ee79fb6b@huawei.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_045115_120608_FF695896 
X-CRM114-Status: GOOD (  23.59  )
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

On Fri, Oct 30, 2026 at 02:01:49PM +0800, Tian Zheng wrote:
> 
> 
> On 10/29/2026 7:54 PM, Leonardo Bras wrote:
> > On Thu, Oct 29, 2026 at 10:54:24AM +0800, Tian Zheng wrote:
> > > Hi Leo,
> > > 
> > > I've read your discussion with Oliver on DBM RFC v2. As a suggestion,
> > > maybe we should go with Oliver's approach, i.e. revert to the v1 scheme
> > > and continue fixing from there.
> > 
> > Hi Tian,
> > I have been reading a bit more about permission indirection to try figuring
> > out a way that the change may work for both ways.
> > 
> > The problem with the previous approach is that it assume DBM=write at all
> > times, which is not architecturally correct. Having DBM=write only on
> > HAFDBS=on as suggested would require us to transverse the whole pagetable
> > to convert encodings when we enable/disable it, which can be quite
> > expensive.
> > 
> > One option would be to always enable HAFDBS when system supports HDBSS, but
> > I still have to figure out if that causes any performance regression before
> > suggesting.
> > 
> > The option I am pursuing is thinking on an unified code path for direct
> > permissison (both HACDBS=on and HACDBS=off) so we don't have to convert
> > between them, neither worry about the impact of HAFDBS=on on performance.
> > 
> > I will reply on the thread once I figure one of those options out.
> > 
> > Thanks!
> > Leo
> 
> Hi Leo,
> 
> Sounds good. I'll wait for your next version and review it once it's
> posted.
> 
> Thanks,
> Tian

Awesome, thanks!
Leo

