Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 116B1CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 13:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h5zNn+04D/ADxwDdeMfBIdi2B0cMu31zTvDOOv1nE7U=; b=Cp97dV6jWqKxXR7FrTfPX2lpFL
	0zf+HvfUuF/4hkU4X1+CrFgWQ0hSv5p//cLwavJGQavvfng8HdxZykGQBHXJ3VpUr7oMYDPgzCnUv
	4zgumui10RQ6wg0Md4haAZJrmK9y5reidZ26UvjHeBi0uxDf2fNQZwA6iJttTbA5HOUfX1uo8MbvO
	9tgQk4N2HxsmHMnL909+4ACJfMNp2KqJau8nXuoIvQ8t+F8fDSSx0VBh/eR/GRhZD3deeWioIuDoF
	c9wEs1oToai3SZjdiRxl+GYnZTpm5ZkM5Cb28gfMK4HIsCx1tc73hI6IVn3f7N9ZYDCqXknR+qNzE
	z90F19HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDici-0000000GW6p-2nD9;
	Mon, 05 Oct 2026 13:20:56 +0000
Received: from mail-ej2-x10.google.com ([2a00:1450:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDicc-0000000GW4i-384s
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 13:20:53 +0000
Received: by mail-ej2-x10.google.com with SMTP id a640c23a62f3a-c29703cb470so302856766b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 06:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791206449; x=1791811249; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h5zNn+04D/ADxwDdeMfBIdi2B0cMu31zTvDOOv1nE7U=;
        b=KmEsPizc17UKzUOW3JHvDpf9AtU9gMtf9W8Pss57iNMdaRZSjzIzqyeROZsuRfUO3E
         Ij6PVkmTGgdWiRcb+SAA1YXSnGoAwTdXSfVE2t0JDekI/NYDNdjElPY2nAwVEHHZ9Ytl
         7Z2Zl8R6vkbyfEi5E9z4N9CbwjQX00zQr8HSVU6BLTdev6jC/YsWc9ocBL1sZC7MXk8H
         ixZU8BYTou0/7yJ7uccXNmiepKT2b5DbqI6Bi/qxwmCEOY5pJZqLUnj+Cd/5kR2Rwtli
         n9wtdhdfYfc01r67IG2rq1+iZFaJPPDiknCKmxrbHg8DUq3NCzFRyPvpQQC0GW0HI7X1
         Bjpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791206449; x=1791811249;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h5zNn+04D/ADxwDdeMfBIdi2B0cMu31zTvDOOv1nE7U=;
        b=s4Y3/LHSY7ygU+Uxf6WpKfr/6TCu/T3VYt1wYCt10YIDlk3vNm7uZNUDXgH3YF1V0J
         kfnnkH3I+f9irIasjs/MyGhrz9YPnki6loT/1LjtAePH9kE25kSao4m2gDTAeXLcsgYU
         YB/QzEQ1ZS1v1Lr9HZ3NXxk+BLRuVbS2Yrg4BF635lNbc7JG60T/TKSATAz+tNe0iM+e
         Kkdgu/mG9dNjuz2tD7zuzcdkvj0+bTPw0fAI2txZ1EvLg/AO1HXbpd8gVzOnRcRkAVC6
         8Db1b3Z5QooWs37Q0+VUwhj0Vd2Eagk0lNus4RI78US1xPPe6NASYhjdZcKL6HP089qg
         +1qg==
X-Forwarded-Encrypted: i=1; AKwUvBzsOd6GJuLX0B7cNY5oTyCK9N1ew93HqKve/wzWZ8RvzsN9sy3pl0jtg13cHFyWiPK3bRXlwVws5gLIaWKx8cJv@lists.infradead.org
X-Gm-Message-State: AFuF++lAUYdX8d7bNaQIXLHH8u3m2AuhwNZhV3dXakhA4qy3m7tQ8Cdf
	CKYk6NUoDD9d0vbw4GT2UYPWYipLHvD9pAbiqCYBb3wxsTO80J0RLCvc
X-Gm-Gg: AYBFou1ePh9hZTMfQ/F6fqQW5vuhjPV3VzqtvR7BkoyMpL9ODya1vYISAlFTbfPfSTx
	u0TDn7GS69r8f3STG+47kqYrbSjeiZm2KwrJ72I27InL1jNfUl+ta2zPRSRWdKA1EehHlBdrB+W
	CS/7TIXBDkc8RkIDlNZhfUXP/2Wiyx7SbZHxw9bmH5SZ6U6i0kZ3vjJxCHW6Ag+Uu/U3PDyryrZ
	+G7imNGqC/2Qyo/YwcP5CEhVUDfYw8LqoBaUNltKgzo1hCYQUwRAejzZew+/P0lAazBZX0bucnK
	o0DKTkEHCHclbjAmQNZV4VVu2cxhQnZAdrY5jFDuZ3ik7GOLume781Rl8hEWemyxiBJQ5n14kPL
	TYeNK6lBNVmJ0VKgdA0xL3ZdXPg8v5sOVPMfIrGBixUxORWKZ+7Oi2yKVcUbgHouXRKaUqTcZ+y
	BAJtsUwBJa9AYrebNEkAMcZuJ+97BtfAn9Xy6kS3DQrkrCHFfpIglm0ttYV058iBjF8LnFPXkY6
	ErkLrKOGzx2Zp1qQQ+ybWqI8yiKKO28fzJkVJE15pz7dR1TO620xU66665/DImj0Dj789J/DEiW
	YnKFnH2VU/2gjio/t9VZhKOmneT46q5HEXM=
X-Received: by 2002:a17:907:9614:b0:c25:8eb7:f388 with SMTP id a640c23a62f3a-c2e4ad13957mr911322366b.17.1791206448599;
        Mon, 05 Oct 2026 06:20:48 -0700 (PDT)
Received: from dev-dsk-fgriffo-1c-93421965.eu-west-1.amazon.com (54-240-197-234.amazon.com. [54.240.197.234])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3156333a04sm79392466b.60.2026.10.05.06.20.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Oct 2026 06:20:48 -0700 (PDT)
From: Fred Griffoul <griffoul@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
	Ackerley Tng <ackerleytng@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Joerg Roedel <joro@8bytes.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Alex Williamson <alex@shazbot.org>,
	Shuah Khan <shuah@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kselftest@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	x86@kernel.org
Subject: Re: [RFC PATCH 2/6] dma-buf: Add get_phys() to describe a physical run
Date: Mon,  5 Oct 2026 13:20:46 +0000
Message-ID: <20261005132046.30025-1-griffoul@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <a04f17cc-f59a-4240-81c8-29776eee3a2e@amd.com>
References: <a04f17cc-f59a-4240-81c8-29776eee3a2e@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_062050_800623_21389D5A 
X-CRM114-Status: GOOD (  14.38  )
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

On 10/5/26 Christian König wrote:
> Well filling page tables by the importer is an absolutely clear NO-GO
> for the DMA-buf design, we have gotten down that path already and it
> took us years to remove this functionality again.

Understood, thanks for the quick and clear answers on this patch and on
patch 3.

> The problem you are facing here is that dma_buf_mmap() doesn't work
> because you don't have a VMA.

Right: the memory has no struct page and is deliberately not mapped in
the host, so there is no VMA to hand to KVM.

I'll post a new version of this series. It drops get_phys(), the ranged
invalidation and the guest_memfd dma-buf import (patches 2-5), and it
does not touch drivers/dma-buf, as you suggested in the PAL discussion:

  https://lore.kernel.org/all/c413710b-4c28-4ed8-88ec-aeb8c4482011@amd.com/

KVM gets its frames through the KVM-private guest_memfd provider
interface from David's series. iommufd gets them through a private
interface with the exporter, as it already does for vfio-pci. The new
version adds a small registry in iommufd for that, which replaces the
symbol_get() of the sample in David's series. The dma-buf is then only
the handle and the existing revoke.

Thanks,
Fred

