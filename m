Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86849C83F10
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 00:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dc+RqRq+W6sCtPNEa/tVWodO3UqzUt3YwAEia9IzCeQ=; b=Okg1Bq6GK+l8KOvCUIgtUAacvE
	J6+D5+onlgbejYFzgsrNR94yPBXWZcvUufzaNHRSFnVG+rRmEFuyPqQGDnPWxl8jT4/QxBZkPBuPm
	IRFnKVCj+2o+w+8MZkIFSkKj7abVOkzbgpTmwJNsOyHFva20GpvyKvjZZ6ZsjeGNko2pXSSpOEhM5
	pSxE44RpwY37wFk2+4uYEDZM7FyW8Fk8JZCeSEP0+8yf2m8CzlShydUNgl6MzNF/h1uUSdvte2eEd
	i7hjEPW8lwqpQsKTqhruus6GjHXvfoNBqDy89c4kWeNFRaSIcHPTOPxgOVA78kch/PJPy0bibXAvY
	LUnJyjCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZf4W-0000000AJu1-3Udy;
	Thu, 10 Jul 2025 00:23:32 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZf1Y-0000000AJI4-27NZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 00:20:29 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-3141f9ce4e2so696362a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Jul 2025 17:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752106827; x=1752711627; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Dc+RqRq+W6sCtPNEa/tVWodO3UqzUt3YwAEia9IzCeQ=;
        b=vVy6Yfj+IUqfgT5Yr5BUoHLiOT6BJcT9GLHfaxgurHUYNMHvWLr8EZSKNhQ9HRcW9D
         9M4qunJzsm3n4/NvjGvnKCCbuzYYXyo01J0GSUDF0TtI9uO0NrpCixN7t+qLtRtcH+sb
         GfqFIp7/inTkY5fC5J0i8zq3d/rOg6Q8LHNlCKhIMgxktpF94dGBAtE/GVMhWVLmC/0C
         55np6aLVlFH1z9DtjGN63XXPNsxa7SyY/4qJtUr2n5HdeRdRexa9zWqGlXe8oihJApbU
         vJc9P2bHIUvcnX8EKO5w/1ykuBQkihLM2jdQLotmE8HC5lFR3ObWHQrSF/x1GSkHk2ju
         a0wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752106827; x=1752711627;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dc+RqRq+W6sCtPNEa/tVWodO3UqzUt3YwAEia9IzCeQ=;
        b=xBvA2u8BevmXae5LVBcAuYNGbsY+JeN3c9STtT1Txg/FlMi0pd4nAOg2cAGPc/N35C
         xJYjZMODoONex27rrib21PFJoukfKdJqJ66DFndyRfP11FXLPDrXcGJfHNalZXBa5cZL
         Unzd4p1TervKB3U0JQs7HIO4f1It4gB6g85z3fnUP+xPJmkXcEzSB4cubeVVXIMqmyjE
         Iy6J1OGTO7zpuB/PP3j8wBkbTH0BfDRhlR8SuFlZL3gB9+EjQYFnFtnmH5tkMN9RMy8x
         Al8G+Rdw9FqALPLyCfnt+x93iMH9T86TaRKpiT3zCkmZ7abTzuh+U1oMPJlgOhD9xYVx
         rzEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXSTw5jngI7ad4cvh7+l5WUdoWFrb59c88IMqCzXor+YU0vgOHDWHg4qdOLSF/kVkmeuhDIFlL8kIHdhIlo0z/@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6TtJP+kO3h6UP372M2/H0nNFNbSY8+saeqZjYJKOKqzouSUbA
	zfnKaXRVpHINi9c2TwnyLoepIuinspk7UvjH+kedzc80Om8WtML2Waxagbf5BjRhHTJuvVXQN8z
	aq1uw/A==
X-Google-Smtp-Source: AGHT+IG0GxjloovxJcYgMFXWq5yLXp3npn9Ujx5nQOTSIQhv0jOvc/gWF8I+wEWsfveSljef5y7J1NorZPc=
X-Received: from pjtu13.prod.google.com ([2002:a17:90a:c88d:b0:313:2d44:397b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:28cb:b0:312:eaea:afa1
 with SMTP id 98e67ed59e1d1-31c3f05249dmr924623a91.29.1752106827053; Wed, 09
 Jul 2025 17:20:27 -0700 (PDT)
Date: Wed, 9 Jul 2025 17:20:25 -0700
In-Reply-To: <20250606235619.1841595-2-vipinsh@google.com>
Mime-Version: 1.0
References: <20250606235619.1841595-1-vipinsh@google.com> <20250606235619.1841595-2-vipinsh@google.com>
Message-ID: <aG8HSc_yj6O69Uu1@google.com>
Subject: Re: [PATCH v2 01/15] KVM: selftest: Create KVM selftest runner
From: Sean Christopherson <seanjc@google.com>
To: Vipin Sharma <vipinsh@google.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, pbonzini@redhat.com, 
	anup@brainfault.org, borntraeger@linux.ibm.com, frankja@linux.ibm.com, 
	imbrenda@linux.ibm.com, maz@kernel.org, oliver.upton@linux.dev, 
	dmatlack@google.com
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_172028_544711_9146E761 
X-CRM114-Status: UNSURE (   8.80  )
X-CRM114-Notice: Please train this message.
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

On Fri, Jun 06, 2025, Vipin Sharma wrote:
> +    parser.add_argument("--test-files",
> +                        nargs="*",
> +                        default=[],
> +                        help="Test files to run. Provide the space separated test file paths")
> +
> +    parser.add_argument("--test-dirs",
> +                        nargs="*",
> +                        default=[],
> +                        help="Run tests in the given directory and all of its sub directories. Provide the space separated paths to add multiple directories.")

Almost forgot.  My vote would be to make these easier to reference, e.g.

 -t/--testcases
 -d/--dirs

or if folks like the --test-{files,dirs} names, just add the single char shorthand?

