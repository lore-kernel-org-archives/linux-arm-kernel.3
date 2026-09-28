Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B98C2CA5FA3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 18:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fGyq3NjAgVBa/imXLuFDsnsoYGS7geOe1+K5qFW3IBY=; b=bi9UhuYL6vUasJ+Fy7Ha9QdJDI
	xzL23nq5CqCLs2ULINn/tFr1ASNEot2UAHeJe3r7kNn/ulWn8xL5bVrS/HWPitKxrFVaUviQYbK0g
	9XJ8xHM+mNEPIB4lLTRr99EPq0/FudRyl3rOIBhe5pxToHNE1Lkb4CGrSQ1cVji9ykIdSz/kyVz2I
	tYVyVQPfKLBlnTGTKfco0pARkOtNPAeQXWrXSnP17xDmIRwIlL65pWmpcCAcT6dKveZSQiCTpfZYK
	Kc9CugGczKGamw03SvAQtgGuOKp0Wa9G/MTVWQHT42tnRzSgXQ521ZWjRggNOof8uSNBS4ChYYkEg
	/FlwfgQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBGLG-00000001MMe-2iyx;
	Mon, 28 Sep 2026 18:44:46 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBGLD-00000001MMD-3baB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 18:44:44 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2db33db4de9so9325ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 11:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790621083; x=1791225883; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fGyq3NjAgVBa/imXLuFDsnsoYGS7geOe1+K5qFW3IBY=;
        b=DeGEC2EQlV+/U5NSRRVeDUWt8hTI332T7UDak1Fq9Jn4PIiCNJvMLNiJ1o00aVxYYL
         yEVk8KKpftixitalw1bataKpIFbnmTGyeCq8kZUSQJ8FFvHGIr10NaUHBN3FzG4fbWlE
         KjsbLxvSmpZNmrd1YdvN2MoBu4LfNzyj78V6dqyRn4TfcMT/AvUhk6/oMkDYBNLO5zEw
         dF8Qrq9JjxMfXpXCYEsr6/5T4A+qxu/ec/dCZ3U0U/f3Ly0RzNDOtPZH3uKiv9DbLVyx
         u2wXv3afggxgGCHfZzHGoul4hxH+RDeZyUu0MHaBwaR0vHzvGdRsYuieMp2JYOY1jT1N
         vhzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790621083; x=1791225883;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fGyq3NjAgVBa/imXLuFDsnsoYGS7geOe1+K5qFW3IBY=;
        b=2VZR2VwOmb5Kdh32xUGpFtVuIEpdDT3mQP8eZGkeGwiH4EmAWC2XT2Q7UiZyv8XDp+
         4hfTLaPS5vjlS5jK5lHnykxao1+1YNH+AGyAAwuRyQVjkdXpnMNNUyIvEgXUOJliAHYM
         syo2mTEatY2ZvKaKBfihIq31gOF72wL/LoinSHKjZyd+JQJHCQClOxbU3X9YbynTbtJK
         87Gf21C7kwItzEDrwMCQ4z+CfSNfjDkCrdQZG0dAvBPIx0TGXAd0MQr4CISr3eKB/rtj
         7SagC3fyWIAM/XxFGW071TfTlw4R6RqXv1ufTqUMwrz9lJzbYQJNHhzC4hqdY2FjXmTL
         tW7g==
X-Forwarded-Encrypted: i=1; AKwUvBwrQK78lEyKQ5qq6E0pY1dbeHM+HT7wQ/tdVYxs4McbBtXB0CEVdvF9/N1wUlv2n9To/zfRZuZxNDnTNo99nzxP@lists.infradead.org
X-Gm-Message-State: AFq9FYKkBvn1w2O7PSRagCWuvhAxmndnnbdLlORWpai198bUEbW3ePww
	DRRrzwm134CT0ZeTubTFHhx7j2JeNHNOV3yVaIwORaAM0nzpIZFOwXtwQGYG61G0zQ==
X-Gm-Gg: AYBFou0UxnmGCehrzWKWZopcDpRfOV8jW12zgzKxSROcqmJhGMK6D6GRhatp26gkZrW
	DTJQ7qU3vW2FQ+xLkC/ubzIXVE6e9FwwktbuNUTV23FWkmhf5YK2SVs16xFxoN7CZb+2n11g0xQ
	WxpBqFAZVxVXksMqHZzoblhaQ1WhlyFs1655jpn9FRXSRw1x8/Aap2j4I7yyPC+JaAt7AxH/IFe
	XBLtHYuBDADyWmvQQixrx2WI5ybMf135/DSk5pQvZRAYPpyXBxQQAwUBEZxVoWqp2etXyCoEwNY
	MB0cOGTgbKKINnNQjRKKahnBPueqXJuJUWD7WLPQb4AHill6c8Oano1PFQ6Df4t6imBGgjQLImd
	rR958k1QUs3t6PrMwrYphNqIYhL0YG2x4nrLdh9Gf+N4NuAdm3LU1dmMx68U7k1MroPq6Wk8sPR
	vL9KiwlDeMJ3xAff7l6tJv6wgJ4RZSSU4Uoxj5vNU0t/LohQSv1YnnwXMD+3jOXbBC5VJFenSaV
	BdjzoWWMAGR9hmAp8zk5dmsyfmi2KrhrFGa
X-Received: by 2002:a17:903:3a8b:b0:2cf:9ec1:ea6e with SMTP id d9443c01a7336-2e2c600c613mr90615ad.8.1790621082290;
        Mon, 28 Sep 2026 11:44:42 -0700 (PDT)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4986a1910sm767152a91.14.2026.09.28.11.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 11:44:41 -0700 (PDT)
Date: Mon, 28 Sep 2026 18:44:34 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, iommu@lists.linux.dev,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Will Deacon <will@kernel.org>, David Matlack <dmatlack@google.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	Samiullah Khawaja <skhawaja@google.com>,
	Mostafa Saleh <smostafa@google.com>, stable@vger.kernel.org,
	Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Subject: Re: [PATCH v7 9/9] iommu/arm-smmu-v3: Support the DS expansion of
 range invalidation SCALE
Message-ID: <arq1kpVwCUO8xrh2@google.com>
References: <0-v7-e84261bbe7cd+2ea80b-smmu_tlbi_jgg@nvidia.com>
 <9-v7-e84261bbe7cd+2ea80b-smmu_tlbi_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9-v7-e84261bbe7cd+2ea80b-smmu_tlbi_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_114443_903662_B7609411 
X-CRM114-Status: GOOD (  16.73  )
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

On Mon, Sep 21, 2026 at 08:55:17PM -0300, Jason Gunthorpe wrote:
> If DS is supported then SCALE can go up to 39. Compute a scale max that is
> compatible for the entire invs list.
> 
> Replace the has_range_inv in the invs list with a 0 range_inv_scale_max
> to mean range invalidation is unavailable.
> 
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---

[...]
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -1060,9 +1060,15 @@ static void arm_smmu_invs_update_caps(struct arm_smmu_invs *invs,
>  		invs->has_ats = true;
>  
>  	if (inv->smmu->features & ARM_SMMU_FEAT_RANGE_INV) {
> -		invs->has_range_inv = true;
> +		unsigned int scale_max;
> +
>  		if (inv->smmu->options & ARM_SMMU_OPT_FULL_CONT_RANGE_INV)
>  			invs->has_full_cont_range_inv = true;
> +
> +		scale_max = (inv->smmu->features & ARM_SMMU_FEAT_DS) ? 39 : 31;
> +		if (!invs->range_inv_scale_max ||
> +		    scale_max < invs->range_inv_scale_max)
> +			invs->range_inv_scale_max = scale_max;

Nit: maybe a short comment here, e.g. "SCALE is 6 bits when
SMMU_IDR5.DS == 1, values above 39 are treated as 39 (H.a 4.4.1.1)"?

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

