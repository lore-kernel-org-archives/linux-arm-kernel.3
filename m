Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 205ADC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 03:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=66PeGHTOpdnar+Qa0JWdL51yAJjG/0kQaEukyiMWp3k=; b=4XbIFSa6LfY6KpoVceeSDTbUaH
	1Lqe4h6uDwWcDpkLjaGTf9+9ERkrcc+2qoAh0QaLemCJ1e1R+F2pb/XmTP/y5+YWB7b0WdrsWET6Q
	Y8Bva79TKKgFXbEN37lojc+Io8h1ywgqNGA4tZ7skKMZ8jWaH/A9PQoMb3Ls9KlJqCllLfoVXfdwV
	kuSLpzJB652zEfYUaCQsqKdsRBjdABfMXsayn/MJ2ZwGAnky43N83Ipk/D6+4BlR0LtFBkwh9NCfn
	5C/fCTHqZ9shU1gyP4DJv3fSvlctpCYrHgAg8iAfSX8CUuRRaI/VZpgaztAUUD9JRn6+kPq0Cr8Dv
	BaEFNN9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAKCw-0000000EaJw-2zv6;
	Thu, 01 May 2025 03:03:30 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAKAq-0000000Ea78-20nZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 03:01:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746068479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=66PeGHTOpdnar+Qa0JWdL51yAJjG/0kQaEukyiMWp3k=;
	b=eBlTkvzd4fSvfJwoJjEQEP9T2PzYlrwC+OBQhRsKRVYoX9zbWOZJgzCaqNTuf4uSv/ZI8r
	yNOeX56lcYmqjAVZFPECdnjWvfkF9DJl368+j8S7ZkUhzrOKJ45m5ZPyE8pQ06MbkvlB6k
	qNoUJqjQ9Mxufvv2SwVji/+R9WeksoY=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-iWPEgoQ7MDCcqwd9bEUHvA-1; Wed, 30 Apr 2025 23:01:16 -0400
X-MC-Unique: iWPEgoQ7MDCcqwd9bEUHvA-1
X-Mimecast-MFC-AGG-ID: iWPEgoQ7MDCcqwd9bEUHvA_1746068475
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-22c31b55ac6so7091115ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 20:01:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746068475; x=1746673275;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=66PeGHTOpdnar+Qa0JWdL51yAJjG/0kQaEukyiMWp3k=;
        b=I4SEWmC5WcfsBts23hVPqTRDGe3gUapOjYOE1ddhVqk4FSvptOLu7XmEPQtWst+FJt
         +7UOau/bayrikvwqHnwAXXOkTQx5pU3SUvCFe/iFzOQJ1rcrnPmnsX7mVxrzjf1xqFFe
         jDDiYV51LSxx5u3GVxBRWzLSR6wpoviJVRM8TohicI0dQ6hPhUvN+oDUwtO1yPDw5nKo
         BzRQb/7S40kKBHJfxkXZehQB8fVNNAGTI1pQ7/p7jzxRPkgRVuBK/yFGIdYR2hj8Egxf
         omung4wHFioq4F7XJ81U1k+9V3BY4kM8Iltq4pLw+DvdQb0YpEh0sINHbHCD7d3Sajr0
         goUg==
X-Forwarded-Encrypted: i=1; AJvYcCWPYt9NVO4ySSt+qQMqSM1pvEWEBdQ2NNaoAGr7/fi2tjv5TiOYwjtl7fh1DKIZPukZTS+smCFCuX37dcfCg4mQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+8IVQiFoAMH0/tfbFEoS0mQo8XSMLuIW06z2Ez1eod0AhNiXv
	8G5KYxOYR8z1sqMaeildH8MVD1wRKyMKBclve9ITBE50VvK5OYnCeY7ztYH7fNDchyfw8J9dxTm
	fI4VtViEgoIUZz6hWV/0gWkJPS9qKyW6MJ6/UnH+uBnpoyfjbu/FMEld042GVUUxe/9igF2J1
X-Gm-Gg: ASbGnctCE8FWIu7vcPK6fYl0ZtH5hbMSAyT7cHBqEYi/OwP3M0BjuXfxSGY8MCbcOKi
	Aq6pMVFF5uoY1pSB7WhPlL+6SBu9MiIpNKci1M4SyDni7AXJr+pd82G/uSL/Eb26Y+icCPGZHrG
	7W4pBSqgKE2rv+257didmhMhdTXCy4OwyovTNJA4k5YEAHAOigQO35iBgWNSnpjlRyVxzbbOpwF
	4zLer55f3H8OQWbQMfJRGma/A1GKETfhclNnMw7XTXYt3lvKrYtcXawqNBv4EGxbtx25gOPVwMA
	zXpu7hwE7II9
X-Received: by 2002:a17:903:3c4c:b0:224:256e:5e3f with SMTP id d9443c01a7336-22e040c6e79mr22293085ad.25.1746068475349;
        Wed, 30 Apr 2025 20:01:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZAaGsqWilNG9nKIQwO6WjMhMxoDtCPFtqO+KYQXEgWxu5s0tu5Q6Ot3OxM8Xca9EYb2dyqQ==
X-Received: by 2002:a17:903:3c4c:b0:224:256e:5e3f with SMTP id d9443c01a7336-22e040c6e79mr22292615ad.25.1746068475064;
        Wed, 30 Apr 2025 20:01:15 -0700 (PDT)
Received: from [192.168.68.51] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e0a243e82sm766515ad.2.2025.04.30.20.01.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 20:01:14 -0700 (PDT)
Message-ID: <fd1936c7-cc82-4dd9-9bc0-2b25a3bbbb91@redhat.com>
Date: Thu, 1 May 2025 13:01:06 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 33/43] arm64: RME: Hide KVM_CAP_READONLY_MEM for realm
 guests
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
References: <20250416134208.383984-1-steven.price@arm.com>
 <20250416134208.383984-34-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250416134208.383984-34-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: c3thppn8oMEcD0jcn-o-cWlxB0VQJToKpJ9DBoqo1aM_1746068475
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_200120_595002_A98C7041 
X-CRM114-Status: GOOD (  15.26  )
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

On 4/16/25 11:41 PM, Steven Price wrote:
> For protected memory read only isn't supported by the RMM. While it may
> be possible to support read only for unprotected memory, this isn't
> supported at the present time.
> 
> Note that this does mean that ROM (or flash) data cannot be emulated
> correctly by the VMM as the stage 2 mappings are either always
> read/write or are trapped as MMIO (so don't support operations where the
> syndrome information doesn't allow emulation, e.g. load/store pair).
> 
> This restriction can be lifted in the future by allowing the stage 2
> mappings to be made read only.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v7:
>   * Updated commit message to spell out the impact on ROM/flash
>     emulation.
> ---
>   arch/arm64/kvm/arm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


