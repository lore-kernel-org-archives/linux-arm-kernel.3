Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A80FF886D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 13:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n2rNYEBg9alYpMZp4rQkeFJuQevvn8RnMOJdkm8rSTc=; b=HFRl4l17Flmc7D4oCyn1D5spFc
	91Zqfb6cJxhFblxdjmfuujEIe1oTY4H++2Q9C/5qd2hn8qywUxrJwmPpyzLbWdL3xheQ4mQ0aj+OV
	xjerqp98voe8/JtizdMRqySPqK2bTym9ew4kqLdP2JJvBVtX08CwVbcN1hx9UdT7hVyLJfUpI67Nf
	hI2uU7iKO6shIk8tiTbvTy5baknSy8evBWLrjOOxejjFu9RjUkAM86osdhTKzay0JZuPUh40hY8uT
	WlKlBZIuGoZR0r7eiDRFcJ/55Qo8dIiTruKYeqQUr5UGHb3H62FPrdlfRILfgj/kTS6pAoC2YO60/
	EPpFngZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHivO-00000001b81-2Ar8;
	Tue, 28 Apr 2026 13:56:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHivM-00000001b7r-3WgS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 13:56:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CB6F161119;
	Tue, 28 Apr 2026 13:56:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE6A1C2BCAF;
	Tue, 28 Apr 2026 13:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777384587;
	bh=tzR76jwjcwHZJGzKefeV38J4m6XWBejLedn5tsPTIMQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DS6k2Bn82HqQjbd4tlW9JWMHVz1+5KTI5b/BfvTBKiuA9WwzIscwxhmjHPgb/omGV
	 OEzL1EXlTR5pjJSG4pTVflm5N5KzaCaxnkOE/3kNnDqaLBxY5+7ircXZy75INGU9Ve
	 HY34+7q6JTokXxXbfrgJXOO0I7GlAlaj9nJWgT3FD069FRRAeh6HPKDNVfdre/gap9
	 IuEqo6dFQThj2aOR4eexv9DFHAcebMq4dGVho9d46SUpcWSTApxZF7B92dT1sn7BxD
	 OsMgdW3FOkTcd3ZtB5/PNG7B88aGK2w5TsmLKVdI1b3up4H9dq5O4qTJhZBzwk9Pbg
	 dCDhqziOEZTmQ==
Date: Tue, 28 Apr 2026 14:56:21 +0100
From: Will Deacon <will@kernel.org>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, Catalin Marinas <catalin.marinas@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>, sebastianene@google.com
Subject: Re: [PATCH v4 3/3] coco: guest: arm64: Query host IPA-change
 alignment via RHI
Message-ID: <afC8hZTJY6Cx8Liz@willie-the-truck>
References: <20260427063108.909019-1-aneesh.kumar@kernel.org>
 <20260427063108.909019-4-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427063108.909019-4-aneesh.kumar@kernel.org>
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

[+Seb for the ITS]

On Mon, Apr 27, 2026 at 12:01:08PM +0530, Aneesh Kumar K.V (Arm) wrote:
> Add the Realm Host Interface support needed to query host configuration
> from a Realm guest. Define the RHI hostconf SMCs, add rsi_host_call(), and
> use them during Realm initialization to retrieve the host IPA-change
> alignment size.
> 
> Expose that alignment through realm_get_hyp_pagesize() and
> mem_decrypt_granule_size() so shared-buffer allocation and
> encryption/decryption paths can honor the ipa change page-size requirement.
> 
> If the host reports an invalid alignment (when alginment value is not
> multiple of 4K), do not enable Realm support.
> 
> This provides the host alignment information required by the shared buffer
> alignment changes.
> 
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  arch/arm64/include/asm/mem_encrypt.h |  3 ++
>  arch/arm64/include/asm/rhi.h         | 24 +++++++++++++
>  arch/arm64/include/asm/rsi.h         |  2 ++
>  arch/arm64/include/asm/rsi_cmds.h    | 10 ++++++
>  arch/arm64/include/asm/rsi_smc.h     |  7 ++++
>  arch/arm64/kernel/Makefile           |  2 +-
>  arch/arm64/kernel/rhi.c              | 54 ++++++++++++++++++++++++++++
>  arch/arm64/kernel/rsi.c              | 13 +++++++
>  arch/arm64/mm/mem_encrypt.c          |  8 +++++
>  9 files changed, 122 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm64/include/asm/rhi.h
>  create mode 100644 arch/arm64/kernel/rhi.c

[...]

> diff --git a/arch/arm64/mm/mem_encrypt.c b/arch/arm64/mm/mem_encrypt.c
> index 38c62c9e4e74..f5d64bc29c20 100644
> --- a/arch/arm64/mm/mem_encrypt.c
> +++ b/arch/arm64/mm/mem_encrypt.c
> @@ -59,3 +59,11 @@ int set_memory_decrypted(unsigned long addr, int numpages)
>  	return crypt_ops->decrypt(addr, numpages);
>  }
>  EXPORT_SYMBOL_GPL(set_memory_decrypted);
> +
> +size_t mem_decrypt_granule_size(void)
> +{
> +	if (is_realm_world())
> +		return max(PAGE_SIZE, realm_get_hyp_pagesize());
> +	return PAGE_SIZE;

No, this should be indirected via 'struct arm64_mem_crypt_ops' because
there's nothing particularly unique to realms here. For pKVM protected
guests using a smaller page-size than the host, we'd presumably need
something similar for the ITS (where restricted-dma isn't used).

Will

