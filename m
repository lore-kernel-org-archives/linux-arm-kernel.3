Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E2CC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 19:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rRfwiNue6KLLPaOFrmVXrPuXrw6AneOIZ7brZ38AEvc=; b=QvHARuUXVt+LSEXLJCTmGdcDtB
	4tTCu2dCoAToq3UbqFQKOkSObOOE4m5ol8xyNnYtdDS8jtZ4f31/S+eh0QGuw4RgKmIch6hb94jPo
	79C/PBg+lI5M9/bjxnPQU42nOtYZPOZmQkthEOUb5v4IiO0w3habI4tRDWBVkWXkE0RtkEiuvX37s
	ptq/WWe6WZXe4wOtePF2kqCCa2/CrdrgNCIHrYJf2jxYwFrjDGzz9QFRloRWMkMig1BD8aw2rYYHi
	fhZIxStU0ZxPa2QwH+c6BAbrr1yRL/0r3AQt0uJRaidkKm6KZucTHZUd6ORJa0klJM2VlLKGhnDcf
	mgdI0umQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn0oc-00000001Cg2-2Cuf;
	Tue, 25 Feb 2025 19:42:02 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn0m8-00000001BoR-34bm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 19:39:29 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-546202d633dso5924684e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 11:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740512366; x=1741117166; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rRfwiNue6KLLPaOFrmVXrPuXrw6AneOIZ7brZ38AEvc=;
        b=O2vJOzGgv1x5bCGG1QFuyOTvHXDlxfYXwZnxYRNYBjVz2XxdrU1XIh5/AVIpfbmhuY
         wI3ngXg1fMGjDPqAy03OLl/lnDLQd5V43LivIlx51rrl4Q1RnoplywYNrKHYJuXw8t4z
         8fkWjhFXfcUT0eQvjCKex9og8ER2Dcp5QXtbPLYwrqqpK+8AlHMMsU6CuapERk+cZ1I1
         +gb6v8D34imKBk5/1dRJK7LwovkEQzbOXwfiH4EntnysPAbFijwj9jLWhdeRiRk5hrzb
         jYdEJLImeahHuH5nBHLo3Gl3u8fbYcCEMqAA2ImheP2E1M9LxJ78+Cvu7Su6wuSARCUk
         7FAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740512366; x=1741117166;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rRfwiNue6KLLPaOFrmVXrPuXrw6AneOIZ7brZ38AEvc=;
        b=jMUTCKsoth+PFYxquSbat0hT6THuBesyIz0USCu33q5J0PlHz7GuKffxs9BicuuhHv
         DWAW98wPq5MBINsbDa6KwYEKvLx2lGAonKDU5yIFw1kMiWXFJB7EN0/HbBWkDmG+3B/W
         KaBqNlErg2kc/hA7SAIp2Fubo+EmlqxGr6rzk5daD+fzHmVoEicw8Z5hHvDKulZ+0ECO
         rG15aG3NKh/gCzASfii5C+oIx2OC0eqJtAFYdv5+hDxNbfAwz0pTADx4xslbD146UjjW
         T50q9RhdMRbSE8VHAUiNH3t2sysXR5L1akO+Qq84t1sD8EOAobYIrm6MlZW2VSGZg3Nc
         Et6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXCDjdzkQZ5lKMB1fRJNqpxAv7xq9XxBpaw0+PoCX0ed5Dkk6SKPlyohUA0NdbMR/zVSDFBqtJdNZHZXyedCmrx@lists.infradead.org
X-Gm-Message-State: AOJu0YzfKSGcpPMA90hZ3po8dvM7doRrAOW5kGE14+7oBr7B7hLigAq7
	Mo2v/tOGLIX3JdOqCjJRL5pRDm6C4jSxwIdr6V9cxF7fDoHMMqY8VgBjA6HMCLt3rPRpSZO8yZE
	s117TJV2uo1Qx+QgZaFhxPfWrAlF3Kg==
X-Gm-Gg: ASbGncuLQeXap9N1ZDn+gHzIkWdVY/CacRk4pod2nQK54q/l+5iIu4295gNo3filQFP
	TxraQMmR3ttC4l92s/tbK2vufq7oYEwj9Mq9gkdtRtbj/Mfb8LAIPB5FPbrZYhbVdMWqe5sdy8D
	BpGWOnyfs9U+71gZ52rE4PsU3QqdNPWKQL889dokI=
X-Google-Smtp-Source: AGHT+IEKk084A4djpTZdcYmY7yRIuhYdq72PxE8lKK7wocMcZos7nA2xNjrdx5Wn+I+t1aoqdI5qFo8Lb0jS8y7rkGo=
X-Received: by 2002:a05:6512:158c:b0:545:169b:9b51 with SMTP id
 2adb3069b0e04-548510dba17mr3031808e87.24.1740512366062; Tue, 25 Feb 2025
 11:39:26 -0800 (PST)
MIME-Version: 1.0
References: <20250225192557.2914684-1-Frank.Li@nxp.com>
In-Reply-To: <20250225192557.2914684-1-Frank.Li@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 25 Feb 2025 16:39:14 -0300
X-Gm-Features: AWEUYZkycYP4AmimIz7AT7PNtXzinXlNotQzIz-bQOQJJOzcBgdenJ2hhbqyzlA
Message-ID: <CAOMZO5AFy288CEeZLhbDvpL=_ETnFt2sAYnJH_VbiXzGe5UiQw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] arm64: dts: imx93: Add the 'fsl,ext-reset-output'
 property for wdog3
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_113928_766816_4CB6D13C 
X-CRM114-Status: UNSURE (   9.76  )
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

On Tue, Feb 25, 2025 at 4:26=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:

> --- a/arch/arm64/boot/dts/freescale/imx93.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
> @@ -692,6 +692,7 @@ wdog3: watchdog@42490000 {
>                                 interrupts =3D <GIC_SPI 79 IRQ_TYPE_LEVEL=
_HIGH>;
>                                 clocks =3D <&clk IMX93_CLK_WDOG3_GATE>;
>                                 timeout-sec =3D <40>;
> +                               fsl,ext-reset-output;

This property depends on the board design.

It should be placed in the board dts file, not the SoC dtsi.

