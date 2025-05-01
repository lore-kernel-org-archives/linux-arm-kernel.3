Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79DD2C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 02:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=adT5sphxyEt5TU22Dqx/wn9ELnNmdh1UTMCrVtoQyks=; b=K4+lHZd9hdt8yBAJmwA0rM8dGk
	pFTR6lJTMLPOa3fanXQJ4fZlWab6WEbE5WnVzdwBzfiw5hZnSfEzVeJjXG6/isCpcZoISkBacffuh
	RWSQD65KYxffbmSigC6WqNU4Ya7Evy6LzgdG4RSfrVB3jUO3ZhlEKKYbBSBI2957VZ7TO/DBV7SbH
	/R/7nU4tfI3rGsOxTHBi1H8rGP6AZ80Vxk9upM3NRbX2PWGMpC7eFGPdEId7a7Ebvk5DGBAO13ddl
	X8U6GGtXziq1ImZZmRFNShWLGmBngxpr5JyDyMwHrmYkdBRbI0eVLp21SVGa/v8bWJdDwizZE6sVC
	aLvT6lyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAK9B-0000000EZuV-135a;
	Thu, 01 May 2025 02:59:37 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAK7F-0000000EZiv-0VUA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 02:57:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746068256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=adT5sphxyEt5TU22Dqx/wn9ELnNmdh1UTMCrVtoQyks=;
	b=Zz4Ax2Dd/tvbzthz5uYGO1teyuKhvTvpfspDa2ZcX8kCrvbDc5IvCDJm+k/jwljwX3P6zH
	FhXX1xfvxaewhh17QcHGfVaxWWVQk9HqC8tY2mGF0jbc3GUPrI2hBI4UFhAooWuWGF0ogZ
	yufwCtp4qaF5mcnW2cwrCMQSifpUXpw=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-V5zv2UYdN2ayM6o5pXFkQw-1; Wed, 30 Apr 2025 22:57:34 -0400
X-MC-Unique: V5zv2UYdN2ayM6o5pXFkQw-1
X-Mimecast-MFC-AGG-ID: V5zv2UYdN2ayM6o5pXFkQw_1746068253
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b0ae9e87fe2so1241865a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 19:57:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746068253; x=1746673053;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=adT5sphxyEt5TU22Dqx/wn9ELnNmdh1UTMCrVtoQyks=;
        b=s/JlTQwW1RtJDY49tpt82Ontjg6LOr3cjqXluLOlVBTJCM3QCSI/lNGvUy8+BxTXhX
         Raw5Zpdevkai+l3HIQup4+HggLLO54ns0w3chbdA1ipWoIF/k8mnfT5XXKUzuUiyPyxF
         dTxF/Ic3lC5Tpw3+6/EF5FCx/JnmwqzhxH5G3bq2SZXyEAGWSwM3352wngPyD5M1Y7Bs
         visbjucb2d9vgvE1ye5rGZh36v/bY71pnwOSu5ac5EAvirQl/YIpr4TSAezpTo1fxFAp
         8BjneUJSqIOTQ+5oe2J+hm+L4CvTDwBLBFMHqrn5v/CJnWrniNQ5HFQXIMOkqTVBqYXE
         3jyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIQ4+YDV2E++XL+KhAYi1ZYCQh803r8Mz0KVKQ55IRnQchniafFrYimhIZMVUW2S0zJpRhAG2Gi7ms4thXyKhK@lists.infradead.org
X-Gm-Message-State: AOJu0YyU9suevEwnBHgeG+8Mraj0UO5TnidBMgMt7z8++hzcx0bC0MJP
	1y/zs7IFrXBJbUW9Cna46z+HBWq3c6jc15mrA5WcjjZXcMKJEUioFckL4Fa2RzVqLHKvwgZsH6k
	pnwdawzg2CXXEdDlvE7hzJfdO6F5//MzLfPXH8Pgs5kI+vXDhXhmFLSijRWByihLvpd8cpKBU
X-Gm-Gg: ASbGnctXjQM62enNi//4zLtbfxGSd+VjICJ2LYHxCDDts+4Rigc9F444CD5/LcLC1/d
	asuPzQFA5IKxDFl691fgHrpJbMdkHweXSStCMC0nVwU2YOs5g9N7qQupAv6ijP/PJUhEL84d3D0
	sijc7rONX19PcMlVNibzc76UrC9RoGCZdPM159bhDGVPrtQytxEMeZ6xvhs4sO2UqQZ9T7t1GCc
	ALAZANlZi6hH6D9beOoHEPgZ5exXRt+9MckRwLGQuH491jHRcpf9YOq0aFj4SYDuhGBll9AihGE
	mx+WO0v756fZ
X-Received: by 2002:a05:6a21:9982:b0:1fe:8f7c:c8e with SMTP id adf61e73a8af0-20bdcd9a950mr1117782637.15.1746068253301;
        Wed, 30 Apr 2025 19:57:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbH4/Gw3xjrMySuSbtOSRK/2O61f3IZwIB6ICzlmAJxo3vX/hkeDxt9OR3pskpgqpIhEiucg==
X-Received: by 2002:a05:6a21:9982:b0:1fe:8f7c:c8e with SMTP id adf61e73a8af0-20bdcd9a950mr1117766637.15.1746068253021;
        Wed, 30 Apr 2025 19:57:33 -0700 (PDT)
Received: from [192.168.68.51] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740398f9786sm2578662b3a.15.2025.04.30.19.57.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 19:57:32 -0700 (PDT)
Message-ID: <afe9167c-8867-4e5f-8c0b-eb8d6b2813e1@redhat.com>
Date: Thu, 1 May 2025 12:57:24 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 27/43] arm64: RME: support RSI_HOST_CALL
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Joey Gouly <joey.gouly@arm.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
References: <20250416134208.383984-1-steven.price@arm.com>
 <20250416134208.383984-28-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250416134208.383984-28-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: j9ulYFxSXNrypYCNxTBYwIVHf9fijSj-My5buVXcfNo_1746068253
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_195737_239141_2A81779D 
X-CRM114-Status: GOOD (  11.36  )
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
> From: Joey Gouly <joey.gouly@arm.com>
> 
> Forward RSI_HOST_CALLS to KVM's HVC handler.
> 
> Signed-off-by: Joey Gouly <joey.gouly@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v7:
>   * Avoid turning a negative return from kvm_smccc_call_handler() into a
>     error response to the guest. Instead propogate the error back to user
>     space.
> Changes since v4:
>   * Setting GPRS is now done by kvm_rec_enter() rather than
>     rec_exit_host_call() (see previous patch - arm64: RME: Handle realm
>     enter/exit). This fixes a bug where the registers set by user space
>     were being ignored.
> ---
>   arch/arm64/kvm/rme-exit.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


