Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E23D2D149F7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 22:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i0gN4lzQDHYSJ5VLFJlwQdonngrbWjkk6VPysWjKkhY=; b=R2/mKsRZQwdwhn/WEdaB4nbyr1
	m49rRBsvoN6hcePFyv5eIEz9KBLoRp2ZmK5HfvTrpTnOJdjGqvGENdk7jCN3GENWdJytrbcD0oJ5k
	IlhRox5eLsdaT2xSExGJ6tfl5n1VsqPUSYxHitbvvMX8XfESS6PJ79ptMs8blFRWDJAAQeHiXEe0P
	OF2tpnADQ1TegJa9DrDZdDX7TffpZnvXIl+TQzM4gAYqgGRbagKgzPywoVzf7pkIbA7hsGS36iltC
	chc6jjH79hTkDeF5WXehRi6E/cwVQIt4dA6IeDc8z867RBUT3IjobES+1NjXMbqR+jxqYWEt2Sbna
	KVnOPlrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Sg1-00000005Qdl-0tyy;
	Fri, 25 Oct 2024 22:21:01 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4SbS-00000005Pmm-1Lbi;
	Fri, 25 Oct 2024 22:16:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2F262A42FFF;
	Fri, 25 Oct 2024 22:14:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8815C4CEE8;
	Fri, 25 Oct 2024 22:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729894576;
	bh=uJTuxxbpUOhYgzs5WgqjZ9oJKXZ+IXXPP0S1EvdK364=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nnsUCoKsPy331Chn2UUcsngk6k5T9x6sJ5x/vQCqmf50lgps9XEwpgmo4ieWnMh2v
	 hKKhwmyShVPTqg/aa8W1r73marKoLDlVeVlofleUY/xPKgT1+9Mj3gW7tRebb1/J0Z
	 0Nb8Myml3Mh8xhW6GxZCRVqJQI9a0IlZxwhIb/FFLjWW7zb3vS5IAOKR5P46cuH1bX
	 6HIe2Fv9Hy8qoXg6BWAQLe1RwZxXCtspPILf7Beo+xbCY0Zov9G0Zr+tfys0Y9cjmm
	 B8TBd0ZUpDH1lyus/5Zn/fUtOn0w957/BJ7tJ0vN45wzDau2TLxE75xt0/m5uLMVPd
	 35fr3Z21N4TFw==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-539ebb5a20aso2717239e87.2;
        Fri, 25 Oct 2024 15:16:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVwuup/J1QSK2ntzDheuC9rh3g4O7txd+F1x9oO6vsVpSsiGvXiwF/EwsPo4h1gYzAi5SV430L3LLa0EDQ=@lists.infradead.org, AJvYcCXA3rhIpVhmHuAAudwQv+O3+EqCpnBsDrmDcH4JLoUaIgZ8ljbf8sk0Uju5OdkfaGUwqrlMPD1z3FuaOvR8Jino2w==@lists.infradead.org, AJvYcCXJ9llqqOGQxBiNDQkxkSiMpHg3LdiCHNQPJkq3+NaaYKZYPZ5YHxFT6HgbK7uj4SijP7tzVA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyOT2ybsNffjcmSM+k+VoOLRxPYruX0aWADtD4aY3Hs4MlyN8p6
	5TVqidbIFuI/NIB3Nz0rupF+cF6YFI1544biasA1a6VofPiPVv4479rS1ZK4rb/EJL3woPC/KMl
	GTdqE3qwgimlO6R8E+HZvGGNDqg==
X-Google-Smtp-Source: AGHT+IFDzz30e4eepxmp8y9NIgcU0ohK45V4obAXv/vuq7kDznzhS/1RZo0KUZFB2KLhRb/lyUfqMvvtY4COXI6AOVA=
X-Received: by 2002:a05:6512:3d8b:b0:539:d0ef:b3f9 with SMTP id
 2adb3069b0e04-53b3491dfc0mr415910e87.40.1729894575274; Fri, 25 Oct 2024
 15:16:15 -0700 (PDT)
MIME-Version: 1.0
References: <20241023171426.452688-1-usamaarif642@gmail.com>
In-Reply-To: <20241023171426.452688-1-usamaarif642@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 25 Oct 2024 17:15:53 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLBuzRYgnYHCdbdO4wneFNPe5_iEfbehvKK5M7bBuiyfA@mail.gmail.com>
Message-ID: <CAL_JsqLBuzRYgnYHCdbdO4wneFNPe5_iEfbehvKK5M7bBuiyfA@mail.gmail.com>
Subject: Re: [PATCH v2] of/fdt: add dt_phys arg to early_init_dt_scan and early_init_dt_verify
To: Usama Arif <usamaarif642@gmail.com>
Cc: mark.rutland@arm.com, will@kernel.org, leitao@debian.org, 
	catalin.marinas@arm.com, tglx@linutronix.de, chris@zankel.net, 
	saravanak@google.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	kexec@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-sh@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-openrisc@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-csky@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_151618_450152_B17B354A 
X-CRM114-Status: GOOD (  13.87  )
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

On Wed, Oct 23, 2024 at 12:14=E2=80=AFPM Usama Arif <usamaarif642@gmail.com=
> wrote:
>
>  __pa() is only intended to be used for linear map addresses and using
> it for initial_boot_params which is in fixmap for arm64 will give an
> incorrect value. Hence save the physical address when it is known at
> boot time when calling early_init_dt_scan for arm64 and use it at kexec
> time instead of converting the virtual address using __pa().
>
> Reported-by: Breno Leitao <leitao@debian.org>
> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
> Fixes: ac10be5cdbfa ("arm64: Use common of_kexec_alloc_and_setup_fdt()")

This looks fine, but what is the symptom without this compared to
before the above change? The original code in the referenced commit
above didn't remove the reservation at all. Unless the current code
does something worse, this is new functionality more than a fix (for
stable).

Rob

