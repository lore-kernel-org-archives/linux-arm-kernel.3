Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65725D29DEF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 09:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/i3Juaj0N8yH4MFpXlG+cGqZ2qEdPdNcnpSqQBlYTGU=; b=uCu0MaIU12S43gHVj70HMWImiu
	N1HB2iUKjNN780B7MAVcM+DLBUANU13WP59MN6C5sbVxpZuvipbQEveboR+MCAEyzS1DCyZihyrDi
	P7IE7g3OCvSL4iHRtmW7mri/HG4GHwvUdzDK1tL07tOKY1/jjonjUlJRidNk6HsjcKzR95wYw1HZI
	SEuCqYJYWnnS/wwM/pfExOV5QfQWYppH6/KYvmeJSeJ8W4RbmQwTrkxbW4w6cIpAWbVWA7zEF25u8
	rIUGRSurmLvpdsybxax8LAgTku51L1CAp97h8oIUlQp7Np0MzUNipIkMPRDXyWn/BCF3jA5ohGdJs
	dTw/ICGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfaMx-00000006neR-0X6e;
	Tue, 13 Jan 2026 09:07:19 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfaMt-00000006ndX-11Th
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 09:07:16 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-59b710d46ceso6294282e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 01:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768295232; x=1768900032; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/i3Juaj0N8yH4MFpXlG+cGqZ2qEdPdNcnpSqQBlYTGU=;
        b=GdjdKD8GJ0+xLLmEPWVOIP+1B9o9jn4hG7pSryYJL5g/KXk/3N6Nx47XsZDo8JRHGE
         J8V+Go6PRbz0zZ/12hFCc7uiaRlw4OcgY8heSlRln1eC06SNMmYil2IWzoLNI/2+sLtZ
         XBrO3XC9ILrJhNrSMaLnNMPdEiLO/XwxggKkujH+hx+9ZpnaK6mZLiEATdrzkv8JR9rG
         m1aKP+NbKLDhYNcz14iz72rzDTA/scvvtT3MbwOi15UP4bnYZ302P6FJWIaSN/Df2IiL
         9b51m1Lkw5OTlXg0c+f6IsKflwKgglHohGXybCzffkNiL0MHH/n4vN50YknJWUjI4RPZ
         7Yvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768295232; x=1768900032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/i3Juaj0N8yH4MFpXlG+cGqZ2qEdPdNcnpSqQBlYTGU=;
        b=g1uwpvknBBJ1ZCRDu/6wZEmm15Qlyw1SGMhLLdJCzl17OoI9qTcZjtfavxS/XVobcn
         DdouY8oHVin7lTrigpwO1Wtz7sKLSpfbOKYwhdLbNk8kd6kGOTYtcMKJZd6iXkftCKZ1
         dUI55A16PN41n9sKfTY1jaKoVo+mEL+wriQAPxJBw7LlBjFawTSLzANLK7WA+GRSoJ5p
         vBmmOCnExnDsxAirKOSDel4Zft3vIrHmPSFEUf/K/5Mqh52J1rewx9qTM45+zkl5yvWU
         mnlwtwgfoD3XbTlWmEBAt9Jggeede4+272v4qKGhsJ3T0Ehp2ar7k3SwUp2drUgu+sMx
         ESew==
X-Forwarded-Encrypted: i=1; AJvYcCVdcpP0wz/gbdSxT3efMYVQdcJpMGQVRu3VX97SDRTxwi52yzqR1yD5JCJ4cMc/eEir0kA5fIgRJIlSuNs32qdQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyXFQ7o144CP89d9lAgHfdn5Qa2AhcAjcOhldIKl3wLt/ObXYQe
	niuIQtlL3IbB5U58IBNi+lvA9E9VaPWbPMk8bgNS4RWVq75k84FZS1IZ5fNO4oKb7XMxOm2YKDJ
	zhfs6YJJAKANeNEOR0ct78Gpe5AqkKH3/kD1IZNVbsA==
X-Gm-Gg: AY/fxX6lA93vnDKbSvM81P5G93f2vHe9GvXIol9L35ZC+8cRyrMVatJPqF0QJFHqfiZ
	soCmG9/QtDo5IPleUHqAD+92a4CPqN2nTg+o7wuUQixb7aKUCHH9OJfzu8KncuQDOZQZGGinNBI
	C+8c7/AFAnZp7py0bie9rVZqU7GA/eLC8fD7Cm6EKSko9LcY+QvxP349seT9bXC/qW1c3cqpNXE
	vV7F26RddK+X+KSIhdBPP2Z968zf2BmwnpRnaFLozvS0GDhPDf1Wnxq5gW50+f/WU8nYsK0ETwx
	oOoOqZ3q/rEk76aq05fXI98HEIye
X-Google-Smtp-Source: AGHT+IGftEHtLClyb69mOyaEsN3lAH2/jF+5CBMjP/ZmjjcqXy+C8GOSWAl6T7IxwZIVnFTBz/aNdum5oAdTU7TVZB0=
X-Received: by 2002:a05:6512:3041:b0:595:9152:b932 with SMTP id
 2adb3069b0e04-59b6f03e5a9mr7195718e87.47.1768295232445; Tue, 13 Jan 2026
 01:07:12 -0800 (PST)
MIME-Version: 1.0
References: <20251105152023.259813-1-marco.crivellari@suse.com>
In-Reply-To: <20251105152023.259813-1-marco.crivellari@suse.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Tue, 13 Jan 2026 10:07:01 +0100
X-Gm-Features: AZwV_QhM0_519Wp7eCusKGLkLbDhbtlDLW63gw69Hikozl3LItms4ZWAJbUiCUI
Message-ID: <CAAofZF423Fmsxb4c+J5q4Nf4t6YO+=-SBjna+7TvqJ=C1K0DYQ@mail.gmail.com>
Subject: Re: [PATCH] phy: sun4i-usb: replace use of system_wq with system_percpu_wq
To: linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_010715_277172_D640994B 
X-CRM114-Status: UNSURE (   8.38  )
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

On Wed, Nov 5, 2025 at 4:20=E2=80=AFPM Marco Crivellari
<marco.crivellari@suse.com> wrote:
> [...]
>  drivers/phy/allwinner/phy-sun4i-usb.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)


Gentle ping.

Thanks!

--=20

Marco Crivellari

L3 Support Engineer

