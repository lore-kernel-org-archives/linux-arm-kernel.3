Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7630BD33998
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 17:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=amtNQuwco1BO2PnhLkDFqIyQgPKVg/vOsmaYbePwmG4=; b=uMH22GtKTxStTc3mzto58QUk51
	3Rv6FdqyirgkdTWwul9E5pEHk3DPPVahL6nRyT0m5WdE+AHqVOIRpzR9jarDDIvQb45NB950TEdvo
	So6VqQuc1yaPXaOOO/AycxzddMLzlki6R7ECdGYfQrQ/8h9UZUn0dQvSIrzjCkSlin+fj0kD7uLNN
	ffMLKgWNO5BG1agN8owwdCqrExsZ2gURe5w1z9dbzFumi+SrayI9cEJyezEOz/qn+BKEjHBWLo/OV
	DkLKBQm2JiqeUyMtXoeXIF244LA2lSsykUvSYodle8EgJFxi7jLoCgkljpA0TQfK6sTk1rg+hqOat
	CLkKT9bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRZgQ-00000009l8K-3WVU;
	Fri, 05 Dec 2025 17:33:30 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRZgN-00000009l7d-3Bo7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 17:33:29 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-42b32ff5d10so2254148f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Dec 2025 09:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764956005; x=1765560805; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=amtNQuwco1BO2PnhLkDFqIyQgPKVg/vOsmaYbePwmG4=;
        b=f3A5snYFiefT1TFobXu0JDFQqLmcKeaOIp6kD8pCArJf79AiGR3NREC+llKv3OGI3r
         nkPhgxlfl/CqnLendpb/3/8VqVH3yOdxaE44TjxuNRktD8YSpKFKZsdeybpDK4CThIUR
         LxhykA8C6MGiAlbhmFbbN2KV0MFgfKH/+GMa1MkE44UJ33HF3pJOpLc9dK+BH1Ybf4ec
         I78wp/t0eoD4uXJdagCgBYfYXhr1Bki3AHfCtgqF6nBZaraM0G71sgLAzC/2YZ8um0BU
         0m5MPtONj3SnLrDxnHDDFessOyhy/d5yJgOiW1XIS5MnqH6cGzVANqChK2l7CYpqx8oO
         WObw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764956005; x=1765560805;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=amtNQuwco1BO2PnhLkDFqIyQgPKVg/vOsmaYbePwmG4=;
        b=qRcSuHnylgquepxtMOQmS0xn4lQpehQM6Sljvunrr0Wq5Jw1bSp2mk9YIoiLC1J3Sx
         bn39JLK//4TUo4ZjHvx0ba66IJL4P09oWe/+HdCTTTdcKKe4WaPaqu0JP4YVlpyRDJCQ
         AzSMPzY8gqV4UDPp6335gwzkPxTRKhTCnDFP133reMb959wYj9WXgoNFeyzCHrIb7waH
         ZDG5l7AGtVm2lDNZz9T/gIbYhZNpViksDPUWQOsnO3/neXYrHZy2UOnI+1r5ZcH03gIL
         ugTbn4rArRBstVpplexFArOTuh0Z22w7zKjtq+MSt+IajJoNUb+ZV+yN5pATaD4Pi2j2
         U01g==
X-Forwarded-Encrypted: i=1; AJvYcCWnh1IpcMT6XAUzBrYfe6c2H1y/rxI+Gux3RC0ERek3V+TIpfFomJ0lDSrCioQVnUflwkqMJjghBmi3cvPvG13F@lists.infradead.org
X-Gm-Message-State: AOJu0YzmcO9hD590Kc9GuwSmFhTydjDvLfNCudyZSwlUExlMGpEGp0Hv
	vXqYMY+VCxgBw1+5WdqWGcQNQ2cCUuAjL5iO3N+2Ox38mRv9vw5MlcG/XEV6NbeBXA==
X-Gm-Gg: ASbGnctnMu+2Nd3MNGts49NhKxzZmC6kz8NyqzRumpXxbUOYdYBi/lTLHBIVflc6P51
	2Qx/R9IbhLNQ+FIzPL8VdbagfzO68LMOopCtVZCO3ZRxTshzvu75j2UgNjyuHo6skGs1bPaN+nj
	ZM1HhI2IJOV3fNJtn6fMzbkXZ9hKwPioYror56Qb1UrRQ/jBTO5sa/VYKbP//BjYw1roNWQ4ILr
	OGQG9MYrFNIpII2VHY6ZFGAsRvFM9xEVeVjZmdyAsJJ8G/DbjohCDBCSoG6tLz9QbgDE4hdmYcx
	rrTX0/18Zp7Fu+bvU+2xAdmdHqGo+f5tWhz0Uc4d3ZX1s9T9p8cc5HFu/1J3xi/FbtYsvSH0cT7
	/BIWtj6U/AhAAEzx37Xkc96V2ZcbZUr0cQ61wgqphlylsuf9jEwpxnry1c5mmH1zAJonn0dkyVr
	iMM09AiGAcF0rbqn6Tx6KhHHpHPj+sqYB6+xPckl0Ri6pOS0pd9Q==
X-Google-Smtp-Source: AGHT+IG7GHbywu/ls/wVemuOmr6xVx9MQPax08/Ei7Uq0ye9NoSzMgiNsTxCLJQTc1fcXLx9fTdYtw==
X-Received: by 2002:a5d:64e3:0:b0:429:cf03:8b2e with SMTP id ffacd0b85a97d-42f89ecee3fmr43760f8f.13.1764956004866;
        Fri, 05 Dec 2025 09:33:24 -0800 (PST)
Received: from google.com (120.54.38.34.bc.googleusercontent.com. [34.38.54.120])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d2226d0sm9793222f8f.21.2025.12.05.09.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 09:33:24 -0800 (PST)
Date: Fri, 5 Dec 2025 17:33:21 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Jack Thomson <jackabt.amazon@gmail.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, pbonzini@redhat.com,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, shuah@kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	isaku.yamahata@intel.com, xmarcalx@amazon.co.uk,
	kalyazin@amazon.co.uk, jackabt@amazon.com
Subject: Re: [PATCH v3 2/3] KVM: selftests: Enable pre_fault_memory_test for
 arm64
Message-ID: <aTMXYZgZM3QvZP2i@google.com>
References: <20251119154910.97716-1-jackabt.amazon@gmail.com>
 <20251119154910.97716-3-jackabt.amazon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119154910.97716-3-jackabt.amazon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_093327_818428_9E101A0F 
X-CRM114-Status: GOOD (  18.08  )
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

On Wed, Nov 19, 2025 at 03:49:09PM +0000, Jack Thomson wrote:
> From: Jack Thomson <jackabt@amazon.com>
> 
> Enable the pre_fault_memory_test to run on arm64 by making it work with
> different guest page sizes and testing multiple guest configurations.
> 
> Update the test_assert to compare against the UCALL_EXIT_REASON, for
> portability, as arm64 exits with KVM_EXIT_MMIO while x86 uses
> KVM_EXIT_IO.
> 
> Signed-off-by: Jack Thomson <jackabt@amazon.com>
> ---
>  tools/testing/selftests/kvm/Makefile.kvm      |  1 +
>  .../selftests/kvm/pre_fault_memory_test.c     | 78 ++++++++++++++-----
>  2 files changed, 58 insertions(+), 21 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
> index 148d427ff24b..0ddd8db60197 100644
> --- a/tools/testing/selftests/kvm/Makefile.kvm
> +++ b/tools/testing/selftests/kvm/Makefile.kvm
> @@ -183,6 +183,7 @@ TEST_GEN_PROGS_arm64 += memslot_perf_test
>  TEST_GEN_PROGS_arm64 += mmu_stress_test
>  TEST_GEN_PROGS_arm64 += rseq_test
>  TEST_GEN_PROGS_arm64 += steal_time
> +TEST_GEN_PROGS_arm64 += pre_fault_memory_test
>  
>  TEST_GEN_PROGS_s390 = $(TEST_GEN_PROGS_COMMON)
>  TEST_GEN_PROGS_s390 += s390/memop
> diff --git a/tools/testing/selftests/kvm/pre_fault_memory_test.c b/tools/testing/selftests/kvm/pre_fault_memory_test.c
> index f04768c1d2e4..674931e7bb3a 100644
> --- a/tools/testing/selftests/kvm/pre_fault_memory_test.c
> +++ b/tools/testing/selftests/kvm/pre_fault_memory_test.c
> @@ -11,19 +11,29 @@
>  #include <kvm_util.h>
>  #include <processor.h>
>  #include <pthread.h>
> +#include <guest_modes.h>
>  
>  /* Arbitrarily chosen values */
> -#define TEST_SIZE		(SZ_2M + PAGE_SIZE)
> -#define TEST_NPAGES		(TEST_SIZE / PAGE_SIZE)

After applying on top of the base commit
8a4821412cf2c1429fffa07c012dd150f2edf78c, it does not build.

That TEST_NPAGES seems to still be used in delete_slot_worker(). I believe
that's because of

  "KVM: selftests: Test prefault memory during concurrent memslot removal"

Related issues with the pre_fault_memory() prototype.

Is that the correct base-commit or shall I use something else?

> +#define TEST_BASE_SIZE		SZ_2M
>  #define TEST_SLOT		10
>

[...]

