Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C150AD637A8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 18:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=/fUPXvWv9v0Mh/WyGQgAC8FHYBBV253S8a6S2mHs2j8=; b=Tszv9RD1FRhnHP
	kIPreEf8S250eXSJkwuafnKe9dcFHbW13GAndKwCIZVpAVJpiS5InigZvuAOBEZ5Nlfq/0kN0uX1K
	GgLiIvIVzAuPv9VZh7gikJDQMBZneVhd44UV0gp3egRmuYq2lxvPIMVYP/EvTaMTTDq+V7hRVnTkr
	ARDOtXo0PfXtFIu3BCKxOy2c6Kc5DQaxEPcyRzi2nAHg3c0//VDWCz2EY0hrfrLuuOTa2bt/Z3T0I
	xG9k8OcRoJKqlPdxIKGQy6Rz/G1EnGseYUU6tsmqrr95YuaA6FHsPu0VoqAmdr+phZOAkRgUsia4m
	BSEQT9xSyJKWLMYW3Qfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBIJD-00000007kaS-40DF;
	Wed, 13 Nov 2024 18:41:43 +0000
Received: from mail-io1-xd4a.google.com ([2607:f8b0:4864:20::d4a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBIHJ-00000007jqf-2ekF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 18:39:47 +0000
Received: by mail-io1-xd4a.google.com with SMTP id ca18e2360f4ac-83aaedba7b5so787870939f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Nov 2024 10:39:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731523184; x=1732127984; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/fUPXvWv9v0Mh/WyGQgAC8FHYBBV253S8a6S2mHs2j8=;
        b=Dgm+/lfS+VAOo9vDhT3kSWphrk58yaSeg5UM/uI54t1NCIqcYWqsKpdnohnPiQ26dw
         ijiGaGSGy6H2FodAERGgRgCiIHp+BE1bDPWUUAO5DfHaXbPMY01ybPe3/6wGdvd7Gqxt
         lLY9rcuVeDBD/nEuDEUYsDqLH95Hizh7W6jqmKXDBGs/ttHAPKdX77PrshIArS2ZWIxk
         kZPLkPLex5c2ZbpqhcakJQ037xo8xiAAmlIX1XPK8TjMqwEKNqUCm6O7xYFqiYJ9QSQ2
         ErEM09tyERnscNc1mzfPgZPE9QL1dJi7FSCnuWNjYwP8j38hCRb0Qt/8aS5wIVtqTpzr
         ++eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731523184; x=1732127984;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/fUPXvWv9v0Mh/WyGQgAC8FHYBBV253S8a6S2mHs2j8=;
        b=Xntz/LIhjp/mGf9QXJT9GX2urFCbsb77Jb1Ytc8ZlMjOf3v17AsKOKpQCpoa95hFgJ
         MBqos7fUGyVjNS0Lkx8W8ObPmgFJ2WQCQVtr1Rq3YoSx+5j0DQ3F/g1dg3j4uzr163HX
         +hjsVHBagb82AXYrA5mIMMPnhfwMqeBAJpUndimGezVboJfS7vBGqmZAhSVW1CWl2p5j
         dm7c/cOYrlqTe0jyzsMkYqHsZmvKoBcsaywbUe0v7Xi+w6phz6wmSQINW7Yl4XkxWArz
         eoMGVUS90BF1l5RsRUAOwi+zzhzrwURaFUHkN8O2Mzs6up+Cc6njxrx83d7wpw9y2jfI
         jQEw==
X-Forwarded-Encrypted: i=1; AJvYcCXEPYjbIlIZvmmXI4bsd1TXWd6/EqhKj1b0zLJBT00oH5gqhTIWoHNykBHgxQ7NUHjxfwz8u7JQcoUai2kcpXoF@lists.infradead.org
X-Gm-Message-State: AOJu0YzaBbP+vFZYGr198KQulWV2v0T7oxh7zF7H+VIme0N0J6zd0GzL
	JQdhfmMhC/Q6txed0dhy765Fs7n+bmIsJiurYhdz52WxX0B/LRQJdAWDpPnHRI+WJheLLQWOcEy
	8/5jURA5Zy3fbH+QxJN2QjQ==
X-Google-Smtp-Source: AGHT+IFqNa2jrXVUDfm9IE+oYt5yFt1zslo8K13JW/BJldIHrq7v5sp1QoU1+LNMj81fKDzjJdmH4l1lpTYb1/+IBg==
X-Received: from coltonlewis-kvm.c.googlers.com ([fda3:e722:ac3:cc00:11b:3898:ac11:fa18])
 (user=coltonlewis job=sendgmr) by 2002:a05:6602:583:b0:83a:ac70:becf with
 SMTP id ca18e2360f4ac-83e03357885mr4245839f.3.1731523183650; Wed, 13 Nov 2024
 10:39:43 -0800 (PST)
Date: Wed, 13 Nov 2024 18:39:42 +0000
In-Reply-To: <gsnt34jv9el6.fsf@coltonlewis-kvm.c.googlers.com> (message from
 Colton Lewis on Wed, 13 Nov 2024 18:24:37 +0000)
Mime-Version: 1.0
Message-ID: <gsntzfm37zbl.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v7 4/5] x86: perf: Refactor misc flag assignments
From: Colton Lewis <coltonlewis@google.com>
To: Colton Lewis <coltonlewis@google.com>
Cc: peterz@infradead.org, kvm@vger.kernel.org, oliver.upton@linux.dev, 
	seanjc@google.com, mingo@redhat.com, acme@kernel.org, namhyung@kernel.org, 
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org, 
	irogers@google.com, adrian.hunter@intel.com, kan.liang@linux.intel.com, 
	will@kernel.org, linux@armlinux.org.uk, catalin.marinas@arm.com, 
	mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, 
	naveen@kernel.org, hca@linux.ibm.com, gor@linux.ibm.com, 
	agordeev@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com, 
	tglx@linutronix.de, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_103945_726128_89E6BD06 
X-CRM114-Status: GOOD (  12.41  )
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

Colton Lewis <coltonlewis@google.com> writes:

> Peter Zijlstra <peterz@infradead.org> writes:

>> On Fri, Nov 08, 2024 at 08:20:44PM +0100, Peter Zijlstra wrote:

>>> Isn't the below more or less what you want?

>>> static unsigned long misc_flags(struct pt_regs *regs)
>>> {
>>> 	unsigned long flags = 0;

>>> 	if (regs->flags & PERF_EFLAGS_EXACT)
>>> 		flags |= PERF_RECORD_MISC_EXACT_IP;

>>> 	return flags;
>>> }

>>> static unsigned long native_flags(struct pt_regs *regs)
>>> {
>>> 	unsigned long flags = 0;

>>> 	if (user_mode(regs))
>>> 		flags |= PERF_RECORD_MISC_USER;
>>> 	else
>>> 		flags |= PERF_RECORD_MISC_KERNEL;

>>> 	return flags;
>>> }

>>> static unsigned long guest_flags(struct pt_regs *regs)
>>> {
>>> 	unsigned long guest_state = perf_guest_state();
>>> 	unsigned long flags = 0;

>>> 	if (guest_state & PERF_GUEST_ACTIVE) {
>>> 		if (guest_state & PERF_GUEST_USER)
>>> 			flags |= PERF_RECORD_MISC_GUEST_USER;
>>> 		else
>>> 			flags |= PERF_RECORD_MISC_GUEST_KERNEL;
>>> 	}

>>> 	return flags;
>>> }

>>> unsigned long perf_arch_guest_misc_flags(struct pt_regs *regs)
>>> {
>>> 	unsigned long flags;

>>> 	flags = misc_flags(regs);
>>> 	flags |= guest_flags(regs);

>>> 	return flags;
>>> }

>>> unsigned long perf_arch_misc_flags(struct pt_regs *regs)
>>> {
>>> 	unsigned long flags;
>>> 	unsigned long guest;

>>> 	flags = misc_flags(regs);
>>> 	guest = guest_flags(regs);
>>> 	if (guest)
>>> 		flags |= guest;
>>> 	else
>>> 		flags |= native_flags(regs);

>>> 	return flags;
>>> }

>> This last can be written more concise:

>> unsigned long perf_arch_misc_flags(struct pt_regs *regs)
>> {
>> 	unsigned long flags;

>> 	flags = guest_flags(regs);
>> 	if (!flags)
>> 		flags |= native_flags(regs);

>> 	flgs |= misc_flags(regs);

>> 	return flags;
>> }

> This isn't right because it is choosing to return guest or native
> flags depending on the presence of guest flags, but that's not what we
> want.

> See perf_misc_flags in kernel/events/core.c which chooses to return
> perf_arch_guest_misc_flags or perf_arch_misc_flags depending on
> should_sample_guest which depends on more than current guest state.

This is in the next patch. Excuse me for not clarifying.

> But I will take some of your suggestions to split the functions out
> more.

