Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 902ECFED3F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 17:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lBO+8IWkOvmjF/T33XnJITsxmwW3WOXDRY40g24a8T8=; b=FuFs3A8QAErBheUFeeLGcIjNXB
	i2LXETrZO8atKOxyrxqaaa+Ri88NEyttRPc51r8LLKI2TTzGZHAa9vHKGFDxqg0WcVhJ0XgaVjuu8
	3kq/KahTHJ4CaAof+wo0KVWu854fHx5ckTdMPUDV6593JdWL8HiOmss+/fEEH8VFpL5YvmnayVj/K
	QtTKNHCI4YlUj+V4n2EXWgmrrw9t6Xe5vffTzRYVQYLd0YdYD/x9Dr46yb1+QtHcNr41brpTYIoRx
	ihQnRzSbnYwZq2y/dy8mn8V879Q0sNFuE0UzGRBJzxgmniVDYA6E/u9YegkA5RpJLcLk6Nvai/5KA
	w7q89xPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGKb2-0000000DbOB-23Qx;
	Fri, 24 Apr 2026 17:45:44 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGKb0-0000000DbNX-12fB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 17:45:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777052739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lBO+8IWkOvmjF/T33XnJITsxmwW3WOXDRY40g24a8T8=;
	b=jFzjDblt/h7jts2YQ0n6B8g/pvLJf76y/RCVajDozX4yxIQM30aIriwsP4peLxdYmkIx/T
	epj94TGWidI4oeZpggSf2gWYuiRMXThvy7Sfvjwx59sRNBdzgnOc5IOUGP+YMQCMslIi9c
	b5Eq+EN8hDq2nnSsGSWbfG8RFAKMn6w=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-106-EyWocMw4M6aFdXhWrPKDEQ-1; Fri, 24 Apr 2026 13:45:37 -0400
X-MC-Unique: EyWocMw4M6aFdXhWrPKDEQ-1
X-Mimecast-MFC-AGG-ID: EyWocMw4M6aFdXhWrPKDEQ_1777052735
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-b9417a552d0so294240266b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 10:45:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777052735; x=1777657535;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lBO+8IWkOvmjF/T33XnJITsxmwW3WOXDRY40g24a8T8=;
        b=sO9CIMtriqlP5r5y3JPhD/tbtgzzoBVYdbcMEFjrE1yefZxvuIYo0I8osUnkaKtsHv
         L6rRNG48vNkBdMHnL9IPYW2i3xeAYIYV9P9UnITFV0l+I7ffOlirQMEVp0Kx2dQAQeme
         Hk+gLind250AUHSvlFTFwaY3S7Eu5xBajJBwKeH1cq97Vq7P8AmfZvL2K9tVq/f1Cacr
         JqayS7eSFhTGgVr7Z5hRPg7QD+v2G9DWfSgwu6Ltlouke5Kg61w2dWPUI1FxLyXLvet0
         bf/oznZvkotOWnytWtwBZm7IqYUo7rDv7G5Ip20OBv6ofiQAh9O9MAjIC7RvPWtAq1lW
         SdcQ==
X-Forwarded-Encrypted: i=1; AFNElJ/z+utAQuFcVQJwk2629ebH2cn/WPYvGAonGTR+YcIzTYHIibjUmsW2P+3SpfvOehX1xYo5OBEmCYU8KAJs5pM4@lists.infradead.org
X-Gm-Message-State: AOJu0Yy143eW69+hSuBdWgYmM4UKwx8pZSfs9sJKwXjwmKhgZxeIvHSq
	zI0RFPt/8VwXpf6brtCXYt5I7j4q/CdU2dTxbvbe8u3CkwT03sy6OkbxV3nantGf7MAVyXGpIBi
	pEpWDrnCf1R6Dl16IJ14g7OW8lRBiCHfEV/3w9T4vEn7NSNiqt0hHaaKwhhNCuAgf35ff8+39C1
	KwtPCxPQJrMkIMPvkJD0CjQ9TdS/Ef8LeRwcNlE82SkxMom9fvRGI=
X-Gm-Gg: AeBDievVQj3kw1+ma8UIDgTgsSS5slC6sfTIpgkT0mh41dj3RADKwdwDpBKkW0VV9pJ
	dRNC280momyMMjUxEbJPX932eGZmBOlpYgpKz15bAkF79pdbUjf8x3COLxDG7mGOwIdwPEhi5Ux
	/W0rxlT9hsuxK0yDZWfmBL9rjhddyEp/uWCoWI28rijYUJZmdhyQta19+fufVr1eSeIGRshFsy6
	Cjxx0X10LOumO6N
X-Received: by 2002:a17:907:3f12:b0:ba7:f5fd:ede0 with SMTP id a640c23a62f3a-ba7f5fdf234mr1199006366b.6.1777052735326;
        Fri, 24 Apr 2026 10:45:35 -0700 (PDT)
X-Received: by 2002:a17:907:3f12:b0:ba7:f5fd:ede0 with SMTP id
 a640c23a62f3a-ba7f5fdf234mr1199004066b.6.1777052734793; Fri, 24 Apr 2026
 10:45:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260424-clk-bcm-fix-pi3-v1-1-8a734e94cecb@kernel.org>
In-Reply-To: <20260424-clk-bcm-fix-pi3-v1-1-8a734e94cecb@kernel.org>
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 24 Apr 2026 13:45:23 -0400
X-Gm-Features: AQROBzDecVKqp3-2I5CdQ01F9dTmpiznpdnxhUyA0LuMXG2eXkUSRX6qFY8D1FY
Message-ID: <CABx5tqJQtgAWboRYR8VLmzUUZn297c7sz7YmJB=uKaAY7iw=mw@mail.gmail.com>
Subject: Re: [PATCH] clk: bcm: rpi: Mark VEC clock as CLK_IGNORE_UNUSED
To: Mark Brown <broonie@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Maxime Ripard <mripard@kernel.org>, 
	=?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, linux-clk@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Aox9qOOADtJDQadqEo7BYcaZep3Mj3KYSRbTok0QpkU_1777052735
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_104542_446158_572A1927 
X-CRM114-Status: GOOD (  12.41  )
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

On Fri, Apr 24, 2026 at 11:37=E2=80=AFAM Mark Brown <broonie@kernel.org> wr=
ote:
> From: Ma=C3=ADra Canal <mcanal@igalia.com>
>
> On Raspberry Pi 3B, the VEC clock is used by the VideoCore firmware
> display driver, which remains active until the vc4 driver loads and
> sends NOTIFY_DISPLAY_DONE. If this clock is disabled during boot, a bus
> lockup happens and the firmware becomes unresponsive, causing a complete
> system lockup.
>
> Mark the VEC clock with CLK_IGNORE_UNUSED so it survives the unused
> clock disablement and remains available until the vc4 driver takes over
> display management.
>
> Fixes: 672299736af6 ("clk: bcm: rpi: Manage clock rate in prepare/unprepa=
re callbacks")
> Reported-by: Mark Brown <broonie@kernel.org>
> Closes: https://lore.kernel.org/r/5f0bec08-f458-4fba-8bf3-06817a100c4c@si=
rena.org.uk
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> Link: https://patch.msgid.link/20260401111416.562279-2-mcanal@igalia.com
> Tested-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Mark Brown <broonie@kernel.org>

Acked-by: Brian Masney <bmasney@redhat.com> # Active contributor to clk

I agree that this would be great to go in direct if possible.


