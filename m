Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43EE3C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 07:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bAbqMVMN/BsTtzWBffV3qCZS+XOlVzSdX4AUrrnqi/s=; b=O+WLNCU84wWPlhTJFRT0sEAJma
	fc2jN3k1fauY2Y4HrBmuy384fkEQzahUEjY12Js6XwfwtWrC/BZYhdKWfRTA0lnG27AXs/tJ612YC
	jyAEydrUs0MM90+D7f9wQ/qVCi2/zvHD++zPZ8YS6Po9aj2oLHwOOfChk2mhaw2E92l0BqmyVv1wf
	QcRr5WOR3d2VC8SteB0ArMCdaCMgGCrSZ5Vvb3gTHGdT5xcOPSbNpPdXmwkc4BPP8i32mzua9Gh84
	XeBDUHZtEB+0kPntaFtED6SZkmbNMYpDbplhgRpWNRWNiCzATcFeaCUJ1K4jTH7v3Npiq2tdOEX54
	moBBwUzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumGR-000000028So-0dBg;
	Fri, 14 Aug 2026 07:23:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumGP-000000028SN-3mRB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 07:23:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6163C40823
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 07:23:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45BD81F00A3A
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 07:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786692217;
	bh=bAbqMVMN/BsTtzWBffV3qCZS+XOlVzSdX4AUrrnqi/s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KJy6V0pWt4inxzaONO5r/SYmxSvSNcUSz5kJsa1YRGstbc6oizBjSdp/D1AnpAQ42
	 kMMdV9hOzmNV4Xl9yJnCm1QEVUQviExUvJ7ldSOaj/jv2sDTSs2H4JIZAUz1eAFA8p
	 7BCAn46mLMOmw8y9y3Dc0/62xfR43xeDWmuOTIUR3q3mxMJLgRPfRFlDMm1DIzT61Q
	 a8TrOZaPIcoEhM91+5VBpz3zoteSb698T8RBYCoHYakvBXALz3NDZi8R70lbPFzods
	 94uH9IVRy0AvQGXGayMl2CYibCn5+7Kr/zRMeIDCCBsA0ibI9DLkYri76S0VFxNow1
	 uppzM0tr2vFcg==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b015532f7bso620191e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 00:23:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrmY+GgY300KKIe5x5luB205yVb2wuS79HLpcen77b5agwSiQd5gQidUUe2MHMogijrg1LpnFKwwmz6BPu5av0G@lists.infradead.org
X-Gm-Message-State: AOJu0Ywi52WESz9cshvJexmjP/7qZVpU9RnjZH4UQg3A0pO+pxqovi03
	vw981seKWHzdCBwGQga6y6aCkxT7WIrbR1Cc2eQML4apSB/7m35ttxjOjek7fbS8HkpJ3L97UlS
	Ve+4L1iUEyj1+oaOjfOr9h8d3W8U96+M=
X-Received: by 2002:a05:6512:3409:b0:5ae:b136:acdc with SMTP id
 2adb3069b0e04-5b45917eafamr436015e87.35.1786692216083; Fri, 14 Aug 2026
 00:23:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260811-apple-m4-initial-devicetrees-v3-0-6bf32d45ad0b@cyberchaos.dev>
 <20260811-apple-m4-initial-devicetrees-v3-2-6bf32d45ad0b@cyberchaos.dev>
In-Reply-To: <20260811-apple-m4-initial-devicetrees-v3-2-6bf32d45ad0b@cyberchaos.dev>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 14 Aug 2026 09:23:23 +0200
X-Gmail-Original-Message-ID: <CAD++jL=wF3CVQB=8PJUZBUDS1zaXkucBjUQ0Rw1P+jHk1f0T1g@mail.gmail.com>
X-Gm-Features: AcwNN1Vqt4-grpwuqjlFcEbTAF3ktUGE_yOp_pIgiwSf_3uQeKVFZ3BJgIoiEp0
Message-ID: <CAD++jL=wF3CVQB=8PJUZBUDS1zaXkucBjUQ0Rw1P+jHk1f0T1g@mail.gmail.com>
Subject: Re: [PATCH v3 2/9] dt-bindings: interrupt-controller: apple,aic2: Add
 apple,t8132 compatible
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Hector Martin <marcan@marcan.st>, 
	Mark Kettenis <kettenis@openbsd.org>, Andi Shyti <andi.shyti@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Sasha Finkelstein <k@chaosmail.tech>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-pwm@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Aug 11, 2026 at 9:37=E2=80=AFPM Yureka Lilian <yureka@cyberchaos.de=
v> wrote:

> The Apple t8132 (M4) SoC uses an AIC3 as interrupt controller, same as
> the M3 predecessor.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

