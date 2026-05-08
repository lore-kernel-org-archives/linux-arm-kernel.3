Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C1DCD3436
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 07:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BBiPzLiMNb5Ft+ivB2cbnFlSBWl3wYEHINWOHyDQ95Q=; b=F37UrBGCIarQf10148ic9QukFH
	3rkkkjeySodGrDJJ/yXcifDjkbz+loqsG02cmomBuEG7bg+oK6YgtqT+Q9WiaYFSiGj04MalmN+gQ
	CXPlL9K+2b44WuHFpYIkYq2W/B2DaHrx/iTuD0WuVD8L2R2gZqQMGVUYyuvdbDtcD486CGEmGtBlP
	5F83PqnHg96X3c432p+dxt9XkcSfMKICVKpWENNuGsdl7dzuP1VJoKsunJ1l5b0ehDm5tYdJ/vOzp
	J2PhBu8/t9jXqEJks6juu8UL+ymNSbcsytCReZLw1aX1Z7QZkcdQaFOMO+Eqy2zVR1WL2XSCn7D8a
	K2A1wSRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLFwC-00000005uIn-1dYL;
	Fri, 08 May 2026 07:47:56 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLFw9-00000005uHv-2Sjb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 07:47:55 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2b46da8c48eso59395ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 00:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778226473; x=1778831273; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BBiPzLiMNb5Ft+ivB2cbnFlSBWl3wYEHINWOHyDQ95Q=;
        b=Z65wRcUCvUagSQ4Fx1Ysv32eQe0Rtt9ixjGSzL+DdcxrxWX0NF8H+qXjv/EbvQ/dnK
         6NNOQE/a70vDDAmR7YC4I2G2Q27dtmW1sTHXSJd+F01RYjeCdkfIlx3NsQYgIbIBnfBr
         xwVrhH1o1+ZXrVC5AdQ+Lg/A5hQXXReNhGkYcsL93cebu6+mbMpGvDrkA2vEG1AdvmIs
         b5/cSKOcrrEdmc1hTx+zp7XiRnCqa/9ILxMb6U6H2O1hZfaELrfBEz+OdoEPmyQjoSv9
         eLcXzgMi6HD2+ydYUE2hoydZu4ihs2uigPqMyuK/AzJgrZryLeDeLlsLE7TUo6rcEC7D
         TDgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778226473; x=1778831273;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BBiPzLiMNb5Ft+ivB2cbnFlSBWl3wYEHINWOHyDQ95Q=;
        b=jDuCu+36BsGbW1xFrLERyLOAmXFHoa4yo4XskwnnHJJHTe4LlZED4Y09NmSH3nMbD5
         Yr1erscE316Wp0E1FgRuBXKGs4rPQ4ltIg09lBoSOR4r6rlRGxKQCutM4+83MylUVUTo
         U8d+fa86vi3qyBcUwlVW03K+HdbLc8/eKt6LHtO6DDdPesl3cWMT+Uv7e08iAtLfiszJ
         W/NciefG1bKfBeAGarkIL+5caBg+Xw1V5cLOXpbVltRRrxAa3ItKSbgubrdNp335aknB
         5lL/E5Qn3s7Ys2dwR9dGjjbRvRkgJYSxmZ700JEtfinJeAaE336AakANkDhBR5J3cR/B
         A/mg==
X-Forwarded-Encrypted: i=1; AFNElJ/81EDdyNuvZANPSFQ1jfvgXqbotVZgk8+mNf3i6gilb5Cqf7k3lAdMOVoVWQlqiPJqRcs7x5ODPXp/FxO+Ampj@lists.infradead.org
X-Gm-Message-State: AOJu0YzCpjBU9YrYA/8rYien5KIPeuAhdEr3Flww3eDKqr032Gpva5lb
	blEXoSRZsiXMsHzHlLVZ/7AlzoKUhORGCCA8zZWvqUDg3YGocUhFdAo/8b9mf3Kmrg==
X-Gm-Gg: Acq92OFZ/pvUr6h3UPKmWvRiVy2ELeQBjqPh/H6LQfAL8uHkWYi9JWSit+wkLC2dfRo
	f/HZSKMCc+yVjx0izRY2zC0w17dYTpP4OZj/MJp1MzA8yBQyg3EiKClG1Y7DD9NslV1Jmsvu3QB
	JgXCKJx7glQ3QYpOpXh/AlXX9s7jC9Xriw1Pw7zY6p5cN8Rp7ay2/ZLkI+rNS5F9frZ+rNx84vi
	ncB2YV8m6cgcWTCZcT2f/E06zWUrR2MdfaJzRdszpjckPQZ3MNiJrAUUcltFzrT4t96czvOaElQ
	r45MKRam3hUyQSWVAkBcJaeMUCmwz/9YN3c7UXExJqduKdWyhyYRqYsbiYCrNBs9lSU7qT8gy8f
	Tp/Xp6x51yOoDdhbToeHvdqqRyr7GnjjJMmA+AFo5Q22PmhWUe2EOe7jJJ60eC2a6kmjSn3bvaK
	eU2/oyeIgM0vXlJ5fsDTefEd80QNIQKr9JQOzA2NAktARRTfBurVvQfAhwJiJA7Z3XwQ6E
X-Received: by 2002:a17:902:f7d2:b0:2ba:743d:259a with SMTP id d9443c01a7336-2bae9e6919emr2193705ad.16.1778226472162;
        Fri, 08 May 2026 00:47:52 -0700 (PDT)
Received: from google.com (44.234.124.34.bc.googleusercontent.com. [34.124.234.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965d35b3bsm10490147b3a.24.2026.05.08.00.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:47:51 -0700 (PDT)
Date: Fri, 8 May 2026 07:47:45 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	Robin Murphy <robin.murphy@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Krishna Reddy <vdumpa@nvidia.com>, Will Deacon <will@kernel.org>,
	David Matlack <dmatlack@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	Samiullah Khawaja <skhawaja@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH 2/9] iommu/arm-smmu-v3: Use the HW arm_smmu_cmd in cmdq
 selection functions
Message-ID: <af2VIXhI0ryEbWn7@google.com>
References: <0-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
 <2-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_004753_951370_A60195F1 
X-CRM114-Status: GOOD (  14.76  )
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

On Fri, May 01, 2026 at 11:29:11AM -0300, Jason Gunthorpe wrote:
> Start removing the use of struct arm_smmu_cmdq_ent, starting at the
> lower levels of the call chain. Change the functions that determine what
> cmdq to issue the batch to into using struct arm_smmu_cmd directly.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 47 ++++++++++++-------
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  8 ++--
>  .../iommu/arm/arm-smmu-v3/tegra241-cmdqv.c    |  8 ++--
>  3 files changed, 38 insertions(+), 25 deletions(-)

[...]

>  	index = cmds->num * CMDQ_ENT_DWORDS;
> -	if (unlikely(arm_smmu_cmdq_build_cmd(&cmds->cmds[index], cmd))) {
> -		dev_warn(smmu->dev, "ignoring unknown CMDQ opcode 0x%x\n",
> -			 cmd->opcode);
> -		return;
> -	}
> -
> +	memcpy(&cmds->cmds[index], cmd.data, sizeof(cmd.data));
>  	cmds->num++;
>  }

The memcpy is a temporary step and goes way in Patch 4.

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

