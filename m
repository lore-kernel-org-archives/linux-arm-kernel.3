Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58409C44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 23:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TwtfMvLGp0blsJ/yP8yF/ytjYAZ+kksQ7UN1Tbi9VPY=; b=iYbf0isyegg4BcLyaoheJOaw8a
	BReRF0aoRvL98WNuXUnAIdVnoeyNoWMG37yPdgYBOZj1LlaT7WA5GC/3SmPFLucbkUtOZ6qcCoBfH
	x3HdpILYCqpMCh+nNjn4srHRFGxad2FhX6sJsO4/87BvpwsVk6GkR5D5vnUCDxlkEyjE4em8kfmJB
	LQLpHLDhoG7uP5txm1V/Mer+ntjxMpeGO4Uca2zIEddPV1XaDLHnMvLAcd/n7/ssakDraZBsclQo6
	0W68TtVO4PWo8VtC3VYeCP8aoGKa491ZP/Psd+MP/e/8ShUuwrQ3sd4vVPsTQSpCsI62yNKAo96u5
	OG/s4+UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk9SL-0000000G6BO-2A1e;
	Wed, 15 Jul 2026 23:56:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk9SJ-0000000G6Ag-1lvg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 23:56:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784159758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TwtfMvLGp0blsJ/yP8yF/ytjYAZ+kksQ7UN1Tbi9VPY=;
	b=WxsJh9D3LIlKzggTmbqmQ6vgFkpdNA6Ynz7ePwIIdYcZiuc8ubbBg8ONbda92Zeucd16Ei
	obo5JbAzqPRlJ4tnsWx4NQ8C2q0j99dnDbeIIs3U6wXh5CXR0lnffCikmlDd3M1Bg7Vk3r
	C/ex8elzCBZ1mBQphe9UTeQH4wXd3ZI=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-369-HLXq5bghPCqqISeqzETS2Q-1; Wed, 15 Jul 2026 19:55:56 -0400
X-MC-Unique: HLXq5bghPCqqISeqzETS2Q-1
X-Mimecast-MFC-AGG-ID: HLXq5bghPCqqISeqzETS2Q_1784159755
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c9fe4c5eb39so4354146a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 16:55:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784159755; x=1784764555;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TwtfMvLGp0blsJ/yP8yF/ytjYAZ+kksQ7UN1Tbi9VPY=;
        b=Tng+jN8h0MhBvMZlm8p7PoLESt+aR9IfGkswnc/F6nRhlRnV7AZ3IyfoESALdIR63W
         yQNxCE/FoA8bmm41vBpTd1FAcAnQSPMVIGyTr6baWurlpa45EXj9XlBKMHkueHCq8xa8
         vsFJHc8QE8uzxoaiUUwyyw1BxQF9aHEx5vjO9xNawSsrTmFJx82mwE6ADO2xhkqrQIcB
         fTRpTXcIGOKRG6hYTNvjpAPHl13jCmwMTlCfbA3dxdZHWS7bW8ZLI2utDdQSL34tkZrs
         SqEckoyfhEziCZGwdYPdFZLuR5AbnqtQrAMxmBHzwkbTVkO9zsulx+8lc1zKrxZ+QfTO
         5/nQ==
X-Gm-Message-State: AOJu0YzjGAMyhv4pEgU+uxrcnJmDxGkEHLwH5LQuNkrmZpeEsL7aKzsd
	9PTMSb6wh+CCAYn8B9sKBHJ/3mi3lTSIGhMCsL3tIskMxKIZuy73mbQEbT/f1B9sV6q0I4e+2DL
	2rkahxMJeI7GPseDJFn3IbMoJLPkUNSlgIAwqb0NnRzyOPCNGjDjXGExUj9OmizU/bOhoh9zmpz
	Cc
X-Gm-Gg: AfdE7cn8NTOTMx4gh73cgu54F5RjkUp7SqXzcMVuyF+eQ7Ze5e9Dt2Lzjwj1heXc+rT
	7TVWQiUgx0kkUBBQ24gCn0n8pI1k4qkL8rNrXGv81l0GFaWmxplY6TzTZdr8MaC1rSAc2P6Et90
	mto807LbbJCouWKV154U/9j4gxiJLuny52f4+lEn6VZZL6DP0CP6HwQEulgXFE2mZcK+MNN2pRz
	e/BQMJ+qH0REkn//KElh8UvKGaOJvjNEPd2g5soSp3zOLTD7EekyzBiQZqYh8CyYKDUKOZ8GT1U
	J+PRi2QKoD3O6vs9rqDma9NXzZQoqn2u0Qb0n1fBWz0dsQMJLHsPPDVXVAT8EG4LFEK5jU+0U6v
	v9R1VHaMBEpKTGGTjUFnM4udaVPf3uILusMitQHso5pU=
X-Received: by 2002:a05:6300:67c7:b0:3bf:f795:f0f3 with SMTP id adf61e73a8af0-3c36c357c52mr5249168637.54.1784159755396;
        Wed, 15 Jul 2026 16:55:55 -0700 (PDT)
X-Received: by 2002:a05:6300:67c7:b0:3bf:f795:f0f3 with SMTP id adf61e73a8af0-3c36c357c52mr5249142637.54.1784159754934;
        Wed, 15 Jul 2026 16:55:54 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e6c0702sm4841421eec.22.2026.07.15.16.55.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 16:55:54 -0700 (PDT)
Message-ID: <ca7bbc13-6772-4511-a414-58d4e7ef5b4d@redhat.com>
Date: Thu, 16 Jul 2026 09:55:48 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] arm64: cpufeature: Detect BBML3 based on
 ID_AA64MMFR2_EL1.BBM
To: Linu Cherian <linu.cherian@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260715053408.1950475-1-linu.cherian@arm.com>
 <20260715053408.1950475-7-linu.cherian@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260715053408.1950475-7-linu.cherian@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dBnBIH4xBy0B9yDDyp2EePzKq9RfMRg5uGaNyQAoESM_1784159755
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_165559_535480_D72A81F5 
X-CRM114-Status: GOOD (  10.95  )
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

On 7/15/26 3:34 PM, Linu Cherian wrote:
> Add ID_AA64MMFR2_EL1.BBM based BBML3 feature detection in
> cpu_supports_bbml3() so that cpus with the feature would
> not have to be added into MIDR based supports_bbml3_list.
> 
> Signed-off-by: Linu Cherian <linu.cherian@arm.com>
> ---
>   arch/arm64/kernel/cpufeature.c | 17 +++++++++--------
>   1 file changed, 9 insertions(+), 8 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


