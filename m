Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12CBC606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 21:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NCtlox34;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=g8Ac2snP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uUOoxh5FjWUwpph2LqQnLF50bqkpEqoE20tLRRD+3zY=; b=NCtlox34ojTWUDUvscjHGZMJZm
	sxSP5FaxuVXA/J4Plc+DYvRwxp57ZhkPD/QgLS+kcUyGVpa1ouicKB7w5NLL00rWRGW2z6XyvtFgX
	cei5VXiWNDFZqcdVxWJjKPOBhdAUhYGWXwp+Z6JtWdknglxXPp2PphV84VEHUPDg0IVYnC1TgXe/x
	ISnLVHraFFpRPYUH15Vs3ew7tPT/5VYXAREcGBTox6qeRByjadgtbF/uuwuMmkjyPtFPw1SfjSonN
	ah25mRY3y7l8tCpZcyAAq8XKWjRWUfT0yvlLvEiaIHXcVkRtV5jBOpDIw7ciERouCHtJGbZlgbTcu
	qEFSaQmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMXT6-0000000AOsM-0OD8;
	Thu, 29 Oct 2026 21:15:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMXT3-0000000AOrf-2f1j
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 21:15:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F6711682;
	Thu, 29 Oct 2026 14:15:19 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5CED13F59E;
	Thu, 29 Oct 2026 14:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793308522; bh=cLLb8kTBxnx4UA1bZ7blmuTf4w+v25p4Ofqywv52Tv8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g8Ac2snP/yP6eE1gMl5eSWsRnObRxt4TKvv7JwVEnOV/kho0T5s+Ll5cxuy0oypZS
	 OzFHVvh/5N8rSHvnPETiD9ah02AzfUsabo/JDjP9K5JkXElI053yHln7/VWq8aKRCp
	 QOatav4wSox4p9lwpJ4gSOt/tbvtIl1Wc8PtPt4c=
Date: Thu, 29 Oct 2026 21:15:18 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Zhou Wang <wangzhou1@hisilicon.com>, Arnd Bergmann <arnd@arndb.de>,
	Fuad Tabba <tabba@google.com>, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] KVM: arm64: Add context-switch of ACCDATA_EL1
Message-ID: <auO3ZuB74waA_bPD@arm.com>
References: <20261025075138.2919734-1-fuad.tabba@linux.dev>
 <20261025075138.2919734-4-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261025075138.2919734-4-fuad.tabba@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_141525_710637_E5239318 
X-CRM114-Status: GOOD (  12.44  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Oct 25, 2026 at 07:51:36AM +0000, Fuad Tabba wrote:
> From: Marc Zyngier <maz@kernel.org>
> 
> Add ACCDATA_EL1 save/restore as part of the EL0 context. This is
> conditioned on the guest's view of ID_AA64ISAR1_EL1.LS64 reporting
> that this register is supported.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Fixes: 58ce78667a641 ("arm64: Add support for FEAT_{LS64, LS64_V}")
> Link: https://lore.kernel.org/r/20240815125959.2097734-5-maz@kernel.org
> Cc: stable@vger.kernel.org
> [Fuad: rebased; switch ACCDATA_EL1 for guests only, as the host never
>  uses it; gate it on a new ARM64_HAS_LS64_ACCDATA capability, since
>  in pKVM the host controls a non-protected guest's ID registers, and
>  an EL2 access to ACCDATA_EL1 on a CPU without the feature is UNDEFINED]
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

