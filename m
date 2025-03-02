Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 061B3C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 23:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GBo5+OYmEobg6wfjqU2wwAFpXo5iLmkJqiW1kfdikek=; b=WI1pP2So3x9W/4rXkRZJ+OzBHU
	iBRBp/qcrgmldYIzD6qIgodY5hxywNWTZwCaiL0K7+G928FaIM4KATWs2tAPIUR15uiwCzXtoKA98
	JBrhaxl/MLldplYWhv7X3BrU2SXj1BSKo584aqCFfcg8wuXzgOY9zEUptYI0KiQ0yKymbj9gWa7Bk
	1Ygrb6+39gIUFlO+GAWpNk6jVHc+F4SkUYxaG9LQ5B0ShFr9IbXWJ2q1Vog5gU+YckiTcQUHtEYm5
	lIBWM1qzaIW28AeT4++FUCfT1CBFjqODmMqDiKFZCAYIjyBCODDQoJM0ouEOt2byGb2FyF++65HBQ
	999/bR/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tosw8-0000000GogH-0coq;
	Sun, 02 Mar 2025 23:41:32 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tosuZ-0000000GoZt-08Uq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Mar 2025 23:39:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740958794;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GBo5+OYmEobg6wfjqU2wwAFpXo5iLmkJqiW1kfdikek=;
	b=R7we3vMe93/38J4TK9zJfLwUK2mQCLw3VGmTixDN7bDbZVmnEZJa6MjnkAqyNhUreC3qSy
	75dzAXHWyPfymZR+wCVhR+ifPqSlKIJdSkPP4wtTfzEDG+wqwod56CFlzZJQ6qHKGQHBGk
	+vFPvBxUEV1IFLTsgLuYtRTMS5JGJYs=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-141-HUbiBdESNiC2YsZYm3Y38A-1; Sun, 02 Mar 2025 18:39:52 -0500
X-MC-Unique: HUbiBdESNiC2YsZYm3Y38A-1
X-Mimecast-MFC-AGG-ID: HUbiBdESNiC2YsZYm3Y38A_1740958792
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-22368fafed1so69572875ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Mar 2025 15:39:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740958792; x=1741563592;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GBo5+OYmEobg6wfjqU2wwAFpXo5iLmkJqiW1kfdikek=;
        b=Y/3BOTnme7Lto1aQIbBj8fszU1JkvQGiemEYhpfSC41P9ynJiBBFri5bXzJjyma919
         6yJRmCkvdLroQQ7I2nBVj+7c+AV+KdS1uAC4BdPrxnBfWtu2z4ro93kQWObR1pOvDdSZ
         GLT7+S+35928A3aJHR7TQmM2tAMXgwMV+yl9JVNqo2XzOccFPmN8wKwWSi9nr40rj5iw
         i1FHFcjIiERo42Le6uWeRv7dSGFNVp7jGaF6zCd0Qyiq8TiQIASdSmrbuUhmODJYmU8I
         lrpLvXkY9oIxpc059IKBLmh/aLf6Di/GFDcr1Rh5j8t0jCu6u2fO5UC2u1InflkxweRV
         9xLw==
X-Forwarded-Encrypted: i=1; AJvYcCVW89u1FW/v8StYvs+FrlimM4qom3zhzjI4/ww9F4vUwpRGCOlmSJzqJUb8LcAl5m83HznXOl+DRNhgbaGMg4j9@lists.infradead.org
X-Gm-Message-State: AOJu0YwI7P9nvhBnhMkJDeItrSWcpdVMkBnib6FNeyt86OmhQeopyjom
	MP7pG3i2YnISuezctWecG17SGDc2kDn8jV0VqMjVejOIszybX/dSstCWrEv8BJ5X1YJ1VbP2klz
	Pkx5QiBK9vmZ/F+a/I0JgIxsqdKTka1jzryhBr5JWT2b0zSHdv5asUIDqEmoor+kaH9uuIrnv
X-Gm-Gg: ASbGncvA7a71LAagzA8ul/auS+/hAsJmV3VsKlLpIs93nXBuZ+VgwbuZyBSdafzh4AT
	Zykvv/0z1Cf/OU4rInzDxwtP9vMiU2um7YZ3d/qj4b2UX4C0o+k9Xdp7AmHOWz/rUMUaCRkGTpN
	S4c9JWbi1F+3GMRkvZPJINDoCHsxMeVwGs3qPjfAWeJeQTivEHPm8iSGCmVwUqDeIlPe8ZTvvUM
	79Pmxjs46yWlXKvcBjB4srS+iXyjYcmXKh9eFhJfSUMBDqGkpcniMZykPEDQvBD5SJQgUvkwURq
	0I7Nz+soq+NIux9wbw==
X-Received: by 2002:a17:903:32c8:b0:220:be86:a421 with SMTP id d9443c01a7336-22369258505mr198701915ad.38.1740958791837;
        Sun, 02 Mar 2025 15:39:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGtWQhLEYN86O3XnJuZetDZhwrb65+Q6vvyxqpw4uBVTdAA/3YJ21/tM+WdLRJLHGH6Np0Auw==
X-Received: by 2002:a17:903:32c8:b0:220:be86:a421 with SMTP id d9443c01a7336-22369258505mr198701625ad.38.1740958791506;
        Sun, 02 Mar 2025 15:39:51 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.164])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501d26acsm66078035ad.9.2025.03.02.15.39.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Mar 2025 15:39:50 -0800 (PST)
Message-ID: <a7077902-4286-4b3d-913a-20083ff260f4@redhat.com>
Date: Mon, 3 Mar 2025 09:39:43 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 02/45] kvm: arm64: Include kvm_emulate.h in
 kvm/arm_psci.h
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>,
 Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
References: <20250213161426.102987-1-steven.price@arm.com>
 <20250213161426.102987-3-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250213161426.102987-3-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: I4tnxO2LoLqVYIEr9HPV09pwyEJ7Z2Ho4BijUxbUGbQ_1740958792
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_153955_147598_F1F54A86 
X-CRM114-Status: GOOD (  10.76  )
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

On 2/14/25 2:13 AM, Steven Price wrote:
> From: Suzuki K Poulose <suzuki.poulose@arm.com>
> 
> Fix a potential build error (like below, when asm/kvm_emulate.h gets
> included after the kvm/arm_psci.h) by including the missing header file
> in kvm/arm_psci.h:
> 
> ./include/kvm/arm_psci.h: In function ‘kvm_psci_version’:
> ./include/kvm/arm_psci.h:29:13: error: implicit declaration of function
>     ‘vcpu_has_feature’; did you mean ‘cpu_have_feature’? [-Werror=implicit-function-declaration]
>     29 |         if (vcpu_has_feature(vcpu, KVM_ARM_VCPU_PSCI_0_2)) {
> 	         |             ^~~~~~~~~~~~~~~~
> 			       |             cpu_have_feature
> 
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>   include/kvm/arm_psci.h | 2 ++
>   1 file changed, 2 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


