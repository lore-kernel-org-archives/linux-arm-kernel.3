Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A5CD6A221
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 17:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0jxstw+HdDkmUNCxSNezg+z3DZ+qdKf7DbKMcdrw87E=; b=uBQic9iLIjh2uf9fh+Z/dkn3pD
	PC83PDx5U8VGJo1MTBT/ntlewLryr6iYk8SFVX4sBBcSKUNlrR6J7dRZ41pRmJJ1cEW3gP2hQVIKV
	CBm6Shh4fGMpJv8wBYdr410s1vKc2QSdwyRvlGkN3ExdeN0WH4o1YZmJfYNmMBqKdzQYDDex05Oc/
	uGibdptIde5e6s168hYdcbuBnppOgDIsELfAQoPrpozgCCl8BlhqaSYMsAXcQFevWdQrhgxlrngUd
	fPj6WOzh9GL+BRacRSt2jI5G1f/Ccu4b2Txe8P0zQ5VTHReGnYw/yhdFd0XpxRSSGVmEExMvaqA2b
	OdSFwz9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBdsU-00000000Mim-30AF;
	Thu, 14 Nov 2024 17:43:34 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBdrZ-00000000MVX-19nQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 17:42:38 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-71e55c9d23cso676175b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Nov 2024 09:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731606155; x=1732210955; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0jxstw+HdDkmUNCxSNezg+z3DZ+qdKf7DbKMcdrw87E=;
        b=rqL3OLng1ZTk4ozygW6Bq3cHZoWuUu+ZrxzXEulASy9soO8jgTES0N+yCeeDyU70Gv
         OX3N50eqDXU+HNUFrl+o1wGsfZh3NynDf1k3vyN1lmbdcKMluM3Cy+CDZ8MlSSFKVr1K
         /OjVIZPy4bs6S17dpWIF3Rbs54NOyRyo9N5xstvWYaTcN0+ex+1U/FdnT5KI45rTtNo1
         dtQIeJ0mmaCZRVXTgOt2xU/P7wH6PZzBUKZuHCsDKUT3FgLpRHr8vCdOG2pCITONyoxS
         6o0wMeWjY9jvOq/2Bl+/6AeDRiEKV7X7FugSSKQyPMgRrzJB9bx+vVueHECh4RuyyOzc
         J/gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731606155; x=1732210955;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0jxstw+HdDkmUNCxSNezg+z3DZ+qdKf7DbKMcdrw87E=;
        b=T7CX5O5vgw7Ka8AwbzGmtztnTNV1cDc8dvtV2xyPvaipCn4HZu0slPC9UslaLo4O8R
         4/tXknNG1gjX1sXXwDqQQkcmh6LBTk3zRfN46NXsqcUx4OsuTQFD1WR6cBo7YJotDksy
         A4WEitNQosDL9NWNg8uCM0fwF5TjksfRu9EFcdpXDMYcr8Mv5F5vPVLJgnMtFSHZo5tg
         3xk0pHXhTJIX2tSKI/CO8EebQ0mdgSJ7XKWwUGax+twcnBXYB53aBPTZP9sTJH/tarkp
         bSc1zVuf0+K7uWsNPoKqvM7gC/lsVCWJl0wmPfn905RFthL0lIiEhhb8Pfde6PiNvCzA
         rB7g==
X-Forwarded-Encrypted: i=1; AJvYcCXPJKEeT83ES2vgu1VNn817ojVObHDPh6RSzKu3Bq1iNKkd7W1N+alIPW0ovzQ69II41cj93R8ENdgwzqJK2Zax@lists.infradead.org
X-Gm-Message-State: AOJu0YxwuUnUXnx4wNlPdM+1dskN7slrdcgx+q/9mv84+67M6rviWs/I
	59lV8MEGgDnbajhKCDmm2zSieuDXXlfSmyl7Q29kAHnUYrLYH+fLaGaFEC83EXa6tmdkDXhSe25
	I9A==
X-Google-Smtp-Source: AGHT+IE2t7/BQUDGvQdq1WU4OfDCD4pafvlstYkabCEfeZEIVCwo/4m39wonrcrGj/V1SHEHETmIrMp08OA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:2167:b0:724:67d7:17b2 with SMTP id
 d2e1a72fcca58-72467d71a19mr35667b3a.0.1731606154070; Thu, 14 Nov 2024
 09:42:34 -0800 (PST)
Date: Thu, 14 Nov 2024 09:42:32 -0800
In-Reply-To: <20241108-eaacad12f1eef31481cf0c6c@orel>
Mime-Version: 1.0
References: <20240821223012.3757828-1-vipinsh@google.com> <CAHVum0eSxCTAme8=oV9a=cVaJ9Jzu3-W-3vgbubVZ2qAWVjfJA@mail.gmail.com>
 <CAHVum0fWJW7V5ijtPcXQAtPSdoQSKjzYwMJ-XCRH2_sKs=Kg7g@mail.gmail.com>
 <ZyuiH_CVQqJUoSB-@google.com> <20241108-eaacad12f1eef31481cf0c6c@orel>
Message-ID: <ZzY2iAqNfeiiIGys@google.com>
Subject: Re: [RFC PATCH 0/1] KVM selftests runner for running more than just default
From: Sean Christopherson <seanjc@google.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Vipin Sharma <vipinsh@google.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Anup Patel <anup@brainfault.org>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_094237_313760_1EF918B0 
X-CRM114-Status: GOOD (  34.86  )
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

On Fri, Nov 08, 2024, Andrew Jones wrote:
> On Wed, Nov 06, 2024 at 09:06:39AM -0800, Sean Christopherson wrote:
> > On Fri, Nov 01, 2024, Vipin Sharma wrote:
> > > Phase 3: Provide collection of interesting configurations
> > > 
> > > Specific individual constructs can be combined in a meaningful way to
> > > provide interesting configurations to run on a platform. For example,
> > > user doesn't need to specify each individual configuration instead,
> > > some prebuilt configurations can be exposed like
> > > --stress_test_shadow_mmu, --test_basic_nested
> > 
> > IMO, this shouldn't be baked into the runner, i.e. should not surface as dedicated
> > command line options.  Users shouldn't need to modify the runner just to bring
> > their own configuration.  I also think configurations should be discoverable,
> > e.g. not hardcoded like KUT's unittest.cfg.  A very real problem with KUT's
> > approach is that testing different combinations is frustratingly difficult,
> > because running a testcase with different configuration requires modifying a file
> > that is tracked by git.
> 
> We have support in KUT for environment variables (which are stored in an
> initrd). The feature hasn't been used too much, but x86 applies it to
> configuration parameters needed to execute tests from grub, arm uses it
> for an errata framework allowing tests to run on kernels which may not
> include fixes to host-crashing bugs, and riscv is using them quite a bit
> for providing test parameters and test expected results in order to allow
> SBI tests to be run on a variety of SBI implementations. The environment
> variables are provided in a text file which is not tracked by git. kvm
> selftests can obviously also use environment variables by simply sourcing
> them first in wrapper scripts for the tests.

Oh hell no! :-)

For reproducibility, transparency, determinism, environment variables are pure
evil.  I don't want to discover that I wasn't actually testing what I thought I
was testing because I forgot to set/purge an environment variable.  Ditto for
trying to reproduce a failure reported by someone.

KUT's usage to adjust to the *system* environment is somewhat understandable
But for KVM selftests, there should be absolutely zero reason to need to fall
back to environment variables.  Unlike KUT, which can run in a fairly large variety
of environments, e.g. bare metal vs. virtual, different VMMs, different firmware,
etc., KVM selftests effectively support exactly one environment.

And unlike KUT, KVM selftests are tightly coupled to the kernel.  Yes, it's very
possible to run selftests against different kernels, but I don't think we should
go out of our way to support such usage.  And if an environment needs to skip a
test, it should be super easy to do so if we decouple the test configuration
inputs from the test runner.

> > There are underlying issues with KUT that essentially necessitate that approach,
> > e.g. x86 has several testcases that fail if run without the exact right config.
> > But that's just another reason to NOT follow KUT's pattern, e.g. to force us to
> > write robust tests.
> > 
> > E.g. instead of per-config command line options, let the user specify a file,
> > and/or a directory (using a well known filename pattern to detect configs).
> 
> Could also use an environment variable to specify a file which contains
> a config in a test-specific format if parsing environment variables is
> insufficient or awkward for configuring a test.

There's no reason to use a environment variable for this.  If we want to support
"advanced" setup via a test configuration, then that can simply go in configuration
file that's passed to the runner.

