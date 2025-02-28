Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A81C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 02:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oTGEdMvMyyKhNYQ+tRKpSv2O6+mM21XzlC4cogCh4sA=; b=b1ovVYgiWsjj96sLy5XBxD6jWS
	yb0Cxh9YnA9WcQvw7EH9Yo+4BbPT2+bKvJbkAgUeKVuT74DP1eBuhisAuR1i2VixHu+JqLAQj2sOf
	wzUwzQdh+dOKtpL3+ORUDlU6pgiEDGxSceqJQp1w07x4gKHAttlLSBM9+z/QTcTOYexSNjKTvAy/T
	C0cK+rk6MFWCG1T+ZouGrBnQ1elodgmhawZdeJQqfihhO8NavWYqNTFkGt0kesm3UHhfjAsj0lqAj
	DKW8w0kzCyqkRaEvx6z6xTGpjaEJ0peGxLLLARLgn9rBeU1O4cfQlnsEOI6fKJXye5/2T+eeJ26mS
	Z521imXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnpts-00000009Sin-2frI;
	Fri, 28 Feb 2025 02:14:52 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnpoY-00000009S44-0Cm8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 02:09:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740708561;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oTGEdMvMyyKhNYQ+tRKpSv2O6+mM21XzlC4cogCh4sA=;
	b=LM4Ygl08BqLafXy1Esc4qmaDirxDdkvotp5SpwpTMLIHzukc/vFL4T+mXjc7eGYdqfV5hg
	1B/CrAzPL1G2Iz3P/89DmN0LTL9pEjuwABstuFibhP51jCVvN4NwNlq6HmUykE3fHE6Gp9
	jsvCmw0Ng1twpPRPwQedCQ9XyDZl53A=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-473-ejp71C2ZMaC8FvvIqCuYrA-1; Thu, 27 Feb 2025 21:09:19 -0500
X-MC-Unique: ejp71C2ZMaC8FvvIqCuYrA-1
X-Mimecast-MFC-AGG-ID: ejp71C2ZMaC8FvvIqCuYrA_1740708559
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2fec1f46678so410833a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 18:09:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740708558; x=1741313358;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oTGEdMvMyyKhNYQ+tRKpSv2O6+mM21XzlC4cogCh4sA=;
        b=VusSXZiAFme2xb9c99haDjmKol+NMFjqOAyKYrBs6ZI5GoiRmOnjq9C1I6ycO7b0V4
         hk9rpHGuCZXT43cMRTwALf6V9O+qO3ny4JsvXacEAfet+eK+LBYhfuAll8EvDM5/bYN+
         yCY2OFvE2i2UQwjUlyMvVfZnj5TZ1OnfzSiTOUQkPf00KnxAMIykzt1WsIGOpShWtyX6
         gZyiflucxZ8V/Uvh5o/dVk7jrAcbF69buPdWc4oFuSOR0waaCmbn9N89NzFSlEX4B7fm
         u6XKeA/vFazbKDzyzLXH+d7wXMTgqBZ0kEXZalo9sy6nMb1cm/Ns4PnTxc8Xoxb1V9MN
         g55Q==
X-Forwarded-Encrypted: i=1; AJvYcCWXKv5pqKRTyAzGnlsOO3QJNQl+8Kep12UdFP5JrGnCZxbCRS5H72hXdR5favKgiSWvwiFrAWRWxSjYQd/QGa9m@lists.infradead.org
X-Gm-Message-State: AOJu0YzsYERQ1IFwNKM/2bMSDXLcAgFgl7uvgxNixKlUY8bYkz/pqf1J
	HUI8Ttj5/AFmcjLLhnnw+0tVE4Ww+2F2vaKrcEvx4xFUtajo4pz3wp9ADucEEID3IRiJTyQ4xfo
	OTcYdgSu6XIdEctquLpa/kgF/uCnkpT2UWB5H/vvlnk3flRsvKyhJhRcE3Pk2qX8dcSQZKpMwvL
	3riJ5a
X-Gm-Gg: ASbGnctao+C52zUDsxUQjimOi4/0hMZk67CIa22WDxutnENK2aNUWj/oWdDZqrq2Juf
	UbXChFEtZavfBq6utzzZHJRuVQNQOYwkbqMqQFUZZEjFM5xdD3ef94Uq16XBpVxFM/3WUC+c28A
	if6aam9Bi9aKZHiw4Kh7NJkMn/ipLdU5IrXtUWRtV+iNPLqs7NQCGvSHDa/1oDn3jW9QS8ZNl9+
	BdegZmcxWnd9SSSHhaRZxFbdlJkow6Rrv4Y6ulaojDFG141aLOFpE/D3XwIbktgCn2RraGQPpzZ
	WWRmg38jbhQH5hXBqg==
X-Received: by 2002:a05:6a21:7890:b0:1ee:6d23:20ab with SMTP id adf61e73a8af0-1f2f4cc635emr2465266637.10.1740708558010;
        Thu, 27 Feb 2025 18:09:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEakws3JelgzGBAXf9l9mWjjAqu+6D7t+HRXAz0cviZfFNy9/h1CazsxywKOWIf5xzhjUujVA==
X-Received: by 2002:a05:6a21:7890:b0:1ee:6d23:20ab with SMTP id adf61e73a8af0-1f2f4cc635emr2465237637.10.1740708557737;
        Thu, 27 Feb 2025 18:09:17 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.164])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7dec49f1sm2250674a12.58.2025.02.27.18.09.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 18:09:17 -0800 (PST)
Message-ID: <b46da29d-73ff-4166-b0dd-bf252e9d6457@redhat.com>
Date: Fri, 28 Feb 2025 12:09:10 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] dma: Introduce generic dma_addr_*crypted helpers
To: Suzuki K Poulose <suzuki.poulose@arm.com>, linux-kernel@vger.kernel.org
Cc: will@kernel.org, catalin.marinas@arm.com, maz@kernel.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, robin.murphy@arm.com,
 linux-arm-kernel@lists.infradead.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Tom Lendacky <thomas.lendacky@amd.com>
References: <20250227144150.1667735-1-suzuki.poulose@arm.com>
 <20250227144150.1667735-3-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250227144150.1667735-3-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NQFqbmSMn2u9e4GTOec0PLH-LY3ihvPnyErCgmilFiQ_1740708559
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_180922_172432_D1A54AD6 
X-CRM114-Status: GOOD (  18.20  )
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
> AMD SME added __sme_set/__sme_clr primitives to modify the DMA address for
> encrypted/decrypted traffic. However this doesn't fit in with other models,
> e.g., Arm CCA where the meanings are the opposite. i.e., "decrypted" traffic
> has a bit set and "encrypted" traffic has the top bit cleared.
> 
> In preparation for adding the support for Arm CCA DMA conversions, convert the
> existing primitives to more generic ones that can be provided by the backends.
> i.e., add helpers to
>   1. dma_addr_encrypted - Convert a DMA address to "encrypted" [ == __sme_set() ]
>   2. dma_addr_unencrypted - Convert a DMA address to "decrypted" [ None exists today ]
>   3. dma_addr_canonical - Clear any "encryption"/"decryption" bits from DMA
>      address [ SME uses __sme_clr() ] and convert to a canonical DMA address.
> 
> Since the original __sme_xxx helpers come from linux/mem_encrypt.h, use that
> as the home for the new definitions and provide dummy ones when none is provided
> by the architectures.
> 
> With the above, phys_to_dma_unencrypted() uses the newly added dma_addr_unencrypted()
> helper and to make it a bit more easier to read and avoid double conversion,
> provide __phys_to_dma().
> 
> Suggested-by: Robin Murphy <robin.murphy@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Tom Lendacky <thomas.lendacky@amd.com>
> Cc: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
> Changes since v2:
>   - Rename helpers- s/dma_*crypted/dma_addr_*crypted (Robin)
> ---
>   include/linux/dma-direct.h  | 12 ++++++++----
>   include/linux/mem_encrypt.h | 23 +++++++++++++++++++++++
>   2 files changed, 31 insertions(+), 4 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


