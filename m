Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 525C6C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 09:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O1aFOPIm665Eiw+j6TUvQPtIt8QoHRt8HSXrKrg0cGs=; b=YuAA2YPdcFK+PCeWvs40sh7IJ7
	E17Xa/gjlNwA8UkRuriCv9d2z6FdiQKLWsxfwRg4UHHpF8AcLS70TStfxGuXiYLR4dl23Lqx8yrDS
	/kGd5JA3YGrNwyJLZTfjRxuQ6yY9pGvoGYFbYAHf7VQ3qa6yS+sPedUMBYVSyYaY6Exsjzs1/pjGC
	3CPFHAk4gmVCTAaY8flblLa6KOj7waGUHXsJxXEHt1Pvt3wiH3zLVuS90aCZbnCTyDOQ9NIsP+sCO
	SwxCl98V5VAvaQWCcWvkBayZaepIWSebTd2hF5GGullXWVJekg8MoFR3IJXw+fb2GiW178I5Y41Ia
	f0QlMpww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62d7-00000002rRA-3G5t;
	Mon, 14 Sep 2026 09:05:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62d6-00000002rQy-2kR8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 09:05:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0086D601EF
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 09:05:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96DDD1F008A6
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 09:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789376735;
	bh=O1aFOPIm665Eiw+j6TUvQPtIt8QoHRt8HSXrKrg0cGs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=J89Iz0koAqOnjzK0pkFz60RQBdV9uLL3PzTizp1q54dlHbB8m5kxR/jEBgyNcnPGr
	 o41oMrc+ZEeaMA6gdGuiG4bhEhmubQFkL7bSEWtYffRfZS59SmRTFLDsKFA4iKwuNi
	 5plNydnXgiAvG63mvvFTY659e78HvUJ4uL50Tg0W0JW7Jxq4iBgq7uBCW24rrIzpr4
	 H93mN0zBZudKDCpKchVKvUwdcX1eYDorV6zxla9uLS5akvn4DEY+NsQngsHG5CF30Y
	 QkYKyRr34MDvtpETel86OkqJ/7vaDZDALxlGdEkdbuKDs0hOYuZLpTKbtnFKV21vae
	 yoLgbfzsqz0qQ==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f16f15so1981043e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 02:05:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwQF7nFYfD7UaUOoVg/jSnao6zbdB1mNp+fLulZacrIPYMonyUiJjAFqkb7yT+OzR1zmvf0KG7yfnYL6gBIwUaB@lists.infradead.org
X-Gm-Message-State: AFuF++ln39E1XnZC0c8ON5hkuAkn0eXqn3UR1BtCrweFwDvlwvNOeSpt
	USul4f2Vkrmh27JFAts1hGt5h7yNfMp9YgmMSWrXuI/11IHMSLVjP5ygsqFZY8yYQ8JfEDZm/0v
	wZ7blDbPO5cBpBPVB8hmj3wOZlEFDkF4=
X-Received: by 2002:a05:6512:668d:20b0:5b8:afd2:c17b with SMTP id
 2adb3069b0e04-5b8afd2c4cbmr300055e87.11.1789376734252; Mon, 14 Sep 2026
 02:05:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260829194203.108240-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260829194203.108240-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 11:05:22 +0200
X-Gmail-Original-Message-ID: <CAD++jLmT1brMi8qd2jyV4_=u50i2NEQO88unv0wq1er0RQdERA@mail.gmail.com>
X-Gm-Features: AcwNN1URGziW8FcEeLQAwIn_mJYzQfGjAW4RUBIvo-J7yMS0ni6UqDbXdjuNGSI
Message-ID: <CAD++jLmT1brMi8qd2jyV4_=u50i2NEQO88unv0wq1er0RQdERA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: fsl: Replace tabs with spaces
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>, 
	Giulio Benetti <giulio.benetti@benettiengineering.com>, 
	Jesse Taube <Mr.Bossman075@gmail.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Sat, Aug 29, 2026 at 9:42=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> YAML files do not use spaces, even within the values in DTS.  No
> functional change, although dt-style-check will warn about it
> ("[tab-in-yaml] tab character not allowed in DTS example").
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Patch applied, sorry for the slowness.

Yours,
Linus Walleij

