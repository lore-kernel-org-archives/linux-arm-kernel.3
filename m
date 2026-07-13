Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B02C2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 22:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=AgQUtZk4JxfdrpCudYTTgIHshbNR5GKJ4Xji7gE8h5g=; b=lRCmWlhjSeIwnn
	3lqVk1jMtos1GgY7JblDPxyrxE/KlbnuKiSuAlcMpHYYgrVf/nNaWo37V3A6advPao3/MWVYLfGp0
	ENeXuKoC5RCimYHy0pqJBHoVFApibFiQn6hicOdn/0T6uYCJSk/GDay03dgBKVKW6SkKa0r8nAS21
	mxcuJk/pWtt1o4E9052i0i7Y78O9URrrxQwMMBFQEbTGsSSm3VKswI2fhxJB1DzSReHYarjh7e4Ku
	wXv/VUztzW+ECGxiAYq1rBU6JH8sXpRghlURLNYOKvtv2wTegcM/0jbk7eq1Yu16wr8z/Xf4tfAv/
	XcnzZgEnWUXpI+qGJPKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjOoW-0000000AUWC-3jHO;
	Mon, 13 Jul 2026 22:07:48 +0000
Received: from mail-oi1-x249.google.com ([2607:f8b0:4864:20::249])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjOoU-0000000AUVq-1TWH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 22:07:47 +0000
Received: by mail-oi1-x249.google.com with SMTP id 5614622812f47-49aa4525b82so5272232b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 15:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783980465; x=1784585265; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AgQUtZk4JxfdrpCudYTTgIHshbNR5GKJ4Xji7gE8h5g=;
        b=wbHOzc1Rp0Qr2fcqjsw8MatzzQRtG1ZiA8EhdoRlU1SBKBUYL3WDxYB0wUey7D3TZv
         GUtiGHqN4GB+s6nzRG35C7dX/yWxzQsGedtSDqmA4pggygpv9E40MogN5iOA5rRIqXhe
         8pR00BqVPEu8B+Q+8drvoE5XCrk3cB0f7YAzd+eo2fDvVn4pveyUgvR9A8BZseOiTor/
         6bU4MdUELWoXq9SZrR+9gVBM2zbYKGuj62MNhJb4YVRLOJ5jeytYJ4RRIfWskskCmHd9
         XKjgWTjTrTI9AnAqigXgBfJICOSIDoMMPZzqFq+II6zLo8TAfIgPin5dwyZAlzeNMQ6/
         NRwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783980465; x=1784585265;
        h=content-type:cc:to:from:subject:message-id:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AgQUtZk4JxfdrpCudYTTgIHshbNR5GKJ4Xji7gE8h5g=;
        b=JsoPQ0NEQHLCja46+rw+mVm5t5EPTUvbIMql+BdXakK+SW4BvKikkuSBer+puhoo66
         ulAKlkXhxgtGSzntIddI99QwzLvQa4elcXk1U19OS0qRAgR3QooobVOqTRlGEBLd4fmH
         CYu7oYoyCbfJ9Yv/3/iDRfWpxz5uGLq9MrEJRRiXKe9zuHeoJhMfNGaam8s3bpke4PKm
         +RsJpSeiRwvKgBDdj2QmL2iSAWc1B4/nfqcMpJ3tHxXZVwmrflY/4lleGsbfDy0zqELU
         OP6pMYTQzcoCYdbErQQCqdTS7Di/KpKUNRxJCC5OK2n1KRJhatGkREwiXUL4+haT3bMH
         1tQQ==
X-Forwarded-Encrypted: i=1; AFNElJ+CTnI4n7jjZ3ilyHhxwGRYVGq/aU18J07GKcgwCE1DG5o6a+YaLGx59UZiVAaM34S9AakCFKj3m8ZnLTIJTzGW@lists.infradead.org
X-Gm-Message-State: AOJu0YxhTwX5p3U8+dSY/A7dNl5hQHNl5Z75+VaMIMH5YTeHyb3XVwKn
	Y/iTrInwQfuBf69IugQQ+TM0/1uxdFF8i47jJSWYSI5koOzyekUn9wuUigc39Iv0yKwvJ/Q8gEB
	bC3eCy79tOMWB5MErBj8Zhd3rEQ==
X-Received: from ilzz15.prod.google.com ([2002:a05:6e02:320f:b0:503:50d1:28d])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:150e:b0:489:9e32:16f7 with SMTP id 5614622812f47-4a42afc9e89mr7832478b6e.39.1783980464501;
 Mon, 13 Jul 2026 15:07:44 -0700 (PDT)
Date: Mon, 13 Jul 2026 22:07:43 +0000
In-Reply-To: <20260710163023.agent5-0004@kernel.org> (message from Sasha Levin
 on Fri, 10 Jul 2026 17:03:00 -0400)
Mime-Version: 1.0
Message-ID: <gsnth5m25ys0.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH 6.6 v3 0/6] arm64: KVM: Backport VHE-only boot fixes
From: Colton Lewis <coltonlewis@google.com>
To: Sasha Levin <sashal@kernel.org>
Cc: stable@vger.kernel.org, sashal@kernel.org, oliver.upton@linux.dev, 
	gregkh@linuxfoundation.org, mizhang@google.com, catalin.marinas@arm.com, 
	will@kernel.org, maz@kernel.org, james.morse@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, mark.rutland@arm.com, ahmed.genidi@arm.com, 
	leo.yan@arm.com, miguel.luis@oracle.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_150746_424467_58D5628B 
X-CRM114-Status: UNSURE (   8.90  )
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

Sasha Levin <sashal@kernel.org> writes:

> On Thu, Jul 09, 2026 at 10:35:57PM +0000, Colton Lewis wrote:
>> Architectural updates retroactively made FEAT_E2H0 optional, meaning
>> hardware can implement FEAT_VHE without FEAT_E2H0. On such CPUs,
>> HCR_EL2.E2H can reset to an unknown state and must be initialized early
>> so later code can reliably detect whether E2H mode is active.

>> Without these fixes, booting 6.6.y as a guest under KVM nested
>> virtualization will hang at boot.

> Queued the series for 6.6, thanks. I also picked up the follow-up
> "arm64: sysreg: Correct sign definitions for EIESB and DoubleLock"
> on top.

Thank you Sasha

