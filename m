Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4807AC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 16:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XEVhtESHjA99969kja7lZkPq3yyhhnaBTAi7GUz4sRE=; b=L6XHkXSBbnQp6o4HCCk5q/RbOT
	DCKfWl7AlFc6nMMZ3eRdGvPrWUlWufj1hKfzLRmIAal9MEWgS3wmiRW4D1UiNMaYA4RFhS8NHs5AV
	0B80tLg+r5KwVHL59w4eEcsLJHvF46NsPC/cOvO+Si8Xu+3p7nxP+zDJDFvfJSZp0CKyhyKWo0Z9t
	wpWxTOe25/N8zrmbWzhsqx+FVVZsdJJLQbzjDbD/7Nw2YhRdzFk1RwloV5YRewCSVTcdqI4BP8TRt
	NGMe5KaMtW2eCOu4bSR0M1iE82heT4lkh4hOZ2XpNIXNn7lGgqMBGQdFOtCMl13fCPxDx1O/i7F0g
	cUst7vnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnKhV-00000004bdp-2X3L;
	Wed, 26 Feb 2025 16:56:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnKZn-00000004a29-0BnV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 16:48:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740588480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XEVhtESHjA99969kja7lZkPq3yyhhnaBTAi7GUz4sRE=;
	b=gqPOiSGru/tNVwfSBMco0KhA9gXo1QUC4sesNwDXyGhpYw3zAPw92xg/xq/S1MPZbzNhwr
	PVrt7LrX/Xz+8SVPQPqD3SLD8ZawRpvUJQU06xchbCRGC+cP52bov6MLfhnsJlr4dV7cLO
	nlDeYHdh4e5w1Hb/d+VcK9hbrOPNWCo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-311-ReIlRxPqPxGPMLCTyyi__w-1; Wed, 26 Feb 2025 11:47:57 -0500
X-MC-Unique: ReIlRxPqPxGPMLCTyyi__w-1
X-Mimecast-MFC-AGG-ID: ReIlRxPqPxGPMLCTyyi__w_1740588476
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-390df5962e1so222167f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 08:47:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740588476; x=1741193276;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XEVhtESHjA99969kja7lZkPq3yyhhnaBTAi7GUz4sRE=;
        b=MAokbj7XF5qI0gDfrBMxWEw6g0IeW7DoF/AqjINOu31kBnycDQ/Sq6lrX56guWdGeR
         S0NCX+e46kXV9AelouYf/PeIc/F4dIUsJPbBl4Af28hre3CFIBCVTYT6JCWON3WIFuJG
         q2Frr8SOZ9lELQxQFz3vwUwV+h3Nrkfc2of8Xja+yXNMNhdqAX7LfuZMEFiWG8VlxMPr
         q23RUeBCvUiYkXtj3P0MsNbHbeStZpwFhF8jZY/FQTs1C5pFgQUtUmdpQ1tqLxGKZ2jk
         RmVhG2jMqiVbRzpYFAVJW3YRKD3E8HZaBziWDGlVMazJ0guv7XfDKq8c0N3wMUnX4Jc2
         jviQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlaUgsVIccZZH14KVp7YcMZMXMdFZLRR/V7fuAfkVR/R07Su66sGvetSkfm8YwZzOfxfaz79svRMQILN5BjhrX@lists.infradead.org
X-Gm-Message-State: AOJu0YyVvO1+8x/O04gYJC/PcyzvTymmzel+2GpFbH31pqHiocZbHaeD
	AmeL7sU/hRbi4UXtT4DhN3fuv9wVFLr406eFiZQNVV68FgpBUDl0+b+E/5dkU8IlE/+BKLDc9X7
	JrG+cK0HJJ4AmfoDtB+wivTl8JDE2GDXaS3e8Cj5iUHRXBuj3er2si6ucPeMwC6oxJSXVc/oc
X-Gm-Gg: ASbGncuiOS4MZCDyIAWqBy/xBCX6Lq42DLe2l/FLbVR8h1Y8U2whGyz3dE21NkdGwCJ
	GD8zNZqpJ2Y1wyQBK0szX8mnIe8QhU+1KTgVkGO7D6lEJhvObBYgs398dvxuleiY7xh2EMxb3Jq
	sNKgl3qcf2hJMmUkLmslInMPKx6bmAIXon1nfQeJimeTfyXVDjthm7UoNaF/e53hkV9IcCdjF0d
	ui256mhkToV+QanKTVzG2JquVN3fu0LwQSyCCRT34FmLtDslxiNUDWn8S9OsW36qfjuzS+ssSQn
	ESHPjKtg0Q6QR55H9q8pRPHNBzxZKBcE/i7k9LLAD1VomdnCDBKa2kjxGtOawi3+
X-Received: by 2002:a05:6000:188f:b0:38d:b028:d906 with SMTP id ffacd0b85a97d-390e169981emr60090f8f.21.1740588476071;
        Wed, 26 Feb 2025 08:47:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF83oPTzqUwKLHnTkQQgBtRJWLQEt88A6Baykbj08FpuJXByuQdt6jO1meJ6Wj8oNqtztQbXA==
X-Received: by 2002:a05:6000:188f:b0:38d:b028:d906 with SMTP id ffacd0b85a97d-390e169981emr60059f8f.21.1740588475654;
        Wed, 26 Feb 2025 08:47:55 -0800 (PST)
Received: from rh (p200300f6af284000f9ca1328aeaacdd4.dip0.t-ipconnect.de. [2003:f6:af28:4000:f9ca:1328:aeaa:cdd4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd866b09sm6275665f8f.19.2025.02.26.08.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 08:47:55 -0800 (PST)
Date: Wed, 26 Feb 2025 17:47:53 +0100 (CET)
From: Sebastian Ott <sebott@redhat.com>
To: Oliver Upton <oliver.upton@linux.dev>
cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
    Suzuki K Poulose <suzuki.poulose@arm.com>, 
    Zenghui Yu <yuzenghui@huawei.com>, 
    Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
    Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>, 
    Cornelia Huck <cohuck@redhat.com>, Eric Auger <eric.auger@redhat.com>, 
    linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] KVM: arm64: writable MIDR/REVIDR
In-Reply-To: <Z7zxSdW5b6rqe2bt@linux.dev>
Message-ID: <b2b015de-569b-2cdd-8ec3-8c8690ff950b@redhat.com>
References: <20250218163443.32836-1-sebott@redhat.com> <Z7zxSdW5b6rqe2bt@linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: n8K-GXjoH2e1ykC8oob-Fsd3_263VYvmzN2dnw-i95A_1740588476
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_084803_153040_1A68A7FB 
X-CRM114-Status: GOOD (  20.74  )
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

On Mon, 24 Feb 2025, Oliver Upton wrote:
> On Tue, Feb 18, 2025 at 05:34:39PM +0100, Sebastian Ott wrote:
>> Based on prior discussion [1] this series allows VMMs to change
>> MIDR/REVIDR to enable migration between machines that differ in
>> these registers. Since these are used for errata handling the
>> errata management series [2] is a prerequisite for this one.
>>
>> changes for V3:
>> * handle VPIDR_EL2 as part of vcpu ctxt - thanks Oliver!
>
> Thanks for respinning. While your changes are looking good, as I got
> ready to apply this series I wound up peeling the onion a bit further
> and have a few more concerns:
>
> - Current KVM allows guests to read SMIDR_EL1 despite the fact that we
>   do not support SME (this is part of TID1 traps)
>
> - The "invariant" values that KVM presents to userspace originate from
>   the boot CPU, not the CPU that resets the ID registers for a VM
>
> - A VMM that wants to present big-little can do so on current KVM by
>   affining vCPUs, but cannot with this series
>
> All of this is to say, I think your series is going to collide with
> the pre-existing pile of crap we have. I'm going to pick up these
> changes and rework them so we can send a fix for #1 to stable trees and
> (hopefully) avoid breaking the old "invariant" behavior.
>
> I'll post what I have as soon as I test it, hopefully we can get this
> shaped up for 6.15.

Sry, for the additional work I've caused. I gave what you have in next a
spin and it looks good so far.
Thank you very much!

Sebastian


