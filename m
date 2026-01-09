Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08E4BD26D6B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 15:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b5CL8FxNgdT9nItA6mQg13QZSgYd92jfbMmDmpgGf0w=; b=HcQbkrO15q6b8OhGWNBQZj0WGz
	zhxkj5jopLXJOOiX6zkEDrlZRGJz65XtfplGY70wHJkTb67npUrr144bwLq2ZaviSd8jtCRUeKmf7
	4HHlLeHf31Wc20onSZCMtc/m8svEZ49WjEhAZCvxK/0Vpom6Y5hThHa3Z7Bq/Qsm6T3dgsS2gOf6d
	nLFW3WXvq/Pvha58/1FZTdy+GHA89SOBRK7+fHCh3A3ZxCH9mP9+l2zA9Cj0HypkXSy7QmY0szpqK
	3QxlllEye0FXZsnSQ3Pxrj8RUdBVEIWK18fjJtf4odkyFYwLLiEShxkBerPEi5dtT+UOHdNccaSwW
	5TWpZnyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veEqe-00000002XUO-3W2p;
	Fri, 09 Jan 2026 15:56:24 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veEqc-00000002XTi-3xdk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 15:56:24 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-4ee243b98caso353821cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 07:56:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767974182; cv=none;
        d=google.com; s=arc-20240605;
        b=ai010E7ZzzjUhe9WpiglPoFMbjTO9P9f6sql6PdggNTw1LdKDMzmcexjVKUWy7nLaF
         5yLNRD18lsMlRylqoGvRvEF3cEP01INoHHEVqsr5eGPsE4H/F11bX43AtPrSlfi6h58y
         qF0ONyp6ylT6zSvLoHp9gamEUAjxfTNMF4R0ow9+ZaampGH5lbCKqYHIQQbJ2wXzKWSn
         D4a3G35GOSor0WSTU+e1AayeJsCxVcg2cqMVKtHjRiuTtSxHpECLn96YqeAqc1Rz4p05
         y+RIiZy0uVc4nbpb07VreWbCybS+1fUEQlp7iGJZQIRfufs8P6A0xbNz77Z7woDGu9R9
         h//w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=b5CL8FxNgdT9nItA6mQg13QZSgYd92jfbMmDmpgGf0w=;
        fh=nIABOAjry+lt/qf5Z4BXFMc7OLG6Mw8R/CDdYTU8T9A=;
        b=fCJ0rFv7Cor+8PfDQXq/uG8FB9WP8zA1J/m1njPA+knHtyQzUcq0ZOpGGJUxqxwloJ
         NAMIjPqt29Hz83JV0AGWtc0M1+gg8yDSQ6KDB4BUFWH/7DvC8L1pq8eUh5B2Izauv8+z
         C5K9wRARGuoxjVmRwFXuQVzYz6MhGNNKCkAhbCIPAoJBbbAGRvdLOYm7ns3s3jqRJCOu
         kLP2DCYeHUxBKPqbHKjQklcbZcLv3UdY85406phNQVSdiIRPolZhuUVg3hPJdxk6n4uN
         lu23eMYNozlwMMkVUn2wTNc+uXA6JMNn8yC9cpYRInpn/djxPx/aCQPuxeDlq8iDx7wr
         KgZQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767974182; x=1768578982; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=b5CL8FxNgdT9nItA6mQg13QZSgYd92jfbMmDmpgGf0w=;
        b=D/ude84D7Eb4Oq/i2eBomqT790O6/RFI5XSvdsPCIdqr7jX3RMa5ar6za71zn+So56
         PnndQJvZW05A7O0sHsTuVDpFKnYjLLiiGLJkd/vPADOBvziepKZ8DOwDDEanU6lV+yFT
         VYIUB5c89DXOe94WPh1Vdg5bvKiXWlhlZGljYy0745QRGy8YByPKtoPZ2oi+2H7nEjl0
         yzRfsSOVOEHCtERRKFgY6ZVij900eFTNIPs/xK7Qe16mXKOrMCYMweVpfv3Som5JKDgv
         Fq0Wxz9UQgAKmMCg82fHMiSs3OeCteR6n/ea9IddPVT3O7dAztAyM3q6uiQ+FU1Eqi3E
         A4eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767974182; x=1768578982;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b5CL8FxNgdT9nItA6mQg13QZSgYd92jfbMmDmpgGf0w=;
        b=oqKw7QxyziGDE01DDyFXWY1KeoVHvKgRNmYarOkw79gdi0+OtqpnFiEuav1xdh/UJm
         VvA2fKhJ01WqOeH3pru62t+28+2sYM+nNS69LSr9bdew+E2VRsp4AovUZMc7dmtUrWzm
         To7fxmxcoh3NE2jpREo11RMq7ZPu83VDXYunyM0jIUQKvYCAjm1oVusJeGOMguk8PG9I
         1gIuxM9lTpCIWhCDePT9rFDrm9fJsH7fUPOYQTbHyNbzrD8QGV7ML/q3qUU/PyLXpLWb
         IFFOQcJLp2rDE9A5AcECDDKqGKKaMGZQUwe5VnruWrhS5t0j62LPONjoEr60nICHDXqM
         mWTA==
X-Forwarded-Encrypted: i=1; AJvYcCU56Mv03E5q1EQ7U/8TLhmxlkwIX+Y+SR9fzHyS2PqB0g1MHqQoHW4k/kctbpw8l5jnPrTEmGO/VSsBZeSJD4C0@lists.infradead.org
X-Gm-Message-State: AOJu0YwKJToC8MUoua0DCPwHtXLQ1aCzcp/jIKgkEIR52Kq9x5e1+CfG
	RFW0DCVJ2boAAlBsEzrYva6sbm3MVnkYDaDHGfvs02eAGb3S9RMSXpKHrnLOCoTcXOcyTRVXWUx
	eR5lmcGp9NtMsQkFG1Ltv6VTe3W5JYckQv5VhIOZw
X-Gm-Gg: AY/fxX7uHyJfi07qwjLrNEafllVE7OQBNXCwnVp0E0Wz8k+1jH9pjLfjXhzmXD5ys0I
	sXtoKHMeIHgze2kHUf9cJp+Fqe4xpr7dB9//gFG1thGBarnIAY/LKqPWZdI0whdTJNjTJB9zhtS
	C8BiMsoln2NNCxChAlMpJo1Ghp1uEhaYjVC8AseCp3E1XoTOpQsJ029+i2TZzz5XKjxyIuY0qVI
	SYEZPWVJ+cSH58O1/rspYyDWzi2wKB37ZxM6TD6XoTT2xiE25yDeWDDyp7u2g7GOmqIG4FS
X-Received: by 2002:a05:622a:1827:b0:4ed:ff77:1a85 with SMTP id
 d75a77b69052e-4ffcb233993mr10494381cf.17.1767974181223; Fri, 09 Jan 2026
 07:56:21 -0800 (PST)
MIME-Version: 1.0
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org> <20251223-kvm-arm64-sme-v9-12-8be3867cb883@kernel.org>
In-Reply-To: <20251223-kvm-arm64-sme-v9-12-8be3867cb883@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 9 Jan 2026 15:55:44 +0000
X-Gm-Features: AZwV_QjYKCnQMH_dJFXuijQwcG8RABb6JnH52RR1LbUrpQK_8_OFYA5NFixm6a4
Message-ID: <CA+EHjTy95BPnZzZcrR8eOekTm9Cv41D_BCkH1puWtDG3JO6yTQ@mail.gmail.com>
Subject: Re: [PATCH v9 12/30] KVM: arm64: Rename sve_state_reg_region
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
X-CRM114-CacheID: sfid-20260109_075622_996934_A3DA522E 
X-CRM114-Status: GOOD (  22.39  )
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
> As for SVE we will need to pull parts of dynamically sized registers out of
> a block of memory for SME so we will use a similar code pattern for this.
> Rename the current struct sve_state_reg_region in preparation for this.
>
> No functional change.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm64/kvm/guest.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
> index d15aa2da1891..8c3405b5d7b1 100644
> --- a/arch/arm64/kvm/guest.c
> +++ b/arch/arm64/kvm/guest.c
> @@ -404,9 +404,9 @@ static int set_sve_vls(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
>   */
>  #define vcpu_sve_slices(vcpu) 1
>
> -/* Bounds of a single SVE register slice within vcpu->arch.sve_state */
> -struct sve_state_reg_region {
> -       unsigned int koffset;   /* offset into sve_state in kernel memory */
> +/* Bounds of a single register slice within vcpu->arch.s[mv]e_state */

nit: I'm not sure that the space saving of s[mv]e_state is worth the
added difficulty or reading compared with writing sve_state/sme_state

That said:
Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad



> +struct vec_state_reg_region {
> +       unsigned int koffset;   /* offset into s[mv]e_state in kernel memory */
>         unsigned int klen;      /* length in kernel memory */
>         unsigned int upad;      /* extra trailing padding in user memory */
>  };
> @@ -415,7 +415,7 @@ struct sve_state_reg_region {
>   * Validate SVE register ID and get sanitised bounds for user/kernel SVE
>   * register copy
>   */
> -static int sve_reg_to_region(struct sve_state_reg_region *region,
> +static int sve_reg_to_region(struct vec_state_reg_region *region,
>                              struct kvm_vcpu *vcpu,
>                              const struct kvm_one_reg *reg)
>  {
> @@ -485,7 +485,7 @@ static int sve_reg_to_region(struct sve_state_reg_region *region,
>  static int get_sve_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
>  {
>         int ret;
> -       struct sve_state_reg_region region;
> +       struct vec_state_reg_region region;
>         char __user *uptr = (char __user *)reg->addr;
>
>         /* Handle the KVM_REG_ARM64_SVE_VLS pseudo-reg as a special case: */
> @@ -511,7 +511,7 @@ static int get_sve_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
>  static int set_sve_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
>  {
>         int ret;
> -       struct sve_state_reg_region region;
> +       struct vec_state_reg_region region;
>         const char __user *uptr = (const char __user *)reg->addr;
>
>         /* Handle the KVM_REG_ARM64_SVE_VLS pseudo-reg as a special case: */
>
> --
> 2.47.3
>

