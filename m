Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BCC1CFD313
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 15:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dhe14QqCiQiiyB/p8iyIjb6+UGtDhSJERPBSMqZWZ34=; b=iyOPtTt2DtaMPlub4aXp3/i6Ix
	GwDPHcSBEaa0v//0QZK/um5VSGbdBJxoddiWr9U6wK16BvPLINbriM4ijVOFzcCf+xp2tTBKSDIyf
	ZVx8w51/e81ow6uK/lqBjSZOaQ7HPgLSbE9RF6nugKoU0oZrrogW1oaKupmilU5033Ro5RhtbAufe
	8+nHQWLsBFBEAqKfa7lvTcU6eoSez9j22YmDR6jFsnl4GWDmPiJOH+ORgf4X8n6Dpufw26m/Utgfj
	7dLyxQr2Z38ySwqh4BmH+gihmLHTxBp3Hbh8KdcWvZP1W1wydrRkeJAeE6fLVY7uJVO4CDJ4n3Hxj
	ryYq/a0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNYne-0000000Bwcs-08Pc;
	Mon, 24 Nov 2025 15:48:22 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNYnc-0000000Bwc1-0765
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 15:48:21 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-78a6c7ac38fso47305367b3.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Nov 2025 07:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763999298; x=1764604098; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Dhe14QqCiQiiyB/p8iyIjb6+UGtDhSJERPBSMqZWZ34=;
        b=ZUWcCnVHuvfFEaf20FWDpsCL1n/sLX+TemJoMpdP1QilcfUcOZ0nBmkwsk1LTkBocR
         Iu1xGGxD0erVPaCaRK851BADyferNPjHCvGhH+GO/UolN2RvzMXlNXZzozMSRrgv1qBe
         ujjpk7LRJIgKeZxhZWvZZpeQoqWv9RibpsDqaU73GgwwBYExUQexYJZ73YxlKd8g9JGu
         Dizb4sQxEkYBJUoRzdmkcS/b1eSt7wb1QPtqi/PpzLRKVCW8q28y1MIvhD/Bf60eY2Kd
         AUNK07TsRl3zGxD8p5G/C/18kwEyawN7OHf0riz2bx+04JzZIQUObf8mmI98vqwtOgSj
         HFtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763999298; x=1764604098;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dhe14QqCiQiiyB/p8iyIjb6+UGtDhSJERPBSMqZWZ34=;
        b=Qir92RL4rnTJitjSVBglUr57mcaZxnJw/B54lqvSsBH5RCFw8FFkGfPsNAIGLk1Iio
         u9qIYj/OSjfI82JZ668ZuBwM1radv8uhzdJWWqQXblygOYkRtkBWxSUliIoQQlyz1sIx
         rIIPEWjZ3wTd47jPsyqOHr8CvWh+8KzUE+63Ac5krS87ZzWU9dPf4ZDnhnOJ9fj/5JP6
         NXM8QCMb8XB/7Uon1bgP6u7knAb4VHRmmuIpz0AFkP1rrBvnrWbUkPh94BdQQRh6Dlpi
         rlkBiqj6ZiQjkSIENcF7k1q/Uy7s9nSxquDdIvfb4zEsq3HsQP34OYgw0HWrjab2XhFb
         sApA==
X-Forwarded-Encrypted: i=1; AJvYcCXQnK3xwMdq7Eqsn8VPQTIYin+QJUwQuCnv3rbeOT40/FHDd/+bwbpK6vh442rrwv+V1rivYvDzJgyf7GacaOYL@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8uQQLdq3uD1a2sWxsWcg1cZq9qtUpD/oe2QObH+4b5vLdxfde
	fzKUwkSbz2k3JFK+hfMK02hXhfJLEQ0sgt4aRqJsmf3avhrqgg8qxBN/a/+M/SBKYyNIZo+EOrd
	AJUl+z5nuYImsAq7QzWB2apatLkP1BGXokNq6Uy/PxA==
X-Gm-Gg: ASbGncuFbrIyK06G8CGiQ2OlG8T/0L0Lq5oVoa3rJKxf9P6Jr9iz8Vvu6guE7tlfht6
	5ACDuSKYPzSnQ58K3+WqOCsxTBKN4CIpHF1whpLK94gEPkhUG2E3Sn+5oUbzdgL3eIWUhNaLSMh
	W/kGhe8yt0/S2CsBY8U5mIeg5B9+rR0laQpCiKL2N1M1pDK609Nus7jmHW/FMg1gYN2wmh9JR8f
	na1wEgXJPsUcy2UihzUjGDIr3cPeBIU53LNxTvVdRGhRYXEy8D78cXxwN4+Xth6DOyHivuJUjNB
	Yru4XoE=
X-Google-Smtp-Source: AGHT+IFXLeEni9mHEbFQTU/eUct/W0PzmxnSk74uTOG+KIQijx0uZ3p8CfFH9qpt1kJGYDocY45XWQwqsmbH09VD3mM=
X-Received: by 2002:a05:690e:18d:b0:63c:f5a7:40f with SMTP id
 956f58d0204a3-64302acb21dmr6404480d50.67.1763999298028; Mon, 24 Nov 2025
 07:48:18 -0800 (PST)
MIME-Version: 1.0
References: <20250902-kvm-arm64-sme-v8-0-2cb2199c656c@kernel.org> <20250902-kvm-arm64-sme-v8-11-2cb2199c656c@kernel.org>
In-Reply-To: <20250902-kvm-arm64-sme-v8-11-2cb2199c656c@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Nov 2025 15:48:06 +0000
X-Gm-Features: AWmQ_blKJPr9UiZ03PNJYKVppsgjz7HVl46QteqBVXyuwWp-raNgrqIbXILR-YA
Message-ID: <CAFEAcA_GJ7gzn7aMCZYxHnJWvx4tHSHBKsOxtQ7NTb4gPjkMJQ@mail.gmail.com>
Subject: Re: [PATCH v8 11/29] KVM: arm64: Document the KVM ABI for SME
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
	Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
	Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_074820_097207_91C235DD 
X-CRM114-Status: GOOD (  48.96  )
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

On Tue, 2 Sept 2025 at 12:45, Mark Brown <broonie@kernel.org> wrote:
>
> SME, the Scalable Matrix Extension, is an arm64 extension which adds
> support for matrix operations, with core concepts patterned after SVE.

Hi; apologies for not having got round to looking at this earlier.

I haven't actually tried writing any code that uses this proposed
ABI, but mostly it looks OK to me. I have a few nits below, but
my main concern is the bits of text that say (or seem to say --
maybe I'm misinterpreting them) that various parts of how userspace
accesses the guest state (e.g. the fp regs) depend on the current
state of the vcpu, rather than being only a function of how the
vcpu was configured. That seems to me like it's unnecessarily awkward.
(More detail below.)

> If SME is enabled for a guest without SVE then the FPSIMD Vn registers
> must be accessed via the low 128 bits of the SVE Zn registers as is the
> case when SVE is enabled. This is not ideal but allows access to SVCR and
> the registers in any order without duplication or ambiguity about which
> values should take effect. This may be an issue for VMMs that are
> unaware of SME on systems that implement it without SVE if they let SME
> be enabled, the lack of access to Vn may surprise them, but it seems
> like an unusual implementation choice.
>
> For SME unware VMMs on systems with both SVE and SME support the SVE
> registers may be larger than expected, this should be less disruptive
> than on a system without SVE as they will simply ignore the high bits of
> the registers.

I think that since enabling SME is something the VMM has to actively
do, it isn't a big deal that they also need to do something in the
fp or sve register access codepaths to handle SME. You can't get
SME by surprise (same as you can't get SVE by surprise).

> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  Documentation/virt/kvm/api.rst | 115 +++++++++++++++++++++++++++++------------
>  1 file changed, 81 insertions(+), 34 deletions(-)
>
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index 6aa40ee05a4a..94a22407a1d4 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -406,7 +406,7 @@ Errors:
>               instructions from device memory (arm64)
>    ENOSYS     data abort outside memslots with no syndrome info and
>               KVM_CAP_ARM_NISV_TO_USER not enabled (arm64)
> -  EPERM      SVE feature set but not finalized (arm64)
> +  EPERM      SVE or SME feature set but not finalized (arm64)
>    =======    ==============================================================
>
>  This ioctl is used to run a guest virtual cpu.  While there are no
> @@ -2601,11 +2601,11 @@ Specifically:
>  ======================= ========= ===== =======================================
>
>  .. [1] These encodings are not accepted for SVE-enabled vcpus.  See
> -       :ref:`KVM_ARM_VCPU_INIT`.
> +       :ref:`KVM_ARM_VCPU_INIT`.  They are also not accepted when SME is
> +       enabled without SVE and the vcpu is in streaming mode.

Does this mean that on an SME-no-SVE VM the VMM needs to know
if the vcpu is currently in streaming mode or not to determine
whether to read the FP registers as fp_regs or sve regs? That
seems unpleasant -- I was expecting this to be strictly a
matter of how the VM was configured (as it is with SVE).

>         The equivalent register content can be accessed via bits [127:0] of
> -       the corresponding SVE Zn registers instead for vcpus that have SVE
> -       enabled (see below).
> +       the corresponding SVE Zn registers in these cases (see below).
>
>  arm64 CCSIDR registers are demultiplexed by CSSELR value::
>
> @@ -2636,24 +2636,34 @@ arm64 SVE registers have the following bit patterns::
>    0x6050 0000 0015 060 <slice:5>        FFR bits[256*slice + 255 : 256*slice]
>    0x6060 0000 0015 ffff                 KVM_REG_ARM64_SVE_VLS pseudo-register
>
> -Access to register IDs where 2048 * slice >= 128 * max_vq will fail with
> -ENOENT.  max_vq is the vcpu's maximum supported vector length in 128-bit
> -quadwords: see [2]_ below.
> +arm64 SME registers have the following bit patterns:
> +
> +  0x6080 0000 0017 00 <n:5> <slice:5>   ZA.H[n] bits[2048*slice + 2047 : 2048*slice]
> +  0x60XX 0000 0017 0100                 ZT0

What's the XX here ?

> +  0x6060 0000 0017 fffe                 KVM_REG_ARM64_SME_VLS pseudo-register
> +
> +Access to Z, P or ZA register IDs where 2048 * slice >= 128 * max_vq
> +will fail with ENOENT.  max_vq is the vcpu's maximum supported vector
> +length in 128-bit quadwords: see [2]_ below.

What about FFR registers ? Is their ENOENT condition the same,
or different?

> +
> +Access to the ZA and ZT0 registers is only available if SVCR.ZA is set
> +to 1.
>
>  These registers are only accessible on vcpus for which SVE is enabled.
>  See KVM_ARM_VCPU_INIT for details.
>
> -In addition, except for KVM_REG_ARM64_SVE_VLS, these registers are not
> -accessible until the vcpu's SVE configuration has been finalized
> -using KVM_ARM_VCPU_FINALIZE(KVM_ARM_VCPU_SVE).  See KVM_ARM_VCPU_INIT
> -and KVM_ARM_VCPU_FINALIZE for more information about this procedure.
> +In addition, except for KVM_REG_ARM64_SVE_VLS and
> +KVM_REG_ARM64_SME_VLS, these registers are not accessible until the
> +vcpu's SVE and SME configuration has been finalized using
> +KVM_ARM_VCPU_FINALIZE(KVM_ARM_VCPU_VEC).  See KVM_ARM_VCPU_INIT and
> +KVM_ARM_VCPU_FINALIZE for more information about this procedure.
>
> -KVM_REG_ARM64_SVE_VLS is a pseudo-register that allows the set of vector
> -lengths supported by the vcpu to be discovered and configured by
> -userspace.  When transferred to or from user memory via KVM_GET_ONE_REG
> -or KVM_SET_ONE_REG, the value of this register is of type
> -__u64[KVM_ARM64_SVE_VLS_WORDS], and encodes the set of vector lengths as
> -follows::
> +KVM_REG_ARM64_SVE_VLS and KVM_ARM64_VCPU_SME_VLS are pseudo-registers
> +that allows the set of vector lengths supported by the vcpu to be
> +discovered and configured by userspace.  When transferred to or from
> +user memory via KVM_GET_ONE_REG or KVM_SET_ONE_REG, the value of this
> +register is of type __u64[KVM_ARM64_SVE_VLS_WORDS], and encodes the
> +set of vector lengths as follows::
>
>    __u64 vector_lengths[KVM_ARM64_SVE_VLS_WORDS];
>
> @@ -2665,19 +2675,25 @@ follows::
>         /* Vector length vq * 16 bytes not supported */
>
>  .. [2] The maximum value vq for which the above condition is true is
> -       max_vq.  This is the maximum vector length available to the guest on
> -       this vcpu, and determines which register slices are visible through
> -       this ioctl interface.
> +       max_vq.  This is the maximum vector length currently available to
> +       the guest on this vcpu, and determines which register slices are
> +       visible through this ioctl interface.
> +
> +       If SME is supported then the max_vq used for the Z and P registers
> +       while SVCR.SM is 1 this vector length will be the maximum SME
> +       vector length available for the guest, otherwise it will be the
> +       maximum SVE vector length available.

I can't figure out what this paragraph is trying to say, partly
because it seems like it might be missing some text between
"is 1" and "this vector length".

In any case, the "while SVCR.SM is 1" part seems odd -- I
don't think this ABI should care about the runtime vcpu state,
only what the vcpu's max vector lengths were configured as.
My expectation would be that the max_vq for VMM register
access would be the maximum of the SVE and SME vector lengths
configured for the vcpu.

thanks
-- PMM

