Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E6CCD4F3E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Nov 2025 17:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QP7jspNMzyTvkGv06BWTHIjJjU1oOmLPoesgjcHxeRo=; b=jjgQqoYcxhRV6sw8eudLp5RPKP
	Dns+d5RKeLaOa2kmYKff6OrgigTddmtPqZbOlr1pFath1AKivX6KZPc8uW7F2tKzjrwgPomXCqcXb
	QDEp8SJX9QFRbLceWWM87CKn/WbRFa0+OyTm1WvM+Vsyln5ernQaegeSsQSqTZQhAC4opWqDVmnbb
	wRBOhWNcIravEATH2Ro5QkAyFFx0HmuWQF+asY91FKkmIsfeE8Y8sCtngZeiLhy1FNV7BaPXu+jkQ
	kHtb6iSCj8mEDrosV2WnHkPnN6wR+xao8fQZc8OSGAcAQE/xnlnTYvkP0pXzNIOR7KQFmXcaTFcts
	FKc6L5Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKgtA-0000000F0LT-3HhS;
	Sun, 16 Nov 2025 17:50:12 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKgt8-0000000F0L2-30cg
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Nov 2025 17:50:11 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-b737cd03d46so177035266b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Nov 2025 09:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763315409; x=1763920209; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QP7jspNMzyTvkGv06BWTHIjJjU1oOmLPoesgjcHxeRo=;
        b=PkvTiaG5qTB3QSH5yLpuahtWsuEbdyuh/psOd/WY0LBZJNhFFfHnr8J4SUvkMG7Qm9
         Gq/dnm8cMJ6KRqWPHmw6F1Fjd09/B0p8GPtxq4Dg5A7/fQuI9lyeHk59ojVHDo9artQr
         JiTBVzcSPXxE5dDyHk3mrhnEtTegI8Pcd3hXoSwdgUbqZYADFKf8xeFrT7ocGStQwPYI
         YCNHwDblGHXfVGD1HHeqNTZ67py/oqb+KaVuLbAREXNor7eTilMih41syjWQ6MPT87TW
         jcXAatnVpz8kXYx7fm6BgOo9yMczQNcXmxHZIYSHOQPIQAC21c3IAKGTaoAzgUWQmAhG
         TT+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763315409; x=1763920209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QP7jspNMzyTvkGv06BWTHIjJjU1oOmLPoesgjcHxeRo=;
        b=JaS1mMNi76XIOgn0s6kgPykhyX8NruM11oZe7AmusEyUr9pOTBWEvFF+UGzuL65zKz
         xSkNNAPKvrbCUDHUx1p/n4CVE6ddWKePwI/0L+vazVQRgBSIIeSlZqBN4WFW8FUE/vGs
         HCbnaE3yEvJqbbiVC6GnzVCjy98oXi55batZJIZo/enY8+o+Y2GrFGMMIpPfKvik3vBU
         cq4KSjkgoHkA2agCL3Jx7m/VT1DMxAwu4z997g/gH8lrt7eBm6KDPDXSvWH0NoKACfvz
         Xcp0sGyI6JIO69dLfSod3SFcg94N2Yp0eYaAAgR1rec9wNPAYHXIf0fxUMY533u4/h9s
         /Djw==
X-Forwarded-Encrypted: i=1; AJvYcCWbsHMn9pazAjjSBNSA5WgY90AId/5JP4OU91mQqi9Y/yP9zdeJy6aWuR+qkwvptTVIWyQgC/o3+qtjYsxl1ZqN@lists.infradead.org
X-Gm-Message-State: AOJu0YxqomnEnS7EGxZEy5ySvfLRza3UcZ5cRPAm2EYojIxwrXqsSy5l
	co/ckeuSeqd1ziHP0bvR5zZ5QCLlHspze4RghmtN05bciYIqY9Iym+yQ
X-Gm-Gg: ASbGncu9RLwxovK/pqH1wUf0k/XAbgbnw0Ws+/JmZ8ZeSu5if35XylHZtSXGElf/7NM
	hP+aIIxaGbrS49uie/nTbdwRUIz18T7LJ6z7MqjzOCULcb4guR5APeDkFyzfqmT5/K1F8EpYMDy
	xWmDXekN6cfydyDxscjBkyBzEdkq4on8Qaoew7Vm6bMQmrRCyNIWrDTsNjcNcOM6xURrkQjffYm
	R9hJhSDJ6ZCakJAg5ONnuNpA1WlCpXXXq26WP055cLNBfht2W9/tsdrJ9c7KJypGp8+Wp6L32/I
	Qz5UYk30lXxHDEaGYw7StnAxkyryb5hcyHhp9oNEH54oZqEEKSHXBk1nF2cRdJWbjq70ek9qxyo
	qcOgb+yoHqq2gYLsoMnbjwnhHomy2WwwOt5EXJdb4/KO6ZramBW1WXeHKR+6dFPx2jjbQcPIXUl
	cecZe/QQeCa1vQbsCh4KR/e/r6tPgAcHRxmXkDDJAP/fsqc88cYZFeOtGIZTQR/LUL0koinoBg6
	3gUSw==
X-Google-Smtp-Source: AGHT+IHnJ3o0lU2xLaeiHwgSeukdwtR1KGCz5g9vsnkLKv/heK41BVWAROvmPtIvPoJ/A4s01hmsSQ==
X-Received: by 2002:a17:907:1b1d:b0:b3c:3c8e:189d with SMTP id a640c23a62f3a-b7367b8dd38mr1112936266b.32.1763315408563;
        Sun, 16 Nov 2025 09:50:08 -0800 (PST)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fed9e9fsm879409766b.69.2025.11.16.09.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 09:50:08 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Vincent Mailhol <mailhol@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Gerhard Bertelsmann <info@gerhard-bertelsmann.de>,
 Maxime Ripard <mripard@kernel.org>, kernel@pengutronix.de,
 linux-can@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org,
 Thomas =?UTF-8?B?TcO8aGxiYWNoZXI=?= <tmuehlbacher@posteo.net>
Subject: Re: [PATCH can] can: sun4i_can: sun4i_can_interrupt(): fix max irq loop
 handling
Date: Sun, 16 Nov 2025 18:46:51 +0100
Message-ID: <5938604.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20251116-mysterious-delightful-spaniel-18d220-mkl@pengutronix.de>
References: <20251116-sun4i-fix-loop-v1-1-3d76d3f81950@pengutronix.de>
 <2804881.mvXUDI8C0e@jernej-laptop>
 <20251116-mysterious-delightful-spaniel-18d220-mkl@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_095010_774149_89913C76 
X-CRM114-Status: GOOD (  16.03  )
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

Hi!

Dne nedelja, 16. november 2025 ob 17:26:07 Srednjeevropski standardni =C4=
=8Das je Marc Kleine-Budde napisal(a):
> On 16.11.2025 17:20:37, Jernej =C5=A0krabec wrote:
> > Dne nedelja, 16. november 2025 ob 16:55:26 Srednjeevropski standardni =
=C4=8Das je Marc Kleine-Budde napisal(a):
> > > Reading the interrupt register `SUN4I_REG_INT_ADDR` causes all of its=
 bits
> > > to be reset. If we ever reach the condition of handling more than
> > > `SUN4I_CAN_MAX_IRQ` IRQs, we will have read the register and reset al=
l its
> > > bits but without actually handling the interrupt inside of the loop b=
ody.
> > >
> > > This may, among other issues, cause us to never `netif_wake_queue()` =
again
> > > after a transmission interrupt.
> > >
> > > Fixes: 0738eff14d81 ("can: Allwinner A10/A20 CAN Controller support -=
 Kernel module")
> > > Cc: stable@vger.kernel.org
> > > Co-developed-by: Thomas M=C3=BChlbacher <tmuehlbacher@posteo.net>
> > > Signed-off-by: Thomas M=C3=BChlbacher <tmuehlbacher@posteo.net>
> > > Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
> > > ---
> > > I've ported the fix from the sja1000 driver to the sun4i_can, which b=
ased
> > > on the sja1000 driver.
> >
> > Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
>=20
> Thank you very much! I have seen a lot of feedback from you about the
> sun4i driver. Would you like to become the maintainer of the driver?

As a Allwinner (sunxi) maintainer, it is somehow implied that I help with
reviewing such drivers, right?

However, while I never used sun4i_can driver, I know CAN protocol well
as I work with SJA1000 compatible controllers at work, so I can help with
maintaining it.

Best regards,
Jernej



