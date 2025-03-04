Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D4B0C282D2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 05:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rhnvguDUl9b0lKjHpwaAt3YEx23OG5Tvc8nGcNEISp4=; b=ZCiu2YeboaMectaxLt3kjrvUVv
	trM0ZiCOt7yBP36ot3lbgipC/Lufhb/6j69hnWYnhth9KNgIBWpbFNrnSinGBGduibzEZkXD5Y2Hr
	3DApP+LUT/uawobDWwbvyZSxDrrulzHDvNU1Zx94xcGqEmU7Y/URFVgrK21AfhKXx+sviEzksQtNv
	NI4vhYXFKNsBUUXJBc1oH2pDQo1J+JUxo4nAIt7yZyW8zbWhL9cq15270KmamaaQmG2fHnSlpcOBB
	V5gy2OaBjs6klrxJUPukd+bnoce9u0WMHtj+3WKckX39/exCm5ap37oeyzHJY/DC5n18EIO6WK4eh
	Fi0hYQHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpL12-000000039Vg-3v90;
	Tue, 04 Mar 2025 05:40:28 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpKzS-000000039Ht-1rky
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 05:38:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741066729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rhnvguDUl9b0lKjHpwaAt3YEx23OG5Tvc8nGcNEISp4=;
	b=gzlxiAK9RV/b+N3lo8EvEqs6UxqLfIdBIosqoj6ZfCFN8bfpyTQ7bnhIKnhL5/G/2UCK2n
	xcDKeqQrTZSVeYM8MGNJryDyN08dTRz/aW1Bx96h0NqbQNqnowBNTeax9EdDnVm43/c+a1
	pI5C/cx9GMXTXttzMHtYK6RQPQyo6Pw=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-111-qGxJ2iZEO7eCqKVlhlZ8vw-1; Tue, 04 Mar 2025 00:38:37 -0500
X-MC-Unique: qGxJ2iZEO7eCqKVlhlZ8vw-1
X-Mimecast-MFC-AGG-ID: qGxJ2iZEO7eCqKVlhlZ8vw_1741066717
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2fec7e82f6fso6459111a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 21:38:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741066717; x=1741671517;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rhnvguDUl9b0lKjHpwaAt3YEx23OG5Tvc8nGcNEISp4=;
        b=nyV6KCq2EkVcw79z4UkBxxBrgzwOUNJ9ApRblzSTqBLios4UJKr+qCFhlM3Z7sR9qo
         6pio1sa928WGeHd81KRz5bScUKHMzd773sQuniofNLQHQ+/1EqaE0tFswdC0CphrLuoz
         x5JIMgVsrT0cJwE/JS6zhlv9qzhXtrIoMQiLCyVEeVuumUGEyB4fUPF/S497NXDKiv6z
         TGWz/+N81VnImPdsgoLbK5xCGmHvfLTxcmGyBKRDpeEqlHcOHsQLN5Z6MiDddeeQxww2
         iklBzCWfKHDhjpyzJZ+e27ZhRbFvYDu+euDlecRqc4/gRWE5bKYZSNHqRHW+9yUtUIRk
         rLOw==
X-Forwarded-Encrypted: i=1; AJvYcCX6TfbPDNOFVL1jqIWZ7kmI8/AVj6T4YJJZalZb1vaY3WW4N4P+DGEi4FPeqzUxGlvfrtGr/xAFi9MiBJecSaE6@lists.infradead.org
X-Gm-Message-State: AOJu0YxJ4Vb0wONvDsqKEQrai7pvWCm/d88iwjyg2CkG9r0mm67QWBca
	C4dBWViZt3TLI6gS02Z4ZPwfV1kR++qLV+a58rc6Zb5GKp19aIRhbC1Sq5RsY569VbcRJmiLP9q
	hx+8E7UUQmiGJl6cBIzhANh4WmmOhJl1oGBrrStF0VC2bIz1Dkb64u2z8oGRfk9Ajr8Omsvxd
X-Gm-Gg: ASbGncu4HqxzuG7xExu7LxuTZB431Rvqrdhl99YqPwHfg913b3m2mxSf3OpoSkT/x+P
	ndlPt8yidfeSg9nF2G8b60TJxICbfV+4/3iS3M3dgQicxx1Hw37srmBznnLiOcqrSKeAgyQFqai
	eTLhMBYCJihVjjWtAP/A3IH8zWHD3KWwRZcwKpbK8oQHOKeSTBqmQ9P9WCID7XF3OAO0BHmZDYL
	HkHDTupI9nnD+L14zMj5PKwf2KiV9YDGU25YZV3iKgmhRyWq+o90YaNCimBVmWWDvpgCqvCVI3j
	wnWLttTKCSvAFq0Qmw==
X-Received: by 2002:a17:90b:2f8d:b0:2fa:228d:5af2 with SMTP id 98e67ed59e1d1-2febab6c68emr25331699a91.15.1741066716885;
        Mon, 03 Mar 2025 21:38:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF612ZxdojGbx89Aqh0mhvbM65hIZPcepIXHF98wxNJcpuaTGS26LwyEfOvsNmDG1/FgXRbOg==
X-Received: by 2002:a17:90b:2f8d:b0:2fa:228d:5af2 with SMTP id 98e67ed59e1d1-2febab6c68emr25331658a91.15.1741066716552;
        Mon, 03 Mar 2025 21:38:36 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.164])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2235050d7c1sm87354825ad.198.2025.03.03.21.38.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 21:38:35 -0800 (PST)
Message-ID: <5008db08-c153-48c0-90b3-39fa0297ba1e@redhat.com>
Date: Tue, 4 Mar 2025 15:38:27 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 24/45] KVM: arm64: Handle Realm PSCI requests
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
References: <20250213161426.102987-1-steven.price@arm.com>
 <20250213161426.102987-25-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250213161426.102987-25-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2ufekSGTOS8M6dNp7fzExIfglWxuEkzAek7EsRajhsU_1741066717
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_213850_566870_30A153AF 
X-CRM114-Status: GOOD (  11.69  )
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

On 2/14/25 2:14 AM, Steven Price wrote:
> The RMM needs to be informed of the target REC when a PSCI call is made
> with an MPIDR argument. Expose an ioctl to the userspace in case the PSCI
> is handled by it.
> 
> Co-developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v6:
>   * Use vcpu_is_rec() rather than kvm_is_realm(vcpu->kvm).
>   * Minor renaming/formatting fixes.
> ---
>   arch/arm64/include/asm/kvm_rme.h |  3 +++
>   arch/arm64/kvm/arm.c             | 25 +++++++++++++++++++++++++
>   arch/arm64/kvm/psci.c            | 30 ++++++++++++++++++++++++++++++
>   arch/arm64/kvm/rme.c             | 14 ++++++++++++++
>   4 files changed, 72 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


