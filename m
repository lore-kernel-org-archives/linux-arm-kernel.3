Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2186C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 11:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc
	:Subject:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MqVabgXFstwYrAYyfsH8IvHqrVwku7JGFF8O9u+W/Po=; b=hH3GdMaTfb8VkrMaY1YEsfTsMk
	jqwFf+InCE5wMoh6UaQ42H4udwZeoZdZVt9+Gie8u3brBw6e7SLClplQc4GfEDDiDXcy5sn3gVHM2
	ysP/DlpjVAIZrFkfP+FcQ4hComIDMF89tVnNpulx0iAuxW4m+NxpActvanehTaekT1ctB9bg9IP+e
	KR+BgVZC/fQd8XYQJllZ+gn78VrbfRlitSYk9uyeD3sb04fxr2I7h3J5rC0M+wW2yl1ou7Bn2WR2j
	+xaqbbB034Mr7g0nIz1lnAFxRhzofJpeFZlYXtSKl8MIGuJMklnIYThKFlmcO8lkMlYHBcL1SCQZp
	eJNJ2L/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMQ2d-0000000Aou6-2ivW;
	Tue, 03 Jun 2025 11:42:51 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMQ0P-0000000AoX0-3Ka4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 11:40:35 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3a4e575db1aso934011f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 04:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748950832; x=1749555632; darn=lists.infradead.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MqVabgXFstwYrAYyfsH8IvHqrVwku7JGFF8O9u+W/Po=;
        b=jPzShYnA0DLbo53xM4ZskTOjSo3afdnzUTB+ihr/ZeyNLrdj81htO35pcUKpHjp89G
         8b5rVvZTRHg67z43WAbrVwnR2ah5uaJccYyVfe672oJQVme2GIFwVN4jSItgi5Vet8UE
         pOiY5bekaFGLv4Hdp/UxNXjzNZkM0kj6evPHCNcHCEmdJZ23NUObGJqtq3HdfcFGHMsC
         NQDtDnt57iKKvE6aZ8uAsnJlezfwI6H+UHj8+r6sV7Vh97R8njJlwdJgn4uuFSit/Dn+
         /EZeBlASmvmKXTRhmiPtVsMSEryNvUH8tAqGT2vNYL2vCyOnLbCeFMoRYepEUBP0DU4C
         VWRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748950832; x=1749555632;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MqVabgXFstwYrAYyfsH8IvHqrVwku7JGFF8O9u+W/Po=;
        b=pmU2JmGqUN109PD+nKebeKXk3B5BMuSB3qCmoLov0HFtHiYpPULUJP46QKl2dRUMTo
         3bK1pcj9YH5uuWzTdI/vVObTd4gr7V+R4+oya6rOa4jCrwn0qbcfTrJznj1JjX6yQdQm
         WYRENv18R5hw6/6fbglgpFiqiMd+Wxv+S8AMntodITrSO9hyr3j+J8wsvsl4pY4meuyT
         kuWbCL8y0d53/awAhpmPeXaa2W4S4LlpPTcke7wkw9jBXVDEdxncipt/k9U+fOfwH9Zb
         /4QrbfmaL5FYVbeAfh6kYZ5gKZ9LpMY3GaigIe4vYFAMBuSpvPZaamuBI73+3EFQ7AI4
         5djA==
X-Forwarded-Encrypted: i=1; AJvYcCUYY6gM5RGwtDSjPzL8vH4nhfAIUWfyHgH6e7xlvgGspqSnxq0PLhmOx+8S8zM5IxxohfEsnXW4cO91NCGDoAeh@lists.infradead.org
X-Gm-Message-State: AOJu0Ywk4f1M7HDc0I/0N/jQX4boECheZ+SeHDhSSRM4pCFsKQQA2H8a
	M0RQahAVyA6A987z3Axra6wB03Jl/dd5o1hUIRn48o+zdUNwJZCLD18ivyqjT6XGtMw=
X-Gm-Gg: ASbGncuO+/phnBgAQFD1R/ELQzzoCTndBHNJcb1M+vvfsEDpNHxtERZaF1O0jOX57d6
	j9aVPyyaCZbDDasCM5oPyW3ZaUFMulm2dPvx2OH6JKQzA1x75PD1HQp7pTpp6N7CKyBnfWo5LZ6
	4wWPxq0HcII+2zKvfG2ULSVzouYiAMf3522a9Oc/T5PUcj4OueFB7Lh3tWN6GU0eMkS5MyEv9sD
	Y9IJyXpPcLjCcF5IZj1+z3RYHaCLpgtFThK0WDxExKqWIlwO7jlciM4dbCVVUcA3D8UdoAWVKGA
	oPlBKFg4JEIP0RFsy+WEGDd843+d/xC6u4U2dREXIn9IFtl3eNLO6JcvOpk=
X-Google-Smtp-Source: AGHT+IGFDhiWKgjK9Y+TCcxKDa8nUqu/n2RN/MNtIHJIhQEdhoO4uixfNqx5KKNaUAuRzy9bZilwyQ==
X-Received: by 2002:a05:6000:230d:b0:3a0:782e:9185 with SMTP id ffacd0b85a97d-3a4f895f857mr4292350f8f.2.1748950831495;
        Tue, 03 Jun 2025 04:40:31 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:37e0:4ec0:b6ec:ef2a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f0097210sm17962177f8f.73.2025.06.03.04.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 04:40:30 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Jun 2025 13:40:30 +0200
Message-Id: <DACVBRLJ5MMV.1COZ83HBMUD6A@ventanamicro.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
Subject: Re: [PATCH v3 9/9] RISC-V: KVM: Upgrade the supported SBI version
 to 3.0
Cc: "Anup Patel" <anup@brainfault.org>, "Will Deacon" <will@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Mayuresh Chitale" <mchitale@ventanamicro.com>,
 <linux-riscv@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>,
 <kvm-riscv@lists.infradead.org>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
To: "Atish Patra" <atish.patra@linux.dev>, "Andrew Jones"
 <ajones@ventanamicro.com>
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
 <20250522-pmu_event_info-v3-9-f7bba7fd9cfe@rivosinc.com>
 <DA3KSSN3MJW5.2CM40VEWBWDHQ@ventanamicro.com>
 <61627296-6f94-45ea-9410-ed0ea2251870@linux.dev>
 <DA5YWWPPVCQW.22VHONAQHOCHE@ventanamicro.com>
 <20250526-224478e15ee50987124a47ac@orel>
 <ace8be22-3dba-41b0-81f0-bf6d661b4343@linux.dev>
 <20250528-ff9f6120de39c3e4eefc5365@orel>
 <1169138f-8445-4522-94dd-ad008524c600@linux.dev>
 <DA8KL716NTCA.2QJX4EW2OI6AL@ventanamicro.com>
 <2bac252c-883c-4f8a-9ae1-283660991520@linux.dev>
 <DA9G60UI0ZLC.1KIWBXCTX0427@ventanamicro.com>
 <0dcd01cd-419f-4225-b22c-cbaf82718235@linux.dev>
In-Reply-To: <0dcd01cd-419f-4225-b22c-cbaf82718235@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_044033_841980_CF4DEEC9 
X-CRM114-Status: GOOD (  18.49  )
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

2025-05-30T12:29:30-07:00, Atish Patra <atish.patra@linux.dev>:
> On 5/30/25 4:09 AM, Radim Kr=C4=8Dm=C3=A1=C5=99 wrote:
>> 2025-05-29T11:44:38-07:00, Atish Patra <atish.patra@linux.dev>:
>>> On 5/29/25 3:24 AM, Radim Kr=C4=8Dm=C3=A1=C5=99 wrote:
>>>> I originally gave up on the idea, but I feel kinda bad for Drew now, s=
o
>>>> trying again:
>>> I am sorry if some of my replies came across in the wrong way. That was
>>> never
>>> the intention.
>> I didn't mean to accuse you, my apologies.  I agree with Drew's
>> positions, so to expand on a question that wasn't touched in his mail:
>>
>>>> Even if userspace wants SBI for the M-mode interface, security minded
>>> This is probably a 3rd one ? Why we want M-mode interface in the user
>>> space ?
>> It is about turning KVM into an ISA accelerator.
>>
>> A guest thinks it is running in S/HS-mode.
>> The ecall instruction traps to M-mode.  RISC-V H extension doesn't
>> accelerate M-mode, so we have to emulate the trap in software.
> We don't need to accelerate M-mode. That's the beauty of the RISC-V H=20
> extension.

(It is a gap to me. :])

> The ISA is designed in such a way that the SBI is the interface between=
=20
> the supervisor environment (VS/HS)
> and the supervisor execution environment (HS/M).

The ISA says nothing about the implementation of said interface.

Returning 42 in x21 as a response to an ecall with 0x10 in a7 and 0x3 in
a6 is perfectly valid RISC-V implementation that KVM currently cannot
virtualize.

>> The ISA doesn't say that M-mode means SBI.  We try really hard to have
>> SBI on all RISC-V, but I think KVM is taking it a bit too far.
>>
>> We can discuss how best to describe SBI, so userspace can choose to
>> accelerate the M-mode in KVM, but I think that the ability to emulate
>> M-mode in userspace should be provided.
> I am still trying to understand the advantages of emulating the M-mode=20
> in the user space.
> Can you please elaborate ?

This thread already has a lot of them, so to avoid repeating them, I
have to go into quite niche use-cases:
When developing M-mode software on RISC-V (when RISC-V has more useful
implementations than QEMU), a developer might want to accelerate the
S/U-modes in KVM.
It is also simpler to implement an old SBI interface (especially with
bugs/quirks) if virtualization just executes the old M-mode binary.

Why must KVM prevent userspace from virtualizing RISC-V?

> I am assuming you are not hinting Nested virtualization which can be=20
> achieved with existing
> ISA provided mechanisms and accelerated by SBI NACL.

Right, I am talking about virtualization of RISC-V, because I don't have
a crystal ball to figure out what users will want.

