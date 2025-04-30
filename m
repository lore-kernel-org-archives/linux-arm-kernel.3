Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD4CC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 06:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=979akrJcal7eXFEBBeKgkEGR2Z+cXNr2mNqqWnT1LPM=; b=xEbn6PhMBuGeB7cAEfLf2421dX
	1wD6Z7AzAzMuGEdUr6AnwiSIb0CtzGmJhbIntFBqGDZYIAICqXHLPGOXEVGGpoPhuDg6T+0fdJT1h
	gKNbX1rm8Q/3AqbR1+ieTbcj2o5ZxC3NY21qVb03st8zrfsw4BksHcLzWS4FpTXSil51dseD4oD2I
	H0ONZ3k+aSbuy5g9fl4ETapOu6r7LtFcxBuxEa8SgkSdaiXr8W0t6bqZCZ9kxF3oKl/WgYtZiHx35
	omWd8NgPLc1BaFbyvsS7G5LUnj9tUhydEMYuNPGdPUWrA0katzp0MEj5iBdr7Fx+fZ1vVXHYwlfpb
	79+6/n3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA0Xu-0000000Bou3-08ot;
	Wed, 30 Apr 2025 06:03:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA0IM-0000000BnE4-0QbM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 05:47:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745992065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=979akrJcal7eXFEBBeKgkEGR2Z+cXNr2mNqqWnT1LPM=;
	b=Jx6aVOCIXa0B01cJDxU4ZLcQTdhCZXkoYdm+ohunwj3YZeKU3kq0d6SCZRGEdZgPdcO3dz
	2rSXbZivZVPCI7sI0saXmgE8C47E874hxxxiV94h8eiPCjGBbbR9nSNhrTFQrgxEnXI8KK
	TyivIbvlbqTDgTdN+zzBAdGdrPdAIy4=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-___wSoKVM4q0y6rMZwnYRA-1; Wed, 30 Apr 2025 01:47:43 -0400
X-MC-Unique: ___wSoKVM4q0y6rMZwnYRA-1
X-Mimecast-MFC-AGG-ID: ___wSoKVM4q0y6rMZwnYRA_1745992062
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b16837f1874so3588507a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 22:47:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745992062; x=1746596862;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=979akrJcal7eXFEBBeKgkEGR2Z+cXNr2mNqqWnT1LPM=;
        b=it+aRGVKl5lzN526w7ZOl0RsWdLi2MxFSJxD9Wim+ynbax5dvLgHLX6ugnkKdGYJHQ
         SlYg4iNPSgsQ2fzfj4SLHmlHI4Z8qo0NkIA+8pkMAgn8xA/bIy8BiKU/5t9txkX0TECN
         +aMVxs2oYO5sXE1U7V31zpSWbswl7VURTbzXHxBAThV2XAHgBe9sJCEPWnvnJQiC5hQi
         EuEgfhPN8rdyy5l0n5dz7qenj4z9ewVEaEqbRh1y/JZkmKJVRyrxw7ECdjEfhANSV9QN
         QGseq4Dl4iuq1nRQd6DQb+marLUG6ZjXfLkwXpKON+N9u6b1F73xsblRMe24o8eA6L5E
         Veag==
X-Forwarded-Encrypted: i=1; AJvYcCXmGGHmfRVacXp2WLd9wnL4PbCP91DTzruQiyVoEuWUyFfqlM2rA6S3oMI3AOyQ3Hxtl3aAF/nz4esr3gYaog7r@lists.infradead.org
X-Gm-Message-State: AOJu0YwRGFF5m6p6O6wkHOvR68UuhzLfwcOrY0H8S5ZLMAmtV1hdTvfG
	n+m1rce/VCyxivNfKB8e+Z/NMOM7OM8IN43PKEnZ83mWE3bVvEXznbj9ZemO1A1xU9SST59hta/
	Omq0CSEJWCw64DkdXj5fZ6eI+PuX8+Ws1trk7V0dE/q6xGti+NnfH7aQBm34X2HeB++Wx+qeV
X-Gm-Gg: ASbGncsp3ab/evFSKP/7OaOeuDM64Y+5Q1e+dq06cP9cW6qJ/blOHw53ij+Fvt0L8n0
	zETWkYYia+b6mDvmx2/zIDg9GmcRNapw9fcpgfMm2h5RtHoq1ZHveW9PjW1JAMk01JQxqDsi3s+
	FdtVpmwErld2qYvOROMsFhmDG8W/kHiGaiTN1woazArdKw/MGeCY531TN+r6F7KI/9hnFI3+KEL
	ECg0Ux4OcshWpKVVj2i+Ti6v6HoA1B1MUzn1AupDVuVjMUojjWXcdcrGp7CAwmqRh8VWBt1yCKu
	sq0g+atfErkR
X-Received: by 2002:a05:6a20:6f0a:b0:203:de5e:798c with SMTP id adf61e73a8af0-20a87758d04mr2491512637.18.1745992062586;
        Tue, 29 Apr 2025 22:47:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2yvTT56xhp4nevnnTnhdd5Vxurc2bkepUSfMbuUK1rX9UIiG+hWa401GgVAzKuOXYEii5qQ==
X-Received: by 2002:a05:6a20:6f0a:b0:203:de5e:798c with SMTP id adf61e73a8af0-20a87758d04mr2491475637.18.1745992062247;
        Tue, 29 Apr 2025 22:47:42 -0700 (PDT)
Received: from [192.168.68.51] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74039a3100dsm787733b3a.90.2025.04.29.22.47.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 22:47:41 -0700 (PDT)
Message-ID: <9c998d71-0368-4f93-ab37-7933bec9b419@redhat.com>
Date: Wed, 30 Apr 2025 15:47:33 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 09/43] KVM: arm64: Allow passing machine type in KVM
 creation
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
 <20250416134208.383984-10-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250416134208.383984-10-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lbCPiYLPz9gE9HXUiQ8nVD0topZsbnNlJUqx6WtstU4_1745992062
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_224746_215966_9B52C224 
X-CRM114-Status: GOOD (  14.28  )
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
> Previously machine type was used purely for specifying the physical
> address size of the guest. Reserve the higher bits to specify an ARM
> specific machine type and declare a new type 'KVM_VM_TYPE_ARM_REALM'
> used to create a realm guest.
> 
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v7:
>   * Add some documentation explaining the new machine type.
> Changes since v6:
>   * Make the check for kvm_rme_is_available more visible and report an
>     error code of -EPERM (instead of -EINVAL) to make it explicit that
>     the kernel supports RME, but the platform doesn't.
> ---
>   Documentation/virt/kvm/api.rst | 16 ++++++++++++++--
>   arch/arm64/kvm/arm.c           | 15 +++++++++++++++
>   arch/arm64/kvm/mmu.c           |  3 ---
>   include/uapi/linux/kvm.h       | 19 +++++++++++++++----
>   4 files changed, 44 insertions(+), 9 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


