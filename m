Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3666CC3ABA9
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 03:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eCg3VHmOtxCvew5eYi3QzhfJ1vb1uNXc4Xa6k7JPpko=; b=k5H66DWkxGvqGHNUlyyNX+UWR3
	IEQXMY5hf4uBusy0EMF8ijsrrb8cOV9B5mtGSXvjsOUBE+Cqr+TK1Pe5fVFnzsdS7B7Lh+Y+7cfnT
	B5eOb3EI/DNN5os110oCAhai0QcUH5G0nQBeZ9glKvkM6GkRbfaCKkQckY7UrnAEOWhYyL6TC7jny
	RXrTkQBLKvfUSgFh5qcjNhesKbH+Ur5qe4FARgq49AWV2YChI2qMYM/sbkpT+e9ks7t385FzoHjt4
	P8AoovEcswclsCUN/Gvu4c/HBtqaaBmp5+lwVvlWWG+yphX1iW/wm0BmahIAu91ZH3kFxYzL0KA0e
	AMmQn6Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAKyE-0000000Edfg-03J6;
	Thu, 01 May 2025 03:52:22 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAKwJ-0000000EdTX-2yt2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 03:50:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746071422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eCg3VHmOtxCvew5eYi3QzhfJ1vb1uNXc4Xa6k7JPpko=;
	b=VvtVvuRnXUp04++ObLq/ENJatsQKtnlZsf/uo3WSQWZINGiYKUCRfKCGriOFtztSDo/Dfw
	QED4ZIDmRM4RRJ8nNoI3P73z1hUmjfC5TAPIXnimrxXVipznwMuXeeQxKMfAQMasxG2cj7
	tRzelyQ/5M+X095A+kBIwCEUJCnj904=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-490-kH2bPisUMSy_qITcfbmNZA-1; Wed, 30 Apr 2025 23:50:20 -0400
X-MC-Unique: kH2bPisUMSy_qITcfbmNZA-1
X-Mimecast-MFC-AGG-ID: kH2bPisUMSy_qITcfbmNZA_1746071420
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2240a960f9cso5310245ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 20:50:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746071419; x=1746676219;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eCg3VHmOtxCvew5eYi3QzhfJ1vb1uNXc4Xa6k7JPpko=;
        b=SeHUX08iT/ON6/JsvcOQ1BK0TZ02LydZW8v6JylMLXduqJu7aZfAWSVhwQlDidsiZW
         KjdFeGR49dJHLHO7tG5Ots8IhiIVGftPm1dhN4wOILrUJtw6xiQA/QVfsuopznkdogKn
         uN0gVbZgjf8+g1nVW/kLcD3UGnIrtgr+Ywm4I4iRrfpwy7w/8KswkVEOG5uFUQZRPACR
         yBgIODi+kSoH9NEqv7WWsCcYh+SILI23I80y+Ia6p5SYsvIKoBJ1ny0KrB4NDeDm+AfL
         JJvBzBjQ0q/yNGnRq/64d0JSZS2kK/CHJgGc9QqtXPYztd19Hg0CsTk+ibDZAc87r/S+
         qQIw==
X-Forwarded-Encrypted: i=1; AJvYcCWZ6gCdRcMlty/CT+77lO2Uls/FswhIlF+zMHpjyKps9x4dQGnji0cL316WG2yTNn1f0rDiIsAvbDStItU/Bsqz@lists.infradead.org
X-Gm-Message-State: AOJu0YwfmOuWE6O6hvttSmcvWJpSk/amZ7206JuSFPwoNPOYL8BM5BS2
	BVch1ncP0CCRtI+XCsw4nemO1mCrQytrwY0DNA51ArSchqLsfcXsO/NPDFzcChquaaeX1ulY21n
	gssjlIRL+DKtC0KvmrS2LGuN1n5JUNwVy87fEvLnX8PRXToNAAObgp03EN939wkxilB6K20UV
X-Gm-Gg: ASbGnctIQyIxYges6lwmRgzhOcsPLX/MFeO1re6yG+WB0fK8plxPzPjmlgK4Fo+Wl9C
	yhdw7fm4KCBBlHoDWf/hfig6iEENzhfk8oH4kBogq44ktbfHty+7f1qY5ro8UOTpbbLgqnRN0rd
	Z9QJ1Hj3FidgmlTTnIoUke7ATj7ZBifNskNbJKNp0CvAQiiP6vwVjv4lVOmCItx15E31G1gWDdH
	ZkJRVuerr7DdkR1c6PowFS8J6AHhYQwDXg9gjT997sKxGCB8zmBjUkY5+n0nIORikGAZzgGNtwk
	DiSkn9cUbf6I
X-Received: by 2002:a17:902:ce82:b0:224:e33:889b with SMTP id d9443c01a7336-22e040bf632mr26267595ad.12.1746071419629;
        Wed, 30 Apr 2025 20:50:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjGXYl1nbElt//Y7QO+1qgJyi9H/AWK7L3Z8v+0R5cqVKw1fIlymBvwS8voAmkMjppWWC63Q==
X-Received: by 2002:a17:902:ce82:b0:224:e33:889b with SMTP id d9443c01a7336-22e040bf632mr26267185ad.12.1746071419220;
        Wed, 30 Apr 2025 20:50:19 -0700 (PDT)
Received: from [192.168.68.51] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5100c70sm130601505ad.166.2025.04.30.20.50.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 20:50:18 -0700 (PDT)
Message-ID: <b10f429b-7009-4399-966c-430ad1e02d05@redhat.com>
Date: Thu, 1 May 2025 13:50:10 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 37/43] arm64: RME: Propagate max SVE vector length from
 RMM
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
 <20250416134208.383984-38-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250416134208.383984-38-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: awNJ8xizbwl9SaVe_dpn4UZRT1mn7l8mN_CN5jRSp-o_1746071420
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_205023_825282_7B2BF4CB 
X-CRM114-Status: UNSURE (   9.78  )
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

On 4/16/25 11:41 PM, Steven Price wrote:
> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> 
> RMM provides the maximum vector length it supports for a guest in its
> feature register. Make it visible to the rest of KVM and to userspace
> via KVM_REG_ARM64_SVE_VLS.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>   arch/arm64/include/asm/kvm_host.h |  2 +-
>   arch/arm64/include/asm/kvm_rme.h  |  1 +
>   arch/arm64/kvm/guest.c            |  2 +-
>   arch/arm64/kvm/reset.c            | 12 ++++++++++--
>   arch/arm64/kvm/rme.c              |  6 ++++++
>   5 files changed, 19 insertions(+), 4 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


