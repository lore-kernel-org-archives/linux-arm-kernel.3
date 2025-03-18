Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 127E1C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 15:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L6Ipmc6ilCbSYurjtaIb/33JjbYe+per91vNl3/7Nh8=; b=KGCy5ZKyWxMTQ7gG74Udwy5z4F
	kvy6QPy8A2yaeh+9K9oipyVdHzt+iHtpC9GKrQFefLkClM/wApjyLoMyS80QXh6qRLOcBSa8rGKtn
	IQJURfKN8uCcPDWTqYJ3hPtuZERzCUL4/0Tr1oBiGoNXWkXBQ51uaI4xO80145aMJEVgszTNveEwR
	m8JkWugVilm0PYTcWV0ly8rPwD9HA4x0LQQ+MwWsei4IQBMtqGb6NvBpNKtqzUL0YKiWEA9OxPOh9
	+oK1QEa2XIM/+lwo/SxKk8Dx+FNyihBXrzF6rfO+vLLNMKORRsAosKClNU5uIgPepnk9398MCdtvs
	nplT4jhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuZEH-00000006PtK-3Yn3;
	Tue, 18 Mar 2025 15:51:45 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuZC4-00000006PT9-1pXc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 15:49:29 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5e8be1bdb7bso6044740a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 08:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742312966; x=1742917766; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L6Ipmc6ilCbSYurjtaIb/33JjbYe+per91vNl3/7Nh8=;
        b=MYLEEy9XDfCIR2YHSwbsfP+/31mmXkk/Tvvz9hQzRYZwki4KOxGkU65TZgRJWBDLHW
         ENqurxbYmrNCGWeyhIA1KSe+MJxA8zRbR5kZMstji8SJZbXLXhPkxPyGuD0ZdK5gUheA
         BIXrHAQXlsR1a1g1Yuw/YATsiesb0IkwH62KCFujvJy5fLRCaoMdwCwYRY14DALuTohZ
         y/zTksf+Wtu8a5G4qMHrNsTUYhL63VnNGVZBA+akj14ljBnGZ9neA4IypMXZMMtHN3p9
         TqnlBeL7QQY7VGL6S5+Vt3vfxVj4lGSAF4rHVVtO0MDrMHbYqSY5ggdLGhtatuEnkyvk
         evZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742312966; x=1742917766;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L6Ipmc6ilCbSYurjtaIb/33JjbYe+per91vNl3/7Nh8=;
        b=Hc9nZKzQwesvwaIMOdvqqTkpgeYTPIpn6bDnHkNgjHpRmv/6M8wSmAKbwGBJsUEmR+
         2Hyifre0AZxD2cToKD/cp86lkfmMuL+W9eKbZC1DjNN3rSsV7A6KJ/tnbJmEMGT5Avqs
         8IU2BL03rXXrTMedtbyo3ggc2nCt1uCp/M2CrbvukUyazNoLqJrrk6LiLAX+ARDCyXF/
         chAwlqIz5CP2723hqB6RsbEfNYznYRA//pPuZSBV+c3Qg0W0N+iSx0XXvijsYdPSnRGg
         4V3UbEWfInwDZ8QW7fBNxrNYwsL0gcN5D3ySzdolK9MCCNCtsDLDUSEL4sxx0aMQSWDI
         mAuA==
X-Forwarded-Encrypted: i=1; AJvYcCUzSRUI5xdYbaJT5IutEo8gTEgSdKCqeB9yG1z7rVFk290pcL2XeW+p2ljRZHuDP38CUxqDu0CUX+rIBTCpMPfb@lists.infradead.org
X-Gm-Message-State: AOJu0YwTwhK640xvzABgzMTHTsD1ZENNwreOVH8Rn5whXVhnzt59FEaY
	cORPT3W3s79Z11J91uCm+D6F3/OKirUy42Lx1PbaHxAY/btwTcjd
X-Gm-Gg: ASbGncsjxsM8BPkxSkGDPxYNEnDo5hitD4rTTsGoONEzBRxmGunon1AWEDEcWP/vFxp
	RE9TtJkDezTRfwJbck2Z3TB5Bc47JyfL6uHz9zez1AtkwrghGVbe/r17Ur2zHTch4yepM9zYcpH
	SIrdhebnnQU0nsgCrIrg+ytvEYWDmZwZQWMIx71NX4Mv4foJ4ccub0VpnWh/xMDUKRl6oaAnkII
	GsfPzAtEQGUDjbVgiHK1sEYCkklgAKl8olunzps9LcSbzxZPo+obWDaLm+gpNhX0q4Y1YUCtTyz
	6Yv/FpBF+iuTJc8qjc/KUTqVokJu8QixKbdl8b/kB3e1dV4cg6N1MssGOtjZ1ef1JyuI9DFC5pD
	BZIq+nxwCJUOiN7MR/RTzrB0/DjQdri7CNfpkmuFxf7mGHg==
X-Google-Smtp-Source: AGHT+IHMLkaV8uHFQVg2vHrzXkQR9/w+ti4OyBuv1b8SAJBLiHJR2w6USAKnVcw7fN1kQSv+zr3g9g==
X-Received: by 2002:a17:906:da8c:b0:ac1:e332:b1f5 with SMTP id a640c23a62f3a-ac38d552e43mr506689066b.37.1742312966212;
        Tue, 18 Mar 2025 08:49:26 -0700 (PDT)
Received: from alb3rt0-ThinkPad-P15-Gen-1 (host-95-251-108-181.retail.telecomitalia.it. [95.251.108.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3147f0f5dsm885226766b.63.2025.03.18.08.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 08:49:25 -0700 (PDT)
Date: Tue, 18 Mar 2025 16:49:23 +0100
From: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH] arm64: dtsi: imx93: add alias id for bbnsm_rtc
Message-ID: <Z9mWA5ldMDqZcVf5@alb3rt0-ThinkPad-P15-Gen-1>
References: <20250306193014.490091-1-Frank.Li@nxp.com>
 <116096172.nniJfEyVGO@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <116096172.nniJfEyVGO@steina-w>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_084928_482984_9DC5187D 
X-CRM114-Status: GOOD (  18.54  )
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

On Fri, Mar 07, 2025 at 11:19:13AM +0100, Alexander Stein wrote:
> Hi,
> 
> Am Donnerstag, 6. März 2025, 20:30:14 CET schrieb Frank Li:
> > From: Joy Zou <joy.zou@nxp.com>
> > 
> > Add rtc0 alias to set bbnsm_rtc as the default rtc.
> > 
> > Signed-off-by: Joy Zou <joy.zou@nxp.com>
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx93.dtsi | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/dts/freescale/imx93.dtsi
> > index 56766fdb0b1e5..7d9aa15ebf5d0 100644
> > --- a/arch/arm64/boot/dts/freescale/imx93.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
> > @@ -34,6 +34,7 @@ aliases {
> >  		mmc0 = &usdhc1;
> >  		mmc1 = &usdhc2;
> >  		mmc2 = &usdhc3;
> > +		rtc0 = &bbnsm_rtc;
> 
> IMHO this is a board property, not SoC property.
> 
> Best regards
> Alexander
> 
> >  		serial0 = &lpuart1;
> >  		serial1 = &lpuart2;
> >  		serial2 = &lpuart3;
> > 
> 
> 
> -- 
> TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht München, HRB 105018
> Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
> http://www.tq-group.com/
> 
> 
> 
I agree with Alexander, furthermore if we look to others dtsi we don't
create this relationship at soc level even if we have rtc there, is not?

for example:
arch/arm64/boot/dts/freescale/imx8mp.dtsi
arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi

Regards,
Alberto

