Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B649FFD377A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 17:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=P/hBoEMiXYtzSJAai3x+/Zjn0NP0IL/2TZ2kRQnBAyM=; b=IQ3s62h6c0Yflj
	ELzc0cxnpVEra6SyfQ36vZD9x2STMODRES9cx99Td7GxEH3yWk2wS8J6qCDP+SHXbLN2Zqujm/I6H
	2BNXIgxl6lCOkAI84LS1AZT5Fv67UNIJv6CDFUErDaBslOF2YGokXU7VKI3IDOR/NLF+ce07osMnL
	XgQ5+XHmUncOMXggCRsSKtNXyQLjvQO5V3XafAsy6rBadhcF6YAE0rE8qSRPFeqU+cceFz2Ez1iE0
	3xcMfUn111M0XiYynaJkFcgLMByhdpNxZhVJwpbHjMLHjMPn2vrcfOPAV5Sp5YYiF9OvSL/wyY2Ma
	NW0b5eE+fVPzeA7TD0+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvIwj-00000004gdw-0DdK;
	Wed, 25 Feb 2026 17:45:13 +0000
Received: from mail-oo1-xc4a.google.com ([2607:f8b0:4864:20::c4a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvIwf-00000004gdU-1SSd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 17:45:11 +0000
Received: by mail-oo1-xc4a.google.com with SMTP id 006d021491bc7-672c40f3873so474636eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 09:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772041507; x=1772646307; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P/hBoEMiXYtzSJAai3x+/Zjn0NP0IL/2TZ2kRQnBAyM=;
        b=I1ekVm6SMkf2pW9ZHj63tYTLuFvgzFWmvcQE1cFeV5+VJRP3JR0h3T/BxJCE39eM9J
         Dj3sQFr8T4QrHhEqZ1/bxN3cJGW3lLT13rDUA6x+fkiEYWF1NWny/j/u1j6Xc7g8kIHb
         PcChOeI1r9jC0EJtpJbXBRvWCjKGckCpagJCETg8F8EfJ2Qj1I0OKsRKO3rAVN06oVbo
         mfvdXi8r6RqCdF+4mh2Z8PDBu9N5WXVkJxNMFMTOqJJfR5Mh9DkcORzZih5YgyNgpt5x
         Knnn3gBYAATULFasZufjRxo+/+9zqJme+YyfPb1WtrR2OP1p7atv/Yk8SYx6mG4rb8Fm
         kaaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772041507; x=1772646307;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P/hBoEMiXYtzSJAai3x+/Zjn0NP0IL/2TZ2kRQnBAyM=;
        b=qXvseJdNTz4Sao8hbetDtAuRvwuQQ/G4O2nTGAkJKjmWTme7R3x8JbnD8AC8/lwESR
         46nZ1GCY1qa8sKTwVgmMxzP2Bdiy89ryXrkGBZ2aNGoSrcV+mi62w9c2tZtCKgCv6JtC
         vFfR0xY54ltATEQofQHzLvM+C+ACXidawS6BvZWJTYS8RwTSAD65NRuke4SKACp3Ctg6
         OhXihOUhZh7gdcFrOmH8sreDv+UFIQ8Hu+YxEVqxjHY8j0KI1bfrYJEDVpjQM3JDquHB
         lzvemYBmHE1k7gHH2Wcm0Am8q8m8klJ4IxRFqp0TOjK2spJMIMk0FYO7dE7oC5wM8ppx
         vNSA==
X-Forwarded-Encrypted: i=1; AJvYcCU/T0w2QhFVBRJ0HNv3kJa5uItbsqi6TAtQgY4Do9ovfIlxRSVsIjFEqcGYO2wrqdilPBl0nT1ICVthli5gDlDw@lists.infradead.org
X-Gm-Message-State: AOJu0YwSIB4Vt+o3+QMiKNJbfiQIJ3Sn2UcHCYdrQ5Zk6q4iNQY/kvpW
	80T3nvG1bbPuKhACw35MHiSjbYCfYqBbrSH7dZdJtink35PNBIrJC+HbtVBz7ZTIXyMMpUyDJPp
	yBYG6MAT2pA/LasBj6zNiqXWh5A==
X-Received: from iobjf28.prod.google.com ([2002:a05:6602:649c:b0:957:6d3d:c3bf])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:2d01:b0:679:a4cc:e04f with SMTP id 006d021491bc7-679c4618dbbmr8769461eaf.51.1772041506836;
 Wed, 25 Feb 2026 09:45:06 -0800 (PST)
Date: Wed, 25 Feb 2026 17:45:06 +0000
In-Reply-To: <86ldgyba96.wl-maz@kernel.org> (message from Marc Zyngier on Thu,
 12 Feb 2026 09:07:33 +0000)
Mime-Version: 1.0
Message-ID: <gsntv7fkogyl.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v6 09/19] KVM: arm64: Write fast path PMU register handlers
From: Colton Lewis <coltonlewis@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvm@vger.kernel.org, alexandru.elisei@arm.com, pbonzini@redhat.com, 
	corbet@lwn.net, linux@armlinux.org.uk, catalin.marinas@arm.com, 
	will@kernel.org, oliver.upton@linux.dev, mizhang@google.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, shuah@kernel.org, gankulkarni@os.amperecomputing.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_094509_408499_58F2814F 
X-CRM114-Status: GOOD (  13.14  )
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

Marc Zyngier <maz@kernel.org> writes:

> On Mon, 09 Feb 2026 22:14:04 +0000,
> Colton Lewis <coltonlewis@google.com> wrote:

>> We may want a partitioned PMU but not have FEAT_FGT to untrap the
>> specific registers that would normally be untrapped. Add a handler for
>> those registers in the fast path so we can still get a performance
>> boost from partitioning.

>> The idea is to handle traps for all the PMU registers quickly by
>> writing directly to the hardware when possible instead of hooking into
>> the emulated vPMU as the standard handlers in sys_regs.c do.

> This seems extremely premature. My assumption is that PMU traps are
> rare, and that doing a full exit should be acceptable. Until you
> demonstrate the contrary, I don't want this sort of massive bloat in
> the most performance-critical path.

After some consideration I agree. I will try a full exit and see if that
is sufficient.

