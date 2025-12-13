Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6462ED59F6C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Dec 2025 06:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+rwfO26Bv4zxCBRJtW1ytHBz6MhNx4VrLDIQaPsUAv8=; b=mbo+edk4jDsF8s1qxtfL5Pww2c
	hnh7rdwrIU1JqeOxSddRopp6WgQ9uTtINgFAnp6xN7Eo82oOoFHpqDHIgWbcQ+61GxIrXmxw0vY5v
	uZ3rbbruG8mA9CQ30DIdKHIHdqYCsT1IfjUINMM4NXwchS4I5FAoNRgNnfrw7KrJhBzvMGsSivd40
	kl9WNTQwZYdM0Md0Yiv+ccSwIYxx/rvJ5mgNbZomggqmYAh+vAst23GE1YqFYfTwqDUAtZ+yiqn2f
	XZ4pUXh0j0RMT6VAbPvWucBp4O3rrYOVO5gSpU0TE9Trf3hu6f2O0jelAg7BQSnmEvkXsrf7UiBnH
	JzSf+qTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUIfl-00000001RHI-3OI3;
	Sat, 13 Dec 2025 06:00:06 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUIfj-00000001RGb-1wqZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Dec 2025 06:00:04 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-34ab8682357so179589a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Dec 2025 22:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765605602; x=1766210402; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+rwfO26Bv4zxCBRJtW1ytHBz6MhNx4VrLDIQaPsUAv8=;
        b=MI8rR0GQjsuAtIr92mdKDSzx/89pkuU/Wy21Axul6DM1Hj5EnyJ5yqu3KUJzYMUTg6
         rpCbrHcC2Sm0isdCNuIA9j2lol9I1i2I+8FzuCzEH5F/CHPZinj7H1oQLAN3+Bk2MdAQ
         gqySk54hag+iTG+zJmHWO+9ruAqo41hWaqdVyC4m+E12cemLqinrMettWMw+NZ8bFW+D
         sKMoVLyQxumXXaafeWSDsrRcElvYdQjSzdj6l68EKvdwfCcOBkp5EQ71mawF92rX98BA
         HZ06qkGC7wSkW8Bhzja5rSP+7JahKJ8et5hYtUbZahH0u4wbw77KZyelNuXeHn3AWriD
         Mrsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765605602; x=1766210402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+rwfO26Bv4zxCBRJtW1ytHBz6MhNx4VrLDIQaPsUAv8=;
        b=vYIwjldsbu1dNDrVXrnxVzoUHvqyfU8HmyLnR0UX51UkWijBWpH8op8SNqn94ywhkZ
         MgQB+CGKdfvdQhL28eM5UCpogstGgf5PnBqRMs3hA9kVlDbhLwkxVdMj4Yq3wrKxQJ5w
         /0cRnwQUg2hmU37wF9mLU5j/v+XSl5MbJ4A2yYtWKvrEa+rn3oNjCULKHzmejuc6GOMy
         HEsrDSljMEjd7BsDU/XLKwWUOur5zW42A7NuQQBy26ST7Sm2arSd3REJTVB43e+ovHyG
         p5BU4jCwt26srdTNBzlcE8eCPO5fDi5FHDejBGMLL9sHh1xCh0q1D8jEDCVfQB8nBlpQ
         p6+w==
X-Forwarded-Encrypted: i=1; AJvYcCXG+31w8G39Dh8v4/SyM0OpIi9xNS7luYcQWn9uQdSv+LtVSNyAxvf+5ewKXWlzVY6/YPWpVBT/Bqg2tm3Yhn78@lists.infradead.org
X-Gm-Message-State: AOJu0YyCrO32i5/22HVhORTFuXzY/bojMaFdIlku0YHw5IFJSLzlpPdd
	DHUZFn+L3z4JLVvXWvwi2OTXuZh5Ah3uRgwQh5rJ1PNRdkmBDx9fcbCF
X-Gm-Gg: AY/fxX6mR+GjLvKVzauwsT0SBXgLYJNTG5Lbpz1VQKcO04oUQ8vj6OKVLdapPtG1aCu
	t0EzcxS7Si+IugDNoUHYxz0w2VYszO6Yo1jfvTVeTgdiWZlQVL26WGW7N2pxoh1FBg7/ULTZgBf
	S2IhanzWy7RHEgEwwWRtbJrIcbQeR2t/u8iOx3h9zcKek2qgmvE6kGVz0t3/GsHHbjcPDfpdq19
	pUU1v2pwPS9MfbJjHc+HHZwYX/ntYjkfpsKh2lz+glUIX27YWFkN+H27NPweNcQ8lGnP/CUl/Zu
	+v9jgS2cCWMbWIcfYLrgEhG8hEsHlY7520Om1dCJ3BcJYLArIxlTzecM0x7qYa6wdT/gYhJ0BjC
	a07BbKlEJJ2FF9rq5mwOL5lZG1vBDxufu+GH1zjyU6yPY94nzMH4rEgA8jmDZ00F+dllicI7HF6
	a5LmGj5IXcn4O+rPsyKf72Fg==
X-Google-Smtp-Source: AGHT+IGcN/Y+jGJuMAQROSfnsb/2OTBPCk4orf4q1OT3ssFfpsTYdLd+1aqhMRXyMqSoRRC74QwrIA==
X-Received: by 2002:a17:902:cccb:b0:2a0:879c:ed37 with SMTP id d9443c01a7336-2a0879cf44bmr16150795ad.2.1765605601660;
        Fri, 12 Dec 2025 22:00:01 -0800 (PST)
Received: from rock-5b.. ([45.32.55.39])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29eea06b49csm72038125ad.95.2025.12.12.21.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 22:00:01 -0800 (PST)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: nicolas.dufresne@collabora.com
Cc: detlev.casanova@collabora.com,
	ezequiel@vanguardiasur.com.ar,
	heiko@sntech.de,
	hverkuil@kernel.org,
	jonas@kwiboo.se,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	liujianfeng1994@gmail.com,
	mchehab@kernel.org
Subject: Re: [PATCH] media: rkvdec: set ctx->image_fmt in rkvdec_s_capture_fmt
Date: Sat, 13 Dec 2025 13:59:42 +0800
Message-ID: <20251213055942.3046647-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <8f24c8204984a46bad7d0bb24b78c8115906f748.camel@collabora.com>
References: <8f24c8204984a46bad7d0bb24b78c8115906f748.camel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_220003_531279_369DAFFC 
X-CRM114-Status: GOOD (  10.88  )
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

On Fri, 12 Dec 2025 12:53:53 -0500, Nicolas Dufresne wrote:
>I'm reading you here, and reading the spec again [0], and you are saying the
>Chromium isn't following the initialization process. That means, it should be
>impossible to allocate 10bit capture buffer, since the SPS in place specify the
>color depth. Other parameters in other codec can influence the reference buffer
>size, so you could endup with the wrong allocation.

Chromium does follow the spec when decoding 10bit videos[1], but that is
still limited to hevc and vp9. For h264 and 8bit video chromium thinks
this is unnecessary.

>You cannot accept a format that falls against the color depth in the SPS
>control, and rkvdec does not do color conversion implicitly. This can otherwise
>lead to letting the HW overrun the buffer (forcing 8bit with 10bit content). Can
>you check with Chromium dev if they can perhaps adhere to the spec instead ?
>This is all news to me, but I probably never had to test 10bit playback in
>Chromium outside of MTK (which might not be less strict, hopefully done the
>right way).

I will try to fix chromium to follow the spec. Since rkvdec driver is the
only driver related, I didn't check the stateless spec.

[1]https://github.com/chromium/chromium/blob/145.0.7577.2/media/gpu/v4l2/v4l2_video_decoder.cc#L648-L650

Best regards,
Jianfeng

