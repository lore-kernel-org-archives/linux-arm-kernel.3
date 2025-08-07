Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70FB1C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 17:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=+h378Tf504uUiMOV37MEQKpGK3kMCBEgWjqEH4cjsGQ=; b=yqKZujdoXgcjtVTotU2M19yR3q
	GCX98OdWoVyaUE8PM75HYtZidOVxg8+UBjIutyrOYRXu1ep427N6OQoyTXHJ5KskyrheWu2qNPIbm
	cJNsT7RDPsQqvvr7tAUDYkXUFzVlrnALg2oFNNDEEn9ETp70M5R7KcRZ/LwMzCmEFWTbYMntaUVaO
	D/9uqIFxjLNZdHaYMhe/mTp1iIVTZkKxyIoOwDimJnoFf9IkfUnNpzqMpyPW8rN2DJ4Dqhpo9kgy6
	buskIkdDAmDEprK79r/FTHGOf/5F0eZ6A7qGS07DFlWxEPuN410mMYRC3frnZ9GjucZ5I1u2XoHwA
	8AxD1bZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk4RF-00000001FaU-3GjD;
	Thu, 07 Aug 2025 17:30:01 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk4Nr-00000001FDd-2TYT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 17:26:33 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-b34a6d0c9a3so1444701a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Aug 2025 10:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1754587591; x=1755192391; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+h378Tf504uUiMOV37MEQKpGK3kMCBEgWjqEH4cjsGQ=;
        b=LLkTIbQI1WxkByLgeWioo/KN4wn90QXw5ygbLJuL64QW8e8ylkAlacwDkOJrwWBtcM
         UGjS9/jbpuMAbLvN/e6ALgFHksvsNCPgJqk9MvlpAUkuWuR+LYm5aNwsANP98i7PnJnH
         SXOmNhbM2clj4jjI5907x2Sa43yQFnmLJI5Yua2+zTNNzqfwy3N4kECg7l6pxbNzXSS1
         q8+5il+Al55k1H3htui7sKybP5HhgPoXHksaAwXpzEY0WcmjGlUtkVYjcfvt6XHWhvEM
         NYPGz2RyHcyJxRfQ5mNW4RjzwUgiB1XYHCqbJBl8KO1dBg0p6xWQgGG2p10W/V6vZxKJ
         rDxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754587591; x=1755192391;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+h378Tf504uUiMOV37MEQKpGK3kMCBEgWjqEH4cjsGQ=;
        b=EpA5Sfvw4xKHPEE0fqqPnqrJkH/NrCDCjDkM8g12/9NkNPyBwzhcV+eW1zZIDejP74
         99WdspbrFy7Ut2swdMkmhOzyrpYq3vrVO0she5yU8ECEo1+thLv9x2UHR/US3Hacfdfl
         IP9/8imEvRVetFtUOinQiQRwAKzimKlYb/ISVcoE36uhKZF1Lk96I6xQJHjOokDmNjoP
         Jff3WPv52L91IgLIUTL8fT7whyw7m+d0Sa+tmCatwBerrVRBup8Bb4sY3HOL/46e2saS
         1wBrtUf9vo9vR6WTQXerKB62oTlrc9vCOOOTS6PDUJznsdbclcWgpDBFLMsNsj4kDZtZ
         TwWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVS59LgcTpcB7FyXNe18q/aS11euVEeR9Lqxo0cXuZx0MxaulEhGL6aXsOLQNL55JT3a/QLwbW6vKGAUI0ydx/3@lists.infradead.org
X-Gm-Message-State: AOJu0YxtLWNonc2l3eE9UR9GzO9tRxa0XeuscuZtvNnwvoXdNKVsReir
	6TRrKCqWIdoLVA7JVPzlA651kPVH80duJ6djoA7n9PE4YJTbE8uIga9zjS+gQ+bXnaU=
X-Gm-Gg: ASbGncsvxhzzzp8DdrIxfVpmmMzNdR6N0yqwb1WQEImo/fS+oWUMaGAV/EHFCp6ouhr
	k7dhZUGkZPsk0IpIUCQHtAHgqrP5ytWG34mEk1D3FHSgj81QISa3c5/RTuUFckmYcOPpRLfyofk
	fdBMNHb34rVboKE53qDybHaTDVaCq/co/AwTZoPYGBl7ZfrXkziLKNnwz5inOVf+geZGU7ND+Yb
	tsNwPlcUGwzfDQOu3okVxqdA0EfQerElOVQhklHnLztzx8QKBvlrDxGmNFtus03KpwjCPdRVGAd
	OnG+lrj52ujDFhA2hPtBCaVFhqcK2KhWsj3M9ocXorPxiMEnJNanKJ9EBvlpk1wFBj0x5/1Cvi4
	2zgXuPIGStwBEawI3q5xP57WDgQ==
X-Google-Smtp-Source: AGHT+IFozWV8vrd5EMGtMyKdfiS3Pbokb+TNy5cuHGj4vZa1810QnCu0am++Rh915Hc5K1tcnkuECA==
X-Received: by 2002:a17:903:41d2:b0:240:8704:fb9 with SMTP id d9443c01a7336-2429f582b30mr110618495ad.53.1754587590509;
        Thu, 07 Aug 2025 10:26:30 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::4:30b7])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-241e899d21dsm188812445ad.139.2025.08.07.10.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 10:26:29 -0700 (PDT)
Date: Thu, 07 Aug 2025 10:26:29 -0700 (PDT)
X-Google-Original-Date: Thu, 07 Aug 2025 10:26:27 PDT (-0700)
Subject: Re: [PATCH] arm64: Expose CPUECTLR{,2}_EL1 via sysfs
In-Reply-To: <864iuja70l.wl-maz@kernel.org>
CC: Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>,
  Will Deacon <will@kernel.org>, oliver.upton@linux.dev, james.morse@arm.com, cohuck@redhat.com,
  anshuman.khandual@arm.com, palmerdabbelt@meta.com, lpieralisi@kernel.org, kevin.brodsky@arm.com,
  scott@os.amperecomputing.com, broonie@kernel.org, james.clark@linaro.org, yeoreum.yun@arm.com,
  joey.gouly@arm.com, huangxiaojia2@huawei.com, yebin10@huawei.com,
  linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Marc Zyngier <maz@kernel.org>
Message-ID: <mhng-9D9CB730-A22F-43E2-A012-D51EF3C1E027@palmerdabbelt-mac>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_102631_823575_E1DD8D6A 
X-CRM114-Status: GOOD (  31.75  )
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

On Thu, 07 Aug 2025 01:08:26 PDT (-0700), Marc Zyngier wrote:
> On Wed, 06 Aug 2025 20:48:13 +0100,
> Palmer Dabbelt <palmer@dabbelt.com> wrote:
>>
>> From: Palmer Dabbelt <palmerdabbelt@meta.com>
>>
>> We've found that some of our workloads run faster when some of these
>> fields are set to non-default values on some of the systems we're trying
>> to run those workloads on.  This allows us to set those values via
>> sysfs, so we can do workload/system-specific tuning.
>>
>> Signed-off-by: Palmer Dabbelt <palmerdabbelt@meta.com>
>> ---
>> I've only really smoke tested this, but I figured I'd send it along because I'm
>> not sure if this is even a sane thing to be doing -- these extended control
>> registers have some wacky stuff in them, so maybe they're not exposed to
>> userspace on purpose.  IIUC firmware can gate these writes, though, so it
>> should be possible for vendors to forbid the really scary values.
>
> That's really wrong.
>
> For a start, these encodings fall into the IMPDEF range. They won't
> exist on non-ARM implementations.

OK, and that's because it says "Provides additional IMPLEMENTATION 
DEFINED configuration and control options for the processor." at the 
start of the manual page?  Sorry, I'm kind of new to trying to read the 
Arm specs -- I thought just the meaning of the values was changing, but 
I probably just didn't read enough specs.

> Next, this will catch fire as a guest, either because the hypervisor
> will simply refuse to entertain letting it access registers that have
> no definition, or because the VM has been migrated from one
> implementation to another, and you have no idea this is doing on the
> new target.

Ya, makes sense.

>> That said, we do see some performance improvements here on real workloads.  So
>> we're hoping to roll some of this tuning work out more widely, but we also
>> don't want to adopt some internal interface.  Thus it'd make our lives easier
>> if we could twiddle these bits in a standard way.
>
> Honestly, this is the sort of bring-up stuff that is better kept in
> your private sandbox, and doesn't really help in general.

So we're not doing bringup (or at least not doing what I'd call bringup) 
here, the theory is that we just get better performance on different 
workloads with different tunings.  That's all still a little early, but 
if the data holds we'd want to be setting these based on what workload 
is running (ie, not just some static tuning for everything).

That said, part of the reason I just sent this as-is is because I was 
sort of expecting the answer to be "no" here.  No big deal if that's the 
case, we can figure out some other way to solve the problem.  Happy to 
throw some time in to making some more generic flavor of this, though...

> Thanks,
>
> 	M.

