Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A7EC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 03:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zBUyB0Q8zMsFcB5UcneuetEe4xDQ4aVw4JfTOnTTULU=; b=sVnX0enSSm7ya5lD/q02glYrD/
	I4OImrY67tP22nuSQE3dLJxSSCxdkaU3gbCs6I5P8YUlZ1fbqOUlebBOeZ0rt7LvdSRc1Yso8b/ox
	t7n4nlOF8dBLKcXNRlMX4/eXpaIenEQiGyQ0UJ5O3nuoeq2H0pgaSU6cIq+wyWW9GtWhWWXj1Jz97
	pT6A5wgYUiFuht8qSrdB24n3X6esHwJh20pumSXGziMw8Ixh7/hx/tdb4ASz5o16/U6MZlN1Rmrx+
	AblXZsvSzK4VF70kB4EEovy2ZZsZH5qShmEFO4WnrXZXG225+bXuGNMcK0diOHjUjh09bSH+kdMH7
	Lvgk9cZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAKJa-0000000Eaur-3ii7;
	Thu, 01 May 2025 03:10:22 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAKFd-0000000EabA-07f0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 03:06:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746068775;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zBUyB0Q8zMsFcB5UcneuetEe4xDQ4aVw4JfTOnTTULU=;
	b=h8qZTEyTzTw+YYY8eslPvuH5rrC4cuty3NrDHRkshHBZBJBjUG7jD3bCtB1m0Aliqn1rrf
	5xyqgjAbf0ueyuOSAj4RHJr2rnI2Aiinv3Zq9aUs6IWGmMzvtfbE//qbyw1AhclVMw0Zid
	ZLcvkCni2fczSvp2ee5tOjwBNGC4pOM=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-173-tD5pGPMGP0GEd1Th4_pM2A-1; Wed, 30 Apr 2025 23:06:14 -0400
X-MC-Unique: tD5pGPMGP0GEd1Th4_pM2A-1
X-Mimecast-MFC-AGG-ID: tD5pGPMGP0GEd1Th4_pM2A_1746068772
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-739764217ecso534064b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 20:06:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746068772; x=1746673572;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zBUyB0Q8zMsFcB5UcneuetEe4xDQ4aVw4JfTOnTTULU=;
        b=jYvj0YRgiG7B/eX+COHlWD+APOVkykIFFhccaRYtsFvsmYPM0wW0LcHOdSeSdRuqSb
         SVP+Nt2fap2h2vJL429Aea+1BDk2Tk+6lSSQuxSmXyRXgpDK5Kl3eu/vGHLcjah1BFF+
         yxsBQnypn/RNY3hqA9wR0fhaovswGsQwWVnMxzpBniagEkbU6taJ98+vRudJiXym7eap
         YP+xfLXpixgVkoiuThvPeFNvPipqJZKkrH/Imn4333tX7NgldDEU3dhhOYbqSEzNUojl
         4R6UjjoMS6D+rBGsCfbeFa9I5Onxuuy8WW6OWPxtC3dIspL99xic3tIuwc7JhH6zmb2x
         kOow==
X-Forwarded-Encrypted: i=1; AJvYcCXK8H8jDv35FNdNWOzeRoqGFnHmx3zNcOmCpqSEQ81x0SWNEGgFB6np7roR4W91Nm6aA+poaB7vmMhg9DdcUUiX@lists.infradead.org
X-Gm-Message-State: AOJu0YxJdafmTgo09B8ayQnzW1l2yAVSflXc8mTgeUp1LBZYtqoUeOfi
	IG9cnAUiN37OI7G+BsusmBsWehA2kqjg+CUVxziBIQQSxN8XtH48+rCNv7OAdYt/zUKQCxohxLQ
	h4AIHPJWWkCPMQbHxGlJPbR1e0pBgi0Nmvp6Px40zKa3lRBU6YK05uva98fnUgFKSehLbxIii
X-Gm-Gg: ASbGncuYrJhaKP4YHFTmGRJCUyQJ7DcWPXSB4LiQYA79alWx2nVKL7QV6beK9pmraC4
	FtEzaiHcrMX5PRe7stPywB1DUUpJDshhqlf4UR+1cuIpY2/t9Xl0wQWm5s8LXVI8ddWw8wUOJ85
	d/slTho7L05qhqwIcEFbk11BzXb8uwx60UqOJraCvMYhOLSjrBLrQpi8XyEx+YuVGde4noROHMP
	IcQwvASsOLf/a8kfE6NZS6F4tWGVqOpvoUMFS12dCWRuaZqO8O1jH/jlVq/KON2rL0PDEXHR01w
	gdcaXt1eMJb/
X-Received: by 2002:a05:6a00:35c8:b0:736:bced:f4cf with SMTP id d2e1a72fcca58-7404927930fmr1444824b3a.0.1746068772430;
        Wed, 30 Apr 2025 20:06:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqFyaQqRxd5YG/d2aF2wgTwFAOyBR0cwvIicbDZqnls7TSQ0mJMT278uEe4KH0+EWzXzgDGQ==
X-Received: by 2002:a05:6a00:35c8:b0:736:bced:f4cf with SMTP id d2e1a72fcca58-7404927930fmr1444772b3a.0.1746068772121;
        Wed, 30 Apr 2025 20:06:12 -0700 (PDT)
Received: from [192.168.68.51] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74039a600a7sm2560107b3a.130.2025.04.30.20.06.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 20:06:11 -0700 (PDT)
Message-ID: <8a21a392-5ae6-4d55-905a-0956f48853ba@redhat.com>
Date: Thu, 1 May 2025 13:06:02 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 43/43] KVM: arm64: Allow activating realms
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
 <20250416134208.383984-44-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250416134208.383984-44-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mbSFToK_QV7vx5KsBD_yhnmngZf7daiEFVEVpD_Wf1k_1746068772
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_200617_162687_B0A0DCD0 
X-CRM114-Status: UNSURE (   9.59  )
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

On 4/16/25 11:42 PM, Steven Price wrote:
> Add the ioctl to activate a realm and set the static branch to enable
> access to the realm functionality if the RMM is detected.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>   arch/arm64/kvm/rme.c | 19 ++++++++++++++++++-
>   1 file changed, 18 insertions(+), 1 deletion(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


