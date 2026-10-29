Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD9D606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 21:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mIyuApE2;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=p9DS9Eak
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7pzjhtn6j5+N8CZXLk0hQRmO9CNlQSOA3omzcm5VGk0=; b=mIyuApE2x3fk6w20q+iNUAXVv7
	n+YZg7JfxdR3NuFAFdR4e1ArQ3xojmDzryu4TMxjOKauPVb9BtSdlzfIPRmPre/okIGO1uXoQHhvO
	NIRFvVcodFOGsQN+aTTMi2rFQBAKqyCsY6/Yz5XF6gY+CffnE50DKWbfKus2PvmsHcJU20VoEmu58
	2zcK0/gXOoaonbHuxSWNhoR6jHs9z3b+YXr0pBsJ9BGau7snJ3UcFcrID1gqv3YUqCB0jdVBnQ5ui
	VlRb+ApfqgBqnA4jnhpNITa8A45xue2Aws7Idvhiu2RG+Ym0FnZdrSKx6hpXYi5qxoafUBUhXyPGa
	Vznpr4eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMXS6-0000000AOm2-3tVC;
	Thu, 29 Oct 2026 21:14:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMXS4-0000000AOlU-2Yds
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 21:14:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D38FC1682;
	Thu, 29 Oct 2026 14:14:19 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D06203F59E;
	Thu, 29 Oct 2026 14:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793308462; bh=38wAcV6+Pv6BUffZcJjTOzperonmticUwGom7ntWZAI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p9DS9EakVP9HFrT+Dq5D5QflP8AsibvK4b16nw+3P+LFEwVRxQqTVKObaNvyb75GT
	 Ek0Tw96E1T0R93ckTjFwoUcsTGJGeiERUvjdZYnZsTL3mmN9rXtnrZImSR4jRyjMft
	 vJQ26MLNCQ6XqAljjKT5k0Edby4PnzN4T+fDm2Fg=
Date: Thu, 29 Oct 2026 21:14:18 +0000
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
Subject: Re: [PATCH v2 1/5] arm64: Add override for ID_AA64ISAR1_EL1.LS64
Message-ID: <auO3Kiykovvs279e@arm.com>
References: <20261025075138.2919734-1-fuad.tabba@linux.dev>
 <20261025075138.2919734-2-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261025075138.2919734-2-fuad.tabba@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_141424_701205_45C5E747 
X-CRM114-Status: GOOD (  11.76  )
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

On Sun, Oct 25, 2026 at 07:51:34AM +0000, Fuad Tabba wrote:
> Accesses to ACCDATA_EL1, which FEAT_LS64_ACCDATA adds, trap to EL3
> unless firmware sets SCR_EL3.ADEn. Once KVM context-switches the
> register for its guests, a host whose firmware leaves the bit clear
> can't run them.
> 
> Add an override for ID_AA64ISAR1_EL1.LS64, with an arm64.nols64 alias,
> so that the feature can be disabled on such a host and for its guests.
> id_aa64isar1.ls64=2 disables only FEAT_LS64_ACCDATA and above.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

However, does this need a plain cc stable? I assume you want it to go in
with patch 3 but that one only goes as far as 7.0. Same cc stable in
patch 2 which you may want to limit (or add both as dependencies to the
cc stable in patch 3 when committing).

-- 
Catalin

