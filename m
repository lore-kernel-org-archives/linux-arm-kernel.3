Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80098C44500
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 08:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7aI+GPwAH0BUEU90sHG77IoEanYx72AgVA1ohd1zcDk=; b=CJ2pmdyHCOIAmqKZOdE4/6z7Jv
	FjjnZlHQtyX0LzqHdiTnSgrNZqRQ8CT5B0//eLqaC+srlAUNKhNuJZ0v5d89n9SlydIAFe7zs4JC+
	c8s6YVdc08bgx6lS5FMa4N9RJPzWB/tc7QdyzjL2xX1m7X/9Eaq6j5zdbJ0vkJ9Imd3VqDCWqTo7y
	mhFsrvMzuhergoaNxv1AoW/KrBqkZLLjg0oTShK/WLCSBsLTQR/kJkc1uzlAg9yw7ORvNfDUxu6s0
	SmKTxZCn9762OSNBh+g24CVhmvnZ7QxcQdwliB4lmknnMaYprhV7C1Og+jsbz+DOGhTKfG5OuwymU
	UEVz/p9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viTbB-000000056E0-0Hog;
	Wed, 21 Jan 2026 08:29:57 +0000
Received: from mail-dl1-x1229.google.com ([2607:f8b0:4864:20::1229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viTb9-000000056DP-0VTN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 08:29:56 +0000
Received: by mail-dl1-x1229.google.com with SMTP id a92af1059eb24-12336c0a8b6so13186017c88.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 00:29:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768984194; cv=none;
        d=google.com; s=arc-20240605;
        b=Q5G/JDs4oO2Db/yx+0eX3HV0GYVBiljbbG2IhQdXaeo2dJMKgBv5mXoCe4IjgtfAL5
         t2y2dyUt7xn/ySd0lQ2L6jLYbcKh4TOjSNz/3v3CAJUCTm2dcE0shppLH37C93yhkl+w
         fQf+IMoRjDXlJ3LbMEzMHJAdxlfls7CJF77ZBhNak7YWhLMvwcbRB6N1SN2M5+NdD/dY
         5xs6iAS5Z9ju088Iq6S83kX4vH2dzfWE6viI0M3dXuAAPBVLtVsEAl1qBBk011e8H7Mj
         cdeZaTKVHgFnCXE368F92TmSqDpbhj9AmXwg/6aTGHb1bUCCX3pjZy45lDksf8EdUz++
         SZeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7aI+GPwAH0BUEU90sHG77IoEanYx72AgVA1ohd1zcDk=;
        fh=+R90Y+6opL67QSVThUlUMqVNbnGAZtnycWMV943y7Z8=;
        b=DlIqcJ3eu6rUUFvrFXg1O4i3dXe81F4jE1MaPlHnhM4P1YFig3BbyWTfoPXE9AMkAe
         k2ywBVgZnMKems9Xiw3lSiwVKIWI4M7M/MDfB4mC6kltvbw9kPEgzewDZvN3RwbbieuE
         xr2yCbmL1aNzLzy38X3j4IP6Mr1OOhAwYcLHPaaLuKvWUTCay4P3PwGJTmF1SRULNbF8
         OGZvS4dwjLLC0n+0Pjk49kMIoieaNRA0k94EHEFIpVKzqf0/J5xj1e20D8e19o9ohzMe
         45MroHGA3rVkJ0iRZ+pc2bLpSgjDbiG9mveKVdK0rUiEhG026/2ukmFa+G5lLoQMaWxr
         fTLQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768984194; x=1769588994; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7aI+GPwAH0BUEU90sHG77IoEanYx72AgVA1ohd1zcDk=;
        b=g2nN1bTmsrIX0hGlW65DxV+sMQ6wBr6AAJ5xqGJDOj2kQwiFjNlZswY5dA4U+Y/YH2
         OMaLnck9+tZh/GgLLBYRZI/hoq7KhhdKtbFwH7xzfp7B+LO08FdHvMMEWqs+u8vvmPBZ
         4JbXSdKJXACID02zrWErwALmoEB9YxXmn7G944cAyMtcA3K1DUqJgrYIH4YvwTAA3NF6
         W41K+tyglmtmnOf2COtiqE4MzDte5YbQgZYQCVDVLBXJgxHEVZB2J2crXG6d7wRtyrIk
         RclZkjZnM4E4AcR7pkZwWEIcu1SeInkxyyCQMsms/t0SA8dzj1W9EjzJZM41bNj5OO7w
         6P5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768984194; x=1769588994;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7aI+GPwAH0BUEU90sHG77IoEanYx72AgVA1ohd1zcDk=;
        b=QGbUwbnS14YU/Wi78OQxCkQmLUYIQTMAcsG/kydNBqkw7We5nwWw8QHzvtAeJecTZl
         pi2bFgTIwCXk/OLQYI+9felhqqTR25EqekNCyZUwNSo1K8OFuhAEuNRbbPo/qJ3NgkL1
         +ZHyjJdCj5QIwHR+z1IEUkRoSShltsdAO615Rtw5dWR7wpMCI6VG/pvrMEdwMboL1rA6
         UeKoH1QmUD4HULpeHwSNPBJW9qSaNNNfHLyofBB7y9t7wT/TTnulY0CRzytMJd+crRMn
         8Yjc8gfOAS2rZm0UXXx6biQLBt0ElOdtQ1tZ8Ph4YEVKcJ0CnTkXUnWLmg9v1xLWceYO
         k6CQ==
X-Forwarded-Encrypted: i=1; AJvYcCUozAEXkt6TUQJ5WhmLJekiTgsF+sb5B3xQsXz8i1N0/ODaug6SihnTu6mCUG1lUFojOPuKHhLnhGnWVF/KI3ck@lists.infradead.org
X-Gm-Message-State: AOJu0Yxilp8sw8Fs7CmiWiZ3O5Mvkx5bItMZams+xpvpcmxhreE2OE+0
	/G43BXVw1x3e20R9uIXsxnNyBpjeS2//DIXdNW+iiqR7z+GneNBFKJKkaW+kJxFynqDbbjktrIR
	qe9/q8C8yc4r6iHMQECBnOaGja2BgTpk=
X-Gm-Gg: AZuq6aLER9XLaOxRZTNAmLC60N5GHNSIbkiSaFuNhMWTXkI5x1A8jtNx5HvYdN7U1xe
	p8QFBKuB1kX3CKGJNKQGhjS5fQ+cqt1ccsZ2pHxf0s99FtEdNi9HkZ2e+hOk3MFbjLnAterqIN9
	zRWLX1OsCHtCKh9GygdhRaJKYKtZiZNOUdRoPzi5lRuCXjfmybXUQHKkXL1A+kT1FLw/n72R+pY
	pdS906d2nAsQ6BK6iRqKY1hSSYGvroIgDay+PwvzA6EEknPKohPWbyT9yFx2Nqwt1TDZDgka8A2
	WxtRcpVuCwLbsSJ4Z3469iJEuDYsmXVPNIXjUwg4iHQpnLMYpFGTYdfVzVx3SBBBaUDIXzz4ZYz
	irOfkMEsZSWtcb3jvNDY5
X-Received: by 2002:a05:7022:4399:b0:123:348d:8576 with SMTP id
 a92af1059eb24-1244a6fb15amr13122314c88.6.1768984193944; Wed, 21 Jan 2026
 00:29:53 -0800 (PST)
MIME-Version: 1.0
References: <20260120102604.1989725-1-sherry.sun@nxp.com> <20260120102604.1989725-2-sherry.sun@nxp.com>
 <aW+ullwMtDq0RpNt@lizhi-Precision-Tower-5810> <VI0PR04MB121146CD3EDDE9C4771B83A939296A@VI0PR04MB12114.eurprd04.prod.outlook.com>
In-Reply-To: <VI0PR04MB121146CD3EDDE9C4771B83A939296A@VI0PR04MB12114.eurprd04.prod.outlook.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 21 Jan 2026 10:32:33 +0200
X-Gm-Features: AZwV_QiY0sD13-nX9UTIpSYPXU-DrhdabVw0h6HRC3hxGCNgeBaTfACxmKoz6Dw
Message-ID: <CAEnQRZAfRLL1c19WHbQjJfgZfQLQx6CaBYx7KW9wSmVzVa6Q+A@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: Add i.MX93W EVK board
To: Sherry Sun <sherry.sun@nxp.com>
Cc: Frank Li <frank.li@nxp.com>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"shawnguo@kernel.org" <shawnguo@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>, 
	"dario.binacchi@amarulasolutions.com" <dario.binacchi@amarulasolutions.com>, 
	"alexander.stein@ew.tq-group.com" <alexander.stein@ew.tq-group.com>, 
	"Markus.Niebel@tq-group.com" <Markus.Niebel@tq-group.com>, 
	"matthias.schiffer@tq-group.com" <matthias.schiffer@tq-group.com>, "y.moog@phytec.de" <y.moog@phytec.de>, 
	"josua@solid-run.com" <josua@solid-run.com>, Francesco Dolcini <francesco.dolcini@toradex.com>, 
	"primoz.fiser@norik.com" <primoz.fiser@norik.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, 
	"festevam@gmail.com" <festevam@gmail.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_002955_162157_463906DE 
X-CRM114-Status: GOOD (  17.12  )
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

On Wed, Jan 21, 2026 at 5:25=E2=80=AFAM Sherry Sun <sherry.sun@nxp.com> wro=
te:
>
>
>
> > Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: Add i.MX93W EVK board
> >
> > On Tue, Jan 20, 2026 at 06:26:03PM +0800, Sherry Sun wrote:
> > > Add DT compatible string for NXP i.MX93W EVK board.
> > >
> > > Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> > > ---
> > >  Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml
> > b/Documentation/devicetree/bindings/arm/fsl.yaml
> > > index 93ad6f0027d0..1769f243d70f 100644
> > > --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> > > +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> > > @@ -1432,6 +1432,7 @@ properties:
> > >                - fsl,imx93-11x11-evk       # i.MX93 11x11 EVK Board
> > >                - fsl,imx93-11x11-frdm      # i.MX93 11x11 FRDM Board
> > >                - fsl,imx93-14x14-evk       # i.MX93 14x14 EVK Board
> > > +              - fsl,imx93w-evk            # i.MX93W EVK Board
> >
> > Is 93w 11x11 or 14x14? can you add suffix to keep align existing one.
> >
>
> Hi Frank,
>
> IMX93W-EVK is the official board name, it basically reuse the  i.MX93 11x=
11
> EVK board, as described in the cover letter and dts patch. I prefer to st=
ill use
> this name (imx93w-evk) to keep align with the board official name.


No matter of what name we decide to use in the end please add this clarific=
ation
in the commit message.

Also please add small comment describing what are the major
differences between imx93w and
imx93 11x11 board.

thanks,
Daniel.

