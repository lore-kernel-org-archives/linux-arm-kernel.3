Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E2C2C88E41
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 09:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nd4756Hy+92ohyhREHEr2ehaES7a+HF9kecPSnYoKRI=; b=Do03nQS4xn8XvSLAmeMyz0XFSX
	q1iFO25UJjrJJN4rXPDmaPyFlWhoUNYF8l+KwyO2jk6mk6rEx8utJ1FoIBUmt8Nalb+fYuDBvje5u
	8WxD96laWpwnJRviDVqeRzb2iO7LDXkB7C8Ejh6ubuh2YFcUSooCooAHmzoN8g3WNW76LN0dd9IAS
	NnPUWJL71QMHp2MbHhuc4kUj5Lsajv6P0Y7EoBa/Ppqk1Qjmtd2eQwgCvFC7qStXIoA8H8+r4Cxg/
	/3BDLhjJjF0E1wk2hES8jErXn368/kgaJJ1vUqcj25N2Bcf/vKELooypm38R6wHVMibvJUWhL+g7b
	Hv9YNRAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfRU-0000000Dwbx-1sST;
	Tue, 27 Jan 2026 09:33:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfRS-0000000DwbV-0DCU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 09:32:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9B97D44283
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 09:32:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55749C2BCB1
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 09:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769506377;
	bh=nd4756Hy+92ohyhREHEr2ehaES7a+HF9kecPSnYoKRI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hqg/p5fwd0Wtm1K4HPBR20a0ZALUIPwJbR+HTRa2SE9d84XqA97XGZ0n5H7mZ/pdY
	 LrjP7i6moJ/1DKMh3Ytl3YLATfXpP09QgOljgvsJQY/IYIEHYWaCJWONYB5b1bsQdM
	 JVDDcg/mmFlM3swvNUuEodb70UKzeHAXzR3f3GWxzLI+QLDjCYFcH0etlakY+OErJj
	 UtNpdTSkGiffuXXOp+rivvZLqk7ewNp1ny7Vd5fcL9tYwhlehqrW4wLewQ5h4JslZ7
	 P2hD4a0YTZxIISfyde3jLLAOXwD7M0PnMd/pnnluIIr1/1vvlxzzehe1wM3o8X4nrE
	 rDvlKs0ndj1Zg==
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-79088484065so48330027b3.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 01:32:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUECc+5pe0D0IJDim+7O3rRgsTQWPvRQybNzsoBxogPOQKIAe+v5+GsW9WKWmx8bgrjTfcgT8ZqTWt+Rfrds+Mf@lists.infradead.org
X-Gm-Message-State: AOJu0Yxe602xlaUs2WOoAfEOdugis8ZPSnqJVueqLtAlUDhswYn+0hUp
	ji/i8di7rjCDL00z5+IK8wD5uxKi71QQmjs1QkwcbhrfrAw/ARwNfO1kJf/MaRWBXXnaBaAF7tE
	4RK+mLNLQ4VfxhYiKBDgb+kWt9ROQs9Y=
X-Received: by 2002:a05:690c:fd1:b0:794:78ad:470d with SMTP id
 00721157ae682-7947ab40c1fmr16169877b3.27.1769506376440; Tue, 27 Jan 2026
 01:32:56 -0800 (PST)
MIME-Version: 1.0
References: <20260115114021.111324-1-robert.marko@sartura.hr> <20260115114021.111324-7-robert.marko@sartura.hr>
In-Reply-To: <20260115114021.111324-7-robert.marko@sartura.hr>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 27 Jan 2026 10:32:45 +0100
X-Gmail-Original-Message-ID: <CAD++jLn3pP4cdB3h5KN04Pn_v+XuvK6ROuxpNfJVhSRJpo2FUQ@mail.gmail.com>
X-Gm-Features: AZwV_QjPaAf4YpNWpzKIxLTu_1dAPvSU-dSWNUWnEkSR0mawzeMGDcKYjAjufcE
Message-ID: <CAD++jLn3pP4cdB3h5KN04Pn_v+XuvK6ROuxpNfJVhSRJpo2FUQ@mail.gmail.com>
Subject: Re: [PATCH v5 06/11] dt-bindings: pinctrl: pinctrl-microchip-sgpio:
 add LAN969x
To: Robert Marko <robert.marko@sartura.hr>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, herbert@gondor.apana.org.au, davem@davemloft.net, 
	lee@kernel.org, andrew+netdev@lunn.ch, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, Steen.Hegelund@microchip.com, daniel.machon@microchip.com, 
	UNGLinuxDriver@microchip.com, olivia@selenic.com, richard.genoud@bootlin.com, 
	radu_nicolae.pirea@upb.ro, gregkh@linuxfoundation.org, 
	richardcochran@gmail.com, horatiu.vultur@microchip.com, 
	Ryan.Wanner@microchip.com, tudor.ambarus@linaro.org, 
	kavyasree.kotagiri@microchip.com, lars.povlsen@microchip.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	netdev@vger.kernel.org, linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-serial@vger.kernel.org, luka.perkov@sartura.hr, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_013258_106636_B1E5018B 
X-CRM114-Status: UNSURE (   8.55  )
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

On Thu, Jan 15, 2026 at 12:41=E2=80=AFPM Robert Marko <robert.marko@sartura=
.hr> wrote:

> Document LAN969x compatibles for SGPIO.
>
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

This patch 6/11 applied to the pinctrl tree!

Yours,
Linus Walleij

