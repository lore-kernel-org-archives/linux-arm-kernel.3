Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5AFECCD19F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 17:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JJL3ymzyML+diLAVT9nhgdl7Vx9TWLZbPp7QEm8FssI=; b=pD4ifB5nx1qoMgJAOC3CLf6+bV
	KiAHd7EwaAZyTvjrXo/fSikFceYcVwGgZOkPU/fdNaBnSe6QAp1paEArc/7bgvYAj4qr1bUUKfaBL
	FX2Srpv2cc9xHN8fJQXKIo62mQRXbhbwU5+Yo4DlZfVaB0Fg445imDbAYx9CIP7GWgZ4dN617CLBp
	9LTSOBmxhv49KMoLC+i5Tl3jN9P1aYGVya9+mbRcHmmsnSlhPdqDxqTQfP3siI+Vv0DmQI/5LrYJb
	Vasu5PrJLiJ+9i298QOschp7bWRmE8QZGIU4ZeqSMFu3pe/GPERdLA0uL5Wgd8bBcXOL4V7x+uBCb
	t1WsESXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtcN-0000000ETr8-2EBv;
	Mon, 20 Oct 2025 17:24:23 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtcK-0000000ETqR-1B14
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 17:24:21 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-36a448c8aa2so40265821fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 10:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760981058; x=1761585858; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JJL3ymzyML+diLAVT9nhgdl7Vx9TWLZbPp7QEm8FssI=;
        b=BFlOdr03ntGQaTiXbJzaZcRuUuxJYq0HnvkQdNMmzaNIap2Fy6TLNKsJ/z0itzSsd9
         EGiHScNm18gWaqSrJY1VAP8h6vOtLB9w9vkYUHeWt3sGTiSETIvNrJtUSd+F1p2ooag1
         6PqIPkXcF5nUOkqpYLJoDTVPmsUObL/ZLrChO8283pQHHVAKkt00g80aur79hQfoa/Yq
         UfyQDfoHvYjROGhfsedPnz3c9orhOzhY5ahqMj1//2VX//gO/mX6/f2bdhjjADDYe+Sk
         ldcwMfhbk3pQ8ZyHJHsOrLBg+nBRZqvEyfoTJtM7bkCavQEglGlnpsuzIPc45kLV7/ZF
         4bTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760981058; x=1761585858;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JJL3ymzyML+diLAVT9nhgdl7Vx9TWLZbPp7QEm8FssI=;
        b=w7Q78Mf4i5gRbjniEgd3ZJ7ZOcO7FQ7qGHxFBfQ0kG/dLfpLpNRNM/GL5kO+xBHYpY
         ssZpKoC3azL5yuSDyCvaEP7zI6Fz7qi0F0nVoawtujqOW8AdB09d86UbDVT9BC/AICod
         cNB3JzTy5tRuteTn59F0VzpsXmLbD6fJlMqiwrdVjPWtvxc/dkbfyAyTDAWjugshbSa0
         93pPyMgi1MHgru/YrNTcMF3zeEoSssmfiWFTn8k6x4QxkU4IR5KFs8qx0eSp/WDSRSiS
         yWrRjhoyv08JX1wZiryS1BzF06Df0gNzd1tF352Z57vaJF9BTW1OjFzEgAdWCd1CtWSd
         r/Ow==
X-Forwarded-Encrypted: i=1; AJvYcCVKU8n4oglvFBEz7S2S2BbUIKmPxWE8lnMFSbGLLvMa/zxKVVJolHb+DEUjtmO/sa2yP5g2XAKMrx0X3sbUrC0C@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+tjZ+vvG9s5BSled1YabbnnEe3lfXTxsGlZY/f0EpijInwCgJ
	Q3iuIrsesZGxtHD+lbNjI0TS0wszzdfYimWwXbo0qRVmnJA5A/kfb753lQO+x8Lj4iy95ZwqgAd
	oFCUgnFtfkFUbfTY4JKR4A6PmYQXlaTM=
X-Gm-Gg: ASbGncsOZpI3k8WCzEVLWipsjPJqHhmSvS0Lr/nV5vKRa8n03LAAaQycQRBr4gYSX4n
	TUK5H4SMqGW+JUti4Iun4PAjjTQFoNaBn6s/USqmo9L0RIBF/lS2KgOXV5G9dlljYnOXVSY9xt8
	59JI/0cozvF5fDFQ5i/k1Q47+MjVRB2O9PkMRS0CglwjOEUNsb/AnjCfGru3GJfoNlg/tjRHL8z
	RZwKOJ2+5ispgZxcS/NDfAVd3IC2/hB/Q/eR69SheQ/LX3SALcyR71Unj+FMBYx2s5vVuVeDYl+
	V4QZSkORxVBU7v7s
X-Google-Smtp-Source: AGHT+IFGvquo7dKjulQge3D4nLth2WI8das3/MTTYuoViw5UYS7r0NQDoBhHAaPE++J0d5/68a7BWV0yZERz90yIgHQ=
X-Received: by 2002:a05:651c:1990:b0:375:f6b9:c948 with SMTP id
 38308e7fff4ca-377978d7927mr37082001fa.15.1760981056694; Mon, 20 Oct 2025
 10:24:16 -0700 (PDT)
MIME-Version: 1.0
References: <20251013205155.1187947-1-festevam@gmail.com> <4bd512fd-b3df-484a-8a04-a1ed066c42fa@nxp.com>
In-Reply-To: <4bd512fd-b3df-484a-8a04-a1ed066c42fa@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 20 Oct 2025 14:24:05 -0300
X-Gm-Features: AS18NWDxC1BDffoJ0EW6ktW9w7SITyz7Fejydue0HKFG2UIjYNHc8u5VIdoiknI
Message-ID: <CAOMZO5AGRejEwNvkH0Di0HVi8QPduTeCSud+_GqOkD4tqEcsdA@mail.gmail.com>
Subject: Re: [PATCH RESEND v4 1/3] dt-bindings: lcdif: Document a imx6sx-lcdif fallback
To: Liu Ying <victor.liu@nxp.com>
Cc: marex@denx.de, stefan@agner.ch, airlied@gmail.com, simona@ffwll.ch, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	shawnguo@kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_102420_322108_20B5C47A 
X-CRM114-Status: UNSURE (   8.06  )
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

Hi Liu,

On Tue, Oct 14, 2025 at 1:12=E2=80=AFAM Liu Ying <victor.liu@nxp.com> wrote=
:

> Strictly speaking, I don't think i.MX6SX LCDIF is compatible with i.MX28 =
LCDIF
> because at least i.MX28 LCDIF has the version and debug{0,1,2} registers(=
at
> 0x1c0, 0x1d0, 0x1e0 and 0x1f0) while i.MX6SX LCDIF hasn't.

There are some DT users, such as Barebox that matches against
fsl,imx28-lcdif, so we cannot remove it.

In my first attempt,  I tried removing it:

https://lore.kernel.org/linux-devicetree/20241028180844.154349-2-festevam@g=
mail.com/

but this was rejected due to potential dtb compatibility breakage:

https://lore.kernel.org/linux-devicetree/4addc413-dd13-4867-8c49-45539af7b4=
5b@pengutronix.de/

