Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11429C71143
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 04:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fRcG0KcLrgIKRqjpg+vBPCK7hgCWz7pFJk3ogI8plXs=; b=fYlPpJuCWSorxMjmQQD8ZY/wmV
	cWEYlVm3f8+LuCAV2twy+p1qCYHVuh0IOot4exq5IKpZCEIZolh2NOl0nudF0yNBBCChvbc9+6Og/
	EFORl4k9x0nw8P+zU9UfEMJO2GGpXUC3iKGnieCWAcNikq4QdcZE2Eh/Yf3MRTKRGlgFpIH/KICUV
	F2TwK0IzMS3i267qSvgHkgV/dpKThKaE7+uh/AFhZFmFTZMhG/U8c/4cAh1yGYTgAdUpx7JFCWfEu
	8C4dx3kuEwL2YWsuBhv1/FAQab6mw4MYoypiqGkrYDGqVjut2qmDfmr8YfcSBoL0so9s24KV6XBdT
	BKqhNC/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPa1y-0000000CBF2-2Bg6;
	Thu, 12 Jun 2025 04:59:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPZzp-0000000CB5P-2raI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 04:57:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749704220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=fRcG0KcLrgIKRqjpg+vBPCK7hgCWz7pFJk3ogI8plXs=;
	b=V7ViIpFGMYX+7qtQcZVT1L30yJrDdMsbo0MS/W0rG1HJgrGuQmK1Wzc7N+CACXL9b94jzB
	Ugkd9kdzw/tMbl4assG+NYAsvUp7baILbXE5iSTctJMXqh1PEsuxlev0Dcgp61J9KrMt41
	vy7QXY+dlboUIjiekVbjmF7WqlPdd8g=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-407-Ml9_BliyM5yGoYs4Wh_xtA-1; Thu, 12 Jun 2025 00:56:58 -0400
X-MC-Unique: Ml9_BliyM5yGoYs4Wh_xtA-1
X-Mimecast-MFC-AGG-ID: Ml9_BliyM5yGoYs4Wh_xtA_1749704218
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-45311704d1fso2369555e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 21:56:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749704217; x=1750309017;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fRcG0KcLrgIKRqjpg+vBPCK7hgCWz7pFJk3ogI8plXs=;
        b=YlKHSL/RoOREfiLema2yIykhADvi51UVDPkbfA8AhSt9r5N7IpUq1ALJk845Q1cI6Q
         TIqXP3ahr4X4i1FyQBNeRBjczy6Ign7Gg4TpgdgT3QxlmPBcBXrH7FdHjLFIKuR5BeLr
         cNstJteoztq6VEwvoWtq24G7EoYDCrQy9alIM0fd9T7u7xd+HKKr2Yjio9JDWBTy9+it
         mAMc1jOXIRXRh3vPkporSBmsTC+KlwGVcd2Q9+dk0h91f8zv6PQtZ/6P10iN/7H7P2Ba
         puefz2O92rIsZPLvxPoWmQD4zCIs0dDwwI7FzDmDRnnn0K7CGsF1VKZWiRJG2Qe0gEjN
         svZA==
X-Gm-Message-State: AOJu0Yx9RpYxpsVfPQtxjwabt6/faakLQHmYz+q7jruDpUgNL1XOL0Up
	Ir4siQpfG8zb8u9JFfy5ZJhHkZC2abqOPwGhc7WdllWvUV43f9HJjJPA1Gv7MxNNMxncp1UGhNJ
	njLOaccdtRmmeobJIxzM8nqsYiIjXlK/eGvF4EZa6Aq3hiHZmpYfu0hc/lYnNq3OYvtqxXt3xNO
	7+
X-Gm-Gg: ASbGncthhVC+DfO7ew58vGWgPnAvvadkrGhWpJqDLBKSc/n3s2LJkidE9CYFzUKDLfY
	cYxRUoJjLB4TN/0MiymuudabykWD6L9O+I/vBunAwPPEvb/juD/UPQH9d1h5A3nVkwfs41dkh30
	YjEwg0meQblOpb5rjf6lEwr6z2kDO6N5758CUW8McQZq1dU32nyxKdgljaV14XbjjFiux49luyH
	zV7k7HIMqm9k0FTo3HAtiB9uXxdKP6ip8KfjkdxiJ4C5QFfKEX/3mRdBr7nIy1/NNqT0GLYYRzp
	o+dNlS8EdVx7k86NWHzZbdEN
X-Received: by 2002:a05:600c:4f55:b0:450:d07e:ee14 with SMTP id 5b1f17b1804b1-4532b915f13mr24022775e9.17.1749704217620;
        Wed, 11 Jun 2025 21:56:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMnYNz9h25utVqlZtqMz+bJcwU577Begx0eWXz015Y6jivdb/FnjiEwBApKkKMSt+HJpyllg==
X-Received: by 2002:a05:600c:4f55:b0:450:d07e:ee14 with SMTP id 5b1f17b1804b1-4532b915f13mr24022465e9.17.1749704217256;
        Wed, 11 Jun 2025 21:56:57 -0700 (PDT)
Received: from [192.168.10.48] ([151.49.64.79])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a56198a3b4sm816727f8f.21.2025.06.11.21.56.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 21:56:56 -0700 (PDT)
Message-ID: <125bfa5b-4727-4998-a0da-fb50feec6df6@redhat.com>
Date: Thu, 12 Jun 2025 06:56:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] KVM: Remove include/kvm, standardize includes
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao
 <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Anish Ghulati <aghulati@google.com>, Colton Lewis <coltonlewis@google.com>,
 Thomas Huth <thuth@redhat.com>
References: <20250611001042.170501-1-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20250611001042.170501-1-seanjc@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HdCuP-S9M_AgWxnmLVjNhiWGjH7SczEfel-1z23Dlbw_1749704218
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_215701_808249_C359CAAE 
X-CRM114-Status: UNSURE (   9.28  )
X-CRM114-Notice: Please train this message.
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

On 6/11/25 02:10, Sean Christopherson wrote:
> Kill off include/kvm (through file moves/renames), and standardize the set of
> KVM includes across all architectures.
> 
> This conflicts with Colton's partioned PMU series[1], but this should work as
> a nice prepatory cleanup for the partitioned PMU work (and hopefully can land
> sooner).
> 
> Note, these patches were originally posted as part of a much larger and more
> agressive RFC[1].  We've effectively abandoned upstreaming the multi-KVM idea,
> but I'm trying to (slowly) upstream the bits and pieces that I think/hope are
> generally beneficial.
> 
> [1] https://lore.kernel.org/all/20250602192702.2125115-1-coltonlewis@google.com
> [2] https://lore.kernel.org/all/20230916003118.2540661-1-seanjc@google.com

Marc, Oliver, I'd like to commit this to kvm/next sometime soon; I'll 
wait for your ack since most of the meat here is in arch/arm64.

Thanks,

Paolo


