Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 813BAD72369
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Jan 2026 23:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PIfml6cmBSDqptc9LOz4z9hdECIJ2oI0juXYl4HG5Xk=; b=qtslv7Xgy9lXTBmCAVSjGSi7fO
	ScMpw11UE/7t3rJkHQEJ6nZXpr76wDKWZasAP5rt+gF93z0RNCmWmYaGMNc+LMmrgUzqT5ealfUTA
	4rS97JqjFrPnrg5w1uWMg5jfhmn8Ip5sDItU4P5FXk52XiTn4+DDb/C15OZam45zbbP69MZn/lMUv
	5DnGhpystWQ/GOQzQSsoiDUZhfWBl5h2ej8uVPHhHBPEixH/bvG7A1u/3zc618WS/0nD7R9raAO7B
	NHu+5bbiYV69UtcXdwk07L5mGGjwuhClYRKadiBUIXPfyZ2gBIFG8P5jK0zei+PTpbN3AlWlHyuc+
	0xIn1y+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjnQd-0000000Ai0n-0PKD;
	Sat, 24 Jan 2026 23:52:31 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjnQa-0000000Ahzo-0dJ2
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Jan 2026 23:52:29 +0000
Received: by mail-ej1-x643.google.com with SMTP id a640c23a62f3a-b86ed375d37so387101266b.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Jan 2026 15:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1769298743; x=1769903543; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PIfml6cmBSDqptc9LOz4z9hdECIJ2oI0juXYl4HG5Xk=;
        b=kv2nM6d8TtgadfHJeBVKGIaY/wDSWibIJO86yy33XV6JtPsprZYJjncPf8gRbiAEUU
         yzwvCxvBA9jM+QxA8ZR2MJraZ1pNo0b0IyyYJX8FTtY3Nd0RQaS6xU1iCAt/Neh7J3oL
         tJQ5wu78soGo4sg9kptV4uZ5EQ4EKneAbUHy4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769298743; x=1769903543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PIfml6cmBSDqptc9LOz4z9hdECIJ2oI0juXYl4HG5Xk=;
        b=ILzd5AMR24wEbSIlVjhPqskV0KvI2cz9UZYa8WoIooDSry+h6yivdylvUA8RJqn73S
         hwKsyqbV6M1HgnRdZqUj+gZI1o/leoJeOXPBjOt3VX19PKvI7j90DjhQqX0QImj5Hzac
         +tm+cB10sCIW7zIIDx7cnk8P4YX5jn+hedQVYBq0t9cs3MX6RBwwWhas9YZpkcdd2J0l
         97oRYfzThU3tyzrtphhElL/qXd8uGA1E4tgyl8PIOLrk5951T29uyOvRh3s3AgqBtXjX
         tKousQllERbqLOVNO7ctPxJSpvVDmELfztovJhskCU72qxXnwcUdZsHaRM+hDnq/+blN
         6aNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKGCvxduPpd5lXcQwSfwBfZGKIWO0jTyxqvfSRErLC8ItiqWNV+8dYBoOSKOLjOaVRsiB61j0qTBg1ovnw1mjH@lists.infradead.org
X-Gm-Message-State: AOJu0Yzekvuw/PmswxUUUHu82bdpq1mHYVOkDXwLyXaZfC96E+A+T1qW
	XIZ350prDnUNcueXCMT1uu5nWjwg3ttYA5obdUPxI/WGJ+vfpiXefAJU2ilLpeOE5cosnv5rJHu
	ralsBFlSd
X-Gm-Gg: AZuq6aJC0j4qDxGNQhjYhHYj3jtco77yWFKARHggPGBniNzLabVfoIeSaeJYHYBTDjw
	jG0ksyuHCSRsoYoWs9tgdofwhI68fqa/F5sXHWjzxM45Gk0+MhlNsiRwP7qx8BYu66GPRuEqweD
	YVgfbCb0FSuD+A4W7ApOM4qxj9F8FsKyq2JgCmd23RUQ+xe5W8vqmXukZGZXKbIJOB/3mpjWTN/
	RxvjJ2CTpVs2y7ENGysfurfW7ZzQyRz7IMTevqWAUsHzkK96MTvhL0sa5z6uxn9xZ6ipczp/Kpb
	/KVi4D6VbiVmsAZPPrzOauiupVNiwy6koiHIUrl6IOaKnxVAgxN3iBvZJ9gestsA8FRwAFPtx5e
	aybQcLhEGP8j3pCpFyWYuWZlzYHkcUodnqBsM6cZpJ9ZACrskCFralmvUQdv8k4Mrvpn0KKH/MJ
	LJU0fO7zwiXtn//C8gm4avdQMgPAdYd7Ygs4T68OuFUHM9KPciiw==
X-Received: by 2002:a17:907:7211:b0:b88:f0f5:382f with SMTP id a640c23a62f3a-b8cfedfb96dmr11696366b.2.1769298743179;
        Sat, 24 Jan 2026 15:52:23 -0800 (PST)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6584b94738dsm2798003a12.29.2026.01.24.15.52.21
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jan 2026 15:52:22 -0800 (PST)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47ee76e8656so48568495e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Jan 2026 15:52:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVebUAYdLoPDSdMAkfl974t31AihL17fMp9nI3DpFG/YtvTQUNhdQfRDAxXyGe8GbeqJtfHKriLFV9djYe9Svun@lists.infradead.org
X-Received: by 2002:a05:600c:64cf:b0:47d:403e:9cd5 with SMTP id
 5b1f17b1804b1-4805ce4dcc4mr3092475e9.11.1769298741403; Sat, 24 Jan 2026
 15:52:21 -0800 (PST)
MIME-Version: 1.0
References: <cover.1769191673.git.robin.murphy@arm.com> <a00a59dcef3693efb02a8ee942848fbeaeaf05ba.1769191673.git.robin.murphy@arm.com>
In-Reply-To: <a00a59dcef3693efb02a8ee942848fbeaeaf05ba.1769191673.git.robin.murphy@arm.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sat, 24 Jan 2026 15:52:10 -0800
X-Gmail-Original-Message-ID: <CAD=FV=ViHWqjMGfYFgHBNRY-ex2vZjMaYoYLJb=vcUfPQRb9FA@mail.gmail.com>
X-Gm-Features: AZwV_QgqvLshh6AyFk-0oo1A1QJCI8IT1Nk4fy1OUz5UpJUZH977eNP0Jn9jIQc
Message-ID: <CAD=FV=ViHWqjMGfYFgHBNRY-ex2vZjMaYoYLJb=vcUfPQRb9FA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] drm/panel-edp: Move FriendlyELEC HD702E
To: Robin Murphy <robin.murphy@arm.com>
Cc: heiko@sntech.de, neil.armstrong@linaro.org, thierry.reding@gmail.com, 
	sam@ravnborg.org, jesszhan0024@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260124_155228_196011_11E3B29F 
X-CRM114-Status: GOOD (  15.14  )
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

Hi,

On Fri, Jan 23, 2026 at 11:22=E2=80=AFAM Robin Murphy <robin.murphy@arm.com=
> wrote:
>
> FriendlyELEC's HD702E module is an eDP panel (in as much as it's some
> LVDS LCD behind a Chrontel CH7511B eDP bridge), so move its data over
> to the eDP driver, also resolving the warning about the missing bpc
> value in the process.
>
> The unfortunate combination of HPD not being wired up and the RK3399 eDP
> controller's behaviour seems to result in the EDID not being readable
> over DP-AUX without probing the panel first, thus the hard-coded mode is
> still needed to get things going.
>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
> v2: Clarify issue with the generic binding
> ---
>  drivers/gpu/drm/panel/panel-edp.c    | 26 ++++++++++++++++++++++++++
>  drivers/gpu/drm/panel/panel-simple.c | 25 -------------------------
>  2 files changed, 26 insertions(+), 25 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I'll plan to apply patches #1 and #2 in ~1 week to drm-misc-next if
there are no other comments. If someone else wants to beat me to it,
though, I'm also OK w/ that.

-Doug

