Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6521C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 03:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/RRjDlW0kox/juFkyRROqpQ/BAv5W8k8xAzyOIl9/BY=; b=S8tT/l2L3G4G/H4+V8w+Npeeft
	pcbNzYPQc3NjUARclHp76KJ2HcJb5KD8KAlmetvy2bbWh19MnVgWDk76uc4CXdAin2SknZRD9Kyh4
	/Bluf2acYiiXI9q/FvarBq5GrJAFuRK3n34Q/atCTre0rKEXqAQOb+/2EHExJZkQWPQ7QvyoTMqBG
	IdzpzCTa0v0jMgKdKWP7rYX3si/SoeKJNoFdstuhe1RlxW4t6Ox0sDymLburZY1cbl5jTc0Gy6S53
	EeMZY0Bc28kguHgw/tp7tewEIB2EFdr94Bw68str/78Hw6oPGjWQNewH8VsnJF+onarCKGxgn6UPc
	x5aIRU+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4VeI-0000000DJkV-37mm;
	Thu, 10 Sep 2026 03:40:30 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4VeE-0000000DJhd-0cBW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 03:40:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789011625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/RRjDlW0kox/juFkyRROqpQ/BAv5W8k8xAzyOIl9/BY=;
	b=RyD3kQyPq+QsUEFEVzhy5adF8PtlPWFDvGro5Gjb2Z1IoHUf4VCiFqIL3CFKdtDiprIYM2
	O5PKVwciGBjxcclrY+pE0t75I4jWZHvsCQ95tVtD8z4wuc0MP3VN975pnuexZUS5HBklFz
	I7eV0UpUQ6js+BxK/l/299VKyl8iKDo=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-vpk5U_GDOzag0gvPsicwoQ-1; Wed, 09 Sep 2026 23:40:24 -0400
X-MC-Unique: vpk5U_GDOzag0gvPsicwoQ-1
X-Mimecast-MFC-AGG-ID: vpk5U_GDOzag0gvPsicwoQ_1789011623
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c89704da8c7so8659968a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 20:40:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789011623; x=1789616423;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/RRjDlW0kox/juFkyRROqpQ/BAv5W8k8xAzyOIl9/BY=;
        b=UY5UxWfMA+Ckdct/IsRRAT9jpkUQFzN6q/EFtWNi00iR/Je7t3GJR0ZL4esXUtjcGB
         mzcE7AqZM7FffKm/ZNiolmgS3mbN4NMRv8GqT4m/U4ZK381Xp/WKa2ej5zLqzEL7PJG7
         H2d2rxhUXR/zTe3atYKy8tQs5612IoKpmAxux1YAKmYO1JgfaeZJbdruwanxJgpHnYE7
         fQfrM/1XYGKUinHUE2lrwfKio7JnuHUQQht2CJbo5ysUuyddwJzHsRNQhjaawxWwd5Yb
         tmBUiQKPnFVjmN1BEWpvJrg2nVswByPuLSU01DrJBLOLCZcptf/K6pEQAjGidnnsaLDb
         oTTw==
X-Forwarded-Encrypted: i=1; AKwUvBwqAwf7a+hTP8iOiSoaHCMWzOznFJv+GJ+U/YgwFPe/Tpa0jjMxuAgAFOnWKDIunJxvGqFWL2Jn1EqF7uERVB6P@lists.infradead.org
X-Gm-Message-State: AFuF++kHOVSepuT8SsH0wo0HqyRRR+rkZalbMkNVUT7immhCnQJ1l4Q+
	goMlmEUdRnFW7kdLj2/m124tmW1M9XUYns/9MqxAVWH+U4ro70jcImUaSzLEP7duLrxna3D6B3Q
	exSdkei5JekG4PQ0PY8XCRm1upy8pgPIUILdIwhZ2IpELGXJYc5tlsVsjZl8DrXD4nopHneHtpI
	MQ
X-Gm-Gg: AYBFou2h1Iyc1eoYyrQyvlN7QUCZFfrdEnBbTz/0KVOUZLRgXNUogsjUI4xIdRuryUK
	nCwoKxefYDleTyxO5L2e1ly86k85hesVNHuZdoaOvSnZg3eCCWUEJyI6QCld+7D5L0FRqJWNUbK
	DljSggyYt2XdM8scPgiV4ZYJFFYauo6I97zO4hUeGhRuAYXNOmbaHeKrU7/HVBH750n6wSQYPeK
	sPDjo9LAgkVx643QLZ5s0raFIDhZWzzV60sZa5ItwQMYa5gCUhVWOGK1uGWB6dXuTBC1wjYMEQS
	ip4mWoAxk62GwFU0XIfjmuE+varN6lMy9cCenbbZIuLld8IXP2HCHZqxYFM2piSNqEma2P80UFn
	VvjKodyfSSncayVDOMUy2gnhTVo/C4ELZvPTqu39kug==
X-Received: by 2002:a05:6300:85:b0:398:8870:b58f with SMTP id adf61e73a8af0-3dacbeed903mr8426030637.14.1789011622925;
        Wed, 09 Sep 2026 20:40:22 -0700 (PDT)
X-Received: by 2002:a05:6300:85:b0:398:8870:b58f with SMTP id adf61e73a8af0-3dacbeed903mr8425945637.14.1789011622523;
        Wed, 09 Sep 2026 20:40:22 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4aa39f605sm1053235a12.21.2026.09.09.20.40.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 20:40:22 -0700 (PDT)
Message-ID: <f24104a3-fe2a-4a71-acbc-a4c3d2d416d7@redhat.com>
Date: Thu, 10 Sep 2026 13:40:10 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 02/20] KVM: arm64: Avoid including linux/kvm_host.h in
 kvm_pgtable.h
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260908162223.1683432-1-suzuki.poulose@arm.com>
 <20260908162223.1683432-3-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260908162223.1683432-3-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rlOszRf7VSReyi-t-miTZU8kkEJHmo8CViANkDOwrGk_1789011623
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_204027_645799_2A13B887 
X-CRM114-Status: GOOD (  13.71  )
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

On 9/9/26 2:22 AM, Suzuki K Poulose wrote:
> From: Steven Price <steven.price@arm.com>
> 
> To avoid future include cycles, drop the linux/kvm_host.h include in
> kvm_pgtable.h and include the lightweight headers required for the types
> and inline helpers used there. Additionally provide a forward
> declaration for struct kvm_s2_mmu as it's only used as a pointer in this
> file.
> 
> Both pgtable.c and kvm_pkvm.h relied on the indirect inclusion of
> kvm_host.h, so make that explicit.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> New patch in v13
> ---
>   arch/arm64/include/asm/kvm_pgtable.h | 6 +++++-
>   arch/arm64/include/asm/kvm_pkvm.h    | 2 +-
>   arch/arm64/kvm/hyp/pgtable.c         | 1 +
>   3 files changed, 7 insertions(+), 2 deletions(-)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>


