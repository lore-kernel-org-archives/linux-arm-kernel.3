Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 702D4C02194
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 21:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=XEqP/YEsjQP6HXPcAZ+OLL0SnqZRyU2wi8fLU4Seg48=; b=ti+2f/dxWJcgH3
	7ufFyyJltT7bZaVcRp9w3BJUmyB3YivNZTXjeG/scw/Tti0qi0X/9XZGvcMx8P05YC7lw+YTCSjvt
	jtLrwv2YoT/ZczKhGYjENZIiu+mypcz0DoDHiMWwM/Y/frG+jJGzbu8kqa7aVyLS9kep50T8yd25w
	u301r2jSq3d1AIw2cFLLQ/OmCkEHnAjxGLJDp87cZvg3GLP9uCnMPXRcWvrtdsACjGN7Kz0ogWO+Y
	eGjO7ojwJ0xEqZY6r/ofhwlwDXo+rOOXshrLyoi9WY6BlfNcE9+DVQ5ZcrvMvcD9azoiaPR3RDDmx
	ClR3XDYdvza0ohxpMb1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf4CK-0000000GhLC-2TS8;
	Mon, 03 Feb 2025 21:41:40 +0000
Received: from mail-il1-x149.google.com ([2607:f8b0:4864:20::149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf48F-0000000GgQe-0ndl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 21:37:28 +0000
Received: by mail-il1-x149.google.com with SMTP id e9e14a558f8ab-3a7e0d5899bso90460925ab.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 13:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738618645; x=1739223445; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XEqP/YEsjQP6HXPcAZ+OLL0SnqZRyU2wi8fLU4Seg48=;
        b=jTgJAYgrU3ZXB2E7Ta/vBB6v5FPmyh1+4EELAg0M0e+38cHI5ttZfoK/LYwCImOnRo
         IeNRgSFsESgUvDhrwQbBRFeAkMJIxLIifgnLfZwh5Jwa4PNyYTVo6Kdf5Y7twld9umri
         B07t3LYK+X1ciZdTjjfZNF0H4aERducnYyOY/MKie+w7yALZJ9CDuGxHi1HD494O0P/z
         ABa1655yO9V6saRz+2Vd7AaTJimrkn7RdUOepcn6DdvTJZUkqBRUZXbqFG1DOBGmCTUR
         VgzFYsr1dtEY9Ws5dun7ZJ0qNFOygjatTKOveDub851OcwOxx64LB5SPuvZS6/9jyiEn
         rEvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738618645; x=1739223445;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XEqP/YEsjQP6HXPcAZ+OLL0SnqZRyU2wi8fLU4Seg48=;
        b=bGqUugyNK2ayrZ6BqV7d7/VLECYaFBWkmKD/AAjXexAP5ggfUH2BND3tZBzPATLzh9
         bDCmXD+Q5dRKUzKcTBwYCV4evofW5WnDp5IDNKFXQ95HGcD/gZbPdI66MoFXvLD6Mvas
         irqLZ9Quf73eJ2KpAGDuPN62y3RbN0cvEaEgbMM158O+qnpNOz+oP3lV1cjbAqJoWF5t
         KbXDlr5DXw0VDl/g4diFbgmoUgX1LcYp7ewkFj2HSI/Edrnv9YlOPjZ2vW1Z7dNO8KDY
         wf4qlRbegbC39NaaW3ScbfjIX6HDzu2e5gvX5PS7SZfPPl3fL9BcakE5Lns3y1S/xEIE
         zu4g==
X-Forwarded-Encrypted: i=1; AJvYcCXtr+1W7sC5RtRWUJaLqhwxCqzBR6TPA5PiNdxsoYCdvHLJv3YXUC4r9XJiZL8egzsmiIJwW/hns8oiLqgONGqp@lists.infradead.org
X-Gm-Message-State: AOJu0YxPaLv1lcL5npx3vONtEcsEDXQfoLUUYwWZdK0/Ika9VeVUZ7sx
	u5B0TTa0E/8jxQCi24Tv8A/D61gndVCZyVKzNEcgILfyjfaLw5Lk+TzCP1IdWplcmGVNCMPwvEP
	KYJNWM7d863H98DOcpn1t+w==
X-Google-Smtp-Source: AGHT+IFzEQXFVr/GsJOoiYsXrEqAdOToUP7ubJ3+EUez4554ouloGovsV2x1HVo9oXN98kh3qBpaq5S0IrbbEWoKkA==
X-Received: from ilbby19.prod.google.com ([2002:a05:6e02:2613:b0:3cf:c127:d037])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a92:cd83:0:b0:3cf:b571:c08c with SMTP id e9e14a558f8ab-3cffe3d1bc2mr218960215ab.3.1738618645230;
 Mon, 03 Feb 2025 13:37:25 -0800 (PST)
Date: Mon, 03 Feb 2025 21:37:24 +0000
In-Reply-To: <gsntzfj91fbs.fsf@coltonlewis-kvm.c.googlers.com> (message from
 Colton Lewis on Wed, 29 Jan 2025 21:27:03 +0000)
Mime-Version: 1.0
Message-ID: <gsntwme61zhn.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [RFC PATCH 1/4] perf: arm_pmuv3: Introduce module param to
 partition the PMU
From: Colton Lewis <coltonlewis@google.com>
To: Colton Lewis <coltonlewis@google.com>
Cc: maz@kernel.org, kvm@vger.kernel.org, linux@armlinux.org.uk, 
	catalin.marinas@arm.com, will@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, pbonzini@redhat.com, shuah@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_133727_248277_F05A2B42 
X-CRM114-Status: GOOD (  10.55  )
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

> Marc Zyngier <maz@kernel.org> writes:

>> On Tue, 28 Jan 2025 22:08:27 +0000,
>> Colton Lewis <coltonlewis@google.com> wrote:

>>> >> +	bitmap_set(cpu_pmu->cntr_mask, 0, pmcr_n);
>>> >> +
>>> >> +	if (reserved_guest_counters > 0 && reserved_guest_counters <
>>> pmcr_n) {
>>> >> +		cpu_pmu->hpmn = reserved_guest_counters;
>>> >> +		cpu_pmu->partitioned = true;

>>> > Isn't this going to completely explode on a kernel running at EL1?

>>> Trying to access an EL2 register at EL1 can do that. I'll add the
>>> appropriate hypercalls.

Ooohh. Making this work at EL1 is much more complicated than adding the
hypercall to write MDCR because once HPMN takes effect, the upper range
of counters that the host will use is only writable at EL2. That means
using any register related to any counter in the upper range would also
require a hypercall. The only way around that would be to avoid using
this feature in the host entirely and only enable it when we load a
guest.

I know we don't like feature discrepencies between VHE and nVHE mode,
but Oliver thinks it might be justified here to have PMU partitioning be
VHE-only.

