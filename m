Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C17E2D637A3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 18:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=iHp51deuGbbVdiRm/3lkBsA6sLNGX+gRE7+ejiXPpUI=; b=rrNP9aQXPpGgDE
	sDL5Dp8ohwSaqXBhxvVoCS2CrCF1aKI2lRcrClGaM/PbRRFjkbWdnFeuAUyaRpQPTVQeTSQzJab6e
	IM3yJOerr4Spll8m5lPPz7sVMDC6B9ZO7TRKIp9JrzgTx8RjI2YCA5r13RDv6KPybnl5v0l96seqO
	sBi2nv6xoYY+bqYHFphkVaP6Ca2ld/8mlwjpHNZDeSnrbS2e4PvZIZKJSTVolV8XgKNHl5ru3KkpC
	wR5wC6H5l04plOiq55IooBT3C8eP3Q10XbE+SKW/frI3bl0s83mhVkUcmMEYxsuyhh/Ve1ifVULJp
	kJhSa8BtKQN+S2uu/mlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBI6n-00000007i7M-38M6;
	Wed, 13 Nov 2024 18:28:53 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBI2j-00000007hMJ-2BEA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 18:24:43 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e2971589916so11408639276.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Nov 2024 10:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731522280; x=1732127080; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iHp51deuGbbVdiRm/3lkBsA6sLNGX+gRE7+ejiXPpUI=;
        b=0IoDu4Ov4E2reKXbuqmXTpD95koeYKBVrI6ZMkw+MLvDnyD+IMEzuJrNpA/1J7oni8
         4rVZYR8Kp6xELqfFSTDZaamY/Om9aZu+nE235kgxLsEmbYtxJi4r0F3KWmsMLVFpzKq2
         +AGq4LbdYvyy9HyO6L5yr3X6JuVdJAw6duoGTtFm1VhDS1sja8wB1GOAkHL79nXFowEu
         8MA2TYQUqJNga5iCB425z4xQ7joj+ERayZO0wzBYaXcJXAMNCPyHm+8EFEfoo10Fwn6M
         8M7oz8sO4yFzETJ53flefkvdP2E8KVoxsPsb0DMuVhivIIDekeFJmcP2Z7VBl2ZNvOvA
         3NcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731522280; x=1732127080;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iHp51deuGbbVdiRm/3lkBsA6sLNGX+gRE7+ejiXPpUI=;
        b=jdNFbRhjFCR43JB26dkZdTVAEMqkA3svPcGY57KMmB4GGXeFRBk+T/667+72IzmMa7
         nBT89jMZYTOyTzVjMNFbOW9099GyqNf/lqAXhBh/MdWuorhOHFAQgPiw0MQ16YzvnsU4
         Eu7pVM01HL1mC4ZF8Gba88xaauyRDj8OjaOhQRcjo7UrlcY/GCUTeVQc43Fhb1fxJbjS
         jQAfcnXlBuo5zgr3D2GYM098XaLHNxOudS87cBuDQNtgyFJCHKA5iPNVwYcQQK/igAG7
         LBZYQf+34F8jydI743/hbcCKhEHNj1nMcJtL0dXEuQWJaQFeU95e9d04KgDbcmoUeYzR
         sjfw==
X-Forwarded-Encrypted: i=1; AJvYcCUyKWRE5uV1B/pxn4stJ8xE4G5CKdr0tRcTPKm6doQXfBmXzfCPOvW5p+q9UbHo1iXoiGap5ONmvOAFZr68sayF@lists.infradead.org
X-Gm-Message-State: AOJu0YylP9atPhckQBTb7AbbXh+qiWEljS6WDT9vIcD6Z3O4esQpziRW
	y6gTsxdjD4hy0OX6F+lWFx18ox/24WnJ03XifsHw9UrE0NwH9D4pEmenbthsOf2z9zxw0GjzPYV
	lcU90WO2QqmCW2QTqzFYYyw==
X-Google-Smtp-Source: AGHT+IESgEUveC8yQTk46ZdY46xE3OFDyejSgTzDblsZ0XI5Dgk48gNFxBwSyDJHjZLKVnBVYwtz3KJTaqWB5c2AfQ==
X-Received: from coltonlewis-kvm.c.googlers.com ([fda3:e722:ac3:cc00:11b:3898:ac11:fa18])
 (user=coltonlewis job=sendgmr) by 2002:a25:6fc1:0:b0:e2b:cd55:11b3 with SMTP
 id 3f1490d57ef6-e35ed246250mr2982276.5.1731522279438; Wed, 13 Nov 2024
 10:24:39 -0800 (PST)
Date: Wed, 13 Nov 2024 18:24:37 +0000
In-Reply-To: <20241108193204.GC38972@noisy.programming.kicks-ass.net> (message
 from Peter Zijlstra on Fri, 8 Nov 2024 20:32:04 +0100)
Mime-Version: 1.0
Message-ID: <gsnt34jv9el6.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v7 4/5] x86: perf: Refactor misc flag assignments
From: Colton Lewis <coltonlewis@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: kvm@vger.kernel.org, oliver.upton@linux.dev, seanjc@google.com, 
	mingo@redhat.com, acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com, 
	adrian.hunter@intel.com, kan.liang@linux.intel.com, will@kernel.org, 
	linux@armlinux.org.uk, catalin.marinas@arm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org, 
	hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com, 
	borntraeger@linux.ibm.com, svens@linux.ibm.com, tglx@linutronix.de, 
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_102441_587550_88E2F89D 
X-CRM114-Status: GOOD (  11.35  )
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

Peter Zijlstra <peterz@infradead.org> writes:

> On Fri, Nov 08, 2024 at 08:20:44PM +0100, Peter Zijlstra wrote:

>> Isn't the below more or less what you want?

>> static unsigned long misc_flags(struct pt_regs *regs)
>> {
>> 	unsigned long flags = 0;

>> 	if (regs->flags & PERF_EFLAGS_EXACT)
>> 		flags |= PERF_RECORD_MISC_EXACT_IP;

>> 	return flags;
>> }

>> static unsigned long native_flags(struct pt_regs *regs)
>> {
>> 	unsigned long flags = 0;

>> 	if (user_mode(regs))
>> 		flags |= PERF_RECORD_MISC_USER;
>> 	else
>> 		flags |= PERF_RECORD_MISC_KERNEL;

>> 	return flags;
>> }

>> static unsigned long guest_flags(struct pt_regs *regs)
>> {
>> 	unsigned long guest_state = perf_guest_state();
>> 	unsigned long flags = 0;

>> 	if (guest_state & PERF_GUEST_ACTIVE) {
>> 		if (guest_state & PERF_GUEST_USER)
>> 			flags |= PERF_RECORD_MISC_GUEST_USER;
>> 		else
>> 			flags |= PERF_RECORD_MISC_GUEST_KERNEL;
>> 	}

>> 	return flags;
>> }

>> unsigned long perf_arch_guest_misc_flags(struct pt_regs *regs)
>> {
>> 	unsigned long flags;

>> 	flags = misc_flags(regs);
>> 	flags |= guest_flags(regs);

>> 	return flags;
>> }

>> unsigned long perf_arch_misc_flags(struct pt_regs *regs)
>> {
>> 	unsigned long flags;
>> 	unsigned long guest;

>> 	flags = misc_flags(regs);
>> 	guest = guest_flags(regs);
>> 	if (guest)
>> 		flags |= guest;
>> 	else
>> 		flags |= native_flags(regs);

>> 	return flags;
>> }

> This last can be written more concise:

> unsigned long perf_arch_misc_flags(struct pt_regs *regs)
> {
> 	unsigned long flags;

> 	flags = guest_flags(regs);
> 	if (!flags)
> 		flags |= native_flags(regs);

> 	flgs |= misc_flags(regs);

> 	return flags;
> }

This isn't right because it is choosing to return guest or native
flags depending on the presence of guest flags, but that's not what we
want.

See perf_misc_flags in kernel/events/core.c which chooses to return
perf_arch_guest_misc_flags or perf_arch_misc_flags depending on
should_sample_guest which depends on more than current guest state.

But I will take some of your suggestions to split the functions out
more.

