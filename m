Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C480D4660A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 18:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=s1vml7vcnt1Rp1v6JVpJDpiVuPBFnkJqBrKshWU1rJQ=; b=Pr2yTEdoculnuW
	k+AYo1P0SvMQ+FFRI1iZzIeC/92UFjYbMVyN6RNAxkBQmkFdYpO5FG9sAJ11oDuOtwOAqVzDaR+tt
	LoNIIhjqrc03KeJcvuCkN8ukh1Qe5KLMpve/AAj9mErf9HpmDZcA3dPdR1nZePazTIOkTzYgQSf/b
	fB0Yn3oN/8etN9CDVl/941OuWbGJl6qKiQRzkb8HR7XOFt2GzRrYs33S1qnuEl/bcix0vkrKSmuii
	E534YWwRbv9OHJhUItlkQtp9AFyKiDEGwYC7cCGYQ/CjEHkTuU7YU9tCfxctKYsVvzqFzQiBt9hEd
	Px7i2fHnYawen7+QcDKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgRmW-0000000Cvyx-19pX;
	Thu, 15 Jan 2026 18:09:18 +0000
Received: from mail-oo1-xc4a.google.com ([2607:f8b0:4864:20::c4a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgRmT-0000000Cvya-0v8m
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 18:09:14 +0000
Received: by mail-oo1-xc4a.google.com with SMTP id 006d021491bc7-661024254c8so3602686eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 10:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768500551; x=1769105351; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s1vml7vcnt1Rp1v6JVpJDpiVuPBFnkJqBrKshWU1rJQ=;
        b=TLsI8i1p7Vd50vWq4iFU6urI1h91bBpXWk5UMUQp+elllzH1caVOe9m1CJH/fE2Mdg
         nUjgrNzxgnRyv8J0L/WcXyniGCBNJ+x2sWV1VZBDudlMTNs/QotmI0829i+/v/TnT/uh
         6+t92QhABoV3sFNX/ZPPbVwh9cMhSrfHifJYInyUWSqJTVsuZXvKPH61Iwjd6/FmrDTR
         mjB6yFFZNRNZ6s6CvEheFHvOvxhJSvKilwLQZHytin8j7y7fYJuSG/UdIIjNUkXCnvoM
         o6BwSs8ikkzgg/10/ZD2W4fOPzNrRENw5RnBdLzPGBuTmI19dBne6ZetBOAVceZfvnFs
         CeDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768500551; x=1769105351;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s1vml7vcnt1Rp1v6JVpJDpiVuPBFnkJqBrKshWU1rJQ=;
        b=VqpYj15Q06HSzyxbc98i/d8yTZ82r2h/6WVR+ZkTyrSAxUCeJwvWeqe+Ih+nIXUvEQ
         uUHNse5klmtunmFn8/oCYDeWPgwwaCBvCsVk4fwzhUufwyjj/VLkuNKol1QqHX4NbzRN
         dba2XDibkbNGrWt7V8qTYXUs9XGNhLJweepRJlESlaEZYRk8ZwW69+uzvrLB0ApReegO
         KeM8Cy+/Kc2HQdsrNsKTClxnLihEFQwd/tRrelBHvgSfwaG+VhkHJecD7mdSXVPyIMNg
         qxN9pGyA1LVgXd0bn8y0i1zF9gpWWiOFtFXSsEz3xODUQiNPZdcVjyA+ZVAVOUyj5aob
         PWXw==
X-Forwarded-Encrypted: i=1; AJvYcCWRCpIYBGAZHK5sHsVkKynXrOwqHjCu9KEEm3xl7ICmELrBFmAPcI9GePF1r/5E1MQxSDxuI7vipmC+5O7sPZ42@lists.infradead.org
X-Gm-Message-State: AOJu0YwMpTbiIziy426wJFBvgRIAJfcYuxrEjLOVJc0qpzHRZmnpqTTZ
	c2vUuMUIzmiz63qwrmxTbVfLROIZcMDjUjUHJqy7kuOKEXeGZxSCE7I8VRZKEJmeRUbYO4DzzB8
	4GRw3ClGlJmeJVgX/7nJr100FzQ==
X-Received: from iobet8.prod.google.com ([2002:a05:6602:4c08:b0:957:5463:901e])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:480e:b0:660:ffa9:e2ce with SMTP id 006d021491bc7-661189e47e2mr16014eaf.83.1768500551087;
 Thu, 15 Jan 2026 10:09:11 -0800 (PST)
Date: Thu, 15 Jan 2026 18:09:10 +0000
In-Reply-To: <aWjlfl85vSd6sMwT@willie-the-truck> (message from Will Deacon on
 Thu, 15 Jan 2026 13:02:54 +0000)
Mime-Version: 1.0
Message-ID: <gsntpl7a694p.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v5 00/24] ARM64 PMU Partitioning
From: Colton Lewis <coltonlewis@google.com>
To: Will Deacon <will@kernel.org>
Cc: oupton@kernel.org, kvm@vger.kernel.org, pbonzini@redhat.com, 
	corbet@lwn.net, linux@armlinux.org.uk, catalin.marinas@arm.com, 
	maz@kernel.org, oliver.upton@linux.dev, mizhang@google.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, shuah@kernel.org, gankulkarni@os.amperecomputing.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_100913_274624_90F531F6 
X-CRM114-Status: GOOD (  23.60  )
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

Will Deacon <will@kernel.org> writes:

> On Tue, Dec 09, 2025 at 03:00:59PM -0800, Oliver Upton wrote:
>> On Tue, Dec 09, 2025 at 08:50:57PM +0000, Colton Lewis wrote:
>> > This series creates a new PMU scheme on ARM, a partitioned PMU that
>> > allows reserving a subset of counters for more direct guest access,
>> > significantly reducing overhead. More details, including performance
>> > benchmarks, can be read in the v1 cover letter linked below.
>> >
>> > An overview of what this series accomplishes was presented at KVM
>> > Forum 2025. Slides [1] and video [2] are linked below.
>> >
>> > The long duration between v4 and v5 is due to time spent on this
>> > project being monopolized preparing this feature for internal
>> > production. As a result, there are too many improvements to fully list
>> > here, but I will cover the notable ones.

>> Thanks for reposting. I think there's still quite a bit of ground to
>> cover on the KVM side of this, but I would definitely appreciate it if
>> someone with more context on the perf side of things could chime in.

>> Will, IIRC you had some thoughts around counter allocation, right?

> Right, I was hoping that the host counter reservation could be more
> dynamic than a cmdline option. Perf already has support for pinning
> events to a CPU, so the concept of some counters being unavailable
> shouldn't be too much for the driver to handle. You might just need to
> create some fake pinned events so that perf code understands what is
> happening.

Thanks Will. I have a few followup questions:

1. Are you suggesting this be done whenever we enter a guest so the host
always has access to the full range in host context? That would be the
most dynamic.

2. How should we handle the possibility a real event already occupies a
counter wanted by the guest? Is there a good way to create our fake
pinned events then force a reschedule so perf moves the real events out
of the way?

3. Is there an existing fake event type that tells perf not to touch
hardware?

4. Can you point to any example code that already does something like
this?


