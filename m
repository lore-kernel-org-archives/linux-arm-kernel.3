Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8228EF9D0F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 19:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=sGPFZnIQdpvtj8pWF29yE7FXHvTUdwtT/N494dsATCQ=; b=XWCoGeDgEEuv1O
	f1/48otf/So8k2NwaykkesKAhEFCGliQ/LZV9j3Vfb+KPkmVSn7Dlo3mJueoVwqvjCsDpewwMaHBK
	y+sOGN1qSS3f7yOZA4mpKJb4WaYNYcRzfZYVr/flZBOYuFdtMkhdfeb3lbS9RfhWJKZwBSzk59dan
	Tckk29U3rChX94xfCLnwmridL3NiydHGDnq5iWDOp/o8UEgUx6pes5cdgJQUohU3D6R8FIOkLB1nt
	Z9nWzF6AETCvOtmaZ4uYmGmMc17WPAeSInC46PwDGdTviX6ZepszFl31x2MwL3m8gqFTv+XvH0t3M
	pcgtrCy/IEj2+BF9DG2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCjrC-00000000Add-26Mm;
	Tue, 14 Apr 2026 19:55:34 +0000
Received: from mail-oo1-xc4a.google.com ([2607:f8b0:4864:20::c4a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCjr9-00000000AcT-45sW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 19:55:33 +0000
Received: by mail-oo1-xc4a.google.com with SMTP id 006d021491bc7-68489d945ddso10643339eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 12:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776196530; x=1776801330; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sGPFZnIQdpvtj8pWF29yE7FXHvTUdwtT/N494dsATCQ=;
        b=PwEyvi62fB8ivzUb5gfOiW1G9A3G/KpNvqKSVdgu8tzwpW4oRxXRVfyFmS0ITON8li
         3O9nV/Zne16XEb3wA04BC3gBiFfFiLvhleZ9ELOw4MPyBhnnPicx+M2ISCiR82PgKGA+
         RC1Fg4LmuWsSzePdDHaeJ8RGsQsvGprUjhBK0Llg3g0hEyJ/Nk06HqbHuP9wKmdTSR3G
         +DeXUXhz0TI/W+BRuI0ouhN9zYBPEnewQxZW/wz7ph63jNLhceLyFZl/A2clMSEXZU9B
         7LbQ3d3uUcFQk8/ZOdhUV3VI73xPS6IX9F3rfmeCF1KX+K4NlfZLjs/wxiJAW/AQAxqw
         kqfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776196530; x=1776801330;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sGPFZnIQdpvtj8pWF29yE7FXHvTUdwtT/N494dsATCQ=;
        b=qrYcpnG3p46poIvulzrH13VPBtGMaMJ/Dh5NiwPoKuDw9mbWSooh/wU2YvHsGdiA4U
         P7z4JxJWfmQoACad4NaDBBcz32TK2mrw8iewQrEat17YMd+0tMsMSDbtDhiKD6LzWt/3
         q7+OzEBwqkiVwhP4wYzxB+62LnqWhnxl+o16q6MyThyUpJhUYfHgSDu+3ogpUv+CY/lI
         0SxbYldyTp3orE3ZxAor26A5enic24/sPy0mzNUCGTxMLxSL6p/8nYCxdH4Bgn1ag7HL
         qyWAQUxrxho1MFCKBNaGKSChFoYjOytU8WABpcClsukmMt/fzqQKGwIrbbBY09tZnq59
         hIKw==
X-Forwarded-Encrypted: i=1; AFNElJ8Hvg4VXSH03pWmGoHmKCddwpokfQvcjCEtdkHMI4JQ4hvYI0BuF74wNRiVR7or17cbUtktsynsBw1qJwEWSWh5@lists.infradead.org
X-Gm-Message-State: AOJu0YxTFr6P7akLvcvh0CLIUi533X+aP2wJAb5fBI/DSWptobBEPW+M
	xAi2kPcd+RzaTUWfn6UfbtwFZdKoZq4K1+LzYK15zbEjlpFlVBuzZujm7u3sHvGpiC0YLc3maCH
	ZaY32/zJlV83/StgiywnC0b5nnQ==
X-Received: from iljv10.prod.google.com ([2002:a05:6e02:13ca:b0:4fa:147e:ab1d])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:812:b0:68d:dfd2:8db8 with SMTP id 006d021491bc7-68ddfd29166mr6158103eaf.8.1776196529605;
 Tue, 14 Apr 2026 12:55:29 -0700 (PDT)
Date: Tue, 14 Apr 2026 19:55:27 +0000
In-Reply-To: <gsntpl7a694p.fsf@coltonlewis-kvm.c.googlers.com> (message from
 Colton Lewis on Thu, 15 Jan 2026 18:09:10 +0000)
Mime-Version: 1.0
Message-ID: <gsnt1pghgvv4.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v5 00/24] ARM64 PMU Partitioning
From: Colton Lewis <coltonlewis@google.com>
To: Colton Lewis <coltonlewis@google.com>
Cc: will@kernel.org, oupton@kernel.org, kvm@vger.kernel.org, 
	pbonzini@redhat.com, corbet@lwn.net, linux@armlinux.org.uk, 
	catalin.marinas@arm.com, maz@kernel.org, oliver.upton@linux.dev, 
	mizhang@google.com, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, mark.rutland@arm.com, shuah@kernel.org, 
	gankulkarni@os.amperecomputing.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_125532_020814_9458CC66 
X-CRM114-Status: GOOD (  30.14  )
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

> Will Deacon <will@kernel.org> writes:

>> On Tue, Dec 09, 2025 at 03:00:59PM -0800, Oliver Upton wrote:
>>> On Tue, Dec 09, 2025 at 08:50:57PM +0000, Colton Lewis wrote:
>>> > This series creates a new PMU scheme on ARM, a partitioned PMU that
>>> > allows reserving a subset of counters for more direct guest access,
>>> > significantly reducing overhead. More details, including performance
>>> > benchmarks, can be read in the v1 cover letter linked below.
>>> >
>>> > An overview of what this series accomplishes was presented at KVM
>>> > Forum 2025. Slides [1] and video [2] are linked below.
>>> >
>>> > The long duration between v4 and v5 is due to time spent on this
>>> > project being monopolized preparing this feature for internal
>>> > production. As a result, there are too many improvements to fully list
>>> > here, but I will cover the notable ones.

>>> Thanks for reposting. I think there's still quite a bit of ground to
>>> cover on the KVM side of this, but I would definitely appreciate it if
>>> someone with more context on the perf side of things could chime in.

>>> Will, IIRC you had some thoughts around counter allocation, right?

>> Right, I was hoping that the host counter reservation could be more
>> dynamic than a cmdline option. Perf already has support for pinning
>> events to a CPU, so the concept of some counters being unavailable
>> shouldn't be too much for the driver to handle. You might just need to
>> create some fake pinned events so that perf code understands what is
>> happening.

> Thanks Will. I have a few followup questions:

> 1. Are you suggesting this be done whenever we enter a guest so the host
> always has access to the full range in host context? That would be the
> most dynamic.

> 2. How should we handle the possibility a real event already occupies a
> counter wanted by the guest? Is there a good way to create our fake
> pinned events then force a reschedule so perf moves the real events out
> of the way?

> 3. Is there an existing fake event type that tells perf not to touch
> hardware?

> 4. Can you point to any example code that already does something like
> this?

Thank you Will and Mark for meeting with me to discuss things in person.

Here's my main takeaways so the list can comment:

Will's initial idea doesn't work because there is no way for KVM to pin
counters in a way that takes priority over counters pinned by the host
and therefore guarantee reservation.

An alternate idea I am proposing is to call the perf core
sched_in/sched_out functionality during vcpu_load/vcpu_put when guest
counters need to be reserved/unreserved.

That means having perf vacate all the host counters temporarily,
modifying the arm_pmu.cntr_mask to add/remove the appropriate counters,
then having perf schedule all host events back on the new set. Perf is
capable of doing that without any significant changes.

This is simple and should work because arm_pmu.cntr_mask is already
accessible from the vcpu struct and modifying it is already how the
existing boot-time counter reservation works.

There are some tradeoffs to this approach that will need further
consideration. The first is how to handle event groups. Perf allows
events to be grouped such that they must all be scheduled in at once. If
the host has a larger group than the number of counters available while
the vcpu is loaded, then it simply won't be able to schedule that group
in for that time period. Another is whether it will be acceptable
performance-wise to put perf sched_in/sched_out in
vcpu_load/vcpu_put. I'm unsure how much delay that would add to those
paths.

Absent strong objections, I will be posting a series using this method.

Another idea that was not discussed that I had later is a middle
approach that is less dynamic but gives the user control over when the
perf sched_in/sched_out happens. Expose the existing boot-time parameter
as writable in sysfs and do the sched_out/modify mask/sched_in when that
is written rather than in vcpu_load.

