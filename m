Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 592CDD637D7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 02:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=StFhRyIpCM9Uu8eeMJnktRCq06AyyCXEprdzl0A/TJI=; b=St5fN0pW/yxRC/cvqtEUl3yoOq
	6QtsbO9AoOnMz6Yroa4YxhUpH4ynEwlZ/61+Tyvj1Vwxlc5U4aFnObL/Fi0hR30+SR1P6DwC9XsAD
	fK0wLZTOvrsumObzaIBrh6+bDoa4n+5tV8RZArWVANT+cp2bXOnp0yuy/fw+uQ79ofeHokrh3d1U4
	jlLB/1uHYg0QfKrKDfu9d3AMhERFY7BC1RvEsT+Rcl2Jsr0I+dyftuHXA/f0ZWsorPETstObBwhoM
	NPfwFWK0kewpcZkoG4kG8x7gMRBD6tzzhm2kU5qpOlofcwXLtXt1kq17OAapwQZ2jieoQzyvCGDU0
	4Vce/o+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBPlt-00000008ZtL-2Dmi;
	Thu, 14 Nov 2024 02:39:49 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBPk6-00000008Zik-2b8o
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 02:37:59 +0000
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-3a3c00f2c75so446795ab.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Nov 2024 18:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731551877; x=1732156677; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=StFhRyIpCM9Uu8eeMJnktRCq06AyyCXEprdzl0A/TJI=;
        b=eOblQounuBSO4zm/PwJ9p3UV4+pz+WNv9Cg4oukp1UVE3o1S2ilTmAR6w7fTzI+mq/
         VHjlsxTZqh2FMx25NHFTZyuXY+y8CpxgGSrTIFUJY8C1SAw6SW23WWmN0WhKGXh9Bl7p
         zS2s3tSNTUD9Cr8365qO0427XiZiLB8oLBE+UYYBns4PPB1/ma8lse/awHKv1zQCZ0IK
         /ZF8GL5JAs9XLley5PscZF5hozw2hfFrk0eArvB0dHiMt+7SWxgYTBp9bmMDM+J4/HYN
         CwAtp8Ll1wx7W+9qROTOXjUlGoxZFHOfiERW2w8/AdH3XsMutLsDo2Qpwp+quS71bQar
         C7zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731551877; x=1732156677;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=StFhRyIpCM9Uu8eeMJnktRCq06AyyCXEprdzl0A/TJI=;
        b=ro+/4ITzrs8KGOgDasWCI7L/JreP1V/+CLT8G8fODS3FgyZBnijJ9tj/WBIN8CviQX
         h4jKgrwDoBGdSXyeSbK06KbAjGHjWglNX9BUoBBmCtu1uwiSkbXLTKNX9SwJhvrwJ6X9
         ugyvKeNukEzDbYGnL2bsRsrjlegGHjztuE0Hd47Kg0cJ0YfocP0RnkMxDCFiNi4DfB8E
         P3ZEmGUHqWL3yVdNxbBYCQTEJMy12cqypRvydPjgs6OzwKF7D4WBToOmmIoNmxER0zXu
         VkqggWEXmJA74hFWMk3KSOzJPF4kMG2rfTcotF/X7Dfs0aO1BWAXyCWUAQ51jDO4bivj
         TWVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjlkeGvlYFIifTeBS9vAuhBFNG0YiQx3xAc/XmqYijcwTj9rQCcG52PbggrgiMhcLBFKwRmAmSn9obPAljIw41@lists.infradead.org
X-Gm-Message-State: AOJu0YyMMJI1PR3JgeI4bRKe5lBoKdNLPPm3K89bRNs1Y9qoBoy4Q/by
	UwhbBii260F+Nu1HcmSjZmwF8YSIXNcE2heSVBIPY8RKaJ7w/Jbd/4dykURjOqcgv5ydBvB6nkj
	tF2RuHDlRtIr+EjhNRKCM3/N5Y8w=
X-Google-Smtp-Source: AGHT+IGcTJSj30ycrQ3ffIAZN66OsQquO1B46KfWjrwu9f3E/Tq4Zk70MH8L6VADeTi2CDkmD1g2VJE9cA/VEkQCcgQ=
X-Received: by 2002:a92:c56d:0:b0:3a5:e1f5:1572 with SMTP id
 e9e14a558f8ab-3a71fed5de0mr5894775ab.22.1731551877130; Wed, 13 Nov 2024
 18:37:57 -0800 (PST)
MIME-Version: 1.0
References: <20241108100759.682260-1-shengjiu.wang@nxp.com>
 <20241108100759.682260-4-shengjiu.wang@nxp.com> <PAXPR04MB84596DD01E6A066A621F590188582@PAXPR04MB8459.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB84596DD01E6A066A621F590188582@PAXPR04MB8459.eurprd04.prod.outlook.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 14 Nov 2024 10:37:44 +0800
Message-ID: <CAA+D8AP=cdyvhtzDib8-T5GuHU9pXhPVgdomTQj8R=8CCFr5HQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: imx93: Use IMX93_CLK_SPDIF_IPG as
 SPDIF IPG clock
To: Peng Fan <peng.fan@nxp.com>
Cc: "S.J. Wang" <shengjiu.wang@nxp.com>, "abelvesa@kernel.org" <abelvesa@kernel.org>, 
	"mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>, 
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, 
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, 
	"festevam@gmail.com" <festevam@gmail.com>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_183758_681871_74297DEE 
X-CRM114-Status: GOOD (  21.16  )
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

On Mon, Nov 11, 2024 at 11:11=E2=80=AFAM Peng Fan <peng.fan@nxp.com> wrote:
>
> > Subject: [PATCH v2 3/3] arm64: dts: imx93: Use IMX93_CLK_SPDIF_IPG
> > as SPDIF IPG clock
> >
>
> This patch has a fix tag, but the other two not have. So the other two
> will not be backported and cause issue.
>
> So use fixes for all or drop fixes for all.
>

Should I add the one same fixes tag to all 3 commits?

Best regards
Shengjiu Wang

> Regards,
> Peng.
>
> > IMX93_CLK_BUS_WAKEUP is not accurate IPG clock, which missed the
> > clock gate part.
> >
> > IMX93_CLK_SPDIF_IPG is the correct clock.
> >
> > Fixes: 1c4a4f7362fd ("arm64: dts: imx93: Add audio device nodes")
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx93.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi
> > b/arch/arm64/boot/dts/freescale/imx93.dtsi
> > index 688488de8cd2..56766fdb0b1e 100644
> > --- a/arch/arm64/boot/dts/freescale/imx93.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
> > @@ -925,7 +925,7 @@ xcvr: xcvr@42680000 {
> >                               reg-names =3D "ram", "regs", "rxfifo",
> > "txfifo";
> >                               interrupts =3D <GIC_SPI 203
> > IRQ_TYPE_LEVEL_HIGH>,
> >                                            <GIC_SPI 204
> > IRQ_TYPE_LEVEL_HIGH>;
> > -                             clocks =3D <&clk
> > IMX93_CLK_BUS_WAKEUP>,
> > +                             clocks =3D <&clk
> > IMX93_CLK_SPDIF_IPG>,
> >                                        <&clk
> > IMX93_CLK_SPDIF_GATE>,
> >                                        <&clk IMX93_CLK_DUMMY>,
> >                                        <&clk
> > IMX93_CLK_AUD_XCVR_GATE>;
> > --
> > 2.34.1
>

