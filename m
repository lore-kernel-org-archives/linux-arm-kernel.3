Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E0FDD59D7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 22:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=tBFcNzGChK01MBl7aRFxeqVQzmaQvoTyGJMrwZXP/1Q=; b=CT4YMpVDjoEhDW
	6yJPdjyNe0x/HxITspjHFfJRcgxyM7U1ovidWBRRDGfLFxnw9YfzLjD9ZXRt80drFPB1yL40vI5bc
	eY28kr3PvqybxugJMNosnAkDFo/CZ5OnQKfihfP5IvTqeRPBv1zTCHH+5j7HqUGARvuEucdLU+h3Y
	MaMCmIaiOrBSE7UwdUoahsulZAguwhHHbDEQYaBHAxe+IZDJkOa2DuPxcMWGlVxSaqQsAKPenwvFK
	jB8FmdeeXdtSDBfg/jVhrFc2kU5xJnnX1oUrtpAEbvLSnc9jYRf91sR9hqkZgXSKLBW4pMYX7tkOJ
	/S5ieckWsKf1+su4ZGQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUC6M-00000001C60-2oW8;
	Fri, 12 Dec 2025 22:59:07 +0000
Received: from mail-oa1-x4a.google.com ([2001:4860:4864:20::4a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUC6K-00000001C5f-2c5n
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 22:59:05 +0000
Received: by mail-oa1-x4a.google.com with SMTP id 586e51a60fabf-3f4bc7318aeso1370453fac.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Dec 2025 14:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765580343; x=1766185143; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tBFcNzGChK01MBl7aRFxeqVQzmaQvoTyGJMrwZXP/1Q=;
        b=x9Zx7dFWwwdn8O3V8CU1kUqocmDkRAk9w9KnkA4guo5vgCKJaO1qBkFdF9R2FvuZLY
         NuL833eCleTz3JptS65l9TDh1G8SANr1tQVH78sWoS99GIGpsGFYim33vYaN79m1xYhL
         b4+EukPCRks1bdp4D0+Kzv742V/9mrJrxPfl+TyDE1PQHQ/YQpsZK303H/gNsRkEaxoA
         HDIwMc0wvZ+8WC9zxcpN4HAE1dOTETVzf4iUp+lPjJuf0zLNFYT16aYuupZqP8dqYE+c
         cM/bnpE9AuIKppFmqPtRx2k5O68kpJtjNbz/scwUt3TXM9GHEDP7+NljJerHdwr3Fmdy
         UChg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765580343; x=1766185143;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tBFcNzGChK01MBl7aRFxeqVQzmaQvoTyGJMrwZXP/1Q=;
        b=FoKvUqligZyZSBOf/32IoBw5JXe+xNZ8HJYWV8djZE4Q01CDz8Knmz6LPgrA4egTPL
         z2JhLU01yX6eyfyLa6XTomXusTWyprHbOkT2HCmmMNcWeDvGcJfcT68NKEgHQOVimunt
         yubUfx1TIxHWLNEmwQgvalIzWPrUEwUoELwjjCFQpkGUPAtQ2RoubwPUtGF/1VVffbBu
         QKIyGmpsLv8AbhPrhm2ycKBlOnD3tYShPHymgmj/VXqYyK/go+Cl1MOEAj9WYIty8Zri
         AtOU7ZxzP3mA6HE11pe+aneHCUz5D6GOIoBPvDC7o2dtI/Yml2tgBZ597G0zoBZMdr6M
         u7pw==
X-Forwarded-Encrypted: i=1; AJvYcCX357YHobupTsMoRw3VXX8Ay5iMKaiK2gGJbkTl5TrrW/EaMl7z9EH3lwDHulhrZ9I7CFGoqRD628LIWU7XLjsR@lists.infradead.org
X-Gm-Message-State: AOJu0Yzyqb2AKyubfWONcsXvAkknqQ0WsPqpCAg6IxHZFaj73JrJ53lx
	lWofgDmD+HI03ohtuXlh9IJWU0EJM9BCqmcIL5h52FIF2WFgjgUvUrMWDjBMyxtv/QZTJSldu5C
	TSiwBQHlkfNuTk3jR0T6H9wS1Cg==
X-Google-Smtp-Source: AGHT+IErW9ttpylPAKTVb6sUEZwG4YGY35EKiSdiqsCWGntNWnLEEqDhx+071F1DfXt8IYeJCob+cCIIDVfcvHekjQ==
X-Received: from ilbbc25.prod.google.com ([2002:a05:6e02:99:b0:434:972f:bf92])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:1886:b0:65b:35a2:7a8b with SMTP id 006d021491bc7-65b4523911emr1339446eaf.82.1765580342788;
 Fri, 12 Dec 2025 14:59:02 -0800 (PST)
Date: Fri, 12 Dec 2025 22:59:01 +0000
In-Reply-To: <aTipeb2fAmUtSzzX@kernel.org> (message from Oliver Upton on Tue,
 9 Dec 2025 14:58:01 -0800)
Mime-Version: 1.0
Message-ID: <gsnt5xab2toq.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v5 22/24] KVM: arm64: Add KVM_CAP to partition the PMU
From: Colton Lewis <coltonlewis@google.com>
To: Oliver Upton <oupton@kernel.org>
Cc: kvm@vger.kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	maz@kernel.org, oliver.upton@linux.dev, mizhang@google.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, shuah@kernel.org, gankulkarni@os.amperecomputing.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_145904_692527_FA7C6C88 
X-CRM114-Status: GOOD (  16.95  )
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

Oliver Upton <oupton@kernel.org> writes:

> On Tue, Dec 09, 2025 at 08:51:19PM +0000, Colton Lewis wrote:
>> +
>> +7.245 KVM_CAP_ARM_PARTITION_PMU
>> +-------------------------------------
>> +

> Why can't this be a vCPU attribute similar to the other vPMU controls?
> Making the UAPI consistent will make it easier for userspace to reason
> about it.

I'm confused by the inconsistency of using a vCPU attribute for
something we want to affect the whole VM.

But I'll do a vCPU attribute if you want.

> Better yet, we could make the UAPI such that userspace selects a PMU
> implementation and the partitioned-ness of the PMU at the same time.

Sounds good.

>> @@ -132,6 +134,16 @@ int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
>>   		}
>>   		mutex_unlock(&kvm->lock);
>>   		break;
>> +	case KVM_CAP_ARM_PARTITION_PMU:
>> +		if (kvm->created_vcpus) {
>> +			r = -EBUSY;
>> +		} else if (!kvm_pmu_partition_ready()) {
>> +			r = -EPERM;
>> +		} else {
>> +			r = 0;
>> +			kvm_pmu_partition_enable(kvm, cap->args[0]);
>> +		}
>> +		break;
>>   	default:
>>   		break;
>>   	}
>> @@ -388,6 +400,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm,  
>> long ext)
>>   	case KVM_CAP_ARM_PMU_V3:
>>   		r = kvm_supports_guest_pmuv3();
>>   		break;
>> +	case KVM_CAP_ARM_PARTITION_PMU:
>> +		r = kvm_pmu_partition_ready();

> "ready" is very confusing in this context, as KVM will never be ready to
> support the feature on a system w/o the prerequisites.

That was a last minute addition. I'll change the name to something
better.

> Thanks,
> Oliver

