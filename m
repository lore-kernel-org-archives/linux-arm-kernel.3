Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48146609A702
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 15:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4MSvSRp5;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=QQbdLQCs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3ZxJdgjDA0OfZkHT1nltrt+fZftauqzpRenxqzTVLvE=; b=4MSvSRp5bf/+v/
	FOdLzNhexZRDl1Ulx7b0rF+61Z9tbVTK4cbZiTSw2RK4gWmaM5xiECZXCVOl6p3NGeZVDPtmrPU0c
	P8Ieh/q7JseUgaCMQY4yoj0Gzia1vn8ll9Gs2ZGUCHqhsnGA++ffQDjETVdMaNiqGUWVZzwoLioup
	oJNX4YplCihQUHXuIHsOKEZdGiWbJ9rsze39BJh0yoDiw6Pyq26TvaPRXOx4m5LJoZ6zfq5o5oaif
	ihqahuUED1eeJFsAdS19fN0RpLmtU2XSnEx8bDM6vxtjdsyQYN0HLZOY7evbueeIZXXmHW9IFqAZV
	xBK0enOgPGg7ELWHcYSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNtZP-0000000Gxun-4Adi;
	Mon, 02 Nov 2026 15:03:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNtZM-0000000Gxsb-3WGB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 15:03:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1C90D1A2D;
	Mon,  2 Nov 2026 07:03:29 -0800 (PST)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7CA1B3F673;
	Mon,  2 Nov 2026 07:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793631812; bh=8i8ugBRaP7hgcxk3uDp+fPMwqwaO4C5du0Yjd4app/8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QQbdLQCsQgmltl7+Ykkt7ll804V/Mtn/FDbPemPE2r86Hyb8IY4XxVv/2L+q+6k1U
	 cJMtjqXsbtaYtANFmBATF793gIv7UIlNACyCp3rRx7tNUiBjy5C+yUH8cZX6vdQpaO
	 YaQrwd8ataTW1eO+S10xGw0jql0G5jjUM+Qi/8zw=
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
Subject: Re: [PATCH v5 12/15] KVM: arm64: Derive the VM hardware dirty mode from dirty logging
Date: Mon,  2 Nov 2026 15:03:26 +0000
Message-ID: <auimPtktqZ1cwk3-@LeoBrasDK>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260929103655.85107-13-zhengtian10@huawei.com>
References: <20260929103655.85107-1-zhengtian10@huawei.com> <20260929103655.85107-13-zhengtian10@huawei.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_070332_934503_A4118355 
X-CRM114-Status: GOOD (  10.00  )
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

On Tue, Sep 29, 2026 at 06:36:52PM +0800, Tian Zheng wrote:
> Both HAFDBS and HDBSS flip VTCR_EL2.HD at memslot-update time. Two
> independent toggles allow an intermediate HDBSS-set/HD-clear state,
> an illegal combination, and need locking against concurrent updates.
> 
> Replace both with kvm_arch_update_hw_dirty_mode(), a pure function
> of the static capabilities and the number of logging memslots:
> 
>   - logging && HDBSS-capable  -> HD|HA|HDBSS
>   - logging, no HDBSS         -> off
>   - !logging && HAFDBS-cap.   -> HD|HA

This last one is gone now, so I guess most of this patch has to be 
reworked, right?

Thanks!
Leo


