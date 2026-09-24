Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFFD5C98310
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 06:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=juUSOnwlkNYEURPwBH0dBtUdlJ2MIx4/R5/ZuxbvLok=; b=JKX3hQUEkzgLiJtKMUYn9LuvDl
	PDX+2bkX4YEN6+I31WhUy3VpKOojS+MLIEe8hnjD2y+x/iD1fjnm3kkIQ3Rd70PUzpDRcfO0KAaVH
	9jKOvAY3E7R52kttcJGBwAAGwi+vPR8U25VrPPbLV1uJ7zg2e382RP9vr9Ub1cBr8XfJ/GapjSjOh
	YNbeeP60lO7NAu29KuOLquLqE4StOc1NJXYUDbgQaK9TNwGr/2ds+dDxIiCepdsIXy2xAUw5tQjKn
	xg3kx357hFQbsU3jGT3/B9xWHAYzvgD6glo6/PlUmeK3d8t9ufL/tEMrHOQKs9oQBICHm8ylsf4xj
	ZzNoM4Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9cdt-0000000A6vg-1UZH;
	Thu, 24 Sep 2026 06:09:13 +0000
Received: from out-226.mta1.migadu.com ([95.215.58.226] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9cdq-0000000A6sq-0egA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 06:09:12 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=RyyiC0ofM8CGzkXnRUfQTw+HLZ/pLb7WijiCtVOlmu0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790230146; v=1; x=1790834946;
 b=eNiVICVBRhgDhGI3qlXj9Y3GWayqaaU9almBvG7o6AUNROowSRoUi7Uz2t+VHW5JOCdV2jm7
 jK/xSmgErZIn8LFr9K5wNBdVNTCi8qadSBVzif6+MKseJOGz/E/yB87Gab3Jf5ryBrbBsQ8NyhK
 5e2zrO/2+OkKWX1WYs0NPWgQ=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 7838799f9abdb652;
	Thu, 24 Sep 2026 06:09:06 +0000
X-Mizu-Trace-ID: 7838799f9abdb652
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b8c42da963so6106e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 23:09:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw98wEdt4g6v12b4cCTI/6vZRwGlvOC+F7DZ5xCc+XoTJkFz0tqPrYIjtFrK5iBFmZxh75lp7uIlrMMMMUB3NKY@lists.infradead.org
X-Gm-Message-State: AFuF++nts1NcJd/VSDBd7Nl+y3/+eppLTKMu/z/5vgIzF3tWSR0xvx5a
	Q5vD0DsfSAk3ivCMyu5xHXY4iZ62rwR9GHWrlM99JUjQg202XjoTqVN9RZoj8a69VqSL3PCymlJ
	a7BR6KpBahBJMu4lEtrVRgPLeviW7FfM8fZKiqOWx
X-Received: by 2002:a05:6512:1358:b0:5b2:a967:c0e1 with SMTP id
 2adb3069b0e04-5b8dd6d2b18mr130595e87.0.1790230141441; Wed, 23 Sep 2026
 23:09:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260923-kvm-arm-prefault-v4-0-d4b0b4dfa8c3@kernel.org> <20260923-kvm-arm-prefault-v4-12-d4b0b4dfa8c3@kernel.org>
In-Reply-To: <20260923-kvm-arm-prefault-v4-12-d4b0b4dfa8c3@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 24 Sep 2026 07:08:25 +0100
X-Gmail-Original-Message-ID: <CA+EHjTxAah=pvuTqSYE0-jkXmgWJBrVD33nCThS4SNJN-kfNmw@mail.gmail.com>
X-Gm-Features: AclHuK_kb7tirLzxpH1tqzJpHCuAErXckpMiZSE-Wc4zTJclc5slHcBac4UN3_w
Message-ID: <CA+EHjTxAah=pvuTqSYE0-jkXmgWJBrVD33nCThS4SNJN-kfNmw@mail.gmail.com>
Subject: Re: [PATCH v4 12/14] KVM: selftests: Enable pre_fault_memory_test for arm64
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
X-CRM114-CacheID: sfid-20260923_230910_343645_EBED1067 
X-CRM114-Status: GOOD (  12.26  )
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

On Wed, 23 Sept 2026 at 16:18, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
>
> From: Jack Thomson <jackabt@amazon.com>
>
> Enable the pre_fault_memory_test to run on arm64 by making it work with
> different guest page sizes and testing multiple guest configurations.
>
> Add an assert on the exit reason, comparing against UCALL_EXIT_REASON so
> the check is portable, as arm64 exits with KVM_EXIT_MMIO while x86 uses
> KVM_EXIT_IO.
>
> Signed-off-by: Jack Thomson <jackabt@amazon.com>
> [ljs: merge conflict resolution with commit c847704619da ("KVM: selftests:
>  Fix pre_fault_memory_test to run on s390"), commit message accuracy fixup]
> Reviewed-by: Oliver Upton <oupton@kernel.org>
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

