Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A97CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 17:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Q5C2LLfqbajf/Y7SPBe1zxsZGv3Xt9x9u3AniG9xBc=; b=C7MSEDEfh/dQ2l6+HVx9/Zi9CH
	YxC3W/hMZZWE0iq8tLJzfDKheX8xyv1nOuAFqcMGIAXsSUCR47D2Wr/8+IIaxsURojd6PhVN2lS+B
	PWoHIriNmXOpCb59XTKJFUopCUw8Pm06W5/L96SXrB0vLHz42Y5bunaJTWANyclNQBuepbMn5vvy9
	40EZJVSL9/4TezwthMWadqUL2vf3UTnrcm5xAhw43hEhDFAp8UzVXtSPw0J7uXkQWdPNKkPtsD+Ot
	5727trfApY2SY/AggGX+jGVL8zFmkvgvzoij4vyS0FHJG91p1bjGdyNfJF2ejDlBaNcfc1Thlcfuf
	5mgkq7Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZAgy-0000000EcJ4-3rO4;
	Mon, 15 Jun 2026 17:01:44 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZAgv-0000000EcId-1xhG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 17:01:43 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-490b23c828aso1225e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 10:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781542900; x=1782147700; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7Q5C2LLfqbajf/Y7SPBe1zxsZGv3Xt9x9u3AniG9xBc=;
        b=EV9KJ3mX+eNUc1U48lbbegbM8ypXyPIzPv3BlJNweVSz3jDkxaSNNG31BY+CAnL0a7
         QlA0iTodoVEGHYL5zk851sngWhnkHu+lX9S/PJ54xM3rWuWbLywVo6JjaYeTyuDfREOO
         jJfdz1KQ4ZVgLMWOLIzUofSZm2uNregSswcNedsq+XQugap0f7S1PJXLmaaaZHtsalcM
         yD8yZhh9AJYiHaIQ+8/VxvkORbpQ9500dUq+314RYZLMtj3ZQIdeLkhEZb7K2yIYi0wu
         pzHaKJn2ZO9UU46zsDSq663Fc6U0HybdNVjBCRH8krRKuadvwcMpR3jGjHmYRRhk8c67
         RCqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781542900; x=1782147700;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Q5C2LLfqbajf/Y7SPBe1zxsZGv3Xt9x9u3AniG9xBc=;
        b=O7WWRYstYyqokfdFawOx11j7SWo7aiJQ3aT0a2kPdTGBt4rfgzpPav1LgvIYlM3UwE
         NfiPVXdzsvgOorGW/oaE2rlP2/Dn2tACwJAIg7p/cYdpELhuXFHFug194CIf94xlSUE1
         fYIUvA7mJa/+/8oTyTHS/LH1LkdEe1IgS2SHKhP1lJSsSAjS8W7lbf03xXcIgEzCjpBO
         cWnQRTRpmLXgKrsLrb4e4cBr0gZqiNCN6WnbunCZEsDFor9dZ/37WGrOqFq5paYdmlKa
         MGpjCaCeK9CyF4dOt+P4IIqUaXWo6XWhpSmuWwVpvb6HmdOfDdwlpT6+lB7tqV1aYe9e
         ctbA==
X-Forwarded-Encrypted: i=1; AFNElJ87/81Q0KrwOID1wKQvxyl9Ng5ijvNh7o+KWPb55k5s3kIxoXbgb5S0fjtZuCYGEpU+zUmShVddVz3oqgOY7YDO@lists.infradead.org
X-Gm-Message-State: AOJu0YxzMcd7geG+yMnBeiMxyOYLmj6m3k8QwbQvBxlHjU2Z+3YNdpOl
	Jiq+1Shb8CxNQA2CKUiHfQBmRU6Ok70IC5dTIW2YEla2tsxBYw2+Zkow1DREavbVmA==
X-Gm-Gg: Acq92OFLOxtkwah/NgdV5rJdt8LyOc9xNRYu1lYwXoccWExqvRiAB/9eL2DD94JJDGb
	gUcKQ/kzNdilH3QN/I2M1RIz59ZPYmio6vlriKy63y3NNr3TVlIk7x3lbqJvTQepzK6gqSztWkP
	S7qiNGs1qbrOP3xfKvEDfrb68uMWvZ6G/8KRvXb2PqBe4oI5ksiUqo2+Tt9MuM9xCF89pcJkz+i
	JmyGw2/2Pq6cuwEf0/h3f+BEDnyEZ7VR4GTjy0+28kV4CfDrXiQRDN/GY/PsE9tZUkAt4ojuN9t
	RouxLciAfHBu05mYwiYkQHPw9S4dlrJQwBXTHk2SOxDru7waXuR25yR2sMQt23GJVhpp9o66WhD
	jECSBNuh4zLX5J6zWchtYqVVfrlr2EDfifLgfPsWbw8fHu5LU0QWjw1J6b82xzebhdktq1hJLk1
	PcmhXhW1aF9ghrcomdlykNQhIu4Um9zYSVyIf1C7NI4IzKJxKPOkGzhdPJPHr+2w==
X-Received: by 2002:a05:600c:6994:b0:490:af6a:562a with SMTP id 5b1f17b1804b1-4922fcb16fbmr42715e9.9.1781542899200;
        Mon, 15 Jun 2026 10:01:39 -0700 (PDT)
Received: from google.com (140.240.76.34.bc.googleusercontent.com. [34.76.240.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26392esm35682057f8f.3.2026.06.15.10.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 10:01:38 -0700 (PDT)
Date: Mon, 15 Jun 2026 17:01:34 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Pranjal Shrivastava <praan@google.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Nicolin Chen <nicolinc@nvidia.com>,
	Daniel Mentz <danielmentz@google.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 04/12] iommu/tegra241-cmdqv: Restore PROD and CONS
 after resume
Message-ID: <ajAv7pvRlAgLR7cn@google.com>
References: <20260601215909.3958732-1-praan@google.com>
 <20260601215909.3958732-5-praan@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601215909.3958732-5-praan@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_100142_580391_BF9D039D 
X-CRM114-Status: GOOD (  17.28  )
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

On Mon, Jun 01, 2026 at 09:59:01PM +0000, Pranjal Shrivastava wrote:
> From: Ashish Mhetre <amhetre@nvidia.com>
> 
> PROD and CONS indices for vcmdqs are getting set to 0 after resume.
> Because of this the vcmdq is not consuming commands after resume.
> Fix this by restoring PROD and CONS indices after resume from
> saved pointers.

What commands are exisiting at resume? Won't
tegra241_cmdqv_drain_vintf0_lvcmdqs() drain the queues and make the
PROD and CONS equal each other anyway?

Thanks,
Mostafa

> 
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
> Signed-off-by: Pranjal Shrivastava <praan@google.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
> index cb1e75e4ee91..866cae7b73e5 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
> @@ -511,6 +511,8 @@ static int tegra241_vcmdq_hw_init(struct tegra241_vcmdq *vcmdq)
>  
>  	/* Configure and enable VCMDQ */
>  	writeq_relaxed(vcmdq->cmdq.q.q_base, REG_VCMDQ_PAGE1(vcmdq, BASE));
> +	writel_relaxed(vcmdq->cmdq.q.llq.prod, REG_VCMDQ_PAGE0(vcmdq, PROD));
> +	writel_relaxed(vcmdq->cmdq.q.llq.cons, REG_VCMDQ_PAGE0(vcmdq, CONS));
>  
>  	ret = vcmdq_write_config(vcmdq, VCMDQ_EN);
>  	if (ret) {
> -- 
> 2.54.0.1013.g208068f2d8-goog
> 
> 

