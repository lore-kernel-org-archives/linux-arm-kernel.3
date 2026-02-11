Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDEB4E9E2E0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 11:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=joAf094Ek7cks9iYuW58qsdNETj0QSxANlo+wmVWO6Y=; b=g93wmxxWc1Xw1f39J52UFbfu0t
	ZnzFn8r1kANAn3x55sDL8o235cWY/a+jMAGjjcIX1MXGW4CVZ3V7gHEvG4YAzcHBOObWqLhMY2oZu
	GhZWXWuyb6IsTyjWFImuD969NyUwI8c/IlR2jEfAbGBHGozRyD21MnHBBMA8zSUR/wDnvgGKBLRvo
	+9CIWeN5WbMAK//ozdabYBs1l9faOkwn337SPa1aHta4R+VfJnFhnZ+PP3HBVpa0qEqVHbG2s8Q2g
	qVFDeS/Cfdd/Y0/fYBx9Epwmd08snNc6jxSBR7KGhGVLDS6VXUpHRliM/eLyZkDw7qejxQiAKFT6O
	peLeZ27A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq80G-00000000Y2h-3gQ4;
	Wed, 11 Feb 2026 11:03:28 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq80D-00000000Y1O-2tqa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 11:03:27 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-3870902760cso2541281fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Feb 2026 03:03:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770807803; cv=none;
        d=google.com; s=arc-20240605;
        b=XFzG4VRjiBzXuZ/heN5jU+KINliBxIiw2UYJu4Al/b1u+gIlKBDdsCQVs4cKvSWSk6
         ihiB6WRtnz1YL9/vIpEwLosBAoPlqxp60J6rGlpxUWUkZnT2I53FS/vgQt5gcAz4pk9e
         7lASoj2DLDG92Bto6VkxUfolA1OUftepbpbiN1AJPK2wDTLByaxtnOxdkn4Nrv/V0R31
         obYprhYGQsJv7XvrlGua1PwJUzGBIg4hQhYANANL9B/RgHCBJ5Sd1KP5CsGgmhmYhmBz
         fSWJo4aQRK0TweRuIgdMJVLwFe6A1N5AE3ZxmnLmMIblMq79jk/eKyr3awIan5bHCOu4
         G0PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=joAf094Ek7cks9iYuW58qsdNETj0QSxANlo+wmVWO6Y=;
        fh=rNerjmCgpm/g1huFY2NzrWT7rBWJe9+BrwU+61FQIoU=;
        b=JH6YuvWEfUAI1qnpDmJDhFPvKj8WUPkC2uVBvUVoO/Z2gM+8boN4t9C6BorFt9HOIG
         Q+6BhJmxcnwm080VCOJNGdMqzL30eaivbmOHjt9jZRr4oKDGyVFj+ahhZtRzzEz2N5Ps
         Y6FO3T3FobJ5OzgYDJFaeQre14zq+obnMSQ18dIpM8thBKPm3rk87TW+xZ/8sPqZ0rEa
         iXe/QLlvhHcyMVk2nxIPtognW5WAEecNYd74HjKaNjT3/LMyf3G1XNgZxsYiiBcRS3wm
         7qnbiTjMSfOPm8pM0wkPLUFdCyJ5zA+vHip6RrPZUj1dVdhhYsacHRXgpnyE+0QyoSdB
         LDGA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770807803; x=1771412603; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=joAf094Ek7cks9iYuW58qsdNETj0QSxANlo+wmVWO6Y=;
        b=BZxka2pJkrVKvzH/g4AQbpfIfxmpouLmJwulFjtCoBiRo9vu/oRuI86XYGfqEM5DdC
         OrvxGw+JOPbrnI8DWkhpvFh0drSbACS2pcbokfqJT2by0+ktJ8rZxPgy5NxHIUuAKsj4
         KbNagACZ5Gfl7wDg9JothSF2UCtOtFu0NWNtIFTDKCw/XgSd37NggjUtUe6PwdpePNKm
         3bjeiKRSm1LxjskabVKn2RuBzrmISCMKhafqfbNVlwkPCbBhhvt5m8vyTY94/pJsQF/8
         OSPuxFNbDDRblYu+nP2A7kHhhHaypHyoXr2Kz0fruf9nbUdzwaufR2oIJ1i8Z9bfJLag
         vtaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770807803; x=1771412603;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=joAf094Ek7cks9iYuW58qsdNETj0QSxANlo+wmVWO6Y=;
        b=uhrdBtXMXHdzF4Ww7wCBDbNtz4GFpiroVOx7Mwbx7/KYyBjoNsyOXRuWrTq4IHrvyO
         JMKCJf9sGTaZ5WuvF4svxeduu2aSXsD0Vy0gF8Gk0T1baHU/4I6QaxkawP0D2Sa4TnmK
         +5NEMZreS0+f8HGBn3oJiy5WVKGuqvcSXvUjFwdr93tWxZqKbD7V+DnO1PYesrQ68xMB
         y/YlWj2IOvML0IxEmCSC8c3/7zrGksyX3/eAV/HAPLe2g/zg7BvnW1e74NrULtvGiVRG
         2H41kteISembSVVny68Z0sd3l5uhrw/ErPFu58EzHNQscmKdpuv/hSKLuZepc9SljbLQ
         TfvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJ28wiY0w7S9dwG3r0mfnDcdxG+OaNNNNXT+MyLJZbs6FdhCZYjwJNoEJZjgCDrcEkBmSUlU84o/+82VId1cjA@lists.infradead.org
X-Gm-Message-State: AOJu0YwIdKQShxJ0TP/Uxyg8yRFFwGPi7M6Mf1BuOuJePR9joQpYEsnl
	JDTan0Ky1QY/4K2bp+TzrpDcOHCNLW7MNq8ERrhGwBhywewH+ELlH069L2/HuP4lOaShyPDi0XW
	2RSXWiWgvq4R4wRg17paibXBYFQl4o4o=
X-Gm-Gg: AZuq6aKC54dk8jpcrIQR27jsFqXDqe+7v2FEVulsRmcgc1Nnh/qTvI7cjlYC0ckDNnk
	a2ewbnR9uJ1COExU+jGK7daq55Y8VPFOgTiNMrPbeJk1Xh4NhjfDtQx040i2mFyVhUYOwmqls0q
	Y6OaDgpLcz7va8Hyp5Y2Ecx3/ZHGPtWSlf+492iIhHW3E2iYTHdfCuN5VAZ8tOpjIrjmGBS/AAB
	lovr8uGDgW57E8n/QBmxh2m+FlS2RCgH1QCkj8HXEVDkDqM9zX8QOTQX6m/DCOZtsFdCAOZ9xaM
	n196D3PADB6A2eMYkZqhJMS13nbsYacnkyxnY74=
X-Received: by 2002:a05:651c:31cd:b0:385:da28:1e2a with SMTP id
 38308e7fff4ca-3870707374amr4155731fa.24.1770807803205; Wed, 11 Feb 2026
 03:03:23 -0800 (PST)
MIME-Version: 1.0
References: <20260210144845.317048-1-festevam@gmail.com> <20260210144845.317048-4-festevam@gmail.com>
 <a8c1bac7-9f67-4476-81ad-5271ff239b91@kwiboo.se>
In-Reply-To: <a8c1bac7-9f67-4476-81ad-5271ff239b91@kwiboo.se>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 11 Feb 2026 08:03:11 -0300
X-Gm-Features: AZwV_QgqxfUGnyoRhdf_YqJ-RqLp0HuIvNPBxSjq0yImj1idIOnISKGQVva2ko4
Message-ID: <CAOMZO5DJGQVOL4D4WWopduodedExMG-O65E1AzdXDQDWMP8A1Q@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] ARM: dts: rockchip: Add Onion Omega4 Evaluation Board
To: Jonas Karlman <jonas@kwiboo.se>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Fabio Estevam <festevam@nabladev.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_030325_745797_7DA0959B 
X-CRM114-Status: UNSURE (   9.31  )
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

Hi Jonas,

On Tue, Feb 10, 2026 at 1:53=E2=80=AFPM Jonas Karlman <jonas@kwiboo.se> wro=
te:

> nit: Is rv1103b needed in all three compatible strings? The last one is
> already pointing out that this is the rv1103b soc, also the other Onion
> Omega boards in-tree use onion,omega and onion,omega2+.

All the boards inside arch/arm/boot/dts/rockchip/Makefile start with
the SoC name, so I prefer to be consistent.

I have addressed all of the other feedback you gave me and sent a v4.

Thanks

