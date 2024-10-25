Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB51D0C601
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 12:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1rwfDoTPSMRtfXHmINVRgiQrkEDJjKEQXCOsodjYaCQ=; b=jqMHLBPftrqn3W2h4sk6w6yNCq
	B1Myb69bEWu96/Epnkm/cheXEz7IVeZajJLIAQ1D2fKNDRPfGoXChnjgLR7Gn/NepAOgOzuuApgkG
	AIRuNmVF8MTaeGypuxziMbWtS+OX1L5T/HaU8eMHkus5ccTTrwsXFp3CXVQOs8I9kLJRWkikIdjS0
	hWMe3h+PUbf4qXBN5HEw90eCrI2su8OGXc10cD1SIa7KLCRxAGp9G7b9BNTRvxB4RRmAIjQgxK79L
	SFKVRo1/jiTVE9A0WGelliI405/sXkGy0agIzSu3tcJ9QHiErvQmuB4XJIUfFATqRFT786qlGgGmU
	2seseV1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4JJf-00000003dKt-2wBA;
	Fri, 25 Oct 2024 12:21:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4JI2-00000003cuy-2e8T
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 12:19:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729858776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1rwfDoTPSMRtfXHmINVRgiQrkEDJjKEQXCOsodjYaCQ=;
	b=f9bVcjvz3Fq4/aW6H6u6agZkEFu2bNN7SQSoSq64gqkpr7CtS7qqLpMldBArWF6Xq0oDt0
	qYG4OpFr80QUaSD8eUoBhburJC5vXf6Tg+/1L1rYUvOud7nhq4zYfWisSg1OnqDflssf83
	M6OFytWcH8XaveGR4GhLLWi+We970lo=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-342-vvk1Z4I9OIGPkrHlzM4JKQ-1; Fri, 25 Oct 2024 08:18:07 -0400
X-MC-Unique: vvk1Z4I9OIGPkrHlzM4JKQ-1
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-6e5bdb9244eso32852917b3.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 05:18:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729858687; x=1730463487;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1rwfDoTPSMRtfXHmINVRgiQrkEDJjKEQXCOsodjYaCQ=;
        b=M5MNAZxkNirOTbNpc5Uu+lPCYUMSKn+4mJi7cuagoqDDUJLtnsOFe7kQeczC9Fgkwk
         BAWtb/fAUPEGtLy8s+T5VI5WdG1Ox6WH4ulf6w+MTjclKTDxJgHffDwMAr6S2s1XQhJo
         YXSDqYKP4u/04AQ96ywaGgpxy1eWOTcCnJAouX35pEGbYTPRnt+XtnZ7B7Ojk0QLL6GE
         47HqA37276+k1jcmnfuhoGTHDnHti+MNGcJbtXCATZVVHQ2bLzK2CzT/3MPr6zX8lrO3
         9SO0BXIBi/9+RqGGxx/uFQWUp239v3YmtkDVUi0xkyKrXsDOq9c5gGVwhzE33vc1wLuZ
         GLiA==
X-Forwarded-Encrypted: i=1; AJvYcCX2hrlCKHEw0GmVt3YU5BzMj+stsqlja4O3ZuO7dKcfxMxQ3DPkGTj2DzzXGKwXvfLJMGTVDBwlvjWHBg4op5GT@lists.infradead.org
X-Gm-Message-State: AOJu0YyZ5OIG1HL5BAo2XPwcumL8bMi3yJtLkL7USTAu0/FyCeGXKYQQ
	VLTPkvaNj9cnRHi5nn8CVGDm5CXQhaKUHzBaI98dGLavsAETY2EtMO8Zc9Cg+f0yo6zC9bA0VC3
	LrJN5GN9XyF29Vg1ws+v2BslMgbkBgaBti79eC9xLjakT7OFVu9WgwgQy+E4+hyXGGkH9QnI3
X-Received: by 2002:a05:6902:2505:b0:e29:6692:d84 with SMTP id 3f1490d57ef6-e2f2fbc0f20mr5328319276.36.1729858687236;
        Fri, 25 Oct 2024 05:18:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1rUBoEoKRi1UMAQxws2WSnv93vUPbVshx6vDErv0r8+kymJM8JDcqvagwSTJs1tTUrJWTGA==
X-Received: by 2002:a05:6902:2505:b0:e29:6692:d84 with SMTP id 3f1490d57ef6-e2f2fbc0f20mr5328299276.36.1729858686859;
        Fri, 25 Oct 2024 05:18:06 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-461323abd6csm5321731cf.94.2024.10.25.05.18.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 05:18:05 -0700 (PDT)
Message-ID: <92d755af-e19b-49a5-b4df-a8ed0fb7aece@redhat.com>
Date: Fri, 25 Oct 2024 14:18:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: arm64: Don't eagerly teardown the vgic on init error
To: Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, stable@vger.kernel.org,
 Alexander Potapenko <glider@google.com>
References: <20241009183603.3221824-1-maz@kernel.org>
 <3f0918bf-0265-4714-9660-89b75da49859@sirena.org.uk>
 <86ldyd2x7t.wl-maz@kernel.org>
 <eb6e7e29-b0a8-47b1-94c4-f01569aa55cb@sirena.org.uk>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <eb6e7e29-b0a8-47b1-94c4-f01569aa55cb@sirena.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_051938_791324_00DE161B 
X-CRM114-Status: GOOD (  19.07  )
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

Hi Mark, Marc,

On 10/25/24 12:54, Mark Brown wrote:
> On Thu, Oct 24, 2024 at 07:05:10PM +0100, Marc Zyngier wrote:
>> Mark Brown <broonie@kernel.org> wrote:
> 
>>> # ==== Test Assertion Failure ====
>>> #   lib/kvm_util.c:724: false
>>> #   pid=1947 tid=1947 errno=5 - Input/output error
>>> #      1	0x0000000000404edb: __vm_mem_region_delete at kvm_util.c:724 (discriminator 5)
>>> #      2	0x0000000000405d0b: kvm_vm_free at kvm_util.c:762 (discriminator 12)
>>> #      3	0x0000000000402d5f: vm_gic_destroy at vgic_init.c:101
>>> #      4	 (inlined by) test_vcpus_then_vgic at vgic_init.c:368
>>> #      5	 (inlined by) run_tests at vgic_init.c:720
>>> #      6	0x0000000000401a6f: main at vgic_init.c:748
>>> #      7	0x0000ffffa7b37543: ?? ??:0
>>> #      8	0x0000ffffa7b37617: ?? ??:0
>>> #      9	0x0000000000401b6f: _start at ??:?
>>> #   KVM killed/bugged the VM, check the kernel log for clues
>>> not ok 10 selftests: kvm: vgic_init # exit=254
> 
>>> which does rather look like a test bug rather than a problem in the
>>> change itself.
> 
>> Well, the test tries to do braindead things, and then the test
>> infrastructure seems surprised that KVM tells it to bugger off...
> 
>> I can paper over it with this (see below), but frankly, someone who
>> actually cares about this crap should take a look (and ownership).
As I am the original contributor of the crap I can definitively have a
look at it and take ownership. Those tests were originally written
because the init sequence was different between kvmtool and qemu and we
had regular regressions when touching the init sequence at some point.
Now this may be not valid anymore ...
> 
> I'm not even sure that's a terrible fix, looking at the changelog I get
> the impression the test is deliberately looking to do problematic things
> with the goal of making sure that the kernel handles them appropriately.
> That's not interacting well with the KVM selftest framework's general
> assert early assert often approach but it's a reasonable thing to want
Can you elaborate on the "assert early assert often approach". What
shall this test rather do according to you?

I am OoO next week but I can have a look afterwards. On which machine is
it failing?

Thanks

Eric


> to test so relaxing the asserts like this is one way of squaring the
> circile.


