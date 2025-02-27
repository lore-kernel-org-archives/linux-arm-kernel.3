Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 744FFC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 21:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eufceZLJr1I8fdiTEdgsBxpgVgc25hDn/n/ukbEKvAk=; b=QfOECt30qpapMWpQTM5osJQrMn
	DG8M6IeX8r+2V/Hf2XNoTWuUPTfh+SAdltANB3h72oD/64/NGsJwYwBg5Wv5A8Cx5LlKACEerj+EM
	L0J5p1ZTAWv+55Zc669Q3mlXPHqF1rFDpkf0TM3GEQ7m9dvSG13tgyFGdlKvzbxCd/7nIruJKVWLw
	1Too7nTPfpCxuLrATduooVOoItbS2hQRzUx01Zl07Ovni0QHIXd2nCjnhlTaWe9Jo9F2M8OmPf44M
	Ia/ht6IIYKs706jtKVUIh8Owc78wtwUwjatkedl9KGXSKjMns9ROpOOJio6SKhzhMjHGpsK7cNgMl
	EAUait4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnlTU-00000008tkl-1utD;
	Thu, 27 Feb 2025 21:31:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnlRY-00000008tQ6-1qx4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 21:29:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740691759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eufceZLJr1I8fdiTEdgsBxpgVgc25hDn/n/ukbEKvAk=;
	b=LuCTei40JwP+CLcmL6wMaZNOfaHn2Uk0MJYBL52hk6T+BkjFtt/GykWkCcknnp6f9bn9XU
	2dsFeSov1i+rBWszh2Cwin4K8Kjf97uSr5/Om5DQQuuKnHeQLfkiQo24F56sGg36bG/LKM
	KEMHXern5HExcFQYjnwWXKHIImF9lVI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-3Cu8zENtNReHDQX8LnR7LQ-1; Thu, 27 Feb 2025 16:29:15 -0500
X-MC-Unique: 3Cu8zENtNReHDQX8LnR7LQ-1
X-Mimecast-MFC-AGG-ID: 3Cu8zENtNReHDQX8LnR7LQ_1740691755
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-38f28a4647eso652646f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 13:29:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740691754; x=1741296554;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eufceZLJr1I8fdiTEdgsBxpgVgc25hDn/n/ukbEKvAk=;
        b=q57dPc1QPQwWhrkANDjhurjOXDsJGA+vHS0iyco6eghdLPGZEDWmmIq88N3a2ghfrc
         4CWRHjAAWeQsxdv6oABiXkMoJZz+8my+vpMluJebRuuepUGelasU+mMHxIUBMxLitDWT
         yWgLla5BQgnESpQXWOdFOxJcag8E2dfPVLVrlsesTU020bdDVr1EkVAcNNm5rLPMyw3y
         sf3/LO9ER5Oq1elGoDdeGBWm61Zxc1xbgfi/jOkmjHXF97mG/jIrTq+gaNN25+EhJmU5
         1OcwJQukKdcg8UZo3GKT6I1dpm4hfais+Uja1ooMSgP1IqNsKHL2u5BWDDY9GYnj5Mkx
         dpRw==
X-Forwarded-Encrypted: i=1; AJvYcCX+lpH9LWHXQO84dtXsthSPOP/Q/phCkn5TT1e8Km33V8yqBRZ1uZ6HIYfqXIjbfki8cTfh7f5U6s2iWFu7DZkB@lists.infradead.org
X-Gm-Message-State: AOJu0YzOkYQD/5Hd7W8Q/+PTtG5Zr0QH6XKd2HhPdidly7yNdxVUDRGG
	UML8hAMrR8FjFkoNAEEllDQlL+zz1SFASsCGp8ommfT7I15g+9DzIRLFyXh73DaBNt93NZEE2Vt
	qcw3O20K52Lmm8EOyVxfbDHv4D3NZatm5OBLgW7TXvUGgR+xrDcYPpvWs1++ttSuGkq7EauOr
X-Gm-Gg: ASbGnctFXLLaEc0PW2vaWaE6jjKR83YVIiV0V1BsdeV9XM0FMEhzG2fFXpRgLHeDk8h
	UJEF9t5TZNM09OXx4qDxhIjtBWeRXAnrsfVlECkFQiHGfTSBPFwxO1nKCzHNgblqiPDnXdh90hh
	XB8UxHc1CIptm/HvJVF+Ax1FzzPiq5+uR0gqx4n6KuHc7N0LTve3ZdUXfd48KnmIMM8WtIGyz0R
	Y+OizwNrLT0+v0F3LCo1x5o83QM+6icoqqZJH0yC8pZijO/CJLzcHV2DC7TzWDXR1hx0rHUa0cN
	79fwf3T3W00pd7jY/0KSj+khQh7HLQQhlt1PrXRid0s06iKtniggxo4B9R6id8dzfCF9/yOQNZn
	I
X-Received: by 2002:a05:6000:2112:b0:38f:6149:9235 with SMTP id ffacd0b85a97d-390ec7cba70mr618427f8f.16.1740691754591;
        Thu, 27 Feb 2025 13:29:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGZAYOLvJ8C0YI1cxRbLvJGbMPaIg3Ni2v7psye+SaqGd/PraO+3wDx4Bo3vNp91pLbsuqmMQ==
X-Received: by 2002:a05:6000:2112:b0:38f:6149:9235 with SMTP id ffacd0b85a97d-390ec7cba70mr618394f8f.16.1740691754190;
        Thu, 27 Feb 2025 13:29:14 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-141-166.abo.bbox.fr. [213.44.141.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e485d6dbsm3149393f8f.82.2025.02.27.13.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 13:29:13 -0800 (PST)
From: Valentin Schneider <vschneid@redhat.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, oleg@redhat.com, sstabellini@kernel.org,
 tglx@linutronix.de, peterz@infradead.org, luto@kernel.org,
 mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, kees@kernel.org, aliceryhl@google.com, ojeda@kernel.org,
 samitolvanen@google.com, masahiroy@kernel.org, rppt@kernel.org,
 xur@google.com, paulmck@kernel.org, arnd@arndb.de, puranjay@kernel.org,
 broonie@kernel.org, mbenes@suse.cz, sudeep.holla@arm.com,
 guohanjun@huawei.com, prarit@redhat.com, liuwei09@cestc.cn,
 Jonathan.Cameron@huawei.com, dwmw@amazon.co.uk,
 kristina.martsenko@arm.com, liaochang1@huawei.com, ptosi@google.com,
 thiago.bauermann@linaro.org, kevin.brodsky@arm.com, Dave.Martin@arm.com,
 joey.gouly@arm.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH -next v6 8/8] arm64: entry: Switch to generic IRQ entry
In-Reply-To: <Z8CwbmCXguCEfJvx@J2N7QTR9R3>
References: <20250213130007.1418890-1-ruanjinjie@huawei.com>
 <20250213130007.1418890-9-ruanjinjie@huawei.com>
 <xhsmh4j0fl0p3.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <Z8CwbmCXguCEfJvx@J2N7QTR9R3>
Date: Thu, 27 Feb 2025 22:29:12 +0100
Message-ID: <xhsmh1pvjkrfb.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ipjZNfKqdBaI_IluerGmcQl1CFvnCsixUGNBBSnpZ5k_1740691755
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_132920_554041_509661FF 
X-CRM114-Status: GOOD (  22.76  )
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

On 27/02/25 18:35, Mark Rutland wrote:
> On Thu, Feb 27, 2025 at 07:08:56PM +0100, Valentin Schneider wrote:
>> On 13/02/25 21:00, Jinjie Ruan wrote:
>> > Currently, x86, Riscv, Loongarch use the generic entry. Convert arm64
>> > to use the generic entry infrastructure from kernel/entry/*.
>> > The generic entry makes maintainers' work easier and codes
>> > more elegant.
>> >
>> > Switch arm64 to generic IRQ entry first, which removed duplicate 100+
>> > LOC and make Lazy preemption on arm64 available by adding a
>> > _TIF_NEED_RESCHED_LAZY bit and enabling ARCH_HAS_PREEMPT_LAZY.
>>
>> Just a drive-by comment as I'm interested in lazy preemption for arm64;
>> this series doesn't actually enable lazy preemption, is that for a
>> follow-up with the rest of the generic entry stuff?
>>
>> From a quick glance, it looks like everything is in place for enabling it.
>
> Sorry, there's been some fractured discussion on this on the
> linux-rt-users list:
>
>   https://lore.kernel.org/linux-rt-users/20241216190451.1c61977c@mordecai.tesarici.cz/
>
> The TL;DR is that lazy preemption doesn't actually depend on generic
> entry, and we should be able to enable it on arm64 independently of this
> series. I'd posted a quick hack which Mike Galbraith cleaned up:
>
>   https://lore.kernel.org/linux-rt-users/a198a7dd9076f97b89d8882bb249b3bf303564ef.camel@gmx.de/
>
> ... but that was never posted as a new thread to LAKML.
>

Thanks for the breadcrumbs!

> Would you be happy to take charge and take that patch, test it, and post
> it here (or spin your own working version)? I was happy with the way it
> looks but hadn't had the time for testing and so on.
>

Sure, looks straightforward enough, I'll pick this up.

> I expect that we'll merge the generic entry code too, but having them
> separate is a bit easier for bisection and backporting where people want
> lazy preemption in downstream trees.
>
> Mark.


