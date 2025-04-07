Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A7A3C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 21:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ES21mMERPPnSMI71+d30thtG1PyOJaAorY/1IBZ9Fis=; b=UM1ZhaeKLdfENaYdq2W0wc+4P9
	7BideL7PElpuk9ZIJgKZdlwVr8rgxnG1FseMOzGDZozPUXjJxpnRkgLIkwdtgBnroO55jr4YlufGS
	khSPpwc7hcXLvRiVHl2Kbz4KyCkfqEOpiRDD83asrRTh/iOMfAm//J5RFuzOEk9LC6DiUBG9d5XW1
	Y/SD2VdboTTMQ5JOZPruzUYJSASed9FOPVToLLKzDviicAS1BFEuY9C5DAcmHwpfOGDAbuNrOqgur
	5z+0Unr901i/jeXmMHsI6O0RKtesq8QV0yvn7OwgooKO+gX+PheHJ3GrEUgD1Xb7wmBwQ1dCR2bs8
	PrmjI2Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1uIq-0000000245p-0eKd;
	Mon, 07 Apr 2025 21:46:48 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1r5u-00000001XDA-2lmE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 18:21:15 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso31191055e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Apr 2025 11:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744050072; x=1744654872; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ES21mMERPPnSMI71+d30thtG1PyOJaAorY/1IBZ9Fis=;
        b=SZhVRHLrOXz5p/n+Lfz+Nuuh+ksQblMVMWmMPArbiPJpvtKK7+M/RTyZbflmAY1GZQ
         +UKBTh24bqsk/5NmR8mTnE9pTcKVVDFv5XXYBjBb7gTNdZN6GjcU8pkcLYUGuWTm5bOV
         Kex7nHlgUdhUhXXnnEzVpUV3zgQ+v3hCyKgi+oSMGnnrpDGYNABc6ca6/5o8s/PooA8I
         N20yo0/ONfmlqsLGJr1sCKqOd/r7f282AWCfDa4PzLcW2Dzy1RCCrGD5oifPy8hmW1FG
         YhxC7JxLEVr1yGtowYoJH+GFsCkh6pWaL9XADU5t5MZSAfpgzgZF2Oml57TvaKOHkZJs
         vFbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744050072; x=1744654872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ES21mMERPPnSMI71+d30thtG1PyOJaAorY/1IBZ9Fis=;
        b=fpPx60krOg2jcYjrjps5Sn7VxOOYL7ebRVJQ34qeEJbYnVgxUaPmkM9WaeqUXD99ZN
         hin4MfAivWttyqAStr3Q9ZCr8Os9PaEJrQb9xOPgfCdUetb9Zh5AiTIKnxGOdQsQk0xy
         0x5mw2NNK1d8dUCEvragEG9G3DNwgHVGhYsm2GBWvyO4KEVI+mHZTlzfMe1Lia1l8ekl
         HpFoXG7R37XUCBOoGgDT8MWjpMFz2+UDAIRi2wB2rqjPsD8OIgn9EHV08wzLhXSg7uWZ
         d1IOu3lhWLI2H8aQ7weTY1WCLaBy9rCT0h11fiTUvNpzfIrEw5Z6hctWtvb8kiBVoI4W
         gNUA==
X-Forwarded-Encrypted: i=1; AJvYcCV/8+jctzbh9WRw8jFlWttQbpSWVRrVio8OufYXg/rZio923iduNh3LU7e6LYRcFXveoLwDLKLeJ8oHQAvEtg3X@lists.infradead.org
X-Gm-Message-State: AOJu0YyVuflu7iosXWagVUvHZOEDs8hE+dzaDTwsha/2P5XryV2+GdHn
	Preq+wB+IY5IAKtE9E85NnybqtRL3ZqYjvafMNnhBeJydbinnWL9
X-Gm-Gg: ASbGncvyV6ytAd2Z7RSbW9AWqTIgaf7MU0A5YL8I936d8yAqSmmo4tE+cshPpxKBrkB
	O8utYl7eHv47Edx8DVT4x7rbsRpjDzt+/3LhmG1IyClOn+Vg6PyIO0Wpxm+dRkBlRNczrOiWIYI
	igy+vXBexjCo8m3hG6xmVTpp/KRlTSjhQGJFGCF8PJn/y3HVOnKqaWT5Beu3i5NANIxOTcN5xQ+
	f2CnTEEU9nOs61djjpQvP5veefeLQLgHW7aE+49u5AZgqwIqdK3WT+HT8xtiRUe9RyuSXpm1zp4
	WznKzIEGL3gzB1b3UgZ0CH0UPkF5rzgmCbmHU7Qpzdbb3VmfuOxN4wLvN54ShuS+m8Wq6EIaQPK
	WZjBVy2M=
X-Google-Smtp-Source: AGHT+IH7UT5+ww2+1FoGL9t0kvvVtsQUX0Zd7DaWfpx4PLfPCluuGh6+cQNvkvF3tn8WY4k8enhO3A==
X-Received: by 2002:a05:600c:8411:b0:43d:d06:3798 with SMTP id 5b1f17b1804b1-43ecf9fe1f0mr113598395e9.20.1744050072429;
        Mon, 07 Apr 2025 11:21:12 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec3174cf0sm142595365e9.0.2025.04.07.11.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 11:21:11 -0700 (PDT)
Date: Mon, 7 Apr 2025 19:21:10 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, linux-kbuild@vger.kernel.org, Arnd
 Bergmann <arnd@arndb.de>, "H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel
 <ardb@kernel.org>, Borislav Petkov <bp@alien8.de>, Brian Gerst
 <brgerst@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen
 <dave.hansen@linux.intel.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 Ingo Molnar <mingo@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Marc
 Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Masahiro
 Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas@fjasle.eu>, Takashi Iwai <tiwai@suse.com>, Thomas
 Gleixner <tglx@linutronix.de>, Uros Bizjak <ubizjak@gmail.com>, Will Deacon
 <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-raid@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH 0/4] Make gcc-8.1 and binutils-2.30 the minimum version
Message-ID: <20250407192110.5a7ad777@pumpkin>
In-Reply-To: <20250407164151.GB2536@sol.localdomain>
References: <20250407094116.1339199-1-arnd@kernel.org>
	<20250407164151.GB2536@sol.localdomain>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_112114_701888_09FB4C11 
X-CRM114-Status: GOOD (  27.60  )
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

On Mon, 7 Apr 2025 09:41:51 -0700
Eric Biggers <ebiggers@kernel.org> wrote:

> On Mon, Apr 07, 2025 at 11:41:12AM +0200, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> > 
> > x86 already requires gcc-8.1 since linux-6.15-rc1, which led me to
> > actually go through all  version checks and make this is the minimum
> > for all architectures.
> > 
> > Most of the actual resulting changes are actually for raising the
> > binutils version, which eliminates version checks on x86 and arm64.
> > 
> > Arnd Bergmann (4):
> >   kbuild: require gcc-8 and binutils-2.30
> >   raid6: skip avx512 checks
> >   x86: remove checks for binutils-2.30 and earlier
> >   arm64: drop binutils version checks  
> 
> This is intended to supersede the patches from Uros that removed checks for
> binutils < 2.25, right?  See:
> 
> * https://lore.kernel.org/linux-crypto/20250404074135.520812-1-ubizjak@gmail.com/
> * https://lore.kernel.org/linux-crypto/20250404074135.520812-2-ubizjak@gmail.com
> * https://lore.kernel.org/linux-crypto/20250404074135.520812-3-ubizjak@gmail.com/
> 
> If we can indeed bump up the requirement to 2.30, that would be great.
> 
> Just a note though: I recently added VAES and VPCLMULQDQ instructions to
> BoringSSL, which increased the binutils requirement of building BoringSSL to
> 2.30, and this caused issues in a downstream project; e.g. see
> https://github.com/briansmith/ring/issues/2463.  Specifically people complained
> about being unable to build on Amazon Linux 2 and CentOS/RHEL/Oracle Linux 7.

Just tell them RHEL 7 is no longer supported :-)
(Was a right PITA installing an extra package on a CentOS 7 system we use as
a build machine...)

In any case it is relatively easy to install a later gcc - even though it ends
up in a very obscure place.

	David

> 
> So I just thought I'd mention that, based on past experience with this sort of
> thing, those are the specific cases where it seems people are most likely to be
> trying to use binutils < 2.30.
> 
> But if those distros are not going to be supported any longer (without
> installing newer tools on them), or even are already unsupported due to the gcc
> requirement, bumping up the binutils requirement to 2.30 sounds good to me.
> 
> - Eric
> 


