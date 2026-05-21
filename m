Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A67CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 14:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RI8RcJrMlrGpgo/P0j5rPAmC/BUqQ0jZHOTebzV+Hvs=; b=zl6q4qYJk3XJghfVRrGpH2nVg/
	QGurd5NQPtmsOAtHsolxebKPqZxTECloWLaAQYMESY96fdQJnGvMI1W9gYLxRZGYEZMGYfrT1t8xg
	XkAbuO7aIhRIduqtOADZ3dStNu6R+USyWKJplv5ouLUUpSiiOB5l4QC+szufXAIkvS5Lj8kCwyfg0
	Ijqj2Io2OTiaQghGeCNJSRjDJp/NqjiNnOA3D944JZskHAfMz0EY3UaFLl8IKrVKwci0Mqx+mGj7/
	XX+eL+NEl9aXcXCUzZdJL64cbHKacVXyoy6/KDRFGXo8wNCukH2I9dOTpoLGg/nNpyJQg6hzooWOP
	vNWm+xmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4a9-000000086sr-0dXA;
	Thu, 21 May 2026 14:41:05 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4a5-000000086rH-3NjM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 14:41:04 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2bcd730e090so48105615ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 07:41:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779374461; cv=none;
        d=google.com; s=arc-20240605;
        b=lFh+dQiHjRR56oslbUo4Qoe9LwvKnK/KUkFkMCU3Z+v1eLrE3Qh2+zejY4H3s5gCsd
         p8I+VTuD369AY59ucapP05CtJyvrIrxca2vFf4IgAHywitUOTgCFLazumB4T4DZ2vqSl
         JzutO0Z31J9xD/1oXDJGBJO89PaZIrDpoOqlk5egUIWkSwvocNYg8+sj+JdNTFNqd3BC
         dvvMS8Ka8utjxql2nebo8lCdKwqsyK3dgXhu/ZxV9N9CWYTmF9dqLzVP49GpjQWd27wd
         waZ8PGo2P5TEaDCw//NQ/xZ9WrmpJPrZ77uXTnKO6MPc4AP6KnAv6PGsUEnxluwYwJ/J
         0X0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RI8RcJrMlrGpgo/P0j5rPAmC/BUqQ0jZHOTebzV+Hvs=;
        fh=btW163rDgogAtaNbOK4kwrCBs7/JGLG6aNwyevzjAWE=;
        b=MLXia+mpLn2h+jSbOBixcFFMPZKPTScx6I89HvZxGNUQ9ejxgcLyRycIi3s1k9Zdgt
         zwiI2I8xgWnM2FfFtF332tHbzMhkIMUFAYr4c/qO+BH85PdqsM0ysCjKPKSiaDdhJrK+
         1mXmslYasrrxDentOg1BMBy/K3Fv6xHy8VEXw2re4XaRSc3YMeCBIJxzV+A3ZQQUdL+b
         MwE0fD3VcNzpC946Qdcmj875E83FDWK0XYAKQpnfN9oU3yq0xcuLWW4ApOZ8v9iO1U65
         r/HpKoeAoSDAx2Y0iYcfgnQmFgyI5FTxV8+70R7UXfIj61XgWnZp5hoTmv0xSQMD76Nm
         BgPw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1779374461; x=1779979261; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RI8RcJrMlrGpgo/P0j5rPAmC/BUqQ0jZHOTebzV+Hvs=;
        b=czqe/ibGl8nd1htleKp1kE+6fKshHBq2LVtpMFywTegEqK8fP8PkN0znN3tJr2cbpl
         3TZP3SyLLY4mgqmqUV6em8QRmpOKlxgLz6AXL890Chis8Y0+GpCQPEH3R5y2XKNvDWnh
         atAaeKkuvRp2cG5m4oDCEgRsg3fqUSvTBpb88DPOgGbU6KGbNreRE/Ts3763ZJ6CKHgx
         hnykIf5oVBDgMh6SB3OLBWA4VLBLlL0+5vV//exftoq7hrmbeaM2yi8HINcyTe+qW5PU
         ihh8i4pbyOAzxsug3B54rcalxVoTcQ+HXqjPU1MQjgVRIJGLhisnNMQ5QCrVmv9nMZ/x
         8j3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779374461; x=1779979261;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RI8RcJrMlrGpgo/P0j5rPAmC/BUqQ0jZHOTebzV+Hvs=;
        b=OE5IOfb4dsKv8kUR/QEbUNMm3pItSXnFChQC2ANul9iRb0plgW9pysVArLZqJS7HM5
         5axPPc/V6HU8Mn9Tu+d18uZGCBc/pPmIguUl/AIkBWnVnXaRaKbD/MBxdMfs6u3ORyAF
         MiWcfftatSITzxcb8q9UapY1Z9RbDvukvYe7PfmK27xdV5OErb8eIS9KI3p5gZQgBzGz
         pJwXi9Xe9KtgaX5WOolebeUHr11AesBnak8ln1e1GUjjyrMoO5xIIneXdvS46pRJHd7o
         onUSGAQAfWBrUFTjdPWBAhdzbl77hkv/sB7gD6e/j2FJjGYq5xHhIDu8FNLZOvFXIfy5
         Wu8A==
X-Forwarded-Encrypted: i=1; AFNElJ++S68II4D65MZw2yq5U8pkDMXvTr0wlBcfZ354pW9TYYAvPyGS6L7VdGUdbJqbOpQroXt7YEkAOfzO4dt0jR0a@lists.infradead.org
X-Gm-Message-State: AOJu0YydbJFg2HvYk4lw3EhlAUH0sboCOiSnDBixEvhFFxuk/lDgxJ0G
	RdWu5jK0yuDtSrs9ogb7JD3+9JNnG9ivl2dKKqR5atWzZ+DxU20wlS6uwA0hPEQLGrbsdjXELgV
	uRpH5wsyQqqPdlpQDhF8+VtuvN2BkcOHx4Wlm0ly7tg==
X-Gm-Gg: Acq92OEZxNdDK8fCPafQXDgWQnnPw23j+D8kb0ZrnJ5r16MYIWiB+7MfWN9V0wrcvLB
	SiQFr9+0Gw4KcA6w3wPQLCXMWkdYVBQSBVKby0xJRJo61nv3qQqfnknYr+Y5b3jlioINlkL06GN
	BlKL7k/pwI45LYXCYG3SQNEBY0mcA4Zgpi0PDE6lVRa1H2SQYy0yFS6dlPHayHo/sxVeiD1hHYx
	jkbMd2Y4PUeHyK3X96l7DeurlkEfeVfPbkhcPZXms6irRnWxBsfvQ9KjQOrJGDjL+WA2WoM4/ry
	jbzQzfUB6qnv+cis4sGkQyu1h3PnvGWWBuqtFrEMfFymCDZpWg==
X-Received: by 2002:a17:903:1b10:b0:2bc:e62a:979b with SMTP id
 d9443c01a7336-2bea33d166emr36661465ad.30.1779374460988; Thu, 21 May 2026
 07:41:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260423-color-format-v14-0-449a419ccbd4@collabora.com> <20260423-color-format-v14-20-449a419ccbd4@collabora.com>
In-Reply-To: <20260423-color-format-v14-20-449a419ccbd4@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 21 May 2026 15:40:49 +0100
X-Gm-Features: AVHnY4LM5MR-pydhp54-iciGhQnPfxKOlxWC92SZdhfzMOyTtShVga8wCcjC3D0
Message-ID: <CAPj87rOBvjw4v+PER+6+FMuDRajXNnPSKAke8a=tVgiSRg8QTg@mail.gmail.com>
Subject: Re: [PATCH v14 20/28] drm/rockchip: dw_hdmi_qp: Implement "color
 format" DRM property
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Rodrigo Siqueira <siqueira@igalia.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, kernel@collabora.com, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	wayland-devel@lists.freedesktop.org, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_074101_848761_2B2A0797 
X-CRM114-Status: UNSURE (   9.30  )
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

Hi,

On Thu, 23 Apr 2026 at 20:06, Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
> +       bridge = drm_bridge_chain_get_first_bridge(encoder);
> +       if (!bridge)
> +               return 0;
> +
> +       bstate = drm_atomic_get_bridge_state(conn_state->state, bridge);
> +       if (!bstate)
> +               return 0;

IS_ERR() + PTR_ERR()

Cheers,
Daniel

