Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF27D2FEE1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 20:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y76INJz49l6c3foMm04ZUQu2Dm0oObzGN1DVFxd18LA=; b=dtlxHET87ZrIqWcmf8DIoBFnQs
	tNkGrihS9n+KUsNikRpmSZSkkfS+uq+Nh1izuYIAk17WnFZWyswatHAeH3sioRyET2s9QV+OvEALV
	TXUrboplRa5QHpFPHTMQ2EhlznuChpRxL8OZSX9cNV2AVn2Y8/Ad4rL+benAymPcURIQG3VQ454L2
	qFS+IoGM7s7OIepy0SZwngEPwohuL14YImwFTQXLE/tdBTlYD4i2pEvxpGf32UfLECDiMjy+9w06F
	clVO1w0nG7M5QUIrUA0b4pJd5FZj/SLhf/Yl5OkKkKfjJZIvEzI1TR+GLCGeOqiX79aUcOJAp4E3q
	m33WFxOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkptN-0000000F1RH-2THB;
	Tue, 27 Jan 2026 20:42:29 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkptL-0000000F1Qh-273D
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 20:42:28 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-43591b55727so5824507f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 12:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769546545; x=1770151345; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y76INJz49l6c3foMm04ZUQu2Dm0oObzGN1DVFxd18LA=;
        b=GfMIhkWjx2k8FlLr6AlbAiVDO1X18LFdC7gb/QQhKtQ8Tc6Emld+kDv9cW2NS6d4Ak
         OlBmFnmE8N0YsWX7o06Dl08QCFE7EzcXHhdFiugDc83AXg04El/q48XjLRwGtxw6lM1L
         CJ5O33rLG+HZSMgF0IF0fmGHb/T9djRTO6flJFz2JGUlhS1EaR2pmc3XTSPoq0QRpgdL
         /bVZzGK/EE2SI2sPHwS1aeNERXY78qZnCRMM47Mc0/k3Js0L5+B3fxkHhkbcthcfQIVl
         i4BrVFF7OxlY0XKu6d2bCbnZ05qO0qFOEy6MAVwwY2vOaZkJmNjcOzr1hAbG7aTUouP8
         BfOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769546545; x=1770151345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y76INJz49l6c3foMm04ZUQu2Dm0oObzGN1DVFxd18LA=;
        b=ZBDdcYYoKOUZ3jINfuPUBReUOJH+mplzQS+RURgdZJJNeaBSWTPJ60EOtU4tMT6Ewo
         IQZG6A1S8FO+t8O0pUHBlw22AOCIWRYBKIqS1Ty0f4lmdaZnOnVFGY+bNK3OyUXNxir0
         yCxhhRBleJ1qPoQ4Am/Q5TZ+eNE78xs16nskknin6q+bwKFlFr1CjpI6Vmc9qJ2Z99bN
         9zl9ye+P1Mc9MB5Dviv6SdjGZanfk/jIPC0pExA3isXc2vscYoEoTdb09AM+YYsUn7E3
         URTKlzdWRr/8ftQUGMIC3czj9N2RZVJXgixDzAKhwooX1GUlmO7/x+qldFomtcho046l
         gsng==
X-Forwarded-Encrypted: i=1; AJvYcCWCKMsfL10GSBy9BEv9Zovlgj07IdpCCIbtKRKtSkSbyle8sfqlHVDyvVblYIlEmFdVKy4VAdiq28Hktl92pjM6@lists.infradead.org
X-Gm-Message-State: AOJu0YybJAAhgLMP+d0MQamipvfDrlzgow9Zf8PrhizIcmFw1JkmubZA
	mTg7tm87VDlTeQXhKi0uXKPI12beYTfp6ehAWas+I/VCT6RP4dSD+GhG
X-Gm-Gg: AZuq6aIGOMpcZlGKPvQlStIVNY0Suas3MDkyF4KGzZJUxa1BKRMl/HciDqGO2E9HtPZ
	0ZgBi3Dx7qTJzzTtZ8W+VpUo/dR0wbWomJi03l9U1woQwT+gYMhYIy9PRfH3oOgi+4vlX6OtcEx
	dTGJiBzoYNvDhhfodRR2soFj8Sr95U0/Z1S6yN6sZrFvK2WdE4BTakiPGFzMJT7i5AFqrVcCmNl
	I0mrYQ6kB5F/hG+nkVJRNfD7YIi1BZcY3sdAUgiidORy6yG8N+fHaBME7B9P1yZkUw7NXfRbvSJ
	z+nEEKg6tAcdfN3IlPW4iRh9HJ1kE7ZAFFS/oLi7MMPEKBFka19aav3D5oDQcFSRhiR36JObMNh
	qt3wgzaHfu42v6Yn9y/CUnKlTENzKT+TN0uT5H7VsoadXfqrK/XvIXzdUj3iKXMFBvEu4KuTw8u
	CLtgvyKkXMcSy5VjWV96Of7HIuVkB1p+ciVo3brnNcrd2M/5mjB8HW
X-Received: by 2002:a05:600c:c16b:b0:47d:264e:b35a with SMTP id 5b1f17b1804b1-48069c1a85bmr30848435e9.13.1769540070008;
        Tue, 27 Jan 2026 10:54:30 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066bee687sm126914635e9.5.2026.01.27.10.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 10:54:29 -0800 (PST)
Date: Tue, 27 Jan 2026 18:54:24 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Marco Elver <elver@google.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>,
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@kernel.org>, Thomas
 Gleixner <tglx@linutronix.de>, Boqun Feng <boqun.feng@gmail.com>, Waiman
 Long <longman@redhat.com>, Bart Van Assche <bvanassche@acm.org>,
 llvm@lists.linux.dev, Catalin Marinas <catalin.marinas@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: Optimize __READ_ONCE() with CONFIG_LTO=y
Message-ID: <20260127185424.39d801ea@pumpkin>
In-Reply-To: <CANpmjNP6qRm0M9Za-=Lm8N87o-GukO5nQeAVpW=bbXRnip4Fvg@mail.gmail.com>
References: <20260126002936.2676435-1-elver@google.com>
	<20260126002936.2676435-3-elver@google.com>
	<d3295c84-da15-4695-8110-7e04cfaf1419@app.fastmail.com>
	<aXfGcIpeXQNRUI-A@elver.google.com>
	<7478d2cf-9636-45c8-8ffa-8e3a3ba9baf8@app.fastmail.com>
	<CANpmjNNWoSdE_Lo9CJV3sAR+j8qz3_sq7LoaqYO6cVuOtdTBzA@mail.gmail.com>
	<20260127143026.32429f32@pumpkin>
	<CANpmjNP6qRm0M9Za-=Lm8N87o-GukO5nQeAVpW=bbXRnip4Fvg@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_124227_561537_EA57CABA 
X-CRM114-Status: GOOD (  16.96  )
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

On Tue, 27 Jan 2026 16:04:45 +0100
Marco Elver <elver@google.com> wrote:

...
> I think the bigger issue was 'volatile': "Passing a volatile-qualified
> pointer to READ_ONCE() is an absolute
> trainwreck for code generation [...]" per dee081bf8f82.
> 
> While the above with the temporary is gone for the asm-generic
> version, the arm64 LTO still has the temporary and we need some
> qualifier-stripping helper.

I've done some real experiments, see https://www.godbolt.org/z/n9f91dGe3

If you don't strip the volatile you get a 'trainwreck'.
Visible on godbolt for the short sub-structure function f_v_s().
Fixable using __unqual_typeof__().

But the code for anything over 8 bytes is also a trainwreck.
eg: for an int[4] in a sub-structure:
	return __READ_ONCE(s->s_i).i[2];
f_s_i:
        sub     sp, sp, #16
        ldr     x8, [x0, #56]
        str     x8, [sp, #8]
        ldr     w8, [x0, #64]
        str     w8, [sp, #4]
        ldr     w9, [x0, #68]
        mov     w0, w8
        str     w9, [sp], #16
        ret
(The same code for a char[4] is fine...)

For integral types you can get a variable of the unqualified
type with:
	auto v = (typeof(x))0;
but that doesn't help here because the code needs to read short structures.

For long structures member by member access will give better code.
I'm not sure they should be allowed.
(and there may not be any.)

	David

