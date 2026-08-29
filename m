Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4180EC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Aug 2026 15:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b6+m4tu4i0f20O50he0vheKfE0yfKnPfYnT8gSQSc0g=; b=td+RUpSxvn7HnHLcxFy5WdjzIv
	Zl9NzsXOzQ9dGPLrHeU2MWAvGNMvHYqyw6H2EJO3ulNYSiPz+IdGYhAUdgDtJgTmOOMudcVDplT8f
	1bKN6uqH/7DqB4n8vsw4IBM9vv8DRhYuU6dzmYWD17GeOw1zzf8hd+bX70w0O7vqoCoqtfGeDxHqS
	QyTerCNDMIsQzg0G9KrKrvRJZ968j1VSccCFkuoDbriCEYK2vyf/3Bl/gLu0GW5aX6xQk5T8pwIJT
	8Jg84wQDUylLUw05FntuUFAM5v0vh+LNObFuePTit2j9CBvWeKc7e6nqPB/d36kSYsX/OmEOt54Sc
	iJOhRYbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0KcF-000000072sS-1jXx;
	Sat, 29 Aug 2026 15:05:07 +0000
Received: from out-135.mta1.migadu.com ([2001:41d0:203:375::87] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0KcC-000000072rW-2ZvF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Aug 2026 15:05:06 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=kwvpB2s4F2EzLbnFB1heuBDYWxBCbVtzb/X0O2S5ZOc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788015901; v=1; x=1788620701;
 b=SuZac4rpl7wsTyHk20onyyFyPkrlmN3Pklfv2HoxIR7ACDvebuRbw58JDwtCKmHcYIZn7UTY
 MVDQraPtZWXVelezy5FNad1e35vE5jztff2wdrfZLiVbt+x04pucBiiHtO/vBICpmyPbczsB+Qp
 UJOPwIuqwE9k/WYt4t3tDrIQ=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 3d506d638338c141;
	Sat, 29 Aug 2026 15:05:01 +0000
X-Mizu-Trace-ID: 3d506d638338c141
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b5e5aaf7deso4175e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Aug 2026 08:04:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwiW6Fj+EVuM+LNzScqqvxhiAMhvjXbDQq7r2PwbCB5VBptmH6vQvMPzJXZxqdTbeGle4Y3n+MV4vGsTToCt2vI@lists.infradead.org
X-Gm-Message-State: AFuF++mDNadUFMgJfbPDWoN7LslTNf9kFOaNiiWEE7h7hjCjrbhf3OdY
	a++Fz6rKtPsw0x2TTiY1M2d/YFesSSTTaF+d2hf3RgexwJyKBi6XTwNDBGmMB8Z4WsNGtO2l3+w
	5heq0gq2Bjpd5yu+yC26i7qO42k9hpeZ5fWcvKLus
X-Received: by 2002:a05:6512:2392:b0:5ae:b0ee:f737 with SMTP id
 2adb3069b0e04-5b5ef22d25dmr97393e87.9.1788015898930; Sat, 29 Aug 2026
 08:04:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260829054856.70549-1-kmehltretter@gmail.com> <20260829054856.70549-3-kmehltretter@gmail.com>
In-Reply-To: <20260829054856.70549-3-kmehltretter@gmail.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Sat, 29 Aug 2026 16:04:22 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzexMPUFJ_DuqAmKFP57UTd_nqGevWBqODDRi3tvg-YEA@mail.gmail.com>
X-Gm-Features: AcwNN1XqbhfaFCphLC-k_pbis2x4NMIEFS4Vcu3x3JJmr3Eq6xNmX3vLDUzikl0
Message-ID: <CA+EHjTzexMPUFJ_DuqAmKFP57UTd_nqGevWBqODDRi3tvg-YEA@mail.gmail.com>
Subject: Re: [PATCH 2/2] KVM: arm64: selftests: Test empty SMCCC filter range
 at base 0
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260829_080505_473490_3266A19E 
X-CRM114-Status: GOOD (  15.17  )
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

On Sat, 29 Aug 2026 at 06:50, Karl Mehltretter <kmehltretter@gmail.com> wrote:
>
> test_invalid_nr_functions() only checks an empty range at
> PSCI_0_2_FN64_CPU_ON, which KVM's end < start check happens to catch.
> It never exercised base 0, where the inclusive end wraps to U32_MAX
> instead.
>
> Add the base 0 case. Without the preceding fix it fails with EEXIST.
>
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Same nit as before.

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba < fuad.tabba@linux.dev>

Cheers,
/fuad

> ---
>  tools/testing/selftests/kvm/arm64/smccc_filter.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/tools/testing/selftests/kvm/arm64/smccc_filter.c b/tools/testing/selftests/kvm/arm64/smccc_filter.c
> index 21e41880261b..a41ed3e016ba 100644
> --- a/tools/testing/selftests/kvm/arm64/smccc_filter.c
> +++ b/tools/testing/selftests/kvm/arm64/smccc_filter.c
> @@ -140,6 +140,10 @@ static void test_invalid_nr_functions(void)
>         TEST_ASSERT(r < 0 && errno == EINVAL,
>                     "Attempt to filter 0 functions should return EINVAL");
>
> +       r = __set_smccc_filter(vm, 0, 0, KVM_SMCCC_FILTER_DENY);
> +       TEST_ASSERT(r < 0 && errno == EINVAL,
> +                   "Attempt to filter 0 functions at base 0 should return EINVAL");
> +
>         kvm_vm_free(vm);
>  }
>
> --
> 2.39.5 (Apple Git-154)
>

