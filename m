Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1646CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 09:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OEirToh+MwCYb1DaYfmows1iO3IlCn32okdonWMlk1w=; b=mCmsiSiUBMJB9zB/h7Eb6yYMlw
	DxwE4KoozETB4NH3BZf35PnuVjl7Mfk6NfVH3HPfSes7yjgGIL7tDIpuxowF87f7CSBh4na0DIIZU
	2KuBH8KSKBV8U3Lv9UuOpdKGKSWM87pkyW/QdvdFTZU8FYo12QFHBFkFZFBT/u+rCoO8GO7NFMNt8
	sQcQpJ8suKzrfhuYmS63S4tSkvgPuL78JcyYZ/0Gr3hB6rm7smB0Hv6Q912tsAsyItkYzGWaSQ3UG
	F1mHzqtH6XbuY39qfq2J2OAL+CPZAgFxEYG1ZkrBzHQZsTzd0ryd7PCO3TKZyVy9xolggQTtJqnoG
	2ERU11Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQM3T-0000000AJLy-15Ro;
	Fri, 22 May 2026 09:20:31 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQM3O-0000000AJJc-1hce
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 09:20:27 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-67bb5ad91bfso14727841a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 02:20:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779441624; cv=none;
        d=google.com; s=arc-20240605;
        b=dV2ybFRA/qLn68Dt2aQmbPhgdiajslMrmfYONWoNM4vV6Xpigv3wuMNg26sVS1lsZH
         wtXLIJ57KH8ONBaQ+EplwPgqdFUt0oEcPd2biUBQ/d9ulOlk4UZo0iGBd0JMi1laJw4a
         XRHuBrb+TgIRy8TU4o9jMMug1BFwYxg9k7eO6dAeE8uX3uY40iieUr0kIkIw8ap+v2Zf
         LJ6Go33bD84gSiC6t0lvqGeQtIbqgBVy0QVBHFunB9IXAWpgjTxybgTl/dNo5f5xL03o
         4aS57+u64DDVQowepTujL+IpqiTQf5SgPLeYCaX7sIZmSAjQ4GLHiY8HbgshxKUbKOQX
         SoLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OEirToh+MwCYb1DaYfmows1iO3IlCn32okdonWMlk1w=;
        fh=65XEkejCYWIvMEE6UyQrZZYfbDWUbt1l8Fu6DnlZo2c=;
        b=BryllEEZuVpXj3siLmM1G8YNZMCRz5lY03Fhy8qgGIj1/bpLS9j5GE527rM3pbVV0z
         wVm/2/e6DC65JspES8bLQZ1EaIGlA9g/lEdTNSt7or/VFRDnUsrlCMJvBFoJhQbXcmEU
         h3UcB/+bvKYymtOELC4NS1xHbL+Sz14M9VKx64xyE2oLo7s2ehV47sic0pCInLnMhVel
         l34OavF3XD20nYNHaeFxskD9ByK3H9vn8dCrImKbXcaSfMTgIDlD5Y121tqbDYBeRqqA
         ZjtJclXPT9wJaasRV7cW7U2YJQPXge41A913jP5cvVN7bFSznuvEVeLtxaXyz9SvO0KO
         +aVA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779441624; x=1780046424; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OEirToh+MwCYb1DaYfmows1iO3IlCn32okdonWMlk1w=;
        b=UYmYpUK7zShocz/2zyZR7Ezik6901nrcr4i4ReSebmJO8ofKMU05rPg6keNiDAyj+w
         PL5qSCf/2Iu62N+eYGIUhlgw8o4N/EKJltZK73t8O533D2VdSiMagWF49zx4LRGAATyW
         VHzQUyIpQprRbj1kBtEt1fTXF1X9XPuxFS8MMe/sCQbwF6NokM6dCZEKeJyHvjAVGlR2
         sE8QPfJLIA4poAH1SepOz73uMG7ORylLUGBlq475JZBrBUkV1WrOW291vOGpWptHBHoK
         ucIwMUxhW8zoB7kq75uFSLforcN5vQKH0gKeuYI9ntyAULI702BtqsKfo5EFrJoKaiCC
         tSWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779441624; x=1780046424;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OEirToh+MwCYb1DaYfmows1iO3IlCn32okdonWMlk1w=;
        b=jvKuw2Ini47TBzHFvkUWlSvUeIDQv8Z8h5jsB2fYU9Fc0Zp90zRL7FF6EobVjb5UeX
         cty2f0o7qjZBj3XXPQH2ksegywBGQg0EudYtwNMNhnPqdPFiB6/EH6+AscjioR9cHVjN
         UvLyNrb7ULvFdF/X24thHqDzOq4DAtlGu8DPXKldH8l3rTCEHKnK/MEkr/ViE5qic112
         PewWS4O/lhhxAg0cAz+VwzfZqWRA3PKvuZPozenGYyJU+gRiSgoV6PmKk9Nn6vY00SOt
         qqRI8u8tT6TNrzLQjrFf6jxJ4a/zEPgd1iXzOT5V/E8fdwCmOoBZgcY6nIk69S8aMdGO
         AOyA==
X-Gm-Message-State: AOJu0Yz8wfq/3rCY7RiUbZXFQNEB/0r7Nn5xtPcKEGIEkHCCW3YhZnLh
	QiZuziv1ZIOeXJBypkVNsHG6/xXPSmFvmRdgbm3y74sNkkHbcuZtvGxr0J5njnrp3fcHeUVTSdJ
	RjeN7+FxO8LIxToIOWGXfaC4xG8LbVhcqVYe4wjUSyZirsS9i+Vu6ysM=
X-Gm-Gg: Acq92OHKIm/tTWoOAQN+xcC+XQJtcGSJOA8Z9uIz5oM0uCVbz5Xq3iWlgIfeaSeprPx
	XDoy5jJKtvDQGEPHUDFSAFe8wASA57bfX+JzpcV1hIQF95T1cqxcNYnqnS7h1qGeApP49LtZGLQ
	NyrzBD1R9YojUQ7erAPPEdm2/8q1jr2f8DMwXD6v6T7CfPNB3eUjz9av2iD7QoKIJ5nwpx0Kn7X
	2Ii9aF093HnZgSLcN8bCqBqafWTqTR3KM1Q8QwoiUkmAhQlso3TFnB/dLtXapjznRxVsgljfwcV
	hsSafepW/K8QAV8A7vg7TvojIYI9X25RJtVPYnw=
X-Received: by 2002:a05:6402:358e:b0:687:cfde:ddb3 with SMTP id
 4fb4d7f45d1cf-6889c420cc6mr1356687a12.5.1779441624077; Fri, 22 May 2026
 02:20:24 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20260522061030eucas1p15f61b7bc01f77a3d34d41472210ea662@eucas1p1.samsung.com>
 <20260522061012.2687122-1-m.szyprowski@samsung.com>
In-Reply-To: <20260522061012.2687122-1-m.szyprowski@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 22 May 2026 10:20:12 +0100
X-Gm-Features: AVHnY4KmsYofVZ6OtbI0hlOv_2b1wBOu2Rzf0xG7uc2W1dzbk8tXLU_FZLOZnh4
Message-ID: <CADrjBPqaVVCYzeG6OVtB1VqnQCLAAvefuZHv3=v86bRcaAv4Cg@mail.gmail.com>
Subject: Re: [PATCH] irqchip/exynos-combiner: remove useless spinlock
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-rt-devel@lists.linux.dev, Thomas Gleixner <tglx@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_022026_459249_0006EA32 
X-CRM114-Status: UNSURE (   8.65  )
X-CRM114-Notice: Please train this message.
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

On Fri, 22 May 2026 at 07:14, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
> irq_controller_lock doesn't protect anything, it must be some leftover
> from early development or copy/paste. Remove it completely.
>
> Suggested-by: Thomas Gleixner <tglx@kernel.org>
> Suggested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Link: https://lore.kernel.org/all/20260520220422.3522908-1-m.szyprowski@samsung.com/
> Fixes: 96031b31a4b3 ("irqchip/exynos-combiner: Switch to raw_spinlock")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

