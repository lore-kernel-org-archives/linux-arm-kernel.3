Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF7A0CD98F0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 05:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9P+/X0AgS9w9pvMplF3SoP81B1eDd+b9FueSg0/UkAs=; b=i58mCdmopp+/t6vw99k/2RNIu6
	Rd2MZOQk7VLRK2V9HIm+xvss5Bq+3CZdtWCKoaiwuHHyB5+MEbBtLxndxgpF6fn9LlOQm1bOEpjGe
	uX/QTpnWag4zHV41ENQ8ymnWuNsg48Ma/gq1PV3VYQ/Dv2KRFBS+4e73WYPIB5P8rZVF+i3J6F4Y/
	05ohnjontECObvkVIhv5V3ksEpfVvmbJsEByLD5fNUOrsvHh0XQ2KIS6paV+2/ZsJl7s6eV56kGMV
	q1d3dG9cT3Dtu//Q3Vo3iWDIZOoq83D4XuL5Kboq2L43QB0C7kkn9Mvmg4Kzdir5LVzhtOPX8+/hv
	NVNqvSKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbteB-00000005iQw-1rIo;
	Tue, 23 Jun 2026 05:26:07 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbte9-00000005iPh-29x7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 05:26:06 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-304f590dd91so6008017eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Jun 2026 22:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782192364; x=1782797164; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9P+/X0AgS9w9pvMplF3SoP81B1eDd+b9FueSg0/UkAs=;
        b=KKPHkhZ90dOHDl8e3zEaN0gwX2SxA6oAihUOn/BK1E+BR2F1szLflnbNYnsIJfHpnL
         /JQwCdJnSbXWoSaNtK2cO14A5ZEZvNwlkwvLRH+VoJUZ5fF7PEkjZWvtsB1eXK2KnOXi
         /jQjsCpwonJEzQIAZL2GIXYB9NMHeKd3CQyMGIYEoBbPB4e+MZwfmoPxY1JpzUn106Yk
         ILjvpDktVnbZr3hns1nyvhHbcpIBIwH9iy596ibOLkuEMnZJtFnnsrZBFuoGH+Fk1UsZ
         a6tuJqU5fugMYeAntbvlUA55ndYwIkOCGrWhIMLEX7MqUCwtYguSNd1FoObM8Tndm6pH
         RU5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782192364; x=1782797164;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9P+/X0AgS9w9pvMplF3SoP81B1eDd+b9FueSg0/UkAs=;
        b=emPTgHRiJ9Mrwxh5b05AYZ4bItSoqb9hxKblEz8gPNAhv63poaiyu0Qujsik5FqJri
         exW3bpIhzwBYyKqvpIu4+gIgSbWobyMIJSn6XEbPc7ffnmalMKZHi+E+HXtKONS7Nl+g
         Cl3EEpYO5bcA0cgHsblDljXzFWwdEjUCp2Mj3A540rdayB63yxanCraty5gZ8SPWSb90
         dtwKnggBRF+SwtbYFAT2Rw6Pv4rHLh4nA+E3SUhwoMuuLFlecrVH9+rSKee2HYKA5NmU
         OYppGmR7pCBcL0vkRBamv8s3OdgbV83Ms4l1jAr5CmzbwEhvuj7cPvoEKsslxPpmSs+c
         2pOg==
X-Forwarded-Encrypted: i=1; AHgh+RqcKOaLY9q9ibQdgW06aTAaVReuSNUrqUNQKbRQZnTMJAolFDPsCfnvNfy2lpPwKQHMhBFSTowWt82JK4C7kBJf@lists.infradead.org
X-Gm-Message-State: AOJu0Yzdl9YQ7N/QSpAqQybvh0cPTOU/1PQMkn7oHpg0LEibRhAw/xac
	IPSUoA4MExExdYaTjG9c2+COKj0y+TAr8S+spGXZndIZRmylEoWrfMaK
X-Gm-Gg: AfdE7ckICiP3YxS5tXbt390vYUQdv4A31tS+LwEjZ/Bxqgi+Jmc2hbqYTx6Z6RKFNd7
	H6eJMexRYEbInG0dYmQ8jJR2PDwprdGKCrWavwYvanX8bd8DQ2TV0eOgPZ9zEszYhTgR8+8ZRQZ
	jQdi9lsyucXfGjkhJsyzZIXTRAPYH7bUa9S8u1D3CznXgbtVTIbTtsAeoNhWZYfbk1UoxtZEOpi
	lM92dfPEGxjbmojPEs6tcObeGPoJEh+O6jGmn2NSeasXeUimphYo8mXFyvSUw9DL5LXtNQmhUJI
	9j32Zs0VToWqEiMqf97KVc7G6d+tSL684AJWgLmuJVUwaWQff9rNZbIfKi6zKnH1ilKZOpQDny9
	BRKSDQTPI3IfaK3X19cw/Lk1S8OivKwMtEQ1JpQ+pT/06GtHHiuItAwC00BWLwaVt7cOsPN/tIy
	T/55ZRtAsT7VoAGukaiQ==
X-Received: by 2002:a05:7301:3c8d:b0:2ef:83d4:647f with SMTP id 5a478bee46e88-30c07035e2fmr11143910eec.25.1782192363998;
        Mon, 22 Jun 2026 22:26:03 -0700 (PDT)
Received: from [10.0.0.65] ([2601:647:6700:64d0::92d1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1be4967fsm13102455eec.26.2026.06.22.22.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 22:26:03 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 3/8] arm64/runtime-const: Introduce
 runtime_const_mask_32()
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Peter Zijlstra <peterz@infradead.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, 
 =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
 linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-s390@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Jisheng Zhang <jszhang@kernel.org>
In-Reply-To: <20260430094730.31624-4-kprateek.nayak@amd.com>
References: <20260430094730.31624-1-kprateek.nayak@amd.com>
 <20260430094730.31624-4-kprateek.nayak@amd.com>
Date: Mon, 22 Jun 2026 22:24:56 -0700
Message-Id: <178219229641.10927.2049980053557313152.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782192362; l=1037;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=zWdKKKHIRtfVkf/fFEjrVdv3jvJPJQtdRvuIlBkFkhk=;
 b=khN498z1aQ+psInrw6bQE5qRH/XIMR5tlYyp2iaj4Ympn7B3JrTIKQzNY2a80lC+XUaqLeiEQ
 hj75XonHxMsDBmZroa63UpdTmgS+Vn0VIF2BvLYDbWtudqioAYh6PlP
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_222605_550005_F651B87F 
X-CRM114-Status: GOOD (  12.47  )
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

On Thu, 30 Apr 2026 09:47:25 +0000, K Prateek Nayak <kprateek.nayak@amd.com> wrote:
> [...]
> is intentiaonally placed outside of asm block to allow compilers to
> further optimize it if possible.
> 
> __runtime_fixup_ptr() already patches a "movz, + movk lsl #16" sequence
> which has been reused to patch the same sequence for
> __runtime_fixup_mask().

I think we should opt to do power of 2 masks instead of arbitrary masks
since that is what the usecase is and we can reduce these three
instructions into a single instruction for arm (and benefit riscv as
well). It is convenient to have this function as arbitrary masks, but
since we are going down the route of hyper optimizations already with
runtime constants here (and we can always add an arbitrary mask later if
there becomes a usecase), I feel like we should go all the way :)

The and immediate instruction for arm supports all power of 2 masks so
you can do:

and     w0, w0, #0xMASK

- Charlie

-- 
Charlie Jenkins <thecharlesjenkins@gmail.com>

