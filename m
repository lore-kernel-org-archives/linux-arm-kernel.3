Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 920F8C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 17:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dvyJrdPXem/t9rhGc0og2q57i3iOEHExNGrbOAeLIoQ=; b=Tna2XHGXvxqepEC/4gvrEtHTAi
	p+J2WhfzO6I6GWl4KuQCOsEJcNc+0gZLJv9vnXqlxq00iWlrktyIXgUxmMN1X0Ezsi0zleklUwM/Q
	KaP7ZhPe8BwtBtQiJbJU/PDzvFVoSPBEChZFA7UJ3wV/Os3ZK8eOojrir9MNmipQqUoUQxueQArVp
	Wx6h9m2IiKPQ98+LpRLSI2Tm4R9Vb0Xlg2pS1enYs7UriaUMQ5oOE7+Yk80BMQkmTL+Alf8JzBD+z
	IkRgad/veaEVXvu+PJRSucWi6hzZT1j3a4PPlyPnLLxa1rcyI/vHNkDraHAe7ckbQgU1frpvKevSJ
	KsL15SLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsPzX-000000099Yf-02gp;
	Wed, 12 Mar 2025 17:35:39 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsPxF-000000099IZ-30hj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 17:33:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741800794;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dvyJrdPXem/t9rhGc0og2q57i3iOEHExNGrbOAeLIoQ=;
	b=GtIyhi0VVeMCSNwOxLSXImqvhY2DDP2xOGcudci47exK8eYEANsNH5V0e31Zh2XA+8oYXN
	wKcR9I+2MhD3/V5C3MN2kVLE1apylmYZMzX3JTrpFTcXkixCCJKaGCs8TOX6JPHa2z6TZ0
	7kYgfJ9pH87/hTpKKrODF1HX/A7zjEI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-302-LE4-CgInNOGv0W46zoC7PQ-1; Wed, 12 Mar 2025 13:33:13 -0400
X-MC-Unique: LE4-CgInNOGv0W46zoC7PQ-1
X-Mimecast-MFC-AGG-ID: LE4-CgInNOGv0W46zoC7PQ_1741800792
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43d00017e9dso295295e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 10:33:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741800792; x=1742405592;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dvyJrdPXem/t9rhGc0og2q57i3iOEHExNGrbOAeLIoQ=;
        b=pkr9u40wzclDoFtpbeB7XpMFSbdqPVOkrW85FWCtHXwomZyEaykgvcqns67OHNfqq1
         HFh2TpHwM3k9cKYyCrGXLTWJZ/KGXbBCrldebmjfLLYUrhakxs1Ud0Hf3owJyW5N4T82
         UlLkXP5TPxovpyi5Xo4kSOFwgsSKGo8+VCdmshh7y/eyXGXC9P+ogvLJ3Xq2ZDcdf5y+
         rX2VEXVMhkfpaonpqV2AlkLlcS1w9rduSdU6Qk9xtPwa4hhvuppuKc8xSF2NIgTwHmV7
         DgkHKNlRmWOtpzG38qVWxyUAcPvsq/DmLl3bJ18GfaJSH2bTdTTr5ZBKNhW0B0qUQ3/L
         hglQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJKn9i2uy/K7+aJyZSkm5LIycSM1ENLirJwWtawSEiBmc8DzfzgSzrqsMsNuu4JGc1BVShsyQmVHMJut82zE/P@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2nGFPSYZnqhM/Io4DeicFep7y+IPyBVadYJAlz8GURZ9moe6o
	Hn8HtTqh356xBYMOCHMWJF6RY4G4IsfCoPVssd5JJbTDkASZB6AoE620VtJpVhVc+RHQPe6Es0E
	+QXwIdYYMd7DFNCvqL3whB3fl0OZFFg5vcrxNJ5Q19XythrFfwIcAz6KgpXuKjvx1liboxxVb
X-Gm-Gg: ASbGncu59wvSVO7dHUoa2XNb7IuCVy0tenF6PxJk/YHrEmtuQaBrVnYuSSgM8shs2OG
	Y8rpuDyyyZgIITHA25f+Tign2iYrjhgjapjw6gsXJfgk4PbYybed6QSXf67TP+OxqhqkVNtfFFc
	kOw8NN8uYH7H6lePKXtGy0qRbxcXLLYHNnRUg1jNi1WBQ2vS7eEDKDK3n6v+GPj8QuiMyGHsDBT
	CcoyBBLOU+oocJTPZYr1vTNaad3l3GH5eSLq55EVx0h8pVovB4b2SPgkRemmpux0fnkFnf2foWg
	asvptIL8nvB9Eu895hNCD6oflfITeMGJIo8uevNLHTnmdxPMqESj4XcpbW9krjdY
X-Received: by 2002:a05:600c:190c:b0:43c:ea40:ae4a with SMTP id 5b1f17b1804b1-43cea40af7amr151794745e9.31.1741800791742;
        Wed, 12 Mar 2025 10:33:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkDaxroZKHcALMxZZ+BxRIhiOexx6MlAPp0LIXP7yGXSlrtMMJvV8WhA2IxMPpSEUR5gjapA==
X-Received: by 2002:a05:600c:190c:b0:43c:ea40:ae4a with SMTP id 5b1f17b1804b1-43cea40af7amr151794565e9.31.1741800791436;
        Wed, 12 Mar 2025 10:33:11 -0700 (PDT)
Received: from rh (p200300f6af11ec00f9928575aec32536.dip0.t-ipconnect.de. [2003:f6:af11:ec00:f992:8575:aec3:2536])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d0a74b699sm27660235e9.10.2025.03.12.10.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 10:33:10 -0700 (PDT)
Date: Wed, 12 Mar 2025 18:33:09 +0100 (CET)
From: Sebastian Ott <sebott@redhat.com>
To: Oliver Upton <oliver.upton@linux.dev>
cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
    Suzuki K Poulose <suzuki.poulose@arm.com>, 
    Zenghui Yu <yuzenghui@huawei.com>, 
    Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
    linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Writable TGRAN*_2
In-Reply-To: <Z9HCQ40LxShzL4nj@linux.dev>
Message-ID: <eb045be7-69ca-fe71-0333-086b71bb624f@redhat.com>
References: <20250306184013.30008-1-sebott@redhat.com> <Z9HCQ40LxShzL4nj@linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Bjl8aanAXydv--kYDZ4e4e933L7wsxmZ0yKetAUBMtg_1741800792
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_103317_830694_FF0D521D 
X-CRM114-Status: GOOD (  14.94  )
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

Hi Oliver,

On Wed, 12 Mar 2025, Oliver Upton wrote:
> Hi Sebastian,
>
> On Thu, Mar 06, 2025 at 07:40:13PM +0100, Sebastian Ott wrote:
>> Allow userspace to write the safe (NI) value for ID_AA64MMFR0_EL1.TGRAN*_2.
>> Disallow to change these fields for NV since kvm provides a sanitized view
>> for them based on the PAGE_SIZE.
>> Also add these bits to the set_id_regs selftest.
>>
>> Signed-off-by: Sebastian Ott <sebott@redhat.com>
>
> I can't tell what you've based this patch on, it certainly doesn't apply
> on a 6.14 rc. Consider telling git to include the base commit next time
> you generate a patch.

Ok, I'll keep it in mind for next time.
(It was kvm-arm64/next + 2 pkvm series from the list that I applied
manually.)

> Please do selftests changes in a separate patch.
>
> Don't worry about respinning, I'll fix this up and queue it in a moment.

Thanks!
Sebastian


