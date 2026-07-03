Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD4BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 18:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QyotU5l8k0oAbp2gmOwsLK/XfEKLkjm+dMk7XQ103yI=; b=IqbLzsau7Etu+xqttmRIZWgmr/
	adtwA2U4dxPgE14VciyNH932Q1fFoGwM6qK1LlnvWPwHPHpv5HWWy9NfKeI4X4puJxqPPv3JETgBQ
	oxIr9FrxyVaN+DsMBFNW1Ny0FuAysgFhNebrVp1Ann3bCz7p69r2iU+OGl9w5EiNt1RDpgDqrq64T
	FwFR9qBoUSUFCfyHeWMjJ9YRNi7PRw9Pnh8jPhlPqRtp8kMKL0kXWPyDtbhjo9CDDlVowR98LcEqV
	+Tr0wf6E9kQlpLfxEzAE58zbMGjxjXUpC3KURUwMk/ZA8xIf5D4JCyIglZB0xoJHNFB84zbuWdxSe
	xduBd9oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfh4p-00000007ZJZ-3otN;
	Fri, 03 Jul 2026 16:49:19 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfh4n-00000007ZJ1-1fF6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 16:49:18 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-51bfe810293so3865751cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 09:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783097356; x=1783702156; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QyotU5l8k0oAbp2gmOwsLK/XfEKLkjm+dMk7XQ103yI=;
        b=VfmwRoUI0WcFmorxPmlqoQESM+bmRpjik+hPkckhfgKtES/5u65RH9t8J9NV7M4AN7
         IotwpcfeyTzRo8TMC25pcrLW7x/djn/Ud4o0Rek6jX/hX89/shLYfWsie9ZTiZUJvucz
         h9/Xa9/pQgkiCNnVzOr+zQWWoK2ym1x3fYpPz6JMB3l9Xnsf4D0xNJdNZteMF57C78LS
         U2uHM/6sD8wjh+hXZ9GtQV/u6YAZpHz9q2ZdPe3rxS43sTrUMRg5oVdTpA3Rk7rXcze8
         ek9Ml4smhxBROHDCrViJsoouhbxOVDkcBlzVqsPWPGlxlbkr6cDFQBnOOyRb9pgWWAPU
         7qvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783097356; x=1783702156;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QyotU5l8k0oAbp2gmOwsLK/XfEKLkjm+dMk7XQ103yI=;
        b=MfDXhAh9tBxRjBCnAkhdOWxmklQolXDggxHNIbB5kkoLHGZf7sraowDVUWBx9t59BI
         g8qvsQa1D+yft9WncCo4ZtSTatBj1esyYp4GZsDjSnHyDpVKw9pl9KNbb5hFt/e3dyGQ
         yIzvp97IsthKgSLXpiTpKh3mjNO1WWjCwzlahmlBgwwxm8aEGEbhNOwjX12R6l7dmaCB
         J8iTRE6PpsFXfK78eFHSNjOid/soyhnUKjLnu30Ks8VmTXugfDpadSiObgKlA/fT9JfQ
         /g5j1e6xnjRDJsdeUAlcpdf2B+aSC3XURNMunyjfe1VFi9VmLucZIZW86OyGpThBGBAp
         n2uQ==
X-Forwarded-Encrypted: i=1; AFNElJ+dWOoQQo3BFg9wHjX2lbBUrvNWhGTfGI2zGz184tm3cBPx7ijKXsf3Vzy+Q/oTwChiI+nqngV3CO0fQixYQX4p@lists.infradead.org
X-Gm-Message-State: AOJu0Yyg3zBwkVmAAVKv51DKmpntqH/DhMjwLtLJ78I8yPzEnQiA5ERr
	jQKjYegomYlAgqXKcB1AzF8zud8jP635fzs6Uk8KUSZuZiXB2g4QcQKVr++yZ2G899D66fouV0Y
	q6li7
X-Gm-Gg: AfdE7cnrcRfzIxRGkCG2YDqg6MyuKiWGRHcoQ3K7VlmlCYu1LYruWbGgQH9y0cOGacA
	dhNssY9n5rI5lnOEJZ6hW0ZV6+RKjjQpwOf81FhP4D72gK2egfvPn2O4Csv7hfENxkg2OmWuTI0
	b1DwqNKzlm3syNqg8dcT1grSdXe2uIojP8K+Y5F58jo9cybWOnu4K34kxDtz9HHjCFiOdTH4E2w
	tkjM+S86FBjpAVN5HxOtJwcavCqdD0PTKR2FdmMdV66d6FiyyZNt9ECLkrcaKYmz78nqF5gaeyL
	6vtF6gYXxxOL1BCGK0Tg9uPGDQkmkGmVHuoW24a+bFY7LEGHykSOlj+SC4uK939o78uZM5R9Wdi
	EqM8Ul4zxvjXn4UG1TTzPr3256U7JB/fOOcdzMPnjryn6rAlpj8XfyLsvhJECI3lV8fqBkvThnf
	NPMuLIGPNrQ9fFrPqQ1/oIxiFgOT9xwK/HQ4KXXnJGSl+aUMWMx1xCnlGuJ4dhrc1JkzA=
X-Received: by 2002:ac8:594c:0:b0:51c:2cd3:ae7e with SMTP id d75a77b69052e-51c4c33eedamr5242041cf.45.1783097355828;
        Fri, 03 Jul 2026 09:49:15 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f4724bab9esm57511866d6.42.2026.07.03.09.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 09:49:15 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wfh4k-00000008F7B-0pi6;
	Fri, 03 Jul 2026 13:49:14 -0300
Date: Fri, 3 Jul 2026 13:49:14 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Robin Murphy <robin.murphy@arm.com>
Cc: will@kernel.org, joro@8bytes.org, jpb@kernel.org,
	catalin.marinas@arm.com, yangyicong@hisilicon.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-v3: Add HAFT support for SVA
Message-ID: <20260703164914.GY7525@ziepe.ca>
References: <878cd6bcbbe2d5677d2f63da13294c148268552c.1782927917.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878cd6bcbbe2d5677d2f63da13294c148268552c.1782927917.git.robin.murphy@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_094917_462397_40A426FA 
X-CRM114-Status: GOOD (  11.95  )
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

On Wed, Jul 01, 2026 at 06:45:17PM +0100, Robin Murphy wrote:

> @@ -211,6 +213,9 @@ bool arm_smmu_sva_supported(struct arm_smmu_device *smmu)
>  	if (system_supports_bbml2_noabort())
>  		feat_mask |= ARM_SMMU_FEAT_BBML2;
>  
> +	if (system_supports_haft())
> +		feat_mask |= ARM_SMMU_FEAT_HAFT;

I fear this is going to make SVA stop working on systems it currently
does work on, so it might be a major regression. 

SMMU HTTU is not a commonly implemented feature.. I think of all the
NVIDIA ARM chips only one supports it. Given that a quick internal
check is raising concerns this will be breaking for us. We need to
check in more detail which cores have HAFT.

Breaking already deployed SVA would be a major functional regression.

I think this should start by just enabling SMMU HAFT when CPU HAFT is
on, when possible. Maybe print a warning on the mismatch instead of
failing.

Since we can't break already deployed SVA a full solution would either
have to somehow turn off CPU HAFT or we ignore the gap in the AF
updates..

Jason

