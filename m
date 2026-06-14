Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7246BCD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Jun 2026 02:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J4SksXRx5bVkjNj0+4x0aPsa3P8uvU4r9TmE8JfMJkE=; b=gQlsZr9QtnlfO73EkPJHX+UF3d
	sDTTBCsTiPtuo4coeQ105m77rzEyZSCR0ajALuEYT1kETucgCI/NRQdGuuepRoZZ4ZIzKh3nTBcRl
	0/zI380/mCPKI+9YD/ufMO6MIxPUTG2H6Ferm+kfhkfPAvMFyJPMO9bQUSYkjQdkI4b08ilPySYJv
	uRQ804zW4ulOSM+qSueklizVp8Bidr0Ak9XGkZxLPUnMQ0386OCiloPh5c79ku71OEhQ4WM3Zpce8
	MlJSzX29dxBoVu3FsRYeWMthga1qsdSriZtb5Z/zlRj+m1WFYopVI0uP2L/jbWtKpvTEqT2Rg8Hqj
	l9FZPNPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYaT4-0000000CgCq-3Kx7;
	Sun, 14 Jun 2026 02:20:58 +0000
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYaT3-0000000CgCV-0C9Q
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Jun 2026 02:20:58 +0000
Received: by mail-qt1-x841.google.com with SMTP id d75a77b69052e-5176fc0cc72so24009981cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Jun 2026 19:20:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781403655; cv=none;
        d=google.com; s=arc-20240605;
        b=gKRRVT0J8mhd9N9ZbT8WsR4DjcZFwBIKi1EHUjF1KC60hn9MqEuztgDOQltRJLtH6F
         g9gZJMK3IvFOh49k9FZbdVufSY8ZUELehUsfB1/ruzrCDACIew7MVC5PFKPGk4CcNJ7u
         VRMDBWyUesAQlVgm0oB2hcHzrdkj4w6gq6aqc7FuIRQlu1HTf7c6MzznMsyACJxSLup2
         bpfBNN6t0eGKQhQJuG0E5QJ+ufLb/qeyCEMi92YiCm+4xnV1mAOasDWmXkNk/UdP/nnF
         m4oevnXd1mFAeEF6pgSk+hhDgBKK7PorT1Om/veZyKSQIZ9+j/z0HAIGE/+FeUuyCxDH
         h4Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J4SksXRx5bVkjNj0+4x0aPsa3P8uvU4r9TmE8JfMJkE=;
        fh=wn7sjL1mlKiR0+5On1upi/aCkY9/6nojwGAWuoW+eJ4=;
        b=MCxuHwjX7VhpgMSqZKeLkFEgxDtvkkrj56UYjIfVX3IvW/0hFU0gStYilbwYwgaWcZ
         zS27Ff9NnSIphGJu/iGSb4NOwpjxGLh9fuvA9Rezz5POu0KtOq61jWy6fQ4JccOkhkt4
         /6rjOUBtpqs4ejLCuma9ROkGQ+sfO76cUnqhhJ7l1+x5vibM5bOcMwnD68QWAlPZoxvl
         SMsREk/0bUCJaQFuSWcMkT5vybY5F9zYdOI20F+Mdp2o0Lybd8fP8iG4uxqFEoeOzFYf
         AZOyr9Lc3rgpqecJ1ktxC6PT2aCAmkj7AQx0+ysRWVRP9+lfmGPff2dvbSNP6GN7ka/k
         lq8Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781403655; x=1782008455; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J4SksXRx5bVkjNj0+4x0aPsa3P8uvU4r9TmE8JfMJkE=;
        b=iJIfSao7yZUVBPewYNoFSaygQ3wBw7FFnnjv1h+PX9U4kScWxj0Ve1KkrzHOGwBpE0
         g9eTiCdFf2GilaQhBRxSG5IorV2Vs/dHr2J2lL1xz6TaINgC34y6EqLst++o2nIQ/Lj4
         WVTJsGV9Ybq28N99B3GneGgfxAe4NxJNI0013XAot2gzXvEi/ci34PxYrXWelk6EFEM1
         v6LrKm7sVeQCQV3BKjWBtwglVT/ME/DNHpEG8CwLL2JBHkqlN0X5DtMQDwM3HRUJOk1Q
         sOkvjVlHGHrtSw5Gbx5rj8cgHUFNd4JUpIzOt3uiVOM8Hkgz1Ogt2kYdH4L2DM+Kuw2y
         X5Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781403655; x=1782008455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J4SksXRx5bVkjNj0+4x0aPsa3P8uvU4r9TmE8JfMJkE=;
        b=DdbWJ0qxlfGpd+3k91rGijoDKaTltC56B101rh9iR5mEccSn1ytvzjZbxHNBppvZcD
         HaGSz0Qo0W06OVLe30JmuYdgeEfF0mKLalBpdkmTDIBbbVzhkvdJTeJaGVkCBOFbgKJq
         mEFxdh1tbFvkgRyjkcJbb/C2TjdVyNi2BunovMxEuzK3gTEwGTFiNCFVcaOliAlYq9Ct
         pPgie6WjrgipbfoIbYGCDxi9hoo3fnEeDV5e7O3diOiOqwCst5xDOe2XbaeTIU5osu8h
         5BSigH2COrh43h+D4u9zI+9lH/dm3uL1WSeVdIWR+rRJICyZn6nzCQXXwrqMvg4kO9YR
         /JKQ==
X-Gm-Message-State: AOJu0Yz/aeTLy93+wgsf9inTSRoP7zZs6n2OGbpWb/eOCdioT0+kejaG
	UWXHEFI0Hvp6YUc6f2Poy5H+3F87HK0qAQU2Z9p8PQC3sdV956Eh9NSWsjyBXo3Wd79riRhRFJ6
	Ik0eLip7VBI0qwyar2FM2NHNfRB2njBX5KdpHgPQ=
X-Gm-Gg: Acq92OF2MrJZCM/NiB/EFs0qW0cCHEdjkOqtYam39AXObW3OsWl4a59R2FosWdF3FAk
	c/i9kjS/fhoK5MivWmWTBt9YDQkIzKOMJnboXVikt6KtCQoPlpJ9KpOA4kb9R4x8aARLUHn4pvn
	P7l1Y0kKk/oFBG5k+puUM27CoxO/xnTMUJNffujMe5ohdigCsvetXD97ybaN1P7/JEGWT/rh5Gy
	HFrBE3OxUkxl+foiR05pWpUbrCBHYgKcm3FLk3dtIadFCCHpK2XQ+bg2jbmLI2PxLXzr2in1tEd
	novvr7nqiG5WFMRcoyLUT6J+QOisEuAKUh7SKS5ThdGlrs+bGuG3rZAS7aW9sPUejinq
X-Received: by 2002:ac8:5892:0:b0:517:8c0b:66cc with SMTP id
 d75a77b69052e-519533bc447mr90409111cf.25.1781403655534; Sat, 13 Jun 2026
 19:20:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260511011504.77760-1-enelsonmoore@gmail.com>
In-Reply-To: <20260511011504.77760-1-enelsonmoore@gmail.com>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Sat, 13 Jun 2026 19:20:45 -0700
X-Gm-Features: AVVi8Cf0Ctp60604ymMhIu_yZ0u_r4BX2F7mpjsGF6XYtyVVoUAvCQ9RgUQJa_g
Message-ID: <CADkSEUiGDsGxh-qxqHMbmvCRF=VNmh2VyT9Ko7sj2Eau-sTWxA@mail.gmail.com>
Subject: Re: [RFC PATCH] ARM: move reserve_lp[012] handling into affected machines
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, 
	Jiri Bohac <jbohac@suse.cz>, Linus Walleij <linusw@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_192057_114307_8EEDE582 
X-CRM114-Status: GOOD (  18.17  )
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

On Sun, May 10, 2026 at 6:15=E2=80=AFPM Ethan Nelson-Moore
<enelsonmoore@gmail.com> wrote:
> arch/arm/kernel/setup.c contains code to reserve lp0/1/2 I/O ports for
> machines that can't possibly have these ports. This code is only used
> by netwinder and footbridge, and is small enough that it can just be
> moved into these machines. Do so to make the setup code more generic
> and the machine code more self-contained.
>
> This patch is an RFC because I'm not sure if using .init_early is
> actually necessary. I did it to match the place the original code was
> called as closely as possible. Can anyone weigh in on this?

Hi, everyone,

Gentle ping (+ cc Arnd, LinusW) - anyone have any thoughts on this?

I meant rpc and footbridge in the commit message - I'll fix it in a
future revision.

Ethan

