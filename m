Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF721C3ABA9
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 03:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JC4AbsVCdLJ1p7UYeSXewTdrjDsKeZ54RhtL8jSgmm0=; b=jg9tb1hBVzCRCUEGFrVh9HKIRM
	d5MLZysK0NleftZ+9NYjqtkhL43lFYZfFYQ0w+VmtzPk9q2NjFCoEc7QiYVbEGVA7Dxxpb3ccGSzz
	9yhzx/MnicCdvK65QJ4rpYnSFmF8rijtLpKXd8YbMff0nKREv8xp3PGw0bsJDXO9rbo7/LX4+43Wu
	L8GK48jcm8KcoQjTk8GIcw5bQ72oX7GTmVlG86Z4duRK6E3Z8dRYl7cqZXnI8ELyLqoMzE6aMPOIy
	erZw+jupQr1m0Xi2ARy3D4bwrO9tqAHA4G7yG9UbiTphn2RrN30L+nWr7ct+gOPHRM2dlXLxzXreh
	h5DbvERw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAKs8-0000000EdGu-484z;
	Thu, 01 May 2025 03:46:04 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAKp9-0000000Ed05-1NOj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 03:43:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746070978;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JC4AbsVCdLJ1p7UYeSXewTdrjDsKeZ54RhtL8jSgmm0=;
	b=XKyAFHF9nx6GM9PE/5EOToUqSFaTdxXqVR5E/bRfighZzyGzYUiPdbqFUjozPFIUyjOC5k
	2v7FwUx5pMpUlfZzBHpx/yW4rRykPg7eg5EzRblAFCNneJ+l+Br5Sui7D0PcKA7zmmgDse
	g+Y7G5QSCm+NMjkhrt2nvW9zZJVXxtQ=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-TF-vf9gSNpeoguAEkROfGQ-1; Wed, 30 Apr 2025 23:42:56 -0400
X-MC-Unique: TF-vf9gSNpeoguAEkROfGQ-1
X-Mimecast-MFC-AGG-ID: TF-vf9gSNpeoguAEkROfGQ_1746070975
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2242ce15cc3so6363305ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 20:42:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746070975; x=1746675775;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JC4AbsVCdLJ1p7UYeSXewTdrjDsKeZ54RhtL8jSgmm0=;
        b=D8WjLBaist9TPWK6EhRYGAsluBFlJkyY3V40z/CFeD2FohZ9iC7N583lvYi+ueObiM
         OoJ0a5GEuXyMecY0uxcZ3VO8o3GnqC16e5M0TMRufqp18L73jEA3hFdABpmZXD1zdpSa
         RwDm9lqNcpc9refaObryOChfI5ZAe42SF8hPT5V6am0u8gr4fLHgZvvC7oe1gt8njSuq
         T9XU2Ne5a1INW3MIvTL89WcezYZq8b+3BlsE059irBPVcGmdW4EcekPSWu+z/fredRyE
         tm7ByrsZM6TUqabQM0XY9Yhgo7uoqkwedt0JzbJYBdFNlNZWgfO5BdxKSSbE2pcMVzFN
         XFVg==
X-Forwarded-Encrypted: i=1; AJvYcCUHPrtndetNVOUQrgLNLr7utSWHVay+USTqD+o7WRr9LLaM83UrTTmm4Blv9IUKrkoGWAZDwGwlaSaVt1dXuG7J@lists.infradead.org
X-Gm-Message-State: AOJu0YxnrH2sj06yOFkGDu6xhEZHpVDjlaZouG4wAqpZ0BP1KxLLUarT
	+uoiWXE+bYF0ftkxNp7314d87Lvu2G40q/Re7UZIN9y/sJLnHGR/K67vCi6U3TvjMrFnzwkNnCZ
	j6/dBrRvMRwd/tsMYhsIT7yQrDNgIe2Ee02KARJk7qULB4Sr2bftwdp+N1VJsqEfuyJ10XjSq
X-Gm-Gg: ASbGncsUIAbTDTDUwtN7+BkdvMBmXUHxrI5BQHi+nS6GbWd1p/Tza+ZYC9Uq2EyAH32
	jR9RmpEUWc8GZ7go81dTYBsaBH83duh182sbsvbY696R3ilRSFSl4A/Z+MMhnvoo8iC+yNVE3+W
	oKYaX+wCVwQJP+Aa0Cyp4mKvhdfchMy6OszwOu0j7+G/FGp2t2IKDd7ONGOFqg5kJPy5K4CTA4E
	61Ta+r/vgBpidDWLMJSTW29ePcrd0xh5+5RKfDYgpTVVJvHNeUif7XQztB8bpp8VBwumsaTnghR
	pGqi7vvg+7T3
X-Received: by 2002:a17:902:f548:b0:21f:4649:fd49 with SMTP id d9443c01a7336-22e0863efbfmr14694065ad.49.1746070975371;
        Wed, 30 Apr 2025 20:42:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6XeA16VOaq6zL1nFcqHpvVwTJjX64McCuJNjLU9eHJvxIX6JXOCTvpbcT/Z0Dp6bPnFYLIg==
X-Received: by 2002:a17:902:f548:b0:21f:4649:fd49 with SMTP id d9443c01a7336-22e0863efbfmr14693805ad.49.1746070975009;
        Wed, 30 Apr 2025 20:42:55 -0700 (PDT)
Received: from [192.168.68.51] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5102b03sm130327715ad.194.2025.04.30.20.42.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 20:42:54 -0700 (PDT)
Message-ID: <f61ef14b-9a51-48c5-b88e-518461c988cb@redhat.com>
Date: Thu, 1 May 2025 13:42:46 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 36/43] arm64: RME: Initialize PMCR.N with number
 counter supported by RMM
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
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
 <20250416134208.383984-37-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250416134208.383984-37-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3NdoXbNp9TbNgajnHO2D8dvaxpleKmd31TOERBvzxjA_1746070975
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_204259_437474_0A14DCCB 
X-CRM114-Status: GOOD (  10.33  )
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
> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> 
> Provide an accurate number of available PMU counters to userspace when
> setting up a Realm.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>   arch/arm64/include/asm/kvm_rme.h | 1 +
>   arch/arm64/kvm/pmu-emul.c        | 3 +++
>   arch/arm64/kvm/rme.c             | 5 +++++
>   3 files changed, 9 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


