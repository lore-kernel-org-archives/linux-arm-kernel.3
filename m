Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A360DE77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 05:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oCDOKEUPoRWgxQv9Y56ec+zLrH8lDUZ5399H6YW87Ck=; b=PZVvPnQPgvHg1s0oZ+z2Q/k3EK
	YEwxPFZJPR3cD7ud4Cj/W13JOUNVNwaRzQq6Zj1LMGMuZUDCzUWTauRv16z2sEDj0CRbkAGrAkz3K
	KygQF7tJUkpGd1DbDTdbuSk8+k3MP91f1TLV8RX5gt4NCEJ5g6/dIA6ckFwLLPzRRmciG3CbHx8A/
	jCISKSzvhbix4bfZLfh2+/hh6pVIy6tbe4Q/z/0eF8fZnffwNQKwYtzrLs6LUhxkJ+xkk9rfw3eIy
	LDfp8iaw5FSI1Emx2GEblkSCHYQqLRD/AXaj6HKLvNJVTp5wk/o0qI3sttfAjzRhGMJMT9vuNBF+S
	N/DxaGSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tO9FS-00000000sh8-1QTI;
	Thu, 19 Dec 2024 05:38:58 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tO9EL-00000000sV7-44Iu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 05:37:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CBFAAA41BFE;
	Thu, 19 Dec 2024 05:35:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 411AFC4CED0;
	Thu, 19 Dec 2024 05:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734586668;
	bh=f1ssCOL5WoAFhkE7v38y7Xu2e53FiZUAYFBGnEjCpZ0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ialAkShidwlJwrlWfPoJnFpY0idSboazhqgfcvsMXJ4WZ10TEkwwaukZOvjp1u9kt
	 u3hH5jq9vP1fMuychVCt6eJSWQR/bvHOH0Sd4QBD83X+3/P3SxKTevMjhHIlz6iKy2
	 uo5tjyk50uEf0LbeIylxsmL6KBvKi1gTzZxli23s90z1ilTnwa9+2ovQ3Nxof7121B
	 kSqD9OY+pdi/8dwkUkPnn0h5b7tbyYlI2hycHVqAKgqCESNVjDoR/5tdCBdqjj2aLb
	 K7jF0+7AETgI2iKjB50StOBX6IbCSwNVx7ItYL7i9U4wbTIdZi9Ev+7zINcUdVkNn8
	 naAuwTRmpNLYg==
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
Subject: Re: [PATCH v6 12/43] arm64: RME: Allocate/free RECs to match vCPUs
In-Reply-To: <20241212155610.76522-13-steven.price@arm.com>
References: <20241212155610.76522-1-steven.price@arm.com>
 <20241212155610.76522-13-steven.price@arm.com>
Date: Thu, 19 Dec 2024 11:07:22 +0530
Message-ID: <yq5apllos06l.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_213750_087450_5DE5450A 
X-CRM114-Status: GOOD (  12.04  )
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

> +static int alloc_rec_aux(struct page **aux_pages,
> +			 u64 *aux_phys_pages,
> +			 unsigned int num_aux)
> +{
> +	int ret;
> +	unsigned int i;
> +
> +	for (i = 0; i < num_aux; i++) {
> +		struct page *aux_page;
> +		phys_addr_t aux_page_phys;
> +
> +		aux_page = alloc_page(GFP_KERNEL);
> +		if (!aux_page) {
> +			ret = -ENOMEM;
> +			goto out_err;
> +		}
> +		aux_page_phys = page_to_phys(aux_page);
> +		if (rmi_granule_delegate(aux_page_phys)) {
> +			__free_page(aux_page);
> +			ret = -ENXIO;
> +			goto out_err;
> +		}
> +		aux_pages[i] = aux_page;
> +		aux_phys_pages[i] = aux_page_phys;
> +	}
> +
> +	return 0;
> +out_err:
> +	free_rec_aux(aux_pages, i);
> +	return ret;
> +}
>

We can possibly switch the above to the alloc/free helper so that all
granule allocation is done by alloc_delegated_granule() ?

static int alloc_rec_aux(struct realm *realm, u64 *aux_phys_pages, unsigned int num_aux)
{
	int ret;
	unsigned int i;

	for (i = 0; i < num_aux; i++) {
		phys_addr_t aux_page_phys;

		aux_page_phys = alloc_delegated_granule(realm, NULL, GFP_KERNEL);
		if (aux_page_phys == PHYS_ADDR_MAX) {
			ret = -ENOMEM;
			goto out_err;
		}
		aux_phys_pages[i] = aux_page_phys;
	}

	return 0;
out_err:
	free_rec_aux(realm, aux_phys_pages, i);
	return ret;
}





