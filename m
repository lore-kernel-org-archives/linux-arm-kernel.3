Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C7FD41D74
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 09:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rRgk/jKyq3Xc+z294BSrYdB5EGZbteu2gYXGFcGqquw=; b=muR4kwG8Fz63ORdtSEX86WrvCx
	/sAyrvY4rIlboVM4OlMGf1IOcqcR3xF711b+DjY38NYN1F4IpkgaJfp5J88AZTmiNkTwKk5q3Nto/
	2J5Aak0B4/ZY3ZX2vq3oH2hjbHVFuSYyPwk9PJPxj2OYWopu53F9/drBOLJIDuHsvSM9ibHYN6xzO
	N3/D3iVXSIAtNgncloqrG6IbINByCdyTAnZZ7Vf78oRdqSvml+vkBD9hFzpJaSQ/rbX+AjUJxLTdR
	YbIfKjTe6OIiKWyAgn977Zyu7cmxtAy9vemvCHmX+uPHhTh9FEtSU+IKijJcrFqYlvMsgEdFfxw37
	jLVxBL1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV4mi-00000003MES-3jHu;
	Mon, 15 Dec 2025 09:22:28 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV4mf-00000003ME5-3rVb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 09:22:27 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-6450f3e7e71so4093984a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 01:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765790543; x=1766395343; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rRgk/jKyq3Xc+z294BSrYdB5EGZbteu2gYXGFcGqquw=;
        b=M68K20XWpKyRP2OUrCH3tMr+71BXIBsJxbWDnqHatOJUVyi5rPtteZxLwUrI/cJAcM
         CCq3h77ECDGQq1m7qa6LXqzQsw3O2tYV21RCDE9JuiAZaDxQf28SIHYILPBBQN1XDVhN
         DTpRBFnLgyI3tByxqReWnPqb8a4Qc01nReBMLagbK+jeJfI1xe9dH6JhqCUiFEyb+z15
         qJTLSsZm4zdqe03wmCnBFbHowAqzqCsQaVeTbPJkM7Jcij+yxdU5NjB64gnqDHlUfHER
         49CNcw7cInLUMOYlatidHYlNQ3KTG6Wk8eEGj6b459d3IDBof2XieRugyk377GuoxYUv
         lYVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765790543; x=1766395343;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rRgk/jKyq3Xc+z294BSrYdB5EGZbteu2gYXGFcGqquw=;
        b=PeJi6FwjgBs7n1nYM/eMWJyLh1LOAl35whB2CK/6CUQqG/Qwf0KtWNXfLMNOPrrI07
         hWrbPB0rX4/rvFcSo4SApJbbWCrkqWAEmuHveBjX0FXCOeE1j7ywXm98nmD/yJ5WuXtM
         6nHsfbuSl49U/O9VlgnWffbIQJ3lAnWi3ZYcdENEtL5NqQln4r55c7uJi8kJe1GytP48
         Ue17lmVeB50pqNlNOdllOY8G/sqjnZf/CprAt8gUAyCaVXfPOWZBsj3sf1FtADWfidEQ
         l2EzlvdIxuk0OEvc6609lLM/QDhWzXE7PFozLugh/aAWnqFvcOcEo8I9j+HV0ZqZCjDA
         f1Hg==
X-Forwarded-Encrypted: i=1; AJvYcCULlCWW/BhSr5z30bpCLstxvbXSz6pOJlySIjENvAbX1lmjuz2PfVzFLNmCY5Md20dPVDvP1cg6ww1lBh86WGd4@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6GZ9vxwO5y61tkP6To3T0wI1AyP6+PAptwFnIM4pSqBebO2+i
	WZDuTkA3upBtRJM6e/TZqaCVAl9S82BjPs2sRglD9rgzIoBii6ieZpnxYvkh+rBULWRUhUYm35Z
	+yLdHekNQE0ZRRw==
X-Google-Smtp-Source: AGHT+IGqA6/7NhdOmRJlayZuRkq/89Snr/0cKuIgnNpYQ1catSJLJfZQNQG1cjXYcwltRqxHcaD6SGiYTjuK7g==
X-Received: from edbdy7.prod.google.com ([2002:a05:6402:31e7:b0:649:8456:d4bf])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:4312:b0:649:62e1:10ca with SMTP id 4fb4d7f45d1cf-6499b1d86bfmr9525174a12.27.1765790543128;
 Mon, 15 Dec 2025 01:22:23 -0800 (PST)
Date: Mon, 15 Dec 2025 09:22:22 +0000
In-Reply-To: <aT5/y3cSGIzi2K+m@e129823.arm.com>
Mime-Version: 1.0
References: <20251212161832.2067134-1-yeoreum.yun@arm.com> <20251212161832.2067134-3-yeoreum.yun@arm.com>
 <CA+i-1C2e7QNTy5u=HF7tLsLXLq4xYbMTCbNjWGAxHz4uwgR05g@mail.gmail.com> <aT5/y3cSGIzi2K+m@e129823.arm.com>
X-Mailer: aerc 0.21.0
Message-ID: <DEYOI8H2OESD.1H56D3H8HKILB@google.com>
Subject: Re: [PATCH 2/2] arm64: mmu: use pagetable_alloc_nolock() while stop_machine()
From: Brendan Jackman <jackmanb@google.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>, Brendan Jackman <jackmanb@google.com>
Cc: <akpm@linux-foundation.org>, <david@kernel.org>, 
	<lorenzo.stoakes@oracle.com>, <Liam.Howlett@oracle.com>, <vbabka@suse.cz>, 
	<rppt@kernel.org>, <surenb@google.com>, <mhocko@suse.com>, <ast@kernel.org>, 
	<daniel@iogearbox.net>, <andrii@kernel.org>, <martin.lau@linux.dev>, 
	<eddyz87@gmail.com>, <song@kernel.org>, <yonghong.song@linux.dev>, 
	<john.fastabend@gmail.com>, <kpsingh@kernel.org>, <sdf@fomichev.me>, 
	<haoluo@google.com>, <jolsa@kernel.org>, <hannes@cmpxchg.org>, 
	<ziy@nvidia.com>, <bigeasy@linutronix.de>, <clrkwllms@kernel.org>, 
	<rostedt@goodmis.org>, <catalin.marinas@arm.com>, <will@kernel.org>, 
	<ryan.roberts@arm.com>, <kevin.brodsky@arm.com>, <dev.jain@arm.com>, 
	<yang@os.amperecomputing.com>, <linux-mm@kvack.org>, 
	<linux-kernel@vger.kernel.org>, <bpf@vger.kernel.org>, 
	<linux-rt-devel@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_012226_017282_9423950B 
X-CRM114-Status: GOOD (  13.45  )
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

On Sun Dec 14, 2025 at 9:13 AM UTC, Yeoreum Yun wrote:
>> I don't have the context on what this code is doing so take this with
>> a grain of salt, but...
>>
>> The point of the _nolock alloc is to give the allocator an excuse to
>> fail. Panicking on that failure doesn't seem like a great idea to me?
>
> I thought first whether it changes to "static" memory area to handle
> this in PREEMPT_RT.
> But since this function is called while smp_cpus_done().
> So, I think it's fine since there wouldn't be a contention for
> memory allocation in this phase.

Then shouldn't it use _nolock unconditionally?

