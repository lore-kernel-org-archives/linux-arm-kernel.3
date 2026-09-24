Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1905DC98315
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 06:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0CUsutr5c/pwyjZUne1mfLzu7Ng+TMFz2fiafLg6SYM=; b=qkqeRu6SfgS+aj78bEW1RMUmNO
	C2tG7R4Fhv2+W30hOi6p4p9nDcXL4BtFe9UU/F0S82mK7PYtbvaIyWjMWcc0ytMZ4GAAuL1wyqnz3
	M1HcMoCbbM4Aleu12fDgN/taMZrDXZaQy8rIE0YbcLEIfijlUAt+c/YifjcjNokc8kvYM4vCVcbm3
	0G1wg9vpqWBsz+69PpfYyqg8ogxvHr6MKeJm1uw8Di1BC2p/MDgr3Bo1lJLX/nFYt8OC39eiFhe2Q
	tWLuXfeBljFxZ4fWHA6AR/LuKw5KbRBV5E8h6XMvxWOSHfQOASKCOFz2mFD7E/hrK25uiqRS5krI3
	jTsHv9pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ceZ-0000000A7Kw-3MWZ;
	Thu, 24 Sep 2026 06:09:55 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ceS-0000000A7Fd-21xQ
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Sep 2026 06:09:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=0CUsutr5c/pwyjZUne1mfLzu7Ng+TMFz2fiafLg6SYM=; b=GC6ARuZylpu8wk3TpBTDc5gYyj
	Nuo3pkhpxbmf0OSbO9gT0xIkszxYppLq3MvwESrrTnourDa5DuW1TqhNeu5xQ2Uu6eyI5AZdGLA+9
	ZwOPQr99XmI2gzbmWcNVPtt3mjdTP0lKQVevtUUCMFuX3eMU6mlppcKxr4wQayYlsTIJ2Wpn26Ded
	RE46J9T4xgNMW9PBsDcR9GliUdmcHKjJdIxzTb/GCR3bQtoNPRjOqtd/4BHDqrMsHCyOcSxHVpr4W
	+fhc1fwGmKhmcXU54eHUlp+Ykm91av7/ccynb4ud1wgKZbzpt8hijlOT1V7CxQw/JJmUhBMIyElhF
	78esxI6Q==;
Received: from out-74.mta1.migadu.com ([95.215.58.74] helo=mta1.migadu.com)
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ceP-0000000FcQH-3HWT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 06:09:47 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=0CUsutr5c/pwyjZUne1mfLzu7Ng+TMFz2fiafLg6SYM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790230184; v=1; x=1790834984;
 b=QURVaY2xY6P8T9m0TBJP5ApURQ/SjDguUjdhqdtWklhlhTF9kJQT2pTekIsg+otnB3Hd8bcx
 Ni9XcEy0RYhA0lFTnKKKqDFFYWX1NR8wll4ovDIOSLJ2KhCNSEGXN3zeTpNm8tGfyWMQJtMgD5a
 JUJAr5tiwzZ9cDuiFO3O9cxE=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 42cfa2c15692b942;
	Thu, 24 Sep 2026 06:09:44 +0000
X-Mizu-Trace-ID: 42cfa2c15692b942
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b778bdb5b8so3526e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 23:09:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzrUvtgpTw3CeR7H09+WEAn+jU/nt8RUI+IbKYvBpVZPohaGj7r7pON9wsMz/ZVQVYo+TO8+1alqc4nviP5WR04@lists.infradead.org
X-Gm-Message-State: AFuF++k+2evpiKMZtSdnKKcESiAdIUzaHnaug3juoFbHyD/t7MNg8f7l
	KumoGtO7iJVZCjjoxGuQOxLLx7DK+JVg1KEaBtl0SxpVw+OqhlLW8QlN1DjSBle0UlZQsyJSNoG
	xaelkln+k/XA9rOoQ+y+rWjILuG+vYYTQbIZkrFYp
X-Received: by 2002:a05:6512:3b28:b0:5b8:caec:cc77 with SMTP id
 2adb3069b0e04-5b8de5c4ceamr119554e87.7.1790230180648; Wed, 23 Sep 2026
 23:09:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260923-kvm-arm-prefault-v4-0-d4b0b4dfa8c3@kernel.org>
In-Reply-To: <20260923-kvm-arm-prefault-v4-0-d4b0b4dfa8c3@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 24 Sep 2026 07:09:04 +0100
X-Gmail-Original-Message-ID: <CA+EHjTw-OXzqXbs8phvXKpbR5UCx6munmFQni80eH6G4gD_k_w@mail.gmail.com>
X-Gm-Features: AclHuK_Ine4NnKUQcaZ0yB1SSKmzV1yVXJdk5G12ur315eMZsDY4KFVeV3Z9hpE
Message-ID: <CA+EHjTw-OXzqXbs8phvXKpbR5UCx6munmFQni80eH6G4gD_k_w@mail.gmail.com>
Subject: Re: [PATCH v4 00/14] KVM: arm64: Add KVM_PRE_FAULT_MEMORY support
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Mark Rutland <mark.rutland@arm.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, David Hildenbrand <david@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Jack Thomson <jackabt@amazon.com>, 
	Jack Thomson <jackabt.amazon@gmail.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Vincent Donnefort <vdonnefort@google.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Leo Soares Passos <Leo.Bras@arm.com>, Wei-Lin Chang <weilin.chang@arm.com>, linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_070945_897461_D363F715 
X-CRM114-Status: UNSURE (   9.98  )
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

Hi Lorenzo,

On Wed, 23 Sep 2026 16:15:43 +0100, "Lorenzo Stoakes (ARM)"
<ljs@kernel.org> wrote:
> This series implements the KVM stage 2 page table pre-faulting feature for
> arm64.

Retested as follows (let's see if this one sticks ;) ):

QEMU/arm64 -cpu max:
- guests boot on VHE, nVHE and protected-mode hosts, protected guests included
- pre_fault_memory_test (all guest modes, anonymous, THP, hugetlb and
shmem backing) and nv_pre_fault_memory_test pass
- pre-faulting an uninitialised vCPU returns -ENOEXEC
- a failed guest_memfd pre-fault leaves kvm_run's exit_reason alone
- dirty_log_test, demand_paging_test, mmu_stress_test and
stage2_block_transitions also pass

Apple M4 (nVHE, 4K and 16K pages):
- pre_fault_memory_test passes on the five guest modes available
there, with the same backings
- in protected mode (4K pages), the cap isn't advertised, the ioctl
returns -EOPNOTSUPP before and after vCPU init, and guests boot

Tested-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

