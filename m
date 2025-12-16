Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB5B7D5CCB7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 10:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t5rEzB0XfV2HhggtoY+1nXODslnee9LcIT7edg43TyE=; b=dXf26K9RrH2pR34ZHsSlfTfSo+
	Ol/McdeDH01grvo+4o+YN1Nyvj0zmOjllceKBclOJRfppnhzf2A1hjNxta4LnbWu1OyuGOoRqqnik
	I2gsKT/azimTbpeFRc8PS58+Bny4T4YhV3cviWzNa7eOKQgR4Jpm9LPRw5cPK29Hy9mIf4RDYbuyd
	v+LA4deIU+OrbOUmXJuTAQ1Krv8gZjCTS2Ge//0HPM9AN5u9v0k4NppSHDIiEgL4CM3LGc58tKgoU
	vGKe7BdneppnVY5a584tdB+QEFVg4BOorsDLROsUsHVrLGJ7ISQaxLCi/5NF4dmQg+DzjCUrA4NGo
	767cEilA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVS18-000000051Dw-2iHu;
	Tue, 16 Dec 2025 10:10:54 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVS13-000000051DW-2wJA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 10:10:52 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4779981523fso41474105e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 02:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765879847; x=1766484647; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t5rEzB0XfV2HhggtoY+1nXODslnee9LcIT7edg43TyE=;
        b=iJpDCpKKqrTiPk/Auj5qHLetVQGRBs5LCububmg3KzLlraPS0fOp/jyR/NA0ne1Vej
         EG0XHBzJQH96RYnd9nlOUCQOq+mDPEM4o3+HalnV/8rXgN/Qe7SPMJ+OJ+/rubE1J36H
         yGV5SJdv7bET4YNFPB/dCrj8BneU+REHEY1adZyyTAwO/4fQMrFSPXjUh3HRnHz00Ikl
         QrsQrwexin1z7JA19d/Wv5OJ2q43G2+mp5i2ZYHbvZqDc4SIRRPuIbEx7rH2MJ65zRs1
         nbQ8AGU+WvthtTqNllGf5EBxoUo7YPThTcPlyXnfNzv+SKo1RlN3IUSWne0jJYH/mW1u
         yFJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765879847; x=1766484647;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=t5rEzB0XfV2HhggtoY+1nXODslnee9LcIT7edg43TyE=;
        b=JUx+csg7V2zKSpCtawKf7e2qK9vN+8TznKb5+v+2DGHNL/guOimHaMSk9/cBVT+Obb
         /+yszmyKHTztzUnOw929mXqZcHnbK2NVvnt1XSileKG0Z538wmV/zFe4wvmDdzUbs9ZB
         Kp34LV5vyY8SOLpVw9rzCU6GBtjp/7KegxW7vcpHRt51ye60ENzxAzglnxofLCaEDE/n
         /fzw9Lonxnvb6C3otaAWGIhoTJBGTuMojCB/SyveZbZTVPxu00LtTONmFXvjFgWTgMSn
         nVz07Atgvk5IISmA/wYHKCtTMhEUPSv+s5GR7MOtbZlOZzJ5L5sIw5fkLraRqTDuANxV
         J92Q==
X-Forwarded-Encrypted: i=1; AJvYcCVJGKq6HoJA4RdfMnf5YyBtAScLwFZd0pEZKC+lObqT6G/hX6evw+Solw34bnP8XUab0m8E/7kvoCu9Wggv5jii@lists.infradead.org
X-Gm-Message-State: AOJu0YyTwcdlDMGsVOKWxunW8O4BJgslEhm7d6wfJYXmoAxyWvmXd9gd
	kK1Em1qZO0zMriy4HpyFpB1CSZPAP9WcKmJmWNlkTikVRgtR/GMRnPeZmKdfbBllhe0eBHcsH1i
	JujjzWnUZMDIUUg==
X-Google-Smtp-Source: AGHT+IEd1DtqS9iGujKBf5Wl3HxnREueKAOxGRaJlybjiAz1XyBUCEjyQ5pN21ilTcLVd3HJFgAC3/iwKoa2lQ==
X-Received: from wmbd22.prod.google.com ([2002:a05:600c:58d6:b0:477:632b:1238])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3104:b0:479:3a86:dc1a with SMTP id 5b1f17b1804b1-47a8f9155fcmr137796355e9.36.1765879846765;
 Tue, 16 Dec 2025 02:10:46 -0800 (PST)
Date: Tue, 16 Dec 2025 10:10:46 +0000
In-Reply-To: <aT/drjN1BkvyAGoi@e129823.arm.com>
Mime-Version: 1.0
References: <20251212161832.2067134-1-yeoreum.yun@arm.com> <20251212161832.2067134-3-yeoreum.yun@arm.com>
 <CA+i-1C2e7QNTy5u=HF7tLsLXLq4xYbMTCbNjWGAxHz4uwgR05g@mail.gmail.com>
 <aT5/y3cSGIzi2K+m@e129823.arm.com> <DEYOI8H2OESD.1H56D3H8HKILB@google.com>
 <aT/WOAr4osoJWaMS@e129823.arm.com> <DEYP7JSVTB9D.3EFN2KEHH3O79@google.com> <aT/drjN1BkvyAGoi@e129823.arm.com>
X-Mailer: aerc 0.21.0
Message-ID: <DEZK5U2YP6I0.27VJHSVK14646@google.com>
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
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_021049_775626_657C3FFA 
X-CRM114-Status: GOOD (  16.24  )
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

On Mon Dec 15, 2025 at 10:06 AM UTC, Yeoreum Yun wrote:
[snip]
>> Overall I am feeling a bit uncomfortable about this use of _nolock, but
>> I am also feeling pretty ignorant about PREEMPT_RT and also about this
>> arm64 code, so I am hesitant to suggest alternatives, I hope someone
>> else can offer some input here...
>
> I understand. However, as I mentioned earlier,
> my main intention was to hear opinions specifically about memory contenti=
on.
>
> That said, if there is no memory contention,
> I don=E2=80=99t think using the _nolock API is necessarily a bad approach=
.


> In fact, I believe a bigger issue is that, under PREEMPT_RT,
> code that uses the regular memory allocation APIs may give users the fals=
e impression
> that those APIs are =E2=80=9Csafe to use,=E2=80=9D even though they are n=
ot.

Yeah, I share this concern. I would bet I have written code that's
broken under PREEMPT_RT (luckily only in Google's kernel fork). The
comment for GFP_ATOMIC says:

 * %GFP_ATOMIC users can not sleep and need the allocation to succeed. A lo=
wer
 * watermark is applied to allow access to "atomic reserves".
 * The current implementation doesn't support NMI and few other strict
 * non-preemptive contexts (e.g. raw_spin_lock). The same applies to %GFP_N=
OWAIT.

It kinda sounds like it's supposed to be OK to use GFP_ATOMIC in a
normal preempt_disable() context. So do you know exactly why it's
invalid to use it in this stop_machine() context here? Maybe we need to
update this comment. Or, maybe actually we need to fix the allocator so
that GFP_ATOMIC allocs are safe in this context?

