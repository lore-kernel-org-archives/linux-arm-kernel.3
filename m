Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26AF9D2ECF7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 10:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EngcF0AuMSe4GxCLzFlk3vYwqxnh61muSwDFDmoTUcU=; b=C1NSj2yWJ298mmF7OOBjjwCxNy
	o6YWvxVmsrMwdxpOLzMxkMQbS8TBQdtPAE4RihG1PG4liDWLZoj7/I+1rfHrMIsMnUpa3vcFDIFjM
	ClyuWob/Dk/uwg5hReEAGhivDwmIDzyLQ+niRdfe0Xq+j9v5Bd2a7P+L90qicO63nS2nBylNkjrQ5
	7m8ikLGI2xjvEsm0IUfB7p1eTxYH7LT2q2pKpflnkUYYdks5NVQdxC4sein5sHcjeguoMm/5xvJCR
	eH44/iTNo5ev6EGQG/RPjVWU1OlZADndAgsKqoasQIH2zKiD5BuQqaOCdrsMSQhgi7ab8AgImvzlg
	8PVZQQhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi95b-00000003dIm-25Y0;
	Tue, 20 Jan 2026 10:35:59 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi95V-00000003dHF-2fGP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 10:35:58 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-50146fcf927so53807131cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 02:35:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768905350; cv=none;
        d=google.com; s=arc-20240605;
        b=iB710op1WmnGgBVknfJlyY/RndsKVH85qrUdR9MJH4sLXBpf8eAOWM2G8V3NRJlt3u
         ac7pLVz8/NL+oFmkpQ/NbGqya1fpde3rfr0svDzHH+MmKFuSP/8auBXC8KPdbga2WLux
         LJOgogs6V8zNnEq+XhiO0BLkmv/0Wt1ChNnqsYlaEeSUxFLgYc2itqJKS4qmOr9uZFyt
         peQV4Q1Ypmn9mvnF45Aalx+YUX7gwkOp7hHsYTDpCHeqdMnC20rAbdb7MduQsJUQjt6c
         GrqCIdYmENrGl5JQ15IeLSETBEQrMO1NDbZhVZ1lxeNNvZo9+6IccdYTtcqjtnUBYpI9
         7uyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EngcF0AuMSe4GxCLzFlk3vYwqxnh61muSwDFDmoTUcU=;
        fh=uDYG6WxG1JYQJa8XuDho1MEhrRwJYmOsq6iaiLfGy+4=;
        b=N2jqus88U18YtxNt0QeGKmiVoJmIf/VCoC321CLGYUXknuwN8EF0j6rkZIrKs8O26c
         CeZMESs0uRk7KdI5WXQ6qm25pNTSCoXd3+JguYiTt2LIztcBDt7/6ngP4/Lm/unSIaBz
         V3cDeTGj6Z6pSf+sju7GGt75i7yYIEn6f9bSHAMJkZWnxYq/xB8MbxZPOvxR/DwGAV/i
         Mm7PEgv5Z89Q2EDzSaYkzE+HOTg5lcndqYdzDYKoP4UiyO/KmHkwOsQgMkQ8ymZ6n9/l
         ujav3urn/e+2Zy2Giw+j2vS9DPONUZLvzJSVg2Zdjn4+oZnDHZQsgKfoWc1RnoqwOwEH
         qHCA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1768905350; x=1769510150; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EngcF0AuMSe4GxCLzFlk3vYwqxnh61muSwDFDmoTUcU=;
        b=Nrf483FJyNr932bnw6h9zJQkiytzycZT8wyIC/GtrfPXcnFrSm/TMYc7L2WkFtaQ+X
         C6uOIS7CfySGHcVVqLRZ2rjiwgkmEaxvT5qNCKaL1jNXpXrDi6fqArQnFsSD0ZoIisfe
         OWxp+JMK2o3YUVp+tLc4UDVnkxgwKFY8XACiDIBl3KEhEbMKejb36/cqTBA+o66FI6KM
         7HtKSm3d+QYvJGPb5ZZaC5dSx8kogROprnfPlrOcnBqXQweVtquCCOg6a1jZetxWA2JM
         bg8ofwlLm3ghbyn8ghIkLvGhIEfaHgmAEZ6JfuXGZ5RIbrb/69eUqSPYuetmQGDHTXuF
         Uqeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768905350; x=1769510150;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EngcF0AuMSe4GxCLzFlk3vYwqxnh61muSwDFDmoTUcU=;
        b=PV8oTB+m1Ibnz074ZzNxjQJ7DVFeHPETUFfFeFEsRCN/L4yGDQgl2t9gAfRKGR2VCO
         IUa9KnKDbiqJlMFKjEv3IKi0zGmoB0hbDoCzoWUwjY64lY7Fx6NFcmL99C4cprhD2AX9
         ZS31xw519fM9f8daKdf9n+uhJUb61kaV+EC4z1afL/DJTmqi7ujJbk6p6Cf6iKqjTr9R
         gS6v0BSF68jE9xPflKJ/nj5kP96iBShAUUbhtLwHHpdEQ7Ex1Bmw2yKLFK1A+lijvqGe
         rAhVV/qrfhYank6GQS4phU0SFQj1EIhRO4WHg267EFUrdvOcW9Fqef+KMRaCAdVD6nme
         8u0A==
X-Forwarded-Encrypted: i=1; AJvYcCWY18pKhk9WP191kAjrZ3bu8+UCHn3YcwXnbmd0l3D2QhAz2twxI2oOmTYB5H+ZJhPOw3kEBVJv2/KcuqfGBkqF@lists.infradead.org
X-Gm-Message-State: AOJu0YynkrKaeUKe4fHryUTsmNdJBG68w/O0aTbpaG6SzmoAeLHPj5Dt
	fIK1xAInpJfVc38xJ1Gkz6wYgG5lTKnTVf+3+q6e/AWm3TqJOMtm2eMhGZlTwZEwyHnJJ0m2U/P
	O6zGM7z8FhILjBVNQpOfbSNQyXm51/XDQ/GdngrscrA==
X-Gm-Gg: AY/fxX7FagxLBB+MCadD602CFboeQ/NLk5jsQqfXwVizu5FRzqL936D7PgL7M/EMDEc
	dOxwzseLA3vyPNb2fBnm/FlmfTOkTMk+gPMoy3P04y5RkdUUUdVUsbQUM8X4sjuRHn5a5uJ7bkQ
	hGdJyyVKMnDhB+uh+UjF+Ae5YmRFcH7yjqPqeIQR2OZo44u37cetFqFCtWl9F5Xjlm8ez6lLvLe
	/McJ7GffdsAkFdOgmqF016v4I8Ek/bNIg6IbYu8G6wgq25coNjbDHlN3hZPk8iE7R5xmbWE9REW
	RLc=
X-Received: by 2002:a05:622a:1211:b0:4ef:bed6:5347 with SMTP id
 d75a77b69052e-5019f8faa18mr267369681cf.30.1768905349558; Tue, 20 Jan 2026
 02:35:49 -0800 (PST)
MIME-Version: 1.0
References: <20251206-vop2-atomic-fixups-v2-0-7fb45bbfbebd@collabora.com>
 <f9f7b446-8575-4f16-aa96-5197b22846e3@rock-chips.com> <4696988.LvFx2qVVIh@workhorse>
 <8655687.NyiUUSuA9g@workhorse>
In-Reply-To: <8655687.NyiUUSuA9g@workhorse>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 20 Jan 2026 10:35:38 +0000
X-Gm-Features: AZwV_QhRkXnTevqN1bZxbydehXRez199_FOqVjVHDQ7c6Ms6YsAuPA9K_r8GGT8
Message-ID: <CAPj87rN19nQcFT_u8WyNO6a+2AbAp2hBG7ARbWoJ8-jwO3yGfA@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] drm/rockchip: vop2: Enforce AFBC source alignment
 in plane_check
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Chaoyi Chen <chaoyi.chen@rock-chips.com>, kernel@collabora.com, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Daniel Stone <daniels@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_023553_790179_EE5C1467 
X-CRM114-Status: GOOD (  13.67  )
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

Hi all,

On Tue, 9 Dec 2025 at 10:58, Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
> In either case, I think adhering to the atomic API to ensure
> artifact-free presentation is more important here than enabling
> a fast-path on RK3568. I do think in most real-world use case
> scenarios, the fallback won't degrade user experience, because
> almost everything performance intensive I can think of (video
> playback, games) will likely already use a plane geometry
> where the width is divisible by 4. 800, 1024, 1280, 1600, 1920,
> 2560, 3840 are all divisible by 4, so a window or full-screen
> playback of common content won't need to fall back to GPU
> compositing.

That's exactly it. Changing userspace's request may result in
unpleasant visual artifacts and other unwanted effects. If userspace
wants to always hit a fast path, then it will need some kind of
hardware awareness to do something different here. The patch series
pointed out gives userspace a good way to figure this out.

With my Weston maintainer hat on, I'd take a patch to
weston-simple-egl to allow it to use a different size with
command-line arguments if you'd like that for easier testing. (Fun
fact: it was specifically made 250x250 to discover issues such as
this, which wouldn't be uncovered by something that's aligned to a
generous power of two.)

Cheers,
Daniel

