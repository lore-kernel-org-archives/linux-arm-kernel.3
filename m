Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91388D690EC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 08:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pqNO4mcpLsB6nl6y5oYnZ+p9PNe/HBxDvPKQfTS22pA=; b=aYgiK6ms9R+apW1NQ11/fxSloj
	Gk2oQfo1AVmohgTeL9jjF6kFxIcIRYes32Iuo8TVptZbnvMQ58k5IsIymk3XAVhp9zDy8oXtXD3ew
	FlK4qxQXoT7hP9LCE5B6GUvRZ7p11MpzIO8rtQdpl94lzrzC1m0o0k2yvuwq20pnD4zc7Wp7jfAKa
	vK2k7vvqpRQcrojNyhOWP5hD/sQA8X9sIFQ4JZxVVBjm+a+b2o8H9NOzOe1FtlWLsYBcI1Qojs3pf
	Hg+vgjzRaZiYUc3iN/eIryoWMHQt49SSd2nlALeY//x7JCB78gprkMx2SLnenC4QYPRXscLVfCLJt
	c5rAIddg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGa7m-0000000F2lZ-3NNj;
	Thu, 28 Nov 2024 08:43:46 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGa6m-0000000F2Wc-34WZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 08:42:46 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5cfc035649bso671575a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Nov 2024 00:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1732783363; x=1733388163; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pqNO4mcpLsB6nl6y5oYnZ+p9PNe/HBxDvPKQfTS22pA=;
        b=pIPcKW2brdjmCIQDDEAU2hLOpuH452KGc9Bq2wy8Nsw45dj5p3/CLWyqutusJYeYyc
         WHbhlrszhxJ54y8UrdFMKExzjYlpI3dkHrm7w70d6tSyBj1yc7rzQbZWXDSSI4LuTSk4
         fTMQy/1HVlPxTTuThbzhi7pDJRa7os0tj8VHKmlg9Z4h7QJKjWv0Fzq05PRVBCTiXPy8
         pRnhIEC66K7us84dDC+gINKRljAVx2cKQOLCRZuQsJQFRSgN3OVJqYo1mrxp4hH7o4ic
         QNllwtRcj9SoKqEwu4657hXC5aJ0l/JfvqJKQc2zsx1tIwAcKc9mz9ZpFrOG9BgSoLxW
         rt1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732783363; x=1733388163;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pqNO4mcpLsB6nl6y5oYnZ+p9PNe/HBxDvPKQfTS22pA=;
        b=Uk4+c4aInr0jcd713uBPUo6RFn+v1Y8JOHJgoRblxvAnilICm4OWkUZ+Qjp4arhfCv
         1TTHs+ZVKbI1Unu73VHgQjcKCy/RJ+l/oumPEhbKyE32B/FpKDeUV6bCjA8p2cAshSsJ
         NopoL32fd03jR35UDzFmYuAYaIDOeJqE5hebDzNYEOz7GP9Oxbiey7yK5/Se42ZcRMjG
         a6u0JQYX6/6syQ0obdZilN+LCwWfK5SVK/KGPfdStf+74rrKWy+ARfkJVyMiJBdhN4jG
         1NUw63pyTWDzfibzBJIT7JxCIh6THyScPvSljLEmODZBBNzYqbMZ43a6R3s1puTiWb9V
         gYbg==
X-Forwarded-Encrypted: i=1; AJvYcCVuF+9JuT7fDab3aYhD/Dwl64JG2+C8m3f5rj9J2urpb9TS8pX1ky9fzbdtczghgZJilwVSruihvO0tmICyhwiA@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3FMvlJIStcZ+Ow/k0BUL16T1MacijcMwYyBQG4dJt7D+rbZ23
	YRRO+RnudaIV7+r86IK2+o2qYaibJaAn4vARhoLZiiIuDBNAWg02wA9TSJTIyDk=
X-Gm-Gg: ASbGncvBVKebAcqRAiR8XyhtUvygzbcJuqDyoWRV4sKUynQ1Ako49rmyxp7O+w6WGih
	KahSerIDfDCM9rzRE97hi8FQGHM4FrlpIUX/N1Ho28W3HRoerUJsM1yn3aqb8VErs6WKf7EiDok
	K1zxgfwsf10achdrK17AqkfPSxUHDR76Q0PfqMaGYQwKYAViM57NZ1AxPKfjBIWg4eKj5nGKHTl
	AuWX/JuobPGwXKFWmxPKCY/sWwXJmbf6wl7AuAJUuLkpPnwk/blcTf5nxNeQFy3rSyDP55iBsD2
	1QHXPIj3EboKEUbvcrcgVfbaReVQzcI40l0=
X-Google-Smtp-Source: AGHT+IEtMpQZWj4endJlLK3Ilr+mbQxtLK9EL+/Wn1Pn2YYjrHxtBwEvTjmbyjJN4oWe/ENTW6ynRg==
X-Received: by 2002:a17:907:688f:b0:aa5:d1c:3dac with SMTP id a640c23a62f3a-aa580fdd57emr475064966b.36.1732783362949;
        Thu, 28 Nov 2024 00:42:42 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5997ffc1bsm41610466b.83.2024.11.28.00.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 00:42:42 -0800 (PST)
Date: Thu, 28 Nov 2024 09:42:41 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	James Houghton <jthoughton@google.com>, Muhammad Usama Anjum <usama.anjum@collabora.com>
Subject: Re: [PATCH v4 14/16] KVM: selftests: Provide empty 'all' and 'clean'
 targets for unsupported ARCHs
Message-ID: <20241128-24a975e227dd4b86393f21ed@orel>
References: <20241128005547.4077116-1-seanjc@google.com>
 <20241128005547.4077116-15-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241128005547.4077116-15-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_004244_774570_F9F817B7 
X-CRM114-Status: GOOD (  14.13  )
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

On Wed, Nov 27, 2024 at 04:55:45PM -0800, Sean Christopherson wrote:
> Provide empty targets for KVM selftests if the target architecture is
> unsupported to make it obvious which architectures are supported, and so
> that various side effects don't fail and/or do weird things, e.g. as is,
> "mkdir -p $(sort $(dir $(TEST_GEN_PROGS)))" fails due to a missing operand,
> and conversely, "$(shell mkdir -p $(sort $(OUTPUT)/$(ARCH_DIR) ..." will
> create an empty, useless directory for the unsupported architecture.
> 
> Move the guts of the Makefile to Makefile.kvm so that it's easier to see
> that the if-statement effectively guards all of KVM selftests.
> 
> Reported-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  tools/testing/selftests/kvm/.gitignore   |   1 +
>  tools/testing/selftests/kvm/Makefile     | 336 +----------------------
>  tools/testing/selftests/kvm/Makefile.kvm | 334 ++++++++++++++++++++++
>  3 files changed, 340 insertions(+), 331 deletions(-)
>  create mode 100644 tools/testing/selftests/kvm/Makefile.kvm
>

Acked-by: Andrew Jones <ajones@ventanamicro.com>

