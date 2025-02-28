Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5579BC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 02:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uDA8ZdJRcIn7ES0nC9Xy5c+VwiJPVKulN1nVpxhKFD8=; b=Q0y4fk8BF+lgrIQtjNefqJ8IXy
	wnia6Ddwz99u1g5x9t5qyVz9wU8AnYW4Iv/20IbSZqSCzaFXPucKOa3gBMFWl93kgB4TiZnPAGnbN
	3bdSg7yiGq+qIGQFafQ0NPlqdgVim2JGA/dIiTaMbS3ber1juBePeJ7ZNZ7TiJJvuyXcG47YSmYNv
	OsJKzBxAwjEPRclkxV4EvqUv+3UiBXEmx43I2RkhglWiMsmdlCh1UmAvrbZHRjKOLaMnb0RWhqZE4
	DWFOWqLeig5PVY/Hn2f4BHF/RlxGr3ZVudYG8N5vo2g4xOtW6QKGRg0E8PgGCqIsxFpmFEwipF8cq
	jnbf3KIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnpqq-00000009SKH-07nU;
	Fri, 28 Feb 2025 02:11:44 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnpo9-00000009Rzp-2Yz1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 02:08:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740708536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uDA8ZdJRcIn7ES0nC9Xy5c+VwiJPVKulN1nVpxhKFD8=;
	b=PEFLHSCEo0o0Ks7GcVBbcwC2jmirNrOBOnnL5UH+83WilJew88iU1jpOJ5mEXbT7AMRJBS
	r8HYYBwWYcRgWkPCNEzT8VNJ4nhg4YLEHU4jZM6eT8uCvLiYUNTOKmVhLlPo6h/T+oxJSO
	ZtlQdxgVZ0ouwFvqa671zi+A7nDKNDg=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-503-Ig5Xp_ABNRODAFnB1SjS_g-1; Thu, 27 Feb 2025 21:08:55 -0500
X-MC-Unique: Ig5Xp_ABNRODAFnB1SjS_g-1
X-Mimecast-MFC-AGG-ID: Ig5Xp_ABNRODAFnB1SjS_g_1740708534
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-22331df540aso47645305ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 18:08:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740708534; x=1741313334;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uDA8ZdJRcIn7ES0nC9Xy5c+VwiJPVKulN1nVpxhKFD8=;
        b=aaxm/NJBNplTQh0oYs/hUKHYhJG6//OarBtILhXQt5HJGCexG19Wlrcc1IbJ772FSx
         trdVmnVlai2/2zj7RtNcM+nRC100CHq7vnbDSbnx17uwBwOuMd1OYJ28F/RLA533LbKV
         zzAD6XbV6OrP9qUiNm1lgESjnvRbB3uDn9R63FYE4OPl+cGTLQFQ+rkgB+oKxDK7upwK
         HpxJaFlkYhFWcBVMuc2G5QjHGj9rwACj1Ib2l4bk+evTPBoiZmYYCVsSUh2IV08qcqaU
         dkV+CMJG/vCKDN0GKtMXl7Ace8g5G9Iw6HlxD+XKaY7HIQzQ7qOanuNa3KvVN5Gio6Rc
         80FQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPJu6fgqWRC2BD/mQKbFIkzxk98A8aE+3FoLL2hg1SwdI4kJ0yr1FphXUuImyF9HSKtnDTUeabemknzDrH3yM5@lists.infradead.org
X-Gm-Message-State: AOJu0YxT6dRBH0HujbYom+NfEjX4PUNX0shzkZlOPsvMIKdEJdgLDjUC
	xdDN6LSlkkPDaSrpv2iuPHgc9FYO4f4mxIni3MoXNgq/wLqe2//lCrA4qF3oPHffsOuO4ncK20V
	GZocm4068bxvGnl2UOH5I9p75eJpiYH5nSZoMilMGG/U2rJVX7nCKLKy+DlL8/DeeEcJN+Sw/
X-Gm-Gg: ASbGncuohfx6/CYsJLMQqp3gs0K6wl+xgh4YJicvWJe7fvpSYm/qb4u1UvMyMJV5KEP
	qgJf3qrDKdoBaP96nwHhh094B3aMe61ekFK2IaKZkfb5sqiIpapJPbp09SHwpShAOnPD8tqHsw7
	Vm0BcFqRcQN9LVYXhysV8i+HL0AEIoIcb3Mo3LFIIIi5caSwOqst85+O4UQbCgtBXNqeI8QVnVV
	47xehkAjUU9iqeXsKELkhuLxdTKbJW+6YFXickVSa+Q5SoTTuLAAC0BZneXHDIqiAeXHlnCfzAK
	AYep1rOfeEuGvsUrmA==
X-Received: by 2002:a17:903:fae:b0:223:674d:c989 with SMTP id d9443c01a7336-223692585fbmr22521145ad.41.1740708533541;
        Thu, 27 Feb 2025 18:08:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFu9ARko1SYR5EXP3Bd9fWGTG0mutlK4ufDD7+7kHYr1uaxFIPvIaHW+HuHlgORm9NSM1R2nQ==
X-Received: by 2002:a17:903:fae:b0:223:674d:c989 with SMTP id d9443c01a7336-223692585fbmr22520815ad.41.1740708533178;
        Thu, 27 Feb 2025 18:08:53 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.164])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223504dc3b7sm22723325ad.173.2025.02.27.18.08.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 18:08:52 -0800 (PST)
Message-ID: <6ae2b809-7cc6-471b-9065-be446411570b@redhat.com>
Date: Fri, 28 Feb 2025 12:08:47 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dma: Fix encryption bit clearing for dma_to_phys
To: Suzuki K Poulose <suzuki.poulose@arm.com>, linux-kernel@vger.kernel.org
Cc: will@kernel.org, catalin.marinas@arm.com, maz@kernel.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, robin.murphy@arm.com,
 linux-arm-kernel@lists.infradead.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Tom Lendacky <thomas.lendacky@amd.com>
References: <20250227144150.1667735-1-suzuki.poulose@arm.com>
 <20250227144150.1667735-2-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250227144150.1667735-2-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Nw2wn8KIiRkl37d0CemiHDmWYJ-TjNRuJhB8RBD4sEg_1740708534
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_180857_726715_6D77088E 
X-CRM114-Status: GOOD (  12.69  )
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

On 2/28/25 12:41 AM, Suzuki K Poulose wrote:
> phys_to_dma() sets the encryption bit on the translated DMA address. But
> dma_to_phys() clears the encryption bit after it has been translated back
> to the physical address, which could fail if the device uses DMA ranges.
> 
> AMD SME doesn't use the DMA ranges and thus this is harmless. But as we
> are about to add support for other architectures, let us fix this.
> 
> Reported-by: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
> Link: https://lkml.kernel.org/r/yq5amsen9stc.fsf@kernel.org
> Cc: Will Deacon <will@kernel.org>
> Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Tom Lendacky <thomas.lendacky@amd.com>
> Reviewed-by: Robin Murphy <robin.murphy@arm.com>
> Acked-by: Tom Lendacky <thomas.lendacky@amd.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>   include/linux/dma-direct.h | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>


