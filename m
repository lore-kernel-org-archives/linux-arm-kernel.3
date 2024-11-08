Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C398D4335C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 02:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eR7AyViXmeWGMVONEZ/pRYURocoexzHBT2dgSZdiLJc=; b=qK1TDpGk/6B7XgDQugGEFnCYPX
	/MIY/vdUV3KSn+iITFBrC+op2ueMe8StHSitYEAJBgNB4RHBlDyqAwaudpNSCLEZrF/1i+NtdrRA/
	25vNVxhsBpisk3a/iAp32efsSmtuLOcnlLEGtrSy1v902a278T3JA4LLpjZL95zGFzzfXbjjbzHCD
	oCmbJWJtQ/qIgltxT67u3gob/o6l1u9ZC5wdeezhlFpjVZCs7jHEMX3c2bYkY1hMND0O2HxxmOiLv
	8fXU5TCY5ShSe8+RdKWpDr3MrmDGyXB1zLv1QxBDR+Nt4Ta7AWQZ1mXu4P+jENNF+trAqgSrrP/Fk
	xyoGoc8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Eg5-0000000910g-3ZAq;
	Fri, 08 Nov 2024 02:24:49 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9EeL-000000090u3-3iRs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 02:23:03 +0000
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-3a5e0bfc7fdso6271935ab.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Nov 2024 18:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731032580; x=1731637380; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eR7AyViXmeWGMVONEZ/pRYURocoexzHBT2dgSZdiLJc=;
        b=mQpzj52cFS1ikGVYOi3/M5zgUDDdjT5C8UPDs1pYoW0RzwBANmKhZIuqo3GdbayfAN
         nZqcxowsn8fV4BkUZkV09fqUWHTg5PpD/drNUtVAcsdytc48VSstRbZPZAvopIkgG9V6
         D7Qh3ocTx5grfwrZ2SCWthEoQ8WNKM6jrKAS1TA0ZrFMo0kEa5whXmGiUXlgrW4Bv24S
         b7ncsOTi2fOEPeNGctS/sGPNgT7t4Y284/lZnHlMpXvMOP+ggyKW/LE4D5C4ztVYO2JP
         hfPvYkuWQzSroHjKG4UzIyZXYKgcYDiffjGj1GOptJf1tJXqmha20yRAXYVDY68Vmtrj
         8zBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731032580; x=1731637380;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eR7AyViXmeWGMVONEZ/pRYURocoexzHBT2dgSZdiLJc=;
        b=IrvMjD3tvGSDFj3Yy+Njk2A55FxLeCyuEvrUn7ejgDbLs/shE2For30mFtYO9xwrVa
         WE0ik5Q2RowyMxK+TTfRY1ihPMu95xCDFYquU0lu/UbyiLtetVjXrWibhqK4r3UBITmh
         zhW2oR8PyJO1uZ4Und8sLpGQ72jUwljbmvYE73ag7eagOgLjC2+Mld2MqgUp9JLGyphh
         S2zDIhVFIf+gll0+y7MuAWmqL1HNuuX/EEN68IIPQERySrFuY84BMn1J/IG4GeZ7X04s
         d9PVJwNNszF1K6l5vpX0re+HdnzH6vz2dnsVlT7/Q/cgy0nEMUrVnzJ1KVpFS9FYrmW2
         2OUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYKiFfBVwur6uW2vVEeNIv7PxBIrZo/ccHwhv2TNSPusiK0F+uaHfRAbpizLdFo0dK3sedgZvsaFMz3gpRGted@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/I3+ywbCD/v9gnkpKevynJm+/g2hv16ZnAVQ+v7KzvUEBRmjt
	IyjG2Dokt1GO3m8UgIM58T3TNv8442mhiYwGKZYAHUcHWMF+Acvaej7gsSpLUmFPBbD8H1QxGhO
	opO8apinRNO2tynHrtiaQltBu5ck=
X-Google-Smtp-Source: AGHT+IGQ7gpv66XfauvZZ5t0zmt5b2BZyWV862s4RrmNacvxmqQJFFeOQYZ68mwOrld/NXiqMMkWEyD3aFFzolHNfM0=
X-Received: by 2002:a05:6e02:1350:b0:3a6:da79:12bc with SMTP id
 e9e14a558f8ab-3a6f199ff96mr15159245ab.7.1731032579956; Thu, 07 Nov 2024
 18:22:59 -0800 (PST)
MIME-Version: 1.0
References: <20241107102008.3626023-1-shengjiu.wang@nxp.com>
 <20241107102008.3626023-4-shengjiu.wang@nxp.com> <Zyzod4k+LNkpJdMA@lizhi-Precision-Tower-5810>
In-Reply-To: <Zyzod4k+LNkpJdMA@lizhi-Precision-Tower-5810>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 8 Nov 2024 10:22:44 +0800
Message-ID: <CAA+D8ANhznTNCt5RqaF17GMYHqYdggMpR_LOWuP4GX5ECApHzw@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: imx93: Use IMX93_CLK_SPDIF_IPG as SPDIF
 IPG clock
To: Frank Li <Frank.li@nxp.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, abelvesa@kernel.org, peng.fan@nxp.com, 
	mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	imx@lists.linux.dev, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_182301_948439_1B9DB8C6 
X-CRM114-Status: GOOD (  16.60  )
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

On Fri, Nov 8, 2024 at 12:19=E2=80=AFAM Frank Li <Frank.li@nxp.com> wrote:
>
> On Thu, Nov 07, 2024 at 06:20:08PM +0800, Shengjiu Wang wrote:
> > IMX93_CLK_BUS_WAKEUP is not accurate IPG clock, which missed
> > the clock gate. IMX93_CLK_SPDIF_IPG is the correct clock.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
>
> This should be fixup. Add fixes tags.

I will update them. Thanks.

Best regards
Shengjiu Wang

>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
> >  arch/arm64/boot/dts/freescale/imx93.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot=
/dts/freescale/imx93.dtsi
> > index 688488de8cd2..56766fdb0b1e 100644
> > --- a/arch/arm64/boot/dts/freescale/imx93.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
> > @@ -925,7 +925,7 @@ xcvr: xcvr@42680000 {
> >                               reg-names =3D "ram", "regs", "rxfifo", "t=
xfifo";
> >                               interrupts =3D <GIC_SPI 203 IRQ_TYPE_LEVE=
L_HIGH>,
> >                                            <GIC_SPI 204 IRQ_TYPE_LEVEL_=
HIGH>;
> > -                             clocks =3D <&clk IMX93_CLK_BUS_WAKEUP>,
> > +                             clocks =3D <&clk IMX93_CLK_SPDIF_IPG>,
> >                                        <&clk IMX93_CLK_SPDIF_GATE>,
> >                                        <&clk IMX93_CLK_DUMMY>,
> >                                        <&clk IMX93_CLK_AUD_XCVR_GATE>;
> > --
> > 2.34.1
> >

