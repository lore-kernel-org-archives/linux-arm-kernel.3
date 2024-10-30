Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC2D0D7497E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 07:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f6mqzLrtb8lwPEMq7+9H1VS1SPT6I0YYajpMFZjGA/I=; b=vMqwibWIgQtWMl6uDcJE78vChu
	LwfklLhJu30mmykfaMEy/71xGNeyEF/9PipVo4L34qTkXFGxSLLSywnpR75LWS+bMZwUsmy5lE4HB
	jFzEHkEWT/wZ5zvZ7TNwsWGu5KHwaAwGyiw78ctQ6R2OUaDB04T/5cme5G7Ud3puIX5S4jdrZftal
	WvYBfFBubkym4YNEfx5jooCgUD9zAIXHOYW+hCHfGcABh2prW877e26Z6mdevu1NFH3qLGF72M7o0
	2jUQ+WrLgm2oaWXq+CZx4AIJ0yHSC1AGdJ9qvCWuTXNWEPguSFT7wwwVXW1aM18OswM2tHomK0aDY
	r4jOZ+9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t63aI-0000000HDUg-2zIg;
	Wed, 30 Oct 2024 07:57:42 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t63Ye-0000000HDIb-25uD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 07:56:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8C0ACA43881;
	Wed, 30 Oct 2024 07:54:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AA6BC4CEE4;
	Wed, 30 Oct 2024 07:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730274959;
	bh=gpPN7Q2sLWKjzaffkRwxaK7OnuNJs9eevr8SCuMuL/8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=BUH71srCUmo6Yo5Zj5v596dWnv7WddJErBNA1I9FhssSS3QmxttSW4zKqVxPJmmzM
	 FwaX85B7dxMEdrbjste6ixaE+mBcmzK97oIdEFOrElhG6c7/EN9j8Lh+1JQQ8kmQgJ
	 rBc3jNaZyMfZFMxx/G7mTbs0kN+OX+cDz83YUE5FzMWOfzSDlIfGVx3nGq9PDDbgSi
	 zV1/f5lKWlWY9W0oL1Gx9oRnU13wp86sP84dOlyL2AImYWFxN9bfk3ZyITpo7gVvHG
	 V+uoeeNT289LOwVjjzCmOxhocS2ox3c0CjGFJ8/xXTQTa8/FAl5kcMOkqnpbkZLDAF
	 T2qz6FxH2EucA==
X-Mailer: emacs 31.0.50 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: Steven Price <steven.price@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>
Subject: Re: [PATCH v5 09/43] arm64: RME: ioctls to create and configure realms
In-Reply-To: <20241004152804.72508-10-steven.price@arm.com>
References: <20241004152804.72508-1-steven.price@arm.com>
 <20241004152804.72508-10-steven.price@arm.com>
Date: Wed, 30 Oct 2024 13:25:49 +0530
Message-ID: <yq5acyjic9dm.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_005600_624858_651804BF 
X-CRM114-Status: UNSURE (   7.54  )
X-CRM114-Notice: Please train this message.
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

Steven Price <steven.price@arm.com> writes:

> +
> +out_undelegate_tables:
> +	while (--i >= 0) {
> +		phys_addr_t pgd_phys = kvm->arch.mmu.pgd_phys + i * PAGE_SIZE;
> +
> +		WARN_ON(rmi_granule_undelegate(pgd_phys));
> +	}
> +	WARN_ON(rmi_granule_undelegate(rd_phys));
> +free_rd:
> +	free_page((unsigned long)rd);
> +	return r;
> +}
> +

we should avoid that free_page on an undelegate failure? rd_phys we can
handle here. Not sure how to handle the pgd_phys.

-aneesh

