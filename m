Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E553D6E2B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 16:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+IFgshQmWOBMUvxTwruPAcrC79l+n1VOqPFKCVMtLyY=; b=VSdJUkJKWzvci9I7x1wa2xFJW5
	rDLa8DHcQsOQEVZ+MLBrYuOVFUxT8FXbyG5rPOplcWDEyNCSgGFq0hMFUBke9YKXD0p/fZL1GPBMK
	yo3n2mvImTAuuRh6qCgT5Q0DNDbS8meiNqqYMAOdtDdVgtxviWssOkQol9slvQNXWrV5t+L9konJU
	fhWYSrlVBPFQCmO3Cln1Mx9UqpaYMwyt9aI7wxtagi0gBmMGTeGFbOYfNu7EjfsytTI/g9L0gUqXZ
	HqmI6a2kIFlhSAFaQYI7sizDBDo/+biJcOwqyyK+EcCxLG2KNYaGe8kxkgLQ2kjkKkAFbuvSHJ+ky
	yC2+iOTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWH5W-00000008qXO-04vw;
	Thu, 18 Dec 2025 16:42:50 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWH5S-00000008qVv-0oEE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 16:42:48 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4779e2ac121so73445e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 08:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766076164; x=1766680964; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+IFgshQmWOBMUvxTwruPAcrC79l+n1VOqPFKCVMtLyY=;
        b=Ja7dgroZlNBPlUS1/W57vW2SEQTa1uuVUF3jZCrWkmwCqr1Wc0dd5pOLTyfYqsRhwa
         /iZ+OKY3avTRl98hOe3wHvU3uFhyd35zivoaDHd1uBsJVdBbnGXXOF0S5IbgXiRUkPSr
         YvUTQqNWn9pJVV/2mxrsbaGX8FzC23ODbIyxrZXyWd+7ljBg6d1Lcb/uUQ2qMyK4Z9cS
         i+ZOdo8D5W3C9T9Khz5dKUMON7AS4XiAq3htrgN71D/FohuUEXqF5/+smVtfP/GewQtD
         xcx519Pt5aYoTOW/jZeft9wmdkOyM0IFehNJyGa14VqVJK+9CZQRUfmOAb1XQ3Lat53Y
         03Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766076164; x=1766680964;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+IFgshQmWOBMUvxTwruPAcrC79l+n1VOqPFKCVMtLyY=;
        b=eyAEDWRjMHJda5ZIS5g2OJDhv34FAG/AF5ffmWLuzWEudpuLErwElqTwZqborrHnDZ
         Lc/KpAVSeJSeCybeqkYAFAb+rsGXgcbukvzTYhSeBGj0XtBwLuIVJEyY2BDOX1KYi8oW
         byZkJaiKt6FC5N32VAIt7UbeADrHeqm10095GZsc8GUZyGthp52wZ3qLRoTIZu/nfS16
         cB+FFbyDjXTHr5g8F/6JNcm/TRppLfINo9HNKYEAL4X1exyBVUeekJ47ZB1YtNg4EPCs
         cqRW0sDLKWRSxElUPE/4jvD0Q+/BStCQKwXjM3f7r9vRBdFKSvpvTLNQN7oCSuDfkya1
         6o6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXuzgVskSd6oOS16TKXks4Bln3RIRxPRAs+xFIIheJfqvbEzMuI4MvoGQ/hipDIhL5Dt8rZ0DPVB2JZx+jvBh/Y@lists.infradead.org
X-Gm-Message-State: AOJu0YwNSeisPRsjJ0nflYxQO0NS5BWRFbCujI3N6NtRZEpm3PmH8y4O
	UbMDBD9DTg7kseIobUJz4wqFQ2eCclCbozVrIeDchq0TGlERcUpVskJQw6nhH3Q1vw==
X-Gm-Gg: AY/fxX7rSG+VwxMGpfS50otgQfnS23QhkXNlpbBINOZ2wSS2Eakzb9JhGgRPDFXmQIu
	31B4u5q8JlW1X5mvNimV3aOw7OvocLh4pjGqpPgmaDgu61CNgwJyWkIejg50pCFkbiUuEB5yVrM
	mwuCFAnuX+kcDDbWu6KxUVbaoL8LkrNxFhay1AlZcpKexeDkWRljB8idZ1YLO/aAF2pR13oJY2k
	6ZSWuKZ/XXZ0N0rVMI0kmPVtblXzU2WoSZAOF+ED41FEoZ3oJweuL5v9EfroQvlyIa+E4RwKrwI
	rXzFkpL8MDfmUXt4l4xhmOutmuXDicsp+Lx78ZWgHP3PTiG0RxN+zFmgL689j1Qs9G7a1gwF2Si
	sSXZHATwT4513wjvYLe6ZcJZTpVbmXjhAEpFimZgKnASzO7KLMN2CEM+faioSGs2cc7Ey7ndnHK
	QZMFuAiSpScXABlZZCDWYc7GktIqPBxRxHeewYvzvks8+NVeYNMkRSgOaBTA69M6o=
X-Google-Smtp-Source: AGHT+IHHeIFx2+0vxOZyFtZ+vCiLpMtmd8EAFHGp/iCDxGY1OQ+0R1arRjVNTaj9Hz0mThE+88JGgw==
X-Received: by 2002:a05:600c:574b:b0:47a:8a6d:f4f0 with SMTP id 5b1f17b1804b1-47bf6b69182mr447195e9.1.1766076164138;
        Thu, 18 Dec 2025 08:42:44 -0800 (PST)
Received: from google.com (171.85.155.104.bc.googleusercontent.com. [104.155.85.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432449adac0sm6085692f8f.42.2025.12.18.08.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 08:42:43 -0800 (PST)
Date: Thu, 18 Dec 2025 16:42:40 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, skolothumtho@nvidia.com,
	praan@google.com, xueshuai@linux.alibaba.com
Subject: Re: [PATCH rc v4 3/4] iommu/arm-smmu-v3: Mark STE EATS safe when
 computing the update sequence
Message-ID: <aUQvAKjVUT1L3N7j@google.com>
References: <cover.1765945258.git.nicolinc@nvidia.com>
 <adf08c3b9f289188aca4fe80e506dca7aa48aa19.1765945258.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <adf08c3b9f289188aca4fe80e506dca7aa48aa19.1765945258.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_084246_250091_A66DD134 
X-CRM114-Status: GOOD (  27.82  )
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

On Tue, Dec 16, 2025 at 08:26:01PM -0800, Nicolin Chen wrote:
> From: Jason Gunthorpe <jgg@nvidia.com>
> 
> If a VM wants to toggle EATS off at the same time as changing the CFG, the
> hypervisor will see EATS change to 0 and insert a V=0 breaking update into
> the STE even though the VM did not ask for that.
> 
> In bare metal, EATS is ignored by CFG=ABORT/BYPASS, which is why this does
> not cause a problem until we have nested where CFG is always a variation of
> S2 trans that does use EATS.
> 
> Relax the rules for EATS sequencing, we don't need it to be exact because
> the enclosing code will always disable ATS at the PCI device if we are
> changing EATS. This ensures there are no ATS transactions that can race
> with an EATS change so we don't need to carefully sequence these bits.
> 
> Fixes: 1e8be08d1c91 ("iommu/arm-smmu-v3: Support IOMMU_DOMAIN_NESTED")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Shuai Xue <xueshuai@linux.alibaba.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 12a9669bcc83..a3b29ad20a82 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -1095,6 +1095,15 @@ void arm_smmu_get_ste_update_safe(__le64 *safe_bits)
>  	 *  fault records even when MEV == 0.
>  	 */
>  	safe_bits[1] |= cpu_to_le64(STRTAB_STE_1_MEV);
> +
> +	/*
> +	 * EATS is used to reject and control the ATS behavior of the device. If
> +	 * we are changing it away from 0 then we already trust the device to
> +	 * use ATS properly and we have sequenced the device's ATS enable in PCI
> +	 * config space to prevent it from issuing ATS while we are changing
> +	 * EATS.
> +	 */

I am not sure about this one, Is it only about trusting the device?

I’d be worried about cases where we switch domains, that means that
briefly the HW observers EATS=1 while it was not intended, especially
that EATS is in a different DWORD from S2TTB and CDptr. With all the
IOMMUFD/VFIO stuff it makes it harder to reason about. But I can’t
come up with an example to break this.

Thanks,
Mostafa

> +	safe_bits[1] |= cpu_to_le64(STRTAB_STE_1_EATS);
>  }
>  EXPORT_SYMBOL_IF_KUNIT(arm_smmu_get_ste_update_safe);
>  
> -- 
> 2.43.0
> 

