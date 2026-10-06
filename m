Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59378CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 03:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NLjBEqzF3bLvG463L+dBKbw7TfCoymi8l+jbKvUBXR4=; b=YG0iBnx8OxmcDPAopPe63B1nKq
	bU5DPsQFB37WndKkck+gVEKFcfAi2SBzIDc3/rnegoMmW81cb7l0waop0BUvk5QTLoHmzodcp1XZe
	CyX/od6XvjkTWje5Oh7ZZT2P5BnAQ8i+aCYWYJFU43/r326+W13ySEiDFjABpsUkINqd4bKj6qh3Y
	ZKl01zbBtO0sI7nfTB7WGTUJ/vJxHVEydWS/rzE9Mjv8WIGVFGU7fRU4ilqsGPzL4XHzuIf3V2VST
	T1ltbVKo1+bgwsoTiivN9iVV8Lwx8rC9fDKgyAjpbX8tmjew/kLo04sMN7lvahqeTrtzlluIPPkwn
	m3+P75wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDvZe-0000000HXyo-1H7B;
	Tue, 06 Oct 2026 03:10:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDvZc-0000000HXyE-1AKS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 03:10:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791256235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NLjBEqzF3bLvG463L+dBKbw7TfCoymi8l+jbKvUBXR4=;
	b=MUixmHbJkEDXWFHhlYwcq7PDTdRuyWMlJamV3E6ACNXXXcJIDgXNzEbQed5JvBRHcNVnJ0
	4VssfWEA98/OCYSmobH2SUUIFBSkV3CmBkN3kB+OdOIr5c8jkL+Ak90ZuTOypqpNJNXxus
	jDfwbqfRKUZE0cRTjdqaG0TgjoJoCDI=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-43-6ZtxzBoWPYeYtvXDazN-Zg-1; Mon, 05 Oct 2026 23:10:32 -0400
X-MC-Unique: 6ZtxzBoWPYeYtvXDazN-Zg-1
X-Mimecast-MFC-AGG-ID: 6ZtxzBoWPYeYtvXDazN-Zg_1791256225
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-385d2703b64so400379a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 20:10:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791256225; x=1791861025;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NLjBEqzF3bLvG463L+dBKbw7TfCoymi8l+jbKvUBXR4=;
        b=Hat4gEd1pbESkFTHgUu9A53P3etQmoM4FJKkv8TPbKIa6OK7a0gsX9IXQkkiuqusXY
         OCgCFyA4ievJJukkcBigSUAwjvTsFiAYrbCHIGt3f6UKQhbPWZqiGFkN20TFo1MAJ4wO
         hi0KSkFdSqkHZ7QUQcwCY7zqWk8iXYs+P1YxjYZToXJZwlB7MAKK3o2HOZIBBrWMgS4h
         c+H2qAYWd8LU+lEimxE4u8qpfdGgYus6U6cPOgJJcX4UeK/cJ5V9n4MZUQy9ZGI405xr
         78JWsgqMZlIUFcviuGOmr/sq3B2IzIIgyQebbsZYqlgCnAany1TzMLIdMVUaFPWrrfFP
         /kcA==
X-Forwarded-Encrypted: i=1; AKwUvBxhYVWWUVx/659Rk4br7KyYHkjUsrNnnfHRp+VldB7hsQPR1dn1Y4gPXMdG+5bxOTTUtYMAnLNTObgIFQ7XP8M8@lists.infradead.org
X-Gm-Message-State: AFq9FYK7V2EJlF+ifCwq2MGvmtex/h4H85xyfuzKo14d4eZlm60rAGhE
	U4i/xAl91KGwJTVSvsUms6jDszFcpTIN3ZkHmiIxsKgmzDx0daS8dBXD1hGSXuR4B+uIJ+nSl7c
	g63M98Tc3DdxfLRbEnxWWHXKxVr++NenmEtzTuhLLLSVz78hTwM6uEkpOQ0UOvcFUbYvL4ofHcw
	3E
X-Gm-Gg: AYBFou1Ad/SXoEl8/6qmgOb3udBUSsvSWRfUoAz2isIZC2WOavbGBn2rjteLfkj5Odp
	41P9PQKCPPsSxXdr0sbu8sQqTjPNBTnbiJXrmRYlM++bLJei2Qeydq0utNNkZ3F9grNbRmEXD5n
	2ZhqcrHv48yCk2oguWNGzvys5+MaBtw6klVwlvSLOxIULgm2lSgUHPTFXGWyeLT0VkDBoU871+K
	pg//GtGdQb0dNOdFbtK118ezTpcrE5MDtusK8DJgVHoLkdnNZhtzS4FaxFSjtrPC//rUpFx97pk
	hggQTrX9eBPf96MUMVSLqzrNCV4B0+rxgujz/xvYp1U7q3TxKf7+aVC8mwtDtdjMXoEQPCQIVTZ
	pKNcwj1l4+JF8f2gaeUrFP1EthSSqy2nZ/G1X3M43CQ==
X-Received: by 2002:a17:90a:d64b:b0:3a6:d2ac:74ce with SMTP id 98e67ed59e1d1-3a87368d0admr19233a91.19.1791256224567;
        Mon, 05 Oct 2026 20:10:24 -0700 (PDT)
X-Received: by 2002:a17:90a:d64b:b0:3a6:d2ac:74ce with SMTP id 98e67ed59e1d1-3a87368d0admr19217a91.19.1791256224127;
        Mon, 05 Oct 2026 20:10:24 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8543b0c1fsm3110944a91.14.2026.10.05.20.10.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 20:10:23 -0700 (PDT)
Message-ID: <9f9575f0-be48-4dd0-ba1f-98d8dd39f10c@redhat.com>
Date: Tue, 6 Oct 2026 13:10:13 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 14/23] KVM: arm64: Mandate VGIC v3 for pKVM VMs and
 Realms
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com,
 Fuad Tabba <fuad.tabba@linux.dev>
References: <20261005090754.2140522-1-suzuki.poulose@arm.com>
 <20261005090754.2140522-15-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20261005090754.2140522-15-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vGAO8AjWDaCsOdUTy0PO3VdNCjsDGDF0mHxMrye3cBM_1791256225
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_201036_396124_FBC0B115 
X-CRM114-Status: GOOD (  12.17  )
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

On 10/5/26 7:07 PM, Suzuki K Poulose wrote:
> pKVM does not trust the host. Realm VMs follow a similar trust model, with
> the Realm Management Monitor owning the protected state instead of the
> host. Add a helper to identify VMs that run under a host-distrusting
> hypervisor.
> 
> Use this for blocking ioremap of vgic-v2 into stage2 and prevent creation
> of VGIC other than v3.
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> Tested-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>   arch/arm64/include/asm/kvm_host.h | 4 ++++
>   arch/arm64/kvm/mmu.c              | 2 +-
>   arch/arm64/kvm/vgic/vgic-init.c   | 2 ++
>   3 files changed, 7 insertions(+), 1 deletion(-)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>


