Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD42C55174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 16:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jrqhku8KyxeiISShmwJpJXHc7/raRYshoO3CpoShleo=; b=QEkbt2Zbvia0hgjSNFZjxaMdj1
	fp/gNZwf79PAKUL4Fa6lAb8orktU9QnNaiCIPzqlo1biTRbUWqntNVmoOW1oEqhR6jX2N4vK9C2W/
	fmoUBNRSLlG64ZoZIkwrc62QsQL/LDWdbBqn/5epq2yd0lA6H8pW3+cclhd2MlfXaEsJLpWiE0fIc
	dFTb+tXlpyS0iMCJsFjM9DH1YyUVkLn4w+nTh+fKbYOzaENQn70OGmhbGf16uzAXItRwkPzkYq4c1
	3RmxCw76inCUHaxWuDM8k5MOwNDJp2N3gsxFC791hy7bFzikgaEF299anWKEtQubLDAi9mEuJ2blY
	NcenULCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wreqQ-00000004IST-1uLU;
	Wed, 05 Aug 2026 16:51:54 +0000
Received: from mail-pf1-x445.google.com ([2607:f8b0:4864:20::445])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wreqN-00000004IS8-0Esc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 16:51:52 +0000
Received: by mail-pf1-x445.google.com with SMTP id d2e1a72fcca58-8487eb67173so1975197b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 09:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785948709; x=1786553509; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jrqhku8KyxeiISShmwJpJXHc7/raRYshoO3CpoShleo=;
        b=JXA1EDf05U0qzsTCiIH3+YlkHUqyhrEbBy4rqBy0Vz43EJwKm/JvyWtn/DWvgZyT8+
         hDMEn+HkszE+2MYOJtGD4Z9a+QWWyx03pmaBMb1KAVMmYP5q7HCzTK7Udx03e/LV7n/+
         L2RA59fY7iiWexvo52ta7K5jnPd1zncI/feFb1Efbw/g7baGOTIyyVYC1En/0cjrDX5R
         39nQYv643oB6bmJjn/NQusrWITw/f4I3zkPVZGA0qIVAd1GM/6T+k7ncqw1REDJSZReW
         mGMKyXrH4gaJq1aFt0vXGuS2GV5MpwK+Ryz2jN9ZDVTYQ6TWUWYyTnkDN2ZbInWkotPR
         hGIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785948709; x=1786553509;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jrqhku8KyxeiISShmwJpJXHc7/raRYshoO3CpoShleo=;
        b=VpOFgvk0QDrIsnvGzVtUifVUblsPcFKbDpPdMxspMoe6cxptv1D8n8FmDXSpmCuBIA
         MK8/jOQbuh3Suu7c7/nFCpWIx2CjjxQw7EOhnq1AvkEshlkJoHZ63NXrzLzOmxAT94hp
         O31g1bUjRCC3uS+9tPzG/k5plOhFA3k+ld5QX2gThIolofIpwCDS6UDf2QcCboJp0jlv
         l7pv6iS/lmNr8BYixbu34gif0GjTyBDRfj89IcEXB7Yicr7Ey06DMEUwzMlCS8htnKDg
         Kwmd2KYpGLXFDFwIJE0LHXN3VlWMt35JCd2pILAfMMWbWTlcbb6nW/guszOYn55lq/ew
         Vhxg==
X-Forwarded-Encrypted: i=1; AHgh+RqtOQ+c5K/fFrWmX5ZtIq192Cazx/oz/Rjxul2EJHe36TKcUxkBgodakID2rKwOb1O9YPrlWpJv7mPjGawXEni+@lists.infradead.org
X-Gm-Message-State: AOJu0YwTR85QLLF7e9ARKh3i6Mm4oOTGEMaIYL+RKbN0+FBLsLoO1RKh
	eX0nksOeovmCXRkIBzZdaEXlwcHn+6fhxu8mH23Tnbz7kmUlnlAzk3iaSXL6M53AEjFUqRGyd99
	c/TzS/A==
X-Received: from pghr18.prod.google.com ([2002:a63:e512:0:b0:c92:dd1e:dc3c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:99b:b0:848:76c4:fba9
 with SMTP id d2e1a72fcca58-84f2dff77c0mr8958464b3a.7.1785948708769; Wed, 05
 Aug 2026 09:51:48 -0700 (PDT)
Date: Wed,  5 Aug 2026 09:46:10 -0700
In-Reply-To: <20260731195612.2697986-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260731195612.2697986-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.571.g244d577d93-goog
Message-ID: <178594833919.3639358.12902044577496582719.b4-ty@google.com>
Subject: Re: [PATCH v3 00/12] KVM: selftests: Add more syscall wrappers, fix hardware_disable_test
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	David Hildenbrand <david@kernel.org>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_095151_100305_D4B5EF93 
X-CRM114-Status: GOOD (  13.11  )
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

On Fri, 31 Jul 2026 12:56:00 -0700, Sean Christopherson wrote:
> Third time's a charm.  Sorry for the spam.
> 
> Buried in the middle of this is a fix for the hardware_disable_test where
> it can end up with a runtime of multiple minutes when running a preemptible
> kernels on a large NUMA system.  Turns out my analysis/guess in v1 was wrong;
> the problem isn't direct CPU contention, it's that letting the workers do any
> amount of "real" work on any CPUs leads to pthread_create() slowdowns from
> the perspective of the caller.
> 
> [...]

Applied to kvm-x86 selftests2, thanks!

[01/12] KVM: selftests: Add a KVM syscall wrapper for sched_setaffinity()
        https://github.com/kvm-x86/linux/commit/f766bf3d0ac8
[02/12] KVM: selftests: Set threads CPU affinity before doing work in hardware disable test
        https://github.com/kvm-x86/linux/commit/2887da61c42d
[03/12] KVM: selftests: Pre-set threads affinity in hardware disable test when possible
        https://github.com/kvm-x86/linux/commit/496779b54943
[04/12] KVM: selftests: Return the target CPU from pin_task_to_random_cpu()
        https://github.com/kvm-x86/linux/commit/8de0e85f654e
[05/12] KVM: selftests: Extract picking of random CPU from cpu_set_t to separate API
        https://github.com/kvm-x86/linux/commit/d58cc7bbc5a0
[06/12] KVM: selftests: Affine threads to random CPUs in hardware disable test
        https://github.com/kvm-x86/linux/commit/563416ea9ae4
[07/12] KVM: selftests: Drop unreachable, dead code from hardware disable test
        https://github.com/kvm-x86/linux/commit/bb0e7d84c4be
[08/12] KVM: selftests: Add KVM syscall wrapper for pthread_create()
        https://github.com/kvm-x86/linux/commit/5171573ce7cb
[09/12] KVM: selftests: Add KVM syscall wrappers for pthread_{cancel,join}()
        https://github.com/kvm-x86/linux/commit/bc9143135bf3
[10/12] KVM: selftests: Add helper APIs to cancel+join pthreads
        https://github.com/kvm-x86/linux/commit/939b20e5f35e
[11/12] KVM: selftests: Add KVM syscall wrappers for pthread_{g,s}etaffinity_np()
        https://github.com/kvm-x86/linux/commit/83b5065f3e1c
[12/12] KVM: selftests: Clean up global constants in hardware disable test
        https://github.com/kvm-x86/linux/commit/1039496ae75d

--
https://github.com/kvm-x86/linux/tree/next

