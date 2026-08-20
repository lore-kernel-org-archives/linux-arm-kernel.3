Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 521B7C5DF82
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 07:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AJBG4gSSkw0lXa5DQuNF9zreM4sRStgVFPDhjCBnh9U=; b=txUZeNjbI+NUqQ5siKw79c619N
	HitN55+jeS2OEGfxvYiqUaDCUaowfDSk2Ev+wS4oJYkbhJQ6h87YpxDEhI5v8jS3Ablzez5LUG/uf
	DxqzfuDUbqH94u0Q69R90YB57uKkBPkjk4Sp+ndwK15mso5VJaUjvXcxQuTG+oMFo4VDXICvLyTUl
	b0ardMRrkuZx/AGMYu/b3KlvmIDdKQGDgEtr84GX1MGlWsFgxCidCpbjkgCMtVLHEDr/A2IeKUBE8
	KbTP6ZSVLpQStX6iHoVjGywYU2Yv2dsd/bgWwCqZ8uJIttstmN3CYp6xYw+dwj2C9T/Adw+0t4oKc
	O0QyCbkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwwm8-0000000Azpm-1oiE;
	Thu, 20 Aug 2026 07:01:20 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwwm5-0000000AzoN-1kgF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 07:01:19 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-c15e2dab83eso323946066b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 00:01:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787209275; cv=none;
        d=google.com; s=arc-20260327;
        b=HCfj4ab5d1AWGsNX2cYvzSUbNlRAhbV8CSpjftPLexnAHU+37lEnt3Ljd+FrcJWCh1
         WN2wMTBhcHaVDzrAmiW/iTClsOOEbTP9/2U4g12EzPT+pjBwvdrAfGThT08sy0hHn/0g
         F3/2OumRcH4DnWOmN3qVUeY8L26Bc9O2ORLAYcbQxld3xqlO+icwWvWUXgGCQt6pzpFp
         H1tcdk1MotQNFJblX10NJJRSS+gB7d7N5GtH3v3UNLjyBHK+dzF8SBFGwAGeBy9pEXMg
         sVP4SMMhaLEfq9K2f6lT3+JM+ccjSOVvuVua82lKfwCeuykrpy2ZjT5Uon3HF8PZSEGd
         e3nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AJBG4gSSkw0lXa5DQuNF9zreM4sRStgVFPDhjCBnh9U=;
        fh=ljRW5FwoI+vNyhaMnfTk4P0nlb7Q+5mzoWUW6eVEO5w=;
        b=Fm7jtJqyN0OjpeZQGBWC5T8m1YJog5b+zCZec/zKwRfffC0IjduhVB42IRJw5FHJFs
         EGLcUNOueSottl8OaBXCVO7s0xdkjjXBcqSXlrVPeUkwbB2e6j3VOl0DJtPVa6CA/fxf
         /Gw6sD0y8w1TrTaJLiwA5JVxU5E6HLhwuQsvxndvOz2zrqSkW6etEV+Ds1XfPwp83uY1
         eZVxbGz1yt8acNszgpU9yTYbPi73TfxaU78IvXnpy3w8THnNk6A2kb4sGd4LtvycLDk+
         xltXi+9dBnQnaEQuK+WHiMvz22OOwNfBTKzgVSAjGdWlmDL/AiqIS+cweSLBRhfVGqo3
         jDYg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787209275; x=1787814075; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AJBG4gSSkw0lXa5DQuNF9zreM4sRStgVFPDhjCBnh9U=;
        b=eddTueyI5kqjA7kfqLVwzZoNiL81nNgjRXfwbHo2/Af430d9FT6n8ZP2qKX9yyoEUl
         1MNEd+gTxj0Yjz1bhGwpBiiJKyHHC2aWxkcCZ561i1TS1j8NNvO+kwOUV5zL4Xq1A4kp
         VP6Nbb0q+UwiY2gQRxokDBXrUFp8pCQNNhtGnugJrpu3C1B3m10Yh6X+nSttNpDm/vaO
         0r1XZSJPFMQ46VTvrV4zvsqKfgOGz7MsGjp7XMwF3qpgjaHaAfuypwDR7OCfpoSR4S8g
         qU79WgBZvOukELgd+dMqyCCHEFcQmXZiDyPvUpUUHzFZkJgZvxQb6v7HzjNHrNaAyHI/
         Jm9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787209275; x=1787814075;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AJBG4gSSkw0lXa5DQuNF9zreM4sRStgVFPDhjCBnh9U=;
        b=eGvyCFOvCpDH3HBu5PUuUL+Y5ZQJmUTK/ZPWgFMp+EW45xdY8LAh7NWI2THbckn+tn
         OfjetbBuP2bC5z1zJjBfmwCDcXJb/29S9SbYJF9dGXFERR2ouvIdborXipKZ0muSqPov
         5gtxMZBhBNlJv+/3fQy888EQSadgrMknAxkb7PQFR/RKhGncwQYcxbsCtpIPCU2nNn7L
         5E9Oit76QSXtyXW1beEUCJiXLDIvJBpV8ZihyXaxvbXLOl8vKgjC/E3mfbHLwW1ghrpA
         fz4/NVefn+ZH9BfOQm3MMNyozaJDfcY5N6rFsgZJmAtRu0PBVNfYzOTzABmTrxwBGXPa
         xMFA==
X-Forwarded-Encrypted: i=1; AHgh+RqFE9j5b7x1tu+3E2Pdlz6plmt9cPMH89C0kw29kE1O2dpxWVrOL3Megm3iwNdczkLheEIw58S1FuCtHMH4fda6@lists.infradead.org
X-Gm-Message-State: AOJu0YyauJ5TNY5hOx1MPaT5cbf3vXrKdBny+9J74wLLQkR31JE8GvHG
	RZGITzE6IBnHd588YPKj+ZnC9XwO3+1o8fS0/osA96XhfDuvTfPbXcXiJ/qxjPn/r15DpRBB/Yj
	QPIfK8g2Iv74ouD7mZolQYRtj1xqLKwU=
X-Gm-Gg: AR+sD1397G2zKktqUk9g7y+BuZXWfhdluESF3B7Z9+a+KjC9KRdwnIGA5R6TLOVZfHM
	kc1j46z/phSShU81D6mHQWGzqmtqUWxoQ4kQuT7O6XszIPCM0X6jDCOZHQJYC/Es53EhszCRw4Q
	G+QpEj6bannAAKUCREZZvgSmB4uloGXtTgmhho0R0aHaKVOrKOCKvXqUX/vwYxeqBoQ9oygOKRa
	TfrSGEK1S2lSWAZmYl8Dk+dkv6pHoQ8H93FDLHZ4ImDhDtq5pvBZR7Lf3mbBLKVc84LPKNanPPi
	rxg5kU4cR7G8fcAZ40oMcv+3Ue/52FHGzZEivkciM+c=
X-Received: by 2002:a17:906:ee82:b0:c1c:2007:298e with SMTP id
 a640c23a62f3a-c242e38bf8bmr723860066b.24.1787209275106; Thu, 20 Aug 2026
 00:01:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260819101853.44681-1-l.scorcia@gmail.com> <20260819101853.44681-4-l.scorcia@gmail.com>
 <h6cxeranayykvjnco5vuaoccuknoiu4yiancmwugouewucb5k5@osmdfzfc5dsh>
In-Reply-To: <h6cxeranayykvjnco5vuaoccuknoiu4yiancmwugouewucb5k5@osmdfzfc5dsh>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Thu, 20 Aug 2026 09:01:03 +0200
X-Gm-Features: AcwNN1XJDhHftqNShtFzkYfbAjGi7imuQVN4JqERVqBvua6db_cDNPHETOvjtjs
Message-ID: <CAORyz2KMg1-zxSPVCiFCiC4EpVFyR9=Tcowim9vVzv-g7SS35Q@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] arm: dts: mediatek: mt6589: Enable toprgu reset controller
To: Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_000117_472463_390AF54D 
X-CRM114-Status: UNSURE (   9.95  )
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

> Please drop my Signed-off-by from this patch.

Of course, I'll do that in the next iteration of the series.

> By the way, this header is not used by any part of mt6589.dtsi,
> so I think this line can simply be dropped.

You are right, I will remove it.

Thank you!
-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com

