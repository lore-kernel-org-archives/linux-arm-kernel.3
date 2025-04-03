Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D997C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 12:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QyLh0Gw8hO7XZCTxtBxxEiqJvR19g3PaG80k0CYf2qM=; b=Mk2HN1m3zpJSeajN+RZluZ1+zo
	+7uVf+CCdbAo9lNWZgL791FScNpEnEqgI/o21qck0H9koU3dIV/MngLj8ykbk4Y3GRo4eB70NOl+j
	ev4UlwVNUzMcjyeZThlWbCRNI99sTxkw+aWt3cOEX3lEgSw75egvfY6288Li9J0wiaKeMyeF9OGnp
	OaODj1gdDIc1XMu2ig67DHTDojEqV4IC2zQNrmwCeIH32BwzGYUuTeYJJwvvbtK+ntHuB87QeNt90
	0dmj7zyKjeV5QSq5HwrtaOrKnt9RkJFtNVko0s+ctttVt4bs4xB8znXdmKo3EpkuU+WZ6HYC3KXEk
	I2v8mJPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0JWL-00000008o10-30Js;
	Thu, 03 Apr 2025 12:18:09 +0000
Received: from mail-ej1-f45.google.com ([209.85.218.45])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0JTC-00000008nYd-2s62
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 12:14:56 +0000
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac2af2f15d1so115425666b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Apr 2025 05:14:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743682493; x=1744287293;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QyLh0Gw8hO7XZCTxtBxxEiqJvR19g3PaG80k0CYf2qM=;
        b=usQjqq8vqsBRi2d1wMzD5uAj8TwACt8ToqgQUUod2AV3/FS16oa4JKtTnW2voAAvgY
         7g6/kLVCp/dZKbaLosj77pNE4sDdPUbEgfXJ6AntJjBfjktHKSPyhsAj9GGK9VguGnmY
         HBKBbUseWx8MhPlISR6J7FO/vLuM4+3h7PCnGbbOtDY0qK9Og2pHhJV1HcDnNCdqii3b
         ap3GAfmHJgIsy4L/bqvwYwxtiPH77uap9ObZT7GLsh9PP+EVZw/x6gl4kGh0eSbAOrsF
         7WD8l+VY0HsJV+AEathHqNmapRUrUNgbKmpa2ck3bKDi723DaNj0Ux5b7sjayyGwQd1+
         xOzw==
X-Forwarded-Encrypted: i=1; AJvYcCWAcgahWflYdKlgY6yv7e+WpyHtardBvMjLvfOVjlURpEyp8ZWMNIJPcSPrUokqSlvrGeRy2K0fgIK2yW2CpILd@lists.infradead.org
X-Gm-Message-State: AOJu0YxSJvI3XxIfKB26zGgQNqXl9RMkPwBCNTxBsdMMW8fXtMpJrDQ0
	dGNpV2GN8SJV33qubhIXhyuy/DJ834u8OuYDinxD7y8H/7hyoFvl
X-Gm-Gg: ASbGncs9/vq+KMwlZms6BLdij2wO/aho/27kppSmB5c+5wIKvER0pWU+IyIDAnvNvmH
	ChNUsCGpnXbxyVFsY73JZ/OrekGT9phZ+ULQkxrMCxGzO3Z7WJIqR5F1P3AjN2juXMyGQvqSJ6g
	Gc1oRZamjXlVk0JWqO+/afC3kVQYAousVsCi2Nbf7oa5avSMO9LDjMKXlD5tMKNE99wn/nGMBGV
	mLT/4eHYqIM7ul5JsIEVE+JiLM9Vy4GbJcASX9ZV5fE8goHX1cEDfmlYd2S7iii92plD1t5L71D
	HjFvvy2dQ2nWXgmTRKHTftplxpSfHFrE0B0=
X-Google-Smtp-Source: AGHT+IGb8dt34rh+KIwOLHtIb26NZR5dMK4uBVyOfM1ZEWUHXPqAhsjekUaTVScDl4dshP9ViO+J9A==
X-Received: by 2002:a17:906:391b:b0:ac7:cdaa:8946 with SMTP id a640c23a62f3a-ac7cdaa907bmr3700566b.11.1743682492518;
        Thu, 03 Apr 2025 05:14:52 -0700 (PDT)
Received: from gmail.com ([2a03:2880:30ff:4::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7bfe9ae46sm85923866b.60.2025.04.03.05.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 05:14:51 -0700 (PDT)
Date: Thu, 3 Apr 2025 05:14:49 -0700
From: Breno Leitao <leitao@debian.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, arnd@arndb.de, kernel-team@meta.com,
	vincenzo.frascino@arm.com, anders.roxell@linaro.org,
	ndecarli@meta.com, rmikey@meta.com
Subject: Re: [PATCH RFC] arm64: vdso: Use __arch_counter_get_cntvct()
Message-ID: <Z+57uXX3u0zeTGeP@gmail.com>
References: <20250402-arm-vdso-v1-1-2e7a12d75107@debian.org>
 <87a58yz0cm.wl-maz@kernel.org>
 <878qoiyzic.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878qoiyzic.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_051454_743792_96825552 
X-CRM114-Status: GOOD (  18.68  )
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

Hello Marc,

On Wed, Apr 02, 2025 at 11:22:51PM +0100, Marc Zyngier wrote:
> > > -	arch_counter_enforce_ordering(res);
> > > -
> > > -	return res;
> > > +	return __arch_counter_get_cntvct();
> > 
> > I won't pretend I understand it all, but you really want to have a
> > look at the link just above the arch_counter_enforce_ordering()
> > definition, pasted below for your convenience:
> > 
> > https://lore.kernel.org/r/alpine.DEB.2.21.1902081950260.1662@nanos.tec.linutronix.de/
> > 
> > Dropping this ordering enforcement seems pretty adventurous unless you
> > have very strong guarantees about the context this executes in.
> 
> Ah, I appear to have misread this patch, and
> __arch_counter_get_cntvct() does have the same ordering requirements.

Right, I've originally ensured that this part remained unchanged, with
one notable exception. The __arch_counter_get_cntvct() function does not
mark memory as clobbered, whereas the original code did.

The original code, which is being removed, used the following assembly
construction:

	asm volatile(
	ALTERNATIVE("isb\n mrs %0, cntvct_el0",
			"nop\n" __mrs_s("%0", SYS_CNTVCTSS_EL0),
			ARM64_HAS_ECV)
	: "=r" (res)
	:
	: "memory");

This code explicitly marked memory as clobbered using the "memory"
clobber specifier.
In contrast, the __arch_counter_get_cntvct() uses a similar assembly
instruction, but without the memory clobber specifier:

	asm volatile(
	ALTERNATIVE("isb\n mrs %0, cntvct_el0",
			"nop\n" __mrs_s("%0", SYS_CNTVCTSS_EL0),
			ARM64_HAS_ECV)
	: "=r" (cnt));

From my analysis, I understand that memory clobbering is not necessary
in this case. The assembly instruction only accesses registers and does
not modify memory. The use of explicit memory variable (res/cnt) in the
assembly code ensures that memory is safe.

Other than that, nothing else changes.

> Apologies for the noise.

Since you created *all* this noise regarding instruction ordering, can
I pick your brain in the same topic? :-P

If my machine has Speculation Barrier (sb)[1] support, is it a good
replacement for `isb` ? Do you happen to know?

[1] https://developer.arm.com/documentation/ddi0602/2022-06/Base-Instructions/SB--Speculation-Barrier-

Thanks for your review!
--breno


