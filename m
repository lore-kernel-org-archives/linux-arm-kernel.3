Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C9CEB3633
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 20:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cyH4XlAxExvFjyU90KL9v8Os8YItCUBGdVDa5Zw1Ozg=; b=wu00G4pGw66Gv15RGq/cJyoDTg
	EzalhlknwzteN+AZudyHY4Qv6FyEkO3nSS0zJ9VDbNxMsdRL6qUAWG9hngzG33SJKd07qXXVdoTg6
	rO2T/xm+MtU4H399RcWhvZxO2jL1PgIDtE3u1zH71HMG363p2qFlyKG63Q8qbRao1ucKo9KArky0m
	Us7i055Dmcyr2GQFWjLfSE1Ep/OcHNa8Su3vPTACNZlH029eowlqPiaMcXY8l0cduLaWOgwU5yCSA
	RxdxaI8MPsNLsAYyD5qZIxaJVrtZpznfEeTpbvNcPrpCtUP5vypmAIooDKxdQVikakXjTEE7NMqbx
	Ly2eYWgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxACg-0000000DxBA-0ejG;
	Mon, 02 Mar 2026 20:49:22 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxACd-0000000Dx8Z-2Fp9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 20:49:20 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-c6f306faaffso1757151a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 12:49:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772484558; cv=none;
        d=google.com; s=arc-20240605;
        b=MlboBC1xKt+E9owBvy8rpyExc9SePZPyr2tPWBEjps0gO0VO7Yhpz1f7veoJc8dqlI
         sUzEoFBQFGR4wNUuOIjcJ1DQtQ4VCVMmsc8IHo5YrVWuNc0cSbNvGFg2pR4Hh8zYP+Rj
         oLWTgC07O6xxyacWoEgg4ml1DGpSljv0BGuJW6QoA2x5kn8e60VwK2jOUVCjrXssGJjW
         9NuskAorIyIJ8jMVrMek5Dix2XP0GZlgoZP74mpQr5tmn244roADSA96JqhaoxLpPfvJ
         5aMTYTICtTdHl9EVlMbLDzzHb2XtIkOvKsWnoD0qVbb18lWdBmt+wOpZhlQGdR4VhuED
         bojA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cyH4XlAxExvFjyU90KL9v8Os8YItCUBGdVDa5Zw1Ozg=;
        fh=Z8i/JlzH9sIOzydRt9iveXqrvWC2Hk2nmQ8W6y3ZC8Q=;
        b=UxIsZTkd3Zr52JpEncedxoUNx/vmGI7eI2l0+0i0aW9ohSjUC2Gf85vciTAHWArNqC
         BtO8VkVLXhv6+yn6nA5tHlVWs3h4l71yPjVJF0QTyRbZqK4zWrtbFn4uG/r38P+//Ztt
         z6baPiyAgSircbg5+K4/twF8n79SififcbA1DVwthdgTmhxD5NtS5d39bW6VKTjcQH/Z
         cf9e3lTfG+PZR9+C4Tz6oyvdbAq4kjyNM4UUoOTL6btN75cZz4Iy++dcsYlJCjCo8725
         5A7uZhHbzj97m0LfBd33Vkvtm7pi12ZwRe/jkdW0Roh8PDRNhHHZSndydVGPgCXgnXA7
         FW0Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1772484558; x=1773089358; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cyH4XlAxExvFjyU90KL9v8Os8YItCUBGdVDa5Zw1Ozg=;
        b=ULEcZjCuYfHXJknxh3FEISQfdBsJeNHjzPXJfTuIDeQNLXHcXiHYaWvdKG+AZ+dhLA
         jzw5GUzv3FNCitIKx+farO+1syCsQGLGQh4myxsYK5AHCR/GbJjaa1b6ORO1essA3rxQ
         VQS3xpOKyFMZrBWardfbYuQSXBzyeIOasY59wpllJ9+3cSRiLUrq6rfeFS7QeKtJKGPH
         TgdVNpmzyKQsJPaRfnlmtyGFroIY1P6ItiVEx3fcuAIQc4bJMjlOKYaT5g7hMa1mTTBB
         FtNocWnPNOgqTl4/aMbQgRDViGB9LKhBQQF6aOjGBMttNGgQWAjhlVMLNeXD8uQgiFVf
         S8eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772484558; x=1773089358;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cyH4XlAxExvFjyU90KL9v8Os8YItCUBGdVDa5Zw1Ozg=;
        b=T+URtL1x51gTgR6A9k8Enujo06xQvCaeAsAHBqPWxjypywDKAQa3vVnBHmMVnsEzaA
         gUS4NxeKt2RyD6vbWsgnIbfaHSgZ96SOekbnPXAGfByYVpizVQ5TPhdhyjjbKH3bPyl5
         Q3LsWbl0Iz77+5aV62F6UU+RhJ5CLDInjyah7aNYBXoTlKYq+hZn13p1mvszW2FYQiBl
         y9pSvJrOTaCYNvTYuU10UJr+vZuvYfWAGNJtWU4UIKc6/fHCi97yWclKgxLJYp7mI5dL
         mvkOgnODz4VeDFyOolQEanASrNXoIhF14s4zsCsbClcGwwrsT6ZqLtTfbPLRjR6snni0
         mi0Q==
X-Forwarded-Encrypted: i=1; AJvYcCV3OOeiY5ejrI74j1orv3N58slxxXz8DEb+BjbnUz+bVECHBw3HFQ5qjayqbOJaHDVGaBNwbW9RrWai72fmgd4l@lists.infradead.org
X-Gm-Message-State: AOJu0YzcJbFR7sESMqNDSanHhj820yqj8cNL5l4xeusih6reJTYtbNm9
	ryCQS57qX6UjG2YIp6YZhPVf6iwMPWObKcwIag8ZETiBZJtGlCbvQ2pybebQbVkH4ab3JrPv3Pz
	Q60U8lS/15CBgVzRAbs02atL4M4qKDec=
X-Gm-Gg: ATEYQzx4X2uPlwTqCXBbzxzz21GfRzd3pMKw6qZ8H04FDosoX5gcZhrI0l2dv5mpaeT
	8e4WOnFhlJFnUwdm3AIG8ceOwLTRqxgk7DTsvPgZe9ZWY/wUA+mDARhW33KPmHsRSmGdaMJp5NJ
	gO7ELsCj8Xkq+5Dz0XtkAb9DrZt1sXDb3KZAnNUj1EB8XR+cork+wNyIMYp4TCxCJP56crHCdyb
	8+t+1YJp7g5HOkNaovkQ1orY943QqK2dDEfBd44bFUzGqMioruiKCcxnO96TR9EYzoyyhj4bx7N
	u5bBVnDHiIjXQGtDEaMP1kTpEaqcFpUJQMaeHjAxKQsoIoYx6gQ=
X-Received: by 2002:a17:902:d58b:b0:2ae:5655:b16 with SMTP id
 d9443c01a7336-2ae56551006mr30904985ad.21.1772484558371; Mon, 02 Mar 2026
 12:49:18 -0800 (PST)
MIME-Version: 1.0
References: <20260228-a9-baisc-dts-v2-0-47489d5cc1a8@amlogic.com> <20260228-a9-baisc-dts-v2-3-47489d5cc1a8@amlogic.com>
In-Reply-To: <20260228-a9-baisc-dts-v2-3-47489d5cc1a8@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 2 Mar 2026 21:49:07 +0100
X-Gm-Features: AaiRm52vtoxByONz8aPJPqxZwiZKHaI1xY4O5j-m2jy43emEUvOKpokAtRMTsc0
Message-ID: <CAFBinCBo1-at-TqZC5Gbunos4k_KTikPS_yAW5z0NLcnzpuSBA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: add support for A9 based Amlogic BY401
To: xianwei.zhao@amlogic.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_124919_588538_246BFBE9 
X-CRM114-Status: GOOD (  10.91  )
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

On Sat, Feb 28, 2026 at 8:56=E2=80=AFAM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:
>
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>
> Add basic support for the A9 based Amlogic BY401 board, which describes
> the following components: CPU, GIC, IRQ, Timer and UART.
> These are capable of booting up into the serial console.
>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

