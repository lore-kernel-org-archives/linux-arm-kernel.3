Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DECDC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Feb 2025 02:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jz0tT2FTFLvNvj61SDsLmOkHBQ46Tt26HSOtiuLa6z4=; b=YaBi6yVKGFcwOpkE6KURDGWi7f
	gJadLoIywPYB5oPKAMmvYPVYejaX77gBMxUJs5w7Hy3HyyrxJmaGKg3MvX7OkZG8XnJsaiNOvUqHu
	xNNtAhpKqBfjjcLTg7qJ4HVtYY5CLEZ42l1OOq1C0a8C9bqocnpr8kDm+Ao4l0mtPZHOnNseqP6Kq
	hp/DRVW/1whjws9zDKBWQGH547cXGaleJdta4bTusIUjZDVLJJzh1PQ6ZjK65nTU3aGLk29hH9BdZ
	RXCNcHMwFRUSIdesHzg08qEghBzsE9aQKOmutEepBHGPMOCRt/20kazuUlfTxK6Mi14wbAFdRVxMk
	r8L1UAqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tePTs-0000000DIKS-1iet;
	Sun, 02 Feb 2025 02:13:04 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tePSW-0000000DIDv-1fKF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Feb 2025 02:11:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738462299;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jz0tT2FTFLvNvj61SDsLmOkHBQ46Tt26HSOtiuLa6z4=;
	b=H23Jm5ujEOUzkBudxrp/itOgH1M+i88osJbZm2lxJohj3o6J/KhDvBnjnzGFHccaSNkWbG
	VuXAzj4vSLyrDwatvxiga2U3Pnt7PgwBjh2MAs0UO3NTK9UAWaR/4o03sgmQYR8UfHwd4G
	ym4CnycWjGb+crvgSBdAO8iLe6jnnVQ=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-342-6GtuOFbrNbuN9oITw9zz3Q-1; Sat, 01 Feb 2025 21:11:36 -0500
X-MC-Unique: 6GtuOFbrNbuN9oITw9zz3Q-1
X-Mimecast-MFC-AGG-ID: 6GtuOFbrNbuN9oITw9zz3Q
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2166e907b5eso57125115ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Feb 2025 18:11:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738462295; x=1739067095;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jz0tT2FTFLvNvj61SDsLmOkHBQ46Tt26HSOtiuLa6z4=;
        b=XyOgmfF1b2hJ6jHvscuZ/Ig3MYAn6ll4cSLSAKuO3NA/QGBfH73WPgiMNmZSa5Q+J7
         A+KUhvxI6Ya1hJqk7ALe2Ug6iu/3IAPudoiV2VL0ZFrp9VDXtVrK8ChZ15fFi7uT0X0t
         njjFT7gc4pkTXFeeO2CWUsqdcoyVjQGpeXgkarXC+LbvZXOKcrLdFITBn/cPTzZDfXnd
         tlW042Oy1v81F2qVGgckY8EH6pzASaozMSzNPS5rXVet+U9ZaidYaYWEEKzhRzzkBTyB
         TyoDFolEnK72SzkQvf1UUMrNYPWz4W1MnKDCjUDSssDDyNIvdqIf7d8Myp+UXhAI29Xi
         +jUw==
X-Forwarded-Encrypted: i=1; AJvYcCXOt6zqhPSw9DsKBpI9l9dlyA2gHu9b+8Di4I3spbuD13FCZicj+pueroRdF4/PwREwhAztv0ohkwaevnjUFkUV@lists.infradead.org
X-Gm-Message-State: AOJu0YwDZyEbBgF+0XqW4UQL7IBN5dMvegm4PAv8UkqeQQL39IgsvSsS
	cheuWTFFubr125+ZOTWHqCPgsvFDIUx8yAU+5z2EMoMHLjCHkblTsf+tBLeI/DcnzBqOFgH2uwy
	nFdokOIbo0xK1Y/1m4Bld3LQCShIWhbXSkx6n+/e5XLwD9G1JrUj+K4SzHeMMvVvjdy6xQprV
X-Gm-Gg: ASbGncuY79O+4VjHZcIf/xEHqPNAzo2BRNwFuLXUDXxWXd82vVESufuQVqUthZANGWk
	OO0Gp2JLw20ru7uIsaEvr3RoEIKysDYXQoBI4EcgYgV4rEBchN9SQbs0BxBrqfAffN+dtTeVX4J
	Pe1WTpv8/mNYd6x3Ma3XNaIMXbZVeL5SJvqh7ntX3TyKjoEuyt3U+xHgzfXKFHOjdf4tjFgj4oG
	id14zKS3ErJ7bsdXL4iYQaN6V5HcLcrEaF+Pes6zEcjfFqZeDk4+o+3XUH09tMcuoX6btOVPaTp
	kc+MqA==
X-Received: by 2002:a17:902:ec90:b0:21c:15b3:e3a8 with SMTP id d9443c01a7336-21dd7db9401mr253960285ad.37.1738462295055;
        Sat, 01 Feb 2025 18:11:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEznBpra764QOyQOK6CFRr1iAthLIwu66BAhbI5avSF//jD31IMMeDXBhhitA9mMZwWv411Bw==
X-Received: by 2002:a17:902:ec90:b0:21c:15b3:e3a8 with SMTP id d9443c01a7336-21dd7db9401mr253959935ad.37.1738462294746;
        Sat, 01 Feb 2025 18:11:34 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21ee2bae0a5sm24864345ad.19.2025.02.01.18.11.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Feb 2025 18:11:34 -0800 (PST)
Message-ID: <8606c5b1-075e-43c8-a58e-bfd5b90f3dcb@redhat.com>
Date: Sun, 2 Feb 2025 12:11:26 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 24/43] KVM: arm64: WARN on injected undef exceptions
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
References: <20241212155610.76522-1-steven.price@arm.com>
 <20241212155610.76522-25-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20241212155610.76522-25-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KCbfYtT6YBwC8fxeAe28bN5IzXfKusKXgtbCvOfuhx0_1738462295
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250201_181140_563322_6C27947F 
X-CRM114-Status: GOOD (  14.34  )
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

On 12/13/24 1:55 AM, Steven Price wrote:
> The RMM doesn't allow injection of a undefined exception into a realm
> guest. Add a WARN to catch if this ever happens.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>   arch/arm64/kvm/inject_fault.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/kvm/inject_fault.c b/arch/arm64/kvm/inject_fault.c
> index 611867b81ac2..705463058ce0 100644
> --- a/arch/arm64/kvm/inject_fault.c
> +++ b/arch/arm64/kvm/inject_fault.c
> @@ -226,6 +226,8 @@ void kvm_inject_size_fault(struct kvm_vcpu *vcpu)
>    */
>   void kvm_inject_undefined(struct kvm_vcpu *vcpu)
>   {
> +	if (vcpu_is_rec(vcpu))
> +		WARN(1, "Cannot inject undefined exception into REC. Continuing with unknown behaviour");

May be more compact with:

	WARN(vcpu_is_rec(vcpu), "Unexpected undefined exception injection to REC");

>   	if (vcpu_el1_is_32bit(vcpu))
>   		inject_undef32(vcpu);
>   	else

Thanks,
Gavin


