Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EEA3C624D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 16:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nmUHQDRJovGy5euybNv8U4I384UlmmpWUQBP5c7RHzY=; b=2x0ecdkZ/tNg6GduWXTPDxzOEV
	2VvJvLlZZPkoWEtGtvoHKA9coo/H1Ni4pQGLsm07klrQ79G1C2XtZTjGdI+3AgXdyUFi7kz4srOlZ
	frQHQm/AOwYXBhKqZ8rA0rrf66ppY0qIE83bBFuNAr7NLAbqRA2XRCo8a7skatG3nFwTBDdG72sSX
	45wXqdMtMtDcY86UxNiNP06QZIPJLpv7fteETF7mp7CJID7jljX9lYs559xoXMXCrwEH9basn1mRX
	vtjmcMmbj1+SJtgMZjWnFIWV+rmd/FTFhzGhxrFNWpVtEv5k0wy7lwXvJeH/ZzRlLC9HtPyaQG5jg
	Ehn6npKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1nhM-0000000FC1R-0J3E;
	Wed, 02 Sep 2026 16:20:28 +0000
Received: from mail-pg1-x548.google.com ([2607:f8b0:4864:20::548])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1nhJ-0000000FC0o-3oIH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 16:20:27 +0000
Received: by mail-pg1-x548.google.com with SMTP id 41be03b00d2f7-c89704da8c7so1740056a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 09:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788366024; x=1788970824; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nmUHQDRJovGy5euybNv8U4I384UlmmpWUQBP5c7RHzY=;
        b=vR18lpX6lR7PJchukulk4j9uWkt7h7u8v2pRhhDmN5C5hKN5hHLIcNTGdkIHRHRQPR
         vmFvxgBqWdjJ+kwrVvjZ5j8X5wHhFgUJKwGf4p0Q7fTAh5qOsrQ1kWY9rPPkXZYLZjo3
         9RmZ15yZoqD9Otk/HvVZmPWRTcbssK91J8UPB1a7HRW8i+E8LXAXaoMUhdVkfjzk1hXw
         D0iEHZZHmVO2i7F2qBqxTvYcD61CBm16x8PkjlQm4PuOerVuybbOk9E6EBumUM8TBNdV
         SNAbqtSGFVjjv+PzHflrsFcAXtKYQszLNQdikzoMsNBNkeisJ3YTiA2k4XJhkYdlG/J2
         544w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788366024; x=1788970824;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nmUHQDRJovGy5euybNv8U4I384UlmmpWUQBP5c7RHzY=;
        b=GnOHuv7QCttx7un5DPsa6e3mb2O8wzQ8OO1HJyv+AkVfRlDcKOKjkoKj71nh+1iMgo
         YZCPGPlrXPUn5TKfPKjRVfT/ETdjRJmEF5zX+DZzwu8vm900zqRsVCv6FudfbqFgidYL
         jKtt7ckY/miiWcxmlNDYxe/yRB97WTsLNLzMSZ/ieyxw+OtDOYq/W9U+RhmjnEkyK66B
         Yu7erVyeBi8ByC02H4Gbhe9z31UgcN2Qt/UEi6uEZet045lAwqr/sJFTnzXS9w0c1o3L
         S6HHk6UY2KIleNtgrtVszpk0uSk9uMIYHixq/PHPM5a2wHA2sGzNxzfLmpyhjDyMpJO8
         dJyw==
X-Forwarded-Encrypted: i=1; AHgh+Rq8SAxvtxwu/VIV7h9NPYpgCm3GbhO7T3XCVi5lYZxnB2bS67tXw4CURo9fqBZmunQ9OkbDIKAd0gWO4UqyO+By@lists.infradead.org
X-Gm-Message-State: AFuF++lLOYszBL+YBuFuUpZDKGZ75dGQNj7Y39xV6YJdXUAqMy3cX4tc
	Bjsut9POD00FqdJopBcfBY5XvDj8ZckRncbzhbasZ6FId+tqHyMwrrad3SVy3GZBjqgavA96WXt
	gSTWIBw==
X-Received: from pgp27-n1.prod.google.com ([2002:a05:6a02:62db:10b0:cbe:e120:3788])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:2d22:b0:3d3:aec2:4dcb
 with SMTP id adf61e73a8af0-3d9b051aa7dmr10390341637.23.1788366023624; Wed, 02
 Sep 2026 09:20:23 -0700 (PDT)
Date: Wed, 2 Sep 2026 09:20:23 -0700
In-Reply-To: <20260831144802.834315-24-seiden@linux.ibm.com>
Mime-Version: 1.0
References: <20260831144802.834315-1-seiden@linux.ibm.com> <20260831144802.834315-24-seiden@linux.ibm.com>
Message-ID: <aphMx5hsoXwIpNjt@google.com>
Subject: Re: [PATCH v7 23/23] KVM: s390: arm64: Add KVM_S390_ARM64 Kconfig and Makefile
From: Sean Christopherson <seanjc@google.com>
To: Steffen Eiden <seiden@linux.ibm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-s390@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Andreas Grapentin <gra@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, David Hildenbrand <david@kernel.org>, 
	Friedrich Welter <fritz@linux.ibm.com>, Fuad Tabba <tabba@google.com>, 
	Gautam Gala <ggala@linux.ibm.com>, Hariharan Mari <hari55@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Hendrik Brueckner <brueckner@linux.ibm.com>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Joey Gouly <joey.gouly@arm.com>, Marc Zyngier <maz@kernel.org>, Nico Boehr <nrb@linux.ibm.com>, 
	Nina Schoetterl-Glausch <oss@nina.schoetterlglausch.eu>, Oliver Upton <oupton@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Ulrich Weigand <Ulrich.Weigand@de.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_092025_953713_711D8402 
X-CRM114-Status: GOOD (  16.77  )
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

On Mon, Aug 31, 2026, Steffen Eiden wrote:
> diff --git a/arch/s390/kvm/Kconfig b/arch/s390/kvm/Kconfig
> index 8d3ee17a1bcb..9c69ea16031e 100644
> --- a/arch/s390/kvm/Kconfig
> +++ b/arch/s390/kvm/Kconfig
> @@ -53,4 +53,33 @@ config KVM_S390_UCONTROL
>  
>  	  If unsure, say N.
>  
> +config KVM_S390_ARM64
> +	def_tristate y
> +	prompt "KVM support for hardware accelerated arm64 guests"
> +	depends on HAS_IOMEM
> +	depends on KVM

Is this actually necessary?  I.e. does kvm.ko need to be *loaded* in order for
kvm-arm64.ko to be loaded?

If kvm-arm64.ko does indeed have a hard dependency on kvm.ko, then I think it
makes sense to not have redundant "select" statements below.  As an outsider,
it's super confusing because the KVM_S390_ARM64 are incomplete, e.g. are lacking
things like VIRT_XFER_TO_GUEST_WORK (at least, I assume those are lacking), and
makes it hard to see what is actually unique to kvm-arm64.ko.

If kvm-arm64.ko doesn't have a dependency on kvm.ko, e.g. to initialize hardware
or something, then this "depends on" should go away.

