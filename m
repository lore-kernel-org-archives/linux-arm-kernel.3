Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED815C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 19:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lo5coXE62H2fouB9VXeUvOT/gACYQbPEWDtxaDqxcmA=; b=FRFVBA1NOXw9Wr7s1ZxUTbLqGv
	LOQnTjFF1ZSv4MGhV8ClmbbSqgjGR3yttkfqiNqv5tLwvBqMXKDuNxdYpbQwcxfghrjfVRHuHiSj6
	ShqssB3+QWxYjS2jBxKSdapwtaPmC2x6QXZ4TJD7NXd0TySf0b0/vrwMbVWP1heAdFKoYeRhoYIVM
	GvpZ9r6wDwPUvHvSY9qWktywBCHt/18o98stxJD9UCcHa3E1QP5o85XcHEpidCDfyJHSuUep+a+5z
	idsy+ZjqzdsuG/lyubKI+/V+6BMkRxoPYLfoM+kwuSB/siL7yvFDaLFzxp3Jo0DPaWb9/6VcTXrNT
	WPXE9bFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4lbr-00000006orH-326H;
	Tue, 15 Apr 2025 19:06:15 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4lSM-00000006nIM-0m3X
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 18:56:27 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-54991d85f99so7258957e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 11:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744743384; x=1745348184; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lo5coXE62H2fouB9VXeUvOT/gACYQbPEWDtxaDqxcmA=;
        b=EDevTmGWwDyJc8z5YOaUEE7UdHRT0JDpImvODeqGK19D4fe5UpY6kwU48Eckb03LvU
         +EamLS48cKw0sERjA/z1tU//ild2nqNUSCMxVGk7F75XjWtEwLDp+XmHGpwPSk1FKFB/
         Ed3Qsc9zsdzVfdtUUW/zTrFOV/Mn8LgMRXVsyYtk0qJwqNYyKCpcbMbRCRTMktLLTaJh
         WsguC8WTQ/boi+rFMtkGGttdliC4ZNg46UUl4pONCT7HFJejJtvaK9XT7tiTq9h/rq+7
         kZYXhySrcgcaDxIou+QiV/00db8+sfUL6mSwK3Ls0V12LKve999fHh/IZ84Kffwu+CX9
         /Cng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744743384; x=1745348184;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lo5coXE62H2fouB9VXeUvOT/gACYQbPEWDtxaDqxcmA=;
        b=vb4lTcGletYZL6k+EAulYrKKrEcK2O3V3YEtCYt1NejYpoOp5eknm4rfIIqksqbtdm
         VoPS/nv3BudEEeDM6xG49yNLS/0dOEU7VDrok/12vaJdS9QAGFk4Wh2ODAY4fkHdVbZX
         8Tpt3m7bvCLS2OfPiI4QsruAHkbSNSofC+qW6bHjLo4mHDqJsTAVTprIVauO8KIsRcd/
         mSqH6uDTPLTTgcNWzGBRNUxsqRrqplNpIp0HozTLavskxHZsLZwm+TfuBMHjFI+5X5WO
         u5v6KXuy+VAP3kFSBXQ6XqhJuCS75vur8m1h0uDdaoeU1Pjqv7ejYKvHA5n+2bVIXd/g
         U4JQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDUNMLYwh54ereP5emUjFhJ8OuDY7ppLAz3fuaSZmkLra5RhFUR56IIIUpPaZ0A4eL8Cb/eCwZJJgxh1ShgmSb@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4R01LzTdfpFSUcUiu0GPHz7abnrmd4fRjlzAHp9YBBvjHu6Ht
	NQ/Ofyz++KFic7VTOfbY0VxS2RdUcp4Cia+Jm+OY9IphimOmoS8QW5YsISved2c9PQa++vIt6jO
	wiwGEwOtH9NDv9YTTax9Q8KYtK4c=
X-Gm-Gg: ASbGncv1IoPWWmUz4zb0F3fTNNTHhyEJk5PqaGq+97C3HP7HRUFWbplNT3iBL50yxTD
	JfBYQUxii2SXIP3Kgog0qHDHdz221XuimVi2jBY1jTkB7J/UcZKBn4GWqCUm68y5FZNIGF4k6tZ
	Qep111/4rPjQ633FBGcWUzaYNtn6hSa7juFoig1GWWUJ6XxhV+ux+uNA==
X-Google-Smtp-Source: AGHT+IFNxa6DPHsE83s7VHoRFcwZshVZ41bCnYbQKpm89CbfRxgsUxs8fFz0skmgp05sI9qKmAv98Zh90yZk49Tor58=
X-Received: by 2002:a05:6512:32d1:b0:54b:e70:4122 with SMTP id
 2adb3069b0e04-54d59697e61mr1955095e87.21.1744743383630; Tue, 15 Apr 2025
 11:56:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250415-initial_display-v5-0-f309f8d71499@gocontroll.com>
 <20250415-initial_display-v5-5-f309f8d71499@gocontroll.com> <Z/6rDW3vw4C8jhy3@lizhi-Precision-Tower-5810>
In-Reply-To: <Z/6rDW3vw4C8jhy3@lizhi-Precision-Tower-5810>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 15 Apr 2025 15:56:10 -0300
X-Gm-Features: ATxdqUETMW1I9nEhZzbzObdwy0X6emkJSQXXceuVqIn2uB-H8JgZsWUwIheR5sg
Message-ID: <CAOMZO5BdFm-Yj+ZCApND+A7n3m5QQ7F1q2eS-eUrdGXgkTZRpA@mail.gmail.com>
Subject: Re: [PATCH v5 5/8] arm64: dts: freescale: add Ka-Ro Electronics
 tx8p-ml81 COM
To: Frank Li <Frank.li@nxp.com>
Cc: maudspierings@gocontroll.com, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_115626_220557_687885B5 
X-CRM114-Status: GOOD (  10.71  )
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

On Tue, Apr 15, 2025 at 3:53=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:
>
> On Tue, Apr 15, 2025 at 08:54:28AM +0200, Maud Spierings via B4 Relay wro=
te:
> > From: Maud Spierings <maudspierings@gocontroll.com>
> >
> > The Ka-Ro Electronics tx8p-ml81 is a COM based on the imx8mp SOC. It ha=
s
> > 2 GB or ram and 8 GB of eMMC storage on board.
>
> "or" ram?  I think it should be "2GB ram"

Please trim your replies.

I think he meant "2GB of RAM".

