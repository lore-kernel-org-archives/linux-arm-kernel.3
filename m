Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D7A3C7114A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 06:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9fTDJW1TL4NlPGNqYr+/NF6feWzgjsjslRiylaTRhfA=; b=OtDxOk8+P7kJ4hxT/giD2olwPG
	tbNV54HlJ+wPwiK55LOQkIGzZOa99lCJ8IxkohzBMbcbGii4jE57COLlxi0K1UKI7Gd7HXYICpRxW
	dHvRX1cqxXifXLEtboAZeDcZvAwJf67/+TNMvledVFDylFcOyOUV5DF5izvemM6PgFDTkwjeLPil1
	/yPgKFqnMDx+gKq+d6fUYa8wg8jJNW9uMoUopdlgvlPjMqFnnLF4kwNaqm78dSBb9mNg9YOD8h6CH
	YmM8u2TPjxmxpsrY2E0I/VpdoAKdeWwgdeIuB5u3podWTS4cF90vSTzVWcXqpXpWDK4LcDR1OtBqx
	f50+az5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRPgF-00000006LK7-433T;
	Tue, 17 Jun 2025 06:20:23 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRPYT-00000006KRz-335o
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 06:12:23 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-ad574992fcaso823829466b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 23:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750140740; x=1750745540; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9fTDJW1TL4NlPGNqYr+/NF6feWzgjsjslRiylaTRhfA=;
        b=PKvR78uvdzEcF0Sz0lnkoCEm9Swl0LuVqiu/QUOM/WnYNpnHEjufm/TdY86nm4jP/K
         ewUiVXWEDOumNSI9i0pu2ZmeouzfMtdUrKSE4AkNXOY9F3h7htl5B6xG8NpFKfZzPWNi
         aiKE5SgiKfiofndjQQLOEW+u3Zy8YVLOOFSjWMAvKBveox7wHrX5mn9ggx+iqTE5J+dE
         Ao6bnxLDIfKs+8fjdVSGv6wO6oy4ABJ/5xjuhvDgZRsg5mudb5Z5udwlaIhdy7sGcNnh
         C19JW9FYakd58dIsBIw+slj4Tp42T39JC15ofB4KYQ47ll3+n7hhV6pp3vecH1/xzW0E
         slOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750140740; x=1750745540;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9fTDJW1TL4NlPGNqYr+/NF6feWzgjsjslRiylaTRhfA=;
        b=fqj7hqGf/AhCb/VInO231ThVmMZ3TUkWzfu+U8P0JQWJTpptsv5D5oyC3WXDakofJc
         RB6WDMDbuVjz2NSOlgUBrnTbOu2s6L3OU1OrePUY6zm8T2zqdYai7p5syYyRGK0dbaii
         0930PWYPlkfK3D82Kbh/cMcuKh7rzK0ZznKKp3ID8vjyoGkKGop8Uvu5jihC038B89OK
         y9XnFrMG393zQYS2QLpzkK7rTz+IFNQB0Ii6XWiYg3tLFji9si9R0XurLwNXP7vzr05X
         iUyEfV+VkrDK6KTepKwKsVoEOilxluZH3vhq0QgnVGbOUcq8wY8RFfuu6E4P40NFS0UD
         umGA==
X-Forwarded-Encrypted: i=1; AJvYcCV/bhFx2zXWCXHdYn3aWX6ro+MbmhbS33GFaDay0Qez0DVOZ4qgNnJfq39euWqXXQnvQ0EhWeS0pY1KZyCTAqsn@lists.infradead.org
X-Gm-Message-State: AOJu0YypNwDBWfTK67/TJIQfRrlH9r6XJoc4aqK0dld5+18tsJ3kez+4
	E+kLoOS+/7EPpJVEUqfb1cIYPW8562L0rnUnTEEZ5Ben4Bm0XKljmWbttYSm1FMIkXfrXXlvTPj
	z55swWbANo/ceoy922RjuawSl1Ib+tGct8Xcp
X-Gm-Gg: ASbGncviSv/efMgbEMK5/DYgswoSHcKtSxQBEUMO1HMqw51f/GzynFBEZRHJ9Aerz+p
	0YJ6jQmShNMiz9rEqdrue97jf0ua3eqYmsz1R35cMS3rM5RVCeAVDAeKSHPm2zm2BPy5IPZkWmm
	hkZhAJvEcHQmAfCbC/0KnIZ/Zt1z36gEZgEZI14ykTIhQ5UQ5pORNlUiYy
X-Google-Smtp-Source: AGHT+IHa/FX77GY71Y7ydNSPCCIb8FXd7gjVBOLkuCBPz8oiNI9WBIMcKdNNqwpKtHcDbHmlXgvPt/52lFG6O1/g+aA=
X-Received: by 2002:a17:907:3c93:b0:add:ed0d:a56c with SMTP id
 a640c23a62f3a-adfad005a42mr1025845066b.0.1750140739952; Mon, 16 Jun 2025
 23:12:19 -0700 (PDT)
MIME-Version: 1.0
References: <87qzzjnsdu.wl-kuninori.morimoto.gx@renesas.com> <4f85a20c-bfe6-4b48-b4ef-121d5b33af90@kernel.org>
In-Reply-To: <4f85a20c-bfe6-4b48-b4ef-121d5b33af90@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 17 Jun 2025 09:11:43 +0300
X-Gm-Features: AX0GCFvFC5gZJKrkuamkkT4kdsKJdsQrg5vsd2Qn2xCgi6o-oxvIRmcSbP9G4vk
Message-ID: <CAHp75Vd+9f_iJ9AW+OfjpuZrt6zjaxPEY1ihZHCDOnvQmwboNQ@mail.gmail.com>
Subject: Re: [PATCH] arm: s3c: use string choices helper
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Russell King <linux@armlinux.org.uk>, Andy Shevchenko <andy@kernel.org>, Kees Cook <kees@kernel.org>, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_231221_763554_07B4CA8F 
X-CRM114-Status: UNSURE (   8.42  )
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

On Tue, Jun 17, 2025 at 8:54=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
> On 17/06/2025 02:06, Kuninori Morimoto wrote:
> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> Missing commit msg (especially considering this is legacy code which
> soon might be completely removed).

Besides the fact that this most likely would need to be changed to
pr_info() to begin with :-)


--=20
With Best Regards,
Andy Shevchenko

