Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45120CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 13:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=soQDxbku75wcKlRQCmyQHwxlcohTMFfAqg+ZHNumi64=; b=SfawVPB2E/4qiD0SBUBxlSe9jq
	NXw7RG7qhqijzLOO29jjmD7/nRlM9gopdbskFMSdcejXu9Zkw8cq3SOQCLFxEzJcAP+ubbc494MqZ
	25XVX94K5YmRp3SJtRF//LY6n4zVrugF77zaFYCa5vQ/REBxc0oZQBK2Sv8PaFT8EPdHomdw83WAt
	bTR93/LxLvUxMMO3QNo2qvN5SMkPcpSo1ijzD7LDyrUyxzi3F75ygMu9MiugP3heqTLSAE5aFIx4h
	HW4210hOm1j1pV+0vN3SJfzdBow12LH9ZqGCm95IsmZ4PiSHNjzBEBc7QuJ9WihT1FlcESq+XI/tQ
	Dk+Abypw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gcq-0000000AVnR-0Ypl;
	Mon, 22 Sep 2025 13:30:40 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gcm-0000000AVmS-3n1z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 13:30:38 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-4d1c5c3f77eso1249591cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 06:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1758547836; x=1759152636; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=soQDxbku75wcKlRQCmyQHwxlcohTMFfAqg+ZHNumi64=;
        b=EygiHnxyk2I/VKVA9t/vQyQy3zpV352PEDeundfWvRVVfXPv/NrJ2G1Zqkgjd03fzH
         xrDhjjwqf1LDF1NKz9emiPrqVc4yFl90W4WY5qEdXzUkOgE01S5AmK878xrBTwCtrYUM
         s1UGvNYazMJUG4GBcn60X7HUhnssiFjBMuWz6SoBahWf5fqVlFfxjWXQbJEXKEkyLtz7
         fohRHi0mKxqh3Mhh6L38RSlNVAeNVcBPlRMJp5iYwLzwAW1Rq7tI7Mqtakw2mM7fqQm4
         bA9ab/Z0OyJQ+feShKYIeoyPuNWg0kX4JiaZAxb/DFeZJGvn+5zshsqGSiuaJjwKcd2F
         6j/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758547836; x=1759152636;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=soQDxbku75wcKlRQCmyQHwxlcohTMFfAqg+ZHNumi64=;
        b=BlsraImQVR+26nPJgsYDL8J5Jt5YF++EVjsl74NC7yLYBtFh8eKHY084UyvWF1Oc8u
         9I0EcAugVHeIOvwKkG6riMYU/G0DNVpFiH+kK8DXERTpt4ip3R8bI8g2IR5yu8E2KVlU
         PSSGeI1ij93CuUj6R6wECg67xi7ya+k5yMgoU+lV3HOR2BkOo8ZbuMN+txjoXkRxiOMC
         NfQcbHw8C2U0rDNyXsCBZaEAhgeYHWDxXynvVSrSC6izoCCdZW2qcRWt2lPqckfiOtVm
         j+Pw58LIHwnZPY6bcpdLydxCr3CmZv3Ru6dkUAdIapYAfXDOZMrqfFdTBXhpV+x7DsnT
         PGGg==
X-Forwarded-Encrypted: i=1; AJvYcCXEE6cEgN3VGFrm5C4BZ1zr0rT1jZRnAooNxaRRDO2ZlTFTFIjuzzCr7USsA5DOAm/qtyDwXhu7Qp0ikLj27f6o@lists.infradead.org
X-Gm-Message-State: AOJu0YxGVQOTNqXGuLQA8OmwzXq798y4AEWLi+j34VMaluPofVM3hiMx
	E2d3SScI+XZpC5NtMQC3psZh8G5egVCVs49sU9kvTKArA/YxeXQ46/fNoUumKWU4en8zGDZpVrM
	2S9Jq
X-Gm-Gg: ASbGncsoTWE3JDZyQk7gX9/+KZ89uPb7ocxfLqyUuOuuhVedqQguOjJsvFD+uNIeFWb
	jsPoy84t5Rqr1yPCVsrEwnFSsBTy3IBEyXdZ5LagyaVlKM4RvDKESj3RQPdjXTdOMeStc0LOihG
	ljKE7eayZ5vmf2ym10oHbVqnLPB04cB86c+Jns/uRxD/95ZKtlxdBC4Db92d80WTUxGfdili1Sd
	+YKpTqvogTqbscTJigdoY5DI9Y38ci9mF2LK6ziVvAmqD8yIWjeHNip4v2Uv5csGIsC04l8EgL6
	WS2VYi1VgRHNVCQNSpjW2Riy3swAigK91WU8MMwJ3RJZvoHKuL8FQ7oO9lzTbXz01eqvrATa
X-Google-Smtp-Source: AGHT+IHe9wJVlHUhgN8DEQ7hhP4hzex9JskPCNLwwhsPxRlegpEsHbuCwvoIfwhhlPGANj3noJQUlA==
X-Received: by 2002:a05:622a:a956:10b0:4c4:40dd:2855 with SMTP id d75a77b69052e-4c440dd2b41mr79485051cf.29.1758547835584;
        Mon, 22 Sep 2025 06:30:35 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4bda25aa5fesm70078611cf.18.2025.09.22.06.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 06:30:35 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1v0gcj-0000000ALyq-2nW5;
	Mon, 22 Sep 2025 10:30:33 -0300
Date: Mon, 22 Sep 2025 10:30:33 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, robin.murphy@arm.com, will@kernel.org,
	joro@8bytes.org, praan@google.com
Subject: Re: [PATCH v4 2/4] iommu/io-pgtable-arm: Move selftests to a
 separate file
Message-ID: <20250922133033.GZ1326709@ziepe.ca>
References: <20250922090003.686704-1-smostafa@google.com>
 <20250922090003.686704-3-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922090003.686704-3-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_063036_940980_73AC36AB 
X-CRM114-Status: GOOD (  13.92  )
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

On Mon, Sep 22, 2025 at 08:59:26AM +0000, Mostafa Saleh wrote:
> Clean up the io-pgtable-arm library by moving the selftests out.
> Next the tests will be registered with kunit.
> 
> This is useful also to factor out kernel specific code out, so
> it can compiled as part of the hypervisor object.
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  drivers/iommu/Makefile                   |   1 +
>  drivers/iommu/io-pgtable-arm-selftests.c | 208 +++++++++++++++++++++++
>  drivers/iommu/io-pgtable-arm.c           | 200 ----------------------
>  3 files changed, 209 insertions(+), 200 deletions(-)
>  create mode 100644 drivers/iommu/io-pgtable-arm-selftests.c

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

