Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78091C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 00:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L/IG5aO0gBvVFr90gKLy67IML5GL+6QNMuZQAkI7UIY=; b=gol84z+uKOJ9PIozviTeBEjVRz
	R49B5AG18dz1EfYnhGfENwVnDJG6m8Hd9SLVzyOrQfvadJnJJUiE3sp33d1VUeDcHE4feS2ziAxC1
	9PI38MFUbSFGI+25fvbTlrvHaoV6WqcUkKMW91KyaXYERQm5AwD7VI19v4PRxcxctzBh2U0hXfQKN
	seLC+7hzEw5a0sRIaw8ARIEU5vhETfp29XaPiu2QVjBoIbTAekhqSfqcaCyzk87s4P7/VhYNLiRed
	m/urmo0JcUwEq55LuFG3sDZhGXih0dADMjDX8ybI2wkeuCxE+ENUP5lqDagm1phha8TkApMKB30Ky
	FDT+hsCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkWrp-00000000ri9-1Sp7;
	Fri, 17 Jul 2026 00:55:53 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkWrn-00000000rhW-0eKl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 00:55:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784249750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L/IG5aO0gBvVFr90gKLy67IML5GL+6QNMuZQAkI7UIY=;
	b=GTj/Pdxy+yrCs7644bf6yJ3pd4XrMk7pGREMnqZMfA1q1l5+tdJ9eFj1aBE5XT4gxLzbQD
	iEQCUBa7l6HziQ/zwmUyWI2jC+BkVWRNNual5qAZua4E686AwC5rG8VqLiQtir8ZR5wTt4
	i7GQqMXPv4xWDbrphUPqZ3s2HIhMakc=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-670-tkzDoaTyMPCXWZxDwFiL2A-1; Thu, 16 Jul 2026 20:55:48 -0400
X-MC-Unique: tkzDoaTyMPCXWZxDwFiL2A-1
X-Mimecast-MFC-AGG-ID: tkzDoaTyMPCXWZxDwFiL2A_1784249747
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38dc085b0a7so10091196a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 17:55:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784249747; x=1784854547;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L/IG5aO0gBvVFr90gKLy67IML5GL+6QNMuZQAkI7UIY=;
        b=HRLGM5vWE5xbH8RzDwN5A3iIUat+VFqiH2P2Aoq6ing9MiJmMz9dFoO3p3QwcHqdmS
         QfJ4yuVgdWO00y/G+oI2rLUu3nLVk9hU36eYOa15v3bPVMqZTt5RBUdGhxJrhy+tXI96
         frM6Dy1HXew/bzKncmmDazu7RlfXv9b6fDxGEk9Do+f4uIQ5QiN7eoL5rctUn+gQjOc6
         y0HZ/hOTiPTr2dDp7oT6x9POiegYrH6OGaERhAYh2W8NKNeeQETjxWBTDZ+liUWr4s+S
         lAXjNAIj7gyDb45424OUhlFrIx4QDY1NjcvT7B0WQNkStC5y6cpCXJtdFO9nngxP0B6D
         vmOg==
X-Forwarded-Encrypted: i=1; AHgh+Roewve398dPM4u2prCFbIjqF7vl89She7tfZSiD0w4DBdSMqstSsWvH8Krlsd+3nYjDI/dBO2Y5f23Pbu6dgoD3@lists.infradead.org
X-Gm-Message-State: AOJu0YxbB21m0P90EZzw3kX2bfP+P8FyRJHi2fYfsN5mQwBUUZk5kZ1V
	rY+y9JTtpw1eMRO2uaEdn4Vf6Mb7csomNy768MaTIx0EYaGTfB+936ESBaJhJWp2cU64MfZIqDk
	f3VrxOKjZM7oU7zGkp1VE8yQWKRosGlG30Xy5mVpTmf/H4obVO9sZLrLmBBqG8ZEnMAWBrJlqp+
	aK
X-Gm-Gg: AfdE7cl/L+lnq2UTwhwHC5lL0BxoJ8YlvHKfaOB6EFbEFfBAKP24pxFF3d2vZnhGvJX
	BOJ7BkJts6nDPGiwoORjeAaoZHeSoXl7GAlxjopNtQdrHQJM9SRNPOUe5e/g4G78UzdSTGOQh6m
	+YFRj+vgNZYw8ITq1mH2GYKodJPXzl86qb1dKq9gouw3BqmwgC5cjFLIrRzzcQ6O6/er3TSWXOd
	53/BaBAfExY/kIGbS7fB+a0FfPql3GNpMcVWoHKcq2vVpn1YS4owQF5nhrVGmFM618F69dAgB9t
	jd6JG4aGd0Cule0UiLqq+kskDjtN+5RvkUmeZW8gWBXJ/OyFn9w+DM28PtubebjMatZis+Nz3sl
	L4OC9MNyGcCKL6kdkUBdQ2IZIS2CAMpx5jxdo2TG9GSw=
X-Received: by 2002:a17:90b:5390:b0:36a:8240:2477 with SMTP id 98e67ed59e1d1-38e4b47be8emr363197a91.19.1784249747389;
        Thu, 16 Jul 2026 17:55:47 -0700 (PDT)
X-Received: by 2002:a17:90b:5390:b0:36a:8240:2477 with SMTP id 98e67ed59e1d1-38e4b47be8emr363174a91.19.1784249746927;
        Thu, 16 Jul 2026 17:55:46 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4afcc117sm145661a91.3.2026.07.16.17.55.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 17:55:46 -0700 (PDT)
Message-ID: <d0a4ab2e-cf4c-4cfc-bc4d-c22e220cf00f@redhat.com>
Date: Fri, 17 Jul 2026 10:55:40 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 06/11] arm_mpam: Use __ris_msmon_read() for saving MBWU
 state
To: Ben Horgan <ben.horgan@arm.com>
Cc: james.morse@arm.com, reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dave.martin@arm.com, andre.przywara@arm.com
References: <20260710115546.29644-1-ben.horgan@arm.com>
 <20260710115546.29644-7-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260710115546.29644-7-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 55Dx5ekIhyWqPtYE7zaXI9EQ9WPyfnbsTboxMDqYW2U_1784249747
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_175551_271468_67ED39D8 
X-CRM114-Status: GOOD (  11.33  )
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

On 7/10/26 9:55 PM, Ben Horgan wrote:
> mbwu_save_mbwu_state() reads the MBWU counters and adds that to a saved
> correction value. However, the type of counter to read is determined by the
> RIS rather than the class and overflow is not taken into account. Fix this
> and mitigate against further divergence by using the same helper as used
> for user reads, __ris_msmon_read().
> 
> Fixes: 41e8a14950e1 ("arm_mpam: Track bandwidth counter state for power management")
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
>   drivers/resctrl/mpam_devices.c | 33 +++++++++++++++++++++------------
>   1 file changed, 21 insertions(+), 12 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


