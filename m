Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D49C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 11:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1qGPkkOzz/AvcHXID85KRR2dfTKt6dbyAQOGmEwhnXA=; b=pgQr0mU/lCWGhQsa6jh/a2J+gY
	GPnercwPcOk6QzuDK2yifeX8x0/9d4YpHf/3T3BpM/y3g9ilbyMeQhLYBQXpfz42C7sKQK9FTD/Mv
	2RdYbon5RYcvtC8HyDE7G3cZEr3dAAVaEJDK+8UpHB8LzoLEEOwEg7THj96/uLIwTojj2FwPlPDuG
	POoh5fg4VZdup/BdrKaB3jJ9U6aoqO5zzYjE9u7g50tgxlMpvtAhMrwoGEDjq1UsX3zxnY51AC3SY
	Na0j9STGSSZwAtZ+Ti0gw+qGzpsbqfzuSrNizGNyOvwMXLsNm6tGcLJkFrjTXxCGZatyMh1PrIszf
	e3td8H0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJVoZ-00000008gid-1rca;
	Mon, 26 May 2025 11:16:19 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJVmN-00000008gSX-1jMS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 11:14:04 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3a3673e12c4so1320575f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 May 2025 04:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748258042; x=1748862842; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1qGPkkOzz/AvcHXID85KRR2dfTKt6dbyAQOGmEwhnXA=;
        b=YVZb0p2n6xrsazHlFhJbx73HKl2U3lO6AaJ/EKjAyRGgflPCVAKwdXmU/KBzxORX91
         Pv/NB0UHttjvastYwjntBrFkGmrM9eo422mfkWnvAfU7BJAPsdVmuLEg2QtMrSwmvQJ4
         57LkJA3XjnVdv1CgOJ90ZNq054R/tVntOf08IASNU4YeydRqfQMM5U4AHJDwkmB76K1S
         uE16BZ74fBGK1Yjfp8+pPebY1W4DD4ERI6DS3VGYOyPXX+WX8wVR1LS0QnihemodLxox
         MwKk8tJacqyDF7ysbBBy9jhDlDyKTCpH64C74rUAvb89GtgqmsN5bWzFeVABWTgkr1wm
         maFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748258042; x=1748862842;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1qGPkkOzz/AvcHXID85KRR2dfTKt6dbyAQOGmEwhnXA=;
        b=KMgsKu1UAaOwwS/B+VtE/I7AJB5Bn8Vggc5/UGgtF4OxF23lgN557wYW5Qsp1WPFZG
         IlI9FxOzrsW6dqq9FV0sl7B82DCJPuzp/EVM8WruDzbJnUm2oOWEz0TcUpsCYKR8sICR
         s7VAHtS82gB7eAvYkltGWDYY+35l0Snb4Kt+RAL5vf6HgnBb4TxDgxjBzAljBOijuA+S
         soYlK5tG/o9V92Hri6pxTuhAvOSkEbgMhPFrIvtWHt0Do/4L6rcPNFsze4oLZfuXbz7a
         84B2PeKFF6PfVksBXmt9N3YBlWKTkpoygrdZOSn5uBW0n1g0wn7lkV1zAyaVUCB/90zB
         CVAQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/2CyGJPkLX+tKJmHK2xDA41C1aV6pZ6e4Z+F3NJRegelENYrQITWHuNbpYG+fZc/40X7q5/ODVcVRqEWNycuY@lists.infradead.org
X-Gm-Message-State: AOJu0Ywcl6uSWjntGHImR5sHdLfbl9edEjERjIQTJIYQD4ikEzFv/3Fx
	V9oWSyTbyVJyiYCyWPry1RX5DYOgsuJvEoNO40cYfI38NtRv9OPrMtZGprWuscwFJGw=
X-Gm-Gg: ASbGncszz+yupPbQJcmFlqLNK6lSU50wUQt4GX1gnbOOMuG+ThQolZkYfRLaBn8fAJP
	3e/WHjrW0lpU6kKiTPLKMWPnZBFdJO+bwniTNzgIlzDXDTQNGf/8D2MGM8Ni6oYdKA0Vg5l/UX+
	nBzmkAbAPEI/aki7/oqdLrqzSbfKLp8tRXz5/fLDturxOq/rjv7imy8qiPZwyovlIKIpGkA5xgp
	cRw2qxnQ9fHx/0rWPSE++J2lgvWtFaLCo2N6mAcnM2qzcdH6SP4Esnf4MnOMunJAPytBcPBNOmp
	/012pcVAzOb/q23pub+x/CE0HPEqfBwxttqTGUh+6SAlEQlKu+S6RNdbccynDR9G5ZHYzXQ9q+g
	mqEzR
X-Google-Smtp-Source: AGHT+IEohXUMBSqO1qFUGi+04cLdFeL8i/QAY/ZQ64aMi3jtMK4s6/6493H521FOcUTuehMxIQIXpg==
X-Received: by 2002:a05:6000:40d9:b0:3a4:c2e4:11b with SMTP id ffacd0b85a97d-3a4cb4a962amr7086907f8f.51.1748258041562;
        Mon, 26 May 2025 04:14:01 -0700 (PDT)
Received: from localhost (cst2-173-28.cust.vodafone.cz. [31.30.173.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4cc932836sm7397037f8f.39.2025.05.26.04.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 04:14:01 -0700 (PDT)
Date: Mon, 26 May 2025 13:13:59 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: Atish Patra <atish.patra@linux.dev>, Anup Patel <anup@brainfault.org>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv <linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH v3 9/9] RISC-V: KVM: Upgrade the supported SBI version to
 3.0
Message-ID: <20250526-224478e15ee50987124a47ac@orel>
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
 <20250522-pmu_event_info-v3-9-f7bba7fd9cfe@rivosinc.com>
 <DA3KSSN3MJW5.2CM40VEWBWDHQ@ventanamicro.com>
 <61627296-6f94-45ea-9410-ed0ea2251870@linux.dev>
 <DA5YWWPPVCQW.22VHONAQHOCHE@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DA5YWWPPVCQW.22VHONAQHOCHE@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_041403_462496_0B076A15 
X-CRM114-Status: GOOD (  21.60  )
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

On Mon, May 26, 2025 at 11:00:30AM +0200, Radim Krčmář wrote:
> 2025-05-23T10:16:11-07:00, Atish Patra <atish.patra@linux.dev>:
> > On 5/23/25 6:31 AM, Radim Krčmář wrote:
> >> 2025-05-22T12:03:43-07:00, Atish Patra <atishp@rivosinc.com>:
> >>> Upgrade the SBI version to v3.0 so that corresponding features
> >>> can be enabled in the guest.
> >>>
> >>> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> >>> ---
> >>> diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> >>> -#define KVM_SBI_VERSION_MAJOR 2
> >>> +#define KVM_SBI_VERSION_MAJOR 3
> >> I think it's time to add versioning to KVM SBI implementation.
> >> Userspace should be able to select the desired SBI version and KVM would
> >> tell the guest that newer features are not supported.

We need new code for this, but it's a good idea.

> >
> > We can achieve that through onereg interface by disabling individual SBI 
> > extensions.
> > We can extend the existing onereg interface to disable a specific SBI 
> > version directly
> > instead of individual ones to save those IOCTL as well.
> 
> Yes, I am all in favor of letting userspace provide all values in the
> BASE extension.

This is covered by your recent patch that provides userspace_sbi.
With that, userspace can disable all extensions that aren't
supported by a given spec version, disable BASE and then provide
a BASE that advertises the version it wants. The new code is needed
for extensions that userspace still wants KVM to accelerate, but then
KVM needs to be informed it should deny all functions not included in
the selected spec version.

Thanks,
drew

