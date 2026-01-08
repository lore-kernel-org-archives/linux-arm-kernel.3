Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D378ACF6A81
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 14:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bYto/95PAr5gdcAcFK+iKyUSkfGbLtjfHkyX3NOOQHk=; b=yb8RLmdscZxvhEuz0q6CTrApph
	EaSMQAZvYfDcBKFompo9CPXCNA2POEpQYBJ94YqcMfmiQcAAbiGbL3ka7+RoBBjYUhFqXznbxJuwW
	I2AoYLri+sPhNcbZSJXmER4rVObdNipGbZ5xdaKL6nMICoukDZt2P7j0c7ws6dE4WazEXmCCvcQD/
	kUXxoTNvdf1bFNJtC1OsuwkfsbI8mYdNDMK6mFhnjBJlQnPpzildNlNYRcFMdOv5dzHPJc2XUqYQz
	WV7x3LSdL40Yi3WNqo8sgWFk1tmtsqcQTQPCfeSQbqo7a2oskUtDgYa+drCkAHuE190GXklCJJAjk
	J28Zaygw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdqis-0000000HHRs-27FT;
	Thu, 08 Jan 2026 14:10:46 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdqin-0000000HHOa-1PzW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 14:10:44 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-4edb8d6e98aso1158451cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 06:10:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767881440; cv=none;
        d=google.com; s=arc-20240605;
        b=doB7KurNa7cfB3De7b28mjX67s8JB1kf9AOXKS8ETPtH0Ox2MABWlFl83fu7un9CE5
         4i3jSOj7q5ekorkL96OSu8YU90J4tDg3KWeJzYuEYadbA2AFt6B3z4hMe1pBqn6wqvYK
         xoOmlyP9v45l6IgbyMv573zroiZaJoRtk1KoxUZpoA1Tj99g4n3wHK4I82W6QLQ+45CC
         XKTpG9C+0wecvkThQuIUO9lKfzUcmiQDa0T5bqd/YWcLE2BUcoTMbetEO4BwkXRn2OBh
         MliFSTj/igoXNeX4cc4KCgWdfrN52MTxwQBKAwHGg3gwrKqo2iwGWaGgw7BSxYqYhucP
         lcFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bYto/95PAr5gdcAcFK+iKyUSkfGbLtjfHkyX3NOOQHk=;
        fh=13DoD/tD1CrrAoTTjfCuw5/QGu+8x44nGebK8utfcmg=;
        b=GzIKbjrzGkRL6S3W6M2Ysk3C/i5w7Q6WVGHYNo2Wo3pKxhaOrUdUcAaI5ualZ/fA3R
         4gkmmGY5tifI1J0RM1nWHG/Etj33ixo19rk6QnEyJMa9zZy7hhd/gAEGH5lpbruwIxhY
         RtE9xvHWBi2BdmrTMkU/MwDWH1INOGDsnawYpyVxLwt+CE+SRsUunrB/YTK+zxQJx4gM
         ARwg4N/8tEC+eAvnapH2FIDSz/ZUFWfl2vY2qNO6T2GTS126umHuSaPDwoyUgxoLOi39
         vnqyjAq6lCmV7GvpXou4RcLPJV2yRYA2xv23Q2U+qj3ugS3YCwoTPQYg/Ce7hewmivNh
         +jpg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767881440; x=1768486240; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bYto/95PAr5gdcAcFK+iKyUSkfGbLtjfHkyX3NOOQHk=;
        b=eF82K6SPFOt5Isf8d8mOJf5tgo7vmbjSDaCMYjJIziwgagtqLUHTHCzD4yvYYOUefh
         Aa7EHDcN9Fqt3svWRYwYXbGEHejAAEhZClFVkSuK8jLTiCYdi2GTQJFE5Tpm9ZqWJs5x
         LiLJ+EGI4Q7bW+rDaxrWckXW7P4CLbevy0xIUayAYveIA8IXdM6sd5ISN68TPHGhGaC9
         uQhypSnkPvNNx9ZHFaC3GhDVyA73KXGo6f1ZvvpO9KsCb2KsbVejY4AMMLPx5hNKZ9uh
         IAk/DvSFsNtAXb65HsOguL4r/rS3tuzpXVyXGPJ3kYPuYHvPKmPPUNbZo3YApPkpdBY5
         UQWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767881440; x=1768486240;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bYto/95PAr5gdcAcFK+iKyUSkfGbLtjfHkyX3NOOQHk=;
        b=a1IWlW2cFKS8iwX6hGvojKz2C9Ij+wB8H8vZZ/F5zDWmeaY12LaGCSj4lDWR+EmBmM
         bFajL9zLfYfz0sfeK3vNcMW3Iebz5ZcPbffZ5zjxvhMDIXXS0cJQIDzkICFNl0r1j77j
         DEtcV73bKlr5KYbXk7CKsvhnok/FKZU+Hd9MuxGF6DWaMRpSVRzpX5JIRS4EblJ2dK/A
         UbSeUNgW9Bi3sggUw6KaoITXJPvt42neWDaHfoH3Qg6Gn/PnlqsfMCHMZXtbSCDQhk7l
         VlDW2jjaMZ65IVtp9Bft+oMSYDme3kd6n8ZA/YaaLsN1k4y34XLuU3ezggJEUEy9noX7
         KERw==
X-Forwarded-Encrypted: i=1; AJvYcCXMoIzm1xLFOf0NuA2jYJsUWMJyz8mVSYDuzt6LwLBASCjtvxbaXSpxc01g7uf9QdnilaG2efqVYeXDMLPmKlds@lists.infradead.org
X-Gm-Message-State: AOJu0YwNe4g1XKc3K2Wvwm3QbLIC5e2uX7Jmm0vq2KTPg56IpKFbO+o9
	9PonGabyVB+F29uUe9l10KQ/5YrWKc/UyW46VzmaHzJNM3v+72biws0JBTw4mRFo/L4hFEjLqD8
	0rgP2fwOJAvhUZR1eDYTz1cfdPQz0xYIGZ9aUu8qX
X-Gm-Gg: AY/fxX4b7mJw7Gp2LZbu3tROkUo0cEeWd85ovef0J+uVPUssnhyP6qf06XzXeGIWpXu
	wEuHWX+VEmJ3OzG8wWroP+B6ZzB/RC7juL+FiM1RlAmaJ//Oae2Fo//h/ntFI6UDY1ApKr8F2gW
	vwYu/Wy3GKewa5RNRwLaByf9U8cpXuhTlrTnu2NhEQfs/wl0Lgs3mwGZWnSa0nzKKAelNXg9oIW
	yuUQyahXqvDfDeWtjM0/8PpWr9vKtCl3b1jI+bNJZNWfjhQt4+gLPIJPhEFCegoPwa1I4Fn
X-Received: by 2002:ac8:57cb:0:b0:4ff:a98b:7fd3 with SMTP id
 d75a77b69052e-4ffc091f255mr8431011cf.2.1767881439463; Thu, 08 Jan 2026
 06:10:39 -0800 (PST)
MIME-Version: 1.0
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org> <20251223-kvm-arm64-sme-v9-10-8be3867cb883@kernel.org>
In-Reply-To: <20251223-kvm-arm64-sme-v9-10-8be3867cb883@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 8 Jan 2026 14:10:02 +0000
X-Gm-Features: AQt7F2qsebDUu0B_2G-HsVQbz5HiOT-Zx5BHQ2lphbkAHqCchx69wBlkCSdT4l4
Message-ID: <CA+EHjTyww-PoswXx4ufJozX=eP-Q+8OahiH7XO99HsKcjO1O9A@mail.gmail.com>
Subject: Re: [PATCH v9 10/30] KVM: arm64: Document the KVM ABI for SME
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, Dave Martin <Dave.Martin@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>, 
	Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_061043_456094_7F005034 
X-CRM114-Status: GOOD (  53.45  )
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

On Tue, 23 Dec 2025 at 01:22, Mark Brown <broonie@kernel.org> wrote:
>
> SME, the Scalable Matrix Extension, is an arm64 extension which adds
> support for matrix operations, with core concepts patterned after SVE.
>
> SVE introduced some complication in the ABI since it adds new vector
> floating point registers with runtime configurable size, the size being
> controlled by a parameter called the vector length (VL). To provide control
> of this to VMMs we offer two phase configuration of SVE, SVE must first be
> enabled for the vCPU with KVM_ARM_VCPU_INIT(KVM_ARM_VCPU_SVE), after which
> vector length may then be configured but the configurably sized floating
> point registers are inaccessible until finalized with a call to
> KVM_ARM_VCPU_FINALIZE(KVM_ARM_VCPU_SVE) after which the configurably sized
> registers can be accessed.

s/configurably/configurable

>
> SME introduces an additional independent configurable vector length
> which as well as controlling the size of the new ZA register also
> provides an alternative view of the configurably sized SVE registers
> (known as streaming mode) with the guest able to switch between the two
> modes as it pleases.  There is also a fixed sized register ZT0
> introduced in SME2. As well as streaming mode the guest may enable and
> disable ZA and (where SME2 is available) ZT0 dynamically independently
> of streaming mode. These modes are controlled via the system register
> SVCR.
>
> We handle the configuration of the vector length for SME in a similar
> manner to SVE, requiring initialization and finalization of the feature
> with a pseudo register controlling the available SME vector lengths as for
> SVE. Further, if the guest has both SVE and SME then finalizing one
> prevents further configuration of the vector length for the other.
>
> Where both SVE and SME are configured for the guest we always present
> the SVE registers to userspace as having the larger of the configured
> maximum SVE and SME vector lengths, discarding extra data at load time

Looking at the code with the whole patch series applied, I don't think
this is correct, rather, it depends on the active vector length. That
said, it's not what the documentation below says, so it's only an
issue in the commit message.

> and zero padding on read as required if the active vector length is
> lower. Note that this means that enabling or disabling streaming mode
> while the guest is stopped will not zero Zn or Pn as it will when the
> guest is running, but it does allow SVCR, Zn and Pn to be read and
> written in any order.
>
> Userspace access to ZA and (if configured) ZT0 is always available, they
> will be zeroed when the guest runs if disabled in SVCR and the value
> read will be zero if the guest stops with them disabled. This mirrors
> the behaviour of the architecture, enabling access causes ZA and ZT0 to
> be zeroed, while allowing access to SVCR, ZA and ZT0 to be performed in
> any order.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  Documentation/virt/kvm/api.rst | 120 +++++++++++++++++++++++++++++------------
>  1 file changed, 86 insertions(+), 34 deletions(-)
>
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index 01a3abef8abb..e024b9783932 100644
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
> @@ -2606,11 +2606,11 @@ Specifically:
>  ======================= ========= ===== =======================================
>
>  .. [1] These encodings are not accepted for SVE-enabled vcpus.  See
> -       :ref:`KVM_ARM_VCPU_INIT`.
> +       :ref:`KVM_ARM_VCPU_INIT`.  They are also not accepted when SME is
> +       enabled without SVE and the vcpu is in streaming mode.
>
>         The equivalent register content can be accessed via bits [127:0] of
> -       the corresponding SVE Zn registers instead for vcpus that have SVE
> -       enabled (see below).
> +       the corresponding SVE Zn registers in these cases (see below).
>
>  arm64 CCSIDR registers are demultiplexed by CSSELR value::
>
> @@ -2641,24 +2641,39 @@ arm64 SVE registers have the following bit patterns::
>    0x6050 0000 0015 060 <slice:5>        FFR bits[256*slice + 255 : 256*slice]
>    0x6060 0000 0015 ffff                 KVM_REG_ARM64_SVE_VLS pseudo-register
>
> -Access to register IDs where 2048 * slice >= 128 * max_vq will fail with
> -ENOENT.  max_vq is the vcpu's maximum supported vector length in 128-bit
> -quadwords: see [2]_ below.
> +arm64 SME registers have the following bit patterns:
> +
> +  0x6080 0000 0017 00 <n:5> <slice:5>   ZA.H[n] bits[2048*slice + 2047 : 2048*slice]
> +  0x6060 0000 0017 0100                 ZT0
> +  0x6060 0000 0017 fffe                 KVM_REG_ARM64_SME_VLS pseudo-register
> +
> +Access to Z, P, FFR or ZA register IDs where 2048 * slice >= 128 *
> +max_vq will fail with ENOENT.  max_vq is the vcpu's current maximum
> +supported vector length in 128-bit quadwords: see [2]_ below.
> +
> +Changing the value of SVCR.SM will result in the contents of
> +the Z, P and FFR registers being reset to 0.  When restoring the
> +values of these registers for a VM with SME support it is
> +important that SVCR.SM be configured first.
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

KVM_ARM64_VCPU_SME_VLS -> KVM_REG_ARM64_SME_VLS

With this and the commit message fixed:
Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad


> +that allows the set of vector lengths supported by the vcpu to be
> +discovered and configured by userspace.  When transferred to or from
> +user memory via KVM_GET_ONE_REG or KVM_SET_ONE_REG, the value of this
> +register is of type __u64[KVM_ARM64_SVE_VLS_WORDS], and encodes the
> +set of vector lengths as follows::
>
>    __u64 vector_lengths[KVM_ARM64_SVE_VLS_WORDS];
>
> @@ -2670,19 +2685,25 @@ follows::
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
> +       vector length max_vq_sme available for the guest, otherwise it
> +       will be the maximum SVE vector length max_vq_sve available.
>
>  (See Documentation/arch/arm64/sve.rst for an explanation of the "vq"
>  nomenclature.)
>
> -KVM_REG_ARM64_SVE_VLS is only accessible after KVM_ARM_VCPU_INIT.
> -KVM_ARM_VCPU_INIT initialises it to the best set of vector lengths that
> -the host supports.
> +KVM_REG_ARM64_SVE_VLS and KVM_REG_ARM_SME_VLS are only accessible
> +after KVM_ARM_VCPU_INIT.  KVM_ARM_VCPU_INIT initialises them to the
> +best set of vector lengths that the host supports.
>
> -Userspace may subsequently modify it if desired until the vcpu's SVE
> -configuration is finalized using KVM_ARM_VCPU_FINALIZE(KVM_ARM_VCPU_SVE).
> +Userspace may subsequently modify these registers if desired until the
> +vcpu's SVE and SME configuration is finalized using
> +KVM_ARM_VCPU_FINALIZE(KVM_ARM_VCPU_VEC).
>
>  Apart from simply removing all vector lengths from the host set that
>  exceed some value, support for arbitrarily chosen sets of vector lengths
> @@ -2690,8 +2711,8 @@ is hardware-dependent and may not be available.  Attempting to configure
>  an invalid set of vector lengths via KVM_SET_ONE_REG will fail with
>  EINVAL.
>
> -After the vcpu's SVE configuration is finalized, further attempts to
> -write this register will fail with EPERM.
> +After the vcpu's SVE or SME configuration is finalized, further
> +attempts to write these registers will fail with EPERM.
>
>  arm64 bitmap feature firmware pseudo-registers have the following bit pattern::
>
> @@ -3490,6 +3511,7 @@ The initial values are defined as:
>         - General Purpose registers, including PC and SP: set to 0
>         - FPSIMD/NEON registers: set to 0
>         - SVE registers: set to 0
> +       - SME registers: set to 0
>         - System registers: Reset to their architecturally defined
>           values as for a warm reset to EL1 (resp. SVC) or EL2 (in the
>           case of EL2 being enabled).
> @@ -3533,7 +3555,7 @@ Possible features:
>
>         - KVM_ARM_VCPU_SVE: Enables SVE for the CPU (arm64 only).
>           Depends on KVM_CAP_ARM_SVE.
> -         Requires KVM_ARM_VCPU_FINALIZE(KVM_ARM_VCPU_SVE):
> +         Requires KVM_ARM_VCPU_FINALIZE(KVM_ARM_VCPU_VEC):
>
>            * After KVM_ARM_VCPU_INIT:
>
> @@ -3541,7 +3563,7 @@ Possible features:
>                 initial value of this pseudo-register indicates the best set of
>                 vector lengths possible for a vcpu on this host.
>
> -          * Before KVM_ARM_VCPU_FINALIZE(KVM_ARM_VCPU_SVE):
> +          * Before KVM_ARM_VCPU_FINALIZE(KVM_ARM_VCPU_VEC):
>
>               - KVM_RUN and KVM_GET_REG_LIST are not available;
>
> @@ -3554,11 +3576,40 @@ Possible features:
>                 KVM_SET_ONE_REG, to modify the set of vector lengths available
>                 for the vcpu.
>
> -          * After KVM_ARM_VCPU_FINALIZE(KVM_ARM_VCPU_SVE):
> +          * After KVM_ARM_VCPU_FINALIZE(KVM_ARM_VCPU_VEC):
>
>               - the KVM_REG_ARM64_SVE_VLS pseudo-register is immutable, and can
>                 no longer be written using KVM_SET_ONE_REG.
>
> +       - KVM_ARM_VCPU_SME: Enables SME for the CPU (arm64 only).
> +         Depends on KVM_CAP_ARM_SME.
> +         Requires KVM_ARM_VCPU_FINALIZE(KVM_ARM_VCPU_VEC):
> +
> +          * After KVM_ARM_VCPU_INIT:
> +
> +             - KVM_REG_ARM64_SME_VLS may be read using KVM_GET_ONE_REG: the
> +               initial value of this pseudo-register indicates the best set of
> +               vector lengths possible for a vcpu on this host.
> +
> +          * Before KVM_ARM_VCPU_FINALIZE(KVM_ARM_VCPU_VEC):
> +
> +             - KVM_RUN and KVM_GET_REG_LIST are not available;
> +
> +             - KVM_GET_ONE_REG and KVM_SET_ONE_REG cannot be used to access
> +               the scalable architectural SVE registers
> +               KVM_REG_ARM64_SVE_ZREG(), KVM_REG_ARM64_SVE_PREG() or
> +               KVM_REG_ARM64_SVE_FFR, the matrix register
> +               KVM_REG_ARM64_SME_ZA() or the LUT register KVM_REG_ARM64_ZT();
> +
> +             - KVM_REG_ARM64_SME_VLS may optionally be written using
> +               KVM_SET_ONE_REG, to modify the set of vector lengths available
> +               for the vcpu.
> +
> +          * After KVM_ARM_VCPU_FINALIZE(KVM_ARM_VCPU_VEC):
> +
> +             - the KVM_REG_ARM64_SME_VLS pseudo-register is immutable, and can
> +               no longer be written using KVM_SET_ONE_REG.
> +
>         - KVM_ARM_VCPU_HAS_EL2: Enable Nested Virtualisation support,
>           booting the guest from EL2 instead of EL1.
>           Depends on KVM_CAP_ARM_EL2.
> @@ -5143,11 +5194,12 @@ Errors:
>
>  Recognised values for feature:
>
> -  =====      ===========================================
> -  arm64      KVM_ARM_VCPU_SVE (requires KVM_CAP_ARM_SVE)
> -  =====      ===========================================
> +  =====      ==============================================================
> +  arm64      KVM_ARM_VCPU_VEC (requires KVM_CAP_ARM_SVE or KVM_CAP_ARM_SME)
> +  arm64      KVM_ARM_VCPU_SVE (alias for KVM_ARM_VCPU_VEC)
> +  =====      ==============================================================
>
> -Finalizes the configuration of the specified vcpu feature.
> +Finalizes the configuration of the specified vcpu features.
>
>  The vcpu must already have been initialised, enabling the affected feature, by
>  means of a successful :ref:`KVM_ARM_VCPU_INIT <KVM_ARM_VCPU_INIT>` call with the
>
> --
> 2.47.3
>

