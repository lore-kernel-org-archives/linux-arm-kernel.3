Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBBB1C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 21:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=LccXvjPYPBUKmolpHX2IrRx+++KKrUgiEoyHX8qZbOw=; b=L2nZC77mvrYAmn
	3RDaVIYMr/NQthBFc5JfVLlH1jbNmIHqhgMIQHR17c27HF+vXsSn6EHqwL3mQh61q1eE5XRPJ2czk
	mZQympVSTUIeDEAqeraG7UwYXCz2rOD4QtbVXr084Z/CyyZOc1Z6kqr5dYaTRt6XfGQeyMY6rI5Lj
	uLQFLi6kyHBOu6F005e3fyn3/TTGVlN4Yv8EZaf9cP2WPrC9wAU4CcsFIzMX4lH37DnqRxjPRxGDr
	d/52fVHYMg89cLOfzhICy8jD0hkg1a6BRr5oyvkxaNEf2NJodGXOtd3Gl7qrMYPDF2E7wnPoTBBbl
	7Byzh8KvdfEJZNCmXA2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMZWE-0000000Buio-2qSJ;
	Tue, 03 Jun 2025 21:50:02 +0000
Received: from mail-ot1-x349.google.com ([2607:f8b0:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMZTE-0000000BuAC-27Ed
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 21:46:57 +0000
Received: by mail-ot1-x349.google.com with SMTP id 46e09a7af769-72c0050a956so4751369a34.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 14:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748987215; x=1749592015; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LccXvjPYPBUKmolpHX2IrRx+++KKrUgiEoyHX8qZbOw=;
        b=Z2aIW1ISXHB5EKQ4uGMKtZyEOdxk1/EFsTaiq52DntK/lq+c6sOkrGQyM0fLNDP9sX
         TJ4gUmaMeypML73uDDuj1WfHLcQMvg+3Y1kPfRdk2nmSZ3pQaPY6UqRiUvYEJ6g5Sn4I
         +iB/7eu9+rIEGsnOE1muYxMvbifnF2JOdpeQlrNBwJbZ869SZzIy2G0w9NYQZMWfv0Qu
         cTJfpPBspc0p6gRFc+ee01KAXpGZO4CyuJ+7o6pftVKqYJsWOtERYt0QKITrOI6mwn4U
         Rg3k2BW89yN4ZW4aP9wS8p0DH9TUHeKXehMyzNuJi38gBbgRxBAE/AnwsOp4VDJRrenW
         IBvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748987215; x=1749592015;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LccXvjPYPBUKmolpHX2IrRx+++KKrUgiEoyHX8qZbOw=;
        b=NuTGOznzvyNwEdqFP9xgFhmaWVC5j/YVpdI8BU3wyeWMJ7l1EmeK1So4tFFUuSoGec
         29kY6EZ7RT3Z8GIgBnCh/7nuyviUjTLQPHfelFB3Ix+0Sdf1A4nP5U3rOD/3cEePKK2D
         mIdsGqubTknWPq7GTXQA27qcB5LjLWmmb5U0L/6ony6IWo0OVM8/MNP9q8UO86sDABXl
         +lWFYhmaah/iUjobBOSDc82F7nXLpPC9yxisD421yVLxVe4o4sKUF50ImUM/nwezRL8e
         8GIe7Byn8nxk9I4j81Fur5Pdbnf894E/BoXWRe/o6MYieswbgxDjYu1H2wKmlmajJnWS
         hOxg==
X-Forwarded-Encrypted: i=1; AJvYcCUAn8A3RaHPdgRWfzAjxAHNR8JuQT4mMnosTBFPRUGzSfFg7B2fEPxS2obtTNtgLkeu6/Jbazpd37GE7j9F3zJq@lists.infradead.org
X-Gm-Message-State: AOJu0YwH4WB6ik4Itfj2PZSNYS7D207AOmB3aGoLdaV+5q97YerNxkWu
	LK4vACejmuxX79RID/TNGyejlJigeraDod/6wTT2lDV1vdFtupJRgMkEdf6VI9i3Ts2/CdZJD4f
	/9RDy/l4yIxFiWtUxBGKbLrdv6g==
X-Google-Smtp-Source: AGHT+IGVKt5ILqjSdW8OtKLqE/y3WeywMj3vX4/DzsQoxvrjy7RrNHS3PkxJz64AV7HAzQffHQulShSVI5b7iylTEA==
X-Received: from oobdi8.prod.google.com ([2002:a05:6820:1e88:b0:60f:868:60e1])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6830:4882:b0:735:ebf8:b241 with SMTP id 46e09a7af769-73869d7c158mr529938a34.14.1748987214770;
 Tue, 03 Jun 2025 14:46:54 -0700 (PDT)
Date: Tue, 03 Jun 2025 21:46:54 +0000
In-Reply-To: <aD4oS1_tnMPlgDJ6@linux.dev> (message from Oliver Upton on Mon, 2
 Jun 2025 15:40:11 -0700)
Mime-Version: 1.0
Message-ID: <gsnt1ps033ch.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH 16/17] KVM: arm64: Add ioctl to partition the PMU when supported
From: Colton Lewis <coltonlewis@google.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: kvm@vger.kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, mark.rutland@arm.com, shuah@kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_144656_545543_B19346CC 
X-CRM114-Status: GOOD (  16.34  )
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

Oliver Upton <oliver.upton@linux.dev> writes:

> On Mon, Jun 02, 2025 at 07:27:01PM +0000, Colton Lewis wrote:
>> +	case KVM_ARM_PARTITION_PMU: {

> This should be a vCPU attribute similar to the other PMUv3 controls we
> already have. Ideally a single attribute where userspace tells us it
> wants paritioning and specifies the PMU ID to use. None of this can be
> changed after INIT'ing the PMU.

Okay

>> +		struct arm_pmu *pmu;
>> +		u8 host_counters;
>> +
>> +		if (unlikely(!kvm_vcpu_initialized(vcpu)))
>> +			return -ENOEXEC;
>> +
>> +		if (!kvm_pmu_partition_supported())
>> +			return -EPERM;
>> +
>> +		if (copy_from_user(&host_counters, argp, sizeof(host_counters)))
>> +			return -EFAULT;
>> +
>> +		pmu = vcpu->kvm->arch.arm_pmu;
>> +		return kvm_pmu_partition(pmu, host_counters);

> Yeah, we really can't be changing the counters available to the ARM PMU
> driver at this point. What happens to host events already scheduled on
> the CPU?

Okay. I remember talking about this before.

> Either the partition of host / KVM-owned counters needs to be computed
> up front (prior to scheduling events) or KVM needs a way to direct perf
> to reschedule events on the PMU based on the new operating constraints.

Yes. I will think about it.

