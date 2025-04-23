Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34012C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 10:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l4ONh9IizedqA6W3QPhG+iwsoh6uJslCMo9BpNc/j+E=; b=q4+y29s84EuOQWLGPWZLmG+W19
	TK1BuXx7AXDfs+VSxJm8qsZHVVWNB6aGaE63BKrJNdStiogUvoyuKUclOGO0BPmTIey1mMNZsRtO7
	A6KxAR1pQVlvfQCJdsc7iEJY2PuIjagC5k8XBTn9QO2ERmULGVXBvZmmAY8GTfFJByGfkkV4akK84
	kKm6GgtQoLFm+DwGtEQE0Yc1RP0JIRMzKa5m7qQPW50mBONKr4n3dccKYbeM12ghJ6stUQsv8pbBx
	hiAn5sKz3p3wGOE7pvDm1qpSlY/EeTNR2QlkOxqKgMG1xFMFeiSvQvloVzZmwEM20s25j02tFdmO8
	AztmsWSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Wz7-0000000A6ro-34Rc;
	Wed, 23 Apr 2025 10:05:41 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Vyg-00000009r8p-3F7D
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 09:01:12 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-54b10956398so913907e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 02:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745398869; x=1746003669; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l4ONh9IizedqA6W3QPhG+iwsoh6uJslCMo9BpNc/j+E=;
        b=qfavX+xHbiFQ/YJ7aKUHjvihS/LzPpplV8nAl7753VIftKqhjGlUuATY+ar2mlsSEc
         vJXQj7f6GlQ+xMlb2psTQp0C3UEQ/gQIpqdDVGvJDKNPIqqJep0ldAMlUzIGCdbeJqFH
         eVJzP8TuvZHIgKI3zDr1+QcYJ1aJJzEjs9sPTUoM+ofhz4PLIEr3LkD4bV7cznaQ5NkB
         YNIazZ1IOhTd6zJNmUWLZhDt0g/Z+QY+yWI3mBC9p1N56tBWK7zkMHdYQWnQreCv/GLm
         dsjIjD0eh72E27UC4IR/grpnFGqmF4K7+h92D2BXw7FhT46+dl/bxFCppTixAbEa0EE4
         gkbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745398869; x=1746003669;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l4ONh9IizedqA6W3QPhG+iwsoh6uJslCMo9BpNc/j+E=;
        b=MPpYRlF+rOe4u1iFemzkDBuI+LUpIZmo0lOZl/RXWmm+XcweQ0tnzb3qI0nRckU3Ok
         HrU/CIz+4ctu3t7knzijfr3HtWqUo733A7wfNCFpxP8lB8o67e1leciQltoA5AMNgSYk
         keSj1vYAKPAGv7Gk0QS542XKNbQLK7G83aTAIJt1Vss3wiZMBb2J4c0Svgwiwb+wq/XV
         5p0M/RbtRvk154X5oiV1TF2PNkn8eIDzUBLWpICsOtqGHk3PXeKyRW7BhS8qYD+JOZye
         3MIMgOVjlSSi0zNOWAG/ieqWmM7CpHa7Aq3gbT+yhLC99LdWHIfLP+3I1MyTbU3WhnHq
         5PAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQjHbJdi3I9yLi67ZQQWGGNYamuXc8cIbdET3JbUkQQxVeWJmmnC00lNSoJCPnTrFXwMQwp1+t3orEMKp2uPb6@lists.infradead.org
X-Gm-Message-State: AOJu0YxJ4qWEqTug2lve5F083grxfhHXVX6cZDzBWpKXhpGh4mltGZi/
	LSjXQZegcXdfWT6EjpS6KLGleEqDLjZv/Cgp77eLhbmaFWpziQqC+ykVkAEor0Iu0jUuRz78vV/
	ZN+ew5klauEfCYjYCoW6j/CeJ02nkJU5OJJM2Pg==
X-Gm-Gg: ASbGncuwmIFQCThlVrLcgSdUTad8i5snzEs+KrIXs2a7XfSIxLoXO9ogWVz4paiVe2X
	GlJzfAE5ySzTdLu/utm1rQmo45secuqrXkVQs+9XQh62A6E2qsEML1V8ZXtLS7764MiiPsCHdeu
	n2vyqtVePYGtEB35zQcjfJlg==
X-Google-Smtp-Source: AGHT+IEEUsAi88UCbofnaku2lk+aEb48FzRJxri8OckiCKB/AVx4JpJsbdKyriMomMEWTnYqEIv4ataPoB16Fz19o6E=
X-Received: by 2002:a05:6512:a8e:b0:549:8d2f:86dd with SMTP id
 2adb3069b0e04-54e76b22a2bmr572698e87.20.1745398869092; Wed, 23 Apr 2025
 02:01:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250417152158.3570936-1-Frank.Li@nxp.com>
In-Reply-To: <20250417152158.3570936-1-Frank.Li@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Apr 2025 11:00:57 +0200
X-Gm-Features: ATxdqUFs6bNpuAZ8C-mefVn5vnH3rPvKnGkG9Xz5ALDijczN73qOaRKozbezrQE
Message-ID: <CACRpkdZkhQRdDCTBxOUifT3uX047us8cFExhZiuAUueegD-zeg@mail.gmail.com>
Subject: Re: [PATCH 1/1] dt-bindings: pinctrl: convert fsl,imx7ulp-pinctrl.txt
 to yaml format
To: Frank Li <Frank.Li@nxp.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, 
	"open list:PIN CONTROLLER - FREESCALE" <linux-gpio@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_020110_820748_294611C0 
X-CRM114-Status: UNSURE (   8.77  )
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

On Thu, Apr 17, 2025 at 5:22=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:

> Convert fsl,imx7ulp-pinctrl.txt to yaml format.
>
> Additional changes:
> - remove label in example
> - fsl,pin direct use hex value instead of macro because macro define in
> dts local directory.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Patch applied!

Yours,
Linus Walleij

